Return-Path: <linuxppc-dev+bounces-698-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ECA962E80
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 19:30:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvBHy2fCmz2xfb;
	Thu, 29 Aug 2024 03:30:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724866206;
	cv=none; b=J6DaDRiLTTeNxQ7Xyd9EokCABFJjbBciK87TQv/90jMYt3VliUakXK6YvHkKHZ763qZsIpZW0lSPO/8RdkiiJyt5BXkt2WEu1ycrlF1qVBak3VPGSz4SaDhtyXhuA4ZO1Dq/0mrANU2FzvC0NEZrJKBuFFz69tOVLhDZlqxzei51q5UfklWcW8bl32YPNIVcpetne7T4+gOdLsn9sHWZutQf+yPt+Zk27nHeQpSiXFWWz0pveiPkl1pDTJHiolXIcGSpByIjnb7eTlS7XFOH6qSKbrO0SciBltObmtamSa+wYIIoA4lAf02wY3SegJOGNQfE1TbRrVZxldNndl3+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724866206; c=relaxed/relaxed;
	bh=izEx2iGerEnX7WB/2Mpvv+y1MVG/tbs1FdX9CKEIcSg=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To; b=frP0rc0xbfpQafX6yt/uUFtY9muk4J2jqNh7CWLdHHSKezfpdrp+dLVfIXPrhquuYU4K5rjdd/iafPYCnXNIcS0VJG/jpNMTazcZsfHCWrTWkc+nr9ZT09il7yX4w/M03ETzPEXL4H+OQwNgvVPIbzVwNXF1WhucIRCXRvGS4fVaGJI06YEHwBjrCjJNOdWw8u9ed5Xfy8xBwjIbyr2glgSTifkTB8OARZGd2iYLMqx0N4YKP6r4/jp7C3z8DeS/xr+suIFeeh/jM7RYNYoFb6mqFYHdfk4qcmx8eaQlz6EMRWY77YBPIL3NpTG6PpCjfqB3zj2mG3DoElOolRGvLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=du/4A3F1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=du/4A3F1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvBHx5ZYdz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 03:30:04 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7142a30e3bdso690896b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 10:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724866201; x=1725471001; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=izEx2iGerEnX7WB/2Mpvv+y1MVG/tbs1FdX9CKEIcSg=;
        b=du/4A3F1p592ED5KzxlWq9oLmPAh+JtLDfZyHOAwWPn7FmHHLjTNiMaeSSgJbfFY7/
         e9PG/zkxQHR5GzMetWOlOQTViMQ8KQitUJHA3IP1lZNxIKCfpiPr6LfKJKNN3S2uVwKN
         vFMlv9UpoCnoRjZk2YonKBZI4CmsYFj+o22zKe+OGeZ1XM8eGWWzxJbhWo9cHLvVtokt
         Gws5bYQiZaszBl9qZiLT3v6CuL7lblZuV4yno0zBvnvwUBoZL1J0PNMNb4D99nZy8xHl
         bgXCGu0ExSIa3ebgd5V/zUbLTVSbOBxqcAYTPC0Goa/l2dHZaybeXZCoRN2OkWrS+L9J
         zTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724866201; x=1725471001;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=izEx2iGerEnX7WB/2Mpvv+y1MVG/tbs1FdX9CKEIcSg=;
        b=uUWHocLs0N6GTqEAwE4AWYPv4Dhky+M/7w9dwwzmbvIeUKM90TWO0s7h7809lGVXGL
         7aVoSAYkGRkg3RUNKu1kIQnp8G+wbapy6Q+bpN6kR7vmryxVTEgN8HvF5/ZQEC3acSX0
         jfRNnW9Vy/mnBsKGSF/qgbx3RJNHiCmrAxtIvEV0D66HZsTbdi2RMFCVI99KyT4Y/YEM
         HfUZDJPQspWNfVVXTpvM7Zgi6b00OWL4L+Wrg6gu6Ob7W+rVHeUQUf16izfrd6acnbnk
         q9uff/oa1LiZecx32ROD8j8s33ib2q9fSYZtTXt10r95nTc7RMaS9YCqnCIdcdqJwxCw
         Aodw==
X-Forwarded-Encrypted: i=1; AJvYcCWqF0KtRfAUOhK7Tp98+0NeyWThCDuX89JH11w5np3pkH3VqJqED+auGo0tFhKnfi66xGgD7WhDvkC0fHg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwD+AkeKJ/0HKOQI6VIcI08U339ehyAP9k8KWge+OQ6ipI2llI3
	w3pZC1pg7Y82Me4DnnsdOg76nHd3VVtt9PZ+8TsedsBrThOjHfMMt5zemyNcVqg=
