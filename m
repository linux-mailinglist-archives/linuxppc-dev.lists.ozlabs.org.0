Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2538A104FA3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 10:51:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JZZZ0LrSzDr55
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 20:51:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=jack@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JZXB6HBvzDr1D
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 20:49:13 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8A829AE39;
 Thu, 21 Nov 2019 09:49:10 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 0C6121E47FC; Thu, 21 Nov 2019 10:49:08 +0100 (CET)
Date: Thu, 21 Nov 2019 10:49:08 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v7 02/24] mm/gup: factor out duplicate code from four
 routines
Message-ID: <20191121094908.GB18190@quack2.suse.cz>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
 <20191121071354.456618-3-jhubbard@nvidia.com>
 <20191121080356.GA24784@lst.de>
 <852f6c27-8b65-547b-89e0-e8f32a4d17b9@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <852f6c27-8b65-547b-89e0-e8f32a4d17b9@nvidia.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 21-11-19 00:29:59, John Hubbard wrote:
> On 11/21/19 12:03 AM, Christoph Hellwig wrote:
> > Otherwise this looks fine and might be a worthwhile cleanup to feed
> > Andrew for 5.5 independent of the gut of the changes.
> > 
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > 
> 
> Thanks for the reviews! Say, it sounds like your view here is that this
> series should be targeted at 5.6 (not 5.5), is that what you have in mind?
> And get the preparatory patches (1-9, and maybe even 10-16) into 5.5?

Yeah, actually I feel the same. The merge window is going to open on Sunday
and the series isn't still fully baked and happily sitting in linux-next
(and larger changes should really sit in linux-next for at least a week,
preferably two, before the merge window opens to get some reasonable test
coverage).  So I'd take out the independent easy patches that are already
reviewed, get them merged into Andrew's (or whatever other appropriate
tree) now so that they get at least a week of testing in linux-next before
going upstream.  And the more involved bits will have to wait for 5.6 -
which means let's just continue working on them as we do now because
ideally in 4 weeks we should have them ready with all the reviews so that
they can be picked up and integrated into linux-next.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
