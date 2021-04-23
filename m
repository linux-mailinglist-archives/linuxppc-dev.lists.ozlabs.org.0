Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BBC368A43
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 03:13:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRGWw15Lfz30DN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 11:13:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mgdTLS5W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mgdTLS5W; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRGWS469Lz2xZW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 11:13:22 +1000 (AEST)
Received: by mail-qk1-x732.google.com with SMTP id v7so20224076qkj.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 18:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cyx9PZhhSqw92stXaMId3qxBJwezQqU3jTPjAxVlHlk=;
 b=mgdTLS5W8PQoNS/dXi6oYepC4uoCembez+MudJ0h+KNNWTwpFw1pwUm8ZDNjGtBYk4
 I9qHtwvaD3FG2VGm3M6GovfzgKhq27EOw2f8sGVqyD6N3dMQVxLVDLOxPMgZs7Z/mEUW
 tsKee86jzEscppvMZ1Yx3HeM214Tq9mKQTkSMUA+sEGB3UM7DVXTUCxK33YAEv+16OKf
 0GdsESez/v+Ln92dv1DTXMw1iAgsw6335n5PgG42tBlLOqRwxTrnJ5Z8nitCCNOvMLru
 pYKf5YR73dtORqGwHzHR/bPFqGWGhzzeZmb8LCVb5TiVp0Z5uM37LrsJoLx7PZOi8z7F
 UIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cyx9PZhhSqw92stXaMId3qxBJwezQqU3jTPjAxVlHlk=;
 b=RzRhVnu15bDjYqYJSDPfth7MrGl/+ISLfbkevjlc26ISB/kNsNmwkYMcYBw6fFesRr
 GZOCBN862W5bngE0/LABYFGidhQk6+qAn0QJHjRJugzRyn46rYK192B5B2i9Em0GNkb6
 zNjAUUafvHQQI9VPiHvFR+wox0MVG7OSQmkIE0MyynxGy04FNL/mM1Kj2qsmXR8gahHq
 GVOdHXN5xHymZU1dYL3J777NQ0jFoNzt0jqb2qz21cYgud1ArDjXE+IqlRBPp8W6e8Nq
 SxsCaekr4wHWQOxelb5//GNBh08yM8iAEhkP2tBIKBCdj8dQbVjJa6W92x7kGtZ0CAlJ
 x7mA==
X-Gm-Message-State: AOAM531y1orX3nY/vXFFr0ZnYfZkg5pNZpIvqqjeMTAsxbydtjgDbQKp
 5PyKN4oMIfH1APvRVTmq9o0S5ndNlLSbzI+mYWM=
X-Google-Smtp-Source: ABdhPJwJH1UEhJGG3Lec9f5cL3X8GJPl5O+T7Hkxm277gfreNh5f9baH0Kl+KtZN9Nlb/WaapdjLW510gb5y7s+bRCM=
X-Received: by 2002:a37:de14:: with SMTP id h20mr1613385qkj.34.1619140398678; 
 Thu, 22 Apr 2021 18:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210422195405.4053917-1-ndesaulniers@google.com>
 <87lf99zzl3.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <87lf99zzl3.fsf@dja-thinkpad.axtens.net>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 23 Apr 2021 11:13:07 +1000
Message-ID: <CAOSf1CGoN5R0LUrU=Y=UWho1Z_9SLgCX8s3SbFJXwJXc5BYz4A@mail.gmail.com>
Subject: Re: [PATCH] powerpc/powernv/pci: remove dead code from !CONFIG_EEH
To: Daniel Axtens <dja@axtens.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Joe Perches <joe@perches.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 23, 2021 at 9:09 AM Daniel Axtens <dja@axtens.net> wrote:
>
> Hi Nick,
>
> > While looking at -Wundef warnings, the #if CONFIG_EEH stood out as a
> > possible candidate to convert to #ifdef CONFIG_EEH, but it seems that
> > based on Kconfig dependencies it's not possible to build this file
> > without CONFIG_EEH enabled.
>
> This seemed odd to me, but I think you're right:
>
> arch/powerpc/platforms/Kconfig contains:
>
> config EEH
>         bool
>         depends on (PPC_POWERNV || PPC_PSERIES) && PCI
>         default y
>
> It's not configurable from e.g. make menuconfig because there's no prompt.
> You can attempt to explicitly disable it with e.g. `scripts/config -d EEH`
> but then something like `make oldconfig` will silently re-enable it for
> you.
>
> It's been forced on since commit e49f7a9997c6 ("powerpc/pseries: Rivet
> CONFIG_EEH for pSeries platform") in 2012 which fixed it for
> pseries. That moved out from pseries to pseries + powernv later on.
>
> There are other cleanups in the same vein that could be made, from the
> Makefile (which has files only built with CONFIG_EEH) through to other
> source files. It looks like there's one `#ifdef CONFIG_EEH` in
> arch/powerpc/platforms/powernv/pci-ioda.c that could be pulled out, for
> example.
>
> I think it's probably worth trying to rip out all of those in one patch?

The change in commit e49f7a9997c6 ("powerpc/pseries: Rivet CONFIG_EEH
for pSeries platform") never should have been made.

There's no inherent reason why EEH needs to be enabled and forcing it
on is (IMO) a large part of why EEH support is the byzantine
clusterfuck that it is. One of the things I was working towards was
allowing pseries and powernv to be built with !CONFIG_EEH since that
would help define a clearer boundary between what is "eeh support" and
what is required to support PCI on the platform. Pseries is
particularly bad for this since PAPR says the RTAS calls needed to do
a PCI bus reset are part of the EEH extension, but there's non-EEH
reasons why you might want to use those RTAS calls. The PHB reset that
we do when entering a kdump kernel is a good example since that uses
the same RTAS calls, but it has nothing to do with the EEH recovery
machinery enabled by CONFIG_EEH.

I was looking into that largely because people were considering using
OPAL for microwatt platforms. Breaking the assumption that
powernv==EEH support is one of the few bits of work required to enable
that, but even if you don't go down that road I think everyone would
be better off if you kept a degree of separation between the two.
