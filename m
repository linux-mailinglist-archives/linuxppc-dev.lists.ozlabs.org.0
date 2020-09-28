Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0351127B160
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Sep 2020 18:06:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0S7d0ZfSzDqL5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 02:06:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0S5c3rSpzDqK3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 02:04:48 +1000 (AEST)
IronPort-SDR: Qy1mmPLzMo/Ssjn6o83ozLDwQwjvdOD2gFYx5NIMssQXe0m/wHSewFZw76WsT9aiy32MITRG5U
 1JpeyWu4q8RQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="159359148"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="159359148"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 09:04:44 -0700
IronPort-SDR: r02vg2GzNT9s6ig5PnS8z6+btkjA2PxNk8YI5QVkNNrotNBPht0BBBVH0n/5MNu01J2R2YNsBi
 xeYBM+AB0Q6A==
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; d="scan'208";a="514311781"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 09:04:43 -0700
Date: Mon, 28 Sep 2020 09:04:43 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH] powerpc/papr_scm: Support dynamic enable/disable of
 performance statistics
Message-ID: <20200928160443.GB458519@iweiny-DESK2.sc.intel.com>
References: <20200913212115.24958-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200913212115.24958-1-vaibhav@linux.ibm.com>
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
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 14, 2020 at 02:51:15AM +0530, Vaibhav Jain wrote:
> Collection of performance statistics of an NVDIMM can be dynamically
> enabled/disabled from the Hypervisor Management Console even when the
> guest lpar is running. The current implementation however will check if
> the performance statistics collection is supported during NVDIMM probe
> and if yes will assume that to be the case afterwards.
> 
> Hence we update papr_scm to remove this assumption from the code by
> eliminating the 'stat_buffer_len' member from 'struct papr_scm_priv'
> that was used to cache the max buffer size needed to fetch NVDIMM
> performance stats from PHYP. With that struct member gone, various
> functions that depended on it are updated. Specifically
> perf_stats_show() is updated to query the PHYP first for the size of
> buffer needed to hold all performance statistics instead of relying on
> 'stat_buffer_len'
> 
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 53 +++++++++++------------
>  1 file changed, 25 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 27268370dee00..6697e1c3b9ebe 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -112,9 +112,6 @@ struct papr_scm_priv {
>  
>  	/* Health information for the dimm */
>  	u64 health_bitmap;
> -
> -	/* length of the stat buffer as expected by phyp */
> -	size_t stat_buffer_len;
>  };
>  
>  static LIST_HEAD(papr_nd_regions);
> @@ -230,14 +227,15 @@ static int drc_pmem_query_n_bind(struct papr_scm_priv *p)
>   * - If buff_stats == NULL the return value is the size in byes of the buffer
>   * needed to hold all supported performance-statistics.
>   * - If buff_stats != NULL and num_stats == 0 then we copy all known
> - * performance-statistics to 'buff_stat' and expect to be large enough to
> - * hold them.
> + * performance-statistics to 'buff_stat' and expect it to be large enough to
> + * hold them. The 'buff_size' args contains the size of the 'buff_stats'
>   * - if buff_stats != NULL and num_stats > 0 then copy the requested
>   * performance-statistics to buff_stats.
>   */
>  static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
>  				    struct papr_scm_perf_stats *buff_stats,
> -				    unsigned int num_stats)
> +				    unsigned int num_stats,
> +				    size_t buff_size)
>  {
>  	unsigned long ret[PLPAR_HCALL_BUFSIZE];
>  	size_t size;
> @@ -261,12 +259,18 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
>  			size = sizeof(struct papr_scm_perf_stats) +
>  				num_stats * sizeof(struct papr_scm_perf_stat);
>  		else
> -			size = p->stat_buffer_len;
> +			size = buff_size;
>  	} else {
>  		/* In case of no out buffer ignore the size */
>  		size = 0;
>  	}
>  
> +	/* verify that the buffer size needed is sufficient */
> +	if (size > buff_size) {
> +		__WARN();
> +		return -EINVAL;
> +	}
> +
>  	/* Do the HCALL asking PHYP for info */
>  	rc = plpar_hcall(H_SCM_PERFORMANCE_STATS, ret, p->drc_index,
>  			 buff_stats ? virt_to_phys(buff_stats) : 0,
> @@ -277,6 +281,10 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
>  		dev_err(&p->pdev->dev,
>  			"Unknown performance stats, Err:0x%016lX\n", ret[0]);
>  		return -ENOENT;
> +	} else if (rc == H_AUTHORITY) {
> +		dev_dbg(&p->pdev->dev,
> +			"Performance stats in-accessible\n");
> +		return -EPERM;
>  	} else if (rc != H_SUCCESS) {
>  		dev_err(&p->pdev->dev,
>  			"Failed to query performance stats, Err:%lld\n", rc);
> @@ -526,10 +534,6 @@ static int papr_pdsm_fuel_gauge(struct papr_scm_priv *p,
>  	struct papr_scm_perf_stat *stat;
>  	struct papr_scm_perf_stats *stats;
>  
> -	/* Silently fail if fetching performance metrics isn't  supported */
> -	if (!p->stat_buffer_len)
> -		return 0;
> -
>  	/* Allocate request buffer enough to hold single performance stat */
>  	size = sizeof(struct papr_scm_perf_stats) +
>  		sizeof(struct papr_scm_perf_stat);
> @@ -543,9 +547,11 @@ static int papr_pdsm_fuel_gauge(struct papr_scm_priv *p,
>  	stat->stat_val = 0;
>  
>  	/* Fetch the fuel gauge and populate it in payload */
> -	rc = drc_pmem_query_stats(p, stats, 1);
> +	rc = drc_pmem_query_stats(p, stats, 1, size);
>  	if (rc < 0) {
>  		dev_dbg(&p->pdev->dev, "Err(%d) fetching fuel gauge\n", rc);
> +		/* Silently fail if unable to fetch performance metric */
> +		rc = 0;
>  		goto free_stats;
>  	}
>  
> @@ -786,23 +792,25 @@ static ssize_t perf_stats_show(struct device *dev,
>  			       struct device_attribute *attr, char *buf)
>  {
>  	int index;
> -	ssize_t rc;
> +	ssize_t rc, buff_len;
>  	struct seq_buf s;
>  	struct papr_scm_perf_stat *stat;
>  	struct papr_scm_perf_stats *stats;
>  	struct nvdimm *dimm = to_nvdimm(dev);
>  	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
>  
> -	if (!p->stat_buffer_len)
> -		return -ENOENT;
> +	/* fetch the length of buffer needed to get all stats */
> +	buff_len = drc_pmem_query_stats(p, NULL, 0, 0);
> +	if (buff_len <= 0)
> +		return buff_len;

Generally I can't find anything wrong with this patch technically but the
architecture of drc_pmem_query_stats() seems overly complicated.

IOW, I feel like you are overloading drc_pmem_query_stats() in an odd way which
makes it and the callers code confusing.  Why can't you have a separate
function which returns the max buffer length and separate out the logic within
drc_pmem_query_stats() to make it clear how to call plpar_hcall() to get this
information?

Ira

>  
>  	/* Allocate the buffer for phyp where stats are written */
> -	stats = kzalloc(p->stat_buffer_len, GFP_KERNEL);
> +	stats = kzalloc(buff_len, GFP_KERNEL);
>  	if (!stats)
>  		return -ENOMEM;
>  
>  	/* Ask phyp to return all dimm perf stats */
> -	rc = drc_pmem_query_stats(p, stats, 0);
> +	rc = drc_pmem_query_stats(p, stats, 0, buff_len);
>  	if (rc)
>  		goto free_stats;
>  	/*
> @@ -891,7 +899,6 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>  	struct nd_region_desc ndr_desc;
>  	unsigned long dimm_flags;
>  	int target_nid, online_nid;
> -	ssize_t stat_size;
>  
>  	p->bus_desc.ndctl = papr_scm_ndctl;
>  	p->bus_desc.module = THIS_MODULE;
> @@ -962,16 +969,6 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>  	list_add_tail(&p->region_list, &papr_nd_regions);
>  	mutex_unlock(&papr_ndr_lock);
>  
> -	/* Try retriving the stat buffer and see if its supported */
> -	stat_size = drc_pmem_query_stats(p, NULL, 0);
> -	if (stat_size > 0) {
> -		p->stat_buffer_len = stat_size;
> -		dev_dbg(&p->pdev->dev, "Max perf-stat size %lu-bytes\n",
> -			p->stat_buffer_len);
> -	} else {
> -		dev_info(&p->pdev->dev, "Dimm performance stats unavailable\n");
> -	}
> -
>  	return 0;
>  
>  err:	nvdimm_bus_unregister(p->bus);
> -- 
> 2.26.2
> 
