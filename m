Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E90918334F3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 14:59:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QAEfIEOt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4THJ545CMkz3cTg
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Jan 2024 00:59:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QAEfIEOt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4THJ4B6zKcz3bqC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Jan 2024 00:58:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705759131; x=1737295131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D7c3vMf9ccSBFZdgQbSr1dRX1CxiKZpITQQp7zG1YTU=;
  b=QAEfIEOt5OwfPH/hW78hv4rzMgc/F6NfLbo3J2xl/kNRP6t1bYbj04sn
   mZTL+rr0l1sHhjO+DTcqqR3VotsutM0xD4s13kZnJoHXPhRSZ5dXLXHAI
   HOm2DWL2MiUOZ9ZG6ythNPfPuqm728OwD2mM3h1jGDPLy7rAuMX+72A84
   zoZxCRd0lwYHm5bT/JZM4tmvPm8CmBCKLZr0P7FuKInd/vDSstPda+5zH
   p3YC6aSO/MUQDEU6rlR/6M4LFIxs8BGCljcvzDN1qAaU/XAxV4EcaN0/M
   UbTNWPM3djUwvP2o3at13ycNJ24D0OdZGyXJqt308/B+Ak+vYZfJm76jD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="8314741"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="8314741"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 05:58:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="834696"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Jan 2024 05:58:40 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRBrq-00058A-04;
	Sat, 20 Jan 2024 13:58:38 +0000
Date: Sat, 20 Jan 2024 21:58:16 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/14] arm, crash: wrap crash dumping code into crash
 related ifdefs