X-Google-Smtp-Source: AGHT+IHMsuvXLfTW+bLvG1ZAGccaibo4i2N0hBI/JcHNn1qd40DIOjpRRFBts/vAK3nn3l/ntjAfHA==
X-Received: by 2002:a17:903:1210:b0:1fb:2ebc:d16b with SMTP id d9443c01a7336-204f9bb4194mr38041435ad.7.1724866201061;
        Wed, 28 Aug 2024 10:30:01 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385581393sm101427625ad.102.2024.08.28.10.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 10:30:00 -0700 (PDT)
Date: Wed, 28 Aug 2024 10:29:55 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
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
	Shuah Khan <shuah@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-mm@kvack.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 07/16] powerpc: mm: Support MAP_BELOW_HINT
Message-ID: <Zs9ek1Cr1SaQzSqg@ghost>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
 <20240827-patches-below_hint_mmap-v1-7-46ff2eb9022d@rivosinc.com>
 <a43c52c6-c1ac-4ef3-b511-08f0459bddad@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a43c52c6-c1ac-4ef3-b511-08f0459bddad@csgroup.eu>

On Wed, Aug 28, 2024 at 08:34:49AM +0200, Christophe Leroy wrote:
> Hi Charlie,
> 
> Le 28/08/2024 à 07:49, Charlie Jenkins a écrit :
> > Add support for MAP_BELOW_HINT to arch_get_mmap_base() and
> > arch_get_mmap_end().
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >   arch/powerpc/include/asm/task_size_64.h | 36 +++++++++++++++++++++++++++------
> >   1 file changed, 30 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/task_size_64.h b/arch/powerpc/include/asm/task_size_64.h
> > index 239b363841aa..a37a5a81365d 100644
> > --- a/arch/powerpc/include/asm/task_size_64.h
> > +++ b/arch/powerpc/include/asm/task_size_64.h
> > @@ -72,12 +72,36 @@
> >   #define STACK_TOP_MAX TASK_SIZE_USER64
> >   #define STACK_TOP (is_32bit_task() ? STACK_TOP_USER32 : STACK_TOP_USER64)
> > -#define arch_get_mmap_base(addr, len, base, flags) \
> > -	(((addr) > DEFAULT_MAP_WINDOW) ? (base) + TASK_SIZE - DEFAULT_MAP_WINDOW : (base))
> > +#define arch_get_mmap_base(addr, len, base, flags)					\
> 
> This macro looks quite big for a macro, can it be a static inline function
> instead ? Same for the other macro below.
> 

I had overlooked that possibility, I think that's a great solution, I
will change that.

> > +({											\
> > +	unsigned long mmap_base;							\
> > +	typeof(flags) _flags = (flags);							\
> > +	typeof(addr) _addr = (addr);							\
> > +	typeof(base) _base = (base);							\
> > +	typeof(len) _len = (len);							\
> > +	unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);				\
> > +	if (_flags & MAP_BELOW_HINT && _addr != 0 && ((_addr + _len) > BIT(VA_BITS - 1)))\
> > +		mmap_base = (_addr + _len) - rnd_gap;					\
> > +	else										\
> > +		mmap_end = ((_addr > DEFAULT_MAP_WINDOW) ?				\
> > +				_base + TASK_SIZE - DEFAULT_MAP_WINDOW :		\
> > +				_base);							\
> > +	mmap_end;									\
> 
> mmap_end doesn't exist, did you mean mmap_base ?

Oh whoops, thank you!

- Charlie

> 
> > +})
> > -#define arch_get_mmap_end(addr, len, flags) \
> > -	(((addr) > DEFAULT_MAP_WINDOW) || \
> > -	 (((flags) & MAP_FIXED) && ((addr) + (len) > DEFAULT_MAP_WINDOW)) ? TASK_SIZE : \
> > -									    DEFAULT_MAP_WINDOW)
> > +#define arch_get_mmap_end(addr, len, flags)							\
> > +({												\
> > +	unsigned long mmap_end;									\
> > +	typeof(flags) _flags = (flags);								\
> > +	typeof(addr) _addr = (addr);								\
> > +	typeof(len) _len = (len);								\
> > +	if (_flags & MAP_BELOW_HINT && _addr != 0 && ((_addr + _len) > BIT(VA_BITS - 1)))	\
> > +		mmap_end = (_addr + _len);							\
> > +	else											\
> > +		mmap_end = (((_addr) > DEFAULT_MAP_WINDOW) ||					\
> > +				(((_flags) & MAP_FIXED) && ((_addr) + (_len) > DEFAULT_MAP_WINDOW))\
> > +				? TASK_SIZE : DEFAULT_MAP_WINDOW)				\
> > +	mmap_end;										\
> > +})
> >   #endif /* _ASM_POWERPC_TASK_SIZE_64_H */
> > 

