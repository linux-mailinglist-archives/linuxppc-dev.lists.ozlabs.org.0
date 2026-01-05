Return-Path: <linuxppc-dev+bounces-15262-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E48CF32E2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 12:15:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlBYc2xsVz2yFW;
	Mon, 05 Jan 2026 22:15:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767611748;
	cv=none; b=PHnOFqaDbtZBH2oIVoOOVTIiUMruVUYUzwaeC7IPliQbTW5vir1HgMV9b4h74BAzbE2LXoY62lkOnrlA9A4CnZClVJsGjXqw0Wt0w7TQfnwvV+Q4Vc736jStJ6vlonMypyVLHurZ15D0krjZA1QUc6uZP3oWIvTV7qCIwmYz9zdZ/QOKrSvs37Ka9L3jyhMqxYz69FTbChHNvL8DElUYiVsVlDvqAMRQ4CdMdS9pLSwYTizDWos3Db93kNhVhCFeZtgu/WfFEKuQGZ4zc6km0bBhlpOwKoy3GDEJpj9lPke5EIUjS9ejtycgkSNBdmFKDG7bpzpB7OQv/1d2ZBy0rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767611748; c=relaxed/relaxed;
	bh=InMg9PgYthb0nWfCwpg2WM2wHZYJLMPlkUc4J7jMTXQ=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=iFvNxZbu6Gp+j3ymRptILLfQsmDNfyCEHrMyVRFMqRtdx3Lgi2U/A2CkEcJBn9k5upCXct0MfbGw+ezuu9lmjVI+6iRaz3kPcXxFcUB2nRb2Aqne8DQBjzaQlyI+QB5t8INNRMmUXn/IAsNrFAMvpDzRTFKR8mimEvb3fB5k1fx9uS8Dvkx7Uw5DqxNKpCSVGYxlOygZ8cvhp4yz9anbTeNOd++gFBYMzjW9mhCuK73ccr4wMw/qWyidbXfqhJAB2z9fv2uFTpb63Z7y+ZRZKLsg8mxTdnb92IjyUgg3L9wdZfiaas7gWTBMq7EPUuz6ajz5HrCfNuBY18mb9A3snw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IN3mASKs; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IN3mASKs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlBYb3Whwz2yCL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 22:15:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0681D43DD7;
	Mon,  5 Jan 2026 11:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40353C116D0;
	Mon,  5 Jan 2026 11:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767611714;
	bh=gOPFCv6XsvdNRFL2RgDvRLwWfshb/oHcO2mTVP7fwUc=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=IN3mASKs9ZOdY3UWX865ZG6aB6zxt/yT04bcUJ7cuxkRQCHiOoJYOHXltLVYGrWnX
	 sLyyjN/mVfbdelfPtvuCgsuYc3e3xIs8WYSVdBfKfSdGRr7XCEYeoUVwx63W2eeyR1
	 YsnFKsk5+hPaqSv1yzLkJ4S4OTgLG6rS3lu4D8KK2SlOY/0lKgXSRV11vvvL2rVqWI
	 XcY69MIXG2csR5WWdunoLtYAYD6tqtRCAdOsZtO1xZXB2dLHSsAi9C2yiYDvkyXOqc
	 f7mR+nylEUhtKx6jI6FOEwEfDTmGJ57eATPOxskUiFgXDTbQrewzUkLONqDGvjlsYT
	 x269dn3xwSWxg==
