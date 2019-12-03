Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A5D10FE63
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 14:07:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S2MH56CszDqVH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 00:07:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S2J04VlyzDqTm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 00:04:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="VBhQwAU2"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47S2Hy2kcFz9sP6;
 Wed,  4 Dec 2019 00:04:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1575378271;
 bh=Nb1I9Pw4Szleb7pQzOoCNntR4NmjasZkWR6215KZoeI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VBhQwAU2RS2Ewhqy2KlM6E10NtjSthPAasmSLU+RkJFX7//4mrqv74pUM4/ofqNQ3
 ZC9ISHXUQHIFFbZQeN5i0fYnKIh+13l8bjQR3xLYJUJdSuoe+9yZvzWHwZCcdOoKdA
 //KzKkt1OJ/2PorwwFq8mq3p6cROt5yG1wKgrhynNsHYXTh9ZPbltfeCf+J7rnG+w9
 0T3A+Na9X68SH2/KQYzKdPJqQbFNFKh9hy+05OL+7Vv14arO1NF0bECZ42dh378jzF
 VZ+2teRZoErfmscL+xbTCpPYutJP1cehQE158vObnpL1ON2Y6SVoXK7FUg9WRW42Wx
 TaerOje4++O5A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Marco Elver <elver@google.com>, Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH v2 1/2] kasan: support instrumented bitops combined with
 generic bitops
In-Reply-To: <CANpmjNN-=F6GK_jHPUx8OdpboK7nMV=i=sKKfSsKwKEHnMTG0g@mail.gmail.com>
References: <20190820024941.12640-1-dja@axtens.net>
 <877e6vutiu.fsf@dja-thinkpad.axtens.net>
 <878sp57z44.fsf@dja-thinkpad.axtens.net>
 <CANpmjNOCxTxTpbB_LwUQS5jzfQ_2zbZVAc4nKf0FRXmrwO-7sA@mail.gmail.com>
 <87a78xgu8o.fsf@dja-thinkpad.axtens.net>
 <87y2wbf0xx.fsf@dja-thinkpad.axtens.net>
 <CANpmjNN-=F6GK_jHPUx8OdpboK7nMV=i=sKKfSsKwKEHnMTG0g@mail.gmail.com>
Date: Wed, 04 Dec 2019 00:04:23 +1100
Message-ID: <87r21lef1k.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 the arch/x86 maintainers <x86@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 kasan-dev <kasan-dev@googlegroups.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Marco Elver <elver@google.com> writes:
> On Wed, 20 Nov 2019 at 08:42, Daniel Axtens <dja@axtens.net> wrote:
>>
>> > But the docs do seem to indicate that it's atomic (for whatever that
>> > means for a single read operation?), so you are right, it should live in
>> > instrumented-atomic.h.
>>
>> Actually, on further inspection, test_bit has lived in
>> bitops/non-atomic.h since it was added in 4117b02132d1 ("[PATCH] bitops:
>> generic __{,test_and_}{set,clear,change}_bit() and test_bit()")
>>
>> So to match that, the wrapper should live in instrumented-non-atomic.h
>> too.
>>
>> If test_bit should move, that would need to be a different patch. But I
>> don't really know if it makes too much sense to stress about a read
>> operation, as opposed to a read/modify/write...
>
> That's fair enough. I suppose this can stay where it is because it's
> not hurting anyone per-se, but the only bad thing about it is that
> kernel-api documentation will present test_bit() in non-atomic
> operations.

I only just noticed this thread as I was about to send a pull request
for these two commits.

I think I agree that test_bit() shouldn't move (yet), but I dislike that
the documentation ends up being confusing due to this patch.

So I'm inclined to append or squash in the patch below, which removes
the new headers from the documentation. The end result is the docs look
more or less the same, just the ordering of some of the functions
changes. But we don't end up with test_bit() under the "Non-atomic"
header, and then also documented in Documentation/atomic_bitops.txt.

Thoughts?

cheers


diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
index 2caaeb55e8dd..4ac53a1363f6 100644
--- a/Documentation/core-api/kernel-api.rst
+++ b/Documentation/core-api/kernel-api.rst
@@ -57,21 +57,12 @@ The Linux kernel provides more basic utility functions.
 Bit Operations
 --------------
 
-Atomic Operations
-~~~~~~~~~~~~~~~~~
-
 .. kernel-doc:: include/asm-generic/bitops/instrumented-atomic.h
    :internal:
 
-Non-atomic Operations
-~~~~~~~~~~~~~~~~~~~~~
-
 .. kernel-doc:: include/asm-generic/bitops/instrumented-non-atomic.h
    :internal:
 
-Locking Operations
-~~~~~~~~~~~~~~~~~~
-
 .. kernel-doc:: include/asm-generic/bitops/instrumented-lock.h
    :internal:
 
