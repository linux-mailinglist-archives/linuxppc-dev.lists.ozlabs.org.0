Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB15C54FBDD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 19:07:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPlp255Swz3cdT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 03:07:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nqND4K85;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nqND4K85;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPlnM5dKYz3bXn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 03:06:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655485592; x=1687021592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O0OzaZWt5JBpgO+HWeUig13mrHT0bkF4JZGnMqUmzAI=;
  b=nqND4K85z1kojFg4OmhvYN++Df1g5VQeyyWxbfA3psB9b7a7uceihPhw
   TmAyuq629gZW47GLVGi48XfhpRKpNB2OSLcsDk6VYv8/bEU1JlpAPKeK0
   XRL3LHL29CxWiL/GgUS1DbkOLxeb+XzMDpL6CBUGTEL4Pe9u3y9TNMDj5
   2943wBc3gYAXYBSQuq24MXPqA32y9mTNhvxV2IcCbatvoG1vvMFgGwnXo
   ldyj983qTO9nzxY7YYbeqs67y6LhDl+Sr3ES9q9CJPD6Is/owiU6NY+oR
   GucM+qQSjrsT7I1lY+Ny1uwFEXZsI73cL5cWCbM7G0eyPc3qPH9Kdgx3n
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259328832"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="259328832"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2022 04:26:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="675457992"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2022 04:26:40 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o2A7b-000PP9-Vz;
	Fri, 17 Jun 2022 11:26:39 +0000
Date: Fri, 17 Jun 2022 19:26:21 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Kravetz <mike.kravetz@oracle.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/4] hugetlb: skip to end of PT page mapping when pte not
 present
Message-ID: <202206171929.ZIUrNg6p-lkp@intel.com>
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
Cc: Mina Almasry <almasrymina@google.com>, Michal Hocko <mhocko@suse.com>, kbuild-all@lists.01.org, will@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com, llvm@lists.linux.dev, Peter Xu <peterx@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Linux Memory Management List <linux-mm@kvack.org>, James Houghton <jthoughton@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Muchun Song <songmuchun@bytedance.com>, Andrew Morton <akpm@linux-foundation.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Naoya Horiguchi <naoya.horiguchi@linux.dev>, Mike Kravetz <mike.kravetz@oracle.com>
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
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220617/202206171929.ZIUrNg6p-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f0e608de27b3d568000046eebf3712ab542979d6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4c647687607f10fece04967b8180c0dadaf765e6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mike-Kravetz/hugetlb-speed-up-linear-address-scanning/20220617-050726
        git checkout 4c647687607f10fece04967b8180c0dadaf765e6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/hugetlb.c:6901:7: error: duplicate case value '4194304'
           case PUD_SIZE:
                ^
   include/asm-generic/pgtable-nopud.h:20:20: note: expanded from macro 'PUD_SIZE'
   #define PUD_SIZE        (1UL << PUD_SHIFT)
                           ^
   mm/hugetlb.c:6899:7: note: previous case defined here
           case P4D_SIZE:
                ^
   include/asm-generic/pgtable-nop4d.h:13:19: note: expanded from macro 'P4D_SIZE'
   #define P4D_SIZE                (1UL << P4D_SHIFT)
                                   ^
   mm/hugetlb.c:6903:7: error: duplicate case value '4194304'
           case PMD_SIZE:
                ^
   include/asm-generic/pgtable-nopmd.h:22:20: note: expanded from macro 'PMD_SIZE'
   #define PMD_SIZE        (1UL << PMD_SHIFT)
                           ^
   mm/hugetlb.c:6901:7: note: previous case defined here
           case PUD_SIZE:
                ^
   include/asm-generic/pgtable-nopud.h:20:20: note: expanded from macro 'PUD_SIZE'
   #define PUD_SIZE        (1UL << PUD_SHIFT)
                           ^
   2 errors generated.


vim +/4194304 +6901 mm/hugetlb.c

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
