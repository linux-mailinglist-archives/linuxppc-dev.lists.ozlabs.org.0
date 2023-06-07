Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A3572732A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 01:38:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qc3h15zXTz3f17
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 09:38:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fhWGMDaM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fhWGMDaM;
	dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qc3fj6Mvhz3f05
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 09:37:33 +1000 (AEST)
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-77865f63473so146358739f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 16:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686181048; x=1688773048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKF2b8Vjs6mvxh6WU02Nj8q7SFKUM+Iw8gQlZJ28woQ=;
        b=fhWGMDaMcVfg40OW9dlJoBQPcu4wgXrQXZ/8qAicOyMvkmiIiS56CF+cMXPQJ6zypg
         ajcitPXuiKED5i7ZsXKvGUM1A/vIE/51yw7R7J1xOEdVLv+z1dZxZKpqiUT32kQc7ZkV
         7ytXy/MYcaLgy4TyhBRbZTwEuSPkuSQva1qjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686181048; x=1688773048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKF2b8Vjs6mvxh6WU02Nj8q7SFKUM+Iw8gQlZJ28woQ=;
        b=Vwep+qbW6sGnfDaNGMVbmC/BMibVCzrHgs6uFv2aypL13MGmPtJYrgkiKUKGFiDVO7
         x2gTX4PNXRWwwrAk2aSmKZ4CFdwEwMD7MTs8xMEShCbRx8VPa/FA/TEni3iPeNdY3iRf
         7r9KzlzVeYT/Sn1cfViTsbz2epBPCq2g4rdfjylUOZWa/dF3hYAOL2sov9HY5gGv1f+w
         /syS2stXzVB1xQkmYNH1kQYnMTzX5lMt3hGjovUeVpB1C9K+BhSYWWHaie2u3eqwI2sc
         cg3thzeq/iUmdgT9GkhxSR5VSwbwmRGEKv5GgnK4YxyR4JA5MG5GFwvaTFtZHJaugHjr
         N89Q==
X-Gm-Message-State: AC+VfDxdaVUEWk06jFpPjOpxuP0UUb1ckvMPLAeuj/elIMrls4A0s4jv
	ST69D/46p+thkYMzHc5oofabNDc55C1e51Y0VMw=
X-Google-Smtp-Source: ACHHUZ7F/fWDdFcwue4LqF6+JmqPJqvl4sNi8VPR7mCD7wgdiRLY8BKy3x+J/8e4TO3Ffd6Qt5A1xA==
X-Received: by 2002:a6b:6f15:0:b0:776:feaf:8cec with SMTP id k21-20020a6b6f15000000b00776feaf8cecmr7649780ioc.3.1686181048738;
        Wed, 07 Jun 2023 16:37:28 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com. [209.85.166.172])
        by smtp.gmail.com with ESMTPSA id h11-20020a056638062b00b0041d89b79fdasm3653837jar.20.2023.06.07.16.37.23
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 16:37:27 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-33d928a268eso54735ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 16:37:23 -0700 (PDT)
X-Received: by 2002:a92:cda5:0:b0:338:1993:1194 with SMTP id
 g5-20020a92cda5000000b0033819931194mr7952ild.2.1686181042584; Wed, 07 Jun
 2023 16:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230607152432.5435-1-pmladek@suse.com> <20230607152432.5435-8-pmladek@suse.com>
In-Reply-To: <20230607152432.5435-8-pmladek@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Jun 2023 16:37:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U8CTttqz9jL6TockdKTd1dM1ApR4Nw+X3OF5tgoagfRQ@mail.gmail.com>
Message-ID: <CAD=FV=U8CTttqz9jL6TockdKTd1dM1ApR4Nw+X3OF5tgoagfRQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] watchdog/hardlockup: Define HARDLOCKUP_DETECTOR_ARCH
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

On Wed, Jun 7, 2023 at 8:26=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrote=
:
>
> @@ -1102,6 +1103,14 @@ config HARDLOCKUP_DETECTOR_BUDDY
>         depends on !HAVE_HARDLOCKUP_DETECTOR_ARCH
>         select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
>
> +config HARDLOCKUP_DETECTOR_ARCH
> +       bool
> +       depends on HARDLOCKUP_DETECTOR
> +       depends on HAVE_HARDLOCKUP_DETECTOR_ARCH
> +       help
> +         The arch-specific implementation of the hardlockup detector is
> +         available.

nit: "is available" makes it sound a bit too much like a "have"
version. Maybe "The arch-specific implementation of the hardlockup
detector will be used" or something like that?

Otherise:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
