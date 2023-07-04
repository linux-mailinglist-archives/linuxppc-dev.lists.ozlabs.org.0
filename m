Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E073746AFD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 09:46:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=HPKJH25M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwFH53YQ1z30Kf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 17:46:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=HPKJH25M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwFGC0Pc2z30GJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 17:45:53 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-c5c03379a76so687406276.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jul 2023 00:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688456750; x=1691048750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+F1CRRrDYFWMSeR7pdIM99Yud7CZpQYBqF7uVLNYcg=;
        b=HPKJH25M1EtladfDNW1fzBqu0HKYUZT9duFKOwHMlqZbNtvot4sx/HWaKza4/APrSJ
         fhZIxULQUlVHZc0qAPaU5XCEDfNtPpliGzZWEyY7TOC39x9m1hB0BBv02seqlOP6Dpb/
         frDXuwpbMPhzkYA1BI9xA3Vy5sci7KmRZOYAWsoxREWH8ocXvI6umTvD50JcBHYTX/Cy
         ta+anyV2RqlDMDwYUKQz0tUjPQxiSsYIkoumRrYNLQAfhkBEsCmX/4FA4HX813DsevZD
         1pzjmqJzdfIjFQ+9fFVxBsSUm2sLwjtharaDDuc7tqdk684G/9ghQze/sFpqaa8Hct8m
         b2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688456750; x=1691048750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+F1CRRrDYFWMSeR7pdIM99Yud7CZpQYBqF7uVLNYcg=;
        b=HLgYzR+7VTRK1o9YfunFHNXoExBuzUdyHbytARsJaNgPl2zPLVwHGaSyu2jXSELlqo
         7LOkQzOfYEGpNgj9Pgn7pbBTGlenWuI2gUvMPNQfpazpBxz1FxDW7z/9jf3xbByiYMi5
         gpOfu9CMt7oPqJwnmAPXcHwJLGgIjOap0IY4/OzKLkl9TLkMXI41WPz4HgVtVgR5EZpg
         /dLNZI9Wvq+kZAP4TDQtVPCjexvCKp2LTHPoCWjM1vVf9Be/Kq0IynI4Arf+GHi5NKYD
         zYBAqpr2/704AQhEU9sGqo4UzeazUUbFF9heRk30R655tlm+/2sd4ivOQN4+JLbzgGe/
         B8pw==
X-Gm-Message-State: ABy/qLYfW/xIKEzQ46PhVGf++TM3RK1s75syFSgQCihxr5mph/ayhapT
	rnxvI2EwEP1BC55Evreg7ykmD/jdvlVqg33lFPFSsQ==
X-Google-Smtp-Source: APBJJlFB3IV/8P2hDxGLg3/Osf2gTqSZWsYYoe3obpZM5g9tCWa6WsCTJCL9aS6pmt3nVrW4MoqplfvdJ/D8m2Uvt4s=
X-Received: by 2002:a25:cc0c:0:b0:c4d:4f44:c50b with SMTP id
 l12-20020a25cc0c000000b00c4d4f44c50bmr7195756ybf.21.1688456750288; Tue, 04
 Jul 2023 00:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
 <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info> <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
 <CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com> <2023070359-evasive-regroup-f3b8@gregkh>
In-Reply-To: <2023070359-evasive-regroup-f3b8@gregkh>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 4 Jul 2023 00:45:39 -0700
Message-ID: <CAJuCfpF=XPpPYqp2Y1Vu-GUL=RBj4fyhXoXzjBY4EKtBnYE_eQ@mail.gmail.com>
Subject: Re: Fwd: Memory corruption in multithreaded user space program while
 calling fork
To: Greg KH <gregkh@linuxfoundation.org>
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
Cc: Jacob Young <jacobly.alt@gmail.com>, Linux regressions mailing list <regressions@lists.linux.dev>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Laurent Dufour <ldufour@linux.ibm.com>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 3, 2023 at 11:44=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Jul 03, 2023 at 11:27:19AM -0700, Suren Baghdasaryan wrote:
> > On Mon, Jul 3, 2023 at 11:08=E2=80=AFAM Suren Baghdasaryan <surenb@goog=
le.com> wrote:
> > >
> > > On Mon, Jul 3, 2023 at 2:53=E2=80=AFAM Linux regression tracking (Tho=
rsten
> > > Leemhuis) <regressions@leemhuis.info> wrote:
> > > >
> > > > On 02.07.23 14:27, Bagas Sanjaya wrote:
> > > > > I notice a regression report on Bugzilla [1]. Quoting from it:
> > > > >
> > > > >> After upgrading to kernel version 6.4.0 from 6.3.9, I noticed fr=
equent but random crashes in a user space program.  After a lot of reductio=
n, I have come up with the following reproducer program:
> > > > > [...]
> > > > >> After tuning the various parameters for my computer, exit code 2=
, which indicates that memory corruption was detected, occurs approximately=
 99% of the time.  Exit code 1, which occurs approximately 1% of the time, =
means it ran out of statically-allocated memory before reproducing the issu=
e, and increasing the memory usage any more only leads to diminishing retur=
ns.  There is also something like a 0.1% chance that it segfaults due to me=
mory corruption elsewhere than in the statically-allocated buffer.
> > > > >>
> > > > >> With this reproducer in hand, I was able to perform the followin=
g bisection:
> > > > > [...]
> > > > >
> > > > > See Bugzilla for the full thread.
> > > >
> > > > Additional details from
> > > > https://bugzilla.kernel.org/show_bug.cgi?id=3D217624#c5 :
> > > >
> > > > ```
> > > > I can confirm that v6.4 with 0bff0aaea03e2a3ed6bfa302155cca8a432a18=
29
> > > > reverted no longer causes any memory corruption with either my
> > > > reproducer or the original program.
> > > > ```
> > > >
> > > > FWIW: 0bff0aaea03 ("x86/mm: try VMA lock-based page fault handling
> > > > first") [merged for v6.4-rc1, authored by Suren Baghdasaryan [alrea=
dy CCed]]
> > > >
> > > > That's the same commit that causes build problems with go:
> > > >
> > > > https://lore.kernel.org/all/dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@ke=
rnel.org/
> > >
> > > Thanks! I'll investigate this later today. After discussing with
> > > Andrew, we would like to disable CONFIG_PER_VMA_LOCK by default until
> > > the issue is fixed. I'll post a patch shortly.
> >
> > Posted at: https://lore.kernel.org/all/20230703182150.2193578-1-surenb@=
google.com/
>
> As that change fixes something in 6.4, why not cc: stable on it as well?

Sorry, I thought since per-VMA locks were introduced in 6.4 and this
patch is fixing 6.4 I didn't need to send it to stable for older
versions. Did I miss something?
Thanks,
Suren.

>
> thanks,
>
> greg k-h
