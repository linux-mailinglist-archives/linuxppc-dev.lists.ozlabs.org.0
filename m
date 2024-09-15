Return-Path: <linuxppc-dev+bounces-1378-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6291D97965D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2024 12:45:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X64Sj5csLz2xxy;
	Sun, 15 Sep 2024 20:45:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726397125;
	cv=none; b=XsCwHy1cYqb4d1cBJKz/towtd86438OPjMC4JB/a8ppPTLknn3Pl8YIKtgY5UUlhPTdwFLH11lAZVB/gKPhr/eZWOTCiZySEjjsflIgBkPzfG8BqGSYkFIkomNHNGLp4i4DjoIPVrr1O+NgJ/ExrAWWAf4zebCBcIZbpYXEkkk+j7FzH2DLJUoJ+/W9NAVZI0kv8oNN3h2PLGn4IV2HnQBcaRH77LJaO0SPUoKVb2QVNpxkl4ohiGa1wfkI54PKwyNxbLxPTnbIGZexQGpErOJgkd6qpcA24u6Rl7WYRMSXJBRxWlCEj/eKlBjxA2yFWiSlT3CK1dTXyR/OGKS1lmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726397125; c=relaxed/relaxed;
	bh=jqW6okUGofPnWuzoo94v770ZzhF41RU9ioXhQiBiADc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGobicTNKo0s6gx3xAHwnDSJtShwiWhVwH1KX2GoFCRfp2v4OFl+nJ+T2WoW/sN6QT2VjWD+ULqoPeLcSTucgt9L+Y8aQy8/rBJXvJJBFcWD8q1nqS3qoYA6J67jBC5mdUn2jU1ro+c1FXSfwrkIXJ7TP95Rg1/Zh6s5V7iwncEA4AFuMzpiDimbu4/xw0dV2hK04qb8jTdIs388fA2e66mJqDQiVRiVSimg+GJGV6ZdK3Yzn6lbyCDo3K4wf5uDxTalNLUPbEtNFOl8MVSTeKuxh6jAxy7A1yaPpS40OLRPQ36IXreOmFSP4zronqDf0Zvl8Ov2tkndrzZQ89rICg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X64Sc1BXvz2xks
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2024 20:45:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jqW6okUGofPnWuzoo94v770ZzhF41RU9ioXhQiBiADc=; b=oWxm+dE83ehjHDkC7vek7mEFiO
	4Fd/ZzJSkXmdu7kWTjRE8XjS4Mor/2mmkjzLs16r29mC1r92/tXTUkDnya0gJCQrQfySHPtcBc3VE
	l7MvfdVO0pZCawsjTrE/tEwuKoLdcNZrWs+a93Rt+C2kQCNHlzZ8ddxaAmNho+Lcf/4zJNvtAenBb
	Ll8o/kItLA+lgBFsnay7as5MVqaZbWdhGBmWi3L+TlJ7BReAeIH1LW6INPmwMMTo9Jcbn+jT/ml0g
	CuyvWXdC5NAO0YS+9Ehg1PhgeT9vEcO/d6Q6CqP3RY3F0jg/q7CDOyXYM73vTC//b9LyCXY95KMmW
	6gmz3KrQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1spmkU-00000000ktC-1OaC;
	Sun, 15 Sep 2024 10:44:58 +0000
Date: Sun, 15 Sep 2024 11:44:58 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Simon Horman <horms@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Jakub Kicinski <kuba@kernel.org>,
	David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH net-next v1] mm: fix build on powerpc with GCC 14
Message-ID: <Zua6qtUCG84236gp@casper.infradead.org>
References: <20240913192036.3289003-1-almasrymina@google.com>
 <ZuSQ9BT9Vg7O2kXv@casper.infradead.org>
 <30e8dee7-e98e-42cb-aab3-6b75f1a6316d@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30e8dee7-e98e-42cb-aab3-6b75f1a6316d@csgroup.eu>

On Sat, Sep 14, 2024 at 08:50:46AM +0200, Christophe Leroy wrote:
> Hi,
> 
> Le 13/09/2024 à 21:22, Matthew Wilcox a écrit :
> > On Fri, Sep 13, 2024 at 07:20:36PM +0000, Mina Almasry wrote:
> > > +++ b/include/linux/page-flags.h
> > > @@ -239,8 +239,8 @@ static inline unsigned long _compound_head(const struct page *page)
> > >   {
> > >   	unsigned long head = READ_ONCE(page->compound_head);
> > > -	if (unlikely(head & 1))
> > > -		return head - 1;
> > > +	if (unlikely(head & 1UL))
> > > +		return head & ~1UL;
> > >   	return (unsigned long)page_fixed_fake_head(page);
> > 
> > NAK, that pessimises compound_head().
> > 
> 
> Can you please give more details on what the difference is ?
> 
> I can't see what it pessimises. In both cases, you test if the value is odd,
> when it is odd you make it even.

On x86, for example, it is perfectly valid to load a 64-bit value from
an offset of 0x2f relative to a pointer.  So there's no need to make it
even.

