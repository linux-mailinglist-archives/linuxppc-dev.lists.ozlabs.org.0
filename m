Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0134C6E789A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 13:28:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1dnT4b4Yz3g3s
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 21:27:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fBPSS93a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fBPSS93a;
	dkim-atps=neutral
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1HGV48jvz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 07:33:21 +1000 (AEST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-54ee0b73e08so478581047b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 14:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681853598; x=1684445598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZ+faik75720SnLDzvntxl1cmAaRHsLQ7oOmPoVPf3o=;
        b=fBPSS93aalbav0LUzUejRt2NjbHpBJmNsHVPRRbsF+jG5Nu8WjfWT+weSiXFGrkEbN
         Bl+EcMNC7lpcawm/MuwqggHfJmNk7zAK9haLpnJV08P367c5YohyB4lPm9ubYCuINJZG
         pmhBTFu6UKlSFmyU0QWGBEDpdg/7xojdmyIrq4CWcHgeoPLavovDZAMaCmQm5Tmi+PdF
         awAr9pJ9qRfL4qAoU/GIaaVF0Yb/A9oc1EXdyleFSucNiyAMBSWiFjcubi/Cl7MqSDQT
         LqfYl5LxNuy3TqKDTGZky+Cx6fyOI9+XqrTm2mW88NG+xvACaI/puCphU95FqO3MwFDd
         on2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681853598; x=1684445598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZ+faik75720SnLDzvntxl1cmAaRHsLQ7oOmPoVPf3o=;
        b=EapKyg9q7cHMgXXiH0HfwqjuCF/9oYRapfwe+lBxy6ZpOATHiQS1tk7XpQUX3bP5w6
         qFmN4wT/tcbE8Z/5EXYbGGErcKxS561Ka0ibvZkSn30JMJqOsipf+GFlh69abrdkkyha
         rR6/lGgI4XyCjidNRX1oLTIlkG/DGjam4bHEWI/mX0vuBFtYijAX4fpl6ZQWd8GfDras
         LFqBKsywwQTlFk79B85x8P5I75DQTw3EWhU818BTrqzy7S33qjjSgM5w15jjyqi0s+M7
         4i4hNGtenLFqEUhwGsrj0HHi2SM+t5ZI/Joa4H25DbfSxUEXzHJNPu6wI+w5wzqYG0ma
         AHrg==
X-Gm-Message-State: AAQBX9cO/oODrQVXyj7OBeR/XvKNoiIySHpINvas7MeBV8Tmv8BLb2ag
	nEA61BhMMMvp/H2bFj46yMLtWLN4DNFDNhuK/2Q=
X-Google-Smtp-Source: AKy350Zg9/w1pIq1h9Mfl98gkIvdjlXYVLE/yxlCrmuaudFEJKPjKGaCNnj1KVCOnrcLYZjlnD0Q2KC4cnvL5HhzBhY=
X-Received: by 2002:a81:8443:0:b0:54f:8af3:6488 with SMTP id
 u64-20020a818443000000b0054f8af36488mr1215032ywf.23.1681853598073; Tue, 18
 Apr 2023 14:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230417205048.15870-1-vishal.moola@gmail.com>
 <20230417205048.15870-2-vishal.moola@gmail.com> <da600570-51c7-8088-b46b-7524c9e66e5d@redhat.com>
In-Reply-To: <da600570-51c7-8088-b46b-7524c9e66e5d@redhat.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Tue, 18 Apr 2023 14:33:06 -0700
Message-ID: <CAOzc2pwpRhNoFbdzdzuvrqbZdf2OsrTvBGs40QCZJjA5fS_q1A@mail.gmail.com>
Subject: Re: [PATCH 01/33] s390: Use _pt_s390_gaddr for gmap address tracking
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 19 Apr 2023 20:57:19 +1000
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Matthew Wilcox <willy@infradead.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 18, 2023 at 8:45=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 17.04.23 22:50, Vishal Moola (Oracle) wrote:
> > s390 uses page->index to keep track of page tables for the guest addres=
s
> > space. In an attempt to consolidate the usage of page fields in s390,
> > replace _pt_pad_2 with _pt_s390_gaddr to replace page->index in gmap.
> >
> > This will help with the splitting of struct ptdesc from struct page, as
> > well as allow s390 to use _pt_frag_refcount for fragmented page table
> > tracking.
> >
> > Since page->_pt_s390_gaddr aliases with mapping, ensure its set to NULL
> > before freeing the pages as well.
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
>
> [...]
>
> > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > index 3fc9e680f174..2616d64c0e8c 100644
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -144,7 +144,7 @@ struct page {
> >               struct {        /* Page table pages */
> >                       unsigned long _pt_pad_1;        /* compound_head =
*/
> >                       pgtable_t pmd_huge_pte; /* protected by page->ptl=
 */
> > -                     unsigned long _pt_pad_2;        /* mapping */
> > +                     unsigned long _pt_s390_gaddr;   /* mapping */
> >                       union {
> >                               struct mm_struct *pt_mm; /* x86 pgds only=
 */
> >                               atomic_t pt_frag_refcount; /* powerpc */
>
> The confusing part is, that these gmap page tables are not ordinary
> process page tables that we would ordinarily place into this section
> here. That's why they are also not allocated/freed using the typical
> page table constructor/destructor ...

I initially thought the same, so I was quite confused when I saw
__gmap_segment_gaddr was using pmd_pgtable_page().

Although they are not ordinary process page tables, since we
eventually want to move them out of struct page, I think shifting them
to be in ptdescs, being a memory descriptor for page tables, makes
the most sense.

Another option is to leave pmd_pgtable_page() as is just for this case.
Or we can revert commit 7e25de77bc5ea which uses the function here
then figure out where these gmap pages table pages will go later.
