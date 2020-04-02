Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA3119BBDA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 08:43:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tD6N6TCMzDrN7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 17:43:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=03/iORX4; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tD4P4YzGzDrLZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 17:41:33 +1100 (AEDT)
Received: by mail-ed1-x541.google.com with SMTP id z65so2848359ede.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 23:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sjalcPYEU2mdRQRRSOn0OSogsw0DlU+ZafAv6h4gNKs=;
 b=03/iORX4uUOfApKFGn9Hi+pyTk5HHmHejNCfWOoL3OXtQYP38Y0WDKH+t4ZUbSWXZ8
 3i7gRteJbtCsGPtqKx+X0ba6rI6Zzk0DE71AMpyksdG8MrXmz6NWAowXe8yk+RTgft/L
 KemC4MFyUP/Vl+DlqgNSmgW+mKl11/nRgK+bTkE8kj+113mvR4n/vPozxKgZG578RPF1
 e12qUgLJK3OgOtC2XHLp0x/DzCZvomqK+9mGCVQOMi4WzBfW/UynZ3rphF4gchwxJuAa
 gb0d2/Mms8vrUnheRbaTGEp+do/If629DxTqBXbS8wyy7i8cRTt6EU9jCbBzIE94mjJ8
 /yaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sjalcPYEU2mdRQRRSOn0OSogsw0DlU+ZafAv6h4gNKs=;
 b=n2h3t6FG8ouVAhg4nB5Fuls/1wl4qcVQZA9BErkoAfsJg2toFbVb4ASl+Xr1ZINjUK
 QSD+3lRnRW7uJWO1JIapc0pv5a9Yu8CDF1SXVe/WMvLiSSf9RvT9rxlFtikqmV7qy4Q8
 7T7lf/EFIeTAH9u/j4iwOvDGYI5GfsUeiZt+O+iTJjsr8y5TyWeQR4q52OtxRGZAScR2
 vBgjriAi/D/tZyQtDwh7pXzjkZm16+R1YIgnrVPTW/ktd2yEuAt7LCR4h1iOzhooXpaE
 hZIqVecTIPFMRKGF5Jnud8lAuXi00jjqtsYcr2qg3GYw+srU+eU1TNB6DGGms0fBQfvL
 VpQg==
X-Gm-Message-State: AGi0PubDxxeyvwCittQzUQ0rvne52vhbwNEpIc8z1FnrDHgK9l9XqvPO
 /n02eyiED7LFg5utVJQCLJW8QQw8p3ZGmlX8GfXJ9g==
X-Google-Smtp-Source: APiQypIxNrNruY9aXVmd6gi+9sxdD2jQIqOjJfNU/SyO8Fh8Srjaw87z4FSieWaNTSJtBOyhL7CiuZrApQTpWV07A+w=
X-Received: by 2002:aa7:c609:: with SMTP id h9mr1349335edq.93.1585809689299;
 Wed, 01 Apr 2020 23:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <20200327071202.2159885-15-alastair@d-silva.org>
