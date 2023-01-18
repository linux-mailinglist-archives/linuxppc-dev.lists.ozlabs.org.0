Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E931767264B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 19:07:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nxtyg5MMkz3fC0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 05:07:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JiA4PBg0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JiA4PBg0;
	dkim-atps=neutral
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxtxl5MRjz2xHJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 05:06:51 +1100 (AEDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-4d13cb4bbffso359358017b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 10:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DP2jTh2XCGgairHOGKy1hg7eoz80OguUV+dRLV5vdAs=;
        b=JiA4PBg0EH7+0/76J3FenR1bnlSGaQgdYOG4b+AglPSOYgfmCcBfM2ErnvDHL4NFM3
         xzqZTQIqEjQ7PPX+1LzBhtUDNEk3yB9vFIDmaQSEgWuFp+80LEAWhkoKhNjeIyguxfi9
         IcVLilDvjfgehE8DgUarM2edSxsBEPquLtlfDaMXkql9MVVejNVEQ1MrjYhWtOtK9eyN
         NSxlm5igyPDlNkDxm+4IwWYaT5nE1kzWmkwzXV4INsZk1EToceOcNYpFDzz/xRE0hSNF
         M6yMgEvu9cHqWkl44Z252S3wbtzdKexOyOHGlp1AVXAzplYZutMDn1Cqdg5ZcfOCxrOc
         +ReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DP2jTh2XCGgairHOGKy1hg7eoz80OguUV+dRLV5vdAs=;
        b=easvdVN1jP7rB956GF1fPIKFyDUi2JkvorASN/5d2i5PasHsAkvSZYBcV3HH3BfqSn
         Jy3PgsyyGhtZmIBqoIx5NTKZMLKe3oXrHYcC+7hx0noFWuPU1/SUQerwtfW1LpZX4twv
         ru8Ro0xRAObO5D6lg0zfnDxIicd/jLsFgmCO+/+ReCHq+cum6Nc932/5K4hHrGQ3RLvt
         1ilM2wOnTGBP9soySsrCG+bCEjdOLMC9Pa26yeAucLizgWycba+6U+fmjJ4VN5QHxRWG
         KnEOvPoRgzyMmlWMXzpTxHa4fE5qKVMK61MVlYEUkQciF76PFtzrgQvpyo4a1pJA83mg
         k+wA==
X-Gm-Message-State: AFqh2kqtzDfFRt8Aa7dEIo7BUZaGZ8u1Bw+W9M87n5vCEHQiaTcMpYeK
	1PPanoXWnsVhBpYvQoC28eflvuOBvt+7jAGkPnmrkw==
X-Google-Smtp-Source: AMrXdXsZwoic0rKFMDYo0tkFJ6J1kb0TvUIjw3JJelHbDs2OjFUo53z0pnyKmSUsdBlmQsDCtwccF60TcE0BtbKLEzo=
X-Received: by 2002:a0d:d484:0:b0:4dc:4113:f224 with SMTP id
 w126-20020a0dd484000000b004dc4113f224mr1111332ywd.455.1674065209076; Wed, 18
 Jan 2023 10:06:49 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-27-surenb@google.com>
 <Y8bB3TFLQV2HJZQ+@dhcp22.suse.cz> <CAJuCfpH8-wNiPXQcS=0j-Ex7iMqoBkUhjSN8QiAvq6FdXudRGQ@mail.gmail.com>
 <Y8e/N1m+YGFmxy+L@dhcp22.suse.cz>
In-Reply-To: <Y8e/N1m+YGFmxy+L@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Jan 2023 10:06:38 -0800
Message-ID: <CAJuCfpEcQZSJMoeNyeFb=0xxCFS=bWWz6K6QPkYKTc=4nLLDVw@mail.gmail.com>
Subject: Re: [PATCH 26/41] kernel/fork: assert no VMA readers during its destruction
To: Michal Hocko <mhocko@suse.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.ne
 t
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 18, 2023 at 1:43 AM 'Michal Hocko' via kernel-team
<kernel-team@android.com> wrote:
>
> On Tue 17-01-23 17:53:00, Suren Baghdasaryan wrote:
> > On Tue, Jan 17, 2023 at 7:42 AM 'Michal Hocko' via kernel-team
> > <kernel-team@android.com> wrote:
> > >
> > > On Mon 09-01-23 12:53:21, Suren Baghdasaryan wrote:
> > > > Assert there are no holders of VMA lock for reading when it is about to be
> > > > destroyed.
> > > >
> > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > ---
> > > >  include/linux/mm.h | 8 ++++++++
> > > >  kernel/fork.c      | 2 ++
> > > >  2 files changed, 10 insertions(+)
> > > >
> > > > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > > > index 594e835bad9c..c464fc8a514c 100644
> > > > --- a/include/linux/mm.h
> > > > +++ b/include/linux/mm.h
> > > > @@ -680,6 +680,13 @@ static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> > > >       VM_BUG_ON_VMA(vma->vm_lock_seq != READ_ONCE(vma->vm_mm->mm_lock_seq), vma);
> > > >  }
> > > >
> > > > +static inline void vma_assert_no_reader(struct vm_area_struct *vma)
> > > > +{
> > > > +     VM_BUG_ON_VMA(rwsem_is_locked(&vma->lock) &&
> > > > +                   vma->vm_lock_seq != READ_ONCE(vma->vm_mm->mm_lock_seq),
> > > > +                   vma);
> > >
> > > Do we really need to check for vm_lock_seq? rwsem_is_locked should tell
> > > us something is wrong on its own, no? This could be somebody racing with
> > > the vma destruction and using the write lock. Unlikely but I do not see
> > > why to narrow debugging scope.
> >
> > I wanted to ensure there are no page fault handlers (read-lockers)
> > when we are destroying the VMA and rwsem_is_locked(&vma->lock) alone
> > could trigger if someone is concurrently calling vma_write_lock(). But
> > I don't think we expect someone to be write-locking the VMA while we
>
> That would be UAF, no?

Yes. That's why what I have is an overkill (which is also racy).

>
> > are destroying it, so you are right, I'm overcomplicating things here.
> > I think I can get rid of vma_assert_no_reader() and add
> > VM_BUG_ON_VMA(rwsem_is_locked(&vma->lock)) directly in
> > __vm_area_free(). WDYT?
>
> Yes, that adds some debugging. Not sure it is really necessary buyt it
> is VM_BUG_ON so why not.

I would like to keep it if possible. If it triggers that would be a
clear signal what the issue is. Otherwise it might be hard to debug
such a corner case.

> --
> Michal Hocko
> SUSE Labs
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
