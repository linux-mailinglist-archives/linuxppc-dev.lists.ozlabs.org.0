Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9047822132
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 04:09:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 455TB65YnczDqWB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 12:09:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="c2+PCZ6i"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 455T8t0BNtzDqRs
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2019 12:08:28 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id z26so4527123pfg.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 19:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=Gss4AgGBViacHXD6UIPs07x/6J+BSVgVsU2MFMZK95w=;
 b=c2+PCZ6i+qn/xtvWW5XkGLgKoGLgePMvoJ2sDFMbNaF0Px2qPiMKX8ms5JOBbrCWF7
 v2gJ83MpcXuvPXEw53VPIL0im6TA6TO9Uq+waxfl7a7yiPSNLicSsO1V/8Rbaj7Psxdy
 vcyXw2VTqBoQUM5E/fU06r5uvrUE7sjOnVV1/EMLJwKltgl8Cdv8stHpfyAnt0WBjd8e
 eSsM3zeoynyLBdg9tTzTNn1Lb5voYiUTLP59+N6tHCYVGCZhTFq95sB5/JVuU2pqEVyx
 gdVzyEZQSqkLrXIr8qko6712ae42AZhrPLJ1176HcRIfPHzVZzDH1DwxuFSWL4yOgQzi
 J3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=Gss4AgGBViacHXD6UIPs07x/6J+BSVgVsU2MFMZK95w=;
 b=amgxPN26TXR8fUw2ofc0unlAAgS7fwJ1R88BVmiQkPVjfAANiP732ZFt1b5UbSG+lL
 EEGVTYZXeTZ2MuuatcmEH4pdVbMeqT6zVcHLt7L0JMcZkQWIVulbaPiwIe7aPqcRBAbb
 Rj9A/aJs/uaTsUGSnttteeh7vClJ+0OtPo2bzOHhFKKs1RMvxTAmV8ojlFF+uK7VD7/Z
 fnRoqgvVHptXb0Cfnyg7sb1ljfjjX5b9OkGTIaun7YStwhQTCLYKr5PyGUpxhAnalFAC
 oGEfNkM5ZPgsMx6tLasxg5kYNUqh9/DyW97uXbTJleFY5YDwm9DTanvWRGPth7XR/PVB
 zbWw==
X-Gm-Message-State: APjAAAUHnSlOWzVVZ6q9VvOMrdzU1RjfSwdQf4kxPvbGdcKDy39x/ozX
 n4yH0FY6zZso4iA6jnQyADE=
X-Google-Smtp-Source: APXvYqxIsIKJLsrbjlAFTg9yNh6wF6uzUGOjX8ybnynNVl6nMHDLaXY67c62ZuP/FctTYJS+P5Gz6w==
X-Received: by 2002:a62:4607:: with SMTP id t7mr65526370pfa.138.1558145304747; 
 Fri, 17 May 2019 19:08:24 -0700 (PDT)
Received: from localhost (193-116-98-72.tpgi.com.au. [193.116.98.72])
 by smtp.gmail.com with ESMTPSA id o20sm12971417pgj.70.2019.05.17.19.08.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 May 2019 19:08:24 -0700 (PDT)
Date: Sat, 18 May 2019 12:08:00 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 4/4] powerpc/ftrace: Additionally nop out the
 preceding mflr with -mprofile-kernel
To: Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>, Steven Rostedt <rostedt@goodmis.org>
References: <cover.1558115654.git.naveen.n.rao@linux.vnet.ibm.com>
 <ee2a5457d98850f51bf96eb17389b375e6955bbf.1558115654.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <ee2a5457d98850f51bf96eb17389b375e6955bbf.1558115654.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1558144594.f92d1rcmes.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Naveen N. Rao's on May 18, 2019 5:02 am:
> With -mprofile-kernel, gcc emits 'mflr r0', followed by 'bl _mcount' to
> enable function tracing and profiling. So far, with dynamic ftrace, we
> used to only patch out the branch to _mcount(). However, Nick Piggin
> points out that "mflr is executed by the branch unit that can only
> execute one per cycle on POWER9 and shared with branches, so it would be
> nice to avoid it where possible."
>=20
> We cannot simply nop out the mflr either. Michael Ellerman pointed out
> that when enabling function tracing, there can be a race if tracing is
> enabled when some thread was interrupted after executing a nop'ed out
> mflr. In this case, the thread would execute the now-patched-in branch
> to _mcount() without having executed the preceding mflr.
>=20
> To solve this, we now enable function tracing in 2 steps: patch in the
> mflr instruction, use synchronize_rcu_tasks() to ensure all existing
> threads make progress, and then patch in the branch to _mcount(). We
> override ftrace_replace_code() with a powerpc64 variant for this
> purpose.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Nice! Thanks for doing a real patch. You needn't add my SOB there: my
hack was obviously garbage :) Suggested-by if anything, then for
clarity of changelog you can write the motivation directly rather than
quote me.

I don't know the ftrace subsystem well, but the powerpc instructions
and patching sequence appears to match what we agreed is the right way
to go.

