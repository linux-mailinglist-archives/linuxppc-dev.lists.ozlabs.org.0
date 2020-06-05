Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 371CA1EFFF2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 20:39:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49drzN0wfpzDr37
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 04:39:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49drxQ2PJWzDr0T
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 04:37:59 +1000 (AEST)
IronPort-SDR: l4Fx4rIzp9+c01WxwLHNEkbV+MVZ6dhWyrPb23pEaEDXtUO22myDq/OiFsExjtw3VABmEfdKxC
 8UNZP40yhLNg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2020 11:37:56 -0700
IronPort-SDR: XLGHK0NKxft8w+26C1EGhoXqar93pIvKWb4FA2W8x1kRtDPqXKRVvHjUWPxgGaLnUzGCVw0Hzw
 AGCWAaC/yg3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,477,1583222400"; d="scan'208";a="258101884"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by fmsmga007.fm.intel.com with ESMTP; 05 Jun 2020 11:37:56 -0700
Date: Fri, 5 Jun 2020 11:36:56 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH v10 6/6] powerpc/papr_scm: Implement support for
 PAPR_PDSM_HEALTH
Message-ID: <20200605183655.GP1505637@iweiny-DESK2.sc.intel.com>
References: <20200604234136.253703-1-vaibhav@linux.ibm.com>
 <20200604234136.253703-7-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604234136.253703-7-vaibhav@linux.ibm.com>
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

On Fri, Jun 05, 2020 at 05:11:36AM +0530, Vaibhav Jain wrote:
> This patch implements support for PDSM request 'PAPR_PDSM_HEALTH'
> that returns a newly introduced 'struct nd_papr_pdsm_health' instance
> containing dimm health information back to user space in response to
> ND_CMD_CALL. This functionality is implemented in newly introduced
> papr_pdsm_health() that queries the nvdimm health information and
> then copies this information to the package payload whose layout is
> defined by 'struct nd_papr_pdsm_health'.
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
> * Removed code in papr_pdsm_health that performed validation on pdsm
>   payload version and corrosponding struct and defines used for
>   validation of payload version.
> * Dropped usage of struct papr_pdsm_health in 'struct
>   papr_scm_priv'. Instead papr_psdm_health() now uses
>   'papr_scm_priv.health_bitmap' to populate the pdsm payload.
> * Above change also fixes the problem where this patch was removing
>   the code that was previously introduced in this patch-series.
>   [ Ira ]
> * Introduced a new def ND_PDSM_ENVELOPE_HDR_SIZE that indicates the
>   space allocated to 'struct nd_pdsm_cmd_pkg' fields except 'struct
>   nd_cmd_pkg'. This def is useful in validating payload sizes.
> * Reworked papr_pdsm_health() to enforce a specific payload size for
>   'PAPR_PDSM_HEALTH' pdsm request.
> 
> Resend:
> * Added ack from Aneesh.
> 
> v8..v9:
> * s/PAPR_SCM_PDSM_HEALTH/PAPR_PDSM_HEALTH/g  [ Dan , Aneesh ]
> * s/PAPR_SCM_PSDM_DIMM_*/PAPR_PDSM_DIMM_*/g
> * Renamed papr_scm_get_health() to papr_psdm_health()
> * Updated patch description to replace papr-scm dimm with nvdimm.
> 
> v7..v8:
> * None
> 
> Resend:
> * None
> 
> v6..v7:
> * Updated flags_show() to use seq_buf_printf(). [Mpe]
> * Updated papr_scm_get_health() to use newly introduced
>   __drc_pmem_query_health() bypassing the cache [Mpe].
> 
> v5..v6:
> * Added attribute '__packed' to 'struct nd_papr_pdsm_health_v1' to
>   gaurd against possibility of different compilers adding different
>   paddings to the struct [ Dan Williams ]
> 
> * Updated 'struct nd_papr_pdsm_health_v1' to use __u8 instead of
>   'bool' and also updated drc_pmem_query_health() to take this into
>   account. [ Dan Williams ]
> 
> v4..v5:
> * None
> 
> v3..v4:
> * Call the DSM_PAPR_SCM_HEALTH service function from
>   papr_scm_service_dsm() instead of papr_scm_ndctl(). [Aneesh]
> 
> v2..v3:
> * Updated struct nd_papr_scm_dimm_health_stat_v1 to use '__xx' types
>   as its exported to the userspace [Aneesh]
> * Changed the constants DSM_PAPR_SCM_DIMM_XX indicating dimm health
>   from enum to #defines [Aneesh]
> 
> v1..v2:
> * New patch in the series
> ---
>  arch/powerpc/include/uapi/asm/papr_pdsm.h | 33 +++++++++++
>  arch/powerpc/platforms/pseries/papr_scm.c | 70 +++++++++++++++++++++++
>  2 files changed, 103 insertions(+)
> 
> diff --git a/arch/powerpc/include/uapi/asm/papr_pdsm.h b/arch/powerpc/include/uapi/asm/papr_pdsm.h
> index 8b1a4f8fa316..c4c990ede5d4 100644
> --- a/arch/powerpc/include/uapi/asm/papr_pdsm.h
> +++ b/arch/powerpc/include/uapi/asm/papr_pdsm.h
> @@ -71,12 +71,17 @@ struct nd_pdsm_cmd_pkg {
>  	__u8 payload[];		/* In/Out: Sub-cmd data buffer */
>  } __packed;
>  
> +/* Calculate size used by the pdsm header fields minus 'struct nd_cmd_pkg' */
> +#define ND_PDSM_ENVELOPE_HDR_SIZE \
> +	(sizeof(struct nd_pdsm_cmd_pkg) - sizeof(struct nd_cmd_pkg))
> +

