Return-Path: <linuxppc-dev+bounces-1102-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2383696F360
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 13:44:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0ZBT3130z2xBk;
	Fri,  6 Sep 2024 21:44:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725623041;
	cv=none; b=fgmBOTSFiyo2x9jyoe2mSUd3Uc9oLOPcWr89m9x8VjGEqD5KwP4NLM/mtmh/o2F0Gxu7wANarvKdUWSb5hxMBFiMAaIB/g4B3JGK0RKVcjzYiCAmWfTjU/aMFQOgpBnVU+6rysmf3P0ZsH6bRq4b5YdnZ68YnnHDdgbLHpB3895hpNPrKhjbxbeuuTqaO7twbpsspk8Va5axyBRZva/399CmjpAU2t9tDRUx+/Wqw2Wa6ruIHTxJTKfPuojJvHLZL0fkLfT+TFDF8/euoX4mvo1f/no5uaKtvt38X279+qXdiyBu7iL/O8zppHc9A0ML0zGlF02PH+MCq37GBKzVuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725623041; c=relaxed/relaxed;
	bh=jlW+lt5ymLFjFq1OwMUOAB40jG76BrJeobGs1x3SCuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R9MdGY5P38fIt/cJ4RRQpemwo78VvKzFCxp8DZnU52tRelj6B7ccONKcXV92y9saLZppFjkMDJMPRoaTNpJpBXcsV8aCESfOFODrfOhdsXyVKdYIb30Hkgj2GFhd5ewM/cdCMtHp+66fFvZXWIztf35ixXTEAxiTcgjV8nMACVFIN8GoYd7mAF3jG0pCEg/iRmlN35jbPQdQqp0AW0gVdhLnjNDK5x/hQktcVu3D00iDVzRHFnN6nlCqM5nKQAvYiWaRsSXGAHkJYYd4Gpl6ZU3XM6gvbItBF5EyFOH73jqNPk9OO1EbINmvaD5ObJ0p2AL4pp1BJK0p5vIDNX37GQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0ZBS35MFz3064
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 21:44:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 40C6FA44F2B;
	Fri,  6 Sep 2024 11:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE75C4CEC4;
	Fri,  6 Sep 2024 11:43:46 +0000 (UTC)
Date: Fri, 6 Sep 2024 12:43:44 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: guoren <guoren@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>,
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
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
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
Message-ID: <Ztrq8PBLJ3QuFJz7@arm.com>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
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
In-Reply-To: <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>

On Fri, Sep 06, 2024 at 09:55:42AM +0000, Arnd Bergmann wrote:
> On Fri, Sep 6, 2024, at 09:14, Guo Ren wrote:
> > On Fri, Sep 6, 2024 at 3:18 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >> It's also unclear to me how we want this flag to interact with
> >> the existing logic in arch_get_mmap_end(), which attempts to
> >> limit the default mapping to a 47-bit address space already.
> >
> > To optimize RISC-V progress, I recommend:
> >
> > Step 1: Approve the patch.
> > Step 2: Update Go and OpenJDK's RISC-V backend to utilize it.
> > Step 3: Wait approximately several iterations for Go & OpenJDK
> > Step 4: Remove the 47-bit constraint in arch_get_mmap_end()
> 
> I really want to first see a plausible explanation about why
> RISC-V can't just implement this using a 47-bit DEFAULT_MAP_WINDOW
> like all the other major architectures (x86, arm64, powerpc64),

FWIW arm64 actually limits DEFAULT_MAP_WINDOW to 48-bit in the default
configuration. We end up with a 47-bit with 16K pages but for a
different reason that has to do with LPA2 support (I doubt we need this
for the user mapping but we need to untangle some of the macros there;
that's for a separate discussion).

That said, we haven't encountered any user space problems with a 48-bit
DEFAULT_MAP_WINDOW. So I also think RISC-V should follow a similar
approach (47 or 48 bit default limit). Better to have some ABI
consistency between architectures. One can still ask for addresses above
this default limit via mmap().

-- 
Catalin

