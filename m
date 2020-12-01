Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D192CAE4C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 22:20:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Clw4K4nxmzDqlp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 08:20:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.65; helo=mail-ej1-f65.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Clw2S5yCfzDqTw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 08:18:56 +1100 (AEDT)
Received: by mail-ej1-f65.google.com with SMTP id jx16so7298562ejb.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Dec 2020 13:18:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jryqI5sQqWi4PXznClcMpjDSZfGYWOSS95XBGrU9xYM=;
 b=sfmttgXBVfsEOn8+uEcT+suMpexym8VOMqcAaUNYvcsRkBg+JlucKECvbPtoy18ik4
 AMHmn2pwhTIQ28dy/qHB1Az/5I8QolhHbsHHE4603O4f71Shj1MNSIKtsaZYf5ZcmbAF
 eKJX5/KN7RAExPeeWMCE70/6Y8QyKY3+hpwNsFmIp5+Gja1wiioPefNVJb6x/MzOpO/I
 jx1+D7rX2O55YfNTEvsQbIgTZ8mWIL8V4jYHO/EUXeJzKgwnmzxKB3jRqymqp1Lqdm7j
 iU/3RFeDoP7NjuUpnhjrqlUEn89HbTxU9H6YXYdeZpDWIwyY5Ryp8TjOkLCgWcOIMxBm
 Xprw==
X-Gm-Message-State: AOAM531okF49qLyCs56C5l9OCrrb85fDnQRs3CjVf4OhVjUuKa3oiwok
 8NODSJ5NAcbO5Zto5cTrrK0=
X-Google-Smtp-Source: ABdhPJwVCwY+a1v0Hv+LTfv/oplZ+OnT3nmymHRP5j+/8a+SofJfABEbDHeJGwHTKrcOyfGOWnoRIA==
X-Received: by 2002:a17:906:2e16:: with SMTP id
 n22mr5070528eji.477.1606857532633; 
 Tue, 01 Dec 2020 13:18:52 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id d14sm484594edu.63.2020.12.01.13.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 13:18:51 -0800 (PST)
Date: Tue, 1 Dec 2020 23:18:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 1/5] ARM: configs: drop unused BACKLIGHT_GENERIC option
Message-ID: <20201201211849.GA23379@kozik-lap>
References: <20201130152137.24909-1-andrey.zhizhikin@leica-geosystems.com>
 <20201130152137.24909-2-andrey.zhizhikin@leica-geosystems.com>
 <20201130185227.GA29434@kozik-lap>
 <AM6PR06MB4691EC52BA41B86AB16EE14FA6F50@AM6PR06MB4691.eurprd06.prod.outlook.com>
 <20201201144052.GE31404@gaia> <20201201154139.GF2401593@piout.net>
 <CAK8P3a0N24zuQ+CM-_t66CS8AprzdtdfirfLWwGpjgcXjWjn=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a0N24zuQ+CM-_t66CS8AprzdtdfirfLWwGpjgcXjWjn=Q@mail.gmail.com>
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

On Tue, Dec 01, 2020 at 04:50:22PM +0100, Arnd Bergmann wrote:
> On Tue, Dec 1, 2020 at 4:41 PM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> > On 01/12/2020 14:40:53+0000, Catalin Marinas wrote:
> > > On Mon, Nov 30, 2020 at 07:50:25PM +0000, ZHIZHIKIN Andrey wrote:
> > > > From Krzysztof Kozlowski <krzk@kernel.org>:
> 
> > > I tried to convince them before, it didn't work. I guess they don't like
> > > to be spammed ;).
> >
> > The first rule of arm-soc is: you do not talk about arm@ and soc@
> 
> I don't mind having the addresses documented better, but it needs to
> be done in a way that avoids having any patch for arch/arm*/boot/dts
> and arch/arm/*/configs Cc:d to soc@kernel.org.
> 
> If anyone has suggestions for how to do that, let me know.

Not a perfect solution but something. How about:
https://lore.kernel.org/linux-arm-kernel/20201201211516.24921-2-krzk@kernel.org/T/#u

Would not work on defconfigs but there is a chance someone will find
your addresses this way. Should not cause to much additional traffic.

Best regards,
Krzysztof

