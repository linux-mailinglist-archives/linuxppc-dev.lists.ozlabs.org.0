Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C5E8AA7E3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 07:13:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BuDsMaCr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLN8m0wzMz3cYy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 15:13:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BuDsMaCr;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLN821wl2z3bqB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 15:13:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713503582;
	bh=kKJbHRkyLHBaxd0WzWWbPlJiRCeUkrJqnmVheMKFAs8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BuDsMaCrIPoMUPy5N7wfOxpl9Q7/pGYp4Sl8j2DC2jVZ5CcGvulsbeS4mEdlPHaQj
	 JxFVWgcvjAnVgg/68Ew8uK3o4C9UJgpkdWIF12waMjhr7fFcfoHNBZJuaadQLDjZCW
	 xBPIQ30XChhLhDOsIQkiYGsU+f6iPH6bQ2ckBJbzRI+rGjD1NU5yOrCOTZdup7ba6/
	 gYeoT4OUck4v4i3UKzsilII1+q+bOUbW43KKDWw86IHGM+jxbHTcghrrGHvrQmxsY6
	 rYA0ZN5w5jAbdMJVRTkTZjovEXhlxtmSNfxIS8gqhuPxs9xNBkMCo5gR1UbcWYgCg/
	 uI8piTbVvl/Qg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VLN7x53gbz4wnr;
	Fri, 19 Apr 2024 15:13:01 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] powerpc: drop port I/O helpers for CONFIG_HAS_IOPORT=n
In-Reply-To: <8734ribza2.fsf@mail.lhotse>
References: <20240416153331.1617772-1-arnd@kernel.org>
 <878r1bb2zj.fsf@mail.lhotse>
 <59473eb6-1707-4bbf-85a3-ba4835f3ee7f@app.fastmail.com>
 <8734ribza2.fsf@mail.lhotse>
Date: Fri, 19 Apr 2024 15:12:58 +1000
Message-ID: <87wmou9bqd.fsf@mail.lhotse>
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

Michael Ellerman <mpe@ellerman.id.au> writes:
> "Arnd Bergmann" <arnd@arndb.de> writes:
>> On Thu, Apr 18, 2024, at 08:26, Michael Ellerman wrote:
>>> Arnd Bergmann <arnd@kernel.org> writes:
>>
>>> @@ -692,6 +692,7 @@ static inline void name at                          
>>>         \
>>>  #define writesw writesw
>>>  #define writesl writesl
>>>
>>> +#ifdef CONFIG_HAS_IOPORT
>>>  #define inb inb
>>>  #define inw inw
>>>  #define inl inl
>>> @@ -704,6 +705,8 @@ static inline void name at                          
>>>         \
>>>  #define outsb outsb
>>>  #define outsw outsw
>>>  #define outsl outsl
>>> +#endif // CONFIG_HAS_IOPORT
>>> +
>>>  #ifdef __powerpc64__
>>>  #define readq  readq
>>>  #define writeq writeq
>>
>> I had included this at first, but then I still ran into
>> the same warnings because it ends up pulling in the
>> generic outsb() etc from include/asm-generic/io.h
>> that relies on setting a non-NULL PCI_IOBASE.
>
> Yes you're right. The above fixes the gcc build, but not clang.
>
> So I think I'll just cherry pick f0a816fb12da ("/dev/port: don't compile
> file operations without CONFIG_DEVPORT") into my next and then apply
> this. But will see if there's any other build failures over night.

That didn't work. Still lots of drivers in my tree (based on rc2) which
use inb/outb etc, and barf on the empty #define inb.

So I think this patch needs to wait until all the CONFIG_HAS_IOPORT
checks have been merged for various drivers.

For now the below fixes the clang warning. AFAICS it's safe because any
code using inb() etc. with CONFIG_PCI=n is currently just doing a plain
load from virtual address ~zero which should fault anyway.

cheers


diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 08c550ed49be..1cd6eb6c8101 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -37,7 +37,7 @@ extern struct pci_dev *isa_bridge_pcidev;
  * define properly based on the platform
  */
 #ifndef CONFIG_PCI
-#define _IO_BASE       0
+#define _IO_BASE       POISON_POINTER_DELTA
 #define _ISA_MEM_BASE  0
 #define PCI_DRAM_OFFSET 0
 #elif defined(CONFIG_PPC32)
