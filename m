Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D821445D7A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 10:52:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0CpQ5nTSz3fKw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 20:52:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Cjp4ZT8z3cb1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 20:48:14 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J0Cjn5Zg9z4xcM;
 Thu, 25 Nov 2021 20:48:13 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211123095231.1036501-1-npiggin@gmail.com>
References: <20211123095231.1036501-1-npiggin@gmail.com>
Subject: Re: [PATCH v4 00/53] KVM: PPC: Book3S HV P9: entry/exit optimisations
Message-Id: <163783308029.1228879.14171739470516805580.b4-ty@ellerman.id.au>
Date: Thu, 25 Nov 2021 20:38:00 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 23 Nov 2021 19:51:38 +1000, Nicholas Piggin wrote:
> This reduces radix guest full entry/exit latency on POWER9 and POWER10
> by 2x.
> 
> Nested HV guests should see smaller improvements in their L1 entry/exit,
> but this is also combined with most L0 speedups also applying to nested
> entry. nginx localhost throughput test in a SMP nested guest is improved
> about 10% (in a direct guest it doesn't change much because it uses XIVE
> for IPIs) when L0 and L1 are patched.
> 
> [...]

Applied to powerpc/next.

[01/53] powerpc/64s: Remove WORT SPR from POWER9/10 (take 2)
        https://git.kernel.org/powerpc/c/f53884b1bf28497e9596cac8b44ef1d41bd6dfc5
[02/53] powerpc/64s: guard optional TIDR SPR with CPU ftr test
        https://git.kernel.org/powerpc/c/736df58fd5bcd02f811f7d474bbe02a35ffaa8f0
[03/53] KMV: PPC: Book3S HV P9: Use set_dec to set decrementer to host
        https://git.kernel.org/powerpc/c/5955c7469a73033f607ebd6d418058943fe13dd3
[04/53] KVM: PPC: Book3S HV P9: Use host timer accounting to avoid decrementer read
        https://git.kernel.org/powerpc/c/4ebbd075bcde7884e078d4360510b989f559bfec
[05/53] KVM: PPC: Book3S HV P9: Use large decrementer for HDEC
        https://git.kernel.org/powerpc/c/9581991a60817abe311c2581ae4554b28bfa32f1
[06/53] KVM: PPC: Book3S HV P9: Reduce mftb per guest entry/exit
        https://git.kernel.org/powerpc/c/34bf08a2079fffc7206a1ae93086ab8167e0afb6
[07/53] powerpc/time: add API for KVM to re-arm the host timer/decrementer
        https://git.kernel.org/powerpc/c/25aa145856cd0d94864bf501218be84a7c8062ae
[08/53] KVM: PPC: Book3S HV: POWER10 enable HAIL when running radix guests
        https://git.kernel.org/powerpc/c/eacc818864bb01828280f4d64334c4e5ae6a4daf
[09/53] powerpc/64s: Keep AMOR SPR a constant ~0 at runtime
        https://git.kernel.org/powerpc/c/46f9caf1a246a5c0622fa8cc7e673658e925f97e
[10/53] KVM: PPC: Book3S HV: Don't always save PMU for guest capable of nesting
        https://git.kernel.org/powerpc/c/d3c8a2d3740d93778ea102d4c781746d284177bf
[11/53] powerpc/64s: Always set PMU control registers to frozen/disabled when not in use
        https://git.kernel.org/powerpc/c/245ebf8e7380b3d84c0aac37fbfd9306b45a3a7a
[12/53] powerpc/64s: Implement PMU override command line option
        https://git.kernel.org/powerpc/c/0a4b4327ce867e3ac1b3ad15f4d2b686b516b3a2
[13/53] KVM: PPC: Book3S HV P9: Implement PMU save/restore in C
        https://git.kernel.org/powerpc/c/57dc0eed73caa31bfe36ce8fed234e214e37a5ae
[14/53] KVM: PPC: Book3S HV P9: Factor PMU save/load into context switch functions
        https://git.kernel.org/powerpc/c/401e1ae372673664465d45a86975c006dc6a488d
