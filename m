Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0429354FC36
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 19:29:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPmHS6389z3cFm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 03:29:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L5fM3iAs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L5fM3iAs;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPmGq1J6Nz30LC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 03:28:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655486915; x=1687022915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5r0rapPYszeZBBEbJ/ZlpHIsTYM/ozOqcBVhPIANdrM=;
  b=L5fM3iAsTFlhVd0y0dYAGdyJNOCl6VsgXLCY7CgriNZm8YmCn8RuZUjD
   GE7jVxj0Pw+kGGd6Ij2yrojt3goVxshMJHeFK9VdwrMEnswE+zAert7sh
   u7odKHecAB7D9W6YTXFTZoFsqwsw1hvbE+ZpwIkeof8medymwBncCGHmx
   f9UYEwJFDYoJLS0nln8k2NkuaOQK/vfnWViz0UFD6Wf3wa9Sr6W9Obiqk
   w9EqCaMFxnp08pgqEMGSAyzLCj3Ld9rXu4ACjlghRkzbP6lrjgMu65Cbt
   7be9ox9bBA4jUmTEZDPFhCkbA/+AxPvBMhr9rCe57lLTX4Eqggr/js8lA
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="278306101"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="278306101"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2022 10:06:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="560563793"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 17 Jun 2022 10:06:50 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o2FQn-000Pcp-M0;
	Fri, 17 Jun 2022 17:06:49 +0000
Date: Sat, 18 Jun 2022 01:06:42 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Kravetz <mike.kravetz@oracle.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/4] hugetlb: skip to end of PT page mapping when pte not
 present
Message-ID: <202206180021.rcc4B1by-lkp@intel.com>
References: <20220616210518.125287-2-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616210518.125287-2-mike.kravetz@oracle.com>
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
Cc: Mina Almasry <almasrymina@google.com>, Michal Hocko <mhocko@suse.com>, kbuild-all@lists.01.org, will@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, Paul Walmsley <paul.walmsley@sifive.com>, Peter Xu <peterx@redhat.com>, Linux Memory Management List <linux-mm@kvack.org>, James Houghton <jthoughton@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Muchun Song <songmuchun@bytedance.com>, Andrew Morton <akpm@linux-foundation.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Naoya Horiguchi <naoya.horiguchi@linux.dev>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mike,

I love your patch! Yet something to improve:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v5.19-rc2 next-20220617]
[cannot apply to arm64/for-next/core arm/for-next kvmarm/next xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Kravetz/hugetlb-speed-up-linear-address-scanning/20220617-050726
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20220618/202206180021.rcc4B1by-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/4c647687607f10fece04967b8180c0dadaf765e6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mike-Kravetz/hugetlb-speed-up-linear-address-scanning/20220617-050726
        git checkout 4c647687607f10fece04967b8180c0dadaf765e6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   mm/hugetlb.c: In function 'hugetlb_mask_last_page':
>> mm/hugetlb.c:6901:9: error: duplicate case value
    6901 |         case PUD_SIZE:
         |         ^~~~
   mm/hugetlb.c:6899:9: note: previously used here
    6899 |         case P4D_SIZE:
         |         ^~~~


vim +6901 mm/hugetlb.c

  6886	
  6887	/*
  6888	 * Return a mask that can be used to update an address to the last huge
  6889	 * page in a page table page mapping size.  Used to skip non-present
  6890	 * page table entries when linearly scanning address ranges.  Architectures
  6891	 * with unique huge page to page table relationships can define their own
  6892	 * version of this routine.
  6893	 */
  6894	unsigned long hugetlb_mask_last_page(struct hstate *h)
  6895	{
  6896		unsigned long hp_size = huge_page_size(h);
  6897	
  6898		switch (hp_size) {
  6899		case P4D_SIZE:
  6900			return PGDIR_SIZE - P4D_SIZE;
> 6901		case PUD_SIZE:
  6902			return P4D_SIZE - PUD_SIZE;
  6903		case PMD_SIZE:
  6904			return PUD_SIZE - PMD_SIZE;
  6905		default:
  6906			break; /* Should never happen */
  6907		}
  6908	
  6909		return ~(0UL);
  6910	}
  6911	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
