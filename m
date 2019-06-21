Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9095F4EB0E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 16:49:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VhR658PHzDqGT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 00:49:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ziepe.ca
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="DWYPEU+O"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VhJr66KqzDqMv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 00:43:56 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id a15so7133799qtn.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 07:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HyLTo1H3x89cnTVP/KrI5aPMZqdvKCPXXVZOA+DwKL4=;
 b=DWYPEU+O6hqxRZYo+qz30J5H/UJHIhDajRUaRnLPSd6vJcB6+cO10pe7lygHrzVfbj
 ylkZm9xQxBbaknOOEP50RPqZEIKs31Kv5m61QSa+a2j9L/tziw3EvpbXFBlYITisHOrc
 JH/mxK8KzRvGMQq7eEjJ0D1tfo1cCUkuw78siy8VrSJQvLItPReOk3pNZ79bl/uzqGdA
 xZjcp0ZATPU+rLVHRBIhFoOyYspIjuFb0uCU0LU9axGWIFyYR3JZqqXVHth78E5v4p4y
 7AeI6a+ZKHqzF3V2D6NrgjTVx68650ZaAGsz9YLXObQshjM/K+Dt60BoO4AIuRM7+FIQ
 tXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HyLTo1H3x89cnTVP/KrI5aPMZqdvKCPXXVZOA+DwKL4=;
 b=kV7Yywnj1uKIJHOScT9UFYYT4dIMLkB8EZyk6yEzovC0d21oa+oQKhibHsrWxRO++V
 MNNJ5mLGwyKiWDkgixlDmPsxO08wQBuCzcsV4h9QbD6g9Ev1tQOSZIT+zrOBE/mRhYj8
 zWbDgIErzdhHf52gTbrK4QctT1aPBb7KrTMRKVRntTvQYjBhLRwMqwCXjXI+M7Q8QIeb
 HOZqGRAfhfrvx2CW/ShA30itpjhqyK4RFA4PoiMuvuEfnj7tP4v9vXtr6EBfcodmuce/
 hwt52Ix9hSTccfNbGKG1+tScRZWqZKhe6umqzKga5Yv+nG2ab0CwRj77Yo2jcknJrHYq
 MCTA==
X-Gm-Message-State: APjAAAXwc2Q8GfGzzcJ3zQwUNEpRueDTS79CoXejW469CPqOd5ln+RcC
 WW7/geSH4n5GJU3dFCPb4L0sBw==
X-Google-Smtp-Source: APXvYqyhH+glrRwKSiAA7qbVYeB5QwqXO/U6RS0ZU2dwiG6C6t5mG7HajTG9DMxfijl7dMFHJHUwBg==
X-Received: by 2002:ac8:1ba9:: with SMTP id z38mr28772211qtj.176.1561128232588; 
 Fri, 21 Jun 2019 07:43:52 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id a11sm1411650qkn.26.2019.06.21.07.43.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 21 Jun 2019 07:43:52 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1heKlb-0000wZ-Mn; Fri, 21 Jun 2019 11:43:51 -0300
Date: Fri, 21 Jun 2019 11:43:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: switch the remaining architectures to use generic GUP v3
Message-ID: <20190621144351.GR19891@ziepe.ca>
References: <20190611144102.8848-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611144102.8848-1-hch@lst.de>
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

On Tue, Jun 11, 2019 at 04:40:46PM +0200, Christoph Hellwig wrote:
> Hi Linus and maintainers,
> 
> below is a series to switch mips, sh and sparc64 to use the generic
> GUP code so that we only have one codebase to touch for further
> improvements to this code.  I don't have hardware for any of these
> architectures, and generally no clue about their page table
> management, so handle with care.

I like this series, ther are alot of people talking about work for GUP
and this will make any of that so much easier to do.

Jason