As a suggestion, I would perhaps add most of information from the
second and third paragraphs of the changelog into comments
(and also explain that the lone mflr r0 is harmless).

But otherwise it looks good

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/kernel/trace/ftrace.c | 188 +++++++++++++++++++++++++----
>  1 file changed, 166 insertions(+), 22 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/tra=
ce/ftrace.c
> index 517662a56bdc..5c3523c3b259 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -125,7 +125,7 @@ __ftrace_make_nop(struct module *mod,
>  {
>  	unsigned long entry, ptr, tramp;
>  	unsigned long ip =3D rec->ip;
> -	unsigned int op, pop;
> +	unsigned int op;
> =20
>  	/* read where this goes */
>  	if (probe_kernel_read(&op, (void *)ip, sizeof(int))) {
> @@ -160,8 +160,6 @@ __ftrace_make_nop(struct module *mod,
> =20
>  #ifdef CONFIG_MPROFILE_KERNEL
>  	/* When using -mkernel_profile there is no load to jump over */
> -	pop =3D PPC_INST_NOP;
> -
>  	if (probe_kernel_read(&op, (void *)(ip - 4), 4)) {
>  		pr_err("Fetching instruction at %lx failed.\n", ip - 4);
>  		return -EFAULT;
> @@ -169,26 +167,22 @@ __ftrace_make_nop(struct module *mod,
> =20
>  	/* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
>  	if (op !=3D PPC_INST_MFLR && op !=3D PPC_INST_STD_LR) {
> -		pr_err("Unexpected instruction %08x around bl _mcount\n", op);
> +		pr_err("Unexpected instruction %08x before bl _mcount\n", op);
>  		return -EINVAL;
>  	}
> -#else
> -	/*
> -	 * Our original call site looks like:
> -	 *
> -	 * bl <tramp>
> -	 * ld r2,XX(r1)
> -	 *
> -	 * Milton Miller pointed out that we can not simply nop the branch.
> -	 * If a task was preempted when calling a trace function, the nops
> -	 * will remove the way to restore the TOC in r2 and the r2 TOC will
> -	 * get corrupted.
> -	 *
> -	 * Use a b +8 to jump over the load.
> -	 */
> =20
> -	pop =3D PPC_INST_BRANCH | 8;	/* b +8 */
> +	/* We should patch out the bl to _mcount first */
> +	if (patch_instruction((unsigned int *)ip, PPC_INST_NOP)) {
> +		pr_err("Patching NOP failed.\n");
> +		return -EPERM;
> +	}
> =20
> +	if (op =3D=3D PPC_INST_MFLR &&
> +		patch_instruction((unsigned int *)(ip - 4), PPC_INST_NOP)) {
> +		pr_err("Patching NOP failed.\n");
> +		return -EPERM;
> +	}
> +#else
>  	/*
>  	 * Check what is in the next instruction. We can see ld r2,40(r1), but
>  	 * on first pass after boot we will see mflr r0.
> @@ -202,12 +196,25 @@ __ftrace_make_nop(struct module *mod,
>  		pr_err("Expected %08x found %08x\n", PPC_INST_LD_TOC, op);
>  		return -EINVAL;
>  	}
> -#endif /* CONFIG_MPROFILE_KERNEL */
> =20
> -	if (patch_instruction((unsigned int *)ip, pop)) {
> +	/*
> +	 * Our original call site looks like:
> +	 *
> +	 * bl <tramp>
> +	 * ld r2,XX(r1)
> +	 *
> +	 * Milton Miller pointed out that we can not simply nop the branch.
> +	 * If a task was preempted when calling a trace function, the nops
> +	 * will remove the way to restore the TOC in r2 and the r2 TOC will
> +	 * get corrupted.
> +	 *
> +	 * Use a b +8 to jump over the load.
> +	 */
> +	if (patch_instruction((unsigned int *)ip, PPC_INST_BRANCH | 8)) {
>  		pr_err("Patching NOP failed.\n");
>  		return -EPERM;
>  	}
> +#endif /* CONFIG_MPROFILE_KERNEL */
> =20
>  	return 0;
>  }
> @@ -421,6 +428,25 @@ static int __ftrace_make_nop_kernel(struct dyn_ftrac=
e *rec, unsigned long addr)
>  		return -EPERM;
>  	}
> =20
> +#ifdef CONFIG_MPROFILE_KERNEL
> +	if (probe_kernel_read(&op, (void *)(ip - 4), 4)) {
> +		pr_err("Fetching instruction at %lx failed.\n", ip - 4);
> +		return -EFAULT;
> +	}
> +
> +	/* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
> +	if (op !=3D PPC_INST_MFLR && op !=3D PPC_INST_STD_LR) {
> +		pr_err("Unexpected instruction %08x before bl _mcount\n", op);
> +		return -EINVAL;
> +	}
> +
> +	if (op =3D=3D PPC_INST_MFLR &&
> +		patch_instruction((unsigned int *)(ip - 4), PPC_INST_NOP)) {
> +		pr_err("Patching NOP failed.\n");
> +		return -EPERM;
> +	}
> +#endif
> +
>  	return 0;
>  }
> =20
> @@ -429,6 +455,7 @@ int ftrace_make_nop(struct module *mod,
>  {
>  	unsigned long ip =3D rec->ip;
>  	unsigned int old, new;
> +	int rc;
> =20
>  	/*
>  	 * If the calling address is more that 24 bits away,
> @@ -439,7 +466,27 @@ int ftrace_make_nop(struct module *mod,
>  		/* within range */
>  		old =3D ftrace_call_replace(ip, addr, 1);
>  		new =3D PPC_INST_NOP;
> -		return ftrace_modify_code(ip, old, new);
> +		rc =3D ftrace_modify_code(ip, old, new);
> +#ifdef CONFIG_MPROFILE_KERNEL
> +		if (rc)
> +			return rc;
> +
> +		if (probe_kernel_read(&old, (void *)(ip - 4), 4)) {
> +			pr_err("Fetching instruction at %lx failed.\n", ip - 4);
> +			return -EFAULT;
> +		}
> +
> +		/* We expect either a mflr r0, or a std r0, LRSAVE(r1) */
> +		if (old !=3D PPC_INST_MFLR && old !=3D PPC_INST_STD_LR) {
> +			pr_err("Unexpected instruction %08x before bl _mcount\n", old);
> +			return -EINVAL;
> +		}
> +
> +		if (old =3D=3D PPC_INST_MFLR)
> +			rc =3D patch_instruction((unsigned int *)(ip - 4),
> +					PPC_INST_NOP);
> +#endif
> +		return rc;
>  	} else if (core_kernel_text(ip))
>  		return __ftrace_make_nop_kernel(rec, addr);
> =20
> @@ -863,6 +910,103 @@ void arch_ftrace_update_code(int command)
>  	ftrace_modify_all_code(command);
>  }
> =20
> +#ifdef CONFIG_MPROFILE_KERNEL
> +static int
> +__ftrace_make_call_prep(struct dyn_ftrace *rec)
> +{
> +	void *ip =3D (void *)rec->ip - MCOUNT_INSN_SIZE;
> +	unsigned int op[2], pop;
> +
> +	/* read where this goes */
> +	if (probe_kernel_read(op, ip, sizeof(op)))
> +		return -EFAULT;
> +
> +	if (op[1] !=3D PPC_INST_NOP) {
> +		pr_err("Unexpected call sequence at %p: %x %x\n",
> +							ip, op[0], op[1]);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * nothing to do if this is using the older -mprofile-kernel
> +	 * instruction sequence
> +	 */
> +	if (op[0] !=3D PPC_INST_NOP)
> +		return 0;
> +
> +	pop =3D PPC_INST_MFLR;
> +
> +	if (patch_instruction((unsigned int *)ip, pop)) {
> +		pr_err("Patching MFLR failed.\n");
> +		return -EPERM;
> +	}
> +
> +	return 0;
> +}
> +
> +void ftrace_replace_code(int mod_flags)
> +{
> +	int enable =3D mod_flags & FTRACE_MODIFY_ENABLE_FL;
> +	int schedulable =3D mod_flags & FTRACE_MODIFY_MAY_SLEEP_FL;
> +	int ret, failed, make_call =3D 0;
> +	struct ftrace_rec_iter *iter;
> +	struct dyn_ftrace *rec;
> +
> +	if (unlikely(!ftrace_enabled))
> +		return;
> +
> +	for_ftrace_rec_iter(iter) {
> +		rec =3D ftrace_rec_iter_record(iter);
> +
> +		if (rec->flags & FTRACE_FL_DISABLED)
> +			continue;
> +
> +		ret =3D ftrace_test_record(rec, enable);
> +		if (ret =3D=3D FTRACE_UPDATE_MAKE_CALL) {
> +			make_call++;
> +			failed =3D __ftrace_make_call_prep(rec);
> +		} else {
> +			failed =3D ftrace_do_replace_code(rec, enable);
> +		}
> +
> +		if (failed) {
> +			ftrace_bug(failed, rec);
> +			/* Stop processing */
> +			return;
> +		}
> +
> +		if (schedulable)
> +			cond_resched();
> +	}
> +
> +	if (!make_call)
> +		return;
> +
> +	synchronize_rcu_tasks();
> +
> +	for_ftrace_rec_iter(iter) {
> +		rec =3D ftrace_rec_iter_record(iter);
> +
> +		if (rec->flags & FTRACE_FL_DISABLED)
> +			continue;
> +
> +		ret =3D ftrace_test_record(rec, enable);
> +		if (ret =3D=3D FTRACE_UPDATE_MAKE_CALL)
> +			failed =3D ftrace_do_replace_code(rec, enable);
> +
> +		if (failed) {
> +			ftrace_bug(failed, rec);
> +			/* Stop processing */
> +			return;
> +		}
> +
> +		if (schedulable)
> +			cond_resched();
> +	}
> +
> +}
> +#endif
> +
>  #ifdef CONFIG_PPC64
>  #define PACATOC offsetof(struct paca_struct, kernel_toc)
> =20
> --=20
> 2.21.0
>=20
>=20
=
