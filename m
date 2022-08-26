Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CAE5A298F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 16:32:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDj3s4hylz3bkx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 00:32:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WMNi4WTn;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Khvz3oZu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WMNi4WTn;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Khvz3oZu;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDj391Z9zz2yn3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Aug 2022 00:32:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661524336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rx2FKGUlOIaH18EmtIfbPwlvVef3uy1QGtBjrZhEA+U=;
	b=WMNi4WTnqTJoryQ3C43Oo5KDgDF6pXZ4hkJfQJmDsgWWtDQJ2+bLnSN59OvGu/AOLqkWRj
	cWGADUAw63W/Q6VgMZoljOvbeTfVvj/IE73moeuilIhwB6O0Jxl957r2vOnMjgDARUw5kN
	inGs3sxo/qKqdrOCy4mg51TF1V60bHY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661524337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rx2FKGUlOIaH18EmtIfbPwlvVef3uy1QGtBjrZhEA+U=;
	b=Khvz3oZugVENvtqKWNrgctNPv5xwDX1va4McQpJWRDw9UsJxrPTnQ3QYfbVtSoLoaaPOcD
	MQlfYZbvV5vAHfYux6xwFs9nWjryp1RQb1oIFXkLduTIRuX9y+C1H8C8dJdhWgmTFJjAcN
	+T+RAYmhB512wsT78E1QziW1lqKGZ2Y=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-675-WSC3pjVaP8240iPE4WyDUw-1; Fri, 26 Aug 2022 10:32:14 -0400
X-MC-Unique: WSC3pjVaP8240iPE4WyDUw-1
Received: by mail-qv1-f70.google.com with SMTP id ea4-20020ad458a4000000b0049682af0ca8so1076510qvb.21
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Aug 2022 07:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=rx2FKGUlOIaH18EmtIfbPwlvVef3uy1QGtBjrZhEA+U=;
        b=3l68vRcsqJgsmKww+nwhnsjHpoiISL41S2HqcCyISnEhjpb/71DXJ1GuMc4EHsLJkg
         BKflUjlF7dD3NAOdRG8/iU9eXWv7mYsforVzDFpIm00IhrnugDm/h2mdxJq7z4kHzDH7
         VUa69bDkItjQE+/9QO7JZ19i2G6/nvqjZxa2Z9T+IcMzJX7fuHvNUcFg7sM9qH2Pe5bU
         Tbyei4WLsamAAoF6M4lUV0kgCAu9wJgCj6ooSzg+xFNut+j6JTqaIFeccsQd7Oay6tjz
         OGQG2+cCI/bqnbOmcM01SrnOgVyStHGb0jW5rCjsVSUG1rdwXUXKd1K07ukObzaPkj2q
         3pEQ==
X-Gm-Message-State: ACgBeo19jHZR5738aAUz3HvxJYGjxSOkktHDm9+8ilyklsFI7WBp+OEm
	YiOqkUIjOmDQVYA53Okyd2jU89GUHk2JUy1j17QZPVghPBJetXh/nTTHjK7Uy0akBmpj2qbnmw/
	E6YWgE62tgKEjmZnQ/w+kozU9qQ==
X-Received: by 2002:a05:620a:1404:b0:6ba:c2c2:5eca with SMTP id d4-20020a05620a140400b006bac2c25ecamr6734937qkj.220.1661524333950;
        Fri, 26 Aug 2022 07:32:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5H2DPJrrTdbtaxbHHrpQykfjh2vpuVbPL5I2n1u2lNVZP8JaHXyWomoNuISyWTWhIM87OAtA==
X-Received: by 2002:a05:620a:1404:b0:6ba:c2c2:5eca with SMTP id d4-20020a05620a140400b006bac2c25ecamr6734907qkj.220.1661524333696;
        Fri, 26 Aug 2022 07:32:13 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id bj11-20020a05620a190b00b006a6ab259261sm1836181qkb.29.2022.08.26.07.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 07:32:12 -0700 (PDT)
Date: Fri, 26 Aug 2022 10:32:10 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 2/3] mm/migrate_device.c: Copy pte dirty bit to page
Message-ID: <YwjZamk4n/dz+Y/M@xz-m1.local>
References: <3b01af093515ce2960ac39bb16ff77473150d179.1661309831.git-series.apopple@nvidia.com>
 <ffbc824af5daa2c44b91c66834a341894fba4ce6.1661309831.git-series.apopple@nvidia.com>
 <YwZGHyYJiJ+CGLn2@xz-m1.local>
 <8735dkeyyg.fsf@nvdebian.thelocal>
 <YwgFRLn43+U/hxwt@xz-m1.local>
 <8735dj7qwb.fsf@nvdebian.thelocal>
