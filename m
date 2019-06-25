Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03691525BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 09:59:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Xz8N224SzDq7g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 17:59:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Xz5x2GnyzDqBK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 17:57:25 +1000 (AEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 1831068B02; Tue, 25 Jun 2019 09:56:51 +0200 (CEST)
Date: Tue, 25 Jun 2019 09:56:50 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 11/16] mm: consolidate the get_user_pages* implementations
Message-ID: <20190625075650.GF30815@lst.de>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-12-hch@lst.de> <20190621144131.GQ19891@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621144131.GQ19891@ziepe.ca>
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
Cc: x86@kernel.org, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Khalid Aziz <khalid.aziz@oracle.com>, Nicholas Piggin <npiggin@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-mm@kvack.org,
 Paul Burton <paul.burton@mips.com>, Paul Mackerras <paulus@samba.org>,
 Andrey Konovalov <andreyknvl@google.com>, sparclinux@vger.kernel.org,
 linux-mips@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 21, 2019 at 11:41:31AM -0300, Jason Gunthorpe wrote:
> >  static bool gup_fast_permitted(unsigned long start, unsigned long end)
> >  {
> > -	return true;
> > +	return IS_ENABLED(CONFIG_HAVE_FAST_GUP) ? true : false;
> 
> The ?: is needed with IS_ENABLED?

It shouldn't, I'll fix it up.

> I'd suggest to revise this block a tiny bit:
> 
> -#ifndef gup_fast_permitted
> +#if !IS_ENABLED(CONFIG_HAVE_FAST_GUP) || !defined(gup_fast_permitted)
>  /*
>   * Check if it's allowed to use __get_user_pages_fast() for the range, or
>   * we need to fall back to the slow version:
>   */
> -bool gup_fast_permitted(unsigned long start, int nr_pages)
> +static bool gup_fast_permitted(unsigned long start, int nr_pages)
>  {
> 
> Just in case some future arch code mismatches the header and kconfig..

IS_ENABLED outside a function doesn't really make sense.  But I'll
just life the IS_ENABLED(CONFIG_HAVE_FAST_GUP) checks into the two
callers.
