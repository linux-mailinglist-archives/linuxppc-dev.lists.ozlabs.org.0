Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCA819DCF3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 19:42:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v6gr5mmVzDrQx
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 04:42:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=IlaVHqR3; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v6dt5HtYzF0Rx
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 04:40:15 +1100 (AEDT)
Received: by mail-ed1-x543.google.com with SMTP id c7so2490667edl.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 10:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ye6ceM420BzpOIeELcF9mQzPHL3u0y04bwqcOKlHFm4=;
 b=IlaVHqR3Slu4zP5mcKcw8ZzPzIFC9HW3e/QU8dSLW5xtSUMHnLCo0k7G905zEGDpDi
 2IGu+XSKiGx7/+9H8V021YB84ir+h96vNelODCVTp4DTVGReUqkayu3wS7JdlRdQVxcX
 m8orS7+yk+AWWpwop4P6wvCULhB0CK5dqeSID95POyMPgR5V/1HEb47m88SNJnNyg8JU
 oeBVh6XRMT0cBQRDMSv42zbY/gBVRFmodR58FYOlXKqqSEoQAVKKuTbVuFXfeOHlaCqm
 fi/D1n087v3nqN1rmF1tozayJlGPexArcSw8UPt8EnQHt7Hb+BiLwhE3c7Yxf7ZRzfZ3
 vXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ye6ceM420BzpOIeELcF9mQzPHL3u0y04bwqcOKlHFm4=;
 b=qy5Pj9ujgz70KqTX1ZkGG8ffil0hEc76FCGDcYaoJZ6e+WHmuXESnOnGZs5IypF1Rc
 rRAFxI/Hd4w/9tXazDNO9sHebZ1xnPUsNR0RpWPzCVXwBTJu2V2AHjNNh5Jp9tOhYfll
 5A+IEFpwdK0NUndfV/FXREJOVDmBZtJ4NqRnl7VlBOkVa1/y9iLi2hmFMYDPPUYu0K3q
 k77rIJWoHR/R3p28QXn61sMh/PqcmK5FM9lN/cHFy8dqAk+Y+u794iBN7KSj6BPqq1I1
 YgQzXtWYTEJleWcUmRfASQllaO7jjZxTttCFJuPszJB0akr2WX1WTd0SLKKrYElhsIJh
 rG5Q==
X-Gm-Message-State: AGi0PuazsPRoA7V7PrEpad0daLicHI2c2XjkTV2fTWCSMX1hReJw3jY+
 8+76fqTW/U6KNDHzSumISor2vDyEg/kAlGfFFLb/dA==
X-Google-Smtp-Source: APiQypKe3Q1ji/qsJPflB4fu6UblU2CubG+GITJlc/skL6xUYsMBLTNtWxtp8cws8odtA+DRRYUnrrrbkT5V/z/4guY=
X-Received: by 2002:aa7:c609:: with SMTP id h9mr8622358edq.93.1585935613088;
 Fri, 03 Apr 2020 10:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200331143229.306718-1-vaibhav@linux.ibm.com>
 <20200331143229.306718-4-vaibhav@linux.ibm.com>
In-Reply-To: <20200331143229.306718-4-vaibhav@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 3 Apr 2020 10:40:02 -0700
Message-ID: <CAPcyv4h5h-PRgDNXRBYbBjcVEJv82QTQj3KjV=Mv9mBRJ=XFVA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] powerpc/papr_scm,uapi: Add support for handling
 PAPR DSM commands
To: Vaibhav Jain <vaibhav@linux.ibm.com>
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
Cc: Alastair D'Silva <alastair@au1.ibm.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Jeff Moyer <jmoyer@redhat.com>, Oliver O'Halloran <oohall@gmail.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Michael Ellerman <ellerman@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 31, 2020 at 7:33 AM Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
>
> Implement support for handling PAPR DSM commands in papr_scm
> module. We advertise support for ND_CMD_CALL for the dimm command mask
> and implement necessary scaffolding in the module to handle ND_CMD_CALL
> ioctl and DSM commands that we receive.

They aren't ACPI Device Specific Methods in the papr_scm case, right?
I'd call them what the papr_scm specification calls them and replace
"DSM" throughout.

