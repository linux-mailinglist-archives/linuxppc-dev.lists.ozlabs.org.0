Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A531F0148
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 23:00:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dw5Z6JJTzDr3M
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 07:00:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=1m9tVrKg; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dw3Y1QkdzDr0B
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 06:58:26 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id q19so11553236eja.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Jun 2020 13:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OPYZUsmfs5WnYVAoarP7tUTNo178WBFL9fmTCxqHlqA=;
 b=1m9tVrKgFOQH0n+QV774EN3QzFsS+biar5tfE+nouk9GHTa5PqALhFNT0qGElzorC+
 IQumukFgQtZGu7xGsJQo7qOOD9mD49PNvz+78x+R8B9no4uSwBZrOBaEGtGBbRlWlhB2
 GZvsOpnRvO0+TuWVLCSx7JlTgi1eD39IXbtbaXXD6BxXaFlu2lVNdh65N2nmCLDwK032
 gdfKONroT7kRHjRx4G3UyUMSg7Fd4uWXxIcKTmY94sKEmRomeEkr04fU9hzQjjo8kTP7
 wkHhzNAZF3gCWn6lSSzaUf5/3dpAIoctDtIu7QLRvmvLmAmAPf6vUyRCFu5/u5nVRTG+
 u8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OPYZUsmfs5WnYVAoarP7tUTNo178WBFL9fmTCxqHlqA=;
 b=aP6RY0OJucpTLDr7pSiiABkrUx5aL0a3cIqK8UAVJA/WO1kOPTK5YBSGF4ANw8h1M4
 4pPjIs5xKSKes+INzULfZZohSM7FTzgFaEVOir95QkhmpnmX9NycQwGdL9+/0MS5B8Cy
 HUDDpSVD4M5j7tlDiiRNObqa8+V99GvAM3ARYYEhfhCj1ZfPU5/Fdp9z0GH5IWUTBY0j
 dC5R+FiPbc+/nKGag+70K1+ZqCeTofQtb/nFiDDBA4+hVDUroL8XO7v2XE8eluvjbr/m
 pmMRDK+zPPQGUFAHJHlB9e6A2bxCvLXPnGk5Y9Rei0CMcyX6cMzFiSMDhY4AVit8aA+4
 r9eQ==
X-Gm-Message-State: AOAM533oWQRCkTCEMw2wSZC/nsgHcjY1k/QLtyG9NBDTLMfapCEXIk+6
 t/BQeCClDeRL6+VGnisvBEY6oF8bnA83kanJbRTBmA==
X-Google-Smtp-Source: ABdhPJwQi1bsDHTaOnEfwgMwtaqFzHJKwF+WhBVZTA+yK7fOLfzcbO0JtooEAZV0rjgA7lOTEeI3ZzzsvUCAPu8qHTA=
X-Received: by 2002:a17:906:39a:: with SMTP id
 b26mr10957880eja.204.1591390703321; 
 Fri, 05 Jun 2020 13:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200604234136.253703-1-vaibhav@linux.ibm.com>
 <20200604234136.253703-6-vaibhav@linux.ibm.com>
 <20200605194952.GS1505637@iweiny-DESK2.sc.intel.com>
In-Reply-To: <20200605194952.GS1505637@iweiny-DESK2.sc.intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 5 Jun 2020 13:58:11 -0700
Message-ID: <CAPcyv4h9+7FfnDxJk+zt2fDaMG9HR0XD=oSP0X6E8SPsNb3MSQ@mail.gmail.com>
Subject: Re: [PATCH v10 5/6] ndctl/papr_scm, uapi: Add support for PAPR nvdimm
 specific methods
