Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8AB727321
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 01:37:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qc3g43J4Fz3f0r
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 09:37:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=D4RIBPm7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=D4RIBPm7;
	dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qc3fB6THWz3c46
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 09:37:06 +1000 (AEST)
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-777a4c8e8f4so267728339f.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 16:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686181023; x=1688773023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HG+ft0QEOw+l4T57sY6QqoB2Q4VLY5mgSyLH0/dKkXM=;
        b=D4RIBPm75r1LHooDIGafpzSRDmUOXXIn1VbeR/MnYdxOtyE5C02jly9JYQVLZHOGZE
         21v4E9z6SjLWZ3hC7k0u9EV2n5okj4l46YKqq2oCJOb6Y7yWkFJO4VHau1puOgJdczIl
         Cr787SuF0j61zGI1Zjbwn61U7gY2V8mJoYISM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686181023; x=1688773023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HG+ft0QEOw+l4T57sY6QqoB2Q4VLY5mgSyLH0/dKkXM=;
        b=Xswk6wa6LW1Z9nOHaSHTV7wwN0Dg8IR9+AnoX6BxqEtIZApKtJNFpg+iTKnx3TKmdZ
         HJlfiUsB+TKxKcuPYIlGDwx5hpAfbOHU27xMgjK/Wa1Z3ngDxWp9RBx7YKWjdcc6ZyQL
         rpytwmn0hmllI39iAySqaxxMAfrGhAOdUqQ6dqfnoGcciCENCvovv3LYBbyMXiR2f1Hf
         MWWuydLibIhKtoMUxk7V7N4YzRbjXqwvIvk5Z91jLfbbuOUZpqJaxZhZMDolQSIWaytL
         63QTssycsD6xNbDwhMfTEnaHRhvDxIOQmbf1kns2f/tHlSj6gCWS9Kl3kUSlI6p0iYGt
         yoGg==
X-Gm-Message-State: AC+VfDyfi0uOIlc0KxpGO0jNHnqW4wLjqi5F94l96B1AMn3PXckoRIZc
	h9GQjQazKM0cUCVhwJt6t0dwXP+Cu2zmJe5vDbg=
X-Google-Smtp-Source: ACHHUZ7MOrCV7c4f3CTFvwFck9OyjRP7Xce9ve9D95wEK28hSQ+deCWcc0+V9A7gOZkgTojo2Y0LWA==
X-Received: by 2002:a5e:8c15:0:b0:763:5a8f:fe6 with SMTP id n21-20020a5e8c15000000b007635a8f0fe6mr9966932ioj.21.1686181022978;
        Wed, 07 Jun 2023 16:37:02 -0700 (PDT)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com. [209.85.166.175])
        by smtp.gmail.com with ESMTPSA id z25-20020a6b0a19000000b00760f256037dsm2305634ioi.44.2023.06.07.16.36.55
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 16:36:56 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-33b7f217dd0so56575ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 16:36:55 -0700 (PDT)
X-Received: by 2002:a05:6e02:1c4c:b0:33d:8238:80c6 with SMTP id
 d12-20020a056e021c4c00b0033d823880c6mr101962ilg.9.1686181015033; Wed, 07 Jun
 2023 16:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230607152432.5435-1-pmladek@suse.com> <20230607152432.5435-6-pmladek@suse.com>
In-Reply-To: <20230607152432.5435-6-pmladek@suse.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Jun 2023 16:36:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VTKR42i8hozXSfSHu07TQ7g1TJQs8dqpqGHHraZr+-vQ@mail.gmail.com>
Message-ID: <CAD=FV=VTKR42i8hozXSfSHu07TQ7g1TJQs8dqpqGHHraZr+-vQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] watchdog/sparc64: Rename HAVE_NMI_WATCHDOG to HAVE_HARDLOCKUP_WATCHDOG_SPARC64
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
> ---
>  arch/Kconfig             | 12 ------------
>  arch/sparc/Kconfig       |  2 +-
>  arch/sparc/Kconfig.debug | 12 ++++++++++++
>  include/linux/nmi.h      |  4 ++--
>  kernel/watchdog.c        |  2 +-
>  lib/Kconfig.debug        |  5 +----
>  6 files changed, 17 insertions(+), 20 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
