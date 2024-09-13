Return-Path: <linuxppc-dev+bounces-1347-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C56279789A9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 22:15:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X55Cm1pJ0z2ysg;
	Sat, 14 Sep 2024 06:15:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726258548;
	cv=none; b=YJZl6+lH4Iqti7t60UAHx093Bn3wqAfEuyMfDOQCrVEraWaws9ZI5dn9LaNnKi5Js79dSa12mV0FvRg6QVagaRKky9Jfnaqp1L6uE7rCkR0qa7gNKfon2MDwNRaYFygPJQpuav85fgMOA6BARXX81YSwYjCg8ocdtp0oBlnxrOwdO03arA9xd+xmLWpUw+yebtG5fw4GSUYPZj8K0A4YJqs4aMdU/udGnTlujndBotCLTvRCr8GgoqmPh8d2NfcQNpZQb4SqMerVEm3IEQvoddOCkfOd1xm5cNzBm+m2lGRYgZBFrl7RL28xH1YVDeXM1uChmWW1xzjbFF+zz7H9vw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726258548; c=relaxed/relaxed;
	bh=w1FIyAVC28uVndIDT9MHoNGdB/uDnM+DRyhrjJeTBk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvGG/KpyitLqjmmMs7xkg4L9+/rnPc2z4HQ8l40HwiVCf+1gwVHAwjCBqjO4xTfOFmyAaJGFQrCPWbv3qn6ckGF17KvpndjIQFZNT999t1rUrmRKuMXpoXh9i/x2TQbxsRbk5b+1s/uOi/ocLC7+5uM+m0CeBKhgyOnVm2C5D5x6eA6aFJrA5fAfKFXXGE04G/swp87pY+WhsiMnM5tVPe+wu+hrcK51uXiCgUOg0DyDvXMfx/Fgab40aDGCRT64/pKRONrkSiqKcQ/gU+TJhcCxj3QKBJO+OQTFRZSpT0Fw8TXkar3TrYhjrGBbjx0kN5dNnTqw0EjYP31YiMRPWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Q4a3gTHq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Q4a3gTHq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X55Cl29CJz2ysf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 06:15:44 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20688fbaeafso15483265ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 13:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726258542; x=1726863342; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w1FIyAVC28uVndIDT9MHoNGdB/uDnM+DRyhrjJeTBk0=;
        b=Q4a3gTHqdskCLPKc5IbFsIts4W0Cpr+DoAx7hpIrSNJqhUwwdpyHqRdSSdkdX0jG+d
         2hbS9y1gV35geIs9gtcXYYvSM9BtGqbd6GhGla2KyGIKxuc5Yyrh7hQcsz609TTlTfTC
         I8CG8008cu/Ob3JLj4zg4tVtXwpuNjkuf3HeNDaVBpQ38wcTMdNRN61n2fl6q4xX1Yff
         fjZeC6WpXQbRgLdBMipdzYB/ab9IcZU9nMpkqksAI4lm8bHh3WAMhcLruuC0hbfi+YMb
         zb5UPlhITuZhgKNO5ETfwPmqKpMez2NwUF6osA1lbKyT54b5V8VPSDrB7hZfAlD3Ts+t
         3eUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726258542; x=1726863342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1FIyAVC28uVndIDT9MHoNGdB/uDnM+DRyhrjJeTBk0=;
        b=uq09Hd6ryuZ01ctCWQ3lw+7hWm+69jMIHr48vE9RECkTf8hRIHzhxZpVk+H7wwX+07
         5nj3s9SQZFln6Yz4c1eWygHp825hUHO3PWYathgmKiZ4zmWBVSf/rznvD8KKhAbfA2DR
         7hb3aXydy2aWMuGrEdRLn3+DnZy4+eVXHKelT57Cb6NV1KRZRWGSBLjNT1P9oenr4pzt
         Aa9oN5E4AHZ0ArevxP4crwYOYxxIfWs/G2lrYSqVgTYXqYRencup+xOp0Qv4fmZ7kd2V
         tVvxBjDIGpxXZXsq+zN5GpLDUEPm8ANOHh9mjO+kvSu+2YizwWhSkSPWAGdgdVZtpNyK
         LlFw==