> The layout of the DSM commands as we expect from libnvdimm/libndctl is
> described in newly introduced uapi header 'papr_scm_dsm.h' which
> defines a new 'struct nd_papr_scm_cmd_pkg' header. This header is used
> to communicate the DSM command via 'nd_pkg_papr_scm->nd_command' and
> size of payload that need to be sent/received for servicing the DSM.
>
> The PAPR DSM commands are assigned indexes started from 0x10000 to
> prevent them from overlapping ND_CMD_* values and also makes handling
> dimm commands in papr_scm_ndctl().

You don't necessarily need to have command number separation like
that. The function number spaces are unique per family.

> A new function cmd_to_func() is
> implemented that reads the args to papr_scm_ndctl() and performs
> sanity tests on them. In case of a DSM command being sent via
> ND_CMD_CALL a newly introduced function papr_scm_service_dsm() is
> called to handle the request.
>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>
> ---
> Changelog:
>
> v4..v5: Fixed a bug in new implementation of papr_scm_ndctl().
>
> v3..v4: Updated papr_scm_ndctl() to delegate DSM command handling to a
>         different function papr_scm_service_dsm(). [Aneesh]
>
> v2..v3: Updated the nd_papr_scm_cmd_pkg to use __xx types as its
>         exported to the userspace [Aneesh]
>
> v1..v2: New patch in the series.
> ---
>  arch/powerpc/include/uapi/asm/papr_scm_dsm.h | 161 +++++++++++++++++++
>  arch/powerpc/platforms/pseries/papr_scm.c    |  97 ++++++++++-
>  2 files changed, 252 insertions(+), 6 deletions(-)
>  create mode 100644 arch/powerpc/include/uapi/asm/papr_scm_dsm.h
>
> diff --git a/arch/powerpc/include/uapi/asm/papr_scm_dsm.h b/arch/powerpc/include/uapi/asm/papr_scm_dsm.h
> new file mode 100644
> index 000000000000..c039a49b41b4
> --- /dev/null
> +++ b/arch/powerpc/include/uapi/asm/papr_scm_dsm.h
> @@ -0,0 +1,161 @@
> +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
> +/*
> + * PAPR SCM Device specific methods and struct for libndctl and ndctl
> + *
> + * (C) Copyright IBM 2020
> + *
> + * Author: Vaibhav Jain <vaibhav at linux.ibm.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2, or (at your option)
> + * any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

These 2 paragraphs of redundant license text can be dropped. The SPDX
line is sufficient.

> + */
> +
> +#ifndef _UAPI_ASM_POWERPC_PAPR_SCM_DSM_H_
> +#define _UAPI_ASM_POWERPC_PAPR_SCM_DSM_H_
> +
> +#include <linux/types.h>
> +
> +#ifdef __KERNEL__
> +#include <linux/ndctl.h>
> +#else
> +#include <ndctl.h>
> +#endif
> +
> +/*
> + * DSM Envelope:
> + *
> + * The ioctl ND_CMD_CALL transfers data between user-space and kernel via
> + * 'envelopes' which consists of a header and user-defined payload sections.
> + * The header is described by 'struct nd_papr_scm_cmd_pkg' which expects a
> + * payload following it and offset of which relative to the struct is provided
> + * by 'nd_papr_scm_cmd_pkg.payload_offset'. *
> + *
> + *  +-------------+---------------------+---------------------------+
> + *  |   64-Bytes  |       8-Bytes       |       Max 184-Bytes       |
> + *  +-------------+---------------------+---------------------------+
> + *  |               nd_papr_scm_cmd_pkg |                           |
> + *  |-------------+                     |                           |
> + *  |  nd_cmd_pkg |                     |                           |
> + *  +-------------+---------------------+---------------------------+
> + *  | nd_family   |                    |                           |
> + *  | nd_size_out | cmd_status          |                          |
> + *  | nd_size_in  | payload_version     |      PAYLOAD             |
> + *  | nd_command  | payload_offset ----->                          |
> + *  | nd_fw_size  |                     |                          |
> + *  +-------------+---------------------+---------------------------+
> + *
> + * DSM Header:
> + *
> + * The header is defined as 'struct nd_papr_scm_cmd_pkg' which embeds a
> + * 'struct nd_cmd_pkg' instance. The DSM command is assigned to member
> + * 'nd_cmd_pkg.nd_command'. Apart from size information of the envelop which is

 s/envelop/envelope/

There's a difference between commands and functions in libnvdimm.
Commands are the top-level ioctl methods where ND_CMD_CALL is the
generic payload command and functions are communicated inside of that
wrapper. Otherwise if the command does not wrap other commands like
ND_CMD_{GET,SET}_CONFIG_DATA then the individual bus providers
translate them to the bus-local functionality. For example
ND_CMD_{GET,SET}_CONFIG_DATA correspond to either the _LSx ACPI
methods, or the Intel DSM label methods. The details of those
implementations are hidden from the caller, the caller just sees the
kernel's ND_CMD_{GET,SET}_CONFIG_DATA interface.

> + * contained in 'struct nd_cmd_pkg', the header also has members following
> + * members:
> + *
> + * 'cmd_status'                : (Out) Errors if any encountered while servicing DSM.
> + * 'payload_version'   : (In/Out) Version number associated with the payload.
> + * 'payload_offset'    : (In)Relative offset of payload from start of envelope.
> + *
> + * DSM Payload:
> + *
> + * The layout of the DSM Payload is defined by various structs shared between
> + * papr_scm and libndctl so that contents of payload can be interpreted. During
> + * servicing of a DSM the papr_scm module will read input args from the payload
> + * field by casting its contents to an appropriate struct pointer based on the
> + * DSM command. Similarly the output of servicing the DSM command will be copied
> + * to the payload field using the same struct.
> + *
> + * 'libnvdimm' enforces a hard limit of 256 bytes on the envelope size, which
> + * leaves around 184 bytes for the envelope payload (ignoring any padding that
> + * the compiler may silently introduce).
> + *
> + * Payload Version:
> + *
> + * A 'payload_version' field is present in DSM header that indicates a specific
> + * version of the structure present in DSM Payload for a given DSM command. This
> + * provides backward compatibility in case the DSM Payload structure evolves
> + * and different structures are supported by 'papr_scm' and 'libndctl'.
> + *
> + * When sending a DSM Payload to 'papr_scm', 'libndctl' should send the version
> + * of the payload struct it supports via 'payload_version' field. The 'papr_scm'
> + * module when servicing the DSM envelop checks the 'payload_version' and then

s/envelop/envelope/

> + * uses 'payload struct version' == MIN('payload_version field',
> + * 'max payload-struct-version supported by papr_scm') to service the DSM. After
> + * servicing the DSM, 'papr_scm' put the negotiated version of payload struct in
> + * returned 'payload_version' field.
> + *
> + * Libndctl on receiving the envelop back from papr_scm again checks the

s/envelop/envelope/

> + * 'payload_version' field and based on it use the appropriate version dsm
> + * struct to parse the results.
> + *
> + * Backward Compatibility:
> + *
> + * Above scheme of exchanging different versioned DSM struct between libndctl
> + * and papr_scm should provide backward compatibility until following two
> + * assumptions/conditions when defining new DSM structs hold:
> + *
> + * Let T(X) = { set of attributes in DSM struct 'T' versioned X }
> + *
> + * 1. T(X) is a proper subset of T(Y) if X > Y.
> + *    i.e Each new version of DSM struct should retain existing struct
> + *    attributes from previous version
> + *
> + * 2. If an entity (libndctl or papr_scm) supports a DSM struct T(X) then
> + *    it should also support T(1), T(2)...T(X - 1).
> + *    i.e When adding support for new version of a DSM struct, libndctl
> + *    and papr_scm should retain support of the existing DSM struct
> + *    version they support.
> + */
> +
> +/* Papr-scm-header + payload expected with ND_CMD_CALL ioctl from libnvdimm */
> +struct nd_papr_scm_cmd_pkg {
> +       struct nd_cmd_pkg hdr;          /* Package header containing sub-cmd */
> +       __s32 cmd_status;               /* Out: Sub-cmd status returned back */
> +       __u16 payload_offset;   /* In: offset from start of struct */
> +       __u16 payload_version;  /* In/Out: version of the payload */
> +       __u8 payload[];         /* In/Out: Sub-cmd data buffer */

Does this structure pack the same on all compilers?

> +};
> +
> +/*
> + * Sub commands for ND_CMD_CALL. To prevent overlap from ND_CMD_*, values for
> + * these enums start at 0x10000. These values are then returned from
> + * cmd_to_func() making it easy to implement the switch-case block in
> + * papr_scm_ndctl(). These commands are sent to the kernel via
> + * 'nd_papr_scm_cmd_pkg.hdr.nd_command'
> + */

