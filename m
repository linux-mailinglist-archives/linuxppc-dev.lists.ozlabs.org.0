Return-Path: <linuxppc-dev+bounces-1019-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0705C96CA79
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 00:34:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzcjl6WRNz2yDY;
	Thu,  5 Sep 2024 08:34:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725476841;
	cv=none; b=KP7CrtoTPE6M1v3hUVc400K6DHm4Uu4VpQ+PaZPuy4I3mimlZWjkrjer0ZJLgUi3t6hvdFlWH/f57Q52Ebkq7Cu7WKJw2Uid4CwU7AQAl0i27wB2MBp9NIQPCJwmSbk8nOLMKx5DEpY+45YT4JiBHRTfISnFU5eo2qbHetqDcmg2q2GWvDXxDx/xVqn48w6Cb8onFcJFlUkAfftbSf/NnoHGjQBjTjsu49OeE5xoQorA4ywKqkLIjL2sATO+cnVr4a5WZSJLQKt8NFKCqPOa6bGXSfRFe1n10U2fOlDOte396cBXKJWFWprjabT1uL5SCqMMSgYWc9sC5fnauqXxsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725476841; c=relaxed/relaxed;
	bh=o2U7wgEbLS4i4a8ingcWCBDQrhNmwXrz+ffgx64j+qE=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=b8Ru+jIJpAHGPli0SEVaErfVa2BzbBos24GMGqkwNC1KUuM8kWXrjKAGiP2fw7YJLop3T0VEMTrLQYiSlkVBd04OEgvKt1Wax4mjErkFc0j4hpqmP4sHZESzIm+822dig4q/M4fZ0j6dqRS8qIpDON9l6Ae84PK2Kb/VHSa46JKUmoLAYZcOMmTUui2nfXr4Wb9g8T3StHBErbsH7Ek6cKRrkrp/TPVlwdEhPVMGQVDB7pO3rVVH9JpzLODHdOYgunjNHU42TCcPD6aDrw3WnwRNfkZ6LrPb/1FkUgt2H8+P9cCJVkr8ErJS/CU7i9udXi1REmpqUhzGuXWvQvIThA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=l8lB/l0d; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=debug@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=l8lB/l0d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=debug@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzX6x0YXMz2xjd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 05:07:19 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2d8a4bad409so3098235a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 12:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725476837; x=1726081637; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o2U7wgEbLS4i4a8ingcWCBDQrhNmwXrz+ffgx64j+qE=;
        b=l8lB/l0daNW4RcmdlmcidgGXdedCY6Rc9UWYxo18EbzN8u8MFJrFgeGQvIW0ZwuSLO
         8H4dflEkriyNh6P+yGS16eUWkuT+0y5/G6qzO5aG2aaaXcKuDFSiGgBcd2FJc8ZjXVXL
         khRJ9uN8AAfFoKQHzX447Exk6i8sr3Pwwn8tkGzS048gNZBhzvfRM4MbDOrLmEgnXH7z
         ptEuArT+QFU4T5Hii/3qELLVYZA+9736aXvIgfBySmSd8GEu2XyJRHZabjxgMNzeRNKP
         2RD+lwBrFQcX9isLh4vgCTTabCu9/NLFzGeucCHmetkJRqdzHRYeJUPGDckLIJbmLVJs
         sGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725476837; x=1726081637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2U7wgEbLS4i4a8ingcWCBDQrhNmwXrz+ffgx64j+qE=;
        b=k2QBzs0O4nc9nx8McOCGY/zygnoStl1hNRttbwslqpIQcLn8qKTAxvgRyk9pBIEuum
         jnXz6CRomLl51rwW+S7zywR9txnLUU5l7DJX8LnfHnEaFcUekNxvunWxc8lEzT/faRA0
         rUYkPiPD6pu0U5olMvwrsGRdekjpxyqWFdYLGwnXlD4++RMhc4KC2ASX5VQ2Q2ZDVShl
         YNxJwdKGvN1ZysZvZEfe4/VGZpwAT/I3L1VJXyh6eapuRjGOwgOY+utyXzIBHMDs2/qr
         zKKS4EeQDLq61ZXM49U1GUczgWqb0L/7Ch985hENX6xe/GiyNAFH9k6PhgMz9ZrbFmj6
         qlBg==
X-Forwarded-Encrypted: i=1; AJvYcCVOcAe+sL4dd48Z7sgYWJwYAaYlUdhLBAvzij/skRvAu5FhkG1BKWozdpw2rqgACjy8/D3ZIN1ge4Ex0ro=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyOReKtUf9OmAgeZG4XqOBDq3YO4BZfmS07MO+GA/1qM+8zM03X
	z8p9wxrc1dx2nzc4B05liDrBU+stb+CX1jKUd7/som2QHVhN7cSP3eIhcKOZ2Ac=
X-Google-Smtp-Source: AGHT+IGRXMFw8eODDeHuSZGixob1QmbWy894YR3dac/q8kTYt2afjYPzXJiDq5qdDnRm4AHLgT4d4Q==
X-Received: by 2002:a17:90b:300e:b0:2d8:27c3:87d7 with SMTP id 98e67ed59e1d1-2d893284ebdmr13545892a91.8.1725476836620;
        Wed, 04 Sep 2024 12:07:16 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2da53740084sm4858056a91.32.2024.09.04.12.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 12:07:16 -0700 (PDT)
Date: Wed, 4 Sep 2024 12:07:12 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Mark Brown <broonie@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Richard Henderson <richard.henderson@linaro.org>,
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
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-mm@kvack.org, Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 3/3] mm: Care about shadow stack guard gap when getting
 an unmapped area
Message-ID: <Ztiv4NtsIkKnyiLO@debug.ba.rivosinc.com>
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
 <20240902-mm-generic-shadow-stack-guard-v1-3-9acda38b3dd3@kernel.org>
 <is6ewj3bhtqy3zadj6lbdv6maupx4kmduvhny66ntifkji6hoj@xmhcf5jt4o66>
 <dbaf5653-df46-4e17-bce1-aec7fb168197@sirena.org.uk>
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
In-Reply-To: <dbaf5653-df46-4e17-bce1-aec7fb168197@sirena.org.uk>

On Tue, Sep 03, 2024 at 08:57:20PM +0100, Mark Brown wrote:
>On Tue, Sep 03, 2024 at 03:41:49PM -0400, Liam R. Howlett wrote:
>> * Mark Brown <broonie@kernel.org> [240902 15:09]:
>
>> > +static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
>> > +{
>> > +	if (vm_flags & VM_SHADOW_STACK)
>> > +		return PAGE_SIZE;
>
>> Is PAGE_SIZE is enough?
>
>It's what x86 currently uses so it'll be no worse off if it gets moved
>to the generic code (there's a comment in the arch code explaing what's
>needed there) and it's enough for arm64, we only do single record
>pushes/pops or (optionally) writes to unconstrained addresses.

It's enough for RISC-V too.


