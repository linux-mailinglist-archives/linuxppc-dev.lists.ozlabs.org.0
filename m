Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5B21EE3DF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 14:04:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49d4FN2YXwzDqNx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 22:04:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=gvn0H32J; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49d4923HvHzDqkW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 22:00:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=94RqwMfQvcXBuc+mBegSNwm7GH2pllORDWyK/Zxwbho=; b=gvn0H32JKoeDF67jj3pUDxvcls
 SDl4QT8dK0M8xIiHyR4VAWaH79D1QG12Le23gvaRhRrpzPc9ZcsTlYXW3HLBITCeK9Tbj7zQx87oF
 hCtj8euyGRASrC/GHomdfZEas0B1n6nu92LzQts3Iiu21AM5Z62kqHEcU28xruNf4KkRvQ+c58+NX
 HQbis2OBEpqS73MDwkPxZ8aRri3pX+DJCGHDzL2Xr+VFtj7lIzpCJwTo/60uH45b5xH+kLTgwh5Y0
 3bXIMhcNiB/IBtRiYxe3E61ZBFJNj2xugf3yxO4szIkHnG8/UqPR6VUDNPOakpINHvFfthnvSEby4
 aFsbsT1Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgoXb-0001ap-Dm; Thu, 04 Jun 2020 12:00:11 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5EC4B30008D;
 Thu,  4 Jun 2020 14:00:08 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id ED20720D8C5A7; Thu,  4 Jun 2020 14:00:07 +0200 (CEST)
Date: Thu, 4 Jun 2020 14:00:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Will Deacon <will@kernel.org>
Subject: Re: linux-next: build failure on powerpc 8xx with 16k pages
Message-ID: <20200604120007.GA4117@hirez.programming.kicks-ass.net>
References: <dc2b16e1-b719-5500-508d-ae97bf50c4a6@csgroup.eu>
 <20200604111723.GA1267@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604111723.GA1267@willie-the-truck>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 04, 2020 at 12:17:23PM +0100, Will Deacon wrote:
> Hi, [+Peter]
> 
> On Thu, Jun 04, 2020 at 10:48:03AM +0000, Christophe Leroy wrote:
> > Using mpc885_ads_defconfig with CONFIG_PPC_16K_PAGES instead of
> > CONFIG_PPC_4K_PAGES, getting the following build failure:
> > 
> >   CC      mm/gup.o
> > In file included from ./include/linux/kernel.h:11:0,
> >                  from mm/gup.c:2:
> > In function 'gup_hugepte.constprop',
> >     inlined from 'gup_huge_pd.isra.78' at mm/gup.c:2465:8:
> > ./include/linux/compiler.h:392:38: error: call to '__compiletime_assert_257'
> > declared with attribute error: Unsupported access size for
> > {READ,WRITE}_ONCE().
> >   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> >                                       ^
> > ./include/linux/compiler.h:373:4: note: in definition of macro
> > '__compiletime_assert'
> >     prefix ## suffix();    \
> >     ^
> > ./include/linux/compiler.h:392:2: note: in expansion of macro
> > '_compiletime_assert'
> >   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> >   ^
> > ./include/linux/compiler.h:405:2: note: in expansion of macro
> > 'compiletime_assert'
> >   compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
> >   ^
> > ./include/linux/compiler.h:291:2: note: in expansion of macro
> > 'compiletime_assert_rwonce_type'
> >   compiletime_assert_rwonce_type(x);    \
> >   ^
> > mm/gup.c:2428:8: note: in expansion of macro 'READ_ONCE'
> >   pte = READ_ONCE(*ptep);
> >         ^
> > In function 'gup_get_pte',
> >     inlined from 'gup_pte_range' at mm/gup.c:2228:9,
> >     inlined from 'gup_pmd_range' at mm/gup.c:2613:15,
> >     inlined from 'gup_pud_range' at mm/gup.c:2641:15,
> >     inlined from 'gup_p4d_range' at mm/gup.c:2666:15,
> >     inlined from 'gup_pgd_range' at mm/gup.c:2694:15,
> >     inlined from 'internal_get_user_pages_fast' at mm/gup.c:2785:3:
> 
> At first glance, this looks like a real bug in the 16k page code -- you're
> loading the pte non-atomically on the fast GUP path and so you're prone to
> tearing, which probably isn't what you want. For a short-term hack, I'd
> suggest having CONFIG_HAVE_FAST_GUP depend on !CONFIG_PPC_16K_PAGES, but if
> you want to support this them you'll need to rework your pte_t so that it
> can be loaded atomically.

Looking at commit 55c8fc3f49302, they're all the exact same value, so
what they could do is grow another special gup_get_pte() variant that
just loads the first value.

Also, per that very same commit, there's a distinct lack of WRITE_ONCE()
in the pte_update() / __set_pte_at() paths for much of Power.
