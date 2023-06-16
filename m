Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B46C6733657
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 18:45:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bz1iIp96;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjQ4r4RPDz3bnM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 02:45:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bz1iIp96;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjQ3t0T6Gz3blS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 02:44:23 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b1b72dc2feso12711901fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 09:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686933857; x=1689525857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlH6N4BeYWriIEzthku3f2s3TDY9tC006RTYxc81VbY=;
        b=bz1iIp96xQXCrdPPN1hyujnhMf848S2YhfwsQHAubyyP8S4VcRdPOeEMAl54hySGF1
         5rxRVGMmWvr3HsYz0a4us3OFm/8qW9QRsXp5f3ZxZRLONYf0V1dMcMYjMLRDswdEegtc
         VAKMJDrlC7yO1tdbKdm0+vZ0pZ+LRxcl3IiRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686933857; x=1689525857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RlH6N4BeYWriIEzthku3f2s3TDY9tC006RTYxc81VbY=;
        b=IVjI5+3vmZ7GEe/d2cn6GOFxHJKTFRC7IPw5X04t5hD4hBKRstzw+bsZ2bAXb6HOve
         ZB5hUSmMO1hewkKtpghVPVtzmtzhYJYxo4AJrkmV/Rwu01oVXOltjC+0QJXALzJn6c0c
         XHEwlEDgqQyw4V8O5bL2fXlF4EwGbkCS+0eirMm1fzdLgO8oroMIZbHNezJMt7Y4YLTy
         t+gXu1kmFCJOqJy0ZxnSlDVkipICtxGSWvEkWyU0COozEtpACLQCU08O50ufsNLTmWTD
         3xuFArP+gqWsHjvkwM5L+I9TgTAMvOelDKGhkDHwlpH1f2MRfxTu79hT75Un/MoY88fZ
         C/5g==
X-Gm-Message-State: AC+VfDxXuDC/lgF9etIzF0YyBrQD0RQ4ftdrygjlW2r31MiJl/V4vnJi
	EVwa5KqGgtyxs6dySJacJrb2AJD6d5jdPs3Wt8QQEyN5
X-Google-Smtp-Source: ACHHUZ6+SWUdstp6vuVHyE05BnsUZ3ItLpJgpBfQuurH75Rx2/ESE+vSgrVDy6LaROfE0kBgfJNjPA==
X-Received: by 2002:ac2:4d9b:0:b0:4f6:25cb:590e with SMTP id g27-20020ac24d9b000000b004f625cb590emr1682051lfe.6.1686933857460;
        Fri, 16 Jun 2023 09:44:17 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id u11-20020aa7d0cb000000b00514a97b6b80sm10223070edo.78.2023.06.16.09.44.15
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 09:44:15 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-516500163b2so9618a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 09:44:15 -0700 (PDT)
X-Received: by 2002:a50:bac3:0:b0:506:b280:4993 with SMTP id
 x61-20020a50bac3000000b00506b2804993mr233742ede.2.1686933854748; Fri, 16 Jun
 2023 09:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230616150618.6073-1-pmladek@suse.com> <20230616150618.6073-2-pmladek@suse.com>
In-Reply-To: <20230616150618.6073-2-pmladek@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 16 Jun 2023 09:44:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XUWnjCAjZKb5wYcGhC=T8+hoUr+1junoH5ognge1aZHg@mail.gmail.com>
Message-ID: <CAD=FV=XUWnjCAjZKb5wYcGhC=T8+hoUr+1junoH5ognge1aZHg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] watchdog/hardlockup: Sort hardlockup detector
 related config values a logical way
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

On Fri, Jun 16, 2023 at 8:06=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
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
> This is a preparation step for further cleanup. It will change the logic
> without shuffling the definitions.
>
> This change temporary breaks the C-like ordering where the variables are
> declared or defined before they are used. It is not really needed for
> Kconfig. Also the following patches will rework the logic so that
> the ordering will be C-like in the end.
>
> The patch just shuffles the definitions. It should not change the existin=
g
> behavior.
>
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> ---
>  lib/Kconfig.debug | 112 +++++++++++++++++++++++-----------------------
>  1 file changed, 56 insertions(+), 56 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
