Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E487CD39D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 07:46:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=d1oLsQWa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9KZt1m0Mz3c5K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 16:45:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=d1oLsQWa;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9KYz72C8z30GC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Oct 2023 16:45:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697607908;
	bh=jEMGmsqnX42FAZ64bE0bI5gIb6YEbZEDPZf6ed21XIQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=d1oLsQWa8PhsFwKC2RL9WYiF9vFEBtKHn+8cJ22Hw9aqArlp8PsKyRHXs+zgJ47Rc
	 Vwmy5ysWnj2gbn1YSyHqY6I83jxYV0Ilw8bTDJqvPNsqb6NXfajtfKjUxlBkzhx+US
	 Suu/hSl+FLgh73SFUKqbXsDWSbTyWrBN6+OfUBdql+L++qQoJuR8kSnx7F/du1IROA
	 gG74HNuPS+QepadlFTsOdcUQsP9sGVjBsvYTqeVh7g7zNGwmlS1NTIPfq6XFoXj8vg
	 4uwHtMkzy1fKyKHfGkDdceV4HHA+xQYyUg+osFoPTgzjvqdITZ9Xd5lxsxbyvKgpBf
	 nvQRc6uscVgZg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S9KYv6kkTz4xM1;
	Wed, 18 Oct 2023 16:45:07 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: [Bisected] PowerMac G5 fails booting kernel 6.6-rc3 (BUG:
 Unable to handle kernel data access at 0xfeffbb62ffec65fe)
In-Reply-To: <20231018010108.22dc1211@yea>
References: <20230929132750.3cd98452@yea> <87lec8qd8b.fsf@mail.lhotse>
 <20231012164903.0ee6c1e1@yea> <875y35zzjy.fsf@mail.lhotse>
 <20231018010108.22dc1211@yea>
Date: Wed, 18 Oct 2023 16:45:04 +1100
Message-ID: <8734y8zdpb.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, willy@infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Erhard Furtner <erhard_f@mailbox.org> writes:
> On Tue, 17 Oct 2023 14:40:49 +1100
> Michael Ellerman <mpe@ellerman.id.au> wrote:
>
>> I think I've reproduced the crash on my Quad G5 by using your config
>> with some things tweaked, but I don't get any output on the screen :/
>
> You could try PPC_EARLY_DEBUG=y with PPC_EARLY_DEBUG_BOOTX or PPC_EARLY_DEBUG_G5.

I have tried PPC_EARLY_DEBUG_BOOTX but it didn't help :/

>> Do you mind booting the commit above and taking a photo of the oops and
>> attach it here. The oops you transcribed didn't entirely make sense,
>> probably due to a typo here or there, so a photo would be best.
>> 
>> cheers
>
> No problem. Just thought transcribing the photo would make more sense
> for a mailing list. ;) But maybe some subtle errors slept crept in.
> Attached are 2 photos from the issue on current v6.6-rc6.

Thanks. Yeah text is generally better, it archives better and can be
grepped etc. but in this case I was going a bit mad trying to make sense
of the oops :)

In hindsight the bug is an obvious boot time ordering problem, can you
confirm this fixes it. That should apply on top of Linus' current
master.

cheers

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 2f1026fba00d..71f16fb32ceb 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -948,6 +948,7 @@ void __init setup_arch(char **cmdline_p)
 
 	/* Parse memory topology */
 	mem_topology_setup();
+	set_max_mapnr(max_pfn);
 
 	/*
 	 * Release secondary cpus out of their spinloops at 0x60 now that
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 8b121df7b08f..07e8f4f1e07f 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -288,7 +288,6 @@ void __init mem_init(void)
 #endif
 
 	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
-	set_max_mapnr(max_pfn);
 
 	kasan_late_init();
 
