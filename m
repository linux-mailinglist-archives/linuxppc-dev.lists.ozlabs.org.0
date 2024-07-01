Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D7791DD6C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 13:04:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CVXT7TzI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCNV62BYPz3dLH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 21:04:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CVXT7TzI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCNTQ319Hz3bsj
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 21:04:09 +1000 (AEST)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-25d5333989dso1579242fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2024 04:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719831842; x=1720436642; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXzeEVHZAYNwP9LyDiGI74pJ3kMgBavuirX+asSxPgg=;
        b=CVXT7TzIp5vWV9tOKjxjBTFu80WjIdRjSAF6Qfn/TxUq2mrp5uBviZrt3m+tAbda0G
         mSeo6fjSb6WYA8ypF8lR6A7uDjjkY1P54ZJoWP8Xk5sEI6KoY/2+bdJzkxhVbp5S5qaO
         YTh6lLg1GZVAAw0ISJpLX5j6TA4mS0D+q5UWIo8g25HT9eI014geul4z0qLL1GBnySHR
         TYsbYE32mvn5hF+606z8UQGbpGqQcFvthmNSDNwC5OEbNVAhChIkdUsFStQgUjfr4EYW
         QXuNnuuG7QKQBOKZlEbveCca5tV798hsLgn0/7EoNHgN39sKfEUq8TChqGv9CFwd6gzJ
         Brww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719831842; x=1720436642;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YXzeEVHZAYNwP9LyDiGI74pJ3kMgBavuirX+asSxPgg=;
        b=v9Uzo6VUOsrZS/O0C2Wnrp4TbFm3w6OReSBvnpf67JjS0LWuZ+hRk7jNONLezfvgVg
         6ohvUqmBW/8MP2on+7hyvBFq0P6s5QD5Wz2h0eDwcUrGaJLOpHhHNfXHY3xlaBpq7M8M
         seLkBA818Wig7AEWbW2QCTvapLPmLUvskcczlhdjG3bTKVoqhckJuVUl/dUndMIZsLiz
         AD//gNw/IF9SUWT2W0MEJVF5DNIhmPGcKgr//FrKyT8f1cL9qt18Ty5kBtlCGan+E06R
         jRgftS73FL5h+CV571JAUCMGs0hKez/38cOWZa+Ssb9CBrJkskFe1a3fbd1x+HF0//SE
         1Acg==
X-Forwarded-Encrypted: i=1; AJvYcCXU2qvrLep1o4KoibjN9th7JfD9lQyqnRMuRt9SffTw+nlvz77zNrzElR42AGuQ9b4fhiwbt6mvO+iGhvlE3MQW2IA+/PM5gU+uPIl+5Q==
X-Gm-Message-State: AOJu0YwUNPXGi9qaIjtAujisqHyMjdA5Eg4SP9E4OhWVn4rIGn/QWrtZ
	+yiIT2Tq/k0XLOi10TMMiP/TlGebtGhp/qRyIM8T4jgys1U3pS/l
X-Google-Smtp-Source: AGHT+IGMlV0x2miXA7z/rApts7dhyaI7OUHVJdLxouoZVTa6LuzzBUiiewgzDm8W7JY1cJ2YJcu8rA==
X-Received: by 2002:a05:6870:d889:b0:25d:5a7c:c8ec with SMTP id 586e51a60fabf-25db33f8b67mr5830768fac.13.1719831841923;
        Mon, 01 Jul 2024 04:04:01 -0700 (PDT)
