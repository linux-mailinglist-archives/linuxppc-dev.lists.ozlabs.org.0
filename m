Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACA541F725
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 23:54:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLkRb08Vfz3bmr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Oct 2021 07:54:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rsu0KM93;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Rsu0KM93; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLkQs4cFjz2ywD
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Oct 2021 07:54:13 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E78F619F7
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 21:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633125251;
 bh=0cgV+bBUB1D1h7/glXo2UCToS4npGsoVZly7fP015AI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Rsu0KM93+nYq1JSYI00dcjtRrhbdPVCArIF5I7F117bbDO4t932lu7AHOdV2gSj51
 37QuxH9T81ILvzuNcphvppYenYpZV8wNKGI/kLsqlf4crqXac31U5tfDFjMZ0Zy8ra
 fMkH4xDeJPJLjaVtQmOQkF2O/ck/hcM93FycsngksdHploZSSfqUevcu8vz6hW06oS
 3AcZpA1dPx/9ieiK1ZVpmpCANFFnJcugsjsod6ZfBxrX1e7QlZtI2AgI9WYdO/29yz
 EcbjvXkzvVjG4tCzZXOkX1UTcrHYDWpLAUbKVsoqdLjUUuIsW2voxWWcAcIRCECFbF
 qdsf1693oddtg==
Received: by mail-lf1-f49.google.com with SMTP id i4so44323569lfv.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Oct 2021 14:54:11 -0700 (PDT)
X-Gm-Message-State: AOAM5316mTfvvQz75f6UD8ka5Wg6FkPiBbhAb3FSYyOMqyauWmr94TYu
 27yWXICp6Ut5kOo5rmCRIFswogdNAY0EbdegVQk=
X-Google-Smtp-Source: ABdhPJzud8lxYLqZitAUpvzFYiYz2OtpqTQYhxcmHpu1NfyIHLeO5Nlr3hR2sNQKR82Lb43OMQW2L9hSsXR+fhhs2aE=
X-Received: by 2002:a05:6512:39c4:: with SMTP id
 k4mr431859lfu.14.1633125249648; 
 Fri, 01 Oct 2021 14:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
 <ebc0317ce465cb4f8d6fe485ab468ac5bda7c48f.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <ebc0317ce465cb4f8d6fe485ab468ac5bda7c48f.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
From: Song Liu <song@kernel.org>
Date: Fri, 1 Oct 2021 14:53:58 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5LFNExttL196qa9w0fZVhbj5yZjcRhosE-+gt9hxLbzg@mail.gmail.com>
Message-ID: <CAPhsuW5LFNExttL196qa9w0fZVhbj5yZjcRhosE-+gt9hxLbzg@mail.gmail.com>
Subject: Re: [PATCH 4/9] powerpc/bpf: Handle large branch ranges with BPF_EXIT
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
> In some scenarios, it is possible that the program epilogue is outside
> the branch range for a BPF_EXIT instruction. Instead of rejecting such
> programs, emit an indirect branch. We track the size of the bpf program
> emitted after the initial run and do a second pass since BPF_EXIT can
> end up emitting different number of instructions depending on the
> program size.
>
> Suggested-by: Jordan Niethe <jniethe5@gmail.com>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Acked-by: Song Liu <songliubraving@fb.com>

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
