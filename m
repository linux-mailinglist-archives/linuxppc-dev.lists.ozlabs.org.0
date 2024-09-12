Return-Path: <linuxppc-dev+bounces-1273-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 790DD9760F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 08:07:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X46Qp0dXwz2yN8;
	Thu, 12 Sep 2024 16:06:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726121218;
	cv=none; b=ewa8EjLrdHFdVIBWUn0Us5Q4u8dK4d1A5698XUfiCVnKxoEBm5zzYdBWLmrVYj83XIoC50PwCQnhkNVpU6+060h829LY+5zaROKLAsZxcLSxFbEYjBRFNleCFrvLio80Qe4yA0zh8V8U6UQ3+NCD5xfkMqZrFgWr9dyIhZMVdanubnLpPKIvk7Lyb6rcYJIffsLTbRURDcWYg5mg4u392+pHgMPgRIg52B5p1rl5gz8Uph6zsUrlFSIaPbMDgFy0gaeMxzaSRdaf9PQvUbDJZWbDO4F24K412/HnQeODvUsKBef5N8xrqqEyV8XZ9RE7jfp6NVUS89yF53gHcEUypA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726121218; c=relaxed/relaxed;
	bh=UDJaA5Y9npfkWPEOnJeHdGlQ/o0X1HQ/Q2gtdhbnZuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0CkT4IQK8BG+i0p1cIkCKXW8/MRY575GtnOzlAuVnO4MEJI411ROyWXymArhkJCq/0cOj2eO/72Rqb+DCUSjvtorYLGEy/4dZs9b8htPMmhjONJVJmCCjn9nERGeCLy+QVPYcmRnuu38yEq+OOLorVZN/MsAf72mCF6eeK7spZ3XBvNHe0Jf81QijM/2K4h2eRtL0IkLj3KC0H53YOubpx7c0HIbbqFxPG3grrmFWNjlWkWpbHqbZ9ifbwS2ga/hsoIvEZJ1ENi3+B6HpxgHi/PoC/ehedO3JKVOIGp1RoRhefTcl1CYIx8fJGFDcHfoSpft/y1Idn5PopXR7rl0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=QByRNXek; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=QByRNXek;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X46Qn3Ysrz2yGD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 16:06:55 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2055136b612so8467975ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 23:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726121213; x=1726726013; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UDJaA5Y9npfkWPEOnJeHdGlQ/o0X1HQ/Q2gtdhbnZuk=;
        b=QByRNXeks/RqgqrEgSNnziDpWcNUhkitdLrREZjEO3dwfMU3otR+fSpSJBhlyHjgIp
         zmja6ZWciaF8miEU5QfPbbx0deIZHIxjoH7eWPTR2im4ht03wtaGX7XhYfwX2bo/s0Ra
         9MRhD7yDPIppAWVtMYyAC4tAwPS9ludYMYXVNCC1yi8D4BFeeF9oCsuJcNebZ1xLXwwQ
         XYmlcXSBrIClIV8jk4FKaCgv+w7H/zt6y6P4N9f6T34cSpA75Szy6MOciPrP2am/SXai
         ODn9csrxSnMXHwZUTuX3wPxNfQtGrLSol+l+31PW6iN2tGLHv8zoOQGdkblpDP+s7ozu
         hseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726121213; x=1726726013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDJaA5Y9npfkWPEOnJeHdGlQ/o0X1HQ/Q2gtdhbnZuk=;
        b=Ev2ixzr/ToVfTl7qQDViXwli1ab8ZzXg6MNkr6zkjYZlWkMrWHo0ntHtlxFRXKPnC5
         Aq5tlf/8Cjs3S22TXXeX1yXp14ioi07jlKMaiWJJ603cNrt9ezhkYjjUB1z3CeBEI663
         BKGBOkyLbAGBp2OQ/T7oIPdBtfx7imMS0tFpn1Xc7W1pQwXRqwnQ3digsFNmXy5Sse0B
         flHLhoJiwDWf4PsdVHMlNoM6vRB6Kb6k88IwyjwuV7BAK/w1Q5KxB2/tVJCCJ1bILSDB
         j1nub5MH1LqvsaxOdZ+x19Z7bg5M9//cSvtol15uOg9F3ZU+OOdMa00gKEM10F6Zrjbf
         3DVg==
