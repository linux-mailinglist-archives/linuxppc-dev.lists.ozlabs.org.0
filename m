Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 071A4567BF4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 04:38:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ld3d26s9nz3c69
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 12:38:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jzyDqqOs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e; helo=mail-qk1-x72e.google.com; envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jzyDqqOs;
	dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lcv3C56ZSz2ypW
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 06:12:06 +1000 (AEST)
Received: by mail-qk1-x72e.google.com with SMTP id z12so9597428qki.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Jul 2022 13:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=OTC6txqtQct8PJfU00O4zbYgNzmzFUtn37nCnhn8x1k=;
        b=jzyDqqOsmOiFQpBNDEIIiq2MN35QtJrUD2/ujzSWycMbbCOOa/kXWzucbOzXvgJPlM
         l41OpTnwJFtVKAh9ESeTZGx5QRNGnFLf7Ve6XK/dYXbRSWYolxdZFruwb2QvUjtDqKp3
         XPq8C5Jcp4JG3opZdh2U+imHALhK3sBAHCCrGSqp8Vv6nsMRfMt39kYqHYOSFDIblB6A
         qByLsJ7MJ8hdI1n2d+9GcDpXsaJ8cJ751FUYmiFAN8pTN8GWtaPdCiQlJR4UCA74w7VK
         BYLuDVNV9YmL+YjlB3aU/m2FQ5afMCy9VI/vJGznIenuOAJI2wSPMGBH0t9pzT1ABtei
         oFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=OTC6txqtQct8PJfU00O4zbYgNzmzFUtn37nCnhn8x1k=;
        b=dlc3hfvJm/x6fEceARgogRgI7fUMvzcHo4UPi9Fo5bzQ/Cnw1axPXw8sGXOeaaelbQ
         Y3mXgkK7YcJYGD2Gt0v79ERx9wbzjtPjUOLqVNS2absFrgebm0S/Q3vWhsbVwUJeQ9da
         /oU+mMPMKHUeoV9IGMDNpKY7tOeqfMXK5NQvqeboslBhOyH0bC1wHUR7HbyJ05bZXoBM
         FgqGxKmY3Id4jpe5toOcDqq3VIowj18M0fDah3Wx7vMZVOarg1ix49RYBAbUgfFAeJqP
         nng638MtixY2J7wYgVVCDzNJcA+3gYmGBOvKsxrvRTjgEDfegW3nTsmEdUhPdUN6AX72
         6Yfw==
X-Gm-Message-State: AJIora+gIqVV/e0H+dZmdWhCk1AxgFJjs9tXyGVIB+tJC4buhiP+5izK
	/RK/p+61GqjUGOR5+xNSRA==
X-Google-Smtp-Source: AGRyM1v0OJ93Nu3s63zVNhYbXwTamj5LdNYK8gxlMvIKZ0kjVcSqwnmSr3p+XEHk7rqxFSougreCpA==
X-Received: by 2002:a05:620a:385:b0:6af:1f2b:9168 with SMTP id q5-20020a05620a038500b006af1f2b9168mr24692503qkm.170.1657051922136;
        Tue, 05 Jul 2022 13:12:02 -0700 (PDT)
Received: from serve.minyard.net ([47.184.144.75])
        by smtp.gmail.com with ESMTPSA id r8-20020a05620a298800b006b4689e3425sm5643578qkp.129.2022.07.05.13.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 13:12:01 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:1895:1b49:2a68:29f7])
	by serve.minyard.net (Postfix) with ESMTPSA id B3B861800BD;
	Tue,  5 Jul 2022 20:11:57 +0000 (UTC)
