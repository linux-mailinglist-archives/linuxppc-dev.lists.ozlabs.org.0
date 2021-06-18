Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E54E3AD1E8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 20:13:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G66Vh62Zgz3c7D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 04:13:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G66VJ1MvZz304N
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 04:13:04 +1000 (AEST)
IronPort-SDR: M8W0/1XsYPp8U0vZv4+7CX1+2oso29zc6DpMRvuY6YYBvU5D1i/q24+GKyZn35GHCSM6VATal8
 8UCH/nP0lE6A==
X-IronPort-AV: E=McAfee;i="6200,9189,10019"; a="292229125"
X-IronPort-AV: E=Sophos;i="5.83,284,1616482800"; d="scan'208";a="292229125"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 11:12:58 -0700
IronPort-SDR: fZjz2UBcjkF09ZLFZzZqWyvwCbkGqlZanM6atUtLAcrBp3dXyferraXT69g8eiZc0puz+dQdsp
 3jQAgCFqGSuA==
X-IronPort-AV: E=Sophos;i="5.83,284,1616482800"; d="scan'208";a="453226714"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 11:12:58 -0700
Date: Fri, 18 Jun 2021 11:12:58 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH 01/18] mm: add a kunmap_local_dirty helper
Message-ID: <20210618181258.GC1905674@iweiny-DESK2.sc.intel.com>
References: <20210615132456.753241-1-hch@lst.de>
 <20210615132456.753241-2-hch@lst.de>
 <20210618030157.GA1905674@iweiny-DESK2.sc.intel.com>
 <20210618033728.GA16787@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618033728.GA16787@gondor.apana.org.au>
User-Agent: Mutt/1.11.1 (2018-12-01)
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

On Fri, Jun 18, 2021 at 11:37:28AM +0800, Herbert Xu wrote:
> On Thu, Jun 17, 2021 at 08:01:57PM -0700, Ira Weiny wrote:
> >
> > > +		flush_kernel_dcache_page(__page);		\
> > 
> > Is this required on 32bit systems?  Why is kunmap_flush_on_unmap() not
> > sufficient on 64bit systems?  The normal kunmap_local() path does that.
> > 
> > I'm sorry but I did not see a conclusion to my query on V1. Herbert implied the
> > he just copied from the crypto code.[1]  I'm concerned that this _dirty() call
> > is just going to confuse the users of kmap even more.  So why can't we get to
> > the bottom of why flush_kernel_dcache_page() needs so much logic around it
> > before complicating the general kernel users.
> > 
> > I would like to see it go away if possible.
> 
> This thread may be related:
> 
> https://lwn.net/Articles/240249/

Interesting!  Thanks!

Digging around a bit more I found:

https://lore.kernel.org/patchwork/patch/439637/

Auditing all the flush_dcache_page() arch code reveals that the mapping field
is either unused, or is checked for NULL.  Furthermore, all the implementations
call page_mapping_file() which further limits the page to not be a swap page.

All flush_kernel_dcache_page() implementations appears to operate the same way
in all arch's which define that call.

So I'm confident now that additional !PageSlab(__page) checks are not needed
and this patch is unnecessary.   Christoph, can we leave this out of the kmap
API and just fold the flush_kernel_dcache_page() calls back into the bvec code?

Unfortunately, I'm not convinced this can be handled completely by
kunmap_local() nor the mem*_page() calls because there is a difference between
flush_dcache_page() and flush_kernel_dcache_page() in most archs...  [parisc
being an exception which falls back to flush_kernel_dcache_page()]...

It seems like the generic unmap path _should_ be able to determine which call
to make based on the page but I'd have to look at that more.

Ira
