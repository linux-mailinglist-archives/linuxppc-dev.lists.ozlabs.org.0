Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE68329E6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 09:44:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HRsF09KGzDqST
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 17:44:33 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HRpF2PTpzDqNx
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 17:41:50 +1000 (AEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id B4E2E67358; Mon,  3 Jun 2019 09:41:21 +0200 (CEST)
Date: Mon, 3 Jun 2019 09:41:21 +0200
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 03/16] mm: simplify gup_fast_permitted
Message-ID: <20190603074121.GA22920@lst.de>
References: <20190601074959.14036-1-hch@lst.de>
 <20190601074959.14036-4-hch@lst.de>
 <CAHk-=whusWKhS=SYoC9f9HjVmPvR5uP51Mq=ZCtktqTBT2qiBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whusWKhS=SYoC9f9HjVmPvR5uP51Mq=ZCtktqTBT2qiBw@mail.gmail.com>
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
Cc: Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux-sh list <linux-sh@vger.kernel.org>, James Hogan <jhogan@kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Khalid Aziz <khalid.aziz@oracle.com>, Nicholas Piggin <npiggin@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Linux-MM <linux-mm@kvack.org>,
 Paul Burton <paul.burton@mips.com>, Paul Mackerras <paulus@samba.org>,
 Andrey Konovalov <andreyknvl@google.com>, sparclinux@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 01, 2019 at 09:14:17AM -0700, Linus Torvalds wrote:
> On Sat, Jun 1, 2019 at 12:50 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > Pass in the already calculated end value instead of recomputing it, and
> > leave the end > start check in the callers instead of duplicating them
> > in the arch code.
> 
> Good cleanup, except it's wrong.
> 
> > -       if (nr_pages <= 0)
> > +       if (end < start)
> >                 return 0;
> 
> You moved the overflow test to generic code - good.
> 
> You removed the sign and zero test on nr_pages - bad.

I only removed a duplicate of it.  The full (old) code in
get_user_pages_fast() looks like this:

	if (nr_pages <= 0)
		return 0;

	if (unlikely(!access_ok((void __user *)start, len)))
		return -EFAULT;

	if (gup_fast_permitted(start, nr_pages)) {
