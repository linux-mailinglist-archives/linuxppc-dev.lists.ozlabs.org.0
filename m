Return-Path: <linuxppc-dev+bounces-1066-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5726496E110
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 19:27:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X05rl0j0Wz2yxf;
	Fri,  6 Sep 2024 03:27:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725557223;
	cv=none; b=m7GfuIeastuHPkjk4zz/tmwiLO5W7oBa7je2IFlOdVRGwyDMNRw5M3Ey6EwcM7FnTJwYLnMtrj7SSGh7QqzZ/5clLVze6rEp+RLDxWFEYQ05T4c2p3X7LdRnos/eVZFH5+VS0lzfkEw/LGKjUKOA2IerXYKWAlbeKqXlOWpGdPJ2Lw3X0n7PpDWNuGD9euDy8KZmTGq8wxOfdRQ5X8L2fiP7+9+urviPwag4+sVXFzQNx4iKKTzv1qNiPTHRDzLiO8WCZFuLA4t/gb81D29RNm+qZSrmftUBWWq/RKU/mXUtYNn8pdwh17tjsoLyLxckmBmrwFq4JayUNBCpr00k/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725557223; c=relaxed/relaxed;
	bh=TzHtjVKsvMG2J+VEdT3JJ4mY+8euHciuRxZ037YJyIs=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=TJqlf4i8blD+EYytp5OiQ294GneaipkyDjcSdi5xRfQQcOThYSV1iM9IEbg+dZX5zkCtJOBcPnzE4/R206slc3mgpQRjbiT3haYTDruk8xqeMFxSdXYbrN9HuO0vwKHhAYmmtZo+IVG0iZuQPJxiog9nsTV8mkUucWf9NBQ6meeYqC3BvBiTU7Ktma3lH+NhH0CRWKXl3mvtlmZXdw3qN9PpyFM8f3ff4Q/+ZO4ksiTV7Dh7EuCWbh1l6uvINpz0iDw0lWnkb1HITg2oE2HTzCFKWO6u88BEU4++JrulkMlPX8cV7XtVHllIrVL3qR2arClrLVc7KHvKhevM+5khBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=3Dhcbqu/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=3Dhcbqu/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X05rk213tz2yxP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 03:27:00 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2d8818337a5so1648213a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Sep 2024 10:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725557218; x=1726162018; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TzHtjVKsvMG2J+VEdT3JJ4mY+8euHciuRxZ037YJyIs=;
        b=3Dhcbqu/F8z0Ch0TTe9Ya95nCswiO0mYHkN7hDPcPA+BuLwX93h5LOVRdhdfin/PfP
         2BwmCJrflWuSVeumUmZSQtQu7JRx0L/yhnPvOcMmfjcbreD1WSCZhGyqfFzTBBS+TQUD
         wPa+4x/GKBmhRIgESR3NfjJ/gr813pqcOlNBgkI0S+7BeRUwd0UPpw9ga6JANY1An5P0
         c0twN7+jxJtoNuDLLUUwuUc4ZjuWRyTU7NE/a6pprCcbyo5MEJYuuNfLGsa1GdYHt59q
         MZXQc4fQTVsYZ7V4G2ePqnh6SGVkI8TIFzvIWjVCVB3NvOFL/LP0lVDSTvXWTOD9kLXu
         sEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725557218; x=1726162018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzHtjVKsvMG2J+VEdT3JJ4mY+8euHciuRxZ037YJyIs=;
        b=p5gVCLxDkOhZ5DOa3mSuC0mzQ3msMJsg6N52ken4Vcw2JsnHd3WBv4rLjGF8rYIbYa
         SwNpBqqi60apwiMrG7Rzm/3yCXQ/EHOgLxdimnxiL6Jp1I0yzLSXRNjAxVFnblhtfn+D
         PxJMU38eJiX8DvAzVvpdl38Bf+3PDp/XtJUkq+tr1pyWrynveI17QeGnyLdWu8Rc6Eim
         DfZZUqF/cpP9VZro7Qg6I4mIeRNUqA+LAKqKbTA0z6f5SaTWdZBQ/N9mp0//AQCGFmeL
         MrrW9/DMT9uys+w6BWHcIVKzIUrEhh/8cp7oQODTpokNhbAkHbX2UtkUaElHMJKfP73q
         41kA==
