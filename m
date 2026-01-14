Return-Path: <linuxppc-dev+bounces-15731-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8A3D1ECC3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 13:35:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drlvg0CJsz2xMt;
	Wed, 14 Jan 2026 23:35:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768394142;
	cv=none; b=T75nWgcCJZjYJkiLkMqTo/dPKksTyLmfoOHpSBh1zov0p7Bn3LY+MHexKLTQtiSJhNisudH3uXEJOrcBL/y8lIhi5GXvNqHWGhmNMxFXeDvbyl8MhW4IrTyCXrP+eNQ7NsnnSSYeiqhPWv2+RwKc/9omBynqQHo+CDMsvarUn1mOVbWKvO0TZmhh2znfVP6E39S/zsHV8eXIyHYQWt8Ey892F4DzFnF3rk8vNPb2o8Wld9rmyUIBY6Epo2J5Ebwsu7dWcWoNvAYg5sFZedxyqUAS0E5FRB4s1wbPCG5UQ2rjKO4abHRjwiyU9rs6269EJU2r5BALFa7+lknoIaV1IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768394142; c=relaxed/relaxed;
	bh=5YK7xMj9gc1rRNXEgbQctVy9IYlkdKmdvtvtWkmz6xA=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=m4C1qBnCVuy5grYTT5my7eI9O0jqbT0EUgeo+7JN/D9Irorp6NiG3D8ZlQerRJqIUEuR9kxtslRrYfLXC7WXGEmUxp0kru+Xk+2A/eAj6vC2Xbx6LEg5T3jK4pIQguczXhB6QVcCeTdzDlvictZ/9z68LzmLkpT2vpWUI9seCb6U5f2KBidyQhQ3psp4MLaJzBSUMEg7AQBP0C2znEB7nZFniDN5Nj8HhSANO4jmVGKnWhjzqBF060XW8X8tp/krUnAgVLym2/QE4ZgmTC7OV1yUtoL4V8SSAyHpUqpzLupFcvUu4D6anio8hi3KJetG31dmYyPbC+YFAMAPL3T1gQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G/zoVWmd; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G/zoVWmd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drlvf0nrjz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 23:35:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5563341881;
	Wed, 14 Jan 2026 12:35:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C13E1C4CEF7;
	Wed, 14 Jan 2026 12:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768394140;
	bh=ev6Qij2PVomzOpcTr7azRUZ5e+KCI6UhuAdUkmLUPrc=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=G/zoVWmdhXzybUdcadiYCJpXQu4J3VXdcfvU837J9hK5D0iJPmrT3zqqQ6wb0i7/j
	 yzq9ITcA9CKpWNe5l/hJusxB5/KqJ9TlicSuwdrk0kMIf7B+sIVO9NJs1Y30FEFAnj
	 Z3w4oAmqc2HM5N98rk76kZUQ2ZcLZItSsBLwuArIMr3HlbaKjsjg8yeP2kXV41zYUl
	 dy1fpIPdSnvGXD+fF9qiY7Y3sK8mCqY3gSrq34uHkJoyu4ikVlyyn1gFuDQpzknAgl
	 Gb+vgUgflhJ41Igm2102XYyuzT0FnM7OK99wXylz936o2teDMyAF/FrdzYW7W/jZhF
	 D4qTB9Lk2Eiow==
