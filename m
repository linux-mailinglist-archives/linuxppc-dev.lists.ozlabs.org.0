Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9773117AFA5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 21:21:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YMbm0fcLzDqpM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 07:21:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YMYX5y5FzDqS9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 07:20:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=Zsw7mJH3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=eOkcQg4R; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48YMYX4RQnz8tPV
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 07:20:00 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48YMYX3zMCz9sPR; Fri,  6 Mar 2020 07:20:00 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=Zsw7mJH3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=eOkcQg4R; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48YMYS2YYhz9s3x
 for <linuxppc-dev@ozlabs.org>; Fri,  6 Mar 2020 07:19:55 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1BA4B884;
 Thu,  5 Mar 2020 15:19:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 05 Mar 2020 15:19:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 1Gn9LqA700X5RvpLGbT+RMn+rc0dqPF9Bf5Gq3WmpKo=; b=Zsw7mJH34eW3WdrI
 m2CJ+JnUp3y8gk+MbNh+8zx4C8ZDR0QqsiDOYPWCBYidHDvP8foDAgvxiTCeaUJd
 +FfsY94rSdyEVMVza4jLWE/sFryr0yPwKKOYaN8KoLohlkq0bzLgkrGRXWeu7SEY
 4V1vDegq9EtnVwlaWqZ/3dEN25tImkbMCaaLt3IedysxSe/PThZ76alrcETHwiAI
 yZiGxwfxxLecD05xiR2U2/dx5UnQukDmBUdfWNHgnrgLOPr7E788hW+Bq4N/2baL
 9+6ZCdKjfN7Z1s9fwK33ghc71kl+GtY1+MqNa4fFmRd1WiIyLXvWdRbUnPzsEuRq
 TP8kOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=1Gn9LqA700X5RvpLGbT+RMn+rc0dqPF9Bf5Gq3Wmp
 Ko=; b=eOkcQg4Rxcq/EZLasBg636GGl81JIhP+P3bb7/vqTU2p6D8+G5Cfbd9PI
 9UisB9xezOzfdczWBeQLQ7kJHzyAPILIpBVkueSp7h5FkVYyeSuw67aYO8KSKr5R
 8KsPWy6K0pqbD5O9hNE+weGUnoGqukWky9djKQ44c726PIi9NbNxb/cOc5BNNpdo
 o9nKosBrbZE6eoJOKZHJETAGizJ7y0Mkq7nNdvkFHxW6TmfL6S8rxkKvJpR9b6sF
 yj1zpGXJoYq+7fyvyTKN+QB9UoGnvFpStpU7v5pUEF48Jv7vzeL4UFFdrsSmocDK
 xa0b8q3lh8UiscIV62sq1F5igVZNQ==
X-ME-Sender: <xms:5V5hXmI-IBciyvEhe__p7iqHpmKuGsRsxfPP57Y3AETZkObTYlKhHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddutddgudegtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculddutddmnecujfgurhepkf
 fuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomheptfhushhsvghllhcuvehu
 rhhrvgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecukfhppeduvddvrdelle
 drkedvrddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehruhhstghurhesrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:5V5hXtSrJ9J93TrffMnJQl1Hxf3Z57hm9H4egx9o8iXc5isIvb6P-g>
 <xmx:5V5hXroN8CyBPcjrRvIcvqk5ReMxfF8C8M5c9MjdjqfxkdjtEGVA2Q>
 <xmx:5V5hXqG_6DeYAdO_9Z4ATn8dTLN5QEKxlfkFzgraWyLjTSaQzTIE1w>
 <xmx:5l5hXg_IbWavvEuBppOdgPLZ9Y_l7edqnj7PLGN0tTTn0eVjKfpcqg>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 65DEC3280063;
 Thu,  5 Mar 2020 15:19:48 -0500 (EST)
Message-ID: <1a8920fa6cf040df0cb98f1500bc6c2b79367925.camel@russell.cc>
Subject: Re: [PATCH v2] powerpc/mm: Fix missing KUAP disable in
 flush_coherent_icache()
