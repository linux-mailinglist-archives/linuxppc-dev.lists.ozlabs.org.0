Return-Path: <linuxppc-dev+bounces-777-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D98596547E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 03:11:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww0Tm32czz301Y;
	Fri, 30 Aug 2024 11:11:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724980284;
	cv=none; b=bNU9H2pE2bAPLj+dlBtuyNKOYsf/X5WEDK3vQ+o8JXi3sYh8ZFL5C87r4QlyY3CpyV2o7r7sgIuUV84oL/Gu2BvaV75wKp/BnE1wsMEn4CBnAZ15aj5l+kTBcVHWbUtAmfIGv1kTiTSG8YdogVE1HMZHsmaoKRzlZqaskO3yiFXAcX+JuaKpf1Lsh+1ZslDVVqa5g4yAXN9ykKcgV0UT9W5DtPx5gEMqFtoTUpS6k5cMTAjse9M0Q/Ax4RI6zPCC2EvenJ595iVCaz4yaF9b0uHk+UGIgiMW+ttOJg7wwurLwt7Q6J/faFCJxfUX3MIZvkqNcf5A6L22CExkr0F2xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724980284; c=relaxed/relaxed;
	bh=Tq7LnGnCY31W8p33KfA4sDocR34ueQ+QZ1h3PRF4p6w=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=l+o9AntiyVE5IC3N/lRjtHXx0VayXkgJLkWOShVd3tLtjO+uCX0lsGqTyp/lsy/jVBDBbhf51W48ezmgQJDhvGl5MGF6Aq3NV7D5haTg1j07Tbk78xtjJHVt3nsRvdxZtqSKG28BlxuaPUEwH0TnzmWtIph5LuQyecWoWGFGC7mCEU3bmQojobs9tbRRe1NnOz+rIU9XpWZjD2kOWHbyp0hFm7riUybnATJE2slaktDBmYIqu36PVZdIP8YQbWDZ7OUFFbXfpq5sHPhhJ17R4dHqwNFFCP/QP/Yl4Ka3+mnY+D2xy2a0ydjRDdGsi3XiN52YiTJ4apAgZ1Uemt+FVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=qEBhTrMa; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=qEBhTrMa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww0Tm0NBMz301J
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 11:11:23 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7141feed424so1110090b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 18:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724980282; x=1725585082; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tq7LnGnCY31W8p33KfA4sDocR34ueQ+QZ1h3PRF4p6w=;
        b=qEBhTrMaSUk7YDmnkiuikx/z9jQ5yKYpXp8q4jNFIpy+3/FhSKIg9+4eNO2MAQoVDH
         8xNll2YEfYJR5mbgxa+IFHAcoop4J1CA0z74vn8AFLekWIseX5htIIQUa9pmdlhsv2vs
         tIKaah8sc0Hj6GEZPcJfGLIZsmKeV6shDfh41t6xuXPNxi++8Zzuxv5aRCK93EYjfGMa
         Xv/rAbHW0oJELbrVBE66fkiQdCWrZO6VJVwEfAJxd2z66k3Lxdv9vHejN7RYUdS7+en1
         JArNV+hbHgrFdHOUHysWLZSSWkR/J0Bm7dbwDMtetDz2UkRJGvF0+M7Gagq02f4Z6SAh
         9dRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724980282; x=1725585082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tq7LnGnCY31W8p33KfA4sDocR34ueQ+QZ1h3PRF4p6w=;
        b=iIiOXILEEX4bZ1hc+hwlweFXLfsm8XLGBi7OalJLpbgF5qpwqAAifjbSCwjsVZU6NO
         jRE/7Da8rb3Ms2mZkINpaiKNhxrFHMN1uhJxkmZ67PlB8vuuQEFBKrIJLN3iwcGvaIj8
         vaNTySIhQ0tJkpwleqy5iYhMCV3RpmXxp7ovbUBXzNOdcxUIoHZ6fXWJzEJ/w7mcWQWN
         dMyyjk2diWQRNJfcR6N/Znlz3SpsxDD2ZdxOY+Lgr+uWb8iG321t4Jxn4y3MyzYim4BN
         UwKS5t6YLNvm/diVKmxLKqWPll2srZlifkx+Y8lNAD/xLljpluzMnpjfFxawRUN1phUf
         I68Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMBOWuT5ft+T7NXNFxLxYOb5FJt6rYdwHxAWxJneS0y/so4mRdGzJpayV7AH+jv76IdcsOPtJvB1934ic=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyHPMGHSDEoYdVBwYr0vOmEYaVOEGqIADzK5mu/EY8p19Wp7Lj9
	phGZ7ID5mqJQAVapbyPKf+7WyEU4s4SjQPt+EEn6sJfp9qbwDYFuB8hglTYy154=
X-Google-Smtp-Source: AGHT+IE/hxSbHJa0ey/qUAU4qMZr2Egy89hZiorh32Md7TMXE2itSwqfJ21BnW0A2NKOMSU/XYMAJQ==
X-Received: by 2002:a05:6a20:c78e:b0:1c0:e49a:6900 with SMTP id adf61e73a8af0-1cce0fea52bmr4390650637.7.1724980281696;
        Thu, 29 Aug 2024 18:11:21 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8445e8f72sm4900654a91.20.2024.08.29.18.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:11:21 -0700 (PDT)
Date: Thu, 29 Aug 2024 18:11:17 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
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
	Vlastimil Babka <vbabka@suse.cz>, Shuah Khan <shuah@kernel.org>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/4] mm: Add hint and mmap_flags to struct
 vm_unmapped_area_info
Message-ID: <ZtEcNfNMfNTzkHEF@ghost>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
 <20240829-patches-below_hint_mmap-v2-2-638a28d9eae0@rivosinc.com>
 <0454187e-3e01-4af7-b193-07468ffa8934@lucifer.local>
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
In-Reply-To: <0454187e-3e01-4af7-b193-07468ffa8934@lucifer.local>

On Thu, Aug 29, 2024 at 09:48:44AM +0100, Lorenzo Stoakes wrote:
> On Thu, Aug 29, 2024 at 12:15:59AM GMT, Charlie Jenkins wrote:
> 
> [snip]
> 
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index d0dfc85b209b..34ba0db23678 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -1796,6 +1796,9 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
> >  	struct vm_unmapped_area_info info = {};
> >  	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
> >
> > +	info.hint = addr;
> > +	info.mmap_flags = flags;
> > +
> >  	if (len > mmap_end - mmap_min_addr)
> >  		return -ENOMEM;
> >
> > @@ -1841,6 +1844,9 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
> >  	struct vm_unmapped_area_info info = {};
> >  	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
> >
> > +	info.hint = addr;
> > +	info.mmap_flags = flags;
> > +
> >  	/* requested length too big for entire address space */
> >  	if (len > mmap_end - mmap_min_addr)
> >  		return -ENOMEM;
> >
> 
> These line numbers suggest you're working against Linus's tree, mm/mmap.c
> has changed a lot recently, so to avoid conflicts please base your changes
> on mm-unstable in Andrew's tree (if looking to go through that) or at least
> -next.

I will make sure that I base off of mm-unstable for future revisions.

- Charlie

> 
> > --
> > 2.45.0
> >

