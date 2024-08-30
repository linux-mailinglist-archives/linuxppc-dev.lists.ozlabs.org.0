Return-Path: <linuxppc-dev+bounces-776-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A66EF965474
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 03:10:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww0SL3rghz301G;
	Fri, 30 Aug 2024 11:10:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724980210;
	cv=none; b=lwP7djSp9n+HsRtF0syxkxCPao7955nVAI5WU/vZw+QvyCv+ZAed2BvETPw8YQwI1BrTjI3uxmasIgl+iIfYlywnDl1cDqwVGtr286rOl/Bx2bpFIPlmkTPBZmIPVRVCu7SZRhDnSQJig+f3XZdT77ha1L6CbbmVs4Qs9lQW9HEY02t/4BU9t+gp3W0pFymSRS6bAmJXXfrQFP+1lz1IONF1Jrqk3qmYkETHKZ8lTsr7AXcXuCX6ARaT+F2dkYz7clmQxFShaBpmBnepku5d18Oay3mEhWHgXJpSMUminqJn9vI6IrMK9kjkdyzzDFZSQKSbq4EGWsn362Wwf/NBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724980210; c=relaxed/relaxed;
	bh=CwoqNPnm0PFMKEw2mojvKZssW8GhVCDsDfQmuaD4p/M=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=gjvKTKwggf1i1ZhnIKk+8q/za0pjDDONNLeK+CvYFEbTgtEo9dF9kIbmm5X5bSSDPDuSHHQU699Xyv/kqOKi1eaztf+pOOP3nEqM7sJKI3cpf2IkmxlWAzsfpNUH/DaR3uylnz5sB1GYms8B7vfyVjuYk87v9ECrk/w5O7JGoApvVOPXpUTK+fsAOzBah6EmFOO4U0aXhl7XfC6ahzwd8xoBojnJ6/zgVjhIOezcttLlQpuX3C7e7F8mBLi00/lp8I5uTkgu9lo2k5JLcird/nH3PLvFM18j+0pS6WyaDj0cJ8rftV8Npalw+LQSA8OBi3+RIcpqLenSQ48YcBoq8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=JcQp0GxG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=JcQp0GxG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww0SL0GZbz300B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 11:10:08 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7bb75419123so787004a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 18:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724980205; x=1725585005; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CwoqNPnm0PFMKEw2mojvKZssW8GhVCDsDfQmuaD4p/M=;
        b=JcQp0GxGlpOY/24sX//gVwCXUdKVfW2PPyBGkDl3ywuh6DyrdKhwDq8z1fmT8viOh7
         ipVgajaA8N6ckVmKTKMhLH0d3oPknwYf+rvO5tAQD1fXbqAVmUHDlNR1+9l8iz1gcrG1
         vfPNTLDs5qqh2DsK4byWavCddqp3Xba0CZ4EVML+oVMIYsU82QQ5HgOUQZ05Ik16i1xc
         e7p3do/xbOHdx870dj2xOWFqWQl0BlwHxpRpjJeo4D9MxA6WddDrGSw7LmK6E1H0OfpF
         WaKAe4/IETRVeKcvlDL9nY/LskBeP2z6S3aS4n6rNdVMauVc8g4ziy0O8MPssLgMwbiN
         VhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724980205; x=1725585005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwoqNPnm0PFMKEw2mojvKZssW8GhVCDsDfQmuaD4p/M=;
        b=GshQd6JXuRFf/wSZ7ldJtge9NmMWjU1dyk6ckB2meVdxMbD2VQr5Rb82bZJOhUQf/x
         APmVEFmFMjXhp9SiEokmxjBXrBfN0SMRu55S2EoEilWE0BDO9lAqKn3Vor+a1PPVW/sc
         ZmltA9CzYdvg9D3zwaIc97wr+iVXgdhlpCIcKRWT2gPH0T7E0A+BFJC9wAsZYPEVzIMz
         2XsDmdPQvjd8jZmhBT2NC3MsVf9D67KvYhOe8Jlbnhb7IlKkBW8gIZ/MV6CbrMvE7Lqa
         oe26fL+fCpPgzbsz2LbeCoo5mx3bLSOy/ExoZ7DE+K5mexk5iUZBb5Z4qKLznCqcQf/0
         SDjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrM+Wi7ELD4mHJxc7QXBQ6/N0f+Tyq95IinXnlWphrYVpHdtYSs073Zi07ZlML4AsJhsrszq848twrEXs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwFJIPJ8d8wPfyvyZQ7HDW4GpAppKWsNIEI46gLVFESXqQJmztL
	+qNVKqvIszs2j9pPGs6sVt/byi2T2J565Af1z27RUDBYGcbSY0ywcC7nx2TFn7Y=
