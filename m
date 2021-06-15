Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A30623A7642
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 07:04:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3x7f6yWYz3018
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 15:04:30 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3x7G5HG5z3018
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 15:04:09 +1000 (AEST)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
 id 1lt1Ec-0006cw-4n; Tue, 15 Jun 2021 13:03:34 +0800
Received: from herbert by gondobar with local (Exim 4.92)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1lt1E3-0001MR-0g; Tue, 15 Jun 2021 13:02:59 +0800
Date: Tue, 15 Jun 2021 13:02:59 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ira Weiny <ira.weiny@intel.com>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 09/16] ps3disk: use memcpy_{from,to}_bvec
Message-ID: <20210615050258.GA5208@gondor.apana.org.au>
References: <20210608160603.1535935-1-hch@lst.de>
 <20210608160603.1535935-10-hch@lst.de>
 <20210609014822.GT3697498@iweiny-DESK2.sc.intel.com>
 <20210611065338.GA31210@lst.de>
 <20210612040743.GG1600546@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210612040743.GG1600546@iweiny-DESK2.sc.intel.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-arch@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-scsi@vger.kernel.org,
 Mike Snitzer <snitzer@redhat.com>, linux-sh@vger.kernel.org,
 Geoff Levand <geoff@infradead.org>, Tero Kristo <t-kristo@ti.com>,
 ceph-devel@vger.kernel.org, linux-mips@vger.kernel.org,
 Dongsheng Yang <dongsheng.yang@easystack.cn>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Thomas Gleixner <tglx@linutronix.de>, linux-csky@vger.kernel.org,
 linux-mmc@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 11, 2021 at 09:07:43PM -0700, Ira Weiny wrote:
>
> More recently this was added:
> 
> 7e34e0bbc644 crypto: omap-crypto - fix userspace copied buffer access
> 
> I'm CC'ing Tero and Herbert to see why they added the SLAB check.

Probably because the generic Crypto API has the same check.  This
all goes back to

commit 4f3e797ad07d52d34983354a77b365dfcd48c1b4
Author: Herbert Xu <herbert@gondor.apana.org.au>
Date:   Mon Feb 9 14:22:14 2009 +1100

    crypto: scatterwalk - Avoid flush_dcache_page on slab pages

    It's illegal to call flush_dcache_page on slab pages on a number
    of architectures.  So this patch avoids doing so if PageSlab is
    true.

    In future we can move the flush_dcache_page call to those page
    cache users that actually need it.

    Reported-by: David S. Miller <davem@davemloft.net>
    Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

But I can't find any emails discussing this so let me ask Dave
directly and see if he can tell us what the issue was or might
have been.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
