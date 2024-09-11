Return-Path: <linuxppc-dev+bounces-1253-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0F5975471
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 15:50:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3hlh22yTz2xrv;
	Wed, 11 Sep 2024 23:50:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726062608;
	cv=none; b=gUXM0HSl8xmpiVAKNFPbLZyUHTK/ni8aU6CoLEkpN0Zv4Ytk/Sb7Zm0Bxb/nyF60iCsvqpmySqGIeekSKah1TBP0JL03ejRvtbdnhEtT4mrYohTwsM4O4IotIqxkjSO5lpddI/w4C6dHbqL3V3ikKPdW0+6OvPg59JC8OArr1moWLOGBBPCRQ6ifoPWnnJMHmZuU8vJOqcmbzJXyycofmaMj4MVGa5i0T3vHajZqn0AR0F+if3/Y9XKhOQyK13HgmLLwLBn2WZ2DCSslJDfLXq/FvnXdU6mSLgIVw3ogp/0EPjHrMPyv15VRbDF1zHn1Dpl0yYX1Ok9K1j27G31Tyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726062608; c=relaxed/relaxed;
	bh=lpBzbgWttHYkkQ41sscZ0OOoe2UyQs048+I1EnGEnbs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Gp9kDGgZheQoDcf4K1BNg+jXHjJVtdSxwQwlm4Z96j8DYq0lKD2/IAFLtQ56RxWKRYJc9vYmdM/yZcrNU8Sw5TZMah24sUAaMRpK0jUit8KgpW8VFXX82OI2vS1rOO38Zs33WbNi9IWIArdyuvhXNhRlSAetkZAHuNSW5rSJMecBeFRd+Vy2QHBpMtuPdyNpmrY2J7eR8uEPMDboeDb4yJAAXPG7DlLVA7O0r1t74SxBS2xfmIiyqWBB3HddvyWiW5evV7xyA+T/G0Snu/NJH8p2/jXbYgSSrlwi3rkEjCvYJOckF3iqnuO9v1j1UuerDXZyyNEKMC0rAmbyVh/NyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=b6rCWOCp; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=b6rCWOCp;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3hlh1nr9z2xcs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 23:50:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726062608;
	bh=lpBzbgWttHYkkQ41sscZ0OOoe2UyQs048+I1EnGEnbs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=b6rCWOCpsR6QTZU68icEH6ah28jcqnXyKEGoUH0ohvJRhp/Mm3QMMNf7cz1PRZVJk
	 qZnhrbEZQSdtE52b5m7L8yLtR87aHqZ9Y3U05UdXnLFYWT6W/Gva4cteQod4+pDscF
	 iq9WFey+WYHFyzKGuoKHndEZ0KUL/iVZ82dFsXKNk1jKIZA3FOkaV87mvcYAUlbhmC
	 QSm0f+2sovoKzmv6FOXBVgqAL9iWpzg6XychwCtrVghD79R/XByY5tXAMuIaTpHV5g
	 0oMsPLM4pI21UqirAlt8h43LH7OPXzxNCN5RDMbPbQlnnQRUFay141JPyB1XvhsCzO
	 l8YWjW9+O5+hg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3hlf1JyWz4x8D;
	Wed, 11 Sep 2024 23:50:06 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@arndb.de>, Charlie Jenkins <charlie@rivosinc.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta
 <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, guoren
 <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge
 Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
 <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker
 <dalias@libc.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, "David S . Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, shuah
 <shuah@kernel.org>, Christoph Hellwig <hch@infradead.org>, Michal Hocko
 <mhocko@suse.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, Chris
 Torek <chris.torek@gmail.com>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
In-Reply-To: <89d21669-8daa-4225-b6d2-33d439ebd746@app.fastmail.com>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <58f39d58-579e-4dd3-8084-baebf86f1ae0@lucifer.local>
 <7be08ea9-f343-42da-805f-e5f0d61bde26@app.fastmail.com>
 <016c7857-9ea8-4333-96e6-3ae3870f375f@lucifer.local>
 <Zt+DGHZrHFxfq7xo@ghost>
 <89d21669-8daa-4225-b6d2-33d439ebd746@app.fastmail.com>
Date: Wed, 11 Sep 2024 23:50:05 +1000
Message-ID: <87zfoeqoz6.fsf@mail.lhotse>
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

"Arnd Bergmann" <arnd@arndb.de> writes:
> On Mon, Sep 9, 2024, at 23:22, Charlie Jenkins wrote:
>> On Fri, Sep 06, 2024 at 10:52:34AM +0100, Lorenzo Stoakes wrote:
>>> On Fri, Sep 06, 2024 at 09:14:08AM GMT, Arnd Bergmann wrote:
>>> The intent is to optionally be able to run a process that keeps higher bits
>>> free for tagging and to be sure no memory mapping in the process will
>>> clobber these (correct me if I'm wrong Charlie! :)
...
> Let's see what the other architectures do and then come up with
> a way that fixes the pointer tagging case first on those that are
> broken. We can see if there needs to be an extra flag after that.
> Here is what I found:
>
> - x86_64 uses DEFAULT_MAP_WINDOW of BIT(47), uses a 57 bit
>   address space when an addr hint is passed.
> - arm64 uses DEFAULT_MAP_WINDOW of BIT(47) or BIT(48), returns
>   higher 52-bit addresses when either a hint is passed or
>   CONFIG_EXPERT and CONFIG_ARM64_FORCE_52BIT is set (this
>   is a debugging option)
> - ppc64 uses a DEFAULT_MAP_WINDOW of BIT(47) or BIT(48),
>   returns 52 bit address when an addr hint is passed
   
It's 46 or 47 depending on PAGE_SIZE (4K or 64K):

  $ git grep "define DEFAULT_MAP_WINDOW_USER64" arch/powerpc/include/asm/task_size_64.h
  arch/powerpc/include/asm/task_size_64.h:#define DEFAULT_MAP_WINDOW_USER64        TASK_SIZE_128TB
  arch/powerpc/include/asm/task_size_64.h:#define DEFAULT_MAP_WINDOW_USER64        TASK_SIZE_64TB

cheers

