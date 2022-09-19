Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 326DD5BC415
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 10:13:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWHW55hV5z3c9C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 18:13:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=lixom-net.20210112.gappssmtp.com header.i=@lixom-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=EuFCJAks;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=lixom.net (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lixom-net.20210112.gappssmtp.com header.i=@lixom-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=EuFCJAks;
	dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MW9Xx12LQz2ysx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 13:44:47 +1000 (AEST)
Received: by mail-ed1-x52b.google.com with SMTP id x94so22140748ede.11
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Sep 2022 20:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=8wzd/IsQMAz4yliZb1FsJ3OfMRVNZc5tTLnz3lR7QHQ=;
        b=EuFCJAkszMPKPtxQSyMQ0NoboaeVB7t96eFw9rPXwH9oSHUro5o77bxEeYAtANDzyR
         I9BMOm4HMiosCb0pcsiSHEAZo2qSCtvZawUq0/zPNIdwAvDvQAPS+8+0uFrWbUJgoTtd
         ExLo8MeQP7GyQ+rW2rlFvIPPT75kqxCAKPhOGjeDjYZZFhuAOfywggSn5a+jZu6mJGBr
         cWVHHoToy9UWA6nPxBqZcAZLzmJoxjkbRc1yLhwZYNZgNQEBRnr86m6GI/e/+J8MoRAT
         suDLw8ILYZpcoPAOh+pvz4Lu/zfiYh6RXQKy+jZAxuRvjXsVxLmt63JqorCueNp9TEEJ
         9kQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=8wzd/IsQMAz4yliZb1FsJ3OfMRVNZc5tTLnz3lR7QHQ=;
        b=6laK3A0G3fQgA3ySPTCgnura3FOUhC/0hl1/ybLs3r5LDJoGV2zlYFk93KEjD8roaY
         YvaoDU0EC8bApNSYbiO7khcDuKoHV7AMRuoDBn2KIhOJ+okFPjUICGIrFDyt8/v2uhyo
         dhHTfZmxfmjkHsBqyzfUaZL3lISV1viM/LqTy3OxWTYRiYEf2Ics6pdnhP2Rp+VVtM9w
         4JlLegdSmTyU1xgHTUuDHiT6W0/t0pQINA7ORjsNaKGlO8m11zA3E2to53uuhxS3PzOg
         OwnVy67G2VJnmLgph4aQUOSpgJFTV9CqiA9HIqlBLq7WqzM8iUy/sUPQ0Fu9nSyd5u6N
         7Csg==
X-Gm-Message-State: ACrzQf0R9JVc6vx65k2mGqlAwCvFErkTt/FwpWmrH6Rzo2BZqc0R1PLv
	KOohiiBop/C5wGMvgwylhC6uz3ezz7ef9OSlCoCbgQ==
X-Google-Smtp-Source: AMsMyM67X4fHgNHGRzRNZ0AalOVh8oZlYNRkDoycvf7zBAcHx4qOwSpxEraLAwYUCmYCoDnGs0xLR1B5pb/N312tK3I=
X-Received: by 2002:aa7:cc8a:0:b0:446:7668:2969 with SMTP id
 p10-20020aa7cc8a000000b0044676682969mr13821510edt.206.1663559079248; Sun, 18
 Sep 2022 20:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220701012647.2007122-1-saravanak@google.com> <YwS5J3effuHQJRZ5@kroah.com>
In-Reply-To: <YwS5J3effuHQJRZ5@kroah.com>
From: Olof Johansson <olof@lixom.net>
Date: Sun, 18 Sep 2022 20:44:27 -0700
Message-ID: <CAOesGMivJ5Q-jdeGKw32yhjmNiYctHjpEAnoMMRghYqWD2m2tw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix console probe delay when stdout-path isn't set
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 19 Sep 2022 18:12:32 +1000
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
Cc: andrew lunn <andrew@lunn.ch>, peng fan <peng.fan@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linus walleij <linus.walleij@linaro.org>, Paul Mackerras <paulus@samba.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Korsgaard <jacmet@sunsite.dk>, linux-stm32@st-md-mailman.stormreply.com, Karol Gugala <kgugala@antmicro.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, Hammer Hsieh <hammerh0314@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Vineet Gupta <vgupta@kernel.org>, len brown <len.brown@intel.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-unisoc@lists.infradead.org, Scott Branden <sbranden@broadcom.com>, Andrew Jeffery <andrew@aj.id.au>, linux-kernel@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Claudiu Beznea <claudiu.beznea
 @microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, pavel machek <pavel@ucw.cz>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, eric dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>, sascha hauer <sha@pengutronix.de>, Saravana Kannan <saravanak@google.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Gabriel Somlo <gsomlo@gmail.com>, Tobias Klauser <tklauser@distanz.ch>, linux-mips@vger.kernel.org, kernel-team@android.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andreas Farber <afaerber@suse.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Pali Rohar <pali@kernel.org>, heiner kallweit <hkallweit1@gmail.com>, ulf hansson <ulf.hansson@linaro.org>, Neil
  Armstrong <narmstrong@baylibre.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Al Cooper <alcooperx@gmail.com>, linux-tegra@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Mateusz Holenko <mholenko@antmicro.com>, Alexander Shiyan <shc_work@mail.ru>, kevin hilman <khilman@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>, paolo abeni <pabeni@redhat.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-snps-arc@lists.infradead.org, Timur Tabi <timur@kernel.org>, hideaki yoshifuji <yoshfuji@linux-ipv6.org>, iommu@lists.linux-foundation.org, Laxman Dewangan <ldewangan@nvidia.com>, Sudeep Holla <sudeep.holla@arm.com>, Baolin Wang <baolin.wang7@gmail.com>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <dav
 em@davemloft.net>, Baruch Siach <baruch@tkos.co.il>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Paul Cercueil <paul@crapouillou.net>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, joerg roedel <joro@8bytes.org>, Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>, linux-serial@vger.kernel.org, jakub kicinski <kuba@kernel.org>, will deacon <will@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Taichi Sugaya <sugaya.taichi@socionext.com>, netdev@vger.kernel.org, david ahern <dsahern@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer
 @dabbelt.com>, Takao Orito <orito.takao@socionext.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 23, 2022 at 8:37 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jun 30, 2022 at 06:26:38PM -0700, Saravana Kannan wrote:
> > These patches are on top of driver-core-next.
> >
> > Even if stdout-path isn't set in DT, this patch should take console
> > probe times back to how they were before the deferred_probe_timeout
> > clean up series[1].
>
> Now dropped from my queue due to lack of a response to other reviewer's
> questions.

What happened to this patch? I have a 10 second timeout on console
probe on my SiFive Unmatched, and I don't see this flag being set for
the serial driver. In fact, I don't see it anywhere in-tree. I can't
seem to locate another patchset from Saravana around this though, so
I'm not sure where to look for a missing piece for the sifive serial
driver.

This is the second boot time regression (this one not fatal, unlike
the Layerscape PCIe one) from the fw_devlink patchset.

Greg, can you revert the whole set for 6.0, please? It's obviously
nowhere near tested enough to go in and I expect we'll see a bunch of
-stable fixups due to this if we let it remain in.

This seems to be one of the worst releases I've encountered in recent
years on my hardware here due to this patchset. :-(


-Olof
