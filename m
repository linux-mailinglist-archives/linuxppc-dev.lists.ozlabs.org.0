Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EE9FB7AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 19:33:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CtY33VD3zF3RG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 05:33:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CtVm4m8yzF6r8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 05:31:43 +1100 (AEDT)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 10:31:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,301,1569308400"; d="scan'208";a="355555407"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga004.jf.intel.com with ESMTP; 13 Nov 2019 10:31:38 -0800
Date: Wed, 13 Nov 2019 10:31:38 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v4 09/23] mm/gup: introduce pin_user_pages*() and FOLL_PIN
Message-ID: <20191113183137.GA12699@iweiny-DESK2.sc.intel.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-10-jhubbard@nvidia.com>
 <20191113104308.GE6367@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113104308.GE6367@quack2.suse.cz>
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
Cc: Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> > +/**
> > + * pin_user_pages_fast() - pin user pages in memory without taking locks
> > + *
> > + * Nearly the same as get_user_pages_fast(), except that FOLL_PIN is set. See
> > + * get_user_pages_fast() for documentation on the function arguments, because
> > + * the arguments here are identical.
> > + *
> > + * FOLL_PIN means that the pages must be released via put_user_page(). Please
> > + * see Documentation/vm/pin_user_pages.rst for further details.
> > + *
> > + * This is intended for Case 1 (DIO) in Documentation/vm/pin_user_pages.rst. It
> > + * is NOT intended for Case 2 (RDMA: long-term pins).
> > + */
> > +int pin_user_pages_fast(unsigned long start, int nr_pages,
> > +			unsigned int gup_flags, struct page **pages)
> > +{
> > +	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
> > +	if (WARN_ON_ONCE(gup_flags & FOLL_GET))
> > +		return -EINVAL;
> > +
> > +	gup_flags |= FOLL_PIN;
> > +	return internal_get_user_pages_fast(start, nr_pages, gup_flags, pages);
> > +}
> > +EXPORT_SYMBOL_GPL(pin_user_pages_fast);
> 
> I was somewhat wondering about the number of functions you add here. So we
> have:
> 
> pin_user_pages()
> pin_user_pages_fast()
> pin_user_pages_remote()
> 
> and then longterm variants:
> 
> pin_longterm_pages()
> pin_longterm_pages_fast()
> pin_longterm_pages_remote()
> 
> and obviously we have gup like:
> get_user_pages()
> get_user_pages_fast()
> get_user_pages_remote()
> ... and some other gup variants ...
> 
> I think we really should have pin_* vs get_* variants as they are very
> different in terms of guarantees and after conversion, any use of get_*
> variant in non-mm code should be closely scrutinized. OTOH pin_longterm_*
> don't look *that* useful to me and just using pin_* instead with
> FOLL_LONGTERM flag would look OK to me and somewhat reduce the number of
> functions which is already large enough? What do people think? I don't feel
> too strongly about this but wanted to bring this up.

I'm a bit concerned with the function explosion myself.  I think what you
suggest is a happy medium.  So I'd be ok with that.

Ira

