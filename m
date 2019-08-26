Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDF19D035
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 15:17:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HCGM3Jx2zDqgN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 23:17:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="S0Qm85v5"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HCBR6FZnzDqQ9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 23:13:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=urDTYQxxHpDLHKYV3DkLPJyBgIdOzd8vbZl6Cfapxyc=; b=S0Qm85v5u+mC94Z+1NTp3zLxy
 RVikWlbB8+mD7D3i6pKW1vaRh6+mpvdmY0hZwt7QeNMOfDK4v1mKu4uLruFJY+80WEeNiclw0bMni
 VgFWVa4FMxmnuDh4DG/NHs34XNaySiBjcLQotEzPIlKfk98LzJOfOfATotjcOvgRsK0BvJg1vvrY6
 PC3VQkaRupcuqt52WqBPC5JvmCjmjjLmU1rbYgod7HJ/IZrUNwVg/kxESAnrEZvrP/71g/C/cTVL3
 KSmHw9glYY9tQdIrKjhRnF9olVe6RlSSQh43S7mnoLe1VnIU+Q8j9tFnodpiFcOU1xeFxRbNIYZHd
 4Bsb3y2yA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red
 Hat Linux)) id 1i2Eo0-0002Mw-Mf; Mon, 26 Aug 2019 13:13:08 +0000
Date: Mon, 26 Aug 2019 06:13:08 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [RFC V2 0/1] mm/debug: Add tests for architecture exported page
 table helpers
Message-ID: <20190826131308.GA15933@bombadil.infradead.org>
References: <1565335998-22553-1-git-send-email-anshuman.khandual@arm.com>
 <20190809101632.GM5482@bombadil.infradead.org>
 <a5aab7ff-f7fd-9cc1-6e37-e4185eee65ac@arm.com>
 <20190809135202.GN5482@bombadil.infradead.org>
 <7a88f6bb-e8c7-3ac7-2f92-1de752a01f33@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a88f6bb-e8c7-3ac7-2f92-1de752a01f33@arm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Steven Price <Steven.Price@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Vlastimil Babka <vbabka@suse.cz>, Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 26, 2019 at 08:07:13AM +0530, Anshuman Khandual wrote:
> On 08/09/2019 07:22 PM, Matthew Wilcox wrote:
> > On Fri, Aug 09, 2019 at 04:05:07PM +0530, Anshuman Khandual wrote:
> >> On 08/09/2019 03:46 PM, Matthew Wilcox wrote:
> >>> On Fri, Aug 09, 2019 at 01:03:17PM +0530, Anshuman Khandual wrote:
> >>>> Should alloc_gigantic_page() be made available as an interface for general
> >>>> use in the kernel. The test module here uses very similar implementation from
> >>>> HugeTLB to allocate a PUD aligned memory block. Similar for mm_alloc() which
> >>>> needs to be exported through a header.
> >>>
> >>> Why are you allocating memory at all instead of just using some
> >>> known-to-exist PFNs like I suggested?
> >>
> >> We needed PFN to be PUD aligned for pfn_pud() and PMD aligned for mk_pmd().
> >> Now walking the kernel page table for a known symbol like kernel_init()
> > 
> > I didn't say to walk the kernel page table.  I said to call virt_to_pfn()
> > for a known symbol like kernel_init().
> > 
> >> as you had suggested earlier we might encounter page table page entries at PMD
> >> and PUD which might not be PMD or PUD aligned respectively. It seemed to me
> >> that alignment requirement is applicable only for mk_pmd() and pfn_pud()
> >> which create large mappings at those levels but that requirement does not
> >> exist for page table pages pointing to next level. Is not that correct ? Or
> >> I am missing something here ?
> > 
> > Just clear the bottom bits off the PFN until you get a PMD or PUD aligned
> > PFN.  It's really not hard.
> 
> As Mark pointed out earlier that might end up being just a synthetic PFN
> which might not even exist on a given system.

And why would that matter?
