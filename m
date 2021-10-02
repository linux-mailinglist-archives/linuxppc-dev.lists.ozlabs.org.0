Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F7341FE5D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Oct 2021 00:11:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HMLmW1twkz3c8l
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Oct 2021 09:11:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=anyfinetworks-com.20210112.gappssmtp.com header.i=@anyfinetworks-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=V3bWB07A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=anyfinetworks.com (client-ip=2607:f8b0:4864:20::b36;
 helo=mail-yb1-xb36.google.com; envelope-from=johan.almbladh@anyfinetworks.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anyfinetworks-com.20210112.gappssmtp.com
 header.i=@anyfinetworks-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=V3bWB07A; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HMDZN3jxLz2xs3
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Oct 2021 04:32:28 +1100 (AEDT)
Received: by mail-yb1-xb36.google.com with SMTP id i84so27617067ybc.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Oct 2021 10:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anyfinetworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2bIo+Z31tKOkBmfnn7cvdjeHAfTdWfBVWcIMP85tzvg=;
 b=V3bWB07ABnhkitFxsYNZQU4eJNreIxdUgjdOGipVEOI/nIcAl1XIVkVh/4nSOCvxVr
 asCeMEEO2Nf4ya4KB2MS2/8aPr38L363l4xFS3lf+sjlpLvslfOAD1wTTJmWtnMYjssV
 atHYWLU4mArwlvhRkErrqwqVZwlWWLR5BNdJOfLQdQ+AlZcP2UBJB9L+zpOi2l8zNnG3
 3m426q2W7NCmXURDKyncLyPUQuLVS3dleK0nmNJUUk4rQIijnXKqedbdKaFNUVHWVkUH
 17b2kjsm+FipT+EgTE3bKDhNF4k+HBeNYHk9M4h96NkGOGLMujUyBpg+MP4s2PN5tKC/
 0j0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2bIo+Z31tKOkBmfnn7cvdjeHAfTdWfBVWcIMP85tzvg=;
 b=o63cmcDW0WNlZUjPbCobJdC/S0wR7SES7CWyYGE/jz+hmX/FIx4CXho79310P2hQmq
 jKqNLK9cPceQBk0ITNnLXaGNuxGtOjceN0yDaJ/CUWRMVaEB6DfMZGOGJPbYEeug2I4A
 9TEYUa0XJbulzzPpm45KGkb7rf/c35xNQh3WsjtixH8MeecBT3wE6qc8mqVmY2+HXuE9
 NDCSP7NUJBvz9RaamiUFmitfkFX9A0RDlHGrXO27K7wvUd68GQaTgfLPFFdZNpUetRsy
 lgA4Bp4RCyxTiswedAwFQ52MmLfv0/wVLLtUTEVbayZyCa3OGx7AZ4SwgyZBQv1o5K/A
 C+BA==
X-Gm-Message-State: AOAM532nAon0SHK/TEKi6LAZnw4pdv7yQEUD8NmrxZm8lJprRZKsmTYE
 r7GHV4UG7eYD1bkAfbbg7C2XTRBYmEUHedGTxUSO1Q==
X-Google-Smtp-Source: ABdhPJyvKkigKVy5xObNbnk1snkLLKuZpqpwxg7x0f76Ch3RPmL/TFOqMuYdizYBBub/O3Gg4gTg2os3BHl2IHtYP6Q=
X-Received: by 2002:a25:b904:: with SMTP id x4mr4565548ybj.48.1633195946435;
 Sat, 02 Oct 2021 10:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
 <8cb6a1725cf3c38ca90ed7f195f78a5b5a83bb25.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <8cb6a1725cf3c38ca90ed7f195f78a5b5a83bb25.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Sat, 2 Oct 2021 19:32:15 +0200
Message-ID: <CAM1=_QTaf0fhK4js=2=dZ2MXh6zHoUDzwn3Y-mXY5Fxo=rygpA@mail.gmail.com>
Subject: Re: [PATCH 5/9] powerpc/bpf: Fix BPF_MOD when imm == 1
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
> Only ignore the operation if dividing by 1.
>
> Fixes: 156d0e290e969c ("powerpc/ebpf/jit: Implement JIT compiler for extended BPF")
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Acked-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Tested-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>

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
