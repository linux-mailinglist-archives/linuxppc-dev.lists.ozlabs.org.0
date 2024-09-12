Return-Path: <linuxppc-dev+bounces-1274-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B692A976144
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 08:18:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X46gz2n2Zz2xZr;
	Thu, 12 Sep 2024 16:18:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::c2d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726121903;
	cv=none; b=j77mbzcqjs/9uAPvYKkmROPeKnjHyMQm9+tTElrjzxBSKuX4L77vPh9lci0yA9boQVBADMXFypn4qscB79csUlqCQv5PnbedQw+M3MeOpgnYvvjc16kH4UwjfPt5wqGYq6KGC0T9/BdNqW04ZdVy6tGj8Et2xVISJcPQOCyR0j+d0gPP/F54/738autUgvQ69Gjtob4c5Khj/foNus+oEXCZSgDDehGMUljigC9t6EOCMxmIGAT6PyjO0W91Ncb+rg2SpxNOK+W0iaorj9jn/fLcrFYTdZ1D+OR90QasY8U0BrgKWStJlLT9OBNBE9c/XjdFSYRfRPabDcQlma36Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726121903; c=relaxed/relaxed;
	bh=MAcwRzdYBVGpQvvsotib//4T0Ptv25mGEFNsz8/kzr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ew0w/ER7lYeK4+5ooDBvQ5i9eGEQrN7CX41DErwYOrcWfMdLDYBJp2WSO5UQjVKvN74Od5NQAq47uvj3Nf37p9xV3N8np4RUXg5RRVBOwUtBHrUAiJ/9PJPR7X0sMXwsAzdMJipSjOz4E/QL3e7zrB2YBMHJghRE0gTvOwESD8g2pkuv7gz2nxjsa+ee+xOOlhEemYyK4f2hFWWhJcnWscQbinM4GxhPvWS5jI0aG3YMWAhp/wp2VujDWpbv2gWcSubZcOhF+RbDm2NK2cgWVxhdz3TV6PG9uTLt8e9ZYZtZ8sNJSc5Kxg0OLHUxEdLqc2IeVj7RqWWtdFfukhjTbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=dkYDL32r; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=dkYDL32r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X46gy62y9z2xX3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 16:18:21 +1000 (AEST)
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5e1c65eb5bbso337698eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 23:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726121898; x=1726726698; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MAcwRzdYBVGpQvvsotib//4T0Ptv25mGEFNsz8/kzr4=;
        b=dkYDL32rCybTB747IBHHOcDhC6UIEZIrdF36lWSOGBFF/fUtberU+IIxeqdGnIwE1o
         BxOBzIzqX76rXGz2apJ8XYzMA1gU+qnwmbgNuQ+7zqvdH6do3aJGdvnYwwVnCXqNyRqH
         QMPku3R/JJnN1iRxLc5BRRkvwG9GJPKXUAt9aJ1HAg3rUdWOsWVQIUpCpdXIkkD2tzTE
         mFVwZnYy+utjnxECCxjJIjlKdZFSYxSqsunFj1Cqe1nNCQd5oMVWEFAmBTd5w+jForla
         QJnFZrsRKN1uU47yE73BmsAeS228+2HrQZPyBL1NS/wiJ1S8ywqxvwDV8XVHZys3JaAJ
         wFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726121898; x=1726726698;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MAcwRzdYBVGpQvvsotib//4T0Ptv25mGEFNsz8/kzr4=;
        b=fWTE+kN3Uq+HUWdvXmxtW+Zl/6IWpbOcepeoTd4rLIyNBfscv5xgFzjk7/FQaw1w1Y
         aDsnCIfzXY1kB/+s1CbSQcDOjRDQGlYSpMp5GNxsDwe5aFVMrJ3edT9KKBh7elwrMDYD
         YyaLP4QcPYrRbn/zbwLYWYalQXII2ISdddY2CLjR6PfK65vXxzrQR0FjMrzux12l7G96
         eLMybm+6w0HK4HroBAN4NChZN7VFXGSN/9lvE7mKrfj8jeFfuhH17fNCdxG/i8yB1wBn
         aH6uPC42oQPyPp+gBz2fZ1NtTRm1LxeVp+7ONYdhPTR/1tLbuJsg6l1fu4VyeUgL8BeA
         Gf6w==
X-Forwarded-Encrypted: i=1; AJvYcCXJqR19OXFCj5a+t9TCdVnqPqeK4r3Ww4tjit+QboIsbWzPeaJfb4gBzOkSBwdetAGhUdLFBCn8lk0/5C0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyrnO/31fjJ++lxjKHmRGlqRX7yaN7h9bmOx9Jve1HtYCOsJN7x
	uoqPIvUCZ7aUEcLtPKr7zhz1LET5bIZmlZBLuWQAgUUcY6iWXqZJf1X8HB0w+lM=
