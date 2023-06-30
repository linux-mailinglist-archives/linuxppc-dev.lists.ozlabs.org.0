Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82180744172
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 19:41:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=sVIUuw+C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qt2gK30KLz3c3n
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jul 2023 03:41:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=sVIUuw+C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qt2fP70Jsz3bfH
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jul 2023 03:40:44 +1000 (AEST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5704ddda6dfso23423537b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 10:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688146841; x=1690738841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6+En68YkXQdDYAx0rEbBwu3QYNU0fe/9lrmYA+JJw4=;
        b=sVIUuw+Ct1U/Bf5d3gHquE2/2YmHeGw4eAOYMZurkPnz7Y24DlbEXN3fMLp3sYcN7w
         tgfucc0iVLFc34Ms3jMPxnvlW6Eb8x0Lf1MXUlGxByUUNx4WXYipQ9KgO/xl31B0JI4M
         IIP0u6Xs56Bs3e9lex0861S68WDmmB7+JcKO0UeBjpy21YwOaoSxBmNv6oUU/s1G8oYP
         6JLLYQk3SD5QEk4tvBwsEFcdcNFlJ01oX2frs9bkRH3gAdSUAVTk3kbjQfpKTAqXirns
         C+eZ0I5q0ioihoN8MMcXuY6tPy58xUEn55wZSRbsndeVUUbxVUJZrjADvROmQxbWTf9R
         HjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688146841; x=1690738841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6+En68YkXQdDYAx0rEbBwu3QYNU0fe/9lrmYA+JJw4=;
        b=OH2DYeCJBDNtNa9I1K8ygciPZA7c73/nOTtPgqfpwbDmbLJYSrFSS/m4lwgihdzHYf
         BocAUYbFMLIQWNDBPSBhmk9QPetg+tF/Hke3oSxS9FhjC6FHLnHjmwexv7Qj32VEozpw
         Y8+C6WKaIY2PViXda59i9NI2+zbjuZrJ3r/0cQF4HlXfQjYVXSSMLjdX4DMkg5w/SN+x
         xXQhst6Mgr0LH3Z7QPsQjB/6jUsmicR8j1peWlRTtHzTgh/dQCi0z+BA1QYztFhl/+C1
         vca6wCFfRIJhhtY1wtmI0rMp5nunInRNO67TRUH5f+8bLmB/Jt11vIpRtXwKkpIDdyNY
         D19Q==
X-Gm-Message-State: ABy/qLZk8ssTut4wf7L3tT0ldJe5nmtwvmFsC+ykxCDxSp/dOfl4ehw3
	IDUXIZI1abYxOLH4bteT9plcTg0dg771Yd6NPl0UJg==
X-Google-Smtp-Source: APBJJlFXdH9cwo9RRxx4x9iMDrvd6rqmTF9tbASyk8UnyE1yPQ9tRQvTIFcSV/qhYHv9yQckIwxngQeKPyprmMPCXOc=
X-Received: by 2002:a0d:d54d:0:b0:577:2f3f:dd20 with SMTP id
 x74-20020a0dd54d000000b005772f3fdd20mr3237043ywd.34.1688146841016; Fri, 30
 Jun 2023 10:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com> <20230227173632.3292573-30-surenb@google.com>
 <dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel.org> <CAJuCfpF7LweMwpvXavjJZhAciK7wK-bdLz2aFhOZGSHeK5tA9A@mail.gmail.com>
 <9a8d788c-b8ba-1b8a-fd79-0e25b1b60bed@kernel.org> <f7ad7a42-13c8-a486-d0b7-01d5acf01e13@kernel.org>
 <f8864bb0-3d76-20d5-8a25-aab9726354f2@kernel.org>
In-Reply-To: <f8864bb0-3d76-20d5-8a25-aab9726354f2@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 30 Jun 2023 10:40:29 -0700
Message-ID: <CAJuCfpGLozRzxE9KZehgW1dAYpNxe4b+nnjH+ppbeAuFtRNGBQ@mail.gmail.com>
Subject: Re: [PATCH v4 29/33] x86/mm: try VMA lock-based page fault handling first
To: Jiri Slaby <jirislaby@kernel.org>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundati
 on.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 30, 2023 at 1:43=E2=80=AFAM Jiri Slaby <jirislaby@kernel.org> w=
rote:
>
> On 30. 06. 23, 10:28, Jiri Slaby wrote:
> >  > 2348
> > clone3({flags=3DCLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREA=
D|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, chil=
d_tid=3D0x7fcaa5882990, parent_tid=3D0x7fcaa5882990, exit_signal=3D0, stack=
=3D0x7fcaa5082000, stack_size=3D0x7ffe00, tls=3D0x7fcaa58826c0} =3D> {paren=
t_tid=3D[2351]}, 88) =3D 2351
> >  > 2350  <... clone3 resumed> =3D> {parent_tid=3D[2372]}, 88) =3D 2372
> >  > 2351  <... clone3 resumed> =3D> {parent_tid=3D[2354]}, 88) =3D 2354
> >  > 2351  <... clone3 resumed> =3D> {parent_tid=3D[2357]}, 88) =3D 2357
> >  > 2354  <... clone3 resumed> =3D> {parent_tid=3D[2355]}, 88) =3D 2355
> >  > 2355  <... clone3 resumed> =3D> {parent_tid=3D[2370]}, 88) =3D 2370
> >  > 2370  mmap(NULL, 262144, PROT_READ|PROT_WRITE,
> > MAP_PRIVATE|MAP_ANONYMOUS, -1, 0 <unfinished ...>
> >  > 2370  <... mmap resumed>)               =3D 0x7fca68249000
> >  > 2372  <... clone3 resumed> =3D> {parent_tid=3D[2384]}, 88) =3D 2384
> >  > 2384  <... clone3 resumed> =3D> {parent_tid=3D[2388]}, 88) =3D 2388
> >  > 2388  <... clone3 resumed> =3D> {parent_tid=3D[2392]}, 88) =3D 2392
> >  > 2392  <... clone3 resumed> =3D> {parent_tid=3D[2395]}, 88) =3D 2395
> >  > 2395  write(2, "runtime: marked free object in s"..., 36 <unfinished
> > ...>
> >
> > I.e. IIUC, all are threads (CLONE_VM) and thread 2370 mapped ANON
> > 0x7fca68249000 - 0x7fca6827ffff and go in thread 2395 thinks for some
> > reason 0x7fca6824bec8 in that region is "bad".

Thanks for the analysis Jiri.
Is it possible from these logs to identify whether 2370 finished the
mmap operation before 2395 tried to access 0x7fca6824bec8? That access
has to happen only after mmap finishes mapping the region.

>
> As I was noticed, this might be as well be a fail of the go's
> inter-thread communication (or alike) too. It might now be only more
> exposed with vma-based locks as we can do more parallelism now.

Yes, with multithreaded processes like these where threads are mapping
and accessing memory areas, per-VMA locks should allow for greater
parallelism. So, if there is a race like the one I asked above, it
might become more pronounced with per-VMA locks.

I'll double check the code, but from Kernel's POV mmap would take the
mmap_lock for write then will lock the VMA lock for write. That should
prevent any page fault handlers from accessing this VMA in parallel
until writers release the locks. Page fault path would try to find the
VMA without any lock and then will try to read-lock that VMA. If it
fails it will fall back to mmap_lock. So, if the writer started first
and obtained the VMA lock, the reader will fall back to mmap_lock and
will block until the writer releases the mmap_lock. If the reader got
VMA read lock first then the writer will block while obtaining the
VMA's write lock. However for your scenario, the reader (page fault)
might be getting here before the writer (mmap) and upon not finding
the VMA it is looking for, it will fail.
Please let me know if you can verify this scenario.
Thanks,
Suren.

>
> There are older hard to reproduce bugs in go with similar symptoms (we
> see this error sometimes now too):
> https://github.com/golang/go/issues/15246
>
> Or this 2016 bug is a red herring. Hard to tell...
>
> >> thanks,
> --
> js
> suse labs
>
