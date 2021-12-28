Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EA7480ABC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 16:13:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JNdMN2ByJz3c6j
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Dec 2021 02:13:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JfX4OL0u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JfX4OL0u; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JNdLj1Zyyz2yPL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Dec 2021 02:12:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640704349; x=1672240349;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=ssajZqmE+a4mcPDqam5WxlqgCDQ9LDX4o6C63V3N9Jo=;
 b=JfX4OL0uqJTY5XEaqMUWYcmz9IDgcD2M672Thicd0CnqbwEqPMoGn2GG
 YW1pqT7BhYxhfD0/ITy+DCzitzrNvFS+oE3kY+KxqiKGPaL+hecgE3RHq
 igHKDzH3C51pIn/qRU2N8VoAHT18Rc8W5urQTztKUYeMKjtTi7EbPDvmS
 yNsFih1QM00KG/iB6AD59gxSSnUO6eLHkjgV531O+5RrR78qoBFCRN/g9
 6XzWWGEWwVsqC5Suz9iYxWY1M+iEMlFKz42TO3ZTtDpwwjbp6hFA2J2vW
 giV5q/cFiozr4VE+ztsIprXUcroPYDT5EfOEyiu4OIOXtfUxxpfPzCOEl g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10210"; a="222050545"
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; d="scan'208";a="222050545"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2021 07:11:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; d="scan'208";a="686607692"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 28 Dec 2021 07:11:07 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n2E82-0007fg-Sz; Tue, 28 Dec 2021 15:11:06 +0000
Date: Tue, 28 Dec 2021 23:10:41 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test 44/179] arch/powerpc/platforms/85xx/smp.c:218:28:
 sparse: sparse: incorrect type in assignment (different address
 spaces)
