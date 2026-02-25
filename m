Return-Path: <linuxppc-dev+bounces-17200-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MQAGuYtn2lXZQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17200-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 18:14:14 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6680119B53D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 18:14:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLh5Z3Sblz3f8g;
	Thu, 26 Feb 2026 04:14:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772039650;
	cv=none; b=ZM5ZvhDKryR9bTfOmCZJC8v9FGP+PQZMA/T5iL9Ni3p5z4TEPc4gVqdDqt2aNPzjPmWzmDtPKpkfb7rbIZeiR5bDyPWfFr4kbh/gCsZSSIgTduRwhphpQP1s+syomUP3PIP8qt2QIbKczV3veYRpTeZvlzc3MUeYykaZ3Ere5niqYfBYStnXpnC2tsAFCh7OEyrlFl1JglEfVwWlPBfoOHyIYUkhJP5gsmlB/oxq26qnE39X2z0CxgRLm+v+EEPEO9qkM8chZ/MqjMNbVdyKQ8gdYE44HVxAEhWvK6laE2bc+0w0qV/2cQbhQEAFoElV470EEzJQK41UFdF9RsXTgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772039650; c=relaxed/relaxed;
	bh=Q42GLTn5a0R+tLtHjOc0KdYXLyGxhb2ZiPwq/Xz30Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lu0tTVkp4iKUDZI8cZuz8l5zkzbRYP7fXpT+Fm7vMy5k1tnjdUW6g5UGkD7LjzkxNtN0fvvvUa9fM1T2VmXiOAVUpS/k6gahcUGst7vJldu4mqXwAcfBzTXHtcnaI/2cScFfBZxAEGhzzcCW7/yXikty1Q1+1VNRPdfpXzd67+4lpNUJIiC7CqPyJ/+INabsybv09qqx7RdzwITC+2+XAAk+71G8hZW48lD8jLXjHWoZPced0tx7PFr7gORVvhNcc+BG/hbzf5rtneMufroGaWfOvuC/nTJWNx8BmTvT/2XVsXEAsVz1arA93RVtwl8wN1yH8rFlp/k/YiXgo8mKew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PJjptSQZ; dkim-atps=neutral; spf=pass (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PJjptSQZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLh5W0VL0z3f82
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 04:14:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772039647; x=1803575647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nUo04ih3SDy0r3suDHQjkZDw8s/+NqXtWaoVNaiVJzk=;
  b=PJjptSQZ54sKjXZz/m85uFLX2+Urs3MhWnCAGDtN/tu4yKKBTegQlIUg
   q8fushiTrgohbSfYmUrEhUV0XFE5Mwn+PpLSqpcPs2pH8X6UYIhuDrtmi
   +v8jpAcyT/wkxaTu89of5KHydbtQvu4kHq6oM6CQDy2POHyVI+1waPcTd
   7XFbIHa1Znp5FPiFa655hzsIiokgTfhi/h0i+IOZSQTZGVdm9PrkMJ0D2
   6ZB8HI4/NQ2yZsrg6TDPeczy5Z4GfF5W6IRP1CFnkQNIFw6WDYYVmMDDP
   sefdeQKwRWa0CUCylaGouB2KqJKvyKi/XknY1P5gdZ2Du3dV3Wof8E39w
   g==;
X-CSE-ConnectionGUID: 7lxQWLqVQlKnj2mq62tMlg==
X-CSE-MsgGUID: cePi7FIbTVW9tNaAkYC68Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="98555864"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="98555864"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 09:14:01 -0800
X-CSE-ConnectionGUID: Nr6cnKMKQNmf9WXDGJ6XbA==
X-CSE-MsgGUID: ERRqZfocT9ilA52qPrFI0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="215516689"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 25 Feb 2026 09:13:58 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvISR-000000006gP-1Lft;
	Wed, 25 Feb 2026 17:13:55 +0000
Date: Thu, 26 Feb 2026 01:13:18 +0800
From: kernel test robot <lkp@intel.com>
To: adubey@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org,
	hbathini@linux.ibm.com, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, maddy@linux.ibm.com,
	Abhishek Dubey <adubey@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] powerpc64/bpf: Implement JIT support for private
 stack
