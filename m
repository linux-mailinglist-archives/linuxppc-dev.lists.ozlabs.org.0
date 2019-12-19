Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E6A125ACC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 06:29:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dgRz1bWBzDq8g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 16:29:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="dqorifJ4"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dgPs72sKzDq9F
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 16:27:58 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id i15so5622851oto.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 21:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YiNT2OwN1PC5xiClJXvmIxtU8FKdWcajydHQPOKowMQ=;
 b=dqorifJ4f+v2Gylbu8oAiFDcKa1F8skIpz6V3IgWOqRB33n7U59EJyePbqvuTj6Vy4
 uOPeG7Kob1GhJUtITzia2N5iO6b+FgQt0PfBLv1SShdXtnPTkzPXC4wv8NlfHewxSVCr
 BWaS5xgO+C3htMgxe5c7ubvEmgYEe4TsZt+Zn5XRlxBQhxFahwlW/Mo0S+TgOXqQ/47k
 mtfOMZwImte59GAX6ig1VEn2mK8lUBxmhPPLTpVmIFFbH4EVvah9nw+1Oh0aFp9cBJiW
 sz8ohgGLCmoNne0NYqks6igeYI3pnrq7++p4oBryH4HFQcsawtXKY12nyEVckq37Q8q+
 63BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YiNT2OwN1PC5xiClJXvmIxtU8FKdWcajydHQPOKowMQ=;
 b=g+RArNztpALgYliLbJa8VuPD3g5LP4GwPp0JHBOS3gKUoYIurkI8VTWnOCzY+nSRjt
 WUdH0S/T8Qa7NXR1NKtZUcWFg/lbLLoZl1FM1puPMiCHfnoxvCU1U/seCwj1cGUO5Imb
 IzHKXOhmleysoVNJKeyGPTqYco9qDQ2nW8gQBcROeLrMp1FTKP3AkBwwdWAepHSCtH0O
 U05J7Q/+oJWqydBCJjm6EM2+R9ZZdXxn4YNS3B63HAsBctHJOZzySzSKW/iEITyhqXxk
 GerxVHzqXk/noHFkp2oGB9V29iP6kSzCZpLhoejz0zVIUYn8s52k7B20r7u6BEV/VMQj
 fDPw==
X-Gm-Message-State: APjAAAXtJ15pCE8o7YrYAAKlCgHpCqRtkzGbiV2wkUL87U+aKPGhf+0F
 E346GDsuXVzAzYfrJPhzHd0CGBrcH4rn2t3O3J+y5Q==
X-Google-Smtp-Source: APXvYqzIho60C4tgIgH4FPSEG3bP2Gra7VUCaG88r8S6eX3efYPsOK7esN+4WGhr8L+TiHfEgJwBcHps0ms7QGyGe6Y=
X-Received: by 2002:a05:6830:1744:: with SMTP id
 4mr6583360otz.71.1576733274234; 
 Wed, 18 Dec 2019 21:27:54 -0800 (PST)
MIME-Version: 1.0
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191216222537.491123-5-jhubbard@nvidia.com>
In-Reply-To: <20191216222537.491123-5-jhubbard@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 18 Dec 2019 21:27:43 -0800
Message-ID: <CAPcyv4hQBMxYMurxG=Vwh0=FKWoT3z-Kf=dqES1-icRV5bLwKg@mail.gmail.com>
Subject: Re: [PATCH v11 04/25] mm: devmap: refactor 1-based refcounting for
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
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma <linux-rdma@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
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

On Mon, Dec 16, 2019 at 2:26 PM John Hubbard <jhubbard@nvidia.com> wrote:
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
> Cc: Christoph Hellwig <hch@lst.de>
> Suggested-by: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  include/linux/mm.h | 17 +++++++++++++----
>  mm/memremap.c      | 16 ++--------------
>  mm/swap.c          | 24 ++++++++++++++++++++++++
>  3 files changed, 39 insertions(+), 18 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index c97ea3b694e6..77a4df06c8a7 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -952,9 +952,10 @@ static inline bool is_zone_device_page(const struct =
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
> @@ -963,7 +964,6 @@ static inline bool put_devmap_managed_page(struct pag=
e *page)
>         switch (page->pgmap->type) {
>         case MEMORY_DEVICE_PRIVATE:
>         case MEMORY_DEVICE_FS_DAX:
> -               __put_devmap_managed_page(page);
>                 return true;
>         default:
>                 break;
> @@ -971,7 +971,14 @@ static inline bool put_devmap_managed_page(struct pa=
ge *page)
>         return false;
>  }
>
> +bool put_devmap_managed_page(struct page *page);
> +
>  #else /* CONFIG_DEV_PAGEMAP_OPS */
> +static inline bool page_is_devmap_managed(struct page *page)
> +{
> +       return false;
> +}
> +
>  static inline bool put_devmap_managed_page(struct page *page)
>  {
>         return false;
> @@ -1028,8 +1035,10 @@ static inline void put_page(struct page *page)
>          * need to inform the device driver through callback. See
>          * include/linux/memremap.h and HMM for details.
>          */
> -       if (put_devmap_managed_page(page))
> +       if (page_is_devmap_managed(page)) {
> +               put_devmap_managed_page(page);
>                 return;
> +       }
>
>         if (put_page_testzero(page))
>                 __put_page(page);
> diff --git a/mm/memremap.c b/mm/memremap.c
> index e899fa876a62..2ba773859031 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -411,20 +411,8 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pf=
n,
>  EXPORT_SYMBOL_GPL(get_dev_pagemap);
>
>  #ifdef CONFIG_DEV_PAGEMAP_OPS
> -void __put_devmap_managed_page(struct page *page)
> +void free_devmap_managed_page(struct page *page)
>  {
> -       int count =3D page_ref_dec_return(page);
> -
> -       /* still busy */
> -       if (count > 1)
> -               return;
> -
> -       /* only triggered by the dev_pagemap shutdown path */
> -       if (count =3D=3D 0) {
> -               __put_page(page);
> -               return;
> -       }
> -
>         /* notify page idle for dax */
>         if (!is_device_private_page(page)) {
>                 wake_up_var(&page->_refcount);
> @@ -461,5 +449,5 @@ void __put_devmap_managed_page(struct page *page)
>         page->mapping =3D NULL;
>         page->pgmap->ops->page_free(page);
>  }
> -EXPORT_SYMBOL(__put_devmap_managed_page);
> +EXPORT_SYMBOL(free_devmap_managed_page);

This patch does not have a module consumer for
free_devmap_managed_page(), so the export should move to the patch
that needs the new export.

Also the only reason that put_devmap_managed_page() is EXPORT_SYMBOL
instead of EXPORT_SYMBOL_GPL is that there was no practical way to
hide the devmap details from evey module in the kernel that did
put_page(). I would expect free_devmap_managed_page() to
EXPORT_SYMBOL_GPL if it is not inlined into an existing exported
static inline api.
