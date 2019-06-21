Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 564AE4ECA7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 17:56:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VjwF68bpzDqfv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 01:56:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ziepe.ca
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="bLoA8Vtp"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Vjt51p99zDqbB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 01:54:18 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id a15so7389083qtn.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 08:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mLgah8hWTBbEh5+bUoBbV4cO6mlCq84wOyEco/eLAZk=;
 b=bLoA8VtprCwV9w7tPcg86jZ1rpAS3H8PKijh78PfsPQTzI+nU5oul0zgXMeLaRiXRt
 0wFPKH9U615gCpHD+L5Yv8W5lvde3UkjewCNuhwBu5S0CsDeI4/UcCMqeCIrj/KG+8Zb
 l3QD277Vy5HfhTuZfxzL2AOHsfaHAVgllOoulaRVcrlIq1FSXlq3gNYiB0wHGCzm7t/H
 qWTA1oANgEuyafWGY7DXvPIkRaLh51XuTMrMh/wGGhVgrxJRSu7jTVC4lvw3CGowryz4
 kFxWUuoYC16OKmvczWftpSNQDTxxycyKDXLzpSxXkmqILfG31DDx+kT4wcJhilA/snBo
 PXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mLgah8hWTBbEh5+bUoBbV4cO6mlCq84wOyEco/eLAZk=;
 b=B5f/PoXAwW/ZdeQ412Kt9gw0B2akQqSBjXjf8/3PUT4/lG2rZ74JW3eKigc3/0IYJK
 pqRbH2IisINrRPxysyh1oIUdWcnLPjgp+TdURwj+16ZI59zNyLlpXRhFnUqdv6EtRpVv
 yljrPvxoZ4lSFqyGls68VL9NhBB0x5wAfkrRNxn7ujP8IesHAt+1iNcx1hwK5DkdMll/
 fEDB74TiuTa8u46NxEjWmn/+zTLx7Q8gjgOSDO9aExZB/q1ZDNmpcV7GhmNV3AH4iv+p
 l3rYsw5JhxFrJMbeWo3k8l7BlFDPdcmVb10S0IRhExXrjeSZRx1NGFO4NJivZOHTcf1B
 J6Ag==
X-Gm-Message-State: APjAAAVsuTsM1xuNRBVVvgCD1Z0qAfQn0pG55MNTEeFxiwxTYtFMSdVT
 mby9jJIBzCXMwijNr53WvjF4kQ==
X-Google-Smtp-Source: APXvYqzhkQgyWFPdC17pHjyc6apgZlhrLfru3XQYo7Lqsq6E89yDvd3j/NnDUqHTzZE/tzkJFdAVuQ==
X-Received: by 2002:a0c:8885:: with SMTP id 5mr46203792qvn.137.1561132456162; 
 Fri, 21 Jun 2019 08:54:16 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id 15sm1699745qtf.2.2019.06.21.08.54.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 21 Jun 2019 08:54:15 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1heLrj-0001oa-5A; Fri, 21 Jun 2019 12:54:15 -0300
Date: Fri, 21 Jun 2019 12:54:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Khalid Aziz <khalid.aziz@oracle.com>
Subject: Re: [PATCH 01/16] mm: use untagged_addr() for get_user_pages_fast
 addresses
Message-ID: <20190621155415.GU19891@ziepe.ca>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-2-hch@lst.de>
 <20190621133911.GL19891@ziepe.ca>
 <9a4e1485-4683-92b0-3d26-73f26896d646@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a4e1485-4683-92b0-3d26-73f26896d646@oracle.com>
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
 linux-mips@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-mm@kvack.org,
 Paul Burton <paul.burton@mips.com>, Paul Mackerras <paulus@samba.org>,
 Andrey Konovalov <andreyknvl@google.com>, sparclinux@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 21, 2019 at 09:35:11AM -0600, Khalid Aziz wrote:
> On 6/21/19 7:39 AM, Jason Gunthorpe wrote:
> > On Tue, Jun 11, 2019 at 04:40:47PM +0200, Christoph Hellwig wrote:
> >> This will allow sparc64 to override its ADI tags for
> >> get_user_pages and get_user_pages_fast.
> >>
> >> Signed-off-by: Christoph Hellwig <hch@lst.de>
> >>  mm/gup.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/mm/gup.c b/mm/gup.c
> >> index ddde097cf9e4..6bb521db67ec 100644
> >> +++ b/mm/gup.c
> >> @@ -2146,7 +2146,7 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
> >>  	unsigned long flags;
> >>  	int nr = 0;
> >>  
> >> -	start &= PAGE_MASK;
> >> +	start = untagged_addr(start) & PAGE_MASK;
> >>  	len = (unsigned long) nr_pages << PAGE_SHIFT;
> >>  	end = start + len;
> > 
> > Hmm, this function, and the other, goes on to do:
> > 
> >         if (unlikely(!access_ok((void __user *)start, len)))
> >                 return 0;
> > 
> > and I thought that access_ok takes in the tagged pointer?
> > 
> > How about re-order it a bit?
> 
> access_ok() can handle tagged or untagged pointers. It just strips the
> tag bits from the top bits. Current order doesn't really matter from
> functionality point of view. There might be minor gain in delaying
> untagging in __get_user_pages_fast() but I could go either way.

I understand the current ARM and SPARC implementations don't do much
with the tags, but it feels like a really big assumption for the core
code that all future uses of tags will be fine to have them stripped
out of 'void __user *' pointers. IMHO that is something we should not
be doing in the core kernel..

Jason