Received: from localhost (118-211-5-80.tpgi.com.au. [118.211.5.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708044ae395sm6396945b3a.144.2024.07.01.04.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 04:04:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jul 2024 21:03:52 +1000
Message-Id: <D2E5I4W6C23X.3A42AJCY8ODUJ@gmail.com>
Subject: Re: [RFC PATCH v3 11/11] powerpc64/bpf: Add support for bpf
 trampolines
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Naveen N Rao" <naveen@kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-trace-kernel@vger.kernel.org>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <cover.1718908016.git.naveen@kernel.org>
 <a88b5b57d7e9b6db96323a6d6b236d567ebd6443.1718908016.git.naveen@kernel.org>
In-Reply-To: <a88b5b57d7e9b6db96323a6d6b236d567ebd6443.1718908016.git.naveen@kernel.org>
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

On Fri Jun 21, 2024 at 5:09 AM AEST, Naveen N Rao wrote:
> Add support for bpf_arch_text_poke() and arch_prepare_bpf_trampoline()
> for 64-bit powerpc.

What do BPF trampolines give you?

> BPF prog JIT is extended to mimic 64-bit powerpc approach for ftrace
> having a single nop at function entry, followed by the function
> profiling sequence out-of-line and a separate long branch stub for calls
> to trampolines that are out of range. A dummy_tramp is provided to
> simplify synchronization similar to arm64.

Synrhonization - between BPF and ftrace interfaces?

> BPF Trampolines adhere to the existing ftrace ABI utilizing a
> two-instruction profiling sequence, as well as the newer ABI utilizing a
> three-instruction profiling sequence enabling return with a 'blr'. The
> trampoline code itself closely follows x86 implementation.
>
> While the code is generic, BPF trampolines are only enabled on 64-bit
> powerpc. 32-bit powerpc will need testing and some updates.
>
> Signed-off-by: Naveen N Rao <naveen@kernel.org>

Just a quick glance for now, and I don't know BPF code much.

> ---
>  arch/powerpc/include/asm/ppc-opcode.h |  14 +
>  arch/powerpc/net/bpf_jit.h            |  11 +
>  arch/powerpc/net/bpf_jit_comp.c       | 702 +++++++++++++++++++++++++-
>  arch/powerpc/net/bpf_jit_comp32.c     |   7 +-
>  arch/powerpc/net/bpf_jit_comp64.c     |   7 +-
>  5 files changed, 738 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include=
/asm/ppc-opcode.h
> index 076ae60b4a55..9eaa2c5d9b73 100644
> --- a/arch/powerpc/include/asm/ppc-opcode.h
> +++ b/arch/powerpc/include/asm/ppc-opcode.h
> @@ -585,12 +585,26 @@
>  #define PPC_RAW_MTSPR(spr, d)		(0x7c0003a6 | ___PPC_RS(d) | __PPC_SPR(sp=
r))
>  #define PPC_RAW_EIEIO()			(0x7c0006ac)
> =20
> +/* bcl 20,31,$+4 */
> +#define PPC_RAW_BCL()			(0x429f0005)

This is the special bcl form that gives the current address.
Maybe call it PPC_RAW_BCL4()

> =20
> +void dummy_tramp(void);
> +
> +asm (
> +"	.pushsection .text, \"ax\", @progbits	;"
> +"	.global dummy_tramp			;"
> +"	.type dummy_tramp, @function		;"
> +"dummy_tramp:					;"
> +#ifdef CONFIG_FTRACE_PFE_OUT_OF_LINE
> +"	blr					;"
> +#else
> +"	mflr	11				;"

Can you just drop this instruction? The caller will always
have it in r11?

> +"	mtctr	11				;"
> +"	mtlr	0				;"
> +"	bctr					;"
> +#endif
> +"	.size dummy_tramp, .-dummy_tramp	;"
> +"	.popsection				;"
> +);
> +
> +void bpf_jit_build_fentry_stubs(u32 *image, struct codegen_context *ctx)
> +{
> +	int ool_stub_idx, long_branch_stub_idx;
> +
> +	/*
> +	 * Out-of-line stub:
> +	 *	mflr	r0
> +	 *	[b|bl]	tramp
> +	 *	mtlr	r0 // only with CONFIG_FTRACE_PFE_OUT_OF_LINE
> +	 *	b	bpf_func + 4
> +	 */
> +	ool_stub_idx =3D ctx->idx;
> +	EMIT(PPC_RAW_MFLR(_R0));
> +	EMIT(PPC_RAW_NOP());
> +	if (IS_ENABLED(CONFIG_FTRACE_PFE_OUT_OF_LINE))
> +		EMIT(PPC_RAW_MTLR(_R0));
> +	WARN_ON_ONCE(!is_offset_in_branch_range(4 - (long)ctx->idx * 4)); /* TO=
DO */
> +	EMIT(PPC_RAW_BRANCH(4 - (long)ctx->idx * 4));
> +
> +	/*
> +	 * Long branch stub:
> +	 *	.long	<dummy_tramp_addr>
> +	 *	mflr	r11
> +	 *	bcl	20,31,$+4
> +	 *	mflr	r12
> +	 *	ld	r12, -8-SZL(r12)
> +	 *	mtctr	r12
> +	 *	mtlr	r11 // needed to retain ftrace ABI
> +	 *	bctr
> +	 */

You could avoid clobbering LR on >=3D POWER9 with addpcis instruction. Or
use a pcrel load with pcrel even. I guess that's something to do later.

Thanks,
Nick
