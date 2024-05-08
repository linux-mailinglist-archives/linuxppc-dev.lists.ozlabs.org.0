Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA308BF56E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 07:06:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=afORrE3T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZ35V6glRz3cSn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 15:06:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=afORrE3T;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZ34l3TxFz30W9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 15:05:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1715144741;
	bh=qDxi+XXbzr8mIuwlB1aliy4UlEscitEJu0tfYntXSqk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=afORrE3T6fm9owzOay6Q4EjIov5tp69f4yV6zWLQdPsWDile3ZCCvtHhzO2PqLNhY
	 m+q7v/FoA8SLQDfn596Zo1eZM+hR6/YdWkcLKevLwwEApws3ePuCppayzHHPscXyJF
	 TvBQUdEABHJNrqArtC95+goi1c4tXk3VHRtSchfW2Fvwvkx7nbQaM69bjdX40GStHi
	 sswR2je3OJ6aclZFJUTBI6AB57hHjLBZkIb72MLcLpFHfZFymMKkfdhI1OB7cMBOgs
	 X2mfW+XeE/gaofip2NTMzaeOv5sbyT2gLUkqkWyl5VgYm4tFgR3AvFayfeeXD22ujL
	 DGyduQoKPLUuQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZ34h4KM9z4wc1;
	Wed,  8 May 2024 15:05:40 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Puranjay Mohan <puranjay@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf] powerpc/bpf: enforce full ordering for ATOMIC
 operations with BPF_FETCH
In-Reply-To: <20240507175439.119467-1-puranjay@kernel.org>
References: <20240507175439.119467-1-puranjay@kernel.org>
Date: Wed, 08 May 2024 15:05:40 +1000
Message-ID: <87o79gopuj.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: puranjay12@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Puranjay Mohan <puranjay@kernel.org> writes:
> The Linux Kernel Memory Model [1][2] requires RMW operations that have a
> return value to be fully ordered.
>
> BPF atomic operations with BPF_FETCH (including BPF_XCHG and
> BPF_CMPXCHG) return a value back so they need to be JITed to fully
> ordered operations. POWERPC currently emits relaxed operations for
> these.

Thanks for catching this.

> diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
> index 2f39c50ca729..b635e5344e8a 100644
> --- a/arch/powerpc/net/bpf_jit_comp32.c
> +++ b/arch/powerpc/net/bpf_jit_comp32.c
> @@ -853,6 +853,15 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
>  			/* Get offset into TMP_REG */
>  			EMIT(PPC_RAW_LI(tmp_reg, off));
>  			tmp_idx = ctx->idx * 4;
> +			/*
> +			 * Enforce full ordering for operations with BPF_FETCH by emitting a 'sync'
> +			 * before and after the operation.
> +			 *
> +			 * This is a requirement in the Linux Kernel Memory Model.
> +			 * See __cmpxchg_u64() in asm/cmpxchg.h as an example.
> +			 */
> +			if (imm & BPF_FETCH)
> +				EMIT(PPC_RAW_SYNC());
>  			/* load value from memory into r0 */
>  			EMIT(PPC_RAW_LWARX(_R0, tmp_reg, dst_reg, 0));
>  
> @@ -905,6 +914,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
>  
>  			/* For the BPF_FETCH variant, get old data into src_reg */
>  			if (imm & BPF_FETCH) {
> +				/* Emit 'sync' to enforce full ordering */
> +				EMIT(PPC_RAW_SYNC());
>  				EMIT(PPC_RAW_MR(ret_reg, ax_reg));
>  				if (!fp->aux->verifier_zext)
>  					EMIT(PPC_RAW_LI(ret_reg - 1, 0)); /* higher 32-bit */

On 32-bit there are non-SMP systems where those syncs will probably be expensive.

I think just adding an IS_ENABLED(CONFIG_SMP) around the syncs is
probably sufficient. Christophe?

cheers
