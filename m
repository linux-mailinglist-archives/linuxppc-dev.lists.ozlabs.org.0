Return-Path: <linuxppc-dev+bounces-1822-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D320A99445C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 11:32:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XN9m23NDYz2yDr;
	Tue,  8 Oct 2024 20:32:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728379954;
	cv=none; b=QMfFtIuHBivGQM/inXJHk5Fh9AV7lO5gWfpAwqx1klnjfSXmpMHGqT6uC1ngtA2n1ebtnyYJaVcASLLeBkyjtVpyi3S3RyRCM0BIXMjUKCA5aMjkw90Mgwogrm0H3pvTaBZrotfstuLHVytfEiZI9wW/l1/DGt1Io4sQy5Pc6oSWfly+Y6FIRFkKMj9C5ToHsG63MHoQ9j+huqmmnGRg9i1ABpPCNT+/rO/WMe6llDu3sWEiiyxBHoLTBYA4yqYhAIdtKdZny54SDgpuAso4rmFkMFnZTgbWaWJjso4nLPczTF3P9gD4mHFMzK+RDazqSsMVU+KGWDi47Hgw8WEdUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728379954; c=relaxed/relaxed;
	bh=xyGcAKqyXdq1kSPPIkmS99LVfnBS63wwbbsowm8iq4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J39b6N13qz43xDHArLa3C8M9+vv1nWu3mYciyFdjYGt4QnSqm1i+YR85A1JdUuGs1fBEjes6Zm2dRL1hoEMRrcsS42SNzLgFMuW5wRJMjmYnRbBoddt0KZ3/iY5v3voF0pBS8mPmnCwYKqVicip1Vlq8Q7GZmfDQjn3JeOwXCQjmuwXfE8ZEx43fxUrar0JSjJUEpvmUsJfDQS5XIstNuE6thd8g9wLxNFg0VVEU65BYN1MHuMxcpDbCS6YdaXODoLpyHwxYAOmrpXBDihNpFEov+Atkgp+zJjvVVMsTQ3voePlK2r8y87KMJbDNMV3mcPLIWvFZD2rhB9qn2MMJiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XYRYWS+z; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+25c59db37f98b80c3af3+7716+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XYRYWS+z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+25c59db37f98b80c3af3+7716+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XN9lv0Kgpz2xy0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 20:32:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xyGcAKqyXdq1kSPPIkmS99LVfnBS63wwbbsowm8iq4M=; b=XYRYWS+z8RIT/Be1e2fyTGrd8w
	OBh+/6Eu8oetgJeuRXO6F/qwYxKs93aV+jSBfCUQZUZJuwswFVdCV8cfUI/KPCr+hpqzu915OEm38
	tOkHhS0ZfpNycGScxB0pgnhWhUBXr1err78VRrD3tQLvcSDFYWQtqqJBzV69jpNmY/3khV+Co/aDq
	VAIA7JLYOQlPeuZkAryO/CFCwR0gDMl3wekA74MHSI/HWLqOt0qqjilQGRw9Le8RRVAnc6G4GFaDe
	TxfCMXqTAfi6s1U0TizGEdFRJSL/eLiVdQlFOPtJnNWrO9Y0b6Ay4himMovud1gGUhvuJOVQDhQDk
	z93gEE8Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6ZW-00000005Jsk-3rIF;
	Tue, 08 Oct 2024 09:32:02 +0000
Date: Tue, 8 Oct 2024 02:32:02 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Julian Vetter <jvetter@kalrayinc.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, guoren <guoren@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-alpha@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org,
	Yann Sionneau <ysionneau@kalrayinc.com>
Subject: Re: [PATCH v8 01/14] Consolidate IO memcpy/memset into iomap_copy.c
Message-ID: <ZwT8EjvlknRYeDas@infradead.org>
References: <20241008075023.3052370-1-jvetter@kalrayinc.com>
 <20241008075023.3052370-2-jvetter@kalrayinc.com>
 <a9fa56b4-b00c-4941-8c8c-1d3b58b573e2@app.fastmail.com>
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
In-Reply-To: <a9fa56b4-b00c-4941-8c8c-1d3b58b573e2@app.fastmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 08, 2024 at 09:27:20AM +0000, Arnd Bergmann wrote:
> >  #endif /* CONFIG_TRACE_MMIO_ACCESS */
> > 
> > +extern void memcpy_fromio(void *to, const volatile void __iomem *from,
> > +			  size_t count);
> > +extern void memcpy_toio(volatile void __iomem *to, const void *from,
> > +			size_t count);
> > +extern void memset_io(volatile void __iomem *dst, int c, size_t count);
> > +
> 
> I think having this globally visible is the reason you are running
> into the mismatched prototypes.

Yes, especially as architectures sometimes actually implement this
as macro or inline function.

Please also drop the pointless externs while you're at it.


