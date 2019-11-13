Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7670EFB8BD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 20:25:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Cvj86k5PzF6lw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 06:25:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="bb6122LJ"; 
 dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CvfZ3DHfzF3KS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 06:23:34 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id n16so2879227oig.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 11:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4HKVOkxUXCqQFAssnrt5HN+d13KJzjRJ1pFFkgydGzo=;
 b=bb6122LJyN4TYG5IK7mHh5xygfwPeVWP6I4JnFmlEb2IzPnSXePzt9c7h6VlwCNKNf
 6iTeoCZ+WCekF2UjJKYypJ3VDkp2bZI1sBd8OZia/73qpNgBlVpDNRkT98ztqaV4Pdpl
 ZVL0JboDgCGP8I4MHVFtdYs0p8UDQrSyipyLboTogqOsqYbQVAZcsnUwAJG32rUPMPmj
 ssxQ90TSW2CRqTDYyVFKczonUtqdX4nXBKSakXhSzcp3X5BqgSICBAOxp0Q1Cy1lQWwq
 g444805boKvN2nKVTBF8Zd13UMFnq8mUuIPok109u72I0derPDbhoGvKrYVRikRhE4Pc
 Y6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4HKVOkxUXCqQFAssnrt5HN+d13KJzjRJ1pFFkgydGzo=;
 b=SUVeUevo693HjqrDq9V1zfol/ilOqqsCLPdwkC3AcxXS8MmzNis2g402k/e836mLgy
 j2VN/EZqTifQGY+LivWjrBznkLbjsdRx658TQk1XoLarJqgzwDo018tOUOjSmR6Tf+Yy
 ecRzGrU44QVFLsGOTeGFpwMp8FU6OJhnz9IlZu9R07A45yAC0DKbqFTZ4/NMzjyzzOAE
 Su/MpkeoQbR+fv0SuFmE10Yah8GK8dVVIXdOoSyDNSCZ71ZfscQY03214TG/KY7IGfIj
 TlIEMmaVjnn9zAvynLHAPeadISssdCwPGSuhQ3cUT5IKuUQM6JBUpPRA7nnQ8HxV4aVF
 YZHg==
X-Gm-Message-State: APjAAAV/7bgNsrNu8leDb1kPPZCptKORTrROazLi4mq++eJ0Js4RFZML
 fkDGqwq4q46Ju8FsCw9eetK/MqrwX/mGJe5keL/z0g==
X-Google-Smtp-Source: APXvYqw/J/xJikM9Sn2uJoSKIkSXprx6L2hjLUq/51PEKKOZdQDk8LIwVzxcWXUccXtFtayP/c8+SilHtOvsl5tzGrQ=
X-Received: by 2002:aca:ea57:: with SMTP id i84mr174326oih.73.1573673011067;
 Wed, 13 Nov 2019 11:23:31 -0800 (PST)
MIME-Version: 1.0
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-5-jhubbard@nvidia.com>
In-Reply-To: <20191113042710.3997854-5-jhubbard@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 13 Nov 2019 11:23:19 -0800
Message-ID: <CAPcyv4gGu=G-c1czSAYJ3joTYS_ZYOJ6i9umKzCQEFzpwZMiiA@mail.gmail.com>
Subject: Re: [PATCH v4 04/23] mm: devmap: refactor 1-based refcounting for
 ZONE_DEVICE pages
To: John Hubbard <jhubbard@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 KVM list <kvm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 bpf@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>,
 Jens Axboe <axboe@kernel.dk>, Netdev <netdev@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 12, 2019 at 8:27 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> An upcoming patch changes and complicates the refcounting and
> especially the "put page" aspects of it. In order to keep
> everything clean, refactor the devmap page release routines:
>
> * Rename put_devmap_managed_page() to page_is_devmap_managed(),
>   and limit the functionality to "read only": return a bool,
>   with no side effects.
>
> * Add a new routine, put_devmap_managed_page(), to handle checking
>   what kind of page it is, and what kind of refcount handling it
>   requires.
>
> * Rename __put_devmap_managed_page() to free_devmap_managed_page(),
>   and limit the functionality to unconditionally freeing a devmap
>   page.
>
> This is originally based on a separate patch by Ira Weiny, which
> applied to an early version of the put_user_page() experiments.
> Since then, J=C3=A9r=C3=B4me Glisse suggested the refactoring described a=
bove.
>
> Suggested-by: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  include/linux/mm.h | 27 ++++++++++++++++---
>  mm/memremap.c      | 67 ++++++++++++++++++++--------------------------
>  2 files changed, 53 insertions(+), 41 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index a2adf95b3f9c..96228376139c 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -967,9 +967,10 @@ static inline bool is_zone_device_page(const struct =
page *page)
>  #endif
>
>  #ifdef CONFIG_DEV_PAGEMAP_OPS
> -void __put_devmap_managed_page(struct page *page);
> +void free_devmap_managed_page(struct page *page);
>  DECLARE_STATIC_KEY_FALSE(devmap_managed_key);
> -static inline bool put_devmap_managed_page(struct page *page)
> +
> +static inline bool page_is_devmap_managed(struct page *page)
>  {
>         if (!static_branch_unlikely(&devmap_managed_key))
>                 return false;
> @@ -978,7 +979,6 @@ static inline bool put_devmap_managed_page(struct pag=
e *page)
>         switch (page->pgmap->type) {
>         case MEMORY_DEVICE_PRIVATE:
>         case MEMORY_DEVICE_FS_DAX:
> -               __put_devmap_managed_page(page);
>                 return true;
>         default:
>                 break;
> @@ -986,6 +986,27 @@ static inline bool put_devmap_managed_page(struct pa=
ge *page)
>         return false;
>  }
>
> +static inline bool put_devmap_managed_page(struct page *page)
> +{
> +       bool is_devmap =3D page_is_devmap_managed(page);
> +
> +       if (is_devmap) {
> +               int count =3D page_ref_dec_return(page);
> +
> +               /*
> +                * devmap page refcounts are 1-based, rather than 0-based=
: if
> +                * refcount is 1, then the page is free and the refcount =
is
> +                * stable because nobody holds a reference on the page.
> +                */
> +               if (count =3D=3D 1)
> +                       free_devmap_managed_page(page);
> +               else if (!count)
> +                       __put_page(page);
> +       }
> +
> +       return is_devmap;
> +}
> +
>  #else /* CONFIG_DEV_PAGEMAP_OPS */
>  static inline bool put_devmap_managed_page(struct page *page)
>  {
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 03ccbdfeb697..bc7e2a27d025 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -410,48 +410,39 @@ struct dev_pagemap *get_dev_pagemap(unsigned long p=
fn,
>  EXPORT_SYMBOL_GPL(get_dev_pagemap);
>
>  #ifdef CONFIG_DEV_PAGEMAP_OPS
> -void __put_devmap_managed_page(struct page *page)
> +void free_devmap_managed_page(struct page *page)
>  {
> -       int count =3D page_ref_dec_return(page);
> +       /* Clear Active bit in case of parallel mark_page_accessed */
> +       __ClearPageActive(page);
> +       __ClearPageWaiters(page);
> +
> +       mem_cgroup_uncharge(page);

Ugh, when did all this HMM specific manipulation sneak into the
generic ZONE_DEVICE path? It used to be gated by pgmap type with its
own put_zone_device_private_page(). For example it's certainly
unnecessary and might be broken (would need to check) to call
mem_cgroup_uncharge() on a DAX page. ZONE_DEVICE users are not a
monolith and the HMM use case leaks pages into code paths that DAX
explicitly avoids.
