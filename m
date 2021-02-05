Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD67E3105EE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 08:37:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX6gm4ngjzDr83
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 18:37:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e;
 helo=mail-ej1-x62e.google.com; envelope-from=jcmvbkbc@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jfnYXYEv; dkim-atps=neutral
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX6fH0gDXzDqBg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 18:35:45 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id lg21so10315091ejb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 23:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wv36x8mtHzmEU9YPki70QUxQfyr8hVegQBKr9eSudfs=;
 b=jfnYXYEvdfI4h7/UWIZHtNkFsQeIwZ0vVf96h7Ea1vEREN7GDyJQjNQTziqsyK93SM
 SrllI6oEXxIdij2KhlPTlOCloXdrV9V3GN68mlUKfHyR2LJNUi7MeQJ5Q+xUucB0Dug3
 7IWh6T+8XVQdN06sCVefljeOC4iw84lxJ/lnMM3/RGswlYicE2Mv2iYHx/9/uQ4h5Pi7
 HWfw8qx9SYrBVGnSDuzry+FMQQaRFE+t9+hfgqr02iH2nxF+eS3Ma0WN+LmVvM81HTe4
 29u+psiO3lmg/kVK/18SINZgUCqAsMN3vfUb3UxyKgLsEtTRxr285NAmrFCTlI0RZy+R
 qWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wv36x8mtHzmEU9YPki70QUxQfyr8hVegQBKr9eSudfs=;
 b=bAO4WuQ1hq1ibAmRk1JLiwjbCVfbflSf0maft3p7/dwXsO0yxWyMaieX7q2HoqIkQ/
 Wamx3AJ7ihVYg5FwHFAlcWX6cHshq9wL6TgBpS/LaHnW7E76yGgbbcpNeMDegWv2lFPL
 +s3rsibul9787AGVfBFZfJPewAOYLw8yt1JM9IoWoQL6sjHqNHZLqI4b2tXu0Rm6EvS1
 600ebONYGL9EQdPbLipE6ufJnXxRHvIcr5hyjUWsmMaFjqWBvG+SipTf81KewYsTmqYD
 VzaBNLD3io+L6mZrFSTzEdBKpTqoMPK9rO4b/+cavwjpmhEiWSIyN5jYtT78fxKWHtEy
 rSNQ==
X-Gm-Message-State: AOAM530sAwKTXfrX5aBW1ejlcd76jhV/clccuNHDtPqfIFO5l5nxe8K0
 Ns7IGlPzDa9NoMRHzwyJACVvyApz7M7sIiICHMU=
X-Google-Smtp-Source: ABdhPJwiJI3Hop+xvVQbRaPOon5GbNAbJYLAlRrdHwA+vovQOBasmWF2Yp4Dn9sup2NiIomv4GSH52Fi+5x0Lse0lcE=
X-Received: by 2002:a17:906:780c:: with SMTP id
 u12mr2807943ejm.125.1612510541275; 
 Thu, 04 Feb 2021 23:35:41 -0800 (PST)
MIME-Version: 1.0
References: <1612498242-31579-1-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1612498242-31579-1-git-send-email-anshuman.khandual@arm.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 4 Feb 2021 23:35:29 -0800
Message-ID: <CAMo8BfLXaycXgy-F=TaWzpEZZJKEhbZecxwvBVd6jTo0RJ8atQ@mail.gmail.com>
Subject: Re: [PATCH] mm/memtest: Add ARCH_USE_MEMTEST
To: Anshuman Khandual <anshuman.khandual@arm.com>
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
Cc: Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 4, 2021 at 8:10 PM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> early_memtest() does not get called from all architectures. Hence enabling
> CONFIG_MEMTEST and providing a valid memtest=[1..N] kernel command line
> option might not trigger the memory pattern tests as would be expected in
> normal circumstances. This situation is misleading.
>
> The change here prevents the above mentioned problem after introducing a
> new config option ARCH_USE_MEMTEST that should be subscribed on platforms
> that call early_memtest(), in order to enable the config CONFIG_MEMTEST.
> Conversely CONFIG_MEMTEST cannot be enabled on platforms where it would
> not be tested anyway.
>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-xtensa@linux-xtensa.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v5.11-rc6 and has been tested on arm64 platform. But
> it has been just build tested on all other platforms.
>
>  arch/arm/Kconfig     | 1 +
>  arch/arm64/Kconfig   | 1 +
>  arch/mips/Kconfig    | 1 +
>  arch/powerpc/Kconfig | 1 +
>  arch/x86/Kconfig     | 1 +
>  arch/xtensa/Kconfig  | 1 +
>  lib/Kconfig.debug    | 9 ++++++++-
>  7 files changed, 14 insertions(+), 1 deletion(-)

Anshuman, entries in arch/*/Konfig files are sorted in alphabetical order,
please keep them that way.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