From: Russell Currey <ruscur@russell.cc>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
Date: Fri, 06 Mar 2020 07:19:45 +1100
In-Reply-To: <20200303235708.26004-1-mpe@ellerman.id.au>
References: <20200303235708.26004-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Wed, 2020-03-04 at 10:57 +1100, Michael Ellerman wrote:
> We received a report of strange kernel faults which turned out to be
> due to a missing KUAP disable in flush_coherent_icache() called
> from flush_icache_range().
> 
> The fault looks like:
> 
>   Kernel attempted to access user page (7fffc30d9c00) - exploit
> attempt? (uid: 1009)
>   BUG: Unable to handle kernel data access on read at 0x7fffc30d9c00
>   Faulting instruction address: 0xc00000000007232c
>   Oops: Kernel access of bad area, sig: 11 [#1]
>   LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
>   CPU: 35 PID: 5886 Comm: sigtramp Not tainted 5.6.0-rc2-gcc-8.2.0-
> 00003-gfc37a1632d40 #79
>   NIP:  c00000000007232c LR: c00000000003b7fc CTR: 0000000000000000
>   REGS: c000001e11093940 TRAP: 0300   Not tainted  (5.6.0-rc2-gcc-
> 8.2.0-00003-gfc37a1632d40)
>   MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR:
> 28000884  XER: 00000000
>   CFAR: c0000000000722fc DAR: 00007fffc30d9c00 DSISR: 08000000
> IRQMASK: 0
>   GPR00: c00000000003b7fc c000001e11093bd0 c0000000023ac200
> 00007fffc30d9c00
>   GPR04: 00007fffc30d9c18 0000000000000000 c000001e11093bd4
> 0000000000000000
>   GPR08: 0000000000000000 0000000000000001 0000000000000000
> c000001e1104ed80
>   GPR12: 0000000000000000 c000001fff6ab380 c0000000016be2d0
> 4000000000000000
>   GPR16: c000000000000000 bfffffffffffffff 0000000000000000
> 0000000000000000
>   GPR20: 00007fffc30d9c00 00007fffc30d8f58 00007fffc30d9c18
> 00007fffc30d9c20
>   GPR24: 00007fffc30d9c18 0000000000000000 c000001e11093d90
> c000001e1104ed80
>   GPR28: c000001e11093e90 0000000000000000 c0000000023d9d18
> 00007fffc30d9c00
>   NIP flush_icache_range+0x5c/0x80
>   LR  handle_rt_signal64+0x95c/0xc2c
>   Call Trace:
>     0xc000001e11093d90 (unreliable)
>     handle_rt_signal64+0x93c/0xc2c
>     do_notify_resume+0x310/0x430
>     ret_from_except_lite+0x70/0x74
>   Instruction dump:
>   409e002c 7c0802a6 3c62ff31 3863f6a0 f8010080 48195fed 60000000
> 48fe4c8d
>   60000000 e8010080 7c0803a6 7c0004ac <7c00ffac> 7c0004ac 4c00012c
> 38210070
> 
> This path through handle_rt_signal64() to setup_trampoline() and
> flush_icache_range() is only triggered by 64-bit processes that have
> unmapped their VDSO, which is rare.
> 
> flush_icache_range() takes a range of addresses to flush. In
> flush_coherent_icache() we implement an optimisation for CPUs where
> we
> know we don't actually have to flush the whole range, we just need to
> do a single icbi.
> 
> However we still execute the icbi on the user address of the start of
> the range we're flushing. On CPUs that also implement KUAP (Power9)
> that leads to the spurious fault above.
> 
> We should be able to pass any address, including a kernel address, to
> the icbi on these CPUs, which would avoid any interaction with KUAP.
> But I don't want to make that change in a bug fix, just in case it
> surfaces some strange behaviour on some CPU.
> 
> So for now just disable KUAP around the icbi. Note the icbi is
> treated
> as a load, so we allow read access, not write as you'd expect.
> 
> Fixes: 890274c2dc4c ("powerpc/64s: Implement KUAP for Radix MMU")
> Cc: stable@vger.kernel.org # v5.2+
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---

Reviewed-by: Russell Currey <ruscur@russell.cc>