Date: Tue, 5 Jul 2022 15:11:56 -0500
From: Corey Minyard <minyard@acm.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Message-ID: <20220705201156.GL908082@minyard.net>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
X-Mailman-Approved-At: Wed, 06 Jul 2022 12:38:01 +1000
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
Reply-To: minyard@acm.org
Cc: Andrew Lunn <andrew@lunn.ch>, Ricardo Ribalda <ribalda@kernel.org>, Jimmy Su <jimmy.su@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Sekhar Nori <nsekhar@ti.com>, Gwendal Grignou <gwendal@chromium.org>, dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Paul Mackerras <paulus@samba.org>, Moses Christopher Bollavarapu <mosescb.dev@gmail.com>, Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Evgeniy Polyakov <zbr@ioremap.net>, Matt Johnston <matt@codeconstruct.com.au>, Olli Salonen <olli.salonen@iki.fi>, Angela Czubak <acz@semihalf.com>, Robert Marko <robert.marko@sartura.hr>, Luka Perkov <luka.perkov@sartura.hr>, Sean Young <sean@mess.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Zheyu Ma <zheyuma97@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-omap@vger.kernel.org, An
 tti Palosaari <crope@iki.fi>, Wenyou Yang <wenyou.yang@microchip.com>, Dongchun Zhu <dongchun.zhu@mediatek.com>, Miaoqian Lin <linmq006@gmail.com>, Steve Longerbeam <slongerbeam@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>, Shunqian Zheng <zhengsq@rock-chips.com>, lijian <lijian@yulong.com>, Dan Carpenter <dan.carpenter@oracle.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Viorel Suman <viorel.suman@nxp.com>, Petr Machata <petrm@nvidia.com>, Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, Jean Delvare <jdelvare@suse.com>, linux-serial@vger.kernel.org, linux-pm@vger.kernel.org, Eddie James <eajames@linux.ibm.com>, Riku Voipio <riku.voipio@iki.fi>, James Schulman <james.schulman@cirrus.com>, Scott Wood <oss@buserror.net>, Cai Huoqing <cai.huoqing@linux.dev>, Jonas Malaco <jonas@protocubo.io>, Hsin-Yi Wang <hsinyi@chromium.org>, Haibo Chen <haibo.chen@nxp.com>, Petr Cvek <petrcvekcz@gmail.com>, linux-leds@vger.kernel.org, Joe Tessler <jrt@google.com>, Andrey Konovalov <
 andreyknvl@gmail.com>, Andy Shevchenko <andy@kernel.o

rg>, Robert Jones <rjones@gateworks.com>, George Joseph <george.joseph@fairview5.com>, Vincent Knecht <vincent.knecht@mailoo.org>, Robin van der Gracht <robin@protonic.nl>, Randy Dunlap <rdunlap@infradead.org>, linux-stm32@st-md-mailman.stormreply.com, Michael Tretter <m.tretter@pengutronix.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Phong LE <ple@baylibre.com>, Daniel Beer <daniel.beer@igorinstitute.com>, Krzysztof Opasiak <k.opasiak@samsung.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Heungjun Kim <riverful.kim@samsung.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, David Lin <CTLIN0@nuvoton.com>, Vladimir Oltean <olteanv@gmail.com>, David Rhodes <david.rhodes@cirrus.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Dan Robertson <dan@dlrobertson.com>, Martyn Welch <martyn.welch@collab
 ora.co.uk>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, Jon Nettleton <jon.nettleton@gmail.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Marco Felsch <m.felsch@pengutronix.de>, Wim Van Sebroeck <wim@linux-watchdog.org>, Sebastian Reichel <sre@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org, Martiros Shakhzadyan <vrzh@vrzh.net>, Guenter Roeck <groeck@chromium.org>, Matthias Schwarzott <zzam@gentoo.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Eric Dumazet <edumazet@google.com>, Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, Saranya Gopal <saranya.gopal@intel.com>, Lars-Peter Clausen <lars@metafoo.de>, Evgeny Novikov <novikov@ispras.ru>, Frank Rowand <frowand.list@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Manivannan Sadhasivam <mani@kernel.org>, Pierre-Louis Bossart <pierre-louis.bossart@l
 inux.intel.com>, Minghao Chi <chi.minghao@zte.com.cn>
, linux-clk@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Charles Gorand <charles.gorand@effinnov.com>, Jagan Teki <jagan@amarulasolutions.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Miguel Ojeda <ojeda@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Martin Donnelly <martin.donnelly@ge.com>, Woojung Huh <woojung.huh@microchip.com>, Rudolf Marek <r.marek@assembler.cz>, Charles Keepax <ckeepax@opensource.cirrus.com>, linux-watchdog@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>, Ido Schimmel <idosch@nvidia.com>, acpi4asus-user@lists.sourceforge.net, Simon Trimmer <simont@opensource.cirrus.com>, Ricard Wanderlof <ricardw@axis.com>, Rikard Falkeborn <rikard.falkeborn@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, Jiri Valek - 2N <valek@2n.cz>, linux-rpi-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, Wayne Chang <waynec@nvidia.com>, Chen-Yu 
 Tsai <wens@csie.org>, Sing-Han Chen <singhanc@nvidia.com>, linux-arm-kernel@lists.infradead.org, Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Hans de Goede <hdegoede@redhat.com>, Stephen Boyd <sboyd@kernel.org>, Maslov Dmitry <maslovdmitry@seeed.cc>, linux-gpio@vger.kernel.org, Jens Frederich <jfrederich@gmail.com>, Douglas Anderson <dianders@chromium.org>, linux-media@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Wolfram Sang <wsa@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, linux-usb@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, CGEL ZTE <cgel.zte@gmail.com>, Colin Leroy <colin@colino.net>, platform-driver-x86@vger.kernel.org, linux-integrity@vger.kernel.org, Kevin Tsai <ktsai@capellamicro.com>, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Daniel Palmer <daniel@0x0f.com>, Arec Kao <arec.kao@intel.com>,
  Crt Mori <cmo@melexis.com>, Jose Cazarin <joseespiri
