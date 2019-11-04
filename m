Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EF5EE511
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 17:48:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476Jf70JGVzF0mS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 03:48:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=jglisse@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="hiYtuOZI"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476JRb0dqdzF40C
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 03:39:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572885576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZKRtyHtWqxotoMRVCD2L231GIf5CzzOu6K7yMpGCV1E=;
 b=hiYtuOZIrS4Dtq2A70Yyrgqf0kG1a7RCsS289tkO9EWgEgzteBkLAB+wq4x1k88h8JNJIy
 vtFFStsbzSqMmhcDwISQiQ/L+jD38xPMmplP6s3npI7am82vDNnaE0K1x+0Hv03IDHADLU
 +7tFiaCT/Oq+UsMx7W4MKHtfPF9rv5I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-XcpsC-lSP4a7ehsn9d2sxg-1; Mon, 04 Nov 2019 11:39:31 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D6C88017DD;
 Mon,  4 Nov 2019 16:39:27 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0A6F5C240;
 Mon,  4 Nov 2019 16:39:20 +0000 (UTC)
Date: Mon, 4 Nov 2019 11:39:19 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 01/18] mm/gup: pass flags arg to __gup_device_*
 functions
Message-ID: <20191104163919.GA5134@redhat.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-2-jhubbard@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20191103211813.213227-2-jhubbard@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: XcpsC-lSP4a7ehsn9d2sxg-1
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
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 03, 2019 at 01:17:56PM -0800, John Hubbard wrote:
> A subsequent patch requires access to gup flags, so
> pass the flags argument through to the __gup_device_*
> functions.
>=20
> Also placate checkpatch.pl by shortening a nearby line.
>=20
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: J=E9r=F4me Glisse <jglisse@redhat.com>

> ---
>  mm/gup.c | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
>=20
> diff --git a/mm/gup.c b/mm/gup.c
> index 8f236a335ae9..85caf76b3012 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1890,7 +1890,8 @@ static int gup_pte_range(pmd_t pmd, unsigned long a=
ddr, unsigned long end,
> =20
>  #if defined(CONFIG_ARCH_HAS_PTE_DEVMAP) && defined(CONFIG_TRANSPARENT_HU=
GEPAGE)
>  static int __gup_device_huge(unsigned long pfn, unsigned long addr,
> -=09=09unsigned long end, struct page **pages, int *nr)
> +=09=09=09     unsigned long end, unsigned int flags,
> +=09=09=09     struct page **pages, int *nr)
>  {
>  =09int nr_start =3D *nr;
>  =09struct dev_pagemap *pgmap =3D NULL;
> @@ -1916,13 +1917,14 @@ static int __gup_device_huge(unsigned long pfn, u=
nsigned long addr,
>  }
> =20
>  static int __gup_device_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long =
addr,
> -=09=09unsigned long end, struct page **pages, int *nr)
> +=09=09=09=09 unsigned long end, unsigned int flags,
> +=09=09=09=09 struct page **pages, int *nr)
>  {
>  =09unsigned long fault_pfn;
>  =09int nr_start =3D *nr;
> =20
>  =09fault_pfn =3D pmd_pfn(orig) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
> -=09if (!__gup_device_huge(fault_pfn, addr, end, pages, nr))
> +=09if (!__gup_device_huge(fault_pfn, addr, end, flags, pages, nr))
>  =09=09return 0;
> =20
>  =09if (unlikely(pmd_val(orig) !=3D pmd_val(*pmdp))) {
> @@ -1933,13 +1935,14 @@ static int __gup_device_huge_pmd(pmd_t orig, pmd_=
t *pmdp, unsigned long addr,
>  }
> =20
>  static int __gup_device_huge_pud(pud_t orig, pud_t *pudp, unsigned long =
addr,
> -=09=09unsigned long end, struct page **pages, int *nr)
> +=09=09=09=09 unsigned long end, unsigned int flags,
> +=09=09=09=09 struct page **pages, int *nr)
>  {
>  =09unsigned long fault_pfn;
>  =09int nr_start =3D *nr;
> =20
>  =09fault_pfn =3D pud_pfn(orig) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
> -=09if (!__gup_device_huge(fault_pfn, addr, end, pages, nr))
> +=09if (!__gup_device_huge(fault_pfn, addr, end, flags, pages, nr))
>  =09=09return 0;
> =20
>  =09if (unlikely(pud_val(orig) !=3D pud_val(*pudp))) {
> @@ -1950,14 +1953,16 @@ static int __gup_device_huge_pud(pud_t orig, pud_=
t *pudp, unsigned long addr,
>  }
>  #else
>  static int __gup_device_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long =
addr,
> -=09=09unsigned long end, struct page **pages, int *nr)
> +=09=09=09=09 unsigned long end, unsigned int flags,
> +=09=09=09=09 struct page **pages, int *nr)
>  {
>  =09BUILD_BUG();
>  =09return 0;
>  }
> =20
>  static int __gup_device_huge_pud(pud_t pud, pud_t *pudp, unsigned long a=
ddr,
> -=09=09unsigned long end, struct page **pages, int *nr)
> +=09=09=09=09 unsigned long end, unsigned int flags,
> +=09=09=09=09 struct page **pages, int *nr)
>  {
>  =09BUILD_BUG();
>  =09return 0;
> @@ -2062,7 +2067,8 @@ static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, un=
signed long addr,
>  =09if (pmd_devmap(orig)) {
>  =09=09if (unlikely(flags & FOLL_LONGTERM))
>  =09=09=09return 0;
> -=09=09return __gup_device_huge_pmd(orig, pmdp, addr, end, pages, nr);
> +=09=09return __gup_device_huge_pmd(orig, pmdp, addr, end, flags,
> +=09=09=09=09=09     pages, nr);
>  =09}
> =20
>  =09refs =3D 0;
> @@ -2092,7 +2098,8 @@ static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, un=
signed long addr,
>  }
> =20
>  static int gup_huge_pud(pud_t orig, pud_t *pudp, unsigned long addr,
> -=09=09unsigned long end, unsigned int flags, struct page **pages, int *n=
r)
> +=09=09=09unsigned long end, unsigned int flags,
> +=09=09=09struct page **pages, int *nr)
>  {
>  =09struct page *head, *page;
>  =09int refs;
> @@ -2103,7 +2110,8 @@ static int gup_huge_pud(pud_t orig, pud_t *pudp, un=
signed long addr,
>  =09if (pud_devmap(orig)) {
>  =09=09if (unlikely(flags & FOLL_LONGTERM))
>  =09=09=09return 0;
> -=09=09return __gup_device_huge_pud(orig, pudp, addr, end, pages, nr);
> +=09=09return __gup_device_huge_pud(orig, pudp, addr, end, flags,
> +=09=09=09=09=09     pages, nr);
>  =09}
> =20
>  =09refs =3D 0;
> --=20
> 2.23.0
>=20