With nd_family set to NVDIMM_FAMILY_PAPR_SCM the function number space
can overlap the function numbers from other families.

> +enum dsm_papr_scm {
> +       DSM_PAPR_SCM_MIN =  0x10000,
> +       DSM_PAPR_SCM_MAX,
> +};
> +
> +/* Helpers to evaluate the size of PAPR_SCM envelope */
> +/* Calculate the papr_scm-header size */
> +#define ND_PAPR_SCM_ENVELOPE_CONTENT_HDR_SIZE \
> +       (sizeof(struct nd_papr_scm_cmd_pkg) - sizeof(struct nd_cmd_pkg))
> +
> +/* Given a type calculate envelope-content size (papr_scm-header + payload) */
> +#define ND_PAPR_SCM_ENVELOPE_CONTENT_SIZE(_type_)      \
> +       (sizeof(_type_) + ND_PAPR_SCM_ENVELOPE_CONTENT_HDR_SIZE)
> +
> +/* Convert a libnvdimm nd_cmd_pkg to papr_scm specific pkg */
> +static struct nd_papr_scm_cmd_pkg *nd_to_papr_cmd_pkg(struct nd_cmd_pkg *cmd)
> +{
> +       return (struct nd_papr_scm_cmd_pkg *) cmd;
> +}
> +
> +/* Return the payload pointer for a given pcmd */
> +static void *papr_scm_pcmd_to_payload(struct nd_papr_scm_cmd_pkg *pcmd)
> +{
> +       if (pcmd->hdr.nd_size_in == 0 && pcmd->hdr.nd_size_out == 0)
> +               return NULL;
> +       else
> +               return (void *)((__u8 *) pcmd + pcmd->payload_offset);
> +}
> +#endif /* _UAPI_ASM_POWERPC_PAPR_SCM_DSM_H_ */
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index aaf2e4ab1f75..e8ce96d2249e 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -15,13 +15,15 @@
>
>  #include <asm/plpar_wrappers.h>
>  #include <asm/papr_scm.h>
> +#include <asm/papr_scm_dsm.h>
>
>  #define BIND_ANY_ADDR (~0ul)
>
>  #define PAPR_SCM_DIMM_CMD_MASK \
>         ((1ul << ND_CMD_GET_CONFIG_SIZE) | \
>          (1ul << ND_CMD_GET_CONFIG_DATA) | \
> -        (1ul << ND_CMD_SET_CONFIG_DATA))
> +        (1ul << ND_CMD_SET_CONFIG_DATA) | \
> +        (1ul << ND_CMD_CALL))
>
>  struct papr_scm_priv {
>         struct platform_device *pdev;
> @@ -283,15 +285,92 @@ static int papr_scm_meta_set(struct papr_scm_priv *p,
>         return 0;
>  }
>
> +/*
> + * Validate the inputs args to dimm-control function and return '0' if valid.
> + * This also does initial sanity validation to ND_CMD_CALL sub-command packages.
> + */
> +static int is_cmd_valid(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
> +                      unsigned int buf_len)
> +{
> +       unsigned long cmd_mask = PAPR_SCM_DIMM_CMD_MASK;
> +       struct nd_papr_scm_cmd_pkg *pkg = nd_to_papr_cmd_pkg(buf);
> +
> +       /* Only dimm-specific calls are supported atm */
> +       if (!nvdimm)
> +               return -EINVAL;
> +
> +       if (!test_bit(cmd, &cmd_mask)) {
> +               pr_debug("%s: Unsupported cmd=%u\n", __func__, cmd);

Please convert all the pr_debug() statements in this file to
dev_dbg(). Also you don't need to put the __func__ in the print
statement because you can enable that via dynamic_debug_control see
the "f" flag in addition to the "p" flag for dynamic debug enabling.

> +               return -EINVAL;
> +       } else if (cmd == ND_CMD_CALL) {
> +
> +               /* Verify the envelop package */

s/envelop/envelope/

> +               if (!buf || buf_len < sizeof(struct nd_papr_scm_cmd_pkg)) {
> +                       pr_debug("%s: Invalid pkg size=%u\n", __func__,
> +                                buf_len);
> +                       return -EINVAL;
> +               }
> +
> +               /* Verify that the DSM command family is valid */
> +               if (pkg->hdr.nd_family != NVDIMM_FAMILY_PAPR_SCM) {
> +                       pr_debug("%s: Invalid pkg family=0x%llx\n", __func__,
> +                                pkg->hdr.nd_family);
> +                       return -EINVAL;
> +
> +               }
> +
> +               /* We except a payload with all DSM commands */
> +               if (papr_scm_pcmd_to_payload(pkg) == NULL) {
> +                       pr_debug("%s: Empty payload for sub-command=0x%llx\n",
> +                                __func__, pkg->hdr.nd_command);
> +                       return -EINVAL;
> +               }
> +       }
> +
> +       /* Command looks valid */
> +       return 0;
> +}
> +
> +static int papr_scm_service_dsm(struct papr_scm_priv *p,
> +                               struct nd_papr_scm_cmd_pkg *call_pkg)
> +{
> +       /* unknown subcommands return error in packages */
> +       if (call_pkg->hdr.nd_command <= DSM_PAPR_SCM_MIN ||
> +           call_pkg->hdr.nd_command >= DSM_PAPR_SCM_MAX) {
> +               pr_debug("Invalid DSM command 0x%llx\n",
> +                        call_pkg->hdr.nd_command);
> +               call_pkg->cmd_status = -EINVAL;
> +               return 0;
> +       }
> +
> +       /* Depending on the DSM command call appropriate service routine */
> +       switch (call_pkg->hdr.nd_command) {
> +       default:
> +               pr_debug("Unsupported DSM command 0x%llx\n",
> +                        call_pkg->hdr.nd_command);
> +               call_pkg->cmd_status = -ENOENT;
> +               return 0;
> +       }
> +}
> +
>  int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc, struct nvdimm *nvdimm,
>                 unsigned int cmd, void *buf, unsigned int buf_len, int *cmd_rc)
>  {
>         struct nd_cmd_get_config_size *get_size_hdr;
>         struct papr_scm_priv *p;
> +       struct nd_papr_scm_cmd_pkg *call_pkg = NULL;
> +       int rc;
>
> -       /* Only dimm-specific calls are supported atm */
> -       if (!nvdimm)
> -               return -EINVAL;
> +       /* Use a local variable in case cmd_rc pointer is NULL */
> +       if (cmd_rc == NULL)
> +               cmd_rc = &rc;
> +
> +       *cmd_rc = is_cmd_valid(nvdimm, cmd, buf, buf_len);
> +       if (*cmd_rc) {
> +               pr_debug("%s: Invalid cmd=0x%x. Err=%d\n", __func__,
> +                        cmd, *cmd_rc);
> +               return *cmd_rc;
> +       }
>
>         p = nvdimm_provider_data(nvdimm);
>
> @@ -313,13 +392,19 @@ int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc, struct nvdimm *nvdimm,
>                 *cmd_rc = papr_scm_meta_set(p, buf);
>                 break;
>
> +       case ND_CMD_CALL:
> +               call_pkg = nd_to_papr_cmd_pkg(buf);
> +               *cmd_rc = papr_scm_service_dsm(p, call_pkg);
> +               break;
> +
>         default:
> -               return -EINVAL;
> +               dev_dbg(&p->pdev->dev, "Unknown command = %d\n", cmd);
> +               *cmd_rc = -EINVAL;
>         }
>
>         dev_dbg(&p->pdev->dev, "returned with cmd_rc = %d\n", *cmd_rc);
>
> -       return 0;
> +       return *cmd_rc;
>  }
>
>  static inline int papr_scm_node(int node)
> --
> 2.25.1
>
