Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0633770D2F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 03:43:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=plN7Lmsf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHljF4TNtz3cSM
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 11:43:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=plN7Lmsf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHlhJ4NBrz2yVw
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 11:42:39 +1000 (AEST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5860c7fc2fcso30469747b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 18:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691199756; x=1691804556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rSm29+3cw5ZqZkXj3qFSUuwbm7CIlxZaN5vcndHFEY=;
        b=plN7LmsfHyvXpPp/HAgS7nXgIXteE8264IDa/o2tjDOX8unsmYk7EojQmTU5cUe+jV
         cjliykudifFvc7dLk6/DwgOH7+9X4MDhzMIsMQm/onYSQqKdwNZX8UqVTYKuJYl6Ha+O
         9WZhXR18J7XAaXbGAAwEXZ6ix0+UBKlzsTvo5jb05KSoRLL7qXvNBl5pNC1d6tXmVHMW
         SXIZLO8BP/DYmu5uEYaOUv39DLoLQlpwPV7BHp0dSXWIa4usOAk1N8w9mKX5V2IkcGwp
         8LnltCq2ELwZcpwu4a4wWAkmF+JXVmG8o9gLjlgrYUu/NaekCF94WvOvLo4XO9zaSpD4
         kw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691199756; x=1691804556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rSm29+3cw5ZqZkXj3qFSUuwbm7CIlxZaN5vcndHFEY=;
        b=D4kRI0jVG4E+rXCadUDB+vBnlPp6fX59FfsdXIj4cbg68inFHJQQrdATwvr90Ieb1p
         TRpQ0rqvpQsAIFBMCUhGqMM45Df1otVmtMgINV/vzxsndslQu6t5kBSD6kh8gM0QEyQZ
         Rr9qbLTKX0YoiUijJwTCR20Rs4sx9brLaMBUcVNqU2nBquZfV5Qrv/KAaoKu25AD/WTt
         H7c3dthIpN6AxgVeaAZdyNv1yDKP2tSZd76inwCXqUJbR73QV9hOh5tFRhRzFP0MkGiD
         pzymDyfkGjnlDtRmeidcK9pDw1VO/Vxt13d4rYuafePVcqn+7hX3mdjIHvZpr6Qrt5d3
         PpEw==
X-Gm-Message-State: AOJu0YyEohWgr3F6gMm3ZKCGLzucjY0ppu37g4pI1eo4Tel3OxR7GJo7
	LznP6YeKFa2VFQ6erOQK9YenLRutmLyfy6dJ+MMgug==
X-Google-Smtp-Source: AGHT+IG/HG+1FkEX7JGdDxDWOldixEM0zkMBonCbqf9PfeycEQrUJ/6TiOpqPkR0mOG06UahG1Vw84tdIhU/dMHaqDg=
X-Received: by 2002:a0d:db41:0:b0:570:2568:15e with SMTP id
 d62-20020a0ddb41000000b005702568015emr3945027ywe.43.1691199756040; Fri, 04
 Aug 2023 18:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230708191212.4147700-1-surenb@google.com> <20230708191212.4147700-3-surenb@google.com>
 <20230804214620.btgwhsszsd7rh6nf@f> <CAHk-=wiy125k1dBmQFTGpHwiOqEyrD6xnd4xKWfe97H_HodgDA@mail.gmail.com>
 <CAGudoHFsAU_BDCOuz8UgDBLGEM8xg=aUGjaVoqkM_Zvxo2Re_g@mail.gmail.com>
 <CAHk-=wiG9xaVvBJXHqTxtop0=mW9KxPS9C54ED23p59VNEKdWg@mail.gmail.com> <CAGudoHFsxmiezZREyVkrPYBBij3u9SNaxLWipOOPy5S+5pJcZA@mail.gmail.com>
In-Reply-To: <CAGudoHFsxmiezZREyVkrPYBBij3u9SNaxLWipOOPy5S+5pJcZA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 4 Aug 2023 18:42:23 -0700
Message-ID: <CAJuCfpE6K6x7EKAr2rtW1Gn+1oht6w2qZSZ2bGATfoe8C8fJhA@mail.gmail.com>
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

On Fri, Aug 4, 2023 at 6:06=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> wr=
ote:
>
> On 8/5/23, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > On Fri, 4 Aug 2023 at 16:25, Mateusz Guzik <mjguzik@gmail.com> wrote:
> >>
> >> I know of these guys, I think they are excluded as is -- they go
> >> through access_remote_vm, starting with:
> >>         if (mmap_read_lock_killable(mm))
> >>                 return 0;
> >>
> >> while dup_mmap already write locks the parent's mm.
> >
> > Oh, you're only worried about vma_start_write()?
> >
> > That's a non-issue. It doesn't take the lock normally, since it starts =
off
> > with
> >
> >         if (__is_vma_write_locked(vma, &mm_lock_seq))
> >                 return;
> >
> > which catches on the lock sequence number already being set.
> >
> > So no extra locking there.
> >
> > Well, technically there's extra locking because the code stupidly
> > doesn't initialize new vma allocations to the right sequence number,
> > but that was talked about here:
> >
> >
> > https://lore.kernel.org/all/CAHk-=3DwiCrWAoEesBuoGoqqufvesicbGp3cX0LyKg=
EvsFaZNpDA@mail.gmail.com/
> >
> > and it's a separate issue.
> >
>
> I'm going to bet one beer this is the issue.
>
> The patch I'm responding to only consists of adding the call to
> vma_start_write and claims the 5% slowdown from it, while fixing
> crashes if the forking process is multithreaded.
>
> For the fix to work it has to lock something against the parent.
>
>         VMA_ITERATOR(old_vmi, oldmm, 0);
> [..]
>         for_each_vma(old_vmi, mpnt) {
> [..]
>                 vma_start_write(mpnt);
>
> the added line locks an obj in the parent's vm space.
>
> The problem you linked looks like pessimization for freshly allocated
> vmas, but that's what is being operated on here.

Sorry, now I'm having trouble understanding the problem you are
describing. We are locking the parent's vma before copying it and the
newly created vma is locked before it's added into the vma tree. What
is the problem then?

>
> --
> Mateusz Guzik <mjguzik gmail.com>
