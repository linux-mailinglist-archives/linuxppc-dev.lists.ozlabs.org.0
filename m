Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B9C7AA5F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 02:10:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WJ1HtAjG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsCNF5lHrz3ckG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 10:10:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WJ1HtAjG;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsCMN0q5Tz3cNV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 10:10:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1695341408;
	bh=tanMG9jJ4szQN0Frlry+jc3htu0MpognbIA9IzXLDmg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WJ1HtAjGprT9sOYX9H9F3j3hDGGFuEljj6j8IxiQkwhHmYEE1FZa/AhvPiadqYoJm
	 OVaVBYEhbzS5RO9t74DcEb/MI8XOArY8t1Luhk02UCytoAKNSR4dvl5oEYzbuf8/US
	 1wdlmJb7Zjq5l17wCBTgY+Nya1tA9+fSpjz/mfAlwZ+nLLlLvUTUd9rE0Iw/oTelpg
	 UJqEl8NuqVtXuB69Wp+M6K9BhZQADMao+rHNyeZ/B6FCjKF6/EveUWGbGx8AgA4gi+
	 wrafubMSH1dBU3lnpbgAoVLCdzOMG8rCN6bv6VgSAr3kMWJ2I4sS/Eql60QSwmUsp/
	 ppSj4ZYMCmsRA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RsCMM5W9zz4wy7;
	Fri, 22 Sep 2023 10:10:07 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, <tanyuan@tinylab.org>
Subject: Re: linux-next: Tree for Sep 20 (ppc32: ADB_CUDA Kconfig warning)
In-Reply-To: <fe130d55-7b5e-4444-85ea-c3fbf4eb238d@infradead.org>
References: <20230920133714.351f83f9@canb.auug.org.au>
 <fe130d55-7b5e-4444-85ea-c3fbf4eb238d@infradead.org>
Date: Fri, 22 Sep 2023 10:10:07 +1000
Message-ID: <87il83m5k0.fsf@mail.lhotse>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Randy Dunlap <rdunlap@infradead.org> writes:
> On 9/19/23 20:37, Stephen Rothwell wrote:
>> Hi all,
>> 
>> Changes since 20230919:
>> 
>> The mm tree lost its boot warning.
>> 
>> The drm-misc tree gained a conflict against Linus' tree.
>> 
>> Non-merge commits (relative to Linus' tree): 6006
>>  3996 files changed, 459968 insertions(+), 111742 deletions(-)
>> 
>> ----------------------------------------------------------------------------
>
> 4 out of 10 randconfigs have this warning:
>
> WARNING: unmet direct dependencies detected for ADB_CUDA
>   Depends on [n]: MACINTOSH_DRIVERS [=n] && (ADB [=n] || PPC_PMAC [=y]) && !PPC_PMAC64 [=n]
>   Selected by [y]:
>   - PPC_PMAC [=y] && PPC_BOOK3S [=y] && CPU_BIG_ENDIAN [=y] && POWER_RESET [=y] && PPC32 [=y]
>
> WARNING: unmet direct dependencies detected for ADB_CUDA
>   Depends on [n]: MACINTOSH_DRIVERS [=n] && (ADB [=n] || PPC_PMAC [=y]) && !PPC_PMAC64 [=n]
>   Selected by [y]:
>   - PPC_PMAC [=y] && PPC_BOOK3S [=y] && CPU_BIG_ENDIAN [=y] && POWER_RESET [=y] && PPC32 [=y]
>
> WARNING: unmet direct dependencies detected for ADB_CUDA
>   Depends on [n]: MACINTOSH_DRIVERS [=n] && (ADB [=n] || PPC_PMAC [=y]) && !PPC_PMAC64 [=n]
>   Selected by [y]:
>   - PPC_PMAC [=y] && PPC_BOOK3S [=y] && CPU_BIG_ENDIAN [=y] && POWER_RESET [=y] && PPC32 [=y]

Crud. Caused by:

a3ef2fef198c ("powerpc/32: Add dependencies of POWER_RESET for pmac32")

I was suspicious of that select, I should have been *more* suspicious :)

I think this is a fix. The PPC32 isn't needed because ADB depends on (PPC_PMAC && PPC32).

diff --git a/arch/powerpc/platforms/powermac/Kconfig b/arch/powerpc/platforms/powermac/Kconfig
index 8bdae0caf21e..84f101ec53a9 100644
--- a/arch/powerpc/platforms/powermac/Kconfig
+++ b/arch/powerpc/platforms/powermac/Kconfig
@@ -2,7 +2,7 @@
 config PPC_PMAC
        bool "Apple PowerMac based machines"
        depends on PPC_BOOK3S && CPU_BIG_ENDIAN
-       select ADB_CUDA if POWER_RESET && PPC32
+       select ADB_CUDA if POWER_RESET && ADB
        select MPIC
        select FORCE_PCI
        select PPC_INDIRECT_PCI if PPC32

cheers
