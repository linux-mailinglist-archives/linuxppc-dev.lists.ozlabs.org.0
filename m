Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D0C74625D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 20:28:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=w1rSlYr2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvvYz1yr1z3c1Y
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 04:28:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=w1rSlYr2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvvY31sp8z2xwH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 04:27:34 +1000 (AEST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-57023c9be80so54417937b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jul 2023 11:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688408851; x=1691000851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0isKEjHX7MEXue9Pz1Ccur/ZC63GmueF0VlBtGm8EoI=;
        b=w1rSlYr2bJam65DS0lPRCw3JfxRfPJVIeGkLawuH0QVACpcv1cEbmN3yS/9d9Jhd2y
         gWuA/6yRdVojMzVcjWIoMQnCRFrBdHsUCri4YQmwmCGqvmVgnRUjcImEV42CF9p2HNUt
         RNIJjoJMpBM8Yqs72KNbG+Q7Vclm2QBRCgMhwvmKmKBAHfyzQgGK9V+bBOc5xngTKVY+
         R4t792TUWP12OJYQgjh6dTgC1nO4V6mOoZVzPzmVhbvkDRUxjx7H8hIFK+KllI/p1SSS
         NKySvyUZum+exg7sN4tpowuv7DwRGfJ+F1AbKfbFzZFthr0ez+mTc3XlVxhYkdNO0qgi
         O3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688408851; x=1691000851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0isKEjHX7MEXue9Pz1Ccur/ZC63GmueF0VlBtGm8EoI=;
        b=UdjiT3Yi2+efSerP2Dae8E0XC1I58me1zOl8aO+2hgPfrVfj3wmiLSRlLqcPIo3mhy
         HVIOlN2ck9Lo+v5bUX8nLnCAYuuQI3Ppsv/yvQfWzy2lyOk+3ReLhaBC9IhIc0BXJ6by
         uwFDhJCTJ4618Aar/FH/6TSISr2WI++tyxM0INt5QbmutEjv8deU17oVEvwJMpfCvaDm
         6y70QpBdH7eKzKEdM0HNjZ6pkEVKeQUCAHgWclqbZxBPmE/9+o4WVteWMz7i7zIfMy6D
         GiFUmIqQ+cGCQY7Zah6HtMl8gG/mry1/PZwuwG1x9iGkno0hlRZN1/F48n+XFUKz0HG/
         uwfA==
X-Gm-Message-State: ABy/qLZS+NTsBC9Dy/p3dXKGw1FzfXiUsO4b6i/TJGd9feyQ8mU5lYKq
	xcMZUTlJ5bVGCYH0I83erZrUu4NhBYHiKTBe3EqkPA==
X-Google-Smtp-Source: APBJJlEcsiSJampqWvnjg3CAmKUIwmDnEsqWjNRvFLw+nAO0EpYIPr1eboqaZF2mndFRhRVNL+SZzDgLqiS3KzAbWO4=
X-Received: by 2002:a05:6902:603:b0:c40:e589:7c09 with SMTP id
 d3-20020a056902060300b00c40e5897c09mr9113458ybt.26.1688408850615; Mon, 03 Jul
 2023 11:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
 <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info> <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
In-Reply-To: <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 3 Jul 2023 11:27:19 -0700
Message-ID: <CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
To: Linux regressions mailing list <regressions@lists.linux.dev>
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
Cc: Jacob Young <jacobly.alt@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Laurent Dufour <ldufour@linux.ibm.com>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 3, 2023 at 11:08=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Mon, Jul 3, 2023 at 2:53=E2=80=AFAM Linux regression tracking (Thorste=
n
> Leemhuis) <regressions@leemhuis.info> wrote:
> >
> > On 02.07.23 14:27, Bagas Sanjaya wrote:
> > > I notice a regression report on Bugzilla [1]. Quoting from it:
> > >
> > >> After upgrading to kernel version 6.4.0 from 6.3.9, I noticed freque=
nt but random crashes in a user space program.  After a lot of reduction, I=
 have come up with the following reproducer program:
> > > [...]
> > >> After tuning the various parameters for my computer, exit code 2, wh=
ich indicates that memory corruption was detected, occurs approximately 99%=
 of the time.  Exit code 1, which occurs approximately 1% of the time, mean=
s it ran out of statically-allocated memory before reproducing the issue, a=
nd increasing the memory usage any more only leads to diminishing returns. =
 There is also something like a 0.1% chance that it segfaults due to memory=
 corruption elsewhere than in the statically-allocated buffer.
> > >>
> > >> With this reproducer in hand, I was able to perform the following bi=
section:
> > > [...]
> > >
> > > See Bugzilla for the full thread.
> >
> > Additional details from
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D217624#c5 :
> >
> > ```
> > I can confirm that v6.4 with 0bff0aaea03e2a3ed6bfa302155cca8a432a1829
> > reverted no longer causes any memory corruption with either my
> > reproducer or the original program.
> > ```
> >
> > FWIW: 0bff0aaea03 ("x86/mm: try VMA lock-based page fault handling
> > first") [merged for v6.4-rc1, authored by Suren Baghdasaryan [already C=
Ced]]
> >
> > That's the same commit that causes build problems with go:
> >
> > https://lore.kernel.org/all/dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel=
.org/
>
> Thanks! I'll investigate this later today. After discussing with
> Andrew, we would like to disable CONFIG_PER_VMA_LOCK by default until
> the issue is fixed. I'll post a patch shortly.

Posted at: https://lore.kernel.org/all/20230703182150.2193578-1-surenb@goog=
le.com/

>
> >
> > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat=
)
> > --
> > Everything you wanna know about Linux kernel regression tracking:
> > https://linux-regtracking.leemhuis.info/about/#tldr
> > If I did something stupid, please tell me, as explained on that page.
> >
> > #regzbot introduced: 0bff0aaea03e2a3
