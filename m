Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEBB74183A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 20:52:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=F0geF1mD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrrKs4NVGz3bb4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 04:52:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=F0geF1mD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrrJw51sLz30NK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 04:51:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gzBVL7uWfH/0QncUeiWSVvNT7tu19KKFpZm/SdtHfy0=; b=F0geF1mDFUhFwejscu79P5AerF
	ChPxlz8AungTNw2nYlH8TmeT0FdBYZ403uLo6dwYbFZivePasVeM2QOKhl+SGZUnj3aelPYXtEfM9
	SrOHM/3oUTni3eU+S6cGIy3fXu368hUaiU/EA6YN2NOx+dDC0fkki3YX0I7X5QXDEfuDII33co6YT
	AgpMwEBC4ya/EPvRDl80CtdVgP3e2XagbMLqDsAoh6VP3gh2KZpEwz3m1/E0HTdSv3vSxKIUbldmu
	z9Fsmk0Dd2L6fefBSyj6JHJ0VqW7vTaNglMS0xkY6KNSksqhU+OkIfDiDfBXKznANmEoK/ikyWU4U
	7raG+AtA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qEaFx-0047Cx-Rw; Wed, 28 Jun 2023 18:51:09 +0000
Date: Wed, 28 Jun 2023 19:51:09 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 00/33] Split ptdesc from struct page
Message-ID: <ZJyBHdcjuaykIRG9@casper.infradead.org>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
 <e8992eee-4140-427e-bacb-9449f346318@google.com>
 <ac1c162c-07d8-6084-44ca-a2c1a4183df2@redhat.com>
 <90e643ca-de72-2f4c-f4fe-35e06e1a9277@google.com>
 <26282cb8-b6b0-f3a0-e82d-b4fec45c5f72@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26282cb8-b6b0-f3a0-e82d-b4fec45c5f72@redhat.com>
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
Cc: kvm@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, xen-devel@lists.xenproject.org, Jonas Bonn <jonas@southpole.se>, Arnd Bergmann <arnd@arndb.de>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mm@kvack.org, linux-mips@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, Ri
 chard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 28, 2023 at 09:41:18AM +0200, David Hildenbrand wrote:
> I'm not a friend of these "overlays"; it all only really makes sense to me
> once we actually allocate the descriptors dynamically. Maybe some of the
> existing/ongoing conversions were different (that's why I was asking for the
> difference, as you said the "struct slab" thing was well received).
> 
> If they are primarily only unnecessary churn for now (and unclear when/how
> it will become useful), I share your opinion.

One of the reasons for doing these conversions "early" is that it helps
people who work on this code know what fields they can actually use in
their memory descriptor.  We have a _lot_ of historical baggage with
people just using random bits in struct page for their own purposes
without necessarily considering the effects on the rest of the system.

By creating specific types for each user of struct page, we can see
what's actually going on.  Before the ptdesc conversion started, I could
not have told you which bits in struct page were used by the s390 code.
I knew they were playing some fun games with the refcount (it's even
documented in the s390 code!) but I didn't know they were using ...
whetever it is; page->private to point to the kvm private data?

So maybe it is harder for MM developers right now to see what fields in
memdesc A overlap with which fields in memdesc B.  That _ought_ not to
be a concern!  We document which fields are available in each memdesc,
and have various assertions to trip when people make things not line up
any more.  There can still be problems, of course; we haven't set the
assertions quite tightly enough in some cases.

People are going to keep adding crap to struct page, and they're going
to keep misusing the crap that's in struct page.  That has to stop.
