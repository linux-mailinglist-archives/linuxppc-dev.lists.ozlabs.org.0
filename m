Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1039B269259
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 19:00:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bqt003DwBzDqQD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 03:00:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqswB4QFVzDqQd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 02:56:58 +1000 (AEST)
IronPort-SDR: 3Ke1YT78hXlbCaT4Fn6G6Ertsnja32jbnLpJZEDhOhyIw3lmQejdClp8DoYIrvSa0bamm32z35
 ZP5FRULZzucw==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="138620976"
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; d="scan'208";a="138620976"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 09:56:53 -0700
IronPort-SDR: 1elZDarvcU/adqLVTkrYsmnYHdvq4E8ulCDMYnwJBf5jGbo3QR82RAnDsqXGXSsnbX6wwObEj0
 n2gbPp/OdvGA==
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; d="scan'208";a="482421078"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 09:56:52 -0700
Date: Mon, 14 Sep 2020 09:56:51 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/papr_scm: Fix warning triggered by
 perf_stats_show()
Message-ID: <20200914165651.GR1930795@iweiny-DESK2.sc.intel.com>
References: <20200912081451.66225-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200912081451.66225-1-vaibhav@linux.ibm.com>
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

On Sat, Sep 12, 2020 at 01:44:51PM +0530, Vaibhav Jain wrote:
> A warning is reported by the kernel in case perf_stats_show() returns
> an error code. The warning is of the form below:
> 
>  papr_scm ibm,persistent-memory:ibm,pmemory@44100001:
>  	  Failed to query performance stats, Err:-10
>  dev_attr_show: perf_stats_show+0x0/0x1c0 [papr_scm] returned bad count
>  fill_read_buffer: dev_attr_show+0x0/0xb0 returned bad count
> 
> On investigation it looks like that the compiler is silently truncating the
> return value of drc_pmem_query_stats() from 'long' to 'int', since the
> variable used to store the return code 'rc' is an 'int'. This
> truncated value is then returned back as a 'ssize_t' back from
> perf_stats_show() to 'dev_attr_show()' which thinks of it as a large
> unsigned number and triggers this warning..
> 
> To fix this we update the type of variable 'rc' from 'int' to
> 'ssize_t' that prevents the compiler from truncating the return value
> of drc_pmem_query_stats() and returning correct signed value back from
> perf_stats_show().
> 
> Fixes: 2d02bf835e573 ('powerpc/papr_scm: Fetch nvdimm performance
>        stats from PHYP')
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
> Changelog:
> 
> v2: Added an explicit cast to the expression calling 'seq_buf_used()'
>     and triggering this issue. [ Ira ]
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index a88a707a608aa..5493bc847bd08 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -785,7 +785,8 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
>  static ssize_t perf_stats_show(struct device *dev,
>  			       struct device_attribute *attr, char *buf)
>  {
> -	int index, rc;
> +	int index;
> +	ssize_t rc;
>  	struct seq_buf s;
>  	struct papr_scm_perf_stat *stat;
>  	struct papr_scm_perf_stats *stats;
> @@ -820,7 +821,7 @@ static ssize_t perf_stats_show(struct device *dev,
>  
>  free_stats:
>  	kfree(stats);
> -	return rc ? rc : seq_buf_used(&s);
> +	return rc ? rc : (ssize_t)seq_buf_used(&s);
>  }
>  DEVICE_ATTR_ADMIN_RO(perf_stats);
>  
> -- 
> 2.26.2
> 
