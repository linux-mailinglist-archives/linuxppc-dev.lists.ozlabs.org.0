Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF612621EE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 23:29:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmJFJ3SvnzDqT7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 07:29:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmJCd38J5zDqFv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 07:27:56 +1000 (AEST)
IronPort-SDR: pH7ViE9Sab35HC0qVC6q0vKcHboiYK4DK5b+FWf2IPpx12W5EPRPlXLpo+PqyybBfetbFQ/vl7
 mC7/wbCmNZyQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="145949034"
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; d="scan'208";a="145949034"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 14:27:53 -0700
IronPort-SDR: hwcjq7Pqa0jT08ahd3lviO5aItJ8tdYYEohvQkRbr5SMQYLLE0tI/WJR/vWuSO8HZXglMKmkMe
 GDGZw9vyLKtw==
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; d="scan'208";a="299929072"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 14:27:52 -0700
Date: Tue, 8 Sep 2020 14:27:52 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/papr_scm: Limit the readability of
 'perf_stats' sysfs attribute
Message-ID: <20200908212752.GD1930795@iweiny-DESK2.sc.intel.com>
References: <20200907110540.21349-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907110540.21349-1-vaibhav@linux.ibm.com>
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

On Mon, Sep 07, 2020 at 04:35:40PM +0530, Vaibhav Jain wrote:
> The newly introduced 'perf_stats' attribute uses the default access
> mode of 0444 letting non-root users access performance stats of an
> nvdimm and potentially force the kernel into issuing large number of
> expensive HCALLs. Since the information exposed by this attribute
> cannot be cached hence its better to ward of access to this attribute
	                                   ^^^
                                           off?

> from users who don't need to access these performance statistics.
> 
> Hence this patch updates access mode of 'perf_stats' attribute to
> be only readable by root users.

Generally it is bad form to say "this patch".  See 4c here:

	-- https://www.ozlabs.org/~akpm/stuff/tpp.txt

But I'm not picky...  :-D

With the s/of/off/ change:

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> 
> Fixes: 2d02bf835e573 ('powerpc/papr_scm: Fetch nvdimm performance stats from PHYP')
> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Change-log:
> 
> v2:
> * Instead of checking for perfmon_capable() inside show_perf_stats()
>   set the attribute as DEVICE_ATTR_ADMIN_RO [ Aneesh ]
> * Update patch description
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index f439f0dfea7d1..a88a707a608aa 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -822,7 +822,7 @@ static ssize_t perf_stats_show(struct device *dev,
>  	kfree(stats);
>  	return rc ? rc : seq_buf_used(&s);
>  }
> -DEVICE_ATTR_RO(perf_stats);
> +DEVICE_ATTR_ADMIN_RO(perf_stats);
>  
>  static ssize_t flags_show(struct device *dev,
>  			  struct device_attribute *attr, char *buf)
> -- 
> 2.26.2
> 
