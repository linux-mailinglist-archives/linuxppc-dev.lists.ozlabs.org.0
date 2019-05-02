Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69955124F8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 01:17:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wB4W6x8LzDqJ1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 09:17:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+ff94dca994e7aef948cf+5730+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="aMGrAGbR"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wB2g3HDMzDqPF
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 09:15:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x1JkGI4CQYrmvxuM8WIiLxnMqgmcALyQZwo7P71BME0=; b=aMGrAGbRVDdw1l/sw+gckS+sI
 yDZRI+3C+9JVbYF5x2TNO2v6ZU46vYBCxSlqgSFAyRpfREdxjyopf5mVIOuO+jPgRBsXJd2WNYSnF
 /I8A7c2f4ZPKJ2BAsrHVAa3XgZa1Qf5UknK5MzQ/VET/Ij0UeqKBGlYDO7wlzooU0qq4VGVtOuSH8
 FfL6+e4qqO0V8zFTtborrXEeCSKP8gI1CQxx/4VKLrA/KtJTKs3viL4v8Jq+vuEbUwPtPTqSnacch
 i7OH8Qeq65dZyi5x87J8wju+DihRuYLLXhCq55dy1ya/+objw3Kmmh7K6U5nQGlGqynqD2RbtFQiK
 OqNefzOAw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hMKvW-0006KY-Ob; Thu, 02 May 2019 23:15:42 +0000
Date: Thu, 2 May 2019 16:15:42 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Linux 5.1-rc5
Message-ID: <20190502231542.GA9336@infradead.org>
References: <CAHk-=wjvcuyCQGnfOhooaL1H4H63qXO=xgo+9yncSOG=eK+kbA@mail.gmail.com>
 <20190415051919.GA31481@infradead.org>
 <CAHk-=wj7jgMOVFW0tiU-X+zhg6+Rn7mEBTej+f26rV3zXezOSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wj7jgMOVFW0tiU-X+zhg6+Rn7mEBTej+f26rV3zXezOSA@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 sparclinux@vger.kernel.org, Hillf Danton <dhillf@gmail.com>,
 Paul Mundt <lethal@linux-sh.org>, Paul Burton <paul.burton@mips.com>,
 James Hogan <jhogan@kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Khalid Aziz <khalid.aziz@oracle.com>, Nitin Gupta <nitin.m.gupta@oracle.com>,
 linuxppc-dev@lists.ozlabs.org, Stas Sergeev <stsp@list.ru>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 15, 2019 at 09:17:10AM -0700, Linus Torvalds wrote:
> I ruthlessly also entirely ignored MIPS, SH and sparc, since they seem
> largely irrelevant, partly since even theoretically this whole issue
> needs a _lot_ of memory.

Adding the relevant people - while the might be irrelevant, at least
mips and sparc have some giant memory systems.  And I'd really like
to see the arch-specific GUP implementations to go away for other
reasons, as we have a few issues to sort out with GUP usage now
(we just had discussions at LSF/MM), and the less implementations we
have to deal with the better.
