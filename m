Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9618C2DAAF8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 11:34:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwF4r57QhzDqRd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 21:34:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwF311v3gzDqLf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 21:33:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=XW66GSBf; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CwF2z5VRBz9s1l;
 Tue, 15 Dec 2020 21:33:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1608028397;
 bh=zMpdbTxIQR/bmtXKG54pVnC9KS5pqvpRuMJ/yyVLuug=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=XW66GSBfMlawbQ3SV26jfdKDUXUwCeos7whJAq2/MRxPH7+MmPNmUFRzM5p6ArrcQ
 Z5fHqVdChMVYv26v6B3lK/7yNHPHUyDuVPzq/h4c9+Nhm2wz8YK0lsZL+YiO2suWVi
 HwrJcroUFSCVTeceZdwbZv9hisLXqFdRIE9M8BV3MQ2+d1G7nVonFriOLtVnmhn289
 mvQvSjlM+73XOM9Je3AOmylZnBkgiuUmLfkP0nS8w7rLiUtZBEaigIWBw++jRyHh84
 PRveX7gUqiXOoNiVHJUAp/rKSQn1bbgN7QntdgHcqOy30OFqxmvsL8Bc9ICxGXxs3g
 /LHydTNn3GWKQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] powerpc/64s: Trim offlined CPUs from mm_cpumasks
In-Reply-To: <1607943765.29hccd2b8p.astroid@bobo.none>
References: <20201120025757.325930-1-npiggin@gmail.com>
 <20201120025757.325930-3-npiggin@gmail.com>
 <CAMuHMdUdorW03=mipgm92SXNPBZO5owW1Wp6_SacRDZ7fOe9gw@mail.gmail.com>
 <1607919238.kj439g85v5.astroid@bobo.none> <87h7oozn06.fsf@mpe.ellerman.id.au>
 <1607943765.29hccd2b8p.astroid@bobo.none>
Date: Tue, 15 Dec 2020 21:33:15 +1100
Message-ID: <875z53z7dg.fsf@mpe.ellerman.id.au>
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
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Anton Vorontsov <anton.vorontsov@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Michael Ellerman's message of December 14, 2020 8:43 pm:
>> Nicholas Piggin <npiggin@gmail.com> writes:
>>> Excerpts from Geert Uytterhoeven's message of December 10, 2020 7:06 pm:
>>>> Hi Nicholas,
>>>> 
>>>> On Fri, Nov 20, 2020 at 4:01 AM Nicholas Piggin <npiggin@gmail.com> wrote:
>>>>>
>>>>> When offlining a CPU, powerpc/64s does not flush TLBs, rather it just
>>>>> leaves the CPU set in mm_cpumasks, so it continues to receive TLBIEs
>>>>> to manage its TLBs.
>>>>>
>>>>> However the exit_flush_lazy_tlbs() function expects that after
>>>>> returning, all CPUs (except self) have flushed TLBs for that mm, in
>>>>> which case TLBIEL can be used for this flush. This breaks for offline
>>>>> CPUs because they don't get the IPI to flush their TLB. This can lead
>>>>> to stale translations.
>>>>>
>>>>> Fix this by clearing the CPU from mm_cpumasks, then flushing all TLBs
>>>>> before going offline.
>>>>>
>>>>> These offlined CPU bits stuck in the cpumask also prevents the cpumask
>>>>> from being trimmed back to local mode, which means continual broadcast
>>>>> IPIs or TLBIEs are needed for TLB flushing. This patch prevents that
>>>>> situation too.
>>>>>
>>>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>> 
>>>> Thanks for your patch!
>>>> 
>>>>> --- a/arch/powerpc/platforms/powermac/smp.c
>>>>> +++ b/arch/powerpc/platforms/powermac/smp.c
>>>>> @@ -911,6 +911,8 @@ static int smp_core99_cpu_disable(void)
>>>>>
>>>>>         mpic_cpu_set_priority(0xf);
>>>>>
>>>>> +       cleanup_cpu_mmu_context();
>>>>> +
>>>> 
>>>> I guess this change broke pmac32_defconfig+SMP in v5.10-rc7?
>>>> 
>>>> arch/powerpc/platforms/powermac/smp.c: error: implicit
>>>> declaration of function 'cleanup_cpu_mmu_context'
>>>> [-Werror=implicit-function-declaration]:  => 914:2
>>>> 
>>>> http://kisskb.ellerman.id.au/kisskb/buildresult/14423174/
>>>
>>> Hey, yeah it does thanks for catching it. This patch fixes it for me
>>>
>>> ---
>>> From a9b5ec92ffac975e81c6d7db6ff2b1486b2723f7 Mon Sep 17 00:00:00 2001
>>> From: Nicholas Piggin <npiggin@gmail.com>
>>> Date: Mon, 14 Dec 2020 13:52:39 +1000
>>> Subject: [PATCH] powerpc/32s: Fix cleanup_cpu_mmu_context() compile bug
>>>
>>> 32s has no tlbiel_all() defined, so just disable the cleanup with a
>>> comment.
>> 
>> Or what about just:
>
> That works, I kind of wanted it in there explicit that we don't
> clean up on 32s. I don't mind if you prefer this though.

OK. I'll merge my version because I can do that without needing to merge
master in order to get the broken commit into my tree.

cheers
