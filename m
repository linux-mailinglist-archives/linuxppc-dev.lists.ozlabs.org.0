Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 927D94E1CA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 10:17:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VWkl6mG0zDqf6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 18:17:19 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VWhp2WzszDqcw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 18:15:36 +1000 (AEST)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id BAE6368C4E; Fri, 21 Jun 2019 10:15:01 +0200 (CEST)
Date: Fri, 21 Jun 2019 10:15:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 16/16] mm: pass get_user_pages_fast iterator arguments
 in a structure
Message-ID: <20190621081501.GA17718@lst.de>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-17-hch@lst.de> <1560300464.nijubslu3h.astroid@bobo.none>
 <CAHk-=wjSo+TzkvYnAqrp=eFgzzc058DhSMTPr4-2quZTbGLfnw@mail.gmail.com>
 <1561032202.0qfct43s2c.astroid@bobo.none>
 <CAHk-=wh46y3x5O0HkR=R4ETh6e5pDCrEsJ94CtC0fyQiYYAf6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh46y3x5O0HkR=R4ETh6e5pDCrEsJ94CtC0fyQiYYAf6A@mail.gmail.com>
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
Cc: sparclinux@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Andrey Konovalov <andreyknvl@google.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Linux-MM <linux-mm@kvack.org>, Khalid Aziz <khalid.aziz@oracle.com>,
 Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>,
 Paul Mackerras <paulus@samba.org>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 20, 2019 at 10:21:46AM -0700, Linus Torvalds wrote:
> Hmm. Honestly, I've never seen anything like that in any kernel profiles.
> 
> Compared to the problems I _do_ see (which is usually the obvious
> cache misses, and locking), it must either be in the noise or it's
> some problem specific to whatever CPU you are doing performance work
> on?
> 
> I've occasionally seen pipeline hiccups in profiles, but it's usually
> been either some serious glass jaw of the core, or it's been something
> really stupid we did (or occasionally that the compiler did: one in
> particular I remember was how there was a time when gcc would narrow
> stores when it could, so if you set a bit in a word, it would do it
> with a byte store, and then when you read the whole word afterwards
> you'd get a major pipeline stall and it happened to show up in some
> really hot paths).

I've not seen any difference in the GUP bench output here ar all.

But I'm fine with skipping this patch for now, I have a potential
series I'm looking into that would benefit a lot from it, but we
can discusss it in that context and make sure all the other works gets in
in time.
