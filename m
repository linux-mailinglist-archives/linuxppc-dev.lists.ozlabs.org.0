Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9573FD455
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 09:18:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzwQ26xWsz2ymP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 17:18:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OBrNPLMS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=OBrNPLMS; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzwPN5p5wz2xXd
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Sep 2021 17:17:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1630480657;
 bh=/dQxymwNiKkIDn/Vw5+hgsGkv4ijl+N7qYeYs+68+bs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=OBrNPLMSdTKuUlyMWWWiY6PSXxYtZ1lD6Qq4zBKnsEbu8YjVIVGPoZ8KjjAx46xgg
 xrD6qRSvcO5zzLKWJtxUXwLx4sRnaS9H2JSKVEClF1ZQyWGx4GJvdLbDNMD7UhzqKN
 xA+P0XVF17jPzeRNN0K/3hEiYNfr40J+A7851mDm5TGPCRKQ+cttiNPBaFY4BHL9Dw
 NyxFGGtFBp/rYbogLYll/b3weNjfV7/BWtH4vRp9YEhis1fPIP2K+yCYprazB8Gk3n
 ZmZa8iyb034dIg/zPsRwHZCwn90JF6w+jU77OzBWt6EgjwZWa9Xgj7BUBCgdPT/z/G
 smE7Ki7AHsJ2g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GzwPF5tmVz9sCD;
 Wed,  1 Sep 2021 17:17:37 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/bug: Cast to unsigned long before passing to
 inline asm
In-Reply-To: <20210831213432.GF1583@gate.crashing.org>
References: <20210831132720.881643-1-mpe@ellerman.id.au>
 <20210831213432.GF1583@gate.crashing.org>
Date: Wed, 01 Sep 2021 17:17:26 +1000
Message-ID: <87tuj43gu1.fsf@mpe.ellerman.id.au>
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
Cc: nathan@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> On Tue, Aug 31, 2021 at 11:27:20PM +1000, Michael Ellerman wrote:
>> Nathan filed an LLVM bug [2], in which Eli Friedman explained that "if
>> you pass a value of a type that's narrower than a register to an inline
>> asm, the high bits are undefined". In this case we are passing a bool
>> to the inline asm, which is a single bit value, and so the compiler
>> thinks it can leave the high bits of r30 unmasked, because only the
>> value of bit 0 matters.
>> 
>> Because the inline asm compares the full width of the register (32 or
>> 64-bit) we need to ensure the value passed to the inline asm has all
>> bits defined. So fix it by casting to long.
>> 
>> We also already cast to long for the similar case in BUG_ENTRY(), which
>> it turns out was added to fix a similar bug in 2005 in commit
>> 32818c2eb6b8 ("[PATCH] ppc64: Fix issue with gcc 4.0 compiled kernels").
>
> That points to <https://gcc.gnu.org/PR23422>, which shows the correct
> explanation.

That's a pity because I don't understand that explanation ^_^

Why does sign extension matter when we're comparing against zero?

> The code as it was did **not** pass a bool.  It perhaps passed an int
> (so many macros in play, it is hard to tell for sure, but it is int or
> long int, perhaps unsigned (which does not change anything here).

I don't understand that. It definitely is passing a bool at the source
level. Are you saying it's getting promoted somehow?

It expands to:

      asm goto(
              "1:   "
              "tdnei"
              "
              " " % 4,
              0 " "\n " ".section __ex_table,\"a\";"
                                              " "
                                              ".balign 4;"
                                              " "
                                              ".long (1b) - . ;"
                                              " "
                                              ".long (%l[__label_warn_on]) - . ;"
                                              " "
                                              ".previous"
                                              " "
                                              ".section __bug_table,\"aw\"\n"
                                              "2:\t.4byte 1b - 2b, %0 - 2b\n"
                                              "\t.short %1, %2\n"
                                              ".org 2b+%3\n"
                                              ".previous\n"
              :
              : "i"("lib/klist.c"), "i"(62),
                "i"((1 << 0) | ((9) << 8)),
                "i"(sizeof(struct bug_entry)),
                "r"(knode_dead(knode))
                ^^^^^^^^^^^^^^^^^^^^^
              :
              : __label_warn_on);

And knode_dead() returns bool:

  static bool knode_dead(struct klist_node *knode)
  {
  	return (unsigned long)knode->n_klist & KNODE_DEAD;
  }

So in my book that means the type there is bool. But I'm not a compiler
guy so I guessing I'm missing something.

> But td wants a 64-bit register, not a 32-bit one (which are the only two
> possibilities for the "r" constraint on PowerPC).  The cast to "long" is
> fine for powerpc64, but it has nothing to do with "narrower than a
> register".

If it's 32-bit vs 64-bit, and the clang explanation is correct, then
we'd expect the low 32-bits of the value passed to the asm to have the
correct value, ie. have been masked with KNODE_DEAD.

> If this is not the correct explanation for LLVM, it needs to solve some
> other bug.

OK. I just need to get this fixed in the kernel, so I'll do a new
version with a changelog that is ~= "shrug not sure what's going on" and
merge that. Then we can argue about what is really going on later :)

cheeers
