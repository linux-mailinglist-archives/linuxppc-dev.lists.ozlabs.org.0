Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC86B71F413
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 22:44:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXJ5h3Hdpz3dws
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 06:44:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=qLgbJbj5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=qLgbJbj5;
	dkim-atps=neutral
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXJ4m55xyz3cj7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 06:43:34 +1000 (AEST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-565ba53f434so13144547b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 13:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685652211; x=1688244211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1D8lVOaAVBWbT9t2RmOD+26281abLHxtrNSt32Ap24=;
        b=qLgbJbj5g8WGk9vr+h5GU3VAGYoZuUQfYy+Jk03a6BWdaBQStekzq99EEhSRb/apVE
         r1wG5klq4xTuvlp4fzfvGwGvXsPOH5Z+EGzZ3xDm5VuokYBfnX2Z7EeXpvrNqoMOmFfA
         JBLO6CGLz8pEI44d71tWawLxUIyiVrcZLnzOInnX4NDx0adjPFt4WqdjoFpvwTeJeP42
         YdR8VtfFc5+TjUwWFHzsShyWmg/NGqDFZTc1nDT9EKaeGOrhYp9pTMhkn6c++xEXcw0Z
         7/JenW6z+3FLVb69Ur5a6g5NHDXYEBFsl6KltuWvHl5pgiI7Ar5zj9KICtB4zwOfTiPP
         PMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685652211; x=1688244211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1D8lVOaAVBWbT9t2RmOD+26281abLHxtrNSt32Ap24=;
        b=mCwDWA1C4fd0TBTsUyYjGZMhuybHqOTWalOj5VLuJQbPJOmlZF/xZSiH3kVIQydj7S
         re9m5vjSvddYUIkMxGF2cVTHm6rEa90yGzAFE1IUMILkk6ksavv1kjmfW46vzKgyLT0Y
         f8s1kRI5krHu/JU+25foNbVE6+edZtcJllypcYvG2585aLNUioyrd6oemzXto3zitoHR
         iMcNpPwfA5Zlti/wVa5kjHEwsfruwMdqXTY4OSRIrFK1h8ggIHzKl8wOaSuQoTL75bhP
         3dedzShVY6dIb8uAOZXDzBYwe6Tv0zVW26UFiNrnz0+HieT4w+M1EdaccS3likL/WzfJ
         /RSw==
X-Gm-Message-State: AC+VfDzekiw8MzrbW0RReg1W5A3AxZwZ2VRYkl+80cKwmvSRStfc1fz8
	PWpI7YYW8MsAH9gapUaY9AvhzIYTCHS0YRTj+Z4=
X-Google-Smtp-Source: ACHHUZ5DfuhGus+PqmBDfDw3I8CUwiopOPmtEZnOXp6mFa4otjE0OnORW5aklQp2qVjtyKAx2ImFFxSDC1ok71Q6xew=
X-Received: by 2002:a0d:e84b:0:b0:565:f045:18c3 with SMTP id
 r72-20020a0de84b000000b00565f04518c3mr10614817ywe.20.1685652211220; Thu, 01
 Jun 2023 13:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230531213032.25338-1-vishal.moola@gmail.com>
 <20230531213032.25338-4-vishal.moola@gmail.com> <20230601151900.6f184e8c@thinkpad-T15>
In-Reply-To: <20230601151900.6f184e8c@thinkpad-T15>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 1 Jun 2023 13:43:20 -0700
Message-ID: <CAOzc2pyjLh_GV1PL7CPkkPGcASHULhir_rJgB+UhwzPgQZD8Bw@mail.gmail.com>
Subject: Re: [PATCH v3 03/34] s390: Use pt_frag_refcount for pagetables
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
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
Cc: kvm@vger.kernel.org, linux-sh@vger.kernel.org, linux-openrisc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, xen-devel@lists.xenproject.org, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 1, 2023 at 6:19=E2=80=AFAM Gerald Schaefer
<gerald.schaefer@linux.ibm.com> wrote:
>
>  On Wed, 31 May 2023 14:30:01 -0700
> "Vishal Moola (Oracle)" <vishal.moola@gmail.com> wrote:
>
> > s390 currently uses _refcount to identify fragmented page tables.
> > The page table struct already has a member pt_frag_refcount used by
> > powerpc, so have s390 use that instead of the _refcount field as well.
> > This improves the safety for _refcount and the page table tracking.
> >
> > This also allows us to simplify the tracking since we can once again us=
e
> > the lower byte of pt_frag_refcount instead of the upper byte of _refcou=
nt.
>
> This would conflict with s390 impact of pte_free_defer() work from Hugh D=
ickins
> https://lore.kernel.org/lkml/35e983f5-7ed3-b310-d949-9ae8b130cdab@google.=
com/
> https://lore.kernel.org/lkml/6dd63b39-e71f-2e8b-7e0-83e02f3bcb39@google.c=
om/
>
> There he uses pt_frag_refcount, or rather pt_mm in the same union, to sav=
e
> the mm_struct for deferred pte_free().
>
> I still need to look closer into both of your patch series, but so far it
> seems that you have no hard functional requirement to switch from _refcou=
nt
> to pt_frag_refcount here, for s390.
>
> If this is correct, and you do not e.g. need this to make some other use
> of _refcount, I would suggest to drop this patch.

The goal of this preparation patch is to consolidate s390's usage of
struct page fields so that struct ptdesc can be smaller. Its not particular=
ly
mandatory; leaving _refcount in ptdesc only increases the struct by
8 bytes and can always be changed later.

However it is a little annoying since s390 is the only architecture
that egregiously uses space throughout struct page for their page
tables, rather than just the page table struct. For example, s390
gmap uses page->index which also aliases with pt_mm and
pt_frag_refcount. I'm not sure if/how gmap page tables interact
with s390 process page tables at all, but if it does that could
potentially cause problems with Hugh's patch as well :(

I can add _refcount to ptdesc if we would like, but I still
prefer if s390 could be simplified instead.
