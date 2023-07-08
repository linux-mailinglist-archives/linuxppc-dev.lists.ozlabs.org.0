Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE4074BF02
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 21:43:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=WyDa+IEt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qz0zq67Lpz3c22
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 05:43:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=WyDa+IEt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qz0yz08wCz30PH
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jul 2023 05:42:17 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-bff27026cb0so3652648276.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Jul 2023 12:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688845332; x=1691437332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4+Mach9lmHdREdY4lG7rnRYsyltEKjNy1tDSuyLngc=;
        b=WyDa+IEtTiffPeWHVWO2qzdkJXMbVkoixl5g2Oiio+Xc5RgmDl/+4NKv/Bms/JvY91
         Ea8FYlatqHWfN5yu11/zHTAxAEQMS3yy7iahdbV0GCIcaVA+gf9LiAKAeQJl3OcMd51r
         1sHYJ4js0rfpGcBpvE6TbF95yVUDE8B12gn2nYBCV3LxO1bZ5B6bFVYJ9LIRwvn2YVGL
         qJ5siqqNwKalWAOQEK/TzkYgb3k43V9HP4rK/RUwcPd6haOjOhjEl3ldtEF618o53U4p
         ZfrcJ/K1SLyM1hT/NDjfeoetYv67/RaGtibykxFbZwYrF+eQODkqklj9XH+mU6xkPTeU
         tAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688845332; x=1691437332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4+Mach9lmHdREdY4lG7rnRYsyltEKjNy1tDSuyLngc=;
        b=mG3ujol0iKBpgA3HpihbGNQpGFL4UPOwuuG1RpIFOA4p80xqAclZkZxllfykh7HjXE
         So9zfZuAh8sJ782oUc9ZTvv9RVtWRMVMJGl0Hx9XOl4K0ie8s6G3SSw73q0XGx98Py1i
         0/aFw9l2hHmiPvKf6I6xay5udYEiN+a5AH7tyWDbDkj1DEwcORIok91M6lwFhYVTbYr+
         yt4nzNt5wO48k/vCW5jQ8fEwWonyUbcLlat+rWSZLw8pF/hI/hf+LDS7BJi2vzv5H+kZ
         az06bPeXHpWk8CUaTzU5IPW+nhKer22p0cFBA/TeZ3yk+DwWjgOp9NLBlvDJnbV9aN7/
         OzkQ==
X-Gm-Message-State: ABy/qLbAU1nudK3oBVrGfd1fbZxpKTLGHu0d1gXQovjcyYKxEjOD1K3G
	AkfELyDgupNkeTbS2ZhrUbJfRQqV4BR4J5LN/29Adw==
X-Google-Smtp-Source: APBJJlEHZ+EH0adEDxcnlKd156qF4LQIYNxL5d/up1So8zPv6Qcmz7Vx+oucSWoCMFYT5ihbobbETD/Hx0H9XJC2ppM=
X-Received: by 2002:a25:7086:0:b0:b8f:5639:cb8a with SMTP id
 l128-20020a257086000000b00b8f5639cb8amr8776346ybc.9.1688845332211; Sat, 08
 Jul 2023 12:42:12 -0700 (PDT)
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
 <20230708103936.4f6655cd0d8e8a0478509e25@linux-foundation.org>
 <CAHk-=wh498i3s+BgOF=pUOF=Qe_A0A16-mFcH2YGy+iZXvNChQ@mail.gmail.com>
 <CAJuCfpFLc1yoZm9uqRcmcwtFNGHYKyjxrc71tzXennpGB7QbYQ@mail.gmail.com>
 <CAHk-=wi-99-DyMOGywTbjRnRRC+XfpPm=r=pei4A=MEL0QDBXA@mail.gmail.com>
 <CAJuCfpHszCAc5hDdsxry+1xh3kz+=jsYdBCXKQez-Th9LESSZA@mail.gmail.com> <CAHk-=wi=+qS+5v_7mVxKWUSOKaxzC2V8N7hyFVt1qTWGM_pmAQ@mail.gmail.com>
In-Reply-To: <CAHk-=wi=+qS+5v_7mVxKWUSOKaxzC2V8N7hyFVt1qTWGM_pmAQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 8 Jul 2023 12:41:58 -0700
Message-ID: <CAJuCfpF_J+wXzjFRSO_HrzyMft2j32enWKCX0iFGmH6DM7a-rw@mail.gmail.com>
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

On Sat, Jul 8, 2023 at 12:23=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, 8 Jul 2023 at 12:17, Suren Baghdasaryan <surenb@google.com> wrote=
:
> >
> > Do you want me to disable per-VMA locks by default as well?
>
> No. I seriously believe that if the per-vma locking is so broken that
> it needs to be disabled in a development kernel, we should just admit
> failure, and revert it all.
>
> And not in a "revert it for a later attempt" kind of way.
>
> So it would be a "revert it because it added insurmountable problems
> that we couldn't figure out" thing that implies *not* trying it again
> in that form at all, and much soul-searching before somebody decides
> that they have a more maintainable model for it all.

Got it. I hope that's not the case and so far we haven't received an
indication that the fixes were insufficient.

>
> If stable decides that the fixes are not back-portable, and the whole
> thing needs to be disabled for stable, that's one thing. But if we
> decide that in mainline, it's a "this was a failure" thing.

The patches applied cleanly to 6.4.y stable branch the last time I
checked, so should not be a problem.
Thanks,
Suren.

>
>            Linus
