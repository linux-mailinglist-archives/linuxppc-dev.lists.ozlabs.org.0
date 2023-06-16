Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F3C73367E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 18:49:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mw9VZJyF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjQ9x4j7xz3c3K
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 02:49:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mw9VZJyF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjQ8V5J12z3bst
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 02:48:26 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b448470602so13248691fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 09:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686934100; x=1689526100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tr5g+LR86poa7vi9trOMIJcQmYHg1BLUYh+fDHbbZ4k=;
        b=mw9VZJyFnadMrJUUtmiTBfqkJU/ZTf8r+H20SF4OKP5jmUmk0shC7PyCCoQvHlFXtW
         DUfg5zFRKNRihsnMoC8brrxS4uD2pU9RaVEme7hDE0VA38JyrIIMVSR4n7/DOPZ21gFB
         4FZS2PtxAkQAjHNAt+j9faQzeEmssXiTCVYZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686934100; x=1689526100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tr5g+LR86poa7vi9trOMIJcQmYHg1BLUYh+fDHbbZ4k=;
        b=DMvKyaupqh8QHFHm1qpEqcFBu4DgSSWA9rZkUZdzZBA3lmIqX5GOfMkbsxmKuMn49c
         FezA8Z6xPG9SY7pfzZ0s6xEsLMkMpJSijf3+/JczAcuM1unzCwPWg1FHaMonhrN4xdvR
         rTq6ZyABAxNNc2DgcNDvFE8AsBgtOp98dCn84j2lHsDwjfVsdyLtHMzWrCT8jAnNxLKx
         i/vvmV0GSUK4xm3Kxk//QyydLckVyRb1aUO73rbpEcNRgpW/0rkLFn5O9EqmpMzFMuVM
         LKZkHZYvvzAJALV5UU7KLea1LcOZJfO6wAmMt2WIdUtcyDOHKlnVxyJ4tj3JUA5ZpPhq
         Jhpg==
X-Gm-Message-State: AC+VfDwFkpTvGIqUJu2jn/Z9x8i/uC7F5MQKhIKZp5D86niejLhmfx91
	ir/mzviq9tsZMXe02lJaHeKHruOeY0g3lxtK7SQBAbcL
X-Google-Smtp-Source: ACHHUZ5um9KHvXi/p2339gM8Wd0AcdXK1gPjDNY7YB+r2o23kDujJFGmw3CBD9LG/PHFSmZzwvR9Tw==
X-Received: by 2002:a2e:b0ef:0:b0:2b1:b747:fad6 with SMTP id h15-20020a2eb0ef000000b002b1b747fad6mr2247859ljl.39.1686934100481;
        Fri, 16 Jun 2023 09:48:20 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id g25-20020a50ee19000000b0050bfeb15049sm9971277eds.60.2023.06.16.09.48.19
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 09:48:19 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-513ea2990b8so188a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 09:48:19 -0700 (PDT)
X-Received: by 2002:a50:999d:0:b0:516:6453:1b76 with SMTP id
 m29-20020a50999d000000b0051664531b76mr240103edb.5.1686934098700; Fri, 16 Jun
 2023 09:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230616150618.6073-1-pmladek@suse.com> <20230616150618.6073-5-pmladek@suse.com>
