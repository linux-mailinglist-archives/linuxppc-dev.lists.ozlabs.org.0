Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3F941F735
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Oct 2021 00:02:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLkbp2zVjz3c6k
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Oct 2021 08:01:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dh0IirtB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dh0IirtB; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLkb70KVsz2xXm
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Oct 2021 08:01:22 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B31A461AA9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 22:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633125680;
 bh=ct1RiOV8SWaRMqtQR6mhN6Gfe8wqvu8A1heHzzQy0aA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dh0IirtB/+Wi6dD9XGhx3U0CM4Oqjbg1yjyxzVfH79jTBKvh67zSVLLW+yb9xlWaA
 iY9tLaBjzHZpfIB2GpqbpkcDS6T6/Y1xevE5IQ7KIXD+9a5qEVTbYTO3I+JxnV+Ob5
 xW6XDm16GdohmiopCX3PbYc0x0JbgwHsEU6UJzMfY41rIUSf27SU4j1TgGqBX82ESK
 nTDiyhLCNh6Mz7oEVi8fip84lbAtjeJuznUzQ2R7+RtNTPgCdHSrxKteZawZWRhDex
 uTrmXo9xrBRHHEkgqRAnZDr8JWekmqKCIMR1JQcHiFqIHVFWU0dBhk9Glevfeh1ipo
 YRyFb5YhvWgKg==
Received: by mail-lf1-f53.google.com with SMTP id u18so44150923lfd.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Oct 2021 15:01:20 -0700 (PDT)
X-Gm-Message-State: AOAM531o6D1uoqkpC6soNShwb7zZlnMbFI1PDQG9d3qotlHuXSx/WqvB
 wdi4NJN1GGeH5NhaH2f47lgAHxCfOMKt52CHuv0=
X-Google-Smtp-Source: ABdhPJy5gI/gJV0ZaWKuso9c92vVQLkAnF7492oeobgBYUYyFao+kcaa4K1NVJr55w5x99OKO58aQHYNS5/rz3MJwAw=
X-Received: by 2002:a05:6512:3048:: with SMTP id
 b8mr410642lfb.650.1633125679001; 
 Fri, 01 Oct 2021 15:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
 <1912a409447071f46ac6cc957ce8edea0e5232b7.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <1912a409447071f46ac6cc957ce8edea0e5232b7.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
From: Song Liu <song@kernel.org>
Date: Fri, 1 Oct 2021 15:01:07 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5NraEPybLVcKWzHva4ksTa05msv-2PBdFXPt_J+=xTyw@mail.gmail.com>
Message-ID: <CAPhsuW5NraEPybLVcKWzHva4ksTa05msv-2PBdFXPt_J+=xTyw@mail.gmail.com>
Subject: Re: [PATCH 6/9] powerpc/bpf: Fix BPF_SUB when imm == 0x80000000
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

On Fri, Oct 1, 2021 at 2:17 PM Naveen N. Rao
<naveen.n.rao@linux.vnet.ibm.com> wrote:
>
> We aren't handling subtraction involving an immediate value of
> 0x80000000 properly. Fix the same.
>
> Fixes: 156d0e290e969c ("powerpc/ebpf/jit: Implement JIT compiler for extended BPF")
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Acked-by: Song Liu <songliubraving@fb.com>

> ---
>  arch/powerpc/net/bpf_jit_comp64.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index ffb7a2877a8469..4641a50e82d50d 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -333,15 +333,15 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>                 case BPF_ALU | BPF_SUB | BPF_K: /* (u32) dst -= (u32) imm */
>                 case BPF_ALU64 | BPF_ADD | BPF_K: /* dst += imm */
>                 case BPF_ALU64 | BPF_SUB | BPF_K: /* dst -= imm */
> -                       if (BPF_OP(code) == BPF_SUB)
> -                               imm = -imm;
> -                       if (imm) {
> -                               if (imm >= -32768 && imm < 32768)
> -                                       EMIT(PPC_RAW_ADDI(dst_reg, dst_reg, IMM_L(imm)));
> -                               else {
> -                                       PPC_LI32(b2p[TMP_REG_1], imm);
> +                       if (imm > -32768 && imm < 32768) {
> +                               EMIT(PPC_RAW_ADDI(dst_reg, dst_reg,
> +                                       BPF_OP(code) == BPF_SUB ? IMM_L(-imm) : IMM_L(imm)));
> +                       } else {
> +                               PPC_LI32(b2p[TMP_REG_1], imm);
> +                               if (BPF_OP(code) == BPF_SUB)
> +                                       EMIT(PPC_RAW_SUB(dst_reg, dst_reg, b2p[TMP_REG_1]));
> +                               else
>                                         EMIT(PPC_RAW_ADD(dst_reg, dst_reg, b2p[TMP_REG_1]));
> -                               }
>                         }
>                         goto bpf_alu32_trunc;
>                 case BPF_ALU | BPF_MUL | BPF_X: /* (u32) dst *= (u32) src */
> --
> 2.33.0
>
