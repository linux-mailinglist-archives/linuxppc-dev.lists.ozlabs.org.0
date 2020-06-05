Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D6A1F0093
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 21:53:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dtbx2kWgzDr1c
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 05:53:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dtXP706xzDr3L
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 05:49:57 +1000 (AEST)
IronPort-SDR: U+G2niROQXHSB9aot312lHs8Locl4EtGTxwu1ZAd8fjgdxbu950CdcLcOcZkcQVEMhBmnI7P6O
 tBzr620Gug+g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2020 12:49:53 -0700
IronPort-SDR: kZJiUilvSXQgxhS9SaePojTNPAiMQnf0ZZeOxGEKwRKC+flG0if93p4sTKM+dDNeTJORQNDHeJ
 cGHdzb6Z2hJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,477,1583222400"; d="scan'208";a="348539251"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by orsmga001.jf.intel.com with ESMTP; 05 Jun 2020 12:49:53 -0700
Date: Fri, 5 Jun 2020 12:49:53 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH v10 5/6] ndctl/papr_scm, uapi: Add support for PAPR nvdimm
 specific methods
Message-ID: <20200605194952.GS1505637@iweiny-DESK2.sc.intel.com>
References: <20200604234136.253703-1-vaibhav@linux.ibm.com>
 <20200604234136.253703-6-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604234136.253703-6-vaibhav@linux.ibm.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