X-Forwarded-Encrypted: i=1; AJvYcCU3/ZEGcH7Ue39LBtfc53MgYoqlkP2nIgypW87L5pDYVUn0p4TBJD0i1X+BgfZguQB/9xK51QGjsMWz/54=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxz5eX/eXxOfnxYWyFlrw6oquTNU9WFjey4PzJesY0xfLmoTX72
	2AlWIE8w3qT7JFJ1m8gMdP+b74QG6q82C1MYbZxw9EbVxj7VkkDFnvP33Xzydbw=
X-Google-Smtp-Source: AGHT+IFxrgWNtdxCWG0RBGHbyeqfO4T1K/TMURzEB4vAspGF/eaSh/6stCCkbbdo5V+yBGPBQxqCJA==
X-Received: by 2002:a17:90b:3d2:b0:2d8:9fbe:6727 with SMTP id 98e67ed59e1d1-2dad4f0e4damr67155a91.4.1725557218097;
        Thu, 05 Sep 2024 10:26:58 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2da5932d1ecsm6506552a91.43.2024.09.05.10.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 10:26:57 -0700 (PDT)
Date: Thu, 5 Sep 2024 10:26:52 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shuah Khan <shuah@kernel.org>, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/4] mm: Introduce MAP_BELOW_HINT
Message-ID: <Ztnp3OAIRz/daj7s@ghost>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
 <yu7um2tcxg2apoz372rmzpkrfgbb42ndvabvrsp4usb2e3bkrf@huaucjsp5vlj>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yu7um2tcxg2apoz372rmzpkrfgbb42ndvabvrsp4usb2e3bkrf@huaucjsp5vlj>

On Thu, Sep 05, 2024 at 09:47:47AM +0300, Kirill A. Shutemov wrote:
> On Thu, Aug 29, 2024 at 12:15:57AM -0700, Charlie Jenkins wrote:
> > Some applications rely on placing data in free bits addresses allocated
> > by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
> > address returned by mmap to be less than the 48-bit address space,
> > unless the hint address uses more than 47 bits (the 48th bit is reserved
> > for the kernel address space).
> > 
> > The riscv architecture needs a way to similarly restrict the virtual
> > address space. On the riscv port of OpenJDK an error is thrown if
> > attempted to run on the 57-bit address space, called sv57 [1].  golang
> > has a comment that sv57 support is not complete, but there are some
> > workarounds to get it to mostly work [2].
> > 
> > These applications work on x86 because x86 does an implicit 47-bit
> > restriction of mmap() address that contain a hint address that is less
> > than 48 bits.
> > 
> > Instead of implicitly restricting the address space on riscv (or any
> > current/future architecture), a flag would allow users to opt-in to this
> > behavior rather than opt-out as is done on other architectures. This is
> > desirable because it is a small class of applications that do pointer
> > masking.
> 
> This argument looks broken to me.
> 
> The "small class of applications" is going to be broken unless they got
> patched to use your new mmap() flag. You are asking for bugs.
> 
> Consider the case when you write, compile and validate a piece of software
> on machine that has <=47bit VA. The binary got shipped to customers.
> Later, customer gets a new shiny machine that supports larger address
> space and your previously working software is broken. Such binaries might
> exist today.
> 
> It is bad idea to use >47bit VA by default. Most of software got tested on
> x86 with 47bit VA.
> 
> We can consider more options to opt-in into wider address space like
> personality or prctl() handle. But opt-out is no-go from what I see.
> 
> -- 
>   Kiryl Shutsemau / Kirill A. Shutemov

riscv is in an interesting state in regards to this because the software
ecosystem is much less mature than other architectures. The existing
riscv hardware supports either 38 or 47 bit userspace VAs, but a lot of
people test on QEMU which defaults to 56 bit. As a result, a lot of
code is tested with the larger address space. Applications that don't
work on the larger address space, like OpenJDK, currently throw an error
and exit.

Since riscv does not currently have the address space default to 47
bits, some applications just don't work on 56 bits. We could change the
kernel so that these applications start working without the need for
them to change their code, but that seems like the kernel is
overstepping and fixing binaries rather than providing users tools to
fix the binaries themselves.

This mmap flag was an attempt to provide a tool for these applications
that work on the existing 47 bit VA hardware to also work on different
hardware that supports a 56 bit VA space. After feedback, it looks like
a better solution than the mmap flag is to use the personality syscall
to set a process wide restriction to 47 bits instead, which matches the
32 bit flag that already exists.

- Charlie