[15/53] KVM: PPC: Book3S HV P9: Demand fault PMU SPRs when marked not inuse
        https://git.kernel.org/powerpc/c/9d3ddb86d96d9f0314f3baaf0e37f987b40d3eee
[16/53] KVM: PPC: Book3S HV P9: Factor out yield_count increment
        https://git.kernel.org/powerpc/c/b1adcf57ceca7eab9bfdafc754802e05e634bfcc
[17/53] KVM: PPC: Book3S HV: CTRL SPR does not require read-modify-write
        https://git.kernel.org/powerpc/c/a1a19e1154e4e9c6c1136474cb040657b1c17817
[18/53] KVM: PPC: Book3S HV P9: Move SPRG restore to restore_p9_host_os_sprs
        https://git.kernel.org/powerpc/c/174a3ab633392859888fc1a5cff278d5546d8474
[19/53] KVM: PPC: Book3S HV P9: Reduce mtmsrd instructions required to save host SPRs
        https://git.kernel.org/powerpc/c/34e119c96b2b381278d1ddf6b1708678462daba4
[20/53] KVM: PPC: Book3S HV P9: Improve mtmsrd scheduling by delaying MSR[EE] disable
        https://git.kernel.org/powerpc/c/2251fbe76395e4d89c31099984714c5f1135f052
[21/53] KVM: PPC: Book3S HV P9: Add kvmppc_stop_thread to match kvmppc_start_thread
        https://git.kernel.org/powerpc/c/cf99dedb4b2d2a18e004b1c84852fffa810dc44c
[22/53] KVM: PPC: Book3S HV: Change dec_expires to be relative to guest timebase
        https://git.kernel.org/powerpc/c/3c1a4322bba79aad2d3f6f996b7e1c336bd909b3
[23/53] KVM: PPC: Book3S HV P9: Move TB updates
        https://git.kernel.org/powerpc/c/6547af3eba88e4806e853fee7547031b2cc6a560
[24/53] KVM: PPC: Book3S HV P9: Optimise timebase reads
        https://git.kernel.org/powerpc/c/cb2553a093093ae46cfaee31321bcedcd0312c5d
[25/53] KVM: PPC: Book3S HV P9: Avoid SPR scoreboard stalls
        https://git.kernel.org/powerpc/c/9a1e530bbbdaa2184993a7d7fc61d78871540ccd
[26/53] KVM: PPC: Book3S HV P9: Only execute mtSPR if the value changed
        https://git.kernel.org/powerpc/c/9dfe7aa7bc50556063c8658f59ad475131c09b65
[27/53] KVM: PPC: Book3S HV P9: Juggle SPR switching around
        https://git.kernel.org/powerpc/c/0f3b6c4851aef7a98b435c6f08b2c9c88165d254
[28/53] KVM: PPC: Book3S HV P9: Move vcpu register save/restore into functions
        https://git.kernel.org/powerpc/c/516b334210b831827e0491676625323f484275dd
[29/53] KVM: PPC: Book3S HV P9: Move host OS save/restore functions to built-in
        https://git.kernel.org/powerpc/c/aabcaf6ae2a0912898bd243f0aec0ce6853983fc
[30/53] KVM: PPC: Book3S HV P9: Move nested guest entry into its own function
        https://git.kernel.org/powerpc/c/08b3f08af583c01b3cfdc15bda68063c2a401512
[31/53] KVM: PPC: Book3S HV P9: Move remaining SPR and MSR access into low level entry
        https://git.kernel.org/powerpc/c/d5f480194577423731ee8413791a5486f26a95ab
[32/53] KVM: PPC: Book3S HV P9: Implement TM fastpath for guest entry/exit
        https://git.kernel.org/powerpc/c/3f9e2966d1b0dd81bcfaeb816335e0ddeedde3c1
[33/53] KVM: PPC: Book3S HV P9: Switch PMU to guest as late as possible
        https://git.kernel.org/powerpc/c/3e7b3379023dad2e78c3200373a6368f5d0ee599
[34/53] KVM: PPC: Book3S HV P9: Restrict DSISR canary workaround to processors that require it
        https://git.kernel.org/powerpc/c/d55b1eccc7aa14a1750aecf271806365478ca805
