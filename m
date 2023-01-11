Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1383666287
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 19:10:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsbM04s3lz3cfh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 05:10:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ehL+TKq2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ehL+TKq2;
	dkim-atps=neutral
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsbL609XPz2ywn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 05:09:32 +1100 (AEDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-4a2f8ad29d5so205663297b3.8
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 10:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iomA/DdOkukhTJhxYBQfTOfPoKyivfir9Hw2gJoSeQE=;
        b=ehL+TKq2EC+02HvyYu6sEKiG9SD6ek6ucjPX//rURNDpZ5idjUh8CPW14AGwdkNBY8
         8uzkY4yeR21NTIObuKmC4ZQ12pTIsa+ucKG7daPW2N86Wm3+n3WQWc6WkyuiCl59Pn/m
         K12G5nt8vxcQqw5MTCMEW+oF4OsYz/Q7BWq1vCBWyyKMGFzP8CRV8iHgXNxo3anny93k
         Lu2L+/T04fv5UnsMStOc8aHZBXjXyei/GuuGUbeFRxLgVcoKezz8uROOa/7N1O3ssR8j
         rz8Uz+J8bTAdB5re3+nV12ZTRZGZXy6GBlIEZAWbU0iWX6TM+PpYIYdEyapMy1tx2B+P
         pxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iomA/DdOkukhTJhxYBQfTOfPoKyivfir9Hw2gJoSeQE=;
        b=6KdI3KTBFDOsMXaMTpi+m2EaaR/bul0kCAX6HvHwqLloCOtmmQ9E8JZBBFCKEYo70N
         gtraN5KB96kdjkFk7dR0pypJ60hr79k18tNi2f2vedZo667LK1CjceSON4Q6zBzNTAuN
         vIvhqlb0ifTNPrJy1twxqrX/Eb2JCkyNHf/mMOMYeqhP4W0H5b63LTJbrS5lQZaqXkSB
         D4ZsNPAqE6qJh6PE4labwgoPwVTesY1uFh7u2Pnt5ySKEkw5hcDuk9lY6hZJ3n+HUQd6
         hDPOoAnHXvxqKtzq+bKbdY2pz3LTTQMauSSDrmdHAbOedA8tW6aGszx3UepPkyunp4Ac
         N9FQ==
X-Gm-Message-State: AFqh2krEaKro6i4/SE+S0fHL7bAD6TkLCyiOVnBI/vs2XMK324uRes/h
	3fjfMA4AK9UZpBv2ear4WESV21F975+ATz+u8qIV+Q==
X-Google-Smtp-Source: AMrXdXtBpMAq6E/DqVydd63i39yWWptnbETmWKyHQjPPRsuyGFwdNZRcBzJp8UPvkEYa+EjtDkdLVT2CtjvS7Ogk2gA=
X-Received: by 2002:a0d:c2c5:0:b0:433:f1c0:3f1c with SMTP id
 e188-20020a0dc2c5000000b00433f1c03f1cmr1989276ywd.438.1673460569225; Wed, 11
 Jan 2023 10:09:29 -0800 (PST)
MIME-Version: 1.0
References: <20230111001331.cxdeh52vvta6ok2p@offworld> <CAJuCfpEv--awCY0=R3h5Fez8x74U1EZCzNkq4_7deCYqej5sSA@mail.gmail.com>
 <Y75x5fGPcJ63pBIp@dhcp22.suse.cz> <Y76HTfIeEt8ZOIH3@gmail.com>
 <6be809f5554a4faaa22c287ba4224bd0@AcuMS.aculab.com> <CAJuCfpH_VZq99=vGQGJ+evVg5wMPKGsjyawgHnOeoKhtEiAi6w@mail.gmail.com>
 <Y77ndimzUsVZwjTk@dhcp22.suse.cz> <CAJuCfpEEiFNAgb6TNwibUyTJ1J3b-rEGCSw63TiK6FSA=HCdtw@mail.gmail.com>
 <Y77zwYHMfjOL+9EK@dhcp22.suse.cz> <CAJuCfpHCRL5B7SxqTgNbpJqhFwzROX4HAOH5KArO1iXNs_3Kcg@mail.gmail.com>
 <Y7750ym6lztDoRC0@dhcp22.suse.cz>
In-Reply-To: <Y7750ym6lztDoRC0@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 11 Jan 2023 10:09:18 -0800
Message-ID: <CAJuCfpE0_xvgoGqpaRoqp=pKujocXLPqU0rBAh80_vUP6d3jyQ@mail.gmail.com>
Subject: Re: [PATCH 08/41] mm: introduce CONFIG_PER_VMA_LOCK
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
Cc: "michel@lespinasse.org" <michel@lespinasse.org>, "joelaf@google.com" <joelaf@google.com>, "songliubraving@fb.com" <songliubraving@fb.com>, "leewalsh@google.com" <leewalsh@google.com>, "david@redhat.com" <david@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>, "bigeasy@linutronix.de" <bigeasy@linutronix.de>, "peterx@redhat.com" <peterx@redhat.com>, "dhowells@redhat.com" <dhowells@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "edumazet@google.com" <edumazet@google.com>, "jglisse@google.com" <jglisse@google.com>, "punit.agrawal@bytedance.com" <punit.agrawal@bytedance.com>, "arjunroy@google.com" <arjunroy@google.com>, "paulmck@kernel.org" <paulmck@kernel.org>, "x86@kernel.org" <x86@kernel.org>, "hughd@google.com" <hughd@google.com>, "willy@infradead.org" <willy@infradead.org>, Ingo Molnar <mingo@kernel.org>, "gurua@google.com" <gurua@google.com>, "laurent.dufour@fr.ibm.com" <laurent.dufour@fr.ibm.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "rientjes@google.com" <rien
 tjes@google.com>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "kernel-team@android.com" <kernel-team@android.com>, "soheil@google.com" <soheil@google.com>, "minchan@google.com" <minchan@google.com>, "jannh@google.com" <jannh@google.com>, "liam.howlett@oracle.com" <liam.howlett@oracle.com>, "shakeelb@google.com" <shakeelb@google.com>, "luto@kernel.org" <luto@kernel.org>, "gthelen@google.com" <gthelen@google.com>, "ldufour@linux.ibm.com" <ldufour@linux.ibm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "posk@google.com" <posk@google.com>, "lstoakes@gmail.com" <lstoakes@gmail.com>, "peterjung1337@gmail.com" <peterjung1337@gmail.com>, "kent.overstreet@linux.dev" <kent.overstreet@linux.dev>, "hughlynch@google.com" <hughlynch@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Laight <David.Laight@aculab.com>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "t
 atashin@google.com" <tatashin@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 11, 2023 at 10:03 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Wed 11-01-23 09:49:08, Suren Baghdasaryan wrote:
> > On Wed, Jan 11, 2023 at 9:37 AM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Wed 11-01-23 09:04:41, Suren Baghdasaryan wrote:
> > > > On Wed, Jan 11, 2023 at 8:44 AM Michal Hocko <mhocko@suse.com> wrote:
> > > > >
> > > > > On Wed 11-01-23 08:28:49, Suren Baghdasaryan wrote:
> > > > > [...]
> > > > > > Anyhow. Sounds like the overhead of the current design is small enough
> > > > > > to remove CONFIG_PER_VMA_LOCK and let it depend only on architecture
> > > > > > support?
> > > > >
> > > > > Yes. Further optimizations can be done on top. Let's not over optimize
> > > > > at this stage.
> > > >
> > > > Sure, I won't optimize any further.
> > > > Just to expand on your question. Original design would be problematic
> > > > for embedded systems like Android. It notoriously has a high number of
> > > > VMAs due to anonymous VMAs being named, which prevents them from
> > > > merging.
> > >
> > > What is the usual number of VMAs in that environment?
> >
> > I've seen some games which had over 4000 VMAs but that's on the upper
> > side. In my calculations I used 40000 VMAs as a ballpark number and
> > rough calculations before size optimization would increase memory
> > consumption by ~2M (depending on the lock placement in vm_area_struct
> > it would vary a bit). In Android, the performance team flags any
> > change that exceeds 500KB, so it would raise questions.
>
> Thanks, that is a useful information! This is just slightly off-topic
> but I ak wondering how much memory those vma names consume. Are there
> that many unique names or they just happen to be alternating so that
> neighboring ones tend to be different.

Good question. I don't have the ready answer to that but will try to
collect some stats. I know that many names are standardized but
haven't looked at how they are distributed in the address space. Will
followup once I collect the data.
Thanks,
Suren.

> --
> Michal Hocko
> SUSE Labs