To: Ira Weiny <ira.weiny@intel.com>
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 5, 2020 at 12:50 PM Ira Weiny <ira.weiny@intel.com> wrote:
>
> On Fri, Jun 05, 2020 at 05:11:35AM +0530, Vaibhav Jain wrote:
> > Introduce support for PAPR NVDIMM Specific Methods (PDSM) in papr_scm
> > module and add the command family NVDIMM_FAMILY_PAPR to the white list
> > of NVDIMM command sets. Also advertise support for ND_CMD_CALL for the
> > nvdimm command mask and implement necessary scaffolding in the module
> > to handle ND_CMD_CALL ioctl and PDSM requests that we receive.
> >
> > The layout of the PDSM request as we expect from libnvdimm/libndctl is
> > described in newly introduced uapi header 'papr_pdsm.h' which
> > defines a new 'struct nd_pdsm_cmd_pkg' header. This header is used
> > to communicate the PDSM request via member
> > 'nd_cmd_pkg.nd_command' and size of payload that need to be
> > sent/received for servicing the PDSM.
> >
> > A new function is_cmd_valid() is implemented that reads the args to
> > papr_scm_ndctl() and performs sanity tests on them. A new function
> > papr_scm_service_pdsm() is introduced and is called from
> > papr_scm_ndctl() in case of a PDSM request is received via ND_CMD_CALL
> > command from libnvdimm.
> >
> > Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Ira Weiny <ira.weiny@intel.com>
> > Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> > ---
> > Changelog:
> >
> > v9..v10:
> > * Simplified 'struct nd_pdsm_cmd_pkg' by removing the
> >   'payload_version' field.
> > * Removed the corrosponding documentation on versioning and backward
> >   compatibility from 'papr_pdsm.h'
> > * Reduced the size of reserved fields to 4-bytes making 'struct
> >   nd_pdsm_cmd_pkg' 64 + 8 bytes long.
> > * Updated is_cmd_valid() to enforce validation checks on pdsm
> >   commands. [ Dan Williams ]
> > * Added check for reserved fields being set to '0' in is_cmd_valid()
> >   [ Ira ]
> > * Moved changes for checking cmd_rc == NULL and logging improvements
> >   to a separate prelim patch [ Ira ].
> > * Moved  pdsm package validation checks from papr_scm_service_pdsm()
> >   to is_cmd_valid().
> > * Marked papr_scm_service_pdsm() return type as 'void' since errors
> >   are reported in nd_pdsm_cmd_pkg.cmd_status field.
> >
> > Resend:
> > * Added ack from Aneesh.
> >
> > v8..v9:
> > * Reduced the usage of term SCM replacing it with appropriate
> >   replacement [ Dan Williams, Aneesh ]
> > * Renamed 'papr_scm_pdsm.h' to 'papr_pdsm.h'
> > * s/PAPR_SCM_PDSM_*/PAPR_PDSM_*/g
> > * s/NVDIMM_FAMILY_PAPR_SCM/NVDIMM_FAMILY_PAPR/g
> > * Minor updates to 'papr_psdm.h' to replace usage of term 'SCM'.
> > * Minor update to patch description.
> >
> > v7..v8:
> > * Removed the 'payload_offset' field from 'struct
> >   nd_pdsm_cmd_pkg'. Instead command payload is always assumed to start
> >   at 'nd_pdsm_cmd_pkg.payload'. [ Aneesh ]
> > * To enable introducing new fields to 'struct nd_pdsm_cmd_pkg',
> >   'reserved' field of 10-bytes is introduced. [ Aneesh ]
> > * Fixed a typo in "Backward Compatibility" section of papr_scm_pdsm.h
> >   [ Ira ]
> >
> > Resend:
> > * None
> >
> > v6..v7 :
> > * Removed the re-definitions of __packed macro from papr_scm_pdsm.h
> >   [Mpe].
> > * Removed the usage of __KERNEL__ macros in papr_scm_pdsm.h [Mpe].
> > * Removed macros that were unused in papr_scm.c from papr_scm_pdsm.h
> >   [Mpe].
> > * Made functions defined in papr_scm_pdsm.h as static inline. [Mpe]
> >
> > v5..v6 :
> > * Changed the usage of the term DSM to PDSM to distinguish it from the
> >   ACPI term [ Dan Williams ]
> > * Renamed papr_scm_dsm.h to papr_scm_pdsm.h and updated various struct
> >   to reflect the new terminology.
> > * Updated the patch description and title to reflect the new terminology.
> > * Squashed patch to introduce new command family in 'ndctl.h' with
> >   this patch [ Dan Williams ]
> > * Updated the papr_scm_pdsm method starting index from 0x10000 to 0x0
> >   [ Dan Williams ]
> > * Removed redundant license text from the papr_scm_psdm.h file.
> >   [ Dan Williams ]
> > * s/envelop/envelope/ at various places [ Dan Williams ]
> > * Added '__packed' attribute to command package header to gaurd
> >   against different compiler adding paddings between the fields.
> >   [ Dan Williams]
> > * Converted various pr_debug to dev_debug [ Dan Williams ]
> >
> > v4..v5 :
> > * None
> >
> > v3..v4 :
> > * None
> >
> > v2..v3 :
> > * Updated the patch prefix to 'ndctl/uapi' [Aneesh]
> >
> > v1..v2 :
> > * None
> > ---
> >  arch/powerpc/include/uapi/asm/papr_pdsm.h |  98 +++++++++++++++++++
> >  arch/powerpc/platforms/pseries/papr_scm.c | 113 +++++++++++++++++++++-
> >  include/uapi/linux/ndctl.h                |   1 +
> >  3 files changed, 207 insertions(+), 5 deletions(-)
> >  create mode 100644 arch/powerpc/include/uapi/asm/papr_pdsm.h
> >
> > diff --git a/arch/powerpc/include/uapi/asm/papr_pdsm.h b/arch/powerpc/include/uapi/asm/papr_pdsm.h
> > new file mode 100644
> > index 000000000000..8b1a4f8fa316
> > --- /dev/null
> > +++ b/arch/powerpc/include/uapi/asm/papr_pdsm.h
> > @@ -0,0 +1,98 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
> > +/*
> > + * PAPR nvDimm Specific Methods (PDSM) and structs for libndctl
> > + *
> > + * (C) Copyright IBM 2020
> > + *
> > + * Author: Vaibhav Jain <vaibhav at linux.ibm.com>
> > + */
> > +
> > +#ifndef _UAPI_ASM_POWERPC_PAPR_PDSM_H_
> > +#define _UAPI_ASM_POWERPC_PAPR_PDSM_H_
> > +
> > +#include <linux/types.h>
> > +
> > +/*
> > + * PDSM Envelope:
> > + *
> > + * The ioctl ND_CMD_CALL transfers data between user-space and kernel via
> > + * envelope which consists of a header and user-defined payload sections.
> > + * The header is described by 'struct nd_pdsm_cmd_pkg' which expects a
> > + * payload following it and accessible via 'nd_pdsm_cmd_pkg.payload' field.
> > + * There is reserved field that can used to introduce new fields to the
> > + * structure in future. It also tries to ensure that 'nd_pdsm_cmd_pkg.payload'
> > + * lies at a 8-byte boundary.
> > + *
> > + *  +-------------+---------------------+---------------------------+
> > + *  |   64-Bytes  |       8-Bytes       |       Max 184-Bytes       |
> > + *  +-------------+---------------------+---------------------------+
> > + *  |               nd_pdsm_cmd_pkg     |                           |
> > + *  |-------------+                     |                           |
> > + *  |  nd_cmd_pkg |                     |                           |
> > + *  +-------------+---------------------+---------------------------+
> > + *  | nd_family   |                     |                           |
> > + *  | nd_size_out | cmd_status          |                           |
> > + *  | nd_size_in  | reserved            |     payload               |
> > + *  | nd_command  |                     |                           |
> > + *  | nd_fw_size  |                     |                           |
> > + *  +-------------+---------------------+---------------------------+
> > + *
> > + * PDSM Header:
> > + *
> > + * The header is defined as 'struct nd_pdsm_cmd_pkg' which embeds a
> > + * 'struct nd_cmd_pkg' instance. The PDSM command is assigned to member
> > + * 'nd_cmd_pkg.nd_command'. Apart from size information of the envelope which is
> > + * contained in 'struct nd_cmd_pkg', the header also has members following
> > + * members:
> > + *
> > + * 'cmd_status'              : (Out) Errors if any encountered while servicing PDSM.
> > + * 'reserved'                : Not used, reserved for future and should be set to 0.
> > + *
> > + * PDSM Payload:
> > + *
> > + * The layout of the PDSM Payload is defined by various structs shared between
> > + * papr_scm and libndctl so that contents of payload can be interpreted. During
> > + * servicing of a PDSM the papr_scm module will read input args from the payload
> > + * field by casting its contents to an appropriate struct pointer based on the
> > + * PDSM command. Similarly the output of servicing the PDSM command will be
> > + * copied to the payload field using the same struct.
> > + *
> > + * 'libnvdimm' enforces a hard limit of 256 bytes on the envelope size, which
> > + * leaves around 184 bytes for the envelope payload (ignoring any padding that
> > + * the compiler may silently introduce).
> > + *
> > + */
> > +
> > +/* PDSM-header + payload expected with ND_CMD_CALL ioctl from libnvdimm */
> > +struct nd_pdsm_cmd_pkg {
> > +     struct nd_cmd_pkg hdr;  /* Package header containing sub-cmd */
> > +     __s32 cmd_status;       /* Out: Sub-cmd status returned back */
> > +     __u16 reserved[2];      /* Ignored and to be used in future */
> > +     __u8 payload[];         /* In/Out: Sub-cmd data buffer */
> > +} __packed;
> > +
> > +/*
> > + * Methods to be embedded in ND_CMD_CALL request. These are sent to the kernel
> > + * via 'nd_pdsm_cmd_pkg.hdr.nd_command' member of the ioctl struct
> > + */
> > +enum papr_pdsm {
> > +     PAPR_PDSM_MIN = 0x0,
> > +     PAPR_PDSM_MAX,
> > +};
> > +
> > +/* Convert a libnvdimm nd_cmd_pkg to pdsm specific pkg */
> > +static inline struct nd_pdsm_cmd_pkg *nd_to_pdsm_cmd_pkg(struct nd_cmd_pkg *cmd)
> > +{
> > +     return (struct nd_pdsm_cmd_pkg *)cmd;
> > +}
> > +
> > +/* Return the payload pointer for a given pcmd */
> > +static inline void *pdsm_cmd_to_payload(struct nd_pdsm_cmd_pkg *pcmd)
> > +{
> > +     if (pcmd->hdr.nd_size_in == 0 && pcmd->hdr.nd_size_out == 0)
> > +             return NULL;
> > +     else
> > +             return (void *)(pcmd->payload);
> > +}
>
> I just realized these were in the uapi header.  You don't want to do this as
> this code gets built into any user space program that uses it and there may be
> license issues if the user space code is not a compatible license.

Yes, include/uapi/linux/ndctl.h is specifically LGPL for this reason.
