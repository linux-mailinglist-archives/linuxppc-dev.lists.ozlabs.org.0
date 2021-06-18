Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE64D3AC170
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 05:38:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5l5M3XqFz3c5d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 13:38:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gondor.apana.org.au (client-ip=216.24.177.18;
 helo=deadmen.hmeau.com; envelope-from=herbert@gondor.apana.org.au;
 receiver=<UNKNOWN>)
Received: from deadmen.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5l506pgVz301L
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 13:38:28 +1000 (AEST)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
 id 1lu5KJ-0000aH-Fe; Fri, 18 Jun 2021 11:37:51 +0800
Received: from herbert by gondobar with local (Exim 4.92)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1lu5Jw-0004Nh-Un; Fri, 18 Jun 2021 11:37:28 +0800
Date: Fri, 18 Jun 2021 11:37:28 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH 01/18] mm: add a kunmap_local_dirty helper
Message-ID: <20210618033728.GA16787@gondor.apana.org.au>
References: <20210615132456.753241-1-hch@lst.de>
 <20210615132456.753241-2-hch@lst.de>
 <20210618030157.GA1905674@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618030157.GA1905674@iweiny-DESK2.sc.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mike Snitzer <snitzer@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Geoff Levand <geoff@infradead.org>, Christoph Lameter <cl@gentwo.de>,
 ceph-devel@vger.kernel.org, linux-mips@vger.kernel.org,
 Dongsheng Yang <dongsheng.yang@easystack.cn>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 dm-devel@redhat.com, linux-arch@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ilya Dryomov <idryomov@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 17, 2021 at 08:01:57PM -0700, Ira Weiny wrote:
>
> > +		flush_kernel_dcache_page(__page);		\
> 
> Is this required on 32bit systems?  Why is kunmap_flush_on_unmap() not
> sufficient on 64bit systems?  The normal kunmap_local() path does that.
> 
> I'm sorry but I did not see a conclusion to my query on V1. Herbert implied the
> he just copied from the crypto code.[1]  I'm concerned that this _dirty() call
> is just going to confuse the users of kmap even more.  So why can't we get to
> the bottom of why flush_kernel_dcache_page() needs so much logic around it
> before complicating the general kernel users.
> 
> I would like to see it go away if possible.

This thread may be related:

https://lwn.net/Articles/240249/

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
