Return-Path: <linuxppc-dev+bounces-16887-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOhKFuFsk2kb4gEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16887-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 20:15:45 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 807F9147378
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 20:15:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFCCw6Nmnz2ySS;
	Tue, 17 Feb 2026 06:15:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771269340;
	cv=none; b=cdIJcEyD2TF4ZW1TLw/IaXnvR+1X8mGmMaAzULZCL9AFTzHYNH8FHm7mbcH5dNCotH/7Rpcm6DmWMZpPm72rAh3uOASu8PNUMIr1vHZqZo03p/58aHLT2Y17J7MVrT3wY/RgySvhGzmzIuSCrHXnBi8xj1NtTg64bQEOXllWLOl8dAPRxudC8qXLwsLKy29BoolrJOPbIaqbeYB3NRp1cqcjRaZz4xgGG8zxCX2GWEY8g1IiN1CUYe09fiteEiiMOkUeyK2lzWOlt31nlVR8dlX0DATK4DvnZp6HM1ArXXwwVg8agtThPX/HMQls0/w5FDeNiVlygW+7RFQ951tTwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771269340; c=relaxed/relaxed;
	bh=hyfRXvjr5nJVo9V0sq9shn9y3zL71fzSrpzs6KfCdV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqHeL4MV50qB+/84tCd2eRys8Bt4/JJ0UPkSj7bDfbEc4JqPuQSNY9d8J1PS34esLqty+pgnGU5AznfxYxwqAHZgEPqov2LxUtQe86FjKbumVrylNWxkF3T4Xl/6hZaZKj+QCzvm5YE7KIgH2sG5etd9351+Iw5yA4eSiuwnr3f4mW8GkBtYeDLNreoDGx2WKDdzKX3sdOvFmlMYnf/wjN6bmi+tZvu5d7VrdP2+PJf7xUlZu92edwFR//xiAhtYTC7prSKiTIzGyuLSSQUP/IHKI1nk44CUP+S5nEddw/a2PLiEKGpBv48qkzLTGBd1RJfZdfXkdPAUpZjbL+zHGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j1r48TBV; dkim-atps=neutral; spf=pass (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j1r48TBV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFCCs31H0z2xVT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Feb 2026 06:15:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771269336; x=1802805336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5se4Iu/7ubFuyPU7cpRyrrJpTks1JWXd3S01JarPDrg=;
  b=j1r48TBVGjUgX6gRizPRBHqMdFf9BAr3x3cNAQA3MpPnbEWhIv/S0RPJ
   /eS6NuJbc7r9A/Dfkgm/mf3schz1tENTnM8pQAL+NlSn0rezcnJi7eAeF
   QfsEGVFe3TJgLmdXv6SMPA8/Pk6X+ucMG214Vp4IBc1V4jKGvbfFkbWE5
   2sISrFnTLJ3FDD4o7G8TcyuWdrmZtZY9HPtb/IPgklb0on5/yQaH+rXoL
   AEkthSH6D3UnoJw2KCNHBKD3kGcKi6kyJfvUOw3aVjYsqU5DOiV0c4Mtv
   PP5GENMur2cSPWVGrte2eTPXVlbFPFVc4Wc5plu1TfzSV7Vr+xs3aPOPK
   w==;
X-CSE-ConnectionGUID: s8IwW/1iRdC/zGkaMdPsAQ==
X-CSE-MsgGUID: XxlpEP9gQ3mDm03OyZ8/Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83075272"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="83075272"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 11:15:28 -0800
X-CSE-ConnectionGUID: g389iGY3QYOLVaC38m3Aqw==
X-CSE-MsgGUID: QgXzA+KSRYmFUvCkDRvOTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="218674562"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Feb 2026 11:15:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs444-000000010Ci-091H;
	Mon, 16 Feb 2026 19:15:24 +0000
Date: Tue, 17 Feb 2026 03:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: adubey@linux.ibm.com, bpf@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, hbathini@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, martin.lau@kernel.org, eddyz87@gmail.com,
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev,
	chleroy@kernel.org, Abhishek Dubey <adubey@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc64/bpf: Implement JIT support for private
 stack
