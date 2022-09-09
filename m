Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7375B2AF0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 02:16:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNxP14KZsz3c46
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 10:16:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oBDufWXf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oBDufWXf;
	dkim-atps=neutral
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNxNL5tnXz2xJJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 10:15:45 +1000 (AEST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3454e58fe53so2121707b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Sep 2022 17:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=hqY5A7Q3sRIg+0suDoUYAY9ycBZxq0iP/o3p4lTPQtw=;
        b=oBDufWXfW+Av/lwxqv0a/EmqwgX3S9/bXbt6VPEO7NL873V6R8oQZDcLwtycRTOpXd
         ETEjULXGw4a08PRJMrQ0Nm5rozdANb4QWO+80W8Mflqxsz2iKlb84+RJB/TmEhy3p43o
         p4R41uJlGA49hCYO16U/nbK5AfKp/LocXCNl5xvBp0ILImSEpasSy1IvxO6+UJaGSIcl
         YLsP7TlWAHeAYCI4A+RRC+n1yvSdbLnsaNWmEhuIXbEMmMGUmPmSZZTRN+8g19QX4YyS
         aYOqOsPfivibr4WSH7pE+0/NSWF4MCgHB5gjaRwq/g7jkpOCAn94Vsh+Zd8qJFI5KMqh
         TLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=hqY5A7Q3sRIg+0suDoUYAY9ycBZxq0iP/o3p4lTPQtw=;
        b=d0B0JUEqq+q7MBiwM37iGh9IPjT4cTzWP6/x48GITyzpcFGkXYYLPoaLY6bnJST0wt
         w6/zYE7MW0FQnxc86JRkpH+jCjB/8UxJW2zHONnP+NMN78gnAfJRA63/1dHnH3w4fzXK
         6RS+2AaYMqCsP4QxbTeEy7Fz76ePN/RXKSSOd2Vhrp1v4IQ3rbBuNo3SlvDFDrg3BwXx
         6hBEMumtHlvQTY50PL4aurYK0RMoLQmeOKd50ZpulaTw1KwT8rcxtwjdA8Oz7628lVJC
         OS2qMMOgdATeEKZB9LVrOuiwTaAgEBQ4kJei1DNkrMGFjxvt0JTWIVXPfvhGOZamusxD
         nvWw==
X-Gm-Message-State: ACgBeo0e1vUbODciyuDRMRYFZSB4wZfN3v4E46gXRqvU6KF5dxlzu9nj
	OsgLpQ5T872ESl+HL3hgV3zNjlBgI+nqn4K4tjC88g==
X-Google-Smtp-Source: AA6agR62K1l39S/fz8ik5C68GuNknlfDBZR1zBzGcquAcYVnBiWDcbx92wi2JBC2nOolf2zZJxL60pxpYTaDIxhQc9o=
X-Received: by 2002:a81:a002:0:b0:345:55c5:9c6e with SMTP id
 x2-20020a81a002000000b0034555c59c6emr9844670ywg.218.1662682542238; Thu, 08
 Sep 2022 17:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901173516.702122-9-surenb@google.com>
 <dcefc6dd-f8eb-945e-37ab-3c0c4e4e20f2@linux.ibm.com>
In-Reply-To: <dcefc6dd-f8eb-945e-37ab-3c0c4e4e20f2@linux.ibm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 8 Sep 2022 17:15:31 -0700
Message-ID: <CAJuCfpHSVS1O=V5+gjm8bboG0FJzZtxo1UYrjoU0+r57o-4zYg@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 08/28] mm/khugepaged: mark VMA as locked while
 collapsing a hugepage
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

On Tue, Sep 6, 2022 at 7:43 AM Laurent Dufour <ldufour@linux.ibm.com> wrote=
:
>
> Le 01/09/2022 =C3=A0 19:34, Suren Baghdasaryan a =C3=A9crit :
> > Protect VMA from concurrent page fault handler while modifying it in
> > collapse_huge_page.
>
> Is the goal to protect changes in the anon_vma structure?
>
> AFAICS, the vma it self is not impacted here, only the anon_vma and the
> PMD/PTE are touched, and they have their own protection mechanism, isn't =
it?

Yes, I think you are right about not needing to lock VMA here as all
modified components are already protected. Thanks!

>
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  mm/khugepaged.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 01f71786d530..030680633989 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -1072,6 +1072,7 @@ static void collapse_huge_page(struct mm_struct *=
mm,
> >       if (mm_find_pmd(mm, address) !=3D pmd)
> >               goto out_up_write;
> >
> > +     vma_mark_locked(vma);
> >       anon_vma_lock_write(vma->anon_vma);
> >
> >       mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, NULL, mm,
>
