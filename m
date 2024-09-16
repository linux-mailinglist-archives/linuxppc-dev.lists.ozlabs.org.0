Return-Path: <linuxppc-dev+bounces-1415-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF7D97A8DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2024 23:41:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6yzT5CwLz2yQl;
	Tue, 17 Sep 2024 07:41:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726522901;
	cv=none; b=RF7PDM0hZAPUx5/wLDt+jepj0YohT2MsRzdYt72/Yr5rKMHyNDJR61En8LvM1pWLFZ+lEirUyqRHBnqHl1lu5gq1hxSfSyaLLsAY02U931ag6zAXEFJXw5y2327Iuti27+QsMQDzTJOc7a+Xqbg08hGOdhYY0UlF9GVtZWiJbh8HS7Vg80EfP3sRvXn8WbqohD4YCi2Dj4PESBn9ocGMvMnc9haN24x5gud6Hm9wJbfxAQBUGVFqJR9FRDK0kJ4QCk4B9BQpZjLVkxTVus5rYehAN7ijeEYAIq4X0X8Aybq0JySjiM6GlVY+CzLA7nIIT0HM4AEtcfBcvnHJufW9zA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726522901; c=relaxed/relaxed;
	bh=VGGmqYQsUaEWZUjnF8lPKE8ypiUz8GyZQrA5CV+C8yU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIIWjTX28Kgo26a4LniwN9jtcSSujp0g7FNMJTBqLhNQg1/U61KDGWnLt1ie5Sdiua1p/62c5soKMnfE8Zr5/V9wZnv7UF7VJcaBcsLkc9tNbArJn24ZSVkfbxOWEThbkztQMv5pRoLVjZ0thmra2ITxjOl06wG8uVrSQq5Gq1OnseZJbCdJj5OrtQKDTz33XFGCdALSKnCH9lssaxRMFFdeF+H0ok6u2Hv1zouD4xkOlTlUgfCKIz8vGl0IodQxdbujp/nWfmaanUg/AkFj5kbXxKeBic5xYh7IPBi7QcIiiY9fdGj/hBf8WtnvYSswen76FpY/39R5KF/z63Ctsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hb6/u95v; dkim-atps=neutral; spf=pass (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hb6/u95v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6yzR6q4mz2yQL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2024 07:41:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726522900; x=1758058900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1zRsZgrfyFa7VrC3dlcujk2pReT4Go7ohujWLrGRzCU=;
  b=Hb6/u95vhd7DODm3Qv4WIDLUlQfKS1XHGYYEp2Rpp4HmcqDzDN+tDxSP
   P2rPi+cQyj4KP5S0I+4qSQYwTr7yJQElT4E1ynh4O4IHBRg38QGTTg2Qk
   bO9+R+mow/pHL2oE/TIbGv2JORHrRVzWVjfeAAG+dLNrzifzyPUbC40Ld
   sYZ3Axb/GI4ET6eaz8kBLtGbniUIZ0OxDTbche0VT0EZRHs2IFA+Pjkne
   yTPnyH9OS7QW9yV3GmBLU44Seu4LIrjPnHsBzXpUxBbp6s7aU1ubENniv
   1jt+qNyu4VQX9aCAOapm5uFPf2ORom7IYVCUq4H/HktLCQvY6yo+ye2M2
   g==;
X-CSE-ConnectionGUID: P6/j5jF2RIeFLYPlvkMenw==
X-CSE-MsgGUID: wCg7WxOwT2+VNxB216Yhqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="28278911"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="28278911"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 14:41:34 -0700
X-CSE-ConnectionGUID: m89t8977TSy3Gh4LyZRpEg==
X-CSE-MsgGUID: er0W4ujrT3uAcRlLZbf7kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="106456492"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Sep 2024 14:41:29 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqJTK-000AWV-2G;
	Mon, 16 Sep 2024 21:41:26 +0000
Date: Tue, 17 Sep 2024 05:41:18 +0800
From: kernel test robot <lkp@intel.com>
To: Hari Bathini <hbathini@linux.ibm.com>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Naveen N. Rao" <naveen@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Vishal Chourasia <vishalc@linux.ibm.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v5 17/17] powerpc64/bpf: Add support for bpf trampolines
Message-ID: <202409170544.6d1odaN2-lkp@intel.com>
References: <20240915205648.830121-18-hbathini@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240915205648.830121-18-hbathini@linux.ibm.com>

Hi Hari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes masahiroy-kbuild/for-next masahiroy-kbuild/fixes linus/master v6.11 next-20240916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hari-Bathini/powerpc-trace-Account-for-fpatchable-function-entry-support-by-toolchain/20240916-050056
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20240915205648.830121-18-hbathini%40linux.ibm.com
patch subject: [PATCH v5 17/17] powerpc64/bpf: Add support for bpf trampolines
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240917/202409170544.6d1odaN2-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409170544.6d1odaN2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409170544.6d1odaN2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/net/bpf_jit_comp.c:11:
   In file included from arch/powerpc/include/asm/cacheflush.h:7:
   In file included from include/linux/mm.h:2228:
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
>> arch/powerpc/net/bpf_jit_comp.c:872:70: warning: variable 'r4_off' is uninitialized when used here [-Wuninitialized]
     872 |                         bpf_trampoline_setup_tail_call_cnt(image, ctx, func_frame_offset, r4_off);
         |                                                                                           ^~~~~~
   arch/powerpc/net/bpf_jit_comp.c:654:87: note: initialize the variable 'r4_off' to silence this warning
     654 |         int regs_off, nregs_off, ip_off, run_ctx_off, retval_off, nvr_off, alt_lr_off, r4_off;
         |                                                                                              ^
         |                                                                                               = 0
   6 warnings generated.


vim +/r4_off +872 arch/powerpc/net/bpf_jit_comp.c

   647	
   648	static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_image,
   649						 void *rw_image_end, void *ro_image,
   650						 const struct btf_func_model *m, u32 flags,
   651						 struct bpf_tramp_links *tlinks,
   652						 void *func_addr)
   653	{
   654		int regs_off, nregs_off, ip_off, run_ctx_off, retval_off, nvr_off, alt_lr_off, r4_off;
   655		int i, ret, nr_regs, bpf_frame_size = 0, bpf_dummy_frame_size = 0, func_frame_offset;
   656		struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
   657		struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
   658		struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
   659		struct codegen_context codegen_ctx, *ctx;
   660		u32 *image = (u32 *)rw_image;
   661		ppc_inst_t branch_insn;
   662		u32 *branches = NULL;
   663		bool save_ret;
   664	
   665		if (IS_ENABLED(CONFIG_PPC32))
   666			return -EOPNOTSUPP;
   667	
   668		nr_regs = m->nr_args;
   669		/* Extra registers for struct arguments */
   670		for (i = 0; i < m->nr_args; i++)
   671			if (m->arg_size[i] > SZL)
   672				nr_regs += round_up(m->arg_size[i], SZL) / SZL - 1;
   673	
   674		if (nr_regs > MAX_BPF_FUNC_ARGS)
   675			return -EOPNOTSUPP;
   676	
   677		ctx = &codegen_ctx;
   678		memset(ctx, 0, sizeof(*ctx));
   679	
   680		/*
   681		 * Generated stack layout:
   682		 *
   683		 * func prev back chain         [ back chain        ]
   684		 *                              [                   ]
   685		 * bpf prog redzone/tailcallcnt [ ...               ] 64 bytes (64-bit powerpc)
   686		 *                              [                   ] --
   687		 * LR save area                 [ r0 save (64-bit)  ]   | header
   688		 *                              [ r0 save (32-bit)  ]   |
   689		 * dummy frame for unwind       [ back chain 1      ] --
   690		 *                              [ padding           ] align stack frame
   691		 *       r4_off                 [ r4 (tailcallcnt)  ] optional - 32-bit powerpc
   692		 *       alt_lr_off             [ real lr (ool stub)] optional - actual lr
   693		 *                              [ r26               ]
   694		 *       nvr_off                [ r25               ] nvr save area
   695		 *       retval_off             [ return value      ]
   696		 *                              [ reg argN          ]
   697		 *                              [ ...               ]
   698		 *       regs_off               [ reg_arg1          ] prog ctx context
   699		 *       nregs_off              [ args count        ]
   700		 *       ip_off                 [ traced function   ]
   701		 *                              [ ...               ]
   702		 *       run_ctx_off            [ bpf_tramp_run_ctx ]
   703		 *                              [ reg argN          ]
   704		 *                              [ ...               ]
   705		 *       param_save_area        [ reg_arg1          ] min 8 doublewords, per ABI
   706		 *                              [ TOC save (64-bit) ] --
   707		 *                              [ LR save (64-bit)  ]   | header
   708		 *                              [ LR save (32-bit)  ]   |
   709		 * bpf trampoline frame	        [ back chain 2      ] --
   710		 *
   711		 */
   712	
   713		/* Minimum stack frame header */
   714		bpf_frame_size = STACK_FRAME_MIN_SIZE;
   715	
   716		/*
   717		 * Room for parameter save area.
   718		 *
   719		 * As per the ABI, this is required if we call into the traced
   720		 * function (BPF_TRAMP_F_CALL_ORIG):
   721		 * - if the function takes more than 8 arguments for the rest to spill onto the stack
   722		 * - or, if the function has variadic arguments
   723		 * - or, if this functions's prototype was not available to the caller
   724		 *
   725		 * Reserve space for at least 8 registers for now. This can be optimized later.
   726		 */
   727		bpf_frame_size += (nr_regs > 8 ? nr_regs : 8) * SZL;
   728	
   729		/* Room for struct bpf_tramp_run_ctx */
   730		run_ctx_off = bpf_frame_size;
   731		bpf_frame_size += round_up(sizeof(struct bpf_tramp_run_ctx), SZL);
   732	
   733		/* Room for IP address argument */
   734		ip_off = bpf_frame_size;
   735		if (flags & BPF_TRAMP_F_IP_ARG)
   736			bpf_frame_size += SZL;
   737	
   738		/* Room for args count */
   739		nregs_off = bpf_frame_size;
   740		bpf_frame_size += SZL;
   741	
   742		/* Room for args */
   743		regs_off = bpf_frame_size;
   744		bpf_frame_size += nr_regs * SZL;
   745	
   746		/* Room for return value of func_addr or fentry prog */
   747		retval_off = bpf_frame_size;
   748		save_ret = flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FENTRY_RET);
   749		if (save_ret)
   750			bpf_frame_size += SZL;
   751	
   752		/* Room for nvr save area */
   753		nvr_off = bpf_frame_size;
   754		bpf_frame_size += 2 * SZL;
   755	
   756		/* Optional save area for actual LR in case of ool ftrace */
   757		if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE)) {
   758			alt_lr_off = bpf_frame_size;
   759			bpf_frame_size += SZL;
   760		}
   761	
   762		if (IS_ENABLED(CONFIG_PPC32)) {
   763			if (nr_regs < 2) {
   764				r4_off = bpf_frame_size;
   765				bpf_frame_size += SZL;
   766			} else {
   767				r4_off = regs_off + SZL;
   768			}
   769		}
   770	
   771		/* Padding to align stack frame, if any */
   772		bpf_frame_size = round_up(bpf_frame_size, SZL * 2);
   773	
   774		/* Dummy frame size for proper unwind - includes 64-bytes red zone for 64-bit powerpc */
   775		bpf_dummy_frame_size = STACK_FRAME_MIN_SIZE + 64;
   776	
   777		/* Offset to the traced function's stack frame */
   778		func_frame_offset = bpf_dummy_frame_size + bpf_frame_size;
   779	
   780		/* Create dummy frame for unwind, store original return value */
   781		EMIT(PPC_RAW_STL(_R0, _R1, PPC_LR_STKOFF));
   782		/* Protect red zone where tail call count goes */
   783		EMIT(PPC_RAW_STLU(_R1, _R1, -bpf_dummy_frame_size));
   784	
   785		/* Create our stack frame */
   786		EMIT(PPC_RAW_STLU(_R1, _R1, -bpf_frame_size));
   787	
   788		/* 64-bit: Save TOC and load kernel TOC */
   789		if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && !IS_ENABLED(CONFIG_PPC_KERNEL_PCREL)) {
   790			EMIT(PPC_RAW_STD(_R2, _R1, 24));
   791			PPC64_LOAD_PACA();
   792		}
   793	
   794		/* 32-bit: save tail call count in r4 */
   795		if (IS_ENABLED(CONFIG_PPC32) && nr_regs < 2)
   796			EMIT(PPC_RAW_STL(_R4, _R1, r4_off));
   797	
   798		bpf_trampoline_save_args(image, ctx, func_frame_offset, nr_regs, regs_off);
   799	
   800		/* Save our return address */
   801		EMIT(PPC_RAW_MFLR(_R3));
   802		if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE))
   803			EMIT(PPC_RAW_STL(_R3, _R1, alt_lr_off));
   804		else
   805			EMIT(PPC_RAW_STL(_R3, _R1, bpf_frame_size + PPC_LR_STKOFF));
   806	
   807		/*
   808		 * Save ip address of the traced function.
   809		 * We could recover this from LR, but we will need to address for OOL trampoline,
   810		 * and optional GEP area.
   811		 */
   812		if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE) || flags & BPF_TRAMP_F_IP_ARG) {
   813			EMIT(PPC_RAW_LWZ(_R4, _R3, 4));
   814			EMIT(PPC_RAW_SLWI(_R4, _R4, 6));
   815			EMIT(PPC_RAW_SRAWI(_R4, _R4, 6));
   816			EMIT(PPC_RAW_ADD(_R3, _R3, _R4));
   817			EMIT(PPC_RAW_ADDI(_R3, _R3, 4));
   818		}
   819	
   820		if (flags & BPF_TRAMP_F_IP_ARG)
   821			EMIT(PPC_RAW_STL(_R3, _R1, ip_off));
   822	
   823		if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE))
   824			/* Fake our LR for unwind */
   825			EMIT(PPC_RAW_STL(_R3, _R1, bpf_frame_size + PPC_LR_STKOFF));
   826	
   827		/* Save function arg count -- see bpf_get_func_arg_cnt() */
   828		EMIT(PPC_RAW_LI(_R3, nr_regs));
   829		EMIT(PPC_RAW_STL(_R3, _R1, nregs_off));
   830	
   831		/* Save nv regs */
   832		EMIT(PPC_RAW_STL(_R25, _R1, nvr_off));
   833		EMIT(PPC_RAW_STL(_R26, _R1, nvr_off + SZL));
   834	
   835		if (flags & BPF_TRAMP_F_CALL_ORIG) {
   836			PPC_LI_ADDR(_R3, (unsigned long)im);
   837			ret = bpf_jit_emit_func_call_rel(image, ro_image, ctx,
   838							 (unsigned long)__bpf_tramp_enter);
   839			if (ret)
   840				return ret;
   841		}
   842	
   843		for (i = 0; i < fentry->nr_links; i++)
   844			if (invoke_bpf_prog(image, ro_image, ctx, fentry->links[i], regs_off, retval_off,
   845					    run_ctx_off, flags & BPF_TRAMP_F_RET_FENTRY_RET))
   846				return -EINVAL;
   847	
   848		if (fmod_ret->nr_links) {
   849			branches = kcalloc(fmod_ret->nr_links, sizeof(u32), GFP_KERNEL);
   850			if (!branches)
   851				return -ENOMEM;
   852	
   853			if (invoke_bpf_mod_ret(image, ro_image, ctx, fmod_ret, regs_off, retval_off,
   854					       run_ctx_off, branches)) {
   855				ret = -EINVAL;
   856				goto cleanup;
   857			}
   858		}
   859	
   860		/* Call the traced function */
   861		if (flags & BPF_TRAMP_F_CALL_ORIG) {
   862			/*
   863			 * The address in LR save area points to the correct point in the original function
   864			 * with both PPC_FTRACE_OUT_OF_LINE as well as with traditional ftrace instruction
   865			 * sequence
   866			 */
   867			EMIT(PPC_RAW_LL(_R3, _R1, bpf_frame_size + PPC_LR_STKOFF));
   868			EMIT(PPC_RAW_MTCTR(_R3));
   869	
   870			/* Replicate tail_call_cnt before calling the original BPF prog */
   871			if (flags & BPF_TRAMP_F_TAIL_CALL_CTX)
 > 872				bpf_trampoline_setup_tail_call_cnt(image, ctx, func_frame_offset, r4_off);
   873	
   874			/* Restore args */
   875			bpf_trampoline_restore_args_stack(image, ctx, func_frame_offset, nr_regs, regs_off);
   876	
   877			/* Restore TOC for 64-bit */
   878			if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && !IS_ENABLED(CONFIG_PPC_KERNEL_PCREL))
   879				EMIT(PPC_RAW_LD(_R2, _R1, 24));
   880			EMIT(PPC_RAW_BCTRL());
   881			if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && !IS_ENABLED(CONFIG_PPC_KERNEL_PCREL))
   882				PPC64_LOAD_PACA();
   883	
   884			/* Store return value for bpf prog to access */
   885			EMIT(PPC_RAW_STL(_R3, _R1, retval_off));
   886	
   887			/* Restore updated tail_call_cnt */
   888			if (flags & BPF_TRAMP_F_TAIL_CALL_CTX)
   889				bpf_trampoline_restore_tail_call_cnt(image, ctx, func_frame_offset, r4_off);
   890	
   891			/* Reserve space to patch branch instruction to skip fexit progs */
   892			im->ip_after_call = &((u32 *)ro_image)[ctx->idx];
   893			EMIT(PPC_RAW_NOP());
   894		}
   895	
   896		/* Update branches saved in invoke_bpf_mod_ret with address of do_fexit */
   897		for (i = 0; i < fmod_ret->nr_links && image; i++) {
   898			if (create_cond_branch(&branch_insn, &image[branches[i]],
   899					       (unsigned long)&image[ctx->idx], COND_NE << 16)) {
   900				ret = -EINVAL;
   901				goto cleanup;
   902			}
   903	
   904			image[branches[i]] = ppc_inst_val(branch_insn);
   905		}
   906	
   907		for (i = 0; i < fexit->nr_links; i++)
   908			if (invoke_bpf_prog(image, ro_image, ctx, fexit->links[i], regs_off, retval_off,
   909					    run_ctx_off, false)) {
   910				ret = -EINVAL;
   911				goto cleanup;
   912			}
   913	
   914		if (flags & BPF_TRAMP_F_CALL_ORIG) {
   915			im->ip_epilogue = &((u32 *)ro_image)[ctx->idx];
   916			PPC_LI_ADDR(_R3, im);
   917			ret = bpf_jit_emit_func_call_rel(image, ro_image, ctx,
   918							 (unsigned long)__bpf_tramp_exit);
   919			if (ret)
   920				goto cleanup;
   921		}
   922	
   923		if (flags & BPF_TRAMP_F_RESTORE_REGS)
   924			bpf_trampoline_restore_args_regs(image, ctx, nr_regs, regs_off);
   925	
   926		/* Restore return value of func_addr or fentry prog */
   927		if (save_ret)
   928			EMIT(PPC_RAW_LL(_R3, _R1, retval_off));
   929	
   930		/* Restore nv regs */
   931		EMIT(PPC_RAW_LL(_R26, _R1, nvr_off + SZL));
   932		EMIT(PPC_RAW_LL(_R25, _R1, nvr_off));
   933	
   934		/* Epilogue */
   935		if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) && !IS_ENABLED(CONFIG_PPC_KERNEL_PCREL))
   936			EMIT(PPC_RAW_LD(_R2, _R1, 24));
   937		if (flags & BPF_TRAMP_F_SKIP_FRAME) {
   938			/* Skip the traced function and return to parent */
   939			EMIT(PPC_RAW_ADDI(_R1, _R1, func_frame_offset));
   940			EMIT(PPC_RAW_LL(_R0, _R1, PPC_LR_STKOFF));
   941			EMIT(PPC_RAW_MTLR(_R0));
   942			EMIT(PPC_RAW_BLR());
   943		} else {
   944			if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE)) {
   945				EMIT(PPC_RAW_LL(_R0, _R1, alt_lr_off));
   946				EMIT(PPC_RAW_MTLR(_R0));
   947				EMIT(PPC_RAW_ADDI(_R1, _R1, func_frame_offset));
   948				EMIT(PPC_RAW_LL(_R0, _R1, PPC_LR_STKOFF));
   949				EMIT(PPC_RAW_BLR());
   950			} else {
   951				EMIT(PPC_RAW_LL(_R0, _R1, bpf_frame_size + PPC_LR_STKOFF));
   952				EMIT(PPC_RAW_MTCTR(_R0));
   953				EMIT(PPC_RAW_ADDI(_R1, _R1, func_frame_offset));
   954				EMIT(PPC_RAW_LL(_R0, _R1, PPC_LR_STKOFF));
   955				EMIT(PPC_RAW_MTLR(_R0));
   956				EMIT(PPC_RAW_BCTR());
   957			}
   958		}
   959	
   960		/* Make sure the trampoline generation logic doesn't overflow */
   961		if (image && WARN_ON_ONCE(&image[ctx->idx] > (u32 *)rw_image_end - BPF_INSN_SAFETY)) {
   962			ret = -EFAULT;
   963			goto cleanup;
   964		}
   965		ret = ctx->idx * 4 + BPF_INSN_SAFETY * 4;
   966	
   967	cleanup:
   968		kfree(branches);
   969		return ret;
   970	}
   971	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

