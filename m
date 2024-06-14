Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE360908C6D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 15:25:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A+kGI5+W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W10Ql5WhMz3cYC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 23:25:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A+kGI5+W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W10Q157xqz3cVY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 23:25:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718371515; x=1749907515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PodNgtK+CFxkcM1xg2YMWxubqXt7QosyFJw5EQkc+Os=;
  b=A+kGI5+WQ5Y6NfMl1LPwDDa323ziMo1rW+3GRD9Lh5EZYGLaKjNWSHP9
   dE2VHWJUDHMwg8KhkB+jjs6PnCM2Z2KP4jufHD8PzvO3LB1uyUwXiEgEo
   pReyrYXWwRrOtmDFJzoEYS8cl0znZ3cErD2CSl3CwdG2MgkajqEx/BMSS
   s7pUUfi+TqvKrVbY6za1+A1hk+rlfbtDxBaX/hQlPd0P7tJo/bvF7mjfA
   dbTknipl3JeaB/sT78GWijg8rJg0YJtG+3IlPcIqohaGi4/FLGXz4Tv/t
   W6sWyDNL8a2QUhDN+4mnMIIB33zMn1ShWP1cSAocgVvYzTmoSXIUHNc0K
   g==;
X-CSE-ConnectionGUID: Xck8dvz8SAGMkVQ1YrLA8A==
X-CSE-MsgGUID: VqDBH1pJRZKNKBs8D+kmaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15380531"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="15380531"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 06:25:09 -0700
X-CSE-ConnectionGUID: 8QN9I4/STiyppCp86fjhJg==
X-CSE-MsgGUID: oLaBGBtXR2aEW9t2ihg8PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="40635695"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jun 2024 06:25:03 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI6vM-0001Ln-0t;
	Fri, 14 Jun 2024 13:25:00 +0000
Date: Fri, 14 Jun 2024 21:24:07 +0800
From: kernel test robot <lkp@intel.com>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, mpe@ellerman.id.au,
	tpearson@raptorengineering.com, alex.williamson@redhat.com,
	linuxppc-dev@lists.ozlabs.org, aik@amd.com
Subject: Re: [PATCH v3 6/6] powerpc/iommu: Reimplement the
 iommu_table_group_ops for pSeries
Message-ID: <202406142110.r97Ts8Xm-lkp@intel.com>
References: <171810901192.1721.18057294492426295643.stgit@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171810901192.1721.18057294492426295643.stgit@linux.ibm.com>
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
Cc: svaidy@linux.ibm.com, robh@kernel.org, jroedel@suse.de, sbhat@linux.ibm.com, gbatra@linux.vnet.ibm.com, jgg@ziepe.ca, aik@ozlabs.ru, ruscur@russell.cc, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, mahesh@linux.ibm.com, aneesh.kumar@kernel.org, brking@linux.vnet.ibm.com, oohall@gmail.com, npiggin@gmail.com, kvm@vger.kernel.org, oe-kbuild-all@lists.linux.dev, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, msuchanek@suse.de, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Shivaprasad,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/fixes]
[also build test ERROR on awilliam-vfio/next awilliam-vfio/for-linus linus/master v6.10-rc3]
[cannot apply to powerpc/next next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shivaprasad-G-Bhat/powerpc-iommu-Move-pSeries-specific-functions-to-pseries-iommu-c/20240611-203313
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes
patch link:    https://lore.kernel.org/r/171810901192.1721.18057294492426295643.stgit%40linux.ibm.com
patch subject: [PATCH v3 6/6] powerpc/iommu: Reimplement the iommu_table_group_ops for pSeries
config: powerpc64-randconfig-r133-20240614 (https://download.01.org/0day-ci/archive/20240614/202406142110.r97Ts8Xm-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce: (https://download.01.org/0day-ci/archive/20240614/202406142110.r97Ts8Xm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406142110.r97Ts8Xm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/platforms/pseries/iommu.c:16:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/platforms/pseries/iommu.c:1839:47: error: use of undeclared identifier 'dev_has_iommu_table'; did you mean 'device_iommu_capable'?
    1839 |         ret = iommu_group_for_each_dev(group, &pdev, dev_has_iommu_table);
         |                                                      ^~~~~~~~~~~~~~~~~~~
         |                                                      device_iommu_capable
   include/linux/iommu.h:1079:20: note: 'device_iommu_capable' declared here
    1079 | static inline bool device_iommu_capable(struct device *dev, enum iommu_cap cap)
         |                    ^
   arch/powerpc/platforms/pseries/iommu.c:1953:15: warning: variable 'entries_shift' set but not used [-Wunused-but-set-variable]
    1953 |         unsigned int entries_shift;
         |                      ^
   arch/powerpc/platforms/pseries/iommu.c:2166:17: warning: variable 'pci' set but not used [-Wunused-but-set-variable]
    2166 |         struct pci_dn *pci;
         |                        ^
   7 warnings and 1 error generated.


vim +1839 arch/powerpc/platforms/pseries/iommu.c

  1829	
  1830	static struct pci_dev *iommu_group_get_first_pci_dev(struct iommu_group *group)
  1831	{
  1832		struct pci_dev *pdev = NULL;
  1833		int ret;
  1834	
  1835		/* No IOMMU group ? */
  1836		if (!group)
  1837			return NULL;
  1838	
> 1839		ret = iommu_group_for_each_dev(group, &pdev, dev_has_iommu_table);
  1840		if (!ret || !pdev)
  1841			return NULL;
  1842		return pdev;
  1843	}
  1844	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
