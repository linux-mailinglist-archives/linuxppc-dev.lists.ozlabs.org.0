Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 885F5763948
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 16:35:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=NgbwQpzK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9xJr3FWhz3cGM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 00:35:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9xHs60Zxz2yVJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 00:34:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LsxQl+7lQmIvtLS3uUz+2Tc5wtoeEEVBoFirY9Yb6fg=; b=NgbwQpzKHdyAWsUCxnsImKimDt
	jHF2WmVqPjDVwWh4+qnqFx9EB6EzhJPFMjClBGjD6Hvhy3cDKu8QpNdQ/vu4YdRehqVe79OoriWgn
	rYVzFWxwc/SS+7+suUkf1PvWW2cp4TLFdh0VHNZVCP6elPEQsoL4zq+DlNr+Vsyy6zVTCVD4+BPLu
	7MT7tbbN4QAXyKU4tauvNJ5ES+/Xow+YcL4kRLee8APN/cRVWSBVwKBSDtrmdoa20ei7j/6b/nKQ6
	9EjL4wZbYuEHOXjGbdk1LQrEamw4aC90nEjbS99sxd1PPE9PWCMbzElXWmFd7Um+DcVnLHPQet+QT
	TJw896fg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qOfaj-006ZNN-Ab; Wed, 26 Jul 2023 14:34:17 +0000
Date: Wed, 26 Jul 2023 15:34:17 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH mm-unstable v7 00/31] Split ptdesc from struct page
Message-ID: <ZMEu6VcTqPj69bQ7@casper.infradead.org>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
 <5296514f-cdd1-9526-2e83-a21e76e86e5@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5296514f-cdd1-9526-2e83-a21e76e86e5@google.com>
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
Cc: kvm@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, linux-csky@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, xen-devel@lists.xenproject.org, Jonas Bonn <jonas@southpole.se>, Arnd Bergmann <arnd@arndb.de>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mm@kvack.org, linux-mips@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, Dinh Nguyen <dinguyen@kernel.org
 >, Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 24, 2023 at 09:41:36PM -0700, Hugh Dickins wrote:
> On Mon, 24 Jul 2023, Vishal Moola (Oracle) wrote:
> 
> > The MM subsystem is trying to shrink struct page. This patchset
> > introduces a memory descriptor for page table tracking - struct ptdesc.
> > 
> > This patchset introduces ptdesc, splits ptdesc from struct page, and
> > converts many callers of page table constructor/destructors to use ptdescs.
> > 
> > Ptdesc is a foundation to further standardize page tables, and eventually
> > allow for dynamic allocation of page tables independent of struct page.
> > However, the use of pages for page table tracking is quite deeply
> > ingrained and varied across archictectures, so there is still a lot of
> > work to be done before that can happen.
> 
> Others may differ, but it remains the case that I see no point to this
> patchset, until the minimal descriptor that replaces struct page is
> working, and struct page then becomes just overhead.  Until that time,
> let architectures continue to use struct page as they do - whyever not?

Because it's easier for architecture maintainers to understand what they
should and shouldn't be using.  Look at the definition:

+struct ptdesc {
+	unsigned long __page_flags;
+
+	union {
+		struct rcu_head pt_rcu_head;
+		struct list_head pt_list;
+		struct {
+			unsigned long _pt_pad_1;
+			pgtable_t pmd_huge_pte;
+		};
+	};
+	unsigned long __page_mapping;
+
+	union {
+		struct mm_struct *pt_mm;
+		atomic_t pt_frag_refcount;
+	};
+
+	union {
+		unsigned long _pt_pad_2;
+#if ALLOC_SPLIT_PTLOCKS
+		spinlock_t *ptl;
+#else
+		spinlock_t ptl;
+#endif
+	};
+	unsigned int __page_type;
+	atomic_t _refcount;
+#ifdef CONFIG_MEMCG
+	unsigned long pt_memcg_data;
+#endif
+};

It's still a 31-line struct definition, I'll grant you.  But it's far
easier to comprehend than the definition of struct page (~140 lines).
An architecture maintainer can look at it and see what might be available,
and what is already used.  And hopefully we'll have less "Oh, I'll just
use page->private".  It's really not fair to expect arch maintainers to
learn so much about the mm.

It's still messier than I would like, but I don't think we can do better
for now.  I don't understand why you're so interested in delaying doing
this work.
