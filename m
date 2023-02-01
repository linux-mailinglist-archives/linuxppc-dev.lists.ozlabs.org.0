Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7DC6865E0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 13:24:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6Lh93qYsz3f3j
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 23:24:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JFlcwhut;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=42.hyeyoo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JFlcwhut;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6LgB73JQz3bfm
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 23:23:32 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id t17so1177513pfj.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Feb 2023 04:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JEkiUTacxMxuQViA2zFVDrCybVhWswU79PAFJJV/w9g=;
        b=JFlcwhut2YxmzOnINTmfWPgykYOoLnNzxL7qoNOpca+oiLZu8x5995wnOMAxVO+Ros
         XgubNWP6I84WorhX/iUfTp0ZDNOaxcuFDzmMCuFrPtBkuuwag9xqEI4RqxxPsooCQ0FQ
         8ItpDZyF9Zv4u2C+Vf2/v7tnRbxkE0PXjCp8YbR7borkIjcoVXpNWrcJDiJDLyjgnV/h
         u+tsoufLduN4tVPPYx1Pb4csiCV27ywPKrB0bIF6biJifnwwzaBm16XfH7DpmZgLL3tX
         3uDLvtanpupnMFpJac9gBh/h5/dmuW1WAMrZpBHcqEuzjxkX8xL9mH5HpZhHq2X6gAz4
         07MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEkiUTacxMxuQViA2zFVDrCybVhWswU79PAFJJV/w9g=;
        b=M3H3lQEMtJJB918Dr9ux2pSkhy6VRBMJSgIlofYuHH6tnS+zslWyoNM05MGe6RwFcT
         B198DiQNW8chRK/JdHSRs32xXWqbb2I+bshslOZoGts600h0SZGoIaSDe7tANBOtoaBg
         1C9OZSeak7js0dLwyusCNUuXPosDdwBIDDyTLuq8s5LVBSodb94wCuiiPfPt8Xuo+b+/
         cxlhTVmEhcVVsNhKSia9YfrkXlKpivvVPcSa0v5me/LiFgLxSwQCxcnrCrFFWAOWEm/A
         1oD9B/uf9+0EKwFyPFVCZt266H0kkRyPPssyWKTF+5We9JDyylRfThVyhjiurs9gxSz4
         cX1Q==
X-Gm-Message-State: AO0yUKXr6s0gOJngrDisGnQq5LtZqzeL7Pqa+hrdxQgVcB+QHniSQsyc
	oeYzMh0U+a+10i26MFAudSU=
X-Google-Smtp-Source: AK7set+GpUrYJx7Y0L584QZ8mHnSLMQmzHWvHob6Mlx6VGj4q3DTD2lRBF5v76Gk3l8+0GlLwkWQow==
X-Received: by 2002:a05:6a00:1392:b0:593:91e4:99e2 with SMTP id t18-20020a056a00139200b0059391e499e2mr2628027pfg.34.1675254210775;
        Wed, 01 Feb 2023 04:23:30 -0800 (PST)
Received: from hyeyoo ([114.29.91.56])
        by smtp.gmail.com with ESMTPSA id y40-20020a056a001ca800b0058dbb5c5038sm243351pfw.182.2023.02.01.04.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 04:23:29 -0800 (PST)
Date: Wed, 1 Feb 2023 21:23:16 +0900
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v4 4/7] mm: replace vma->vm_flags direct modifications
 with modifier calls
Message-ID: <Y9pZtC+IEjVQO6fh@hyeyoo>
References: <20230126193752.297968-1-surenb@google.com>
 <20230126193752.297968-5-surenb@google.com>
 <Y9jSFFeHYZE1/yFg@hyeyoo>
 <CAJuCfpEzaVkgQt=C-33jAh1vLVJAjoyM8X5AD9CzyDUJnPDCkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpEzaVkgQt=C-33jAh1vLVJAjoyM8X5AD9CzyDUJnPDCkw@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, Sebastian Reichel <sebastian.reichel@collabora.com>, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundat
 ion.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 31, 2023 at 10:54:22AM -0800, Suren Baghdasaryan wrote:
