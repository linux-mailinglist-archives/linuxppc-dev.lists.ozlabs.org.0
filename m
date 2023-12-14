Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D462812F8D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 12:58:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kbprtAXJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrW8Q6CQ1z3dTl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 22:58:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kbprtAXJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrW7Z4Mgxz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 22:57:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702555066; x=1734091066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GUnCaZjp57aVlMVOSrAN4peRL5/ZFDekjxKE0AmaeVo=;
  b=kbprtAXJ8XzsidEJk7QEksWbzEli4R1e6lHYggTGz4RDsdQrdY3gfiGf
   /BvE0AX+kEDewUIJJPrwn+pU6N45vxZheXZiXpYChhq6a7xtyvDV3EtyL
   s7WpqYh2DNQqMt3Zo0HUkimQQCytBDrCexA4wrnYeQF4QlW8J3nBuhe3W
   R8B73VmxOG3x5/FCPyC82u6apYDdwm429ifHjtvMMTAYborQ/jfvhKa8F
   efqvVyYP+qTVXYro4yz3sXd+shB9TUaftnciv4mR9K8tC9OUVIuyEuxdm
   iltgoz76MlTrViT6S06y40rLQrx1x/gZsR2QdZbaZxwsZNz6jZUDl5sTe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="481304436"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="481304436"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 03:57:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="864995583"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="864995583"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Dec 2023 03:57:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDkLR-000M1P-36;
	Thu, 14 Dec 2023 11:57:37 +0000
Date: Thu, 14 Dec 2023 19:56:45 +0800
From: kernel test robot <lkp@intel.com>
To: Gaurav Batra <gbatra@linux.vnet.ibm.com>, mpe@ellerman.id.au
Subject: Re: [PATCH] powerpc/pseries/iommu: IOMMU table is not initialized
 for kdump over SR-IOV
Message-ID: <202312141941.Qraw6P8l-lkp@intel.com>
References: <20231213195233.10329-1-gbatra@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213195233.10329-1-gbatra@linux.vnet.ibm.com>
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
Cc: brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, Gaurav Batra <gbatra@linux.vnet.ibm.com>, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Gaurav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.7-rc5 next-20231214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gaurav-Batra/powerpc-pseries-iommu-IOMMU-table-is-not-initialized-for-kdump-over-SR-IOV/20231214-035436
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20231213195233.10329-1-gbatra%40linux.vnet.ibm.com
patch subject: [PATCH] powerpc/pseries/iommu: IOMMU table is not initialized for kdump over SR-IOV
config: powerpc64-randconfig-r113-20231214 (https://download.01.org/0day-ci/archive/20231214/202312141941.Qraw6P8l-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312141941.Qraw6P8l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141941.Qraw6P8l-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/pseries/iommu.c:753:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] liobn @@     got unsigned int [usertype] @@
   arch/powerpc/platforms/pseries/iommu.c:753:29: sparse:     expected restricted __be32 [usertype] liobn
   arch/powerpc/platforms/pseries/iommu.c:753:29: sparse:     got unsigned int [usertype]
>> arch/powerpc/platforms/pseries/iommu.c:754:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be64 [usertype] dma_base @@     got unsigned long long [usertype] @@
   arch/powerpc/platforms/pseries/iommu.c:754:32: sparse:     expected restricted __be64 [usertype] dma_base
   arch/powerpc/platforms/pseries/iommu.c:754:32: sparse:     got unsigned long long [usertype]
>> arch/powerpc/platforms/pseries/iommu.c:755:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] tce_shift @@     got unsigned int [usertype] @@
   arch/powerpc/platforms/pseries/iommu.c:755:33: sparse:     expected restricted __be32 [usertype] tce_shift
   arch/powerpc/platforms/pseries/iommu.c:755:33: sparse:     got unsigned int [usertype]
>> arch/powerpc/platforms/pseries/iommu.c:756:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] window_shift @@     got unsigned int [usertype] @@
   arch/powerpc/platforms/pseries/iommu.c:756:36: sparse:     expected restricted __be32 [usertype] window_shift
   arch/powerpc/platforms/pseries/iommu.c:756:36: sparse:     got unsigned int [usertype]
>> arch/powerpc/platforms/pseries/iommu.c:762:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] liobn @@     got unsigned long [addressable] liobn @@
   arch/powerpc/platforms/pseries/iommu.c:762:29: sparse:     expected restricted __be32 [usertype] liobn
   arch/powerpc/platforms/pseries/iommu.c:762:29: sparse:     got unsigned long [addressable] liobn
>> arch/powerpc/platforms/pseries/iommu.c:763:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be64 [usertype] dma_base @@     got unsigned long [addressable] offset @@
   arch/powerpc/platforms/pseries/iommu.c:763:32: sparse:     expected restricted __be64 [usertype] dma_base
   arch/powerpc/platforms/pseries/iommu.c:763:32: sparse:     got unsigned long [addressable] offset
