Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE24666246
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 18:50:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsZvq0mLQz3cdj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 04:50:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oGppCfJz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=oGppCfJz;
	dkim-atps=neutral
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsZtr6X1Rz3bZl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 04:49:23 +1100 (AEDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-4c24993965eso198823807b3.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 09:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ePKFgxTY+N2/lJawjZfA8T7NwNNbVvAEDKDS+DodhcA=;
        b=oGppCfJz0FFp5Y7cMmyBjVC+6IJyztjkXrGbuY9sKKHCI8eMmhM/7O2McEjp6gADmb
         +V0NeF2kWF2Nwx3q9gWsm+nYAZhClko9G/+1YL3Na6XbuL8eK6Mt2K1h5TrUYNL0gjZj
         EdKTPpbii1X0xYEnTvCQabouks/frlB8HMIKJNjssTNM0vareCnqE5qN+nZhpNCV2op3
         vHTLk1IVN7BpUvGL+T4ErN0fFl3kMEblGRpIp40HU1gf3C0N2si3drvDv1CfDZFLItf8
         1vJX689W9VLjkDAY6yF+wPxZNPjwU2oyoT1WYSGmqbPzVRb6IwqfBJ9W1QC0Fo04OXv2
         /HDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePKFgxTY+N2/lJawjZfA8T7NwNNbVvAEDKDS+DodhcA=;
        b=EHTR4TPtaoADdF7Rl8B5hNNyI/jgNTf5no3nTqAADpHGGd4Ui0FK0XbFSlH5aezVFh
         MWab5GSYjtLAg8rv6kojYQH3JO5HP95XBaQ/lsx9p42VOJZOIvbvphetI1xzTuyO3qfb
         AFamvYF53ubYVRW3M7G6+ZvpuyGABkTi0m7AY8iityKQgI6vqrR2zKgP5EUfXjW6VY8k
         9tS9v8SDth46dMb1qL+38vNdrxO/RnpyW5pEF2RCmzD0OkwtGR/tbPSm47ZzglKLo79C
         P9B7a3Ut+1CBkRMkvBWPFTNBs3hWhzvnTt5XyX9UU5Y9Xg4zh0LIzB6m+Kj7Lqg7NeEf
         RZcg==
X-Gm-Message-State: AFqh2koPhzNBKYXTjIiELFzg0JjjyKVYIFWVGfKDjJ3uxmnHMQO6JtEu
	nBdyyfOXSeSGNBotE/63aBIv66YKx2nU+OJiicyjLg==
X-Google-Smtp-Source: AMrXdXuOq+0O+cDiW8MM05elg260zh8GUOYQodmwyx/lttE2iOJ2vqd6ut8RJ3mh7qgQEhbfljGWdCv4611jx4QWNMI=
X-Received: by 2002:a0d:c2c5:0:b0:433:f1c0:3f1c with SMTP id
 e188-20020a0dc2c5000000b00433f1c03f1cmr1980213ywd.438.1673459360046; Wed, 11
 Jan 2023 09:49:20 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-9-surenb@google.com>
 <20230111001331.cxdeh52vvta6ok2p@offworld> <CAJuCfpEv--awCY0=R3h5Fez8x74U1EZCzNkq4_7deCYqej5sSA@mail.gmail.com>
 <Y75x5fGPcJ63pBIp@dhcp22.suse.cz> <Y76HTfIeEt8ZOIH3@gmail.com>
 <6be809f5554a4faaa22c287ba4224bd0@AcuMS.aculab.com> <CAJuCfpH_VZq99=vGQGJ+evVg5wMPKGsjyawgHnOeoKhtEiAi6w@mail.gmail.com>
 <Y77ndimzUsVZwjTk@dhcp22.suse.cz> <CAJuCfpEEiFNAgb6TNwibUyTJ1J3b-rEGCSw63TiK6FSA=HCdtw@mail.gmail.com>
 <Y77zwYHMfjOL+9EK@dhcp22.suse.cz>
In-Reply-To: <Y77zwYHMfjOL+9EK@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 11 Jan 2023 09:49:08 -0800
Message-ID: <CAJuCfpHCRL5B7SxqTgNbpJqhFwzROX4HAOH5KArO1iXNs_3Kcg@mail.gmail.com>
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

On Wed, Jan 11, 2023 at 9:37 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Wed 11-01-23 09:04:41, Suren Baghdasaryan wrote:
> > On Wed, Jan 11, 2023 at 8:44 AM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Wed 11-01-23 08:28:49, Suren Baghdasaryan wrote:
> > > [...]
> > > > Anyhow. Sounds like the overhead of the current design is small enough
> > > > to remove CONFIG_PER_VMA_LOCK and let it depend only on architecture
> > > > support?
> > >
> > > Yes. Further optimizations can be done on top. Let's not over optimize
> > > at this stage.
> >
> > Sure, I won't optimize any further.
> > Just to expand on your question. Original design would be problematic
> > for embedded systems like Android. It notoriously has a high number of
> > VMAs due to anonymous VMAs being named, which prevents them from
> > merging.
>
> What is the usual number of VMAs in that environment?

I've seen some games which had over 4000 VMAs but that's on the upper
side. In my calculations I used 40000 VMAs as a ballpark number and
rough calculations before size optimization would increase memory
consumption by ~2M (depending on the lock placement in vm_area_struct
it would vary a bit). In Android, the performance team flags any
change that exceeds 500KB, so it would raise questions.

>
> --
> Michal Hocko
> SUSE Labs
