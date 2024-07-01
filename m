Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B3291DCE2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 12:39:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=US76BhZg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCMxP02xFz3fml
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 20:39:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=US76BhZg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCMwh2BVrz3cY1
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 20:39:15 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-711b1512aeaso2068881a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2024 03:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719830353; x=1720435153; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFSuPr4IfeBckilk8MpU95PM7XH7mq7Df/PqnYix/pA=;
        b=US76BhZgOdDZG9PyeiR+oh6GiTqTxDwC0cxrQdnl8mp7E05/3iDgo9bArcnn/X7PON
         R4F+lDRg6gmMOffX5ZSRkN0n0xK6KaMMvXGBrKcAJRdrzjvQ2TNdDXGkml26BHyPfGRu
         UocGAUfVxkFMetAHpWqhLZT46PrpSzsU1YH02hjCGa9l4X8SLRpUSHE1tj8ZEi/fR3Hq
         UF5/sP3Nr/BNGTrLKbbIycBjKS+vl9/s3/v6N5bUIRkO/Z4Ez8NQ3JvrtC9d3Vn/GH2G
         BWczUicQfi7Emv1bplXnM3wQeFd03IRQ2BSNpL7aCTqpbexNeJFAKpOuoff+5ra5SjFW
         WFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719830353; x=1720435153;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OFSuPr4IfeBckilk8MpU95PM7XH7mq7Df/PqnYix/pA=;
        b=CU3IviY0lP8tTV9sLlFAw9l2yEiu6GfM/mA+PXPhOgMzkPezci/WPT6hJ1M0HmPzwI
         U6lNZfxz4QG66a57MXqevgsir3cO5B8P7ZHuK6B4HkpkDtFvtpVP0oDCKZWODimuCzWM
         hSt08UaQ47JXInOmJIRNS2opC0Ve4naPr5QlFmQ40oVwA7l3ZN2WNep8FS+7Qe4khCkj
         87EHy0Bjt/cj2g995eLwSj9bUwWSNbRCppaSBNU8iE5SUuhJU764swVdRqNa4U5Z/reY
         VZvcucfrnLi3A1tmY4NfbPJiBdYwhavgrLfga8SctYy9SGdj2jYxs17+eTjD4Q4rOArL
         JSlA==
X-Forwarded-Encrypted: i=1; AJvYcCUEWecNIJ7dShHDg8u7Ch46JDuoq4Bij4uUPwLKcMUrHQn3T1ljHzT19ds5ofR5cg+NJHC0wfBARkZwiHBxJ5cn+ROzMHU2GlDJu59JEA==
X-Gm-Message-State: AOJu0Yzy3eNzv4RVzLwBI66FK4KOMDgFsG9EJ1jH8qhYHSOgMYn4x6Uh
	7/SiVF0uWsTrEBApWWHVAj7LvRj8mJwzDscDQHR+Qpbt8IAsVLU/
X-Google-Smtp-Source: AGHT+IHkjr53pPeX1K2KlxuTuSHNQXf22MxSXeVPhyhHmYH/KuJnSBZmxRZjAepylIsdouNI+ZGelQ==
X-Received: by 2002:a05:6a21:339a:b0:1be:c2af:5626 with SMTP id adf61e73a8af0-1bef60ee5a9mr8163948637.4.1719830352372;
        Mon, 01 Jul 2024 03:39:12 -0700 (PDT)
