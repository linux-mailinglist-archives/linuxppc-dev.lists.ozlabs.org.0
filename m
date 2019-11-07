Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CE5F2912
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 09:28:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477xPn1jskzF683
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 19:28:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="KypO2u9q"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477wx73f3MzF40n
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 19:07:22 +1100 (AEDT)
Received: from rapoport-lnx (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 14F2F2077C;
 Thu,  7 Nov 2019 08:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573114040;
 bh=Vs0vmuJFZJfCdBWbcef1JshwZZc9l+YrjwUdtsaNu3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KypO2u9qQZOpCT97PagoJmJ05jNzzAwEOh5TQuJtaHcnw290kuyiCyRgXcpTDgoff
 yL2r3/5Nv3OxL5iW1vDTUMldS7lvQVWUl8vBPDTErZIqUCYXU5EvD9rUB9CL4lekw9
 M70s0IBFr/3wdhsUYXeg/j3kPNjd4MGq8LMTqoAU=
Date: Thu, 7 Nov 2019 10:07:07 +0200
From: Mike Rapoport <rppt@kernel.org>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 05/18] mm/gup: introduce pin_user_pages*() and FOLL_PIN
Message-ID: <20191107080706.GB3239@rapoport-lnx>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-6-jhubbard@nvidia.com>
 <20191105131032.GG25005@rapoport-lnx>
 <9ac948a4-59bf-2427-2007-e460aad2848a@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ac948a4-59bf-2427-2007-e460aad2848a@nvidia.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
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

On Tue, Nov 05, 2019 at 11:00:06AM -0800, John Hubbard wrote:
> On 11/5/19 5:10 AM, Mike Rapoport wrote:
> ...
> >> ---
> >>  Documentation/vm/index.rst          |   1 +
> >>  Documentation/vm/pin_user_pages.rst | 212 ++++++++++++++++++++++
> > 
> > I think it belongs to Documentation/core-api.
> 
> Done:
> 
> diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
> index ab0eae1c153a..413f7d7c8642 100644
> --- a/Documentation/core-api/index.rst
> +++ b/Documentation/core-api/index.rst
> @@ -31,6 +31,7 @@ Core utilities
>     generic-radix-tree
>     memory-allocation
>     mm-api
> +   pin_user_pages
>     gfp_mask-from-fs-io
>     timekeeping
>     boot-time-mm

Thanks!
 
> ...
> >> diff --git a/Documentation/vm/pin_user_pages.rst b/Documentation/vm/pin_user_pages.rst
> >> new file mode 100644
> >> index 000000000000..3910f49ca98c
> >> --- /dev/null
> >> +++ b/Documentation/vm/pin_user_pages.rst
> >> @@ -0,0 +1,212 @@
> >> +.. SPDX-License-Identifier: GPL-2.0
> >> +
> >> +====================================================
> >> +pin_user_pages() and related calls
> >> +====================================================
> > 
> > I know this is too much to ask, but having pin_user_pages() a part of more
> > general GUP description would be really great :)
> > 
> 
> Yes, definitely. But until I saw the reaction to the pin_user_pages() API
> family, I didn't want to write too much--it could have all been tossed out
> in favor of a whole different API. But now that we've had some initial
> reviews, I'm much more confident in being able to write about the larger 
> API set.
> 
> So yes, I'll put that on my pending list.
> 
> 
> ...
> >> +This document describes the following functions: ::
> >> +
> >> + pin_user_pages
> >> + pin_user_pages_fast
> >> + pin_user_pages_remote
> >> +
> >> + pin_longterm_pages
> >> + pin_longterm_pages_fast
> >> + pin_longterm_pages_remote
> >> +
> >> +Basic description of FOLL_PIN
> >> +=============================
> >> +
> >> +A new flag for get_user_pages ("gup") has been added: FOLL_PIN. FOLL_PIN has
> > 
> > Consider reading this after, say, half a year ;-)
> > 
> 
> OK, OK. I knew when I wrote that that it was not going to stay new forever, but
> somehow failed to write the right thing anyway. :) 
> 
> Here's a revised set of paragraphs:
> 
> Basic description of FOLL_PIN
> =============================
> 
> FOLL_PIN and FOLL_LONGTERM are flags that can be passed to the get_user_pages*()
> ("gup") family of functions. FOLL_PIN has significant interactions and
> interdependencies with FOLL_LONGTERM, so both are covered here.
> 
> Both FOLL_PIN and FOLL_LONGTERM are internal to gup, meaning that neither
> FOLL_PIN nor FOLL_LONGTERM should not appear at the gup call sites. This allows
> the associated wrapper functions  (pin_user_pages() and others) to set the
> correct combination of these flags, and to check for problems as well.

Great, thanks! 
 
> thanks,
> 
> John Hubbard
> NVIDIA

-- 
Sincerely yours,
Mike.
