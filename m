Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A1EEE683
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 18:47:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476KxJ1LmSzF1nQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 04:47:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=jglisse@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZN2NiQ3r"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476Kv25N4HzF1kw
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 04:45:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572889500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YOrYp+dHNK++F3TdjbhwlDZUdTKuNCY8bLNbrJapJJQ=;
 b=ZN2NiQ3rqfZx8iq/tcB47dII+1zdUZU6gUqQ4N8Z0uxbTlfsiZIkqz6vF1vrIrxOICEcO1
 zXPYT73zyFDZ8egp7B9jlBNEp2PrQ2Fwmpat2lNWT0Yr8vtU7gIo2gYEhwFHA8E1WV4z2H
 zB6SnQ6/dYsdwm16bO7XCMOS7zXdP1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-fsjodwpeO-WySaLYuw_60g-1; Mon, 04 Nov 2019 12:44:56 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3BE31005500;
 Mon,  4 Nov 2019 17:44:52 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7484E600C4;
 Mon,  4 Nov 2019 17:44:47 +0000 (UTC)
Date: Mon, 4 Nov 2019 12:44:45 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 09/18] drm/via: set FOLL_PIN via pin_user_pages_fast()
Message-ID: <20191104174445.GF5134@redhat.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-10-jhubbard@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20191103211813.213227-10-jhubbard@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: fsjodwpeO-WySaLYuw_60g-1
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
 linux-block@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
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

On Sun, Nov 03, 2019 at 01:18:04PM -0800, John Hubbard wrote:
> Convert drm/via to use the new pin_user_pages_fast() call, which sets
> FOLL_PIN. Setting FOLL_PIN is now required for code that requires
> tracking of pinned pages, and therefore for any code that calls
> put_user_page().
>=20
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Please be more explicit that via_dmablit.c is already using put_user_page()
as i am expecting that any conversion to pin_user_pages*() must be pair wit=
h
a put_user_page(). I find above commit message bit unclear from that POV.

Reviewed-by: J=E9r=F4me Glisse <jglisse@redhat.com>


> ---
>  drivers/gpu/drm/via/via_dmablit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/via/via_dmablit.c b/drivers/gpu/drm/via/via_=
dmablit.c
> index 3db000aacd26..37c5e572993a 100644
> --- a/drivers/gpu/drm/via/via_dmablit.c
> +++ b/drivers/gpu/drm/via/via_dmablit.c
> @@ -239,7 +239,7 @@ via_lock_all_dma_pages(drm_via_sg_info_t *vsg,  drm_v=
ia_dmablit_t *xfer)
>  =09vsg->pages =3D vzalloc(array_size(sizeof(struct page *), vsg->num_pag=
es));
>  =09if (NULL =3D=3D vsg->pages)
>  =09=09return -ENOMEM;
> -=09ret =3D get_user_pages_fast((unsigned long)xfer->mem_addr,
> +=09ret =3D pin_user_pages_fast((unsigned long)xfer->mem_addr,
>  =09=09=09vsg->num_pages,
>  =09=09=09vsg->direction =3D=3D DMA_FROM_DEVICE ? FOLL_WRITE : 0,
>  =09=09=09vsg->pages);
> --=20
> 2.23.0
>=20