Received: from localhost (118-211-5-80.tpgi.com.au. [118.211.5.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce1b0d5sm6502886a91.3.2024.07.01.03.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 03:39:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jul 2024 20:39:03 +1000
Message-Id: <D2E4Z4J6KJUH.1NWWV6ZAW17VI@gmail.com>
Subject: Re: [RFC PATCH v3 06/11] powerpc64/ftrace: Move ftrace sequence out
 of line
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Naveen N Rao" <naveen@kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-trace-kernel@vger.kernel.org>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <cover.1718908016.git.naveen@kernel.org>
 <63664d3bf825ca83656f84d23393ea486afb2f46.1718908016.git.naveen@kernel.org>
In-Reply-To: <63664d3bf825ca83656f84d23393ea486afb2f46.1718908016.git.naveen@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Alexei
 Starovoitov <ast@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Jun 21, 2024 at 4:54 AM AEST, Naveen N Rao wrote:
> Function profile sequence on powerpc includes two instructions at the
> beginning of each function:
> 	mflr	r0
> 	bl	ftrace_caller
>
> The call to ftrace_caller() gets nop'ed out during kernel boot and is
> patched in when ftrace is enabled.
>
> Given the sequence, we cannot return from ftrace_caller with 'blr' as we
> need to keep LR and r0 intact. This results in link stack imbalance when

(link stack is IBMese for "return address predictor", if that wasn't
obvious)

> ftrace is enabled. To address that, we would like to use a three
> instruction sequence:
> 	mflr	r0
> 	bl	ftrace_caller
> 	mtlr	r0
>
> Further more, to support DYNAMIC_FTRACE_WITH_CALL_OPS, we need to
> reserve two instruction slots before the function. This results in a
> total of five instruction slots to be reserved for ftrace use on each
> function that is traced.
>
> Move the function profile sequence out-of-line to minimize its impact.
> To do this, we reserve a single nop at function entry using
> -fpatchable-function-entry=3D1 and add a pass on vmlinux.o to determine

What's the need to do this on vmlinux.o rather than vmlinux? We have
all function syms?

> the total number of functions that can be traced. This is then used to
> generate a .S file reserving the appropriate amount of space for use as
> ftrace stubs, which is built and linked into vmlinux.

An example instruction listing for the "after" case would be nice too.

Is this all ftrace stubs in the one place? And how do you deal with
kernel size exceeding the limit, if so?

>
> On bootup, the stub space is split into separate stubs per function and
> populated with the proper instruction sequence. A pointer to the
> associated stub is maintained in dyn_arch_ftrace.
>
> For modules, space for ftrace stubs is reserved from the generic module
> stub space.
>
> This is restricted to and enabled by default only on 64-bit powerpc.

This is cool.

[...]

> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -568,6 +568,11 @@ config ARCH_USING_PATCHABLE_FUNCTION_ENTRY
>  	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-f=
unction-entry.sh $(CC) -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN
>  	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-f=
unction-entry.sh $(CC) -mbig-endian) if PPC64 && CPU_BIG_ENDIAN
> =20
> +config FTRACE_PFE_OUT_OF_LINE
> +	def_bool PPC64 && ARCH_USING_PATCHABLE_FUNCTION_ENTRY
> +	depends on PPC64
> +	select ARCH_WANTS_PRE_LINK_VMLINUX

This remains powerpc specific? Maybe add a PPC_ prefix to the config
option?

Bikeshed - should PFE be expanded to be consistent with the ARCH_
option?

[...]

> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm=
/ftrace.h
> index 201f9d15430a..9da1da0f87b4 100644
> --- a/arch/powerpc/include/asm/ftrace.h
> +++ b/arch/powerpc/include/asm/ftrace.h
> @@ -26,6 +26,9 @@ unsigned long prepare_ftrace_return(unsigned long paren=
t, unsigned long ip,
>  struct module;
>  struct dyn_ftrace;
>  struct dyn_arch_ftrace {
> +#ifdef CONFIG_FTRACE_PFE_OUT_OF_LINE
> +	unsigned long pfe_stub;
> +#endif
>  };

Ah, we put something else in here. This is the offset to the
stub? Maybe call it pfe_stub_offset?

[...]

> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/tra=
ce/ftrace.c
> index 2cff37b5fd2c..9f3c10307331 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -37,7 +37,8 @@ unsigned long ftrace_call_adjust(unsigned long addr)
>  	if (addr >=3D (unsigned long)__exittext_begin && addr < (unsigned long)=
__exittext_end)
>  		return 0;
> =20
> -	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY))
> +	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY) &&
> +	    !IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE))
>  		addr +=3D MCOUNT_INSN_SIZE;
> =20
>  	return addr;

