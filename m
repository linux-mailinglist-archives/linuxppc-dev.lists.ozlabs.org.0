Return-Path: <linuxppc-dev+bounces-14784-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0667CBFBEE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Dec 2025 21:28:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVWq50XR6z2xJT;
	Tue, 16 Dec 2025 07:28:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765830512;
	cv=none; b=AGqK68vOxo9yGJSei7HDLc9eZ67DrHPvj+rXktovOMr6MDebvBfXyo2xpzJGBcD+7B3sMPXl2T/RgMsf1hVgmaITapYFBDcPwSZz1VFvbot+yLgO1uX5BdZ75PwZzx15DHBZqASqgKtTZSal9pwSH0xbfc9rn7obb8zOMuOjK82Z1nRTiPH7noIgukJTluehHi8+Q+5+mKGyqEkmckpQfTMohgRSN7iKeAKzUUqQuthIvzzKunRwW7khh8U2nMxGb5zEEtzTQU0eIZdgmr8LEHjdRtTWcJ5ibH/zZJBC9h6pB2KwPefW6G4Lpklbs/ZGhMbF6U1YXew41N3irR8/rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765830512; c=relaxed/relaxed;
	bh=N0Ibuc4AT9SPAIe/GiiO1BZ5OT+QqLImFuswZXgPjNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qa9Sw7jlc2oY8ejcwWg74d3GNmqxoyGv6HpCyWuuz4H04tZfKQze0LqLkrcHk5Yabe9ggZo5UfCfZt3CLU/8zuYcseonYz9Ssdf6P7obFKqK7n7TVzZRvYTGO9eUUh1mUUQSDELGyOJ582Im5x9fDGjVGhOU8GCS1MtDhDlpHD9oh3jLlxlMDQe6mURyXtZw5euPJY5FTlW7b470T7T1sNkbkkxQEQXLY3hZUj41O2Hg1Q1U1cBDfadqaR5TLI+av47BPsC8/gmU5CAbWPVl2Xu4TBlDlytpDv1LL9BTnjIL+dXUNQMoqaGtz0cyg7FyVYlZeqBSmJgKPSwXgnXnTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZYqwuYyY; dkim-atps=neutral; spf=pass (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZYqwuYyY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVWq202Jwz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 07:28:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765830511; x=1797366511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PICd5QGN1ZwPD9AFzhqgQ3hSUeAqcFLWLHAtmij4II8=;
  b=ZYqwuYyYrbDobXN9xO9QboLFijmM7o5o4QPKwCsRLubtVxk+xbB2d2/h
   Mc5EfyxjRxe9oKfGwbMbUXmRlZW+KGaCIa2cD8klVdtaOaYasYUBWyPeQ
   qA1CwtizRk11+XEX+UWkwW/tG2aqJ/cY7Ph/GVXQVdKdgzCOXe12d/NYU
   xA+ERqTsHjWcw/eNxOk8ZK8HO074mrX8lBv98pzNGgNnqESZ7H7tUq0Ur
   DJp52GgDL1eO9WN20UQ13sed5kKH/a+7SmbxjxGFA9AvrXZ2GgHj4/9HG
   2kYm44+iLuq/iZg6Hr47Y/xObWIZqkUGRg/5TQL+eXBalQCkUR5WFf0m2
   g==;
X-CSE-ConnectionGUID: /fErIMz+SAKSMRojUd5VFg==
X-CSE-MsgGUID: i0tYTUI3S/y43MiGB4/Q7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67707543"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="67707543"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 12:28:24 -0800
X-CSE-ConnectionGUID: oFOVXM/7SDO6vFlHtuuj2g==
X-CSE-MsgGUID: O6SktobwSWWnc8+fYtmgzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197444695"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 15 Dec 2025 12:28:16 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVFAr-000000000jF-3NSa;
	Mon, 15 Dec 2025 20:28:08 +0000
Date: Tue, 16 Dec 2025 04:27:55 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	oleg@redhat.com, kees@kernel.org, luto@amacapital.net,
	wad@chromium.org, mchauras@linux.ibm.com, thuth@redhat.com,
	sshegde@linux.ibm.com, charlie@rivosinc.com, macro@orcam.me.uk,
	akpm@linux-foundation.org, ldv@strace.io, deller@gmx.de,
	ankur.a.arora@oracle.com, segher@kernel.crashing.org,
	tglx@linutronix.de, thomas.weissschuh@linutronix.de,
	peterz@infradead.org, menglong8.dong@gmail.com,
	bigeasy@linutronix.de, namcao@linutronix.de, mingo@kernel.org,
	atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 8/8] powerpc: Enable Generic Entry/Exit for syscalls.