Content-Type: multipart/mixed; boundary="===============0721075218538269164=="
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
Message-Id: <655a960bb1b98cf56777481bd84ce53c2a17e527a8230edf9ad7523e98cce565@mail.kernel.org>
In-Reply-To: <20260105105212.136645-3-adubey@linux.ibm.com>
References: <20260105105212.136645-3-adubey@linux.ibm.com>
Subject: Re: [PATCH 2/6] powerpc64/bpf: Tailcall handling with trampolines
From: bot+bpf-ci@kernel.org
To: adubey@linux.ibm.com,bpf@vger.kernel.org,linuxppc-dev@lists.ozlabs.org,linux-kselftest@vger.kernel.org,linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com,sachinpb@linux.ibm.com,venkat88@linux.ibm.com,andrii@kernel.org,eddyz87@gmail.com,mykolal@fb.com,ast@kernel.org,daniel@iogearbox.net,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,john.fastabend@gmail.com,kpsingh@kernel.org,sdf@fomichev.me,haoluo@google.com,jolsa@kernel.org,christophe.leroy@csgroup.eu,naveen@kernel.org,maddy@linux.ibm.com,mpe@ellerman.id.au,npiggin@gmail.com,memxor@gmail.com,iii@linux.ibm.com,shuah@kernel.org,adubey@linux.ibm.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Mon,  5 Jan 2026 11:15:14 +0000 (UTC)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--===============0721075218538269164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index 069a8822c30d..4aaa0a287a45 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c

[ ... ]

> -static void bpf_trampoline_setup_tail_call_cnt(u32 *image, struct codegen_context *ctx,
> -					       int func_frame_offset, int r4_off)
> +static void bpf_trampoline_setup_tail_call_info(u32 *image, struct codegen_context *ctx,
> +					       int func_frame_offset,
> +					       int bpf_dummy_frame_size, int r4_off)
>  {
>  	if (IS_ENABLED(CONFIG_PPC64)) {
>  		/* See bpf_jit_stack_tailcallinfo_offset() */
> -		int tailcallcnt_offset = 7 * 8;
> +		int tailcallinfo_offset = BPF_PPC_STACK_SAVE + SZL;

[ ... ]

> +		EMIT(PPC_RAW_STL(_R3, _R1, func_frame_offset
> +				- bpf_dummy_frame_size - tailcallinfo_offset));
                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The new setup function stores tail_call_info at offset
(func_frame_offset - bpf_dummy_frame_size - tailcallinfo_offset) from R1.
Since func_frame_offset = bpf_dummy_frame_size + bpf_frame_size, this
resolves to (bpf_frame_size - 56), which is a positive offset from R1.

However, the corresponding bpf_trampoline_restore_tail_call_cnt() function
was not updated. It still reads from (R1 - 56):

    static void bpf_trampoline_restore_tail_call_cnt(...)
    {
        if (IS_ENABLED(CONFIG_PPC64)) {
            int tailcallcnt_offset = 7 * 8;
            EMIT(PPC_RAW_LL(_R3, _R1, -tailcallcnt_offset));
                                      ^^^^^^^^^^^^^^^^^^
            ...
        }
    }

Is there an offset mismatch here? The setup function stores at
R1 + (bpf_frame_size - 56) while restore reads from R1 - 56. These point
to different memory locations since bpf_frame_size is a positive value
(at minimum ~200 bytes given the frame contents).

When BPF_TRAMP_F_TAIL_CALL_CTX is set, the restore function would read
incorrect data after the traced function returns, potentially causing
wrong tail call context to be propagated.

> @@ -801,6 +830,12 @@ static int __arch_prepare_bpf_trampoline(...)
>  		}
>  	}
>
> +	/* Room for 64-bit tail_call_cnt */
> +	bpf_frame_size += SZL;
> +
> +	/* Room for nvr save area */
> +	bpf_frame_size += BPF_PPC_STACK_SAVE;
> +
>  	/* Padding to align stack frame, if any */
>  	bpf_frame_size = round_up(bpf_frame_size, SZL * 2);

The frame size is increased by 56 bytes (SZL + BPF_PPC_STACK_SAVE = 8 + 48)
for the tail_call_info and nvr save area. This affects all calculations
using bpf_frame_size, including the store offset in the setup function,
but the restore function continues to use a hardcoded negative offset.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/20713322833

--===============0721075218538269164==--

