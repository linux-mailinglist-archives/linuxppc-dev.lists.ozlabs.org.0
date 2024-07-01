Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D3A91DABA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 10:58:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LjPfw9Mg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCKgr4m36z3frb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 18:58:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LjPfw9Mg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCKg94t0gz3flV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 18:57:24 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2c8dc2bcb78so1975057a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2024 01:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719824242; x=1720429042; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3EvXgsoc3O6to34ZUw4BNKot/Hf+C3K+5hMVbVjdas=;
        b=LjPfw9MgT7Q4z+ny7X9rN4tv2qvHSpYnkNNJTQGc0pODQQ7qrlrcBbmwDL2ikITQxm
         EaEHWx02QNXmoNTTj8evwTOu3Rw1ANQnU6MYuKmJh7C4L53Ik3ow+hDvfZCzd10MoSeH
         8BDG4C7nDEsuBvZxmZTus0VeRSYdBM9kQd9JSuqTgEu9/E35oEk22cEcIRC5nK8l0Kqw
         +UEGuPywcVoU3kQw6t4zEc0Ds3XPPie6Nwbi6bd+J0ldtC4cQYT9Xh8bqx5RTHMw4AlT
         LRklB7QoSkw2zpdFQM0rYlTWo34R7/DMj6Z7Ov1w2aeRxJUxIyuwWD+nUdXcxvsfkGis
         6Tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719824242; x=1720429042;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s3EvXgsoc3O6to34ZUw4BNKot/Hf+C3K+5hMVbVjdas=;
        b=XzLI0Jdt/Zr4UI+DeHKTt2WgdZC68kZtqMQlWQAaJ+r03dAnexqaiUAiRcj7VeINRw
         Gish3Ub9pbmk3WClevzeED6fKyyAVqo1rfRiepWVqFQaVGwSYIOZsR2ZMFAxxFDP++SI
         DXtjBHbGi2uQnQZ2zUxxnEFyVrvbzYa7WlWSd/Qtpw/4xU2wMgCkGD48+SNVM6QG2h71
         yr2HKgxhYPgQnzaFGK3bGe9iCDhvdaV+xbpE/5wHX0OCsx08HL7VyRPzGMRIYdhWCD/e
         pXHxcQfB83dZPYWFExkZRHXpz8vwwVfomMaF0H1fvbe5Ie59GPYMBY60nYX29yt37f6E
         WT3g==
X-Forwarded-Encrypted: i=1; AJvYcCW733YdkE7GtpwHFFci/y7UgncyE2IdGutDU8LMJbroSqF6+7e4NeWCseWCyXxOZKme/cL01YXWB5vH+Msjh3Q8hzU1AK9FQwVFdUAItA==
X-Gm-Message-State: AOJu0Yy91x6wc52LLu48Xi0aa5DKHHGDQFo2FTeyz2uDOJF20SAwrep1
	3QBBlRbuhWf0RUalBsV/3ga50coLTMMNvtAJWbvUoCrEhr9oSBkH
X-Google-Smtp-Source: AGHT+IEDvSU0oo0hBRimVQFNxsC3NUrVirQPsrFJamW6UMpKXqrPbz0/TBmfJjHNrLF1XSL0utuzIw==
X-Received: by 2002:a17:90a:5145:b0:2c8:660d:cc2 with SMTP id 98e67ed59e1d1-2c93d6f286cmr3927079a91.4.1719824241618;
        Mon, 01 Jul 2024 01:57:21 -0700 (PDT)
