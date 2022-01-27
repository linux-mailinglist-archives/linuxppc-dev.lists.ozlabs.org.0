Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E589549E04E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 12:11:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JkyZM5dQDz3cLN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 22:11:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NQBI3Hex;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JkyYh3xL8z30NW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 22:10:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=NQBI3Hex; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JkyYh3KRGz4xQq;
 Thu, 27 Jan 2022 22:10:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1643281832;
 bh=pT4cb/kI3u6Th4ludHBUFes+GalTPLIocBCrbIhBffk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NQBI3HexnTSXNmmdeznOdsDaIUT3ON6tf/FSyPd8mk8eHRzCsIiaNVGgK4uPiI3Za
 rjt34+dL44W0vKIRPSe72atbOgFfqbCzNaotmOjpt7xV8KGQRR6AXNs8GvwarlXr6S
 ZDpnr3Bl7LUBPuMgVSx0pJD3Ew8NDuzdVMi1WcjqbgqLpCkGdgbtE4DWMFf0sfuqID
 CNqJK24W++Jzv3hCGXXHDLXtsWQZ+hWm53dkgHzV4X8moVJECnY7uW3ifu/dR0p9kL
 Ql2yDcNRfO8eAiAH7esv85cqJuMX5hnW3gtp8jMOB5bvVSYMz0qLgZFpZ8YqwcozF7
 O/BDwTSoq5FCQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Dan Carpenter <dan.carpenter@oracle.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: WARN_ON() is buggy for 32 bit systems
In-Reply-To: <20220126134948.GA1978@kadam>
References: <20220126115616.GY1978@kadam>
 <8bfa7bbe-7343-2d2f-d20b-d4789523c89c@csgroup.eu>
 <20220126134948.GA1978@kadam>
Date: Thu, 27 Jan 2022 22:10:32 +1100
Message-ID: <87y231l9hz.fsf@mpe.ellerman.id.au>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dan Carpenter <dan.carpenter@oracle.com> writes:
> On Wed, Jan 26, 2022 at 12:21:49PM +0000, Christophe Leroy wrote:
>> The code is enclosed in a #ifdef CONFIG_PPC64, it is not used for PPC32:
>> 
>> /arch/powerpc/include/asm/bug.h
>>    99  #ifdef CONFIG_PPC64
>
> Ah...
>
> You know, life would be a lot easier for me personally if we added an
> #ifndef __CHECKER__ as well...  I can't compile PowerPC code so I can't
> test a patch like that.

Ubuntu & Fedora both have cross compilers packaged, or there's cross
compilers on kernel.org. But I assume you mean you'd rather not bother
compiling for powerpc, which is fair enough.

Do you mean something like below?

I'm not sure about that, as it would prevent sparse from checking the
actual BUG_ON code we're using, vs the generic version which we never
use on 64-bit. Is there a smatch specific macro we could check?

cheers


diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 02c08d1492f8..5cbfe9d8232d 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -96,7 +96,7 @@ __label_warn_on:						\
 	break;							\
 } while (0)
 
-#ifdef CONFIG_PPC64
+#if defined(CONFIG_PPC64) && !defined(__CHECKER__)
 #define BUG_ON(x) do {						\
 	if (__builtin_constant_p(x)) {				\
 		if (x)						\