X-Google-Smtp-Source: AGHT+IH1u/BITj52DSA2KLJ5czFa7HaODYxdqRl9mmjp1F3evKXCtYQOfdJUyouLtu9doLCVCxJHIA==
X-Received: by 2002:a05:6870:910f:b0:277:eb68:2878 with SMTP id 586e51a60fabf-27c3f6a6e6emr1295326fac.44.1726121898162;
        Wed, 11 Sep 2024 23:18:18 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:7acc:9910:2c1d:4e65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7190f888a78sm3692711b3a.140.2024.09.11.23.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 23:18:17 -0700 (PDT)
Date: Wed, 11 Sep 2024 23:18:12 -0700
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
Message-ID: <ZuKHpFB+uWuJe2xm@ghost>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
 <Ztrq8PBLJ3QuFJz7@arm.com>
 <oshwto46wbbgneiayj63umllyozm3c4267rvpszqzaopwnt2l7@6mxl5vydtons>
 <ZuDoExckq21fePoe@ghost>
 <ZuHfp0_tAQhaymdy@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZuHfp0_tAQhaymdy@arm.com>

On Wed, Sep 11, 2024 at 07:21:27PM +0100, Catalin Marinas wrote:
> On Tue, Sep 10, 2024 at 05:45:07PM -0700, Charlie Jenkins wrote:
> > On Tue, Sep 10, 2024 at 03:08:14PM -0400, Liam R. Howlett wrote:
> > > * Catalin Marinas <catalin.marinas@arm.com> [240906 07:44]:
> > > > On Fri, Sep 06, 2024 at 09:55:42AM +0000, Arnd Bergmann wrote:
> > > > > On Fri, Sep 6, 2024, at 09:14, Guo Ren wrote:
> > > > > > On Fri, Sep 6, 2024 at 3:18 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > >> It's also unclear to me how we want this flag to interact with
> > > > > >> the existing logic in arch_get_mmap_end(), which attempts to
> > > > > >> limit the default mapping to a 47-bit address space already.
> > > > > >
> > > > > > To optimize RISC-V progress, I recommend:
> > > > > >
> > > > > > Step 1: Approve the patch.
> > > > > > Step 2: Update Go and OpenJDK's RISC-V backend to utilize it.
> > > > > > Step 3: Wait approximately several iterations for Go & OpenJDK
> > > > > > Step 4: Remove the 47-bit constraint in arch_get_mmap_end()
> 
> Point 4 is an ABI change. What guarantees that there isn't still
> software out there that relies on the old behaviour?

Yeah I don't think it would be desirable to remove the 47 bit
constraint in architectures that already have it.

> 
> > > > > I really want to first see a plausible explanation about why
> > > > > RISC-V can't just implement this using a 47-bit DEFAULT_MAP_WINDOW
> > > > > like all the other major architectures (x86, arm64, powerpc64),
> > > > 
> > > > FWIW arm64 actually limits DEFAULT_MAP_WINDOW to 48-bit in the default
> > > > configuration. We end up with a 47-bit with 16K pages but for a
> > > > different reason that has to do with LPA2 support (I doubt we need this
> > > > for the user mapping but we need to untangle some of the macros there;
> > > > that's for a separate discussion).
> > > > 
> > > > That said, we haven't encountered any user space problems with a 48-bit
> > > > DEFAULT_MAP_WINDOW. So I also think RISC-V should follow a similar
> > > > approach (47 or 48 bit default limit). Better to have some ABI
> > > > consistency between architectures. One can still ask for addresses above
> > > > this default limit via mmap().
> > > 
> > > I think that is best as well.
> > > 
> > > Can we please just do what x86 and arm64 does?
> > 
> > I responded to Arnd in the other thread, but I am still not convinced
> > that the solution that x86 and arm64 have selected is the best solution.
> > The solution of defaulting to 47 bits does allow applications the
> > ability to get addresses that are below 47 bits. However, due to
> > differences across architectures it doesn't seem possible to have all
> > architectures default to the same value. Additionally, this flag will be
> > able to help users avoid potential bugs where a hint address is passed
> > that causes upper bits of a VA to be used.
> 
> The reason we added this limit on arm64 is that we noticed programs
> using the top 8 bits of a 64-bit pointer for additional information.
> IIRC, it wasn't even openJDK but some JavaScript JIT. We could have
> taught those programs of a new flag but since we couldn't tell how many
> are out there, it was the safest to default to a smaller limit and opt
> in to the higher one. Such opt-in is via mmap() but if you prefer a
> prctl() flag, that's fine by me as well (though I think this should be
> opt-in to higher addresses rather than opt-out of the higher addresses).

The mmap() flag was used in previous versions but was decided against
because this feature is more useful if it is process-wide. A
personality() flag was chosen instead of a prctl() flag because there
existed other flags in personality() that were similar. I am tempted to
use prctl() however because then we could have an additional arg to
select the exact number of bits that should be reserved (rather than
being fixed at 47 bits).

Opting-in to the higher address space is reasonable. However, it is not
my preference, because the purpose of this flag is to ensure that
allocations do not exceed 47-bits, so it is a clearer ABI to have the
applications that want this guarantee to be the ones setting the flag,
rather than the applications that want the higher bits setting the flag.

- Charlie

> 
> -- 
> Catalin




