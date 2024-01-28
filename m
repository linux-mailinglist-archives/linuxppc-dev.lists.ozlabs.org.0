Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DC183F989
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jan 2024 20:45:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hMbXJ7dO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNMNd63Dkz3cSH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 06:45:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hMbXJ7dO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Mon, 29 Jan 2024 06:44:57 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNMMs2yf7z2xXY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jan 2024 06:44:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706471097; x=1738007097;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gAznsvvIw+2Ntm0oZe02zil1LYT+hELlj3+NPCQBn34=;
  b=hMbXJ7dOF4Vji6DyoPQl7RkzW+8OfMXoou/ao2r4sr/+F//BgyHNCNBR
   TykuNfNBApTTKYsSF4JJ2+mLYtWOjSG+AVqHTZxXm5YM0npmuoxHQDEVM
   ISYJy0pT0O+ks8HAspRUF0jdkfrc3n7WLf43UP5uwqLWMDgD2B1cSq3FH
   /CxJ/+6yXEdt6QPzYjkd7sP6U9FApMfLnepTOi45fg3Ydt0qhB9RAqX5D
   307GmIOz/J0XTVgWiiMvecLptaeH4zEWthjQMM1TVrZa9rxORW1AB8UBq
   hdg6wkP7f8MXNTls/b8ZGkUiAYi+LqCVs7GmoRIM0B2BE2ztXU9w9vur5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="393233503"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="393233503"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 11:43:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="930888327"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="930888327"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 Jan 2024 11:43:38 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUB43-0003hO-31;
	Sun, 28 Jan 2024 19:43:35 +0000
Date: Mon, 29 Jan 2024 03:43:25 +0800
From: kernel test robot <lkp@intel.com>
To: Huang Shijie <shijie@os.amperecomputing.com>,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH] init: refactor the generic cpu_to_node for NUMA
Message-ID: <202401290316.0eu1Mue2-lkp@intel.com>
References: <20240118031412.3300-1-shijie@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118031412.3300-1-shijie@os.amperecomputing.com>
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
Cc: mark.rutland@arm.com, rafael@kernel.org, catalin.marinas@arm.com, paul.walmsley@sifive.com, jiaxun.yang@flygoat.com, mikelley@microsoft.com, linux-riscv@lists.infradead.org, will@kernel.org, mingo@kernel.org, vschneid@redhat.com, arnd@arndb.de, chenhuacai@kernel.org, vbabka@suse.cz, kuba@kernel.org, patches@amperecomputing.com, linux-mips@vger.kernel.org, aou@eecs.berkeley.edu, yury.norov@gmail.com, oe-kbuild-all@lists.linux.dev, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Huang,

kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.8-rc1 next-20240125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huang-Shijie/init-refactor-the-generic-cpu_to_node-for-NUMA/20240118-111802
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20240118031412.3300-1-shijie%40os.amperecomputing.com
patch subject: [PATCH] init: refactor the generic cpu_to_node for NUMA
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240129/202401290316.0eu1Mue2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401290316.0eu1Mue2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401290316.0eu1Mue2-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `amd_pmu_cpu_prepare':
>> arch/x86/events/amd/core.c:549: undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `amd_alloc_nb':
   arch/x86/events/amd/core.c:507: undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `amd_uncore_ctx_init':
>> arch/x86/events/amd/uncore.c:476: undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `allocate_shared_regs':
>> arch/x86/events/intel/core.c:4520: undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `intel_cpuc_prepare':
   arch/x86/events/intel/core.c:4561: undefined reference to `cpu_to_node'
   ld: vmlinux.o:arch/x86/events/intel/core.c:4538: more undefined references to `cpu_to_node' follow
   ld: vmlinux.o: in function `smp_prepare_cpus_done':
>> init/main.c:1542: undefined reference to `_cpu_to_node'
   ld: vmlinux.o: in function `check_timer':
>> arch/x86/kernel/apic/io_apic.c:2169: undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `kvm_alloc_cpumask':
>> arch/x86/kernel/kvm.c:687: undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `fork_idle':
>> kernel/fork.c:2826: undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `cpus_share_numa':
>> kernel/workqueue.c:6768: undefined reference to `cpu_to_node'
>> ld: kernel/workqueue.c:6768: undefined reference to `cpu_to_node'
   ld: vmlinux.o:kernel/workqueue.c:6748: more undefined references to `cpu_to_node' follow


vim +549 arch/x86/events/amd/core.c

21d59e3e2c403c arch/x86/events/amd/core.c           Sandipan Das    2022-04-21  544  
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  545  static int amd_pmu_cpu_prepare(int cpu)
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  546  {
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  547  	struct cpu_hw_events *cpuc = &per_cpu(cpu_hw_events, cpu);
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  548  
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11 @549  	cpuc->lbr_sel = kzalloc_node(sizeof(struct er_account), GFP_KERNEL,
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11  550  				     cpu_to_node(cpu));
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11  551  	if (!cpuc->lbr_sel)
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11  552  		return -ENOMEM;
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11  553  
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  554  	WARN_ON_ONCE(cpuc->amd_nb);
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  555  
32b62f446827f6 arch/x86/events/amd/core.c           Peter Zijlstra  2016-03-25  556  	if (!x86_pmu.amd_nb_constraints)
95ca792c7582fd arch/x86/events/amd/core.c           Thomas Gleixner 2016-07-13  557  		return 0;
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  558  
c079c791c5a062 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-11-25  559  	cpuc->amd_nb = amd_alloc_nb(cpu);
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11  560  	if (cpuc->amd_nb)
95ca792c7582fd arch/x86/events/amd/core.c           Thomas Gleixner 2016-07-13  561  		return 0;
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11  562  
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11  563  	kfree(cpuc->lbr_sel);
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11  564  	cpuc->lbr_sel = NULL;
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11  565  
f4f925dae7419f arch/x86/events/amd/core.c           Sandipan Das    2022-08-11  566  	return -ENOMEM;
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  567  }
b38b24ead33417 arch/x86/kernel/cpu/perf_event_amd.c Peter Zijlstra  2010-03-23  568  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