ki@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org, Tom Rix <trix@redhat.com>, Michael Turquette <mturquette@baylibre.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Jan-Simon Moeller <jansimon.moeller@gmx.de>, Wei Yongjun <weiyongjun1@huawei.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Nikita Travkin <nikita@trvn.ru>, Jeremy Kerr <jk@codeconstruct.com.au>, Jasmin Jessich <jasmin@anw.at>, Sam Ravnborg <sam@ravnborg.org>, Kevin Cernekee <cernekee@chromium.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-rtc@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Lucas Tanure <tanureal@opensource.cirrus.com>, Stefan Mavrodiev <stefan@olimex.com>, Masahiro Yamada <masahiroy@kernel.org>, Sylvain Petinot <sylvain.petinot@foss.st.com>, netdev@vger.kernel.o
 rg, Kieran Bingham <kieran.bingham@ideasonboard.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Xin Ji <xji@analogixsemi.com>, Seven Lee <wtli@nuvoton.com>, Matt Ranostay <matt.ranostay@konsulko.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Adrien Grassein <adrien.grassein@gmail.com>, Yang Yingliang <yangyingliang@huawei.com>, chrome-platform@lists.linux.dev, Mats Randgaard <matrandg@cisco.com>, Paolo Abeni <pabeni@redhat.com>, Alexey Dobriyan <adobriyan@gmail.com>, Joel Stanley <joel@jms.id.au>, linux-input@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Lyude Paul <lyude@redhat.com>, Kees Cook <keescook@chromium.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>, Jonas Karlman <jonas@kwiboo.se>, Yang Li <yang.lee@linux.alibaba.com>, Tim Harvey <tharvey@gateworks.com>, Jiri Kosina <jikos@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, Mark Gross <markgross@kernel.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown 
 <broonie@kernel.org>, wengjianfeng <wengjianfeng@yulo
ng.com>, Maxime Ripard <maxime@cerno.tech>, Sven Peter <sven@svenpeter.dev>, Martin Kepplinger <martink@posteo.de>, openipmi-developer@lists.sourceforge.net, Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>, "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-hwmon@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Support Opensource <support.opensource@diasemi.com>, Alexandru Ardelean <ardeleanalex@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Marc Hulsman <m.hulsman@tudelft.nl>, Corentin Chary <corentin.chary@gmail.com>, Stephen Kitt <steve@sk2.org>, Daniel Scally <djrscally@gmail.com>, linux-fbdev@vger.kernel.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Kirill Shilimanov <kirill.shilimanov@huawei.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, patches@opensource.cirrus.com, Z
 heng Yongjun <zhengyongjun3@huawei.com>, Alejandro Tafalla <atafalla@dnyon.com>, Peter Rosin <peda@axentia.se>, Arnaud Ferraris <arnaud.ferraris@collabora.com>, Hector Martin <marcan@marcan.st>, Vignesh Raghavendra <vigneshr@ti.com>, Nick Dyer <nick@shmanahar.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tony Lindgren <tony@atomide.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Takashi Iwai <tiwai@suse.com>, Paul Cercueil <paul@crapouillou.net>, George McCollister <george.mccollister@gmail.com>, Mac Chiang <mac.chiang@intel.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, Alexander Potapenko <glider@google.com>, linux-staging@lists.linux.dev, Adam Ford <aford173@gmail.com>, Peter Huewe <peterhuewe@gmx.de>, UNGLinuxDriver@microchip.com, Lee Jones <lee.jones@linaro.org>, linux-mtd@lists.infradead.org, Alexey Khoroshilov <khoroshilov@ispras.ru>, Marek Vasut <marex@denx.de>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, alsa-devel@alsa-project.org, Vincenzo Fras
 cino <vincenzo.frascino@arm.com>, Eric Piel <eric.pie