X-Forwarded-Encrypted: i=1; AJvYcCUgm/MsWJAmaVK9WAtFfQLh/r+EIkuoOPpxXv2cwrG56JbZzEWVWsLMlBVBGnxekMo9p+bKQUwf3RESSWQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwFjjQAkty5clVQrnlggEngP4GwhcyGT9EKukCszZc5KdN+V/eh
	GbtSvvnT2ImTHLj+ehIxFKf6b85NjsupwIW8cTuS4IafZnT/J/dXhBtwBnU7rBo=
X-Google-Smtp-Source: AGHT+IF+aNQZr3gdahRoQqk9W7f54mB5JjUQKc3RHBzDdb3qrFRnfek72JEtbqkZMIR2o3KSJzgpeA==
X-Received: by 2002:a17:902:dad1:b0:205:8407:6321 with SMTP id d9443c01a7336-20781b4740dmr63844425ad.9.1726258541784;
        Fri, 13 Sep 2024 13:15:41 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207945db10csm315195ad.53.2024.09.13.13.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 13:15:41 -0700 (PDT)
Date: Fri, 13 Sep 2024 13:15:35 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>, guoren <guoren@kernel.org>,
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
Message-ID: <ZuSdZ2bi1JvLJVYe@ghost>
References: <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
 <Ztrq8PBLJ3QuFJz7@arm.com>
 <oshwto46wbbgneiayj63umllyozm3c4267rvpszqzaopwnt2l7@6mxl5vydtons>
 <ZuDoExckq21fePoe@ghost>
 <ZuHfp0_tAQhaymdy@arm.com>
 <ZuKHpFB+uWuJe2xm@ghost>
 <ZuLIPZId9aHcAY2j@arm.com>
 <ZuNaD+zAXiAulc0n@ghost>
 <ZuQPF7Gbcqzq0U6N@arm.com>
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
In-Reply-To: <ZuQPF7Gbcqzq0U6N@arm.com>

On Fri, Sep 13, 2024 at 11:08:23AM +0100, Catalin Marinas wrote:
> On Thu, Sep 12, 2024 at 02:15:59PM -0700, Charlie Jenkins wrote:
> > On Thu, Sep 12, 2024 at 11:53:49AM +0100, Catalin Marinas wrote:
> > > On Wed, Sep 11, 2024 at 11:18:12PM -0700, Charlie Jenkins wrote:
> > > > Opting-in to the higher address space is reasonable. However, it is not
> > > > my preference, because the purpose of this flag is to ensure that
> > > > allocations do not exceed 47-bits, so it is a clearer ABI to have the
> > > > applications that want this guarantee to be the ones setting the flag,
> > > > rather than the applications that want the higher bits setting the flag.
> > > 
> > > Yes, this would be ideal. Unfortunately those applications don't know
> > > they need to set a flag in order to work.
> > 
> > It's not a regression, the applications never worked (on platforms that
> > do not have this default). The 47-bit default would allow applications
> > that didn't work to start working at the cost of a non-ideal ABI. That
> > doesn't seem like a reasonable tradeoff to me.  If applications want to
> > run on new hardware that has different requirements, shouldn't they be
> > required to update rather than expect the kernel will solve their
> > problems for them?
> 
> That's a valid point but it depends on the application and how much you
> want to spend updating user-space. OpenJDK is fine, if you need a JIT
> you'll have to add support for that architecture anyway. But others are
> arch-agnostic, you just recompile to your target. It's not an ABI
> problem, more of an API one.

The arch-agnosticism is my hope with this personality flag, it can be
added arch-agnostic userspace code and allow the application to work
everywhere, but it does have the downside of requiring that change to
user-space code.

> 
> The x86 case (and powerpc/arm64) was different, the 47-bit worked for a
> long time before expanding it. So it made a lot of sense to keep the
> same default.

Yes it is very reasonable that this solution was selected for those
architectures since the support for higher address spaces evolved in the
manner that it did!

- Charlie

> 
> Anyway, the prctl() can go both ways, either expanding or limiting the
> default address space. So I'd be fine with such interface.
> 
> -- 
> Catalin

