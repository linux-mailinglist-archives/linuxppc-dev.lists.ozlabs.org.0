Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6985AA3AA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 01:22:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJcXB0lVvz303t
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 09:22:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=k1eQ5hiU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=k1eQ5hiU;
	dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJcWY3NCJz2xJB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 09:22:01 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id p204so938674yba.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 16:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=TioOqS04vLMS9dH6wDVg3ppqoyZpw4Z0vjZr4LO/zFY=;
        b=k1eQ5hiUMMNou7qBsVIMH8lkkFwkk+vgtWYh7f5ywTcVo9hlj63v9Ohlnl7I4aVQn2
         GKNc7kz9DNkTzlzJbs7rNIACNJQpgSFtXp8ekBVwDboxc58Q20On8g/7Ml1oAOUn3Ce3
         IJSbUJRUZjtXcBEog461xSrYM2HF3AP0QXjTmMrynLxxaUM0Lx3J39/DOYaC4rORcZFC
         Ml9yPqd6Al8pgH5yjdE3x7J31KSa7Vqb3x9q5k1HdwNRFhURAjgmW5h3DEC9e1sDnxzz
         uX3CPfe0M1qBUQSu4yJNm4/ICa2gO5smYoiREDCRbhjpvjuH1N0756ewgER3fFa+YmzK
         VKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=TioOqS04vLMS9dH6wDVg3ppqoyZpw4Z0vjZr4LO/zFY=;
        b=MWN+NmOKRXa5o0arafDGT74iNQy6/x8ur4FEmGPWRtWg0ACLn60lFm1eBUMzsmBFvH
         Gh/Y9hAjPeeiDFZ4kOvkMU0fi95yM9JCRObqab/RFdlYVWDbDtIFRfg7+fYR+aCHfKH5
         /piJUwDIsDN0ViVBLY5f9pG1lvZOvkM6ONvAa9NcrkMdXgaWiqyC/FuFUeQIi1kxQwrn
         kpBHyoeCZge+obyUFuaAHcN7M7enTZkoqPEsS5Wj0EEMqOZDOTilXaRiwhlMDGmLSh81
         eKUsHz/n/iD32tdn5XIUWX4fwLinNS1XaMt0Si8DYe76yNUQpkDvUgQhs2/1vm9f8/eG
         z+Fw==
X-Gm-Message-State: ACgBeo0IQaGJ4q62D4Z4Ya+ERCghNETq/zQPq+sXsE+ogochdcls9cQN
	OZjFTyY3l5MyfLcfpBHaPGKoo7RGprFB3pKgMla/Og==
X-Google-Smtp-Source: AA6agR6y3U6pHOb5dcv1vqPpmeMeTXf4aKWp13NuMCnIdt+fRCs4NW7hjbDbEqzFwTS6U1UfXZMpdc29w/Hx7SeWCQk=
X-Received: by 2002:a05:6902:1366:b0:691:4335:455b with SMTP id
 bt6-20020a056902136600b006914335455bmr20426685ybb.282.1662074518009; Thu, 01
 Sep 2022 16:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901173516.702122-5-surenb@google.com>
 <20220901202409.e2fqegqghlijkzey@moria.home.lan> <20220901205144.66ilifzaxr5p4xi3@revolver>
In-Reply-To: <20220901205144.66ilifzaxr5p4xi3@revolver>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 1 Sep 2022 16:21:47 -0700
Message-ID: <CAJuCfpEJLNDOj6bANM+cX61c12Xw7O0XbhN9rqzkqYEa8PBBuA@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 04/28] mm: move mmap_lock assert function definitions
To: Liam Howlett <liam.howlett@oracle.com>
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
Cc: "michel@lespinasse.org" <michel@lespinasse.org>, "joelaf@google.com" <joelaf@google.com>, "songliubraving@fb.com" <songliubraving@fb.com>, "mhocko@suse.com" <mhocko@suse.com>, "david@redhat.com" <david@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>, "bigeasy@linutronix.de" <bigeasy@linutronix.de>, "peterx@redhat.com" <peterx@redhat.com>, "dhowells@redhat.com" <dhowells@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "jglisse@google.com" <jglisse@google.com>, "dave@stgolabs.net" <dave@stgolabs.net>, "minchan@google.com" <minchan@google.com>, "x86@kernel.org" <x86@kernel.org>, "hughd@google.com" <hughd@google.com>, "willy@infradead.org" <willy@infradead.org>, "laurent.dufour@fr.ibm.com" <laurent.dufour@fr.ibm.com>, "mgorman@suse.de" <mgorman@suse.de>, "rientjes@google.com" <rientjes@google.com>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "kernel-team@android.com" <kernel-team@android.com>, "paulmck@kernel.org" <paulmck@kernel.org>, "luto@kernel.org" 
 <luto@kernel.org>, "ldufour@linux.ibm.com" <ldufour@linux.ibm.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kent Overstreet <kent.overstreet@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 1, 2022 at 1:51 PM Liam Howlett <liam.howlett@oracle.com> wrote:
>
> * Kent Overstreet <kent.overstreet@linux.dev> [220901 16:24]:
> > On Thu, Sep 01, 2022 at 10:34:52AM -0700, Suren Baghdasaryan wrote:
> > > Move mmap_lock assert function definitions up so that they can be used
> > > by other mmap_lock routines.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > ---
> > >  include/linux/mmap_lock.h | 24 ++++++++++++------------
> > >  1 file changed, 12 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> > > index 96e113e23d04..e49ba91bb1f0 100644
> > > --- a/include/linux/mmap_lock.h
> > > +++ b/include/linux/mmap_lock.h
> > > @@ -60,6 +60,18 @@ static inline void __mmap_lock_trace_released(struct mm_struct *mm, bool write)
> > >
> > >  #endif /* CONFIG_TRACING */
> > >
> > > +static inline void mmap_assert_locked(struct mm_struct *mm)
> > > +{
> > > +   lockdep_assert_held(&mm->mmap_lock);
> > > +   VM_BUG_ON_MM(!rwsem_is_locked(&mm->mmap_lock), mm);
> >
> > These look redundant to me - maybe there's a reason the VM developers want both,
> > but I would drop the VM_BUG_ON() and just keep the lockdep_assert_held(), since
> > that's the standard way to write that assertion.
>
> I think this is because the VM_BUG_ON_MM() will give you a lot more
> information and BUG_ON().
>
> lockdep_assert_held() does not return a value and is a WARN_ON().
>
> So they are partially redundant.

Yeah and I do not intend to change the existing functionality in this
patchset. If needed we can post a separate patch removing the
redundancy but from my experience debugging this code, VM_BUG_ON_MM
reports were very useful.

>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
