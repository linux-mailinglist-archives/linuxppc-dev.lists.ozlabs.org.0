Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DE05F67C1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 15:21:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjsXg26bFz3c9W
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 00:21:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g9dsHX3i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g9dsHX3i;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjsWj1TZzz3bmK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 00:20:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665062449; x=1696598449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EU0abpI6YFdk3YA4KGgLZ9e2cnqNyTF/1r17KmA6WbU=;
  b=g9dsHX3ig9H92u93rW73lEQQH9uCCTCS+aTRaeoowfmUbqjxwzb2D4a8
   uzpNAafM547w19gZEKqsHNYQHogTOZjBWq3jhYje8c7nl5zTPT0crHI6o
   b8ZvGwrTidO6ggH6g9sNc7r3rPGjpjcsgo7dIpcCYZ51RNeUjET3NwxPS
   AmLldLIh7974mjNKcuz/zC+Z5bikd7BxyNaYaHhfqhiMtL+lDPDTWyeP0
   3TK/oJLwN1uAqzduS+B2iyjgT7tv1hbUY4znNrsRAMjub/snpw4RYRz8d
   LbYCw4OvoqL8DanUnZhb3Oom2aP3ihJXncPlt3AtLtMJFmKPYIW5q+1ja
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="286665445"
X-IronPort-AV: E=Sophos;i="5.95,163,1661842800"; 
   d="scan'208";a="286665445"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2022 06:20:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="729143418"
X-IronPort-AV: E=Sophos;i="5.95,163,1661842800"; 
   d="scan'208";a="729143418"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 06 Oct 2022 06:20:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ogQng-0039rX-0O;
	Thu, 06 Oct 2022 16:20:32 +0300
Date: Thu, 6 Oct 2022 16:20:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v1 3/5] treewide: use get_random_u32() when possible
Message-ID: <Yz7WHyD+teLOh2ho@smile.fi.intel.com>
References: <20221005214844.2699-1-Jason@zx2c4.com>
 <20221005214844.2699-4-Jason@zx2c4.com>
 <Yz7OdfKZeGkpZSKb@ziepe.ca>
 <CAHmME9r_vNRFFjUvqx8QkBddg_kQU=FMgpk9TqOVZdvX6zXHNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9r_vNRFFjUvqx8QkBddg_kQU=FMgpk9TqOVZdvX6zXHNg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org, linux-wireless@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, linux-sctp@vger.kernel.org, target-devel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, drbd-dev@lists.linbit.com, dev@openvswitch.org, rds-devel@oss.oracle.com, linux-scsi@vger.kernel.org, dccp@vger.kernel.org, linux-rdma@vger.kernel.org, kasan-dev@googlegroups.com, lvs-devel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, SHA-cyfmac-dev-list@infineon.com, coreteam@netfilter.org, tipc-discussion@lists.sourceforge.net, linux-ext4@vger.kernel.org, linux-media@vger.kernel.org, linux-actions@lists.infradead.org, linux-nfs@vger.kernel.org, linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-nvme@lists.infradead.org, linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, cake@lists.bufferbloat.net, brcm80211-dev-list.pdl@broadcom.com, linux-raid@vger.
 kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org, netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 06, 2022 at 07:05:48AM -0600, Jason A. Donenfeld wrote:
> On Thu, Oct 6, 2022 at 6:47 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > On Wed, Oct 05, 2022 at 11:48:42PM +0200, Jason A. Donenfeld wrote:

...

> > > -     u32 isn = (prandom_u32() & ~7UL) - 1;
> > > +     u32 isn = (get_random_u32() & ~7UL) - 1;
> >
> > Maybe this wants to be written as
> >
> > (prandom_max(U32_MAX >> 7) << 7) | 7

> > ?
> 
> Holy smokes. Yea I guess maybe? It doesn't exactly gain anything or
> make the code clearer though, and is a little bit more magical than
> I'd like on a first pass.

Shouldn't the two first 7s to be 3s?

...

> > > -     psn = prandom_u32() & 0xffffff;
> > > +     psn = get_random_u32() & 0xffffff;
> >
> >  prandom_max(0xffffff + 1)
> 
> That'd work, but again it's not more clear. Authors here are going for
> a 24-bit number, and masking seems like a clear way to express that.

We have some 24-bit APIs (and 48-bit) already in kernel, why not to have
get_random_u24() ?


-- 
With Best Regards,
Andy Shevchenko