Received: from localhost (118-211-5-80.tpgi.com.au. [118.211.5.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3b9f2csm6205352a91.35.2024.07.01.01.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 01:57:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jul 2024 18:57:12 +1000
Message-Id: <D2E2T58ECN7G.1CFVM4AI1ZESG@gmail.com>
Subject: Re: [RFC PATCH v3 02/11] powerpc/ftrace: Unify 32-bit and 64-bit
 ftrace entry code
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Naveen N Rao" <naveen@kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-trace-kernel@vger.kernel.org>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <cover.1718908016.git.naveen@kernel.org>
 <f2d5d66d47b28474b6224613787757fed3e92d3d.1718908016.git.naveen@kernel.org>
In-Reply-To: <f2d5d66d47b28474b6224613787757fed3e92d3d.1718908016.git.naveen@kernel.org>
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
> On 32-bit powerpc, gcc generates a three instruction sequence for
> function profiling:
> 	mflr	r0
> 	stw	r0, 4(r1)
> 	bl	_mcount
>
> On kernel boot, the call to _mcount() is nop-ed out, to be patched back
> in when ftrace is actually enabled. The 'stw' instruction therefore is
> not necessary unless ftrace is enabled. Nop it out during ftrace init.
>
> When ftrace is enabled, we want the 'stw' so that stack unwinding works
> properly. Perform the same within the ftrace handler, similar to 64-bit
> powerpc.
>
> For 64-bit powerpc, early versions of gcc used to emit a three
> instruction sequence for function profiling (with -mprofile-kernel) with
> a 'std' instruction to mimic the 'stw' above. Address that scenario also
> by nop-ing out the 'std' instruction during ftrace init.

Cool! Could 32-bit use the 2-insn sequence as well if it had
-mprofile-kernel, out of curiosity?

>
> Signed-off-by: Naveen N Rao <naveen@kernel.org>
> ---
>  arch/powerpc/kernel/trace/ftrace.c       | 6 ++++--
>  arch/powerpc/kernel/trace/ftrace_entry.S | 4 ++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/tra=
ce/ftrace.c
> index d8d6b4fd9a14..463bd7531dc8 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -241,13 +241,15 @@ int ftrace_init_nop(struct module *mod, struct dyn_=
ftrace *rec)
>  		/* Expected sequence: 'mflr r0', 'stw r0,4(r1)', 'bl _mcount' */
>  		ret =3D ftrace_validate_inst(ip - 8, ppc_inst(PPC_RAW_MFLR(_R0)));
>  		if (!ret)
> -			ret =3D ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_STW(_R0, _R1, 4=
)));
> +			ret =3D ftrace_modify_code(ip - 4, ppc_inst(PPC_RAW_STW(_R0, _R1, 4))=
,
> +						 ppc_inst(PPC_RAW_NOP()));
>  	} else if (IS_ENABLED(CONFIG_MPROFILE_KERNEL)) {
>  		/* Expected sequence: 'mflr r0', ['std r0,16(r1)'], 'bl _mcount' */
>  		ret =3D ftrace_read_inst(ip - 4, &old);
>  		if (!ret && !ppc_inst_equal(old, ppc_inst(PPC_RAW_MFLR(_R0)))) {
>  			ret =3D ftrace_validate_inst(ip - 8, ppc_inst(PPC_RAW_MFLR(_R0)));
> -			ret |=3D ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_STD(_R0, _R1, =
16)));
> +			ret |=3D ftrace_modify_code(ip - 4, ppc_inst(PPC_RAW_STD(_R0, _R1, 16=
)),
> +						  ppc_inst(PPC_RAW_NOP()));

So this is the old style path... Should you check the mflr validate
result first? Also do you know what GCC version, roughly? Maybe we
could have a comment here and eventually deprecate it.

You could split this change into its own patch.

>  		}
>  	} else {
>  		return -EINVAL;
> diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kern=
el/trace/ftrace_entry.S
> index 76dbe9fd2c0f..244a1c7bb1e8 100644
> --- a/arch/powerpc/kernel/trace/ftrace_entry.S
> +++ b/arch/powerpc/kernel/trace/ftrace_entry.S
> @@ -33,6 +33,8 @@
>   * and then arrange for the ftrace function to be called.
>   */
>  .macro	ftrace_regs_entry allregs
> +	/* Save the original return address in A's stack frame */
> +	PPC_STL		r0, LRSAVE(r1)
>  	/* Create a minimal stack frame for representing B */
>  	PPC_STLU	r1, -STACK_FRAME_MIN_SIZE(r1)
> =20
> @@ -44,8 +46,6 @@
>  	SAVE_GPRS(3, 10, r1)
> =20
>  #ifdef CONFIG_PPC64
> -	/* Save the original return address in A's stack frame */
> -	std	r0, LRSAVE+SWITCH_FRAME_SIZE+STACK_FRAME_MIN_SIZE(r1)
>  	/* Ok to continue? */
>  	lbz	r3, PACA_FTRACE_ENABLED(r13)
>  	cmpdi	r3, 0

That seems right to me.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
