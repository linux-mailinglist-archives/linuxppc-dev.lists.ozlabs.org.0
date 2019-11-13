Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6385EFBB4B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 23:02:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CzBQ4tQwzF7Mc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 09:02:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="JM5duNQK"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Cz7W0XdLzF67J
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 09:00:21 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id 14so3272014oir.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 14:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=324rHVZhrTFcjdK8aV5SZ9IVxxPo74njd/OitSvPfwI=;
 b=JM5duNQKWOnxFmjkav9HZXH/NjP8V3EFjvRScM8H1ENfRZFMJcqKXGsOH5QH1/XkbY
 vCD0sAE5s56t2TslzFPlVDg58PWwtwFXGXAxBMG0tsTexLa7QMLwyOZ0Gso6auFVso3Q
 /H11R89hS1mPF9jLodhzUGt5k/XEVyO/tLKGjex6PPX1In+qTXV0N/dfIMdhxv6uG2sh
 BZYlUR9Q3NRtsqyHW81yXHskK+nAMUQ+QwspdWneea1zKsQSEwoQhoG8lU1c4/okZPhW
 9NJ0U93AQ6wir2C/KYTbbzItcaYUlbUWKJBV/qu+CRPugyKbqUjxjl/m3RkevX8fGpp7
 vvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=324rHVZhrTFcjdK8aV5SZ9IVxxPo74njd/OitSvPfwI=;
 b=P2Ya5H5ekZlJvk5SIMLsMu+9GwG312u+TycBTSJnfuaF6vcqpZZc3zJhm/t8fAh/6W
 JA6TuycqMlr0hoKN3/ra0QJ1WWWT7pHy3Q6UnXbCi3+hh8JNSmGNLwQa3XLjqhXJ7jFO
 czCyox/M75N0bhOUg1+UTNzGi6FHfOcA9u+6xTbkNW8Zt3dmWJhjyonteBoYJ1oc5XSk
 THYXuSgXQzlp1CQtKKhuu2pJpJQ/BK7HaX7eikHk0J+LsM4aq/wAzVYBdqnQUkFJSdFq
 Yef7RM2pKM5BVtbq5OJfHHjT8vUnpD+dEpkVpm/ljPM+KH/On5HcLf2LEWouLu1ugAbF
 scJg==
X-Gm-Message-State: APjAAAXIQx2jx/fO6d7M+PXgaweJT0E5MLWyD1Y549MQdGA4Oof89crZ
 IZYPzrKkIOrOXX8mD8yQ4UfN9gtT/3CNuZU1kbLToA==
X-Google-Smtp-Source: APXvYqwVpp6U8sqm3YkFplAWvkGjJy2mawgDrQR8Ysx5PquK9pjlYrXYZlj6N+IM0+gIhTrJsrUtjBK/sbd+UEVubTA=
X-Received: by 2002:aca:3d84:: with SMTP id k126mr726052oia.70.1573682418131; 
 Wed, 13 Nov 2019 14:00:18 -0800 (PST)
MIME-Version: 1.0
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-5-jhubbard@nvidia.com>
 <CAPcyv4gGu=G-c1czSAYJ3joTYS_ZYOJ6i9umKzCQEFzpwZMiiA@mail.gmail.com>
In-Reply-To: <CAPcyv4gGu=G-c1czSAYJ3joTYS_ZYOJ6i9umKzCQEFzpwZMiiA@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 13 Nov 2019 14:00:06 -0800
Message-ID: <CAPcyv4hr64b-k4j7ZY796+k-+Dy11REMcvPJ+QjTsyJ3vSdfKg@mail.gmail.com>
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

On Wed, Nov 13, 2019 at 11:23 AM Dan Williams <dan.j.williams@intel.com> wr=
ote:
>
> On Tue, Nov 12, 2019 at 8:27 PM John Hubbard <jhubbard@nvidia.com> wrote:
> >
> > An upcoming patch changes and complicates the refcounting and
> > especially the "put page" aspects of it. In order to keep
> > everything clean, refactor the devmap page release routines:
> >
> > * Rename put_devmap_managed_page() to page_is_devmap_managed(),
> >   and limit the functionality to "read only": return a bool,
> >   with no side effects.
> >
> > * Add a new routine, put_devmap_managed_page(), to handle checking
> >   what kind of page it is, and what kind of refcount handling it
> >   requires.
> >
> > * Rename __put_devmap_managed_page() to free_devmap_managed_page(),
> >   and limit the functionality to unconditionally freeing a devmap
> >   page.
> >
> > This is originally based on a separate patch by Ira Weiny, which
> > applied to an early version of the put_user_page() experiments.
> > Since then, J=C3=A9r=C3=B4me Glisse suggested the refactoring described=
 above.