Message-ID: <202401202159.9a6W0aOH-lkp@intel.com>
References: <20240119145241.769622-12-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119145241.769622-12-bhe@redhat.com>
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
Cc: linux-s390@vger.kernel.org, Baoquan He <bhe@redhat.com>, piliu@redhat.com, linux-sh@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-mips@vger.kernel.org, ebiederm@xmission.com, loongarch@lists.linux.dev, oe-kbuild-all@lists.linux.dev, hbathini@linux.ibm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Baoquan,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[cannot apply to tip/x86/core arm64/for-next/core powerpc/next powerpc/fixes v6.7 next-20240119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/kexec-split-crashkernel-reservation-code-out-from-crash_core-c/20240119-225820
base:   linus/master
patch link:    https://lore.kernel.org/r/20240119145241.769622-12-bhe%40redhat.com
patch subject: [PATCH v2 11/14] arm, crash: wrap crash dumping code into crash related ifdefs
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240120/202401202159.9a6W0aOH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401202159.9a6W0aOH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401202159.9a6W0aOH-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/kernel/setup.c: In function 'reserve_crashkernel':
>> arch/arm/kernel/setup.c:1036:63: error: 'SECTION_SIZE' undeclared (first use in this function); did you mean 'SECTIONS_SHIFT'?
    1036 |                 start = memblock_phys_alloc_range(crash_size, SECTION_SIZE,
         |                                                               ^~~~~~~~~~~~
         |                                                               SECTIONS_SHIFT
   arch/arm/kernel/setup.c:1036:63: note: each undeclared identifier is reported only once for each function it appears in
   In file included from arch/arm/include/asm/efi.h:12,
                    from arch/arm/kernel/setup.c:37:
   arch/arm/include/asm/fixmap.h: At top level:
   arch/arm/include/asm/fixmap.h:39:35: warning: '__end_of_fixed_addresses' defined but not used [-Wunused-const-variable=]
      39 | static const enum fixed_addresses __end_of_fixed_addresses =
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~


vim +1036 arch/arm/kernel/setup.c

3c57fb43c8fcbe Mika Westerberg 2010-05-10   995  
3c57fb43c8fcbe Mika Westerberg 2010-05-10   996  /**
3c57fb43c8fcbe Mika Westerberg 2010-05-10   997   * reserve_crashkernel() - reserves memory are for crash kernel
3c57fb43c8fcbe Mika Westerberg 2010-05-10   998   *
3c57fb43c8fcbe Mika Westerberg 2010-05-10   999   * This function reserves memory area given in "crashkernel=" kernel command
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1000   * line parameter. The memory reserved is used by a dump capture kernel when
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1001   * primary kernel is crashing.
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1002   */
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1003  static void __init reserve_crashkernel(void)
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1004  {
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1005  	unsigned long long crash_size, crash_base;
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1006  	unsigned long long total_mem;
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1007  	int ret;
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1008  
8f460484669cba Baoquan He      2024-01-19  1009  	if (!IS_ENABLED(CONFIG_CRASH_RESERVE))
8f460484669cba Baoquan He      2024-01-19  1010  		return;
8f460484669cba Baoquan He      2024-01-19  1011  
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1012  	total_mem = get_total_mem();
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1013  	ret = parse_crashkernel(boot_command_line, total_mem,
a9e1a3d84e4a0e Baoquan He      2023-09-14  1014  				&crash_size, &crash_base,
a9e1a3d84e4a0e Baoquan He      2023-09-14  1015  				NULL, NULL);
9d17f337230642 Austin Kim      2022-04-01  1016  	/* invalid value specified or crashkernel=0 */
9d17f337230642 Austin Kim      2022-04-01  1017  	if (ret || !crash_size)
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1018  		return;
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1019  
61603016e2122b Russell King    2016-03-14  1020  	if (crash_base <= 0) {
d0506a2395eb07 Russell King    2016-04-01  1021  		unsigned long long crash_max = idmap_to_phys((u32)~0);
67556d7a851c20 Russell King    2017-07-19  1022  		unsigned long long lowmem_max = __pa(high_memory - 1) + 1;
67556d7a851c20 Russell King    2017-07-19  1023  		if (crash_max > lowmem_max)
67556d7a851c20 Russell King    2017-07-19  1024  			crash_max = lowmem_max;
a7259df7670240 Mike Rapoport   2021-09-02  1025  
a7259df7670240 Mike Rapoport   2021-09-02  1026  		crash_base = memblock_phys_alloc_range(crash_size, CRASH_ALIGN,
a7259df7670240 Mike Rapoport   2021-09-02  1027  						       CRASH_ALIGN, crash_max);
61603016e2122b Russell King    2016-03-14  1028  		if (!crash_base) {
61603016e2122b Russell King    2016-03-14  1029  			pr_err("crashkernel reservation failed - No suitable area found.\n");
61603016e2122b Russell King    2016-03-14  1030  			return;
61603016e2122b Russell King    2016-03-14  1031  		}
61603016e2122b Russell King    2016-03-14  1032  	} else {
a7259df7670240 Mike Rapoport   2021-09-02  1033  		unsigned long long crash_max = crash_base + crash_size;
61603016e2122b Russell King    2016-03-14  1034  		unsigned long long start;
61603016e2122b Russell King    2016-03-14  1035  
a7259df7670240 Mike Rapoport   2021-09-02 @1036  		start = memblock_phys_alloc_range(crash_size, SECTION_SIZE,
a7259df7670240 Mike Rapoport   2021-09-02  1037  						  crash_base, crash_max);
a7259df7670240 Mike Rapoport   2021-09-02  1038  		if (!start) {
61603016e2122b Russell King    2016-03-14  1039  			pr_err("crashkernel reservation failed - memory is in use.\n");
61603016e2122b Russell King    2016-03-14  1040  			return;
61603016e2122b Russell King    2016-03-14  1041  		}
61603016e2122b Russell King    2016-03-14  1042  	}
61603016e2122b Russell King    2016-03-14  1043  
1b0f6681fcbc0e Olof Johansson  2013-12-05  1044  	pr_info("Reserving %ldMB of memory at %ldMB for crashkernel (System RAM: %ldMB)\n",
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1045  		(unsigned long)(crash_size >> 20),
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1046  		(unsigned long)(crash_base >> 20),
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1047  		(unsigned long)(total_mem >> 20));
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1048  
f7f0b7dc720f81 Russell King    2016-08-02  1049  	/* The crashk resource must always be located in normal mem */
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1050  	crashk_res.start = crash_base;
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1051  	crashk_res.end = crash_base + crash_size - 1;
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1052  	insert_resource(&iomem_resource, &crashk_res);
f7f0b7dc720f81 Russell King    2016-08-02  1053  
f7f0b7dc720f81 Russell King    2016-08-02  1054  	if (arm_has_idmap_alias()) {
f7f0b7dc720f81 Russell King    2016-08-02  1055  		/*
f7f0b7dc720f81 Russell King    2016-08-02  1056  		 * If we have a special RAM alias for use at boot, we
f7f0b7dc720f81 Russell King    2016-08-02  1057  		 * need to advertise to kexec tools where the alias is.
f7f0b7dc720f81 Russell King    2016-08-02  1058  		 */
f7f0b7dc720f81 Russell King    2016-08-02  1059  		static struct resource crashk_boot_res = {
f7f0b7dc720f81 Russell King    2016-08-02  1060  			.name = "Crash kernel (boot alias)",
f7f0b7dc720f81 Russell King    2016-08-02  1061  			.flags = IORESOURCE_BUSY | IORESOURCE_MEM,
f7f0b7dc720f81 Russell King    2016-08-02  1062  		};
f7f0b7dc720f81 Russell King    2016-08-02  1063  
f7f0b7dc720f81 Russell King    2016-08-02  1064  		crashk_boot_res.start = phys_to_idmap(crash_base);
f7f0b7dc720f81 Russell King    2016-08-02  1065  		crashk_boot_res.end = crashk_boot_res.start + crash_size - 1;
f7f0b7dc720f81 Russell King    2016-08-02  1066  		insert_resource(&iomem_resource, &crashk_boot_res);
f7f0b7dc720f81 Russell King    2016-08-02  1067  	}
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1068  }
3c57fb43c8fcbe Mika Westerberg 2010-05-10  1069  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
