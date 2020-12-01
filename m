Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5CC2CA768
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 16:53:01 +0100 (CET)
Received: from bilbo.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClmpL5pzxzDqG8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 02:52:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=d0BXfp9B; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Clmlm2vbrzDqDW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 02:50:44 +1100 (AEDT)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8B7922256
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 15:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606837841;
 bh=ocP+REHyvc3INvCyRToWa0BDelMYpVNAD4Ht4bVMxw4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d0BXfp9B678drYtWqDBUlknaZrgIENz3/9P8PkQTHdjgiToHebGZd6AT15QYDi9o3
 of85a0gKvoI/ETgfnp9XrwnI4Xto0nyM976m+c8Ye8M6eJpwXu4nGmsJDnNTU34Hh9
 6/i/TQQ1NbuyKJYpe4hPrtWe70ECqRFJoCOWZgsU=
Received: by mail-ot1-f44.google.com with SMTP id f12so2053559oto.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Dec 2020 07:50:40 -0800 (PST)
X-Gm-Message-State: AOAM530c14SfurbtyR9rOFy/GSB6acWYfNr1ZSZePSCqFdeM44AuWKsW
 nreCk/kNcEjpJCf6XueIg7Ktq2GtqGw0e9wenNw=
X-Google-Smtp-Source: ABdhPJwlRbiyuko5jdeqhi5YEFdXPQ6zEuSN349AgsmyyWjcElmhcbPPjEuYreBsAU023iCYpnCQs8p8Rs/BnCHJ/AM=
X-Received: by 2002:a4a:eac1:: with SMTP id s1mr2310247ooh.15.1606837839133;
 Tue, 01 Dec 2020 07:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130152137.24909-2-andrey.zhizhikin@leica-geosystems.com>
 <20201130185227.GA29434@kozik-lap>
 <AM6PR06MB4691EC52BA41B86AB16EE14FA6F50@AM6PR06MB4691.eurprd06.prod.outlook.com>
 <20201201144052.GE31404@gaia> <20201201154139.GF2401593@piout.net>
In-Reply-To: <20201201154139.GF2401593@piout.net>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 1 Dec 2020 16:50:22 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0N24zuQ+CM-_t66CS8AprzdtdfirfLWwGpjgcXjWjn=Q@mail.gmail.com>
Message-ID: <CAK8P3a0N24zuQ+CM-_t66CS8AprzdtdfirfLWwGpjgcXjWjn=Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
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
Cc: "tony@atomide.com" <tony@atomide.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@hansenpartnership.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "paulus@samba.org" <paulus@samba.org>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "deller@gmx.de" <deller@gmx.de>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
 arm-soc <arm@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "will@kernel.org" <will@kernel.org>, "mripard@kernel.org" <mripard@kernel.org>,
 ZHIZHIKIN Andrey <andrey.zhizhikin@leica-geosystems.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>, "wens@csie.org" <wens@csie.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 Olof Johansson <olof@lixom.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 1, 2020 at 4:41 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 01/12/2020 14:40:53+0000, Catalin Marinas wrote:
> > On Mon, Nov 30, 2020 at 07:50:25PM +0000, ZHIZHIKIN Andrey wrote:
> > > From Krzysztof Kozlowski <krzk@kernel.org>:

> > I tried to convince them before, it didn't work. I guess they don't like
> > to be spammed ;).
>
> The first rule of arm-soc is: you do not talk about arm@ and soc@

I don't mind having the addresses documented better, but it needs to
be done in a way that avoids having any patch for arch/arm*/boot/dts
and arch/arm/*/configs Cc:d to soc@kernel.org.

If anyone has suggestions for how to do that, let me know.

> > Or rather, SoC-specific patches, even to defconfig,
> > should go through the specific SoC maintainers. However, there are
> > occasional defconfig patches which are more generic or affecting
> > multiple SoCs. I just ignore them as the arm64 defconfig is usually
> > handled by the arm-soc folk (when I need a defconfig change, I go for
> > arch/arm64/Kconfig directly ;)).
>
> IIRC, the plan was indeed to get defconfig changes through the platform
> sub-trees. It is also supposed to be how multi_v5 and multi_v7 are
> handled and they will take care of the merge.

For cross-platform changes like this one, I'm definitely happy to
pick up the patch directly from soc@kernel.org, or from mailing
list if I know about it.

We usually do the merges for the soc tree in batches and rely
on patchwork to keep track of what I'm missing, so if Olof and
I are just on Cc to a mail, we might have forgotten about it
by the time we do the next merges.

      Arnd
