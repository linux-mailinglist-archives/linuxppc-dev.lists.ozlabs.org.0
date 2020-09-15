Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD3426A5FC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 15:12:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrNtH6WzXzDqTT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 23:12:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrNq43HmCzDqRM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 23:09:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kwi5xTW8GuxsUKcivQn36NFaCt8761GZDrxY8Oy02ps=; b=c4ffScwjfqCWw+EdTDmxxD0/Md
 YVp4M/VSs7XaKf7niEJ7dzN51KxWBBeS4Bt/m867fSCGf0zVWC10Fx+mLWpxMzcjJw3rcb7pzwxJG
 1OlgT1smvxIQ2XLtD80u6Nn3mkF2r/DdKiQ7uyz3AP9pQbl4zOvLY/ds84QxVFBWQpJC/dW9N9kYQ
 6XcIrikGD4tlrj9wK7VvwGe5ggR8XZCTKculT8VAfSklViHBrPslJAH2umvg57m9FxNl6zV/ZyIT6
 AxCsofUr9omwct1yz40TlKwfqus5qAYhy2eV1shZxesO8zs8391YEV4tlerCyksSyZz2vB1NP1FLF
 yp/GMkyA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kIAhn-0000sv-NA; Tue, 15 Sep 2020 13:09:07 +0000
Date: Tue, 15 Sep 2020 14:09:07 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [5.9.0-rc5-20200914] Kernel crash while running LTP(mlock201)
Message-ID: <20200915130907.GE5449@casper.infradead.org>
References: <3DCED508-4DC0-42AA-9CFF-3AB260ED1E9A@linux.vnet.ibm.com>
 <87o8m7p9jd.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o8m7p9jd.fsf@mpe.ellerman.id.au>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, linux-next@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 15, 2020 at 09:24:38PM +1000, Michael Ellerman wrote:
> Sachin Sant <sachinp@linux.vnet.ibm.com> writes:
> > While running LTP tests (specifically mlock201) against next-20200914 tree
> > on a POWER9 LPAR results in following crash.
> 
> Looks the same as:
> 
> https://lore.kernel.org/linux-mm/20200914085545.GB28738@shao2-debian/

https://lore.kernel.org/linux-mm/20200914112738.GM6583@casper.infradead.org/
