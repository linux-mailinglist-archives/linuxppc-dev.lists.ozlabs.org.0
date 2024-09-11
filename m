Return-Path: <linuxppc-dev+bounces-1228-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A429197477F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 02:45:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3ML61wCxz2yWr;
	Wed, 11 Sep 2024 10:45:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726015518;
	cv=none; b=Oz7+XONQMDXwLMSxoLH3/qosdjvrRZxpJeNGmgaJuUbgOPQzLb3ngnQjEzo79tZjldAjdnyNsdwB46FKlCcV4zZG2U8iGJQyj5X19+MOSCWxjtJfGxoNcIWET9QQNFLy95o5YNr+vtp1NxVceh9VhwA3C8Sx/WUfPnH9YBaZ4725PJY8t+oxfozo48oinkW3ke3jA84znn65DuoQNt4dXpRzR5CbBeb6s3FAeLo1A5X2FkeXe3u5mZjWCaSWMa69p8pwivqOul9BM/ZNWwZYGhYtL9TA85VcRR1lMfNdpH6SyoVOY8O+FQMSFyk8j5q52dVDfi2LJHO6Y62c/SbOWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726015518; c=relaxed/relaxed;
	bh=N9UqXwHRW6ngdlKfPJV8zADUN4nB1bOhg7HrFQqhnhI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGTv4TkrOhvYyG/ZetVo5HOU6ybyAQyDs90SHwpYiEFRjk37NdVYbNLM/cuQC1Tj64PPW+wS5yN+Z+lRTJnZ6s2bXhJkVE3CU+FCkgINDWRthxzoEkd7oPCEa7h5Nu44tjPaibwdndwQGDG6Y3dJQyerTYlPBUEJ/KUWWoTa+pUVlF/sH0dxhKwapoMkQ1j5oarT/gbTnzYalIU8Tk9ojFpU70AdHlzFrw3iLfo6X/80F7kowzaenMLFxNTjQg6gYEe0+2vuXi/U0bibWzF4WUGFJKF9VGZnC++K3b86THtwjjoFdid77PXOxDB0xZbec0sf40aVu9K6e4TktwvLfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Ziupr/IZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=rivosinc.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Ziupr/IZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=charlie@rivosinc.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3ML50Zwhz2yVD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 10:45:15 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2059112f0a7so56895885ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 17:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726015513; x=1726620313; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9UqXwHRW6ngdlKfPJV8zADUN4nB1bOhg7HrFQqhnhI=;
        b=Ziupr/IZE8dZ6HgO2e8xlrb2CxCU+oM5akAUuzk230vsVOuOZlEcxgSJpA9OL+CDeo
         cMxngN25bXwe/+VrRY/vhobn3qGniv9oWMOntjYFF++i+/StjNOo7Tm9Q9BcDTCSvUj2
         +5HngRn71gX6mokU3usQFnO6CQyqQBZacANAeISrCQx6XY1K5MT0AHvSPrubc09Lx8mF
         UjtrZBtfemrV2efu1CTyKiWdoKgAB/2tGocw4JR36t6WsD7WdyFyG2Nuy3nMxB8O2czO
         Ysyhex0KUL4SuX+zY2JHjRJHVq1koRMhOQmkbsUrNLGDC6UkicVHFcq1gBpUgsB2cGv3
         a4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726015513; x=1726620313;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N9UqXwHRW6ngdlKfPJV8zADUN4nB1bOhg7HrFQqhnhI=;
        b=ACVNpmjAR2r/vEnO9mMk/v0/n9eu0M8x3n+RJNSxDFrlUMqcs2uA9Z63j+kKIRmQ6S
         7COGhWJ42Kt2jQhtKEyx9jAUwyg9u613/+weZ0Fkg9eH0mPya2QzpFt1W15SxkgpgY2b
         PmnZsUIc0/qbwEBceqole1imoWH80vsg70L2SuxJoiHXYPjWu8xC9B8pV0exz6YgwyWG
         5IpKaKk81pOcWWc2kNZYLhqsmgD/kfbXgd+41ReYRa6q80rIRrGW7w5mU3xatZ9IefPk
         JcceHWzpnUGJM459DpekClmZWg1KXmStV9IvB3vBkvMghwNM9L4dHC0tq2efNYoLO30z
         65sA==
X-Forwarded-Encrypted: i=1; AJvYcCUDml146lV+2ShltE/RjUdtqgq37BYOPGIXvPCDadozN2xHF5+Hf5k3op3UV6FqQuhVc1tQD0sMtNTgPGw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzE9cdr+017+J+LUD8fnoXfKYUipcL95uOt/f6UFLVfOvQ9ZmWF
	Xxqd8sOcV9MPslOXHUprRSyyOMZPstkwObdzHuO/I2Z5AzZws369UStHoLAIcP8=
