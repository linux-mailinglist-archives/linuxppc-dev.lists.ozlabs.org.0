Return-Path: <linuxppc-dev+bounces-16162-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPmJLWxccml7jAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16162-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 18:20:44 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E34B6B1AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 18:20:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxnrh3dq3z30hP;
	Fri, 23 Jan 2026 04:20:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769102436;
	cv=none; b=IXyaX3EDdRx44p2UlI2PJla3QqclTWXn/3c7dkvT5VmQzmgpbCqURyJglxX1q508ZcB+QVlKvDsvIHH48tZhGwhVSAgvaTVC9pXqYkWqu30Ol5byaDPT/wr4sA0zqjGTiCJUCLe82BGmfPeXKkpL1emn5oKcqfJRO756ngJsI+VoPQ7RxbqRpdf6iPa2ABqxysiOnVCytQM8J9qX/lV4j5vHi64jak+pVfjoTCK6L4cf7hbikjeqN/QVNA/Pun8QasdUxbnTK8ZX1z6E4OMaMWaAIAt/NTn4kJ5MHPp2UTjDHhr3zRYPN+RYGB/VpKd0Ny5urqxsCGBo+PeH69E9WA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769102436; c=relaxed/relaxed;
	bh=22rM4lod+40m2QLGVZvQP4+onPZNJW345iRvwzsN3Mk=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=napdzqcMklfI40RD2bks83ljuK/q0BkQHVNoedlH0boBAUO7FoNWpIrbLzh1nozD+6EzzHd7s7cnC29eIDHkxoXI+vEXgE7sgK9YIImq7XnVxUj2a4jZ782sHw8nXrekkEC7tHL/wYpTzMSCpJUiJ6qpxDI4Yd6WG4pOLvVFyen9LOBnnEhpRT/+ItloQmrR6AHFFYv0NTVZZgbUKHaGZ/GYXYS6aeISI540KwJdE5PKVDHY6lqD3Fe+MXmSxlIw3RG5EH45/AAopZ72nZ3hV8/SI/A9h7bmDURXoyqtzol8wUP61dbJtyDz55NG6ETcVTp34upoYbSYep3IAs7vOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=clqTqZOy; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=clqTqZOy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxnrg3d65z309S
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 04:20:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1619F600CB;
	Thu, 22 Jan 2026 17:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A966C116D0;
	Thu, 22 Jan 2026 17:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769102432;
	bh=3c9sDkew6GCT5xUI6wSas5sFIuGc+u8uHeh8LoCRej4=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=clqTqZOyXuVxdn6h4Qmi80y2KviZ4uf4g0CGe7zQx+QUpyzazlFuY6Gw794EqaJEY
	 Ho+C0Lufvbg7UTLdbHvQ3GTzcDM/0Lq2a5K8xVKWZ7HMUQ3bvGYBZhLw8mm83PK+bC
	 x5Y36rWfC3N3uhJvMkBFA0EjeJ/fH5uS5uahshTEpvU3lWdKCgsLXB4lvreGT0pj+B
	 TmLw/MrCB7M9beg6kUBbKF+4t9vZDg0TdlYQiUMFa9JyyKYWNonJtczQfxWjqnVKCs
	 jVwkNzZHzL9hsGEW+aPT0qn95hkEAy+ltM0YASMWOZDBSOFQn62MnV0sh9KfP7nBtw
	 s2zXAPDHqIKMg==
