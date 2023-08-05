Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F81770CE2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 03:08:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=aUwo21ad;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHkwX1WpHz3cSt
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 11:08:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=aUwo21ad;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHktl0YYDz3cR3
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 11:06:38 +1000 (AEST)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-765a7768f1dso223342585a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 18:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691197593; x=1691802393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9nXyLSKlKDuUv7VJNfF6qvF+1BUCc5KK6MJ3lKMdxY=;
        b=aUwo21adxNhts1FI6P2qHSPV+p0bQFy+AVXKarONqtMm86XWxkCeXSeCRN5rVOkbuA
         U9xu3v9w8K8eVl+8jZUOqrqfCHUny7KfanQvYPi1lJj5UnIuPwU2bBaexSN4P/CiStKM
         Q04LTz5qK5imoj1roocTbgXo95ivHHkcbkfr4yII/5eubPfs8VLuc99/bOLp5VICKq+l
         kJ0hzHB1Moy0QCkOK7RoLAULbNhhHbdlMhXQ/JWxfdDf2RMT/G8sPy/SfAyX6ujpFsBs
         63FGq+adFIALmXtAt9wp8tA4MpkrRo5mr6xvzVMi8NdUsh/Ti6Hx/XABGLcNKVhvW9IT
         o4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691197593; x=1691802393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9nXyLSKlKDuUv7VJNfF6qvF+1BUCc5KK6MJ3lKMdxY=;
        b=KFx6g/rBBRyg3c760Fl/0vwS47yLZKghODQKv1SMzfoEoxHHumR2RwM/GPzxwmtI8b
         yQ3ofogNJbagEIodmeC3lejds7RpKzgJRvULnP/Nj99B6qNFhubXX2F4WUG7Fz6EO5Ze
         7A8y7FRsyxzkr/3Cra+Wqmj3DEa8d93GWBBBJRBKMYyVmpkhAIVGcm2ZXaWT5YyVScYf
         ZBwspJE/nFBylZG6JKiisJxLarQ3RRt7AO0YFONZxjP8hyqtUBHEnQ25T8YmrvusX51F
         roltpDlBvv19vQGxBWNfmXFKBygyJiYEjgL/uuQRpvYhmS/VHrYNk8vO3OqmqNYg2lYm
         8gNA==
X-Gm-Message-State: AOJu0YyQsx1njPsdpG1Ljububz3FZXSC6R6WFBaTtR4Mq9Aa7c1UPF/X
	ylhzCotCfGTFDd9WJHjKNDEawJAzEFfVD1NWq7+CNA==
X-Google-Smtp-Source: AGHT+IGeI3aXL1BSqCSVQSPUC8HxCVhgOILs3RxiXsM7zZQNEZNHfkFdUoN4/MsbrHKtqT5U8IWBJIqb2DgGz4WHyls=
X-Received: by 2002:a05:620a:4628:b0:76c:9fdb:faed with SMTP id
 br40-20020a05620a462800b0076c9fdbfaedmr4192886qkb.35.1691197593186; Fri, 04
 Aug 2023 18:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <20230804214620.btgwhsszsd7rh6nf@f> <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
 <CAGudoHFsAU_BDCOuz8UgDBLGEM8xg=aUGjaVoqkM_Zvxo2Re_g@mail.gmail.com>
 <CAHk-=wiG9xaVvBJXHqTxtop0=mW9KxPS9C54ED23p59VNEKdWg@mail.gmail.com>
 <CAJuCfpGWGsh2BRgwcJ7oVHnqZfrtiesvhzomK0ZmxE_KK=R7FA@mail.gmail.com>
 <CAJuCfpG6BBP+fjV9oyBx3SNiKhiafPzM9vV9bx_goO2aZzAptg@mail.gmail.com> <CAGudoHFrDG6-u-XXEmQoPS2CJ2Wpo4ETwhXc2R=jy78RSYw-Zg@mail.gmail.com>
