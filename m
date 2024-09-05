Return-Path: <linuxppc-dev+bounces-1053-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F3B96D828
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 14:18:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzz19035Gz2ytg;
	Thu,  5 Sep 2024 22:18:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725538732;
	cv=none; b=bRQZlFUo9FqojOVY0CuBOvo377CcV3d7Dps33sJUPdzGPLUfuamFVGKmTHsP7x9l9UM7xlOdyRwqrKSpdXNvOJD+bYTc+uxIaZ+oPWvTurj4+zzlWcQgrqe+hiyBQ0HtAW9fvuf/UnbpdGzzAK7aR5Q0ok60xXdZ7kU8pxy9z7O8TPaW5wsIWBJEpaEBtbEC3LoVP50+8fOiCv3QU0lhg0voDsgFS6rc/O0nCBbM2bXQXOJxPs7MOmGKgrOXWthSoXCUJZjgitieTacYSUPNr+QZ4eTrgoCMYjsRPdcAJo958NQC9x6gdu2zOeOuMv1gE2n4lj3OFLGoOR/tT6Aodw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725538732; c=relaxed/relaxed;
	bh=uHtMyZ0mGdGut63ipl9pSNEPhg4gQFAZt25TdNzawnM=;
	h=DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type; b=OqUm5pxAMXirC1Q7eAHFF5bThOR9u8rPLgJPiZ/v1V/fU/DH9hdmubpz8QYcmPHH9OX7VqQqpZENpnGdU28xpz+twiKzEKjEpNPd9DqsxF6wZfOCJzVYYjqtiZrYJEFZqVJLO9l7IzB8m0BHkF64yItY1hn32tGpD4XV0mUUTccpJxcYnKo/oKSFNlcaMSBQH1NhRJZiAhncLA1lrX5PK4of3TmUs1E7Y+B93ojt3Pwk156YgkC0VM50LYRX/XNIrDp+RDIuzoQ425U9Yazjq/mzc0iVMW7y1/EfmniZyjpSIpSxB/TQtAnekUzOWrTyD3j/IqmR/BUQn+umrS5cFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=K9RNtijG; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=K9RNtijG;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wzz1731rqz2yjN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 22:18:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725538726;
	bh=uHtMyZ0mGdGut63ipl9pSNEPhg4gQFAZt25TdNzawnM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=K9RNtijGnQSSSovlUF+85A4m8nKayeSvx/Ob0UZe5MJZyqYtM2pQp+6L4nOcFBaL8
	 BMvvg2k7bpp41TQpyqsAUXWRf9BykbfFXJDdQCMgNnVRzMXGqdYM3Sm6ZG58e+Zzi8
	 xqDI/zBSXPr5VH16d77RzHiYS8QQhrpNG+LVTWOYc8PJiopRQ7aKFTBzvlaxwbnjCz
	 6ss+QYEqmuStkZsohKp2idavtqXQSJWsED2PrAQKG3qsuvIpbAmxC3YKMYwXrruEr9
	 LEfLpNhWcsB0I1NH6JCVZcsdgJSq7qa1g0AzaMpAXveSikpyikaPbous9gKJoszvTM
	 yYb9S47fFXRUg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wzz0y4N1Rz4w2Q;
	Thu,  5 Sep 2024 22:18:42 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Cc: Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Shuah
 Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org, Adhemerval Zanella
 <adhemerval.zanella@linaro.org>, Xi Ruoyao <xry111@xry111.site>
Subject: Re: [PATCH v5 0/5] Wire up getrandom() vDSO implementation on powerpc
In-Reply-To: <Zthr1nB_RJ56YD3O@zx2c4.com>
References: <cover.1725304404.git.christophe.leroy@csgroup.eu>
 <Zthr1nB_RJ56YD3O@zx2c4.com>
Date: Thu, 05 Sep 2024 22:18:40 +1000
Message-ID: <87frqe5m5b.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:
> Hi Christophe, Michael,
>
> On Mon, Sep 02, 2024 at 09:17:17PM +0200, Christophe Leroy wrote:
>> This series wires up getrandom() vDSO implementation on powerpc.
>> 
>> Tested on PPC32 on real hardware.
>> Tested on PPC64 (both BE and LE) on QEMU:
>> 
>> Performance on powerpc 885:
>> 	~# ./vdso_test_getrandom bench-single
>> 	   vdso: 25000000 times in 62.938002291 seconds
>> 	   libc: 25000000 times in 535.581916866 seconds
>> 	syscall: 25000000 times in 531.525042806 seconds
>> 
>> Performance on powerpc 8321:
>> 	~# ./vdso_test_getrandom bench-single
>> 	   vdso: 25000000 times in 16.899318858 seconds
>> 	   libc: 25000000 times in 131.050596522 seconds
>> 	syscall: 25000000 times in 129.794790389 seconds
>> 
>> Performance on QEMU pseries:
>> 	~ # ./vdso_test_getrandom bench-single
>> 	   vdso: 25000000 times in 4.977777162 seconds
>> 	   libc: 25000000 times in 75.516749981 seconds
>> 	syscall: 25000000 times in 86.842242014 seconds
>
> Looking good. I have no remaining nits on this patchset; it looks good
> to me.
>
> A review from Michael would be nice though (in addition to the necessary
> "Ack" I need to commit this to my tree), because there are a lot of PPC
> particulars that I don't know enough about to review properly. For
> example, you use -ffixed-r30 on PPC64. I'm sure there's a good reason
> for this, but I don't know enough to assess it. And cvdso_call I have no
> idea what's going on. Etc.
 
It all looks good to me, and has survived some testing. Let's get it
merged and get some wider test coverage.

There is an existing comment in the a/p/vdso/Makefile about the
fixed-r30 thing, tldr is it's a workaround to avoid breaking old
versions of Go.

For the series:

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

If you can include Maddy's test results from Power9 in the change log
for patch 5 that'd be nice.

cheers

