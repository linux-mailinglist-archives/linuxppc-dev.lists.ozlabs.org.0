Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9DE72733C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 01:41:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qc3ll3S1kz3f5K
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 09:41:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MF3rcwps;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MF3rcwps;
	dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qc3kq5flsz2yyT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 09:41:06 +1000 (AEST)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-3f805551a19so54871cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 16:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686181262; x=1688773262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GavxFaHwlTnRx3gt9uObRrogsyEG4oEATw/XGEuAuMI=;
        b=MF3rcwps092kQdXF+gJCAw+MDvuPEGHWOXrUNjX8rWWcA3g5rF/5flgdBmwHIOwWl8
         vX64np8SLgujL2pdH6JL2UZSueG46m0uCKZRpzICyAq5axfAOmsKNsUPDHjl4ntJiLWL
         3VTfPlQBagdwJr2XHyiZnHVAquqOymSFNnSLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686181262; x=1688773262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GavxFaHwlTnRx3gt9uObRrogsyEG4oEATw/XGEuAuMI=;
        b=CFLX6+NV3VfuVO+pzftOGsJKVAiAAfZj7mbyOYpO3PpWebo1pNe/mrYJbuBJC34E3y
         v4vgGHskR5o3+GWGj2TwpdQz3FJSvVw7Evj7kdz9ykA1ZEDJfYKfL6O7dSVTwHn54b8+
         9YAhwqFMm1fApdUYRmKnK8izFaFLJdhG7aSY33Gc+FkKDnZDaSZYXOPo5n87Rf6/GQm1
         Tnux4pp7m/D2FY0ZMyLy5rHlI6mmIDyuMIevxFymLDuhEUR7ykrk4a4e7Z3/J8Blp8wA
         C83fPzHS2NzFKDCRWohrjkWWeKK1ZAmTDsiRVuO0PsKCRWmu+8+DWFiLCwgptpJNz1/p
         rYhw==
X-Gm-Message-State: AC+VfDyS2CzOMpFl6uY7Doy6/dlABR2LmUVhxSsSNTODET+cHyymCkAT
	6SceW2zmaygzXi5wQ+TRbbw0ViVjRZ7naEZPSAg=
X-Google-Smtp-Source: ACHHUZ44xVCqQqisnydZ1iLw6T8cZSl2JRpuSa5dK7LLcGd91AJl8KazqU7KYnXN0DdNep5vR34yLg==
X-Received: by 2002:a05:622a:58a:b0:3f8:6bdc:3cb with SMTP id c10-20020a05622a058a00b003f86bdc03cbmr4653343qtb.17.1686181262628;
        Wed, 07 Jun 2023 16:41:02 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id o24-20020ac86998000000b003f6b58b986fsm288652qtq.41.2023.06.07.16.41.02
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 16:41:02 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-3f9c60bc99cso135321cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 16:41:02 -0700 (PDT)
X-Received: by 2002:a5e:a611:0:b0:777:aa56:f5e9 with SMTP id
 q17-20020a5ea611000000b00777aa56f5e9mr11095206ioi.16.1686180931677; Wed, 07
 Jun 2023 16:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230607152432.5435-1-pmladek@suse.com> <20230607152432.5435-4-pmladek@suse.com>
In-Reply-To: <20230607152432.5435-4-pmladek@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Jun 2023 16:35:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XvUAeKFAcOD_xaT2to45=CCiKJMRbi-uxgrZ4mWN7hZg@mail.gmail.com>
Message-ID: <CAD=FV=XvUAeKFAcOD_xaT2to45=CCiKJMRbi-uxgrZ4mWN7hZg@mail.gmail.com>
Subject: Re: [PATCH 3/7] watchdog/hardlockup: Declare arch_touch_nmi_watchdog()
 only in linux/nmi.h
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

On Wed, Jun 7, 2023 at 8:25=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrote=
:
>
> arch_touch_nmi_watchdog() needs a different implementation for various
> hardlockup detector implementations. And it does nothing when
> any hardlockup detector is not build at all.

s/build/built/


> arch_touch_nmi_watchdog() has to be declared in linux/nmi.h. It is done
> directly in this header file for the perf and buddy detectors. And it
> is done in the included asm/linux.h for arch specific detectors.
>
> The reason probably is that the arch specific variants build the code
> using another conditions. For example, powerpc64/sparc64 builds the code
> when CONFIG_PPC_WATCHDOG is enabled.
>
> Another reason might be that these architectures define more functions
> in asm/nmi.h anyway.
>
> However the generic code actually knows the information. The config
> variables HAVE_NMI_WATCHDOG and HAVE_HARDLOCKUP_DETECTOR_ARCH are used
> to decide whether to build the buddy detector.
>
> In particular, CONFIG_HARDLOCKUP_DETECTOR is set only when a generic
> or arch-specific hardlockup detector is built. The only exception
> is sparc64 which ignores the global HARDLOCKUP_DETECTOR switch.
>
> The information about sparc64 is a bit complicated. The hardlockup
> detector is built there when CONFIG_HAVE_NMI_WATCHDOG is set and
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH is not set.
>
> People might wonder whether this change really makes things easier.
> The motivation is:
>
>   + The current logic in linux/nmi.h is far from obvious.
>     For example, arch_touch_nmi_watchdog() is defined as {} when
>     neither CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER nor
>     CONFIG_HAVE_NMI_WATCHDOG is defined.
>
>   + The change synchronizes the checks in lib/Kconfig.debug and
>     in the generic code.
>
>   + It is a step that will help cleaning HAVE_NMI_WATCHDOG related
>     checks.
>
> The change should not change the existing behavior.
>
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> ---
>  arch/powerpc/include/asm/nmi.h |  2 --
>  arch/sparc/include/asm/nmi.h   |  1 -
>  include/linux/nmi.h            | 13 ++++++++++---
>  3 files changed, 10 insertions(+), 6 deletions(-)

This looks right and is a nice cleanup.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
