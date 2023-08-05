Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F97770D22
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 03:37:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=bpswymm8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHlZb11bVz3cVg
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 11:37:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=bpswymm8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHlYb2R1Sz3cNN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 11:36:50 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d3522283441so2685854276.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 18:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691199407; x=1691804207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AujeCo6jm3AYe4qZ6y6dt+l/y9fmf46ls+zy0ks6uBk=;
        b=bpswymm8/aHd6mYtUujhG2QErdghxkdOBUSisUuXISL43iBt5anSiCY7npzyoUiEp/
         2r0DThfOtkG+yPEzC58xZLlele5B03sILA+y2PDwjAPMcXtkwUcFy5lrcWm18fIezCd2
         TvTlOQPRw7trWWi7TFwzUQOVcXl3hZGoUY/y3/OIyQgS+g5h8gNRs0QcE+lMY/pkkoXy
         Ns1q4mZuMDjIYZNsw7vuvEEABh4IA+p+ZsHCspKeMOXHkfvzh6yntnLUxWpgnw8t77Vi
         bBEHLKcSkpQzi5wly6AOeCVeTC0b886H1B0C1idctkdvu2YXbxSIRxaC+odXZzrzeWAu
         h22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691199407; x=1691804207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AujeCo6jm3AYe4qZ6y6dt+l/y9fmf46ls+zy0ks6uBk=;
        b=fsYm9g9C5yuY6oJH0LbyxIOTAh9UKaXnk7DYml8y/DodCiSNCaV2k5DwUEQLbZeDiP
         CQXJKLHYlagCY3rYNuJgCnF5KRvgehwvO8Pn8NjoSSSLcMg/I7O9UhcCS7rpGOM7pSEq
         AyPqz5NgIFmw4qTd7/FFnzN0Jfxa5+q8MBToUiTWb3VmqmCZjQ+wmvneMv01pZT9CvmK
         G97H6Uvm8BVHVcyP7JHakx+C0CMJcaYz4voQndc9Jb3//dbddq52dXP9szMGzOsoiymJ
         l2M+LIi7ulmAhBJww6oV4mwWlPq/tSnC7ecZJWNs650rKdj/g4ecJPF5FZm7BO+7fA0O
         v7XA==
X-Gm-Message-State: AOJu0YzabzIC8coj4stNfyxca/itRjdHjofbULPhkO4l6WPhG5X1ioF8
	jpFPiDdX26aIcQCNFyaFyMnd0cq6hD/MtRnzj1rRIw==
X-Google-Smtp-Source: AGHT+IFJHUDmRmfkaGOcYBONV1HYLRgCo/dnuTAMETxoZRKS9/hRI1iaTAV07Qp4qriq/KEZCcwC9+dZWAiPFh/72cs=
X-Received: by 2002:a25:d08:0:b0:d1c:7549:4e8b with SMTP id
 8-20020a250d08000000b00d1c75494e8bmr2986579ybn.29.1691199407388; Fri, 04 Aug
 2023 18:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <20230804214620.btgwhsszsd7rh6nf@f> <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
 <CAGudoHFsAU_BDCOuz8UgDBLGEM8xg=aUGjaVoqkM_Zvxo2Re_g@mail.gmail.com>
 <CAHk-=wiG9xaVvBJXHqTxtop0=mW9KxPS9C54ED23p59VNEKdWg@mail.gmail.com>
 <CAJuCfpGWGsh2BRgwcJ7oVHnqZfrtiesvhzomK0ZmxE_KK=R7FA@mail.gmail.com>
 <CAJuCfpG6BBP+fjV9oyBx3SNiKhiafPzM9vV9bx_goO2aZzAptg@mail.gmail.com>
 <CAGudoHFrDG6-u-XXEmQoPS2CJ2Wpo4ETwhXc2R=jy78RSYw-Zg@mail.gmail.com>
 <CAJuCfpHYBqULvwNELO3Gkc0bkKDV7VJxMjvBru4zaAz4WKQNhw@mail.gmail.com> <CAGudoHGm2hbjSG-2kJevF=xGpz=4Sd0m5CjVO8Ntsahqz5NcGA@mail.gmail.com>
In-Reply-To: <CAGudoHGm2hbjSG-2kJevF=xGpz=4Sd0m5CjVO8Ntsahqz5NcGA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 4 Aug 2023 18:36:34 -0700
Message-ID: <CAJuCfpH0tG8n5AUOqxOnKgXR_ge7rU4dpW3aw0hjOUN99+WXTw@mail.gmail.com>
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

On Fri, Aug 4, 2023 at 6:17=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> wr=
ote:
>
> On 8/5/23, Suren Baghdasaryan <surenb@google.com> wrote:
> > On Fri, Aug 4, 2023 at 5:49=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com=
> wrote:
> >> However, the other users (that I know of ) go through the mmap
> >> semaphore to mess with anything which means they will wait for
> >> dup_mmap to finish (or do their work first). I would be surprised if
> >> there were any cases which don't take the semaphore, given that it was
> >> a requirement prior to the vma patchset (unless you patched some to no
> >> longer need it?). I would guess worst case the semaphore can be added
> >> if missing.
> >
> > No, the only mmap_lock read-lock that is affected is during the page
> > fault, which is expected.
> >
>
> I have difficulty parsing your statement.

I was just saying that vma lock patchset did not touch any other
mmap_locking paths except for the page fault one where we try to skip
read-locking mmap_lock.

>
> I am saying that any 3rd parties which can trigger page faults already
> read lock mmap_lock or can be made to do it (and I don't know any case
> which does not already, but I'm not willing to spend time poking
> around to make sure). One can consider 3rd parties as not a problem,
> modulo the audit.
>
> Past that there does is no known source of trouble? In my original
> e-mail I was worried about processes up the chain in ancestry, perhaps
> some of the state is shared(?) and the locking at hand neuters any
> problems. I'm guessing this is not necessary.
>
> Bottom line though it looks like this will work fine?
>
> That said, I'm not going to submit a patch I can't confidently defend.
> As I did not dig into any of the VMA code and can't be arsed to audit
> all places which mess with "foreign" mm, I'm definitely not submitting
> this myself. You are most welcome to write your own variant at your
> leisure. :)

Ok, I see. I'll need to double check locking when a 3rd party is
involved. Will post a patch when I'm confident enough it's safe.
Thanks!

>
> --
> Mateusz Guzik <mjguzik gmail.com>