>> arch/powerpc/platforms/pseries/iommu.c:764:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] tce_shift @@     got int @@
   arch/powerpc/platforms/pseries/iommu.c:764:33: sparse:     expected restricted __be32 [usertype] tce_shift
   arch/powerpc/platforms/pseries/iommu.c:764:33: sparse:     got int
>> arch/powerpc/platforms/pseries/iommu.c:765:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] window_shift @@     got int @@
   arch/powerpc/platforms/pseries/iommu.c:765:36: sparse:     expected restricted __be32 [usertype] window_shift
   arch/powerpc/platforms/pseries/iommu.c:765:36: sparse:     got int
>> arch/powerpc/platforms/pseries/iommu.c:800:78: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long liobn @@     got restricted __be32 [addressable] [usertype] liobn @@
   arch/powerpc/platforms/pseries/iommu.c:800:78: sparse:     expected unsigned long liobn
   arch/powerpc/platforms/pseries/iommu.c:800:78: sparse:     got restricted __be32 [addressable] [usertype] liobn
>> arch/powerpc/platforms/pseries/iommu.c:801:37: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned long win_addr @@     got restricted __be64 [addressable] [usertype] dma_base @@
   arch/powerpc/platforms/pseries/iommu.c:801:37: sparse:     expected unsigned long win_addr
   arch/powerpc/platforms/pseries/iommu.c:801:37: sparse:     got restricted __be64 [addressable] [usertype] dma_base
>> arch/powerpc/platforms/pseries/iommu.c:801:60: sparse: sparse: restricted __be32 degrades to integer
>> arch/powerpc/platforms/pseries/iommu.c:802:37: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected unsigned long page_shift @@     got restricted __be32 [addressable] [usertype] tce_shift @@
   arch/powerpc/platforms/pseries/iommu.c:802:37: sparse:     expected unsigned long page_shift
   arch/powerpc/platforms/pseries/iommu.c:802:37: sparse:     got restricted __be32 [addressable] [usertype] tce_shift
