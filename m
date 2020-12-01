Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F862CAD9A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 21:46:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClvKL4vHMzDqsq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 07:46:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=lwlru6BY; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClvH66WV4zDqpg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 07:44:50 +1100 (AEDT)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5406F22253
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 20:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606855488;
 bh=UFEBHXg8TVXYu2V42/6zenhsEaO7jAcjOCzMkhg+LBE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lwlru6BYBaQkldbv5U24rjcM8VjychQZXi28eVSbUL5E58zO63hAOFrsZ5UmxL/b/
 6qjv7C7dxujv3yUoZVgH3BWI7DuQik/X+pk21WSsPL+iXb/qGJIT0jhf4F/pRRcuBy
 NO5ghpzT4kdg2RcruQ/Sg3hqAyPMNEr1E/aa4JBw=
Received: by mail-oi1-f175.google.com with SMTP id v202so3244875oia.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Dec 2020 12:44:48 -0800 (PST)
X-Gm-Message-State: AOAM530T4s9xUtbbY3BoYfK9pRgDr1ra3yIjh8hBvrsJZPejt6ppJXQV
 mBMTuQPQBCV2J4kEKmicKgsUdTwPfqOgdBHi8Rw=
X-Google-Smtp-Source: ABdhPJx3HpJhpKp7V1wx4hETSd/vq2BWsy3Lzp9NXDHTg0LYmh47Db0gDHt2H1j7zyKtvEwaw8HufP+JviyrmLq6s74=
X-Received: by 2002:a05:6808:9a9:: with SMTP id e9mr3002783oig.4.1606855486726; 
 Tue, 01 Dec 2020 12:44:46 -0800 (PST)
MIME-Version: 1.0
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130152137.24909-2-andrey.zhizhikin@leica-geosystems.com>
 <20201130185227.GA29434@kozik-lap>
 <AM6PR06MB4691EC52BA41B86AB16EE14FA6F50@AM6PR06MB4691.eurprd06.prod.outlook.com>
 <20201201144052.GE31404@gaia> <20201201154139.GF2401593@piout.net>
 <CAK8P3a0N24zuQ+CM-_t66CS8AprzdtdfirfLWwGpjgcXjWjn=Q@mail.gmail.com>
 <AM6PR06MB4691A5E1603BBE57F35F3B17A6F40@AM6PR06MB4691.eurprd06.prod.outlook.com>
In-Reply-To: <AM6PR06MB4691A5E1603BBE57F35F3B17A6F40@AM6PR06MB4691.eurprd06.prod.outlook.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 1 Dec 2020 21:44:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1QC+582vyxiGOtE3-17m8rbadtrN4yyaGozOP+fEf-3A@mail.gmail.com>
Message-ID: <CAK8P3a1QC+582vyxiGOtE3-17m8rbadtrN4yyaGozOP+fEf-3A@mail.gmail.com>
Subject: Re: [PATCH 1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
To: ZHIZHIKIN Andrey <andrey.zhizhikin@leica-geosystems.com>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "tony@atomide.com" <tony@atomide.com>,
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

On Tue, Dec 1, 2020 at 8:48 PM ZHIZHIKIN Andrey
<andrey.zhizhikin@leica-geosystems.com> wrote:
> Hello Arnd,
> > > > Or rather, SoC-specific patches, even to defconfig, should go
> > > > through the specific SoC maintainers. However, there are occasional
> > > > defconfig patches which are more generic or affecting multiple SoCs.
> > > > I just ignore them as the arm64 defconfig is usually handled by the
> > > > arm-soc folk (when I need a defconfig change, I go for
> > > > arch/arm64/Kconfig directly ;)).
> > >
> > > IIRC, the plan was indeed to get defconfig changes through the
> > > platform sub-trees. It is also supposed to be how multi_v5 and
> > > multi_v7 are handled and they will take care of the merge.
> >
> > For cross-platform changes like this one, I'm definitely happy to pick up the
> > patch directly from soc@kernel.org, or from mailing list if I know about it.
>
> Should I collect all Ack's and re-send this series including the list "nobody
> talks about" :), or the series can be picked up as-is?
>
> Your advice would be really welcomed here!

Yes, please do, that makes my life easier. I would apply the patches
for arch/arm and arch/arm64 when you send them to soc@kernel.org,
the others go to the respective architecture maintainers, unless they
want me to pick up the whole series.

      Arnd
