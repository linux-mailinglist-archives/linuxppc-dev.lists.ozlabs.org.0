Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 593258C82DD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 11:00:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fgC15gP4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vggs85TL4z3c4h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 19:00:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fgC15gP4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VggrR0j5Cz30TW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 18:59:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715936376; x=1747472376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tDevXAGevQb8POD1JVF8r52tgc8CfSu2xWeWmunzyuc=;
  b=fgC15gP4l7fj9Tk85le6DcnvsAZLUr3Zau27jgOt+phXbw1SPMVdopKa
   w9cDfnChDWxZr2893bjB07BkTbAo/mHa8Nev+m9FQ/AD/OgmOQlScohR1
   NaDFRrmDTzyVd8D7q9OXXJQZEWlEy0R2fHSRyRveykyteyUYCw0t6Gaqr
   lhuR1ar0OqRsDhur4ujqV5cwfE3CzWlF2m044RgvpC4OTfHuzczMt4+kt
   0e9+b5z8NY0/8BIsH9vbuzccqiAs5Nydql8LetACFsvBMFpSNJ0Q5t/1j
   x5ftOPgwmbnPeUVCueeN0C1Kkw9TtgCXMdS6BWXsETdc3dj1UloOk2xOv
   g==;
X-CSE-ConnectionGUID: JEu72F6mTwmw/VsWhm2lMw==
X-CSE-MsgGUID: VQQVCsOfSzmfLsQanSxQ/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11972575"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="11972575"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 01:59:28 -0700
X-CSE-ConnectionGUID: rwKwmD9sQQ6rhcbUB/hDvQ==
X-CSE-MsgGUID: ycY1XvnvSlqQdl3uObA1Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; 
   d="scan'208";a="31823556"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 17 May 2024 01:59:26 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7tQu-0000Uv-1z;
	Fri, 17 May 2024 08:59:21 +0000
Date: Fri, 17 May 2024 16:58:21 +0800
From: kernel test robot <lkp@intel.com>
To: Nilay Shroff <nilay@linux.ibm.com>, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu,
	naveen.n.rao@linux.ibm.com