In-Reply-To: <20230616150618.6073-5-pmladek@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 16 Jun 2023 09:48:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U=ox4ApMbDL7v=ivNF6x=UyG=dd4MU_Dt0rppNCEwCpw@mail.gmail.com>
Message-ID: <CAD=FV=U=ox4ApMbDL7v=ivNF6x=UyG=dd4MU_Dt0rppNCEwCpw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] watchdog/hardlockup: Make HAVE_NMI_WATCHDOG sparc64-specific
To: Petr Mladek <pmladek@suse.com>
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Fri, Jun 16, 2023 at 8:07=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> There are several hardlockup detector implementations and several Kconfig
> values which allow selection and build of the preferred one.
>
> CONFIG_HARDLOCKUP_DETECTOR was introduced by the commit 23637d477c1f53acb
> ("lockup_detector: Introduce CONFIG_HARDLOCKUP_DETECTOR") in v2.6.36.
> It was a preparation step for introducing the new generic perf hardlockup
> detector.
>
> The existing arch-specific variants did not support the to-be-created
> generic build configurations, sysctl interface, etc. This distinction
> was made explicit by the commit 4a7863cc2eb5f98 ("x86, nmi_watchdog:
> Remove ARCH_HAS_NMI_WATCHDOG and rely on CONFIG_HARDLOCKUP_DETECTOR")
> in v2.6.38.
>
> CONFIG_HAVE_NMI_WATCHDOG was introduced by the commit d314d74c695f967e105
> ("nmi watchdog: do not use cpp symbol in Kconfig") in v3.4-rc1. It replac=
ed
> the above mentioned ARCH_HAS_NMI_WATCHDOG. At that time, it was still use=
d
> by three architectures, namely blackfin, mn10300, and sparc.
>
> The support for blackfin and mn10300 architectures has been completely
> dropped some time ago. And sparc is the only architecture with the histor=
ic
> NMI watchdog at the moment.
>
> And the old sparc implementation is really special. It is always built on
> sparc64. It used to be always enabled until the commit 7a5c8b57cec93196b
> ("sparc: implement watchdog_nmi_enable and watchdog_nmi_disable") added
> in v4.10-rc1.
>
> There are only few locations where the sparc64 NMI watchdog interacts
> with the generic hardlockup detectors code:
>
>   + implements arch_touch_nmi_watchdog() which is called from the generic
>     touch_nmi_watchdog()
>
>   + implements watchdog_hardlockup_enable()/disable() to support
>     /proc/sys/kernel/nmi_watchdog
>
>   + is always preferred over other generic watchdogs, see
>     CONFIG_HARDLOCKUP_DETECTOR
>
>   + includes asm/nmi.h into linux/nmi.h because some sparc-specific
>     functions are needed in sparc-specific code which includes
>     only linux/nmi.h.
>
> The situation became more complicated after the commit 05a4a95279311c3
> ("kernel/watchdog: split up config options") and commit 2104180a53698df5
> ("powerpc/64s: implement arch-specific hardlockup watchdog") in v4.13-rc1=
.
> They introduced HAVE_HARDLOCKUP_DETECTOR_ARCH. It was used for powerpc
> specific hardlockup detector. It was compatible with the perf one
> regarding the general boot, sysctl, and programming interfaces.
>
> HAVE_HARDLOCKUP_DETECTOR_ARCH was defined as a superset of
> HAVE_NMI_WATCHDOG. It made some sense because all arch-specific
> detectors had some common requirements, namely:
>
>   + implemented arch_touch_nmi_watchdog()
>   + included asm/nmi.h into linux/nmi.h
>   + defined the default value for /proc/sys/kernel/nmi_watchdog
>
> But it actually has made things pretty complicated when the generic
> buddy hardlockup detector was added. Before the generic perf detector
> was newer supported together with an arch-specific one. But the buddy
> detector could work on any SMP system. It means that an architecture
> could support both the arch-specific and buddy detector.
>
> As a result, there are few tricky dependencies. For example,
> CONFIG_HARDLOCKUP_DETECTOR depends on:
>
>   ((HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_BUDDY) && !=
HAVE_NMI_WATCHDOG) || HAVE_HARDLOCKUP_DETECTOR_ARCH
>
> The problem is that the very special sparc implementation is defined as:
>
>   HAVE_NMI_WATCHDOG && !HAVE_HARDLOCKUP_DETECTOR_ARCH
>
> Another problem is that the meaning of HAVE_NMI_WATCHDOG is far from clea=
r
> without reading understanding the history.
>
> Make the logic less tricky and more self-explanatory by making
> HAVE_NMI_WATCHDOG specific for the sparc64 implementation. And rename it =
to
> HAVE_HARDLOCKUP_DETECTOR_SPARC64.
>
> Note that HARDLOCKUP_DETECTOR_PREFER_BUDDY, HARDLOCKUP_DETECTOR_PERF,
> and HARDLOCKUP_DETECTOR_BUDDY may conflict only with
> HAVE_HARDLOCKUP_DETECTOR_ARCH. They depend on HARDLOCKUP_DETECTOR
> and it is not longer enabled when HAVE_NMI_WATCHDOG is set.
>
> Signed-off-by: Petr Mladek <pmladek@suse.com>
>
> watchdog/sparc64: Rename HAVE_NMI_WATCHDOG to HAVE_HARDLOCKUP_WATCHDOG_SP=
ARC64
>
> The configuration variable HAVE_NMI_WATCHDOG has a generic name but
> it is selected only for SPARC64.
>
> It should _not_ be used in general because it is not integrated with
> the other hardlockup detectors. Namely, it does not support the hardlocku=
p
> specific command line parameters and systcl interface. Instead, it is
> enabled/disabled together with the softlockup detector by the global
> "watchdog" sysctl.
>
> Rename it to HAVE_HARDLOCKUP_WATCHDOG_SPARC64 to make the special
> behavior more clear.
>
> Also the variable is set only on sparc64. Move the definition
> from arch/Kconfig to arch/sparc/Kconfig.debug.
>
> Signed-off-by: Petr Mladek <pmladek@suse.com>

I think you goofed up when squashing the patches. You've now got a
second patch subject after your first Signed-off-by and then a second
Signed-off-by... I assume everything after the first Signed-off-by
should be dropped?

Other than that:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
