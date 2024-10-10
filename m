Return-Path: <linuxppc-dev+bounces-1952-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4078B997E6A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:05:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLMX5MmBz3bpN;
	Thu, 10 Oct 2024 18:03:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543832;
	cv=none; b=C/Qo8dqkTtV0eKsBM+rjxDHgolAaEEuQP3YttmWSAwWNAh9RRK/sbdsbhta1FeA9DYmaCorRyrFJZ0UbEVOrjwIyBDyN4DcF0xhG/u2VI6W+c1ula9X0JAZscumkvO0dcNJN6Snl3EnGBKlziN8h1dgxybk+KTI8sIIdcUQ2MjjyDzdk4WTpnpzfFcy0Bv8LEJeIB7hfzIXy2jDZWtbg8XfMP3ZJPRvFOIjV738RxB/ltx78/ioitetmbmBQ4SK7BrgeLbXZgRKf5n3c3q3DKY+whoZ8EqDiRyarw2h81RGW0wr7SbVdIAaY5CqLvaL3cHhCLZm6JzpSaFEop+sAjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543832; c=relaxed/relaxed;
	bh=1L5wqIlmHIp0sefSX7Jl3+4l/GpyP0ad2y5VEmhBwgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YoZ5VS2INNj8joPJxASBLX8wuIDWLCSbwg7MNo1bXr+rGTarnHlG5Mzhty1ARNoQw0Gc2ioAfA+NL+fhYBEuc3oEXIXDou4fCVDZish/iFBV1GVWZR0viHbuc6JIcwUeYnDplL4DJ+eE02Rc73VMH/eggA2e9dgayK+Rsp9DNL8KoPPBuHOlHzSbYa+nkWL24z8BOVkL6dmfGt9ULxZyXI1XO89FkKR76JzmkNkur1NT/h8+UiQMnIln0rdPRt1dKzR+Pxcoa2jJhkAFh/P72zrXJ713iwTUmYWUXD43oc+GA++ElSVAGWMloai8D06AI4rjCbg+rTLimA6e4TL0GA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org) smtp.mailfrom=lst.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLMW100Kz3blv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:03:50 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1F3E4227A8E; Thu, 10 Oct 2024 09:03:43 +0200 (CEST)
Date: Thu, 10 Oct 2024 09:03:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@lst.de>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	Linux-Arch <linux-arch@vger.kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] asm-generic: provide generic page_to_phys and
 phys_to_page implementations
Message-ID: <20241010070342.GB6674@lst.de>
References: <20241009114334.558004-1-hch@lst.de> <20241009114334.558004-2-hch@lst.de> <3e12014e-47a7-4cae-bcd1-87d301e1f80c@app.fastmail.com>
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
In-Reply-To: <3e12014e-47a7-4cae-bcd1-87d301e1f80c@app.fastmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 09, 2024 at 02:06:27PM +0000, Arnd Bergmann wrote:
> This is clearly a good idea, and I'm happy to take that through
> the asm-generic tree if there are no complaints.
> 
> Do you have any other patches that depend on it?

Well, I have new code that would benefit from these helpers, but just
open coding it for now and then doing a swipe to clean that up later
together with the existing open coded versions is easy enough.

> > -/*
> > - * Change "struct page" to physical address.
> > - */
> > -static inline phys_addr_t page_to_phys(struct page *page)
> > -{
> > -	unsigned long pfn = page_to_pfn(page);
> > -
> > -	WARN_ON(IS_ENABLED(CONFIG_DEBUG_VIRTUAL) && !pfn_valid(pfn));
> > -
> > -	return PFN_PHYS(pfn);
> > -}
> 
> This part is technically a change in behavior, not sure how
> much anyone cares.

Well, the only other comment to the patch so far mentioned it.
It also feels like a useful check, but I'm a bit worried about
it triggering in various new places.  Although that's just with
CONFIG_DEBUG_VIRTUAL and probably points to real bugs, so maybe
adding it everywhere is a good idea.

> > +#define page_to_phys(page)	__pfn_to_phys(page_to_pfn(page))
> > +#define phys_to_page(phys)	pfn_to_page(__phys_to_pfn(phys))
> 
> I think we should try to have a little fewer nested macros
> to evaluate here, right now this ends up expanding
> __pfn_to_phys, PFN_PHYS, PAGE_SHIFT, CONFIG_PAGE_SHIFT,
> page_to_pfn and __page_to_pfn. While the behavior is fine,
> modern gcc versions list all of those in an warning message
> if someone passes the wrong arguments.
> 
> Changing the two macros above into inline functions
> would help as well, but may cause other problems.

Doing them as inlines seems useful to me, let me throw that at
the buildbot and see if anything explodes.

> On a related note, it would be even better if we could come
> up with a generic definition for either __pa/__va or
> virt_to_phys/phys_to_virt. Most architectures define one
> of the two pairs in terms of the other, which leads to
> confusion with header include order.

Agreed, but that's a separate project.


