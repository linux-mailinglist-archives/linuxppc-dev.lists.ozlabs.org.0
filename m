Return-Path: <linuxppc-dev+bounces-4343-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ECF9F74B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2024 07:30:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YDLJq1Btnz2y92;
	Thu, 19 Dec 2024 17:30:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734589835;
	cv=none; b=RZwfN/DorT44FcToogwvt5U0u2AeyVT9GuJRhbcjX5XReg8Ksvbygs6D3ywiN0z8ddDtBvC17to0H7XCuywzAeuobHpBj/qpfqevmRb38ywhTCHwMld2V7lIzOfv962HG1c9V5Q7kJERgRIZj6iiE0UBnaBsWOFjIX7tc7YTYCT0T6yiQX+kbho8iVEFxslewZdtYxXYhXhiRROAUbXy/yoJuZbJ+8W4gVkUIWrtgMjwCTmItSMbiqlmBtXK2nB55P9CfCtVdwvk1Q9VklP+tGgttHLzTqVIr3lGESlOybSap2NbTJhw+5Ah1I5IpCwjgI41X9UFr3z9x8laZTToMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734589835; c=relaxed/relaxed;
	bh=brEM+ootPH6y2/YCviVjC+RLeQ0QzlEBqocyy/WfD3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgluuPkdRxj99Qk8zjKpDkF7USnBgGVwlOgX5nGgDRfWs9G8GLZSXTFvNWX3LXdZwu1uqcDd8ebGD5RVcSSRvPWl2JYlcZqPp9b4z9yp3iXNUVtojeyMSlsGOQhv05q47rpnxQIcA5I2KJPsfkPWQzG8eG7K+ML9QG6m1LdtbpteoYtnADqs0+j78PUzGpepVIWdxM7vt5+tHUyucHXYwBKu5lBs8s1u0agcSzCB9X1YCfiHYlViUK1BSmF9gPZ2EBtw1VGungALFlHHu9KldB3SItWgISr0sbEQWjJjgE5R0fxUydaghmWEUigxUBJuno6X8TcIkJy1zxmOeMZA/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XMcC+wO5; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lizvNDYm; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XMcC+wO5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lizvNDYm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YDLJn4NmGz2xr4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2024 17:30:33 +1100 (AEDT)
Date: Thu, 19 Dec 2024 07:30:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734589827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=brEM+ootPH6y2/YCviVjC+RLeQ0QzlEBqocyy/WfD3U=;
	b=XMcC+wO5/gyjwqszz2FEVmDMXZQx3pF5bzw/D/U+DhwYKJv9REWbX40X23G5YodGhMzxLG
	1UAr8nKjyY0Kf1RGg/8CcSlJteWhtoj0+amS1nzNd19YUishyFWMegPVlkma7haH/l0bQx
	UPXdUdr/bOcUjZEv7/IyAq5X8UvpyOl8Eoo1LOwkra69ZA9udzJSpGYhAqPejllDppzmui
	/1w9LTvVZWo0hHFiKy1wqjTm8CZxIqay1gQlNDOetKKVwrQU522w45o4hbBkEqiMJm3FRu
	2KrYtc6E7LcXV7UbkCQjg7cmZZOV9vw1zDDr9jgfGCnIhmX4pZsWlB8a3x2avw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734589827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=brEM+ootPH6y2/YCviVjC+RLeQ0QzlEBqocyy/WfD3U=;
	b=lizvNDYmwqC1Sdr28wyZPYco75yXNbVdywOf7fbIN5mEEvywWt8AvsOHhKYx2j3f09NW7x
	awEMWr7EktvpdPBA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Anna-Maria Gleixner <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 07/17] riscv: vdso: Switch to generic storage
 implementation
Message-ID: <20241219072552-7cd4512c-4f61-408a-9422-167a6f2810db@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
 <20241216-vdso-store-rng-v1-7-f7aed1bdb3b2@linutronix.de>
 <20241218-action-matchbook-571b597b7f55@spud>
 <20241218162031-ee920684-db10-4f17-b1cb-50373d7ea954@linutronix.de>
 <137c0594-e178-4c91-bc8b-5f99b3ddb2f0@app.fastmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <137c0594-e178-4c91-bc8b-5f99b3ddb2f0@app.fastmail.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 18, 2024 at 05:35:31PM +0100, Arnd Bergmann wrote:
> On Wed, Dec 18, 2024, at 16:46, Thomas Weißschuh wrote:
> > On Wed, Dec 18, 2024 at 03:08:28PM +0000, Conor Dooley wrote:
> >> On Mon, Dec 16, 2024 at 03:10:03PM +0100, Thomas Weißschuh wrote:
> 
> >> Might be a clang thing, allmodconfig with clang doesn't build either.
> >
> > The proposed generic storage infrastructure currently expects that all
> > its users also use HAVE_GENERIC_VDSO.
> > I missed rv32 when checking this assumption.
> >
> > I can add a bunch of ifdefs into the storage code to handle this.
> >
> > Or we re-add the time vDSO functions which were removed in commit
> > d4c08b9776b3 ("riscv: Use latest system call ABI").
> > Today there are upstream ports of musl and glibc which can use them.
> > (currently musl even tries to use __vdso_clock_gettime() as 64-bit only
> > on rv32 due to a copy-and-paste error from its rv64 code)
> 
> Adding back __vdso_clock_gettime() wouldn't work on rv32 because there
> is no fallback syscall for it, and it wouldn't really help since
> there is no existing userspace that uses time32 structures.

My original paragraph was worded confusingly.
It was about re-adding time-related vDSO function *in general*, not the
specific 32-bit ones.
The new ones should be 64-bit only, indeed.

> > There is precedence in providing 64bit only vDSO functions, for example
> > __vdso_clock_gettime64() in arm.
> > I do have a small, so far untested, proof-of-concept patch for it.
> > This would even be less code than the ifdefs.
> >
> > What do you think about it?
> 
> Yes, simply exposing the normal time64 syscalls through vdso
> should be fine. I think this currently works on everything except
> rv32 and sparc32, probably because neither of them have actual
> users that are able to test.

Should it use the specific _vdso_clock_gettime64() naming or leave out
the 64 suffix?


General Note: I'll continue working on this next year.


Thanks,
Thomas

