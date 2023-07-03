Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D1C7461D6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 20:09:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=35oM3+4s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qvv8K5SXdz3bw8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 04:09:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=35oM3+4s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qvv7R2VHXz3bPZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 04:08:50 +1000 (AEST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-576a9507a9bso67768877b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jul 2023 11:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688407725; x=1690999725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjP+t63cmXLZ73zOjZVRIKi8PaFjf6acXyVJzs/mz5o=;
        b=35oM3+4s76Gmu0eP07vWHgS6Rk1tmz7OxtUeUPJT2hC5YGbhWy3+elQhg6NwyPjOgC
         M5zGqi2lKBWN4PdxjaMCXIIyyVAmd+jOB8Cyi2Ra59jlhyS1r2WxTzJaGA+WlAFGKg7x
         UAN6LJSmzeDRQvjEALRuAl699XjFjFLbfZ4vVLR5K+3GGUenIRNYaJhyQ0g/oQuHu6jN
         7b7Io6rtkhGFBOyeFVv0UpwjuK3CM3KJZFW5M0FVXmWcD6eRcW0JbeDlDssgckP6Ht3O
         ygvptCGOnz2qiBH7Wb7KL+uCmr3fzfEIK0VI707ZQLPwzcjlupIU/DlzVVNDLPHuwFkt
         z/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688407725; x=1690999725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjP+t63cmXLZ73zOjZVRIKi8PaFjf6acXyVJzs/mz5o=;
        b=k9bvdUUm5deWmo3akbP44rI60n1V+cB+DdXO5IVMzgnJLGlKPrkdr9DcOt1JwZDovP
         ej6tgj38IFD1pxs3GhWj+J2q/wZMNk9dqG0jUkRfZy4COhoOf5c947UbjgxTm3McsZtH
         9j1ONi0dX0W5ZVyjLnpqklWQJcnneMnL7oRNYIInonPzeNvPMi4qOrzB2UrofvRLpx8t
         uQYa/DEmrFi6Kw1sb0ROpdebvXWR6vuHBnhW5KDbI0YPQIpRha4Uih/KDIARUoIZwLG3
         fwxzU/D/F4CHpCSOm6GeUjm+SEcETqXY+2OMFZaQ6hTqNvo6tqXruD8aHD1ZKpCQg9nG
         eh6Q==
X-Gm-Message-State: ABy/qLYEy7Pki5KQXaLom4oQOobFK4MuUjav0/hVGnnu4/OpuCK6c/cL
	W8CXUvcH+CF9GxJb6s+an1esiiUbHNe2dWxVYCBzDA==
X-Google-Smtp-Source: APBJJlHqFAXrJx6IysDJ2T6WOUSv+vPO3CrUXTDQ+klQimcwHP1PCpSvjaq7m7khAiRcDXbb9/iNwUyOESsL1qgRn9o=
X-Received: by 2002:a25:1003:0:b0:c3a:8530:c8a9 with SMTP id
 3-20020a251003000000b00c3a8530c8a9mr12592615ybq.11.1688407724626; Mon, 03 Jul
 2023 11:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com> <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info>
In-Reply-To: <5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 3 Jul 2023 11:08:33 -0700
Message-ID: <CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
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

On Mon, Jul 3, 2023 at 2:53=E2=80=AFAM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 02.07.23 14:27, Bagas Sanjaya wrote:
> > I notice a regression report on Bugzilla [1]. Quoting from it:
> >
> >> After upgrading to kernel version 6.4.0 from 6.3.9, I noticed frequent=
 but random crashes in a user space program.  After a lot of reduction, I h=
ave come up with the following reproducer program:
> > [...]
> >> After tuning the various parameters for my computer, exit code 2, whic=
h indicates that memory corruption was detected, occurs approximately 99% o=
f the time.  Exit code 1, which occurs approximately 1% of the time, means =
it ran out of statically-allocated memory before reproducing the issue, and=
 increasing the memory usage any more only leads to diminishing returns.  T=
here is also something like a 0.1% chance that it segfaults due to memory c=
orruption elsewhere than in the statically-allocated buffer.
> >>
> >> With this reproducer in hand, I was able to perform the following bise=
ction:
> > [...]
> >
> > See Bugzilla for the full thread.
>
> Additional details from
> https://bugzilla.kernel.org/show_bug.cgi?id=3D217624#c5 :
>
> ```
> I can confirm that v6.4 with 0bff0aaea03e2a3ed6bfa302155cca8a432a1829
> reverted no longer causes any memory corruption with either my
> reproducer or the original program.
> ```
>
> FWIW: 0bff0aaea03 ("x86/mm: try VMA lock-based page fault handling
> first") [merged for v6.4-rc1, authored by Suren Baghdasaryan [already CCe=
d]]
>
> That's the same commit that causes build problems with go:
>
> https://lore.kernel.org/all/dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel.o=
rg/

Thanks! I'll investigate this later today. After discussing with
Andrew, we would like to disable CONFIG_PER_VMA_LOCK by default until
the issue is fixed. I'll post a patch shortly.

>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> #regzbot introduced: 0bff0aaea03e2a3
