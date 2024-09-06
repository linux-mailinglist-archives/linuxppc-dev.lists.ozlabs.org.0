Return-Path: <linuxppc-dev+bounces-1080-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C95A896EB41
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 08:59:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0RtV3v32z3023;
	Fri,  6 Sep 2024 16:59:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725605986;
	cv=none; b=f6G1yd3N1g5BBpGLKronhcVYsnetndWdNX0jkwotryvutUzs76ewW+vWChzeccj/k2zEnEoLoVudiQygyREFd5quyznD3UM4KJAukMEjul7kn0YJnvAw+V6Bk/lH1PW3ZiEeIAO/ODB+oqr97ZjDAtJkH/a0Ic9SAZPG5e05UFiIGWqJeuqusAHUt5CBjoyCJDTD8HB0ZYXK4V2QmlVfFbzstYBmu+aePe1K0FYPhEhvDVnsr2Y4MWzTSYvfACdUVAZevxgvxviG8+8kGcMBs3ZekcPpXcgD/W/x665iqBPVf8ENNImPxVjctaWiMSlwAYBBnNVg3wwT/dDpwCLoww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725605986; c=relaxed/relaxed;
	bh=sUHXIrjnHS+Ol+xIsY2BagDRHrRUVN5ksj5mkzk0GWk=;
	h=DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type; b=S4Uy7wreNIFWmi89137BsF7jv1fIA3SB78KXCbxVZFjbh7DzOg4dEJanTopoTCAYEWbzOx31rQrbepmXwx4c2NHNZ52D4w397oHJhIoY4Zf5TXGIZtsCOo1L7Tnb+5RynY6jpFvHK2CZnyX3fSoAN8tnrAdU/1EUtG6fy5dSmQGN8yz1JtFSEhUPHwEIQMgPVfg3eePucTUpT2Vx6ewHTtkg7gQVhiFq+unlssUfbrwNxwH5i1A9+UwTxRUT4KDL/KA9KwDcnEV4CvMxILp1cNmTH1sCy9/v78D4jDpb4xN2fPOg39iD3BEoTY3mHzPCoajJJg3V7nKVIqqswHj7Lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JPN2IXXt; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JPN2IXXt;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0RtT02lNz2ytJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 16:59:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725605984;
	bh=sUHXIrjnHS+Ol+xIsY2BagDRHrRUVN5ksj5mkzk0GWk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JPN2IXXt8T9uK4WYrDF/aF6tNmSORt6qbIW8Scxf7Yj0cQGJxTUZFKXGO5myErUhO
	 dheOx7TGFohEGncpupi9qLpH83n3AoXHGCjFRaE5Niax6X5n9aT7nWA+I3bK9x+Eiu
	 t/dnkmhZucV62gV/Pjw/qwUz/2SdQGvC8Z7HFyyYFE1maTeK28OAbv9xMO/lRl53vR
	 fKTDg3SbBMv8DMAXesSGLDGuR2pGfdcOTY/rxpyxqpZlA4RGjpSxeBvc3wq5DGClm0
	 ulPvkdGfU6/akU45rkH7aLtvWoVsLT7oyn1+O++FpgqAAdWj4erLl8CjsBT5teWKFY
	 UOvnBfG3WqM6A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0RtN4J6hz4w2N;
	Fri,  6 Sep 2024 16:59:40 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Charlie Jenkins <charlie@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta
 <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Guo Ren
 <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
 <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker
 <dalias@libc.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Michal Hocko <mhocko@suse.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>, Chris Torek
 <chris.torek@gmail.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net,
 Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
In-Reply-To: <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
Date: Fri, 06 Sep 2024 16:59:40 +1000
Message-ID: <87zfol468z.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Charlie Jenkins <charlie@rivosinc.com> writes:
> Create a personality flag ADDR_LIMIT_47BIT to support applications
> that wish to transition from running in environments that support at
> most 47-bit VAs to environments that support larger VAs. This
> personality can be set to cause all allocations to be below the 47-bit
> boundary. Using MAP_FIXED with mmap() will bypass this restriction.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  include/uapi/linux/personality.h | 1 +
>  mm/mmap.c                        | 3 +++
>  2 files changed, 4 insertions(+)
>
> diff --git a/include/uapi/linux/personality.h b/include/uapi/linux/personality.h
> index 49796b7756af..cd3b8c154d9b 100644
> --- a/include/uapi/linux/personality.h
> +++ b/include/uapi/linux/personality.h
> @@ -22,6 +22,7 @@ enum {
>  	WHOLE_SECONDS =		0x2000000,
>  	STICKY_TIMEOUTS	=	0x4000000,
>  	ADDR_LIMIT_3GB = 	0x8000000,
> +	ADDR_LIMIT_47BIT = 	0x10000000,
>  };

I wonder if ADDR_LIMIT_128T would be clearer?

Have you looked at writing an update for the personality(2) man page? :)

cheers

