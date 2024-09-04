Return-Path: <linuxppc-dev+bounces-1018-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8B696CA78
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 00:33:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzcj62VnKz2yQJ;
	Thu,  5 Sep 2024 08:33:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725476032;
	cv=none; b=QsFuVXhkTqzNFng8ZyQ8R9aceABgg162ONGu9yFg5a4jZ5xd7cwYsyKT56JaT1Qn1ybcTbTR3z4PB8ocg1M64G9jOAVf3viYFJH6e8gGTtP8RwPcvc5rb1obsDnPXLkLOBGXMmlmPat4CFQKu58w+1w6elzHmVSxGnozWRgA/2XZiNoYQI/h73//ABUgh+eKlscRm8j5UgVDMWYPeDKg8vp5bYxdmbXhqdOChnBl1G0Ak2nbouM+pin9mrNbOZNEuveMa9x7szbJgK/I4s3i2h1nK8XbdAdmzeqBq17eO0lyxRrhTeVnsZfzUL77VXn5S1ALXi86LYr9se4+qF9eow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725476032; c=relaxed/relaxed;
	bh=s92rW/1gEQr3xvJKMRwsWt6P8BZ8Funj1rbavwH4oWQ=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=PMdbUhxxxHzudvdmTgD+8V/+hx15jwnDMyTrLImX+zKrR+3BzTOKHI3Oko+So+AzG64Fd8e5YvotGXbJoFmaYBhqgmeg2sk9i+Qu30JtMdBZuEth9jNwMr6IWXVOfdxPocFd+txWMxLEu2iDVmM0j5torcH/IkyFqbSBhduC2Q7Qwfax9YR69Yrzpi2Ppib5OyV20n3KGwPM5iuwGO57djXOIuNeIWntrEmTPt+9MKsAy7Rv1NJf/iiqR5DhD8OUvpQ+fmBGZ/+9aN1ZpmmTqOdBVO4Tb57n3cxbZmAoZYDqG1IOT+7pSEVxGm3RlcjHGdLuRtnAuBRcEAqWyxOi2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Z0FhoNhN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=debug@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Z0FhoNhN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=debug@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzWqN0Xrvz2yYd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 04:53:51 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-715e64ea7d1so5875812b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 11:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725476030; x=1726080830; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s92rW/1gEQr3xvJKMRwsWt6P8BZ8Funj1rbavwH4oWQ=;
        b=Z0FhoNhNW6wnJJcGCox1is3Ld99K31JWRscf3j6b8Ouuq0azcGH8azRUcmCBRbYlxs
         k0tYJAgcmLSs2fIoqoKVnHWSE1zseKrp5nHBsY0UDYGgdsqgp77OhvlJYTjZ6VYSvPmh
         hAzm9bM3vmW4iLbq4TDMd882YcH291hsrTHEWal0wW6EWiL1x0bsQTNfBpCTxHc2U4uE
         tHCez+ieEajulPtiU7bhrZME9uEcwG4yDxiPDHttFHKOmueM4E8UnxEX1d68k67o4erk
         HoOaoDIbAvsk5sUOHOS8zxlBpaU90D5ExsF2IIZHvfctCOa6riP205cCR/VQ4dU1mltR
         XthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725476030; x=1726080830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s92rW/1gEQr3xvJKMRwsWt6P8BZ8Funj1rbavwH4oWQ=;
        b=CGgnzr2tSvlMeEuGpdt32VQvYsyL0V3bID1yinfn3C7H6V3RBiDxiIUsek+ZtHL2k/
         pkGJA8V5wrRrBnGLpuc4mJS3ceVzFi8yAqa/qm7Enjpi2u9bFJSnUfEGzcKkPw1tEjiz
         8RGiooCV8XQSwsgD3SG7oupqLq0mFFymCDqxz6HBY+WaBZDLnKYrEPC6y6axH7pW7HOK
         RWpw5ca3eFDjpY45B1HHFHxm/LJivmDv2KZpcsntlbbC4q3hR3+CGeeenDdxQ/70SFYg
         i867FLhHIzd6HrIczPKJbTDhMknCrEw07wJpBfr8viCHG8wUpuYxiH3pSrcDEEDIsMgh
         ymaA==
X-Forwarded-Encrypted: i=1; AJvYcCXR/VDHKmRCaYdGjjJ/hKusfaxEPxDMSEf4Wb9CFvvnnDP9Ba/kOVLup0/MDjuQW+JB+438t0+wBoehKZI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzW4ndN5BV5GhX9aVKtlPuoNqyjnSmMg9zTgQqXdgU1q+FZv5Yc
	iXCW28cfs/dmgwNBemZc2NbysmQ/VFzFtI6CqeuyS3NwBTuMbJOjhc3VXa0IVmY=
X-Google-Smtp-Source: AGHT+IE2IsoC0LRmiLcI1CkvV1DU3vw4DUJdyqp6MID1n1cX+56uyYB7jBo1wGGq/wkl04oTY4Plng==
X-Received: by 2002:a05:6a21:318b:b0:1ce:cbcf:aaa9 with SMTP id adf61e73a8af0-1cecdfdea62mr20770394637.36.1725476029832;
        Wed, 04 Sep 2024 11:53:49 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778522979sm1947597b3a.30.2024.09.04.11.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 11:53:49 -0700 (PDT)
Date: Wed, 4 Sep 2024 11:53:45 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
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
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 2/3] mm: Pass vm_flags to generic_get_unmapped_area()
Message-ID: <ZtisuRySfREHjnN/@debug.ba.rivosinc.com>
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
 <20240902-mm-generic-shadow-stack-guard-v1-2-9acda38b3dd3@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20240902-mm-generic-shadow-stack-guard-v1-2-9acda38b3dd3@kernel.org>

On Mon, Sep 02, 2024 at 08:08:14PM +0100, Mark Brown wrote:
>In preparation for using vm_flags to ensure guard pages for shadow stacks
>supply them as an argument to generic_get_unmapped_area(). The only user
>outside of the core code is the PowerPC book3s64 implementation which is
>trivially wrapping the generic implementation in the radix_enabled() case.
>
>Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Deepak Gupta <debug@rivosinc.com>


