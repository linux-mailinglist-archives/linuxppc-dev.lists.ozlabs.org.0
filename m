Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F04FE3A8EDF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 04:37:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4Tqh4fyrz3bwp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 12:37:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NZzhBvT3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=NZzhBvT3; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4TqG3Nhhz2yQw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 12:37:14 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G4TqD69pYz9sX2;
 Wed, 16 Jun 2021 12:37:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1623811033;
 bh=lA6UO9NxGGPOC1a5HOGjw4Q7bzdLNOudpAIg0k6A/lA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NZzhBvT3qJnsyG3TF2/OsF7bfFluITDaef/BYo/dZnyohI9jjLrbtyVUlgOobe1+4
 hlsPxfzxJiPmmtb91sfrJ3sRmdjMPnV/OuDHNjNz8ToFUPV+Iq5c9xVMRy/s7d5dkR
 F/k/ytclvbCpwU8BsWwsXS2Z/URD+PWX2uPxj+41nWtNZB/1zQzxnx0tVwPx3JYZkG
 Br3kcyzI/PKmXudnq60Gband1tHmhmfVqJzMMcsRAzkpgJkVp4QyokJ/3ezmAHa1WY
 d8+vyH7leVzdEQEUGPny8kRx7FBmWkjY7N6O/UYP3/mSQlbQxyiohrBN9ZlRPg6n4t
 259C4wLfTLpbA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jessica Yu <jeyu@kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 1/2] module: add elf_check_module_arch for module
 specific elf arch checks
In-Reply-To: <YMiaZOqhHck9iy0n@p200300cbcf109700df096d564fe976c3.dip0.t-ipconnect.de>
References: <20210611093959.821525-1-npiggin@gmail.com>
 <20210611093959.821525-2-npiggin@gmail.com>
 <YMdGWjBOmcstBwOl@p200300cbcf109700df096d564fe976c3.dip0.t-ipconnect.de>
 <1623722110.amu32mwaqs.astroid@bobo.none>
 <YMiaZOqhHck9iy0n@p200300cbcf109700df096d564fe976c3.dip0.t-ipconnect.de>
Date: Wed, 16 Jun 2021 12:37:12 +1000
Message-ID: <87v96esffr.fsf@mpe.ellerman.id.au>
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
Cc: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jessica Yu <jeyu@kernel.org> writes:
> +++ Nicholas Piggin [15/06/21 12:05 +1000]:
>>Excerpts from Jessica Yu's message of June 14, 2021 10:06 pm:
>>> +++ Nicholas Piggin [11/06/21 19:39 +1000]:
>>>>The elf_check_arch() function is used to test usermode binaries, but
>>>>kernel modules may have more specific requirements. powerpc would like
>>>>to test for ABI version compatibility.
>>>>
>>>>Add an arch-overridable function elf_check_module_arch() that defaults
>>>>to elf_check_arch() and use it in elf_validity_check().
>>>>
>>>>Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>>>[np: split patch, added changelog]
>>>>Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>>---
>>>> include/linux/moduleloader.h | 5 +++++
>>>> kernel/module.c              | 2 +-
>>>> 2 files changed, 6 insertions(+), 1 deletion(-)
>>>>
>>>>diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
>>>>index 9e09d11ffe5b..fdc042a84562 100644
>>>>--- a/include/linux/moduleloader.h
>>>>+++ b/include/linux/moduleloader.h
>>>>@@ -13,6 +13,11 @@
>>>>  * must be implemented by each architecture.
>>>>  */
>>>>
>>>>+// Allow arch to optionally do additional checking of module ELF header
>>>>+#ifndef elf_check_module_arch
>>>>+#define elf_check_module_arch elf_check_arch
>>>>+#endif
>>>
>>> Hi Nicholas,
>>>
>>> Why not make elf_check_module_arch() consistent with the other
>>> arch-specific functions? Please see module_frob_arch_sections(),
>>> module_{init,exit}_section(), etc in moduleloader.h. That is, they are
>>> all __weak functions that are overridable by arches. We can maybe make
>>> elf_check_module_arch() a weak symbol, available for arches to
>>> override if they want to perform additional elf checks. Then we don't
>>> have to have this one-off #define.

>>Like this? I like it. Good idea.
>
> Yeah! Also, maybe we can alternatively make elf_check_module_arch() a
> separate check entirely so that the powerpc implementation doesn't
> have to include that extra elf_check_arch() call. Something like this maybe?

My thinking for making elf_check_module_arch() the only hook was that
conceivably you might not want/need to call elf_check_arch() from
elf_check_module_arch().

So having a single module specific hook allows arch code to decide
how to implement the check, which may or may not involve calling
elf_check_arch(), but that becomes an arch implementation detail.

It's also one arch hook instead of two (although elf_check_arch()
already exists).

But I don't feel that strongly either way, whatever you prefer.

cheers
