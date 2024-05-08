Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 595588BFC4B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 13:39:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f1i3rHWG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZCqV6l1nz3cB7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 21:39:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f1i3rHWG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=puranjay@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZCpp4RdTz2xPd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 21:39:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AD2D1CE185D;
	Wed,  8 May 2024 11:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34D6C113CC;
	Wed,  8 May 2024 11:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715168349;
	bh=W261NQPf1ONiv0m5gYuul40Ggl5L4ivB5hD1JASB2SM=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=f1i3rHWGTaEoRBWU7oBgZREic7p5tsHQQtj6bLj2d+gR9LYnCP6YuhepkcHaQEYhc
	 CPMvoGd9qp/qjcQzIUCMpDqnTUAsxCo8wVAmrEaqMa7O3PVd7aj9hi8OAuFNVLz0rp
	 ttWWmiq4NGGM5XI9kDl9ycdi0S6EBt/dEScqUQPwWD5TILDivv0YCOzxYcxUzP8CTE
	 3BTL4sERXx4wljJjt9LZGP4FMdaPQyoQpmzLKTXbBG9BuuVvMvq7SL80kUhjJ1Txgx
	 zk0gnAkHnBzuFt0l0SY1xeCR+e57LYiEJAHMUxR/9jvgXuaOJ6o1BBy34fFhHPVHM7
	 2GntC4DWm+GdA==
From: Puranjay Mohan <puranjay@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, "KP
 Singh" <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf] powerpc/bpf: enforce full ordering for ATOMIC
 operations with BPF_FETCH
In-Reply-To: <87o79gopuj.fsf@mail.lhotse>
References: <20240507175439.119467-1-puranjay@kernel.org>
 <87o79gopuj.fsf@mail.lhotse>
Date: Wed, 08 May 2024 11:39:05 +0000
Message-ID: <mb61pwmo4zg6e.fsf@kernel.org>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> Puranjay Mohan <puranjay@kernel.org> writes:
>> The Linux Kernel Memory Model [1][2] requires RMW operations that have a
>> return value to be fully ordered.
>>
>> BPF atomic operations with BPF_FETCH (including BPF_XCHG and
>> BPF_CMPXCHG) return a value back so they need to be JITed to fully
>> ordered operations. POWERPC currently emits relaxed operations for
>> these.
>
> Thanks for catching this.
>
>> diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
>> index 2f39c50ca729..b635e5344e8a 100644
>> --- a/arch/powerpc/net/bpf_jit_comp32.c
>> +++ b/arch/powerpc/net/bpf_jit_comp32.c
>> @@ -853,6 +853,15 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
>>  			/* Get offset into TMP_REG */
>>  			EMIT(PPC_RAW_LI(tmp_reg, off));
>>  			tmp_idx = ctx->idx * 4;
>> +			/*
>> +			 * Enforce full ordering for operations with BPF_FETCH by emitting a 'sync'
>> +			 * before and after the operation.
>> +			 *
>> +			 * This is a requirement in the Linux Kernel Memory Model.
>> +			 * See __cmpxchg_u64() in asm/cmpxchg.h as an example.
>> +			 */
>> +			if (imm & BPF_FETCH)
>> +				EMIT(PPC_RAW_SYNC());
>>  			/* load value from memory into r0 */
>>  			EMIT(PPC_RAW_LWARX(_R0, tmp_reg, dst_reg, 0));
>>  
>> @@ -905,6 +914,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
>>  
>>  			/* For the BPF_FETCH variant, get old data into src_reg */
>>  			if (imm & BPF_FETCH) {
>> +				/* Emit 'sync' to enforce full ordering */
>> +				EMIT(PPC_RAW_SYNC());
>>  				EMIT(PPC_RAW_MR(ret_reg, ax_reg));
>>  				if (!fp->aux->verifier_zext)
>>  					EMIT(PPC_RAW_LI(ret_reg - 1, 0)); /* higher 32-bit */
>
> On 32-bit there are non-SMP systems where those syncs will probably be expensive.
>
> I think just adding an IS_ENABLED(CONFIG_SMP) around the syncs is
> probably sufficient. Christophe?

Yes, I should do it for both 32-bit and 64-bit because the kernel does
that as well:

In POWERPC __atomic_pre/post_full_fence resolves to 'sync' in case of
CONFIG_SMP and barrier() in case of !CONFIG_SMP.

barrier() is not relevant for JITs as it is used at compile time.

So, I will use

if (IS_ENABLED(CONFIG_SMP))
        EMIT(PPC_RAW_SYNC());

in the next version.


Thanks,
Puranjay
