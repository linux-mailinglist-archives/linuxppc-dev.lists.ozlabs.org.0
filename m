Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6873B9F12
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 12:26:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GGWTl668Sz309L
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 20:26:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MxM6F1mR;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MxM6F1mR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=MxM6F1mR; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=MxM6F1mR; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GGWTD4Z5Xz2yNm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jul 2021 20:26:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625221577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EM4rv+Os2BFUcNbdujbpAl42XdEpcURNArLBdyldSyk=;
 b=MxM6F1mRqZsHnllDbFUcTx+B+NE8XZ77vuwb6uwr46M2aQs99uRI0EDKMCc7mdtqoKkkgc
 gRU7/nsGHDIp0ZPSMDMNe8YPAiSpn0/rlbl+gFwZ3B+Oal/HcDA7ltGDlZ1EvDwYU99189
 yvGUPCF3nlJHa5wicEn5wHvbIQ+AdR8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625221577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EM4rv+Os2BFUcNbdujbpAl42XdEpcURNArLBdyldSyk=;
 b=MxM6F1mRqZsHnllDbFUcTx+B+NE8XZ77vuwb6uwr46M2aQs99uRI0EDKMCc7mdtqoKkkgc
 gRU7/nsGHDIp0ZPSMDMNe8YPAiSpn0/rlbl+gFwZ3B+Oal/HcDA7ltGDlZ1EvDwYU99189
 yvGUPCF3nlJHa5wicEn5wHvbIQ+AdR8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-WDSI-gibPNiflNmuitQEyA-1; Fri, 02 Jul 2021 06:26:16 -0400
X-MC-Unique: WDSI-gibPNiflNmuitQEyA-1
Received: by mail-ej1-f72.google.com with SMTP id
 ho42-20020a1709070eaab02904a77ea3380eso3378612ejc.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jul 2021 03:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EM4rv+Os2BFUcNbdujbpAl42XdEpcURNArLBdyldSyk=;
 b=UXfqNGUub6tITzpBRsXtldsS6qXF5RMKgaBV0G4E1uP/YVtHeZ6fJdka2ldUcLCNny
 vY5TRxcULVURj7CKosc5FPKSLIjzTTj3lZkK3bJO+yseqQifgZdvDZxNJXdwTJBEFmIf
 y9zBB/FJvPQiLdUr5hffjgKkGYfX+dYP0AA8IVr+iazQ7N8lpWF+uZMb44MBaOe+N0Xg
 GTYOHWRIqYg3rvpvPnvqi9bXz4KVG9GnEbFOZLpa4RSo6Tcy6TIWJHOEREzTvIItj27S
 zCT3ocYcCpRZGQ3kiaei1rMTV064+oE9G+Y4wCpd7hMSs4vJAHW0PtsdtQ6/x1XlLHsP
 5TDw==
X-Gm-Message-State: AOAM531e2fXDAgcaU6pR88qyx+6vDvn1hXgAqHgHxQRv2baJL1YTlXTv
 e8ZsHDK+tmhnKSk/8eUBR4n5gU11HmKKfvQSl9sIcd1fKmN2MtPnu2UFfTL562WPyD65ylhnxkx
 PuAkOi28eqf1RNBfoGHRURuuaVw==
X-Received: by 2002:a05:6402:31b3:: with SMTP id
 dj19mr1648291edb.24.1625221574989; 
 Fri, 02 Jul 2021 03:26:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzn8k1h6e/dZCweAEKoFXiejKrvCFYp7PHqlHpnkSx8je37PU0hXAgg8Sl+uceeRMdngxs2Gg==
X-Received: by 2002:a05:6402:31b3:: with SMTP id
 dj19mr1648281edb.24.1625221574866; 
 Fri, 02 Jul 2021 03:26:14 -0700 (PDT)
Received: from krava ([185.153.78.55])
 by smtp.gmail.com with ESMTPSA id g23sm1122002edp.74.2021.07.02.03.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:26:14 -0700 (PDT)
Date: Fri, 2 Jul 2021 12:26:11 +0200
From: Jiri Olsa <jolsa@redhat.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/bpf: Fix detecting BPF atomic instructions
Message-ID: <YN7pw2mAg35Yao6/@krava>
References: <cover.1625145429.git.naveen.n.rao@linux.vnet.ibm.com>
 <4117b430ffaa8cd7af042496f87fd7539e4f17fd.1625145429.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <4117b430ffaa8cd7af042496f87fd7539e4f17fd.1625145429.git.naveen.n.rao@linux.vnet.ibm.com>
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Brendan Jackman <jackmanb@google.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 01, 2021 at 08:38:58PM +0530, Naveen N. Rao wrote:
> Commit 91c960b0056672 ("bpf: Rename BPF_XADD and prepare to encode other
> atomics in .imm") converted BPF_XADD to BPF_ATOMIC and added a way to
> distinguish instructions based on the immediate field. Existing JIT
> implementations were updated to check for the immediate field and to
> reject programs utilizing anything more than BPF_ADD (such as BPF_FETCH)
> in the immediate field.
> 
> However, the check added to powerpc64 JIT did not look at the correct
> BPF instruction. Due to this, such programs would be accepted and
> incorrectly JIT'ed resulting in soft lockups, as seen with the atomic
> bounds test. Fix this by looking at the correct immediate value.
> 
> Fixes: 91c960b0056672 ("bpf: Rename BPF_XADD and prepare to encode other atomics in .imm")
> Reported-by: Jiri Olsa <jolsa@redhat.com>
> Tested-by: Jiri Olsa <jolsa@redhat.com>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
> Hi Jiri,
> FYI: I made a small change in this patch -- using 'imm' directly, rather 
> than insn[i].imm. I've still added your Tested-by since this shouldn't 
> impact the fix in any way.

yep, it works nicely

thanks
jirka

> 
> - Naveen
> 
> 
>  arch/powerpc/net/bpf_jit_comp64.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 5cad5b5a7e9774..de8595880feec6 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -667,7 +667,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>  		 * BPF_STX ATOMIC (atomic ops)
>  		 */
>  		case BPF_STX | BPF_ATOMIC | BPF_W:
> -			if (insn->imm != BPF_ADD) {
> +			if (imm != BPF_ADD) {
>  				pr_err_ratelimited(
>  					"eBPF filter atomic op code %02x (@%d) unsupported\n",
>  					code, i);
> @@ -689,7 +689,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
>  			PPC_BCC_SHORT(COND_NE, tmp_idx);
>  			break;
>  		case BPF_STX | BPF_ATOMIC | BPF_DW:
> -			if (insn->imm != BPF_ADD) {
> +			if (imm != BPF_ADD) {
>  				pr_err_ratelimited(
>  					"eBPF filter atomic op code %02x (@%d) unsupported\n",
>  					code, i);
> -- 
> 2.31.1
> 