> On Tue, Jan 31, 2023 at 12:32 AM Hyeonggon Yoo <42.hyeyoo@gmail.com> wrote:
> >
> > On Thu, Jan 26, 2023 at 11:37:49AM -0800, Suren Baghdasaryan wrote:
> > > Replace direct modifications to vma->vm_flags with calls to modifier
> > > functions to be able to track flag changes and to keep vma locking
> > > correctness.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > Acked-by: Michal Hocko <mhocko@suse.com>
> > > Acked-by: Mel Gorman <mgorman@techsingularity.net>
> > > Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > > Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > ---
> > >  arch/arm/kernel/process.c                          |  2 +-
> > >  120 files changed, 188 insertions(+), 199 deletions(-)
> > >
> >
> > Hello Suren,
> 
> Hi Hyeonggon,
> 
> >
> > [...]
> >
> > Whoa, it's so long.
> > Mostly looks fine but two things I'm not sure about:
> >
> > > diff --git a/drivers/misc/open-dice.c b/drivers/misc/open-dice.c
> > > index 9dda47b3fd70..7be4e6c9f120 100644
> > > --- a/drivers/misc/open-dice.c
> > > +++ b/drivers/misc/open-dice.c
> > > @@ -95,12 +95,12 @@ static int open_dice_mmap(struct file *filp, struct vm_area_struct *vma)
> > >               if (vma->vm_flags & VM_WRITE)
> > >                       return -EPERM;
> > >               /* Ensure userspace cannot acquire VM_WRITE later. */
> > > -             vma->vm_flags &= ~VM_MAYWRITE;
> > > +             vm_flags_clear(vma, VM_MAYSHARE);
> > >       }
> >
> > I think it should be:
> >         s/VM_MAYSHARE/VM_MAYWRITE/
> 
> Good eye! Yes, this is definitely a bug. Will post a next version with this fix.
> 
> >
> > > diff --git a/mm/mlock.c b/mm/mlock.c
> > > index 5c4fff93cd6b..ed49459e343e 100644
> > > --- a/mm/mlock.c
> > > +++ b/mm/mlock.c
> > > @@ -380,7 +380,7 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
> > >        */
> > >       if (newflags & VM_LOCKED)
> > >               newflags |= VM_IO;
> > > -     WRITE_ONCE(vma->vm_flags, newflags);
> > > +     vm_flags_reset(vma, newflags);
> > >
> > >       lru_add_drain();
> > >       walk_page_range(vma->vm_mm, start, end, &mlock_walk_ops, NULL);
> > > @@ -388,7 +388,7 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
> > >
> > >       if (newflags & VM_IO) {
> > >               newflags &= ~VM_IO;
> > > -             WRITE_ONCE(vma->vm_flags, newflags);
> > > +             vm_flags_reset(vma, newflags);
> > >       }
> > >  }
> >
> > wondering the if the comment above is still true?
> >
> >         /*
> >          * There is a slight chance that concurrent page migration,
> >          * or page reclaim finding a page of this now-VM_LOCKED vma,
> >          * will call mlock_vma_folio() and raise page's mlock_count:
> >          * double counting, leaving the page unevictable indefinitely.
> >          * Communicate this danger to mlock_vma_folio() with VM_IO,
> >          * which is a VM_SPECIAL flag not allowed on VM_LOCKED vmas.
> >          * mmap_lock is held in write mode here, so this weird
> >          * combination should not be visible to other mmap_lock users;
> >          * but WRITE_ONCE so rmap walkers must see VM_IO if VM_LOCKED.
> >          */
> >
> > does ACCESS_PRIVATE() still guarentee that compiler cannot mysteriously
> > optimize writes like WRITE_ONCE()?
> 
> I don't see ACCESS_PRIVATE() providing the same guarantees as
> WRITE_ONCE(), therefore I think this also needs to be changed. I'll
> need to introduce something like vm_flags_reset_once() and use it
> here. vm_flags_reset_once() would do WRITE_ONCE() and otherwise would
> be identical to vm_flags_reset().
>
> I'll post a new version with the fixes later today.
>
> Thanks for the review!
> Suren.

Thanks for quick reply!

Andrew's fix and the new patch looks good to me.
with these two things addressed:

Reviewed-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>


Regards,
Hyeonggon