In-Reply-To: <CAGudoHFrDG6-u-XXEmQoPS2CJ2Wpo4ETwhXc2R=jy78RSYw-Zg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 4 Aug 2023 18:06:22 -0700
Message-ID: <CAJuCfpHYBqULvwNELO3Gkc0bkKDV7VJxMjvBru4zaAz4WKQNhw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] fork: lock VMAs of the parent process when forking
To: Mateusz Guzik <mjguzik@gmail.com>
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
Cc: jacobly.alt@gmail.com, regressions@lists.linux.dev, Jiri Slaby <jirislaby@kernel.org>, david@redhat.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org, peterx@redhat.com, regressions@leemhuis.info, liam.howlett@oracle.com, bagasdotme@gmail.com, gregkh@linuxfoundation.org, stable@vger.kernel.org, akpm@linux-foundation.org, ldufour@linux.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 4, 2023 at 5:49=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> wr=
ote:
>
> On 8/5/23, Suren Baghdasaryan <surenb@google.com> wrote:
> > On Fri, Aug 4, 2023 at 5:26=E2=80=AFPM Suren Baghdasaryan <surenb@googl=
e.com>
> > wrote:
> >>
> >> On Fri, Aug 4, 2023 at 5:15=E2=80=AFPM Linus Torvalds
> >> <torvalds@linux-foundation.org> wrote:
> >> >
> >> > On Fri, 4 Aug 2023 at 16:25, Mateusz Guzik <mjguzik@gmail.com> wrote=
:
> >> > >
> >> > > I know of these guys, I think they are excluded as is -- they go
> >> > > through access_remote_vm, starting with:
> >> > >         if (mmap_read_lock_killable(mm))
> >> > >                 return 0;
> >> > >
> >> > > while dup_mmap already write locks the parent's mm.
> >> >
> >> > Oh, you're only worried about vma_start_write()?
> >> >
> >> > That's a non-issue. It doesn't take the lock normally, since it star=
ts
> >> > off with
> >> >
> >> >         if (__is_vma_write_locked(vma, &mm_lock_seq))
> >> >                 return;
> >> >
> >> > which catches on the lock sequence number already being set.
> >>
> >> That check will prevent re-locking but if vma is not already locked
> >> then the call will proceed with obtaining the lock and setting
> >> vma->vm_lock_seq to mm->mm_lock_seq.
> >
> > The optimization Mateusz describes looks valid to me. If there is
> > nobody else to fault a page and mm_users is stable (which I think it
> > is because we are holding mmap_lock for write) then we can skip vma
> > locking, I think.
> >
>
> mm_users is definitely *not* stable -- it can be bumped by
> get_task_mm, which is only synchronized with task lock.

Ugh, you are of course correct. Poor choice for saying no new users
(threads) can appear from under us.

>
> However, the other users (that I know of ) go through the mmap
> semaphore to mess with anything which means they will wait for
> dup_mmap to finish (or do their work first). I would be surprised if
> there were any cases which don't take the semaphore, given that it was
> a requirement prior to the vma patchset (unless you patched some to no
> longer need it?). I would guess worst case the semaphore can be added
> if missing.

No, the only mmap_lock read-lock that is affected is during the page
fault, which is expected.

>
> What is guaranteed is that if the forking process is single-threaded,
> there will be no threads added out of nowhere -- the only thread which
> could do it is busy creating one in dup_mmap. If multithreaded
> operation of the forking process was the only problem, that's it.
>
> >>
> >> >
> >> > So no extra locking there.
> >> >
> >> > Well, technically there's extra locking because the code stupidly
> >> > doesn't initialize new vma allocations to the right sequence number,
> >> > but that was talked about here:
> >> >
> >> >
> >> > https://lore.kernel.org/all/CAHk-=3DwiCrWAoEesBuoGoqqufvesicbGp3cX0L=
yKgEvsFaZNpDA@mail.gmail.com/
> >> >
> >> > and it's a separate issue.
> >> >
> >> >           Linus
> >
>
>
> --
> Mateusz Guzik <mjguzik gmail.com>
