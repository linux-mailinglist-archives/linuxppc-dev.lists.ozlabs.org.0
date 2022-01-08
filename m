Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A41C488412
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jan 2022 15:45:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JWNDw19WNz3bZc
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jan 2022 01:45:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RvixiFES;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RvixiFES;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=RvixiFES; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=RvixiFES; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JWND94b7Vz2yZh
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jan 2022 01:45:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641653106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kIMiqV1yAZ33ux+d9eUm0sLEHRYTI8oFyptIaVpcFAs=;
 b=RvixiFESQJLIVrHJ1mmRrcxlQS+MJe3Ka0t5vawfD2L0/TOt9JdvhhkJQHGQsCKFEYglC4
 7FQm/Z3xMM99ZgcMU4ESTvJUMDVJkK1VjJgbV04TrkGefbXqr6ixG4KxVMACmYbKmRLx1S
 /7vp+mHfULxkhsZHaXpVx9RBrGcMY6M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641653106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kIMiqV1yAZ33ux+d9eUm0sLEHRYTI8oFyptIaVpcFAs=;
 b=RvixiFESQJLIVrHJ1mmRrcxlQS+MJe3Ka0t5vawfD2L0/TOt9JdvhhkJQHGQsCKFEYglC4
 7FQm/Z3xMM99ZgcMU4ESTvJUMDVJkK1VjJgbV04TrkGefbXqr6ixG4KxVMACmYbKmRLx1S
 /7vp+mHfULxkhsZHaXpVx9RBrGcMY6M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-kiAC412BPDCRor76Zx2wbQ-1; Sat, 08 Jan 2022 09:45:04 -0500
X-MC-Unique: kiAC412BPDCRor76Zx2wbQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 j18-20020a05600c1c1200b003335872db8dso1462446wms.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jan 2022 06:45:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kIMiqV1yAZ33ux+d9eUm0sLEHRYTI8oFyptIaVpcFAs=;
 b=7iuWofn4bXfEl8FaLsOIphm0WOQ+c8ZCoHs7NLGYwU4bTKJrC+TVbUjRobFpJUofvT
 Kcyk5VDB+dxw0uIhq4bxccvjySu3HWLjZ0kRLl4CUQ0H+XAZE4pJsubsgu7ZWRGbdPDR
 me9Or1P2fpFHgVVmDgVIq64xoKxRWPRK6Qu/6JOiK620d93Us03OSw565l0Xk8yGxPJh
 J7kcxVQBcA9gwbTT/2EXwmA49uikI9ta7XplWGuQgDfbPTu7Tcp7ot8rn8VFYnklRH8a
 8ITunAl2g9M2hX/W5Fl6dqqgdCnj17yajW+gtqvjfIIv+t3Kh1wKS2q5zY2XP+w8qk5O
 QLjQ==
X-Gm-Message-State: AOAM532lX/09E2xolq21nDGcxE4foWm3rnfnCGSeDSR6rScvCOXrRulq
 lFiO/mxeyUxGbSLeiRJRR/bAplQTr3tD+XvCSOjgC6fOg/26E9b8TTHdNmNGrSeb+MmEbsetQMp
 Ix6kDF7Kn8MFzHIn/RQ28nT5vjg==
X-Received: by 2002:adf:eb12:: with SMTP id s18mr27244234wrn.717.1641653103667; 
 Sat, 08 Jan 2022 06:45:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzqVdn2B+eHWvHfhUeSYTREvqIx8GQcMycr6Wfy0rrIRZGR8GA+GeMmRBxaNIkI/8Lk4HaPg==
X-Received: by 2002:adf:eb12:: with SMTP id s18mr27244221wrn.717.1641653103485; 
 Sat, 08 Jan 2022 06:45:03 -0800 (PST)
Received: from krava (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id az1sm1766758wrb.104.2022.01.08.06.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 06:45:03 -0800 (PST)
Date: Sat, 8 Jan 2022 15:45:01 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 03/13] powerpc/bpf: Update ldimm64 instructions during
 extra pass
Message-ID: <YdmjbccR1LOJjaEv@krava>
References: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
 <7cc162af77ba918eb3ecd26ec9e7824bc44b1fae.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <7cc162af77ba918eb3ecd26ec9e7824bc44b1fae.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jolsa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, ykaliuta@redhat.com,
 johan.almbladh@anyfinetworks.com, song@kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 06, 2022 at 05:15:07PM +0530, Naveen N. Rao wrote:
> These instructions are updated after the initial JIT, so redo codegen
> during the extra pass. Rename bpf_jit_fixup_subprog_calls() to clarify
> that this is more than just subprog calls.
> 
> Fixes: 69c087ba6225b5 ("bpf: Add bpf_for_each_map_elem() helper")
> Cc: stable@vger.kernel.org # v5.15
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

Tested-by: Jiri Olsa <jolsa@redhat.com>

thanks,
jirka

