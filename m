Return-Path: <linuxppc-dev+bounces-1275-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BFE97615F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 08:20:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X46kh3DDfz2yNJ;
	Thu, 12 Sep 2024 16:20:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726122044;
	cv=none; b=mn0aTAH+1ULh+Xj6Mzug8b4mpwBnTsCMEnwUsZmFOrATrDCUuvLzM+Vo8jx+eTESiqFzgg9RODmB+oUNA+ka01bZpls0ZJGBhrexiUqIlj4gpfldtBpYNkIb6dO38XyHcU46ZDyfiyDxkXqpg8K8PmY7B6hFP5rEyz03JKvFjsliU3Ql+BbjX4ORIfl6OlQOgnuJg6NAFMIeLImKnJQEr94/7I2OYG7QZrMP69FK6/6jeyJEcmMqdpP4OGsK3dgBr05zRMlPiJQaLLqFwuZSA+Dnyt2xiag5wWIQxtXnHQyAWTJnVCG0Shw1mDLuJkbxV+BLQvXoONNCHlii82IAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726122044; c=relaxed/relaxed;
	bh=4MH+VWCTNjiA22bJ+vIa1h0/NxuAZxX6cpAlaipl1hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnlX4+6kMot7ml5mCeeQ9qVdCdA43QGV5R5z2UqgOemcoB/sKR4lNVnThmNPVThkrUaU23a5d+GN6CoW9V44dIiW8P0brFMJWH54AYK7ExcRBBdUFfE5dB/TGZg9ZfPpam3x9luyHHlbpxILIofzuqsfZfePGzVJFMXtCeJ9lTrX5ICD+kYWD0zW+nRjvYWt6DPsOxaQ7Cp7n1oHsyJdIPMR8nmoNobAR7oMW1nS2q4OYwrOwslh2/3Q2+AeaKySq2d3qVbLuZz7XVEjt3x7lcNCokuvmOavUlsfPBI8XhoYZYdiVznhPmy+lAHzWUZTqK13LRqk8Tr0QLTMZJhEkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=FqQmoIBA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=FqQmoIBA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X46kh1f3Dz2xX3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 16:20:44 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-206bd1c6ccdso6152975ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 23:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726122042; x=1726726842; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4MH+VWCTNjiA22bJ+vIa1h0/NxuAZxX6cpAlaipl1hg=;
        b=FqQmoIBAYFe8z6RLDFRpY7cp0i66d8KZi4NS8sn+FiccWRIyymLuoNfvxNbxD3VwQE
         iYlY2V6i/scVeKIHPp0StC1TWBTdbM9mmAlRs650hZSc9nNhV9tqpLtcQ/fgxGQlYZyP
         TzAsqHJ7FQc1ChVRsSsSPxqzy/b2u2gcoy2AGusGXCIoXdDkOilikWf5D40yX2uwVrAP
         i0VJEbnpHrSM3mDhv2W2P+2pUn/npGvfoSp+4MCh9EUAVg2loqhjRZr1C/gVGCQbaDJF
         lzakSlPbcQ2JVkz+R+6prW4iARS4ZX492Tmx0CmOQf1xulVW9gFFoDglYbTnW7anNJvS
         8spA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726122042; x=1726726842;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4MH+VWCTNjiA22bJ+vIa1h0/NxuAZxX6cpAlaipl1hg=;
        b=Vd0y0H5TSW1sd1Dc/ockFTXndRPVGW2pwmY3EshcsS1eH/wvhkfakIivpm3cUuiK6S
         VisjNFOSPu/hQRw5S7PoPWMcGVJ9jzSMK0dqVyVmiHijmyDt6Pp7xibObwzRkuqbu/za
         M7lQiaTdINZ4mQGKkCvSKOzWtEXncBlWa9RTDORJKZqBDsGFgmRllEprKyox5vFjQUiU
         +xetiV97oTO6HhC+uo2IWX4bMCKhY6yJlTfqfzshZwNmFEsHSgB6lCDMprzWw6BbRYIt
         F9lCJNp5UtiFPwroduIn3YxBlP0tuz0MNOlydC2GTGjmkHohc7YszxVYwmv5H7IK7Ktk
         tlRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKAcH3ykreWMoSM4AiFOdAFB1YWDle5inhBzE2uJidpRhtd8G7BxqJ/8KqYf8kvGaHbR6FhCmQppbYuM8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwEEmlzQ47oy7cY40Y+mhtvee5k6ojlN71wFFQ6xjZP7KmsSF2H
	R+upFEF4jx0VTOgG5L6mOfZGRd5IxbuMhlBP66m0PETHnnW68N/Nwi2RKYRlJ3g=
