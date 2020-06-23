Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E49205B99
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 21:17:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rwyg1J2NzDqdj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 05:17:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rwtt71jTzDqY0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 05:14:14 +1000 (AEST)
IronPort-SDR: W0JHu4tkYGsTlgaLG+uCl2APNH3pTAyYsPKFok5AJmTPvyUmq50gN2ZZ9mcAsSbMRZyR+dCFA2
 gPHTal+gEciw==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="143293073"
X-IronPort-AV: E=Sophos;i="5.75,272,1589266800"; d="scan'208";a="143293073"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 12:14:11 -0700
IronPort-SDR: aSHQQvRvGFfed0wXnzX5YxhKZO0WAMes9KU4/xZi/0Bcs3CYIGE720ow1jLD0cs7OBEJgs5aFi
 /DMR2SuTJjfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,272,1589266800"; d="scan'208";a="384947445"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by fmsmga001.fm.intel.com with ESMTP; 23 Jun 2020 12:14:10 -0700
Date: Tue, 23 Jun 2020 12:14:10 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/papr_scm: Add support for fetching nvdimm
 'fuel-gauge' metric
Message-ID: <20200623191410.GH3910394@iweiny-DESK2.sc.intel.com>
References: <20200622042451.22448-1-vaibhav@linux.ibm.com>
 <20200622042451.22448-3-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622042451.22448-3-vaibhav@linux.ibm.com>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 22, 2020 at 09:54:51AM +0530, Vaibhav Jain wrote:
