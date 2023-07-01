Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AB2744A73
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jul 2023 18:10:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VO8EhLHD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QtcbP6rhsz3btm
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Jul 2023 02:10:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VO8EhLHD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QtcZD1lydz30f4
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Jul 2023 02:09:06 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so4714371e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Jul 2023 09:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688227738; x=1690819738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ng1EwQD5y0cvCYQ4WXImHX40YGNrjiR/qucwDkIAqw0=;
        b=VO8EhLHDwQ5jp0Tvre/Uo4THVMrjETEFn74e6K5XQw5SQbRTvfBGOZQQr0q+wH8pFx
         Z6b3qk9TZfRut3fA9aV2SS9+5h3R6VKtG00mMDOSvJg/6ApeW7KmVqP2LLDNSEXzK++4
         9xabhD8x97u/RlDc+uM9QjSEzYHZ0Q26K54zQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688227738; x=1690819738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ng1EwQD5y0cvCYQ4WXImHX40YGNrjiR/qucwDkIAqw0=;
        b=VGyxWC6KvXbL4f+yZsVJRfy5Ve+E3MxE2jj1rtk5i8GzS/9GDrjUwuWuGn4+OyQewm
         osRE/5KyXxPE5QJVrXltepjxrrPDukUvWQ0WaROIfuwSOzTTvMecnqsnR4vITrILlOfL
         3a8k0I9jjrkpay5BTgl2+gz5DP/cOrh2sebiKQHBDD//JSKYS0zlTZlzDZrm2kxqsP+I
         MNQoq309YcO1Oi/x2iszBXp3qHHMHgsBNYm1cN9fbTH005HgtGCD+lOZvevEqBqvFirl
         iT4yez6lwGEs0ktdt7rb/CaQ9EvuDl+DULCFvyWyYa3wwVYTiQXJQnghf/gYem4b35/l
         fW3Q==
X-Gm-Message-State: ABy/qLZ1ST9eH6+PM1Es8M9VAuirJ5ZTfqOEOzmumV46Q4YbGR2VK2OP
	29cWund5O+v78dbF9U2eJqQMaiW0G5C9nfEyq/NH7Xt0
X-Google-Smtp-Source: APBJJlHHbSzuwmaepa05H9KfL2wxod8KQ4AsrDtO61LW2s/MyamBIMgOnuyADoF+CV1ZdhpvpCP5pA==
X-Received: by 2002:a05:6512:3c90:b0:4f9:5622:4795 with SMTP id h16-20020a0565123c9000b004f956224795mr4877971lfv.42.1688227737644;
        Sat, 01 Jul 2023 09:08:57 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id r4-20020ac25a44000000b004fb86662871sm2146551lfn.233.2023.07.01.09.08.56
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jul 2023 09:08:56 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fb0336ed4fso1422e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Jul 2023 09:08:56 -0700 (PDT)
X-Received: by 2002:a19:ee17:0:b0:4f2:7840:e534 with SMTP id
 g23-20020a19ee17000000b004f27840e534mr36733lfb.0.1688227736365; Sat, 01 Jul
 2023 09:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230616150618.6073-1-pmladek@suse.com> <20230616150618.6073-7-pmladek@suse.com>
 <7cfc15f1-d8d0-4418-b7a1-5aa9e90e3fb3@roeck-us.net>
In-Reply-To: <7cfc15f1-d8d0-4418-b7a1-5aa9e90e3fb3@roeck-us.net>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 1 Jul 2023 09:08:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UsgweS0pTpr=6xE-+Dx0fqXgjN=3Gf-4MQcNAzjL+64w@mail.gmail.com>
Message-ID: <CAD=FV=UsgweS0pTpr=6xE-+Dx0fqXgjN=3Gf-4MQcNAzjL+64w@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] watchdog/hardlockup: Define HARDLOCKUP_DETECTOR_ARCH
To: Guenter Roeck <linux@roeck-us.net>
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

On Sat, Jul 1, 2023 at 7:40=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On Fri, Jun 16, 2023 at 05:06:18PM +0200, Petr Mladek wrote:
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
> ...
> > --- a/include/linux/nmi.h
> > +++ b/include/linux/nmi.h
> > @@ -9,7 +9,7 @@
> >  #include <asm/irq.h>
> >
> >  /* Arch specific watchdogs might need to share extra watchdog-related =
APIs. */
> > -#if defined(CONFIG_HAVE_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HA=
RDLOCKUP_DETECTOR_SPARC64)
> > +#if defined(CONFIG_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HARDLOC=
KUP_DETECTOR_SPARC64)
>
> This results in:
>
> arch/powerpc/platforms/pseries/mobility.c: In function 'pseries_migrate_p=
artition':
> arch/powerpc/platforms/pseries/mobility.c:753:17: error: implicit declara=
tion of function 'watchdog_hardlockup_set_timeout_pct'; did you mean 'watch=
dog_hardlockup_stop'? [-Werror=3Dimplicit-function-declaration]
>   753 |                 watchdog_hardlockup_set_timeout_pct(factor);
>
> with ppc64_defconfig -CONFIG_HARDLOCKUP_DETECTOR, because the dummy
> for watchdog_hardlockup_set_timeout_pct() is still defined in
> arch/powerpc/include/asm/nmi.h which is no longer included.

Can you test with:

https://lore.kernel.org/r/20230629124500.1.I55e2f4e7903d686c4484cb23c033c6a=
9e1a9d4c4@changeid

Thanks!
