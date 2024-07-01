Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8CD91DB69
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 11:28:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZR2b6xYe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCLMG2K1Nz3ft5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 19:28:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZR2b6xYe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCLLb3R3wz3fTV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 19:28:06 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2c1a4192d55so1472295a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2024 02:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719826084; x=1720430884; darn=lists.ozlabs.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpPhp371r6vsTyMutHc20NsXXbmLoxmB6xNDF30tnFg=;
        b=ZR2b6xYeXiYRP7U2Fsr4+k8BBrK7UjSp3CI8w+cT28ENfj00S6RInHcWEMMuHSyTX4
         kZnlK/INIuym69IBMBt80m07RJDJ3lrZYESDF0st/HAiZG3vi23IeunJeC3bdptks4m6
         EqRzb3giBjRZjg89hT1lXX1jn65jQALZYFQW9ewpPDkQV6zULuNoMGqdwzBF4L4KsS1F
         N011boRyIMx/A1+GjhgzXxM8eQPBu5tb+SKSou2em0BPHYWSxR5zYBM/1dnEMni4N9DD
         ccLPEeF/I7XGHue8aPyt8i1zdXfD8e4gk6iIu98L0kvXtBRK6+elY4Ui7S3VevItalHT
         Bcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719826084; x=1720430884;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gpPhp371r6vsTyMutHc20NsXXbmLoxmB6xNDF30tnFg=;
        b=Cf2M9tNva+CbVnvjZ5Aj5HtqM1p0kpLFFOCqclha2p3gzmuyjoHBwfbKS349NNgg+c
         ex/WaTBcchyOvsaY5gSWS+spnIkZ+CIVfNa4hXz7m8Dpk0p2TCiMo5jqzi29EoK/jyt0
         RlgCwCOxLPYH/37JFvDXkJcbP8ZhM0yae4PFbIzEdEnbEde7m8TNc1XXDq2inc0i2pSh
         9SDQwlnoY2cE6m7taXO87cOWYyQ25gbRSu8KWnsZtHbaNDMVMlN2N5LGxsa3LFXTjMeK
         vriJa0mDsS8ur7U5Sr0rlx1U2A8gS/oeYfIAoIaI56RB2ggKJlCaIH8DE3/oUXuvfxva
         UBoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW03afu41Cqh93w7kalCPGEUS/KLAxIty6p7h5lPVfK0XyKuS2fmEbjwdUegpaw2AxPvtPWl3PnWwgpFBj5bAdDFk5nbzO4Z/vC1mTUhQ==
X-Gm-Message-State: AOJu0YyagiPFMgVBXlJEbrdDtctuMwtXENzYmfZSkasm2OvdbfRjPyRu
	NPKEOiwgLePnQPYYObf/Ohiq9dh5HIu+uOwnoFDJECDqr1BKx9YY
X-Google-Smtp-Source: AGHT+IH6I2DlaBIeXUUYgjLeoMC1HJ0wmxY95eFhcgqTFT+WgfyJzrPH8kD5cMBD8wCRv1qjUcn2Gw==
X-Received: by 2002:a17:90a:ac10:b0:2c4:dc4d:83dc with SMTP id 98e67ed59e1d1-2c93d6c6080mr2348497a91.5.1719826083601;
        Mon, 01 Jul 2024 02:28:03 -0700 (PDT)
Received: from localhost (118-211-5-80.tpgi.com.au. [118.211.5.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce17a83sm6246602a91.11.2024.07.01.02.27.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 02:28:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jul 2024 19:27:55 +1000
Message-Id: <D2E3GNRTRCOF.16TWBZIA5EZS2@gmail.com>
To: "Naveen N Rao" <naveen@kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-trace-kernel@vger.kernel.org>, <bpf@vger.kernel.org>
Subject: Re: [RFC PATCH v3 04/11] powerpc/ftrace: Remove pointer to struct
 module from dyn_arch_ftrace
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.17.0
References: <cover.1718908016.git.naveen@kernel.org>
 <f13b5e0cb4f9961f23c8880a2f98073e41f695d8.1718908016.git.naveen@kernel.org>
In-Reply-To: <f13b5e0cb4f9961f23c8880a2f98073e41f695d8.1718908016.git.naveen@kernel.org>
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
> Pointer to struct module is only relevant for ftrace records belonging
> to kernel modules. Having this field in dyn_arch_ftrace wastes memory
> for all ftrace records belonging to the kernel. Remove the same in
> favour of looking up the module from the ftrace record address, similar
> to other architectures.

arm is the only one left that requires dyn_arch_ftrace after this.

>
> Signed-off-by: Naveen N Rao <naveen@kernel.org>
> ---
>  arch/powerpc/include/asm/ftrace.h        |  1 -
>  arch/powerpc/kernel/trace/ftrace.c       | 54 +++++++++++-------
>  arch/powerpc/kernel/trace/ftrace_64_pg.c | 73 +++++++++++-------------
>  3 files changed, 65 insertions(+), 63 deletions(-)
>

[snip]

> @@ -106,28 +106,48 @@ static unsigned long find_ftrace_tramp(unsigned lon=
g ip)
>  	return 0;
>  }
> =20
> +#ifdef CONFIG_MODULES
> +static unsigned long ftrace_lookup_module_stub(unsigned long ip, unsigne=
d long addr)
> +{
> +	struct module *mod =3D NULL;
> +
> +	/*
> +	 * NOTE: __module_text_address() must be called with preemption
> +	 * disabled, but we can rely on ftrace_lock to ensure that 'mod'
> +	 * retains its validity throughout the remainder of this code.
> +	 */
> +	preempt_disable();
> +	mod =3D __module_text_address(ip);
> +	preempt_enable();

If 'mod' was guaranteed to exist before your patch, then it
should do afterward too. But is it always ftrace_lock that
protects it, or do dyn_ftrace entries pin a module in some
cases?

> @@ -555,7 +551,10 @@ __ftrace_modify_call(struct dyn_ftrace *rec, unsigne=
d long old_addr,
>  	ppc_inst_t op;
>  	unsigned long ip =3D rec->ip;
>  	unsigned long entry, ptr, tramp;
> -	struct module *mod =3D rec->arch.mod;
> +	struct module *mod =3D ftrace_lookup_module(rec);
> +
> +	if (!mod)
> +		return -EINVAL;
> =20
>  	/* If we never set up ftrace trampolines, then bail */
>  	if (!mod->arch.tramp || !mod->arch.tramp_regs) {
> @@ -668,14 +667,6 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsig=
ned long old_addr,
>  		return -EINVAL;
>  	}
> =20
> -	/*
> -	 * Out of range jumps are called from modules.
> -	 */
> -	if (!rec->arch.mod) {
> -		pr_err("No module loaded\n");
> -		return -EINVAL;
> -	}
> -

A couple of these conversions are not _exactly_ the same (lost
the pr_err here), maybe that's deliberate because the messages
don't look too useful.

Looks okay though

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
