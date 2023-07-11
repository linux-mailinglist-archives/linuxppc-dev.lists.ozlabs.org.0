Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D730774F59E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 18:36:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Oq97RDu6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0mht5CBcz3clZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 02:36:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Oq97RDu6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0mh14rX4z2y1b
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 02:35:28 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-c6e4d4c59bcso6404228276.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 09:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689093325; x=1691685325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FK+/RLEKHvFTc2cBA37SaSmlotAdLXzjwYXHeGn0zbM=;
        b=Oq97RDu63Pf3YYxwzUoBG++FTpq8HiaaoJPKVEmYNFA5g8JgogfB3eLvNmR6xJKwM0
         /hjQ/PeaHoBMNE7ZSek0VnMIX5lh+HUKjnJ7awc53ycJUT/KukZ5ecjo7HLohFTHZdEJ
         g0Uk9kvWyZqrV7aI8KhBqZP/HFeBKqdy9HjK11RPzJ1ZzaUnZjbw+76tV3zCFJLqNfTu
         CuY1ByNMFO1pgxjYZumpMua10+h4rH0YB1NkyanJaoXI1Uq19cvCj9TRnvODki+yAo6R
         CAxAeeZe/2z/QUk9HmibAGd7ZoC+ncWYkfILRUYA2pk99E5DFi+79e6TF4s36p55XMLh
         OXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689093325; x=1691685325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FK+/RLEKHvFTc2cBA37SaSmlotAdLXzjwYXHeGn0zbM=;
        b=aGoYMFzMrDUJklW9P2FVjumRCfBt1o8J+O+qSINa+xmJGBUYdeuuWVRo8PmY40eYAQ
         H6wONgRpSLyA5MAvdm6mkyKjJmoicE+4/pxiq8/vvAgKMuET+EhxoWDYUWVfqTrh129X
         JLSqRVns9lScScDClCikPnBcWVpAOQS34293RyA0mf8hjMhF3qgPRwBBwQZD6OrxjM/f
         Pf9dJnkRhigfcSyIogyTpy3MFCjCRdpNqtW1cgfJuu5XBt38ky/TsF5wsFApv9e8FI0V
         sDXnh82PWzJrU+70O8psocqou0iDILrWCPrNF6+3/PvD9LxafUpv8BQXhm2QMPTd9WwX
         fDSQ==
X-Gm-Message-State: ABy/qLaZCzEDZS9dc5DecIfcu/Umj0Y8W4Q2m3RmgqhjGtccO0U2dxHn
	Q0mpmcpsRjrdH2szpVa35QwqtutWNRZl4ohxBm3wOA==
X-Google-Smtp-Source: APBJJlF8l0QV/lX8VvDE6yY9wAXanhWeF+yRLXHSEd2zoXjNKVmTOZy5uQO02NKxg9aQ90R6+AVbNyLvQyxhrGYEcdI=
X-Received: by 2002:a25:f86:0:b0:bfe:c5cf:6e60 with SMTP id
 128-20020a250f86000000b00bfec5cf6e60mr12446560ybp.8.1689093324985; Tue, 11
 Jul 2023 09:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com> <20230711103541.GA190975@unreal>
 <53676850-539f-2813-d55d-a8bc0ec88092@suse.cz> <20230711110141.GN41919@unreal>
 <20230711110945.GO41919@unreal>
In-Reply-To: <20230711110945.GO41919@unreal>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 11 Jul 2023 09:35:13 -0700
Message-ID: <CAJuCfpG-dwzT++ZLY-sT2jn_9AHFVZsTfwJu17MwbB4oYJ4M+g@mail.gmail.com>
Subject: Re: [PATCH v4 00/33] Per-VMA locks
To: Leon Romanovsky <leon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, Sachin Sant <sachinp@linux.ibm.com>, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, sergeyy@nvidia.com, will@kernel.org, arjunroy@google.com, Linux kernel regressions list <regressions@lists.linux.dev>, chriscli@google.com, dave@stgolabs.net, minchan@google.com, gal@nvidia.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, maorg@nvidia.com, ranro@nvidia.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, regressions@leemhuis.info, shakeelb@google.com, drort@nvidia.com, luto@kernel.org, gthelen@google.com, Laurent Dufou
 r <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, idok@nvidia.com, hannes@cmpxchg.org, Andrew Morton <akpm@linux-foundation.org>, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 11, 2023 at 4:09=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> On Tue, Jul 11, 2023 at 02:01:41PM +0300, Leon Romanovsky wrote:
> > On Tue, Jul 11, 2023 at 12:39:34PM +0200, Vlastimil Babka wrote:
> > > On 7/11/23 12:35, Leon Romanovsky wrote:
> > > >
> > > > On Mon, Feb 27, 2023 at 09:35:59AM -0800, Suren Baghdasaryan wrote:
> > > >
> > > > <...>
> > > >
> > > >> Laurent Dufour (1):
> > > >>   powerc/mm: try VMA lock-based page fault handling first
> > > >
> > > > Hi,
> > > >
> > > > This series and specifically the commit above broke docker over PPC=
.
> > > > It causes to docker service stuck while trying to activate. Revert =
of
> > > > this commit allows us to use docker again.
> > >
> > > Hi,
> > >
> > > there have been follow-up fixes, that are part of 6.4.3 stable (also
> > > 6.5-rc1) Does that version work for you?
> >
> > I'll recheck it again on clean system, but for the record:
> > 1. We are running 6.5-rc1 kernels.
> > 2. PPC doesn't compile for us on -rc1 without this fix.
> > https://lore.kernel.org/all/20230629124500.1.I55e2f4e7903d686c4484cb23c=
033c6a9e1a9d4c4@changeid/
>
> Ohh, I see it in -rc1, let's recheck.

Hi Leon,
Please let us know how it goes.

>
> > 3. I didn't see anything relevant -rc1 with "git log arch/powerpc/mm/fa=
ult.c".

The fixes Vlastimil was referring to are not in the fault.c, they are
in the main mm and fork code. More specifically, check for these
patches to exist in the branch you are testing:

mm: lock newly mapped VMA with corrected ordering
fork: lock VMAs of the parent process when forking
mm: lock newly mapped VMA which can be modified after it becomes visible
mm: lock a vma before stack expansion

Thanks,
Suren.

> >
> > Do you have in mind anything specific to check?
> >
> > Thanks
> >
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>
