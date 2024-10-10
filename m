Return-Path: <linuxppc-dev+bounces-1960-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5F999802A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 10:38:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPNSD0B5Jz3bpn;
	Thu, 10 Oct 2024 19:38:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728549483;
	cv=none; b=fN+lz9HShLBJ5BLWOI9SuK4FzBk7F7Ww7jO28A5BnS+l/pVKlJzqy2YI95qWFOWz6SIjsN8bwP2eF2Fy1+SY641wpGhf9NijGkdDaT4h0UnsGRv/YmhmUoPMfJYC3H6O6eo9/sRa7uYcYLazZ3DEh5M8ot4WIt7lL0v3VFQqCfUDWFgXCO1HlkQ1F/sHgWmCXN2vM0VqCB+9NavHmQvepdKpW50aXEU1imCbefZPifaqtTs1HZqJCbEFiithEXg5yXyez98kX0h/xEgZjwCJAJlhQUSaP4oxnXBW97bP2Ce1uYzzEsMaP7QqsFEgSrZ4FwsrKSuYQObTZKbG4Wmrdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728549483; c=relaxed/relaxed;
	bh=WrWTn2Oq+Rhw9veaoLDKyeXM5cqwIWw+RVmdXKxlKas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANP8/rMrIlz/65pgyogtBzKhq0kUleSujO65unPMKYHuRlIH51wowLbwNTtyHkUULKVmEuyUmNsKmAW0Xig9/OA7SJrRsUvNUa+3aCzwWprxc2fQ+488MjvX5NW1xXdDbjyMjb+/DksK071zhur399jzMWGY61KLOcNRb/nrplblCymlTZFbNMTonNRodBeKZcDureFUuUO/F2YaNVWMFK7YrdVzVs0lxsvsKA/735IeCMSz3VpV5SuHUcXeO7TkTLWqol07mOPRxXDnnQdhPzNZicDCy5YaFszMvXfpTeQu2dOohK+KtrFBK1qOjZBlfFQzWMBlSIw/0dqkfxCzrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org) smtp.mailfrom=lst.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPNSB70pVz3bnD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 19:38:02 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1D670227A8E; Thu, 10 Oct 2024 10:37:57 +0200 (CEST)
Date: Thu, 10 Oct 2024 10:37:56 +0200
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
Message-ID: <20241010083756.GA8685@lst.de>
References: <20241009114334.558004-1-hch@lst.de> <20241009114334.558004-2-hch@lst.de> <3e12014e-47a7-4cae-bcd1-87d301e1f80c@app.fastmail.com> <20241010070342.GB6674@lst.de>
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
In-Reply-To: <20241010070342.GB6674@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 10, 2024 at 09:03:42AM +0200, Christoph Hellwig wrote:
> > I think we should try to have a little fewer nested macros
> > to evaluate here, right now this ends up expanding
> > __pfn_to_phys, PFN_PHYS, PAGE_SHIFT, CONFIG_PAGE_SHIFT,
> > page_to_pfn and __page_to_pfn. While the behavior is fine,
> > modern gcc versions list all of those in an warning message
> > if someone passes the wrong arguments.
> > 
> > Changing the two macros above into inline functions
> > would help as well, but may cause other problems.
> 
> Doing them as inlines seems useful to me, let me throw that at
> the buildbot and see if anything explodes.

The inline version instantly blows up, so I'll try just open coding
the phys to/from pfn translation instead.


