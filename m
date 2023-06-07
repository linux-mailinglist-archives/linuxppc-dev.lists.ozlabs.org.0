Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E534727310
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 01:35:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qc3cJ0CKlz3dy1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 09:35:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F6wdPzX5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F6wdPzX5;
	dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qc3bN0t3wz3c46
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 09:34:37 +1000 (AEST)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-77acb04309dso26911539f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 16:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686180874; x=1688772874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKEziAGkCW2jO8QMx9VTvzfLmO/bLdAIdfdMBgrtF0Q=;
        b=F6wdPzX5FUDEq0AnubAA0X0oRetMIiPWDnCmAd7XJ7qbkBXIQqOUAfDYB/XoT80xhV
         3geAQrbCc6Er52EjNMUsfbQc3ILUnH0//avnz8c5O+0MdNWqhWcsMkG8UX69MmVNxvFJ
         vkkbkVW1pnxPONFY6dZLVQpGAhXMjj2z4mswI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686180874; x=1688772874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKEziAGkCW2jO8QMx9VTvzfLmO/bLdAIdfdMBgrtF0Q=;
        b=i4LR3IIHlKB8zIXxErqmuMh4FpYApuKi0D1sa0S+jU2GbSLslJDyqpKnfDnlAZ7GeS
         l1940Hm94/kQhqLUD5W5QmXpWKc3719B+v7aRCs1d/Ct3QyxxOF/jero1laNnwq41rn6
         5DnL94rq/KTNFgLynvITVmWdYZnE/HFIy6cMxpYrgjw7pEt77L4ifgmdeinX9ISOEx6d
         KQpfo0G9uoiG+F0GGgYcy7Nbh2qGYAaKrCiWkaZSr6gr7joDOOnBfCVyepzB0PAyKwXS
         WmnTs4ydnFp6QxOqDWdke2vOx17pDIqCMMv4SpuViNUzG9M28KarKrccmr8PxmUJk/3A
         4wxg==
X-Gm-Message-State: AC+VfDwRZ855xouNrD6efv+hVyjjwN02R3bZiqx7ZKKhcCdBZoTpAz6/
	RxY9xd0wvJpqtF7WOtEjKRftXtX5B59x1i0GuHw=
X-Google-Smtp-Source: ACHHUZ7ot1WmI1oPmuhngSuvre1C7swqHResWPilv1avssFoTquN/QbZDdHw3nWKIFjoFCb+33/zMw==
X-Received: by 2002:a5e:dd03:0:b0:753:42d:25ec with SMTP id t3-20020a5edd03000000b00753042d25ecmr10470821iop.20.1686180873954;
        Wed, 07 Jun 2023 16:34:33 -0700 (PDT)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com. [209.85.166.169])
        by smtp.gmail.com with ESMTPSA id u3-20020a02cb83000000b0041e328a2084sm3193853jap.79.2023.06.07.16.34.33
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 16:34:33 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-33dea7d5424so25995ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 16:34:33 -0700 (PDT)
X-Received: by 2002:a92:c26d:0:b0:338:9f6a:d54a with SMTP id
 h13-20020a92c26d000000b003389f6ad54amr93121ild.24.1686180872621; Wed, 07 Jun
 2023 16:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230607152432.5435-1-pmladek@suse.com> <20230607152432.5435-2-pmladek@suse.com>
In-Reply-To: <20230607152432.5435-2-pmladek@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Jun 2023 16:34:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X4Sp=ZE4DWob-W0NzRm00K7wOWxyyCCaHUHNPPinsjhg@mail.gmail.com>
Message-ID: <CAD=FV=X4Sp=ZE4DWob-W0NzRm00K7wOWxyyCCaHUHNPPinsjhg@mail.gmail.com>
Subject: Re: [PATCH 1/7] watchdog/hardlockup: Sort hardlockup detector related
 config values a logical way
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
> Only one hardlockup detector can be compiled in. The selection is done
> using quite complex dependencies between several CONFIG variables.
> The following patches will try to make it more straightforward.
>
> As a first step, reorder the definitions of the various CONFIG variables.
> The logical order is:
>
>    1. HAVE_* variables define available variants. They are typically
>       defined in the arch/ config files.
>
>    2. HARDLOCKUP_DETECTOR y/n variable defines whether the hardlockup
>       detector is enabled at all.
>
>    3. HARDLOCKUP_DETECTOR_PREFER_BUDDY y/n variable defines whether
>       the buddy detector should be preferred over the perf one.
>       Note that the arch specific variants are always preferred when
>       available.
>
>    4. HARDLOCKUP_DETECTOR_PERF/BUDDY variables define whether the given
>       detector is enabled in the end.
>
>    5. HAVE_HARDLOCKUP_DETECTOR_NON_ARCH and HARDLOCKUP_DETECTOR_NON_ARCH
>       are temporary variables that are going to be removed in
>       a followup patch.
>
> The patch just shuffles the definitions. It should not change the existin=
g
> behavior.
>
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> ---
>  lib/Kconfig.debug | 112 +++++++++++++++++++++++-----------------------
>  1 file changed, 56 insertions(+), 56 deletions(-)

I don't really have any strong opinions, so I'm fine with this. In
general I think the ordering I picked tried to match the existing
"style" which generally tried to list configs and then select them
below. To me the existing style makes more sense when thinking about
writing C code without having to put a pile of prototypes at the top
of your file: you define things higher in the file and reference them
below. For instance, the old style (before any of my patches) had:

config SOFTLOCKUP_DETECTOR:
  ... blah blah blah ...

config HARDLOCKUP_DETECTOR_PERF:
  select SOFTLOCKUP_DETECTOR

config HARDLOCKUP_DETECTOR:
  ... blah blah blah ...
  select LOCKUP_DETECTOR
  select HARDLOCKUP_DETECTOR_PERF if HAVE_HARDLOCKUP_DETECTOR_PERF

Your new style seems to be the opposite of that.

-Doug