> We add support for reporting 'fuel-gauge' NVDIMM metric via
> PAPR_PDSM_HEALTH pdsm payload. 'fuel-gauge' metric indicates the usage
> life remaining of a papr-scm compatible NVDIMM. PHYP exposes this
> metric via the H_SCM_PERFORMANCE_STATS.
> 
> The metric value is returned from the pdsm by extending the return
> payload 'struct nd_papr_pdsm_health' without breaking the ABI. A new
> field 'dimm_fuel_gauge' to hold the metric value is introduced at the
> end of the payload struct and its presence is indicated by by
> extension flag PDSM_DIMM_HEALTH_RUN_GAUGE_VALID.
> 
> The patch introduces a new function papr_pdsm_fuel_gauge() that is
> called from papr_pdsm_health(). If fetching NVDIMM performance stats
> is supported then 'papr_pdsm_fuel_gauge()' allocated an output buffer
> large enough to hold the performance stat and passes it to
> drc_pmem_query_stats() that issues the HCALL to PHYP. The return value
> of the stat is then populated in the 'struct
> nd_papr_pdsm_health.dimm_fuel_gauge' field with extension flag
> 'PDSM_DIMM_HEALTH_RUN_GAUGE_VALID' set in 'struct
> nd_papr_pdsm_health.extension_flags'
> 
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>  arch/powerpc/include/uapi/asm/papr_pdsm.h |  9 +++++
>  arch/powerpc/platforms/pseries/papr_scm.c | 47 +++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/arch/powerpc/include/uapi/asm/papr_pdsm.h b/arch/powerpc/include/uapi/asm/papr_pdsm.h
> index 9ccecc1d6840..50ef95e2f5b1 100644
> --- a/arch/powerpc/include/uapi/asm/papr_pdsm.h
> +++ b/arch/powerpc/include/uapi/asm/papr_pdsm.h
> @@ -72,6 +72,11 @@
>  #define PAPR_PDSM_DIMM_CRITICAL      2
>  #define PAPR_PDSM_DIMM_FATAL         3
>  
> +/* struct nd_papr_pdsm_health.extension_flags field flags */
> +
> +/* Indicate that the 'dimm_fuel_gauge' field is valid */
> +#define PDSM_DIMM_HEALTH_RUN_GAUGE_VALID 1
> +
>  /*
>   * Struct exchanged between kernel & ndctl in for PAPR_PDSM_HEALTH
>   * Various flags indicate the health status of the dimm.
> @@ -84,6 +89,7 @@
>   * dimm_locked		: Contents of the dimm cant be modified until CEC reboot
>   * dimm_encrypted	: Contents of dimm are encrypted.
>   * dimm_health		: Dimm health indicator. One of PAPR_PDSM_DIMM_XXXX
> + * dimm_fuel_gauge	: Life remaining of DIMM as a percentage from 0-100
>   */
>  struct nd_papr_pdsm_health {
>  	union {
> @@ -96,6 +102,9 @@ struct nd_papr_pdsm_health {
>  			__u8 dimm_locked;
>  			__u8 dimm_encrypted;
>  			__u16 dimm_health;
> +
> +			/* Extension flag PDSM_DIMM_HEALTH_RUN_GAUGE_VALID */
> +			__u16 dimm_fuel_gauge;
>  		};
>  		__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
>  	};
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index cb3f9acc325b..39527cd38d9c 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -506,6 +506,45 @@ static int is_cmd_valid(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
>  	return 0;
>  }
>  
> +static int papr_pdsm_fuel_gauge(struct papr_scm_priv *p,
> +				union nd_pdsm_payload *payload)
> +{
> +	int rc, size;
> +	struct papr_scm_perf_stat *stat;
> +	struct papr_scm_perf_stats *stats;
> +
> +	/* Silently fail if fetching performance metrics isn't  supported */
> +	if (!p->len_stat_buffer)
> +		return 0;
> +
> +	/* Allocate request buffer enough to hold single performance stat */
> +	size = sizeof(struct papr_scm_perf_stats) +
> +		sizeof(struct papr_scm_perf_stat);
> +
> +	stats = kzalloc(size, GFP_KERNEL);
> +	if (!stats)
> +		return -ENOMEM;
> +
> +	stat = &stats->scm_statistic[0];
> +	memcpy(&stat->statistic_id, "MemLife ", sizeof(stat->statistic_id));
> +	stat->statistic_value = 0;
> +
> +	/* Fetch the fuel gauge and populate it in payload */
> +	rc = drc_pmem_query_stats(p, stats, size, 1, NULL);
> +	if (!rc) {

Always best to except the error case...

	if (rc) {
		... print debuging from below...
		goto free_stats;
	}

> +		dev_dbg(&p->pdev->dev,
> +			"Fetched fuel-gauge %llu", stat->statistic_value);
> +		payload->health.extension_flags |=
> +			PDSM_DIMM_HEALTH_RUN_GAUGE_VALID;
> +		payload->health.dimm_fuel_gauge = stat->statistic_value;
> +
> +		rc = sizeof(struct nd_papr_pdsm_health);
> +	}
> +

free_stats:

> +	kfree(stats);
> +	return rc;
> +}
> +
>  /* Fetch the DIMM health info and populate it in provided package. */
>  static int papr_pdsm_health(struct papr_scm_priv *p,
>  			    union nd_pdsm_payload *payload)
> @@ -546,6 +585,14 @@ static int papr_pdsm_health(struct papr_scm_priv *p,
>  
>  	/* struct populated hence can release the mutex now */
>  	mutex_unlock(&p->health_mutex);
> +
> +	/* Populate the fuel gauge meter in the payload */
> +	rc = papr_pdsm_fuel_gauge(p, payload);
> +
> +	/* Error fetching fuel gauge is not fatal */
> +	if (rc < 0)
> +		dev_dbg(&p->pdev->dev, "Err(%d) fetching fuel gauge\n", rc);

Why even return an error?  Just have *_fuel_guage() the print the debugging and
return void.

> +
>  	rc = sizeof(struct nd_papr_pdsm_health);

You just override rc here anyway...

Ira

>  
>  out:
> -- 
> 2.26.2
> _______________________________________________
> Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
> To unsubscribe send an email to linux-nvdimm-leave@lists.01.org
