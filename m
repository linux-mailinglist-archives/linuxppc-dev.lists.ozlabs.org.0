Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 960CC74BFFC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 01:24:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=KAr00s05;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qz5tm3WdNz3c22
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 09:24:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=KAr00s05;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qz5sr57P9z301Q
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jul 2023 09:23:11 +1000 (AEST)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-bdd069e96b5so3793102276.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 16:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688858588; x=1691450588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJmd9FNoExrkZazabhisTEX13e3yTkQujDR9ImsW+As=;
        b=KAr00s05g8LvJTb3B4MfRknnBcOsPzBA8MpmvEk9MyW2dsnWRJ+gR0zO8PseNnhyds
         6Mt9nJsN6mDK1Dh0NvAnhRCWzYZxHAhlfLQy9RHgQ4LNeE/wsu1rS7QDkdsSrHxffmbG
         LncoxcuQ5LD5OovH5vrPd/CfkojrHatihkBkTAqHapCmqs2qMs/IOwteAtH86tzhaWr+
         E8r1XVvTEXmScKTJlgEBa93UC+N33QJ1k4AhSrsn7Uk/wL8h6+7Vf6PuBvhB/DZSWdgZ
         jmFzygQ4Fr5KUeiYWIsHonmdkl7IWGEiCBU4SkTSiHEkZDV2rwxK3hTecpts0OknAuAS
         gqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688858588; x=1691450588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJmd9FNoExrkZazabhisTEX13e3yTkQujDR9ImsW+As=;
        b=fJpdZWcRUyB0Rp6fdz23R89cueVSqL4HYd8E79Vqwnv2XHn8w8xZxEyuJWY1yH8kKM
         sei/G4kDV5EsHVZECZArTl3g0uRf8iVNh2A6lDnDNB+mdg9ua81D43ute0UKSDfOUcP6
         cNLzrsePpUSD2Ebl6fWYNoIoKpLxjBp1td/eKONiFvdyvBH1lL9Y9HM/dK1QYVhLkiDg
         dD9VOcPnRwoKeaqlpNqtNSfcvc0v9f4s7Hqz1bhGLiOUvpep3PryDhobwu74N+x5RJEA
         WuwWzySxdwDa2/BUgClY2IkFxmz2qnbyt1A89yG0HVd4TikAyVJH2xdEdVHZf/TflKcE
         fa1w==
X-Gm-Message-State: ABy/qLYmHen1/4jvzrKcP65tIDSVmojiQj7curRZKuGugfcxKettjiiS
	KHhYibumyeeeXihtL1r8SyYyQemDpgpqi6C73QKYkxNBcIb+pmlo3k27zw==
X-Google-Smtp-Source: APBJJlHs1/S5FDnBZdy+MijP9fwBR6OMu6G+Y9QcTJ4N/KwfTKOEXMXKD5Sjy19yPHubJ4iO8EvZDNmedrlxShdDCY0=
X-Received: by 2002:a81:6d95:0:b0:56d:3f2:35a3 with SMTP id
 i143-20020a816d95000000b0056d03f235a3mr8095661ywc.44.1688858587953; Sat, 08
 Jul 2023 16:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <b5a5626-2684-899d-874b-801e7974b17@google.com> <CAJuCfpGXC23r11-0jz+an01tO2BUOMpjJ93Dm3pc+EUQM=BXYg@mail.gmail.com>
In-Reply-To: <CAJuCfpGXC23r11-0jz+an01tO2BUOMpjJ93Dm3pc+EUQM=BXYg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 8 Jul 2023 16:22:56 -0700
Message-ID: <CAJuCfpEyOXYh+dhW5iUFsz_s4P_pka9cD3M6qc8dDit5JxH3mw@mail.gmail.com>
Subject: Re: [PATCH] mm: lock newly mapped VMA with corrected ordering
To: Hugh Dickins <hughd@google.com>
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
Cc: jacobly.alt@gmail.com, regressions@lists.linux.dev, david@redhat.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org, peterx@redhat.com, regressions@leemhuis.info, liam.howlett@oracle.com, bagasdotme@gmail.com, gregkh@linuxfoundation.org, stable@vger.kernel.org, akpm@linux-foundation.org, ldufour@linux.ibm.com, Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 8, 2023 at 4:10=E2=80=AFPM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Sat, Jul 8, 2023 at 4:04=E2=80=AFPM Hugh Dickins <hughd@google.com> wr=
ote:
> >
> > Lockdep is certainly right to complain about
> > (&vma->vm_lock->lock){++++}-{3:3}, at: vma_start_write+0x2d/0x3f
> >                but task is already holding lock:
> > (&mapping->i_mmap_rwsem){+.+.}-{3:3}, at: mmap_region+0x4dc/0x6db
> > Invert those to the usual ordering.
>
> Doh! Thanks Hugh!
> I totally forgot to run this with lockdep enabled :(

I verified both the lockdep warning and the fix. Thanks again, Hugh!

Tested-by: Suren Baghdasaryan <surenb@google.com>

>
> >
> > Fixes: 33313a747e81 ("mm: lock newly mapped VMA which can be modified a=
fter it becomes visible")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Hugh Dickins <hughd@google.com>
> > ---
> >  mm/mmap.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 84c71431a527..3eda23c9ebe7 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -2809,11 +2809,11 @@ unsigned long mmap_region(struct file *file, un=
signed long addr,
> >         if (vma_iter_prealloc(&vmi))
> >                 goto close_and_free_vma;
> >
> > +       /* Lock the VMA since it is modified after insertion into VMA t=
ree */
> > +       vma_start_write(vma);
> >         if (vma->vm_file)
> >                 i_mmap_lock_write(vma->vm_file->f_mapping);
> >
> > -       /* Lock the VMA since it is modified after insertion into VMA t=
ree */
> > -       vma_start_write(vma);
> >         vma_iter_store(&vmi, vma);
> >         mm->map_count++;
> >         if (vma->vm_file) {
> > --
> > 2.35.3
