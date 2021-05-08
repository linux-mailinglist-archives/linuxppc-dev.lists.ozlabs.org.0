Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50956377285
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 17:12:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcrQH2qfHz308g
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 May 2021 01:12:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FcrPr6pPpz2yYV
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 May 2021 01:11:39 +1000 (AEST)
IronPort-SDR: gykglH7irlP4kuMQjQH4TTxnzfa3DhZ4+XEsNfQ1GAn98muWSAaMGBQ+N56aYl5Z9J9dBnpVNq
 JcI2Ihbw4p1A==
X-IronPort-AV: E=McAfee;i="6200,9189,9978"; a="186376798"
X-IronPort-AV: E=Sophos;i="5.82,283,1613462400"; d="scan'208";a="186376798"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2021 08:11:33 -0700
IronPort-SDR: v0IxB0OVabyrdXvmG070D8sDxtMPisZuxqlscS2UBywrGOWr5pmkX4wOPWThazHWlep5JWFlLW
 ne1wEoftkyhw==
X-IronPort-AV: E=Sophos;i="5.82,283,1613462400"; d="scan'208";a="435407452"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2021 08:11:32 -0700
Date: Sat, 8 May 2021 08:11:30 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/papr_scm: Reduce error severity if nvdimm
 stats inaccessible
Message-ID: <20210508151130.GK1904484@iweiny-DESK2.sc.intel.com>
References: <20210508043642.114076-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508043642.114076-1-vaibhav@linux.ibm.com>
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
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 08, 2021 at 10:06:42AM +0530, Vaibhav Jain wrote:
> Currently drc_pmem_qeury_stats() generates a dev_err in case
> "Enable Performance Information Collection" feature is disabled from
> HMC or performance stats are not available for an nvdimm. The error is
> of the form below:
> 
> papr_scm ibm,persistent-memory:ibm,pmemory@44104001: Failed to query
> 	 performance stats, Err:-10
> 
> This error message confuses users as it implies a possible problem
> with the nvdimm even though its due to a disabled/unavailable
> feature. We fix this by explicitly handling the H_AUTHORITY and
> H_UNSUPPORTED errors from the H_SCM_PERFORMANCE_STATS hcall.
> 
> In case of H_AUTHORITY error an info message is logged instead of an
> error, saying that "Permission denied while accessing performance
> stats" and an EPERM error is returned back.
> 
> In case of H_UNSUPPORTED error we return a EOPNOTSUPP error back from
> drc_pmem_query_stats() indicating that performance stats-query
> operation is not supported on this nvdimm.
> 
> Fixes: 2d02bf835e57('powerpc/papr_scm: Fetch nvdimm performance stats from PHYP')
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
> Changelog
> 
> v3:
> * Return EOPNOTSUPP error in case of H_UNSUPPORTED [ Ira ]
> * Return EPERM in case of H_AUTHORITY [ Ira ]
> * Updated patch description
> 
> v2:
> * Updated the message logged in case of H_AUTHORITY error [ Ira ]
> * Switched from dev_warn to dev_info in case of H_AUTHORITY error.
> * Instead of -EPERM return -EACCESS for H_AUTHORITY error.
> * Added explicit handling of H_UNSUPPORTED error.
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index ef26fe40efb0..e2b69cc3beaf 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -310,6 +310,13 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
>  		dev_err(&p->pdev->dev,
>  			"Unknown performance stats, Err:0x%016lX\n", ret[0]);
>  		return -ENOENT;
> +	} else if (rc == H_AUTHORITY) {
> +		dev_info(&p->pdev->dev,
> +			 "Permission denied while accessing performance stats");
> +		return -EPERM;
> +	} else if (rc == H_UNSUPPORTED) {
> +		dev_dbg(&p->pdev->dev, "Performance stats unsupported\n");
> +		return -EOPNOTSUPP;
>  	} else if (rc != H_SUCCESS) {
>  		dev_err(&p->pdev->dev,
>  			"Failed to query performance stats, Err:%lld\n", rc);
> -- 
> 2.31.1
> 
