Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56307832D38
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 17:34:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VS9V+qy0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGlZ022V4z3c1C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 03:34:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VS9V+qy0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGlY61PHTz3bnx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jan 2024 03:33:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705682010; x=1737218010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4MTHcTMRo8vaC78u9KaJGas7GabALp0/v9oyhzhuUno=;
  b=VS9V+qy04Dj92Yt2dsTKAxi6U1ngbQnfw9y/+DtvAVRjOx2BgwBU9Hq2
   SiC9LEpoERa3SoOLfnAMUAyzsfdFrRLSF7XDpN+YKQ9E4njknIKK8CMiN
   n8wWEYYvs7J6gXWGWSWoBIdggD59Z3XUFb5AUnEhdYz6mZpOWEe4czRR7
   tqmmQVWUuMXWrsPcscoDN/SDNULwNFuxtkeR1vrqJXY6nPZFORGUxJ0OZ
   losnGq2DbdF7K0xCtxQYznEvpf+0pIB8QZzScMpssSkQCuGYQAkkAZqN7
   av3hsSqfvUZVdfV3XWAu4PEPc1hIdy+ZvkIkV/hstVRr1q92qUZ3fiu3C
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="676891"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="676891"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 08:33:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="27082145"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jan 2024 08:33:09 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQrnm-0004Fy-2T;
	Fri, 19 Jan 2024 16:33:06 +0000
Date: Sat, 20 Jan 2024 00:32:24 +0800
From: kernel test robot <lkp@intel.com>
To: Huang Shijie <shijie@os.amperecomputing.com>,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of
 the correct node id
Message-ID: <202401200006.wOMN1YgH-lkp@intel.com>
References: <20240119033227.14113-1-shijie@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240119033227.14113-1-shijie@os.amperecomputing.com>
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
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus akpm-mm/mm-everything linus/master v6.7 next-20240119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huang-Shijie/NUMA-Early-use-of-cpu_to_node-returns-0-instead-of-the-correct-node-id/20240119-113623
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20240119033227.14113-1-shijie%40os.amperecomputing.com
patch subject: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of the correct node id
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240120/202401200006.wOMN1YgH-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200006.wOMN1YgH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401200006.wOMN1YgH-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `rapl_cpu_online':
>> rapl.c:(.text+0x75ec): undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `amd_pmu_cpu_prepare':
>> core.c:(.text+0x8580): undefined reference to `cpu_to_node'
>> ld: core.c:(.text+0x85d6): undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `amd_uncore_ctx_init.part.0':
>> uncore.c:(.text+0xc3bd): undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `intel_cpuc_prepare':
>> (.text+0x129ee): undefined reference to `cpu_to_node'
   ld: vmlinux.o:(.text+0x12a71): more undefined references to `cpu_to_node' follow
   ld: vmlinux.o: in function `kernel_init_freeable':
>> main.c:(.init.text+0x1240): undefined reference to `_cpu_to_node'
   ld: vmlinux.o: in function `check_timer':
>> io_apic.c:(.init.text+0x1ec1d): undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `kvm_alloc_cpumask':
>> kvm.c:(.init.text+0x21678): undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `fork_idle':
>> (.init.text+0x28fe2): undefined reference to `cpu_to_node'
   ld: vmlinux.o: in function `cpus_share_numa':
>> workqueue.c:(.init.text+0x2a4c8): undefined reference to `cpu_to_node'
>> ld: workqueue.c:(.init.text+0x2a4d8): undefined reference to `cpu_to_node'
   ld: vmlinux.o:workqueue.c:(.init.text+0x2a7bc): more undefined references to `cpu_to_node' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
