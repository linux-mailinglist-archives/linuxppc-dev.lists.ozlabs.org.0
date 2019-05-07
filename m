Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E32216CC0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 22:59:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zBmg0XQfzDqLc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 06:59:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::243; helo=mail-oi1-x243.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="qmbcluUn"; 
 dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zBlT6LwTzDqBr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 06:58:07 +1000 (AEST)
Received: by mail-oi1-x243.google.com with SMTP id l203so13490288oia.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2019 13:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1mkmD4Z4DaLqsFVMxyizn2ogd6gC2HtEG84lOnN4epw=;
 b=qmbcluUnRpOQqSYRBKyovFsqnRyKdZV6CKWDoAJpSXQgJX7TkK70etljQyZyVQQnWK
 c/TZ+swgI53npSGuu+2JE/6bhNbaKy50WoMbrLuYyKHZOgqRoVScpSt0AHUDQRiAcQzX
 oCyb7TNqVt24+RL0Vtf6NVC5n0CHu3+rUn0PpLS9pEtxDWSdjTEzY+2ThOkn98GdTmda
 WmIbbUjijC2Xp4qKF6wR2l25YLIsQ8YxWCiZOFzDQPqyWI7L+PornZQly/H7EWMuQpgU
 mqhMDZu6CDJUg4UY9KVxC9TDUrtrrctwMCXZWKSFyTMkz/OdmaK1KBlJJy5VFIuOBhbY
 bP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1mkmD4Z4DaLqsFVMxyizn2ogd6gC2HtEG84lOnN4epw=;
 b=o9hQpHC2X+koKgimi5uAv7+Ru0Wda3l6DIgcDUP9En/+KD2rjrlMELuU+US2ri+RZz
 iU02YYn22XaWaJx6BetqwWzloE5uSEaCzfHxRpUlZRsn/2NG3cl7ZJfKwAdKc1Uspl1a
 RxfPaQTrBm8DZdRGQXgMeQFSBx/MKho83sMCRLNsynikGY/HnQb5DpsekZdoOZ5L3Y6e
 iXqIcQylqQQpczpLZ1A2wK1F8BvwR9invyQylbtMdTNYvekXmmDN83SW2eJZsM/LiYDt
 5/DHkPHn+Xp8ZF90l4DpJMwRGzvTa453nIFcFFdDJFJHcSkqqHV4/agup6WtI19hakFS
 B3dA==
X-Gm-Message-State: APjAAAV3q+Z+JCDDxdWQ+J7U+xvP0LdPwkJyebnc4Uwz7WjVV7XyvVDV
 hzIJoaqZZIlVieL5sxUqkvEIfJYMImv7WgMbflen0Q==
X-Google-Smtp-Source: APXvYqzD5+iPmR82mW0JcgXC+OAUQI8mo10rE9WLLRa7cfVMYW4IBqbIoZo+d7Cn/arRPuEVXDJreevhDqywHe+Kspk=
X-Received: by 2002:aca:b108:: with SMTP id a8mr333966oif.0.1557262684029;
 Tue, 07 May 2019 13:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190507183804.5512-1-david@redhat.com>
 <20190507183804.5512-3-david@redhat.com>
 <CAPcyv4gtAMn2mDz0s1GRTJ52MeTK3jJYLQne6MiEx_ipPFUsmA@mail.gmail.com>
 <97a6a2ab-0e8b-d403-ca39-ffa4425e15a5@redhat.com>
In-Reply-To: <97a6a2ab-0e8b-d403-ca39-ffa4425e15a5@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 7 May 2019 13:57:53 -0700
Message-ID: <CAPcyv4hvpBo=6c6pFCoGiEf3xiPsjc8w2p4Y6_bW4PrzcN=Few@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] s390x/mm: Implement arch_remove_memory()
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Oscar Salvador <osalvador@suse.com>,
 linux-s390 <linux-s390@vger.kernel.org>, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Linux-sh <linux-sh@vger.kernel.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 7, 2019 at 1:47 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 07.05.19 22:46, Dan Williams wrote:
> > On Tue, May 7, 2019 at 11:38 AM David Hildenbrand <david@redhat.com> wrote:
> >>
> >> Will come in handy when wanting to handle errors after
> >> arch_add_memory().
> >>
> >> Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
> >> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> >> Cc: Andrew Morton <akpm@linux-foundation.org>
> >> Cc: Michal Hocko <mhocko@suse.com>
> >> Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
> >> Cc: David Hildenbrand <david@redhat.com>
> >> Cc: Vasily Gorbik <gor@linux.ibm.com>
> >> Cc: Oscar Salvador <osalvador@suse.com>
> >> Signed-off-by: David Hildenbrand <david@redhat.com>
> >> ---
> >>  arch/s390/mm/init.c | 13 +++++++------
> >>  1 file changed, 7 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> >> index 31b1071315d7..1e0cbae69f12 100644
> >> --- a/arch/s390/mm/init.c
> >> +++ b/arch/s390/mm/init.c
> >> @@ -237,12 +237,13 @@ int arch_add_memory(int nid, u64 start, u64 size,
> >>  void arch_remove_memory(int nid, u64 start, u64 size,
> >>                         struct vmem_altmap *altmap)
> >>  {
> >> -       /*
> >> -        * There is no hardware or firmware interface which could trigger a
> >> -        * hot memory remove on s390. So there is nothing that needs to be
> >> -        * implemented.
> >> -        */
> >> -       BUG();
> >> +       unsigned long start_pfn = start >> PAGE_SHIFT;
> >> +       unsigned long nr_pages = size >> PAGE_SHIFT;
> >> +       struct zone *zone;
> >> +
> >> +       zone = page_zone(pfn_to_page(start_pfn));
> >
> > Does s390 actually support passing in an altmap? If 'yes', I think it
> > also needs the vmem_altmap_offset() fixup like x86-64:
> >
> >         /* With altmap the first mapped page is offset from @start */
> >         if (altmap)
> >                 page += vmem_altmap_offset(altmap);
> >
> > ...but I suspect it does not support altmap since
> > arch/s390/mm/vmem.c::vmemmap_populate() does not arrange for 'struct
> > page' capacity to be allocated out of an altmap defined page pool.
> >
> > I think it would be enough to disallow any arch_add_memory() on s390
> > where @altmap is non-NULL. At least until s390 gains ZONE_DEVICE
> > support and can enable the pmem use case.
> >
>
> As far as I know, it doesn't yet, however I guess this could change once
> virtio-pmem is supported?

I would expect and request virtio-pmem remain a non-starter on s390
until s390 gains ZONE_DEVICE support. As it stands virtio-pmem is just
another flavor of the general pmem driver and the pmem driver
currently only exports ZONE_DEVICE pfns tagged by the PTE_DEVMAP
pte-flag and PFN_DEV+PFN_MAP pfn_t-flags.

A hamstrung version of DAX (CONFIG_FS_DAX_LIMITED) is enabled for the
s390/dcssblk driver, but that requires that the driver indicate this
limited use case via the PTE_SPECIAL pte-flag and PFN_SPECIAL
pfn_t-flag. I otherwise do not want to see CONFIG_FS_DAX_LIMITED
spread outside of the s390/dcssblk use case.