I don't understand what this is doing acutally (before this patch
even). We still emit one/two patchable intsructions at entry, so
why do we only need to adjust by zero/one instruction here?


> @@ -82,7 +83,7 @@ static inline int ftrace_modify_code(unsigned long ip, =
ppc_inst_t old, ppc_inst_
>  {
>  	int ret =3D ftrace_validate_inst(ip, old);
> =20
> -	if (!ret)
> +	if (!ret && !ppc_inst_equal(old, new))
>  		ret =3D patch_instruction((u32 *)ip, new);
> =20
>  	return ret;

Is this leftover debugging stuff or should it be in a different patch?

> @@ -132,11 +133,23 @@ static unsigned long ftrace_lookup_module_stub(unsi=
gned long ip, unsigned long a
>  }
>  #endif
> =20
> +static unsigned long ftrace_get_pfe_stub(struct dyn_ftrace *rec)
> +{
> +#ifdef CONFIG_FTRACE_PFE_OUT_OF_LINE
> +	return rec->arch.pfe_stub;
> +#else
> +	BUILD_BUG();
> +#endif
> +}
> +
>  static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long ad=
dr, ppc_inst_t *call_inst)
>  {
>  	unsigned long ip =3D rec->ip;
>  	unsigned long stub;
> =20
> +	if (IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE))
> +		ip =3D ftrace_get_pfe_stub(rec) + MCOUNT_INSN_SIZE; /* second instruct=
ion in stub */

Maybe put the ip =3D rec->ip; into an else case here.

[...]

> @@ -155,6 +168,79 @@ static int ftrace_get_call_inst(struct dyn_ftrace *r=
ec, unsigned long addr, ppc_
>  	return 0;
>  }
> =20
> +static int ftrace_init_pfe_stub(struct module *mod, struct dyn_ftrace *r=
ec)
> +{
> +#ifdef CONFIG_FTRACE_PFE_OUT_OF_LINE
> +	static int pfe_stub_text_index, pfe_stub_inittext_index;
> +	int ret =3D 0, pfe_stub_count, *pfe_stub_index;
> +	ppc_inst_t inst;
> +	struct ftrace_pfe_stub *pfe_stub, pfe_stub_template =3D {
> +		.insn =3D {
> +			PPC_RAW_MFLR(_R0),
> +			PPC_RAW_NOP(),		/* bl ftrace_caller */
> +			PPC_RAW_MTLR(_R0),
> +			PPC_RAW_NOP()		/* b rec->ip + 4 */
> +		}
> +	};
> +
> +	WARN_ON(rec->arch.pfe_stub);
> +
> +	if (is_kernel_inittext(rec->ip)) {
> +		pfe_stub =3D ftrace_pfe_stub_inittext;
> +		pfe_stub_index =3D &pfe_stub_inittext_index;
> +		pfe_stub_count =3D ftrace_pfe_stub_inittext_count;
> +	} else if (is_kernel_text(rec->ip)) {
> +		pfe_stub =3D ftrace_pfe_stub_text;
> +		pfe_stub_index =3D &pfe_stub_text_index;
> +		pfe_stub_count =3D ftrace_pfe_stub_text_count;
> +#ifdef CONFIG_MODULES
> +	} else if (mod) {
> +		pfe_stub =3D mod->arch.pfe_stubs;
> +		pfe_stub_index =3D &mod->arch.pfe_stub_index;
> +		pfe_stub_count =3D mod->arch.pfe_stub_count;
> +#endif
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	pfe_stub +=3D (*pfe_stub_index)++;
> +
> +	if (WARN_ON(*pfe_stub_index > pfe_stub_count))
> +		return -EINVAL;
> +
> +	if (!is_offset_in_branch_range((long)rec->ip - (long)&pfe_stub->insn[0]=
) ||
> +	    !is_offset_in_branch_range((long)(rec->ip + MCOUNT_INSN_SIZE) - (lo=
ng)&pfe_stub->insn[3])) {
> +		pr_err("%s: ftrace pfe stub out of range (%p -> %p).\n",
> +					__func__, (void *)rec->ip, (void *)&pfe_stub->insn[0]);
> +		return -EINVAL;
> +	}
> +
> +	rec->arch.pfe_stub =3D (unsigned long)&pfe_stub->insn[0];
> +
> +	/* bl ftrace_caller */
> +	if (mod)
> +		/* We can't lookup the module since it is not fully formed yet */

What do you mean here, what would a lookup look like if we could do it?

> +		inst =3D ftrace_create_branch_inst(ftrace_get_pfe_stub(rec) + MCOUNT_I=
NSN_SIZE,
> +						 mod->arch.tramp, 1);
> +	else
> +		ret =3D ftrace_get_call_inst(rec, (unsigned long)ftrace_caller, &inst)=
;
> +	pfe_stub_template.insn[1] =3D ppc_inst_val(inst);
> +
> +	/* b rec->ip + 4 */
> +	if (!ret && create_branch(&inst, &pfe_stub->insn[3], rec->ip + MCOUNT_I=
NSN_SIZE, 0))
> +		return -EINVAL;
> +	pfe_stub_template.insn[3] =3D ppc_inst_val(inst);
> +
> +	if (!ret)
> +		ret =3D patch_instructions((u32 *)pfe_stub, (u32 *)&pfe_stub_template,
> +					 sizeof(pfe_stub_template), false);
> +
> +	return ret;
> +#else /* !CONFIG_FTRACE_PFE_OUT_OF_LINE */
> +	BUILD_BUG();
> +#endif
> +}
> +
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>  int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr, u=
nsigned long addr)
>  {
> @@ -167,18 +253,29 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsi=
gned long old_addr, unsigned
>  int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>  {
>  	ppc_inst_t old, new;
> -	int ret;
> +	unsigned long ip =3D rec->ip;
> +	int ret =3D 0;
> =20
>  	/* This can only ever be called during module load */
> -	if (WARN_ON(!IS_ENABLED(CONFIG_MODULES) || core_kernel_text(rec->ip)))
> +	if (WARN_ON(!IS_ENABLED(CONFIG_MODULES) || core_kernel_text(ip)))
>  		return -EINVAL;
> =20
>  	old =3D ppc_inst(PPC_RAW_NOP());
> -	ret =3D ftrace_get_call_inst(rec, addr, &new);
> -	if (ret)
> -		return ret;
> +	if (IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE)) {
> +		ip =3D ftrace_get_pfe_stub(rec) + MCOUNT_INSN_SIZE; /* second instruct=
ion in stub */
> +		ret =3D ftrace_get_call_inst(rec, (unsigned long)ftrace_caller, &old);
> +	}
> =20
> -	return ftrace_modify_code(rec->ip, old, new);
> +	ret |=3D ftrace_get_call_inst(rec, addr, &new);
> +
> +	if (!ret)
> +		ret =3D ftrace_modify_code(ip, old, new);
> +
> +	if (!ret && IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE))
> +		ret =3D ftrace_modify_code(rec->ip, ppc_inst(PPC_RAW_NOP()),
> +			 ppc_inst(PPC_RAW_BRANCH((long)ftrace_get_pfe_stub(rec) - (long)rec->=
ip)));
> +
> +	return ret;
>  }
> =20
>  int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec, unsigned=
 long addr)
