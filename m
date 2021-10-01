Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3782B41F728
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 23:56:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLkSt16Zdz2ywZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Oct 2021 07:55:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iiw74Wn/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iiw74Wn/; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLkSD5fwnz2xKS
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Oct 2021 07:55:24 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B8BE661A8E
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 21:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633125322;
 bh=ODG7ko63+SeECP/R2xot0/o7Pf68iTfpmoQ4ddkvvgE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iiw74Wn/1qAdyp3/vk8gjsuvBVZIygv5q1zuzjSn4D4tCnEev57i+EMOZVYEe3U/g
 iotUV0w/ZUi6Cpc8CnBmjvdge8QV2/Ps+gtyYqCA0V0FOuwitXkO0WZr03n0ovs4XE
 1O3osnW0z5Dul05Kc9zOwq4GvqdvcLSV7fNVBL+vfbu9+pCLlgCp0N0fUWKkbCMrEo
 8FtsOlsKOyIFEuvzhS924EwvdfvDLG/mXwKdLKNyEUq6Y7mEU/nvs6/DyI1y/8J3wS
 b3nMYcLkP0TffghVvxvSaeCnSTPfa7ox4+29Ck5ESx6X/wePah+75U8uIM2Q37jlE8
 OAsXGZ4bGrLAg==
Received: by mail-lf1-f45.google.com with SMTP id y26so44109018lfa.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Oct 2021 14:55:22 -0700 (PDT)
X-Gm-Message-State: AOAM531eItDoIJsIPCqcBKYgVPky01PpJnLy3nT04ekYRux5AQ7OKsAD
 sAyjE9pvUE1FEj3F7nUkSiX4dUJs8AltGl+yzR0=
X-Google-Smtp-Source: ABdhPJzGYq5GxYt6ytpFJTagQnEr9jIH1Wb78oxJDJGQ8DSz0UeN6RZaKubShhWP9nH2ItnN7YkmX3h0DhKPor6qElI=
X-Received: by 2002:ac2:5182:: with SMTP id u2mr388299lfi.676.1633125321042;
 Fri, 01 Oct 2021 14:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
 <8cb6a1725cf3c38ca90ed7f195f78a5b5a83bb25.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <8cb6a1725cf3c38ca90ed7f195f78a5b5a83bb25.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
From: Song Liu <song@kernel.org>
Date: Fri, 1 Oct 2021 14:55:09 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6uHz=c_devNF3Rpub8bt6EPT-98Y1mifJUhW0U3gZLcg@mail.gmail.com>
Message-ID: <CAPhsuW6uHz=c_devNF3Rpub8bt6EPT-98Y1mifJUhW0U3gZLcg@mail.gmail.com>
Subject: Re: [PATCH 5/9] powerpc/bpf: Fix BPF_MOD when imm == 1
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>,
 Nicholas Piggin <npiggin@gmail.com>, bpf <bpf@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 1, 2021 at 2:16 PM Naveen N. Rao
<naveen.n.rao@linux.vnet.ibm.com> wrote:
>
> Only ignore the operation if dividing by 1.
>
> Fixes: 156d0e290e969c ("powerpc/ebpf/jit: Implement JIT compiler for extended BPF")
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Acked-by: Song Liu <songliubraving@fb.com>

> ---
>  arch/powerpc/net/bpf_jit_comp64.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 3351a866ef6207..ffb7a2877a8469 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -391,8 +391,14 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>                 case BPF_ALU64 | BPF_DIV | BPF_K: /* dst /= imm */
>                         if (imm == 0)
>                                 return -EINVAL;
> -                       else if (imm == 1)
> -                               goto bpf_alu32_trunc;
> +                       if (imm == 1) {
> +                               if (BPF_OP(code) == BPF_DIV) {
> +                                       goto bpf_alu32_trunc;
> +                               } else {
> +                                       EMIT(PPC_RAW_LI(dst_reg, 0));
> +                                       break;
> +                               }
> +                       }
>
>                         PPC_LI32(b2p[TMP_REG_1], imm);
>                         switch (BPF_CLASS(code)) {
> --
> 2.33.0
>
