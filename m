Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B238A74BFD7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 00:37:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Jg/dnV7W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qz4rv2j3sz3bw4
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 08:37:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Jg/dnV7W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qz4qz6TzCz30Kf
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jul 2023 08:36:30 +1000 (AEST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-579efc32377so38726077b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 15:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688855787; x=1691447787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GM81ytcQAbvY1rpHjBMQS8O2py0eRXT0atPhQXgjA54=;
        b=Jg/dnV7WFpsjyNkLXFSJxvrYIbV5y67MbDJvmLrUOpsSl1LalBxzIJWHJrFfJSep+L
         kfZUq9UEYRlcCIgngXW54qsHIAzed494k22aoeQDCFY4ti+EvUlIb1BGsWldwxkxHI+Z
         T0O1rSIqZmQLXjw0ciOxBZnryw5KfH13QEmjeIwQpMHYqnDxWeFqRwsi0j+AkxhDt5Db
         PubOIUcLGyJx197rF2uJfbZ9Yjwt9Z7yJB0/yJIrVGW9K8Wcc2dwI+q9RUKuLpMhIfMV
         0O1pGeVudSwRXlE5gEeIlz84wqdwxg/t6UU9/nN9EWZGGgMME7nrCyrW+oIZPuLQydV4
         +a4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688855787; x=1691447787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GM81ytcQAbvY1rpHjBMQS8O2py0eRXT0atPhQXgjA54=;
        b=kbhEN1nwlo91PZfmxpWwxMuz+v30JoKekq81vZ7/vacthiDEza5u5O5KG7anox/fIM
         4WEKQisJZh7DIimMCnjt3YMvhcVatldeNbsPN2roCVuKVugR7SeafKscUDF9dFdACJfR
         UJ8TUdEDR/SFqExkomSBPIxwp7D+rAUfUR9Je1YfgXqQxwzYNxGZ8Kikttw6fiMxKvYG
         Ohjz+SrdUV36iCgiQwhPLqP+0/hZQ19E7uw9NA+Dk0bEmwvSj21EEdG5qX9i7Ctf8ss7
         K05ferJHxyAozzCG9KSn3yGYrmURtg4kImMoSeRXhPQ7hq5H8J55u1GoZG9g1aZc8KHl
         a4gQ==
X-Gm-Message-State: ABy/qLYAHrhLi1IXJZekBTMnoq/qRPk5sJcGavF8mBVx1A+IIDQq12cn
	Ym2+A8o0aMn8IcaaKofNsN/NQjRagTDWBmTr7MnZxA==
X-Google-Smtp-Source: APBJJlE9QX36fmJ1qqEKpR7UCT26mt3D5smIFQ/5C5ArBlb6gmqPuqIREas9VSsGWwWtUdtNurt1pOKbRKnjQvM5CU8=
X-Received: by 2002:a81:7741:0:b0:570:63d3:9685 with SMTP id
 s62-20020a817741000000b0057063d39685mr7997297ywc.25.1688855787129; Sat, 08
 Jul 2023 15:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <CAHk-=whhXFQj0Vwzh7bnjnLs=SSTsxyiY6jeb7ovOGnCes4aWg@mail.gmail.com>
In-Reply-To: <CAHk-=whhXFQj0Vwzh7bnjnLs=SSTsxyiY6jeb7ovOGnCes4aWg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 8 Jul 2023 15:36:15 -0700
Message-ID: <CAJuCfpHuFc1P=Wo6Oy0T0u-H1B_JsbRgqhVJxY7D64ZY1zh7Cg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: jacobly.alt@gmail.com, regressions@lists.linux.dev, Jiri Slaby <jirislaby@kernel.org>, david@redhat.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, liam.howlett@oracle.com, linux-mm@kvack.org, peterx@redhat.com, regressions@leemhuis.info, willy@infradead.org, bagasdotme@gmail.com, stable@vger.kernel.org, akpm@linux-foundation.org, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 8, 2023 at 2:18=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, 8 Jul 2023 at 12:12, Suren Baghdasaryan <surenb@google.com> wrote=
:
> >
> >  kernel/fork.c | 1 +
> >  1 file changed, 1 insertion(+)
>
> I ended up editing your explanation a lot.
>
> I'm not convinced that the bug has much to do with the delayed tlb flushi=
ng.
>
> I think it's more fundamental than some tlb coherence issue: our VM
> copying simply expects to not have any unrelated concurrent page fault
> activity, and various random internal data structures simply rely on
> that.
>
> I made up an example that I'm not sure is relevant to any of the
> particular failures, but that I think is a non-TLB case: the parent
> 'vma->anon_vma' chain is copied by dup_mmap() in anon_vma_fork(), and
> it's possible that the parent vma didn't have any anon_vma associated
> with it at that point.
>
> But a concurrent page fault to the same vma - even *before* the page
> tables have been copied, and when the TLB is still entirely coherent -
> could then cause a anon_vma_prepare() on that parent vma, and
> associate one of the pages with that anon-vma.
>
> Then the page table copy happens, and that page gets marked read-only
> again, and is added to both the parent and the child vma's, but the
> child vma never got associated with the parents new anon_vma, because
> it didn't exist when anon_vma_fork() happened.
>
> Does this ever happen? I have no idea. But it would seem to be an
> example that really has nothing to do with any TLB state, and is just
> simply "we cannot handle concurrent page faults while we're busy
> copying the mm".
>
> Again - maybe I messed up, but it really feels like the missing
> vma_start_write() was more fundamental, and not some "TLB coherency"
> issue.

Sounds plausible. I'll try to use the reproducer to verify if that's
indeed happening here. It's likely there are multiple problematic
scenarios due to this missing lock though.
Thanks,
Suren.

>
>             Linus