MIME-Version: 1.0
In-Reply-To: <8735dj7qwb.fsf@nvdebian.thelocal>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Huang Ying <ying.huang@intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Hildenbrand <david@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Logan Gunthorpe <logang@deltatee.com>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, stable@vger.kernel.org, akpm@linux-foundation.org, huang ying <huang.ying.caritas@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 26, 2022 at 11:02:58AM +1000, Alistair Popple wrote:
> 
> Peter Xu <peterx@redhat.com> writes:
> 
> > On Fri, Aug 26, 2022 at 08:21:44AM +1000, Alistair Popple wrote:
> >>
> >> Peter Xu <peterx@redhat.com> writes:
> >>
> >> > On Wed, Aug 24, 2022 at 01:03:38PM +1000, Alistair Popple wrote:
> >> >> migrate_vma_setup() has a fast path in migrate_vma_collect_pmd() that
> >> >> installs migration entries directly if it can lock the migrating page.
> >> >> When removing a dirty pte the dirty bit is supposed to be carried over
> >> >> to the underlying page to prevent it being lost.
> >> >>
> >> >> Currently migrate_vma_*() can only be used for private anonymous
> >> >> mappings. That means loss of the dirty bit usually doesn't result in
> >> >> data loss because these pages are typically not file-backed. However
> >> >> pages may be backed by swap storage which can result in data loss if an
> >> >> attempt is made to migrate a dirty page that doesn't yet have the
> >> >> PageDirty flag set.
> >> >>
> >> >> In this case migration will fail due to unexpected references but the
> >> >> dirty pte bit will be lost. If the page is subsequently reclaimed data
> >> >> won't be written back to swap storage as it is considered uptodate,
> >> >> resulting in data loss if the page is subsequently accessed.
> >> >>
> >> >> Prevent this by copying the dirty bit to the page when removing the pte
> >> >> to match what try_to_migrate_one() does.
> >> >>
> >> >> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> >> >> Acked-by: Peter Xu <peterx@redhat.com>
> >> >> Reported-by: Huang Ying <ying.huang@intel.com>
> >> >> Fixes: 8c3328f1f36a ("mm/migrate: migrate_vma() unmap page from vma while collecting pages")
> >> >> Cc: stable@vger.kernel.org
> >> >>
> >> >> ---
> >> >>
> >> >> Changes for v3:
> >> >>
> >> >>  - Defer TLB flushing
> >> >>  - Split a TLB flushing fix into a separate change.
> >> >>
> >> >> Changes for v2:
> >> >>
> >> >>  - Fixed up Reported-by tag.
> >> >>  - Added Peter's Acked-by.
> >> >>  - Atomically read and clear the pte to prevent the dirty bit getting
> >> >>    set after reading it.
> >> >>  - Added fixes tag
> >> >> ---
> >> >>  mm/migrate_device.c |  9 +++++++--
> >> >>  1 file changed, 7 insertions(+), 2 deletions(-)
> >> >>
> >> >> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> >> >> index 6a5ef9f..51d9afa 100644
> >> >> --- a/mm/migrate_device.c
> >> >> +++ b/mm/migrate_device.c
> >> >> @@ -7,6 +7,7 @@
> >> >>  #include <linux/export.h>
> >> >>  #include <linux/memremap.h>
> >> >>  #include <linux/migrate.h>
> >> >> +#include <linux/mm.h>
> >> >>  #include <linux/mm_inline.h>
> >> >>  #include <linux/mmu_notifier.h>
> >> >>  #include <linux/oom.h>
> >> >> @@ -196,7 +197,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >> >>  			anon_exclusive = PageAnon(page) && PageAnonExclusive(page);
> >> >>  			if (anon_exclusive) {
> >> >>  				flush_cache_page(vma, addr, pte_pfn(*ptep));
> >> >> -				ptep_clear_flush(vma, addr, ptep);
> >> >> +				pte = ptep_clear_flush(vma, addr, ptep);
> >> >>
> >> >>  				if (page_try_share_anon_rmap(page)) {
> >> >>  					set_pte_at(mm, addr, ptep, pte);
> >> >> @@ -206,11 +207,15 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >> >>  					goto next;
> >> >>  				}
> >> >>  			} else {
> >> >> -				ptep_get_and_clear(mm, addr, ptep);
> >> >> +				pte = ptep_get_and_clear(mm, addr, ptep);
> >> >>  			}
> >> >
> >> > I remember that in v2 both flush_cache_page() and ptep_get_and_clear() are
> >> > moved above the condition check so they're called unconditionally.  Could
> >> > you explain the rational on why it's changed back (since I think v2 was the
> >> > correct approach)?
> >>
> >> Mainly because I agree with your original comments, that it would be
> >> better to keep the batching of TLB flushing if possible. After the
> >> discussion I don't think there is any issues with HW pte dirty bits
> >> here. There are already other cases where HW needs to get that right
> >> anyway (eg. zap_pte_range).
> >
> > Yes tlb batching was kept, thanks for doing that way.  Though if only apply
> > patch 1 we'll have both ptep_clear_flush() and batched flush which seems to
> > be redundant.
> >
> >>
> >> > The other question is if we want to split the patch, would it be better to
> >> > move the tlb changes to patch 1, and leave the dirty bit fix in patch 2?
> >>
> >> Isn't that already the case? Patch 1 moves the TLB flush before the PTL
> >> as suggested, patch 2 atomically copies the dirty bit without changing
> >> any TLB flushing.
> >
> > IMHO it's cleaner to have patch 1 fix batch flush, replace
> > ptep_clear_flush() with ptep_get_and_clear() and update pte properly.
> 
> Which ptep_clear_flush() are you referring to? This one?
> 
> 			if (anon_exclusive) {
> 				flush_cache_page(vma, addr, pte_pfn(*ptep));
> 				ptep_clear_flush(vma, addr, ptep);

Correct.

> 
> My understanding is that we need to do a flush for anon_exclusive.

To me anon exclusive only shows this mm exclusively owns this page. I
didn't quickly figure out why that requires different handling on tlb
flushs.  Did I perhaps miss something?

Thanks,

-- 
Peter Xu