> >
> > Suggested-by: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> > ---
> >  include/linux/mm.h | 27 ++++++++++++++++---
> >  mm/memremap.c      | 67 ++++++++++++++++++++--------------------------
> >  2 files changed, 53 insertions(+), 41 deletions(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index a2adf95b3f9c..96228376139c 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -967,9 +967,10 @@ static inline bool is_zone_device_page(const struc=
t page *page)
> >  #endif
> >
> >  #ifdef CONFIG_DEV_PAGEMAP_OPS
> > -void __put_devmap_managed_page(struct page *page);
> > +void free_devmap_managed_page(struct page *page);
> >  DECLARE_STATIC_KEY_FALSE(devmap_managed_key);
> > -static inline bool put_devmap_managed_page(struct page *page)
> > +
> > +static inline bool page_is_devmap_managed(struct page *page)
> >  {
> >         if (!static_branch_unlikely(&devmap_managed_key))
> >                 return false;
> > @@ -978,7 +979,6 @@ static inline bool put_devmap_managed_page(struct p=
age *page)
> >         switch (page->pgmap->type) {
> >         case MEMORY_DEVICE_PRIVATE:
> >         case MEMORY_DEVICE_FS_DAX:
> > -               __put_devmap_managed_page(page);
> >                 return true;
> >         default:
> >                 break;
> > @@ -986,6 +986,27 @@ static inline bool put_devmap_managed_page(struct =
page *page)
> >         return false;
> >  }
> >
> > +static inline bool put_devmap_managed_page(struct page *page)
> > +{
> > +       bool is_devmap =3D page_is_devmap_managed(page);
> > +
> > +       if (is_devmap) {
> > +               int count =3D page_ref_dec_return(page);
> > +
> > +               /*
> > +                * devmap page refcounts are 1-based, rather than 0-bas=
ed: if
> > +                * refcount is 1, then the page is free and the refcoun=
t is
> > +                * stable because nobody holds a reference on the page.
> > +                */
> > +               if (count =3D=3D 1)
> > +                       free_devmap_managed_page(page);
> > +               else if (!count)
> > +                       __put_page(page);
> > +       }
> > +
> > +       return is_devmap;
> > +}
> > +
> >  #else /* CONFIG_DEV_PAGEMAP_OPS */
> >  static inline bool put_devmap_managed_page(struct page *page)
> >  {
> > diff --git a/mm/memremap.c b/mm/memremap.c
> > index 03ccbdfeb697..bc7e2a27d025 100644
> > --- a/mm/memremap.c
> > +++ b/mm/memremap.c
> > @@ -410,48 +410,39 @@ struct dev_pagemap *get_dev_pagemap(unsigned long=
 pfn,
> >  EXPORT_SYMBOL_GPL(get_dev_pagemap);
> >
> >  #ifdef CONFIG_DEV_PAGEMAP_OPS
> > -void __put_devmap_managed_page(struct page *page)
> > +void free_devmap_managed_page(struct page *page)
> >  {
> > -       int count =3D page_ref_dec_return(page);
> > +       /* Clear Active bit in case of parallel mark_page_accessed */
> > +       __ClearPageActive(page);
> > +       __ClearPageWaiters(page);
> > +
> > +       mem_cgroup_uncharge(page);
>
> Ugh, when did all this HMM specific manipulation sneak into the
> generic ZONE_DEVICE path? It used to be gated by pgmap type with its
> own put_zone_device_private_page(). For example it's certainly
> unnecessary and might be broken (would need to check) to call
> mem_cgroup_uncharge() on a DAX page. ZONE_DEVICE users are not a
> monolith and the HMM use case leaks pages into code paths that DAX
> explicitly avoids.

It's been this way for a while and I did not react previously,
apologies for that. I think __ClearPageActive, __ClearPageWaiters, and
mem_cgroup_uncharge, belong behind a device-private conditional. The
history here is:

Move some, but not all HMM specifics to hmm_devmem_free():
    2fa147bdbf67 mm, dev_pagemap: Do not clear ->mapping on final put

Remove the clearing of mapping since no upstream consumers needed it:
    b7a523109fb5 mm: don't clear ->mapping in hmm_devmem_free

Add it back in once an upstream consumer arrived:
    7ab0ad0e74f8 mm/hmm: fix ZONE_DEVICE anon page mapping reuse

We're now almost entirely free of ->page_free callbacks except for
that weird nouveau case, can that FIXME in nouveau_dmem_page_free()
also result in killing the ->page_free() callback altogether? In the
meantime I'm proposing a cleanup like this:

diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index ad8e4df1282b..4eae441f86c9 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -337,13 +337,7 @@ static void pmem_release_disk(void *__pmem)
        put_disk(pmem->disk);
 }

-static void pmem_pagemap_page_free(struct page *page)
-{
-       wake_up_var(&page->_refcount);
-}
-
 static const struct dev_pagemap_ops fsdax_pagemap_ops =3D {
-       .page_free              =3D pmem_pagemap_page_free,
        .kill                   =3D pmem_pagemap_kill,
        .cleanup                =3D pmem_pagemap_cleanup,
 };
diff --git a/mm/memremap.c b/mm/memremap.c
index 03ccbdfeb697..157edb8f7cf8 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -419,12 +419,6 @@ void __put_devmap_managed_page(struct page *page)
         * holds a reference on the page.
         */
        if (count =3D=3D 1) {
-               /* Clear Active bit in case of parallel mark_page_accessed =
*/
-               __ClearPageActive(page);
-               __ClearPageWaiters(page);
-
-               mem_cgroup_uncharge(page);
-
                /*
                 * When a device_private page is freed, the page->mapping f=
ield
                 * may still contain a (stale) mapping value. For example, =
the
@@ -446,10 +440,17 @@ void __put_devmap_managed_page(struct page *page)
                 * handled differently or not done at all, so there is no n=
eed
                 * to clear page->mapping.
                 */
-               if (is_device_private_page(page))
-                       page->mapping =3D NULL;
+               if (is_device_private_page(page)) {
+                       /* Clear Active bit in case of parallel
mark_page_accessed */
+                       __ClearPageActive(page);
+                       __ClearPageWaiters(page);

-               page->pgmap->ops->page_free(page);
+                       mem_cgroup_uncharge(page);
+
+                       page->mapping =3D NULL;
+                       page->pgmap->ops->page_free(page);
+               } else
+                       wake_up_var(&page->_refcount);
        } else if (!count)
                __put_page(page);
 }