> ---
>  arch/powerpc/net/bpf_jit_comp.c   | 29 +++++++++++++++++++++++------
>  arch/powerpc/net/bpf_jit_comp32.c |  6 ++++++
>  arch/powerpc/net/bpf_jit_comp64.c |  7 ++++++-
>  3 files changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index d6ffdd0f2309d0..56dd1f4e3e4447 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -23,15 +23,15 @@ static void bpf_jit_fill_ill_insns(void *area, unsigned int size)
>  	memset32(area, BREAKPOINT_INSTRUCTION, size / 4);
>  }
>  
> -/* Fix the branch target addresses for subprog calls */
> -static int bpf_jit_fixup_subprog_calls(struct bpf_prog *fp, u32 *image,
> -				       struct codegen_context *ctx, u32 *addrs)
> +/* Fix updated addresses (for subprog calls, ldimm64, et al) during extra pass */
> +static int bpf_jit_fixup_addresses(struct bpf_prog *fp, u32 *image,
> +				   struct codegen_context *ctx, u32 *addrs)
>  {
>  	const struct bpf_insn *insn = fp->insnsi;
>  	bool func_addr_fixed;
>  	u64 func_addr;
>  	u32 tmp_idx;
> -	int i, ret;
> +	int i, j, ret;
>  
>  	for (i = 0; i < fp->len; i++) {
>  		/*
> @@ -66,6 +66,23 @@ static int bpf_jit_fixup_subprog_calls(struct bpf_prog *fp, u32 *image,
>  			 * of the JITed sequence remains unchanged.
>  			 */
>  			ctx->idx = tmp_idx;
> +		} else if (insn[i].code == (BPF_LD | BPF_IMM | BPF_DW)) {
> +			tmp_idx = ctx->idx;
> +			ctx->idx = addrs[i] / 4;
> +#ifdef CONFIG_PPC32
> +			PPC_LI32(ctx->b2p[insn[i].dst_reg] - 1, (u32)insn[i + 1].imm);
> +			PPC_LI32(ctx->b2p[insn[i].dst_reg], (u32)insn[i].imm);
> +			for (j = ctx->idx - addrs[i] / 4; j < 4; j++)
> +				EMIT(PPC_RAW_NOP());
> +#else
> +			func_addr = ((u64)(u32)insn[i].imm) | (((u64)(u32)insn[i + 1].imm) << 32);
> +			PPC_LI64(b2p[insn[i].dst_reg], func_addr);
> +			/* overwrite rest with nops */
> +			for (j = ctx->idx - addrs[i] / 4; j < 5; j++)
> +				EMIT(PPC_RAW_NOP());
> +#endif
> +			ctx->idx = tmp_idx;
> +			i++;
>  		}
>  	}
>  
> @@ -200,13 +217,13 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
>  		/*
>  		 * Do not touch the prologue and epilogue as they will remain
>  		 * unchanged. Only fix the branch target address for subprog
> -		 * calls in the body.
> +		 * calls in the body, and ldimm64 instructions.
>  		 *
>  		 * This does not change the offsets and lengths of the subprog
>  		 * call instruction sequences and hence, the size of the JITed
>  		 * image as well.
>  		 */
> -		bpf_jit_fixup_subprog_calls(fp, code_base, &cgctx, addrs);
> +		bpf_jit_fixup_addresses(fp, code_base, &cgctx, addrs);
>  
>  		/* There is no need to perform the usual passes. */
>  		goto skip_codegen_passes;
> diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
> index 997a47fa615b30..2258d3886d02ec 100644
> --- a/arch/powerpc/net/bpf_jit_comp32.c
> +++ b/arch/powerpc/net/bpf_jit_comp32.c
> @@ -293,6 +293,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>  		bool func_addr_fixed;
>  		u64 func_addr;
>  		u32 true_cond;
> +		u32 tmp_idx;
> +		int j;
>  
>  		/*
>  		 * addrs[] maps a BPF bytecode address into a real offset from
> @@ -908,8 +910,12 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>  		 * 16 byte instruction that uses two 'struct bpf_insn'
>  		 */
>  		case BPF_LD | BPF_IMM | BPF_DW: /* dst = (u64) imm */
> +			tmp_idx = ctx->idx;
>  			PPC_LI32(dst_reg_h, (u32)insn[i + 1].imm);
>  			PPC_LI32(dst_reg, (u32)insn[i].imm);
> +			/* padding to allow full 4 instructions for later patching */
> +			for (j = ctx->idx - tmp_idx; j < 4; j++)
> +				EMIT(PPC_RAW_NOP());
>  			/* Adjust for two bpf instructions */
>  			addrs[++i] = ctx->idx * 4;
>  			break;
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 472d4a551945dd..3d018ecc475b2b 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -319,6 +319,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>  		u64 imm64;
>  		u32 true_cond;
>  		u32 tmp_idx;
> +		int j;
>  
>  		/*
>  		 * addrs[] maps a BPF bytecode address into a real offset from
> @@ -848,9 +849,13 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>  		case BPF_LD | BPF_IMM | BPF_DW: /* dst = (u64) imm */
>  			imm64 = ((u64)(u32) insn[i].imm) |
>  				    (((u64)(u32) insn[i+1].imm) << 32);
> +			tmp_idx = ctx->idx;
> +			PPC_LI64(dst_reg, imm64);
> +			/* padding to allow full 5 instructions for later patching */
> +			for (j = ctx->idx - tmp_idx; j < 5; j++)
> +				EMIT(PPC_RAW_NOP());
>  			/* Adjust for two bpf instructions */
>  			addrs[++i] = ctx->idx * 4;
> -			PPC_LI64(dst_reg, imm64);
>  			break;
>  
>  		/*
> -- 
> 2.34.1
> 

