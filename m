Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB73E74BEC4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 20:41:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Dou3PgTS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QyzcK5nZMz3c22
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 04:41:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Dou3PgTS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QyzbP65Q6z30Nn
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jul 2023 04:40:16 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-c5ce57836b8so3462265276.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 11:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688841613; x=1691433613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MymRbz3ieuUAdzwpPbldo2WgSB6COfwRJnDlIa6QBns=;
        b=Dou3PgTSSuwDMevLhKPDFQkjfTIwUERNti/exYtr8KC5Fr1uRk53y/2upEOgzQAuvB
         yQ6noYSvDpKjTlt1JX2ZzS5ZEb1qJiyf/0pTP/915p/o6pnYju0wBEOcJQcGl7Bb/i/S
         yLRdTHANtBBhE9R87ukPNuhnAWoo7h0BL8OBhnIKPxmiWmElUvKh26paGfvbt526UDU3
         PnuHlmFIDjcC5C4nQr1wzh8srbReVPgN1NtyPbTKt2bLyfTP2GIukl8xGa/zslYieyb+
         VW3PmV52yfQwr0XcWSNOw9gXT2/gnLsXKlRY9rzhUOZk69nShG7+uU898SnCjSXRU8Vk
         MUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688841613; x=1691433613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MymRbz3ieuUAdzwpPbldo2WgSB6COfwRJnDlIa6QBns=;
        b=hVXXUdpLj5o0nOmM4eDcgrHttuglRbjri7lzEc25uf70mLQ56K55DJ3vKjedVPbEyK
         GodwaCvBWstK5FMUlMy2vwuCX4Dlw7VNz2BfJzKehtbyhGVp6ZT2Dq/Bf2hDuUimfet3
         Akyb59DxUJmuFbGxIlH37VOqs5AkBsPvfFUHJ5+Vtz2GQcZUoSaNB14D+O+CkF+WPxQ3
         AB1VyREd/pXjSXhvi0LKgNvOxLIY1l81Rakv3Gt16+JtqwcVFFduXqAhX1tnOfexTJmf
         3B5mZkTnceLd9qlBnEiaW8annybgdzKjtX6C9fHr6mHN1334XLZxibLwhSl787d7+Hus
         pErA==
X-Gm-Message-State: ABy/qLbXwG6mtEhUj1xrmW82hN3rZrza/ehXDaPtxyF/71QcBf1+4B5O
	/azAyJae7IYJCpsJIRgH68ntu8qAw+s9PXDUp1dsDA==
X-Google-Smtp-Source: APBJJlE3w2AdZ9A5EaDN/VISkV40ZMSV3+Neg11bBy4VnYWxy1YfNqSmKLOubCHqPUg4as9gjsxMVt/0cyF/xZSuMqs=
X-Received: by 2002:a81:4ed4:0:b0:579:efbb:cbe3 with SMTP id
 c203-20020a814ed4000000b00579efbbcbe3mr7485642ywb.43.1688841612875; Sat, 08
 Jul 2023 11:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
 <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info> <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
 <CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com>
 <2023070359-evasive-regroup-f3b8@gregkh> <CAJuCfpF=XPpPYqp2Y1Vu-GUL=RBj4fyhXoXzjBY4EKtBnYE_eQ@mail.gmail.com>
 <2023070453-plod-swipe-cfbf@gregkh> <20230704091808.aa2ed3c11a5351d9bf217ac9@linux-foundation.org>
 <CAJuCfpE_WjRQoDT1XnvBghCH-kpqk+pfcBJGyDnK7DZLMVG5Mw@mail.gmail.com>
 <2023070509-undertow-pulverize-5adc@gregkh> <7668c45a-70b1-dc2f-d0f5-c0e76ec17145@leemhuis.info>
 <20230705084906.22eee41e6e72da588fce5a48@linux-foundation.org>
 <df1d7d39-56f3-699c-0d0f-fcc8774f182e@leemhuis.info> <CAHk-=whKd05V49AbZGF=inYmhU6H_yNvvw1grWyhQfQ=9+5-VQ@mail.gmail.com>
 <20230708103936.4f6655cd0d8e8a0478509e25@linux-foundation.org> <CAHk-=wh498i3s+BgOF=pUOF=Qe_A0A16-mFcH2YGy+iZXvNChQ@mail.gmail.com>