Message-ID: <202602260116.5ljOxwdH-lkp@intel.com>
References: <20260225153950.15331-1-adubey@linux.ibm.com>
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
In-Reply-To: <20260225153950.15331-1-adubey@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17200-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:adubey@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:oe-kbuild-all@lists.linux.dev,m:bpf@vger.kernel.org,m:hbathini@linux.ibm.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:maddy@linux.ibm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,git-scm.com:url]
X-Rspamd-Queue-Id: 6680119B53D
X-Rspamd-Action: no action

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]
[also build test WARNING on bpf/master powerpc/next linus/master v7.0-rc1 next-20260224]
[cannot apply to bpf-next/net powerpc/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/adubey-linux-ibm-com/selftests-bpf-Enable-private-stack-tests-for-powerpc64/20260225-184532
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260225153950.15331-1-adubey%40linux.ibm.com
patch subject: [PATCH v2 1/2] powerpc64/bpf: Implement JIT support for private stack
config: powerpc-randconfig-r123-20260225 (https://download.01.org/0day-ci/archive/20260226/202602260116.5ljOxwdH-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602260116.5ljOxwdH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602260116.5ljOxwdH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/net/bpf_jit_comp.c:222:7: warning: variable 'addrs' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     222 |                 if (!priv_stack_ptr) {
         |                     ^~~~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:370:9: note: uninitialized use occurs here
     370 |                 kfree(addrs);
         |                       ^~~~~
   arch/powerpc/net/bpf_jit_comp.c:222:3: note: remove the 'if' if its condition is always false
     222 |                 if (!priv_stack_ptr) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~
     223 |                         fp = org_fp;
         |                         ~~~~~~~~~~~~
     224 |                         goto out_priv_stack;
         |                         ~~~~~~~~~~~~~~~~~~~~
     225 |                 }
         |                 ~
   arch/powerpc/net/bpf_jit_comp.c:171:12: note: initialize the variable 'addrs' to silence this warning
     171 |         u32 *addrs;
         |                   ^
         |                    = NULL
   1 warning generated.


vim +222 arch/powerpc/net/bpf_jit_comp.c

   164	
   165	struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
   166	{
   167		u32 proglen;
   168		u32 alloclen;
   169		u8 *image = NULL;
   170		u32 *code_base;
   171		u32 *addrs;
   172		struct powerpc_jit_data *jit_data;
   173		struct codegen_context cgctx;
   174		int pass;
   175		int flen;
   176		int priv_stack_alloc_size;
   177		void __percpu *priv_stack_ptr = NULL;
   178		struct bpf_binary_header *fhdr = NULL;
   179		struct bpf_binary_header *hdr = NULL;
   180		struct bpf_prog *org_fp = fp;
   181		struct bpf_prog *tmp_fp;
   182		bool bpf_blinded = false;
   183		bool extra_pass = false;
   184		u8 *fimage = NULL;
   185		u32 *fcode_base;
   186		u32 extable_len;
   187		u32 fixup_len;
   188	
   189		if (!fp->jit_requested)
   190			return org_fp;
   191	
   192		tmp_fp = bpf_jit_blind_constants(org_fp);
   193		if (IS_ERR(tmp_fp))
   194			return org_fp;
   195	
   196		if (tmp_fp != org_fp) {
   197			bpf_blinded = true;
   198			fp = tmp_fp;
   199		}
   200	
   201		jit_data = fp->aux->jit_data;
   202		if (!jit_data) {
   203			jit_data = kzalloc_obj(*jit_data);
   204			if (!jit_data) {
   205				fp = org_fp;
   206				goto out;
   207			}
   208			fp->aux->jit_data = jit_data;
   209		}
   210	
   211		priv_stack_ptr = fp->aux->priv_stack_ptr;
   212		if (!priv_stack_ptr && fp->aux->jits_use_priv_stack) {
   213			/*
   214			 * Allocate private stack of size equivalent to
   215			 * verifier-calculated stack size plus two memory
   216			 * guard regions to detect private stack overflow
   217			 * and underflow.
   218			 */
   219			priv_stack_alloc_size = round_up(fp->aux->stack_depth, 16) +
   220								2 * PRIV_STACK_GUARD_SZ;
   221			priv_stack_ptr = __alloc_percpu_gfp(priv_stack_alloc_size, 16, GFP_KERNEL);
 > 222			if (!priv_stack_ptr) {
   223				fp = org_fp;
   224				goto out_priv_stack;
   225			}
   226	
   227			priv_stack_init_guard(priv_stack_ptr, priv_stack_alloc_size);
   228			fp->aux->priv_stack_ptr = priv_stack_ptr;
   229		}
   230	
   231		flen = fp->len;
   232		addrs = jit_data->addrs;
   233		if (addrs) {
   234			cgctx = jit_data->ctx;
   235			/*
   236			 * JIT compiled to a writable location (image/code_base) first.
   237			 * It is then moved to the readonly final location (fimage/fcode_base)
   238			 * using instruction patching.
   239			 */
   240			fimage = jit_data->fimage;
   241			fhdr = jit_data->fhdr;
   242			proglen = jit_data->proglen;
   243			hdr = jit_data->hdr;
   244			image = (void *)hdr + ((void *)fimage - (void *)fhdr);
   245			extra_pass = true;
   246			/* During extra pass, ensure index is reset before repopulating extable entries */
   247			cgctx.exentry_idx = 0;
   248			goto skip_init_ctx;
   249		}
   250	
   251		addrs = kcalloc(flen + 1, sizeof(*addrs), GFP_KERNEL);
   252		if (addrs == NULL) {
   253			fp = org_fp;
   254			goto out_addrs;
   255		}
   256	
   257		memset(&cgctx, 0, sizeof(struct codegen_context));
   258		bpf_jit_init_reg_mapping(&cgctx);
   259	
   260		/* Make sure that the stack is quadword aligned. */
   261		cgctx.stack_size = round_up(fp->aux->stack_depth, 16);
   262		cgctx.arena_vm_start = bpf_arena_get_kern_vm_start(fp->aux->arena);
   263		cgctx.user_vm_start = bpf_arena_get_user_vm_start(fp->aux->arena);
   264		cgctx.is_subprog = bpf_is_subprog(fp);
   265		cgctx.exception_boundary = fp->aux->exception_boundary;
   266		cgctx.exception_cb = fp->aux->exception_cb;
   267		cgctx.priv_sp = priv_stack_ptr;
   268	
   269		/* Scouting faux-generate pass 0 */
   270		if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
   271			/* We hit something illegal or unsupported. */
   272			fp = org_fp;
   273			goto out_addrs;
   274		}
   275	
   276		/*
   277		 * If we have seen a tail call, we need a second pass.
   278		 * This is because bpf_jit_emit_common_epilogue() is called
   279		 * from bpf_jit_emit_tail_call() with a not yet stable ctx->seen.
   280		 * We also need a second pass if we ended up with too large
   281		 * a program so as to ensure BPF_EXIT branches are in range.
   282		 */
   283		if (cgctx.seen & SEEN_TAILCALL || !is_offset_in_branch_range((long)cgctx.idx * 4)) {
   284			cgctx.idx = 0;
   285			if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
   286				fp = org_fp;
   287				goto out_addrs;
   288			}
   289		}
   290	
   291		bpf_jit_realloc_regs(&cgctx);
   292		/*
   293		 * Pretend to build prologue, given the features we've seen.  This will
   294		 * update ctgtx.idx as it pretends to output instructions, then we can
   295		 * calculate total size from idx.
   296		 */
   297		bpf_jit_build_prologue(NULL, &cgctx);
   298		addrs[fp->len] = cgctx.idx * 4;
   299		bpf_jit_build_epilogue(NULL, &cgctx);
   300	
   301		fixup_len = fp->aux->num_exentries * BPF_FIXUP_LEN * 4;
   302		extable_len = fp->aux->num_exentries * sizeof(struct exception_table_entry);
   303	
   304		proglen = cgctx.idx * 4;
   305		alloclen = proglen + FUNCTION_DESCR_SIZE + fixup_len + extable_len;
   306	
   307		fhdr = bpf_jit_binary_pack_alloc(alloclen, &fimage, 4, &hdr, &image,
   308						      bpf_jit_fill_ill_insns);
   309		if (!fhdr) {
   310			fp = org_fp;
   311			goto out_addrs;
   312		}
   313	
   314		if (extable_len)
   315			fp->aux->extable = (void *)fimage + FUNCTION_DESCR_SIZE + proglen + fixup_len;
   316	
   317	skip_init_ctx:
   318		code_base = (u32 *)(image + FUNCTION_DESCR_SIZE);
   319		fcode_base = (u32 *)(fimage + FUNCTION_DESCR_SIZE);
   320	
   321		/* Code generation passes 1-2 */
   322		for (pass = 1; pass < 3; pass++) {
   323			/* Now build the prologue, body code & epilogue for real. */
   324			cgctx.idx = 0;
   325			cgctx.alt_exit_addr = 0;
   326			bpf_jit_build_prologue(code_base, &cgctx);
   327			if (bpf_jit_build_body(fp, code_base, fcode_base, &cgctx, addrs, pass,
   328					       extra_pass)) {
   329				bpf_arch_text_copy(&fhdr->size, &hdr->size, sizeof(hdr->size));
   330				bpf_jit_binary_pack_free(fhdr, hdr);
   331				fp = org_fp;
   332				goto out_addrs;
   333			}
   334			bpf_jit_build_epilogue(code_base, &cgctx);
   335	
   336			if (bpf_jit_enable > 1)
   337				pr_info("Pass %d: shrink = %d, seen = 0x%x\n", pass,
   338					proglen - (cgctx.idx * 4), cgctx.seen);
   339		}
   340	
   341		if (bpf_jit_enable > 1)
   342			/*
   343			 * Note that we output the base address of the code_base
   344			 * rather than image, since opcodes are in code_base.
   345			 */
   346			bpf_jit_dump(flen, proglen, pass, code_base);
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