In-Reply-To: <20200327071202.2159885-15-alastair@d-silva.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 1 Apr 2020 23:41:17 -0700
Message-ID: <CAPcyv4j0V2dVD_C0zhd4Hy5kOPGDOPXVnPAD3JnQHQKu8FknPA@mail.gmail.com>
Subject: Re: [PATCH v4 14/25] nvdimm/ocxl: Add support for Admin commands
To: "Alastair D'Silva" <alastair@d-silva.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Rob Herring <robh@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Linux MM <linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 29, 2020 at 10:23 PM Alastair D'Silva <alastair@d-silva.org> wrote:
>
> Admin commands for these devices are the primary means of interacting
> with the device controller to provide functionality beyond the load/store
> capabilities offered via the NPU.
>
> For example, SMART data, firmware update, and device error logs are
> implemented via admin commands.
>
> This patch requests the metadata required to issue admin commands, as well
> as some helper functions to construct and check the completion of the
> commands.
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  drivers/nvdimm/ocxl/main.c              |  65 ++++++
>  drivers/nvdimm/ocxl/ocxlpmem.h          |  50 ++++-
>  drivers/nvdimm/ocxl/ocxlpmem_internal.c | 261 ++++++++++++++++++++++++
>  3 files changed, 375 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/nvdimm/ocxl/main.c b/drivers/nvdimm/ocxl/main.c
> index be76acd33d74..8db573036423 100644
> --- a/drivers/nvdimm/ocxl/main.c
> +++ b/drivers/nvdimm/ocxl/main.c
> @@ -217,6 +217,58 @@ static int register_lpc_mem(struct ocxlpmem *ocxlpmem)
>         return 0;
>  }
>
> +/**
> + * extract_command_metadata() - Extract command data from MMIO & save it for further use
> + * @ocxlpmem: the device metadata
> + * @offset: The base address of the command data structures (address of CREQO)
> + * @command_metadata: A pointer to the command metadata to populate
> + * Return: 0 on success, negative on failure
> + */
> +static int extract_command_metadata(struct ocxlpmem *ocxlpmem, u32 offset,
> +                                   struct command_metadata *command_metadata)

How about "struct ocxlpmem *ocp" throughout all these patches? The
full duplication of the type name as the local variable name makes
this look like non-idiomatic Linux code to me. It had not quite hit me
until I saw "struct command_metadata *command_metadata" that just
strikes me as too literal and the person that gets to maintain this
code later will appreciate a smaller amount of typing.

Also, is it really the case that the layout of the admin command
metadata needs to be programmatically determined at runtime? I would
expect it to be a static command definition in the spec.