X-Google-Smtp-Source: AGHT+IEU0tdlu4WO+IdyYZyQDbQui3iM6ZAtkm5A4CWh7CFo7CMKirqsrpvUAjbSGnQEOy1Vcb5RUw==
X-Received: by 2002:a17:903:191:b0:206:aa2e:6d1f with SMTP id d9443c01a7336-2076e423272mr22083755ad.46.1726122041553;
        Wed, 11 Sep 2024 23:20:41 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:7acc:9910:2c1d:4e65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afdd82asm8286105ad.129.2024.09.11.23.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 23:20:40 -0700 (PDT)
Date: Wed, 11 Sep 2024 23:20:35 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>,
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
	Shuah Khan <shuah@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Chris Torek <chris.torek@gmail.com>, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
Message-ID: <ZuKIMz7U8rDrq8jA@ghost>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <87zfol468z.fsf@mail.lhotse>
 <Zt9HboH/PmPlRPmH@ghost>
 <1aca8e4c-1c12-4624-a689-147ff60b75d6@csgroup.eu>
 <CAMuHMdURgy6NPthHhfOv_h=C_gw2hEpnGQ7iBGoDE=ZazUPRHA@mail.gmail.com>
 <8734m6s428.fsf@mail.lhotse>
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
In-Reply-To: <8734m6s428.fsf@mail.lhotse>

On Wed, Sep 11, 2024 at 11:38:55PM +1000, Michael Ellerman wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> > Hi Christophe,
> >
> > On Tue, Sep 10, 2024 at 11:21 AM Christophe Leroy
> > <christophe.leroy@csgroup.eu> wrote:
> >> >>> diff --git a/include/uapi/linux/personality.h b/include/uapi/linux/personality.h
> >> >>> index 49796b7756af..cd3b8c154d9b 100644
> >> >>> --- a/include/uapi/linux/personality.h
> >> >>> +++ b/include/uapi/linux/personality.h
> >> >>> @@ -22,6 +22,7 @@ enum {
> >> >>>     WHOLE_SECONDS =         0x2000000,
> >> >>>     STICKY_TIMEOUTS =       0x4000000,
> >> >>>     ADDR_LIMIT_3GB =        0x8000000,
> >> >>> +   ADDR_LIMIT_47BIT =      0x10000000,
> >> >>>   };
> >> >>
> >> >> I wonder if ADDR_LIMIT_128T would be clearer?
> >> >>
> >> >
> >> > I don't follow, what does 128T represent?
> >>
> >> 128T is 128 Terabytes, that's the maximum size achievable with a 47BIT
> >> address, that naming would be more consistant with the ADDR_LIMIT_3GB
> >> just above that means a 3 Gigabytes limit.
> >
> > Hence ADDR_LIMIT_128TB?
> 
> Yes it should be 128TB. Typo by me.
> 
> cheers

47BIT was selected because the usecase for this flag is for applications
that want to store data in the upper bits of a virtual address space. In
this case, how large the virtual address space is irrelevant, and only
the number of bits that are being used, and hence the number of bits
that are free.

- Charlie


