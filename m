Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6911841FE5C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Oct 2021 00:11:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HMLln2CC9z3blb
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Oct 2021 09:11:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=anyfinetworks-com.20210112.gappssmtp.com header.i=@anyfinetworks-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Ucih5GCC;
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
 header.s=20210112 header.b=Ucih5GCC; dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HMDYc5q45z2xfJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Oct 2021 04:31:48 +1100 (AEDT)
Received: by mail-yb1-xb36.google.com with SMTP id s4so11296550ybs.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Oct 2021 10:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anyfinetworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BtNb15EBSm5GLCHJbLEIbXiYxWw7c7a4Lz2HIYHR7bk=;
 b=Ucih5GCCGNT4KyrokC2WqwwQi7TehV7TpgQQpP6maygayIaBdpsvhEAXexiKtJbKag
 eW3UrIijWeJTgd1ZfVT1rfI7jEsgN76Ubt2DxvROw2Xu/clLNDcoDHBkxEhWiAb8O0Ba
 wt/IszAeqI5fyDeVBn/7bSRVvnlyU/Zwh7CfjuTEhW+wfKioYiPpyQmFWKsmLksnOzQ2
 yLuFO2BR+qLFd1Lxm8rOZVzi/TPbsS49GHK2kPUDYeKm7ZCdsnlQiXhvY9EziWZcKbbC
 /sorj1kvlSYj5v+ufX55hXD7epaJaTPdqXwuaTNiHHM/gNS5BkEmwAeIrKWf8ZWJcBnh
 frZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BtNb15EBSm5GLCHJbLEIbXiYxWw7c7a4Lz2HIYHR7bk=;
 b=UANmPARTXw/LA3sb+W2GvH9fXQli79/iuL9T78iZkRuQAQxi4gZvJZdKAADGxA4zRb
 cP5b4IZvfAubz7gN+IfRfH45weGtByDeHcnkSKMruTaAINAB4RvubDokhA/6f6OsK5ed
 zHh/FoNhGRGJr+zQnRUtOSRSbmklJZq/7BONEKi+pIoeUsO6uEE4auLhPYtUhfXlLWSm
 GrPn2hlrtixLt0NAkw6cVLQ4zyN2ZlmrM4/+79wfle4wgwagR1AvNogb1sblZJLv3hle
 /wJk/0mbjLcaMN2z9CY1RdK5mtPziXd1TlJosXjJHOsTfSGTQwuW63aMqvSWuTTq8c/u
 zhow==
X-Gm-Message-State: AOAM530tID71Zda5FPf7XntHfpBuGJIBgDTQdEyEF2MuvfrIlOGFo4/z
 c20uE4jrJRcv4nSGZ/Tl+L60y/JYz8qZnTgsq6Wy5Q==
X-Google-Smtp-Source: ABdhPJyw15NCSRpzMaubFrNh86498c6Q3ymUZIfDCRDS3BBgqbBV6w5W3VubibTRl/5ggiVRfJLfjbUBle+OI3v0wlw=
X-Received: by 2002:a25:bb08:: with SMTP id z8mr5073646ybg.306.1633195905423; 
 Sat, 02 Oct 2021 10:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
 <ebc0317ce465cb4f8d6fe485ab468ac5bda7c48f.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <ebc0317ce465cb4f8d6fe485ab468ac5bda7c48f.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Date: Sat, 2 Oct 2021 19:31:34 +0200
Message-ID: <CAM1=_QT60DW=aWbSZr_-et5zn4L39kwd8HsRM4C3C3wXNVnAfA@mail.gmail.com>
Subject: Re: [PATCH 4/9] powerpc/bpf: Handle large branch ranges with BPF_EXIT
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
> In some scenarios, it is possible that the program epilogue is outside
> the branch range for a BPF_EXIT instruction. Instead of rejecting such
> programs, emit an indirect branch. We track the size of the bpf program
> emitted after the initial run and do a second pass since BPF_EXIT can
> end up emitting different number of instructions depending on the
> program size.
>
> Suggested-by: Jordan Niethe <jniethe5@gmail.com>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Acked-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
Tested-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>