Message-ID: <202512160453.iO9WNjrm-lkp@intel.com>
References: <20251214130245.43664-9-mkchauras@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214130245.43664-9-mkchauras@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Mukesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.19-rc1 next-20251215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Kumar-Chaurasiya/powerpc-rename-arch_irq_disabled_regs/20251214-210813
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20251214130245.43664-9-mkchauras%40linux.ibm.com
patch subject: [PATCH v2 8/8] powerpc: Enable Generic Entry/Exit for syscalls.
config: powerpc-randconfig-001-20251215 (https://download.01.org/0day-ci/archive/20251216/202512160453.iO9WNjrm-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160453.iO9WNjrm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160453.iO9WNjrm-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: init/main.o: in function `do_trace_event_raw_event_initcall_level':
   include/trace/events/initcall.h:10: undefined reference to `memcpy'
   powerpc-linux-ld: init/main.o: in function `repair_env_string':
   init/main.c:512: undefined reference to `memmove'
   powerpc-linux-ld: init/do_mounts.o: in function `do_mount_root':
   init/do_mounts.c:162: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/kernel/process.o: in function `start_thread':
   arch/powerpc/kernel/process.c:1919: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/kernel/process.o: in function `__set_breakpoint':
   arch/powerpc/kernel/process.c:880: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/process.o: in function `arch_dup_task_struct':
   arch/powerpc/kernel/process.c:1724: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/process.o: in function `copy_thread':
   arch/powerpc/kernel/process.c:1801: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/kernel/process.c:1812: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/signal.o: in function `do_signal':
   arch/powerpc/kernel/signal.c:247: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/kernel/time.o: in function `register_decrementer_clockevent':
>> arch/powerpc/kernel/time.c:834: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/time.o: in function `platform_device_register_resndata':
>> include/linux/platform_device.h:158: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/kernel/prom.o: in function `move_device_tree':
>> arch/powerpc/kernel/prom.c:134: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/setup-common.o: in function `probe_machine':
>> arch/powerpc/kernel/setup-common.c:646: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.o: in function `user_regset_copyin':
>> include/linux/regset.h:276: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.o: in function `membuf_write':
   include/linux/regset.h:42: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.o: in function `gpr_get':
>> arch/powerpc/kernel/ptrace/ptrace-view.c:230: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.o: in function `membuf_zero':
>> include/linux/regset.h:30: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.o: in function `gpr32_get_common':
   arch/powerpc/kernel/ptrace/ptrace-view.c:707: undefined reference to `memcpy'
>> powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.c:708: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.c:710: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-view.o: in function `membuf_zero':
>> include/linux/regset.h:30: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/kernel/ptrace/ptrace-novsx.o: in function `membuf_write':
   include/linux/regset.h:42: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/optprobes.o: in function `can_optimize':
>> arch/powerpc/kernel/optprobes.c:71: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/kernel/kvm.o: in function `kvm_map_magic_page':
>> arch/powerpc/kernel/kvm.c:407: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/kernel/kvm.o: in function `kvm_patch_ins_mtmsrd':
>> arch/powerpc/kernel/kvm.c:178: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/kvm.o: in function `kvm_patch_ins_mtmsr':
   arch/powerpc/kernel/kvm.c:231: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/kernel/kvm.o: in function `epapr_hypercall0_1':
>> arch/powerpc/include/asm/epapr_hcalls.h:511: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/mm/mem.o: in function `execmem_arch_setup':
>> arch/powerpc/mm/mem.c:423: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/mm/init-common.o: in function `ctor_15':
>> arch/powerpc/mm/init-common.c:81: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/mm/init-common.o: in function `ctor_14':
>> arch/powerpc/mm/init-common.c:81: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/mm/init-common.o: in function `ctor_13':
>> arch/powerpc/mm/init-common.c:81: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/mm/init-common.o:arch/powerpc/mm/init-common.c:81: more undefined references to `memset' follow
   powerpc-linux-ld: arch/powerpc/lib/pmem.o: in function `memcpy_flushcache':
>> arch/powerpc/lib/pmem.c:84: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/sysdev/fsl_mpic_err.o: in function `mpic_setup_error_int':
>> arch/powerpc/sysdev/fsl_mpic_err.c:70: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/platforms/8xx/pic.o: in function `irq_domain_create_linear':
>> include/linux/irqdomain.h:405: undefined reference to `memset'
   powerpc-linux-ld: arch/powerpc/platforms/8xx/cpm1.o: in function `cpm1_clk_setup':
   arch/powerpc/platforms/8xx/cpm1.c:251: undefined reference to `memcpy'
   powerpc-linux-ld: arch/powerpc/platforms/8xx/cpm1-ic.o: in function `irq_domain_create_linear':
   include/linux/irqdomain.h:405: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `do_trace_event_raw_event_task_newtask':
   include/trace/events/task.h:9: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/fork.o: in function `do_trace_event_raw_event_task_rename':
   include/trace/events/task.h:34: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/fork.o: in function `copy_struct_from_user':
   include/linux/uaccess.h:396: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `copy_clone_args_from_user':
   kernel/fork.c:2800: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `mm_init':
   kernel/fork.c:1044: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `bitmap_zero':
   include/linux/bitmap.h:238: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `pgd_alloc':
   arch/powerpc/include/asm/nohash/pgalloc.h:26: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/fork.o: in function `__kmem_cache_create':
   include/linux/slab.h:379: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `arch_dup_task_struct':
   kernel/fork.c:854: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/fork.o: in function `mm_alloc':
   kernel/fork.c:1120: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `replace_mm_exe_file':
   kernel/fork.c:1238: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `copy_process':
   kernel/fork.c:2030: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `posix_cputimers_init':
   include/linux/posix-timers.h:103: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `copy_sighand':
   kernel/fork.c:1618: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/fork.o: in function `copy_signal':
   kernel/fork.c:1687: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/fork.o: in function `dup_mm':
   kernel/fork.c:1483: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/fork.o: in function `create_io_thread':
   kernel/fork.c:2549: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `kernel_thread':
   kernel/fork.c:2661: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `user_mode_thread':
   kernel/fork.c:2678: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `sys_fork':
   kernel/fork.c:2692: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o: in function `sys_vfork':
   kernel/fork.c:2707: undefined reference to `memset'
   powerpc-linux-ld: kernel/fork.o:kernel/fork.c:2740: more undefined references to `memset' follow
   powerpc-linux-ld: kernel/softirq.o: in function `do_trace_event_raw_event_irq_handler_entry':
   include/trace/events/irq.h:53: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/resource.o: in function `find_next_iomem_res':
   kernel/resource.c:372: undefined reference to `memset'
   powerpc-linux-ld: kernel/resource.o: in function `__request_region_locked':
   kernel/resource.c:1261: undefined reference to `memset'
   powerpc-linux-ld: kernel/resource.o: in function `reserve_setup':
   kernel/resource.c:1757: undefined reference to `memset'
   powerpc-linux-ld: kernel/resource.c:1760: undefined reference to `memset'
   powerpc-linux-ld: kernel/sysctl.o: in function `proc_put_long':
   kernel/sysctl.c:339: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/sysctl.o: in function `_proc_do_string':
   kernel/sysctl.c:127: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/sysctl.o: in function `proc_get_long':
   kernel/sysctl.c:284: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/sysctl.o: in function `bitmap_copy':
   include/linux/bitmap.h:259: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/sysctl.o: in function `proc_do_static_key':
   kernel/sysctl.c:1433: undefined reference to `memset'
   powerpc-linux-ld: kernel/capability.o: in function `__do_sys_capset':
   kernel/capability.c:218: undefined reference to `memset'
   powerpc-linux-ld: kernel/ptrace.o: in function `syscall_set_arguments':
   arch/powerpc/include/asm/syscall.h:127: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/ptrace.o: in function `ptrace_get_syscall_info':
   kernel/ptrace.c:998: undefined reference to `memset'
   powerpc-linux-ld: kernel/ptrace.o: in function `copy_siginfo':
   include/linux/signal.h:18: undefined reference to `memcpy'
   powerpc-linux-ld: include/linux/signal.h:18: undefined reference to `memcpy'
   powerpc-linux-ld: include/linux/signal.h:18: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/user.o: in function `ratelimit_state_init':
   include/linux/ratelimit.h:12: undefined reference to `memset'
   powerpc-linux-ld: kernel/user.o: in function `__kmem_cache_create':
   include/linux/slab.h:379: undefined reference to `memset'
   powerpc-linux-ld: kernel/signal.o: in function `do_trace_event_raw_event_signal_generate':
   include/trace/events/signal.h:50: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/signal.o: in function `clear_siginfo':
   include/linux/signal.h:23: undefined reference to `memset'
   powerpc-linux-ld: kernel/signal.o: in function `copy_siginfo':
   include/linux/signal.h:18: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/signal.o: in function `do_sigaltstack':
   kernel/signal.c:4396: undefined reference to `memset'
   powerpc-linux-ld: kernel/signal.o: in function `copy_siginfo':
   include/linux/signal.h:18: undefined reference to `memcpy'
   powerpc-linux-ld: include/linux/signal.h:18: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/signal.o: in function `signals_init':
   kernel/signal.c:5011: undefined reference to `memset'
   powerpc-linux-ld: kernel/sys.o: in function `override_release':
   kernel/sys.c:1331: undefined reference to `memset'
   powerpc-linux-ld: kernel/sys.o: in function `__do_sys_newuname':
   kernel/sys.c:1356: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/sys.o: in function `__do_sys_uname':
   kernel/sys.c:1380: undefined reference to `memcpy'
   powerpc-linux-ld: kernel/sys.o: in function `prctl_set_auxv':


vim +18 include/linux/signal.h

^1da177e4c3f415 Linus Torvalds    2005-04-16  14  
ae7795bc6187a15 Eric W. Biederman 2018-09-25  15  static inline void copy_siginfo(kernel_siginfo_t *to,
ae7795bc6187a15 Eric W. Biederman 2018-09-25  16  				const kernel_siginfo_t *from)
ca9eb49aa9562ea James Hogan       2016-02-08  17  {
ca9eb49aa9562ea James Hogan       2016-02-08 @18  	memcpy(to, from, sizeof(*to));
ca9eb49aa9562ea James Hogan       2016-02-08  19  }
ca9eb49aa9562ea James Hogan       2016-02-08  20  
ae7795bc6187a15 Eric W. Biederman 2018-09-25  21  static inline void clear_siginfo(kernel_siginfo_t *info)
8c5dbf2ae00bb86 Eric W. Biederman 2017-07-24  22  {
8c5dbf2ae00bb86 Eric W. Biederman 2017-07-24 @23  	memset(info, 0, sizeof(*info));
8c5dbf2ae00bb86 Eric W. Biederman 2017-07-24  24  }
8c5dbf2ae00bb86 Eric W. Biederman 2017-07-24  25  
4ce5f9c9e754691 Eric W. Biederman 2018-09-25  26  #define SI_EXPANSION_SIZE (sizeof(struct siginfo) - sizeof(struct kernel_siginfo))
4ce5f9c9e754691 Eric W. Biederman 2018-09-25  27  
fa4751f454e6b51 Eric W. Biederman 2020-05-05  28  static inline void copy_siginfo_to_external(siginfo_t *to,
fa4751f454e6b51 Eric W. Biederman 2020-05-05  29  					    const kernel_siginfo_t *from)
fa4751f454e6b51 Eric W. Biederman 2020-05-05  30  {
fa4751f454e6b51 Eric W. Biederman 2020-05-05 @31  	memcpy(to, from, sizeof(*from));
fa4751f454e6b51 Eric W. Biederman 2020-05-05 @32  	memset(((char *)to) + sizeof(struct kernel_siginfo), 0,
fa4751f454e6b51 Eric W. Biederman 2020-05-05  33  		SI_EXPANSION_SIZE);
fa4751f454e6b51 Eric W. Biederman 2020-05-05  34  }
fa4751f454e6b51 Eric W. Biederman 2020-05-05  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

