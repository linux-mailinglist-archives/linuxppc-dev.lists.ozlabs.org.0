Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28662E7B4D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 22:23:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47274M6C6fzDrfX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 08:23:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47272W6cD0zDr6b
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 08:21:45 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 14:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,241,1569308400"; d="scan'208";a="210961210"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2019 14:21:42 -0700
Date: Mon, 28 Oct 2019 14:21:42 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 1/4] libnvdimm/namespace: Make namespace size
 validation arch dependent
Message-ID: <20191028212142.GB9826@iweiny-DESK2.sc.intel.com>
References: <20191028094825.21448-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191028094825.21448-1-aneesh.kumar@linux.ibm.com>
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
Cc: dan.j.williams@intel.com, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> diff --git a/arch/powerpc/lib/pmem.c b/arch/powerpc/lib/pmem.c
> index 377712e85605..2e661a08dae5 100644
> --- a/arch/powerpc/lib/pmem.c
> +++ b/arch/powerpc/lib/pmem.c
> @@ -17,14 +17,31 @@ void arch_wb_cache_pmem(void *addr, size_t size)
>  	unsigned long start = (unsigned long) addr;
>  	flush_dcache_range(start, start + size);
>  }
> -EXPORT_SYMBOL(arch_wb_cache_pmem);
> +EXPORT_SYMBOL_GPL(arch_wb_cache_pmem);

Unrelated change?

Ira

