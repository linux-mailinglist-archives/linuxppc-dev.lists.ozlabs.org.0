Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB69763528
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 13:38:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DV7cjIMW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9sNX4CN9z3cPD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 21:38:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DV7cjIMW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=kirill.shutemov@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Wed, 26 Jul 2023 21:37:47 AEST
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9sMb53ntz2ygj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 21:37:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690371468; x=1721907468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SuZ1oLRGv+DogObqtc+f4FAjzMjj7hxAmbmabhNK8B0=;
  b=DV7cjIMW9FD3vAAz3UEWZ5iilYWhDFlBmmrlqCEnKWPMGX+cYt7eccpU
   O8noEhJNKjg8ZpWfkUhlf7+acSWqkdMQtN6cOtJiS0up4QMMyG4Mt6u5R
   xmMmB6o0ijgrk+GQ9ob+v7cDbCNmL46OgWuZnpKN/fno57xQTxiiXR4KI
   mY9vMHVWU1bfcdKkJGAD9AqMXGsBHVVlIKsLr+mO2px2c2v/OQ4aoPcH5
   Zx1dtazL345Mbfs7lwVWJ2auBl3QrlB97CxGZHN2QJbTF/MELfPdKbtco
   zWoZsQnCwnr9pnjIJmqXCB/KE7Bcx0ijHIq0F/dZMrXskQqEOJCTq0XlJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="371598754"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="371598754"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 04:36:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="729807753"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="729807753"
Received: from mbrdon-mobl.ger.corp.intel.com (HELO box.shutemov.name) ([10.251.209.47])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 04:36:21 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 8BCEB109503; Wed, 26 Jul 2023 14:36:17 +0300 (+03)
Date: Wed, 26 Jul 2023 14:36:17 +0300
From: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH v11 10/29] mm: Add AS_UNMOVABLE to mark mapping as
 completely unmovable
Message-ID: <20230726113617.432nuovswn6odcmx@box>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-11-seanjc@google.com>
 <20230725102403.xywjqlhyqkrzjok6@box.shutemov.name>
 <ZL/Fa4W2Ne9EVxoh@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZL/Fa4W2Ne9EVxoh@casper.infradead.org>
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

On Tue, Jul 25, 2023 at 01:51:55PM +0100, Matthew Wilcox wrote:
> On Tue, Jul 25, 2023 at 01:24:03PM +0300, Kirill A . Shutemov wrote:
> > On Tue, Jul 18, 2023 at 04:44:53PM -0700, Sean Christopherson wrote:
> > > diff --git a/mm/compaction.c b/mm/compaction.c
> > > index dbc9f86b1934..a3d2b132df52 100644
> > > --- a/mm/compaction.c
> > > +++ b/mm/compaction.c
> > > @@ -1047,6 +1047,10 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
> > >  		if (!mapping && (folio_ref_count(folio) - 1) > folio_mapcount(folio))
> > >  			goto isolate_fail_put;
> > >  
> > > +		/* The mapping truly isn't movable. */
> > > +		if (mapping && mapping_unmovable(mapping))
> > > +			goto isolate_fail_put;
> > > +
> > 
> > I doubt that it is safe to dereference mapping here. I believe the folio
> > can be truncated from under us and the mapping freed with the inode.
> > 
> > The folio has to be locked to dereference mapping safely (given that the
> > mapping is still tied to the folio).
> 
> There's even a comment to that effect later on in the function:
> 
>                         /*
>                          * Only pages without mappings or that have a
>                          * ->migrate_folio callback are possible to migrate
>                          * without blocking. However, we can be racing with
>                          * truncation so it's necessary to lock the page
>                          * to stabilise the mapping as truncation holds
>                          * the page lock until after the page is removed
>                          * from the page cache.
>                          */
> 
> (that could be reworded to make it clear how dangerous dereferencing
> ->mapping is without the lock ... and it does need to be changed to say
> "folio lock" instead of "page lock", so ...)
> 
> How does this look?
> 
>                         /*
>                          * Only folios without mappings or that have
>                          * a ->migrate_folio callback are possible to
>                          * migrate without blocking. However, we can
>                          * be racing with truncation, which can free
>                          * the mapping.  Truncation holds the folio lock
>                          * until after the folio is removed from the page
>                          * cache so holding it ourselves is sufficient.
>                          */
> 

Looks good to me.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
