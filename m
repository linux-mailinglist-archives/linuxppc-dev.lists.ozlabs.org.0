Return-Path: <linuxppc-dev+bounces-764-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1B3964CE1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 19:33:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvpKT3qbnz2ywh;
	Fri, 30 Aug 2024 03:33:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724952813;
	cv=none; b=QtcRLqR2OTUbpQcOBHmKmJW9JBRgfgru3Rz4kXDrQwA/xtjKYSV3c0/vqhZDZ+hkkLRzyvgwLl2FwreAPvvYv1qjJku07wvS7F9Od3g9UB03MOoYsulB/VE9DSZjcSrJvykOUoNvHAO7efgUmiw4MQr4p5fXtTVRdXAn3be6f3y1CASv2pVctn75jspMPH0XGL3W3AupWpnXtowN8kiTEnvm0TMGaaT7jtTP+klPcgzKtFYH1NlyQKQLfsvw1n+cQ9AcNsiIduOFSLD/l0JWP2nR2YOOPBLCX3jaJhwQ/c76/imxrGgKkEnVnIqmtQN2TtxXDoW0QQ2OWP086NNmQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724952813; c=relaxed/relaxed;
	bh=ShOV+xhv6/I7AhDzzz24YoQnvepxBGugrDU9V6pmXjY=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=ApVIYzga4OqWgpO4dMalxDoXAFJRzGHIUXkXQAdC11kMJWcmHj6SE09OPkdkB8r2rXWrOgFS7fW5ff6Wx40TqMg6Z63aBU7hoehKUX+QkycoPU/xnIvjMFPcrAiMdXa0ui1+X6V04Jmj2/h459vWx4sAftQuvLPL1H6pF0ibDjVy0SlqtVFgLYwf8ztWuMwWpVm9uimh72hlckf3e6B5ZtLHKljx414mKjIeAYMNviKhhF10n9W+rRrZ5qrb8Rs67H/rciv2d3bblGh/5/Bbu869UUKgiMWQe6zN1ZS5gid2EStC/s+B/u6BfAOotk7TGT5EO7g1uevhqZDy5sm+kA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Dwx+gtDZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Dwx+gtDZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvpKS6mrhz2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 03:33:31 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so627500a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 10:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724952809; x=1725557609; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ShOV+xhv6/I7AhDzzz24YoQnvepxBGugrDU9V6pmXjY=;
        b=Dwx+gtDZcyicqsWEYzhor7ZIlvh6DPZ+ndaSr28vphQnpzrbUaX5b7Nat+G6YjA5ys
         CXKpBxbuAdda1T0/5EsaNWyqDmcAz0AlyXOb5p3ULAdi5xGux7fKIckfU2sYzaf+0Og1
         Hs5TsaXwv3lnnugpDLh7+iIBgCcDuEHGjN1b8KW9iE65OwCZUBIkUFviPsrhR19vBZkW
         Jaj41rr0axLSi3RRJMc15hnt4S8ZmZVdcNDaURyaBlJ+KQ+L69fOMCBlMHIr1S/G1auF
         jq/7/TBlfpJTFJUKlVXCw6zxftS9fr+XP6IlusviOD4AvJRl+fhzZot9owEGaLf7WUk5
         r42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724952809; x=1725557609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShOV+xhv6/I7AhDzzz24YoQnvepxBGugrDU9V6pmXjY=;
        b=cgXC+qoYlpL6aAgK79BRjX3jrjXJQ+x2zaoW5It6tikBJ9jqYHXsee7FNjhjehRFKM
         7fQP+QLQvID0fUuXxqZAM9ate5tZ7OPPUbC5Le+vtNX5HVYOR/fsph28Cp7fRcfaQj1Y
         Z2tu6HaNYOoZoIjVnqk2uRoceIbScPp4KSx5vY+J8YQuOwWKIk/0CUJ1fAF2cTSraqwx
         qw/2NWA8MpSxC6wvRDYEpve7XoFd3ahP8pPuJQDmSi5N3X7WzNqcnK4bElFHfXGHt+lW
         NlOzwFfYvzNt2Rme4KJwOVx+Q5e1+l88FfN/jK/sLzU+pC/f/0/7u9HqPrBD7FAcHQ4F
         UxAw==
X-Forwarded-Encrypted: i=1; AJvYcCUmPMaYyWazF/4NUgKAt7suiEmwhRnoWrLDvScKLZbJvj8QofoDHWl67C19JH084ZuNrGdk4ta/hEFEPjs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxt7Hin72af87MSfG5Fzb3RkUwd3IvzzRv/ukKYaJCxTTjFjYLK
	mulpdnZQod2ksWnAjd3rUv1eVmfZwcDUPU7dR1W2EW2hc8HqjZelh4D0G0CQNSw=
X-Google-Smtp-Source: AGHT+IEMMPSZiUHtBfNuQb92KkzHdlzWvSIVDrDVVbnqmIDING28StXdegl4Q9VHUGwvTGBDq12VFQ==
X-Received: by 2002:a17:90b:524a:b0:2d3:90e1:41c7 with SMTP id 98e67ed59e1d1-2d85638414emr3575500a91.31.1724952808963;
        Thu, 29 Aug 2024 10:33:28 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:c81:fe51:78cb:fc02])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85b0fdf44sm1949050a91.6.2024.08.29.10.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 10:33:28 -0700 (PDT)
Date: Thu, 29 Aug 2024 10:33:22 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Michal Hocko <mhocko@suse.com>
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
Message-ID: <ZtCw4vgonbJzV1xs@ghost>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
 <ZtAxwJFH_hAh1BPG@tiehlicka>
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
In-Reply-To: <ZtAxwJFH_hAh1BPG@tiehlicka>

On Thu, Aug 29, 2024 at 10:30:56AM +0200, Michal Hocko wrote:
> On Thu 29-08-24 00:15:57, Charlie Jenkins wrote:
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
> IIRC this has been discussed at length when 5-level page tables support
> has been proposed for x86. Sorry I do not have a link handy but lore
> should help you. Linus was not really convinced and in the end vetoed it
> and prefer that those few applications that benefit from greater address
> space would do that explicitly than other way around.

I believe I found the conversation you were referring to. Ingo Molnar
recommended a flag similar to what I have proposed [1]. Catalin
recommended to make 52-bit opt-in on arm64 [2]. Dave Hansen brought up
MPX [3].

However these conversations are tangential to what I am proposing. arm64
and x86 decided to have the default address space be 48 bits. However
this was done on a per-architecture basis with no way for applications
to have guarantees between architectures. Even this behavior to restrict
to 48 bits does not even appear in the man pages, so would require
reading the kernel source code to understand that this feature is
available. Then to opt-in to larger address spaces, applications have to
know to provide a hint address that is greater than 47 bits, mmap() will
then return an address that contains up to 56 bits on x86 and 52 bits on
arm64. This difference of 4 bits causes inconsistency and is part of the
problem I am trying to solve with this flag.

I am not proposing to change x86 and arm64 away from using their opt-out
feature, I am instead proposing a standard ABI for applications that
need some guarantees of the bits used in pointers.

- Charlie

Link: https://lore.kernel.org/lkml/20161209050130.GC2595@gmail.com/ [1]
Link: https://lore.kernel.org/lkml/20161209105120.GA3705@e104818-lin.cambridge.arm.com/
[2]
Link:
https://lore.kernel.org/lkml/a2f86495-b55f-fda0-40d2-242c45d3c1f3@intel.com/
[3]

> 
> -- 
> Michal Hocko
> SUSE Labs

