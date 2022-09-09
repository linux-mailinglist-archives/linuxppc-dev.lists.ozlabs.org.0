Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A185B3CF0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 18:25:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPLvk6Qnfz3c1M
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 02:25:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=c1ixqNT2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=c1ixqNT2;
	dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPLv772lrz30hw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 02:25:22 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id 202so3396100ybe.13
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Sep 2022 09:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=miU+viOw7qa7tyRJ4Or3oAz5OewEcwcrhnBCcmhlJME=;
        b=c1ixqNT2Wb/tj4p47082iOqXbPydTfDCRlcpOnTU4AJzbxK8Qtae/w4e4czAPV2SvK
         +6I+nnYA53fBK6dM4Z6T8Op2DAgoc7La8FTLRFbE7tahS+Jj+v+fPRn8bWYANC7cJSnc
         zwuMzJHWo/9ii2BElyg3HNv9L1YrpNYTz83RkonKXvvQXpUPIus8IRdbxcgyFHbI85xm
         HyIl5BlEIVYQx6rYt2HrwVLsTpmF8TMDAB20Am6za25Qy6nd0QH1gO+PAHsqFkWSRj4W
         gu83JTU963AgC40cDTWMymlAVMPH/3Y8qL+wvX3QxdPBwiUUSdUBphZcJwpnM0F/1CWs
         nSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=miU+viOw7qa7tyRJ4Or3oAz5OewEcwcrhnBCcmhlJME=;
        b=gzoD5p+RJacDxdD0vDfuzx13zTCFjaDsEqyLGzpMAO+yEcOhNM5NQcxxZyxOEMpcbe
         M/7/vF57/dKxxYopccsvEVEj4HvBs0Vji04eQUiulE7H5LOMR0EOpI5cNN+uH1D08BmI
         swE8MNDWjOqtFFOaBwEQCNSRVhEGTWwAokz6LZA2b0QqoN4MTdemQKHhz5YYs8ni3Hpk
         8ikp/Y4kgV1E54vrGVNbR5pAJDL5Vi+E/L4NEAsYJxfpbwo8woO4F1ORJPblah28jsjt
         K0UxXtlA7f+8tjBUM0q8PZDpEbmfOo7sRrJk4pof4vCereeUnN4PqVlluY4X1/V7oc5t
         C+GQ==
X-Gm-Message-State: ACgBeo1AIe3YKzzRej0ORSxcN1j9nkPIdJaoAK0mBeWTlVP4fUgcNN2t
	Fa6svK4D8s944wKVSCAKNlnMg43mI9O1Dt/ibbsLXA==
X-Google-Smtp-Source: AA6agR57llNlr+vc/ZVT6e21cf6KHtYpIX6piWQlP7J6Ta4z5TBzfSbQtMPHvfFUwcQ/ozpxKb9IwDD+Gqf8hXDfIC4=
X-Received: by 2002:a25:424a:0:b0:6a9:2954:87fd with SMTP id
 p71-20020a25424a000000b006a9295487fdmr12134434yba.340.1662740719262; Fri, 09
 Sep 2022 09:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901173516.702122-16-surenb@google.com>
 <83a36761-2045-3f46-3088-a751c5263b81@linux.ibm.com>
In-Reply-To: <83a36761-2045-3f46-3088-a751c5263b81@linux.ibm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 9 Sep 2022 09:25:08 -0700
Message-ID: <CAJuCfpHoGFv=mRfjsXpFn6Ykwc_SubfL1333Cz-HHYaoiD_73w@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 15/28] mm/mmap: mark adjacent VMAs as locked if
 they can grow into unmapped area
To: Laurent Dufour <ldufour@linux.ibm.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 9, 2022 at 6:43 AM Laurent Dufour <ldufour@linux.ibm.com> wrote=
:
>
> Le 01/09/2022 =C3=A0 19:35, Suren Baghdasaryan a =C3=A9crit :
> > While unmapping VMAs, adjacent VMAs might be able to grow into the area
> > being unmapped. In such cases mark adjacent VMAs as locked to prevent
> > this growth.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  mm/mmap.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index b0d78bdc0de0..b31cc97c2803 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -2680,10 +2680,14 @@ detach_vmas_to_be_unmapped(struct mm_struct *mm=
, struct vm_area_struct *vma,
> >        * VM_GROWSUP VMA. Such VMAs can change their size under
> >        * down_read(mmap_lock) and collide with the VMA we are about to =
unmap.
> >        */
> > -     if (vma && (vma->vm_flags & VM_GROWSDOWN))
> > +     if (vma && (vma->vm_flags & VM_GROWSDOWN)) {
> > +             vma_mark_locked(vma);
> >               return false;
> > -     if (prev && (prev->vm_flags & VM_GROWSUP))
> > +     }
> > +     if (prev && (prev->vm_flags & VM_GROWSUP)) {
> > +             vma_mark_locked(prev);
> >               return false;
> > +     }
> >       return true;
> >  }
> >
>
> That looks right to be.
>
> But, in addition to that, like the previous patch, all the VMAs to be
> detached from the tree in the loop above, should be marked locked just
> before calling vm_rb_erase().

The following call chain already locks the VMA being isolated:
vma_rb_erase->vma_rb_erase_ignore->__vma_rb_erase->vma_mark_locked
