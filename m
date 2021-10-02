Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CE141FE61
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Oct 2021 00:12:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HMLnF4WDpz3cSS
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Oct 2021 09:12:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=anyfinetworks-com.20210112.gappssmtp.com header.i=@anyfinetworks-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=ewzQmIrD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=anyfinetworks.com (client-ip=2607:f8b0:4864:20::b29;
 helo=mail-yb1-xb29.google.com; envelope-from=johan.almbladh@anyfinetworks.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anyfinetworks-com.20210112.gappssmtp.com
 header.i=@anyfinetworks-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ewzQmIrD; dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HMDc257W4z2yNp
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Oct 2021 04:33:54 +1100 (AEDT)
Received: by mail-yb1-xb29.google.com with SMTP id h2so27610281ybi.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Oct 2021 10:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anyfinetworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q9BJpIWouO0yCw7uAhSt5OLkYTMRmYmAJz8CzPOSV9Q=;
 b=ewzQmIrDgEB1ElAXy3A/VnyV6jIwxvN/gSwOlLeWJT2AwhyNt5LsR9X7QvtOE9VfX9
 m18KxsGUPbMfUgZ7ZwtJKyU54npWAmc0LSvlIKf0y3w6JXadBP5pnWTZDr654f2pkx+8
 RXWL4Bw6gHoWy6YpvnMTD+DQiWQjj+ZOqAv93za5lOm37jLqaaJZkS6UFhl2G4lYfEnm
 Vd+QylQEBF/aeCJ5p3mY8zmU1sQ6GKuCPcqQ92yRe3c0M/BcxcLg9RwWaO57H1PnKGlJ
 VKvEKkX22l4K6DNYNmqODMSsKXlJ+hrdpyzpFWmITaSyc7iB29vjTiI+O+4L5akr36Uj
 SDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q9BJpIWouO0yCw7uAhSt5OLkYTMRmYmAJz8CzPOSV9Q=;
 b=RW/MSX+NLY4PP/0aAvMqPxEtDBVuIBoYfYa48G1qTuhmwMBhx4qqU2rL6K+KnR4k2e
 nQkhdZzeDTJTVrEStkOKM5KQb2xItmgALu97P9Yc6NGGlzWjEYQNbPhfAeDGYRjNJTPa
 +d+OaGH2jjIKeQOG+WULf8xMOg94otfyjMwC08HoydUHC9xe3DSUPZXVN3uV2sHX1ym2
 pKQ/E1HDoqV2qjEI4h8q+MzC3tliEV5b7Y5kmbWgbAAboAquxktABYv/kC4S80wo4f7n
 gMZkCtU64j8DD9VYx9l5UeRMsxzi8Vg0bu92PfJcn0Frc+kmpIwHKvzT0NjrQLQrGm6/
 g+XA==
X-Gm-Message-State: AOAM531pGbX2BXK566KjvrcK6uWXJZm2c5z3r+BKZLM2zomg8I62Yf6s
 PnlGuqgbPR61nEtI42zRdNJ8tZMRJL9F3BCOErHrRA==
X-Google-Smtp-Source: ABdhPJw2Pr/3UbJ0Qj3xDJOORHdKysGfw0VFAcBEL20/GxvheGKU9xyKmXdxhpk8PC17qieHaQIxoe3nnCKaZ5ZyShU=
X-Received: by 2002:a25:c006:: with SMTP id c6mr4853635ybf.480.1633196032390; 
 Sat, 02 Oct 2021 10:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
 <1912a409447071f46ac6cc957ce8edea0e5232b7.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <1912a409447071f46ac6cc957ce8edea0e5232b7.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Sat, 2 Oct 2021 19:33:41 +0200
Message-ID: <CAM1=_QQfJsFimv6kVs-g8YPj71KR9vPhHh=NRbZQNty+toU0aw@mail.gmail.com>
Subject: Re: [PATCH 6/9] powerpc/bpf: Fix BPF_SUB when imm == 0x80000000
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 03 Oct 2021 09:09:12 +1100
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, Nicholas Piggin <npiggin@gmail.com>,
 bpf <bpf@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 1, 2021 at 11:15 PM Naveen N. Rao
<naveen.n.rao@linux.vnet.ibm.com> wrote:
>
> We aren't handling subtraction involving an immediate value of
> 0x80000000 properly. Fix the same.
>
> Fixes: 156d0e290e969c ("powerpc/ebpf/jit: Implement JIT compiler for extended BPF")
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Acked-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Tested-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>

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