Message-ID: <202112282327.YOTtEkGX-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   beeac538c366cd2828092adecd1edab28326c55b
commit: 84a61fb43fdfc528a3a7ff00e0b14ba91f5eb745 [44/179] powerpc/85xx: Make mpc85xx_smp_kexec_cpu_down() static
config: powerpc64-randconfig-s031-20211228 (https://download.01.org/0day-ci/archive/20211228/202112282327.YOTtEkGX-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=84a61fb43fdfc528a3a7ff00e0b14ba91f5eb745
        git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
        git fetch --no-tags powerpc next-test
        git checkout 84a61fb43fdfc528a3a7ff00e0b14ba91f5eb745
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/mm/nohash/ arch/powerpc/platforms/85xx/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/platforms/85xx/smp.c:218:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct epapr_spin_table [noderef] __iomem *[assigned] spin_table @@     got void * @@
   arch/powerpc/platforms/85xx/smp.c:218:28: sparse:     expected struct epapr_spin_table [noderef] __iomem *[assigned] spin_table
   arch/powerpc/platforms/85xx/smp.c:218:28: sparse:     got void *
>> arch/powerpc/platforms/85xx/smp.c:227:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *spin_table @@     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table @@
   arch/powerpc/platforms/85xx/smp.c:227:36: sparse:     expected void *spin_table
   arch/powerpc/platforms/85xx/smp.c:227:36: sparse:     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *spin_table @@     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table @@
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse:     expected void *spin_table
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse:     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *spin_table @@     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table @@
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse:     expected void *spin_table
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse:     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *spin_table @@     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table @@
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse:     expected void *spin_table
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse:     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *spin_table @@     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table @@
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse:     expected void *spin_table
   arch/powerpc/platforms/85xx/smp.c:239:22: sparse:     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table
   arch/powerpc/platforms/85xx/smp.c:249:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *spin_table @@     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table @@
   arch/powerpc/platforms/85xx/smp.c:249:26: sparse:     expected void *spin_table
   arch/powerpc/platforms/85xx/smp.c:249:26: sparse:     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table
>> arch/powerpc/platforms/85xx/smp.c:252:19: sparse: sparse: cast removes address space '__iomem' of expression
>> arch/powerpc/platforms/85xx/smp.c:252:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned long long volatile [noderef] [usertype] __iomem *addr @@     got unsigned long long [usertype] * @@
   arch/powerpc/platforms/85xx/smp.c:252:19: sparse:     expected unsigned long long volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/85xx/smp.c:252:19: sparse:     got unsigned long long [usertype] *
   arch/powerpc/platforms/85xx/smp.c:266:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *spin_table @@     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table @@
   arch/powerpc/platforms/85xx/smp.c:266:26: sparse:     expected void *spin_table
   arch/powerpc/platforms/85xx/smp.c:266:26: sparse:     got struct epapr_spin_table [noderef] __iomem *[assigned] spin_table
>> arch/powerpc/platforms/85xx/smp.c:173:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got unsigned int * @@
   arch/powerpc/platforms/85xx/smp.c:173:27: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/85xx/smp.c:173:27: sparse:     got unsigned int *
>> arch/powerpc/platforms/85xx/smp.c:173:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got unsigned int * @@
   arch/powerpc/platforms/85xx/smp.c:173:27: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/85xx/smp.c:173:27: sparse:     got unsigned int *
>> arch/powerpc/platforms/85xx/smp.c:173:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got unsigned int * @@
   arch/powerpc/platforms/85xx/smp.c:173:27: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/85xx/smp.c:173:27: sparse:     got unsigned int *
>> arch/powerpc/platforms/85xx/smp.c:173:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got unsigned int * @@
   arch/powerpc/platforms/85xx/smp.c:173:27: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   arch/powerpc/platforms/85xx/smp.c:173:27: sparse:     got unsigned int *

vim +218 arch/powerpc/platforms/85xx/smp.c

bc15236fbed1e0 York Sun         2012-09-29  168  
bc15236fbed1e0 York Sun         2012-09-29  169  static inline u32 read_spin_table_addr_l(void *spin_table)
bc15236fbed1e0 York Sun         2012-09-29  170  {
bc15236fbed1e0 York Sun         2012-09-29  171  	flush_dcache_range((ulong)spin_table,
bc15236fbed1e0 York Sun         2012-09-29  172  		(ulong)spin_table + sizeof(struct epapr_spin_table));
bc15236fbed1e0 York Sun         2012-09-29 @173  	return in_be32(&((struct epapr_spin_table *)spin_table)->addr_l);
bc15236fbed1e0 York Sun         2012-09-29  174  }
bc15236fbed1e0 York Sun         2012-09-29  175  
e16c8765533a15 Andy Fleming     2011-12-08  176  #ifdef CONFIG_PPC64
e16c8765533a15 Andy Fleming     2011-12-08  177  static void wake_hw_thread(void *info)
e16c8765533a15 Andy Fleming     2011-12-08  178  {
e16c8765533a15 Andy Fleming     2011-12-08  179  	void fsl_secondary_thread_init(void);
6becef7ea04a69 chenhui zhao     2015-11-20  180  	unsigned long inia;
6becef7ea04a69 chenhui zhao     2015-11-20  181  	int cpu = *(const int *)info;
e16c8765533a15 Andy Fleming     2011-12-08  182  
01c593d749f476 Scott Wood       2015-10-06  183  	inia = *(unsigned long *)fsl_secondary_thread_init;
6becef7ea04a69 chenhui zhao     2015-11-20  184  	book3e_start_thread(cpu_thread_in_core(cpu), inia);
e16c8765533a15 Andy Fleming     2011-12-08  185  }
e16c8765533a15 Andy Fleming     2011-12-08  186  #endif
e16c8765533a15 Andy Fleming     2011-12-08  187  
2f4f1f815bc6d0 chenhui zhao     2015-11-20  188  static int smp_85xx_start_cpu(int cpu)
d5b26db2cfcf09 Kumar Gala       2008-11-19  189  {
2f4f1f815bc6d0 chenhui zhao     2015-11-20  190  	int ret = 0;
d5b26db2cfcf09 Kumar Gala       2008-11-19  191  	struct device_node *np;
2f4f1f815bc6d0 chenhui zhao     2015-11-20  192  	const u64 *cpu_rel_addr;
2f4f1f815bc6d0 chenhui zhao     2015-11-20  193  	unsigned long flags;
d1d47ec6e62ab0 Peter Tyser      2009-12-18  194  	int ioremappable;
2f4f1f815bc6d0 chenhui zhao     2015-11-20  195  	int hw_cpu = get_hard_smp_processor_id(cpu);
2f4f1f815bc6d0 chenhui zhao     2015-11-20  196  	struct epapr_spin_table __iomem *spin_table;
e16c8765533a15 Andy Fleming     2011-12-08  197  
2f4f1f815bc6d0 chenhui zhao     2015-11-20  198  	np = of_get_cpu_node(cpu, NULL);
d5b26db2cfcf09 Kumar Gala       2008-11-19  199  	cpu_rel_addr = of_get_property(np, "cpu-release-addr", NULL);
2f4f1f815bc6d0 chenhui zhao     2015-11-20  200  	if (!cpu_rel_addr) {
2f4f1f815bc6d0 chenhui zhao     2015-11-20  201  		pr_err("No cpu-release-addr for cpu %d\n", cpu);
de300974761d92 Michael Ellerman 2011-04-11  202  		return -ENOENT;
d5b26db2cfcf09 Kumar Gala       2008-11-19  203  	}
d5b26db2cfcf09 Kumar Gala       2008-11-19  204  
d1d47ec6e62ab0 Peter Tyser      2009-12-18  205  	/*
d1d47ec6e62ab0 Peter Tyser      2009-12-18  206  	 * A secondary core could be in a spinloop in the bootpage
d1d47ec6e62ab0 Peter Tyser      2009-12-18  207  	 * (0xfffff000), somewhere in highmem, or somewhere in lowmem.
d1d47ec6e62ab0 Peter Tyser      2009-12-18  208  	 * The bootpage and highmem can be accessed via ioremap(), but
d1d47ec6e62ab0 Peter Tyser      2009-12-18  209  	 * we need to directly access the spinloop if its in lowmem.
d1d47ec6e62ab0 Peter Tyser      2009-12-18  210  	 */
d1d47ec6e62ab0 Peter Tyser      2009-12-18  211  	ioremappable = *cpu_rel_addr > virt_to_phys(high_memory);
d1d47ec6e62ab0 Peter Tyser      2009-12-18  212  
d5b26db2cfcf09 Kumar Gala       2008-11-19  213  	/* Map the spin table */
d1d47ec6e62ab0 Peter Tyser      2009-12-18  214  	if (ioremappable)
aa91796ec46339 Christophe Leroy 2018-10-09  215  		spin_table = ioremap_coherent(*cpu_rel_addr,
aa91796ec46339 Christophe Leroy 2018-10-09  216  					      sizeof(struct epapr_spin_table));
d1d47ec6e62ab0 Peter Tyser      2009-12-18  217  	else
15f34eb12340b2 Zhao Chenhui     2012-07-20 @218  		spin_table = phys_to_virt(*cpu_rel_addr);
d5b26db2cfcf09 Kumar Gala       2008-11-19  219  
cb1ffb6204712b Kumar Gala       2009-06-19  220  	local_irq_save(flags);
2f4f1f815bc6d0 chenhui zhao     2015-11-20  221  	hard_irq_disable();
d0832a75075b11 Zhao Chenhui     2012-07-20  222  
2f4f1f815bc6d0 chenhui zhao     2015-11-20  223  	if (qoriq_pm_ops)
2f4f1f815bc6d0 chenhui zhao     2015-11-20  224  		qoriq_pm_ops->cpu_up_prepare(cpu);
cb1ffb6204712b Kumar Gala       2009-06-19  225  
2f4f1f815bc6d0 chenhui zhao     2015-11-20  226  	/* if cpu is not spinning, reset it */
2f4f1f815bc6d0 chenhui zhao     2015-11-20 @227  	if (read_spin_table_addr_l(spin_table) != 1) {
d0832a75075b11 Zhao Chenhui     2012-07-20  228  		/*
d0832a75075b11 Zhao Chenhui     2012-07-20  229  		 * We don't set the BPTR register here since it already points
d0832a75075b11 Zhao Chenhui     2012-07-20  230  		 * to the boot page properly.
d0832a75075b11 Zhao Chenhui     2012-07-20  231  		 */
2f4f1f815bc6d0 chenhui zhao     2015-11-20  232  		mpic_reset_core(cpu);
d0832a75075b11 Zhao Chenhui     2012-07-20  233  
bc15236fbed1e0 York Sun         2012-09-29  234  		/*
bc15236fbed1e0 York Sun         2012-09-29  235  		 * wait until core is ready...
bc15236fbed1e0 York Sun         2012-09-29  236  		 * We need to invalidate the stale data, in case the boot
bc15236fbed1e0 York Sun         2012-09-29  237  		 * loader uses a cache-inhibited spin table.
bc15236fbed1e0 York Sun         2012-09-29  238  		 */
bc15236fbed1e0 York Sun         2012-09-29 @239  		if (!spin_event_timeout(
bc15236fbed1e0 York Sun         2012-09-29  240  				read_spin_table_addr_l(spin_table) == 1,
d0832a75075b11 Zhao Chenhui     2012-07-20  241  				10000, 100)) {
2f4f1f815bc6d0 chenhui zhao     2015-11-20  242  			pr_err("timeout waiting for cpu %d to reset\n",
2f4f1f815bc6d0 chenhui zhao     2015-11-20  243  				hw_cpu);
2f4f1f815bc6d0 chenhui zhao     2015-11-20  244  			ret = -EAGAIN;
2f4f1f815bc6d0 chenhui zhao     2015-11-20  245  			goto err;
d0832a75075b11 Zhao Chenhui     2012-07-20  246  		}
d0832a75075b11 Zhao Chenhui     2012-07-20  247  	}
decbb280bb8e3b Kumar Gala       2011-02-14  248  
bc15236fbed1e0 York Sun         2012-09-29 @249  	flush_spin_table(spin_table);
d0832a75075b11 Zhao Chenhui     2012-07-20  250  	out_be32(&spin_table->pir, hw_cpu);
2f4f1f815bc6d0 chenhui zhao     2015-11-20  251  #ifdef CONFIG_PPC64
15f34eb12340b2 Zhao Chenhui     2012-07-20 @252  	out_be64((u64 *)(&spin_table->addr_h),
2751b628c97e66 Anton Blanchard  2014-03-11  253  		__pa(ppc_function_entry(generic_secondary_smp_init)));
2f4f1f815bc6d0 chenhui zhao     2015-11-20  254  #else
eeb09917c138cc Bai Yingjie      2020-01-06  255  #ifdef CONFIG_PHYS_ADDR_T_64BIT
eeb09917c138cc Bai Yingjie      2020-01-06  256  	/*
eeb09917c138cc Bai Yingjie      2020-01-06  257  	 * We need also to write addr_h to spin table for systems
eeb09917c138cc Bai Yingjie      2020-01-06  258  	 * in which their physical memory start address was configured
eeb09917c138cc Bai Yingjie      2020-01-06  259  	 * to above 4G, otherwise the secondary core can not get
eeb09917c138cc Bai Yingjie      2020-01-06  260  	 * correct entry to start from.
eeb09917c138cc Bai Yingjie      2020-01-06  261  	 */
eeb09917c138cc Bai Yingjie      2020-01-06  262  	out_be32(&spin_table->addr_h, __pa(__early_start) >> 32);
eeb09917c138cc Bai Yingjie      2020-01-06  263  #endif
2f4f1f815bc6d0 chenhui zhao     2015-11-20  264  	out_be32(&spin_table->addr_l, __pa(__early_start));
5b8544c38e6fde Kumar Gala       2010-10-08  265  #endif
2f4f1f815bc6d0 chenhui zhao     2015-11-20  266  	flush_spin_table(spin_table);
2f4f1f815bc6d0 chenhui zhao     2015-11-20  267  err:
d5b26db2cfcf09 Kumar Gala       2008-11-19  268  	local_irq_restore(flags);
d5b26db2cfcf09 Kumar Gala       2008-11-19  269  
d1d47ec6e62ab0 Peter Tyser      2009-12-18  270  	if (ioremappable)
15f34eb12340b2 Zhao Chenhui     2012-07-20  271  		iounmap(spin_table);
cb1ffb6204712b Kumar Gala       2009-06-19  272  
d0832a75075b11 Zhao Chenhui     2012-07-20  273  	return ret;
d5b26db2cfcf09 Kumar Gala       2008-11-19  274  }
d5b26db2cfcf09 Kumar Gala       2008-11-19  275  

:::::: The code at line 218 was first introduced by commit
:::::: 15f34eb12340b2c2e0cd90c5987ad6b5f73b79b7 powerpc/85xx: Replace epapr spin table macros/defines with a struct

:::::: TO: Zhao Chenhui <chenhui.zhao@freescale.com>
:::::: CC: Kumar Gala <galak@kernel.crashing.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