X-Forwarded-Encrypted: i=1; AJvYcCXdSSXcUn/fRi/7qTIDvp52LQPYTuPYyrlIIRK5MI6iUKTtozULhL3Rxr3OU+bD6+F0csb9nVhxx4nYRSI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzAXbAJ+k4lIIaWoqgZ4HAWSDcTCFjm1fmWbKc9p7E18yKVSRGF
	yGGaRpk+e7ySWux+B/vuzMomDDbXqCbyx8nd8ni8XxYatY3FZAhDPifs7yFksnI=
X-Google-Smtp-Source: AGHT+IGKXy/6JapHeAVjChHUI6qH3tbjA0GPIxSDVxSa+LImRNXpcKvZ6AKB4gkH/Tg4GRKQ5PFIHQ==
X-Received: by 2002:a17:902:d2ca:b0:206:c2f4:afb7 with SMTP id d9443c01a7336-2076e36db8cmr23914475ad.26.1726121212752;
        Wed, 11 Sep 2024 23:06:52 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:7acc:9910:2c1d:4e65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076b01a39esm8052185ad.287.2024.09.11.23.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 23:06:52 -0700 (PDT)
Date: Wed, 11 Sep 2024 23:06:46 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	guoren <guoren@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
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
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	shuah <shuah@kernel.org>, Christoph Hellwig <hch@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Chris Torek <chris.torek@gmail.com>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
Message-ID: <ZuKE9nnNGR/5fHh/@ghost>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
 <Ztrq8PBLJ3QuFJz7@arm.com>
 <oshwto46wbbgneiayj63umllyozm3c4267rvpszqzaopwnt2l7@6mxl5vydtons>
 <ZuDoExckq21fePoe@ghost>
 <8130e50c-01e2-45c3-a516-45f5499311f2@app.fastmail.com>
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
In-Reply-To: <8130e50c-01e2-45c3-a516-45f5499311f2@app.fastmail.com>

On Wed, Sep 11, 2024 at 07:25:08AM +0000, Arnd Bergmann wrote:
> On Wed, Sep 11, 2024, at 00:45, Charlie Jenkins wrote:
> > On Tue, Sep 10, 2024 at 03:08:14PM -0400, Liam R. Howlett wrote:
> >
> > I responded to Arnd in the other thread, but I am still not convinced
> > that the solution that x86 and arm64 have selected is the best solution.
> > The solution of defaulting to 47 bits does allow applications the
> > ability to get addresses that are below 47 bits. However, due to
> > differences across architectures it doesn't seem possible to have all
> > architectures default to the same value. Additionally, this flag will be
> > able to help users avoid potential bugs where a hint address is passed
> > that causes upper bits of a VA to be used.
> >
> > The other issue I have with this is that if there is not a hint address
> > specified to be greater than 47 bits on x86, then mmap() may return an
> > address that is greater than 47-bits. The documentation in
> > Documentation/arch/x86/x86_64/5level-paging.rst says:
> >
> > "If hint address set above 47-bit, but MAP_FIXED is not specified, we try
> > to look for unmapped area by specified address. If it's already
> > occupied, we look for unmapped area in *full* address space, rather than
> > from 47-bit window."
> 
> This is also in the commit message of b569bab78d8d ("x86/mm: Prepare
> to expose larger address space to userspace"), which introduced it.
> However, I don't actually see the fallback to the full address space,
> instead the actual behavior seems to be the same as arm64.
> 
> Am I missing something in the x86 implementation, or do we just
> need to update the documentation?
> 
>       Arnd

Yeah I guess it is incorrect documentation then? It seems more
reasonable to me to have a hint address fall back onto the larger
address space because otherwise the "hint" address can cause allocations
to fail even if there is space above the 47-bit limit. This is another
reason I wanted to avoid having this default behavior on riscv, to not
have this abuse of the hint address.

- Charlie