>> arch/powerpc/platforms/pseries/iommu.c:808:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] tce32_start @@     got restricted __be64 [addressable] [usertype] dma_base @@
   arch/powerpc/platforms/pseries/iommu.c:808:48: sparse:     expected unsigned int [usertype] tce32_start
   arch/powerpc/platforms/pseries/iommu.c:808:48: sparse:     got restricted __be64 [addressable] [usertype] dma_base
   arch/powerpc/platforms/pseries/iommu.c:809:61: sparse: sparse: restricted __be32 degrades to integer
   arch/powerpc/platforms/pseries/iommu.c:1594:77: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long liobn @@     got restricted __be32 [addressable] [usertype] liobn @@
   arch/powerpc/platforms/pseries/iommu.c:1594:77: sparse:     expected unsigned long liobn
   arch/powerpc/platforms/pseries/iommu.c:1594:77: sparse:     got restricted __be32 [addressable] [usertype] liobn
   arch/powerpc/platforms/pseries/iommu.c:1595:37: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned long win_addr @@     got restricted __be64 [addressable] [usertype] dma_base @@
   arch/powerpc/platforms/pseries/iommu.c:1595:37: sparse:     expected unsigned long win_addr
   arch/powerpc/platforms/pseries/iommu.c:1595:37: sparse:     got restricted __be64 [addressable] [usertype] dma_base
   arch/powerpc/platforms/pseries/iommu.c:1595:60: sparse: sparse: restricted __be32 degrades to integer
   arch/powerpc/platforms/pseries/iommu.c:1596:37: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected unsigned long page_shift @@     got restricted __be32 [addressable] [usertype] tce_shift @@
   arch/powerpc/platforms/pseries/iommu.c:1596:37: sparse:     expected unsigned long page_shift
   arch/powerpc/platforms/pseries/iommu.c:1596:37: sparse:     got restricted __be32 [addressable] [usertype] tce_shift
   arch/powerpc/platforms/pseries/iommu.c:1602:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] tce32_start @@     got restricted __be64 [addressable] [usertype] dma_base @@
   arch/powerpc/platforms/pseries/iommu.c:1602:47: sparse:     expected unsigned int [usertype] tce32_start
   arch/powerpc/platforms/pseries/iommu.c:1602:47: sparse:     got restricted __be64 [addressable] [usertype] dma_base
   arch/powerpc/platforms/pseries/iommu.c:1603:60: sparse: sparse: restricted __be32 degrades to integer
   arch/powerpc/platforms/pseries/iommu.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +753 arch/powerpc/platforms/pseries/iommu.c

   698	
   699	/*
   700	 * Find nearest ibm,dma-window (default DMA window) or direct DMA window or
   701	 * dynamic 64bit DMA window, walking up the device tree.
   702	 */
   703	static struct device_node *pci_dma_find(struct device_node *dn,
   704						struct dynamic_dma_window_prop *prop)
   705	{
   706		const __be32 *default_prop = NULL;
   707		const __be32 *ddw_prop = NULL;
   708		struct device_node *rdn = NULL;
   709		bool default_win = false, ddw_win = false;
   710	
   711		for ( ; dn && PCI_DN(dn); dn = dn->parent) {
   712			default_prop = of_get_property(dn, "ibm,dma-window", NULL);
   713			if (default_prop) {
   714				rdn = dn;
   715				default_win = true;
   716			}
   717			ddw_prop = of_get_property(dn, DIRECT64_PROPNAME, NULL);
   718			if (ddw_prop) {
   719				rdn = dn;
   720				ddw_win = true;
   721				break;
   722			}
   723			ddw_prop = of_get_property(dn, DMA64_PROPNAME, NULL);
   724			if (ddw_prop) {
   725				rdn = dn;
   726				ddw_win = true;
   727				break;
   728			}
   729	
   730			/* At least found default window, which is the case for normal boot */
   731			if (default_win)
   732				break;
   733		}
   734	
   735		/* For PCI devices there will always be a DMA window, either on the device
   736		 * or parent bus
   737		 */
   738		WARN_ON(!(default_win | ddw_win));
   739	
   740		/* caller doesn't want to get DMA window property */
   741		if (!prop)
   742			return rdn;
   743	
   744		/* parse DMA window property. During normal system boot, only default
   745		 * DMA window is passed in OF. But, for kdump, a dedicated adapter might
   746		 * have both default and DDW in FDT. In this scenario, DDW takes precedence
   747		 * over default window.
   748		 */
   749		if (ddw_win) {
   750			struct dynamic_dma_window_prop *p;
   751	
   752			p = (struct dynamic_dma_window_prop *)ddw_prop;
 > 753			prop->liobn = be32_to_cpu(p->liobn);
 > 754			prop->dma_base = be64_to_cpu(p->dma_base);
 > 755			prop->tce_shift = be32_to_cpu(p->tce_shift);
 > 756			prop->window_shift = be32_to_cpu(p->window_shift);
   757		} else if (default_win) {
   758			unsigned long offset, size, liobn;
   759	
   760			of_parse_dma_window(rdn, default_prop, &liobn, &offset, &size);
   761	
 > 762			prop->liobn = liobn;
 > 763			prop->dma_base = offset;
 > 764			prop->tce_shift = IOMMU_PAGE_SHIFT_4K;
 > 765			prop->window_shift = order_base_2(size);
   766		}
   767	
   768		return rdn;
   769	}
   770	
   771	static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
   772	{
   773		struct iommu_table *tbl;
   774		struct device_node *dn, *pdn;
   775		struct pci_dn *ppci;
   776		struct dynamic_dma_window_prop prop;
   777	
   778		dn = pci_bus_to_OF_node(bus);
   779	
   780		pr_debug("pci_dma_bus_setup_pSeriesLP: setting up bus %pOF\n",
   781			 dn);
   782	
   783		pdn = pci_dma_find(dn, &prop);
   784	
   785		/* In PPC architecture, there will always be DMA window on bus or one of the
   786		 * parent bus. During reboot, there will be ibm,dma-window property to
   787		 * define DMA window. For kdump, there will at least be default window or DDW
   788		 * or both.
   789		 */
   790	
   791		ppci = PCI_DN(pdn);
   792	
   793		pr_debug("  parent is %pOF, iommu_table: 0x%p\n",
   794			 pdn, ppci->table_group);
   795	
   796		if (!ppci->table_group) {
   797			ppci->table_group = iommu_pseries_alloc_group(ppci->phb->node);
   798			tbl = ppci->table_group->tables[0];
   799	
 > 800			iommu_table_setparms_common(tbl, ppci->phb->bus->number, prop.liobn,
 > 801					prop.dma_base, 1ULL << prop.window_shift,
 > 802					prop.tce_shift, NULL, &iommu_table_lpar_multi_ops);
   803	
   804			/* Only for normal boot with default window. Doesn't matter even
   805			 * if we set these with DDW which is 64bit during kdump, since
   806			 * these will not be used during kdump.
   807			 */
 > 808			ppci->table_group->tce32_start = prop.dma_base;
   809			ppci->table_group->tce32_size = 1ULL << prop.window_shift;
   810	
   811			if (!iommu_init_table(tbl, ppci->phb->node, 0, 0))
   812				panic("Failed to initialize iommu table");
   813	
   814			iommu_register_group(ppci->table_group,
   815					pci_domain_nr(bus), 0);
   816			pr_debug("  created table: %p\n", ppci->table_group);
   817		}
   818	}
   819	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
