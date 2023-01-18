Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0101672A8F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 22:34:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxzXr5pTrz3fDs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 08:34:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RAx0+izB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RAx0+izB;
	dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxzWv2szkz2ypJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 08:33:14 +1100 (AEDT)
Received: by mail-yb1-xb35.google.com with SMTP id c124so93153ybb.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 13:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rP4CDQ2rpOjfvUbagwjxVJ0xf2zruAnQYoFEPU2Sx3k=;
        b=RAx0+izBCRm2tPZzHrzNMeV6yl1INYuQtaInBJs+HEtFcs9ehbV3S57t4xI2FGTk+o
         Nm9+7LQuQzUFxnOvZC8XTpJcvBMXvxHgbvLSMwDNq6KfnZedW5E1uac49w7t6LTr2JyH
         za5erQrgnDyQhV4bXkLC5t7GA3lhS35zYsHEzZ6hD7VQ4zGiiG8DMoreMn8dGQSWx8tN
         LZwhO7xQgIjmuygrUt/h3Fz7Q19IjE0pPjnWpyUU+o0RAeR0mlrSp9HDF5JXpKsyPDiV
         /YVKORU/Rlqff/8XrR965fSIgplok91JlbkLjIlq7fqhvwA/DSwWlGpreXn6844JvC7p
         5KdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rP4CDQ2rpOjfvUbagwjxVJ0xf2zruAnQYoFEPU2Sx3k=;
        b=7aCmm/iSNWcekKFYmsh+xZg7bf6hQzvGx6IjetKFAOPihQT9sGvQ5XoRzqASZ2fi2Q
         A7jTZkvSN7xf81NXFKEE5t8d3NR3tb17c8LI3KNTVjM6XeDbx2rNCFlWe5uXqykh/GsR
         XHlJfWSGXFAQWxJvPkR98kkCwhCLcbyV8DeiRO50tXLb/dDOt7h9W3nZ0emnSeAYIpdl
         TjIyLNk4oSkGVAkulPBaS+Qc8CQ1DLkOam+WHLGeJO47b5UYOMsCNktGDt2fAJoYTm9Q
         2j/MaDqCQ/hb0drmN4Y6/73q2H2PWMikz7iN1BkvojZQEUwyN1fLaxYZKFuvBXH15hV9
         NyQA==
X-Gm-Message-State: AFqh2krPrUZFHpYgPz054CtwXDDXXYmeb46M4CmY1voRNNgnoUNbs6Ab
	G/HQWkSThnSxQqNxaOLYPHmD7wBuOCa6wFki3OiHvg==
X-Google-Smtp-Source: AMrXdXts0kmfZrhZ7FxbKkRKglCXXMtc+rHyBRTuF6TCj2lVfRNxrsSD1Xcm2xLH+Hr72eVJepI/lUb8MxAVQx4Rs4E=
X-Received: by 2002:a05:6902:11cd:b0:7d6:c4f6:b4ea with SMTP id
 n13-20020a05690211cd00b007d6c4f6b4eamr901759ybu.59.1674077591451; Wed, 18 Jan
 2023 13:33:11 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-29-surenb@google.com>
 <Y8bDAVC/aiL9tCyz@dhcp22.suse.cz> <CAJuCfpHRRsUMNHp2H3UiB4EZbe9CXTVcAC+oOR1dscENjp1Jbw@mail.gmail.com>
 <Y8ddI7vcKw8oecsr@casper.infradead.org>
In-Reply-To: <Y8ddI7vcKw8oecsr@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Jan 2023 13:33:00 -0800
Message-ID: <CAJuCfpGOmTO_HbCLZ1CytAGpbNgqe5PF2Q-G83T32H9hnmzGgA@mail.gmail.com>
Subject: Re: [PATCH 28/41] mm: introduce lock_vma_under_rcu to be used from
 arch-specific code
To: Matthew Wilcox <willy@infradead.org>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, Michal Hocko <mhocko@suse.com>, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsin
 gularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 6:44 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Jan 17, 2023 at 05:06:57PM -0800, Suren Baghdasaryan wrote:
> > On Tue, Jan 17, 2023 at 7:47 AM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Mon 09-01-23 12:53:23, Suren Baghdasaryan wrote:
> > > > Introduce lock_vma_under_rcu function to lookup and lock a VMA during
> > > > page fault handling. When VMA is not found, can't be locked or changes
> > > > after being locked, the function returns NULL. The lookup is performed
> > > > under RCU protection to prevent the found VMA from being destroyed before
> > > > the VMA lock is acquired. VMA lock statistics are updated according to
> > > > the results.
> > > > For now only anonymous VMAs can be searched this way. In other cases the
> > > > function returns NULL.
> > >
> > > Could you describe why only anonymous vmas are handled at this stage and
> > > what (roughly) has to be done to support other vmas? lock_vma_under_rcu
> > > doesn't seem to have any anonymous vma specific requirements AFAICS.
> >
> > TBH I haven't spent too much time looking into file-backed page faults
> > yet but a couple of tasks I can think of are:
> > - Ensure that all vma->vm_ops->fault() handlers do not rely on
> > mmap_lock being read-locked;
>
> I think this way lies madness.  There are just too many device drivers
> that implement ->fault.  My plan is to call the ->map_pages() method
> under RCU without even read-locking the VMA.  If that doesn't satisfy
> the fault, then drop all the way back to taking the mmap_sem for read
> before calling into ->fault.

Sounds reasonable to me but I guess the devil is in the details...

>
