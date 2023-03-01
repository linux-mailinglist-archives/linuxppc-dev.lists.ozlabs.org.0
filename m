Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F9B6A687D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 08:58:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRRRq603Lz3cGm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 18:57:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HoExU3Yg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=42.hyeyoo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HoExU3Yg;
	dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRRQs0cvvz2yPD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 18:57:07 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 16so7191251pge.11
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 23:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=02i/96l+6ZpFW/jZZDtc8h7hh0YgTsgKHKNNUB9KLxs=;
        b=HoExU3YgBTtCAOk4N3KNsm5T7YL0gsxHB+lFf+mZSLfkrK85VG9LggoYxTRQ7rmz3C
         84wDtDndx7u6dPFMDzMci7J3dRlBhYLD8p7N4cxJltqr/l1/LoOkET1w1jfz44lRpmD+
         yjoxbqJkFS4i5IjCuDQNDys+LCXBL/2vc57zk4yN+L0lKbg8Ah9yDKskfZupSyh1loJC
         KsaYjBt85J5T8JGZBYCSpQuskGBG1DLDhC5oSOhkNwahpLjl8OaJOTjfMCzGUsSW9D71
         ZCflSag2e3UwHVjDC9ICqaiE+cYlCvCSRx09vaQVoWJazHBdCrB1RDzuiRfMPxmpmRKL
         GbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02i/96l+6ZpFW/jZZDtc8h7hh0YgTsgKHKNNUB9KLxs=;
        b=BeW901pWMPAftcyPtuQCBvVrH8Pny7GJqlCJ1V9g2vfcMBNdOlCY54BafpTPrYSiMD
         c/5ERi5pCbXrY8w8dDxY0OMoYgiNKomiyuF+7mX+jDz2QLOtDOOkP2MUgoMSBqnnIpzC
         XwOFpBL6hNk+VcQa3bYkLH1jDNQNkiOldg9glEr3w3KinZ6Kgesa+EAQf8CkKzfKkg03
         7Cctkqgegtw4KzPE+RH4TRYvAdH998US67X85b9QggIJ+u7ks8lNg0JEnCnAUeRUXaTq
         nHuLGNJq8FFytE0Dl8bzwtW0QQ2V3g8jw+x0xKBnuiq+BQSIObp02zVO8DSb4UfZ95SY
         v9zw==
X-Gm-Message-State: AO0yUKWCOrbN9V5nT0HwBsUa0pnyTWPDXwcezMieouSJuetVHbdsirr1
	N7ntvmy+XSb6rHzCKblq0XE=
X-Google-Smtp-Source: AK7set9latmKg0SRlfW2C2EjdWRe42leQ/wjfKxC33I4XmpzAO3T0+sqRBSfcTT2+0oY4xU3klbfEA==
X-Received: by 2002:a62:1dc6:0:b0:5e0:316a:39ce with SMTP id d189-20020a621dc6000000b005e0316a39cemr5569689pfd.27.1677657424046;
        Tue, 28 Feb 2023 23:57:04 -0800 (PST)
Received: from localhost ([2400:8902::f03c:93ff:fe27:642a])
        by smtp.gmail.com with ESMTPSA id bm17-20020a056a00321100b005a852875590sm7266765pfb.113.2023.02.28.23.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 23:56:51 -0800 (PST)
Date: Wed, 1 Mar 2023 07:56:36 +0000
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v4 18/33] mm: write-lock VMAs before removing them from
 VMA tree
Message-ID: <Y/8FNM9czzPHb5eG@localhost>
References: <20230227173632.3292573-1-surenb@google.com>
 <20230227173632.3292573-19-surenb@google.com>
 <Y/8CJQGNuMUTdLwP@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/8CJQGNuMUTdLwP@localhost>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundati
 on.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 01, 2023 at 07:43:33AM +0000, Hyeonggon Yoo wrote:
> On Mon, Feb 27, 2023 at 09:36:17AM -0800, Suren Baghdasaryan wrote:
> > Write-locking VMAs before isolating them ensures that page fault
> > handlers don't operate on isolated VMAs.
> > 
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  mm/mmap.c  | 1 +
> >  mm/nommu.c | 5 +++++
> >  2 files changed, 6 insertions(+)
> > 
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 1f42b9a52b9b..f7ed357056c4 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -2255,6 +2255,7 @@ int split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
> >  static inline int munmap_sidetree(struct vm_area_struct *vma,
> >  				   struct ma_state *mas_detach)
> >  {
> > +	vma_start_write(vma);
> >  	mas_set_range(mas_detach, vma->vm_start, vma->vm_end - 1);
> 
> I may be missing something, but have few questions:
> 
> 	1) Why does a writer need to both write-lock a VMA and mark the VMA detached
> 	   when unmapping it, isn't it enough to just only write-lock a VMA?
> 
> 	2) as VMAs that are going to be removed are already locked in vma_prepare(),
> 	   so I think this hunk could be dropped?

After sending this just realized that I did not consider simple munmap case :)
But I still think 1) and 3) are valid question.

> 
> >  	if (mas_store_gfp(mas_detach, vma, GFP_KERNEL))
> >  		return -ENOMEM;
> > diff --git a/mm/nommu.c b/mm/nommu.c
> > index 57ba243c6a37..2ab162d773e2 100644
> > --- a/mm/nommu.c
> > +++ b/mm/nommu.c
> > @@ -588,6 +588,7 @@ static int delete_vma_from_mm(struct vm_area_struct *vma)
> >  		       current->pid);
> >  		return -ENOMEM;
> >  	}
> > +	vma_start_write(vma);
> >  	cleanup_vma_from_mm(vma);
> 
> 	3) I think this hunk could be dropped as Per-VMA lock depends on MMU anyway.
> 
> Thanks,
> Hyeonggon
> 
> >  
> >  	/* remove from the MM's tree and list */
> > @@ -1519,6 +1520,10 @@ void exit_mmap(struct mm_struct *mm)
> >  	 */
> >  	mmap_write_lock(mm);
> >  	for_each_vma(vmi, vma) {
> > +		/*
> > +		 * No need to lock VMA because this is the only mm user and no
> > +		 * page fault handled can race with it.
> > +		 */
> >  		cleanup_vma_from_mm(vma);
> >  		delete_vma(mm, vma);
> >  		cond_resched();
> > -- 
> > 2.39.2.722.g9855ee24e9-goog
> > 
> > 
> 
