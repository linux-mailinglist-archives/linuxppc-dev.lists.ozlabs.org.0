Return-Path: <linuxppc-dev+bounces-15746-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC190D21109
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 20:40:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drxLD0FBzz2xT6;
	Thu, 15 Jan 2026 06:40:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768419651;
	cv=none; b=G6UtH8mx69uThw3wkgAbuyAv7NMxVckUONh4KWJRwHGrqycyuEx3yyfuJsH57vYG6sl1qyV8t72F+p3pt6lwj++MsRj0ga1L6RzDOAzJ1IVQO2VSTuAtCKLXmfP/CgBPIZuXgYJfAVo7swhGFwP0jEz8JJN7IIBq+vhCNS4+o57/N0LQSpfClL59RjA8Ly+cUOp6p9Cz6+VMvZdztj1G11kpWFerChBsWQnRNYs+pU2xRiMN2QmfN9LVtDe2jVK3V6yyQXyWpOULMqAgOmOlC7UDsgYny9OTnnNJjmfd+uSJz/p1LEZV/c1sAqtw4wedvmPdxh0MEKtHylQt5wFv8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768419651; c=relaxed/relaxed;
	bh=82xeGTi7nQHMheuHXFwD4MGo8PhvN6ArEHvusLLuKIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bugRx7YF3V9xxkQLk9OYvY/K13cG+A3+EVgs3mGQVNlgcNtKtn9nO6cyzFaG4uquV4PUOJDo+0HngvqBa4qI2Mjk247jtKpbtFWTIBRSjM+iCKOD6xcQIvkKTk7USCZpbKKHHOf0SAOSULeRi6iKKS5yGuV2UQLr0Itga8vvqGxYBkEq8KDG8KCwXY57GmoP1Ote0Mbfy7aE5FiccLowyrC2TP8cvvttsimhG4u+KdBikXNQaSKwxwhmLxTNUOpYuF2GZdSwQSI3iGdLb6QCCNxiMZdFRMxMZdeUaUj4pExAHEzkywnxnudGzvlnQUXy7Cwc1yOOOAJogr7D+sGkCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cWcU4bqD; dkim-atps=neutral; spf=temperror (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cWcU4bqD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=temperror (SPF Temporary Error: DNS Timeout) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drxL81m2tz2xMt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 06:40:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768419648; x=1799955648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yxJ1yuBoC2AtK5ufCDSR1KJOWKcLvyq8eTR2PZlXqSc=;
  b=cWcU4bqDarS68X/5G8dO5Yx3JxMmcYKpS1zm0yLKq/fwP0N/rYdhnveU
   UoV7C2TZCrm5TKAzIKmWc3OKvSB7Jf6EAAOSLWczsGGilUqawjOfYdrR7
   xdYSr0B6PI15HmPXt2+GbQGIUHnooGwcLw/lU4gJsX9e/rDBt2hoxBAWz
   gYrRGhwdY1T+BlakzJd3GFY8u6/6/IF7IOiH4oChIerfAEk42wWVDtavY
   H7vE8KOdEKeUgWGhHZ/fGTfU0bVgpUJsUB97qn+OsrocfMFUm62UMS+RO
   lng34jC002038X5I3kDudiQScntd6tF+NmlLSc5L96MYPQmWLwB89qL2A
   g==;
X-CSE-ConnectionGUID: zUgxVQZETNiDPzMJGps1eQ==
X-CSE-MsgGUID: vrYVifynRU+NCNINp2yMvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69812179"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69812179"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 11:40:24 -0800
X-CSE-ConnectionGUID: 0gNFD7mhTwmJDzX5k4RTRg==
X-CSE-MsgGUID: ep3If0rfTJGULNiOAdv5xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204550709"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jan 2026 11:40:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg6j0-00000000GvQ-23re;
	Wed, 14 Jan 2026 19:40:14 +0000
Date: Thu, 15 Jan 2026 03:39:53 +0800
From: kernel test robot <lkp@intel.com>
To: adubey@linux.ibm.com, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, hbathini@linux.ibm.com,
	sachinpb@linux.ibm.com, venkat88@linux.ibm.com, andrii@kernel.org,
	eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
	daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
	yonghong.song@linux.dev, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
	jolsa@kernel.org, christophe.leroy@csgroup.eu, naveen@kernel.org,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	memxor@gmail.com, iii@linux.ibm.com, shuah@kernel.org,
	Abhishek Dubey <adubey@linux.ibm.com>
Subject: Re: [PATCH v2 3/6] powerpc64/bpf: Tailcall handling with trampolines
Message-ID: <202601150350.ZftaCBVV-lkp@intel.com>
References: <20260114114450.30405-4-adubey@linux.ibm.com>
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
In-Reply-To: <20260114114450.30405-4-adubey@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.19-rc5 next-20260114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/adubey-linux-ibm-com/powerpc64-bpf-Move-tail_call_cnt-to-bottom-of-stack-frame/20260114-195044
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20260114114450.30405-4-adubey%40linux.ibm.com
patch subject: [PATCH v2 3/6] powerpc64/bpf: Tailcall handling with trampolines
config: powerpc-randconfig-002-20260114 (https://download.01.org/0day-ci/archive/20260115/202601150350.ZftaCBVV-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150350.ZftaCBVV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150350.ZftaCBVV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/net/bpf_jit_comp.c: In function 'bpf_trampoline_setup_tail_call_info':
>> arch/powerpc/net/bpf_jit_comp.c:644:43: error: 'BPF_PPC_TAILCALL' undeclared (first use in this function); did you mean 'BPF_TAIL_CALL'?
     644 |                 int tailcallinfo_offset = BPF_PPC_TAILCALL;
         |                                           ^~~~~~~~~~~~~~~~
         |                                           BPF_TAIL_CALL
   arch/powerpc/net/bpf_jit_comp.c:644:43: note: each undeclared identifier is reported only once for each function it appears in
   arch/powerpc/net/bpf_jit_comp.c: In function '__arch_prepare_bpf_trampoline':
   arch/powerpc/net/bpf_jit_comp.c:850:41: error: 'BPF_PPC_TAILCALL' undeclared (first use in this function); did you mean 'BPF_TAIL_CALL'?
     850 |                 bpf_frame_size += SZL + BPF_PPC_TAILCALL;
         |                                         ^~~~~~~~~~~~~~~~
         |                                         BPF_TAIL_CALL


vim +644 arch/powerpc/net/bpf_jit_comp.c

   625	
   626	/*
   627	 * Refer the label 'Generated stack layout' in this file for actual stack
   628	 * layout during trampoline invocation.
   629	 *
   630	 * Refer __arch_prepare_bpf_trampoline() for stack component details.
   631	 *
   632	 * The tailcall count/reference is present in caller's stack frame. Its required
   633	 * to copy the content of tail_call_info before calling the actual function
   634	 * to which the trampoline is attached.
   635	 *
   636	 */
   637	
   638	static void bpf_trampoline_setup_tail_call_info(u32 *image, struct codegen_context *ctx,
   639						       int func_frame_offset,
   640						       int bpf_dummy_frame_size, int r4_off)
   641	{
   642		if (IS_ENABLED(CONFIG_PPC64)) {
   643			/* See bpf_jit_stack_tailcallinfo_offset() */
 > 644			int tailcallinfo_offset = BPF_PPC_TAILCALL;
   645			/*
   646			 * func_frame_offset =                                   ...(1)
   647			 *     bpf_dummy_frame_size + trampoline_frame_size
   648			 */
   649			EMIT(PPC_RAW_LD(_R4, _R1, func_frame_offset));
   650			EMIT(PPC_RAW_LD(_R3, _R4, -tailcallinfo_offset));
   651	
   652			/*
   653			 * Setting the tail_call_info in trampoline's frame
   654			 * depending on if previous frame had value or reference.
   655			 */
   656			EMIT(PPC_RAW_CMPLWI(_R3, MAX_TAIL_CALL_CNT));
   657			PPC_COND_BRANCH(COND_GT, CTX_NIA(ctx) + 8);
   658			EMIT(PPC_RAW_ADDI(_R3, _R4, bpf_jit_stack_tailcallinfo_offset(ctx)));
   659			/*
   660			 * From ...(1) above:
   661			 * trampoline_frame_bottom =                            ...(2)
   662			 *     func_frame_offset - bpf_dummy_frame_size
   663			 *
   664			 * Using ...(2) derived above:
   665			 *  trampoline_tail_call_info_offset =                  ...(3)
   666			 *      trampoline_frame_bottom - tailcallinfo_offset
   667			 *
   668			 * From ...(3):
   669			 * Use trampoline_tail_call_info_offset to write reference of main's
   670			 * tail_call_info in trampoline frame.
   671			 */
   672			EMIT(PPC_RAW_STL(_R3, _R1, (func_frame_offset - bpf_dummy_frame_size)
   673						- tailcallinfo_offset));
   674	
   675		} else {
   676			/* See bpf_jit_stack_offsetof() and BPF_PPC_TC */
   677			EMIT(PPC_RAW_LL(_R4, _R1, r4_off));
   678		}
   679	}
   680	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

