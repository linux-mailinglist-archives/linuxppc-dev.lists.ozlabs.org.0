Return-Path: <linuxppc-dev+bounces-775-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E43965453
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 03:00:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww0FL3kWjz2yy9;
	Fri, 30 Aug 2024 11:00:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724979638;
	cv=none; b=LK2vVcKTBVf4VOC6i4QWkPK3WOlilMDFG24b2VHC9Zfl5hxSFuZgjQkrY214l1JneV7V1hX+Cm2VIN2F25URf/iOGA5PI3teo6jUCzwax88uV3A5lwBxjIvkYpi/AuW2DDZ5n+IopzfysRv7YRVXQJCKFOL71a5E/mE3Wj2Wk3CBY3gYc7kaS2xtUtntnuqmwtJ1b2K7BAlGnFdiWS54B8+WJoINc1zwpZZPxZI7aPirc/k++xeske8+WhlR+qkIJZ89vv9Ap7eKSHW6PtMCommxsp3xgrz/MYCuGqCbBe/Qx75dQrSCky5NF1C8ntR6U67wRCswQBslg/OO1EZuFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724979638; c=relaxed/relaxed;
	bh=LS53wxxaShUerh6Nzz4tUD12WQZd3J6t0NqAtqOlEuU=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=gNAp2UcoQBZAOmQq4p3Upa01MXN70LJlMcQdG3fndsMnL0XbpNCfA3EXWzD8G3/GdF2pjrhH9ha7FpAeuZiRK+3ZvBacadTH+VKKg1XAMWZko4A/LTu4h+eMUX9tiMssL+jW/J5I3Oyz1IHQ5JygIU917kwY//yeMIap29BY18BRgj1SHM2XIOwOs+fZZZxVmei22gc2NKFV+q1WT2XgL7We+n8s1MtHsdoTAJFYKmd7PC6Y496CBsdnIswCbMv6uDzOADkM7xkx9kDqu9ryPVoMVsm4wqIjE6P4flbK1BC6G4pn/viRUBzKCGq1pDJZV6RB+lU/Jclp75wa5AA62Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=AtgGhJUl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=AtgGhJUl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww0FK4hPBz2ywR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 11:00:35 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7cd835872ceso920552a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 18:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724979633; x=1725584433; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LS53wxxaShUerh6Nzz4tUD12WQZd3J6t0NqAtqOlEuU=;
        b=AtgGhJUlmitcJH2gUtchH1RVM0OuevP8IuXoY9/rB8czRUcHddAQ43Rpuq96bnHmfi
         QC/baCKT/GM94BLqnOiJcElbwAQISJny/mW2bu+zBnl+ci7TlKGwvWBw6kta4bkystni
         QVnUS2d1jhF4UC6Pd9ATJlAJ4TxB4hZU9g3pEcxyvAzJIm6t56iu/VZ6YPam7xR0p8sM
         JPkfxmfDaKCvh0Rq0B0W5DjdlzeUaq5Mg5do03x3jwjPdf6KJFxfoesHhWe7ftuRi7LJ
         OcMXFZ9eWaqW2ihVlihnw1lYU4VtM17sy/DTQs8oHnm8cO/Gbkahe0k5y8E5Ujxl93kM
         RosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724979633; x=1725584433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LS53wxxaShUerh6Nzz4tUD12WQZd3J6t0NqAtqOlEuU=;
        b=uK/9xsPGJKpKVIjz3HxfBzY9CCr/1W+40uhFa8XGbwr1B/TH1Tp5aZvwTi2KyCQst7
         nOWZ8AST42bmUhpwUJ66Ax3yCSR46JlYeMetUgKLvl7C2Tm/AvmWlyKxxh1TqXu8ECDA
         SUjoYMcgRX9HucnIib75O37eMLk68VlrmGljm3qE7x0HtLfBKF2/V/Petfdfeu0AQARv
         wPWg8epyuqaLJ7tiNO/0rGIoKMJI9dpF/cRs/NsXS7Q6gcFjiJZIs7vJpO04A7w6mLLm
         GzvoLiil57YjZGXcaosNjfC5kMaUrUeldraCUobkxSkb9f1suFqjdfKGpXtzyKGaUPyL
         islQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9XZzPpWOeHw+wCrmJRLC1ElOPfi0XJXAFaZWCdzT4gEgO7ZfijUYWnDmGYUxs1cTNxsFFX+/l+1zMf9w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxJznqucAKYQKTLTTFHx6OkscOAYxFJHODPLTNYuowcsYsJYX6y
	lCSwa/VYqRccG79dgSJgWf+r/S7YFRfNnc81WIn/gCr+qHFsxM9tT1KW3c7xQco=
X-Google-Smtp-Source: AGHT+IHskamnwhuEnVsgXagVygWurPjxZHIPCEOoqvpXtCAUWcyWg3cwyRWbxqEUzrtAK6MXZRChtw==
X-Received: by 2002:a17:902:e84a:b0:202:3e32:5d3e with SMTP id d9443c01a7336-2050c3faf20mr48056025ad.36.1724979631231;
        Thu, 29 Aug 2024 18:00:31 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2051555bf89sm17096775ad.289.2024.08.29.18.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:00:30 -0700 (PDT)
Date: Thu, 29 Aug 2024 18:00:25 -0700
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
Message-ID: <ZtEZqUSkVvi5Bmpt@ghost>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
 <fd1b8016-e73d-4535-9c67-579ab994351f@intel.com>
 <Zs+FYbII0ewwdisg@ghost>
 <4219f619-4b32-40bc-85b8-cb11d76fde98@intel.com>
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
In-Reply-To: <4219f619-4b32-40bc-85b8-cb11d76fde98@intel.com>

On Thu, Aug 29, 2024 at 09:54:08AM -0700, Dave Hansen wrote:
> On 8/28/24 13:15, Charlie Jenkins wrote:
> > A way to restrict mmap() to return LAM compliant addresses in an entire
> > address space also doesn't have to be mutually exclusive with this flag.
> > This flag allows for the greatest degree of control from applications.
> > I don't believe there is additionally performance saving that could be
> > achieved by having this be on a per address space basis.
> 
> I agree with you in general.  The MAP_BELOW_HINT _is_ the most flexible.
>  But it's also rather complicated.

Can you expand upon what you mean by it being complicated? Complicated
for the kernel or complicated for a user?

> 
> My _hope_ would be that a per-address-space property could share at
> least some infrastructure with what x86/LAM and arm/TBI do to the
> address space.  Basically put the restrictions in place for purely
> software reasons instead of the mostly hardware reasons for LAM/TBI.

That is a good point, perhaps that would be a way to hook this into LAM,
TBI, and any other architecture's specific address masking feature.

- Charlie

> 
> Lorenzo also raised some very valid points about a having a generic
> address-restriction ABI.  I'm certainly not discounting those concerns.
> It's not something that can be done lightly.

