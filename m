Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0333F9593
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 09:54:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwsRV0n6Cz3000
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 17:53:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NOAW2aqX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=NOAW2aqX; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwsQp1qSxz2yJ1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 17:53:21 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GwsQk4qx4z9sPf;
 Fri, 27 Aug 2021 17:53:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1630050800;
 bh=1qUPPOtl/jzP4e2/AHdvpaPrD2MZxD0xpD3UzdwgVjE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NOAW2aqXkoEWDzjXNCSiyLhQVYpvT5hW4QgzQGQ53XVUtDyiS1rJuHBxVvQjlK4l1
 gr+TTJxwGPTwwGkCf07oqB76SlFusHTZ2U/33i4uJjPh6rU3OE/4U6hREBXspqH0jY
 d3NO/aA1+cijuryaUUCPyIUoP3tfisXDXzIfAne0soloI242kUIfW6z6Q32nyfBa75
 QgsA/X8ARZOH0XxbXvWc6wpihPVbNU1UaZdS5Oy4sB/YgrB73zMDLv1E42bIIVE8Ez
 jtP6VV74A8dx03wClHYJWJ/34yEY7AWxTIjJUy2yR694hcWtwZWyvbrTedBYb62XA1
 74LksDsimWHsQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 2/2] powerpc/bug: Provide better flexibility to
 WARN_ON/__WARN_FLAGS() with asm goto
In-Reply-To: <YSgp7HNGXbzrfvFq@Ryzen-9-3900X.localdomain>
References: <b286e07fb771a664b631cd07a40b09c06f26e64b.1618331881.git.christophe.leroy@csgroup.eu>
 <389962b1b702e3c78d169e59bcfac56282889173.1618331882.git.christophe.leroy@csgroup.eu>
 <YSa1O4fcX1nNKqN/@Ryzen-9-3900X.localdomain>
 <87h7fcc2m4.fsf@mpe.ellerman.id.au>
 <YSfjWfGbZbpYBn+w@Ryzen-9-3900X.localdomain>
 <YSgp7HNGXbzrfvFq@Ryzen-9-3900X.localdomain>
Date: Fri, 27 Aug 2021 17:53:12 +1000
Message-ID: <878s0nfhnb.fsf@mpe.ellerman.id.au>
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
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Chancellor <nathan@kernel.org> writes:
> On Thu, Aug 26, 2021 at 11:54:17AM -0700, Nathan Chancellor wrote:
>> On Thu, Aug 26, 2021 at 01:21:39PM +1000, Michael Ellerman wrote:
>> > Nathan Chancellor <nathan@kernel.org> writes:
>> > > On Tue, Apr 13, 2021 at 04:38:10PM +0000, Christophe Leroy wrote:
>> > >> Using asm goto in __WARN_FLAGS() and WARN_ON() allows more
>> > >> flexibility to GCC.
>> > ...
>> > >
>> > > This patch as commit 1e688dd2a3d6 ("powerpc/bug: Provide better
>> > > flexibility to WARN_ON/__WARN_FLAGS() with asm goto") cause a WARN_ON in
>> > > klist_add_tail to trigger over and over on boot when compiling with
>> > > clang:
>> > >
...
>> > 
>> > This patch seems to fix it. Not sure if that's just papering over it though.
>> > 
>> > diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
>> > index 1ee0f22313ee..75fcb4370d96 100644
>> > --- a/arch/powerpc/include/asm/bug.h
>> > +++ b/arch/powerpc/include/asm/bug.h
>> > @@ -119,7 +119,7 @@ __label_warn_on:						\
>> >  								\
>> >  			WARN_ENTRY(PPC_TLNEI " %4, 0",		\
>> >  				   BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
>> > -				   __label_warn_on, "r" (x));	\
>> > +				   __label_warn_on, "r" (!!(x))); \
>> >  			break;					\
>> >  __label_warn_on:						\
>> >  			__ret_warn_on = true;			\
>> > 
>> 
>> Thank you for the in-depth explanation and triage! I have gone ahead and
>> created a standalone reproducer that shows this based on the
>> preprocessed file and opened https://bugs.llvm.org/show_bug.cgi?id=51634
>> so the LLVM developers can take a look.
>
> Based on Eli Friedman's comment in the bug, would something like this
> work and not regress GCC? I noticed that the BUG_ON macro does a cast as
> well. Nick pointed out to me privately that we have run into what seems
> like a similar issue before in commit 6c58f25e6938 ("riscv/atomic: Fix
> sign extension for RV64I").

Yes, I read that comment this morning, and then landed at the same fix
via digging through the history of our bug code.

We in fact fixed a similar bug 16 years ago :}

32818c2eb6b8 ("[PATCH] ppc64: Fix issue with gcc 4.0 compiled kernels")

Which is when we first started adding the cast to long.


> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> index 1ee0f22313ee..35022667f57d 100644
> --- a/arch/powerpc/include/asm/bug.h
> +++ b/arch/powerpc/include/asm/bug.h
> @@ -119,7 +119,7 @@ __label_warn_on:                                            \
>                                                                 \
>                         WARN_ENTRY(PPC_TLNEI " %4, 0",          \
>                                    BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN), \
> -                                  __label_warn_on, "r" (x));   \
> +                                  __label_warn_on, "r" ((__force long)(x)));   \
>                         break;                                  \
>  __label_warn_on:                                               \
>                         __ret_warn_on = true;                   \


Yeah that fixes the clang build for me.

For GCC it seems to generate the same code in the simple cases:

void test_warn_on_ulong(unsigned long b)
{
        WARN_ON(b);
}

void test_warn_on_int(int b)
{
        WARN_ON(b);
}

I get:

0000000000000020 <.test_warn_on_ulong>:
  20:   0b 03 00 00     tdnei   r3,0
  24:   4e 80 00 20     blr
  28:   60 00 00 00     nop
  2c:   60 00 00 00     nop

0000000000000030 <.test_warn_on_int>:
  30:   0b 03 00 00     tdnei   r3,0
  34:   4e 80 00 20     blr

Both before and after the change. So that's good.

For:

void test_warn_on_int_addition(int b)
{
        WARN_ON(b+1);
}

Before I get:

0000000000000040 <.test_warn_on_int_addition>:
  40:   38 63 00 01     addi    r3,r3,1
  44:   0b 03 00 00     tdnei   r3,0
  48:   4e 80 00 20     blr

vs after:

0000000000000040 <.test_warn_on_int_addition>:
  40:   38 63 00 01     addi    r3,r3,1
  44:   7c 63 07 b4     extsw   r3,r3
  48:   0b 03 00 00     tdnei   r3,0
  4c:   4e 80 00 20     blr


So there's an extra sign extension we don't need, but I guess we can
probably live with that.

cheers