Cc: Santosh Sivaraj <santosh@fossix.org>, linux-nvdimm@lists.01.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 05, 2020 at 05:11:35AM +0530, Vaibhav Jain wrote:
> Introduce support for PAPR NVDIMM Specific Methods (PDSM) in papr_scm
> module and add the command family NVDIMM_FAMILY_PAPR to the white list
> of NVDIMM command sets. Also advertise support for ND_CMD_CALL for the
> nvdimm command mask and implement necessary scaffolding in the module
> to handle ND_CMD_CALL ioctl and PDSM requests that we receive.
> 
> The layout of the PDSM request as we expect from libnvdimm/libndctl is
> described in newly introduced uapi header 'papr_pdsm.h' which
> defines a new 'struct nd_pdsm_cmd_pkg' header. This header is used
> to communicate the PDSM request via member
> 'nd_cmd_pkg.nd_command' and size of payload that need to be
> sent/received for servicing the PDSM.
> 
> A new function is_cmd_valid() is implemented that reads the args to
> papr_scm_ndctl() and performs sanity tests on them. A new function
> papr_scm_service_pdsm() is introduced and is called from
> papr_scm_ndctl() in case of a PDSM request is received via ND_CMD_CALL
> command from libnvdimm.
> 
> Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Changelog:
> 
> v9..v10:
> * Simplified 'struct nd_pdsm_cmd_pkg' by removing the
>   'payload_version' field.
> * Removed the corrosponding documentation on versioning and backward
>   compatibility from 'papr_pdsm.h'
> * Reduced the size of reserved fields to 4-bytes making 'struct
>   nd_pdsm_cmd_pkg' 64 + 8 bytes long.
> * Updated is_cmd_valid() to enforce validation checks on pdsm
>   commands. [ Dan Williams ]
> * Added check for reserved fields being set to '0' in is_cmd_valid()
>   [ Ira ]
> * Moved changes for checking cmd_rc == NULL and logging improvements
>   to a separate prelim patch [ Ira ].
> * Moved  pdsm package validation checks from papr_scm_service_pdsm()
>   to is_cmd_valid().
> * Marked papr_scm_service_pdsm() return type as 'void' since errors
>   are reported in nd_pdsm_cmd_pkg.cmd_status field.
> 
> Resend:
> * Added ack from Aneesh.
> 
> v8..v9:
> * Reduced the usage of term SCM replacing it with appropriate
>   replacement [ Dan Williams, Aneesh ]
> * Renamed 'papr_scm_pdsm.h' to 'papr_pdsm.h'
> * s/PAPR_SCM_PDSM_*/PAPR_PDSM_*/g
> * s/NVDIMM_FAMILY_PAPR_SCM/NVDIMM_FAMILY_PAPR/g
> * Minor updates to 'papr_psdm.h' to replace usage of term 'SCM'.
> * Minor update to patch description.
> 
> v7..v8:
> * Removed the 'payload_offset' field from 'struct
>   nd_pdsm_cmd_pkg'. Instead command payload is always assumed to start
>   at 'nd_pdsm_cmd_pkg.payload'. [ Aneesh ]
> * To enable introducing new fields to 'struct nd_pdsm_cmd_pkg',
>   'reserved' field of 10-bytes is introduced. [ Aneesh ]
> * Fixed a typo in "Backward Compatibility" section of papr_scm_pdsm.h
>   [ Ira ]
> 
> Resend:
> * None
> 
> v6..v7 :
> * Removed the re-definitions of __packed macro from papr_scm_pdsm.h
>   [Mpe].
> * Removed the usage of __KERNEL__ macros in papr_scm_pdsm.h [Mpe].
> * Removed macros that were unused in papr_scm.c from papr_scm_pdsm.h
>   [Mpe].
> * Made functions defined in papr_scm_pdsm.h as static inline. [Mpe]
> 
> v5..v6 :
> * Changed the usage of the term DSM to PDSM to distinguish it from the
>   ACPI term [ Dan Williams ]
> * Renamed papr_scm_dsm.h to papr_scm_pdsm.h and updated various struct
>   to reflect the new terminology.
> * Updated the patch description and title to reflect the new terminology.
> * Squashed patch to introduce new command family in 'ndctl.h' with
>   this patch [ Dan Williams ]
> * Updated the papr_scm_pdsm method starting index from 0x10000 to 0x0
>   [ Dan Williams ]
> * Removed redundant license text from the papr_scm_psdm.h file.
>   [ Dan Williams ]
> * s/envelop/envelope/ at various places [ Dan Williams ]
> * Added '__packed' attribute to command package header to gaurd
>   against different compiler adding paddings between the fields.
>   [ Dan Williams]
> * Converted various pr_debug to dev_debug [ Dan Williams ]
> 
> v4..v5 :
> * None
> 
> v3..v4 :
> * None
> 
> v2..v3 :
> * Updated the patch prefix to 'ndctl/uapi' [Aneesh]
> 
> v1..v2 :
> * None
> ---
>  arch/powerpc/include/uapi/asm/papr_pdsm.h |  98 +++++++++++++++++++
>  arch/powerpc/platforms/pseries/papr_scm.c | 113 +++++++++++++++++++++-
>  include/uapi/linux/ndctl.h                |   1 +
>  3 files changed, 207 insertions(+), 5 deletions(-)
>  create mode 100644 arch/powerpc/include/uapi/asm/papr_pdsm.h
> 
> diff --git a/arch/powerpc/include/uapi/asm/papr_pdsm.h b/arch/powerpc/include/uapi/asm/papr_pdsm.h
> new file mode 100644
> index 000000000000..8b1a4f8fa316
> --- /dev/null
> +++ b/arch/powerpc/include/uapi/asm/papr_pdsm.h
> @@ -0,0 +1,98 @@
> +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
> +/*
> + * PAPR nvDimm Specific Methods (PDSM) and structs for libndctl
> + *
> + * (C) Copyright IBM 2020
> + *
> + * Author: Vaibhav Jain <vaibhav at linux.ibm.com>
> + */
> +
> +#ifndef _UAPI_ASM_POWERPC_PAPR_PDSM_H_
> +#define _UAPI_ASM_POWERPC_PAPR_PDSM_H_
> +
> +#include <linux/types.h>
> +
> +/*
> + * PDSM Envelope:
> + *
> + * The ioctl ND_CMD_CALL transfers data between user-space and kernel via
> + * envelope which consists of a header and user-defined payload sections.
> + * The header is described by 'struct nd_pdsm_cmd_pkg' which expects a
> + * payload following it and accessible via 'nd_pdsm_cmd_pkg.payload' field.
> + * There is reserved field that can used to introduce new fields to the
> + * structure in future. It also tries to ensure that 'nd_pdsm_cmd_pkg.payload'
> + * lies at a 8-byte boundary.
> + *
> + *  +-------------+---------------------+---------------------------+
> + *  |   64-Bytes  |       8-Bytes       |       Max 184-Bytes       |
> + *  +-------------+---------------------+---------------------------+
> + *  |               nd_pdsm_cmd_pkg     |                           |
> + *  |-------------+                     |                           |
> + *  |  nd_cmd_pkg |                     |                           |
> + *  +-------------+---------------------+---------------------------+
> + *  | nd_family   |                     |                           |
> + *  | nd_size_out | cmd_status          |                           |
> + *  | nd_size_in  | reserved            |     payload               |
> + *  | nd_command  |                     |                           |
> + *  | nd_fw_size  |                     |                           |
> + *  +-------------+---------------------+---------------------------+
> + *
> + * PDSM Header:
> + *
> + * The header is defined as 'struct nd_pdsm_cmd_pkg' which embeds a
> + * 'struct nd_cmd_pkg' instance. The PDSM command is assigned to member
> + * 'nd_cmd_pkg.nd_command'. Apart from size information of the envelope which is
> + * contained in 'struct nd_cmd_pkg', the header also has members following
> + * members:
> + *
> + * 'cmd_status'		: (Out) Errors if any encountered while servicing PDSM.
> + * 'reserved'		: Not used, reserved for future and should be set to 0.
> + *
> + * PDSM Payload:
> + *
> + * The layout of the PDSM Payload is defined by various structs shared between
> + * papr_scm and libndctl so that contents of payload can be interpreted. During
> + * servicing of a PDSM the papr_scm module will read input args from the payload
> + * field by casting its contents to an appropriate struct pointer based on the
> + * PDSM command. Similarly the output of servicing the PDSM command will be
> + * copied to the payload field using the same struct.
> + *
> + * 'libnvdimm' enforces a hard limit of 256 bytes on the envelope size, which
> + * leaves around 184 bytes for the envelope payload (ignoring any padding that
> + * the compiler may silently introduce).
> + *
> + */
> +
> +/* PDSM-header + payload expected with ND_CMD_CALL ioctl from libnvdimm */
> +struct nd_pdsm_cmd_pkg {
> +	struct nd_cmd_pkg hdr;	/* Package header containing sub-cmd */
> +	__s32 cmd_status;	/* Out: Sub-cmd status returned back */
> +	__u16 reserved[2];	/* Ignored and to be used in future */
> +	__u8 payload[];		/* In/Out: Sub-cmd data buffer */
> +} __packed;
> +
> +/*
> + * Methods to be embedded in ND_CMD_CALL request. These are sent to the kernel
> + * via 'nd_pdsm_cmd_pkg.hdr.nd_command' member of the ioctl struct
> + */
> +enum papr_pdsm {
> +	PAPR_PDSM_MIN = 0x0,
> +	PAPR_PDSM_MAX,
> +};
> +
> +/* Convert a libnvdimm nd_cmd_pkg to pdsm specific pkg */
> +static inline struct nd_pdsm_cmd_pkg *nd_to_pdsm_cmd_pkg(struct nd_cmd_pkg *cmd)
> +{
> +	return (struct nd_pdsm_cmd_pkg *)cmd;
> +}
> +
> +/* Return the payload pointer for a given pcmd */
> +static inline void *pdsm_cmd_to_payload(struct nd_pdsm_cmd_pkg *pcmd)
> +{
> +	if (pcmd->hdr.nd_size_in == 0 && pcmd->hdr.nd_size_out == 0)
> +		return NULL;
> +	else
> +		return (void *)(pcmd->payload);
> +}