This is kind of a weird name for this.

Isn't this just the ND PDSM header size?  What is 'envelope' mean here?

>  /*
>   * Methods to be embedded in ND_CMD_CALL request. These are sent to the kernel
>   * via 'nd_pdsm_cmd_pkg.hdr.nd_command' member of the ioctl struct
>   */
>  enum papr_pdsm {
>  	PAPR_PDSM_MIN = 0x0,
> +	PAPR_PDSM_HEALTH,
>  	PAPR_PDSM_MAX,
>  };
>  
> @@ -95,4 +100,32 @@ static inline void *pdsm_cmd_to_payload(struct nd_pdsm_cmd_pkg *pcmd)
>  		return (void *)(pcmd->payload);
>  }
>  
> +/* Various nvdimm health indicators */
> +#define PAPR_PDSM_DIMM_HEALTHY       0
> +#define PAPR_PDSM_DIMM_UNHEALTHY     1
> +#define PAPR_PDSM_DIMM_CRITICAL      2
> +#define PAPR_PDSM_DIMM_FATAL         3
> +
> +/*
> + * Struct exchanged between kernel & ndctl in for PAPR_PDSM_HEALTH
> + * Various flags indicate the health status of the dimm.
> + *
> + * dimm_unarmed		: Dimm not armed. So contents wont persist.
> + * dimm_bad_shutdown	: Previous shutdown did not persist contents.
> + * dimm_bad_restore	: Contents from previous shutdown werent restored.
> + * dimm_scrubbed	: Contents of the dimm have been scrubbed.
> + * dimm_locked		: Contents of the dimm cant be modified until CEC reboot
> + * dimm_encrypted	: Contents of dimm are encrypted.
> + * dimm_health		: Dimm health indicator. One of PAPR_PDSM_DIMM_XXXX
> + */
> +struct nd_papr_pdsm_health {
> +	__u8 dimm_unarmed;
> +	__u8 dimm_bad_shutdown;
> +	__u8 dimm_bad_restore;
> +	__u8 dimm_scrubbed;
> +	__u8 dimm_locked;
> +	__u8 dimm_encrypted;
> +	__u16 dimm_health;
> +} __packed;
> +
>  #endif /* _UAPI_ASM_POWERPC_PAPR_PDSM_H_ */
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 05eb56ecab5e..984942be24c1 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -421,6 +421,72 @@ static int is_cmd_valid(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
>  	return 0;
>  }
>  
> +/* Fetch the DIMM health info and populate it in provided package. */
> +static int papr_pdsm_health(struct papr_scm_priv *p,
> +			    struct nd_pdsm_cmd_pkg *pkg)
> +{
> +	int rc;
> +	struct nd_papr_pdsm_health health = { 0 };
> +	u16 copysize = sizeof(struct nd_papr_pdsm_health);
> +	u16 payload_size = pkg->hdr.nd_size_out - ND_PDSM_ENVELOPE_HDR_SIZE;
> +
> +	/* Ensure correct payload size that can hold struct nd_papr_pdsm_health */
> +	if (payload_size != copysize) {
> +		dev_dbg(&p->pdev->dev,
> +			"Unexpected payload-size (%u). Expected (%u)",
> +			pkg->hdr.nd_size_out, copysize);
> +		rc = -ENOSPC;
> +		goto out;
> +	}
> +
> +	/* Ensure dimm health mutex is taken preventing concurrent access */
> +	rc = mutex_lock_interruptible(&p->health_mutex);
> +	if (rc)
> +		goto out;
> +
> +	/* Always fetch upto date dimm health data ignoring cached values */
> +	rc = __drc_pmem_query_health(p);
> +	if (rc) {
> +		mutex_unlock(&p->health_mutex);
> +		goto out;
> +	}
> +
> +	/* update health struct with various flags derived from health bitmap */
> +	health = (struct nd_papr_pdsm_health) {
> +		.dimm_unarmed = p->health_bitmap & PAPR_PMEM_UNARMED_MASK,
> +		.dimm_bad_shutdown = p->health_bitmap & PAPR_PMEM_BAD_SHUTDOWN_MASK,
> +		.dimm_bad_restore = p->health_bitmap & PAPR_PMEM_BAD_RESTORE_MASK,
> +		.dimm_encrypted = p->health_bitmap & PAPR_PMEM_ENCRYPTED,
> +		.dimm_locked = p->health_bitmap & PAPR_PMEM_SCRUBBED_AND_LOCKED,
> +		.dimm_scrubbed = p->health_bitmap & PAPR_PMEM_SCRUBBED_AND_LOCKED,

Are you sure these work?  These are not assignments to a bool so I don't think
gcc will do what you want here.

Ira

> +		.dimm_health = PAPR_PDSM_DIMM_HEALTHY,
> +	};
> +
> +	/* Update field dimm_health based on health_bitmap flags */
> +	if (p->health_bitmap & PAPR_PMEM_HEALTH_FATAL)
> +		health.dimm_health = PAPR_PDSM_DIMM_FATAL;
> +	else if (p->health_bitmap & PAPR_PMEM_HEALTH_CRITICAL)
> +		health.dimm_health = PAPR_PDSM_DIMM_CRITICAL;
> +	else if (p->health_bitmap & PAPR_PMEM_HEALTH_UNHEALTHY)
> +		health.dimm_health = PAPR_PDSM_DIMM_UNHEALTHY;
> +
> +	/* struct populated hence can release the mutex now */
> +	mutex_unlock(&p->health_mutex);
> +
> +	dev_dbg(&p->pdev->dev, "Copying payload size=%u\n", copysize);
> +
> +	/* Copy the health struct to the payload */
> +	memcpy(pdsm_cmd_to_payload(pkg), &health, copysize);
> +
> +	/* Update fw size including size of struct nd_pdsm_cmd_pkg fields */
> +	pkg->hdr.nd_fw_size = copysize + ND_PDSM_ENVELOPE_HDR_SIZE;
> +
> +out:
> +	dev_dbg(&p->pdev->dev, "completion code = %d\n", rc);
> +
> +	return rc;
> +}
> +
>  /*
>   * For a given pdsm request call an appropriate service function.
>   * Note: Use 'nd_pdsm_cmd_pkg.cmd_status to report psdm servicing errors. Hence
> @@ -435,6 +501,10 @@ static void papr_scm_service_pdsm(struct papr_scm_priv *p,
>  
>  	/* Call pdsm service function */
>  	switch (pdsm) {
> +	case PAPR_PDSM_HEALTH:
> +		pkg->cmd_status = papr_pdsm_health(p, pkg);
> +		break;
> +
>  	default:
>  		dev_dbg(&p->pdev->dev, "PDSM[0x%x]: Unsupported PDSM request\n",
>  			pdsm);
> -- 
> 2.26.2
> 