In-Reply-To: <CAHk-=wh498i3s+BgOF=pUOF=Qe_A0A16-mFcH2YGy+iZXvNChQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 8 Jul 2023 11:40:01 -0700
Message-ID: <CAJuCfpFLc1yoZm9uqRcmcwtFNGHYKyjxrc71tzXennpGB7QbYQ@mail.gmail.com>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
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
Cc: Jacob Young <jacobly.alt@gmail.com>, Linux regressions mailing list <regressions@lists.linux.dev>, Greg KH <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, Thorsten Leemhuis <regressions@leemhuis.info>, Bagas Sanjaya <bagasdotme@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Laurent Dufour <ldufour@linux.ibm.com>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 8, 2023 at 11:05=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, 8 Jul 2023 at 10:39, Andrew Morton <akpm@linux-foundation.org> wr=
ote:
> >
> > That was the v1 fix, but after some discussion
> > (https://lkml.kernel.org/r/20230705063711.2670599-1-surenb@google.com)
> > it was decided to take the "excessive" approach.
>
> That makes absolutely _zero_ sense.
>
> It seems to be complete voodoo programming.
>
> To some degree I don't care what happens in stable kernels, but
> there's no way we'll do that kind of thing in mainline without some
> logic or reason, when it makes no sense.
>
> flush_cache_dup_mm() is entirely irrelevant to the whole issue, for
> several reason, but the core one being that it only matters on broken
> virtually indexed caches, so none of the architectures that do per-vma
> locking.
>
> And the argument that "After the mmap_write_lock_killable(), there
> will still be a period where page faults can happen" may be true
> (that's kind of the *point* of per-vma locking), but it's irrelevant.
>
> It's true for *all* users of mmap_write_lock_killable, whether in fork
> or anywhere else. What makes fork() so magically special?
>
> It's why we have that vma_start_write(), to say "I'm now modifying
> *this* vma, so stop accessing it in parallel".
>
> Because no, flush_cache_dup_mm() is not the magical reason to do that thi=
ng.

My understanding was that flush_cache_dup_mm() is there to ensure
nothing is in the cache, so locking VMAs before doing that would
ensure that no page faults would pollute the caches after we flushed
them. Is that reasoning incorrect?

>
> Maybe there is something else going on, but no, we don't write crazy
> code without a reason for it. That's completely unmaintainable,
> because people will look at that code, not understand it (because
> there is nothing to understand) and be afraid to touch it. For no
> actual reason.
>
> The obvious place to say "I'm now starting to modify the vma" is when
> you actually start to modify the vma.
>
> > Also, this change needs a couple more updates:
>
> Those updates seem sane, and come with explanations of why they exist.
> Looks fine to me.
>
> Suren, please send me the proper fixes. Not the voodoo one. The ones
> you can explain.

Ok, I think these two are non-controversial:
https://lkml.kernel.org/r/20230707043211.3682710-1-surenb@google.com
https://lkml.kernel.org/r/20230707043211.3682710-2-surenb@google.com

and the question now is how we fix the fork() case:
https://lore.kernel.org/all/20230706011400.2949242-2-surenb@google.com/
(if my above explanation makes sense to you)
or
https://lore.kernel.org/all/20230705063711.2670599-2-surenb@google.com/

Please let me know which ones and I'll send you the patchset including
these patches.
Thanks,
Suren.

>
> And if stable wants to do something else, then that's fine. But for
> the development kernel,. we have two options:
>
>  - fix the PER_VMA_LOCK code
>
>  - decide that it's not worth it, and just revert it all
>
> and honestly, I'm ok with that second option, simply because this has
> all been way too much pain.
>
> But no, we don't mark it broken thinking we can't deal with it, or do
> random non-sensible code code we can't explain.
>
>             Linus