> @@ -211,6 +308,13 @@ void ftrace_replace_code(int enable)
>  		new_addr =3D ftrace_get_addr_new(rec);
>  		update =3D ftrace_update_record(rec, enable);
> =20
> +		if (IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE) && update !=3D FTRACE_UP=
DATE_IGNORE) {
> +			ip =3D ftrace_get_pfe_stub(rec) + MCOUNT_INSN_SIZE;
> +			ret =3D ftrace_get_call_inst(rec, (unsigned long)ftrace_caller, &nop_=
inst);
> +			if (ret)
> +				goto out;
> +		}
> +
>  		switch (update) {
>  		case FTRACE_UPDATE_IGNORE:
>  		default:
> @@ -235,6 +339,24 @@ void ftrace_replace_code(int enable)
> =20
>  		if (!ret)
>  			ret =3D ftrace_modify_code(ip, old, new);
> +
> +		if (!ret && IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE) &&
> +		    (update =3D=3D FTRACE_UPDATE_MAKE_NOP || update =3D=3D FTRACE_UPDA=
TE_MAKE_CALL)) {
> +			/* Update the actual ftrace location */
> +			call_inst =3D ppc_inst(PPC_RAW_BRANCH((long)ftrace_get_pfe_stub(rec) =
-
> +							    (long)rec->ip));
> +			nop_inst =3D ppc_inst(PPC_RAW_NOP());
> +			ip =3D rec->ip;
> +
> +			if (update =3D=3D FTRACE_UPDATE_MAKE_NOP)
> +				ret =3D ftrace_modify_code(ip, call_inst, nop_inst);
> +			else
> +				ret =3D ftrace_modify_code(ip, nop_inst, call_inst);
> +
> +			if (ret)
> +				goto out;
> +		}
> +
>  		if (ret)
>  			goto out;
>  	}
> @@ -254,7 +376,8 @@ int ftrace_init_nop(struct module *mod, struct dyn_ft=
race *rec)
>  	/* Verify instructions surrounding the ftrace location */
>  	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY)) {
>  		/* Expect nops */
> -		ret =3D ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_NOP()));
> +		if (!IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE))
> +			ret =3D ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_NOP()));
>  		if (!ret)
>  			ret =3D ftrace_validate_inst(ip, ppc_inst(PPC_RAW_NOP()));
>  	} else if (IS_ENABLED(CONFIG_PPC32)) {
> @@ -278,6 +401,10 @@ int ftrace_init_nop(struct module *mod, struct dyn_f=
trace *rec)
>  	if (ret)
>  		return ret;
> =20
> +	/* Set up out-of-line stub */
> +	if (IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE))
> +		return ftrace_init_pfe_stub(mod, rec);
> +
>  	/* Nop-out the ftrace location */
>  	new =3D ppc_inst(PPC_RAW_NOP());
>  	addr =3D MCOUNT_ADDR;
> diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kern=
el/trace/ftrace_entry.S
> index 244a1c7bb1e8..b1cbef24f18f 100644
> --- a/arch/powerpc/kernel/trace/ftrace_entry.S
> +++ b/arch/powerpc/kernel/trace/ftrace_entry.S
> @@ -78,10 +78,6 @@
> =20
>  	/* Get the _mcount() call site out of LR */
>  	mflr	r7
> -	/* Save it as pt_regs->nip */
> -	PPC_STL	r7, _NIP(r1)
> -	/* Also save it in B's stackframe header for proper unwind */
> -	PPC_STL	r7, LRSAVE+SWITCH_FRAME_SIZE(r1)
>  	/* Save the read LR in pt_regs->link */
>  	PPC_STL	r0, _LINK(r1)
> =20
> @@ -96,16 +92,6 @@
>  	lwz	r5,function_trace_op@l(r3)
>  #endif
> =20
> -#ifdef CONFIG_LIVEPATCH_64
> -	mr	r14, r7		/* remember old NIP */
> -#endif
> -
> -	/* Calculate ip from nip-4 into r3 for call below */
> -	subi    r3, r7, MCOUNT_INSN_SIZE
> -
> -	/* Put the original return address in r4 as parent_ip */
> -	mr	r4, r0
> -
>  	/* Save special regs */
>  	PPC_STL	r8, _MSR(r1)
>  	.if \allregs =3D=3D 1
> @@ -114,17 +100,64 @@
>  	PPC_STL	r11, _CCR(r1)
>  	.endif
> =20
> +#ifdef CONFIG_FTRACE_PFE_OUT_OF_LINE
> +	/* Save our real return address locally for return */
> +	PPC_STL	r7, STACK_INT_FRAME_MARKER(r1)

