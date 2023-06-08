Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B75DE7281E1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 15:56:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcQjp3l0zz3dyN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 23:56:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oVg83mrT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oVg83mrT;
	dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcQhv3m1lz3drw
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 23:55:41 +1000 (AEST)
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-77acb944bdfso22690239f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 06:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686232537; x=1688824537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27Vs9lje4ue6a9YND5XSnEpnS9VI2Lo/geXINpFnbB8=;
        b=oVg83mrTBUl29PTk+RqO5MA1BbM29G9oM3VedLfG6Qy1nJ9HCw3ztfODFjNfW/5Foj
         PV9ypqz1v+8NtZyWCWnd+W4r6KFZUVomawer+u+FDGofP56S8HQjCx39B7+Wj2Mltud4
         3FUSID/L+JQ3Q0AHzm5LxcJ0wqiK8FdELAXCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686232537; x=1688824537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27Vs9lje4ue6a9YND5XSnEpnS9VI2Lo/geXINpFnbB8=;
        b=jjm0orQosYRLHeq1hGLDIQdjNacfrWLO74FfvNNzCyi9RwUbeBqMXjRpS+uxZOBdAX
         meenyHYIEx1kylQQaFATZxtDiYWbIXYlaUgi7GigbuSQ9StT3JPTdpCRAEPP0xQrwjNb
         bfciCqGgUohfVkEyhX2CFFoln4zRHeYcl9UZrzri5/J6y6dDRe94x12dP7ucD+zMBv4C
         uHdpiwQIRG9BD4X4THxeq3o7uQsYNaTRrrypUve/KhCGFPSzQx7FuCuPzEJLPS3QBMRB
         r2x+g87XtVfTKvOEoZ4VAGz5WNM13T7LiotgR/0tdJnMQEynxjwSminkM7qacMXZMATg
         TVZw==
X-Gm-Message-State: AC+VfDw3FdvDhKMLUXM+2dUUaDLBlUvGgQssWvqbCVBVQc8PV1qA/mEG
	JzE6F9a/M9UA08MqfA65PFe48dxLbjCl7efU0vU=
X-Google-Smtp-Source: ACHHUZ6W/3WW5EK+Yx5gwk998xoYRdUgCduzEno+tAxCTmtVPYcL0y429uDa2oTGardcUSsJLzhPeA==
X-Received: by 2002:a5e:c74d:0:b0:776:fc29:d965 with SMTP id g13-20020a5ec74d000000b00776fc29d965mr11737860iop.10.1686232536992;
        Thu, 08 Jun 2023 06:55:36 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com. [209.85.166.181])
        by smtp.gmail.com with ESMTPSA id f27-20020a02cadb000000b00416789bfd70sm298655jap.1.2023.06.08.06.55.35
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 06:55:35 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-33bf12b5fb5so92655ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 06:55:35 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a82:b0:32f:7715:4482 with SMTP id
 k2-20020a056e021a8200b0032f77154482mr109894ilv.4.1686232535228; Thu, 08 Jun
 2023 06:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230607152432.5435-1-pmladek@suse.com> <20230607152432.5435-3-pmladek@suse.com>
 <CAD=FV=WRzaLbLQ65usGeFq3ya=DV8cYyHQina_721EFoSTdBGA@mail.gmail.com> <ZIG1Qi0iUjTKICQM@alley>
In-Reply-To: <ZIG1Qi0iUjTKICQM@alley>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Jun 2023 06:55:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XzueJia--Zv4cAofzk7yocmP-7K8wa4doAN8pzED_hZA@mail.gmail.com>
Message-ID: <CAD=FV=XzueJia--Zv4cAofzk7yocmP-7K8wa4doAN8pzED_hZA@mail.gmail.com>
Subject: Re: [PATCH 2/7] watchdog/hardlockup: Make the config checks more straightforward
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

On Thu, Jun 8, 2023 at 4:02=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrote=
:
>
> > >  config HARDLOCKUP_DETECTOR
> > >         bool "Detect Hard Lockups"
> > >         depends on DEBUG_KERNEL && !S390
> > > -       depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH || HAVE_HARDLOCK=
UP_DETECTOR_ARCH
> > > +       depends on ((HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP=
_DETECTOR_BUDDY) && !HAVE_NMI_WATCHDOG) || HAVE_HARDLOCKUP_DETECTOR_ARCH
> >
> > Adding the dependency to buddy (see ablove) would simplify the above
> > to just this:
> >
> > depends on HAVE_HARDLOCKUP_DETECTOR_PERF ||
> > HAVE_HARDLOCKUP_DETECTOR_BUDDY || HAVE_HARDLOCKUP_DETECTOR_ARCH
>
> This is exactly what I do not want. It would just move the check
> somewhere else. But it would make the logic harder to understand.

Hmmm. To me, it felt easier to understand by moving this into the
"HAVE_HARDLOCKUP_DETECTOR_BUDDY". To me it was pretty easy to say "if
an architecture defined its own arch-specific watchdog then buddy
can't be enabled" and that felt like it fit cleanly within the
"HAVE_HARDLOCKUP_DETECTOR_BUDDY" definition. It got rid of _a lot_ of
other special cases / checks elsewhere and felt quite a bit cleaner to
me. I only had to think about the conflict between the "buddy" and
"nmi" watchdogs once when I understood
"HAVE_HARDLOCKUP_DETECTOR_BUDDY".


> > As per above, it's simply a responsibility of architectures not to
> > define that they have both "perf" if they have the NMI watchdog, so
> > it's just buddy to worry about.
>
> Where is this documented, please?
> Is it safe to assume this?

It's not well documented and I agree that it could be improved. Right
now, HAVE_NMI_WATCHDOG is documented to say that the architecture
"defines its own arch_touch_nmi_watchdog()". Looking before my
patches, you can see that "kernel/watchdog_hld.c" (the "perf" detector
code) unconditionally defines arch_touch_nmi_watchdog(). That would
give you a linker error.


> I would personally prefer to ensure this by the config check.
> It is even better than documentation because nobody reads
> documentation ;-)

Sure. IMO this should be documented as close as possible to the root
of the problem. Make "HAVE_NMI_WATCHDOG" depend on
"!HAVE_HARDLOCKUP_DETECTOR_PERF". That expresses that an architecture
is not allowed to declare that it has both.
