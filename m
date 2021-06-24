Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 444E13B30C3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 16:01:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9hd46ZDyz3bxc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 00:01:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9hbJ1TJxz2yRD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 23:59:56 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G9hbF6W64z9sX2; Thu, 24 Jun 2021 23:59:53 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
In-Reply-To: <20210528090752.3542186-1-npiggin@gmail.com>
References: <20210528090752.3542186-1-npiggin@gmail.com>
Subject: Re: [PATCH v7 00/32] KVM: PPC: Book3S: C-ify the P9 entry/exit code
Message-Id: <162454315572.2927609.6378286618001902599.b4-ty@ellerman.id.au>
Date: Thu, 24 Jun 2021 23:59:15 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 28 May 2021 19:07:20 +1000, Nicholas Piggin wrote:
> Git tree here
> 
> https://github.com/npiggin/linux/tree/kvm-in-c-5.14-1
> 
> This series applies to upstream plus a couple of KVM regression fixes
> not yet in powerpc tree, which are included in the above git tree.
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[01/32] KVM: PPC: Book3S 64: move KVM interrupt entry to a common entry point
        https://git.kernel.org/powerpc/c/f36011569b90b3973f07cea00c5872c4dc0c707f
[02/32] KVM: PPC: Book3S 64: Move GUEST_MODE_SKIP test into KVM
        https://git.kernel.org/powerpc/c/f33e0702d98cc5ff21f44833525b07581862eb57
[03/32] KVM: PPC: Book3S 64: add hcall interrupt handler
        https://git.kernel.org/powerpc/c/31c67cfe2a6a5a7364dc1552b877c6b7820dd556
[04/32] KVM: PPC: Book3S 64: Move hcall early register setup to KVM
        https://git.kernel.org/powerpc/c/04ece7b60b689e1de38b9b0f597f8f94951e4367
[05/32] KVM: PPC: Book3S 64: Move interrupt early register setup to KVM
        https://git.kernel.org/powerpc/c/69fdd67499716efca861f7cecabdfeee5e5d7b51
[06/32] KVM: PPC: Book3S 64: move bad_host_intr check to HV handler
        https://git.kernel.org/powerpc/c/1b5821c630c219e3c6f643ebbefcf08c9fa714d8
[07/32] KVM: PPC: Book3S 64: Minimise hcall handler calling convention differences
        https://git.kernel.org/powerpc/c/e2762743c6328dde14290cd58ddf2175b068ad80
[08/32] KVM: PPC: Book3S HV P9: implement kvmppc_xive_pull_vcpu in C
        https://git.kernel.org/powerpc/c/023c3c96ca4d196c09d554d5a98900406e4d7ecb
[09/32] KVM: PPC: Book3S HV P9: Move setting HDEC after switching to guest LPCR
        https://git.kernel.org/powerpc/c/413679e73bdfc2720dc2fa2172b65b7411185fa7
[10/32] KVM: PPC: Book3S HV P9: Reduce irq_work vs guest decrementer races
        https://git.kernel.org/powerpc/c/6ffe2c6e6dcefb971e4046f02086c4adadd0b310
[11/32] KVM: PPC: Book3S HV P9: Move xive vcpu context management into kvmhv_p9_guest_entry
        https://git.kernel.org/powerpc/c/09512c29167bd3792820caf83bcca4d4e5ac2266
[12/32] KVM: PPC: Book3S HV P9: Move radix MMU switching instructions together
        https://git.kernel.org/powerpc/c/48013cbc504e064d2318f24482cfbe3c53e0a812
[13/32] KVM: PPC: Book3S HV P9: Stop handling hcalls in real-mode in the P9 path
        https://git.kernel.org/powerpc/c/9dc2babc185e0a24fbb48098daafd552cac157fa
[14/32] KVM: PPC: Book3S HV P9: Implement the rest of the P9 path in C
        https://git.kernel.org/powerpc/c/89d35b23910158a9add33a206e973f4227906d3c
