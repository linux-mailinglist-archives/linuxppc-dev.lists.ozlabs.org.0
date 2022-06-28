Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 650AD55BEEA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 09:01:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXFqm2cjfz3dnp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 17:01:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GtISRQAw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=festevam@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GtISRQAw;
	dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LX7fy6kGrz2xgX;
	Tue, 28 Jun 2022 12:23:06 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id r66so10825674pgr.2;
        Mon, 27 Jun 2022 19:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HJxtqab0/tMiakWNEyC3nFz1/Ap3ZwjlyjInjl9oQ08=;
        b=GtISRQAw32VwWkIqJjbS6kPz10YSeb/J+R05thf6bFPMAOY82jKQN3UdU/3Xm5A6wE
         tMPJ9jiXwXd5WIpoNmuhYObSQi+a4vbyn3XjCacf3FIX++nTWeWgUHF+xWdV2kFekLbZ
         0OzYqNi1FmudYoMCCJZeGvG2ye4sCgduv0rk2Zt4nVkQ98BfuFa3NPGjGKGgPVG9KtHY
         DntPc1msd2JalXRAlzsxyFpEjwPnKkzTvOPkfaVuXEaP+ZKelLBEm4Nr7ZrcOOgm/4RV
         HPa6kkD+OJGFCcd57tIyozXxW7wCGRkiieRac/DfVSrfyK1ch327OFoWU4ImG2SclPJ9
         uIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HJxtqab0/tMiakWNEyC3nFz1/Ap3ZwjlyjInjl9oQ08=;
        b=aXNZUST+KgSglQD78amEMxyBqRG/sfU13dKwXQP4/eE5RYk0pFLWXlCFdM/0qTdPeh
         G3ngZinPvqLxeqnEyb8qQyTGDjaNhYiuYSKv9rIkwfFrGwj6Kn39+K0XdoSTPISEB6Kg
         WKDzGn35NkBItbMV4pmDn8kVblxMyBq0RLtwy1tirWNXY4IDnciGmYbgh4T20nL7av0u
         I/RJoRRqpRi4noIFngAl4jw5qChIOXzCxfpywRuTGzyeT4PAL0rWbjU+LURzGRU41wgG
         nsQPPI1cVSbpb9QGGC10IMqOkGcvgC4fz2kTq2iuiHOxo58gUY3jfsfIUJprfSZL+9PW
         juGQ==
X-Gm-Message-State: AJIora9XHS7Ncoyv7n9jsknrIOgdwjWa3EsCNus3RPuS23M6sk+AqTxd
	sEmGhlUR6gNuEoddwzAZSZKDrf7WiRehyxuO//Y=
X-Google-Smtp-Source: AGRyM1tkELEQsXZZ9rCiYz26Ox2Bo3COuaabo0ODviEYu2B5j99coTUXvXqjCJz9EcYG+uOHPMvd9KNaBAGlSJExO9A=
X-Received: by 2002:a65:6a0e:0:b0:405:2310:22d0 with SMTP id
 m14-20020a656a0e000000b00405231022d0mr15760605pgu.290.1656382983124; Mon, 27
 Jun 2022 19:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220628020110.1601693-1-saravanak@google.com>
In-Reply-To: <20220628020110.1601693-1-saravanak@google.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 27 Jun 2022 23:22:52 -0300
Message-ID: <CAOMZO5D29QqH_-pktht6yO_Ga7B7KgeGXxzyUHJWGYfGTJr4pw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Fix console probe delay when stdout-path isn't set
To: Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 28 Jun 2022 16:58:59 +1000
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
Cc: andrew lunn <andrew@lunn.ch>, peng fan <peng.fan@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linus walleij <linus.walleij@linaro.org>, Paul Mackerras <paulus@samba.org>, Alim Akhtar <alim.akhtar@samsung.com>, Peter Korsgaard <jacmet@sunsite.dk>, linux-stm32@st-md-mailman.stormreply.com, Karol Gugala <kgugala@antmicro.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, Hammer Hsieh <hammerh0314@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Vineet Gupta <vgupta@kernel.org>, len brown <len.brown@intel.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-unisoc@lists.infradead.org, Scott Branden <sbranden@broadcom.com>, Andrew Jeffery <andrew@aj.id.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, Richard Genoud <richard.genoud@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Ker
 nel Team <kernel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, pavel machek <pavel@ucw.cz>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, eric dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>, sascha hauer <sha@pengutronix.de>, Chunyan Zhang <zhang.lyra@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Gabriel Somlo <gsomlo@gmail.com>, Tobias Klauser <tklauser@distanz.ch>, linux-mips@vger.kernel.org, kernel-team@android.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Andreas Farber <afaerber@suse.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
  Pali Rohar <pali@kernel.org>, heiner kallweit <hkall

weit1@gmail.com>, ulf hansson <ulf.hansson@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Al Cooper <alcooperx@gmail.com>, linux-tegra@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Mateusz Holenko <mholenko@antmicro.com>, Alexander Shiyan <shc_work@mail.ru>, kevin hilman <khilman@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>, paolo abeni <pabeni@redhat.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-snps-arc@lists.infradead.org, Timur Tabi <timur@kernel.org>, hideaki yoshifuji <yoshfuji@linux-ipv6.org>, iommu@lists.linux-foundation.org, Laxman Dewangan <ldewangan@nvidia.com>, Sudeep Holla <sudeep.holla@arm.com>, Baolin Wang <baolin.wang7@gmail.co
 m>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Baruch Siach <baruch@tkos.co.il>, Liviu Dudau <liviu.dudau@arm.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Paul Cercueil <paul@crapouillou.net>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, joerg roedel <joro@8bytes.org>, Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>, linux-serial@vger.kernel.org, jakub kicinski <kuba@kernel.org>, will deacon <will@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Taichi Sugaya <sugaya.taichi@socionext.com>, netdev <netdev@vger.kernel.org>, david ahern <dsahern@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski@lin
 aro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Takao 
Orito <orito.takao@socionext.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Saravana,

On Mon, Jun 27, 2022 at 11:03 PM Saravana Kannan <saravanak@google.com> wrote:
>
> Since the series that fixes console probe delay based on stdout-path[1] got
> pulled into driver-core-next, I made these patches on top of them.
>
> Even if stdout-path isn't set in DT, this patch should take console
> probe times back to how they were before the deferred_probe_timeout
> clean up series[2].
>
> Fabio/Ahmad/Sascha,
>
> Can you give this a shot please?

This series works fine for me (with and without stdout-path), thanks:

Tested-by: Fabio Estevam <festevam@gmail.com>
