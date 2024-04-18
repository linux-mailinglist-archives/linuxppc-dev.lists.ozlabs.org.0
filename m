Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8B48A9AAF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 15:02:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=q9TFzCh7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKybm2Vhqz3cT2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 23:02:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=q9TFzCh7;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKyZy2lQzz3cFw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Apr 2024 23:01:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713445289;
	bh=vNeZ/qdX3LOH0LHZJhAOcqMpEwfgHMqhf2DU3H1Xszg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=q9TFzCh7EhJg+m9fj6qudX6Ks+Uct3uWBknTCV37uU8cbakd81QmCpmVRG0NOIxQ5
	 uNQKi+KMBjdkP9ELAPneTQiXG4RWeLhPSORHg+e8+iojKQsMo6Vww7EZd4Vo8nYxXj
	 i9C+ou7rNcmrbkiJh9KKLdHzBGmSWTBXLplv230qwENBOzJZa0EmJhDvcx7MlY6f+x
	 Kxij9OwVQI817aMiTT0xC/Q13B2je9ictqe0EMnSezFUNR9C4h+0VWvJD9vykrSyNe
	 Xx2VRrYHX09AAOcTymVN0OEteduzRVIKXU3HOEjff+X4D+7mpxgl26SJk8w/e/NwSp
	 b5yKqkqbp1D7w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VKyZw5zyrz4wyx;
	Thu, 18 Apr 2024 23:01:28 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] powerpc: drop port I/O helpers for CONFIG_HAS_IOPORT=n
In-Reply-To: <59473eb6-1707-4bbf-85a3-ba4835f3ee7f@app.fastmail.com>
References: <20240416153331.1617772-1-arnd@kernel.org>
 <878r1bb2zj.fsf@mail.lhotse>
 <59473eb6-1707-4bbf-85a3-ba4835f3ee7f@app.fastmail.com>
Date: Thu, 18 Apr 2024 23:01:25 +1000
Message-ID: <8734ribza2.fsf@mail.lhotse>
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
Cc: Nathan Chancellor <nathan@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, Kees Cook <keescook@chromium.org>, Baoquan He <bhe@redhat.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Naresh Kamboju <naresh.kamboju@linaro.org>, clang-built-linux <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Jeff Xu <jeffxu@chromium.org>, Mike Rapoport <rppt@kernel.org>, Justin Stitt <justinstitt@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Dan Carpenter <dan.carpenter@linaro.org>, Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Arnd Bergmann" <arnd@arndb.de> writes:
> On Thu, Apr 18, 2024, at 08:26, Michael Ellerman wrote:
>> Arnd Bergmann <arnd@kernel.org> writes:
>
>> @@ -692,6 +692,7 @@ static inline void name at                          
>>         \
>>  #define writesw writesw
>>  #define writesl writesl
>>
>> +#ifdef CONFIG_HAS_IOPORT
>>  #define inb inb
>>  #define inw inw
>>  #define inl inl
>> @@ -704,6 +705,8 @@ static inline void name at                          
>>         \
>>  #define outsb outsb
>>  #define outsw outsw
>>  #define outsl outsl
>> +#endif // CONFIG_HAS_IOPORT
>> +
>>  #ifdef __powerpc64__
>>  #define readq  readq
>>  #define writeq writeq
>
> I had included this at first, but then I still ran into
> the same warnings because it ends up pulling in the
> generic outsb() etc from include/asm-generic/io.h
> that relies on setting a non-NULL PCI_IOBASE.

Yes you're right. The above fixes the gcc build, but not clang.

So I think I'll just cherry pick f0a816fb12da ("/dev/port: don't compile
file operations without CONFIG_DEVPORT") into my next and then apply
this. But will see if there's any other build failures over night.

cheers