> +{
> +       int rc;
> +       u64 tmp;
> +
> +       rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu, offset,
> +                                    OCXL_LITTLE_ENDIAN, &tmp);
> +       if (rc)
> +               return rc;
> +
> +       command_metadata->request_offset = tmp >> 32;
> +       command_metadata->response_offset = tmp & 0xFFFFFFFF;
> +
> +       rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu, offset + 8,
> +                                    OCXL_LITTLE_ENDIAN, &tmp);
> +       if (rc)
> +               return rc;
> +
> +       command_metadata->data_offset = tmp >> 32;
> +       command_metadata->data_size = tmp & 0xFFFFFFFF;
> +
> +       command_metadata->id = 0;
> +
> +       return 0;
> +}
> +
> +/**
> + * setup_command_metadata() - Set up the command metadata
> + * @ocxlpmem: the device metadata
> + */
> +static int setup_command_metadata(struct ocxlpmem *ocxlpmem)
> +{
> +       int rc;
> +
> +       mutex_init(&ocxlpmem->admin_command.lock);
> +
> +       rc = extract_command_metadata(ocxlpmem, GLOBAL_MMIO_ACMA_CREQO,
> +                                     &ocxlpmem->admin_command);
> +       if (rc)
> +               return rc;
> +
> +       return 0;
> +}
> +
>  /**
>   * allocate_minor() - Allocate a minor number to use for an OpenCAPI pmem device
>   * @ocxlpmem: the device metadata
> @@ -421,6 +473,14 @@ static int probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>
>         ocxlpmem->pdev = pci_dev_get(pdev);
>
> +       ocxlpmem->timeouts[ADMIN_COMMAND_ERRLOG] = 2000; // ms
> +       ocxlpmem->timeouts[ADMIN_COMMAND_HEARTBEAT] = 100; // ms
> +       ocxlpmem->timeouts[ADMIN_COMMAND_SMART] = 100; // ms
> +       ocxlpmem->timeouts[ADMIN_COMMAND_CONTROLLER_DUMP] = 1000; // ms
> +       ocxlpmem->timeouts[ADMIN_COMMAND_CONTROLLER_STATS] = 100; // ms
> +       ocxlpmem->timeouts[ADMIN_COMMAND_SHUTDOWN] = 1000; // ms
> +       ocxlpmem->timeouts[ADMIN_COMMAND_FW_UPDATE] = 16000; // ms
> +
>         pci_set_drvdata(pdev, ocxlpmem);
>
>         ocxlpmem->ocxl_fn = ocxl_function_open(pdev);
> @@ -467,6 +527,11 @@ static int probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>                 goto err;
>         }
>
> +       if (setup_command_metadata(ocxlpmem)) {
> +               dev_err(&pdev->dev, "Could not read command metadata\n");
> +               goto err;
> +       }
> +
>         elapsed = 0;
>         timeout = ocxlpmem->readiness_timeout +
>                   ocxlpmem->memory_available_timeout;
> diff --git a/drivers/nvdimm/ocxl/ocxlpmem.h b/drivers/nvdimm/ocxl/ocxlpmem.h
> index 3eadbe19f6d0..b72b3f909fc3 100644
> --- a/drivers/nvdimm/ocxl/ocxlpmem.h
> +++ b/drivers/nvdimm/ocxl/ocxlpmem.h
> @@ -7,6 +7,7 @@
>  #include <linux/mm.h>
>
>  #define LABEL_AREA_SIZE        BIT_ULL(PA_SECTION_SHIFT)
> +#define DEFAULT_TIMEOUT 100
>
>  #define GLOBAL_MMIO_CHI                0x000
>  #define GLOBAL_MMIO_CHIC       0x008
> @@ -57,6 +58,7 @@
>  #define GLOBAL_MMIO_HCI_CONTROLLER_DUMP_COLLECTED      BIT_ULL(5) // CDC
>  #define GLOBAL_MMIO_HCI_REQ_HEALTH_PERF                        BIT_ULL(6) // CHPD
>
> +// must be maintained with admin_command_names in ocxlpmem_internal.c
>  #define ADMIN_COMMAND_HEARTBEAT                0x00u
>  #define ADMIN_COMMAND_SHUTDOWN         0x01u
>  #define ADMIN_COMMAND_FW_UPDATE                0x02u
> @@ -68,6 +70,13 @@
>  #define ADMIN_COMMAND_CMD_CAPS         0x08u
>  #define ADMIN_COMMAND_MAX              0x08u
>
> +#define NS_COMMAND_SECURE_ERASE        0x20ull
> +
> +#define NS_RESPONSE_SECURE_ERASE_ACCESSIBLE_SUCCESS 0x20
> +#define NS_RESPONSE_SECURE_ERASE_ACCESSIBLE_ATTEMPTED 0x28
> +#define NS_RESPONSE_SECURE_ERASE_DEFECTIVE_SUCCESS 0x30
> +#define NS_RESPONSE_SECURE_ERASE_DEFECTIVE_ATTEMPTED 0x38
> +
>  #define STATUS_SUCCESS         0x00
>  #define STATUS_MEM_UNAVAILABLE 0x20
>  #define STATUS_BLOCKED_BG_TASK 0x21
> @@ -81,6 +90,16 @@
>  #define STATUS_FW_ARG_INVALID  STATUS_BAD_REQUEST_PARM
>  #define STATUS_FW_INVALID      STATUS_BAD_DATA_PARM
>
> +struct command_metadata {
> +       u32 request_offset;
> +       u32 response_offset;
> +       u32 data_offset;
> +       u32 data_size;
> +       struct mutex lock; /* locks access to this command */
> +       u16 id;
> +       u8 op_code;
> +};
> +
>  struct ocxlpmem {
>         struct device dev;
>         struct pci_dev *pdev;
> @@ -91,10 +110,11 @@ struct ocxlpmem {
>         struct ocxl_afu *ocxl_afu;
>         struct ocxl_context *ocxl_context;
>         void *metadata_addr;
> +       struct command_metadata admin_command;
>         struct resource pmem_res;
>         struct nd_region *nd_region;
>         char fw_version[8 + 1];
> -
> +       u32 timeouts[ADMIN_COMMAND_MAX + 1];
>         u32 max_controller_dump_size;
>         u16 scm_revision; // major/minor
>         u8 readiness_timeout;  /* The worst case time (in seconds) that the host
> @@ -123,3 +143,31 @@ struct ocxlpmem {
>   * Returns 0 on success, negative on error
>   */
>  int ocxlpmem_chi(const struct ocxlpmem *ocxlpmem, u64 *chi);
> +
> +/**
> + * admin_command_execute() - Execute an admin command and wait for completion
> + *
> + * Additional MMIO registers (dependent on the command) may
> + * need to be initialized
> + *
> + * @ocxlpmem: the device metadata
> + * @op_code: the code for the admin command
> + * Returns 0 on success, -EINVAL for a bad op code, -EBUSY on timeout
> + */
> +int admin_command_execute(struct ocxlpmem *ocxlpmem, u8 op_code);
> +
> +/**
> + * admin_response_handled() - Notify the controller that the admin response has been handled
> + * @ocxlpmem: the device metadata
> + * Returns 0 on success, negative on failure
> + */
> +int admin_response_handled(const struct ocxlpmem *ocxlpmem);
> +
> +/**
> + * warn_status() - Emit a kernel warning showing a command status.
> + * @ocxlpmem: the device metadata
> + * @message: A message to accompany the warning
> + * @status: The command status
> + */
> +void warn_status(const struct ocxlpmem *ocxlpmem, const char *message,
> +                u8 status);
> diff --git a/drivers/nvdimm/ocxl/ocxlpmem_internal.c b/drivers/nvdimm/ocxl/ocxlpmem_internal.c
> index 5578169b7515..7470a6ab3b08 100644
> --- a/drivers/nvdimm/ocxl/ocxlpmem_internal.c
> +++ b/drivers/nvdimm/ocxl/ocxlpmem_internal.c
> @@ -17,3 +17,264 @@ int ocxlpmem_chi(const struct ocxlpmem *ocxlpmem, u64 *chi)
>
>         return 0;
>  }
> +
> +#define COMMAND_REQUEST_SIZE (8 * sizeof(u64))
> +/**
> + * scm_command_request() - Set up a command request
> + * @cmd: The metadata for the type of command to be issued
> + * @op_code: the op code for the command
> + * @valid_bytes: the number of bytes in the header to preserve (these must be set before calling)
> + */
> +static int scm_command_request(const struct ocxlpmem *ocxlpmem,
> +                              struct command_metadata *cmd, u8 op_code,
> +                              u8 valid_bytes)

Ah, here's an abbreviation for command metadata.

> +{
> +       u64 val = op_code;
> +       int rc;
> +       u8 i;
> +
> +       cmd->op_code = op_code;
> +       cmd->id++;
> +
> +       val |= ((u64)cmd->id) << 16;
> +
> +       rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu, cmd->request_offset,
> +                                     OCXL_LITTLE_ENDIAN, val);
> +       if (rc)
> +               return rc;
> +
> +       for (i = valid_bytes; i < COMMAND_REQUEST_SIZE; i += sizeof(u64)) {
> +               rc = ocxl_global_mmio_write64(ocxlpmem->ocxl_afu,
> +                                             cmd->request_offset + i,
> +                                             OCXL_LITTLE_ENDIAN, 0);
> +               if (rc)
> +                       return rc;
> +       }
> +
> +       return 0;
> +}
> +
> +/**
> + * admin_command_request() - Issue an admin command request
> + * @ocxlpmem: the device metadata
> + * @op_code: The op-code for the command
> + *
> + * Returns an identifier for the command, or negative on error
> + */
> +static int admin_command_request(struct ocxlpmem *ocxlpmem, u8 op_code)
> +{
> +       u8 valid_bytes = sizeof(u64);
> +
> +       switch (op_code) {
> +       case ADMIN_COMMAND_HEARTBEAT:
> +       case ADMIN_COMMAND_SHUTDOWN:
> +       case ADMIN_COMMAND_ERRLOG:
> +       case ADMIN_COMMAND_CMD_CAPS:
> +               valid_bytes += 0;
> +               break;
> +       case ADMIN_COMMAND_FW_UPDATE:
> +       case ADMIN_COMMAND_SMART:
> +       case ADMIN_COMMAND_CONTROLLER_STATS:
> +       case ADMIN_COMMAND_CONTROLLER_DUMP:
> +               valid_bytes += sizeof(u64);
> +               break;
> +       case ADMIN_COMMAND_FW_DEBUG:
> +               valid_bytes += 3 * sizeof(u64);
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return scm_command_request(ocxlpmem, &ocxlpmem->admin_command, op_code,
> +                                  valid_bytes);

Why isn't this just:

    ocp_command_request(ocp, op_code, valid_bytes);

...because it's not clear to me why this switches from a generic name
like admin_command_request() and then switches to scm_. The
"command_metadata" is implied by the ocp context and the op_code,
right?


> +}
> +
> +static int command_response(const struct ocxlpmem *ocxlpmem,
> +                           const struct command_metadata *cmd)
> +{
> +       u64 val;
> +       u16 id;
> +       u8 status;
> +       int rc = ocxl_global_mmio_read64(ocxlpmem->ocxl_afu,
> +                                        cmd->response_offset,
> +                                        OCXL_LITTLE_ENDIAN, &val);
> +       if (rc)
> +               return rc;
> +
> +       status = val & 0xff;
> +       id = (val >> 16) & 0xffff;
> +
> +       if (id != cmd->id) {
> +               dev_err(&ocxlpmem->dev,
> +                       "Expected response for command %d, but received response for command %d instead.\n",
> +                       cmd->id, id);
> +               return -EBUSY;
> +       }
> +
> +       return status;
> +}
> +
> +/**
> + * admin_response() - Validate an admin response
> + * @ocxlpmem: the device metadata
> + * Returns the status code of the command, or negative on error
> + */
> +static int admin_response(const struct ocxlpmem *ocxlpmem)
> +{
> +       return command_response(ocxlpmem, &ocxlpmem->admin_command);
> +}
> +
> +/**
> + * admin_command_exec() - Notify the controller to start processing a pending admin command
> + * @ocxlpmem: the device metadata
> + * Returns 0 on success, negative on error
> + */
> +static int admin_command_exec(const struct ocxlpmem *ocxlpmem)
> +{
> +       return ocxl_global_mmio_set64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_HCI,
> +                                     OCXL_LITTLE_ENDIAN, GLOBAL_MMIO_HCI_ACRW);
> +}
> +
> +static bool admin_command_complete(const struct ocxlpmem *ocxlpmem)
> +{
> +       u64 val = 0;
> +
> +       int rc = ocxlpmem_chi(ocxlpmem, &val);
> +
> +       WARN_ON(rc);
> +
> +       return (val & GLOBAL_MMIO_CHI_ACRA) != 0;
> +}
> +
> +/**
> + * admin_command_complete_timeout() - Wait for an admin command to finish executing
> + * @ocxlpmem: the device metadata
> + * @command: the admin command to wait for completion (determines the timeout)
> + * Returns 0 on success, -EBUSY on timeout
> + */
> +static int admin_command_complete_timeout(const struct ocxlpmem *ocxlpmem,
> +                                         int command)
> +{
> +       unsigned long timeout = jiffies +
> +                               msecs_to_jiffies(ocxlpmem->timeouts[command]);
> +
> +       // 32 is the next power of 2 greater than the 20ms minimum for msleep
> +#define TIMEOUT_SLEEP_MILLIS 32
> +       do {
> +               if (admin_command_complete(ocxlpmem))
> +                       return 0;
> +               msleep(TIMEOUT_SLEEP_MILLIS);
> +       } while (time_before(jiffies, timeout));
> +
> +       if (admin_command_complete(ocxlpmem))
> +               return 0;
> +
> +       return -EBUSY;
> +}
> +
> +// Must be maintained with ADMIN_COMMAND_* in ocxlpmem.h
> +static const char * const admin_command_names[] = {
> +       "heartbeat",
> +       "shutdown",
> +       "firmware update",
> +       "firmware debug",
> +       "retrieve error log",
> +       "retrieve SMART data",
> +       "controller statistics",
> +       "controller dump",
> +       "command capabilities",
> +};
> +
> +/**
> + * admin_command_name() - get the name of an admin command
> + * @ocxlpmem: the device metadata
> + * @op_code: the code for the admin command
> + * Returns a string representing the name of the command
> + */
> +static const char *admin_command_name(u8 op_code)
> +{
> +       if (op_code > ADMIN_COMMAND_MAX)
> +               return "unknown command";
> +
> +       return admin_command_names[op_code];
> +}
> +
> +/**
> + * admin_command_execute() - Execute an admin command and wait for completion
> + *
> + * Additional MMIO registers (dependent on the command) may
> + * need to be initialized
> + *
> + * @ocxlpmem: the device metadata
> + * @op_code: the code for the admin command
> + * Returns 0 on success, -EINVAL for a bad op code, -EBUSY on timeout
> + */
> +int admin_command_execute(struct ocxlpmem *ocxlpmem, u8 op_code)
> +{
> +       int rc;
> +
> +       if (op_code > ADMIN_COMMAND_MAX)
> +               return -EINVAL;
> +
> +       rc = admin_command_request(ocxlpmem, op_code);
> +       if (rc)
> +               return rc;
> +
> +       rc = admin_command_exec(ocxlpmem);
> +       if (rc)
> +               return rc;
> +
> +       rc = admin_command_complete_timeout(ocxlpmem, op_code);
> +       if (rc < 0) {
> +               dev_warn(&ocxlpmem->dev, "%s timed out\n",
> +                        admin_command_name(op_code));
> +               return rc;
> +       }
> +
> +       return admin_response(ocxlpmem);
> +}
> +
> +int admin_response_handled(const struct ocxlpmem *ocxlpmem)
> +{
> +       // writing to the CHIC register clears the bit in CHI
> +       return ocxl_global_mmio_set64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_CHIC,
> +                                     OCXL_LITTLE_ENDIAN, GLOBAL_MMIO_CHI_ACRA);
> +}
> +
> +void warn_status(const struct ocxlpmem *ocxlpmem, const char *message,
> +                u8 status)
> +{
> +       const char *text = "Unknown";
> +
> +       switch (status) {
> +       case STATUS_SUCCESS:
> +               text = "Success";
> +               break;
> +
> +       case STATUS_MEM_UNAVAILABLE:
> +               text = "Persistent memory unavailable";
> +               break;
> +
> +       case STATUS_BAD_OPCODE:
> +               text = "Bad opcode";
> +               break;
> +
> +       case STATUS_BAD_REQUEST_PARM:
> +               text = "Bad request parameter";
> +               break;
> +
> +       case STATUS_BAD_DATA_PARM:
> +               text = "Bad data parameter";
> +               break;
> +
> +       case STATUS_DEBUG_BLOCKED:
> +               text = "Debug action blocked";
> +               break;
> +
> +       case STATUS_FAIL:
> +               text = "Failed";
> +               break;
> +       }
> +
> +       dev_warn(&ocxlpmem->dev, "%s: %s (%x)\n", message, text, status);
> +}
> --
> 2.24.1
>