Hmm, should you be using STACK_INT_FRAME_MARKER in a
non-INT_FRAME? I actually wanted to turn the int marker
into a 4 byte word and move it into a reserved space in
the frame too. Could it go in pt_regs somewhere?

> +	/*
> +	 * We want the ftrace location in the function, but our lr (in r7)
> +	 * points at the 'mtlr r0' instruction in the out of line stub.  To
> +	 * recover the ftrace location, we read the branch instruction in the
> +	 * stub, and adjust our lr by the branch offset.
> +	 */
> +	lwz	r8, MCOUNT_INSN_SIZE(r7)
> +	slwi	r8, r8, 6
> +	srawi	r8, r8, 6
> +	add	r3, r7, r8

Clever. Maybe a comment in ftrace_init_pfe_stub() that says to
keep that last instruction in synch with this?

> +	/*
> +	 * Override our nip to point past the branch in the original function.
> +	 * This allows reliable stack trace and the ftrace stack tracer to work=
 as-is.
> +	 */
> +	add	r7, r3, MCOUNT_INSN_SIZE
> +#else
> +	/* Calculate ip from nip-4 into r3 for call below */
> +	subi    r3, r7, MCOUNT_INSN_SIZE
> +#endif
> +
> +	/* Save NIP as pt_regs->nip */
> +	PPC_STL	r7, _NIP(r1)
> +	/* Also save it in B's stackframe header for proper unwind */
> +	PPC_STL	r7, LRSAVE+SWITCH_FRAME_SIZE(r1)
> +#ifdef CONFIG_LIVEPATCH_64
> +	mr	r14, r7		/* remember old NIP */
> +#endif
> +
> +	/* Put the original return address in r4 as parent_ip */
> +	mr	r4, r0
> +
>  	/* Load &pt_regs in r6 for call below */
>  	addi    r6, r1, STACK_INT_FRAME_REGS
>  .endm
> =20
>  .macro	ftrace_regs_exit allregs
> +#ifndef CONFIG_FTRACE_PFE_OUT_OF_LINE
>  	/* Load ctr with the possibly modified NIP */
>  	PPC_LL	r3, _NIP(r1)
>  	mtctr	r3
> =20
>  #ifdef CONFIG_LIVEPATCH_64
>  	cmpd	r14, r3		/* has NIP been altered? */
> +#endif
> +#else /* !CONFIG_FTRACE_PFE_OUT_OF_LINE */
> +#ifdef CONFIG_LIVEPATCH_64
> +	/* Load ctr with the possibly modified NIP */