> ---
>  arch/powerpc/net/bpf_jit.h        |  3 +++
>  arch/powerpc/net/bpf_jit_comp.c   | 22 +++++++++++++++++++++-
>  arch/powerpc/net/bpf_jit_comp32.c |  2 +-
>  arch/powerpc/net/bpf_jit_comp64.c |  2 +-
>  4 files changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index 89bd744c2bffd4..4023de1698b9f5 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -126,6 +126,7 @@
>
>  #define SEEN_FUNC      0x20000000 /* might call external helpers */
>  #define SEEN_TAILCALL  0x40000000 /* uses tail calls */
> +#define SEEN_BIG_PROG  0x80000000 /* large prog, >32MB */
>
>  #define SEEN_VREG_MASK 0x1ff80000 /* Volatile registers r3-r12 */
>  #define SEEN_NVREG_MASK        0x0003ffff /* Non volatile registers r14-r31 */
> @@ -179,6 +180,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>  void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx);
>  void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx);
>  void bpf_jit_realloc_regs(struct codegen_context *ctx);
> +int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx,
> +                                       int tmp_reg, unsigned long exit_addr);
>
>  #endif
>
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index fcbf7a917c566e..3204872fbf2738 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -72,6 +72,21 @@ static int bpf_jit_fixup_subprog_calls(struct bpf_prog *fp, u32 *image,
>         return 0;
>  }
>
> +int bpf_jit_emit_exit_insn(u32 *image, struct codegen_context *ctx,
> +                                       int tmp_reg, unsigned long exit_addr)
> +{
> +       if (!(ctx->seen & SEEN_BIG_PROG) && is_offset_in_branch_range(exit_addr)) {
> +               PPC_JMP(exit_addr);
> +       } else {
> +               ctx->seen |= SEEN_BIG_PROG;
> +               PPC_FUNC_ADDR(tmp_reg, (unsigned long)image + exit_addr);
> +               EMIT(PPC_RAW_MTCTR(tmp_reg));
> +               EMIT(PPC_RAW_BCTR());
> +       }
> +
> +       return 0;
> +}
> +
>  struct powerpc64_jit_data {
>         struct bpf_binary_header *header;
>         u32 *addrs;
> @@ -155,12 +170,17 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>                 goto out_addrs;
>         }
>
> +       if (!is_offset_in_branch_range((long)cgctx.idx * 4))
> +               cgctx.seen |= SEEN_BIG_PROG;
> +
>         /*
>          * If we have seen a tail call, we need a second pass.
>          * This is because bpf_jit_emit_common_epilogue() is called
>          * from bpf_jit_emit_tail_call() with a not yet stable ctx->seen.
> +        * We also need a second pass if we ended up with too large
> +        * a program so as to fix branches.
>          */
> -       if (cgctx.seen & SEEN_TAILCALL) {
> +       if (cgctx.seen & (SEEN_TAILCALL | SEEN_BIG_PROG)) {
>                 cgctx.idx = 0;
>                 if (bpf_jit_build_body(fp, 0, &cgctx, addrs, false)) {
>                         fp = org_fp;
> diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
> index a74d52204f8da2..d2a67574a23066 100644
> --- a/arch/powerpc/net/bpf_jit_comp32.c
> +++ b/arch/powerpc/net/bpf_jit_comp32.c
> @@ -852,7 +852,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>                          * we'll just fall through to the epilogue.
>                          */
>                         if (i != flen - 1)
> -                               PPC_JMP(exit_addr);
> +                               bpf_jit_emit_exit_insn(image, ctx, tmp_reg, exit_addr);
>                         /* else fall through to the epilogue */
>                         break;
>
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index f06c62089b1457..3351a866ef6207 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -761,7 +761,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>                          * we'll just fall through to the epilogue.
>                          */
>                         if (i != flen - 1)
> -                               PPC_JMP(exit_addr);
> +                               bpf_jit_emit_exit_insn(image, ctx, b2p[TMP_REG_1], exit_addr);
>                         /* else fall through to the epilogue */
>                         break;
>
> --
> 2.33.0
>
