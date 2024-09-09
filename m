Return-Path: <linuxppc-dev+bounces-1191-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A762972256
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 21:07:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2bty4vL7z2xtK;
	Tue, 10 Sep 2024 05:07:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725908858;
	cv=none; b=FBNAaJCLWQejfgEr+96WzHA+GIAC+pQdchUvgrJ6NgfdIroIvUoaUBIxP4KGV7b/FdJnSa8pjrtm4q9/+g5Bl4Bg92/Ay40V+k76smOvUPfAS+xC5LEj7zE+X/ZnedJ/JKOA5YgjKGO5MztOVTJiVidCFAXy0/a8YAe1qcdTaSWULZUe991DFukXpgk9/PwrtFXf5PSy/FxfEOS74EA5hYPW7H8FGt5921ZEke36kl0vHB+/mc2k+Nd1EBUvab2RPDjEaykGRRdcVSkKEad0dObQZqsFq10QvZWXmc/lN7FToiG0DMN//Xv/n1Ufddacdm8lC/l7425dwCBC4epaEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725908858; c=relaxed/relaxed;
	bh=KeQ2Et/fFCRS76/RDVc52ODWIM932uTGcPwA4XQOW3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtChH0sSa1ixVrHqs85Ocqr8VBA8OZxiCPaSFBTDztvdV9MZIzJ69vvBQYjC4mVHszIBEgnWvOvZEam6ld7ZhXSGZEttLQjXrTbfXOAINylUmA34vtlPX5xt2jMBy0Am7AcU3R2eOeb6YYRnQJBwDQ6aYj3LinvdEhr4BDdBvn4ao060WlBgV1O4QZCcBDn+27IsjBzw1IvKrKAgv1cAh9V+gwRu0M+X6tvywZdXddyA61s4gz7wpuTyuS/UMMaSLwyTHKEl8QyNq5gA50mVyUeGEOyXBkLb0rcftL8Hd3XZcxzrL5E4RK6wFDSvuZittvl/rSE/z3jL7vLxU0srjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=SWkrfcr9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=SWkrfcr9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2btx5Mbgz2xdR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 05:07:36 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-206f9b872b2so25486425ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Sep 2024 12:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725908852; x=1726513652; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KeQ2Et/fFCRS76/RDVc52ODWIM932uTGcPwA4XQOW3E=;
        b=SWkrfcr9yMVzu11Z7pKzWrG3vZKfN4RpoApx8GAfZYkbx7TBC8J/G6u8PzidfBLRbG
         ekNhI7yN+UY60SrmKhb47B5QNdczWzdNSTIauLlQklFOJ5HF82tDm7jJHlXtpmg1Fkd/
         emNo5fGjwt+kGUsPNYM8i9hk2tcOqLC7of/3Lf4WI26W0Hz9LlnQ/fsXACicabZLPn43
         Uu1dFjF6qpZFqPaY8kMdeXlQMPE5uNhZqLh+zKCQZwgUSUBG8M9UNmsD5cARZkA6OijG
         +HEWb9Tq1kWRzJMSASeR9Nd4272+hAIQ+J/Ggp+Rk/zbZBhkCTy6IjVUYk2+weOIeR5P
         7hUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725908852; x=1726513652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeQ2Et/fFCRS76/RDVc52ODWIM932uTGcPwA4XQOW3E=;
        b=PaLebJ89FzwSKWz5CLDav2Y23A99i5IFimrCqFOdUEt1ri8XWQteiw8rrgisdOVmzZ
         bcCttuW8DVN93+jX5dUgTpn536wxgeafemOn3T/jzbsl1b7vgO+qTfjcZWNMX4rtxePj
         Ycr8up7uqFHBjQLA/7np7QJXPPCiWGMqktmDW4S2yAuwhijjJPZvZ/GXjTX5SPvL4KPo
         tzxtjFHgEpw8OkrvoDizgYAoKdf128E44CY+zy0he79c/RVMqwF+OQr98ZTZRBej63pY
         fJg6ibC+WRvsz4vD1CGUBTCT73R6pD/V5kYGyg7zRWDXVklTI81AJTclISYPjajxTu5v
         SFdQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0KT1fPzKsmAa7aa+Kr2iIyp+w8xUlISpAVQzV5v/Tsp7/8dLYh33TUP18wa1XcXg/r2S3LSTBqlWX2uQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzxSvzJGgggYClaZIFMc2u1oTCx7noRK4y+Z8bRSoabq7wE5aHG
	Lh61gEpHQ7AdJZH1jZqk3d0BtDGY6P/QHjy7rMNKDG54FuJyV9+3I0EZ7eB8DJ0=
X-Google-Smtp-Source: AGHT+IFr8qMBk49qQaWgQwdEeSwPNLRpIJ6+/NqAAdbEE2n6wWPI3+1ojCwWs7k3VHGjnw2a54FzLg==
X-Received: by 2002:a17:903:22c9:b0:205:5fb6:2aba with SMTP id d9443c01a7336-206f0539d1amr123273675ad.30.1725908851946;
        Mon, 09 Sep 2024 12:07:31 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f31729sm37014315ad.261.2024.09.09.12.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 12:07:31 -0700 (PDT)
Date: Mon, 9 Sep 2024 12:07:26 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>,
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
Message-ID: <Zt9HboH/PmPlRPmH@ghost>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <87zfol468z.fsf@mail.lhotse>
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
In-Reply-To: <87zfol468z.fsf@mail.lhotse>

On Fri, Sep 06, 2024 at 04:59:40PM +1000, Michael Ellerman wrote:
> Charlie Jenkins <charlie@rivosinc.com> writes:
> > Create a personality flag ADDR_LIMIT_47BIT to support applications
> > that wish to transition from running in environments that support at
> > most 47-bit VAs to environments that support larger VAs. This
> > personality can be set to cause all allocations to be below the 47-bit
> > boundary. Using MAP_FIXED with mmap() will bypass this restriction.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  include/uapi/linux/personality.h | 1 +
> >  mm/mmap.c                        | 3 +++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/include/uapi/linux/personality.h b/include/uapi/linux/personality.h
> > index 49796b7756af..cd3b8c154d9b 100644
> > --- a/include/uapi/linux/personality.h
> > +++ b/include/uapi/linux/personality.h
> > @@ -22,6 +22,7 @@ enum {
> >  	WHOLE_SECONDS =		0x2000000,
> >  	STICKY_TIMEOUTS	=	0x4000000,
> >  	ADDR_LIMIT_3GB = 	0x8000000,
> > +	ADDR_LIMIT_47BIT = 	0x10000000,
> >  };
> 
> I wonder if ADDR_LIMIT_128T would be clearer?
> 

I don't follow, what does 128T represent?

> Have you looked at writing an update for the personality(2) man page? :)

I will write an update to the man page if this patch is approved!

> 
> cheers

- Charlie


