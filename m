Return-Path: <linuxppc-dev+bounces-702-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B7D963189
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 22:15:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvFz01TMcz2yZd;
	Thu, 29 Aug 2024 06:15:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724876140;
	cv=none; b=B3sIzLX33U6+thUG2eAvxqa4atb3+wEYOtNVSfS9CgOvHH4uZ6byGpQnc/KJvl8hEPN3qfhQBtVvBpcFdapXHita9Dt4AKsK62AoIGZb1ck5wwfHP6H3chvWg0vcawRvOmsVF0aVc2Hv0DBrgLIBbemnnzwsPzM6ACR0N2KKfat4atXpGwl5p5aIQw4EI/Rs6SMgHgfsr/cwpurIPtFE4ViYEyi+Gj7Y7+CtfN/Oz6gAYZm2pjog3ReD49mI56MlO5F83RkegaWMv9IWbSENv6e4fd6yGsW1jK31MspXqdiSDj11Owe3CTtcAsf94KNJWooDSMhGau5yK9NOlArEzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724876140; c=relaxed/relaxed;
	bh=DYouNjU8LVMpXKc1rxZ9hcDgJ8HQG0MfeaXtb0VLyGI=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=c6vh9y9HWk4uy8HwfDBM5cFxnIol70zu9+GytwLkwVwgfxuumULFhzs+OZmRXqA5OLAzAwOchdRGT/FBLULdzk8TcCCVGcWss35X3ttH8C0VoRzR1rXhU7j1Ie35YY6zcteMkdQucIJfQ23xfDRFVIiOwIXbXjMt8qA7TbQRwh3Gk5xOS6yB6TbtuXfO+NWyV7KkgR1RIiwkXLGs3mNy/RF5/RUS1eLxFUrgze0AfMKC1YslswcwTF1sifykZ8n6e3EKL8lTd2dOkdlNY30Ilg0rGmCuXJJeLNIFU/6S5d61LGWuxspuqkhbNtHUmnWY1b1o4MCPvwPRAygPtQ6LvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=RoWEdHAA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=RoWEdHAA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvFyz3gFPz2xsN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 06:15:37 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7141b04e7a3so5886334b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 13:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724876135; x=1725480935; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DYouNjU8LVMpXKc1rxZ9hcDgJ8HQG0MfeaXtb0VLyGI=;
        b=RoWEdHAAJmmT5nNLx/R8C5MHyatipRuf3D6TLcsO6Llr2nXtYR83dnFN4BJ1F4tyju
         Zekyw+fZjc/tR3GWn4vHz0aWd0trIR1H9vKJr1RaZJ/W/IwWvQ+Cu0WoTYi5LilYbvje
         facuOCNUm+SBrSHaQ8GDVnjdhoEnu0jcVV8Q4NiqG8vM18ejaZ9hc3CuRVxXpv5ghn1w
         6dgg2eTIowXVR7qoT990xGJdbGy2pjC4pXQ3XS1PZQ+vYgAQikKyRMeWhVrDMHjR+uDU
         SBGeMkRm1iTbvGykMfOwJvn8EVEoPFiLsC0mVy4NINv1xrOkwzQ9I/+YocwudjXLS5b7
         QsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724876135; x=1725480935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYouNjU8LVMpXKc1rxZ9hcDgJ8HQG0MfeaXtb0VLyGI=;
        b=gRLv5jWzWmadTzzu4ksOUiqzJMixBVDYh2vmFfwvGRGMPI+WJPwsGucadTn//+wQoE
         KNwjZusAzsS/Oi98DoFwc7kYZQ9mCU+ndEfVacDixYSnk+R4062YM2NZlV4q179ngFBD
         r7cnatl+fCQ8KnWZPcpWxceIbel+wsYZNnrclSALsmVOYXpE/YadKM6ikUSrgrE7LEar
         gWC1X5uboCOJ75b7nv28miGQ8J+5UIOODnJL4T6PFjEZSvAkJGaJ7j3jr4WS5jc168+L
         nms5MJBE7z7xtAbR9bgnwp002DHHqe5RTH2wNvcZM6fIrhNfLnWu5fHgAX4j8LxOX4RV
         oEiA==
X-Forwarded-Encrypted: i=1; AJvYcCWAAoNFi4/nBRZOTT6qhDxKWIp3gat+TbayN5V69rYMURIZ+LFLsys36oDwXGxgsk7L3UdEzHnc6RoTmMA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YySxg7eOalEcO2zAkEhxDhiEYkLFLWbfrhyDr6SQCJmlXlAd8JI
	XfC+0qddktdGD4J4jIAkIDfmQrwU628V6JvhUWw6YWewovxfj1jvSPJCK6rr2TQ=
X-Google-Smtp-Source: AGHT+IHnVszzxRV7qQ07aFqnxjDB7ZJDRj+3FpzGhCxnl0U0Ndnw3gA3qfk5sipB0cB/w/7yeJxxIA==
X-Received: by 2002:aa7:88cf:0:b0:714:15ff:a2a4 with SMTP id d2e1a72fcca58-715dfc042a7mr734410b3a.13.1724876134994;
        Wed, 28 Aug 2024 13:15:34 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714343097fasm10850305b3a.173.2024.08.28.13.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 13:15:34 -0700 (PDT)
Date: Wed, 28 Aug 2024 13:15:29 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
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
Subject: Re: [PATCH 00/16] mm: Introduce MAP_BELOW_HINT
Message-ID: <Zs+FYbII0ewwdisg@ghost>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
 <fd1b8016-e73d-4535-9c67-579ab994351f@intel.com>
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
In-Reply-To: <fd1b8016-e73d-4535-9c67-579ab994351f@intel.com>

On Wed, Aug 28, 2024 at 11:29:56AM -0700, Dave Hansen wrote:
> On 8/27/24 22:49, Charlie Jenkins wrote:
> > Some applications rely on placing data in free bits addresses allocated
> > by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
> > address returned by mmap to be less than the maximum address space,
> > unless the hint address is greater than this value.
> 
> Which applications are these, btw?

Java and Go require this feature. These applications store flags that
represent the type of data a pointer holds in the upper bits of the
pointer itself.

> 
> Is this the same crowd as the folks who are using the address tagging
> features like X86_FEATURE_LAM?

Yes it is. LAM helps to mask the bits out on x86, and this feature could
be used to ensure that mmap() doesn't return an address with bits that
would be masked out. I chose not to tie this feature to x86 LAM which
only has masking boundaries at 57 and 48 bits to allow it to be
independent of architecture specific address masking.

> 
> Even if they are different, I also wonder if a per-mmap() thing
> MAP_BELOW_HINT is really what we want.  Or should the applications
> you're trying to service here use a similar mechanism to how LAM affects
> the *whole* address space as opposed to an individual mmap().

LAM is required to be enabled for entire address spaces because the
hardware needs to be configured to mask out the bits. It is not possible
to influence the granularity of LAM in the current implementation.
However mmap() does not require any of this hardware configuration so it
is possible to have finer granularity.

A way to restrict mmap() to return LAM compliant addresses in an entire
address space also doesn't have to be mutually exclusive with this flag.
This flag allows for the greatest degree of control from applications.
I don't believe there is additionally performance saving that could be
achieved by having this be on a per address space basis.

Link: https://cdrdv2.intel.com/v1/dl/getContent/671368 [1]

- Charlie