Message-ID: <202602170316.V2RZWuVa-lkp@intel.com>
References: <20260216152234.36632-1-adubey@linux.ibm.com>
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
In-Reply-To: <20260216152234.36632-1-adubey@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16887-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,linux.ibm.com,lists.ozlabs.org,kernel.org,iogearbox.net,gmail.com,linux.dev,meta.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:adubey@linux.ibm.com,m:bpf@vger.kernel.org,m:oe-kbuild-all@lists.linux.dev,m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@kernel.org,m:eddyz87@gmail.com,m:yonghong.song@linux.dev,m:clm@meta.com,m:ihor.solodrai@linux.dev,m:chleroy@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[intel.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 807F9147378
X-Rspamd-Action: no action

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]
[also build test WARNING on bpf/master powerpc/next linus/master next-20260216]
[cannot apply to bpf-next/net powerpc/fixes v6.19]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/adubey-linux-ibm-com/selftests-bpf-Enable-private-stack-tests-for-powerpc64/20260216-182353
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260216152234.36632-1-adubey%40linux.ibm.com
patch subject: [PATCH 1/2] powerpc64/bpf: Implement JIT support for private stack
config: powerpc-randconfig-001-20260217 (https://download.01.org/0day-ci/archive/20260217/202602170316.V2RZWuVa-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602170316.V2RZWuVa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170316.V2RZWuVa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/net/bpf_jit_comp.c: In function 'bpf_int_jit_compile':
>> arch/powerpc/net/bpf_jit_comp.c:266:35: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     cgctx.priv_sp = priv_stack_ptr ? (u64)priv_stack_ptr : 0;
                                      ^


vim +266 arch/powerpc/net/bpf_jit_comp.c

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
   203			jit_data = kzalloc(sizeof(*jit_data), GFP_KERNEL);
   204			if (!jit_data) {
   205				fp = org_fp;
   206				goto out;
   207			}
   208			fp->aux->jit_data = jit_data;
   209		}
   210	
   211		if (!priv_stack_ptr && fp->aux->jits_use_priv_stack) {
   212			/*
   213			 * Allocate private stack of size equivalent to
   214			 * verifier-calculated stack size plus two memory
   215			 * guard regions to detect private stack overflow
   216			 * and underflow.
   217			 */
   218			priv_stack_alloc_size = round_up(fp->aux->stack_depth, 16) +
   219								2 * PRIV_STACK_GUARD_SZ;
   220			priv_stack_ptr = __alloc_percpu_gfp(priv_stack_alloc_size, 16, GFP_KERNEL);
   221			if (!priv_stack_ptr) {
   222				fp = org_fp;
   223				goto out_priv_stack;
   224			}
   225	
   226			priv_stack_init_guard(priv_stack_ptr, priv_stack_alloc_size);
   227			fp->aux->priv_stack_ptr = priv_stack_ptr;
   228		}
   229	
   230		flen = fp->len;
   231		addrs = jit_data->addrs;
   232		if (addrs) {
   233			cgctx = jit_data->ctx;
   234			/*
   235			 * JIT compiled to a writable location (image/code_base) first.
   236			 * It is then moved to the readonly final location (fimage/fcode_base)
   237			 * using instruction patching.
   238			 */
   239			fimage = jit_data->fimage;
   240			fhdr = jit_data->fhdr;
   241			proglen = jit_data->proglen;
   242			hdr = jit_data->hdr;
   243			image = (void *)hdr + ((void *)fimage - (void *)fhdr);
   244			extra_pass = true;
   245			/* During extra pass, ensure index is reset before repopulating extable entries */
   246			cgctx.exentry_idx = 0;
   247			goto skip_init_ctx;
   248		}
   249	
   250		addrs = kcalloc(flen + 1, sizeof(*addrs), GFP_KERNEL);
   251		if (addrs == NULL) {
   252			fp = org_fp;
   253			goto out_addrs;
   254		}
   255	
   256		memset(&cgctx, 0, sizeof(struct codegen_context));
   257		bpf_jit_init_reg_mapping(&cgctx);
   258	
   259		/* Make sure that the stack is quadword aligned. */
   260		cgctx.stack_size = round_up(fp->aux->stack_depth, 16);
   261		cgctx.arena_vm_start = bpf_arena_get_kern_vm_start(fp->aux->arena);
   262		cgctx.user_vm_start = bpf_arena_get_user_vm_start(fp->aux->arena);
   263		cgctx.is_subprog = bpf_is_subprog(fp);
   264		cgctx.exception_boundary = fp->aux->exception_boundary;
   265		cgctx.exception_cb = fp->aux->exception_cb;
 > 266		cgctx.priv_sp = priv_stack_ptr ? (u64)priv_stack_ptr : 0;
   267	
   268		/* Scouting faux-generate pass 0 */
   269		if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
   270			/* We hit something illegal or unsupported. */
   271			fp = org_fp;
   272			goto out_addrs;
   273		}
   274	
   275		/*
   276		 * If we have seen a tail call, we need a second pass.
   277		 * This is because bpf_jit_emit_common_epilogue() is called
   278		 * from bpf_jit_emit_tail_call() with a not yet stable ctx->seen.
   279		 * We also need a second pass if we ended up with too large
   280		 * a program so as to ensure BPF_EXIT branches are in range.
   281		 */
   282		if (cgctx.seen & SEEN_TAILCALL || !is_offset_in_branch_range((long)cgctx.idx * 4)) {
   283			cgctx.idx = 0;
   284			if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
   285				fp = org_fp;
   286				goto out_addrs;
   287			}
   288		}
   289	
   290		bpf_jit_realloc_regs(&cgctx);
   291		/*
   292		 * Pretend to build prologue, given the features we've seen.  This will
   293		 * update ctgtx.idx as it pretends to output instructions, then we can
   294		 * calculate total size from idx.
   295		 */
   296		bpf_jit_build_prologue(NULL, &cgctx);
   297		addrs[fp->len] = cgctx.idx * 4;
   298		bpf_jit_build_epilogue(NULL, &cgctx);
   299	
   300		fixup_len = fp->aux->num_exentries * BPF_FIXUP_LEN * 4;
   301		extable_len = fp->aux->num_exentries * sizeof(struct exception_table_entry);
   302	
   303		proglen = cgctx.idx * 4;
   304		alloclen = proglen + FUNCTION_DESCR_SIZE + fixup_len + extable_len;
   305	
   306		fhdr = bpf_jit_binary_pack_alloc(alloclen, &fimage, 4, &hdr, &image,
   307						      bpf_jit_fill_ill_insns);
   308		if (!fhdr) {
   309			fp = org_fp;
   310			goto out_addrs;
   311		}
   312	
   313		if (extable_len)
   314			fp->aux->extable = (void *)fimage + FUNCTION_DESCR_SIZE + proglen + fixup_len;
   315	
   316	skip_init_ctx:
   317		code_base = (u32 *)(image + FUNCTION_DESCR_SIZE);
   318		fcode_base = (u32 *)(fimage + FUNCTION_DESCR_SIZE);
   319	
   320		/* Code generation passes 1-2 */
   321		for (pass = 1; pass < 3; pass++) {
   322			/* Now build the prologue, body code & epilogue for real. */
   323			cgctx.idx = 0;
   324			cgctx.alt_exit_addr = 0;
   325			bpf_jit_build_prologue(code_base, &cgctx);
   326			if (bpf_jit_build_body(fp, code_base, fcode_base, &cgctx, addrs, pass,
   327					       extra_pass)) {
   328				bpf_arch_text_copy(&fhdr->size, &hdr->size, sizeof(hdr->size));
   329				bpf_jit_binary_pack_free(fhdr, hdr);
   330				fp = org_fp;
   331				goto out_addrs;
   332			}
   333			bpf_jit_build_epilogue(code_base, &cgctx);
   334	
   335			if (bpf_jit_enable > 1)
   336				pr_info("Pass %d: shrink = %d, seen = 0x%x\n", pass,
   337					proglen - (cgctx.idx * 4), cgctx.seen);
   338		}
   339	
   340		if (bpf_jit_enable > 1)
   341			/*
   342			 * Note that we output the base address of the code_base
   343			 * rather than image, since opcodes are in code_base.
   344			 */
   345			bpf_jit_dump(flen, proglen, pass, code_base);
   346	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