X-Google-Smtp-Source: AGHT+IFSjrtRoDoL7sPwVRBWFNV85MfE4DpNXnElb7X54mGXN2iqCTI2uhxpyL/CAIcKh7QAswSthg==
X-Received: by 2002:a17:902:d2ce:b0:205:5427:2231 with SMTP id d9443c01a7336-2074c6a338fmr45444085ad.47.1726015512680;
        Tue, 10 Sep 2024 17:45:12 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710eef1f2sm53832165ad.145.2024.09.10.17.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 17:45:11 -0700 (PDT)
Date: Tue, 10 Sep 2024 17:45:07 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, guoren <guoren@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
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
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	shuah <shuah@kernel.org>, Christoph Hellwig <hch@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Chris Torek <chris.torek@gmail.com>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
Message-ID: <ZuDoExckq21fePoe@ghost>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
 <Ztrq8PBLJ3QuFJz7@arm.com>
 <oshwto46wbbgneiayj63umllyozm3c4267rvpszqzaopwnt2l7@6mxl5vydtons>
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
In-Reply-To: <oshwto46wbbgneiayj63umllyozm3c4267rvpszqzaopwnt2l7@6mxl5vydtons>

On Tue, Sep 10, 2024 at 03:08:14PM -0400, Liam R. Howlett wrote:
> * Catalin Marinas <catalin.marinas@arm.com> [240906 07:44]:
> > On Fri, Sep 06, 2024 at 09:55:42AM +0000, Arnd Bergmann wrote:
> > > On Fri, Sep 6, 2024, at 09:14, Guo Ren wrote:
> > > > On Fri, Sep 6, 2024 at 3:18 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > >> It's also unclear to me how we want this flag to interact with
> > > >> the existing logic in arch_get_mmap_end(), which attempts to
> > > >> limit the default mapping to a 47-bit address space already.
> > > >
> > > > To optimize RISC-V progress, I recommend:
> > > >
> > > > Step 1: Approve the patch.
> > > > Step 2: Update Go and OpenJDK's RISC-V backend to utilize it.
> > > > Step 3: Wait approximately several iterations for Go & OpenJDK
> > > > Step 4: Remove the 47-bit constraint in arch_get_mmap_end()
> > > 
> > > I really want to first see a plausible explanation about why
> > > RISC-V can't just implement this using a 47-bit DEFAULT_MAP_WINDOW
> > > like all the other major architectures (x86, arm64, powerpc64),
> > 
> > FWIW arm64 actually limits DEFAULT_MAP_WINDOW to 48-bit in the default
> > configuration. We end up with a 47-bit with 16K pages but for a
> > different reason that has to do with LPA2 support (I doubt we need this
> > for the user mapping but we need to untangle some of the macros there;
> > that's for a separate discussion).
> > 
> > That said, we haven't encountered any user space problems with a 48-bit
> > DEFAULT_MAP_WINDOW. So I also think RISC-V should follow a similar
> > approach (47 or 48 bit default limit). Better to have some ABI
> > consistency between architectures. One can still ask for addresses above
> > this default limit via mmap().
> 
> I think that is best as well.
> 
> Can we please just do what x86 and arm64 does?
> 
> Thanks,
> Liam

I responded to Arnd in the other thread, but I am still not convinced
that the solution that x86 and arm64 have selected is the best solution.
The solution of defaulting to 47 bits does allow applications the
ability to get addresses that are below 47 bits. However, due to
differences across architectures it doesn't seem possible to have all
architectures default to the same value. Additionally, this flag will be
able to help users avoid potential bugs where a hint address is passed
that causes upper bits of a VA to be used.

The other issue I have with this is that if there is not a hint address
specified to be greater than 47 bits on x86, then mmap() may return an
address that is greater than 47-bits. The documentation in
Documentation/arch/x86/x86_64/5level-paging.rst says:

"If hint address set above 47-bit, but MAP_FIXED is not specified, we try
to look for unmapped area by specified address. If it's already
occupied, we look for unmapped area in *full* address space, rather than
from 47-bit window."

arm64 on the other hand defines this as only being able to opt-into the
52-bit VA space with the hint address, and my understanding is that
mmap() will not fall back to the 52-bit address space. Please correct me
if I am wrong. From Documentation/arch/arm64/memory.rst:

"To maintain compatibility with software that relies on the ARMv8.0
VA space maximum size of 48-bits, the kernel will, by default,
return virtual addresses to userspace from a 48-bit range.

"Software can "opt-in" to receiving VAs from a 52-bit space by
specifying an mmap hint parameter that is larger than 48-bit."

This is an inconsistency I am trying to solve with this personality
flag.

- Charlie