Comment doesn't apply to this leg of the ifdef AFAIKS.
We load the original NIP into LR, and set CR0 for
livepatch branch.

> +	PPC_LL	r3, _NIP(r1)
> +
> +	cmpd	r14, r3		/* has NIP been altered? */
> +	bne-	1f
> +#endif
> +
> +	PPC_LL	r3, STACK_INT_FRAME_MARKER(r1)
> +1:	mtlr	r3
>  #endif
> =20
>  	/* Restore gprs */
> @@ -139,7 +172,9 @@
> =20
>  	/* Restore possibly modified LR */
>  	PPC_LL	r0, _LINK(r1)
> +#ifndef CONFIG_FTRACE_PFE_OUT_OF_LINE
>  	mtlr	r0
> +#endif
> =20
>  #ifdef CONFIG_PPC64
>  	/* Restore callee's TOC */
> @@ -153,7 +188,12 @@
>          /* Based on the cmpd above, if the NIP was altered handle livepa=
tch */
>  	bne-	livepatch_handler
>  #endif
> -	bctr			/* jump after _mcount site */
> +	/* jump after _mcount site */
> +#ifdef CONFIG_FTRACE_PFE_OUT_OF_LINE
> +	blr
> +#else
> +	bctr
> +#endif

Here is the crux of it all, we return here with a blr that matches
the return address of the bl which it was called with, so the CPU
can predict it.

