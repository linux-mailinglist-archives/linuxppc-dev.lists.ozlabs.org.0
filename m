Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E649C41F714
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 23:46:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLkFs5KxCz3bjR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Oct 2021 07:46:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aWXch4+W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aWXch4+W; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLkF94SFwz2yhd
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Oct 2021 07:45:49 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 542D661AED
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 21:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633124747;
 bh=7onSYh7Y9u7RoaI4r7A6UxmurYeD4ux7Bju/vMwWqQo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aWXch4+WH2rsez1pIPxDTx7JRTxauxqhGaslN86veLljBIKA5iepWFge7Q6Pwl5Qy
 J9Swo2VCKThVVmX2JyusEp62iXDos9gNAT4MgPQIXCxW4mTq/b0mht5vD+Y1QY5SFj
 xCv4zFfKBsYrSUzZ6DaAEO4yQUVbGQJSLLLBYm2xvXhlHB0TalZnS/YaviaS7jGYFm
 YSmGrWS2MtS3o1Oh/RT9+70FH10KzT/u9tJauMlYkKim7oBiCh184zWg6b3CnD08xc
 IgehowavAaOeOgw6DUT8YcXwwsQ2b0HQwOmLC3Mw5mXAHG+ldvLjq7NjkC28wjO4Vb
 00Y3+hLt1qKVg==
Received: by mail-lf1-f44.google.com with SMTP id i25so43738102lfg.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Oct 2021 14:45:47 -0700 (PDT)
X-Gm-Message-State: AOAM530iHM+A2FkizbwIk7+QcX4Tb41v2p2g4VEOglcLWe2Qo6nn6Y3t
 OghxWpEfLMWgeWXgi8X7WSlaeQwd5MHAogpmtGw=
X-Google-Smtp-Source: ABdhPJwZFLIlOFIkEXwhWuoTZbHnjxI5Gy5Y1K0G/oVx4QaBmANYIrC7kfQ4YFSHRG/aBoEPlbV7q8hCZ9yfTBqM7c8=
X-Received: by 2002:a05:6512:3048:: with SMTP id
 b8mr351617lfb.650.1633124745556; 
 Fri, 01 Oct 2021 14:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
 <d4a44c52712468b805cbf5c244b3c9ba0f802ab8.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <d4a44c52712468b805cbf5c244b3c9ba0f802ab8.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
From: Song Liu <song@kernel.org>
Date: Fri, 1 Oct 2021 14:45:34 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7PfZTR0x4hBwaXF9hZ=yCWj=NTnyBi7=oAXmVCy3mANA@mail.gmail.com>
Message-ID: <CAPhsuW7PfZTR0x4hBwaXF9hZ=yCWj=NTnyBi7=oAXmVCy3mANA@mail.gmail.com>
Subject: Re: [PATCH 2/9] powerpc/bpf: Validate branch ranges
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
> Add checks to ensure that we never emit branch instructions with
> truncated branch offsets.
>
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Acked-by: Song Liu <songliubraving@fb.com>

