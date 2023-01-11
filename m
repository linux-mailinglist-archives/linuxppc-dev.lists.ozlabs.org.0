Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6ED66615A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 18:05:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsYwV3WNMz3cfS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 04:05:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mNAGtaf8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mNAGtaf8;
	dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsYvY2JF4z2yHT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 04:04:56 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id p188so15688074yba.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 09:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LTJYmIxK7HXmivC0K3EGms7i6vie+YSU0ogRPhLAOWY=;
        b=mNAGtaf8jUOcbLC2GpY2IoOKVHZsaeSbuTMqB0BfbfYLRyVOF36Ix55jRi6VXABc2C
         TxHjeefcMzNJWY/YYv6W5ahFqaQmr9lvf1jGIqiEx8ySeybJFbSXh7kyg0REyOpFJ3nH
         qgVT4D8lYYrgosLusEdUk6v9fL81IeduQoDY1CoEHY7D6fZ1FTpu9HfIbpxV9/ZgBpjb
         lhCOVJRxYZXXqUPheviOgPqcc0ccJ7ZE+SCJKJc9myn5grFAs5xj6zbeWKyRGyMjbouQ
         FlOSd3pY+1imiSyJ1udW76G4nfJkk9sYWezx9f2BI+FYnk36Etq0x095sJRpXZCAhe9E
         wTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTJYmIxK7HXmivC0K3EGms7i6vie+YSU0ogRPhLAOWY=;
        b=LO7CON9mK2+t5qGi38pbCJWGgqWwEm5uip5pP7QrkwgckKy326YJ2ONOuaPm2XrZr9
         d4D8BQmmvsCpDVs9+ZAOGPeIHodWbmWRznvJs0KziGiyKeW4QK2D459fZVSrSqBVHSZg
         c2062OJC/BgtSTmZzpt56pxOUF+X2tuB7KJP45yWwjZego8ehi5mAJkkP25SjbK7j2Li
         iBtui3enkqwFVCWaJCXTgrBqNRJDF4wKDwb1vwwJfwb8mdpib8Ogr2J1ax/ZpsXJPamK
         YkwHIIm4B1Bb8UCBDKjjKT0MvcsHWkx3qYupyt1acIm4q79/yK5HYeUTj+ByhM2WD80D
         cnoQ==
X-Gm-Message-State: AFqh2kpvRMDRQeY/y+soIcMnx/mrBHs1u4P14pTlGB7t3Tx7icfMhKM+
	NywFI2Bd7d5ad/rDEvBTIuq+p5G6jJdeKpt+BpMZIg==
X-Google-Smtp-Source: AMrXdXuT2tWUr2Hd/aaxX3TJlatyg89hpnEY3Qn0fpRBzhAdGcwVITlGCP7wKe7gcAbYlKYD+1hcbSYSMwXYBplkZ8k=
X-Received: by 2002:a25:1388:0:b0:7b8:6d00:ef23 with SMTP id
 130-20020a251388000000b007b86d00ef23mr2129455ybt.119.1673456692551; Wed, 11
 Jan 2023 09:04:52 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-9-surenb@google.com>
 <20230111001331.cxdeh52vvta6ok2p@offworld> <CAJuCfpEv--awCY0=R3h5Fez8x74U1EZCzNkq4_7deCYqej5sSA@mail.gmail.com>
 <Y75x5fGPcJ63pBIp@dhcp22.suse.cz> <Y76HTfIeEt8ZOIH3@gmail.com>
 <6be809f5554a4faaa22c287ba4224bd0@AcuMS.aculab.com> <CAJuCfpH_VZq99=vGQGJ+evVg5wMPKGsjyawgHnOeoKhtEiAi6w@mail.gmail.com>
 <Y77ndimzUsVZwjTk@dhcp22.suse.cz>
In-Reply-To: <Y77ndimzUsVZwjTk@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 11 Jan 2023 09:04:41 -0800
Message-ID: <CAJuCfpEEiFNAgb6TNwibUyTJ1J3b-rEGCSw63TiK6FSA=HCdtw@mail.gmail.com>
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

On Wed, Jan 11, 2023 at 8:44 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Wed 11-01-23 08:28:49, Suren Baghdasaryan wrote:
> [...]
> > Anyhow. Sounds like the overhead of the current design is small enough
> > to remove CONFIG_PER_VMA_LOCK and let it depend only on architecture
> > support?
>
> Yes. Further optimizations can be done on top. Let's not over optimize
> at this stage.

Sure, I won't optimize any further.
Just to expand on your question. Original design would be problematic
for embedded systems like Android. It notoriously has a high number of
VMAs due to anonymous VMAs being named, which prevents them from
merging. 2M per process increase would raise questions, therefore I
felt the need for optimizing the memory overhead which is done in the
last patch.
Thanks for the feedback!

> --
> Michal Hocko
> SUSE Labs
