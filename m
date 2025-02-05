Return-Path: <linuxppc-dev+bounces-5858-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA03A28675
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2025 10:26:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ynvxb1Db1z2ysf;
	Wed,  5 Feb 2025 20:26:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738747587;
	cv=none; b=O0zmWRArandwgRlCwYPEXSPaJiyh3nLdRMMeZ6Uu/I5uhO+Ecs7KxnYNxXlQNZYZHS0giIZkGvCCigWrvPpUFrzQLeKITmOBgD7teE7C+T4bZM/gDZsoC4OAWnHFV8+5JcIWfJY3ddUlL+OmOWkd5Iszg6Q8OpyDIplO7z7Dgc0v5+Xll0fHbCqgW3bRYr5LgSKCmMHZ5CJ4JhSIW40G8TZd0VCQaiXbmM01w4p495Pz5y/QYoUAnAMNy0uPJ2y03kbapPifIgqxsNX40UCdXrvJr72u3M4HMFPoPOiEkwDdvZTy7DDI64cTnYX55KCyxwcjvc1F2vpNnNSkZw1Zlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738747587; c=relaxed/relaxed;
	bh=T7ANeA1RtEc2Om2Lc6mZEGl9Xs5Q7MlTf2hb8EB8Koo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D4XqnPYAOO6WtydS4rzOlUIXNYNOWW6KAyWaest6dMq16+kIn4SXPCkCW8qIHBNZxphgUuv/1Vcz4rl5EDadzZc3/ldKDCKFcEJicq2ugJYoTz7uhDtn3HMRksXUNZWXyRfrkoS4eB4Mph5+QybNpTeHc28O2eqNSxCXJGxc0lpoIFTQtdtThexG1aFUKuU4OzpxuR6LjYr0bBSO0RyOorUrP7V4WOz36woPwqji8Ty/f7kpBk1vBCnOS3Lbl1k3WpAQifAT8nW1FoR8VuNQgpNR4IS1BqvLzWYcB3Yj0JWaSR9y395WLOZXPSp0TTwgasQE/YsYAtG0S4I67CygdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bgKxIGnP; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bgKxIGnP;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YnvxY5HPHz2yjb
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 20:26:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1738747574;
	bh=T7ANeA1RtEc2Om2Lc6mZEGl9Xs5Q7MlTf2hb8EB8Koo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bgKxIGnPtgbpsOGI102n9yvLZzWZQVoAte9QeLDKMFzMwgm4cpHdmDuLLl6Ek6qtv
	 kVwkxlRlHUbxTykq1fvTt4OR7MFdThWjgrbJlQ9gIkMbskorYhnTvnpw4CXNaiOJGM
	 mail7825sE+fc5fRSYSZaub5hpmcm/iNv3z4EYCUmsdpR/czhxG62qM0KmYwZKTTFp
	 PEP7ClJWHDLtQQ6wkUcVUNN1LA1+/zUlK/dlmyzsFG1PgbAhDJSRee2+1wzU9DE5Dq
	 bAcKoN3kXgStdR4pbpjQIjUE8WEBNZKt0lB7CQv96FEf5rAyznV4aCpxE6KmmNUVjS
	 XU662X5uvcZwg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YnvxK5QLHz4wcD;
	Wed,  5 Feb 2025 20:26:13 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Erhard
 Furtner <erhard_f@mailbox.org>
Subject: Re: [PATCH] powerpc/code-patching: Disable KASAN report during
 patching via temporary mm