> ---
>  arch/powerpc/net/bpf_jit.h        | 26 ++++++++++++++++++++------
>  arch/powerpc/net/bpf_jit_comp.c   |  6 +++++-
>  arch/powerpc/net/bpf_jit_comp32.c |  8 ++++++--
>  arch/powerpc/net/bpf_jit_comp64.c |  8 ++++++--
>  4 files changed, 37 insertions(+), 11 deletions(-)
>
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index 935ea95b66359e..7e9b978b768ed9 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -24,16 +24,30 @@
>  #define EMIT(instr)            PLANT_INSTR(image, ctx->idx, instr)
>
>  /* Long jump; (unconditional 'branch') */
> -#define PPC_JMP(dest)          EMIT(PPC_INST_BRANCH |                        \
> -                                    (((dest) - (ctx->idx * 4)) & 0x03fffffc))
> +#define PPC_JMP(dest)                                                        \
> +       do {                                                                  \
> +               long offset = (long)(dest) - (ctx->idx * 4);                  \
> +               if (!is_offset_in_branch_range(offset)) {                     \
> +                       pr_err_ratelimited("Branch offset 0x%lx (@%u) out of range\n", offset, ctx->idx);                       \
> +                       return -ERANGE;                                       \
> +               }                                                             \
> +               EMIT(PPC_INST_BRANCH | (offset & 0x03fffffc));                \
> +       } while (0)
> +
>  /* blr; (unconditional 'branch' with link) to absolute address */
>  #define PPC_BL_ABS(dest)       EMIT(PPC_INST_BL |                            \
>                                      (((dest) - (unsigned long)(image + ctx->idx)) & 0x03fffffc))
>  /* "cond" here covers BO:BI fields. */
> -#define PPC_BCC_SHORT(cond, dest)      EMIT(PPC_INST_BRANCH_COND |           \
> -                                            (((cond) & 0x3ff) << 16) |       \
> -                                            (((dest) - (ctx->idx * 4)) &     \
> -                                             0xfffc))
> +#define PPC_BCC_SHORT(cond, dest)                                            \
> +       do {                                                                  \
> +               long offset = (long)(dest) - (ctx->idx * 4);                  \
> +               if (!is_offset_in_cond_branch_range(offset)) {                \
> +                       pr_err_ratelimited("Conditional branch offset 0x%lx (@%u) out of range\n", offset, ctx->idx);           \
> +                       return -ERANGE;                                       \
> +               }                                                             \
> +               EMIT(PPC_INST_BRANCH_COND | (((cond) & 0x3ff) << 16) | (offset & 0xfffc));                                      \
> +       } while (0)
> +
>  /* Sign-extended 32-bit immediate load */
>  #define PPC_LI32(d, i)         do {                                          \
>                 if ((int)(uintptr_t)(i) >= -32768 &&                          \
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index 53aefee3fe70be..fcbf7a917c566e 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -210,7 +210,11 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>                 /* Now build the prologue, body code & epilogue for real. */
>                 cgctx.idx = 0;
>                 bpf_jit_build_prologue(code_base, &cgctx);
> -               bpf_jit_build_body(fp, code_base, &cgctx, addrs, extra_pass);
> +               if (bpf_jit_build_body(fp, code_base, &cgctx, addrs, extra_pass)) {
> +                       bpf_jit_binary_free(bpf_hdr);
> +                       fp = org_fp;
> +                       goto out_addrs;
> +               }
>                 bpf_jit_build_epilogue(code_base, &cgctx);
>
>                 if (bpf_jit_enable > 1)
> diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
> index beb12cbc8c2994..a74d52204f8da2 100644
> --- a/arch/powerpc/net/bpf_jit_comp32.c
> +++ b/arch/powerpc/net/bpf_jit_comp32.c
> @@ -200,7 +200,7 @@ void bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 fun
>         }
>  }
>
> -static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
> +static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
>  {
>         /*
>          * By now, the eBPF program has already setup parameters in r3-r6
> @@ -261,7 +261,9 @@ static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32
>         bpf_jit_emit_common_epilogue(image, ctx);
>
>         EMIT(PPC_RAW_BCTR());
> +
>         /* out: */
> +       return 0;
>  }
>
>  /* Assemble the body code between the prologue & epilogue */
> @@ -1090,7 +1092,9 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>                  */
>                 case BPF_JMP | BPF_TAIL_CALL:
>                         ctx->seen |= SEEN_TAILCALL;
> -                       bpf_jit_emit_tail_call(image, ctx, addrs[i + 1]);
> +                       ret = bpf_jit_emit_tail_call(image, ctx, addrs[i + 1]);
> +                       if (ret < 0)
> +                               return ret;
>                         break;
>
>                 default:
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index b87a63dba9c8fb..f06c62089b1457 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -206,7 +206,7 @@ void bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 fun
>         EMIT(PPC_RAW_BCTRL());
>  }
>
> -static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
> +static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
>  {
>         /*
>          * By now, the eBPF program has already setup parameters in r3, r4 and r5
> @@ -267,7 +267,9 @@ static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32
>         bpf_jit_emit_common_epilogue(image, ctx);
>
>         EMIT(PPC_RAW_BCTR());
> +
>         /* out: */
> +       return 0;
>  }
>
>  /* Assemble the body code between the prologue & epilogue */
> @@ -993,7 +995,9 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>                  */
>                 case BPF_JMP | BPF_TAIL_CALL:
>                         ctx->seen |= SEEN_TAILCALL;
> -                       bpf_jit_emit_tail_call(image, ctx, addrs[i + 1]);
> +                       ret = bpf_jit_emit_tail_call(image, ctx, addrs[i + 1]);
> +                       if (ret < 0)
> +                               return ret;
>                         break;
>
>                 default:
> --
> 2.33.0
>
