Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F337CEFEB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 08:12:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ktpp2Ekj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9y7H5JtFz3cgW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 17:12:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ktpp2Ekj;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9y6Q4Mwlz3c7n
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 17:11:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697695918;
	bh=g4QxeIWwpVoqUZcFFWMo07YjdjSiFN61b9iheT1gEtA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ktpp2Ekju+sK24/gbcyE13C5VFLqCMAnCxEWUIk4nakacvri5jmPv6YN0gc1nDTnO
	 64EgAx9y5sCtomEuaD1Zz/e/2EUdrrPOHge8CK9kv6yfbiJ2jEYj+jEYwQ4l5khDOP
	 2jtSYC8NkmBt5fp4xh//r63LEOxsI6dCcg2tTIh0+/1cRohO/2n9I4kuLpxfMOVZMk
	 kuO+O1pzEXs3C6qQ2escwe6iwilP2T2l+fyukqmuV9Eh1bLVuVH0U7Q6yAY4Duus7m
	 fObKFsJVAc0IG/hd+ZVvqD7g7aIJe/ropSzWskgLtesM4leoaX91ElA8sCVZ3LAjgt
	 Ls9N6u/RRFRbw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S9y6P2G70z4xWn;
	Thu, 19 Oct 2023 17:11:57 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Subject: Re: [PATCH v6 5/5] powerpc/bpf: use
 bpf_jit_binary_pack_[alloc|finalize|free]
In-Reply-To: <20231012200310.235137-6-hbathini@linux.ibm.com>
References: <20231012200310.235137-1-hbathini@linux.ibm.com>
 <20231012200310.235137-6-hbathini@linux.ibm.com>