I think it would be worth a comment here to explain why you go to
so much effort to add the case that uses LR here. Because the out
of line stub itself could pretty well have the same calling convention
as the original mcount.

Actually that's a thought too. Could you split this patch in two?
First just the patch to add the out of line call but use the same
calling convention as mprofile-kernel. Second which changes it to
use the balanced call/return. Would that be a lot of extra work?

>  .endm
> =20
>  _GLOBAL(ftrace_regs_caller)
> @@ -177,6 +217,11 @@ _GLOBAL(ftrace_stub)
> =20
>  #ifdef CONFIG_PPC64
>  ftrace_no_trace:
> +#ifdef CONFIG_FTRACE_PFE_OUT_OF_LINE
> +	REST_GPR(3, r1)
> +	addi	r1, r1, SWITCH_FRAME_SIZE+STACK_FRAME_MIN_SIZE
> +	blr
> +#else
>  	mflr	r3
>  	mtctr	r3
>  	REST_GPR(3, r1)
> @@ -184,6 +229,7 @@ ftrace_no_trace:
>  	mtlr	r0
>  	bctr
>  #endif
> +#endif
> =20
>  #ifdef CONFIG_LIVEPATCH_64
>  	/*
> @@ -196,9 +242,9 @@ ftrace_no_trace:
>  	 *
>  	 * On entry:
>  	 *  - we have no stack frame and can not allocate one
> -	 *  - LR points back to the original caller (in A)
> -	 *  - CTR holds the new NIP in C
> -	 *  - r0, r11 & r12 are free
> +	 *  - LR/r0 points back to the original caller (in A)
> +	 *  - CTR/LR holds the new NIP in C
> +	 *  - r11 & r12 are free

Could you explain the added case here, e.g.,

On entry, depending on CONFIG_FTRACE_PFE_OUT_OF_LINE (=3Dn/=3Dy)

>  	 */
>  livepatch_handler:
>  	ld	r12, PACA_THREAD_INFO(r13)
> @@ -208,18 +254,23 @@ livepatch_handler:
>  	addi	r11, r11, 24
>  	std	r11, TI_livepatch_sp(r12)
> =20
> -	/* Save toc & real LR on livepatch stack */
> -	std	r2,  -24(r11)
> -	mflr	r12
> -	std	r12, -16(r11)
> -
>  	/* Store stack end marker */
>  	lis     r12, STACK_END_MAGIC@h
>  	ori     r12, r12, STACK_END_MAGIC@l
>  	std	r12, -8(r11)
> =20
> -	/* Put ctr in r12 for global entry and branch there */
> +	/* Save toc & real LR on livepatch stack */
> +	std	r2,  -24(r11)
> +#ifndef CONFIG_FTRACE_PFE_OUT_OF_LINE
> +	mflr	r12
> +	std	r12, -16(r11)
>  	mfctr	r12
> +#else
> +	std	r0, -16(r11)
> +	mflr	r12
> +	/* Put ctr in r12 for global entry and branch there */
> +	mtctr	r12
> +#endif
>  	bctrl
> =20
>  	/*
> diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmli=
nux.lds.S
> index f420df7888a7..0aef9959f2cd 100644
> --- a/arch/powerpc/kernel/vmlinux.lds.S
> +++ b/arch/powerpc/kernel/vmlinux.lds.S
> @@ -267,14 +267,13 @@ SECTIONS
>  	.init.text : AT(ADDR(.init.text) - LOAD_OFFSET) {
>  		_sinittext =3D .;
>  		INIT_TEXT
> -
> +		*(.tramp.ftrace.init);
>  		/*
>  		 *.init.text might be RO so we must ensure this section ends on
>  		 * a page boundary.
>  		 */
>  		. =3D ALIGN(PAGE_SIZE);
>  		_einittext =3D .;
> -		*(.tramp.ftrace.init);
>  	} :text
> =20
>  	/* .exit.text is discarded at runtime, not link time,

Why this change?

> diff --git a/arch/powerpc/tools/Makefile b/arch/powerpc/tools/Makefile
> new file mode 100644
> index 000000000000..9e2ba9a85baa
> --- /dev/null
> +++ b/arch/powerpc/tools/Makefile
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +quiet_cmd_gen_ftrace_pfe_stubs =3D FTRACE  $@
> +      cmd_gen_ftrace_pfe_stubs =3D $< $(objtree)/vmlinux.o $@
> +
> +targets +=3D .arch.vmlinux.o
> +.arch.vmlinux.o: $(srctree)/arch/powerpc/tools/gen-ftrace-pfe-stubs.sh $=
(objtree)/vmlinux.o FORCE
> +	$(call if_changed,gen_ftrace_pfe_stubs)
> +
> +clean-files +=3D $(objtree)/.arch.vmlinux.S $(objtree)/.arch.vmlinux.o
> diff --git a/arch/powerpc/tools/gen-ftrace-pfe-stubs.sh b/arch/powerpc/to=
ols/gen-ftrace-pfe-stubs.sh
> new file mode 100755
> index 000000000000..ec95e99aff14
> --- /dev/null
> +++ b/arch/powerpc/tools/gen-ftrace-pfe-stubs.sh
> @@ -0,0 +1,48 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +# Error out on error
> +set -e
> +
> +is_enabled() {
> +	grep -q "^$1=3Dy" include/config/auto.conf
> +}
> +
> +vmlinux_o=3D${1}
> +arch_vmlinux_o=3D${2}
> +arch_vmlinux_S=3D$(dirname ${arch_vmlinux_o})/$(basename ${arch_vmlinux_=
o} .o).S
> +
> +RELOCATION=3DR_PPC64_ADDR64
> +if is_enabled CONFIG_PPC32; then
> +	RELOCATION=3DR_PPC_ADDR32
> +fi

Started PPC32 support?

> +
> +num_pfe_stubs_text=3D$(${CROSS_COMPILE}objdump -r -j __patchable_functio=
n_entries ${vmlinux_o} |
> +		     grep -v ".init.text" | grep "${RELOCATION}" | wc -l)
> +num_pfe_stubs_inittext=3D$(${CROSS_COMPILE}objdump -r -j __patchable_fun=
ction_entries ${vmlinux_o} |
> +			 grep ".init.text" | grep "${RELOCATION}" | wc -l)
> +
> +cat > ${arch_vmlinux_S} <<EOF
> +#include <asm/asm-offsets.h>
> +#include <linux/linkage.h>
> +
> +.pushsection .tramp.ftrace.text,"aw"
> +SYM_DATA(ftrace_pfe_stub_text_count, .long ${num_pfe_stubs_text})
> +
> +SYM_CODE_START(ftrace_pfe_stub_text)
> +	.space ${num_pfe_stubs_text} * FTRACE_PFE_STUB_SIZE
> +SYM_CODE_END(ftrace_pfe_stub_text)
> +.popsection
> +
> +.pushsection .tramp.ftrace.init,"aw"
> +SYM_DATA(ftrace_pfe_stub_inittext_count, .long ${num_pfe_stubs_inittext}=
)
> +
> +SYM_CODE_START(ftrace_pfe_stub_inittext)
> +	.space ${num_pfe_stubs_inittext} * FTRACE_PFE_STUB_SIZE
> +SYM_CODE_END(ftrace_pfe_stub_inittext)
> +.popsection
> +EOF
> +
> +${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
> +      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} \
> +      -c -o ${arch_vmlinux_o} ${arch_vmlinux_S}

Looking pretty good. I don't know the livepatch stuff well though.

Thanks,
Nick
