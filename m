Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E02770CBA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 02:35:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=h0TxxwCK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHkBS5t8yz3cTw
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 10:35:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=h0TxxwCK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHk9Y0vS0z3cM3
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 10:34:24 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d075a831636so2900298276.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 17:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691195661; x=1691800461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GE6BW9pFYdezUl7cDS0TzP1DYFsIzJQ0ypEfGdJ3TBg=;
        b=h0TxxwCKVye0DQdqW8QciL6a/cGS644vYZUx3RI0OE1671HBfkLOeCjBNqcVrLOU2b
         ycUmZSGLpA9J5ensM11f+iadX9Igk/HzJLsetwc9ly0gURsAFjMfewFY/ZbbuNvVegBO
         zzsxkPT9b50kkszDh+PkQ3GspK2tIZt+I3X+8usJTbDu2o7JkhwHvqL4jBShd4IfGcpl
         UvUXcNV5NlwO1ex/P6Q99K1X+l1eVkU1QU5hcPg4wm2SkhYzjGIIbU58/izBoxYFf7Y/
         H2/yj5m5CuBBcYn7Gjr7Dd36TjaoDemXFlAk5O+znIBaWL3JFXYYXipgVBaiJa9ssh/c
         YgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691195661; x=1691800461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GE6BW9pFYdezUl7cDS0TzP1DYFsIzJQ0ypEfGdJ3TBg=;
        b=Qx5vD8mKcQhYLAnkw8dFfnzrx9zNayWQzY7PMfoXZbO/ogHrZsEitXmHQbA/JV643W
         ejxTQT458ZEdVbcEwBgLN90HfL4l6SlqVpZvoSb9q3DlwhDcc4d+PWtJsrGMtmoeDLJb
         u39UFQcEpd5vC/WE5JkMnMs/nzjq2byA8L3UKr/o0SF1Wd0SQ3bcLAjUSHpjNLWoq0tF
         baDwEkCGPKVik/eQSezKKc/mg1nOYzDApwps6azG4quIC5WoNNgW4HZkXYrEf1YSR8hs
         GMB7gCKN52tQ2srexfGMTi3k70sirVy4BSgywypDcjiICujkL+SIsMhCFeJN/x9iYE0E
         ERiA==
X-Gm-Message-State: AOJu0YxGsy2z+ldXHvlw/1ohOzzMaFd9UBF9CwppPQ8heuPgFnCrpCbS
	UlotfHZXIjVKo1MYvSHjQKz2Ph/yoP/waEGTW2cREg==
X-Google-Smtp-Source: AGHT+IGIa1nXviU0YBg9eLF8cyB0v1ib0mH9PwLc2T9pyyHMpMQsFzfvoD0GfbNXEO9Va/0KSmKs9VeIuXib/uNqJuc=
X-Received: by 2002:a25:250c:0:b0:c14:68fd:6e30 with SMTP id
 l12-20020a25250c000000b00c1468fd6e30mr2908586ybl.16.1691195660786; Fri, 04
 Aug 2023 17:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <20230804214620.btgwhsszsd7rh6nf@f> <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
 <CAGudoHFsAU_BDCOuz8UgDBLGEM8xg=aUGjaVoqkM_Zvxo2Re_g@mail.gmail.com>
 <CAHk-=wiG9xaVvBJXHqTxtop0=mW9KxPS9C54ED23p59VNEKdWg@mail.gmail.com> <CAJuCfpGWGsh2BRgwcJ7oVHnqZfrtiesvhzomK0ZmxE_KK=R7FA@mail.gmail.com>
In-Reply-To: <CAJuCfpGWGsh2BRgwcJ7oVHnqZfrtiesvhzomK0ZmxE_KK=R7FA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 4 Aug 2023 17:34:06 -0700
Message-ID: <CAJuCfpG6BBP+fjV9oyBx3SNiKhiafPzM9vV9bx_goO2aZzAptg@mail.gmail.com>
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
Cc: jacobly.alt@gmail.com, Mateusz Guzik <mjguzik@gmail.com>, regressions@lists.linux.dev, Jiri Slaby <jirislaby@kernel.org>, david@redhat.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org, peterx@redhat.com, regressions@leemhuis.info, liam.howlett@oracle.com, bagasdotme@gmail.com, stable@vger.kernel.org, akpm@linux-foundation.org, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 4, 2023 at 5:26=E2=80=AFPM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Fri, Aug 4, 2023 at 5:15=E2=80=AFPM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Fri, 4 Aug 2023 at 16:25, Mateusz Guzik <mjguzik@gmail.com> wrote:
> > >
> > > I know of these guys, I think they are excluded as is -- they go
> > > through access_remote_vm, starting with:
> > >         if (mmap_read_lock_killable(mm))
> > >                 return 0;
> > >
> > > while dup_mmap already write locks the parent's mm.
> >
> > Oh, you're only worried about vma_start_write()?
> >
> > That's a non-issue. It doesn't take the lock normally, since it starts =
off with
> >
> >         if (__is_vma_write_locked(vma, &mm_lock_seq))
> >                 return;
> >
> > which catches on the lock sequence number already being set.
>
> That check will prevent re-locking but if vma is not already locked
> then the call will proceed with obtaining the lock and setting
> vma->vm_lock_seq to mm->mm_lock_seq.

The optimization Mateusz describes looks valid to me. If there is
nobody else to fault a page and mm_users is stable (which I think it
is because we are holding mmap_lock for write) then we can skip vma
locking, I think.

>
> >
> > So no extra locking there.
> >
> > Well, technically there's extra locking because the code stupidly
> > doesn't initialize new vma allocations to the right sequence number,
> > but that was talked about here:
> >
> >     https://lore.kernel.org/all/CAHk-=3DwiCrWAoEesBuoGoqqufvesicbGp3cX0=
LyKgEvsFaZNpDA@mail.gmail.com/
> >
> > and it's a separate issue.
> >
> >           Linus
