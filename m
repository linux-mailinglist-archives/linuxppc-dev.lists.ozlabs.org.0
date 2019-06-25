Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA2F5252C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 09:49:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XywF6d1czDqQB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 17:49:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=newverein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XytN4nrPzDq5y
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 17:47:24 +1000 (AEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 3C8A768B02; Tue, 25 Jun 2019 09:46:50 +0200 (CEST)
Date: Tue, 25 Jun 2019 09:46:49 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 04/16] MIPS: use the generic get_user_pages_fast code
Message-ID: <20190625074649.GD30815@lst.de>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-5-hch@lst.de> <20190621140542.GO19891@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621140542.GO19891@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Khalid Aziz <khalid.aziz@oracle.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Kamal Dasu <kdasu.kdev@gmail.com>,
 x86@kernel.org, James Hogan <jhogan@kernel.org>,
 Andrey Konovalov <andreyknvl@google.com>, Nicholas Piggin <npiggin@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 21, 2019 at 11:05:42AM -0300, Jason Gunthorpe wrote:
> Today this check is only being done on the get_user_pages_fast() -
> after this patch it is also done for __get_user_pages_fast().
> 
> Which means __get_user_pages_fast is now non-functional on a range of
> MIPS CPUs, but that seems OK as far as I can tell, so:

> However, looks to me like this patch is also a bug fix for this:

Yes.

> > -	pgdp = pgd_offset(mm, addr);
> > -	do {
> > -		pgd_t pgd = *pgdp;
> > -
> > -		next = pgd_addr_end(addr, end);
> > -		if (pgd_none(pgd))
> > -			goto slow;
> > -		if (!gup_pud_range(pgd, addr, next, gup_flags & FOLL_WRITE,
> > -				   pages, &nr))
> 
> This is different too, the core code has a p4d layer, but I see that
> whole thing gets NOP'd by the compiler as mips uses pgtable-nop4d.h -
> right?

Exactly.