Content-Type: multipart/mixed; boundary="===============7073946550903258648=="
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Message-Id: <96af90062adce57ef61ae1fd070a0e45ad2e0f9f5043603f5f671601b6f442a0@mail.kernel.org>
In-Reply-To: <20260114114450.30405-7-adubey@linux.ibm.com>
References: <20260114114450.30405-7-adubey@linux.ibm.com>
Subject: Re: [PATCH v2 6/6] powerpc64/bpf: Additional NVR handling for bpf_throw
From: bot+bpf-ci@kernel.org
To: adubey@linux.ibm.com,bpf@vger.kernel.org,linuxppc-dev@lists.ozlabs.org,linux-kselftest@vger.kernel.org,linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com,sachinpb@linux.ibm.com,venkat88@linux.ibm.com,andrii@kernel.org,eddyz87@gmail.com,mykolal@fb.com,ast@kernel.org,daniel@iogearbox.net,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,john.fastabend@gmail.com,kpsingh@kernel.org,sdf@fomichev.me,haoluo@google.com,jolsa@kernel.org,christophe.leroy@csgroup.eu,naveen@kernel.org,maddy@linux.ibm.com,mpe@ellerman.id.au,npiggin@gmail.com,memxor@gmail.com,iii@linux.ibm.com,shuah@kernel.org,adubey@linux.ibm.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Wed, 14 Jan 2026 12:35:39 +0000 (UTC)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--===============7073946550903258648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index a6083dd9786c..941e0818c9ec 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c

[ ... ]

> @@ -103,9 +119,12 @@ static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
>  *		[	  ...       	] 		|
>  * sp (r1) --->	[    stack pointer	] --------------
>  *		[    tail_call_info	] 8
> - *		[   nv gpr save area	] 6*8
> + *		[   nv gpr save area	] 6*8 + (12*8)
>  *		[    local_tmp_var	] 24
>  *		[   unused red zone	] 224
> + *
> + * Additional (12*8) in 'nv gpr save area' only in case of
> + * exception boundary.
>  */
>  static int bpf_jit_stack_local(struct codegen_context *ctx)
>  {
> @@ -114,7 +133,11 @@ static int bpf_jit_stack_local(struct codegen_context *ctx)
>  		return STACK_FRAME_MIN_SIZE + ctx->stack_size;

Does this need to account for BPF_PPC_EXC_STACK_SAVE when
exception_boundary or exception_cb is true?

In the else branch below, the exception case is handled, but the
bpf_has_stack_frame() case returns the same value regardless of
exception_boundary. However, bpf_jit_build_prologue() creates a larger
frame using BPF_PPC_EXC_STACKFRAME when exception_boundary is true.

This inconsistency appears to cause bpf_jit_stack_tailcallinfo_offset()
to return an incorrect offset when both bpf_has_stack_frame() returns
true AND exception_boundary is true. The offset would be off by 96 bytes
(BPF_PPC_EXC_STACK_SAVE).

For example, if a program uses bpf_throw (setting exception_boundary=true)
and also calls helper functions (setting SEEN_FUNC, making
bpf_has_stack_frame() return true), and uses tail calls, the tail call
handling in bpf_jit_emit_tail_call() would access the wrong stack location.

>  	} else {
>  		/* Stack layout 2 */
> -		return -(BPF_PPC_TAILCALL + BPF_PPC_STACK_SAVE + BPF_PPC_STACK_LOCALS);
> +		return -(BPF_PPC_TAILCALL
> +			+ BPF_PPC_STACK_SAVE
> +			+ (ctx->exception_boundary || ctx->exception_cb ?
> +							BPF_PPC_EXC_STACK_SAVE:0)
> +			+ BPF_PPC_STACK_LOCALS);
>  	}
>  }

[ ... ]

> @@ -189,7 +222,20 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
>  			EMIT(PPC_RAW_STD(_R0, _R1, PPC_LR_STKOFF));
>  		}
>
> -		EMIT(PPC_RAW_STDU(_R1, _R1, -(BPF_PPC_STACKFRAME + ctx->stack_size)));
> +		int stack_expand = ctx->exception_boundary || ctx->exception_cb ?
> +					BPF_PPC_EXC_STACKFRAME : BPF_PPC_STACKFRAME;
> +		EMIT(PPC_RAW_STDU(_R1, _R1, -(stack_expand + ctx->stack_size)));

The stack frame expansion here uses BPF_PPC_EXC_STACKFRAME for exception
cases, but bpf_jit_stack_local() in the bpf_has_stack_frame() branch does
not account for this larger frame size.

[ ... ]


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/20993216190

--===============7073946550903258648==--

