Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1B7672AD6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 22:49:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxztM1ZLDz3c4x
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 08:49:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RhZ9zpDQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RhZ9zpDQ;
	dkim-atps=neutral
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxzsS3rkbz2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 08:48:28 +1100 (AEDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-4c131bede4bso298967b3.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 13:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uzT4Y+nMi8LDe2iEcfC4M3fZx7ZCs1usjL+yZe3S9Zg=;
        b=RhZ9zpDQ2tbO3UOHyEZ6OxL8Q7pdjhMsOsRzcBfXmJ1imO6bs0aWmPetPNnitsYH+4
         yQWRmYHt2rKWbnkEeTpp25/fOxiz+AGY7oBG31Xmes7A5Qp0wmVarh3YODCj2ag0d8fg
         tgiL3bgnzTnuW3HtHK2HGsWiA6sXHkspotz9jEzegBpQjXvCzUYviYMY7Btlwb64jgpZ
         1CfmWkYqIsrPfulP9bqiXjA9LRrqDcL4EL8jfUvE4QVAIsAUVHfRqoUyDl7UgAYSUQZr
         VHSCaH4Nwq0dwyL5OOw0Y1tLnRNlqc0xAhHDD3tgXrprsFOPPJspfcHjrNSfyj05EOod
         zvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzT4Y+nMi8LDe2iEcfC4M3fZx7ZCs1usjL+yZe3S9Zg=;
        b=VWbUEw4/UqvAVu5nFdfSGnOTWs3qYrrcy9P2xWm6W2g0n78BGwf8wguixTOTfQEKps
         NA8E7O9BQFrJQuzgKYxBAjRPm4LIiEluTEWKxvzT1o6UP9QFgmkXp3G69+mQp/7S1wqX
         n1k9MAGUgDtLZ8QjVY7qoOCqTvkNsSudieUQTchYraSq2WkdyMWSHoIvVjw2FUQ0BvDh
         5unTElOsdYNXSuoG8xIxlVmLCfYf0SnYbvhVSiY1ZBmFIam9ojPI9jAl5f9gvPCsDTu1
         5VXikt3Nuy6o7+2nZ3mwUQlckAJ8/vuzpbWdPQ2jLqbfdoGr1jM19f+aEWEGt5YKEnh0
         iWhg==
X-Gm-Message-State: AFqh2krM8R3Ol/v5zai9OgAJisxdmY6cKd14G/GcBKT5oW/ArWtx0lh8
	3rGmYJXuyHvgfLRjAEbbNjEWVo2KTju3MNEVVekc4A==
X-Google-Smtp-Source: AMrXdXvjDsaTscQe0ZYEXddn6BYHX+/MM+QlKzksu62WfW6oaplhyuT1n5g7GuUEaFRAGRMX9y3muPFlrpfKM7HD/Po=
X-Received: by 2002:a81:6d8d:0:b0:490:89c3:21b0 with SMTP id
 i135-20020a816d8d000000b0049089c321b0mr1111410ywc.132.1674078504732; Wed, 18
 Jan 2023 13:48:24 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-18-surenb@google.com>
 <Y8a734ufLZjPHgtT@dhcp22.suse.cz> <CAJuCfpGoYaF2-z7FCiN4X8gEGD6nAwnQC+=n3tUHuMWZa7zx8Q@mail.gmail.com>
 <Y8e6lm76fIoT0603@dhcp22.suse.cz> <CAJuCfpHtV5xEo97X62uR=LXjK6wQMJXhhV2OxXexTfyudGOptw@mail.gmail.com>
 <Y8hls4MH353ZnlQu@dhcp22.suse.cz>
In-Reply-To: <Y8hls4MH353ZnlQu@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Jan 2023 13:48:13 -0800
Message-ID: <CAJuCfpF3j5Sx+D5p5QPCHP4jcWZUiYm=FfUNYhc6QyHZQvDgpw@mail.gmail.com>
Subject: Re: [PATCH 17/41] mm/mmap: move VMA locking before
 anon_vma_lock_write call
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

On Wed, Jan 18, 2023 at 1:33 PM Michal Hocko <mhocko@suse.com> wrote:
>
> On Wed 18-01-23 10:09:29, Suren Baghdasaryan wrote:
> > On Wed, Jan 18, 2023 at 1:23 AM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Tue 17-01-23 18:01:01, Suren Baghdasaryan wrote:
> > > > On Tue, Jan 17, 2023 at 7:16 AM Michal Hocko <mhocko@suse.com> wrote:
> > > > >
> > > > > On Mon 09-01-23 12:53:12, Suren Baghdasaryan wrote:
> > > > > > Move VMA flag modification (which now implies VMA locking) before
> > > > > > anon_vma_lock_write to match the locking order of page fault handler.
> > > > >
> > > > > Does this changelog assumes per vma locking in the #PF?
> > > >
> > > > Hmm, you are right. Page fault handlers do not use per-vma locks yet
> > > > but the changelog already talks about that. Maybe I should change it
> > > > to simply:
> > > > ```
> > > > Move VMA flag modification (which now implies VMA locking) before
> > > > vma_adjust_trans_huge() to ensure the modifications are done after VMA
> > > > has been locked.
> > >
> > > Because ....
> >
> > because vma_adjust_trans_huge() modifies the VMA and such
> > modifications should be done under VMA write-lock protection.
>
> So it will become:
> Move VMA flag modification (which now implies VMA locking) before
> vma_adjust_trans_huge() to ensure the modifications are done after VMA
> has been locked. Because vma_adjust_trans_huge() modifies the VMA and such
> modifications should be done under VMA write-lock protection.
>
> which is effectivelly saying
> vma_adjust_trans_huge() modifies the VMA and such modifications should
> be done under VMA write-lock protection so move VMA flag modifications
> before so all of them are covered by the same write protection.
>
> right?

Yes, and the wording in the latter version is simpler to understand
IMO, so I would like to adopt it. Do you agree?

> --
> Michal Hocko
> SUSE Labs