X-Google-Smtp-Source: AGHT+IHjWR5hohyc19lNozH4CTnGNOicvRPszOH5PvlKyMQFSKFQKAXiGMUabKYrMEs/kL3dRfpZ8w==
X-Received: by 2002:a05:6a21:3943:b0:1c0:f216:7f20 with SMTP id adf61e73a8af0-1cce10ec619mr4946320637.49.1724980205096;
        Thu, 29 Aug 2024 18:10:05 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b1326sm17228115ad.35.2024.08.29.18.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 18:10:04 -0700 (PDT)
Date: Thu, 29 Aug 2024 18:10:00 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
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
Message-ID: <ZtEb6EogqifmKrQU@ghost>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
 <fd1b8016-e73d-4535-9c67-579ab994351f@intel.com>
 <Zs+FYbII0ewwdisg@ghost>
 <4219f619-4b32-40bc-85b8-cb11d76fde98@intel.com>
 <pzxlpwxbrs3pali53bogsorwebi45ayqivxmpeagrhvdh7zt4u@ybsa2vnkze7v>
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
In-Reply-To: <pzxlpwxbrs3pali53bogsorwebi45ayqivxmpeagrhvdh7zt4u@ybsa2vnkze7v>

On Thu, Aug 29, 2024 at 03:36:43PM -0400, Liam R. Howlett wrote:
> * Dave Hansen <dave.hansen@intel.com> [240829 12:54]:
> > On 8/28/24 13:15, Charlie Jenkins wrote:
> > > A way to restrict mmap() to return LAM compliant addresses in an entire
> > > address space also doesn't have to be mutually exclusive with this flag.
> > > This flag allows for the greatest degree of control from applications.
> > > I don't believe there is additionally performance saving that could be
> > > achieved by having this be on a per address space basis.
> > 
> > I agree with you in general.  The MAP_BELOW_HINT _is_ the most flexible.
> >  But it's also rather complicated.
> 
> There is a (seldom used?) feature of mmap_min_addr, it seems like we
> could have an mmap_max_addr.  Would something like that work for your
> use case?  Perhaps it would be less intrusive to do something in this
> way?  I haven't looked at it in depth and this affects all address
> spaces as well (new allocations only).
> 
> There is a note on mmap_min_addr about applications that require the
> lower addresses, would this mean we'll now have a note about upper
> limits?

I don't think that's a viable solution because that would change the
mmap behavior for all applications running on the system, and wouldn't
allow individual applications to have different configurations.

> 
> I really don't understand why you need this at all, to be honest.  If
> you know the upper limit you could just MAP_FIXED map a huge guard at
> the top of your address space then do whatever you want with those bits.
> 
> This will create an entry in the vma tree that no one else will be able
> to use, and you can do this in any process you want, for as many bits as
> you want.

Oh that's an interesting idea. I am not sure how that could work in
practice though. The application would need to know it allocated all of
the addresses in the upper address space, how would it be able to do
that?

> 
> > 
> > My _hope_ would be that a per-address-space property could share at
> > least some infrastructure with what x86/LAM and arm/TBI do to the
> > address space.  Basically put the restrictions in place for purely
> > software reasons instead of the mostly hardware reasons for LAM/TBI.
> > 
> > Lorenzo also raised some very valid points about a having a generic
> > address-restriction ABI.  I'm certainly not discounting those concerns.
> > It's not something that can be done lightly.
> 
> Yes, I am concerned about supporting this (probably forever) and dancing
> around special code that may cause issues, perhaps on an arch that few
> have for testing.  I already have so many qemu images for testing, some
> of which no longer have valid install media - and basically none of them
> use the same code in this area (or have special cases already).  I think
> you understand what we are dealing with considering your comments in
> your cover letter.

It is definitely not something to be taken lightly. The version 2 of
this is completely generic so that should eliminate most of the concern
of "special code" on various architectures. Unless I am misunderstanding
something.

- Charlie

> 
> Thanks,
> Liam

