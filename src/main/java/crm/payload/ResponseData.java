package crm.payload;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResponseData {
    private boolean isSuccess;
    private String description;
    private Object data;
}
