Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D39154E11
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 13:58:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y4Rm37NgzDqLZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 21:58:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ziepe.ca
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="EJRqkA+W"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y4Pc3GhvzDqM5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 21:56:17 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id s15so17970742qtk.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 04:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fvKANBJdXNXYIeZ/L8y6ph5Ezo3tgbjUcpe/Mc2NV2o=;
 b=EJRqkA+Wa+2yuhExyLU8Eail2cNMSKRlyq+nyaUncHcGsgxKcs1Sr27rWWPyQ3UTrB
 cMuPzb9Z50gDAZFEwVZrXYSwVpLDqhyoJKVcX3zqSCKfqGnqquaMARKFxeOFyW8rB9v8
 jr8CU8j5ySeuXjYBbGTSI57V744cpPQESxf93yY5iy18Va9ZEqkNrNrZ0wCGg02RJ3JA
 r5NbagwGrwXFZDv3ukSXLA1uRvHbeXlvc3o0PAo+oEEBwferAW9/XgegyzdhnpEkAbuO
 8J0rVpLZNN7V7DMRLZuQKxHv2O074zq201ScyzNZLnpy9zB3grhcnmsth2ZOqQC4k+TL
 yUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fvKANBJdXNXYIeZ/L8y6ph5Ezo3tgbjUcpe/Mc2NV2o=;
 b=qy6F/9ym1Mg93xpjKV+HVd9qEuTliKjQgcQEIiqOisnWX6xKZDjIq1wbXvz7feTMR5
 X1mgsjttkN9JY4SDNyaoXmu3CaVJoSvDmhjkk993bq8ln2ov9TL4Y9A5omU2YMp4DU4y
 h7FyR4v150VkqlHhj8q3RUf/p12Jvs2qKl2pKsBtWZJxKcbpdW4735Z2JkmVmIxCKumQ
 BFtyOBVdFennbQME56EIHyd44JkyTmPJ42W2kUaWfEJ8yyKFJPzpXFlLkVZJ8+BqteSg
 pQoxmKkc+yL2Oof+5IqMzmGJkXCk3zyZY9Mjf1inxI7jJ+Xz3rb4jm1UhjP3Gl+wsPIz
 eSoA==
X-Gm-Message-State: APjAAAXtAiDgYTLoNTSDLbW0rOAveWN5DmGLbxvo1CJmJrDYeqn9fM6W
 u5W6Cvbmyskym4F0CHVSdft3+A==
X-Google-Smtp-Source: APXvYqyDewrQnE99HjPqs/AAVHvyzq2HO2LnRgTekknR3UF/nZYhm98dWnU6mW2wKUuKLbin6gnbcg==
X-Received: by 2002:ac8:1a1c:: with SMTP id
 v28mr129005789qtj.270.1561463774976; 
 Tue, 25 Jun 2019 04:56:14 -0700 (PDT)
Received: from ziepe.ca (209-213-91-242.bos.ma.meganet.net. [209.213.91.242])
 by smtp.gmail.com with ESMTPSA id
 g2sm6682374qkm.31.2019.06.25.04.56.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Jun 2019 04:56:13 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hfk3Z-0000yk-Gl; Tue, 25 Jun 2019 08:56:13 -0300
Date: Tue, 25 Jun 2019 08:56:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/16] mm: consolidate the get_user_pages* implementations
Message-ID: <20190625115613.GB3711@ziepe.ca>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-12-hch@lst.de>
 <20190621144131.GQ19891@ziepe.ca> <20190625075650.GF30815@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625075650.GF30815@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 Paul Burton <paul.burton@mips.com>, Paul Mackerras <paulus@samba.org>,
 Andrey Konovalov <andreyknvl@google.com>, sparclinux@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 25, 2019 at 09:56:50AM +0200, Christoph Hellwig wrote:
> On Fri, Jun 21, 2019 at 11:41:31AM -0300, Jason Gunthorpe wrote:
> > >  static bool gup_fast_permitted(unsigned long start, unsigned long end)
> > >  {
> > > -	return true;
> > > +	return IS_ENABLED(CONFIG_HAVE_FAST_GUP) ? true : false;
> > 
> > The ?: is needed with IS_ENABLED?
> 
> It shouldn't, I'll fix it up.
> 
> > I'd suggest to revise this block a tiny bit:
> > 
> > -#ifndef gup_fast_permitted
> > +#if !IS_ENABLED(CONFIG_HAVE_FAST_GUP) || !defined(gup_fast_permitted)
> >  /*
> >   * Check if it's allowed to use __get_user_pages_fast() for the range, or
> >   * we need to fall back to the slow version:
> >   */
> > -bool gup_fast_permitted(unsigned long start, int nr_pages)
> > +static bool gup_fast_permitted(unsigned long start, int nr_pages)
> >  {
> > 
> > Just in case some future arch code mismatches the header and kconfig..
> 
> IS_ENABLED outside a function doesn't really make sense.  But I'll
> just life the IS_ENABLED(CONFIG_HAVE_FAST_GUP) checks into the two
> callers.

I often see '#if IS_ENABLED(CONFIG_X)', IIRC last I looked at that, it
was needed because the usual #ifdef CONFIG_X didn't work if the value
was =m?

Would be interested to know if that is not the right way to use
kconfig

Jason