[35/53] KVM: PPC: Book3S HV P9: More SPR speed improvements
        https://git.kernel.org/powerpc/c/34e02d555d8fa36cc756a083de1eeb56edab0e00
[36/53] KVM: PPC: Book3S HV P9: Demand fault EBB facility registers
        https://git.kernel.org/powerpc/c/a3e18ca8ab6f7f2260978f0a3842845414d799c0
[37/53] KVM: PPC: Book3S HV P9: Demand fault TM facility registers
        https://git.kernel.org/powerpc/c/022ecb960c89faad42ff0b417a71d9255dd115a3
[38/53] KVM: PPC: Book3S HV P9: Use Linux SPR save/restore to manage some host SPRs
        https://git.kernel.org/powerpc/c/5236756d04454c7ce9f45e27b434d75b8d6f8759
[39/53] KVM: PPC: Book3S HV P9: Comment and fix MMU context switching code
        https://git.kernel.org/powerpc/c/cf3b16cfa6503b1fe5e680f9711262e6a51ef097
[40/53] KVM: PPC: Book3S HV P9: Test dawr_enabled() before saving host DAWR SPRs
        https://git.kernel.org/powerpc/c/9c75f65f3583b0cf467c378a1076f0b50bbc2fb1
[41/53] KVM: PPC: Book3S HV P9: Don't restore PSSCR if not needed
        https://git.kernel.org/powerpc/c/a089a6869e7f613a8d961ac65bafd127317e4c5c
[42/53] KVM: PPC: Book3S HV: Split P8 from P9 path guest vCPU TLB flushing
        https://git.kernel.org/powerpc/c/0ba0e5d5a691806cca3d4f290dcc61f656049872
[43/53] KVM: PPC: Book3S HV P9: Avoid tlbsync sequence on radix guest exit
        https://git.kernel.org/powerpc/c/d5c0e8332d82c04deee25dd6f28c5bbe84d49a73
[44/53] KVM: PPC: Book3S HV Nested: Avoid extra mftb() in nested entry
        https://git.kernel.org/powerpc/c/46dea77f790c1e7ab2e9f7452e34de0dc5da9b13
[45/53] KVM: PPC: Book3S HV P9: Improve mfmsr performance on entry
        https://git.kernel.org/powerpc/c/b49c65c5f9f1dac4ef1764578ad55bacf526eb38
[46/53] KVM: PPC: Book3S HV P9: Optimise hash guest SLB saving
        https://git.kernel.org/powerpc/c/241d1f19f0e5c257881a0661f201b51dc3e57f8c
[47/53] KVM: PPC: Book3S HV P9: Avoid changing MSR[RI] in entry and exit
        https://git.kernel.org/powerpc/c/f08cbf5c7d1f86f12143a1dce23740411b03a807
[48/53] KVM: PPC: Book3S HV P9: Add unlikely annotation for !mmu_ready
        https://git.kernel.org/powerpc/c/4c9a68914eab1f17f6c428c579ffd75c4448461e
[49/53] KVM: PPC: Book3S HV P9: Avoid cpu_in_guest atomics on entry and exit
        https://git.kernel.org/powerpc/c/434398ab5eed03dbc0075af9436e871712bfb45a
[50/53] KVM: PPC: Book3S HV P9: Remove most of the vcore logic
        https://git.kernel.org/powerpc/c/ecb6a7207f92e33c2b7a1271165ecf5d8f420bba
[51/53] KVM: PPC: Book3S HV P9: Tidy kvmppc_create_dtl_entry
        https://git.kernel.org/powerpc/c/617326ff01df30796d897895ebd18ce583c9b883
[52/53] KVM: PPC: Book3S HV P9: Stop using vc->dpdes
        https://git.kernel.org/powerpc/c/6398326b9ba182936bdc9d66475c09e39b701aa2
[53/53] KVM: PPC: Book3S HV P9: Remove subcore HMI handling
        https://git.kernel.org/powerpc/c/9c5a432a558105d6145b058fad78eb6fcf3d4c38

cheers