Date: Thu, 19 Oct 2023 17:11:54 +1100
Message-ID: <87jzrj5efp.fsf@mail.lhotse>
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini <hbathini@linux.ibm.com> writes:
> Use bpf_jit_binary_pack_alloc in powerpc jit. The jit engine first
> writes the program to the rw buffer. When the jit is done, the program
> is copied to the final location with bpf_jit_binary_pack_finalize.
> With multiple jit_subprogs, bpf_jit_free is called on some subprograms
> that haven't got bpf_jit_binary_pack_finalize() yet. Implement custom
> bpf_jit_free() like in commit 1d5f82d9dd47 ("bpf, x86: fix freeing of
> not-finalized bpf_prog_pack") to call bpf_jit_binary_pack_finalize(),
> if necessary. As bpf_flush_icache() is not needed anymore, remove it.
>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> Acked-by: Song Liu <song@kernel.org>
> ---
>  arch/powerpc/net/bpf_jit.h        |  18 ++---
>  arch/powerpc/net/bpf_jit_comp.c   | 106 ++++++++++++++++++++++--------
>  arch/powerpc/net/bpf_jit_comp32.c |  13 ++--
>  arch/powerpc/net/bpf_jit_comp64.c |  10 +--
>  4 files changed, 96 insertions(+), 51 deletions(-)

This causes a crash at boot on my Power7 box:

[    0.141514][    T1] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.141544][    T1] futex hash table entries: 16384 (order: 5, 2097152 bytes, vmalloc)
[    0.276735][    T1] BUG: Kernel NULL pointer dereference at 0x00000000
[    0.276757][    T1] Faulting instruction address: 0xc00000000009e154
[    0.276764][    T1] Oops: Kernel access of bad area, sig: 11 [#1]
[    0.276769][    T1] BE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=64 NUMA pSeries
[    0.276777][    T1] Modules linked in:
[    0.276783][    T1] CPU: 12 PID: 1 Comm: swapper/0 Not tainted 6.6.0-rc2-00037-ge4f551719dee-dirty #1
[    0.276790][    T1] Hardware name: IBM,8406-71Y POWER7 (raw) 0x3f0201 0xf000003 of:IBM,AA730_159 hv:phyp pSeries
[    0.276797][    T1] NIP:  c00000000009e154 LR: c00000000009e398 CTR: 0000000000000000
[    0.276803][    T1] REGS: c000000006d07580 TRAP: 0380   Not tainted  (6.6.0-rc2-00037-ge4f551719dee-dirty)
[    0.276810][    T1] MSR:  8000000000009032 <SF,EE,ME,IR,DR,RI>  CR: 28002288  XER: 0000000b
[    0.276825][    T1] CFAR: c00000000009e150 IRQMASK: 1
[    0.276825][    T1] GPR00: c00000000009e398 c000000006d07820 c000000001357a00 0000000000000000
[    0.276825][    T1] GPR04: 000000000000000a ffffffffffffffff 0000000000000000 00000007ae5c0000
[    0.276825][    T1] GPR08: c000000001441810 c0000000081f018e 00000000081f0000 0000000000004400
[    0.276825][    T1] GPR12: 0000000000000014 c00000000ee71700 0000000000000000 0000000000000000
[    0.276825][    T1] GPR16: 0000000000010000 c000000001441808 c000000001441810 c00000000000018e
[    0.276825][    T1] GPR20: c0000007b576d000 c0000007b34f3080 0000000000000000 ffffffffffffffff
[    0.276825][    T1] GPR24: 0000000000000000 c000000006c6a800 0000000000000a00 0000000000000000
[    0.276825][    T1] GPR28: c008000006490000 0000000000000a00 c0000007b576d000 0000000000000000
[    0.276899][    T1] NIP [c00000000009e154] patch_instructions+0x304/0x570
[    0.276909][    T1] LR [c00000000009e398] patch_instructions+0x548/0x570
[    0.276917][    T1] Call Trace:
[    0.276920][    T1] [c000000006d07820] [c00000000009e398] patch_instructions+0x548/0x570 (unreliable)
[    0.276930][    T1] [c000000006d07900] [c000000000120de8] bpf_arch_text_copy+0x68/0x110
[    0.276940][    T1] [c000000006d07940] [c0000000002c1f54] bpf_jit_binary_pack_finalize+0x34/0xb0
[    0.276951][    T1] [c000000006d07970] [c000000000121130] bpf_int_jit_compile+0x2a0/0x6b0
[    0.276960][    T1] [c000000006d07ac0] [c0000000002c16c4] bpf_prog_select_runtime+0x184/0x230
[    0.276970][    T1] [c000000006d07b10] [c000000000d8ea60] bpf_prepare_filter+0x520/0x730
[    0.276980][    T1] [c000000006d07b90] [c000000000d8ed0c] bpf_prog_create+0x9c/0x130
[    0.276989][    T1] [c000000006d07bd0] [c0000000013d7ca8] ptp_classifier_init+0x4c/0x80
[    0.276998][    T1] [c000000006d07c10] [c0000000013d6d90] sock_init+0xe0/0x100
[    0.277006][    T1] [c000000006d07c40] [c00000000000efb8] do_one_initcall+0x88/0x288
[    0.277014][    T1] [c000000006d07d10] [c000000001364ef0] kernel_init_freeable+0x2f4/0x39c
[    0.277024][    T1] [c000000006d07de0] [c00000000000f450] kernel_init+0x30/0x170
[    0.277032][    T1] [c000000006d07e50] [c00000000000d394] ret_from_kernel_user_thread+0x14/0x1c
[    0.277040][    T1] --- interrupt: 0 at 0x0
[    0.277149][    T1] Code: 7bff03e4 7dc7502a 7f63fb78 0b060000 792a83e4 79298284 0b090000 3d20c000 792907c6 6129018e 7d494b78 48000004 <f92e0000> 48000008 7c4004ac e8c10030
[    0.277178][    T1] ---[ end trace 0000000000000000 ]---

Code around the crash:

c00000000009e0f4:       48 34 6f 65     bl      c0000000003e5058 <is_vmalloc_or_module_addr+0x8>
c00000000009e0f8:       60 00 00 00     nop
c00000000009e0fc:       2c 03 00 00     cmpwi   r3,0
c00000000009e100:       40 82 02 90     bne     c00000000009e390 <patch_instructions+0x540>
c00000000009e104:       7f 89 e3 78     mr      r9,r28
c00000000009e108:       38 c0 00 00     li      r6,0
c00000000009e10c:       79 29 85 02     rldicl  r9,r9,48,20
c00000000009e110:       e8 ed 00 30     ld      r7,48(r13)
c00000000009e114:       e9 01 00 40     ld      r8,64(r1)
c00000000009e118:       e9 41 00 38     ld      r10,56(r1)
c00000000009e11c:       7f e8 38 2a     ldx     r31,r8,r7
c00000000009e120:       39 4a 00 10     addi    r10,r10,16
c00000000009e124:       7b ff 03 e4     clrrdi  r31,r31,16
c00000000009e128:       7d c7 50 2a     ldx     r14,r7,r10      <-- r14
c00000000009e12c:       7f 63 fb 78     or      r3,r27,r31
c00000000009e130:       0b 06 00 00     tdnei   r6,0
c00000000009e134:       79 2a 83 e4     sldi    r10,r9,16
c00000000009e138:       79 29 82 84     rldicr  r9,r9,16,10
c00000000009e13c:       0b 09 00 00     tdnei   r9,0
c00000000009e140:       3d 20 c0 00     lis     r9,-16384
c00000000009e144:       79 29 07 c6     sldi    r9,r9,32
c00000000009e148:       61 29 01 8e     ori     r9,r9,398
c00000000009e14c:       7d 49 4b 78     or      r9,r10,r9
c00000000009e150:       60 00 00 00     nop
c00000000009e154:       f9 2e 00 00     std     r9,0(r14)        <-- oops
c00000000009e158:       60 00 00 00     nop
c00000000009e15c:       7c 40 04 ac     ptesync
c00000000009e160:       e8 c1 00 30     ld      r6,48(r1)
c00000000009e164:       7f a5 eb 78     mr      r5,r29
c00000000009e168:       7e 84 a3 78     mr      r4,r20


I haven't had time to diagnose it any further. Will try and have a look tonight.

cheers
