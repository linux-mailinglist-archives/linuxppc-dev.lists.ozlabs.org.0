Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7B48A9320
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 08:33:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UpYxncQ7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKnzS4yFxz3d4L
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 16:33:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UpYxncQ7;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKnym6tV3z3btX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Apr 2024 16:33:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713421984;
	bh=Os3n75joztuZwb7Uo98ZK8zUHbtnDL2bSCbwHpOcZE4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UpYxncQ7XHP+jss1hZdkT5vMaxWi3UsZZtID/xtfljbj+dZWc2jBahOY2aXHfD8y/
	 RVsJRnN7oRlQ51KLRItu4vVMzvHZuDSBlkXS2vaa0kLCo0FNzJDORHCGtohKi/qiq2
	 O6Y3sB4pjJIKSL+WOdB+MPmuObWgwilq8rQFQIwrB1sqNBG7wj0xvmApVHx7J6xxz2
	 MfSgJr2XjXJrJ9ZSMOm6Ti10tkZS3ejgm15X9sf+rIjEWWXpUVJ0XmA/4yCUKnhR9/
	 6oxerVLHbTcaMiW2Qnfget/zDJ5DS+tRK6pFBaW6lVpH9PuNyfFHDPRPhH6lHPR6ra
	 6I3EG15SaNS2g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VKnym2YSCz4wcR;
	Thu, 18 Apr 2024 16:33:04 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] powerpc: drop port I/O helpers for CONFIG_HAS_IOPORT=n
In-Reply-To: <878r1bb2zj.fsf@mail.lhotse>
References: <20240416153331.1617772-1-arnd@kernel.org>
 <878r1bb2zj.fsf@mail.lhotse>
Date: Thu, 18 Apr 2024 16:33:04 +1000
Message-ID: <875xwfb2ov.fsf@mail.lhotse>
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
Cc: Nathan Chancellor <nathan@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Naresh Kamboju <naresh.kamboju@linaro.org>, clang-built-linux <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Jeff Xu <jeffxu@chromium.org>, Baoquan He <bhe@redhat.com>, "Mike Rapoport \(IBM\)" <rppt@kernel.org>, Justin Stitt <justinstitt@google.com>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Dan Carpenter <dan.carpenter@linaro.org>, Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Arnd Bergmann <arnd@kernel.org> writes:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> Calling inb()/outb() on powerpc when CONFIG_PCI is disabled causes
>> a NULL pointer dereference, which is bad for a number of reasons.
>>
>> After my patch to turn on -Werror in linux-next, this caused a
>> compiler-time warning with clang:
>>
>> In file included from arch/powerpc/include/asm/io.h:672:
>> arch/powerpc/include/asm/io-defs.h:43:1: error: performing pointer
>> arithmetic on a null pointer has undefined behavior
>> [-Werror,-Wnull-pointer-arithmetic]
>>    43 | DEF_PCI_AC_NORET(insb, (unsigned long p, void *b, unsigned long c),
>>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    44 |                  (p, b, c), pio, p)
>>       |                  ~~~~~~~~~~~~~~~~~~
>>
>> In this configuration, CONFIG_HAS_IOPORT is already disabled, and all
>> drivers that use inb()/outb() should now depend on that (some patches are
>> still in the process of getting marged).
>>
>> Hide all references to inb()/outb() in the powerpc code and the definitions
>> when HAS_IOPORT is disabled to remove the possible NULL pointer access.
>> The same should happin in asm-generic in the near future, but for now
>> the empty inb() macros are still defined to ensure the generic version
>> does not get pulled in.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>> --
>
> This needs a small fixup:

Well, only because my tree doesn't have f0a816fb12da ("/dev/port: don't compile file operations without CONFIG_DEVPORT").

cheers
