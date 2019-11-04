Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A32A9EEA7B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 21:52:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476Q3Q2SVmzF1jP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 07:52:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=jglisse@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="hQ9+wUcl"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476Pz3301DzF49J
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 07:48:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572900523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mn5RsMcwjgSz4Uc3SsLk9u7OdhxITCoqvev72K3k0/w=;
 b=hQ9+wUclM/gzvrwXlA0dBmvh/ki8tPcPI4NMrzUSwOoLjc6TTXi4ppLn6A8JYvsmhSCT/q
 9xJ9ZYZR1XsNeEJ6PbCbPyMze2ZLL00duT3IgVl7S51Ld6Zf0Dtf0e8LS6qh+AhfwtBiPB
 MvLGtYW2tZJFAys78ar8r6R6dU8re+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-XtiEJ6MJOtixJceTBvorsw-1; Mon, 04 Nov 2019 15:48:39 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 279BB1800DFD;
 Mon,  4 Nov 2019 20:48:35 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AEACB5C3F8;
 Mon,  4 Nov 2019 20:48:29 +0000 (UTC)
Date: Mon, 4 Nov 2019 15:48:28 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH v2 05/18] mm/gup: introduce pin_user_pages*() and FOLL_PIN
Message-ID: <20191104204828.GC7731@redhat.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-6-jhubbard@nvidia.com>
 <alpine.DEB.2.21.1911041231520.74801@chino.kir.corp.google.com>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1911041231520.74801@chino.kir.corp.google.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: XtiEJ6MJOtixJceTBvorsw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 04, 2019 at 12:33:09PM -0800, David Rientjes wrote:
>=20
>=20
> On Sun, 3 Nov 2019, John Hubbard wrote:
>=20
> > Introduce pin_user_pages*() variations of get_user_pages*() calls,
> > and also pin_longterm_pages*() variations.
> >=20
> > These variants all set FOLL_PIN, which is also introduced, and
> > thoroughly documented.
> >=20
> > The pin_longterm*() variants also set FOLL_LONGTERM, in addition
> > to FOLL_PIN:
> >=20
> >     pin_user_pages()
> >     pin_user_pages_remote()
> >     pin_user_pages_fast()
> >=20
> >     pin_longterm_pages()
> >     pin_longterm_pages_remote()
> >     pin_longterm_pages_fast()
> >=20
> > All pages that are pinned via the above calls, must be unpinned via
> > put_user_page().
> >=20
>=20
> Hi John,
>=20
> I'm curious what consideration is given to what pageblock migrate types=
=20
> that FOLL_PIN and FOLL_LONGTERM pages originate from, assuming that=20
> longterm would want to originate from MIGRATE_UNMOVABLE pageblocks for th=
e=20
> purposes of anti-fragmentation?

We do not control page block, GUP can happens on _any_ page that is
map inside a process (anonymous private vma or regular file back one).

Cheers,
J=E9r=F4me