l@tremplin-utc.net>, Herbert Xu <herbert@gondor.apana.org.au>, Tobias Schrammm <t.schramm@manjaro.org>, Richard Weinberger <richard@nod.at>, Tomasz Duszynski <tduszyns@gmail.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-pwm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Thomas Zimmermann <tzimmermann@suse.de>, Bastien Nocera <hadess@hadess.net>, Jingoo Han <jingoohan1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>, Yizhuo <yzhai003@ucr.edu>, Shawn Tu <shawnx.tu@intel.com>, Leon Luo <leonl@leopardimaging.com>, Yan Lei <yan_lei@dahuatech.com>, Akihiro Tsukada <tskd08@gmail.com>, Tudor Ambarus <tudor.ambarus@microchip.com>, Dmitry Rokosov <DDRokosov@sberdevices.ru>, Oliver Graute <oliver.graute@kococonnector.com>, Alistair Francis <alistair@alistair23.me>, Dongliang Mu <mudongliangabcd@gmail.com>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Eduardo Valentin <edubezval@gmail.com>, R
 ui Miguel Silva <rmfrfs@gmail.com>, Michael Srba <Michael.Srba@seznam.cz>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, kasan-dev@googlegroups.com, "Paul J. Murphy" <paul.j.murphy@intel.com>, Nicola Lunghi <nick83ola@gmail.com>, Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Dmitry Vyukov <dvyukov@google.com>, Ramesh Shanmugasundaram <rashanmu@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Juerg Haefliger <juergh@gmail.com>, Oder Chiou <oder_chiou@realtek.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Robert Foss <robert.foss@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>, Luca Ceresoli <luca@lucaceresoli.net>, =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, Colin I
 an King <colin.king@intel.com>, Maximilian Luz <luzma
ximilian@gmail.com>, Helge Deller <deller@gmx.de>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 28, 2022 at 04:03:12PM +0200, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <uwe@kleine-koenig.org>
> 
> The value returned by an i2c driver's remove function is mostly ignored.
> (Only an error message is printed if the value is non-zero that the
> error is ignored.)
> 
> So change the prototype of the remove function to return no value. This
> way driver authors are not tempted to assume that passing an error to
> the upper layer is a good idea. All drivers are adapted accordingly.
> There is no intended change of behaviour, all callbacks were prepared to
> return 0 before.

For IPMI portions below:

Acked-by: Corey Minyard <cninyard@mvista.com>

>  
>  static const struct i2c_device_id lcd2s_i2c_id[] = {
> diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
> index db40037eb347..a0e9e80d92ee 100644
> --- a/drivers/char/ipmi/ipmb_dev_int.c
> +++ b/drivers/char/ipmi/ipmb_dev_int.c
> @@ -341,14 +341,12 @@ static int ipmb_probe(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static int ipmb_remove(struct i2c_client *client)
> +static void ipmb_remove(struct i2c_client *client)
>  {
>  	struct ipmb_dev *ipmb_dev = i2c_get_clientdata(client);
>  
>  	i2c_slave_unregister(client);
>  	misc_deregister(&ipmb_dev->miscdev);
> -
> -	return 0;
>  }
>  
>  static const struct i2c_device_id ipmb_id[] = {
> diff --git a/drivers/char/ipmi/ipmi_ipmb.c b/drivers/char/ipmi/ipmi_ipmb.c
> index ab19b4b3317e..25c010c9ec25 100644
> --- a/drivers/char/ipmi/ipmi_ipmb.c
> +++ b/drivers/char/ipmi/ipmi_ipmb.c
> @@ -424,7 +424,7 @@ static void ipmi_ipmb_request_events(void *send_info)
>  	/* We don't fetch events here. */
>  }
>  
> -static int ipmi_ipmb_remove(struct i2c_client *client)
> +static void ipmi_ipmb_remove(struct i2c_client *client)
>  {
>  	struct ipmi_ipmb_dev *iidev = i2c_get_clientdata(client);
>  
> @@ -438,8 +438,6 @@ static int ipmi_ipmb_remove(struct i2c_client *client)
>  	ipmi_ipmb_stop_thread(iidev);
>  
>  	ipmi_unregister_smi(iidev->intf);
> -
> -	return 0;
>  }
>  
>  static int ipmi_ipmb_probe(struct i2c_client *client)
> diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
> index fc742ee9c046..13da021e7c6b 100644
> --- a/drivers/char/ipmi/ipmi_ssif.c
> +++ b/drivers/char/ipmi/ipmi_ssif.c
> @@ -1281,13 +1281,13 @@ static void shutdown_ssif(void *send_info)
>  	}
>  }
>  
> -static int ssif_remove(struct i2c_client *client)
> +static void ssif_remove(struct i2c_client *client)
>  {
>  	struct ssif_info *ssif_info = i2c_get_clientdata(client);
>  	struct ssif_addr_info *addr_info;
>  
>  	if (!ssif_info)
> -		return 0;
> +		return;
>  
>  	/*
>  	 * After this point, we won't deliver anything asychronously
> @@ -1303,8 +1303,6 @@ static int ssif_remove(struct i2c_client *client)
>  	}
>  
>  	kfree(ssif_info);
> -
> -	return 0;
>  }
>  
>  static int read_response(struct i2c_client *client, unsigned char *resp)