In-Reply-To: <1c05b2a1b02ad75b981cfc45927e0b4a90441046.1738577687.git.christophe.leroy@csgroup.eu>
References: <1c05b2a1b02ad75b981cfc45927e0b4a90441046.1738577687.git.christophe.leroy@csgroup.eu>
Date: Wed, 05 Feb 2025 20:26:20 +1100
Message-ID: <87pljwspxf.fsf@mpe.ellerman.id.au>
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
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Erhard reports the following KASAN hit on Talos II (power9) with kernel 6.13:
>
> [   12.028126] ==================================================================
> [   12.028198] BUG: KASAN: user-memory-access in copy_to_kernel_nofault+0x8c/0x1a0
> [   12.028260] Write of size 8 at addr 0000187e458f2000 by task systemd/1
>
> [   12.028346] CPU: 87 UID: 0 PID: 1 Comm: systemd Tainted: G                T  6.13.0-P9-dirty #3
> [   12.028408] Tainted: [T]=RANDSTRUCT
> [   12.028446] Hardware name: T2P9D01 REV 1.01 POWER9 0x4e1202 opal:skiboot-bc106a0 PowerNV
> [   12.028500] Call Trace:
> [   12.028536] [c000000008dbf3b0] [c000000001656a48] dump_stack_lvl+0xbc/0x110 (unreliable)
> [   12.028609] [c000000008dbf3f0] [c0000000006e2fc8] print_report+0x6b0/0x708
> [   12.028666] [c000000008dbf4e0] [c0000000006e2454] kasan_report+0x164/0x300
> [   12.028725] [c000000008dbf600] [c0000000006e54d4] kasan_check_range+0x314/0x370
> [   12.028784] [c000000008dbf640] [c0000000006e6310] __kasan_check_write+0x20/0x40
> [   12.028842] [c000000008dbf660] [c000000000578e8c] copy_to_kernel_nofault+0x8c/0x1a0
> [   12.028902] [c000000008dbf6a0] [c0000000000acfe4] __patch_instructions+0x194/0x210
> [   12.028965] [c000000008dbf6e0] [c0000000000ade80] patch_instructions+0x150/0x590
> [   12.029026] [c000000008dbf7c0] [c0000000001159bc] bpf_arch_text_copy+0x6c/0xe0
> [   12.029085] [c000000008dbf800] [c000000000424250] bpf_jit_binary_pack_finalize+0x40/0xc0
> [   12.029147] [c000000008dbf830] [c000000000115dec] bpf_int_jit_compile+0x3bc/0x930
> [   12.029206] [c000000008dbf990] [c000000000423720] bpf_prog_select_runtime+0x1f0/0x280
> [   12.029266] [c000000008dbfa00] [c000000000434b18] bpf_prog_load+0xbb8/0x1370
> [   12.029324] [c000000008dbfb70] [c000000000436ebc] __sys_bpf+0x5ac/0x2e00
> [   12.029379] [c000000008dbfd00] [c00000000043a228] sys_bpf+0x28/0x40
> [   12.029435] [c000000008dbfd20] [c000000000038eb4] system_call_exception+0x334/0x610
> [   12.029497] [c000000008dbfe50] [c00000000000c270] system_call_vectored_common+0xf0/0x280
> [   12.029561] --- interrupt: 3000 at 0x3fff82f5cfa8
> [   12.029608] NIP:  00003fff82f5cfa8 LR: 00003fff82f5cfa8 CTR: 0000000000000000
> [   12.029660] REGS: c000000008dbfe80 TRAP: 3000   Tainted: G                T   (6.13.0-P9-dirty)
> [   12.029735] MSR:  900000000280f032 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI>  CR: 42004848  XER: 00000000
> [   12.029855] IRQMASK: 0
>                GPR00: 0000000000000169 00003fffdcf789a0 00003fff83067100 0000000000000005
>                GPR04: 00003fffdcf78a98 0000000000000090 0000000000000000 0000000000000008
>                GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>                GPR12: 0000000000000000 00003fff836ff7e0 c000000000010678 0000000000000000
>                GPR16: 0000000000000000 0000000000000000 00003fffdcf78f28 00003fffdcf78f90
>                GPR20: 0000000000000000 0000000000000000 0000000000000000 00003fffdcf78f80
>                GPR24: 00003fffdcf78f70 00003fffdcf78d10 00003fff835c7239 00003fffdcf78bd8
>                GPR28: 00003fffdcf78a98 0000000000000000 0000000000000000 000000011f547580
> [   12.030316] NIP [00003fff82f5cfa8] 0x3fff82f5cfa8
> [   12.030361] LR [00003fff82f5cfa8] 0x3fff82f5cfa8
> [   12.030405] --- interrupt: 3000
> [   12.030444] ==================================================================
>
> Commit c28c15b6d28a ("powerpc/code-patching: Use temporary mm for
> Radix MMU") is inspired from x86 but unlike x86 is doesn't disable
> KASAN reports during patching. This wasn't a problem at the begining
> because __patch_mem() is not instrumented.
>
> Commit 465cabc97b42 ("powerpc/code-patching: introduce
> patch_instructions()") use copy_to_kernel_nofault() to copy several
> instructions at once. But when using temporary mm the destination is
> not regular kernel memory but a kind of kernel-like memory located
> in user address space. Because it is not in kernel address space it is
> not covered by KASAN shadow memory. Since commit e4137f08816b ("mm,
> kasan, kmsan: instrument copy_from/to_kernel_nofault") KASAN reports
> bad accesses from copy_to_kernel_nofault(). Here a bad access to user
> memory is reported because KASAN detects the lack of shadow memory and
> the address is below TASK_SIZE.
>
> Do like x86 in commit b3fd8e83ada0 ("x86/alternatives: Use temporary
> mm for text poking") and disable KASAN reports during patching when
> using temporary mm.
>
> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> Close: https://lore.kernel.org/all/20250201151435.48400261@yea/
> Fixes: 465cabc97b42 ("powerpc/code-patching: introduce patch_instructions()")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/lib/code-patching.c | 2 ++
>  1 file changed, 2 insertions(+)

Thanks for debugging that Christophe.

Fix looks good to me.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

