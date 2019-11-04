Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32980EE66F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 18:44:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476Kt70LWzzF3mF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 04:44:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=jglisse@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="KqpQJptN"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476Kqq056YzF1RL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 04:42:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572889331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jx5P8upI6dI7oz+S3BNibk79bUjpeE+hNekAqjPP73c=;
 b=KqpQJptNv8+VCoCYgSVg0VArGRw30uivWKEdlAc1WfHpnkSr4S7ggMDNM9ukMYCvkhJlsQ
 ZaqOsJ64uTmKJ7Wq5bKk9yk9jF6PmgSudCEugow/TiOBO77aETV94QMJ+nqz/fbKTC0Dc4
 DlfHSB9DgXEwL3FrHFDqcAjal752VmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-XL6FPTikNZSBZoFGdWe7Ow-1; Mon, 04 Nov 2019 12:42:07 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77158107ACC2;
 Mon,  4 Nov 2019 17:42:03 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6427A5D6C8;
 Mon,  4 Nov 2019 17:41:57 +0000 (UTC)
Date: Mon, 4 Nov 2019 12:41:55 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 08/18] mm/process_vm_access: set FOLL_PIN via
 pin_user_pages_remote()
Message-ID: <20191104174155.GE5134@redhat.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-9-jhubbard@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20191103211813.213227-9-jhubbard@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: XL6FPTikNZSBZoFGdWe7Ow-1
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

On Sun, Nov 03, 2019 at 01:18:03PM -0800, John Hubbard wrote:
> Convert process_vm_access to use the new pin_user_pages_remote()
> call, which sets FOLL_PIN. Setting FOLL_PIN is now required for
> code that requires tracking of pinned pages.
>=20
> Also, release the pages via put_user_page*().
>=20
> Also, rename "pages" to "pinned_pages", as this makes for
> easier reading of process_vm_rw_single_vec().
>=20
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: J=E9r=F4me Glisse <jglisse@redhat.com>

> ---
>  mm/process_vm_access.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
>=20
> diff --git a/mm/process_vm_access.c b/mm/process_vm_access.c
> index 357aa7bef6c0..fd20ab675b85 100644
> --- a/mm/process_vm_access.c
> +++ b/mm/process_vm_access.c
> @@ -42,12 +42,11 @@ static int process_vm_rw_pages(struct page **pages,
>  =09=09if (copy > len)
>  =09=09=09copy =3D len;
> =20
> -=09=09if (vm_write) {
> +=09=09if (vm_write)
>  =09=09=09copied =3D copy_page_from_iter(page, offset, copy, iter);
> -=09=09=09set_page_dirty_lock(page);
> -=09=09} else {
> +=09=09else
>  =09=09=09copied =3D copy_page_to_iter(page, offset, copy, iter);
> -=09=09}
> +
>  =09=09len -=3D copied;
>  =09=09if (copied < copy && iov_iter_count(iter))
>  =09=09=09return -EFAULT;
> @@ -96,7 +95,7 @@ static int process_vm_rw_single_vec(unsigned long addr,
>  =09=09flags |=3D FOLL_WRITE;
> =20
>  =09while (!rc && nr_pages && iov_iter_count(iter)) {
> -=09=09int pages =3D min(nr_pages, max_pages_per_loop);
> +=09=09int pinned_pages =3D min(nr_pages, max_pages_per_loop);
>  =09=09int locked =3D 1;
>  =09=09size_t bytes;
> =20
> @@ -106,14 +105,15 @@ static int process_vm_rw_single_vec(unsigned long a=
ddr,
>  =09=09 * current/current->mm
>  =09=09 */
>  =09=09down_read(&mm->mmap_sem);
> -=09=09pages =3D get_user_pages_remote(task, mm, pa, pages, flags,
> -=09=09=09=09=09      process_pages, NULL, &locked);
> +=09=09pinned_pages =3D pin_user_pages_remote(task, mm, pa, pinned_pages,
> +=09=09=09=09=09=09     flags, process_pages,
> +=09=09=09=09=09=09     NULL, &locked);
>  =09=09if (locked)
>  =09=09=09up_read(&mm->mmap_sem);
> -=09=09if (pages <=3D 0)
> +=09=09if (pinned_pages <=3D 0)
>  =09=09=09return -EFAULT;
> =20
> -=09=09bytes =3D pages * PAGE_SIZE - start_offset;
> +=09=09bytes =3D pinned_pages * PAGE_SIZE - start_offset;
>  =09=09if (bytes > len)
>  =09=09=09bytes =3D len;
> =20
> @@ -122,10 +122,12 @@ static int process_vm_rw_single_vec(unsigned long a=
ddr,
>  =09=09=09=09=09 vm_write);
>  =09=09len -=3D bytes;
>  =09=09start_offset =3D 0;
> -=09=09nr_pages -=3D pages;
> -=09=09pa +=3D pages * PAGE_SIZE;
> -=09=09while (pages)
> -=09=09=09put_page(process_pages[--pages]);
> +=09=09nr_pages -=3D pinned_pages;
> +=09=09pa +=3D pinned_pages * PAGE_SIZE;
> +
> +=09=09/* If vm_write is set, the pages need to be made dirty: */
> +=09=09put_user_pages_dirty_lock(process_pages, pinned_pages,
> +=09=09=09=09=09  vm_write);
>  =09}
> =20
>  =09return rc;
> --=20
> 2.23.0
>=20