[15/32] KVM: PPC: Book3S HV P9: inline kvmhv_load_hv_regs_and_go into __kvmhv_vcpu_entry_p9
        https://git.kernel.org/powerpc/c/c00366e2375408e43370cd7981af3354f7c83ed3
[16/32] KVM: PPC: Book3S HV P9: Read machine check registers while MSR[RI] is 0
        https://git.kernel.org/powerpc/c/6d770e3fe9a120560cda66331ce5faa363400e97
[17/32] KVM: PPC: Book3S HV P9: Improve exit timing accounting coverage
        https://git.kernel.org/powerpc/c/a32ed1bb70723ec7a6c888b6c7071d516cca0e8f
[18/32] KVM: PPC: Book3S HV P9: Move SPR loading after expiry time check
        https://git.kernel.org/powerpc/c/68e3baaca8c56bbb336d2215f201f4047ce736e5
[19/32] KVM: PPC: Book3S HV P9: Add helpers for OS SPR handling
        https://git.kernel.org/powerpc/c/edba6aff4f2c3893e168df6a2e9a20f3c39b0b30
[20/32] KVM: PPC: Book3S HV P9: Switch to guest MMU context as late as possible
        https://git.kernel.org/powerpc/c/41f779917669fcc28a7f5646d1f7a85043c9d152
[21/32] KVM: PPC: Book3S HV: Implement radix prefetch workaround by disabling MMU
        https://git.kernel.org/powerpc/c/2e1ae9cd56f8616a707185f3c6cb7ee2a20809e1
[22/32] KVM: PPC: Book3S HV: Remove support for dependent threads mode on P9
        https://git.kernel.org/powerpc/c/aaae8c79005846eeafc7a0e5d3eda4e34ea8ca2e
[23/32] KVM: PPC: Book3S HV: Remove radix guest support from P7/8 path
        https://git.kernel.org/powerpc/c/9769a7fd79b65a6a6f8362154ab59c36d0defbf3
[24/32] KVM: PPC: Book3S HV: Remove virt mode checks from real mode handlers
        https://git.kernel.org/powerpc/c/dcbac73a5b374873bd6dfd8a0ee5d0b7fc844420
[25/32] KVM: PPC: Book3S HV: Remove unused nested HV tests in XICS emulation
        https://git.kernel.org/powerpc/c/2ce008c8b25467ceacf45bcf0e183d660edb82f2
[26/32] KVM: PPC: Book3S HV P9: Allow all P9 processors to enable nested HV
        https://git.kernel.org/powerpc/c/cbcff8b1c53e458ed4e23877048d7268fd13ab8a
[27/32] KVM: PPC: Book3S HV: small pseries_do_hcall cleanup
        https://git.kernel.org/powerpc/c/a9aa86e08b3a0b2c273cdb772283c872e55f14bf
[28/32] KVM: PPC: Book3S HV: add virtual mode handlers for HPT hcalls and page faults
        https://git.kernel.org/powerpc/c/6165d5dd99dbaec7a309491c3951bd81fc89978d
[29/32] KVM: PPC: Book3S HV P9: Reflect userspace hcalls to hash guests to support PR KVM
        https://git.kernel.org/powerpc/c/ac3c8b41c27ea112daed031f852a4b361c11a03e
[30/32] KVM: PPC: Book3S HV P9: implement hash guest support
        https://git.kernel.org/powerpc/c/079a09a500c399f804effcf9bb49214cdfa698e5
[31/32] KVM: PPC: Book3S HV P9: implement hash host / hash guest support
        https://git.kernel.org/powerpc/c/0bf7e1b2e9a496e1ebca9e3e1f53c7e98add4417
[32/32] KVM: PPC: Book3S HV: remove ISA v3.0 and v3.1 support from P7/8 path
        https://git.kernel.org/powerpc/c/fae5c9f3664ba278137e54a2083b39b90c64093a

cheers
