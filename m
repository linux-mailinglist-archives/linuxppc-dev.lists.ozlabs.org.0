Return-Path: <linuxppc-dev+bounces-4291-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A659F62D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:25:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCqZl0wC8z2yDM;
	Wed, 18 Dec 2024 21:25:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734517551;
	cv=none; b=HKUqDUMWxUq3fIXTEStn70CWFZnQ6fFNWLozWWI/rrzhp0FBjFkJX9Ue2kG96MAWJbMoj8SieZQpqQ6UVOD41gecpK6vN5QScDT2+fqRGWFIdi9ZtZMoKUZaDnHtdIBI3BwahGmSqdEn8Ho5fegKKLebC9WM7861Yy9nGVtnNif8ArKF8ZAm8pKk0T62yh4F/jlCqAAkQKpeib2C2b15HSXCrYgsebMRytVFeEiOEIdk+hCWK4LjmNZi0fe9Q9tF/Xv8lkteuP/MlfvS5Tge9Ci+CFQVjvtM0fnZH9/gj7qeu5S/V92DyPxDs9hyhK9qgInYuCLLHU3mhrql0lvItQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734517551; c=relaxed/relaxed;
	bh=Wc3y2MMAV4l4fXGHcieZbsIyWfTg/ozhFPhFb4lifrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3qWrlZvzwN6o4l11zjNQ1DjEdU2BkmQlrDV80NgZ5ptAEkPNE6vlI2fi4zfnmLjmHSJUloJQFnYMmpLJOxHy8g5mT9TwEJuWaAVSehtI0OVaQj7Jsp0oDPBS28aT5CtQcdk6M99cP8Kr3Xsiiw7Iuxp09rR9Emv/rKauK2EvaltfuDP/74bEVbbp1TB2/lpMSEypOb41Mf0ajWG+NI265UBJ7a6Fs7ZpoJhhesatAvZUID9EQGjzMVhTBoDMv6Ha/sLsuIiapMctULHd/SFIEKFQrRvQuyl8ihRnm4sKJ3g8GyVFPvAuvBBTuXsMncDhWV+GzQE7+tEehKJKYQI0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2SSWoTmi; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AoKeNEyu; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2SSWoTmi;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AoKeNEyu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCqZj4XVSz2yD4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:25:49 +1100 (AEDT)
Date: Wed, 18 Dec 2024 11:25:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734517545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wc3y2MMAV4l4fXGHcieZbsIyWfTg/ozhFPhFb4lifrk=;
	b=2SSWoTmikqml+QyzziVj/m4Yg45xAoP4dNtwTBlJig2p14toOtHozKw5Bxfjy4L/DvACGV
	OMNT4R2Rekm2Ck8CCOW0XGD1j8FoyZrt3Z7jazkfGB6Zv+KWrHTMOhmUum+sr+mgUm1e61
	TM1KWhbGQXbTlvxJf51hlLY47fK7pZY7y05qey8SsXBH0Nkg9uMgzFSWUJ30b/nxZp2S3N
	Hy4DtDnFlOUNAID7T8cQaJtlrwqn059Y+FAOYDMu2CWWxXTn5NsAeABAkO/WY90H+pP48R
	uMCgaoU5KLrPl82I7qw8SvgoxROfvTSXg9ibM/gPkLEPvpm/oD+JPk198PVRXA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734517545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wc3y2MMAV4l4fXGHcieZbsIyWfTg/ozhFPhFb4lifrk=;
	b=AoKeNEyuPrW2z0f+0sR+kxNpoFiiPy1/gq9ak22q5IqO1FLos7EO/vgThimKc+44ktm5ZR
	tRGCj/jF+KFa4yBw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 03/17] vdso: Add generic time data storage
Message-ID: <20241218111724-41f5e3c6-f41d-41ec-beed-bd05cca05016@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
 <20241216-vdso-store-rng-v1-3-f7aed1bdb3b2@linutronix.de>
 <3b44defd-cd2a-4a3c-b72d-bcc0530336da@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b44defd-cd2a-4a3c-b72d-bcc0530336da@csgroup.eu>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Christophe,

On Wed, Dec 18, 2024 at 08:32:14AM +0100, Christophe Leroy wrote:
> Le 16/12/2024 ‡ 15:09, Thomas Weiﬂschuh a Ècrit†:
> > Historically each architecture defined their own way to store the vDSO
> > data page. Add a generic mechanism to provide storage for that page.
> > 
> > Furthermore this generic storage will be extended to also provide
> > uniform storage for *non*-time-related data, like the random state or
> > architecture-specific data. These will have their own pages and data
> > structures, so rename 'vdso_data' into 'vdso_time_data' to make that
> > split clear from the name.
> > 
> > Also introduce a new consistent naming scheme for the symbols related to
> > the vDSO, which makes it clear if the symbol is accessible from
> > userspace or kernel space and the type of data behind the symbol.
> > 
> > The generic fault handler contains an optimization to prefault the vvar
> > page when the timens page is accessed. This was lifted from s390 and x86.
> > 
> > Co-developed-by: Nam Cao <namcao@linutronix.de>
> > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > ---
> >   MAINTAINERS                    |  1 +
> >   include/linux/time_namespace.h |  1 +
> >   include/linux/vdso_datastore.h | 10 +++++
> >   include/vdso/datapage.h        | 69 +++++++++++++++++++++++++----
> >   lib/Kconfig                    |  1 +
> >   lib/Makefile                   |  2 +
> >   lib/vdso_kernel/Kconfig        |  7 +++
> >   lib/vdso_kernel/Makefile       |  3 ++
> >   lib/vdso_kernel/datastore.c    | 99 ++++++++++++++++++++++++++++++++++++++++++
> 
> There is only one single file, namely datastore.c. You don't need a new
> directory for that, I should go in lib/vdso/

lib/vdso/ currently only contains userspace code.
I don't have a strong opinion on that.
The lib/vdso_kernel location was suggested by tglx, maybe he has some
feedback. (Originally I put it into kernel/vdso_storage.c)

[..]

> > +enum vdso_pages {
> > +	VDSO_TIME_PAGE_OFFSET,
> > +	VDSO_TIMENS_PAGE_OFFSET,
> > +	VDSO_NR_PAGES
> > +};
> 
> Naming that VDSO_ is confusing. Most macros called VDSO_ are related to the
> VDSO Code. VDSO data related macros should be prefixed with VVAR_

Also a request from tglx.

[..]


Thanks!
Thomas