I just realized these were in the uapi header.  You don't want to do this as
this code gets built into any user space program that uses it and there may be
license issues if the user space code is not a compatible license.

Ira

> +
> +#endif /* _UAPI_ASM_POWERPC_PAPR_PDSM_H_ */
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 6512fe6a2874..05eb56ecab5e 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -15,13 +15,15 @@
>  #include <linux/seq_buf.h>
>  
>  #include <asm/plpar_wrappers.h>
> +#include <asm/papr_pdsm.h>
>  
>  #define BIND_ANY_ADDR (~0ul)
>  
>  #define PAPR_SCM_DIMM_CMD_MASK \
>  	((1ul << ND_CMD_GET_CONFIG_SIZE) | \
>  	 (1ul << ND_CMD_GET_CONFIG_DATA) | \
> -	 (1ul << ND_CMD_SET_CONFIG_DATA))
> +	 (1ul << ND_CMD_SET_CONFIG_DATA) | \
> +	 (1ul << ND_CMD_CALL))
>  
>  /* DIMM health bitmap bitmap indicators */
>  /* SCM device is unable to persist memory contents */
> @@ -349,22 +351,117 @@ static int papr_scm_meta_set(struct papr_scm_priv *p,
>  	return 0;
>  }
>  
> +/*
> + * Do a sanity checks on the inputs args to dimm-control function and return
> + * '0' if valid. This also does validation on ND_CMD_CALL sub-command packages.
> + */
> +static int is_cmd_valid(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
> +			unsigned int buf_len)
> +{
> +	unsigned long cmd_mask = PAPR_SCM_DIMM_CMD_MASK;
> +	struct nd_pdsm_cmd_pkg *pkg;
> +	struct nd_cmd_pkg *nd_cmd;
> +	struct papr_scm_priv *p;
> +	enum papr_pdsm pdsm;
> +
> +	/* Only dimm-specific calls are supported atm */
> +	if (!nvdimm)
> +		return -EINVAL;
> +
> +	/* get the provider data from struct nvdimm */
> +	p = nvdimm_provider_data(nvdimm);
> +
> +	if (!test_bit(cmd, &cmd_mask)) {
> +		dev_dbg(&p->pdev->dev, "Unsupported cmd=%u\n", cmd);
> +		return -EINVAL;
> +	}
> +
> +	/* For CMD_CALL verify pdsm request */
> +	if (cmd == ND_CMD_CALL) {
> +		/* Verify the envelope package */
> +		if (!buf || buf_len < sizeof(struct nd_pdsm_cmd_pkg)) {
> +			dev_dbg(&p->pdev->dev, "Invalid pkg size=%u\n",
> +				buf_len);
> +			return -EINVAL;
> +		}
> +
> +		/* Verify that the nd_cmd_pkg.nd_family is correct */
> +		nd_cmd = (struct nd_cmd_pkg *)buf;
> +		if (nd_cmd->nd_family != NVDIMM_FAMILY_PAPR) {
> +			dev_dbg(&p->pdev->dev, "Invalid pkg family=0x%llx\n",
> +				nd_cmd->nd_family);
> +			return -EINVAL;
> +		}
> +
> +		/* Get the pdsm request package and the command */
> +		pkg = nd_to_pdsm_cmd_pkg(nd_cmd);
> +		pdsm = pkg->hdr.nd_command;
> +
> +		/* Verify if the psdm command is valid */
> +		if (pdsm <= PAPR_PDSM_MIN || pdsm >= PAPR_PDSM_MAX) {
> +			dev_dbg(&p->pdev->dev, "PDSM[0x%x]: Invalid PDSM\n", pdsm);
> +			return -EINVAL;
> +		}
> +
> +		/* We except a payload with all PDSM commands */
> +		if (!pdsm_cmd_to_payload(pkg)) {
> +			dev_dbg(&p->pdev->dev, "PDSM[0x%x]: Empty payload\n", pdsm);
> +			return -EINVAL;
> +		}
> +
> +		/* Ensure reserved fields of the pdsm header are set to 0 */
> +		if (pkg->reserved[0] || pkg->reserved[1]) {
> +			dev_dbg(&p->pdev->dev,
> +				"PDSM[0x%x]: Invalid reserved field usage\n", pdsm);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	/* Let the command be further processed */
> +	return 0;
> +}
> +
> +/*
> + * For a given pdsm request call an appropriate service function.
> + * Note: Use 'nd_pdsm_cmd_pkg.cmd_status to report psdm servicing errors. Hence
> + * function marked as void.
> + */
> +static void papr_scm_service_pdsm(struct papr_scm_priv *p,
> +				  struct nd_pdsm_cmd_pkg *pkg)
> +{
> +	const enum papr_pdsm pdsm = pkg->hdr.nd_command;
> +
> +	dev_dbg(&p->pdev->dev, "PDSM[0x%x]: Servicing..\n", pdsm);
> +
> +	/* Call pdsm service function */
> +	switch (pdsm) {
> +	default:
> +		dev_dbg(&p->pdev->dev, "PDSM[0x%x]: Unsupported PDSM request\n",
> +			pdsm);
> +		pkg->cmd_status = -ENOENT;
> +		break;
> +	}
> +}
> +
>  static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
>  			  struct nvdimm *nvdimm, unsigned int cmd, void *buf,
>  			  unsigned int buf_len, int *cmd_rc)
>  {
>  	struct nd_cmd_get_config_size *get_size_hdr;
> +	struct nd_pdsm_cmd_pkg *call_pkg = NULL;
>  	struct papr_scm_priv *p;
>  	int rc;
>  
> -	/* Only dimm-specific calls are supported atm */
> -	if (!nvdimm)
> -		return -EINVAL;
> -
>  	/* Use a local variable in case cmd_rc pointer is NULL */
>  	if (!cmd_rc)
>  		cmd_rc = &rc;
>  
> +	*cmd_rc = is_cmd_valid(nvdimm, cmd, buf, buf_len);
> +	if (*cmd_rc) {
> +		pr_debug("Invalid cmd=0x%x. Err=%d\n", cmd, *cmd_rc);
> +		return *cmd_rc;
> +	}
> +
>  	p = nvdimm_provider_data(nvdimm);
>  
>  	switch (cmd) {
> @@ -385,6 +482,12 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
>  		*cmd_rc = papr_scm_meta_set(p, buf);
>  		break;
>  
> +	case ND_CMD_CALL:
> +		call_pkg = nd_to_pdsm_cmd_pkg(buf);
> +		papr_scm_service_pdsm(p, call_pkg);
> +		*cmd_rc = 0;
> +		break;
> +
>  	default:
>  		dev_dbg(&p->pdev->dev, "Unknown command = %d\n", cmd);
>  		*cmd_rc = -EINVAL;
> diff --git a/include/uapi/linux/ndctl.h b/include/uapi/linux/ndctl.h
> index de5d90212409..0e09dc5cec19 100644
> --- a/include/uapi/linux/ndctl.h
> +++ b/include/uapi/linux/ndctl.h
> @@ -244,6 +244,7 @@ struct nd_cmd_pkg {
>  #define NVDIMM_FAMILY_HPE2 2
>  #define NVDIMM_FAMILY_MSFT 3
>  #define NVDIMM_FAMILY_HYPERV 4
> +#define NVDIMM_FAMILY_PAPR 5
>  
>  #define ND_IOCTL_CALL			_IOWR(ND_IOCTL, ND_CMD_CALL,\
>  					struct nd_cmd_pkg)
> -- 
> 2.26.2
> 
