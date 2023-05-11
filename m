Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2336FF38F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 16:05:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHDDn4bVCz3fXr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 00:05:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lL2e25Q7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lL2e25Q7;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHDCr5Rq7z3fFY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 00:04:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=agTIVDV40QlNuRDmtaMpYQzLmx8ylyt8K8o0YwfCE44=; b=lL2e25Q7Ym9Z2f1ilo2kWwHtLS
	4LEtDqoDAi/1aC4kjoeLMlHtLt+a+FS4EW3ttxbaQDhTXZfyi02WOEzNc3/vCsr0owbyF5PEsIwHc
	4EGA9zShanxJYpMWANvO4AfYvUXSJigLrvPdNGyjPeVrrNrqH+tCpFoKNI6P6bYEGIKsYYtBzAtzu
	8Ajl8g5ng54yFG0pf0AiaE1GeB3gEJ+vkOMxu+NkdXV1EBgexS5qxecZBXe6DpvnyQd7D8QuN/WHz
	qIZBX6djd2pg1T+ptsLEa/faZBnf92py7b8vnk1aHVuruD1rplz5XIZSxcsHdZBQZO/oPVfH/8958
	/oI/ASsA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1px6sh-00HGyK-LW; Thu, 11 May 2023 14:02:55 +0000
Date: Thu, 11 May 2023 15:02:55 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH 00/23] arch: allow pte_offset_map[_lock]() to fail
Message-ID: <ZFz1j1slZHCQmwMJ@casper.infradead.org>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
 <ZFs0k2rrLPH9A/UU@casper.infradead.org>
 <d7f3c7b2-25b8-ef66-98a8-43d68f4499f@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7f3c7b2-25b8-ef66-98a8-43d68f4499f@google.com>
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
Cc: Michel Lespinasse <michel@lespinasse.org>, linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Z
 ankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 10, 2023 at 09:35:44PM -0700, Hugh Dickins wrote:
> On Wed, 10 May 2023, Matthew Wilcox wrote:
> > On Tue, May 09, 2023 at 09:39:13PM -0700, Hugh Dickins wrote:
> > > Two: pte_offset_map() will need to do an rcu_read_lock(), with the
> > > corresponding rcu_read_unlock() in pte_unmap().  But most architectures
> > > never supported CONFIG_HIGHPTE, so some don't always call pte_unmap()
> > > after pte_offset_map(), or have used userspace pte_offset_map() where
> > > pte_offset_kernel() is more correct.  No problem in the current tree,
> > > but a problem once an rcu_read_unlock() will be needed to keep balance.
> > 
> > Hi Hugh,
> > 
> > I shall have to spend some time looking at these patches, but at LSFMM
> > just a few hours ago, I proposed and nobody objected to removing
> > CONFIG_HIGHPTE.  I don't intend to take action on that consensus
> > immediately, so I can certainly wait until your patches are applied, but
> > if this information simplifies what you're doing, feel free to act on it.
> 
> Thanks a lot, Matthew: very considerate, as usual.
> 
> Yes, I did see your "Whither Highmem?" (wither highmem!) proposal on the

I'm glad somebody noticed the pun ;-)

> list, and it did make me think, better get these patches and preview out
> soon, before you get to vanish pte_unmap() altogether.  HIGHMEM or not,
> HIGHPTE or not, I think pte_offset_map() and pte_unmap() still have an
> important role to play.
> 
> I don't really understand why you're going down a remove-CONFIG_HIGHPTE
> route: I thought you were motivated by the awkardness of kmap on large
> folios; but I don't see how removing HIGHPTE helps with that at all
> (unless you have a "large page tables" effort in mind, but I doubt it).

Quite right, my primary concern is filesystem metadata; primarily
directories as I don't think anybody has ever supported symlinks or
superblocks larger than 4kB.

I was thinking that removing CONFIG_HIGHPTE might simplify the page
fault handling path a little, but now I've looked at it some more, and
I'm not sure there's any simplification to be had.  It should probably
use kmap_local instead of kmap_atomic(), though.

> But I've no investment in CONFIG_HIGHPTE if people think now is the
> time to remove it: I disagree, but wouldn't miss it myself - so long
> as you leave pte_offset_map() and pte_unmap() (under whatever names).
> 
> I don't think removing CONFIG_HIGHPTE will simplify what I'm doing.
> For a moment it looked like it would: the PAE case is nasty (and our
> data centres have not been on PAE for a long time, so it wasn't a
> problem I had to face before); and knowing pmd_high must be 0 for a
> page table looked like it would help, but now I'm not so sure of that
> (hmm, I'm changing my mind again as I write).
> 
> Peter's pmdp_get_lockless() does rely for complete correctness on
> interrupts being disabled, and I suspect that I may be forced in the
> PAE case to do so briefly; but detest that notion.  For now I'm just
> deferring it, hoping for a better idea before third series finalized.
> 
> I mention this (and Cc Peter) in passing: don't want this arch thread
> to go down into that rabbit hole: we can start a fresh thread on it if
> you wish, but right now my priority is commit messages for the second
> series, rather than solving (or even detailing) the PAE problem.

I infer that what you need is a pte_access_start() and a
pte_access_end() which look like they can be plausibly rcu_read_lock()
and rcu_read_unlock(), but might need to be local_irq_save() and
local_irq_restore() in some configurations?

We also talked about moving x86 to always RCU-free page tables in
order to make accessing /proc/$pid/smaps lockless.  I believe Michel
is going to take a swing at this project.
