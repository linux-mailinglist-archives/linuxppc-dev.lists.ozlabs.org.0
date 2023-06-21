Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FE073933D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 01:51:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HZDteg5s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmgJK0P4cz3bl3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 09:51:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HZDteg5s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmgHD5WMvz30f7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 09:50:32 +1000 (AEST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-519608ddbf7so6739193a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 16:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687391425; x=1689983425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhYNZ0vxtpjuX5s0wcMa09N91qzj3byTq4ke4NqIBlc=;
        b=HZDteg5s2Vpl4Dj3x2y2xDB5nI/Qbe7Mj8TIWbglj/Afe2Df8ThS6myu4ctAr7BySI
         lN6IEuMEfPC2jekn2PiCOzacJ5o3hhPY0TVfjYc90WW++TO4fcWk3jVeIIqDxZW+Ag+v
         3gWB4WdyMMmHkHwc3FuCxBT4mKHgXUkDjtvgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687391425; x=1689983425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NhYNZ0vxtpjuX5s0wcMa09N91qzj3byTq4ke4NqIBlc=;
        b=a6Ti6umziG21TBLAyKnNXcMVr1SFUtPeqFiUrGZzwIrDX1pBC7dVme0k0qjqVGQfDx
         UMP3yeKmwBGyzdbWE+l5APeIZZpunQ6UmYG9A5YNpTS0ndjFx9uNA7xaEBXX5Res4RYg
         wXowTkZetYuH7wd59AKhcS5grxCn5d9vCs/jwq3FAKgl15pD/zEXGusyvnEcqs86gl15
         Mjsd26jSn5l1W478eM1rYcy2RrfiKnuJlrGHfP6nV5klinEDRvcqUeYsc3Tx6SxU43GQ
         I6Q4OECk3MrlsDPoR9N8kpnUwj6d8POvKj5d4IM32uh6XNs6crj9sTwzLbMvrYzUW0L3
         vAsw==
X-Gm-Message-State: AC+VfDxfPQAL7QCSL7NRJgNtshnK+Pbr+k259fWTP5uEM9XHtA8Apfn0
	vMXhgzP+dgume0COJSxD/9b5s4aJKqJuQVqgpt7ocalZ
X-Google-Smtp-Source: ACHHUZ7V+ny47tbGKzdmKESVV3YwYXalGUX9SOXekLBVVuGqLuA4RJ4JhKuQAHt1TrAtPtz/O+35yQ==
X-Received: by 2002:aa7:dcd2:0:b0:51a:5af9:36f6 with SMTP id w18-20020aa7dcd2000000b0051a5af936f6mr6350686edu.29.1687391425317;
        Wed, 21 Jun 2023 16:50:25 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id w20-20020aa7d294000000b005182edf2a52sm3237675edq.30.2023.06.21.16.50.24
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 16:50:25 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51bcf75c4acso3050a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 16:50:24 -0700 (PDT)
X-Received: by 2002:a50:c35e:0:b0:519:7d2:e256 with SMTP id
 q30-20020a50c35e000000b0051907d2e256mr4978edb.0.1687391424164; Wed, 21 Jun
 2023 16:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230616150618.6073-1-pmladek@suse.com> <20230616150618.6073-7-pmladek@suse.com>
 <871qi5otdh.fsf@mail.lhotse>
In-Reply-To: <871qi5otdh.fsf@mail.lhotse>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 21 Jun 2023 16:50:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XgC0JkjMZjx0z-gt0iXp-UJr87nutB9xWKhB6qMzWWNg@mail.gmail.com>
Message-ID: <CAD=FV=XgC0JkjMZjx0z-gt0iXp-UJr87nutB9xWKhB6qMzWWNg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] watchdog/hardlockup: Define HARDLOCKUP_DETECTOR_ARCH
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Petr Mladek <pmladek@suse.com>, kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Wed, Jun 21, 2023 at 6:08=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> Petr Mladek <pmladek@suse.com> writes:
> > The HAVE_ prefix means that the code could be enabled. Add another
> > variable for HAVE_HARDLOCKUP_DETECTOR_ARCH without this prefix.
> > It will be set when it should be built. It will make it compatible
> > with the other hardlockup detectors.
> >
> > The change allows to clean up dependencies of PPC_WATCHDOG
> > and HAVE_HARDLOCKUP_DETECTOR_PERF definitions for powerpc.
> >
> > As a result HAVE_HARDLOCKUP_DETECTOR_PERF has the same dependencies
> > on arm, x86, powerpc architectures.
> >
> > Signed-off-by: Petr Mladek <pmladek@suse.com>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >  arch/powerpc/Kconfig | 5 ++---
> >  include/linux/nmi.h  | 2 +-
> >  lib/Kconfig.debug    | 9 +++++++++
> >  3 files changed, 12 insertions(+), 4 deletions(-)
>
> Something in this patch is breaking the powerpc g5_defconfig, I don't
> immediately see what though.
>
> ../arch/powerpc/kernel/stacktrace.c: In function =E2=80=98handle_backtrac=
e_ipi=E2=80=99:
> ../arch/powerpc/kernel/stacktrace.c:171:9: error: implicit declaration of=
 function =E2=80=98nmi_cpu_backtrace=E2=80=99 [-Werror=3Dimplicit-function-=
declaration]
>   171 |         nmi_cpu_backtrace(regs);
>       |         ^~~~~~~~~~~~~~~~~
> ../arch/powerpc/kernel/stacktrace.c: In function =E2=80=98arch_trigger_cp=
umask_backtrace=E2=80=99:
> ../arch/powerpc/kernel/stacktrace.c:226:9: error: implicit declaration of=
 function =E2=80=98nmi_trigger_cpumask_backtrace=E2=80=99; did you mean =E2=
=80=98arch_trigger_cpumask_backtrace=E2=80=99? [-Werror=3Dimplicit-function=
-declaration]
>   226 |         nmi_trigger_cpumask_backtrace(mask, exclude_self, raise_b=
acktrace_ipi);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |         arch_trigger_cpumask_backtrace
> cc1: all warnings being treated as errors

Yeah, I can reproduce that.

The problem is that before ${SUBJECT} patch "include/linux/nmi.h"
would include <asm/nmi.h>. Now it won't.

There are a ton of different ways to fix this, but I think the one
that makes sense is to be consistent with other architectures and move
the "arch_trigger_cpumask_backtrace" definitions to asm/irq.h.

https://lore.kernel.org/r/20230621164809.1.Ice67126857506712559078e7de26d32=
d26e64631@changeid

-Doug
