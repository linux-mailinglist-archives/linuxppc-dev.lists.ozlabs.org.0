Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC1F32A02
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 09:47:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HRwX6Gz9zDqDC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 17:47:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HRsZ5mQJzDqRd
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 17:44:50 +1000 (AEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 74D3067358; Mon,  3 Jun 2019 09:44:21 +0200 (CEST)
Date: Mon, 3 Jun 2019 09:44:21 +0200
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 08/16] sparc64: add the missing pgd_page definition
Message-ID: <20190603074421.GB22920@lst.de>
References: <20190601074959.14036-1-hch@lst.de>
 <20190601074959.14036-9-hch@lst.de>
 <CAHk-=wj9w5NxTcJsqpvYUiL3OBOH-J3=4-vXcc3GaG_U8H-gJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wj9w5NxTcJsqpvYUiL3OBOH-J3=4-vXcc3GaG_U8H-gJw@mail.gmail.com>
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

On Sat, Jun 01, 2019 at 09:28:54AM -0700, Linus Torvalds wrote:
> Both sparc64 and sh had this pattern, but now that I look at it more
> closely, I think your version is wrong, or at least nonoptimal.

I bet it is.  Then again these symbols are just required for the code
to compile, as neither sparc64 nor sh actually use the particular
variant of huge pages we need it for.  Then again even actually dead
code should better be not too buggy if it isn't just a stub.

> So I thgink this would be better done with
> 
>      #define pgd_page(pgd)    pfn_to_page(pgd_pfn(pgd))
> 
> where that "pgd_pfn()" would need to be a new (but likely very
> trivial) function. That's what we do for pte_pfn().
> 
> IOW, it would likely end up something like
> 
>   #define pgd_to_pfn(pgd) (pgd_val(x) >> PFN_PGD_SHIFT)

True.  I guess it would be best if we could get most if not all
architectures to use common versions of these macros so that we have
the issue settled once.
