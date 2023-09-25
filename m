Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAB97AE179
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 00:02:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S5jQCjz6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvcLS1XFCz2yVL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 08:02:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S5jQCjz6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvcKX1ptFz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 08:01:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DA1F1B80D42
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 22:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40371C433CC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 22:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695679307;
	bh=0O3ido7rmEDfjvxG6mGGFFX0uMKRMEpik2wUpr5u2Ho=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S5jQCjz6JIH5dpnsWPoJOkAl4iTXN29HXQPBZB46gEMqi/26/S2jVbiCq4hFJDyhX
	 yB1J/6HSuBf60kHuY68Wov8a1wyDUy6/yaWQ0z/OuCkXJxG+2z/52U1w07mixkkAS4
	 kB0Fe6XVdX7aPwg6aBlZbwRfw1RDLn3HSpn5yA5N2lBnMe7VvAhS0z3Rnqr3RVMP2O
	 qe2vYUxSeBdCW2HDT7iNr+lqvQDDlYpL+nutuwUKdT2R8vDNw0roimbhuWZcl+S0hB
	 iK8s6C+eaMegHwZmZwlkw1QQt54JhEOcvOiudeEChLIXdlI3vOE/vUB6S8hSE/ectv
	 2RzvrLvG1tRrg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50433d8385cso11047538e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 15:01:47 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzk4f/X3dhpjNjtt4JYdSy9rvGla1brpy6CSxdLD6lcrYWft0QK
	mWRy7FUJxPi/uRbV14RIQK0W2mK84KdPXuoT7iA=
X-Google-Smtp-Source: AGHT+IEoEAd4772idTInduhoEVpKsLU/aLFuXH7IRnbihgbD7VLg2gD1QnQHi/xJRcjTPo84BMarj4q4DZubWkwrP7U=
X-Received: by 2002:a05:6512:308f:b0:503:985:92c4 with SMTP id
 z15-20020a056512308f00b00503098592c4mr7488707lfd.52.1695679305436; Mon, 25
 Sep 2023 15:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230908132740.718103-1-hbathini@linux.ibm.com> <20230908132740.718103-2-hbathini@linux.ibm.com>
In-Reply-To: <20230908132740.718103-2-hbathini@linux.ibm.com>
From: Song Liu <song@kernel.org>
Date: Mon, 25 Sep 2023 15:01:33 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6J6vK_X1bROKs0pskuogTbZ052hEfUiZH7Q1USdZwV=Q@mail.gmail.com>
Message-ID: <CAPhsuW6J6vK_X1bROKs0pskuogTbZ052hEfUiZH7Q1USdZwV=Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] powerpc/bpf: implement bpf_arch_text_copy
To: Hari Bathini <hbathini@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, bpf@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 8, 2023 at 6:28=E2=80=AFAM Hari Bathini <hbathini@linux.ibm.com=
> wrote:
>
> bpf_arch_text_copy is used to dump JITed binary to RX page, allowing
> multiple BPF programs to share the same page. Use patch_instruction()
> to implement it.
>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/net/bpf_jit_comp.c | 41 ++++++++++++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_c=
omp.c
> index 37043dfc1add..4f896222c579 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -13,9 +13,12 @@
>  #include <linux/netdevice.h>
>  #include <linux/filter.h>
>  #include <linux/if_vlan.h>
> -#include <asm/kprobes.h>
> +#include <linux/memory.h>
>  #include <linux/bpf.h>
>
> +#include <asm/kprobes.h>
> +#include <asm/code-patching.h>
> +
>  #include "bpf_jit.h"
>
>  static void bpf_jit_fill_ill_insns(void *area, unsigned int size)
> @@ -23,6 +26,28 @@ static void bpf_jit_fill_ill_insns(void *area, unsigne=
d int size)
>         memset32(area, BREAKPOINT_INSTRUCTION, size / 4);
>  }
>
> +/*
> + * Patch 'len' bytes of instructions from opcode to addr, one instructio=
n
> + * at a time. Returns addr on success. ERR_PTR(-EINVAL), otherwise.
> + */
> +static void *bpf_patch_instructions(void *addr, void *opcode, size_t len=
, bool fill_insn)
> +{
> +       while (len > 0) {
> +               ppc_inst_t insn =3D ppc_inst_read(opcode);
> +               int ilen =3D ppc_inst_len(insn);
> +
> +               if (patch_instruction(addr, insn))
> +                       return ERR_PTR(-EINVAL);

Is there any reason we have to do this one instruction at a time? I believe
Christophe Leroy pointed out the same in an earlier version?

Thanks,
Song

> +
> +               len -=3D ilen;
> +               addr =3D addr + ilen;
> +               if (!fill_insn)
> +                       opcode =3D opcode + ilen;
> +       }
> +
> +       return addr;
> +}
> +
>  int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx, int =
tmp_reg, long exit_addr)
>  {
>         if (!exit_addr || is_offset_in_branch_range(exit_addr - (ctx->idx=
 * 4))) {
> @@ -274,3 +299,17 @@ int bpf_add_extable_entry(struct bpf_prog *fp, u32 *=
image, int pass, struct code
>         ctx->exentry_idx++;
>         return 0;
>  }
> +
> +void *bpf_arch_text_copy(void *dst, void *src, size_t len)
> +{
> +       void *ret;
> +
> +       if (WARN_ON_ONCE(core_kernel_text((unsigned long)dst)))
> +               return ERR_PTR(-EINVAL);
> +
> +       mutex_lock(&text_mutex);
> +       ret =3D bpf_patch_instructions(dst, src, len, false);
> +       mutex_unlock(&text_mutex);
> +
> +       return ret;
> +}
