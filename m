Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D99ED7618E8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 14:53:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=UgAJBFRL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9H5N5WTmz3cXV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 22:53:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=UgAJBFRL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9H4P6kWBz3bl7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 22:52:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cip1L4+WNN72lEdlEtgKKz6+Th/GNW6kyU+RnxFbZZ8=; b=UgAJBFRLO20d1Q4UeecSqlBQIs
	PFHuz0NUmB/1Y+2cEVFvwqnHb1BSxWW4RhQ2P8kvsu3ACbwOqr57viJKTa7uG+qe1fdufl5rqF2qr
	jHy5L3HlBpbKr1Vl5EefvCAyn8+oe9n/K+eN0UUCvHZ3OgwtPhyspcNh4yAoE49KOIUkQVp2v0HR9
	+xKnn/gm3dSYH0IDK2KkKvdpo4YPQW6CLliHGifFEImfRxrevzUzbI0xJBT7SCfU6e7LIrXsQ1mlT
	uc0IdyK39Z/Ut2VF+t8tpW9pm9g50y0Q3SwS/URKZyTPqyVYvUikuYgn7PDUb1oSxM38pOnLhiEyt
	M5/wJdyg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qOHW7-005Tcv-AA; Tue, 25 Jul 2023 12:51:55 +0000
Date: Tue, 25 Jul 2023 13:51:55 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [RFC PATCH v11 10/29] mm: Add AS_UNMOVABLE to mark mapping as
 completely unmovable
Message-ID: <ZL/Fa4W2Ne9EVxoh@casper.infradead.org>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-11-seanjc@google.com>
 <20230725102403.xywjqlhyqkrzjok6@box.shutemov.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725102403.xywjqlhyqkrzjok6@box.shutemov.name>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Paul Moore <paul@paul-moore.com>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, James Morris <jmorris@namei.org>, Wang <wei.w.wang@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Jarkko Sakkinen <jarkko@kernel.org>, "Serge E. Hallyn" <serge@hallyn.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Quentin Perret <qperret@google.com>, Sean Christopherson <seanjc@google.com>, Liam Merwick <liam.merwick@oracle.com>, linux-mips
 @vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 25, 2023 at 01:24:03PM +0300, Kirill A . Shutemov wrote:
> On Tue, Jul 18, 2023 at 04:44:53PM -0700, Sean Christopherson wrote:
> > diff --git a/mm/compaction.c b/mm/compaction.c
> > index dbc9f86b1934..a3d2b132df52 100644
> > --- a/mm/compaction.c
> > +++ b/mm/compaction.c
> > @@ -1047,6 +1047,10 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
> >  		if (!mapping && (folio_ref_count(folio) - 1) > folio_mapcount(folio))
> >  			goto isolate_fail_put;
> >  
> > +		/* The mapping truly isn't movable. */
> > +		if (mapping && mapping_unmovable(mapping))
> > +			goto isolate_fail_put;
> > +
> 
> I doubt that it is safe to dereference mapping here. I believe the folio
> can be truncated from under us and the mapping freed with the inode.
> 
> The folio has to be locked to dereference mapping safely (given that the
> mapping is still tied to the folio).

There's even a comment to that effect later on in the function:

                        /*
                         * Only pages without mappings or that have a
                         * ->migrate_folio callback are possible to migrate
                         * without blocking. However, we can be racing with
                         * truncation so it's necessary to lock the page
                         * to stabilise the mapping as truncation holds
                         * the page lock until after the page is removed
                         * from the page cache.
                         */

(that could be reworded to make it clear how dangerous dereferencing
->mapping is without the lock ... and it does need to be changed to say
"folio lock" instead of "page lock", so ...)

How does this look?

                        /*
                         * Only folios without mappings or that have
                         * a ->migrate_folio callback are possible to
                         * migrate without blocking. However, we can
                         * be racing with truncation, which can free
                         * the mapping.  Truncation holds the folio lock
                         * until after the folio is removed from the page
                         * cache so holding it ourselves is sufficient.
                         */