Subject: Re: [PATCH 1/1] powerpc/numa: Online a node if PHB is attached.
Message-ID: <202405171615.NBRa8Poe-lkp@intel.com>
References: <20240516081230.3119651-2-nilay@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516081230.3119651-2-nilay@linux.ibm.com>
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
Cc: Nilay Shroff <nilay@linux.ibm.com>, llvm@lists.linux.dev, sshegde@linux.ibm.com, gjoyce@linux.ibm.com, srikar@linux.ibm.com, oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nilay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.9 next-20240517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nilay-Shroff/powerpc-numa-Online-a-node-if-PHB-is-attached/20240516-201619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20240516081230.3119651-2-nilay%40linux.ibm.com
patch subject: [PATCH 1/1] powerpc/numa: Online a node if PHB is attached.
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240517/202405171615.NBRa8Poe-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d3455f4ddd16811401fa153298fadd2f59f6914e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405171615.NBRa8Poe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405171615.NBRa8Poe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/mm/numa.c:10:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/mm/numa.c:1017:7: warning: variable 'nid' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1017 |                 if (associativity) {
         |                     ^~~~~~~~~~~~~
   arch/powerpc/mm/numa.c:1021:14: note: uninitialized use occurs here
    1021 |                 if (likely(nid >= 0) && !node_online(nid))
         |                            ^~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   arch/powerpc/mm/numa.c:1017:3: note: remove the 'if' if its condition is always true
    1017 |                 if (associativity) {
         |                 ^~~~~~~~~~~~~~~~~~
   arch/powerpc/mm/numa.c:1014:10: note: initialize the variable 'nid' to silence this warning
    1014 |                 int nid;
         |                        ^
         |                         = 0
   6 warnings generated.


vim +1017 arch/powerpc/mm/numa.c

   896	
   897	static int __init parse_numa_properties(void)
   898	{
   899		struct device_node *memory, *pci;
   900		int default_nid = 0;
   901		unsigned long i;
   902		const __be32 *associativity;
   903	
   904		if (numa_enabled == 0) {
   905			pr_warn("disabled by user\n");
   906			return -1;
   907		}
   908	
   909		primary_domain_index = find_primary_domain_index();
   910	
   911		if (primary_domain_index < 0) {
   912			/*
   913			 * if we fail to parse primary_domain_index from device tree
   914			 * mark the numa disabled, boot with numa disabled.
   915			 */
   916			numa_enabled = false;
   917			return primary_domain_index;
   918		}
   919	
   920		pr_debug("associativity depth for CPU/Memory: %d\n", primary_domain_index);
   921	
   922		/*
   923		 * If it is FORM2 initialize the distance table here.
   924		 */
   925		if (affinity_form == FORM2_AFFINITY)
   926			initialize_form2_numa_distance_lookup_table();
   927	
   928		/*
   929		 * Even though we connect cpus to numa domains later in SMP
   930		 * init, we need to know the node ids now. This is because
   931		 * each node to be onlined must have NODE_DATA etc backing it.
   932		 */
   933		for_each_present_cpu(i) {
   934			__be32 vphn_assoc[VPHN_ASSOC_BUFSIZE];
   935			struct device_node *cpu;
   936			int nid = NUMA_NO_NODE;
   937	
   938			memset(vphn_assoc, 0, VPHN_ASSOC_BUFSIZE * sizeof(__be32));
   939	
   940			if (__vphn_get_associativity(i, vphn_assoc) == 0) {
   941				nid = associativity_to_nid(vphn_assoc);
   942				initialize_form1_numa_distance(vphn_assoc);
   943			} else {
   944	
   945				/*
   946				 * Don't fall back to default_nid yet -- we will plug
   947				 * cpus into nodes once the memory scan has discovered
   948				 * the topology.
   949				 */
   950				cpu = of_get_cpu_node(i, NULL);
   951				BUG_ON(!cpu);
   952	
   953				associativity = of_get_associativity(cpu);
   954				if (associativity) {
   955					nid = associativity_to_nid(associativity);
   956					initialize_form1_numa_distance(associativity);
   957				}
   958				of_node_put(cpu);
   959			}
   960	
   961			/* node_set_online() is an UB if 'nid' is negative */
   962			if (likely(nid >= 0))
   963				node_set_online(nid);
   964		}
   965	
   966		get_n_mem_cells(&n_mem_addr_cells, &n_mem_size_cells);
   967	
   968		for_each_node_by_type(memory, "memory") {
   969			unsigned long start;
   970			unsigned long size;
   971			int nid;
   972			int ranges;
   973			const __be32 *memcell_buf;
   974			unsigned int len;
   975	
   976			memcell_buf = of_get_property(memory,
   977				"linux,usable-memory", &len);
   978			if (!memcell_buf || len <= 0)
   979				memcell_buf = of_get_property(memory, "reg", &len);
   980			if (!memcell_buf || len <= 0)
   981				continue;
   982	
   983			/* ranges in cell */
   984			ranges = (len >> 2) / (n_mem_addr_cells + n_mem_size_cells);
   985	new_range:
   986			/* these are order-sensitive, and modify the buffer pointer */
   987			start = read_n_cells(n_mem_addr_cells, &memcell_buf);
   988			size = read_n_cells(n_mem_size_cells, &memcell_buf);
   989	
   990			/*
   991			 * Assumption: either all memory nodes or none will
   992			 * have associativity properties.  If none, then
   993			 * everything goes to default_nid.
   994			 */
   995			associativity = of_get_associativity(memory);
   996			if (associativity) {
   997				nid = associativity_to_nid(associativity);
   998				initialize_form1_numa_distance(associativity);
   999			} else
  1000				nid = default_nid;
  1001	
  1002			fake_numa_create_new_node(((start + size) >> PAGE_SHIFT), &nid);
  1003			node_set_online(nid);
  1004	
  1005			size = numa_enforce_memory_limit(start, size);
  1006			if (size)
  1007				memblock_set_node(start, size, &memblock.memory, nid);
  1008	
  1009			if (--ranges)
  1010				goto new_range;
  1011		}
  1012	
  1013		for_each_node_by_name(pci, "pci") {
  1014			int nid;
  1015	
  1016			associativity = of_get_associativity(pci);
> 1017			if (associativity) {
  1018				nid = associativity_to_nid(associativity);
  1019				initialize_form1_numa_distance(associativity);
  1020			}
  1021			if (likely(nid >= 0) && !node_online(nid))
  1022				node_set_online(nid);
  1023		}
  1024	
  1025		/*
  1026		 * Now do the same thing for each MEMBLOCK listed in the
  1027		 * ibm,dynamic-memory property in the
  1028		 * ibm,dynamic-reconfiguration-memory node.
  1029		 */
  1030		memory = of_find_node_by_path("/ibm,dynamic-reconfiguration-memory");
  1031		if (memory) {
  1032			walk_drmem_lmbs(memory, NULL, numa_setup_drmem_lmb);
  1033			of_node_put(memory);
  1034		}
  1035	
  1036		return 0;
  1037	}
  1038	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
