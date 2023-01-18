Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32016670FD9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 02:20:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxScz0FZCz3fCj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 12:20:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Px76etJt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Px76etJt;
	dkim-atps=neutral
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxSc21C5rz3c7Q
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 12:20:01 +1100 (AEDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-4d19b2686a9so320496667b3.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 17:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JXWFfS4aiyJcUPRd+ryee/bpyv1wIIuVm8HjnFM4YwU=;
        b=Px76etJtqo+vzkJY5k26UOhb6WDYZwrowUwMIothVbfItA611chAfKe1cZZbCYe18v
         pWUOMkcFzisLL0UjLaeC38Vc9PdYHX+FX9AkzPAIJIhgrpwsvPVhbVFn0veZqmzECQNx
         X2BdlNyIyKIuzT2YeQCjVFDL8FE/Px/uceIbST/a1pV7aGbsLQCPDpebAGoJMjSuOLWv
         SKIu71ReD/rafQACFoXcYwdxqjH3PldndZq0ZsWTh9tgYpIH5Ip+0a0UN0bLIZhXeYPf
         HFNTn/s/dz5HXxIDO+CufvyshmF9uyF9zYjoFxKQAKHhdN7hU0pJIUOPsqK1VZhIER13
         SQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXWFfS4aiyJcUPRd+ryee/bpyv1wIIuVm8HjnFM4YwU=;
        b=Rb+BxTLVudomdjRnkFpkTx4YZia3y3QkLToUfC4HgJVPhDRUDqoo/MBd4+GcCXfvHb
         ArPT9zzoJxeu3qX3QWlC5qRzKB1cNQZt4hPv9zUEoTFQ3mfSDrgnQXtXC1oq4db9r+tu
         7kCZOq9H/MD6UK3XpMMON0xe/fPlC+8JhAPcznl6eWpsWlG+9UOdyHLj5+Vum/Lt51Fu
         d01RVyrMwhAKsCkJ7NLPrnpxO1Qe9cAOxyDW49yxryJioed/Htm4mbgz7ycSup4YXcZG
         Pb4P6GZKts1bp+NJpkh8XlhPjo4mRZjvzEbCPZZ7Qrbfg7G1OgEkL9AUeNQxa/G5hFTA
         5b+w==
X-Gm-Message-State: AFqh2kqvY/Zz2c/+dvLxUsxJJvi0mvjgeWhrDHKnuKlkYIqS1yYlEYX1
	X+EL3mJ834KMYlPm8POE4+pNtAGOgskfuSklN8UxPQ==
X-Google-Smtp-Source: AMrXdXuusAXlckmOHYo/FB3BTugnLiciDCWeH/OH9DYwge23YcEvOJoTVCiUAgQM3zYMQEArpfk5YvktjC1zXfSXUx0=
X-Received: by 2002:a0d:fc05:0:b0:3ea:454d:d1ef with SMTP id
 m5-20020a0dfc05000000b003ea454dd1efmr676859ywf.409.1674004797702; Tue, 17 Jan
 2023 17:19:57 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-40-surenb@google.com>
 <Y8bFdB47JT/luMld@dhcp22.suse.cz>
In-Reply-To: <Y8bFdB47JT/luMld@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Jan 2023 17:19:46 -0800
Message-ID: <CAJuCfpHVYW5aBVmT0vwn+j=m=Jo2KhSTzgVtxSEusUZJdzetUA@mail.gmail.com>
Subject: Re: [PATCH 39/41] kernel/fork: throttle call_rcu() calls in vm_area_free
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

On Tue, Jan 17, 2023 at 7:57 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Mon 09-01-23 12:53:34, Suren Baghdasaryan wrote:
> > call_rcu() can take a long time when callback offloading is enabled.
> > Its use in the vm_area_free can cause regressions in the exit path when
> > multiple VMAs are being freed.
>
> What kind of regressions.
>
> > To minimize that impact, place VMAs into
> > a list and free them in groups using one call_rcu() call per group.
>
> Please add some data to justify this additional complexity.

Sorry, should have done that in the first place. A 4.3% regression was
noticed when running execl test from unixbench suite. spawn test also
showed 1.6% regression. Profiling revealed that vma freeing was taking
longer due to call_rcu() which is slow when RCU callback offloading is
enabled. I asked Paul McKenney and he explained to me that because the
callbacks are offloaded to some other kthread, possibly running on
some other CPU, it is necessary to use explicit locking.  Locking on a
per-call_rcu() basis would result in excessive contention during
callback flooding. So, by batching call_rcu() work we cut that
overhead and reduce this lock contention.


> --
> Michal Hocko
> SUSE Labs