Content-Type: multipart/mixed; boundary="===============8053750252812221712=="
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
Message-Id: <22e06dcc5ec469f864880ccacfa910635460878396907005ba9f80f40d01779e@mail.kernel.org>
In-Reply-To: <20260122165716.10508-4-adubey@linux.ibm.com>
References: <20260122165716.10508-4-adubey@linux.ibm.com>
Subject: Re: [PATCH v3 3/6] powerpc64/bpf: Avoid tailcall restore from trampoline
From: bot+bpf-ci@kernel.org
To: adubey@linux.ibm.com,bpf@vger.kernel.org,linuxppc-dev@lists.ozlabs.org,linux-kselftest@vger.kernel.org,linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com,sachinpb@linux.ibm.com,venkat88@linux.ibm.com,andrii@kernel.org,eddyz87@gmail.com,mykolal@fb.com,ast@kernel.org,daniel@iogearbox.net,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,john.fastabend@gmail.com,kpsingh@kernel.org,sdf@fomichev.me,haoluo@google.com,jolsa@kernel.org,christophe.leroy@csgroup.eu,naveen@kernel.org,maddy@linux.ibm.com,mpe@ellerman.id.au,npiggin@gmail.com,memxor@gmail.com,iii@linux.ibm.com,shuah@kernel.org,adubey@linux.ibm.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Thu, 22 Jan 2026 17:20:32 +0000 (UTC)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,fb.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au,meta.com];
	TAGGED_FROM(0.00)[bounces-16162-lists,linuxppc-dev=lfdr.de,bpf-ci];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_RECIPIENTS(0.00)[m:adubey@linux.ibm.com,m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kselftest@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hbathini@linux.ibm.com,m:sachinpb@linux.ibm.com,m:venkat88@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:mykolal@fb.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:naveen@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:memxor@gmail.com,m:iii@linux.ibm.com,m:shuah@kernel.org,m:martin.lau@kernel.org,m:clm@meta.com,m:ihor.solodrai@linux.dev,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.295];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.kernel.org:mid]
X-Rspamd-Queue-Id: 0E34B6B1AC
X-Rspamd-Action: no action

--===============8053750252812221712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index f3ee031edc26..9a8236d161ef 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -662,16 +662,11 @@ static void bpf_trampoline_setup_tail_call_info(u32 *image, struct codegen_conte
>  static void bpf_trampoline_restore_tail_call_cnt(u32 *image, struct codegen_context *ctx,
>  						 int func_frame_offset, int r4_off)
>  {
> -	if (IS_ENABLED(CONFIG_PPC64)) {
> -		/* See bpf_jit_stack_tailcallcnt() */
> -		int tailcallcnt_offset = 7 * 8;
> -
> -		EMIT(PPC_RAW_LL(_R3, _R1, -tailcallcnt_offset));
> -		EMIT(PPC_RAW_STL(_R3, _R1, func_frame_offset - tailcallcnt_offset));
> -	} else {
> -		/* See bpf_jit_stack_offsetof() and BPF_PPC_TC */
> -		EMIT(PPC_RAW_STL(_R4, _R1, r4_off));
> -	}
> +	/*
> +	 * Restore tailcall for 32-bit ppc.
> +	 * See bpf_jit_stack_offsetof() and BPF_PPC_TC
> +	 */
> +	EMIT(PPC_RAW_STL(_R4, _R1, r4_off));
>  }

After this change, on PPC64, the function unconditionally emits
EMIT(PPC_RAW_STL(_R4, _R1, r4_off)). However, r4_off is only assigned a value
in __arch_prepare_bpf_trampoline() when IS_ENABLED(CONFIG_PPC32), and is
initialized to 0 otherwise. Since __arch_prepare_bpf_trampoline() returns
early with -EOPNOTSUPP for PPC32, only PPC64 executes this code, meaning
r4_off will always be 0.

On PPC64, PPC_RAW_STL maps to PPC_RAW_STD. Will this emit a store of R4 to
offset 0 from R1, which is the stack back chain location? The comment says
"Restore tailcall for 32-bit ppc" but the code runs unconditionally on all
architectures.

Looking at bpf_trampoline_setup_tail_call_info() in the same file, it properly
handles the two architectures using if (IS_ENABLED(CONFIG_PPC64)). Should this
restore function have a similar guard, or return early for PPC64 since the
back propagation is no longer needed?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/21257691486

--===============8053750252812221712==--

