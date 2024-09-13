Return-Path: <linuxppc-dev+bounces-1319-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A73C2977CF6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 12:08:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4qlD4YWSz2xpp;
	Fri, 13 Sep 2024 20:08:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726222120;
	cv=none; b=eMiqasy9nkPLnbk8IB8QBaIgXx+M5S8mvYoXdeBEZFlVIIDqghQLSh5vE/91WV+8QVlgkxZUvA4bUtdWMrC6q8Llm1jpyzCZ+W3ig563GelaNZXtCsN3mK9Aq5UqF/GIDLjmSSf4K6+kIGeDGcbbf7pGIyU2nCrLTlOCuWrsHt24OIXYDHh68M7IPFF4nAwOHSK56F2UFYsr1J8v+GQ6zr82U2Bjb3SLwq6DCX90aH0O6FJhd+0IX0NKY1SZ1pARJeg3J5a8X1O/F0wenfa5yuj2N0QE/oYFbkOp39IqJgTInxgdaCsn800/ayqaQbBCkobLKgMAQxWwfUgkavVLZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726222120; c=relaxed/relaxed;
	bh=TweDDHI2ARS+GK98XoLAM8mQSvo7vXxoCmAiGX8qaco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jk6onNpTo76GcSnokM1QchTZxe0G8WXySJPfFZJ7Xc2KTTgVa08KrZV6EBTmrT+KSQjjnEhlfDH+gb5M/zUt8FWfyrVid7fI2FnhKWPNjXUR4wEHoO2sBIu/5mShGAZCRe3QNgTAg0OkF7g0qgbs4LD2vBD9KeRDAZ4aqkCCfxb2Wk+EW41obKUfgVTLN2dsZYGAgnjuCZtAjH1yrgsRgILZCIyLcibaOkWV9hE5D4xgDLqj4CIphIXyi+RE7bfKrOej87m8QHn9566/dpJfWuAznWnRHOWdwILuPcJiOiIG8AFqbXT+JdsuTSYi4B0LqoprJtrFn1OsB28fLPkrfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4qlC4RcKz2xn5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 20:08:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A67CBA45BAF;
	Fri, 13 Sep 2024 10:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6077CC4CEC0;
	Fri, 13 Sep 2024 10:08:25 +0000 (UTC)
Date: Fri, 13 Sep 2024 11:08:23 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
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
Message-ID: <ZuQPF7Gbcqzq0U6N@arm.com>
References: <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
 <Ztrq8PBLJ3QuFJz7@arm.com>
 <oshwto46wbbgneiayj63umllyozm3c4267rvpszqzaopwnt2l7@6mxl5vydtons>
 <ZuDoExckq21fePoe@ghost>
 <ZuHfp0_tAQhaymdy@arm.com>
 <ZuKHpFB+uWuJe2xm@ghost>
 <ZuLIPZId9aHcAY2j@arm.com>
 <ZuNaD+zAXiAulc0n@ghost>
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
In-Reply-To: <ZuNaD+zAXiAulc0n@ghost>

On Thu, Sep 12, 2024 at 02:15:59PM -0700, Charlie Jenkins wrote:
> On Thu, Sep 12, 2024 at 11:53:49AM +0100, Catalin Marinas wrote:
> > On Wed, Sep 11, 2024 at 11:18:12PM -0700, Charlie Jenkins wrote:
> > > Opting-in to the higher address space is reasonable. However, it is not
> > > my preference, because the purpose of this flag is to ensure that
> > > allocations do not exceed 47-bits, so it is a clearer ABI to have the
> > > applications that want this guarantee to be the ones setting the flag,
> > > rather than the applications that want the higher bits setting the flag.
> > 
> > Yes, this would be ideal. Unfortunately those applications don't know
> > they need to set a flag in order to work.
> 
> It's not a regression, the applications never worked (on platforms that
> do not have this default). The 47-bit default would allow applications
> that didn't work to start working at the cost of a non-ideal ABI. That
> doesn't seem like a reasonable tradeoff to me.  If applications want to
> run on new hardware that has different requirements, shouldn't they be
> required to update rather than expect the kernel will solve their
> problems for them?

That's a valid point but it depends on the application and how much you
want to spend updating user-space. OpenJDK is fine, if you need a JIT
you'll have to add support for that architecture anyway. But others are
arch-agnostic, you just recompile to your target. It's not an ABI
problem, more of an API one.

The x86 case (and powerpc/arm64) was different, the 47-bit worked for a
long time before expanding it. So it made a lot of sense to keep the
same default.

Anyway, the prctl() can go both ways, either expanding or limiting the
default address space. So I'd be fine with such interface.

-- 
Catalin

