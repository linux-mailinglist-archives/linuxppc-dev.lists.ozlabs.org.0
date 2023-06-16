Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4558733678
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 18:48:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=c3D6kky0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjQ8y3vJTz3bvn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 02:48:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=c3D6kky0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjQ841zCnz301f
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 02:48:04 +1000 (AEST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51a3f911135so898312a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 09:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686934080; x=1689526080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e16upKjJABhKcoxJWL82G3CWyoX8UGnrl2PWs2fRuIo=;
        b=c3D6kky0yVlAnYbAD4t4CnCD+HrwBGJNQ7Dvmzl8dZlhDc+A7BFbwvNn+iaJcnf8eZ
         HOha8wWcTL10zrSb/jENBmBEDqfupvf9Dde43PF5VWKdQW5eni89Fl/wLMB2GkcZb7tz
         BuTTMv2HWRFvNRo0pTaIO/2occOvzreBOJO5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686934080; x=1689526080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e16upKjJABhKcoxJWL82G3CWyoX8UGnrl2PWs2fRuIo=;
        b=RiF2lR0q4YzVEC2xn410ooW0q8xuVLfb4l0e8GYgKv5KuOMwrzPfybLAidyhiRLntI
         mpD71UW8md2Mmq5zEwDVOMXEvQwXcGsHTe8vWamZbFulNMYhCbLZcLBekTJi4ZdvXYP5
         wXG5sR64I52OWWlJKeur53Rx2moTxZw4V/rWGp3nY76ZZ2vSI1KSbVl/NY6a4Zf/NXqC
         QKbTa6UDH83NcFlNwhosDes7ACb6L7ogyMIiTpCVKg+Jw9Lzv2b7YnYLIKjltROKFxw7
         OnwVicXXQcCXEOGkPRCSZTvERCKWqhQ2GHp9geDh48QQKr2eB1N2cbcwrJbvA8uFKzKZ
         o8FQ==
X-Gm-Message-State: AC+VfDx0gCl1jwX9MP188A81dSYLjI+OxVLRISx/IQCVHikheO4PGMDb
	u+m5F0Wf593ELiI10V58nMyaFTJYzbbDzUIQd6mgfUQb
X-Google-Smtp-Source: ACHHUZ4/lzyfrIpsJhDoUczzvfVVKaccU2fGxRA49l58A+zCxBvbKUxMfJyYiNZ/CrS9YNU5NUtD6w==
X-Received: by 2002:aa7:c706:0:b0:51a:3fc2:f60f with SMTP id i6-20020aa7c706000000b0051a3fc2f60fmr1038050edq.42.1686934080274;
        Fri, 16 Jun 2023 09:48:00 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id k17-20020a05640212d100b0051a4049b96csm477867edx.76.2023.06.16.09.47.59
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 09:47:59 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f7f7dfc037so3195e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 09:47:59 -0700 (PDT)
X-Received: by 2002:a05:600c:444e:b0:3f4:2736:b5eb with SMTP id
 v14-20020a05600c444e00b003f42736b5ebmr415495wmn.1.1686934079227; Fri, 16 Jun
 2023 09:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230616150618.6073-1-pmladek@suse.com> <20230616150618.6073-3-pmladek@suse.com>
In-Reply-To: <20230616150618.6073-3-pmladek@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 16 Jun 2023 09:47:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VPhpZyJO=U3NGy1RZbmAQS_xEoDs-K2HawJYb=UHaUww@mail.gmail.com>
Message-ID: <CAD=FV=VPhpZyJO=U3NGy1RZbmAQS_xEoDs-K2HawJYb=UHaUww@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] watchdog/hardlockup: Make the config checks more straightforward
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
> There are four possible variants of hardlockup detectors:
>
>   + buddy: available when SMP is set.
>
>   + perf: available when HAVE_HARDLOCKUP_DETECTOR_PERF is set.
>
>   + arch-specific: available when HAVE_HARDLOCKUP_DETECTOR_ARCH is set.
>
>   + sparc64 special variant: available when HAVE_NMI_WATCHDOG is set
>         and HAVE_HARDLOCKUP_DETECTOR_ARCH is not set.
>
> The check for the sparc64 variant is more complicated because
> HAVE_NMI_WATCHDOG is used to #ifdef code used by both arch-specific
> and sparc64 specific variant. Therefore it is automatically
> selected with HAVE_HARDLOCKUP_DETECTOR_ARCH.
>
> This complexity is partly hidden in HAVE_HARDLOCKUP_DETECTOR_NON_ARCH.
> It reduces the size of some checks but it makes them harder to follow.
>
> Finally, the other temporary variable HARDLOCKUP_DETECTOR_NON_ARCH
> is used to re-compute HARDLOCKUP_DETECTOR_PERF/BUDDY when the global
> HARDLOCKUP_DETECTOR switch is enabled/disabled.
>
> Make the logic more straightforward by the following changes:
>
>   + Better explain the role of HAVE_HARDLOCKUP_DETECTOR_ARCH and
>     HAVE_NMI_WATCHDOG in comments.
>
>   + Add HAVE_HARDLOCKUP_DETECTOR_BUDDY so that there is separate
>     HAVE_* for all four hardlockup detector variants.
>
>     Use it in the other conditions instead of SMP. It makes it
>     clear that it is about the buddy detector.
>
>   + Open code HAVE_HARDLOCKUP_DETECTOR_NON_ARCH in HARDLOCKUP_DETECTOR
>     and HARDLOCKUP_DETECTOR_PREFER_BUDDY. It helps to understand
>     the conditions between the four hardlockup detector variants.
>
>   + Define the exact conditions when HARDLOCKUP_DETECTOR_PERF/BUDDY
>     can be enabled. It explains the dependency on the other
>     hardlockup detector variants.
>
>     Also it allows to remove HARDLOCKUP_DETECTOR_NON_ARCH by using "imply=
".
>     It triggers re-evaluating HARDLOCKUP_DETECTOR_PERF/BUDDY when
>     the global HARDLOCKUP_DETECTOR switch is changed.
>
>   + Add dependency on HARDLOCKUP_DETECTOR so that the affected variables
>     disappear when the hardlockup detectors are disabled.
>
>     Another nice side effect is that HARDLOCKUP_DETECTOR_PREFER_BUDDY
>     value is not preserved when the global switch is disabled.
>     The user has to make the decision again when it gets re-enabled.
>
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> ---
>  arch/Kconfig      | 23 +++++++++++++-----
>  lib/Kconfig.debug | 62 +++++++++++++++++++++++++++--------------------
>  2 files changed, 53 insertions(+), 32 deletions(-)

While I'd still paint the bikeshed a different color and organize the
dependencies a little differently, as discussed in your v1 post, this
is still OK w/ me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
