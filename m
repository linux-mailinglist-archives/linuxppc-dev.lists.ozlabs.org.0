Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4642155FD0A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 12:22:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXyF31B71z3f0N
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 20:21:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=melexis.com header.i=@melexis.com header.a=rsa-sha256 header.s=google header.b=ifAQA9bF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=melexis.com (client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com; envelope-from=cmo@melexis.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=melexis.com header.i=@melexis.com header.a=rsa-sha256 header.s=google header.b=ifAQA9bF;
	dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXtKf4Vyjz3bvb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 17:25:41 +1000 (AEST)
Received: by mail-ot1-x32d.google.com with SMTP id 72-20020a9d064e000000b00616c2a174bcso7376253otn.8
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 00:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=COHALoFBFgfjH17S9e4H2QuLe8QefOv60vpgtdXTqb8=;
        b=ifAQA9bFbyR5DhQJm+4GLlUE1wwcLoWB7Aw7oh6l/aqLLe3uW9ZlSPoH/xsRr9bLlh
         mLj9IyM5+5NStKyDB3A4AZBGgDJ/eodOxTR3uv3dr4WIg3f0ZHK7EgVrP5C0a+4SCJGG
         Al62lWcA+f9Pnqb9HPhkThd/dzeEDyR1fCIxpZnixYpGPjIQYHivR/wo15ie3qh/bYxR
         ieH8XEKOMvjKm2SEwXnslC7Ovfn1BKHPjHFTtoPsLGf77CjuhM/YVfKPUpktgFZICUp0
         gRAq+FfxBFu21ikcIe7ibx4QU527QL6wVmZMrw0njxtJRCfUneuypu9MorCI5nJJu4af
         oOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=COHALoFBFgfjH17S9e4H2QuLe8QefOv60vpgtdXTqb8=;
        b=kGP7f1lslPBBHdiFVG7exYohH42qpSrNIzB+HnE/cDbTV7z+KfD53jnU5Nr/8GTIDt
         zC8w20AxAh2lbCu0ZOmk9krmGHKlbU5jVwTLDWUor6Q8U7u1iOHB4qNffFQ7woJ/FnzW
         Qb4q6U9Kp0LZHZDwhiji+7vJTrMll9S1YdgVidFYj8WD0sGH+9YUzdCHU3gluQuqkcvY
         iWGnemmA9SZUnxp05fgTJJviB/3Is2MrFlsxijgkjidYb6oG70mWj6JZWB14J9JG0Ya4
         vy2sbzLfYtAMRHSF3hSi2K5OWkO2eGasVFJ6znG9xpxvrv5n+LH+DTi1+1+rz9R3J3K4
         KMaw==
X-Gm-Message-State: AJIora+hsk+JSg489WHkLZRJqmfNwpwUdS5grD72mkVTngS9K9FmwakM
	fJ6Sskb07TOLbIPq3yAXGYNCzYzVtAYCVYroQyqfmg==
X-Google-Smtp-Source: AGRyM1sVwZEAKwewullZfYgH79Yi43+33o0ihe9VcAJKbXRXloRdhe7VVCZ24TtYGiIDx7pxenmtvhXrmVrTpqKFf8w=
X-Received: by 2002:a9d:4101:0:b0:616:ab53:bc34 with SMTP id
 o1-20020a9d4101000000b00616ab53bc34mr830868ote.300.1656487535935; Wed, 29 Jun
 2022 00:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de> <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
From: Crt Mori <cmo@melexis.com>
Date: Wed, 29 Jun 2022 09:24:55 +0200
Message-ID: <CAKv63uu1XXP_XptZOeefDS_RVJvu3six5ZnJ9-oOVCPAK4D9aw@mail.gmail.com>
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 29 Jun 2022 20:19:09 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ricardo Ribalda <ribalda@kernel.org>, Jimmy Su <jimmy.su@intel.com>, Linus Walleij <linus.walleij@linaro.org>, Sekhar Nori <nsekhar@ti.com>, Gwendal Grignou <gwendal@chromium.org>, dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Paul Mackerras <paulus@samba.org>, Moses Christopher Bollavarapu <mosescb.dev@gmail.com>, Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Evgeniy Polyakov <zbr@ioremap.net>, Matt Johnston <matt@codeconstruct.com.au>, Olli Salonen <olli.salonen@iki.fi>, Angela Czubak <acz@semihalf.com>, Robert Marko <robert.marko@sartura.hr>, Luka Perkov <luka.perkov@sartura.hr>, Sean Young <sean@mess.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Zheyu Ma <zheyuma97@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-omap@vger.kernel.org, An
 tti Palosaari <crope@iki.fi>, Wenyou Yang <wenyou.yang@microchip.com>, Dongchun Zhu <dongchun.zhu@mediatek.com>, Miaoqian Lin <linmq006@gmail.com>, Steve Longerbeam <slongerbeam@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>, Shunqian Zheng <zhengsq@rock-chips.com>, lijian <lijian@yulong.com>, Dan Carpenter <dan.carpenter@oracle.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Viorel Suman <viorel.suman@nxp.com>, Petr Machata <petrm@nvidia.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Jean Delvare <jdelvare@suse.com>, linux-serial@vger.kernel.org, linux-pm@vger.kernel.org, Eddie James <eajames@linux.ibm.com>, Riku Voipio <riku.voipio@iki.fi>, James Schulman <james.schulman@cirrus.com>, Scott Wood <oss@buserror.net>, Cai Huoqing <cai.huoqing@linux.dev>, Jonas Malaco <jonas@protocubo.io>, Hsin-Yi Wang <hsinyi@chromium.org>, Haibo Chen <haibo.chen@nxp.com>, Petr Cvek <petrcvekcz@gmail.com>, linux-leds@vger.kernel.org, Joe Tessler <jrt@google.com>, Andrey Konovalov <
 andreyknvl@gmail.com>, Andy Shevchenko <andy@kernel.o

rg>, Robert Jones <rjones@gateworks.com>, George Joseph <george.joseph@fairview5.com>, Vincent Knecht <vincent.knecht@mailoo.org>, Robin van der Gracht <robin@protonic.nl>, Randy Dunlap <rdunlap@infradead.org>, linux-stm32@st-md-mailman.stormreply.com, Michael Tretter <m.tretter@pengutronix.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Phong LE <ple@baylibre.com>, Daniel Beer <daniel.beer@igorinstitute.com>, Krzysztof Opasiak <k.opasiak@samsung.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Heungjun Kim <riverful.kim@samsung.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, David Lin <CTLIN0@nuvoton.com>, Vladimir Oltean <olteanv@gmail.com>, David Rhodes <david.rhodes@cirrus.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Dan Robertson <dan@dlrobertson.com>, Martyn Welch <martyn.welch@collab
 ora.co.uk>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, Jon Nettleton <jon.nettleton@gmail.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Marco Felsch <m.felsch@pengutronix.de>, Wim Van Sebroeck <wim@linux-watchdog.org>, Sebastian Reichel <sre@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org, Martiros Shakhzadyan <vrzh@vrzh.net>, Guenter Roeck <groeck@chromium.org>, Matthias Schwarzott <zzam@gentoo.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Eric Dumazet <edumazet@google.com>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, Saranya Gopal <saranya.gopal@intel.com>, Lars-Peter Clausen <lars@metafoo.de>, Corey Minyard <minyard@acm.org>, Evgeny Novikov <novikov@ispras.ru>, Frank Rowand <frowand.list@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Manivannan Sadhasivam <mani@kernel.org>, Pierre-Lo
 uis Bossart <pierre-louis.bossart@linux.intel.com>, M
inghao Chi <chi.minghao@zte.com.cn>, linux-clk@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Charles Gorand <charles.gorand@effinnov.com>, Jagan Teki <jagan@amarulasolutions.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Miguel Ojeda <ojeda@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Martin Donnelly <martin.donnelly@ge.com>, Woojung Huh <woojung.huh@microchip.com>, Rudolf Marek <r.marek@assembler.cz>, Charles Keepax <ckeepax@opensource.cirrus.com>, linux-watchdog@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>, Ido Schimmel <idosch@nvidia.com>, acpi4asus-user@lists.sourceforge.net, Simon Trimmer <simont@opensource.cirrus.com>, Ricard Wanderlof <ricardw@axis.com>, Rikard Falkeborn <rikard.falkeborn@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, Jiri Valek - 2N <valek@2n.cz>, linux-rpi-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, Wayne 
 Chang <waynec@nvidia.com>, Chen-Yu Tsai <wens@csie.org>, Sing-Han Chen <singhanc@nvidia.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Hans de Goede <hdegoede@redhat.com>, Stephen Boyd <sboyd@kernel.org>, Maslov Dmitry <maslovdmitry@seeed.cc>, linux-gpio@vger.kernel.org, Jens Frederich <jfrederich@gmail.com>, Douglas Anderson <dianders@chromium.org>, linux-media@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Wolfram Sang <wsa@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, linux-usb@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, CGEL ZTE <cgel.zte@gmail.com>, Colin Leroy <colin@colino.net>, platform-driver-x86@vger.kernel.org, linux-integrity@vger.kernel.org, Kevin Tsai <ktsai@capellamicro.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Daniel Palmer <daniel@0x0f
 .com>, Arec Kao <arec.kao@intel.com>, Dmitry Rokosov 
<DDRokosov@sberdevices.ru>, Jose Cazarin <joseespiriki@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org, Tom Rix <trix@redhat.com>, Michael Turquette <mturquette@baylibre.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Jan-Simon Moeller <jansimon.moeller@gmx.de>, Wei Yongjun <weiyongjun1@huawei.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Nikita Travkin <nikita@trvn.ru>, Jeremy Kerr <jk@codeconstruct.com.au>, Jasmin Jessich <jasmin@anw.at>, Sam Ravnborg <sam@ravnborg.org>, Kevin Cernekee <cernekee@chromium.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-rtc@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Lucas Tanure <tanureal@opensource.cirrus.com>, Stefan Mavrodiev <stefan@olimex.com>, Masahiro Yamada <masahiroy@kernel.org>, Sylvain Peti
 not <sylvain.petinot@foss.st.com>, netdev@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Xin Ji <xji@analogixsemi.com>, Seven Lee <wtli@nuvoton.com>, Matt Ranostay <matt.ranostay@konsulko.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Adrien Grassein <adrien.grassein@gmail.com>, Yang Yingliang <yangyingliang@huawei.com>, chrome-platform@lists.linux.dev, Mats Randgaard <matrandg@cisco.com>, Paolo Abeni <pabeni@redhat.com>, Alexey Dobriyan <adobriyan@gmail.com>, Joel Stanley <joel@jms.id.au>, linux-input@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Lyude Paul <lyude@redhat.com>, Kees Cook <keescook@chromium.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>, Jonas Karlman <jonas@kwiboo.se>, Yang Li <yang.lee@linux.alibaba.com>, Tim Harvey <tharvey@gateworks.com>, Jiri Kosina <jikos@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, Mark Gross <markgross@kernel.org>, R
 ichard Fitzgerald <rf@opensource.cirrus.com>, Mark Br
own <broonie@kernel.org>, wengjianfeng <wengjianfeng@yulong.com>, Maxime Ripard <maxime@cerno.tech>, Sven Peter <sven@svenpeter.dev>, Martin Kepplinger <martink@posteo.de>, openipmi-developer@lists.sourceforge.net, Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>, "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-hwmon@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Support Opensource <support.opensource@diasemi.com>, Alexandru Ardelean <ardeleanalex@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Marc Hulsman <m.hulsman@tudelft.nl>, Corentin Chary <corentin.chary@gmail.com>, Stephen Kitt <steve@sk2.org>, Daniel Scally <djrscally@gmail.com>, linux-fbdev@vger.kernel.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Kirill Shilimanov <kirill.shilimanov@huawei.com>, Sakari Ailus <sakari
 .ailus@linux.intel.com>, patches@opensource.cirrus.com, Zheng Yongjun <zhengyongjun3@huawei.com>, Alejandro Tafalla <atafalla@dnyon.com>, Peter Rosin <peda@axentia.se>, Arnaud Ferraris <arnaud.ferraris@collabora.com>, Hector Martin <marcan@marcan.st>, Vignesh Raghavendra <vigneshr@ti.com>, Nick Dyer <nick@shmanahar.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tony Lindgren <tony@atomide.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Takashi Iwai <tiwai@suse.com>, Paul Cercueil <paul@crapouillou.net>, George McCollister <george.mccollister@gmail.com>, Mac Chiang <mac.chiang@intel.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, Alexander Potapenko <glider@google.com>, linux-staging@lists.linux.dev, Adam Ford <aford173@gmail.com>, Peter Huewe <peterhuewe@gmx.de>, UNGLinuxDriver@microchip.com, Lee Jones <lee.jones@linaro.org>, linux-mtd@lists.infradead.org, Alexey Khoroshilov <khoroshilov@ispras.ru>, Marek Vasut <marex@denx.de>, Paul Kocialkowski <paul.kocialkowski
 @bootlin.com>, alsa-devel@alsa-project.org, Vincenzo 
Frascino <vincenzo.frascino@arm.com>, Eric Piel <eric.piel@tremplin-utc.net>, Herbert Xu <herbert@gondor.apana.org.au>, Tobias Schrammm <t.schramm@manjaro.org>, Richard Weinberger <richard@nod.at>, Tomasz Duszynski <tduszyns@gmail.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-pwm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Thomas Zimmermann <tzimmermann@suse.de>, Bastien Nocera <hadess@hadess.net>, Jingoo Han <jingoohan1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>, Yizhuo <yzhai003@ucr.edu>, Shawn Tu <shawnx.tu@intel.com>, Leon Luo <leonl@leopardimaging.com>, Yan Lei <yan_lei@dahuatech.com>, Akihiro Tsukada <tskd08@gmail.com>, Tudor Ambarus <tudor.ambarus@microchip.com>, Oliver Graute <oliver.graute@kococonnector.com>, Alistair Francis <alistair@alistair23.me>, Dongliang Mu <mudongliangabcd@gmail.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Eduardo Valentin <edubezval
 @gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Michael Srba <Michael.Srba@seznam.cz>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, kasan-dev@googlegroups.com, "Paul J. Murphy" <paul.j.murphy@intel.com>, Nicola Lunghi <nick83ola@gmail.com>, Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Dmitry Vyukov <dvyukov@google.com>, Ramesh Shanmugasundaram <rashanmu@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Juerg Haefliger <juergh@gmail.com>, Oder Chiou <oder_chiou@realtek.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Robert Foss <robert.foss@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, Luca Ceresoli <luca@lucaceresoli.net>, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, Johannes Berg <johannes@sipsolutions
 .net>, Colin Ian King <colin.king@intel.com>, Maximil
ian Luz <luzmaximilian@gmail.com>, Helge Deller <deller@gmx.de>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Jun 2022 at 16:04, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> From: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
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
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  Documentation/i2c/writing-clients.rst                     | 2 +-
>  arch/arm/mach-davinci/board-dm644x-evm.c                  | 3 +--
>  arch/arm/mach-davinci/board-dm646x-evm.c                  | 3 +--
>  arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c            | 3 +--
>  drivers/auxdisplay/ht16k33.c                              | 4 +---
>  drivers/auxdisplay/lcd2s.c                                | 3 +--
>  drivers/char/ipmi/ipmb_dev_int.c                          | 4 +---
>  drivers/char/ipmi/ipmi_ipmb.c                             | 4 +---
>  drivers/char/ipmi/ipmi_ssif.c                             | 6 ++----
>  drivers/char/tpm/st33zp24/i2c.c                           | 4 +---
>  drivers/char/tpm/tpm_i2c_atmel.c                          | 3 +--
>  drivers/char/tpm/tpm_i2c_infineon.c                       | 4 +---
>  drivers/char/tpm/tpm_i2c_nuvoton.c                        | 3 +--
>  drivers/char/tpm/tpm_tis_i2c_cr50.c                       | 6 ++----
>  drivers/clk/clk-cdce706.c                                 | 3 +--
>  drivers/clk/clk-cs2000-cp.c                               | 4 +---
>  drivers/clk/clk-si514.c                                   | 3 +--
>  drivers/clk/clk-si5341.c                                  | 4 +---
>  drivers/clk/clk-si5351.c                                  | 4 +---
>  drivers/clk/clk-si570.c                                   | 3 +--
>  drivers/clk/clk-versaclock5.c                             | 4 +---
>  drivers/crypto/atmel-ecc.c                                | 6 ++----
>  drivers/crypto/atmel-sha204a.c                            | 6 ++----
>  drivers/extcon/extcon-rt8973a.c                           | 4 +---
>  drivers/gpio/gpio-adp5588.c                               | 4 +---
>  drivers/gpio/gpio-max7300.c                               | 4 +---
>  drivers/gpio/gpio-pca953x.c                               | 4 +---
>  drivers/gpio/gpio-pcf857x.c                               | 4 +---
>  drivers/gpio/gpio-tpic2810.c                              | 4 +---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c              | 4 +---
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c        | 4 +---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c        | 4 +---
>  drivers/gpu/drm/bridge/analogix/anx7625.c                 | 4 +---
>  drivers/gpu/drm/bridge/chrontel-ch7033.c                  | 4 +---
>  drivers/gpu/drm/bridge/cros-ec-anx7688.c                  | 4 +---
>  drivers/gpu/drm/bridge/ite-it6505.c                       | 4 +---
>  drivers/gpu/drm/bridge/ite-it66121.c                      | 4 +---
>  drivers/gpu/drm/bridge/lontium-lt8912b.c                  | 3 +--
>  drivers/gpu/drm/bridge/lontium-lt9211.c                   | 4 +---
>  drivers/gpu/drm/bridge/lontium-lt9611.c                   | 4 +---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c                | 4 +---
>  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c  | 8 ++------
>  drivers/gpu/drm/bridge/nxp-ptn3460.c                      | 4 +---
>  drivers/gpu/drm/bridge/parade-ps8622.c                    | 4 +---
>  drivers/gpu/drm/bridge/parade-ps8640.c                    | 4 +---
>  drivers/gpu/drm/bridge/sii902x.c                          | 4 +---
>  drivers/gpu/drm/bridge/sii9234.c                          | 4 +---
>  drivers/gpu/drm/bridge/sil-sii8620.c                      | 4 +---
>  drivers/gpu/drm/bridge/tc358767.c                         | 4 +---
>  drivers/gpu/drm/bridge/tc358768.c                         | 4 +---
>  drivers/gpu/drm/bridge/tc358775.c                         | 4 +---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c                     | 4 +---
>  drivers/gpu/drm/bridge/ti-tfp410.c                        | 4 +---
>  drivers/gpu/drm/i2c/ch7006_drv.c                          | 4 +---
>  drivers/gpu/drm/i2c/tda9950.c                             | 4 +---
>  drivers/gpu/drm/i2c/tda998x_drv.c                         | 3 +--
>  drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c        | 4 +---
>  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c     | 4 +---
>  drivers/gpu/drm/solomon/ssd130x-i2c.c                     | 4 +---
>  drivers/hid/i2c-hid/i2c-hid-core.c                        | 4 +---
>  drivers/hid/i2c-hid/i2c-hid.h                             | 2 +-
>  drivers/hwmon/adc128d818.c                                | 4 +---
>  drivers/hwmon/adt7470.c                                   | 3 +--
>  drivers/hwmon/asb100.c                                    | 6 ++----
>  drivers/hwmon/asc7621.c                                   | 4 +---
>  drivers/hwmon/dme1737.c                                   | 4 +---
>  drivers/hwmon/f75375s.c                                   | 5 ++---
>  drivers/hwmon/fschmd.c                                    | 6 ++----
>  drivers/hwmon/ftsteutates.c                               | 3 +--
>  drivers/hwmon/ina209.c                                    | 4 +---
>  drivers/hwmon/ina3221.c                                   | 4 +---
>  drivers/hwmon/jc42.c                                      | 3 +--
>  drivers/hwmon/mcp3021.c                                   | 4 +---
>  drivers/hwmon/occ/p8_i2c.c                                | 4 +---
>  drivers/hwmon/pcf8591.c                                   | 3 +--
>  drivers/hwmon/smm665.c                                    | 3 +--
>  drivers/hwmon/tps23861.c                                  | 4 +---
>  drivers/hwmon/w83781d.c                                   | 4 +---
>  drivers/hwmon/w83791d.c                                   | 6 ++----
>  drivers/hwmon/w83792d.c                                   | 6 ++----
>  drivers/hwmon/w83793.c                                    | 6 ++----
>  drivers/hwmon/w83795.c                                    | 4 +---
>  drivers/hwmon/w83l785ts.c                                 | 6 ++----
>  drivers/i2c/i2c-core-base.c                               | 6 +-----
>  drivers/i2c/i2c-slave-eeprom.c                            | 4 +---
>  drivers/i2c/i2c-slave-testunit.c                          | 3 +--
>  drivers/i2c/i2c-smbus.c                                   | 3 +--
>  drivers/i2c/muxes/i2c-mux-ltc4306.c                       | 4 +---
>  drivers/i2c/muxes/i2c-mux-pca9541.c                       | 3 +--
>  drivers/i2c/muxes/i2c-mux-pca954x.c                       | 3 +--
>  drivers/iio/accel/bma180.c                                | 4 +---
>  drivers/iio/accel/bma400_i2c.c                            | 4 +---
>  drivers/iio/accel/bmc150-accel-i2c.c                      | 4 +---
>  drivers/iio/accel/kxcjk-1013.c                            | 4 +---
>  drivers/iio/accel/kxsd9-i2c.c                             | 4 +---
>  drivers/iio/accel/mc3230.c                                | 4 +---
>  drivers/iio/accel/mma7455_i2c.c                           | 4 +---
>  drivers/iio/accel/mma7660.c                               | 4 +---
>  drivers/iio/accel/mma8452.c                               | 4 +---
>  drivers/iio/accel/mma9551.c                               | 4 +---
>  drivers/iio/accel/mma9553.c                               | 4 +---
>  drivers/iio/accel/stk8312.c                               | 4 +---
>  drivers/iio/accel/stk8ba50.c                              | 4 +---
>  drivers/iio/adc/ad799x.c                                  | 4 +---
>  drivers/iio/adc/ina2xx-adc.c                              | 4 +---
>  drivers/iio/adc/ltc2497.c                                 | 4 +---
>  drivers/iio/adc/ti-ads1015.c                              | 4 +---
>  drivers/iio/chemical/atlas-sensor.c                       | 4 +---
>  drivers/iio/chemical/ccs811.c                             | 4 +---
>  drivers/iio/chemical/sgp30.c                              | 4 +---
>  drivers/iio/dac/ad5380.c                                  | 4 +---
>  drivers/iio/dac/ad5446.c                                  | 4 +---
>  drivers/iio/dac/ad5593r.c                                 | 4 +---
>  drivers/iio/dac/ad5696-i2c.c                              | 4 +---
>  drivers/iio/dac/ds4424.c                                  | 4 +---
>  drivers/iio/dac/m62332.c                                  | 4 +---
>  drivers/iio/dac/mcp4725.c                                 | 4 +---
>  drivers/iio/dac/ti-dac5571.c                              | 4 +---
>  drivers/iio/gyro/bmg160_i2c.c                             | 4 +---
>  drivers/iio/gyro/fxas21002c_i2c.c                         | 4 +---
>  drivers/iio/gyro/itg3200_core.c                           | 4 +---
>  drivers/iio/gyro/mpu3050-i2c.c                            | 4 +---
>  drivers/iio/health/afe4404.c                              | 4 +---
>  drivers/iio/health/max30100.c                             | 4 +---
>  drivers/iio/health/max30102.c                             | 4 +---
>  drivers/iio/humidity/hdc2010.c                            | 4 +---
>  drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c                 | 4 +---
>  drivers/iio/imu/kmx61.c                                   | 4 +---
>  drivers/iio/light/apds9300.c                              | 4 +---
>  drivers/iio/light/apds9960.c                              | 4 +---
>  drivers/iio/light/bh1750.c                                | 4 +---
>  drivers/iio/light/bh1780.c                                | 4 +---
>  drivers/iio/light/cm3232.c                                | 4 +---
>  drivers/iio/light/cm36651.c                               | 4 +---
>  drivers/iio/light/gp2ap002.c                              | 4 +---
>  drivers/iio/light/gp2ap020a00f.c                          | 4 +---
>  drivers/iio/light/isl29028.c                              | 4 +---
>  drivers/iio/light/isl29125.c                              | 4 +---
>  drivers/iio/light/jsa1212.c                               | 4 +---
>  drivers/iio/light/ltr501.c                                | 4 +---
>  drivers/iio/light/opt3001.c                               | 6 ++----
>  drivers/iio/light/pa12203001.c                            | 4 +---
>  drivers/iio/light/rpr0521.c                               | 4 +---
>  drivers/iio/light/stk3310.c                               | 4 +---
>  drivers/iio/light/tcs3472.c                               | 4 +---
>  drivers/iio/light/tsl2563.c                               | 4 +---
>  drivers/iio/light/tsl2583.c                               | 4 +---
>  drivers/iio/light/tsl4531.c                               | 4 +---
>  drivers/iio/light/us5182d.c                               | 4 +---
>  drivers/iio/light/vcnl4000.c                              | 4 +---
>  drivers/iio/light/vcnl4035.c                              | 4 +---
>  drivers/iio/light/veml6070.c                              | 4 +---
>  drivers/iio/magnetometer/ak8974.c                         | 4 +---
>  drivers/iio/magnetometer/ak8975.c                         | 4 +---
>  drivers/iio/magnetometer/bmc150_magn_i2c.c                | 4 +---
>  drivers/iio/magnetometer/hmc5843_i2c.c                    | 4 +---
>  drivers/iio/magnetometer/mag3110.c                        | 4 +---
>  drivers/iio/magnetometer/yamaha-yas530.c                  | 4 +---
>  drivers/iio/potentiostat/lmp91000.c                       | 4 +---
>  drivers/iio/pressure/mpl3115.c                            | 4 +---
>  drivers/iio/pressure/ms5611_i2c.c                         | 4 +---
>  drivers/iio/pressure/zpa2326_i2c.c                        | 4 +---
>  drivers/iio/proximity/pulsedlight-lidar-lite-v2.c         | 4 +---
>  drivers/iio/proximity/sx9500.c                            | 4 +---
>  drivers/iio/temperature/mlx90614.c                        | 4 +---
>  drivers/iio/temperature/mlx90632.c                        | 4 +---
>  drivers/input/joystick/as5011.c                           | 4 +---
>  drivers/input/keyboard/adp5588-keys.c                     | 4 +---
>  drivers/input/keyboard/lm8323.c                           | 4 +---
>  drivers/input/keyboard/lm8333.c                           | 4 +---
>  drivers/input/keyboard/mcs_touchkey.c                     | 4 +---
>  drivers/input/keyboard/qt1070.c                           | 4 +---
>  drivers/input/keyboard/qt2160.c                           | 4 +---
>  drivers/input/keyboard/tca6416-keypad.c                   | 4 +---
>  drivers/input/misc/adxl34x-i2c.c                          | 4 +---
>  drivers/input/misc/bma150.c                               | 4 +---
>  drivers/input/misc/cma3000_d0x_i2c.c                      | 4 +---
>  drivers/input/misc/pcf8574_keypad.c                       | 4 +---
>  drivers/input/mouse/synaptics_i2c.c                       | 4 +---
>  drivers/input/rmi4/rmi_smbus.c                            | 4 +---
>  drivers/input/touchscreen/atmel_mxt_ts.c                  | 4 +---
>  drivers/input/touchscreen/bu21013_ts.c                    | 4 +---
>  drivers/input/touchscreen/cyttsp4_i2c.c                   | 4 +---
>  drivers/input/touchscreen/edt-ft5x06.c                    | 4 +---
>  drivers/input/touchscreen/goodix.c                        | 4 +---
>  drivers/input/touchscreen/migor_ts.c                      | 4 +---
>  drivers/input/touchscreen/s6sy761.c                       | 4 +---
>  drivers/input/touchscreen/stmfts.c                        | 4 +---
>  drivers/input/touchscreen/tsc2004.c                       | 4 +---
>  drivers/leds/flash/leds-as3645a.c                         | 4 +---
>  drivers/leds/flash/leds-lm3601x.c                         | 4 +---
>  drivers/leds/flash/leds-rt4505.c                          | 3 +--
>  drivers/leds/leds-an30259a.c                              | 4 +---
>  drivers/leds/leds-aw2013.c                                | 4 +---
>  drivers/leds/leds-bd2802.c                                | 4 +---
>  drivers/leds/leds-blinkm.c                                | 3 +--
>  drivers/leds/leds-is31fl319x.c                            | 3 +--
>  drivers/leds/leds-is31fl32xx.c                            | 4 +---
>  drivers/leds/leds-lm3530.c                                | 3 +--
>  drivers/leds/leds-lm3532.c                                | 4 +---
>  drivers/leds/leds-lm355x.c                                | 4 +---
>  drivers/leds/leds-lm3642.c                                | 3 +--
>  drivers/leds/leds-lm3692x.c                               | 4 +---
>  drivers/leds/leds-lm3697.c                                | 4 +---
>  drivers/leds/leds-lp3944.c                                | 4 +---
>  drivers/leds/leds-lp3952.c                                | 4 +---
>  drivers/leds/leds-lp50xx.c                                | 4 +---
>  drivers/leds/leds-lp5521.c                                | 4 +---
>  drivers/leds/leds-lp5523.c                                | 4 +---
>  drivers/leds/leds-lp5562.c                                | 4 +---
>  drivers/leds/leds-lp8501.c                                | 4 +---
>  drivers/leds/leds-lp8860.c                                | 4 +---
>  drivers/leds/leds-pca9532.c                               | 6 ++----
>  drivers/leds/leds-tca6507.c                               | 4 +---
>  drivers/leds/leds-turris-omnia.c                          | 4 +---
>  drivers/macintosh/ams/ams-i2c.c                           | 4 +---
>  drivers/macintosh/therm_adt746x.c                         | 4 +---
>  drivers/macintosh/therm_windtunnel.c                      | 4 +---
>  drivers/macintosh/windfarm_ad7417_sensor.c                | 4 +---
>  drivers/macintosh/windfarm_fcu_controls.c                 | 3 +--
>  drivers/macintosh/windfarm_lm75_sensor.c                  | 4 +---
>  drivers/macintosh/windfarm_lm87_sensor.c                  | 4 +---
>  drivers/macintosh/windfarm_max6690_sensor.c               | 4 +---
>  drivers/macintosh/windfarm_smu_sat.c                      | 4 +---
>  drivers/media/cec/i2c/ch7322.c                            | 4 +---
>  drivers/media/dvb-frontends/a8293.c                       | 3 +--
>  drivers/media/dvb-frontends/af9013.c                      | 4 +---
>  drivers/media/dvb-frontends/af9033.c                      | 4 +---
>  drivers/media/dvb-frontends/au8522_decoder.c              | 3 +--
>  drivers/media/dvb-frontends/cxd2099.c                     | 4 +---
>  drivers/media/dvb-frontends/cxd2820r_core.c               | 4 +---
>  drivers/media/dvb-frontends/dvb-pll.c                     | 3 +--
>  drivers/media/dvb-frontends/lgdt3306a.c                   | 4 +---
>  drivers/media/dvb-frontends/lgdt330x.c                    | 4 +---
>  drivers/media/dvb-frontends/m88ds3103.c                   | 3 +--
>  drivers/media/dvb-frontends/mn88443x.c                    | 4 +---
>  drivers/media/dvb-frontends/mn88472.c                     | 4 +---
>  drivers/media/dvb-frontends/mn88473.c                     | 4 +---
>  drivers/media/dvb-frontends/mxl692.c                      | 4 +---
>  drivers/media/dvb-frontends/rtl2830.c                     | 4 +---
>  drivers/media/dvb-frontends/rtl2832.c                     | 4 +---
>  drivers/media/dvb-frontends/si2165.c                      | 3 +--
>  drivers/media/dvb-frontends/si2168.c                      | 4 +---
>  drivers/media/dvb-frontends/sp2.c                         | 3 +--
>  drivers/media/dvb-frontends/stv090x.c                     | 3 +--
>  drivers/media/dvb-frontends/stv6110x.c                    | 3 +--
>  drivers/media/dvb-frontends/tc90522.c                     | 3 +--
>  drivers/media/dvb-frontends/tda10071.c                    | 3 +--
>  drivers/media/dvb-frontends/ts2020.c                      | 3 +--
>  drivers/media/i2c/ad5820.c                                | 3 +--
>  drivers/media/i2c/ad9389b.c                               | 3 +--
>  drivers/media/i2c/adp1653.c                               | 4 +---
>  drivers/media/i2c/adv7170.c                               | 3 +--
>  drivers/media/i2c/adv7175.c                               | 3 +--
>  drivers/media/i2c/adv7180.c                               | 4 +---
>  drivers/media/i2c/adv7183.c                               | 3 +--
>  drivers/media/i2c/adv7343.c                               | 4 +---
>  drivers/media/i2c/adv7393.c                               | 4 +---
>  drivers/media/i2c/adv748x/adv748x-core.c                  | 4 +---
>  drivers/media/i2c/adv7511-v4l2.c                          | 3 +--
>  drivers/media/i2c/adv7604.c                               | 3 +--
>  drivers/media/i2c/adv7842.c                               | 3 +--
>  drivers/media/i2c/ak7375.c                                | 4 +---
>  drivers/media/i2c/ak881x.c                                | 4 +---
>  drivers/media/i2c/bt819.c                                 | 3 +--
>  drivers/media/i2c/bt856.c                                 | 3 +--
>  drivers/media/i2c/bt866.c                                 | 3 +--
>  drivers/media/i2c/ccs/ccs-core.c                          | 4 +---
>  drivers/media/i2c/cs3308.c                                | 3 +--
>  drivers/media/i2c/cs5345.c                                | 3 +--
>  drivers/media/i2c/cs53l32a.c                              | 3 +--
>  drivers/media/i2c/cx25840/cx25840-core.c                  | 3 +--
>  drivers/media/i2c/dw9714.c                                | 4 +---
>  drivers/media/i2c/dw9768.c                                | 4 +---
>  drivers/media/i2c/dw9807-vcm.c                            | 4 +---
>  drivers/media/i2c/et8ek8/et8ek8_driver.c                  | 4 +---
>  drivers/media/i2c/hi556.c                                 | 4 +---
>  drivers/media/i2c/hi846.c                                 | 4 +---
>  drivers/media/i2c/hi847.c                                 | 4 +---
>  drivers/media/i2c/imx208.c                                | 4 +---
>  drivers/media/i2c/imx214.c                                | 4 +---
>  drivers/media/i2c/imx219.c                                | 4 +---
>  drivers/media/i2c/imx258.c                                | 4 +---
>  drivers/media/i2c/imx274.c                                | 3 +--
>  drivers/media/i2c/imx290.c                                | 4 +---
>  drivers/media/i2c/imx319.c                                | 4 +---
>  drivers/media/i2c/imx334.c                                | 4 +---
>  drivers/media/i2c/imx335.c                                | 4 +---
>  drivers/media/i2c/imx355.c                                | 4 +---
>  drivers/media/i2c/imx412.c                                | 4 +---
>  drivers/media/i2c/ir-kbd-i2c.c                            | 4 +---
>  drivers/media/i2c/isl7998x.c                              | 4 +---
>  drivers/media/i2c/ks0127.c                                | 3 +--
>  drivers/media/i2c/lm3560.c                                | 4 +---
>  drivers/media/i2c/lm3646.c                                | 4 +---
>  drivers/media/i2c/m52790.c                                | 3 +--
>  drivers/media/i2c/m5mols/m5mols_core.c                    | 4 +---
>  drivers/media/i2c/max2175.c                               | 4 +---
>  drivers/media/i2c/max9286.c                               | 4 +---
>  drivers/media/i2c/ml86v7667.c                             | 4 +---
>  drivers/media/i2c/msp3400-driver.c                        | 3 +--
>  drivers/media/i2c/mt9m001.c                               | 4 +---
>  drivers/media/i2c/mt9m032.c                               | 3 +--
>  drivers/media/i2c/mt9m111.c                               | 4 +---
>  drivers/media/i2c/mt9p031.c                               | 4 +---
>  drivers/media/i2c/mt9t001.c                               | 3 +--
>  drivers/media/i2c/mt9t112.c                               | 4 +---
>  drivers/media/i2c/mt9v011.c                               | 4 +---
>  drivers/media/i2c/mt9v032.c                               | 4 +---
>  drivers/media/i2c/mt9v111.c                               | 4 +---
>  drivers/media/i2c/noon010pc30.c                           | 4 +---
>  drivers/media/i2c/og01a1b.c                               | 4 +---
>  drivers/media/i2c/ov02a10.c                               | 4 +---
>  drivers/media/i2c/ov08d10.c                               | 4 +---
>  drivers/media/i2c/ov13858.c                               | 4 +---
>  drivers/media/i2c/ov13b10.c                               | 4 +---
>  drivers/media/i2c/ov2640.c                                | 3 +--
>  drivers/media/i2c/ov2659.c                                | 4 +---
>  drivers/media/i2c/ov2680.c                                | 4 +---
>  drivers/media/i2c/ov2685.c                                | 4 +---
>  drivers/media/i2c/ov2740.c                                | 4 +---
>  drivers/media/i2c/ov5640.c                                | 4 +---
>  drivers/media/i2c/ov5645.c                                | 4 +---
>  drivers/media/i2c/ov5647.c                                | 4 +---
>  drivers/media/i2c/ov5648.c                                | 4 +---
>  drivers/media/i2c/ov5670.c                                | 4 +---
>  drivers/media/i2c/ov5675.c                                | 4 +---
>  drivers/media/i2c/ov5693.c                                | 4 +---
>  drivers/media/i2c/ov5695.c                                | 4 +---
>  drivers/media/i2c/ov6650.c                                | 3 +--
>  drivers/media/i2c/ov7251.c                                | 4 +---
>  drivers/media/i2c/ov7640.c                                | 4 +---
>  drivers/media/i2c/ov7670.c                                | 3 +--
>  drivers/media/i2c/ov772x.c                                | 4 +---
>  drivers/media/i2c/ov7740.c                                | 3 +--
>  drivers/media/i2c/ov8856.c                                | 4 +---
>  drivers/media/i2c/ov8865.c                                | 4 +---
>  drivers/media/i2c/ov9282.c                                | 4 +---
>  drivers/media/i2c/ov9640.c                                | 4 +---
>  drivers/media/i2c/ov9650.c                                | 4 +---
>  drivers/media/i2c/ov9734.c                                | 4 +---
>  drivers/media/i2c/rdacm20.c                               | 4 +---
>  drivers/media/i2c/rdacm21.c                               | 4 +---
>  drivers/media/i2c/rj54n1cb0c.c                            | 4 +---
>  drivers/media/i2c/s5c73m3/s5c73m3-core.c                  | 4 +---
>  drivers/media/i2c/s5k4ecgx.c                              | 4 +---
>  drivers/media/i2c/s5k5baf.c                               | 4 +---
>  drivers/media/i2c/s5k6a3.c                                | 3 +--
>  drivers/media/i2c/s5k6aa.c                                | 4 +---
>  drivers/media/i2c/saa6588.c                               | 4 +---
>  drivers/media/i2c/saa6752hs.c                             | 3 +--
>  drivers/media/i2c/saa7110.c                               | 3 +--
>  drivers/media/i2c/saa7115.c                               | 3 +--
>  drivers/media/i2c/saa7127.c                               | 3 +--
>  drivers/media/i2c/saa717x.c                               | 3 +--
>  drivers/media/i2c/saa7185.c                               | 3 +--
>  drivers/media/i2c/sony-btf-mpx.c                          | 4 +---
>  drivers/media/i2c/sr030pc30.c                             | 3 +--
>  drivers/media/i2c/st-mipid02.c                            | 4 +---
>  drivers/media/i2c/tc358743.c                              | 4 +---
>  drivers/media/i2c/tda1997x.c                              | 4 +---
>  drivers/media/i2c/tda7432.c                               | 3 +--
>  drivers/media/i2c/tda9840.c                               | 3 +--
>  drivers/media/i2c/tea6415c.c                              | 3 +--
>  drivers/media/i2c/tea6420.c                               | 3 +--
>  drivers/media/i2c/ths7303.c                               | 4 +---
>  drivers/media/i2c/ths8200.c                               | 4 +---
>  drivers/media/i2c/tlv320aic23b.c                          | 3 +--
>  drivers/media/i2c/tvaudio.c                               | 3 +--
>  drivers/media/i2c/tvp514x.c                               | 3 +--
>  drivers/media/i2c/tvp5150.c                               | 4 +---
>  drivers/media/i2c/tvp7002.c                               | 3 +--
>  drivers/media/i2c/tw2804.c                                | 3 +--
>  drivers/media/i2c/tw9903.c                                | 3 +--
>  drivers/media/i2c/tw9906.c                                | 3 +--
>  drivers/media/i2c/tw9910.c                                | 4 +---
>  drivers/media/i2c/uda1342.c                               | 3 +--
>  drivers/media/i2c/upd64031a.c                             | 3 +--
>  drivers/media/i2c/upd64083.c                              | 3 +--
>  drivers/media/i2c/video-i2c.c                             | 4 +---
>  drivers/media/i2c/vp27smpx.c                              | 3 +--
>  drivers/media/i2c/vpx3220.c                               | 4 +---
>  drivers/media/i2c/vs6624.c                                | 3 +--
>  drivers/media/i2c/wm8739.c                                | 3 +--
>  drivers/media/i2c/wm8775.c                                | 3 +--
>  drivers/media/radio/radio-tea5764.c                       | 3 +--
>  drivers/media/radio/saa7706h.c                            | 3 +--
>  drivers/media/radio/si470x/radio-si470x-i2c.c             | 3 +--
>  drivers/media/radio/si4713/si4713.c                       | 4 +---
>  drivers/media/radio/tef6862.c                             | 3 +--
>  drivers/media/test-drivers/vidtv/vidtv_demod.c            | 4 +---
>  drivers/media/test-drivers/vidtv/vidtv_tuner.c            | 4 +---
>  drivers/media/tuners/e4000.c                              | 4 +---
>  drivers/media/tuners/fc2580.c                             | 3 +--
>  drivers/media/tuners/m88rs6000t.c                         | 4 +---
>  drivers/media/tuners/mt2060.c                             | 4 +---
>  drivers/media/tuners/mxl301rf.c                           | 3 +--
>  drivers/media/tuners/qm1d1b0004.c                         | 3 +--
>  drivers/media/tuners/qm1d1c0042.c                         | 3 +--
>  drivers/media/tuners/si2157.c                             | 4 +---
>  drivers/media/tuners/tda18212.c                           | 4 +---
>  drivers/media/tuners/tda18250.c                           | 4 +---
>  drivers/media/tuners/tua9001.c                            | 3 +--
>  drivers/media/usb/go7007/s2250-board.c                    | 3 +--
>  drivers/media/v4l2-core/tuner-core.c                      | 3 +--
>  drivers/mfd/88pm800.c                                     | 4 +---
>  drivers/mfd/88pm805.c                                     | 4 +---
>  drivers/mfd/88pm860x-core.c                               | 3 +--
>  drivers/mfd/acer-ec-a500.c                                | 4 +---
>  drivers/mfd/arizona-i2c.c                                 | 4 +---
>  drivers/mfd/axp20x-i2c.c                                  | 4 +---
>  drivers/mfd/da903x.c                                      | 3 +--
>  drivers/mfd/da9052-i2c.c                                  | 3 +--
>  drivers/mfd/da9055-i2c.c                                  | 4 +---
>  drivers/mfd/da9062-core.c                                 | 4 +---
>  drivers/mfd/da9150-core.c                                 | 4 +---
>  drivers/mfd/dm355evm_msp.c                                | 3 +--
>  drivers/mfd/ene-kb3930.c                                  | 4 +---
>  drivers/mfd/gateworks-gsc.c                               | 4 +---
>  drivers/mfd/intel_soc_pmic_core.c                         | 4 +---
>  drivers/mfd/iqs62x.c                                      | 4 +---
>  drivers/mfd/lm3533-core.c                                 | 4 +---
>  drivers/mfd/lp8788.c                                      | 3 +--
>  drivers/mfd/madera-i2c.c                                  | 4 +---
>  drivers/mfd/max14577.c                                    | 4 +---
>  drivers/mfd/max77693.c                                    | 4 +---
>  drivers/mfd/max8907.c                                     | 4 +---
>  drivers/mfd/max8925-i2c.c                                 | 3 +--
>  drivers/mfd/mc13xxx-i2c.c                                 | 3 +--
>  drivers/mfd/menelaus.c                                    | 3 +--
>  drivers/mfd/ntxec.c                                       | 4 +---
>  drivers/mfd/palmas.c                                      | 4 +---
>  drivers/mfd/pcf50633-core.c                               | 4 +---
>  drivers/mfd/retu-mfd.c                                    | 4 +---
>  drivers/mfd/rk808.c                                       | 4 +---
>  drivers/mfd/rn5t618.c                                     | 4 +---
>  drivers/mfd/rsmu_i2c.c                                    | 4 +---
>  drivers/mfd/rt4831.c                                      | 4 +---
>  drivers/mfd/si476x-i2c.c                                  | 4 +---
>  drivers/mfd/stmfx.c                                       | 4 +---
>  drivers/mfd/stmpe-i2c.c                                   | 4 +---
>  drivers/mfd/tc3589x.c                                     | 4 +---
>  drivers/mfd/tps6105x.c                                    | 4 +---
>  drivers/mfd/tps65010.c                                    | 3 +--
>  drivers/mfd/tps65086.c                                    | 4 +---
>  drivers/mfd/tps65217.c                                    | 4 +---
>  drivers/mfd/tps6586x.c                                    | 3 +--
>  drivers/mfd/tps65912-i2c.c                                | 4 +---
>  drivers/mfd/twl-core.c                                    | 3 +--
>  drivers/mfd/twl6040.c                                     | 4 +---
>  drivers/mfd/wm8994-core.c                                 | 4 +---
>  drivers/misc/ad525x_dpot-i2c.c                            | 3 +--
>  drivers/misc/apds9802als.c                                | 3 +--
>  drivers/misc/apds990x.c                                   | 3 +--
>  drivers/misc/bh1770glc.c                                  | 4 +---
>  drivers/misc/ds1682.c                                     | 3 +--
>  drivers/misc/eeprom/at24.c                                | 4 +---
>  drivers/misc/eeprom/ee1004.c                              | 4 +---
>  drivers/misc/eeprom/eeprom.c                              | 4 +---
>  drivers/misc/eeprom/idt_89hpesx.c                         | 4 +---
>  drivers/misc/eeprom/max6875.c                             | 4 +---
>  drivers/misc/hmc6352.c                                    | 3 +--
>  drivers/misc/ics932s401.c                                 | 5 ++---
>  drivers/misc/isl29003.c                                   | 3 +--
>  drivers/misc/isl29020.c                                   | 3 +--
>  drivers/misc/lis3lv02d/lis3lv02d_i2c.c                    | 3 +--
>  drivers/misc/tsl2550.c                                    | 4 +---
>  drivers/mtd/maps/pismo.c                                  | 4 +---
>  drivers/net/dsa/lan9303_i2c.c                             | 6 ++----
>  drivers/net/dsa/microchip/ksz9477_i2c.c                   | 4 +---
>  drivers/net/dsa/xrs700x/xrs700x_i2c.c                     | 6 ++----
>  drivers/net/ethernet/mellanox/mlxsw/i2c.c                 | 4 +---
>  drivers/net/mctp/mctp-i2c.c                               | 3 +--
>  drivers/nfc/fdp/i2c.c                                     | 4 +---
>  drivers/nfc/microread/i2c.c                               | 4 +---
>  drivers/nfc/nfcmrvl/i2c.c                                 | 4 +---
>  drivers/nfc/nxp-nci/i2c.c                                 | 4 +---
>  drivers/nfc/pn533/i2c.c                                   | 4 +---
>  drivers/nfc/pn544/i2c.c                                   | 4 +---
>  drivers/nfc/s3fwrn5/i2c.c                                 | 4 +---
>  drivers/nfc/st-nci/i2c.c                                  | 4 +---
>  drivers/nfc/st21nfca/i2c.c                                | 4 +---
>  drivers/of/unittest.c                                     | 6 ++----
>  drivers/platform/chrome/cros_ec_i2c.c                     | 4 +---
>  drivers/platform/surface/surface3_power.c                 | 4 +---
>  drivers/platform/x86/asus-tf103c-dock.c                   | 4 +---
>  drivers/platform/x86/intel/int3472/tps68470.c             | 4 +---
>  drivers/power/supply/bq2415x_charger.c                    | 4 +---
>  drivers/power/supply/bq24190_charger.c                    | 4 +---
>  drivers/power/supply/bq24257_charger.c                    | 4 +---
>  drivers/power/supply/bq25890_charger.c                    | 4 +---
>  drivers/power/supply/bq27xxx_battery_i2c.c                | 4 +---
>  drivers/power/supply/cw2015_battery.c                     | 3 +--
>  drivers/power/supply/ds2782_battery.c                     | 4 +---
>  drivers/power/supply/lp8727_charger.c                     | 3 +--
>  drivers/power/supply/rt5033_battery.c                     | 4 +---
>  drivers/power/supply/rt9455_charger.c                     | 4 +---
>  drivers/power/supply/smb347-charger.c                     | 4 +---
>  drivers/power/supply/z2_battery.c                         | 4 +---
>  drivers/pwm/pwm-pca9685.c                                 | 4 +---
>  drivers/regulator/da9121-regulator.c                      | 3 +--
>  drivers/regulator/lp8755.c                                | 4 +---
>  drivers/regulator/rpi-panel-attiny-regulator.c            | 4 +---
>  drivers/rtc/rtc-bq32k.c                                   | 4 +---
>  drivers/rtc/rtc-ds1374.c                                  | 4 +---
>  drivers/rtc/rtc-isl12026.c                                | 3 +--
>  drivers/rtc/rtc-m41t80.c                                  | 4 +---
>  drivers/rtc/rtc-rs5c372.c                                 | 3 +--
>  drivers/rtc/rtc-x1205.c                                   | 3 +--
>  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c        | 4 +---
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c        | 4 +---
>  drivers/staging/media/atomisp/i2c/atomisp-lm3554.c        | 4 +---
>  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c       | 3 +--
>  drivers/staging/media/atomisp/i2c/atomisp-ov2680.c        | 4 +---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c        | 4 +---
>  drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c | 4 +---
>  drivers/staging/media/max96712/max96712.c                 | 4 +---
>  drivers/staging/most/i2c/i2c.c                            | 4 +---
>  drivers/staging/olpc_dcon/olpc_dcon.c                     | 4 +---
>  drivers/tty/serial/sc16is7xx.c                            | 4 +---
>  drivers/usb/misc/usb3503.c                                | 4 +---
>  drivers/usb/phy/phy-isp1301-omap.c                        | 4 +---
>  drivers/usb/phy/phy-isp1301.c                             | 4 +---
>  drivers/usb/typec/hd3ss3220.c                             | 4 +---
>  drivers/usb/typec/mux/fsa4480.c                           | 4 +---
>  drivers/usb/typec/mux/pi3usb30532.c                       | 3 +--
>  drivers/usb/typec/rt1719.c                                | 4 +---
>  drivers/usb/typec/stusb160x.c                             | 4 +---
>  drivers/usb/typec/tcpm/fusb302.c                          | 4 +---
>  drivers/usb/typec/tcpm/tcpci.c                            | 4 +---
>  drivers/usb/typec/tcpm/tcpci_maxim.c                      | 4 +---
>  drivers/usb/typec/tcpm/tcpci_rt1711h.c                    | 3 +--
>  drivers/usb/typec/tipd/core.c                             | 4 +---
>  drivers/usb/typec/ucsi/ucsi_ccg.c                         | 4 +---
>  drivers/usb/typec/wusb3801.c                              | 4 +---
>  drivers/video/backlight/adp8860_bl.c                      | 4 +---
>  drivers/video/backlight/adp8870_bl.c                      | 4 +---
>  drivers/video/backlight/arcxcnn_bl.c                      | 4 +---
>  drivers/video/backlight/bd6107.c                          | 4 +---
>  drivers/video/backlight/lm3630a_bl.c                      | 3 +--
>  drivers/video/backlight/lm3639_bl.c                       | 3 +--
>  drivers/video/backlight/lp855x_bl.c                       | 4 +---
>  drivers/video/backlight/lv5207lp.c                        | 4 +---
>  drivers/video/backlight/tosa_bl.c                         | 3 +--
>  drivers/video/fbdev/matrox/matroxfb_maven.c               | 3 +--
>  drivers/video/fbdev/ssd1307fb.c                           | 4 +---
>  drivers/w1/masters/ds2482.c                               | 3 +--
>  drivers/watchdog/ziirave_wdt.c                            | 4 +---
>  include/linux/i2c.h                                       | 2 +-
>  lib/Kconfig.kasan                                         | 1 +
>  sound/aoa/codecs/onyx.c                                   | 3 +--
>  sound/aoa/codecs/tas.c                                    | 3 +--
>  sound/pci/hda/cs35l41_hda_i2c.c                           | 4 +---
>  sound/ppc/keywest.c                                       | 6 ++----
>  sound/soc/codecs/adau1761-i2c.c                           | 3 +--
>  sound/soc/codecs/adau1781-i2c.c                           | 3 +--
>  sound/soc/codecs/ak4375.c                                 | 4 +---
>  sound/soc/codecs/ak4458.c                                 | 4 +---
>  sound/soc/codecs/ak4641.c                                 | 4 +---
>  sound/soc/codecs/ak5558.c                                 | 4 +---
>  sound/soc/codecs/cs35l32.c                                | 4 +---
>  sound/soc/codecs/cs35l33.c                                | 4 +---
>  sound/soc/codecs/cs35l34.c                                | 4 +---
>  sound/soc/codecs/cs35l35.c                                | 4 +---
>  sound/soc/codecs/cs35l36.c                                | 4 +---
>  sound/soc/codecs/cs35l41-i2c.c                            | 4 +---
>  sound/soc/codecs/cs35l45-i2c.c                            | 4 +---
>  sound/soc/codecs/cs4234.c                                 | 4 +---
>  sound/soc/codecs/cs4265.c                                 | 4 +---
>  sound/soc/codecs/cs4270.c                                 | 4 +---
>  sound/soc/codecs/cs42l42.c                                | 4 +---
>  sound/soc/codecs/cs42l51-i2c.c                            | 4 +---
>  sound/soc/codecs/cs42l56.c                                | 3 +--
>  sound/soc/codecs/cs42xx8-i2c.c                            | 4 +---
>  sound/soc/codecs/cs43130.c                                | 4 +---
>  sound/soc/codecs/cs4349.c                                 | 4 +---
>  sound/soc/codecs/cs53l30.c                                | 4 +---
>  sound/soc/codecs/cx2072x.c                                | 3 +--
>  sound/soc/codecs/max98090.c                               | 4 +---
>  sound/soc/codecs/max9860.c                                | 3 +--
>  sound/soc/codecs/max98927.c                               | 4 +---
>  sound/soc/codecs/mt6660.c                                 | 3 +--
>  sound/soc/codecs/nau8821.c                                | 4 +---
>  sound/soc/codecs/nau8825.c                                | 6 ++----
>  sound/soc/codecs/pcm1789-i2c.c                            | 4 +---
>  sound/soc/codecs/pcm3168a-i2c.c                           | 4 +---
>  sound/soc/codecs/pcm512x-i2c.c                            | 3 +--
>  sound/soc/codecs/rt274.c                                  | 4 +---
>  sound/soc/codecs/rt286.c                                  | 4 +---
>  sound/soc/codecs/rt298.c                                  | 4 +---
>  sound/soc/codecs/rt5616.c                                 | 6 ++----
>  sound/soc/codecs/rt5631.c                                 | 6 ++----
>  sound/soc/codecs/rt5645.c                                 | 4 +---
>  sound/soc/codecs/rt5663.c                                 | 4 +---
>  sound/soc/codecs/rt5670.c                                 | 4 +---
>  sound/soc/codecs/rt5677.c                                 | 4 +---
>  sound/soc/codecs/rt5682-i2c.c                             | 4 +---
>  sound/soc/codecs/rt5682s.c                                | 4 +---
>  sound/soc/codecs/rt9120.c                                 | 3 +--
>  sound/soc/codecs/sgtl5000.c                               | 4 +---
>  sound/soc/codecs/sta350.c                                 | 6 ++----
>  sound/soc/codecs/tas2552.c                                | 3 +--
>  sound/soc/codecs/tas5086.c                                | 6 ++----
>  sound/soc/codecs/tas571x.c                                | 4 +---
>  sound/soc/codecs/tas5805m.c                               | 3 +--
>  sound/soc/codecs/tas6424.c                                | 4 +---
>  sound/soc/codecs/tlv320adc3xxx.c                          | 3 +--
>  sound/soc/codecs/tlv320aic32x4-i2c.c                      | 4 +---
>  sound/soc/codecs/tlv320aic3x-i2c.c                        | 4 +---
>  sound/soc/codecs/tlv320dac33.c                            | 4 +---
>  sound/soc/codecs/wm1250-ev1.c                             | 4 +---
>  sound/soc/codecs/wm2200.c                                 | 4 +---
>  sound/soc/codecs/wm5100.c                                 | 4 +---
>  sound/soc/codecs/wm8804-i2c.c                             | 3 +--
>  sound/soc/codecs/wm8900.c                                 | 6 ++----
>  sound/soc/codecs/wm8903.c                                 | 4 +---
>  sound/soc/codecs/wm8960.c                                 | 6 ++----
>  sound/soc/codecs/wm8962.c                                 | 3 +--
>  sound/soc/codecs/wm8993.c                                 | 4 +---
>  sound/soc/codecs/wm8996.c                                 | 4 +---
>  sound/soc/codecs/wm9081.c                                 | 6 ++----
>  621 files changed, 648 insertions(+), 1735 deletions(-)
>
> diff --git a/Documentation/i2c/writing-clients.rst b/Documentation/i2c/wr=
iting-clients.rst
> index e3b126cf4a3b..c1b46844b0fb 100644
> --- a/Documentation/i2c/writing-clients.rst
> +++ b/Documentation/i2c/writing-clients.rst
> @@ -156,7 +156,7 @@ those devices, and a remove() method to unbind.
>  ::
>
>         static int foo_probe(struct i2c_client *client);
> -       static int foo_remove(struct i2c_client *client);
> +       static void foo_remove(struct i2c_client *client);
>
>  Remember that the i2c_driver does not create those client handles.  The
>  handle may be used during foo_probe().  If foo_probe() reports success
> diff --git a/arch/arm/mach-davinci/board-dm644x-evm.c b/arch/arm/mach-dav=
inci/board-dm644x-evm.c
> index 9f405af36a6f..9055da325a3f 100644
> --- a/arch/arm/mach-davinci/board-dm644x-evm.c
> +++ b/arch/arm/mach-davinci/board-dm644x-evm.c
> @@ -554,10 +554,9 @@ static int dm6446evm_msp_probe(struct i2c_client *cl=
ient)
>         return 0;
>  }
>
> -static int dm6446evm_msp_remove(struct i2c_client *client)
> +static void dm6446evm_msp_remove(struct i2c_client *client)
>  {
>         dm6446evm_msp =3D NULL;
> -       return 0;
>  }
>
>  static const struct i2c_device_id dm6446evm_msp_ids[] =3D {
> diff --git a/arch/arm/mach-davinci/board-dm646x-evm.c b/arch/arm/mach-dav=
inci/board-dm646x-evm.c
> index 84ad065e98c2..287bb5833ec0 100644
> --- a/arch/arm/mach-davinci/board-dm646x-evm.c
> +++ b/arch/arm/mach-davinci/board-dm646x-evm.c
> @@ -403,10 +403,9 @@ static int cpld_video_probe(struct i2c_client *clien=
t)
>         return 0;
>  }
>
> -static int cpld_video_remove(struct i2c_client *client)
> +static void cpld_video_remove(struct i2c_client *client)
>  {
>         cpld_client =3D NULL;
> -       return 0;
>  }
>
>  static const struct i2c_device_id cpld_video_id[] =3D {
> diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerp=
c/platforms/83xx/mcu_mpc8349emitx.c
> index abb62fa630ef..77ed61306a73 100644
> --- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> +++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
> @@ -178,7 +178,7 @@ static int mcu_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int mcu_remove(struct i2c_client *client)
> +static void mcu_remove(struct i2c_client *client)
>  {
>         struct mcu *mcu =3D i2c_get_clientdata(client);
>
> @@ -193,7 +193,6 @@ static int mcu_remove(struct i2c_client *client)
>
>         mcu_gpiochip_remove(mcu);
>         kfree(mcu);
> -       return 0;
>  }
>
>  static const struct i2c_device_id mcu_ids[] =3D {
> diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
> index 4fab3b2c7023..02425991c159 100644
> --- a/drivers/auxdisplay/ht16k33.c
> +++ b/drivers/auxdisplay/ht16k33.c
> @@ -775,7 +775,7 @@ static int ht16k33_probe(struct i2c_client *client)
>         return err;
>  }
>
> -static int ht16k33_remove(struct i2c_client *client)
> +static void ht16k33_remove(struct i2c_client *client)
>  {
>         struct ht16k33_priv *priv =3D i2c_get_clientdata(client);
>         struct ht16k33_fbdev *fbdev =3D &priv->fbdev;
> @@ -796,8 +796,6 @@ static int ht16k33_remove(struct i2c_client *client)
>                 device_remove_file(&client->dev, &dev_attr_map_seg14);
>                 break;
>         }
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ht16k33_i2c_match[] =3D {
> diff --git a/drivers/auxdisplay/lcd2s.c b/drivers/auxdisplay/lcd2s.c
> index e465108d9998..135831a16514 100644
> --- a/drivers/auxdisplay/lcd2s.c
> +++ b/drivers/auxdisplay/lcd2s.c
> @@ -340,13 +340,12 @@ static int lcd2s_i2c_probe(struct i2c_client *i2c)
>         return err;
>  }
>
> -static int lcd2s_i2c_remove(struct i2c_client *i2c)
> +static void lcd2s_i2c_remove(struct i2c_client *i2c)
>  {
>         struct lcd2s_data *lcd2s =3D i2c_get_clientdata(i2c);
>
>         charlcd_unregister(lcd2s->charlcd);
>         charlcd_free(lcd2s->charlcd);
> -       return 0;
>  }
>
>  static const struct i2c_device_id lcd2s_i2c_id[] =3D {
> diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_de=
v_int.c
> index db40037eb347..a0e9e80d92ee 100644
> --- a/drivers/char/ipmi/ipmb_dev_int.c
> +++ b/drivers/char/ipmi/ipmb_dev_int.c
> @@ -341,14 +341,12 @@ static int ipmb_probe(struct i2c_client *client)
>         return 0;
>  }
>
> -static int ipmb_remove(struct i2c_client *client)
> +static void ipmb_remove(struct i2c_client *client)
>  {
>         struct ipmb_dev *ipmb_dev =3D i2c_get_clientdata(client);
>
>         i2c_slave_unregister(client);
>         misc_deregister(&ipmb_dev->miscdev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ipmb_id[] =3D {
> diff --git a/drivers/char/ipmi/ipmi_ipmb.c b/drivers/char/ipmi/ipmi_ipmb.=
c
> index ab19b4b3317e..25c010c9ec25 100644
> --- a/drivers/char/ipmi/ipmi_ipmb.c
> +++ b/drivers/char/ipmi/ipmi_ipmb.c
> @@ -424,7 +424,7 @@ static void ipmi_ipmb_request_events(void *send_info)
>         /* We don't fetch events here. */
>  }
>
> -static int ipmi_ipmb_remove(struct i2c_client *client)
> +static void ipmi_ipmb_remove(struct i2c_client *client)
>  {
>         struct ipmi_ipmb_dev *iidev =3D i2c_get_clientdata(client);
>
> @@ -438,8 +438,6 @@ static int ipmi_ipmb_remove(struct i2c_client *client=
)
>         ipmi_ipmb_stop_thread(iidev);
>
>         ipmi_unregister_smi(iidev->intf);
> -
> -       return 0;
>  }
>
>  static int ipmi_ipmb_probe(struct i2c_client *client)
> diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.=
c
> index fc742ee9c046..13da021e7c6b 100644
> --- a/drivers/char/ipmi/ipmi_ssif.c
> +++ b/drivers/char/ipmi/ipmi_ssif.c
> @@ -1281,13 +1281,13 @@ static void shutdown_ssif(void *send_info)
>         }
>  }
>
> -static int ssif_remove(struct i2c_client *client)
> +static void ssif_remove(struct i2c_client *client)
>  {
>         struct ssif_info *ssif_info =3D i2c_get_clientdata(client);
>         struct ssif_addr_info *addr_info;
>
>         if (!ssif_info)
> -               return 0;
> +               return;
>
>         /*
>          * After this point, we won't deliver anything asychronously
> @@ -1303,8 +1303,6 @@ static int ssif_remove(struct i2c_client *client)
>         }
>
>         kfree(ssif_info);
> -
> -       return 0;
>  }
>
>  static int read_response(struct i2c_client *client, unsigned char *resp)
> diff --git a/drivers/char/tpm/st33zp24/i2c.c b/drivers/char/tpm/st33zp24/=
i2c.c
> index 3170d59d660c..a3aa411389e7 100644
> --- a/drivers/char/tpm/st33zp24/i2c.c
> +++ b/drivers/char/tpm/st33zp24/i2c.c
> @@ -264,13 +264,11 @@ static int st33zp24_i2c_probe(struct i2c_client *cl=
ient,
>   * @param: client, the i2c_client description (TPM I2C description).
>   * @return: 0 in case of success.
>   */
> -static int st33zp24_i2c_remove(struct i2c_client *client)
> +static void st33zp24_i2c_remove(struct i2c_client *client)
>  {
>         struct tpm_chip *chip =3D i2c_get_clientdata(client);
>
>         st33zp24_remove(chip);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id st33zp24_i2c_id[] =3D {
> diff --git a/drivers/char/tpm/tpm_i2c_atmel.c b/drivers/char/tpm/tpm_i2c_=
atmel.c
> index d5ac85558214..4be3677c1463 100644
> --- a/drivers/char/tpm/tpm_i2c_atmel.c
> +++ b/drivers/char/tpm/tpm_i2c_atmel.c
> @@ -179,12 +179,11 @@ static int i2c_atmel_probe(struct i2c_client *clien=
t,
>         return tpm_chip_register(chip);
>  }
>
> -static int i2c_atmel_remove(struct i2c_client *client)
> +static void i2c_atmel_remove(struct i2c_client *client)
>  {
>         struct device *dev =3D &(client->dev);
>         struct tpm_chip *chip =3D dev_get_drvdata(dev);
>         tpm_chip_unregister(chip);
> -       return 0;
>  }
>
>  static const struct i2c_device_id i2c_atmel_id[] =3D {
> diff --git a/drivers/char/tpm/tpm_i2c_infineon.c b/drivers/char/tpm/tpm_i=
2c_infineon.c
> index a19d32cb4e94..fd3c3661e646 100644
> --- a/drivers/char/tpm/tpm_i2c_infineon.c
> +++ b/drivers/char/tpm/tpm_i2c_infineon.c
> @@ -706,15 +706,13 @@ static int tpm_tis_i2c_probe(struct i2c_client *cli=
ent,
>         return rc;
>  }
>
> -static int tpm_tis_i2c_remove(struct i2c_client *client)
> +static void tpm_tis_i2c_remove(struct i2c_client *client)
>  {
>         struct tpm_chip *chip =3D tpm_dev.chip;
>
>         tpm_chip_unregister(chip);
>         release_locality(chip, tpm_dev.locality, 1);
>         tpm_dev.client =3D NULL;
> -
> -       return 0;
>  }
>
>  static struct i2c_driver tpm_tis_i2c_driver =3D {
> diff --git a/drivers/char/tpm/tpm_i2c_nuvoton.c b/drivers/char/tpm/tpm_i2=
c_nuvoton.c
> index b77c18e38662..95c37350cc8e 100644
> --- a/drivers/char/tpm/tpm_i2c_nuvoton.c
> +++ b/drivers/char/tpm/tpm_i2c_nuvoton.c
> @@ -622,12 +622,11 @@ static int i2c_nuvoton_probe(struct i2c_client *cli=
ent,
>         return tpm_chip_register(chip);
>  }
>
> -static int i2c_nuvoton_remove(struct i2c_client *client)
> +static void i2c_nuvoton_remove(struct i2c_client *client)
>  {
>         struct tpm_chip *chip =3D i2c_get_clientdata(client);
>
>         tpm_chip_unregister(chip);
> -       return 0;
>  }
>
>  static const struct i2c_device_id i2c_nuvoton_id[] =3D {
> diff --git a/drivers/char/tpm/tpm_tis_i2c_cr50.c b/drivers/char/tpm/tpm_t=
is_i2c_cr50.c
> index 974479a1ec5a..77cea5b31c6e 100644
> --- a/drivers/char/tpm/tpm_tis_i2c_cr50.c
> +++ b/drivers/char/tpm/tpm_tis_i2c_cr50.c
> @@ -763,20 +763,18 @@ static int tpm_cr50_i2c_probe(struct i2c_client *cl=
ient)
>   * - 0:                Success.
>   * - -errno:   A POSIX error code.
>   */
> -static int tpm_cr50_i2c_remove(struct i2c_client *client)
> +static void tpm_cr50_i2c_remove(struct i2c_client *client)
>  {
>         struct tpm_chip *chip =3D i2c_get_clientdata(client);
>         struct device *dev =3D &client->dev;
>
>         if (!chip) {
>                 dev_crit(dev, "Could not get client data at remove, memor=
y corruption ahead\n");
> -               return 0;
> +               return;
>         }
>
>         tpm_chip_unregister(chip);
>         tpm_cr50_release_locality(chip, true);
> -
> -       return 0;
>  }
>
>  static SIMPLE_DEV_PM_OPS(cr50_i2c_pm, tpm_pm_suspend, tpm_pm_resume);
> diff --git a/drivers/clk/clk-cdce706.c b/drivers/clk/clk-cdce706.c
> index 5467d941ddfd..1449d0537674 100644
> --- a/drivers/clk/clk-cdce706.c
> +++ b/drivers/clk/clk-cdce706.c
> @@ -665,10 +665,9 @@ static int cdce706_probe(struct i2c_client *client)
>                                       cdce);
>  }
>
> -static int cdce706_remove(struct i2c_client *client)
> +static void cdce706_remove(struct i2c_client *client)
>  {
>         of_clk_del_provider(client->dev.of_node);
> -       return 0;
>  }
>
>
> diff --git a/drivers/clk/clk-cs2000-cp.c b/drivers/clk/clk-cs2000-cp.c
> index aa5c72bab83e..320d39922206 100644
> --- a/drivers/clk/clk-cs2000-cp.c
> +++ b/drivers/clk/clk-cs2000-cp.c
> @@ -557,7 +557,7 @@ static int cs2000_version_print(struct cs2000_priv *p=
riv)
>         return 0;
>  }
>
> -static int cs2000_remove(struct i2c_client *client)
> +static void cs2000_remove(struct i2c_client *client)
>  {
>         struct cs2000_priv *priv =3D i2c_get_clientdata(client);
>         struct device *dev =3D priv_to_dev(priv);
> @@ -566,8 +566,6 @@ static int cs2000_remove(struct i2c_client *client)
>         of_clk_del_provider(np);
>
>         clk_hw_unregister(&priv->hw);
> -
> -       return 0;
>  }
>
>  static int cs2000_probe(struct i2c_client *client)
> diff --git a/drivers/clk/clk-si514.c b/drivers/clk/clk-si514.c
> index 4481c4303534..c028fa103bed 100644
> --- a/drivers/clk/clk-si514.c
> +++ b/drivers/clk/clk-si514.c
> @@ -370,10 +370,9 @@ static int si514_probe(struct i2c_client *client)
>         return 0;
>  }
>
> -static int si514_remove(struct i2c_client *client)
> +static void si514_remove(struct i2c_client *client)
>  {
>         of_clk_del_provider(client->dev.of_node);
> -       return 0;
>  }
>
>  static const struct i2c_device_id si514_id[] =3D {
> diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
> index 4bca73212662..0e528d7ba656 100644
> --- a/drivers/clk/clk-si5341.c
> +++ b/drivers/clk/clk-si5341.c
> @@ -1796,7 +1796,7 @@ static int si5341_probe(struct i2c_client *client)
>         return err;
>  }
>
> -static int si5341_remove(struct i2c_client *client)
> +static void si5341_remove(struct i2c_client *client)
>  {
>         struct clk_si5341 *data =3D i2c_get_clientdata(client);
>         int i;
> @@ -1807,8 +1807,6 @@ static int si5341_remove(struct i2c_client *client)
>                 if (data->clk[i].vddo_reg)
>                         regulator_disable(data->clk[i].vddo_reg);
>         }
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id si5341_id[] =3D {
> diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
> index b9f088c4ba2f..9e939c98a455 100644
> --- a/drivers/clk/clk-si5351.c
> +++ b/drivers/clk/clk-si5351.c
> @@ -1651,11 +1651,9 @@ static int si5351_i2c_probe(struct i2c_client *cli=
ent)
>         return 0;
>  }
>
> -static int si5351_i2c_remove(struct i2c_client *client)
> +static void si5351_i2c_remove(struct i2c_client *client)
>  {
>         of_clk_del_provider(client->dev.of_node);
> -
> -       return 0;
>  }
>
>  static struct i2c_driver si5351_driver =3D {
> diff --git a/drivers/clk/clk-si570.c b/drivers/clk/clk-si570.c
> index 1ff8f32f734d..0a6d70c49726 100644
> --- a/drivers/clk/clk-si570.c
> +++ b/drivers/clk/clk-si570.c
> @@ -498,10 +498,9 @@ static int si570_probe(struct i2c_client *client)
>         return 0;
>  }
>
> -static int si570_remove(struct i2c_client *client)
> +static void si570_remove(struct i2c_client *client)
>  {
>         of_clk_del_provider(client->dev.of_node);
> -       return 0;
>  }
>
>  static const struct of_device_id clk_si570_of_match[] =3D {
> diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.=
c
> index e7be3e54b9be..657493ecce4c 100644
> --- a/drivers/clk/clk-versaclock5.c
> +++ b/drivers/clk/clk-versaclock5.c
> @@ -1138,7 +1138,7 @@ static int vc5_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int vc5_remove(struct i2c_client *client)
> +static void vc5_remove(struct i2c_client *client)
>  {
>         struct vc5_driver_data *vc5 =3D i2c_get_clientdata(client);
>
> @@ -1146,8 +1146,6 @@ static int vc5_remove(struct i2c_client *client)
>
>         if (vc5->chip_info->flags & VC5_HAS_INTERNAL_XTAL)
>                 clk_unregister_fixed_rate(vc5->pin_xin);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused vc5_suspend(struct device *dev)
> diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
> index a4b13d326cfc..82bf15d49561 100644
> --- a/drivers/crypto/atmel-ecc.c
> +++ b/drivers/crypto/atmel-ecc.c
> @@ -343,7 +343,7 @@ static int atmel_ecc_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int atmel_ecc_remove(struct i2c_client *client)
> +static void atmel_ecc_remove(struct i2c_client *client)
>  {
>         struct atmel_i2c_client_priv *i2c_priv =3D i2c_get_clientdata(cli=
ent);
>
> @@ -358,7 +358,7 @@ static int atmel_ecc_remove(struct i2c_client *client=
)
>                  * accessing the freed memory.
>                  */
>                 dev_emerg(&client->dev, "Device is busy, expect memory co=
rruption.\n");
> -               return 0;
> +               return;
>         }
>
>         crypto_unregister_kpp(&atmel_ecdh_nist_p256);
> @@ -366,8 +366,6 @@ static int atmel_ecc_remove(struct i2c_client *client=
)
>         spin_lock(&driver_data.i2c_list_lock);
>         list_del(&i2c_priv->i2c_client_list_node);
>         spin_unlock(&driver_data.i2c_list_lock);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_OF
> diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204=
a.c
> index e4087bdd2475..a84b657598c6 100644
> --- a/drivers/crypto/atmel-sha204a.c
> +++ b/drivers/crypto/atmel-sha204a.c
> @@ -116,18 +116,16 @@ static int atmel_sha204a_probe(struct i2c_client *c=
lient,
>         return ret;
>  }
>
> -static int atmel_sha204a_remove(struct i2c_client *client)
> +static void atmel_sha204a_remove(struct i2c_client *client)
>  {
>         struct atmel_i2c_client_priv *i2c_priv =3D i2c_get_clientdata(cli=
ent);
>
>         if (atomic_read(&i2c_priv->tfm_count)) {
>                 dev_emerg(&client->dev, "Device is busy, will remove it a=
nyhow\n");
> -               return 0;
> +               return;
>         }
>
>         kfree((void *)i2c_priv->hwrng.priv);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id atmel_sha204a_dt_ids[] =3D {
> diff --git a/drivers/extcon/extcon-rt8973a.c b/drivers/extcon/extcon-rt89=
73a.c
> index 40c07f4d656e..d1c674f3f2b9 100644
> --- a/drivers/extcon/extcon-rt8973a.c
> +++ b/drivers/extcon/extcon-rt8973a.c
> @@ -647,13 +647,11 @@ static int rt8973a_muic_i2c_probe(struct i2c_client=
 *i2c,
>         return 0;
>  }
>
> -static int rt8973a_muic_i2c_remove(struct i2c_client *i2c)
> +static void rt8973a_muic_i2c_remove(struct i2c_client *i2c)
>  {
>         struct rt8973a_muic_info *info =3D i2c_get_clientdata(i2c);
>
>         regmap_del_irq_chip(info->irq, info->irq_data);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id rt8973a_dt_match[] =3D {
> diff --git a/drivers/gpio/gpio-adp5588.c b/drivers/gpio/gpio-adp5588.c
> index e388e75103f4..acb673dc9005 100644
> --- a/drivers/gpio/gpio-adp5588.c
> +++ b/drivers/gpio/gpio-adp5588.c
> @@ -411,14 +411,12 @@ static int adp5588_gpio_probe(struct i2c_client *cl=
ient)
>         return 0;
>  }
>
> -static int adp5588_gpio_remove(struct i2c_client *client)
> +static void adp5588_gpio_remove(struct i2c_client *client)
>  {
>         struct adp5588_gpio *dev =3D i2c_get_clientdata(client);
>
>         if (dev->client->irq)
>                 free_irq(dev->client->irq, dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id adp5588_gpio_id[] =3D {
> diff --git a/drivers/gpio/gpio-max7300.c b/drivers/gpio/gpio-max7300.c
> index b2b547dd6e84..43da381a4d7e 100644
> --- a/drivers/gpio/gpio-max7300.c
> +++ b/drivers/gpio/gpio-max7300.c
> @@ -48,11 +48,9 @@ static int max7300_probe(struct i2c_client *client,
>         return __max730x_probe(ts);
>  }
>
> -static int max7300_remove(struct i2c_client *client)
> +static void max7300_remove(struct i2c_client *client)
>  {
>         __max730x_remove(&client->dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id max7300_id[] =3D {
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 3eedeac9ec8d..fc5f037aaf64 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -1095,7 +1095,7 @@ static int pca953x_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int pca953x_remove(struct i2c_client *client)
> +static void pca953x_remove(struct i2c_client *client)
>  {
>         struct pca953x_platform_data *pdata =3D dev_get_platdata(&client-=
>dev);
>         struct pca953x_chip *chip =3D i2c_get_clientdata(client);
> @@ -1106,8 +1106,6 @@ static int pca953x_remove(struct i2c_client *client=
)
>         }
>
>         regulator_disable(chip->regulator);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
> index 59cc27e4de51..e98ea47d7237 100644
> --- a/drivers/gpio/gpio-pcf857x.c
> +++ b/drivers/gpio/gpio-pcf857x.c
> @@ -399,7 +399,7 @@ static int pcf857x_probe(struct i2c_client *client,
>         return status;
>  }
>
> -static int pcf857x_remove(struct i2c_client *client)
> +static void pcf857x_remove(struct i2c_client *client)
>  {
>         struct pcf857x_platform_data    *pdata =3D dev_get_platdata(&clie=
nt->dev);
>         struct pcf857x                  *gpio =3D i2c_get_clientdata(clie=
nt);
> @@ -407,8 +407,6 @@ static int pcf857x_remove(struct i2c_client *client)
>         if (pdata && pdata->teardown)
>                 pdata->teardown(client, gpio->chip.base, gpio->chip.ngpio=
,
>                                 pdata->context);
> -
> -       return 0;
>  }
>
>  static void pcf857x_shutdown(struct i2c_client *client)
> diff --git a/drivers/gpio/gpio-tpic2810.c b/drivers/gpio/gpio-tpic2810.c
> index 99d5a84a9129..8d8290f36c8a 100644
> --- a/drivers/gpio/gpio-tpic2810.c
> +++ b/drivers/gpio/gpio-tpic2810.c
> @@ -134,13 +134,11 @@ static int tpic2810_probe(struct i2c_client *client=
,
>         return 0;
>  }
>
> -static int tpic2810_remove(struct i2c_client *client)
> +static void tpic2810_remove(struct i2c_client *client)
>  {
>         struct tpic2810 *gpio =3D i2c_get_clientdata(client);
>
>         gpiochip_remove(&gpio->chip);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id tpic2810_id_table[] =3D {
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 5bb9300040dd..06107b01e169 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1335,7 +1335,7 @@ static int adv7511_probe(struct i2c_client *i2c, co=
nst struct i2c_device_id *id)
>         return ret;
>  }
>
> -static int adv7511_remove(struct i2c_client *i2c)
> +static void adv7511_remove(struct i2c_client *i2c)
>  {
>         struct adv7511 *adv7511 =3D i2c_get_clientdata(i2c);
>
> @@ -1352,8 +1352,6 @@ static int adv7511_remove(struct i2c_client *i2c)
>
>         i2c_unregister_device(adv7511->i2c_packet);
>         i2c_unregister_device(adv7511->i2c_edid);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id adv7511_i2c_ids[] =3D {
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers=
/gpu/drm/bridge/analogix/analogix-anx6345.c
> index ae3d6e9a606c..660a54857929 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> @@ -787,7 +787,7 @@ static int anx6345_i2c_probe(struct i2c_client *clien=
t,
>         return err;
>  }
>
> -static int anx6345_i2c_remove(struct i2c_client *client)
> +static void anx6345_i2c_remove(struct i2c_client *client)
>  {
>         struct anx6345 *anx6345 =3D i2c_get_clientdata(client);
>
> @@ -798,8 +798,6 @@ static int anx6345_i2c_remove(struct i2c_client *clie=
nt)
>         kfree(anx6345->edid);
>
>         mutex_destroy(&anx6345->lock);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id anx6345_id[] =3D {
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers=
/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index d2fc8676fab6..5997049fde5b 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -1357,7 +1357,7 @@ static int anx78xx_i2c_probe(struct i2c_client *cli=
ent,
>         return err;
>  }
>
> -static int anx78xx_i2c_remove(struct i2c_client *client)
> +static void anx78xx_i2c_remove(struct i2c_client *client)
>  {
>         struct anx78xx *anx78xx =3D i2c_get_clientdata(client);
>
> @@ -1366,8 +1366,6 @@ static int anx78xx_i2c_remove(struct i2c_client *cl=
ient)
>         unregister_i2c_dummy_clients(anx78xx);
>
>         kfree(anx78xx->edid);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id anx78xx_id[] =3D {
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/=
bridge/analogix/anx7625.c
> index 53a5da6c49dd..73f1d3338c81 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2733,7 +2733,7 @@ static int anx7625_i2c_probe(struct i2c_client *cli=
ent,
>         return ret;
>  }
>
> -static int anx7625_i2c_remove(struct i2c_client *client)
> +static void anx7625_i2c_remove(struct i2c_client *client)
>  {
>         struct anx7625_data *platform =3D i2c_get_clientdata(client);
>
> @@ -2755,8 +2755,6 @@ static int anx7625_i2c_remove(struct i2c_client *cl=
ient)
>
>         if (platform->pdata.audio_en)
>                 anx7625_unregister_audio(platform);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id anx7625_id[] =3D {
> diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/b=
ridge/chrontel-ch7033.c
> index 486f405c2e16..efd587d2075f 100644
> --- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
> +++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
> @@ -582,14 +582,12 @@ static int ch7033_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int ch7033_remove(struct i2c_client *client)
> +static void ch7033_remove(struct i2c_client *client)
>  {
>         struct device *dev =3D &client->dev;
>         struct ch7033_priv *priv =3D dev_get_drvdata(dev);
>
>         drm_bridge_remove(&priv->bridge);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id ch7033_dt_ids[] =3D {
> diff --git a/drivers/gpu/drm/bridge/cros-ec-anx7688.c b/drivers/gpu/drm/b=
ridge/cros-ec-anx7688.c
> index 0f6d907432e3..fa91bdeddef0 100644
> --- a/drivers/gpu/drm/bridge/cros-ec-anx7688.c
> +++ b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
> @@ -159,13 +159,11 @@ static int cros_ec_anx7688_bridge_probe(struct i2c_=
client *client)
>         return 0;
>  }
>
> -static int cros_ec_anx7688_bridge_remove(struct i2c_client *client)
> +static void cros_ec_anx7688_bridge_remove(struct i2c_client *client)
>  {
>         struct cros_ec_anx7688 *anx7688 =3D i2c_get_clientdata(client);
>
>         drm_bridge_remove(&anx7688->bridge);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id cros_ec_anx7688_bridge_match_table[] =
=3D {
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge=
/ite-it6505.c
> index 4b673c4792d7..547e0c9d3bdc 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -3316,7 +3316,7 @@ static int it6505_i2c_probe(struct i2c_client *clie=
nt,
>         return 0;
>  }
>
> -static int it6505_i2c_remove(struct i2c_client *client)
> +static void it6505_i2c_remove(struct i2c_client *client)
>  {
>         struct it6505 *it6505 =3D i2c_get_clientdata(client);
>
> @@ -3324,8 +3324,6 @@ static int it6505_i2c_remove(struct i2c_client *cli=
ent)
>         drm_dp_aux_unregister(&it6505->aux);
>         it6505_debugfs_remove(it6505);
>         it6505_poweroff(it6505);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id it6505_id[] =3D {
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridg=
e/ite-it66121.c
> index 448c58e60c11..8d05ac2192f2 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -1622,15 +1622,13 @@ static int it66121_probe(struct i2c_client *clien=
t,
>         return 0;
>  }
>
> -static int it66121_remove(struct i2c_client *client)
> +static void it66121_remove(struct i2c_client *client)
>  {
>         struct it66121_ctx *ctx =3D i2c_get_clientdata(client);
>
>         ite66121_power_off(ctx);
>         drm_bridge_remove(&ctx->bridge);
>         mutex_destroy(&ctx->lock);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id it66121_dt_match[] =3D {
> diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/b=
ridge/lontium-lt8912b.c
> index c642d1e02b2f..2f5c9ea46e93 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> @@ -717,7 +717,7 @@ static int lt8912_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int lt8912_remove(struct i2c_client *client)
> +static void lt8912_remove(struct i2c_client *client)
>  {
>         struct lt8912 *lt =3D i2c_get_clientdata(client);
>
> @@ -725,7 +725,6 @@ static int lt8912_remove(struct i2c_client *client)
>         drm_bridge_remove(&lt->bridge);
>         lt8912_free_i2c(lt);
>         lt8912_put_dt(lt);
> -       return 0;
>  }
>
>  static const struct of_device_id lt8912_dt_match[] =3D {
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/br=
idge/lontium-lt9211.c
> index e92821fbc639..0646ec28ad17 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9211.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
> @@ -765,13 +765,11 @@ static int lt9211_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int lt9211_remove(struct i2c_client *client)
> +static void lt9211_remove(struct i2c_client *client)
>  {
>         struct lt9211 *ctx =3D i2c_get_clientdata(client);
>
>         drm_bridge_remove(&ctx->bridge);
> -
> -       return 0;
>  }
>
>  static struct i2c_device_id lt9211_id[] =3D {
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/br=
idge/lontium-lt9611.c
> index 7ef8fe5abc12..492e948d624f 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -1220,7 +1220,7 @@ static int lt9611_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int lt9611_remove(struct i2c_client *client)
> +static void lt9611_remove(struct i2c_client *client)
>  {
>         struct lt9611 *lt9611 =3D i2c_get_clientdata(client);
>
> @@ -1232,8 +1232,6 @@ static int lt9611_remove(struct i2c_client *client)
>
>         of_node_put(lt9611->dsi1_node);
>         of_node_put(lt9611->dsi0_node);
> -
> -       return 0;
>  }
>
>  static struct i2c_device_id lt9611_id[] =3D {
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm=
/bridge/lontium-lt9611uxc.c
> index 3d62e6bf6892..b5a58106c328 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -977,7 +977,7 @@ static int lt9611uxc_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int lt9611uxc_remove(struct i2c_client *client)
> +static void lt9611uxc_remove(struct i2c_client *client)
>  {
>         struct lt9611uxc *lt9611uxc =3D i2c_get_clientdata(client);
>
> @@ -992,8 +992,6 @@ static int lt9611uxc_remove(struct i2c_client *client=
)
>
>         of_node_put(lt9611uxc->dsi1_node);
>         of_node_put(lt9611uxc->dsi0_node);
> -
> -       return 0;
>  }
>
>  static struct i2c_device_id lt9611uxc_id[] =3D {
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/d=
rivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index cce98bf2a4e7..9f175df11581 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -355,11 +355,9 @@ static int stdp4028_ge_b850v3_fw_probe(struct i2c_cl=
ient *stdp4028_i2c,
>         return ge_b850v3_register();
>  }
>
> -static int stdp4028_ge_b850v3_fw_remove(struct i2c_client *stdp4028_i2c)
> +static void stdp4028_ge_b850v3_fw_remove(struct i2c_client *stdp4028_i2c=
)
>  {
>         ge_b850v3_lvds_remove();
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id stdp4028_ge_b850v3_fw_i2c_table[] =3D =
{
> @@ -405,11 +403,9 @@ static int stdp2690_ge_b850v3_fw_probe(struct i2c_cl=
ient *stdp2690_i2c,
>         return ge_b850v3_register();
>  }
>
> -static int stdp2690_ge_b850v3_fw_remove(struct i2c_client *stdp2690_i2c)
> +static void stdp2690_ge_b850v3_fw_remove(struct i2c_client *stdp2690_i2c=
)
>  {
>         ge_b850v3_lvds_remove();
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id stdp2690_ge_b850v3_fw_i2c_table[] =3D =
{
> diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridg=
e/nxp-ptn3460.c
> index 1ab91f4e057b..0851101a8c72 100644
> --- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
> +++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> @@ -315,13 +315,11 @@ static int ptn3460_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int ptn3460_remove(struct i2c_client *client)
> +static void ptn3460_remove(struct i2c_client *client)
>  {
>         struct ptn3460_bridge *ptn_bridge =3D i2c_get_clientdata(client);
>
>         drm_bridge_remove(&ptn_bridge->bridge);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ptn3460_i2c_table[] =3D {
> diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bri=
dge/parade-ps8622.c
> index 37b308850b4e..b54f418d2b7b 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8622.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8622.c
> @@ -524,14 +524,12 @@ static int ps8622_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int ps8622_remove(struct i2c_client *client)
> +static void ps8622_remove(struct i2c_client *client)
>  {
>         struct ps8622_bridge *ps8622 =3D i2c_get_clientdata(client);
>
>         backlight_device_unregister(ps8622->bl);
>         drm_bridge_remove(&ps8622->bridge);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ps8622_i2c_table[] =3D {
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bri=
dge/parade-ps8640.c
> index edb939b14c04..a09d1828d8e1 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -690,13 +690,11 @@ static int ps8640_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ps8640_remove(struct i2c_client *client)
> +static void ps8640_remove(struct i2c_client *client)
>  {
>         struct ps8640 *ps_bridge =3D i2c_get_clientdata(client);
>
>         drm_bridge_remove(&ps_bridge->bridge);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id ps8640_match[] =3D {
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/si=
i902x.c
> index 65549fbfdc87..c5e5f83b97ce 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -1143,7 +1143,7 @@ static int sii902x_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int sii902x_remove(struct i2c_client *client)
> +static void sii902x_remove(struct i2c_client *client)
>
>  {
>         struct sii902x *sii902x =3D i2c_get_clientdata(client);
> @@ -1152,8 +1152,6 @@ static int sii902x_remove(struct i2c_client *client=
)
>         drm_bridge_remove(&sii902x->bridge);
>         regulator_bulk_disable(ARRAY_SIZE(sii902x->supplies),
>                                sii902x->supplies);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id sii902x_dt_ids[] =3D {
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/si=
i9234.c
> index 15c98a7bd81c..5b3061d4b5c3 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -936,14 +936,12 @@ static int sii9234_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int sii9234_remove(struct i2c_client *client)
> +static void sii9234_remove(struct i2c_client *client)
>  {
>         struct sii9234 *ctx =3D i2c_get_clientdata(client);
>
>         sii9234_cable_out(ctx);
>         drm_bridge_remove(&ctx->bridge);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id sii9234_dt_match[] =3D {
> diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridg=
e/sil-sii8620.c
> index ec7745c31da0..eabd3e09adfa 100644
> --- a/drivers/gpu/drm/bridge/sil-sii8620.c
> +++ b/drivers/gpu/drm/bridge/sil-sii8620.c
> @@ -2346,7 +2346,7 @@ static int sii8620_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int sii8620_remove(struct i2c_client *client)
> +static void sii8620_remove(struct i2c_client *client)
>  {
>         struct sii8620 *ctx =3D i2c_get_clientdata(client);
>
> @@ -2360,8 +2360,6 @@ static int sii8620_remove(struct i2c_client *client=
)
>                 sii8620_cable_out(ctx);
>         }
>         drm_bridge_remove(&ctx->bridge);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id sii8620_dt_match[] =3D {
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/t=
c358767.c
> index 485717c8f0b4..a50316538a9b 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -2148,13 +2148,11 @@ static int tc_probe(struct i2c_client *client, co=
nst struct i2c_device_id *id)
>         return 0;
>  }
>
> -static int tc_remove(struct i2c_client *client)
> +static void tc_remove(struct i2c_client *client)
>  {
>         struct tc_data *tc =3D i2c_get_clientdata(client);
>
>         drm_bridge_remove(&tc->bridge);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id tc358767_i2c_ids[] =3D {
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/t=
c358768.c
> index fd585bf925fe..4c4b77ce8aba 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -1072,13 +1072,11 @@ static int tc358768_i2c_probe(struct i2c_client *=
client,
>         return mipi_dsi_host_register(&priv->dsi_host);
>  }
>
> -static int tc358768_i2c_remove(struct i2c_client *client)
> +static void tc358768_i2c_remove(struct i2c_client *client)
>  {
>         struct tc358768_priv *priv =3D i2c_get_clientdata(client);
>
>         mipi_dsi_host_unregister(&priv->dsi_host);
> -
> -       return 0;
>  }
>
>  static struct i2c_driver tc358768_driver =3D {
> diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/t=
c358775.c
> index 62a7ef352daa..1d097717b47b 100644
> --- a/drivers/gpu/drm/bridge/tc358775.c
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -713,13 +713,11 @@ static int tc_probe(struct i2c_client *client, cons=
t struct i2c_device_id *id)
>         return ret;
>  }
>
> -static int tc_remove(struct i2c_client *client)
> +static void tc_remove(struct i2c_client *client)
>  {
>         struct tc_data *tc =3D i2c_get_clientdata(client);
>
>         drm_bridge_remove(&tc->bridge);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id tc358775_i2c_ids[] =3D {
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi83.c
> index ac66f408b40c..8f93e374848c 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -726,14 +726,12 @@ static int sn65dsi83_probe(struct i2c_client *clien=
t,
>         return ret;
>  }
>
> -static int sn65dsi83_remove(struct i2c_client *client)
> +static void sn65dsi83_remove(struct i2c_client *client)
>  {
>         struct sn65dsi83 *ctx =3D i2c_get_clientdata(client);
>
>         drm_bridge_remove(&ctx->bridge);
>         of_node_put(ctx->host_node);
> -
> -       return 0;
>  }
>
>  static struct i2c_device_id sn65dsi83_id[] =3D {
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/=
ti-tfp410.c
> index 756b3e6e776b..281ceb7b9840 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -392,11 +392,9 @@ static int tfp410_i2c_probe(struct i2c_client *clien=
t,
>         return tfp410_init(&client->dev, true);
>  }
>
> -static int tfp410_i2c_remove(struct i2c_client *client)
> +static void tfp410_i2c_remove(struct i2c_client *client)
>  {
>         tfp410_fini(&client->dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id tfp410_i2c_ids[] =3D {
> diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch700=
6_drv.c
> index b91e48d2190d..578b738859b9 100644
> --- a/drivers/gpu/drm/i2c/ch7006_drv.c
> +++ b/drivers/gpu/drm/i2c/ch7006_drv.c
> @@ -417,11 +417,9 @@ static int ch7006_probe(struct i2c_client *client, c=
onst struct i2c_device_id *i
>         return -ENODEV;
>  }
>
> -static int ch7006_remove(struct i2c_client *client)
> +static void ch7006_remove(struct i2c_client *client)
>  {
>         ch7006_dbg(client, "\n");
> -
> -       return 0;
>  }
>
>  static int ch7006_resume(struct device *dev)
> diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/i2c/tda9950.=
c
> index 5b03fdd1eaa4..9ed54e7ccff2 100644
> --- a/drivers/gpu/drm/i2c/tda9950.c
> +++ b/drivers/gpu/drm/i2c/tda9950.c
> @@ -478,14 +478,12 @@ static int tda9950_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int tda9950_remove(struct i2c_client *client)
> +static void tda9950_remove(struct i2c_client *client)
>  {
>         struct tda9950_priv *priv =3D i2c_get_clientdata(client);
>
>         cec_notifier_cec_adap_unregister(priv->notify, priv->adap);
>         cec_unregister_adapter(priv->adap);
> -
> -       return 0;
>  }
>
>  static struct i2c_device_id tda9950_ids[] =3D {
> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda9=
98x_drv.c
> index b7ec6c374fbd..1f5ce292f5b1 100644
> --- a/drivers/gpu/drm/i2c/tda998x_drv.c
> +++ b/drivers/gpu/drm/i2c/tda998x_drv.c
> @@ -2075,11 +2075,10 @@ tda998x_probe(struct i2c_client *client, const st=
ruct i2c_device_id *id)
>         return ret;
>  }
>
> -static int tda998x_remove(struct i2c_client *client)
> +static void tda998x_remove(struct i2c_client *client)
>  {
>         component_del(&client->dev, &tda998x_ops);
>         tda998x_destroy(&client->dev);
> -       return 0;
>  }
>
>  #ifdef CONFIG_OF
> diff --git a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c b/drivers=
/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
> index cb5cb27462df..36a46cb7fe1c 100644
> --- a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
> +++ b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
> @@ -288,7 +288,7 @@ static int lcd_olinuxino_probe(struct i2c_client *cli=
ent,
>         return 0;
>  }
>
> -static int lcd_olinuxino_remove(struct i2c_client *client)
> +static void lcd_olinuxino_remove(struct i2c_client *client)
>  {
>         struct lcd_olinuxino *panel =3D i2c_get_clientdata(client);
>
> @@ -296,8 +296,6 @@ static int lcd_olinuxino_remove(struct i2c_client *cl=
ient)
>
>         drm_panel_disable(&panel->panel);
>         drm_panel_unprepare(&panel->panel);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id lcd_olinuxino_of_ids[] =3D {
> diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/driv=
ers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> index 145047e19394..6dc67b609873 100644
> --- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> +++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> @@ -445,7 +445,7 @@ static int rpi_touchscreen_probe(struct i2c_client *i=
2c,
>         return -ENODEV;
>  }
>
> -static int rpi_touchscreen_remove(struct i2c_client *i2c)
> +static void rpi_touchscreen_remove(struct i2c_client *i2c)
>  {
>         struct rpi_touchscreen *ts =3D i2c_get_clientdata(i2c);
>
> @@ -454,8 +454,6 @@ static int rpi_touchscreen_remove(struct i2c_client *=
i2c)
>         drm_panel_remove(&ts->base);
>
>         mipi_dsi_device_unregister(ts->dsi);
> -
> -       return 0;
>  }
>
>  static int rpi_touchscreen_dsi_probe(struct mipi_dsi_device *dsi)
> diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solo=
mon/ssd130x-i2c.c
> index 1e0fcec7be47..ddfa0bb5d9c9 100644
> --- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
> +++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
> @@ -39,13 +39,11 @@ static int ssd130x_i2c_probe(struct i2c_client *clien=
t)
>         return 0;
>  }
>
> -static int ssd130x_i2c_remove(struct i2c_client *client)
> +static void ssd130x_i2c_remove(struct i2c_client *client)
>  {
>         struct ssd130x_device *ssd130x =3D i2c_get_clientdata(client);
>
>         ssd130x_remove(ssd130x);
> -
> -       return 0;
>  }
>
>  static void ssd130x_i2c_shutdown(struct i2c_client *client)
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c=
-hid-core.c
> index c078f09a2318..95cefae47adf 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -1064,7 +1064,7 @@ int i2c_hid_core_probe(struct i2c_client *client, s=
truct i2chid_ops *ops,
>  }
>  EXPORT_SYMBOL_GPL(i2c_hid_core_probe);
>
> -int i2c_hid_core_remove(struct i2c_client *client)
> +void i2c_hid_core_remove(struct i2c_client *client)
>  {
>         struct i2c_hid *ihid =3D i2c_get_clientdata(client);
>         struct hid_device *hid;
> @@ -1078,8 +1078,6 @@ int i2c_hid_core_remove(struct i2c_client *client)
>                 i2c_hid_free_buffers(ihid);
>
>         i2c_hid_core_power_down(ihid);
> -
> -       return 0;
>  }
>  EXPORT_SYMBOL_GPL(i2c_hid_core_remove);
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid.h b/drivers/hid/i2c-hid/i2c-hid.=
h
> index 236cc062d5ef..96c75510ad3f 100644
> --- a/drivers/hid/i2c-hid/i2c-hid.h
> +++ b/drivers/hid/i2c-hid/i2c-hid.h
> @@ -33,7 +33,7 @@ struct i2chid_ops {
>
>  int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops=
,
>                        u16 hid_descriptor_address, u32 quirks);
> -int i2c_hid_core_remove(struct i2c_client *client);
> +void i2c_hid_core_remove(struct i2c_client *client);
>
>  void i2c_hid_core_shutdown(struct i2c_client *client);
>
> diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
> index fd938c70293f..299160543b35 100644
> --- a/drivers/hwmon/adc128d818.c
> +++ b/drivers/hwmon/adc128d818.c
> @@ -495,14 +495,12 @@ static int adc128_probe(struct i2c_client *client)
>         return err;
>  }
>
> -static int adc128_remove(struct i2c_client *client)
> +static void adc128_remove(struct i2c_client *client)
>  {
>         struct adc128_data *data =3D i2c_get_clientdata(client);
>
>         if (data->regulator)
>                 regulator_disable(data->regulator);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id adc128_id[] =3D {
> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index c67cd037a93f..927f8df05b7c 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -1296,12 +1296,11 @@ static int adt7470_probe(struct i2c_client *clien=
t)
>         return 0;
>  }
>
> -static int adt7470_remove(struct i2c_client *client)
> +static void adt7470_remove(struct i2c_client *client)
>  {
>         struct adt7470_data *data =3D i2c_get_clientdata(client);
>
>         kthread_stop(data->auto_update);
> -       return 0;
>  }
>
>  static const struct i2c_device_id adt7470_id[] =3D {
> diff --git a/drivers/hwmon/asb100.c b/drivers/hwmon/asb100.c
> index 8cf0bcb85eb4..a9166c8555c5 100644
> --- a/drivers/hwmon/asb100.c
> +++ b/drivers/hwmon/asb100.c
> @@ -208,7 +208,7 @@ static void asb100_write_value(struct i2c_client *cli=
ent, u16 reg, u16 val);
>  static int asb100_probe(struct i2c_client *client);
>  static int asb100_detect(struct i2c_client *client,
>                          struct i2c_board_info *info);
> -static int asb100_remove(struct i2c_client *client);
> +static void asb100_remove(struct i2c_client *client);
>  static struct asb100_data *asb100_update_device(struct device *dev);
>  static void asb100_init_client(struct i2c_client *client);
>
> @@ -822,7 +822,7 @@ static int asb100_probe(struct i2c_client *client)
>         return err;
>  }
>
> -static int asb100_remove(struct i2c_client *client)
> +static void asb100_remove(struct i2c_client *client)
>  {
>         struct asb100_data *data =3D i2c_get_clientdata(client);
>
> @@ -831,8 +831,6 @@ static int asb100_remove(struct i2c_client *client)
>
>         i2c_unregister_device(data->lm75[1]);
>         i2c_unregister_device(data->lm75[0]);
> -
> -       return 0;
>  }
>
>  /*
> diff --git a/drivers/hwmon/asc7621.c b/drivers/hwmon/asc7621.c
> index e835605a7456..4f90fdee9cc7 100644
> --- a/drivers/hwmon/asc7621.c
> +++ b/drivers/hwmon/asc7621.c
> @@ -1165,7 +1165,7 @@ static int asc7621_detect(struct i2c_client *client=
,
>         return -ENODEV;
>  }
>
> -static int asc7621_remove(struct i2c_client *client)
> +static void asc7621_remove(struct i2c_client *client)
>  {
>         struct asc7621_data *data =3D i2c_get_clientdata(client);
>         int i;
> @@ -1176,8 +1176,6 @@ static int asc7621_remove(struct i2c_client *client=
)
>                 device_remove_file(&client->dev,
>                                    &(asc7621_params[i].sda.dev_attr));
>         }
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id asc7621_id[] =3D {
> diff --git a/drivers/hwmon/dme1737.c b/drivers/hwmon/dme1737.c
> index e3ad4c2d0038..b1cd028c8277 100644
> --- a/drivers/hwmon/dme1737.c
> +++ b/drivers/hwmon/dme1737.c
> @@ -2508,14 +2508,12 @@ static int dme1737_i2c_probe(struct i2c_client *c=
lient)
>         return err;
>  }
>
> -static int dme1737_i2c_remove(struct i2c_client *client)
> +static void dme1737_i2c_remove(struct i2c_client *client)
>  {
>         struct dme1737_data *data =3D i2c_get_clientdata(client);
>
>         hwmon_device_unregister(data->hwmon_dev);
>         dme1737_remove_files(&client->dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id dme1737_id[] =3D {
> diff --git a/drivers/hwmon/f75375s.c b/drivers/hwmon/f75375s.c
> index 57c8a473698d..ffeed6c1e20b 100644
> --- a/drivers/hwmon/f75375s.c
> +++ b/drivers/hwmon/f75375s.c
> @@ -114,7 +114,7 @@ struct f75375_data {
>  static int f75375_detect(struct i2c_client *client,
>                          struct i2c_board_info *info);
>  static int f75375_probe(struct i2c_client *client);
> -static int f75375_remove(struct i2c_client *client);
> +static void f75375_remove(struct i2c_client *client);
>
>  static const struct i2c_device_id f75375_id[] =3D {
>         { "f75373", f75373 },
> @@ -864,12 +864,11 @@ static int f75375_probe(struct i2c_client *client)
>         return err;
>  }
>
> -static int f75375_remove(struct i2c_client *client)
> +static void f75375_remove(struct i2c_client *client)
>  {
>         struct f75375_data *data =3D i2c_get_clientdata(client);
>         hwmon_device_unregister(data->hwmon_dev);
>         sysfs_remove_group(&client->dev.kobj, &f75375_group);
> -       return 0;
>  }
>
>  /* Return 0 if detection is successful, -ENODEV otherwise */
> diff --git a/drivers/hwmon/fschmd.c b/drivers/hwmon/fschmd.c
> index c26195e3aad7..343e227ca38a 100644
> --- a/drivers/hwmon/fschmd.c
> +++ b/drivers/hwmon/fschmd.c
> @@ -217,7 +217,7 @@ static const int FSCHMD_NO_TEMP_SENSORS[7] =3D { 3, 3=
, 4, 3, 5, 5, 11 };
>  static int fschmd_probe(struct i2c_client *client);
>  static int fschmd_detect(struct i2c_client *client,
>                          struct i2c_board_info *info);
> -static int fschmd_remove(struct i2c_client *client);
> +static void fschmd_remove(struct i2c_client *client);
>  static struct fschmd_data *fschmd_update_device(struct device *dev);
>
>  /*
> @@ -1248,7 +1248,7 @@ static int fschmd_probe(struct i2c_client *client)
>         return err;
>  }
>
> -static int fschmd_remove(struct i2c_client *client)
> +static void fschmd_remove(struct i2c_client *client)
>  {
>         struct fschmd_data *data =3D i2c_get_clientdata(client);
>         int i;
> @@ -1291,8 +1291,6 @@ static int fschmd_remove(struct i2c_client *client)
>         mutex_lock(&watchdog_data_mutex);
>         kref_put(&data->kref, fschmd_release_resources);
>         mutex_unlock(&watchdog_data_mutex);
> -
> -       return 0;
>  }
>
>  static struct fschmd_data *fschmd_update_device(struct device *dev)
> diff --git a/drivers/hwmon/ftsteutates.c b/drivers/hwmon/ftsteutates.c
> index ceffc76a0c51..918763832432 100644
> --- a/drivers/hwmon/ftsteutates.c
> +++ b/drivers/hwmon/ftsteutates.c
> @@ -744,12 +744,11 @@ static int fts_detect(struct i2c_client *client,
>         return 0;
>  }
>
> -static int fts_remove(struct i2c_client *client)
> +static void fts_remove(struct i2c_client *client)
>  {
>         struct fts_data *data =3D dev_get_drvdata(&client->dev);
>
>         watchdog_unregister_device(&data->wdd);
> -       return 0;
>  }
>
>  static int fts_probe(struct i2c_client *client)
> diff --git a/drivers/hwmon/ina209.c b/drivers/hwmon/ina209.c
> index fc3007c3e85c..9b58655d2de4 100644
> --- a/drivers/hwmon/ina209.c
> +++ b/drivers/hwmon/ina209.c
> @@ -568,13 +568,11 @@ static int ina209_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ina209_remove(struct i2c_client *client)
> +static void ina209_remove(struct i2c_client *client)
>  {
>         struct ina209_data *data =3D i2c_get_clientdata(client);
>
>         ina209_restore_conf(client, data);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ina209_id[] =3D {
> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index 58d3828e2ec0..f89bac19bd73 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -913,7 +913,7 @@ static int ina3221_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ina3221_remove(struct i2c_client *client)
> +static void ina3221_remove(struct i2c_client *client)
>  {
>         struct ina3221_data *ina =3D dev_get_drvdata(&client->dev);
>         int i;
> @@ -926,8 +926,6 @@ static int ina3221_remove(struct i2c_client *client)
>                 pm_runtime_put_noidle(ina->pm_dev);
>
>         mutex_destroy(&ina->lock);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused ina3221_suspend(struct device *dev)
> diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
> index 07f7f8b5b73d..7b3c190959d3 100644
> --- a/drivers/hwmon/jc42.c
> +++ b/drivers/hwmon/jc42.c
> @@ -524,7 +524,7 @@ static int jc42_probe(struct i2c_client *client)
>         return PTR_ERR_OR_ZERO(hwmon_dev);
>  }
>
> -static int jc42_remove(struct i2c_client *client)
> +static void jc42_remove(struct i2c_client *client)
>  {
>         struct jc42_data *data =3D i2c_get_clientdata(client);
>
> @@ -537,7 +537,6 @@ static int jc42_remove(struct i2c_client *client)
>                   | (data->config & JC42_CFG_HYST_MASK);
>                 i2c_smbus_write_word_swapped(client, JC42_REG_CONFIG, con=
fig);
>         }
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM
> diff --git a/drivers/hwmon/mcp3021.c b/drivers/hwmon/mcp3021.c
> index ce2780768074..99c29ced084c 100644
> --- a/drivers/hwmon/mcp3021.c
> +++ b/drivers/hwmon/mcp3021.c
> @@ -167,14 +167,12 @@ static int mcp3021_probe(struct i2c_client *client)
>         return err;
>  }
>
> -static int mcp3021_remove(struct i2c_client *client)
> +static void mcp3021_remove(struct i2c_client *client)
>  {
>         struct mcp3021_data *data =3D i2c_get_clientdata(client);
>
>         hwmon_device_unregister(data->hwmon_dev);
>         sysfs_remove_file(&client->dev.kobj, &dev_attr_in0_input.attr);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id mcp3021_id[] =3D {
> diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
> index da39ea28df31..d82a4873a0c6 100644
> --- a/drivers/hwmon/occ/p8_i2c.c
> +++ b/drivers/hwmon/occ/p8_i2c.c
> @@ -226,13 +226,11 @@ static int p8_i2c_occ_probe(struct i2c_client *clie=
nt)
>         return occ_setup(occ);
>  }
>
> -static int p8_i2c_occ_remove(struct i2c_client *client)
> +static void p8_i2c_occ_remove(struct i2c_client *client)
>  {
>         struct occ *occ =3D dev_get_drvdata(&client->dev);
>
>         occ_shutdown(occ);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id p8_i2c_occ_of_match[] =3D {
> diff --git a/drivers/hwmon/pcf8591.c b/drivers/hwmon/pcf8591.c
> index a97a51005c61..af9614e918a4 100644
> --- a/drivers/hwmon/pcf8591.c
> +++ b/drivers/hwmon/pcf8591.c
> @@ -228,14 +228,13 @@ static int pcf8591_probe(struct i2c_client *client)
>         return err;
>  }
>
> -static int pcf8591_remove(struct i2c_client *client)
> +static void pcf8591_remove(struct i2c_client *client)
>  {
>         struct pcf8591_data *data =3D i2c_get_clientdata(client);
>
>         hwmon_device_unregister(data->hwmon_dev);
>         sysfs_remove_group(&client->dev.kobj, &pcf8591_attr_group_opt);
>         sysfs_remove_group(&client->dev.kobj, &pcf8591_attr_group);
> -       return 0;
>  }
>
>  /* Called when we have found a new PCF8591. */
> diff --git a/drivers/hwmon/smm665.c b/drivers/hwmon/smm665.c
> index 8c4ed72e5d68..c36bdbe423de 100644
> --- a/drivers/hwmon/smm665.c
> +++ b/drivers/hwmon/smm665.c
> @@ -671,12 +671,11 @@ static int smm665_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int smm665_remove(struct i2c_client *client)
> +static void smm665_remove(struct i2c_client *client)
>  {
>         struct smm665_data *data =3D i2c_get_clientdata(client);
>
>         i2c_unregister_device(data->cmdreg);
> -       return 0;
>  }
>
>  static const struct i2c_device_id smm665_id[] =3D {
> diff --git a/drivers/hwmon/tps23861.c b/drivers/hwmon/tps23861.c
> index 8bd6435c13e8..9cf693287235 100644
> --- a/drivers/hwmon/tps23861.c
> +++ b/drivers/hwmon/tps23861.c
> @@ -584,13 +584,11 @@ static int tps23861_probe(struct i2c_client *client=
)
>         return 0;
>  }
>
> -static int tps23861_remove(struct i2c_client *client)
> +static void tps23861_remove(struct i2c_client *client)
>  {
>         struct tps23861_data *data =3D i2c_get_clientdata(client);
>
>         debugfs_remove_recursive(data->debugfs_dir);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id __maybe_unused tps23861_of_match[] =3D =
{
> diff --git a/drivers/hwmon/w83781d.c b/drivers/hwmon/w83781d.c
> index b3579721265f..55c78e12bbbe 100644
> --- a/drivers/hwmon/w83781d.c
> +++ b/drivers/hwmon/w83781d.c
> @@ -1239,7 +1239,7 @@ static int w83781d_probe(struct i2c_client *client)
>         return err;
>  }
>
> -static int
> +static void
>  w83781d_remove(struct i2c_client *client)
>  {
>         struct w83781d_data *data =3D i2c_get_clientdata(client);
> @@ -1250,8 +1250,6 @@ w83781d_remove(struct i2c_client *client)
>
>         i2c_unregister_device(data->lm75[0]);
>         i2c_unregister_device(data->lm75[1]);
> -
> -       return 0;
>  }
>
>  static int
> diff --git a/drivers/hwmon/w83791d.c b/drivers/hwmon/w83791d.c
> index 80a9a78d7ce9..5fe5c93856af 100644
> --- a/drivers/hwmon/w83791d.c
> +++ b/drivers/hwmon/w83791d.c
> @@ -315,7 +315,7 @@ struct w83791d_data {
>  static int w83791d_probe(struct i2c_client *client);
>  static int w83791d_detect(struct i2c_client *client,
>                           struct i2c_board_info *info);
> -static int w83791d_remove(struct i2c_client *client);
> +static void w83791d_remove(struct i2c_client *client);
>
>  static int w83791d_read(struct i2c_client *client, u8 reg);
>  static int w83791d_write(struct i2c_client *client, u8 reg, u8 value);
> @@ -1405,14 +1405,12 @@ static int w83791d_probe(struct i2c_client *clien=
t)
>         return err;
>  }
>
> -static int w83791d_remove(struct i2c_client *client)
> +static void w83791d_remove(struct i2c_client *client)
>  {
>         struct w83791d_data *data =3D i2c_get_clientdata(client);
>
>         hwmon_device_unregister(data->hwmon_dev);
>         sysfs_remove_group(&client->dev.kobj, &w83791d_group);
> -
> -       return 0;
>  }
>
>  static void w83791d_init_client(struct i2c_client *client)
> diff --git a/drivers/hwmon/w83792d.c b/drivers/hwmon/w83792d.c
> index 31a1cdc30877..2ee8ee4f0f1c 100644
> --- a/drivers/hwmon/w83792d.c
> +++ b/drivers/hwmon/w83792d.c
> @@ -286,7 +286,7 @@ struct w83792d_data {
>  static int w83792d_probe(struct i2c_client *client);
>  static int w83792d_detect(struct i2c_client *client,
>                           struct i2c_board_info *info);
> -static int w83792d_remove(struct i2c_client *client);
> +static void w83792d_remove(struct i2c_client *client);
>  static struct w83792d_data *w83792d_update_device(struct device *dev);
>
>  #ifdef DEBUG
> @@ -1429,7 +1429,7 @@ w83792d_probe(struct i2c_client *client)
>         return err;
>  }
>
> -static int
> +static void
>  w83792d_remove(struct i2c_client *client)
>  {
>         struct w83792d_data *data =3D i2c_get_clientdata(client);
> @@ -1440,8 +1440,6 @@ w83792d_remove(struct i2c_client *client)
>         for (i =3D 0; i < ARRAY_SIZE(w83792d_group_fan); i++)
>                 sysfs_remove_group(&client->dev.kobj,
>                                    &w83792d_group_fan[i]);
> -
> -       return 0;
>  }
>
>  static void
> diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
> index 0a65d164c8f0..daeaaded6b76 100644
> --- a/drivers/hwmon/w83793.c
> +++ b/drivers/hwmon/w83793.c
> @@ -285,7 +285,7 @@ static int w83793_write_value(struct i2c_client *clie=
nt, u16 reg, u8 value);
>  static int w83793_probe(struct i2c_client *client);
>  static int w83793_detect(struct i2c_client *client,
>                          struct i2c_board_info *info);
> -static int w83793_remove(struct i2c_client *client);
> +static void w83793_remove(struct i2c_client *client);
>  static void w83793_init_client(struct i2c_client *client);
>  static void w83793_update_nonvolatile(struct device *dev);
>  static struct w83793_data *w83793_update_device(struct device *dev);
> @@ -1495,7 +1495,7 @@ static struct notifier_block watchdog_notifier =3D =
{
>   * Init / remove routines
>   */
>
> -static int w83793_remove(struct i2c_client *client)
> +static void w83793_remove(struct i2c_client *client)
>  {
>         struct w83793_data *data =3D i2c_get_clientdata(client);
>         struct device *dev =3D &client->dev;
> @@ -1554,8 +1554,6 @@ static int w83793_remove(struct i2c_client *client)
>         mutex_lock(&watchdog_data_mutex);
>         kref_put(&data->kref, w83793_release_resources);
>         mutex_unlock(&watchdog_data_mutex);
> -
> -       return 0;
>  }
>
>  static int
> diff --git a/drivers/hwmon/w83795.c b/drivers/hwmon/w83795.c
> index 45b12c4287df..b170cdf3c2be 100644
> --- a/drivers/hwmon/w83795.c
> +++ b/drivers/hwmon/w83795.c
> @@ -2235,14 +2235,12 @@ static int w83795_probe(struct i2c_client *client=
)
>         return err;
>  }
>
> -static int w83795_remove(struct i2c_client *client)
> +static void w83795_remove(struct i2c_client *client)
>  {
>         struct w83795_data *data =3D i2c_get_clientdata(client);
>
>         hwmon_device_unregister(data->hwmon_dev);
>         w83795_handle_files(&client->dev, device_remove_file_wrapper);
> -
> -       return 0;
>  }
>
>
> diff --git a/drivers/hwmon/w83l785ts.c b/drivers/hwmon/w83l785ts.c
> index a41f989d66e2..99f68358378b 100644
> --- a/drivers/hwmon/w83l785ts.c
> +++ b/drivers/hwmon/w83l785ts.c
> @@ -65,7 +65,7 @@ static const unsigned short normal_i2c[] =3D { 0x2e, I2=
C_CLIENT_END };
>  static int w83l785ts_probe(struct i2c_client *client);
>  static int w83l785ts_detect(struct i2c_client *client,
>                             struct i2c_board_info *info);
> -static int w83l785ts_remove(struct i2c_client *client);
> +static void w83l785ts_remove(struct i2c_client *client);
>  static u8 w83l785ts_read_value(struct i2c_client *client, u8 reg, u8 def=
val);
>  static struct w83l785ts_data *w83l785ts_update_device(struct device *dev=
);
>
> @@ -203,7 +203,7 @@ static int w83l785ts_probe(struct i2c_client *client)
>         return err;
>  }
>
> -static int w83l785ts_remove(struct i2c_client *client)
> +static void w83l785ts_remove(struct i2c_client *client)
>  {
>         struct w83l785ts_data *data =3D i2c_get_clientdata(client);
>
> @@ -212,8 +212,6 @@ static int w83l785ts_remove(struct i2c_client *client=
)
>                            &sensor_dev_attr_temp1_input.dev_attr);
>         device_remove_file(&client->dev,
>                            &sensor_dev_attr_temp1_max.dev_attr);
> -
> -       return 0;
>  }
>
>  static u8 w83l785ts_read_value(struct i2c_client *client, u8 reg, u8 def=
val)
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 8ae47e0bbd67..68fc66a424ef 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -599,13 +599,9 @@ static void i2c_device_remove(struct device *dev)
>
>         driver =3D to_i2c_driver(dev->driver);
>         if (driver->remove) {
> -               int status;
> -
>                 dev_dbg(dev, "remove\n");
>
> -               status =3D driver->remove(client);
> -               if (status)
> -                       dev_warn(dev, "remove failed (%pe), will be ignor=
ed\n", ERR_PTR(status));
> +               driver->remove(client);
>         }
>
>         devres_release_group(&client->dev, client->devres_group_id);
> diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eepro=
m.c
> index 5c7ae421cacf..4abc2d919881 100644
> --- a/drivers/i2c/i2c-slave-eeprom.c
> +++ b/drivers/i2c/i2c-slave-eeprom.c
> @@ -181,14 +181,12 @@ static int i2c_slave_eeprom_probe(struct i2c_client=
 *client, const struct i2c_de
>         return 0;
>  };
>
> -static int i2c_slave_eeprom_remove(struct i2c_client *client)
> +static void i2c_slave_eeprom_remove(struct i2c_client *client)
>  {
>         struct eeprom_data *eeprom =3D i2c_get_clientdata(client);
>
>         i2c_slave_unregister(client);
>         sysfs_remove_bin_file(&client->dev.kobj, &eeprom->bin);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id i2c_slave_eeprom_id[] =3D {
> diff --git a/drivers/i2c/i2c-slave-testunit.c b/drivers/i2c/i2c-slave-tes=
tunit.c
> index 56dae08dfd48..75ee7ebdb614 100644
> --- a/drivers/i2c/i2c-slave-testunit.c
> +++ b/drivers/i2c/i2c-slave-testunit.c
> @@ -153,13 +153,12 @@ static int i2c_slave_testunit_probe(struct i2c_clie=
nt *client)
>         return i2c_slave_register(client, i2c_slave_testunit_slave_cb);
>  };
>
> -static int i2c_slave_testunit_remove(struct i2c_client *client)
> +static void i2c_slave_testunit_remove(struct i2c_client *client)
>  {
>         struct testunit_data *tu =3D i2c_get_clientdata(client);
>
>         cancel_delayed_work_sync(&tu->worker);
>         i2c_slave_unregister(client);
> -       return 0;
>  }
>
>  static const struct i2c_device_id i2c_slave_testunit_id[] =3D {
> diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
> index 775332945ad0..b0f1da7ec0f2 100644
> --- a/drivers/i2c/i2c-smbus.c
> +++ b/drivers/i2c/i2c-smbus.c
> @@ -153,12 +153,11 @@ static int smbalert_probe(struct i2c_client *ara,
>  }
>
>  /* IRQ and memory resources are managed so they are freed automatically =
*/
> -static int smbalert_remove(struct i2c_client *ara)
> +static void smbalert_remove(struct i2c_client *ara)
>  {
>         struct i2c_smbus_alert *alert =3D i2c_get_clientdata(ara);
>
>         cancel_work_sync(&alert->alert);
> -       return 0;
>  }
>
>  static const struct i2c_device_id smbalert_ids[] =3D {
> diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-=
mux-ltc4306.c
> index 704f1e50f6f4..70835825083f 100644
> --- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
> +++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
> @@ -294,13 +294,11 @@ static int ltc4306_probe(struct i2c_client *client)
>         return 0;
>  }
>
> -static int ltc4306_remove(struct i2c_client *client)
> +static void ltc4306_remove(struct i2c_client *client)
>  {
>         struct i2c_mux_core *muxc =3D i2c_get_clientdata(client);
>
>         i2c_mux_del_adapters(muxc);
> -
> -       return 0;
>  }
>
>  static struct i2c_driver ltc4306_driver =3D {
> diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-=
mux-pca9541.c
> index 6daec8d3d331..ea83de78f52d 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca9541.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
> @@ -325,12 +325,11 @@ static int pca9541_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int pca9541_remove(struct i2c_client *client)
> +static void pca9541_remove(struct i2c_client *client)
>  {
>         struct i2c_mux_core *muxc =3D i2c_get_clientdata(client);
>
>         i2c_mux_del_adapters(muxc);
> -       return 0;
>  }
>
>  static struct i2c_driver pca9541_driver =3D {
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-=
mux-pca954x.c
> index 4ad665757dd8..a5f458b635df 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -521,14 +521,13 @@ static int pca954x_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int pca954x_remove(struct i2c_client *client)
> +static void pca954x_remove(struct i2c_client *client)
>  {
>         struct i2c_mux_core *muxc =3D i2c_get_clientdata(client);
>
>         device_remove_file(&client->dev, &dev_attr_idle_state);
>
>         pca954x_cleanup(muxc);
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/iio/accel/bma180.c b/drivers/iio/accel/bma180.c
> index 9c9e98578667..d03fc3400f94 100644
> --- a/drivers/iio/accel/bma180.c
> +++ b/drivers/iio/accel/bma180.c
> @@ -1045,7 +1045,7 @@ static int bma180_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int bma180_remove(struct i2c_client *client)
> +static void bma180_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct bma180_data *data =3D iio_priv(indio_dev);
> @@ -1062,8 +1062,6 @@ static int bma180_remove(struct i2c_client *client)
>         mutex_unlock(&data->mutex);
>         regulator_disable(data->vddio_supply);
>         regulator_disable(data->vdd_supply);
> -
> -       return 0;
>  }
>
>  static int bma180_suspend(struct device *dev)
> diff --git a/drivers/iio/accel/bma400_i2c.c b/drivers/iio/accel/bma400_i2=
c.c
> index da104ffd3fe0..90c99ab8c8f2 100644
> --- a/drivers/iio/accel/bma400_i2c.c
> +++ b/drivers/iio/accel/bma400_i2c.c
> @@ -27,11 +27,9 @@ static int bma400_i2c_probe(struct i2c_client *client,
>         return bma400_probe(&client->dev, regmap, id->name);
>  }
>
> -static int bma400_i2c_remove(struct i2c_client *client)
> +static void bma400_i2c_remove(struct i2c_client *client)
>  {
>         bma400_remove(&client->dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id bma400_i2c_ids[] =3D {
> diff --git a/drivers/iio/accel/bmc150-accel-i2c.c b/drivers/iio/accel/bmc=
150-accel-i2c.c
> index dff4d7dd101c..be8cc598b88e 100644
> --- a/drivers/iio/accel/bmc150-accel-i2c.c
> +++ b/drivers/iio/accel/bmc150-accel-i2c.c
> @@ -209,13 +209,11 @@ static int bmc150_accel_probe(struct i2c_client *cl=
ient,
>         return 0;
>  }
>
> -static int bmc150_accel_remove(struct i2c_client *client)
> +static void bmc150_accel_remove(struct i2c_client *client)
>  {
>         bmc150_acpi_dual_accel_remove(client);
>
>         bmc150_accel_core_remove(&client->dev);
> -
> -       return 0;
>  }
>
>  static const struct acpi_device_id bmc150_accel_acpi_match[] =3D {
> diff --git a/drivers/iio/accel/kxcjk-1013.c b/drivers/iio/accel/kxcjk-101=
3.c
> index 748b35c2f0c3..94f7b6ac5c87 100644
> --- a/drivers/iio/accel/kxcjk-1013.c
> +++ b/drivers/iio/accel/kxcjk-1013.c
> @@ -1611,7 +1611,7 @@ static int kxcjk1013_probe(struct i2c_client *clien=
t,
>         return ret;
>  }
>
> -static int kxcjk1013_remove(struct i2c_client *client)
> +static void kxcjk1013_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct kxcjk1013_data *data =3D iio_priv(indio_dev);
> @@ -1630,8 +1630,6 @@ static int kxcjk1013_remove(struct i2c_client *clie=
nt)
>         mutex_lock(&data->mutex);
>         kxcjk1013_set_mode(data, STANDBY);
>         mutex_unlock(&data->mutex);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/iio/accel/kxsd9-i2c.c b/drivers/iio/accel/kxsd9-i2c.=
c
> index c8dc52f11037..86c0d70d0da7 100644
> --- a/drivers/iio/accel/kxsd9-i2c.c
> +++ b/drivers/iio/accel/kxsd9-i2c.c
> @@ -32,11 +32,9 @@ static int kxsd9_i2c_probe(struct i2c_client *i2c,
>                                   i2c->name);
>  }
>
> -static int kxsd9_i2c_remove(struct i2c_client *client)
> +static void kxsd9_i2c_remove(struct i2c_client *client)
>  {
>         kxsd9_common_remove(&client->dev);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id kxsd9_of_match[] =3D {
> diff --git a/drivers/iio/accel/mc3230.c b/drivers/iio/accel/mc3230.c
> index c15d16e7f1da..2462000e0519 100644
> --- a/drivers/iio/accel/mc3230.c
> +++ b/drivers/iio/accel/mc3230.c
> @@ -151,15 +151,13 @@ static int mc3230_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int mc3230_remove(struct i2c_client *client)
> +static void mc3230_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>
>         iio_device_unregister(indio_dev);
>
>         mc3230_set_opcon(iio_priv(indio_dev), MC3230_MODE_OPCON_STANDBY);
> -
> -       return 0;
>  }
>
>  static int mc3230_suspend(struct device *dev)
> diff --git a/drivers/iio/accel/mma7455_i2c.c b/drivers/iio/accel/mma7455_=
i2c.c
> index a3b84e8a3ea8..c63b321b01cd 100644
> --- a/drivers/iio/accel/mma7455_i2c.c
> +++ b/drivers/iio/accel/mma7455_i2c.c
> @@ -26,11 +26,9 @@ static int mma7455_i2c_probe(struct i2c_client *i2c,
>         return mma7455_core_probe(&i2c->dev, regmap, name);
>  }
>
> -static int mma7455_i2c_remove(struct i2c_client *i2c)
> +static void mma7455_i2c_remove(struct i2c_client *i2c)
>  {
>         mma7455_core_remove(&i2c->dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id mma7455_i2c_ids[] =3D {
> diff --git a/drivers/iio/accel/mma7660.c b/drivers/iio/accel/mma7660.c
> index 112a5a33c29f..ad2aac0ec1d4 100644
> --- a/drivers/iio/accel/mma7660.c
> +++ b/drivers/iio/accel/mma7660.c
> @@ -207,7 +207,7 @@ static int mma7660_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int mma7660_remove(struct i2c_client *client)
> +static void mma7660_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         int ret;
> @@ -218,8 +218,6 @@ static int mma7660_remove(struct i2c_client *client)
>         if (ret)
>                 dev_warn(&client->dev, "Failed to put device in stand-by =
mode (%pe), ignoring\n",
>                          ERR_PTR(ret));
> -
> -       return 0;
>  }
>
>  static int mma7660_suspend(struct device *dev)
> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index c7d9ca96dbaa..3ba28c2ff68a 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -1735,7 +1735,7 @@ static int mma8452_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int mma8452_remove(struct i2c_client *client)
> +static void mma8452_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct mma8452_data *data =3D iio_priv(indio_dev);
> @@ -1751,8 +1751,6 @@ static int mma8452_remove(struct i2c_client *client=
)
>
>         regulator_disable(data->vddio_reg);
>         regulator_disable(data->vdd_reg);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM
> diff --git a/drivers/iio/accel/mma9551.c b/drivers/iio/accel/mma9551.c
> index 123cdbbb265c..f7a793f4a8e3 100644
> --- a/drivers/iio/accel/mma9551.c
> +++ b/drivers/iio/accel/mma9551.c
> @@ -509,7 +509,7 @@ static int mma9551_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int mma9551_remove(struct i2c_client *client)
> +static void mma9551_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct mma9551_data *data =3D iio_priv(indio_dev);
> @@ -522,8 +522,6 @@ static int mma9551_remove(struct i2c_client *client)
>         mutex_lock(&data->mutex);
>         mma9551_set_device_state(data->client, false);
>         mutex_unlock(&data->mutex);
> -
> -       return 0;
>  }
>
>  static int mma9551_runtime_suspend(struct device *dev)
> diff --git a/drivers/iio/accel/mma9553.c b/drivers/iio/accel/mma9553.c
> index 09df58d4be33..2da0e005b13e 100644
> --- a/drivers/iio/accel/mma9553.c
> +++ b/drivers/iio/accel/mma9553.c
> @@ -1148,7 +1148,7 @@ static int mma9553_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int mma9553_remove(struct i2c_client *client)
> +static void mma9553_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct mma9553_data *data =3D iio_priv(indio_dev);
> @@ -1161,8 +1161,6 @@ static int mma9553_remove(struct i2c_client *client=
)
>         mutex_lock(&data->mutex);
>         mma9551_set_device_state(data->client, false);
>         mutex_unlock(&data->mutex);
> -
> -       return 0;
>  }
>
>  static int mma9553_runtime_suspend(struct device *dev)
> diff --git a/drivers/iio/accel/stk8312.c b/drivers/iio/accel/stk8312.c
> index ceca28913355..7b1d6fb692b3 100644
> --- a/drivers/iio/accel/stk8312.c
> +++ b/drivers/iio/accel/stk8312.c
> @@ -597,7 +597,7 @@ static int stk8312_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int stk8312_remove(struct i2c_client *client)
> +static void stk8312_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct stk8312_data *data =3D iio_priv(indio_dev);
> @@ -609,8 +609,6 @@ static int stk8312_remove(struct i2c_client *client)
>                 iio_trigger_unregister(data->dready_trig);
>
>         stk8312_set_mode(data, STK8312_MODE_STANDBY);
> -
> -       return 0;
>  }
>
>  static int stk8312_suspend(struct device *dev)
> diff --git a/drivers/iio/accel/stk8ba50.c b/drivers/iio/accel/stk8ba50.c
> index 7d59efb41e22..2f5e4ab2a6e7 100644
> --- a/drivers/iio/accel/stk8ba50.c
> +++ b/drivers/iio/accel/stk8ba50.c
> @@ -490,7 +490,7 @@ static int stk8ba50_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int stk8ba50_remove(struct i2c_client *client)
> +static void stk8ba50_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct stk8ba50_data *data =3D iio_priv(indio_dev);
> @@ -502,8 +502,6 @@ static int stk8ba50_remove(struct i2c_client *client)
>                 iio_trigger_unregister(data->dready_trig);
>
>         stk8ba50_set_power(data, STK8BA50_MODE_SUSPEND);
> -
> -       return 0;
>  }
>
>  static int stk8ba50_suspend(struct device *dev)
> diff --git a/drivers/iio/adc/ad799x.c b/drivers/iio/adc/ad799x.c
> index 220228c375d3..746bf9a01c25 100644
> --- a/drivers/iio/adc/ad799x.c
> +++ b/drivers/iio/adc/ad799x.c
> @@ -880,7 +880,7 @@ static int ad799x_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int ad799x_remove(struct i2c_client *client)
> +static void ad799x_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct ad799x_state *st =3D iio_priv(indio_dev);
> @@ -892,8 +892,6 @@ static int ad799x_remove(struct i2c_client *client)
>                 regulator_disable(st->vref);
>         regulator_disable(st->reg);
>         kfree(st->rx_buf);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused ad799x_suspend(struct device *dev)
> diff --git a/drivers/iio/adc/ina2xx-adc.c b/drivers/iio/adc/ina2xx-adc.c
> index 240e6c420701..910e7e965fc4 100644
> --- a/drivers/iio/adc/ina2xx-adc.c
> +++ b/drivers/iio/adc/ina2xx-adc.c
> @@ -1034,7 +1034,7 @@ static int ina2xx_probe(struct i2c_client *client,
>         return iio_device_register(indio_dev);
>  }
>
> -static int ina2xx_remove(struct i2c_client *client)
> +static void ina2xx_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct ina2xx_chip_info *chip =3D iio_priv(indio_dev);
> @@ -1048,8 +1048,6 @@ static int ina2xx_remove(struct i2c_client *client)
>         if (ret)
>                 dev_warn(&client->dev, "Failed to power down device (%pe)=
\n",
>                          ERR_PTR(ret));
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ina2xx_id[] =3D {
> diff --git a/drivers/iio/adc/ltc2497.c b/drivers/iio/adc/ltc2497.c
> index 1adddf5a88a9..be57f1157796 100644
> --- a/drivers/iio/adc/ltc2497.c
> +++ b/drivers/iio/adc/ltc2497.c
> @@ -74,13 +74,11 @@ static int ltc2497_probe(struct i2c_client *client,
>         return ltc2497core_probe(dev, indio_dev);
>  }
>
> -static int ltc2497_remove(struct i2c_client *client)
> +static void ltc2497_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>
>         ltc2497core_remove(indio_dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ltc2497_id[] =3D {
> diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
> index e3dfc155fbe2..8bceba694026 100644
> --- a/drivers/iio/adc/ti-ads1015.c
> +++ b/drivers/iio/adc/ti-ads1015.c
> @@ -1094,7 +1094,7 @@ static int ads1015_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int ads1015_remove(struct i2c_client *client)
> +static void ads1015_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct ads1015_data *data =3D iio_priv(indio_dev);
> @@ -1110,8 +1110,6 @@ static int ads1015_remove(struct i2c_client *client=
)
>         if (ret)
>                 dev_warn(&client->dev, "Failed to power down (%pe)\n",
>                          ERR_PTR(ret));
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM
> diff --git a/drivers/iio/chemical/atlas-sensor.c b/drivers/iio/chemical/a=
tlas-sensor.c
> index 8378c00fa2ff..7cac77a931c7 100644
> --- a/drivers/iio/chemical/atlas-sensor.c
> +++ b/drivers/iio/chemical/atlas-sensor.c
> @@ -722,7 +722,7 @@ static int atlas_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int atlas_remove(struct i2c_client *client)
> +static void atlas_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct atlas_data *data =3D iio_priv(indio_dev);
> @@ -739,8 +739,6 @@ static int atlas_remove(struct i2c_client *client)
>         if (ret)
>                 dev_err(&client->dev, "Failed to power down device (%pe)\=
n",
>                         ERR_PTR(ret));
> -
> -       return 0;
>  }
>
>  static int atlas_runtime_suspend(struct device *dev)
> diff --git a/drivers/iio/chemical/ccs811.c b/drivers/iio/chemical/ccs811.=
c
> index 560183efb36f..ba4045e20303 100644
> --- a/drivers/iio/chemical/ccs811.c
> +++ b/drivers/iio/chemical/ccs811.c
> @@ -532,7 +532,7 @@ static int ccs811_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int ccs811_remove(struct i2c_client *client)
> +static void ccs811_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct ccs811_data *data =3D iio_priv(indio_dev);
> @@ -548,8 +548,6 @@ static int ccs811_remove(struct i2c_client *client)
>         if (ret)
>                 dev_warn(&client->dev, "Failed to power down device (%pe)=
\n",
>                          ERR_PTR(ret));
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ccs811_id[] =3D {
> diff --git a/drivers/iio/chemical/sgp30.c b/drivers/iio/chemical/sgp30.c
> index 2343d444604d..e2c13c78c7e0 100644
> --- a/drivers/iio/chemical/sgp30.c
> +++ b/drivers/iio/chemical/sgp30.c
> @@ -552,15 +552,13 @@ static int sgp_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int sgp_remove(struct i2c_client *client)
> +static void sgp_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct sgp_data *data =3D iio_priv(indio_dev);
>
>         if (data->iaq_thread)
>                 kthread_stop(data->iaq_thread);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id sgp_id[] =3D {
> diff --git a/drivers/iio/dac/ad5380.c b/drivers/iio/dac/ad5380.c
> index a44c83242fb1..62d7fc53c7f4 100644
> --- a/drivers/iio/dac/ad5380.c
> +++ b/drivers/iio/dac/ad5380.c
> @@ -561,11 +561,9 @@ static int ad5380_i2c_probe(struct i2c_client *i2c,
>         return ad5380_probe(&i2c->dev, regmap, id->driver_data, id->name)=
;
>  }
>
> -static int ad5380_i2c_remove(struct i2c_client *i2c)
> +static void ad5380_i2c_remove(struct i2c_client *i2c)
>  {
>         ad5380_remove(&i2c->dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ad5380_i2c_ids[] =3D {
> diff --git a/drivers/iio/dac/ad5446.c b/drivers/iio/dac/ad5446.c
> index 09e242949cd0..7324065d3782 100644
> --- a/drivers/iio/dac/ad5446.c
> +++ b/drivers/iio/dac/ad5446.c
> @@ -575,11 +575,9 @@ static int ad5446_i2c_probe(struct i2c_client *i2c,
>                 &ad5446_i2c_chip_info[id->driver_data]);
>  }
>
> -static int ad5446_i2c_remove(struct i2c_client *i2c)
> +static void ad5446_i2c_remove(struct i2c_client *i2c)
>  {
>         ad5446_remove(&i2c->dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ad5446_i2c_ids[] =3D {
> diff --git a/drivers/iio/dac/ad5593r.c b/drivers/iio/dac/ad5593r.c
> index 34e1319a9712..92be661034a6 100644
> --- a/drivers/iio/dac/ad5593r.c
> +++ b/drivers/iio/dac/ad5593r.c
> @@ -97,11 +97,9 @@ static int ad5593r_i2c_probe(struct i2c_client *i2c,
>         return ad5592r_probe(&i2c->dev, id->name, &ad5593r_rw_ops);
>  }
>
> -static int ad5593r_i2c_remove(struct i2c_client *i2c)
> +static void ad5593r_i2c_remove(struct i2c_client *i2c)
>  {
>         ad5592r_remove(&i2c->dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ad5593r_i2c_ids[] =3D {
> diff --git a/drivers/iio/dac/ad5696-i2c.c b/drivers/iio/dac/ad5696-i2c.c
> index 762503c1901b..aa36cbf0137c 100644
> --- a/drivers/iio/dac/ad5696-i2c.c
> +++ b/drivers/iio/dac/ad5696-i2c.c
> @@ -65,11 +65,9 @@ static int ad5686_i2c_probe(struct i2c_client *i2c,
>                             ad5686_i2c_write, ad5686_i2c_read);
>  }
>
> -static int ad5686_i2c_remove(struct i2c_client *i2c)
> +static void ad5686_i2c_remove(struct i2c_client *i2c)
>  {
>         ad5686_remove(&i2c->dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ad5686_i2c_id[] =3D {
> diff --git a/drivers/iio/dac/ds4424.c b/drivers/iio/dac/ds4424.c
> index 5a5e967b0be4..e3dcf1efb7fa 100644
> --- a/drivers/iio/dac/ds4424.c
> +++ b/drivers/iio/dac/ds4424.c
> @@ -281,15 +281,13 @@ static int ds4424_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int ds4424_remove(struct i2c_client *client)
> +static void ds4424_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct ds4424_data *data =3D iio_priv(indio_dev);
>
>         iio_device_unregister(indio_dev);
>         regulator_disable(data->vcc_reg);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ds4424_id[] =3D {
> diff --git a/drivers/iio/dac/m62332.c b/drivers/iio/dac/m62332.c
> index 22b02f50fe41..5a812f87970c 100644
> --- a/drivers/iio/dac/m62332.c
> +++ b/drivers/iio/dac/m62332.c
> @@ -218,7 +218,7 @@ static int m62332_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int m62332_remove(struct i2c_client *client)
> +static void m62332_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>
> @@ -226,8 +226,6 @@ static int m62332_remove(struct i2c_client *client)
>         iio_map_array_unregister(indio_dev);
>         m62332_set_value(indio_dev, 0, 0);
>         m62332_set_value(indio_dev, 0, 1);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id m62332_id[] =3D {
> diff --git a/drivers/iio/dac/mcp4725.c b/drivers/iio/dac/mcp4725.c
> index 7fcb86288823..29ab21904aca 100644
> --- a/drivers/iio/dac/mcp4725.c
> +++ b/drivers/iio/dac/mcp4725.c
> @@ -485,7 +485,7 @@ static int mcp4725_probe(struct i2c_client *client,
>         return err;
>  }
>
> -static int mcp4725_remove(struct i2c_client *client)
> +static void mcp4725_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct mcp4725_data *data =3D iio_priv(indio_dev);
> @@ -495,8 +495,6 @@ static int mcp4725_remove(struct i2c_client *client)
>         if (data->vref_reg)
>                 regulator_disable(data->vref_reg);
>         regulator_disable(data->vdd_reg);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id mcp4725_id[] =3D {
> diff --git a/drivers/iio/dac/ti-dac5571.c b/drivers/iio/dac/ti-dac5571.c
> index 4b6b04038e94..96b8d80b72a0 100644
> --- a/drivers/iio/dac/ti-dac5571.c
> +++ b/drivers/iio/dac/ti-dac5571.c
> @@ -381,15 +381,13 @@ static int dac5571_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int dac5571_remove(struct i2c_client *i2c)
> +static void dac5571_remove(struct i2c_client *i2c)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(i2c);
>         struct dac5571_data *data =3D iio_priv(indio_dev);
>
>         iio_device_unregister(indio_dev);
>         regulator_disable(data->vref);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id dac5571_of_id[] =3D {
> diff --git a/drivers/iio/gyro/bmg160_i2c.c b/drivers/iio/gyro/bmg160_i2c.=
c
> index b3fa46bd02cb..908ccc385254 100644
> --- a/drivers/iio/gyro/bmg160_i2c.c
> +++ b/drivers/iio/gyro/bmg160_i2c.c
> @@ -32,11 +32,9 @@ static int bmg160_i2c_probe(struct i2c_client *client,
>         return bmg160_core_probe(&client->dev, regmap, client->irq, name)=
;
>  }
>
> -static int bmg160_i2c_remove(struct i2c_client *client)
> +static void bmg160_i2c_remove(struct i2c_client *client)
>  {
>         bmg160_core_remove(&client->dev);
> -
> -       return 0;
>  }
>
>  static const struct acpi_device_id bmg160_acpi_match[] =3D {
> diff --git a/drivers/iio/gyro/fxas21002c_i2c.c b/drivers/iio/gyro/fxas210=
02c_i2c.c
> index a7807fd97483..13bb52c594d1 100644
> --- a/drivers/iio/gyro/fxas21002c_i2c.c
> +++ b/drivers/iio/gyro/fxas21002c_i2c.c
> @@ -33,11 +33,9 @@ static int fxas21002c_i2c_probe(struct i2c_client *i2c=
)
>         return fxas21002c_core_probe(&i2c->dev, regmap, i2c->irq, i2c->na=
me);
>  }
>
> -static int fxas21002c_i2c_remove(struct i2c_client *i2c)
> +static void fxas21002c_i2c_remove(struct i2c_client *i2c)
>  {
>         fxas21002c_core_remove(&i2c->dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id fxas21002c_i2c_id[] =3D {
> diff --git a/drivers/iio/gyro/itg3200_core.c b/drivers/iio/gyro/itg3200_c=
ore.c
> index a7f1bbb5f289..8b3758e3b9e8 100644
> --- a/drivers/iio/gyro/itg3200_core.c
> +++ b/drivers/iio/gyro/itg3200_core.c
> @@ -350,7 +350,7 @@ static int itg3200_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int itg3200_remove(struct i2c_client *client)
> +static void itg3200_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>
> @@ -360,8 +360,6 @@ static int itg3200_remove(struct i2c_client *client)
>                 itg3200_remove_trigger(indio_dev);
>
>         itg3200_buffer_unconfigure(indio_dev);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused itg3200_suspend(struct device *dev)
> diff --git a/drivers/iio/gyro/mpu3050-i2c.c b/drivers/iio/gyro/mpu3050-i2=
c.c
> index 5b5f58baaf7f..4d5e4b04745d 100644
> --- a/drivers/iio/gyro/mpu3050-i2c.c
> +++ b/drivers/iio/gyro/mpu3050-i2c.c
> @@ -78,7 +78,7 @@ static int mpu3050_i2c_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int mpu3050_i2c_remove(struct i2c_client *client)
> +static void mpu3050_i2c_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D dev_get_drvdata(&client->dev);
>         struct mpu3050 *mpu3050 =3D iio_priv(indio_dev);
> @@ -87,8 +87,6 @@ static int mpu3050_i2c_remove(struct i2c_client *client=
)
>                 i2c_mux_del_adapters(mpu3050->i2cmux);
>
>         mpu3050_common_remove(&client->dev);
> -
> -       return 0;
>  }
>
>  /*
> diff --git a/drivers/iio/health/afe4404.c b/drivers/iio/health/afe4404.c
> index 1bb7de60f8ca..a87337453824 100644
> --- a/drivers/iio/health/afe4404.c
> +++ b/drivers/iio/health/afe4404.c
> @@ -577,7 +577,7 @@ static int afe4404_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int afe4404_remove(struct i2c_client *client)
> +static void afe4404_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct afe4404_data *afe =3D iio_priv(indio_dev);
> @@ -593,8 +593,6 @@ static int afe4404_remove(struct i2c_client *client)
>         ret =3D regulator_disable(afe->regulator);
>         if (ret)
>                 dev_err(afe->dev, "Unable to disable regulator\n");
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id afe4404_ids[] =3D {
> diff --git a/drivers/iio/health/max30100.c b/drivers/iio/health/max30100.=
c
> index ad5717965223..2cca5e0519f8 100644
> --- a/drivers/iio/health/max30100.c
> +++ b/drivers/iio/health/max30100.c
> @@ -471,15 +471,13 @@ static int max30100_probe(struct i2c_client *client=
,
>         return iio_device_register(indio_dev);
>  }
>
> -static int max30100_remove(struct i2c_client *client)
> +static void max30100_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct max30100_data *data =3D iio_priv(indio_dev);
>
>         iio_device_unregister(indio_dev);
>         max30100_set_powermode(data, false);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id max30100_id[] =3D {
> diff --git a/drivers/iio/health/max30102.c b/drivers/iio/health/max30102.=
c
> index abbcef563807..437298a29f2d 100644
> --- a/drivers/iio/health/max30102.c
> +++ b/drivers/iio/health/max30102.c
> @@ -592,15 +592,13 @@ static int max30102_probe(struct i2c_client *client=
,
>         return iio_device_register(indio_dev);
>  }
>
> -static int max30102_remove(struct i2c_client *client)
> +static void max30102_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct max30102_data *data =3D iio_priv(indio_dev);
>
>         iio_device_unregister(indio_dev);
>         max30102_set_power(data, false);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id max30102_id[] =3D {
> diff --git a/drivers/iio/humidity/hdc2010.c b/drivers/iio/humidity/hdc201=
0.c
> index 1381df46187c..d6858ccb056e 100644
> --- a/drivers/iio/humidity/hdc2010.c
> +++ b/drivers/iio/humidity/hdc2010.c
> @@ -308,7 +308,7 @@ static int hdc2010_probe(struct i2c_client *client,
>         return iio_device_register(indio_dev);
>  }
>
> -static int hdc2010_remove(struct i2c_client *client)
> +static void hdc2010_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct hdc2010_data *data =3D iio_priv(indio_dev);
> @@ -318,8 +318,6 @@ static int hdc2010_remove(struct i2c_client *client)
>         /* Disable Automatic Measurement Mode */
>         if (hdc2010_update_drdy_config(data, HDC2010_AMM, 0))
>                 dev_warn(&client->dev, "Unable to restore default AMM\n")=
;
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id hdc2010_id[] =3D {
> diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c b/drivers/iio/imu/=
inv_mpu6050/inv_mpu_i2c.c
> index 2aa647704a79..14255a918eb1 100644
> --- a/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c
> +++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c
> @@ -157,7 +157,7 @@ static int inv_mpu_probe(struct i2c_client *client,
>         return result;
>  }
>
> -static int inv_mpu_remove(struct i2c_client *client)
> +static void inv_mpu_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct inv_mpu6050_state *st =3D iio_priv(indio_dev);
> @@ -166,8 +166,6 @@ static int inv_mpu_remove(struct i2c_client *client)
>                 inv_mpu_acpi_delete_mux_client(client);
>                 i2c_mux_del_adapters(st->muxc);
>         }
> -
> -       return 0;
>  }
>
>  /*
> diff --git a/drivers/iio/imu/kmx61.c b/drivers/iio/imu/kmx61.c
> index ec23b1ee472b..b10c0dcac0bb 100644
> --- a/drivers/iio/imu/kmx61.c
> +++ b/drivers/iio/imu/kmx61.c
> @@ -1418,7 +1418,7 @@ static int kmx61_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int kmx61_remove(struct i2c_client *client)
> +static void kmx61_remove(struct i2c_client *client)
>  {
>         struct kmx61_data *data =3D i2c_get_clientdata(client);
>
> @@ -1439,8 +1439,6 @@ static int kmx61_remove(struct i2c_client *client)
>         mutex_lock(&data->lock);
>         kmx61_set_mode(data, KMX61_ALL_STBY, KMX61_ACC | KMX61_MAG, true)=
;
>         mutex_unlock(&data->lock);
> -
> -       return 0;
>  }
>
>  static int kmx61_suspend(struct device *dev)
> diff --git a/drivers/iio/light/apds9300.c b/drivers/iio/light/apds9300.c
> index 0f9d77598997..b70f2681bcb3 100644
> --- a/drivers/iio/light/apds9300.c
> +++ b/drivers/iio/light/apds9300.c
> @@ -452,7 +452,7 @@ static int apds9300_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int apds9300_remove(struct i2c_client *client)
> +static void apds9300_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct apds9300_data *data =3D iio_priv(indio_dev);
> @@ -462,8 +462,6 @@ static int apds9300_remove(struct i2c_client *client)
>         /* Ensure that power off and interrupts are disabled */
>         apds9300_set_intr_state(data, 0);
>         apds9300_set_power_state(data, 0);
> -
> -       return 0;
>  }
>
>  static int apds9300_suspend(struct device *dev)
> diff --git a/drivers/iio/light/apds9960.c b/drivers/iio/light/apds9960.c
> index 09b831f9f40b..b62c139baf41 100644
> --- a/drivers/iio/light/apds9960.c
> +++ b/drivers/iio/light/apds9960.c
> @@ -1067,7 +1067,7 @@ static int apds9960_probe(struct i2c_client *client=
,
>         return ret;
>  }
>
> -static int apds9960_remove(struct i2c_client *client)
> +static void apds9960_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct apds9960_data *data =3D iio_priv(indio_dev);
> @@ -1076,8 +1076,6 @@ static int apds9960_remove(struct i2c_client *clien=
t)
>         pm_runtime_disable(&client->dev);
>         pm_runtime_set_suspended(&client->dev);
>         apds9960_set_powermode(data, 0);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM
> diff --git a/drivers/iio/light/bh1750.c b/drivers/iio/light/bh1750.c
> index 48484b9401b9..034c47ef6e33 100644
> --- a/drivers/iio/light/bh1750.c
> +++ b/drivers/iio/light/bh1750.c
> @@ -263,7 +263,7 @@ static int bh1750_probe(struct i2c_client *client,
>         return iio_device_register(indio_dev);
>  }
>
> -static int bh1750_remove(struct i2c_client *client)
> +static void bh1750_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct bh1750_data *data =3D iio_priv(indio_dev);
> @@ -273,8 +273,6 @@ static int bh1750_remove(struct i2c_client *client)
>         mutex_lock(&data->lock);
>         i2c_smbus_write_byte(client, BH1750_POWER_DOWN);
>         mutex_unlock(&data->lock);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused bh1750_suspend(struct device *dev)
> diff --git a/drivers/iio/light/bh1780.c b/drivers/iio/light/bh1780.c
> index fc7141390117..90bca392b262 100644
> --- a/drivers/iio/light/bh1780.c
> +++ b/drivers/iio/light/bh1780.c
> @@ -202,7 +202,7 @@ static int bh1780_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int bh1780_remove(struct i2c_client *client)
> +static void bh1780_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct bh1780_data *bh1780 =3D iio_priv(indio_dev);
> @@ -216,8 +216,6 @@ static int bh1780_remove(struct i2c_client *client)
>         if (ret < 0)
>                 dev_err(&client->dev, "failed to power off (%pe)\n",
>                         ERR_PTR(ret));
> -
> -       return 0;
>  }
>
>  static int bh1780_runtime_suspend(struct device *dev)
> diff --git a/drivers/iio/light/cm3232.c b/drivers/iio/light/cm3232.c
> index 2c80a0535d2c..5214cd014cf8 100644
> --- a/drivers/iio/light/cm3232.c
> +++ b/drivers/iio/light/cm3232.c
> @@ -357,7 +357,7 @@ static int cm3232_probe(struct i2c_client *client,
>         return iio_device_register(indio_dev);
>  }
>
> -static int cm3232_remove(struct i2c_client *client)
> +static void cm3232_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>
> @@ -365,8 +365,6 @@ static int cm3232_remove(struct i2c_client *client)
>                 CM3232_CMD_ALS_DISABLE);
>
>         iio_device_unregister(indio_dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id cm3232_id[] =3D {
> diff --git a/drivers/iio/light/cm36651.c b/drivers/iio/light/cm36651.c
> index 89f5e48a6642..6615c98b601c 100644
> --- a/drivers/iio/light/cm36651.c
> +++ b/drivers/iio/light/cm36651.c
> @@ -700,7 +700,7 @@ static int cm36651_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int cm36651_remove(struct i2c_client *client)
> +static void cm36651_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct cm36651_data *cm36651 =3D iio_priv(indio_dev);
> @@ -710,8 +710,6 @@ static int cm36651_remove(struct i2c_client *client)
>         free_irq(client->irq, indio_dev);
>         i2c_unregister_device(cm36651->ps_client);
>         i2c_unregister_device(cm36651->ara_client);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id cm36651_id[] =3D {
> diff --git a/drivers/iio/light/gp2ap002.c b/drivers/iio/light/gp2ap002.c
> index c6d1d88d3775..855dc63fb0a5 100644
> --- a/drivers/iio/light/gp2ap002.c
> +++ b/drivers/iio/light/gp2ap002.c
> @@ -619,7 +619,7 @@ static int gp2ap002_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int gp2ap002_remove(struct i2c_client *client)
> +static void gp2ap002_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct gp2ap002 *gp2ap002 =3D iio_priv(indio_dev);
> @@ -631,8 +631,6 @@ static int gp2ap002_remove(struct i2c_client *client)
>         iio_device_unregister(indio_dev);
>         regulator_disable(gp2ap002->vio);
>         regulator_disable(gp2ap002->vdd);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused gp2ap002_runtime_suspend(struct device *dev)
> diff --git a/drivers/iio/light/gp2ap020a00f.c b/drivers/iio/light/gp2ap02=
0a00f.c
> index b820041159f7..826439299e8b 100644
> --- a/drivers/iio/light/gp2ap020a00f.c
> +++ b/drivers/iio/light/gp2ap020a00f.c
> @@ -1573,7 +1573,7 @@ static int gp2ap020a00f_probe(struct i2c_client *cl=
ient,
>         return err;
>  }
>
> -static int gp2ap020a00f_remove(struct i2c_client *client)
> +static void gp2ap020a00f_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct gp2ap020a00f_data *data =3D iio_priv(indio_dev);
> @@ -1589,8 +1589,6 @@ static int gp2ap020a00f_remove(struct i2c_client *c=
lient)
>         free_irq(client->irq, indio_dev);
>         iio_triggered_buffer_cleanup(indio_dev);
>         regulator_disable(data->vled_reg);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id gp2ap020a00f_id[] =3D {
> diff --git a/drivers/iio/light/isl29028.c b/drivers/iio/light/isl29028.c
> index 720fa83d44e0..6c344875c791 100644
> --- a/drivers/iio/light/isl29028.c
> +++ b/drivers/iio/light/isl29028.c
> @@ -636,7 +636,7 @@ static int isl29028_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int isl29028_remove(struct i2c_client *client)
> +static void isl29028_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct isl29028_chip *chip =3D iio_priv(indio_dev);
> @@ -647,8 +647,6 @@ static int isl29028_remove(struct i2c_client *client)
>         pm_runtime_set_suspended(&client->dev);
>
>         isl29028_clear_configure_reg(chip);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused isl29028_suspend(struct device *dev)
> diff --git a/drivers/iio/light/isl29125.c b/drivers/iio/light/isl29125.c
> index eb68a52aab82..c199e63cce82 100644
> --- a/drivers/iio/light/isl29125.c
> +++ b/drivers/iio/light/isl29125.c
> @@ -300,15 +300,13 @@ static int isl29125_powerdown(struct isl29125_data =
*data)
>                 (data->conf1 & ~ISL29125_MODE_MASK) | ISL29125_MODE_PD);
>  }
>
> -static int isl29125_remove(struct i2c_client *client)
> +static void isl29125_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>
>         iio_device_unregister(indio_dev);
>         iio_triggered_buffer_cleanup(indio_dev);
>         isl29125_powerdown(iio_priv(indio_dev));
> -
> -       return 0;
>  }
>
>  static int isl29125_suspend(struct device *dev)
> diff --git a/drivers/iio/light/jsa1212.c b/drivers/iio/light/jsa1212.c
> index 5387c12231cf..57ce6d75966c 100644
> --- a/drivers/iio/light/jsa1212.c
> +++ b/drivers/iio/light/jsa1212.c
> @@ -373,7 +373,7 @@ static int jsa1212_power_off(struct jsa1212_data *dat=
a)
>         return ret;
>  }
>
> -static int jsa1212_remove(struct i2c_client *client)
> +static void jsa1212_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct jsa1212_data *data =3D iio_priv(indio_dev);
> @@ -381,8 +381,6 @@ static int jsa1212_remove(struct i2c_client *client)
>         iio_device_unregister(indio_dev);
>
>         jsa1212_power_off(data);
> -
> -       return 0;
>  }
>
>  static int jsa1212_suspend(struct device *dev)
> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index 679a1e1086ae..74a1ccda8b9c 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c
> @@ -1600,15 +1600,13 @@ static int ltr501_probe(struct i2c_client *client=
,
>         return ret;
>  }
>
> -static int ltr501_remove(struct i2c_client *client)
> +static void ltr501_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>
>         iio_device_unregister(indio_dev);
>         iio_triggered_buffer_cleanup(indio_dev);
>         ltr501_powerdown(iio_priv(indio_dev));
> -
> -       return 0;
>  }
>
>  static int ltr501_suspend(struct device *dev)
> diff --git a/drivers/iio/light/opt3001.c b/drivers/iio/light/opt3001.c
> index a326d47afc9b..a26d1c3f9543 100644
> --- a/drivers/iio/light/opt3001.c
> +++ b/drivers/iio/light/opt3001.c
> @@ -794,7 +794,7 @@ static int opt3001_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int opt3001_remove(struct i2c_client *client)
> +static void opt3001_remove(struct i2c_client *client)
>  {
>         struct iio_dev *iio =3D i2c_get_clientdata(client);
>         struct opt3001 *opt =3D iio_priv(iio);
> @@ -808,7 +808,7 @@ static int opt3001_remove(struct i2c_client *client)
>         if (ret < 0) {
>                 dev_err(opt->dev, "failed to read register %02x\n",
>                                 OPT3001_CONFIGURATION);
> -               return 0;
> +               return;
>         }
>
>         reg =3D ret;
> @@ -820,8 +820,6 @@ static int opt3001_remove(struct i2c_client *client)
>                 dev_err(opt->dev, "failed to write register %02x\n",
>                                 OPT3001_CONFIGURATION);
>         }
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id opt3001_id[] =3D {
> diff --git a/drivers/iio/light/pa12203001.c b/drivers/iio/light/pa1220300=
1.c
> index 772874e707ae..3cb2de51f4aa 100644
> --- a/drivers/iio/light/pa12203001.c
> +++ b/drivers/iio/light/pa12203001.c
> @@ -394,7 +394,7 @@ static int pa12203001_probe(struct i2c_client *client=
,
>         return ret;
>  }
>
> -static int pa12203001_remove(struct i2c_client *client)
> +static void pa12203001_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         int ret;
> @@ -408,8 +408,6 @@ static int pa12203001_remove(struct i2c_client *clien=
t)
>         if (ret)
>                 dev_warn(&client->dev, "Failed to power down (%pe)\n",
>                          ERR_PTR(ret));
> -
> -       return 0;
>  }
>
>  #if defined(CONFIG_PM_SLEEP) || defined(CONFIG_PM)
> diff --git a/drivers/iio/light/rpr0521.c b/drivers/iio/light/rpr0521.c
> index dabdd05f0e2c..d1c16dd76058 100644
> --- a/drivers/iio/light/rpr0521.c
> +++ b/drivers/iio/light/rpr0521.c
> @@ -1041,7 +1041,7 @@ static int rpr0521_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int rpr0521_remove(struct i2c_client *client)
> +static void rpr0521_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>
> @@ -1051,8 +1051,6 @@ static int rpr0521_remove(struct i2c_client *client=
)
>         pm_runtime_set_suspended(&client->dev);
>
>         rpr0521_poweroff(iio_priv(indio_dev));
> -
> -       return 0;
>  }
>
>  static int rpr0521_runtime_suspend(struct device *dev)
> diff --git a/drivers/iio/light/stk3310.c b/drivers/iio/light/stk3310.c
> index f7cc7a6c0c8d..7b8e0da6aabc 100644
> --- a/drivers/iio/light/stk3310.c
> +++ b/drivers/iio/light/stk3310.c
> @@ -649,14 +649,12 @@ static int stk3310_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int stk3310_remove(struct i2c_client *client)
> +static void stk3310_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>
>         iio_device_unregister(indio_dev);
>         stk3310_set_state(iio_priv(indio_dev), STK3310_STATE_STANDBY);
> -
> -       return 0;
>  }
>
>  static int stk3310_suspend(struct device *dev)
> diff --git a/drivers/iio/light/tcs3472.c b/drivers/iio/light/tcs3472.c
> index 823435f59bb6..db17fec634be 100644
> --- a/drivers/iio/light/tcs3472.c
> +++ b/drivers/iio/light/tcs3472.c
> @@ -559,7 +559,7 @@ static int tcs3472_powerdown(struct tcs3472_data *dat=
a)
>         return ret;
>  }
>
> -static int tcs3472_remove(struct i2c_client *client)
> +static void tcs3472_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>
> @@ -568,8 +568,6 @@ static int tcs3472_remove(struct i2c_client *client)
>                 free_irq(client->irq, indio_dev);
>         iio_triggered_buffer_cleanup(indio_dev);
>         tcs3472_powerdown(iio_priv(indio_dev));
> -
> -       return 0;
>  }
>
>  static int tcs3472_suspend(struct device *dev)
> diff --git a/drivers/iio/light/tsl2563.c b/drivers/iio/light/tsl2563.c
> index 0a278eea36ca..1fa189fe6eb6 100644
> --- a/drivers/iio/light/tsl2563.c
> +++ b/drivers/iio/light/tsl2563.c
> @@ -796,7 +796,7 @@ static int tsl2563_probe(struct i2c_client *client,
>         return err;
>  }
>
> -static int tsl2563_remove(struct i2c_client *client)
> +static void tsl2563_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct tsl2563_chip *chip =3D iio_priv(indio_dev);
> @@ -810,8 +810,6 @@ static int tsl2563_remove(struct i2c_client *client)
>                                   chip->intr);
>         flush_scheduled_work();
>         tsl2563_set_power(chip, 0);
> -
> -       return 0;
>  }
>
>  static int tsl2563_suspend(struct device *dev)
> diff --git a/drivers/iio/light/tsl2583.c b/drivers/iio/light/tsl2583.c
> index efb3c13cfc87..59e7ef624283 100644
> --- a/drivers/iio/light/tsl2583.c
> +++ b/drivers/iio/light/tsl2583.c
> @@ -873,7 +873,7 @@ static int tsl2583_probe(struct i2c_client *clientp,
>         return 0;
>  }
>
> -static int tsl2583_remove(struct i2c_client *client)
> +static void tsl2583_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct tsl2583_chip *chip =3D iio_priv(indio_dev);
> @@ -884,8 +884,6 @@ static int tsl2583_remove(struct i2c_client *client)
>         pm_runtime_set_suspended(&client->dev);
>
>         tsl2583_set_power_state(chip, TSL2583_CNTL_PWR_OFF);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused tsl2583_suspend(struct device *dev)
> diff --git a/drivers/iio/light/tsl4531.c b/drivers/iio/light/tsl4531.c
> index 6ae1b27e50b6..090038fed889 100644
> --- a/drivers/iio/light/tsl4531.c
> +++ b/drivers/iio/light/tsl4531.c
> @@ -207,12 +207,10 @@ static int tsl4531_powerdown(struct i2c_client *cli=
ent)
>                 TSL4531_MODE_POWERDOWN);
>  }
>
> -static int tsl4531_remove(struct i2c_client *client)
> +static void tsl4531_remove(struct i2c_client *client)
>  {
>         iio_device_unregister(i2c_get_clientdata(client));
>         tsl4531_powerdown(client);
> -
> -       return 0;
>  }
>
>  static int tsl4531_suspend(struct device *dev)
> diff --git a/drivers/iio/light/us5182d.c b/drivers/iio/light/us5182d.c
> index cbd9978540fa..ca6a03933e2e 100644
> --- a/drivers/iio/light/us5182d.c
> +++ b/drivers/iio/light/us5182d.c
> @@ -904,7 +904,7 @@ static int us5182d_probe(struct i2c_client *client,
>
>  }
>
> -static int us5182d_remove(struct i2c_client *client)
> +static void us5182d_remove(struct i2c_client *client)
>  {
>         struct us5182d_data *data =3D iio_priv(i2c_get_clientdata(client)=
);
>         int ret;
> @@ -918,8 +918,6 @@ static int us5182d_remove(struct i2c_client *client)
>         if (ret)
>                 dev_warn(&client->dev, "Failed to shut down (%pe)\n",
>                          ERR_PTR(ret));
> -
> -       return 0;
>  }
>
>  #if defined(CONFIG_PM_SLEEP) || defined(CONFIG_PM)
> diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
> index 947a41b86173..9c492f9024e2 100644
> --- a/drivers/iio/light/vcnl4000.c
> +++ b/drivers/iio/light/vcnl4000.c
> @@ -1111,7 +1111,7 @@ static const struct of_device_id vcnl_4000_of_match=
[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, vcnl_4000_of_match);
>
> -static int vcnl4000_remove(struct i2c_client *client)
> +static void vcnl4000_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct vcnl4000_data *data =3D iio_priv(indio_dev);
> @@ -1126,8 +1126,6 @@ static int vcnl4000_remove(struct i2c_client *clien=
t)
>         if (ret)
>                 dev_warn(&client->dev, "Failed to power down (%pe)\n",
>                          ERR_PTR(ret));
> -
> -       return 0;
>  }
>
>  static int __maybe_unused vcnl4000_runtime_suspend(struct device *dev)
> diff --git a/drivers/iio/light/vcnl4035.c b/drivers/iio/light/vcnl4035.c
> index 2aaec6bef64c..8282f19c9de7 100644
> --- a/drivers/iio/light/vcnl4035.c
> +++ b/drivers/iio/light/vcnl4035.c
> @@ -601,7 +601,7 @@ static int vcnl4035_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int vcnl4035_remove(struct i2c_client *client)
> +static void vcnl4035_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         int ret;
> @@ -616,8 +616,6 @@ static int vcnl4035_remove(struct i2c_client *client)
>         if (ret)
>                 dev_warn(&client->dev, "Failed to put device into standby=
 (%pe)\n",
>                          ERR_PTR(ret));
> -
> -       return 0;
>  }
>
>  static int __maybe_unused vcnl4035_runtime_suspend(struct device *dev)
> diff --git a/drivers/iio/light/veml6070.c b/drivers/iio/light/veml6070.c
> index 1e55e09a8d16..cfa4e9e7c803 100644
> --- a/drivers/iio/light/veml6070.c
> +++ b/drivers/iio/light/veml6070.c
> @@ -180,15 +180,13 @@ static int veml6070_probe(struct i2c_client *client=
,
>         return ret;
>  }
>
> -static int veml6070_remove(struct i2c_client *client)
> +static void veml6070_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct veml6070_data *data =3D iio_priv(indio_dev);
>
>         iio_device_unregister(indio_dev);
>         i2c_unregister_device(data->client2);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id veml6070_id[] =3D {
> diff --git a/drivers/iio/magnetometer/ak8974.c b/drivers/iio/magnetometer=
/ak8974.c
> index e54feacfb980..1064859fbf83 100644
> --- a/drivers/iio/magnetometer/ak8974.c
> +++ b/drivers/iio/magnetometer/ak8974.c
> @@ -969,7 +969,7 @@ static int ak8974_probe(struct i2c_client *i2c,
>         return ret;
>  }
>
> -static int ak8974_remove(struct i2c_client *i2c)
> +static void ak8974_remove(struct i2c_client *i2c)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(i2c);
>         struct ak8974 *ak8974 =3D iio_priv(indio_dev);
> @@ -981,8 +981,6 @@ static int ak8974_remove(struct i2c_client *i2c)
>         pm_runtime_disable(&i2c->dev);
>         ak8974_set_power(ak8974, AK8974_PWR_OFF);
>         regulator_bulk_disable(ARRAY_SIZE(ak8974->regs), ak8974->regs);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused ak8974_runtime_suspend(struct device *dev)
> diff --git a/drivers/iio/magnetometer/ak8975.c b/drivers/iio/magnetometer=
/ak8975.c
> index 2432e697150c..caf03a2a98a5 100644
> --- a/drivers/iio/magnetometer/ak8975.c
> +++ b/drivers/iio/magnetometer/ak8975.c
> @@ -1018,7 +1018,7 @@ static int ak8975_probe(struct i2c_client *client,
>         return err;
>  }
>
> -static int ak8975_remove(struct i2c_client *client)
> +static void ak8975_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct ak8975_data *data =3D iio_priv(indio_dev);
> @@ -1030,8 +1030,6 @@ static int ak8975_remove(struct i2c_client *client)
>         iio_triggered_buffer_cleanup(indio_dev);
>         ak8975_set_mode(data, POWER_DOWN);
>         ak8975_power_off(data);
> -
> -       return 0;
>  }
>
>  static int ak8975_runtime_suspend(struct device *dev)
> diff --git a/drivers/iio/magnetometer/bmc150_magn_i2c.c b/drivers/iio/mag=
netometer/bmc150_magn_i2c.c
> index 65c004411d0f..570deaa87836 100644
> --- a/drivers/iio/magnetometer/bmc150_magn_i2c.c
> +++ b/drivers/iio/magnetometer/bmc150_magn_i2c.c
> @@ -34,11 +34,9 @@ static int bmc150_magn_i2c_probe(struct i2c_client *cl=
ient,
>         return bmc150_magn_probe(&client->dev, regmap, client->irq, name)=
;
>  }
>
> -static int bmc150_magn_i2c_remove(struct i2c_client *client)
> +static void bmc150_magn_i2c_remove(struct i2c_client *client)
>  {
>         bmc150_magn_remove(&client->dev);
> -
> -       return 0;
>  }
>
>  static const struct acpi_device_id bmc150_magn_acpi_match[] =3D {
> diff --git a/drivers/iio/magnetometer/hmc5843_i2c.c b/drivers/iio/magneto=
meter/hmc5843_i2c.c
> index 8d2ff8fc204d..fe5e8415b2f2 100644
> --- a/drivers/iio/magnetometer/hmc5843_i2c.c
> +++ b/drivers/iio/magnetometer/hmc5843_i2c.c
> @@ -65,11 +65,9 @@ static int hmc5843_i2c_probe(struct i2c_client *cli,
>                         id->driver_data, id->name);
>  }
>
> -static int hmc5843_i2c_remove(struct i2c_client *client)
> +static void hmc5843_i2c_remove(struct i2c_client *client)
>  {
>         hmc5843_common_remove(&client->dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id hmc5843_id[] =3D {
> diff --git a/drivers/iio/magnetometer/mag3110.c b/drivers/iio/magnetomete=
r/mag3110.c
> index 226439d0bfb5..b870ad803862 100644
> --- a/drivers/iio/magnetometer/mag3110.c
> +++ b/drivers/iio/magnetometer/mag3110.c
> @@ -559,7 +559,7 @@ static int mag3110_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int mag3110_remove(struct i2c_client *client)
> +static void mag3110_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct mag3110_data *data =3D iio_priv(indio_dev);
> @@ -569,8 +569,6 @@ static int mag3110_remove(struct i2c_client *client)
>         mag3110_standby(iio_priv(indio_dev));
>         regulator_disable(data->vddio_reg);
>         regulator_disable(data->vdd_reg);
> -
> -       return 0;
>  }
>
>  static int mag3110_suspend(struct device *dev)
> diff --git a/drivers/iio/magnetometer/yamaha-yas530.c b/drivers/iio/magne=
tometer/yamaha-yas530.c
> index b2bc637150bf..8c16178d4820 100644
> --- a/drivers/iio/magnetometer/yamaha-yas530.c
> +++ b/drivers/iio/magnetometer/yamaha-yas530.c
> @@ -943,7 +943,7 @@ static int yas5xx_probe(struct i2c_client *i2c,
>         return ret;
>  }
>
> -static int yas5xx_remove(struct i2c_client *i2c)
> +static void yas5xx_remove(struct i2c_client *i2c)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(i2c);
>         struct yas5xx *yas5xx =3D iio_priv(indio_dev);
> @@ -961,8 +961,6 @@ static int yas5xx_remove(struct i2c_client *i2c)
>         pm_runtime_disable(dev);
>         gpiod_set_value_cansleep(yas5xx->reset, 1);
>         regulator_bulk_disable(ARRAY_SIZE(yas5xx->regs), yas5xx->regs);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused yas5xx_runtime_suspend(struct device *dev)
> diff --git a/drivers/iio/potentiostat/lmp91000.c b/drivers/iio/potentiost=
at/lmp91000.c
> index fe514f0b5506..5ec7060d31d9 100644
> --- a/drivers/iio/potentiostat/lmp91000.c
> +++ b/drivers/iio/potentiostat/lmp91000.c
> @@ -384,7 +384,7 @@ static int lmp91000_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int lmp91000_remove(struct i2c_client *client)
> +static void lmp91000_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct lmp91000_data *data =3D iio_priv(indio_dev);
> @@ -396,8 +396,6 @@ static int lmp91000_remove(struct i2c_client *client)
>
>         iio_triggered_buffer_cleanup(indio_dev);
>         iio_trigger_unregister(data->trig);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id lmp91000_of_match[] =3D {
> diff --git a/drivers/iio/pressure/mpl3115.c b/drivers/iio/pressure/mpl311=
5.c
> index d4f89e4babed..2f22aba61e4d 100644
> --- a/drivers/iio/pressure/mpl3115.c
> +++ b/drivers/iio/pressure/mpl3115.c
> @@ -290,15 +290,13 @@ static int mpl3115_standby(struct mpl3115_data *dat=
a)
>                 data->ctrl_reg1 & ~MPL3115_CTRL_ACTIVE);
>  }
>
> -static int mpl3115_remove(struct i2c_client *client)
> +static void mpl3115_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>
>         iio_device_unregister(indio_dev);
>         iio_triggered_buffer_cleanup(indio_dev);
>         mpl3115_standby(iio_priv(indio_dev));
> -
> -       return 0;
>  }
>
>  static int mpl3115_suspend(struct device *dev)
> diff --git a/drivers/iio/pressure/ms5611_i2c.c b/drivers/iio/pressure/ms5=
611_i2c.c
> index 3b1de71e0d15..b681a4183909 100644
> --- a/drivers/iio/pressure/ms5611_i2c.c
> +++ b/drivers/iio/pressure/ms5611_i2c.c
> @@ -105,11 +105,9 @@ static int ms5611_i2c_probe(struct i2c_client *clien=
t,
>         return ms5611_probe(indio_dev, &client->dev, id->name, id->driver=
_data);
>  }
>
> -static int ms5611_i2c_remove(struct i2c_client *client)
> +static void ms5611_i2c_remove(struct i2c_client *client)
>  {
>         ms5611_remove(i2c_get_clientdata(client));
> -
> -       return 0;
>  }
>
>  static const struct of_device_id ms5611_i2c_matches[] =3D {
> diff --git a/drivers/iio/pressure/zpa2326_i2c.c b/drivers/iio/pressure/zp=
a2326_i2c.c
> index 0db0860d386b..f26dd8cbb387 100644
> --- a/drivers/iio/pressure/zpa2326_i2c.c
> +++ b/drivers/iio/pressure/zpa2326_i2c.c
> @@ -53,11 +53,9 @@ static int zpa2326_probe_i2c(struct i2c_client        =
  *client,
>                              zpa2326_i2c_hwid(client), regmap);
>  }
>
> -static int zpa2326_remove_i2c(struct i2c_client *client)
> +static void zpa2326_remove_i2c(struct i2c_client *client)
>  {
>         zpa2326_remove(&client->dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id zpa2326_i2c_ids[] =3D {
> diff --git a/drivers/iio/proximity/pulsedlight-lidar-lite-v2.c b/drivers/=
iio/proximity/pulsedlight-lidar-lite-v2.c
> index 648ae576d6fa..791a33d5286c 100644
> --- a/drivers/iio/proximity/pulsedlight-lidar-lite-v2.c
> +++ b/drivers/iio/proximity/pulsedlight-lidar-lite-v2.c
> @@ -311,7 +311,7 @@ static int lidar_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int lidar_remove(struct i2c_client *client)
> +static void lidar_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>
> @@ -320,8 +320,6 @@ static int lidar_remove(struct i2c_client *client)
>
>         pm_runtime_disable(&client->dev);
>         pm_runtime_set_suspended(&client->dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id lidar_id[] =3D {
> diff --git a/drivers/iio/proximity/sx9500.c b/drivers/iio/proximity/sx950=
0.c
> index 42589d6200ad..d4670864ddc7 100644
> --- a/drivers/iio/proximity/sx9500.c
> +++ b/drivers/iio/proximity/sx9500.c
> @@ -979,7 +979,7 @@ static int sx9500_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int sx9500_remove(struct i2c_client *client)
> +static void sx9500_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct sx9500_data *data =3D iio_priv(indio_dev);
> @@ -989,8 +989,6 @@ static int sx9500_remove(struct i2c_client *client)
>         if (client->irq > 0)
>                 iio_trigger_unregister(data->trig);
>         kfree(data->buffer);
> -
> -       return 0;
>  }
>
>  static int sx9500_suspend(struct device *dev)
> diff --git a/drivers/iio/temperature/mlx90614.c b/drivers/iio/temperature=
/mlx90614.c
> index c253a5315988..0808bb865928 100644
> --- a/drivers/iio/temperature/mlx90614.c
> +++ b/drivers/iio/temperature/mlx90614.c
> @@ -571,7 +571,7 @@ static int mlx90614_probe(struct i2c_client *client,
>         return iio_device_register(indio_dev);
>  }
>
> -static int mlx90614_remove(struct i2c_client *client)
> +static void mlx90614_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct mlx90614_data *data =3D iio_priv(indio_dev);
> @@ -584,8 +584,6 @@ static int mlx90614_remove(struct i2c_client *client)
>                         mlx90614_sleep(data);
>                 pm_runtime_set_suspended(&client->dev);
>         }
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id mlx90614_id[] =3D {
> diff --git a/drivers/iio/temperature/mlx90632.c b/drivers/iio/temperature=
/mlx90632.c
> index 7ee7ff8047a4..e8ef47147e2b 100644
> --- a/drivers/iio/temperature/mlx90632.c
> +++ b/drivers/iio/temperature/mlx90632.c
> @@ -924,7 +924,7 @@ static int mlx90632_probe(struct i2c_client *client,
>         return iio_device_register(indio_dev);
>  }
>
> -static int mlx90632_remove(struct i2c_client *client)
> +static void mlx90632_remove(struct i2c_client *client)
>  {
>         struct iio_dev *indio_dev =3D i2c_get_clientdata(client);
>         struct mlx90632_data *data =3D iio_priv(indio_dev);
> @@ -936,8 +936,6 @@ static int mlx90632_remove(struct i2c_client *client)
>         pm_runtime_put_noidle(&client->dev);
>
>         mlx90632_sleep(data);
> -
> -       return 0;
>  }
>
For both mlx drivers

Reviewed-by: "Crt Mori <cmo@melexis.com>"
>  static const struct i2c_device_id mlx90632_id[] =3D {
> diff --git a/drivers/input/joystick/as5011.c b/drivers/input/joystick/as5=
011.c
> index 34bcd99a46f5..2beda29021a3 100644
> --- a/drivers/input/joystick/as5011.c
> +++ b/drivers/input/joystick/as5011.c
> @@ -327,7 +327,7 @@ static int as5011_probe(struct i2c_client *client,
>         return error;
>  }
>
> -static int as5011_remove(struct i2c_client *client)
> +static void as5011_remove(struct i2c_client *client)
>  {
>         struct as5011_device *as5011 =3D i2c_get_clientdata(client);
>
> @@ -337,8 +337,6 @@ static int as5011_remove(struct i2c_client *client)
>
>         input_unregister_device(as5011->input_dev);
>         kfree(as5011);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id as5011_id[] =3D {
> diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboa=
rd/adp5588-keys.c
> index 1592da4de336..b5666d650994 100644
> --- a/drivers/input/keyboard/adp5588-keys.c
> +++ b/drivers/input/keyboard/adp5588-keys.c
> @@ -598,7 +598,7 @@ static int adp5588_probe(struct i2c_client *client,
>         return error;
>  }
>
> -static int adp5588_remove(struct i2c_client *client)
> +static void adp5588_remove(struct i2c_client *client)
>  {
>         struct adp5588_kpad *kpad =3D i2c_get_clientdata(client);
>
> @@ -608,8 +608,6 @@ static int adp5588_remove(struct i2c_client *client)
>         input_unregister_device(kpad->input);
>         adp5588_gpio_remove(kpad);
>         kfree(kpad);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM
> diff --git a/drivers/input/keyboard/lm8323.c b/drivers/input/keyboard/lm8=
323.c
> index 6c38d034ec6e..407dd2ad6302 100644
> --- a/drivers/input/keyboard/lm8323.c
> +++ b/drivers/input/keyboard/lm8323.c
> @@ -752,7 +752,7 @@ static int lm8323_probe(struct i2c_client *client,
>         return err;
>  }
>
> -static int lm8323_remove(struct i2c_client *client)
> +static void lm8323_remove(struct i2c_client *client)
>  {
>         struct lm8323_chip *lm =3D i2c_get_clientdata(client);
>         int i;
> @@ -769,8 +769,6 @@ static int lm8323_remove(struct i2c_client *client)
>                         led_classdev_unregister(&lm->pwm[i].cdev);
>
>         kfree(lm);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/input/keyboard/lm8333.c b/drivers/input/keyboard/lm8=
333.c
> index 7c5f8c6bb957..9dac22c14125 100644
> --- a/drivers/input/keyboard/lm8333.c
> +++ b/drivers/input/keyboard/lm8333.c
> @@ -200,15 +200,13 @@ static int lm8333_probe(struct i2c_client *client,
>         return err;
>  }
>
> -static int lm8333_remove(struct i2c_client *client)
> +static void lm8333_remove(struct i2c_client *client)
>  {
>         struct lm8333 *lm8333 =3D i2c_get_clientdata(client);
>
>         free_irq(client->irq, lm8333);
>         input_unregister_device(lm8333->input);
>         kfree(lm8333);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id lm8333_id[] =3D {
> diff --git a/drivers/input/keyboard/mcs_touchkey.c b/drivers/input/keyboa=
rd/mcs_touchkey.c
> index 8cb0062b98e4..ac1637a3389e 100644
> --- a/drivers/input/keyboard/mcs_touchkey.c
> +++ b/drivers/input/keyboard/mcs_touchkey.c
> @@ -194,7 +194,7 @@ static int mcs_touchkey_probe(struct i2c_client *clie=
nt,
>         return error;
>  }
>
> -static int mcs_touchkey_remove(struct i2c_client *client)
> +static void mcs_touchkey_remove(struct i2c_client *client)
>  {
>         struct mcs_touchkey_data *data =3D i2c_get_clientdata(client);
>
> @@ -203,8 +203,6 @@ static int mcs_touchkey_remove(struct i2c_client *cli=
ent)
>                 data->poweron(false);
>         input_unregister_device(data->input_dev);
>         kfree(data);
> -
> -       return 0;
>  }
>
>  static void mcs_touchkey_shutdown(struct i2c_client *client)
> diff --git a/drivers/input/keyboard/qt1070.c b/drivers/input/keyboard/qt1=
070.c
> index 7174e1df1ee3..9fcce18b1d65 100644
> --- a/drivers/input/keyboard/qt1070.c
> +++ b/drivers/input/keyboard/qt1070.c
> @@ -216,7 +216,7 @@ static int qt1070_probe(struct i2c_client *client,
>         return err;
>  }
>
> -static int qt1070_remove(struct i2c_client *client)
> +static void qt1070_remove(struct i2c_client *client)
>  {
>         struct qt1070_data *data =3D i2c_get_clientdata(client);
>
> @@ -225,8 +225,6 @@ static int qt1070_remove(struct i2c_client *client)
>
>         input_unregister_device(data->input);
>         kfree(data);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/input/keyboard/qt2160.c b/drivers/input/keyboard/qt2=
160.c
> index 32d4a076eaa3..382b1519218c 100644
> --- a/drivers/input/keyboard/qt2160.c
> +++ b/drivers/input/keyboard/qt2160.c
> @@ -432,7 +432,7 @@ static int qt2160_probe(struct i2c_client *client,
>         return error;
>  }
>
> -static int qt2160_remove(struct i2c_client *client)
> +static void qt2160_remove(struct i2c_client *client)
>  {
>         struct qt2160_data *qt2160 =3D i2c_get_clientdata(client);
>
> @@ -446,8 +446,6 @@ static int qt2160_remove(struct i2c_client *client)
>
>         input_unregister_device(qt2160->input);
>         kfree(qt2160);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id qt2160_idtable[] =3D {
> diff --git a/drivers/input/keyboard/tca6416-keypad.c b/drivers/input/keyb=
oard/tca6416-keypad.c
> index 2a9755910065..afcdfbb002ff 100644
> --- a/drivers/input/keyboard/tca6416-keypad.c
> +++ b/drivers/input/keyboard/tca6416-keypad.c
> @@ -307,7 +307,7 @@ static int tca6416_keypad_probe(struct i2c_client *cl=
ient,
>         return error;
>  }
>
> -static int tca6416_keypad_remove(struct i2c_client *client)
> +static void tca6416_keypad_remove(struct i2c_client *client)
>  {
>         struct tca6416_keypad_chip *chip =3D i2c_get_clientdata(client);
>
> @@ -318,8 +318,6 @@ static int tca6416_keypad_remove(struct i2c_client *c=
lient)
>
>         input_unregister_device(chip->input);
>         kfree(chip);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/input/misc/adxl34x-i2c.c b/drivers/input/misc/adxl34=
x-i2c.c
> index a3b5f88d2bd1..5be636aaa94f 100644
> --- a/drivers/input/misc/adxl34x-i2c.c
> +++ b/drivers/input/misc/adxl34x-i2c.c
> @@ -99,13 +99,11 @@ static int adxl34x_i2c_probe(struct i2c_client *clien=
t,
>         return 0;
>  }
>
> -static int adxl34x_i2c_remove(struct i2c_client *client)
> +static void adxl34x_i2c_remove(struct i2c_client *client)
>  {
>         struct adxl34x *ac =3D i2c_get_clientdata(client);
>
>         adxl34x_remove(ac);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused adxl34x_i2c_suspend(struct device *dev)
> diff --git a/drivers/input/misc/bma150.c b/drivers/input/misc/bma150.c
> index a9d984da95f3..84fe394da7a6 100644
> --- a/drivers/input/misc/bma150.c
> +++ b/drivers/input/misc/bma150.c
> @@ -513,11 +513,9 @@ static int bma150_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int bma150_remove(struct i2c_client *client)
> +static void bma150_remove(struct i2c_client *client)
>  {
>         pm_runtime_disable(&client->dev);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused bma150_suspend(struct device *dev)
> diff --git a/drivers/input/misc/cma3000_d0x_i2c.c b/drivers/input/misc/cm=
a3000_d0x_i2c.c
> index 03fb49127c3a..3b23210c46b7 100644
> --- a/drivers/input/misc/cma3000_d0x_i2c.c
> +++ b/drivers/input/misc/cma3000_d0x_i2c.c
> @@ -58,13 +58,11 @@ static int cma3000_i2c_probe(struct i2c_client *clien=
t,
>         return 0;
>  }
>
> -static int cma3000_i2c_remove(struct i2c_client *client)
> +static void cma3000_i2c_remove(struct i2c_client *client)
>  {
>         struct cma3000_accl_data *data =3D i2c_get_clientdata(client);
>
>         cma3000_exit(data);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM
> diff --git a/drivers/input/misc/pcf8574_keypad.c b/drivers/input/misc/pcf=
8574_keypad.c
> index abc423165522..cfd6640e4f82 100644
> --- a/drivers/input/misc/pcf8574_keypad.c
> +++ b/drivers/input/misc/pcf8574_keypad.c
> @@ -157,7 +157,7 @@ static int pcf8574_kp_probe(struct i2c_client *client=
, const struct i2c_device_i
>         return ret;
>  }
>
> -static int pcf8574_kp_remove(struct i2c_client *client)
> +static void pcf8574_kp_remove(struct i2c_client *client)
>  {
>         struct kp_data *lp =3D i2c_get_clientdata(client);
>
> @@ -165,8 +165,6 @@ static int pcf8574_kp_remove(struct i2c_client *clien=
t)
>
>         input_unregister_device(lp->idev);
>         kfree(lp);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM
> diff --git a/drivers/input/mouse/synaptics_i2c.c b/drivers/input/mouse/sy=
naptics_i2c.c
> index fa304648d611..987ee67a1045 100644
> --- a/drivers/input/mouse/synaptics_i2c.c
> +++ b/drivers/input/mouse/synaptics_i2c.c
> @@ -587,7 +587,7 @@ static int synaptics_i2c_probe(struct i2c_client *cli=
ent,
>         return ret;
>  }
>
> -static int synaptics_i2c_remove(struct i2c_client *client)
> +static void synaptics_i2c_remove(struct i2c_client *client)
>  {
>         struct synaptics_i2c *touch =3D i2c_get_clientdata(client);
>
> @@ -596,8 +596,6 @@ static int synaptics_i2c_remove(struct i2c_client *cl=
ient)
>
>         input_unregister_device(touch->input);
>         kfree(touch);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused synaptics_i2c_suspend(struct device *dev)
> diff --git a/drivers/input/rmi4/rmi_smbus.c b/drivers/input/rmi4/rmi_smbu=
s.c
> index 2407ea43de59..c130468541b7 100644
> --- a/drivers/input/rmi4/rmi_smbus.c
> +++ b/drivers/input/rmi4/rmi_smbus.c
> @@ -338,13 +338,11 @@ static int rmi_smb_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int rmi_smb_remove(struct i2c_client *client)
> +static void rmi_smb_remove(struct i2c_client *client)
>  {
>         struct rmi_smb_xport *rmi_smb =3D i2c_get_clientdata(client);
>
>         rmi_unregister_transport_device(&rmi_smb->xport);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused rmi_smb_suspend(struct device *dev)
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/tou=
chscreen/atmel_mxt_ts.c
> index eb66cd2689b7..4eedea08b0b5 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -3284,7 +3284,7 @@ static int mxt_probe(struct i2c_client *client, con=
st struct i2c_device_id *id)
>         return error;
>  }
>
> -static int mxt_remove(struct i2c_client *client)
> +static void mxt_remove(struct i2c_client *client)
>  {
>         struct mxt_data *data =3D i2c_get_clientdata(client);
>
> @@ -3294,8 +3294,6 @@ static int mxt_remove(struct i2c_client *client)
>         mxt_free_object_table(data);
>         regulator_bulk_disable(ARRAY_SIZE(data->regulators),
>                                data->regulators);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused mxt_suspend(struct device *dev)
> diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touch=
screen/bu21013_ts.c
> index 2f1f0d7607f8..34f422e246ef 100644
> --- a/drivers/input/touchscreen/bu21013_ts.c
> +++ b/drivers/input/touchscreen/bu21013_ts.c
> @@ -552,15 +552,13 @@ static int bu21013_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int bu21013_remove(struct i2c_client *client)
> +static void bu21013_remove(struct i2c_client *client)
>  {
>         struct bu21013_ts *ts =3D i2c_get_clientdata(client);
>
>         /* Make sure IRQ will exit quickly even if there is contact */
>         ts->touch_stopped =3D true;
>         /* The resources will be freed by devm */
> -
> -       return 0;
>  }
>
>  static int __maybe_unused bu21013_suspend(struct device *dev)
> diff --git a/drivers/input/touchscreen/cyttsp4_i2c.c b/drivers/input/touc=
hscreen/cyttsp4_i2c.c
> index c65ccb2f4716..28ae7c15397a 100644
> --- a/drivers/input/touchscreen/cyttsp4_i2c.c
> +++ b/drivers/input/touchscreen/cyttsp4_i2c.c
> @@ -43,13 +43,11 @@ static int cyttsp4_i2c_probe(struct i2c_client *clien=
t,
>         return PTR_ERR_OR_ZERO(ts);
>  }
>
> -static int cyttsp4_i2c_remove(struct i2c_client *client)
> +static void cyttsp4_i2c_remove(struct i2c_client *client)
>  {
>         struct cyttsp4 *ts =3D i2c_get_clientdata(client);
>
>         cyttsp4_remove(ts);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id cyttsp4_i2c_id[] =3D {
> diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touch=
screen/edt-ft5x06.c
> index bb2e1cbffba7..0c325132a955 100644
> --- a/drivers/input/touchscreen/edt-ft5x06.c
> +++ b/drivers/input/touchscreen/edt-ft5x06.c
> @@ -1266,13 +1266,11 @@ static int edt_ft5x06_ts_probe(struct i2c_client =
*client,
>         return 0;
>  }
>
> -static int edt_ft5x06_ts_remove(struct i2c_client *client)
> +static void edt_ft5x06_ts_remove(struct i2c_client *client)
>  {
>         struct edt_ft5x06_ts_data *tsdata =3D i2c_get_clientdata(client);
>
>         edt_ft5x06_ts_teardown_debugfs(tsdata);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused edt_ft5x06_ts_suspend(struct device *dev)
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscre=
en/goodix.c
> index 3ad9870db108..1617dd931876 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -1383,14 +1383,12 @@ static int goodix_ts_probe(struct i2c_client *cli=
ent,
>         return 0;
>  }
>
> -static int goodix_ts_remove(struct i2c_client *client)
> +static void goodix_ts_remove(struct i2c_client *client)
>  {
>         struct goodix_ts_data *ts =3D i2c_get_clientdata(client);
>
>         if (ts->load_cfg_from_disk)
>                 wait_for_completion(&ts->firmware_loading_complete);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused goodix_suspend(struct device *dev)
> diff --git a/drivers/input/touchscreen/migor_ts.c b/drivers/input/touchsc=
reen/migor_ts.c
> index 42d3fd7e04d7..79cd660d879e 100644
> --- a/drivers/input/touchscreen/migor_ts.c
> +++ b/drivers/input/touchscreen/migor_ts.c
> @@ -176,7 +176,7 @@ static int migor_ts_probe(struct i2c_client *client,
>         return error;
>  }
>
> -static int migor_ts_remove(struct i2c_client *client)
> +static void migor_ts_remove(struct i2c_client *client)
>  {
>         struct migor_ts_priv *priv =3D i2c_get_clientdata(client);
>
> @@ -185,8 +185,6 @@ static int migor_ts_remove(struct i2c_client *client)
>         kfree(priv);
>
>         dev_set_drvdata(&client->dev, NULL);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused migor_ts_suspend(struct device *dev)
> diff --git a/drivers/input/touchscreen/s6sy761.c b/drivers/input/touchscr=
een/s6sy761.c
> index 85a1f465c097..1a7d00289b4c 100644
> --- a/drivers/input/touchscreen/s6sy761.c
> +++ b/drivers/input/touchscreen/s6sy761.c
> @@ -475,11 +475,9 @@ static int s6sy761_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int s6sy761_remove(struct i2c_client *client)
> +static void s6sy761_remove(struct i2c_client *client)
>  {
>         pm_runtime_disable(&client->dev);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused s6sy761_runtime_suspend(struct device *dev)
> diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscre=
en/stmfts.c
> index c175d44c52f3..d5bd170808fb 100644
> --- a/drivers/input/touchscreen/stmfts.c
> +++ b/drivers/input/touchscreen/stmfts.c
> @@ -738,11 +738,9 @@ static int stmfts_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int stmfts_remove(struct i2c_client *client)
> +static void stmfts_remove(struct i2c_client *client)
>  {
>         pm_runtime_disable(&client->dev);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused stmfts_runtime_suspend(struct device *dev)
> diff --git a/drivers/input/touchscreen/tsc2004.c b/drivers/input/touchscr=
een/tsc2004.c
> index 9fdd870c4c0b..a9565353ee98 100644
> --- a/drivers/input/touchscreen/tsc2004.c
> +++ b/drivers/input/touchscreen/tsc2004.c
> @@ -43,11 +43,9 @@ static int tsc2004_probe(struct i2c_client *i2c,
>                              tsc2004_cmd);
>  }
>
> -static int tsc2004_remove(struct i2c_client *i2c)
> +static void tsc2004_remove(struct i2c_client *i2c)
>  {
>         tsc200x_remove(&i2c->dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id tsc2004_idtable[] =3D {
> diff --git a/drivers/leds/flash/leds-as3645a.c b/drivers/leds/flash/leds-=
as3645a.c
> index aa3f82be0a9c..bb2249771acb 100644
> --- a/drivers/leds/flash/leds-as3645a.c
> +++ b/drivers/leds/flash/leds-as3645a.c
> @@ -724,7 +724,7 @@ static int as3645a_probe(struct i2c_client *client)
>         return rval;
>  }
>
> -static int as3645a_remove(struct i2c_client *client)
> +static void as3645a_remove(struct i2c_client *client)
>  {
>         struct as3645a *flash =3D i2c_get_clientdata(client);
>
> @@ -740,8 +740,6 @@ static int as3645a_remove(struct i2c_client *client)
>
>         fwnode_handle_put(flash->flash_node);
>         fwnode_handle_put(flash->indicator_node);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id as3645a_id_table[] =3D {
> diff --git a/drivers/leds/flash/leds-lm3601x.c b/drivers/leds/flash/leds-=
lm3601x.c
> index 37e1d6e68687..78730e066a73 100644
> --- a/drivers/leds/flash/leds-lm3601x.c
> +++ b/drivers/leds/flash/leds-lm3601x.c
> @@ -440,7 +440,7 @@ static int lm3601x_probe(struct i2c_client *client)
>         return lm3601x_register_leds(led, fwnode);
>  }
>
> -static int lm3601x_remove(struct i2c_client *client)
> +static void lm3601x_remove(struct i2c_client *client)
>  {
>         struct lm3601x_led *led =3D i2c_get_clientdata(client);
>         int ret;
> @@ -450,8 +450,6 @@ static int lm3601x_remove(struct i2c_client *client)
>         if (ret)
>                 dev_warn(&client->dev,
>                          "Failed to put into standby (%pe)\n", ERR_PTR(re=
t));
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id lm3601x_id[] =3D {
> diff --git a/drivers/leds/flash/leds-rt4505.c b/drivers/leds/flash/leds-r=
t4505.c
> index ee129ab7255d..e404fe8b0314 100644
> --- a/drivers/leds/flash/leds-rt4505.c
> +++ b/drivers/leds/flash/leds-rt4505.c
> @@ -393,12 +393,11 @@ static int rt4505_probe(struct i2c_client *client)
>         return 0;
>  }
>
> -static int rt4505_remove(struct i2c_client *client)
> +static void rt4505_remove(struct i2c_client *client)
>  {
>         struct rt4505_priv *priv =3D i2c_get_clientdata(client);
>
>         v4l2_flash_release(priv->v4l2_flash);
> -       return 0;
>  }
>
>  static void rt4505_shutdown(struct i2c_client *client)
> diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
> index a0df1fb28774..e072ee5409f7 100644
> --- a/drivers/leds/leds-an30259a.c
> +++ b/drivers/leds/leds-an30259a.c
> @@ -334,13 +334,11 @@ static int an30259a_probe(struct i2c_client *client=
)
>         return err;
>  }
>
> -static int an30259a_remove(struct i2c_client *client)
> +static void an30259a_remove(struct i2c_client *client)
>  {
>         struct an30259a *chip =3D i2c_get_clientdata(client);
>
>         mutex_destroy(&chip->mutex);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id an30259a_match_table[] =3D {
> diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
> index 80d937454aee..0b52fc9097c6 100644
> --- a/drivers/leds/leds-aw2013.c
> +++ b/drivers/leds/leds-aw2013.c
> @@ -401,15 +401,13 @@ static int aw2013_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int aw2013_remove(struct i2c_client *client)
> +static void aw2013_remove(struct i2c_client *client)
>  {
>         struct aw2013 *chip =3D i2c_get_clientdata(client);
>
>         aw2013_chip_disable(chip);
>
>         mutex_destroy(&chip->mutex);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id aw2013_match_table[] =3D {
> diff --git a/drivers/leds/leds-bd2802.c b/drivers/leds/leds-bd2802.c
> index 8bbaef5a2986..2b6678f6bd56 100644
> --- a/drivers/leds/leds-bd2802.c
> +++ b/drivers/leds/leds-bd2802.c
> @@ -722,7 +722,7 @@ static int bd2802_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int bd2802_remove(struct i2c_client *client)
> +static void bd2802_remove(struct i2c_client *client)
>  {
>         struct bd2802_led *led =3D i2c_get_clientdata(client);
>         int i;
> @@ -733,8 +733,6 @@ static int bd2802_remove(struct i2c_client *client)
>                 bd2802_disable_adv_conf(led);
>         for (i =3D 0; i < ARRAY_SIZE(bd2802_attributes); i++)
>                 device_remove_file(&led->client->dev, bd2802_attributes[i=
]);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
> index bd7d0d5cf3b6..3fb6a2fdaefa 100644
> --- a/drivers/leds/leds-blinkm.c
> +++ b/drivers/leds/leds-blinkm.c
> @@ -677,7 +677,7 @@ static int blinkm_probe(struct i2c_client *client,
>         return err;
>  }
>
> -static int blinkm_remove(struct i2c_client *client)
> +static void blinkm_remove(struct i2c_client *client)
>  {
>         struct blinkm_data *data =3D i2c_get_clientdata(client);
>         int ret =3D 0;
> @@ -716,7 +716,6 @@ static int blinkm_remove(struct i2c_client *client)
>                 dev_err(&client->dev, "Failure in blinkm_remove ignored. =
Continuing.\n");
>
>         sysfs_remove_group(&client->dev.kobj, &blinkm_group);
> -       return 0;
>  }
>
>  static const struct i2c_device_id blinkm_id[] =3D {
> diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319=
x.c
> index 4161b9dd7e48..7aee62211750 100644
> --- a/drivers/leds/leds-is31fl319x.c
> +++ b/drivers/leds/leds-is31fl319x.c
> @@ -414,12 +414,11 @@ static int is31fl319x_probe(struct i2c_client *clie=
nt,
>         return err;
>  }
>
> -static int is31fl319x_remove(struct i2c_client *client)
> +static void is31fl319x_remove(struct i2c_client *client)
>  {
>         struct is31fl319x_chip *is31 =3D i2c_get_clientdata(client);
>
>         mutex_destroy(&is31->lock);
> -       return 0;
>  }
>
>  /*
> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32x=
x.c
> index fc63fce38c19..0d219c1ac3b5 100644
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c
> @@ -457,7 +457,7 @@ static int is31fl32xx_probe(struct i2c_client *client=
,
>         return 0;
>  }
>
> -static int is31fl32xx_remove(struct i2c_client *client)
> +static void is31fl32xx_remove(struct i2c_client *client)
>  {
>         struct is31fl32xx_priv *priv =3D i2c_get_clientdata(client);
>         int ret;
> @@ -466,8 +466,6 @@ static int is31fl32xx_remove(struct i2c_client *clien=
t)
>         if (ret)
>                 dev_err(&client->dev, "Failed to reset registers on remov=
al (%pe)\n",
>                         ERR_PTR(ret));
> -
> -       return 0;
>  }
>
>  /*
> diff --git a/drivers/leds/leds-lm3530.c b/drivers/leds/leds-lm3530.c
> index e72393534b72..ba906c253c7f 100644
> --- a/drivers/leds/leds-lm3530.c
> +++ b/drivers/leds/leds-lm3530.c
> @@ -470,13 +470,12 @@ static int lm3530_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int lm3530_remove(struct i2c_client *client)
> +static void lm3530_remove(struct i2c_client *client)
>  {
>         struct lm3530_data *drvdata =3D i2c_get_clientdata(client);
>
>         lm3530_led_disable(drvdata);
>         led_classdev_unregister(&drvdata->led_dev);
> -       return 0;
>  }
>
>  static const struct i2c_device_id lm3530_id[] =3D {
> diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
> index beb53040e09e..db64d44bcbbf 100644
> --- a/drivers/leds/leds-lm3532.c
> +++ b/drivers/leds/leds-lm3532.c
> @@ -704,7 +704,7 @@ static int lm3532_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int lm3532_remove(struct i2c_client *client)
> +static void lm3532_remove(struct i2c_client *client)
>  {
>         struct lm3532_data *drvdata =3D i2c_get_clientdata(client);
>
> @@ -712,8 +712,6 @@ static int lm3532_remove(struct i2c_client *client)
>
>         if (drvdata->enable_gpio)
>                 gpiod_direction_output(drvdata->enable_gpio, 0);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id of_lm3532_leds_match[] =3D {
> diff --git a/drivers/leds/leds-lm355x.c b/drivers/leds/leds-lm355x.c
> index 2d3e11845ba5..daa35927b301 100644
> --- a/drivers/leds/leds-lm355x.c
> +++ b/drivers/leds/leds-lm355x.c
> @@ -491,7 +491,7 @@ static int lm355x_probe(struct i2c_client *client,
>         return err;
>  }
>
> -static int lm355x_remove(struct i2c_client *client)
> +static void lm355x_remove(struct i2c_client *client)
>  {
>         struct lm355x_chip_data *chip =3D i2c_get_clientdata(client);
>         struct lm355x_reg_data *preg =3D chip->regs;
> @@ -501,8 +501,6 @@ static int lm355x_remove(struct i2c_client *client)
>         led_classdev_unregister(&chip->cdev_torch);
>         led_classdev_unregister(&chip->cdev_flash);
>         dev_info(&client->dev, "%s is removed\n", lm355x_name[chip->type]=
);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id lm355x_id[] =3D {
> diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
> index 435309154e6b..428a5d928150 100644
> --- a/drivers/leds/leds-lm3642.c
> +++ b/drivers/leds/leds-lm3642.c
> @@ -380,7 +380,7 @@ static int lm3642_probe(struct i2c_client *client,
>         return err;
>  }
>
> -static int lm3642_remove(struct i2c_client *client)
> +static void lm3642_remove(struct i2c_client *client)
>  {
>         struct lm3642_chip_data *chip =3D i2c_get_clientdata(client);
>
> @@ -388,7 +388,6 @@ static int lm3642_remove(struct i2c_client *client)
>         led_classdev_unregister(&chip->cdev_torch);
>         led_classdev_unregister(&chip->cdev_flash);
>         regmap_write(chip->regmap, REG_ENABLE, 0);
> -       return 0;
>  }
>
>  static const struct i2c_device_id lm3642_id[] =3D {
> diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
> index 87cd24ce3f95..54b4662bff41 100644
> --- a/drivers/leds/leds-lm3692x.c
> +++ b/drivers/leds/leds-lm3692x.c
> @@ -491,14 +491,12 @@ static int lm3692x_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int lm3692x_remove(struct i2c_client *client)
> +static void lm3692x_remove(struct i2c_client *client)
>  {
>         struct lm3692x_led *led =3D i2c_get_clientdata(client);
>
>         lm3692x_leds_disable(led);
>         mutex_destroy(&led->lock);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id lm3692x_id[] =3D {
> diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
> index 3ecf90fbc06c..71231a60eebc 100644
> --- a/drivers/leds/leds-lm3697.c
> +++ b/drivers/leds/leds-lm3697.c
> @@ -337,7 +337,7 @@ static int lm3697_probe(struct i2c_client *client,
>         return lm3697_init(led);
>  }
>
> -static int lm3697_remove(struct i2c_client *client)
> +static void lm3697_remove(struct i2c_client *client)
>  {
>         struct lm3697 *led =3D i2c_get_clientdata(client);
>         struct device *dev =3D &led->client->dev;
> @@ -358,8 +358,6 @@ static int lm3697_remove(struct i2c_client *client)
>         }
>
>         mutex_destroy(&led->lock);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id lm3697_id[] =3D {
> diff --git a/drivers/leds/leds-lp3944.c b/drivers/leds/leds-lp3944.c
> index 437c711b2a27..673ad8c04f41 100644
> --- a/drivers/leds/leds-lp3944.c
> +++ b/drivers/leds/leds-lp3944.c
> @@ -397,7 +397,7 @@ static int lp3944_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int lp3944_remove(struct i2c_client *client)
> +static void lp3944_remove(struct i2c_client *client)
>  {
>         struct lp3944_platform_data *pdata =3D dev_get_platdata(&client->=
dev);
>         struct lp3944_data *data =3D i2c_get_clientdata(client);
> @@ -414,8 +414,6 @@ static int lp3944_remove(struct i2c_client *client)
>                 default:
>                         break;
>                 }
> -
> -       return 0;
>  }
>
>  /* lp3944 i2c driver struct */
> diff --git a/drivers/leds/leds-lp3952.c b/drivers/leds/leds-lp3952.c
> index 6ee9131fbf25..bf0ad1b5ce24 100644
> --- a/drivers/leds/leds-lp3952.c
> +++ b/drivers/leds/leds-lp3952.c
> @@ -255,15 +255,13 @@ static int lp3952_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int lp3952_remove(struct i2c_client *client)
> +static void lp3952_remove(struct i2c_client *client)
>  {
>         struct lp3952_led_array *priv;
>
>         priv =3D i2c_get_clientdata(client);
>         lp3952_on_off(priv, LP3952_LED_ALL, false);
>         gpiod_set_value(priv->enable_gpio, 0);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id lp3952_id[] =3D {
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index e129dcc656b8..28d6b39fa72d 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -563,7 +563,7 @@ static int lp50xx_probe(struct i2c_client *client)
>         return lp50xx_probe_dt(led);
>  }
>
> -static int lp50xx_remove(struct i2c_client *client)
> +static void lp50xx_remove(struct i2c_client *client)
>  {
>         struct lp50xx *led =3D i2c_get_clientdata(client);
>         int ret;
> @@ -579,8 +579,6 @@ static int lp50xx_remove(struct i2c_client *client)
>         }
>
>         mutex_destroy(&led->lock);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id lp50xx_id[] =3D {
> diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
> index a9e7507c998c..7ff20c260504 100644
> --- a/drivers/leds/leds-lp5521.c
> +++ b/drivers/leds/leds-lp5521.c
> @@ -579,7 +579,7 @@ static int lp5521_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int lp5521_remove(struct i2c_client *client)
> +static void lp5521_remove(struct i2c_client *client)
>  {
>         struct lp55xx_led *led =3D i2c_get_clientdata(client);
>         struct lp55xx_chip *chip =3D led->chip;
> @@ -587,8 +587,6 @@ static int lp5521_remove(struct i2c_client *client)
>         lp5521_stop_all_engines(chip);
>         lp55xx_unregister_sysfs(chip);
>         lp55xx_deinit_device(chip);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id lp5521_id[] =3D {
> diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
> index b1590cb4a188..369d40b0b65b 100644
> --- a/drivers/leds/leds-lp5523.c
> +++ b/drivers/leds/leds-lp5523.c
> @@ -947,7 +947,7 @@ static int lp5523_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int lp5523_remove(struct i2c_client *client)
> +static void lp5523_remove(struct i2c_client *client)
>  {
>         struct lp55xx_led *led =3D i2c_get_clientdata(client);
>         struct lp55xx_chip *chip =3D led->chip;
> @@ -955,8 +955,6 @@ static int lp5523_remove(struct i2c_client *client)
>         lp5523_stop_all_engines(chip);
>         lp55xx_unregister_sysfs(chip);
>         lp55xx_deinit_device(chip);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id lp5523_id[] =3D {
> diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
> index 31c14016d289..0e490085ff35 100644
> --- a/drivers/leds/leds-lp5562.c
> +++ b/drivers/leds/leds-lp5562.c
> @@ -573,7 +573,7 @@ static int lp5562_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int lp5562_remove(struct i2c_client *client)
> +static void lp5562_remove(struct i2c_client *client)
>  {
>         struct lp55xx_led *led =3D i2c_get_clientdata(client);
>         struct lp55xx_chip *chip =3D led->chip;
> @@ -582,8 +582,6 @@ static int lp5562_remove(struct i2c_client *client)
>
>         lp55xx_unregister_sysfs(chip);
>         lp55xx_deinit_device(chip);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id lp5562_id[] =3D {
> diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
> index 2d2fda2ab104..ae11a02c0ab2 100644
> --- a/drivers/leds/leds-lp8501.c
> +++ b/drivers/leds/leds-lp8501.c
> @@ -362,7 +362,7 @@ static int lp8501_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int lp8501_remove(struct i2c_client *client)
> +static void lp8501_remove(struct i2c_client *client)
>  {
>         struct lp55xx_led *led =3D i2c_get_clientdata(client);
>         struct lp55xx_chip *chip =3D led->chip;
> @@ -370,8 +370,6 @@ static int lp8501_remove(struct i2c_client *client)
>         lp8501_stop_engine(chip);
>         lp55xx_unregister_sysfs(chip);
>         lp55xx_deinit_device(chip);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id lp8501_id[] =3D {
> diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
> index 3c693d5e3b44..e2b36d3187eb 100644
> --- a/drivers/leds/leds-lp8860.c
> +++ b/drivers/leds/leds-lp8860.c
> @@ -445,7 +445,7 @@ static int lp8860_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int lp8860_remove(struct i2c_client *client)
> +static void lp8860_remove(struct i2c_client *client)
>  {
>         struct lp8860_led *led =3D i2c_get_clientdata(client);
>         int ret;
> @@ -461,8 +461,6 @@ static int lp8860_remove(struct i2c_client *client)
>         }
>
>         mutex_destroy(&led->lock);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id lp8860_id[] =3D {
> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index f72b5d1be3a6..df83d97cb479 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -52,7 +52,7 @@ struct pca9532_data {
>
>  static int pca9532_probe(struct i2c_client *client,
>         const struct i2c_device_id *id);
> -static int pca9532_remove(struct i2c_client *client);
> +static void pca9532_remove(struct i2c_client *client);
>
>  enum {
>         pca9530,
> @@ -546,13 +546,11 @@ static int pca9532_probe(struct i2c_client *client,
>         return pca9532_configure(client, data, pca9532_pdata);
>  }
>
> -static int pca9532_remove(struct i2c_client *client)
> +static void pca9532_remove(struct i2c_client *client)
>  {
>         struct pca9532_data *data =3D i2c_get_clientdata(client);
>
>         pca9532_destroy_devices(data, data->chip_info->num_leds);
> -
> -       return 0;
>  }
>
>  module_i2c_driver(pca9532_driver);
> diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
> index 1473ced8664c..161bef65c6b7 100644
> --- a/drivers/leds/leds-tca6507.c
> +++ b/drivers/leds/leds-tca6507.c
> @@ -790,7 +790,7 @@ static int tca6507_probe(struct i2c_client *client,
>         return err;
>  }
>
> -static int tca6507_remove(struct i2c_client *client)
> +static void tca6507_remove(struct i2c_client *client)
>  {
>         int i;
>         struct tca6507_chip *tca =3D i2c_get_clientdata(client);
> @@ -802,8 +802,6 @@ static int tca6507_remove(struct i2c_client *client)
>         }
>         tca6507_remove_gpio(tca);
>         cancel_work_sync(&tca->work);
> -
> -       return 0;
>  }
>
>  static struct i2c_driver tca6507_driver =3D {
> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-=
omnia.c
> index 1adfed1c0619..66040e8621af 100644
> --- a/drivers/leds/leds-turris-omnia.c
> +++ b/drivers/leds/leds-turris-omnia.c
> @@ -245,7 +245,7 @@ static int omnia_leds_probe(struct i2c_client *client=
,
>         return 0;
>  }
>
> -static int omnia_leds_remove(struct i2c_client *client)
> +static void omnia_leds_remove(struct i2c_client *client)
>  {
>         u8 buf[5];
>
> @@ -261,8 +261,6 @@ static int omnia_leds_remove(struct i2c_client *clien=
t)
>         buf[4] =3D 255;
>
>         i2c_master_send(client, buf, 5);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id of_omnia_leds_match[] =3D {
> diff --git a/drivers/macintosh/ams/ams-i2c.c b/drivers/macintosh/ams/ams-=
i2c.c
> index d2f0cde6f9c7..362fc56b69dc 100644
> --- a/drivers/macintosh/ams/ams-i2c.c
> +++ b/drivers/macintosh/ams/ams-i2c.c
> @@ -230,7 +230,7 @@ static int ams_i2c_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int ams_i2c_remove(struct i2c_client *client)
> +static void ams_i2c_remove(struct i2c_client *client)
>  {
>         if (ams_info.has_device) {
>                 ams_sensor_detach();
> @@ -245,8 +245,6 @@ static int ams_i2c_remove(struct i2c_client *client)
>
>                 ams_info.has_device =3D 0;
>         }
> -
> -       return 0;
>  }
>
>  static void ams_i2c_exit(void)
> diff --git a/drivers/macintosh/therm_adt746x.c b/drivers/macintosh/therm_=
adt746x.c
> index e604cbc91763..b004ea2a1102 100644
> --- a/drivers/macintosh/therm_adt746x.c
> +++ b/drivers/macintosh/therm_adt746x.c
> @@ -563,7 +563,7 @@ static int probe_thermostat(struct i2c_client *client=
,
>         return 0;
>  }
>
> -static int remove_thermostat(struct i2c_client *client)
> +static void remove_thermostat(struct i2c_client *client)
>  {
>         struct thermostat *th =3D i2c_get_clientdata(client);
>         int i;
> @@ -585,8 +585,6 @@ static int remove_thermostat(struct i2c_client *clien=
t)
>         write_both_fan_speed(th, -1);
>
>         kfree(th);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id therm_adt746x_id[] =3D {
> diff --git a/drivers/macintosh/therm_windtunnel.c b/drivers/macintosh/the=
rm_windtunnel.c
> index 9226b74fa08f..61fe2ab910b8 100644
> --- a/drivers/macintosh/therm_windtunnel.c
> +++ b/drivers/macintosh/therm_windtunnel.c
> @@ -334,7 +334,7 @@ static void do_attach(struct i2c_adapter *adapter)
>         }
>  }
>
> -static int
> +static void
>  do_remove(struct i2c_client *client)
>  {
>         if (x.running) {
> @@ -348,8 +348,6 @@ do_remove(struct i2c_client *client)
>                 x.fan =3D NULL;
>         else
>                 printk(KERN_ERR "g4fan: bad client\n");
> -
> -       return 0;
>  }
>
>  static int
> diff --git a/drivers/macintosh/windfarm_ad7417_sensor.c b/drivers/macinto=
sh/windfarm_ad7417_sensor.c
> index 6ad6441abcbc..c5c54a4ce91f 100644
> --- a/drivers/macintosh/windfarm_ad7417_sensor.c
> +++ b/drivers/macintosh/windfarm_ad7417_sensor.c
> @@ -289,7 +289,7 @@ static int wf_ad7417_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int wf_ad7417_remove(struct i2c_client *client)
> +static void wf_ad7417_remove(struct i2c_client *client)
>  {
>         struct wf_ad7417_priv *pv =3D dev_get_drvdata(&client->dev);
>         int i;
> @@ -302,8 +302,6 @@ static int wf_ad7417_remove(struct i2c_client *client=
)
>                 wf_unregister_sensor(&pv->sensors[i]);
>
>         kref_put(&pv->ref, wf_ad7417_release);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id wf_ad7417_id[] =3D {
> diff --git a/drivers/macintosh/windfarm_fcu_controls.c b/drivers/macintos=
h/windfarm_fcu_controls.c
> index 82e7b2005ae7..c5b1ca5bcd73 100644
> --- a/drivers/macintosh/windfarm_fcu_controls.c
> +++ b/drivers/macintosh/windfarm_fcu_controls.c
> @@ -560,7 +560,7 @@ static int wf_fcu_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int wf_fcu_remove(struct i2c_client *client)
> +static void wf_fcu_remove(struct i2c_client *client)
>  {
>         struct wf_fcu_priv *pv =3D dev_get_drvdata(&client->dev);
>         struct wf_fcu_fan *fan;
> @@ -571,7 +571,6 @@ static int wf_fcu_remove(struct i2c_client *client)
>                 wf_unregister_control(&fan->ctrl);
>         }
>         kref_put(&pv->ref, wf_fcu_release);
> -       return 0;
>  }
>
>  static const struct i2c_device_id wf_fcu_id[] =3D {
> diff --git a/drivers/macintosh/windfarm_lm75_sensor.c b/drivers/macintosh=
/windfarm_lm75_sensor.c
> index eb7e7f0bd219..204661c8e918 100644
> --- a/drivers/macintosh/windfarm_lm75_sensor.c
> +++ b/drivers/macintosh/windfarm_lm75_sensor.c
> @@ -147,7 +147,7 @@ static int wf_lm75_probe(struct i2c_client *client,
>         return rc;
>  }
>
> -static int wf_lm75_remove(struct i2c_client *client)
> +static void wf_lm75_remove(struct i2c_client *client)
>  {
>         struct wf_lm75_sensor *lm =3D i2c_get_clientdata(client);
>
> @@ -156,8 +156,6 @@ static int wf_lm75_remove(struct i2c_client *client)
>
>         /* release sensor */
>         wf_unregister_sensor(&lm->sens);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id wf_lm75_id[] =3D {
> diff --git a/drivers/macintosh/windfarm_lm87_sensor.c b/drivers/macintosh=
/windfarm_lm87_sensor.c
> index 807efdde86bc..40d25463346e 100644
> --- a/drivers/macintosh/windfarm_lm87_sensor.c
> +++ b/drivers/macintosh/windfarm_lm87_sensor.c
> @@ -145,7 +145,7 @@ static int wf_lm87_probe(struct i2c_client *client,
>         return rc;
>  }
>
> -static int wf_lm87_remove(struct i2c_client *client)
> +static void wf_lm87_remove(struct i2c_client *client)
>  {
>         struct wf_lm87_sensor *lm =3D i2c_get_clientdata(client);
>
> @@ -154,8 +154,6 @@ static int wf_lm87_remove(struct i2c_client *client)
>
>         /* release sensor */
>         wf_unregister_sensor(&lm->sens);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id wf_lm87_id[] =3D {
> diff --git a/drivers/macintosh/windfarm_max6690_sensor.c b/drivers/macint=
osh/windfarm_max6690_sensor.c
> index 55ee417fb878..c0d404ebc792 100644
> --- a/drivers/macintosh/windfarm_max6690_sensor.c
> +++ b/drivers/macintosh/windfarm_max6690_sensor.c
> @@ -104,14 +104,12 @@ static int wf_max6690_probe(struct i2c_client *clie=
nt,
>         return rc;
>  }
>
> -static int wf_max6690_remove(struct i2c_client *client)
> +static void wf_max6690_remove(struct i2c_client *client)
>  {
>         struct wf_6690_sensor *max =3D i2c_get_clientdata(client);
>
>         max->i2c =3D NULL;
>         wf_unregister_sensor(&max->sens);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id wf_max6690_id[] =3D {
> diff --git a/drivers/macintosh/windfarm_smu_sat.c b/drivers/macintosh/win=
dfarm_smu_sat.c
> index 5ade627eaa78..be5d4593db93 100644
> --- a/drivers/macintosh/windfarm_smu_sat.c
> +++ b/drivers/macintosh/windfarm_smu_sat.c
> @@ -316,7 +316,7 @@ static int wf_sat_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int wf_sat_remove(struct i2c_client *client)
> +static void wf_sat_remove(struct i2c_client *client)
>  {
>         struct wf_sat *sat =3D i2c_get_clientdata(client);
>         struct wf_sat_sensor *sens;
> @@ -330,8 +330,6 @@ static int wf_sat_remove(struct i2c_client *client)
>         }
>         sat->i2c =3D NULL;
>         kref_put(&sat->ref, wf_sat_release);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id wf_sat_id[] =3D {
> diff --git a/drivers/media/cec/i2c/ch7322.c b/drivers/media/cec/i2c/ch732=
2.c
> index 0814338c43e4..34fad7123704 100644
> --- a/drivers/media/cec/i2c/ch7322.c
> +++ b/drivers/media/cec/i2c/ch7322.c
> @@ -565,7 +565,7 @@ static int ch7322_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ch7322_remove(struct i2c_client *client)
> +static void ch7322_remove(struct i2c_client *client)
>  {
>         struct ch7322 *ch7322 =3D i2c_get_clientdata(client);
>
> @@ -578,8 +578,6 @@ static int ch7322_remove(struct i2c_client *client)
>         mutex_destroy(&ch7322->mutex);
>
>         dev_info(&client->dev, "device unregistered\n");
> -
> -       return 0;
>  }
>
>  static const struct of_device_id ch7322_of_match[] =3D {
> diff --git a/drivers/media/dvb-frontends/a8293.c b/drivers/media/dvb-fron=
tends/a8293.c
> index 57f52c004a23..ba38783b2b4f 100644
> --- a/drivers/media/dvb-frontends/a8293.c
> +++ b/drivers/media/dvb-frontends/a8293.c
> @@ -98,14 +98,13 @@ static int a8293_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int a8293_remove(struct i2c_client *client)
> +static void a8293_remove(struct i2c_client *client)
>  {
>         struct a8293_dev *dev =3D i2c_get_clientdata(client);
>
>         dev_dbg(&client->dev, "\n");
>
>         kfree(dev);
> -       return 0;
>  }
>
>  static const struct i2c_device_id a8293_id_table[] =3D {
> diff --git a/drivers/media/dvb-frontends/af9013.c b/drivers/media/dvb-fro=
ntends/af9013.c
> index 7d7c341b2bd8..d85929582c3f 100644
> --- a/drivers/media/dvb-frontends/af9013.c
> +++ b/drivers/media/dvb-frontends/af9013.c
> @@ -1540,7 +1540,7 @@ static int af9013_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int af9013_remove(struct i2c_client *client)
> +static void af9013_remove(struct i2c_client *client)
>  {
>         struct af9013_state *state =3D i2c_get_clientdata(client);
>
> @@ -1551,8 +1551,6 @@ static int af9013_remove(struct i2c_client *client)
>         regmap_exit(state->regmap);
>
>         kfree(state);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id af9013_id_table[] =3D {
> diff --git a/drivers/media/dvb-frontends/af9033.c b/drivers/media/dvb-fro=
ntends/af9033.c
> index 785c49b3d307..808da7a9ffe7 100644
> --- a/drivers/media/dvb-frontends/af9033.c
> +++ b/drivers/media/dvb-frontends/af9033.c
> @@ -1163,7 +1163,7 @@ static int af9033_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int af9033_remove(struct i2c_client *client)
> +static void af9033_remove(struct i2c_client *client)
>  {
>         struct af9033_dev *dev =3D i2c_get_clientdata(client);
>
> @@ -1171,8 +1171,6 @@ static int af9033_remove(struct i2c_client *client)
>
>         regmap_exit(dev->regmap);
>         kfree(dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id af9033_id_table[] =3D {
> diff --git a/drivers/media/dvb-frontends/au8522_decoder.c b/drivers/media=
/dvb-frontends/au8522_decoder.c
> index 8cdca051e51b..e4f99bd468cb 100644
> --- a/drivers/media/dvb-frontends/au8522_decoder.c
> +++ b/drivers/media/dvb-frontends/au8522_decoder.c
> @@ -758,13 +758,12 @@ static int au8522_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int au8522_remove(struct i2c_client *client)
> +static void au8522_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
>         au8522_release_state(to_state(sd));
> -       return 0;
>  }
>
>  static const struct i2c_device_id au8522_id[] =3D {
> diff --git a/drivers/media/dvb-frontends/cxd2099.c b/drivers/media/dvb-fr=
ontends/cxd2099.c
> index 1c8207ab8988..fbc666fa04ec 100644
> --- a/drivers/media/dvb-frontends/cxd2099.c
> +++ b/drivers/media/dvb-frontends/cxd2099.c
> @@ -664,14 +664,12 @@ static int cxd2099_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int cxd2099_remove(struct i2c_client *client)
> +static void cxd2099_remove(struct i2c_client *client)
>  {
>         struct cxd *ci =3D i2c_get_clientdata(client);
>
>         regmap_exit(ci->regmap);
>         kfree(ci);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id cxd2099_id[] =3D {
> diff --git a/drivers/media/dvb-frontends/cxd2820r_core.c b/drivers/media/=
dvb-frontends/cxd2820r_core.c
> index b1618339eec0..5d98222f9df0 100644
> --- a/drivers/media/dvb-frontends/cxd2820r_core.c
> +++ b/drivers/media/dvb-frontends/cxd2820r_core.c
> @@ -705,7 +705,7 @@ static int cxd2820r_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int cxd2820r_remove(struct i2c_client *client)
> +static void cxd2820r_remove(struct i2c_client *client)
>  {
>         struct cxd2820r_priv *priv =3D i2c_get_clientdata(client);
>
> @@ -721,8 +721,6 @@ static int cxd2820r_remove(struct i2c_client *client)
>         regmap_exit(priv->regmap[0]);
>
>         kfree(priv);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id cxd2820r_id_table[] =3D {
> diff --git a/drivers/media/dvb-frontends/dvb-pll.c b/drivers/media/dvb-fr=
ontends/dvb-pll.c
> index d45b4ddc8f91..baf2a378e565 100644
> --- a/drivers/media/dvb-frontends/dvb-pll.c
> +++ b/drivers/media/dvb-frontends/dvb-pll.c
> @@ -899,14 +899,13 @@ dvb_pll_probe(struct i2c_client *client, const stru=
ct i2c_device_id *id)
>         return 0;
>  }
>
> -static int dvb_pll_remove(struct i2c_client *client)
> +static void dvb_pll_remove(struct i2c_client *client)
>  {
>         struct dvb_frontend *fe =3D i2c_get_clientdata(client);
>         struct dvb_pll_priv *priv =3D fe->tuner_priv;
>
>         ida_simple_remove(&pll_ida, priv->nr);
>         dvb_pll_release(fe);
> -       return 0;
>  }
>
>
> diff --git a/drivers/media/dvb-frontends/lgdt3306a.c b/drivers/media/dvb-=
frontends/lgdt3306a.c
> index 136b76cb4807..424311afb2bf 100644
> --- a/drivers/media/dvb-frontends/lgdt3306a.c
> +++ b/drivers/media/dvb-frontends/lgdt3306a.c
> @@ -2226,7 +2226,7 @@ static int lgdt3306a_probe(struct i2c_client *clien=
t,
>         return ret;
>  }
>
> -static int lgdt3306a_remove(struct i2c_client *client)
> +static void lgdt3306a_remove(struct i2c_client *client)
>  {
>         struct lgdt3306a_state *state =3D i2c_get_clientdata(client);
>
> @@ -2237,8 +2237,6 @@ static int lgdt3306a_remove(struct i2c_client *clie=
nt)
>
>         kfree(state->cfg);
>         kfree(state);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id lgdt3306a_id_table[] =3D {
> diff --git a/drivers/media/dvb-frontends/lgdt330x.c b/drivers/media/dvb-f=
rontends/lgdt330x.c
> index da3a8c5e18d8..ea9ae22fd201 100644
> --- a/drivers/media/dvb-frontends/lgdt330x.c
> +++ b/drivers/media/dvb-frontends/lgdt330x.c
> @@ -974,15 +974,13 @@ static const struct dvb_frontend_ops lgdt3303_ops =
=3D {
>         .release              =3D lgdt330x_release,
>  };
>
> -static int lgdt330x_remove(struct i2c_client *client)
> +static void lgdt330x_remove(struct i2c_client *client)
>  {
>         struct lgdt330x_state *state =3D i2c_get_clientdata(client);
>
>         dev_dbg(&client->dev, "\n");
>
>         kfree(state);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id lgdt330x_id_table[] =3D {
> diff --git a/drivers/media/dvb-frontends/m88ds3103.c b/drivers/media/dvb-=
frontends/m88ds3103.c
> index bce0f42f3d19..4e844b2ef597 100644
> --- a/drivers/media/dvb-frontends/m88ds3103.c
> +++ b/drivers/media/dvb-frontends/m88ds3103.c
> @@ -1914,7 +1914,7 @@ static int m88ds3103_probe(struct i2c_client *clien=
t,
>         return ret;
>  }
>
> -static int m88ds3103_remove(struct i2c_client *client)
> +static void m88ds3103_remove(struct i2c_client *client)
>  {
>         struct m88ds3103_dev *dev =3D i2c_get_clientdata(client);
>
> @@ -1926,7 +1926,6 @@ static int m88ds3103_remove(struct i2c_client *clie=
nt)
>         i2c_mux_del_adapters(dev->muxc);
>
>         kfree(dev);
> -       return 0;
>  }
>
>  static const struct i2c_device_id m88ds3103_id_table[] =3D {
> diff --git a/drivers/media/dvb-frontends/mn88443x.c b/drivers/media/dvb-f=
rontends/mn88443x.c
> index fff212c0bf3b..452571b380b7 100644
> --- a/drivers/media/dvb-frontends/mn88443x.c
> +++ b/drivers/media/dvb-frontends/mn88443x.c
> @@ -762,15 +762,13 @@ static int mn88443x_probe(struct i2c_client *client=
,
>         return ret;
>  }
>
> -static int mn88443x_remove(struct i2c_client *client)
> +static void mn88443x_remove(struct i2c_client *client)
>  {
>         struct mn88443x_priv *chip =3D i2c_get_clientdata(client);
>
>         mn88443x_cmn_power_off(chip);
>
>         i2c_unregister_device(chip->client_t);
> -
> -       return 0;
>  }
>
>  static const struct mn88443x_spec mn88443x_spec_pri =3D {
> diff --git a/drivers/media/dvb-frontends/mn88472.c b/drivers/media/dvb-fr=
ontends/mn88472.c
> index 73922fc8f39c..2b01cc678f7e 100644
> --- a/drivers/media/dvb-frontends/mn88472.c
> +++ b/drivers/media/dvb-frontends/mn88472.c
> @@ -691,7 +691,7 @@ static int mn88472_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int mn88472_remove(struct i2c_client *client)
> +static void mn88472_remove(struct i2c_client *client)
>  {
>         struct mn88472_dev *dev =3D i2c_get_clientdata(client);
>
> @@ -706,8 +706,6 @@ static int mn88472_remove(struct i2c_client *client)
>         regmap_exit(dev->regmap[0]);
>
>         kfree(dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id mn88472_id_table[] =3D {
> diff --git a/drivers/media/dvb-frontends/mn88473.c b/drivers/media/dvb-fr=
ontends/mn88473.c
> index 4838969ef735..f0ecf5910c02 100644
> --- a/drivers/media/dvb-frontends/mn88473.c
> +++ b/drivers/media/dvb-frontends/mn88473.c
> @@ -726,7 +726,7 @@ static int mn88473_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int mn88473_remove(struct i2c_client *client)
> +static void mn88473_remove(struct i2c_client *client)
>  {
>         struct mn88473_dev *dev =3D i2c_get_clientdata(client);
>
> @@ -741,8 +741,6 @@ static int mn88473_remove(struct i2c_client *client)
>         regmap_exit(dev->regmap[0]);
>
>         kfree(dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id mn88473_id_table[] =3D {
> diff --git a/drivers/media/dvb-frontends/mxl692.c b/drivers/media/dvb-fro=
ntends/mxl692.c
> index dd7954e8f553..129630cbffff 100644
> --- a/drivers/media/dvb-frontends/mxl692.c
> +++ b/drivers/media/dvb-frontends/mxl692.c
> @@ -1337,15 +1337,13 @@ static int mxl692_probe(struct i2c_client *client=
,
>         return -ENODEV;
>  }
>
> -static int mxl692_remove(struct i2c_client *client)
> +static void mxl692_remove(struct i2c_client *client)
>  {
>         struct mxl692_dev *dev =3D i2c_get_clientdata(client);
>
>         dev->fe.demodulator_priv =3D NULL;
>         i2c_set_clientdata(client, NULL);
>         kfree(dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id mxl692_id_table[] =3D {
> diff --git a/drivers/media/dvb-frontends/rtl2830.c b/drivers/media/dvb-fr=
ontends/rtl2830.c
> index e6b8367c8cce..e0fbf41316ae 100644
> --- a/drivers/media/dvb-frontends/rtl2830.c
> +++ b/drivers/media/dvb-frontends/rtl2830.c
> @@ -865,7 +865,7 @@ static int rtl2830_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int rtl2830_remove(struct i2c_client *client)
> +static void rtl2830_remove(struct i2c_client *client)
>  {
>         struct rtl2830_dev *dev =3D i2c_get_clientdata(client);
>
> @@ -874,8 +874,6 @@ static int rtl2830_remove(struct i2c_client *client)
>         i2c_mux_del_adapters(dev->muxc);
>         regmap_exit(dev->regmap);
>         kfree(dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id rtl2830_id_table[] =3D {
> diff --git a/drivers/media/dvb-frontends/rtl2832.c b/drivers/media/dvb-fr=
ontends/rtl2832.c
> index dcbeb9f5e12a..4fa884eda5d5 100644
> --- a/drivers/media/dvb-frontends/rtl2832.c
> +++ b/drivers/media/dvb-frontends/rtl2832.c
> @@ -1110,7 +1110,7 @@ static int rtl2832_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int rtl2832_remove(struct i2c_client *client)
> +static void rtl2832_remove(struct i2c_client *client)
>  {
>         struct rtl2832_dev *dev =3D i2c_get_clientdata(client);
>
> @@ -1123,8 +1123,6 @@ static int rtl2832_remove(struct i2c_client *client=
)
>         regmap_exit(dev->regmap);
>
>         kfree(dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id rtl2832_id_table[] =3D {
> diff --git a/drivers/media/dvb-frontends/si2165.c b/drivers/media/dvb-fro=
ntends/si2165.c
> index ebee230afb7b..86b0d59169dd 100644
> --- a/drivers/media/dvb-frontends/si2165.c
> +++ b/drivers/media/dvb-frontends/si2165.c
> @@ -1274,14 +1274,13 @@ static int si2165_probe(struct i2c_client *client=
,
>         return ret;
>  }
>
> -static int si2165_remove(struct i2c_client *client)
> +static void si2165_remove(struct i2c_client *client)
>  {
>         struct si2165_state *state =3D i2c_get_clientdata(client);
>
>         dev_dbg(&client->dev, "\n");
>
>         kfree(state);
> -       return 0;
>  }
>
>  static const struct i2c_device_id si2165_id_table[] =3D {
> diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-fro=
ntends/si2168.c
> index 196e028a6617..8157df4570d1 100644
> --- a/drivers/media/dvb-frontends/si2168.c
> +++ b/drivers/media/dvb-frontends/si2168.c
> @@ -774,7 +774,7 @@ static int si2168_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int si2168_remove(struct i2c_client *client)
> +static void si2168_remove(struct i2c_client *client)
>  {
>         struct si2168_dev *dev =3D i2c_get_clientdata(client);
>
> @@ -786,8 +786,6 @@ static int si2168_remove(struct i2c_client *client)
>         dev->fe.demodulator_priv =3D NULL;
>
>         kfree(dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id si2168_id_table[] =3D {
> diff --git a/drivers/media/dvb-frontends/sp2.c b/drivers/media/dvb-fronte=
nds/sp2.c
> index 992f22167fbe..27e7037e130e 100644
> --- a/drivers/media/dvb-frontends/sp2.c
> +++ b/drivers/media/dvb-frontends/sp2.c
> @@ -398,14 +398,13 @@ static int sp2_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int sp2_remove(struct i2c_client *client)
> +static void sp2_remove(struct i2c_client *client)
>  {
>         struct sp2 *s =3D i2c_get_clientdata(client);
>
>         dev_dbg(&client->dev, "\n");
>         sp2_exit(client);
>         kfree(s);
> -       return 0;
>  }
>
>  static const struct i2c_device_id sp2_id[] =3D {
> diff --git a/drivers/media/dvb-frontends/stv090x.c b/drivers/media/dvb-fr=
ontends/stv090x.c
> index 90d24131d335..0a600c1d7d1b 100644
> --- a/drivers/media/dvb-frontends/stv090x.c
> +++ b/drivers/media/dvb-frontends/stv090x.c
> @@ -5032,12 +5032,11 @@ static int stv090x_probe(struct i2c_client *clien=
t,
>         return ret;
>  }
>
> -static int stv090x_remove(struct i2c_client *client)
> +static void stv090x_remove(struct i2c_client *client)
>  {
>         struct stv090x_state *state =3D i2c_get_clientdata(client);
>
>         stv090x_release(&state->frontend);
> -       return 0;
>  }
>
>  struct dvb_frontend *stv090x_attach(struct stv090x_config *config,
> diff --git a/drivers/media/dvb-frontends/stv6110x.c b/drivers/media/dvb-f=
rontends/stv6110x.c
> index 5012d0231652..fbc4dbd62151 100644
> --- a/drivers/media/dvb-frontends/stv6110x.c
> +++ b/drivers/media/dvb-frontends/stv6110x.c
> @@ -436,12 +436,11 @@ static int stv6110x_probe(struct i2c_client *client=
,
>         return 0;
>  }
>
> -static int stv6110x_remove(struct i2c_client *client)
> +static void stv6110x_remove(struct i2c_client *client)
>  {
>         struct stv6110x_state *stv6110x =3D i2c_get_clientdata(client);
>
>         stv6110x_release(stv6110x->frontend);
> -       return 0;
>  }
>
>  const struct stv6110x_devctl *stv6110x_attach(struct dvb_frontend *fe,
> diff --git a/drivers/media/dvb-frontends/tc90522.c b/drivers/media/dvb-fr=
ontends/tc90522.c
> index e83836b29715..c22d2a2b2a45 100644
> --- a/drivers/media/dvb-frontends/tc90522.c
> +++ b/drivers/media/dvb-frontends/tc90522.c
> @@ -819,14 +819,13 @@ static int tc90522_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int tc90522_remove(struct i2c_client *client)
> +static void tc90522_remove(struct i2c_client *client)
>  {
>         struct tc90522_state *state;
>
>         state =3D cfg_to_state(i2c_get_clientdata(client));
>         i2c_del_adapter(&state->tuner_i2c);
>         kfree(state);
> -       return 0;
>  }
>
>
> diff --git a/drivers/media/dvb-frontends/tda10071.c b/drivers/media/dvb-f=
rontends/tda10071.c
> index 685c0ac71819..d1098ef20a8b 100644
> --- a/drivers/media/dvb-frontends/tda10071.c
> +++ b/drivers/media/dvb-frontends/tda10071.c
> @@ -1221,14 +1221,13 @@ static int tda10071_probe(struct i2c_client *clie=
nt,
>         return ret;
>  }
>
> -static int tda10071_remove(struct i2c_client *client)
> +static void tda10071_remove(struct i2c_client *client)
>  {
>         struct tda10071_dev *dev =3D i2c_get_clientdata(client);
>
>         dev_dbg(&client->dev, "\n");
>
>         kfree(dev);
> -       return 0;
>  }
>
>  static const struct i2c_device_id tda10071_id_table[] =3D {
> diff --git a/drivers/media/dvb-frontends/ts2020.c b/drivers/media/dvb-fro=
ntends/ts2020.c
> index 3e383912bcfd..02338256b974 100644
> --- a/drivers/media/dvb-frontends/ts2020.c
> +++ b/drivers/media/dvb-frontends/ts2020.c
> @@ -696,7 +696,7 @@ static int ts2020_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int ts2020_remove(struct i2c_client *client)
> +static void ts2020_remove(struct i2c_client *client)
>  {
>         struct ts2020_priv *dev =3D i2c_get_clientdata(client);
>
> @@ -708,7 +708,6 @@ static int ts2020_remove(struct i2c_client *client)
>
>         regmap_exit(dev->regmap);
>         kfree(dev);
> -       return 0;
>  }
>
>  static const struct i2c_device_id ts2020_id_table[] =3D {
> diff --git a/drivers/media/i2c/ad5820.c b/drivers/media/i2c/ad5820.c
> index 2958a4694461..516de278cc49 100644
> --- a/drivers/media/i2c/ad5820.c
> +++ b/drivers/media/i2c/ad5820.c
> @@ -342,7 +342,7 @@ static int ad5820_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int ad5820_remove(struct i2c_client *client)
> +static void ad5820_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *subdev =3D i2c_get_clientdata(client);
>         struct ad5820_device *coil =3D to_ad5820_device(subdev);
> @@ -351,7 +351,6 @@ static int ad5820_remove(struct i2c_client *client)
>         v4l2_ctrl_handler_free(&coil->ctrls);
>         media_entity_cleanup(&coil->subdev.entity);
>         mutex_destroy(&coil->power_lock);
> -       return 0;
>  }
>
>  static const struct i2c_device_id ad5820_id_table[] =3D {
> diff --git a/drivers/media/i2c/ad9389b.c b/drivers/media/i2c/ad9389b.c
> index 8679a44e6413..4a255a492918 100644
> --- a/drivers/media/i2c/ad9389b.c
> +++ b/drivers/media/i2c/ad9389b.c
> @@ -1174,7 +1174,7 @@ static int ad9389b_probe(struct i2c_client *client,=
 const struct i2c_device_id *
>
>  /* ---------------------------------------------------------------------=
-- */
>
> -static int ad9389b_remove(struct i2c_client *client)
> +static void ad9389b_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ad9389b_state *state =3D get_ad9389b_state(sd);
> @@ -1192,7 +1192,6 @@ static int ad9389b_remove(struct i2c_client *client=
)
>         v4l2_device_unregister_subdev(sd);
>         media_entity_cleanup(&sd->entity);
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/adp1653.c b/drivers/media/i2c/adp1653.c
> index 522a0b10e415..1f353157df07 100644
> --- a/drivers/media/i2c/adp1653.c
> +++ b/drivers/media/i2c/adp1653.c
> @@ -510,7 +510,7 @@ static int adp1653_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int adp1653_remove(struct i2c_client *client)
> +static void adp1653_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *subdev =3D i2c_get_clientdata(client);
>         struct adp1653_flash *flash =3D to_adp1653_flash(subdev);
> @@ -518,8 +518,6 @@ static int adp1653_remove(struct i2c_client *client)
>         v4l2_device_unregister_subdev(&flash->subdev);
>         v4l2_ctrl_handler_free(&flash->ctrls);
>         media_entity_cleanup(&flash->subdev.entity);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id adp1653_id_table[] =3D {
> diff --git a/drivers/media/i2c/adv7170.c b/drivers/media/i2c/adv7170.c
> index 714e31f993e1..61a2f87d3c62 100644
> --- a/drivers/media/i2c/adv7170.c
> +++ b/drivers/media/i2c/adv7170.c
> @@ -368,12 +368,11 @@ static int adv7170_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int adv7170_remove(struct i2c_client *client)
> +static void adv7170_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/adv7175.c b/drivers/media/i2c/adv7175.c
> index 1813f67f0fe1..b58689728243 100644
> --- a/drivers/media/i2c/adv7175.c
> +++ b/drivers/media/i2c/adv7175.c
> @@ -423,12 +423,11 @@ static int adv7175_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int adv7175_remove(struct i2c_client *client)
> +static void adv7175_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> index e3a57c178c6b..f85e5bf228f1 100644
> --- a/drivers/media/i2c/adv7180.c
> +++ b/drivers/media/i2c/adv7180.c
> @@ -1511,7 +1511,7 @@ static int adv7180_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int adv7180_remove(struct i2c_client *client)
> +static void adv7180_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct adv7180_state *state =3D to_state(sd);
> @@ -1531,8 +1531,6 @@ static int adv7180_remove(struct i2c_client *client=
)
>         adv7180_set_power_pin(state, false);
>
>         mutex_destroy(&state->mutex);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id adv7180_id[] =3D {
> diff --git a/drivers/media/i2c/adv7183.c b/drivers/media/i2c/adv7183.c
> index ba746a19fd39..313c706e8335 100644
> --- a/drivers/media/i2c/adv7183.c
> +++ b/drivers/media/i2c/adv7183.c
> @@ -613,13 +613,12 @@ static int adv7183_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int adv7183_remove(struct i2c_client *client)
> +static void adv7183_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
> -       return 0;
>  }
>
>  static const struct i2c_device_id adv7183_id[] =3D {
> diff --git a/drivers/media/i2c/adv7343.c b/drivers/media/i2c/adv7343.c
> index 63e94dfcb5d3..7e84869d2434 100644
> --- a/drivers/media/i2c/adv7343.c
> +++ b/drivers/media/i2c/adv7343.c
> @@ -492,15 +492,13 @@ static int adv7343_probe(struct i2c_client *client)
>         return err;
>  }
>
> -static int adv7343_remove(struct i2c_client *client)
> +static void adv7343_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct adv7343_state *state =3D to_state(sd);
>
>         v4l2_async_unregister_subdev(&state->sd);
>         v4l2_ctrl_handler_free(&state->hdl);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id adv7343_id[] =3D {
> diff --git a/drivers/media/i2c/adv7393.c b/drivers/media/i2c/adv7393.c
> index b6234c8231c9..fb5fefa83b18 100644
> --- a/drivers/media/i2c/adv7393.c
> +++ b/drivers/media/i2c/adv7393.c
> @@ -437,15 +437,13 @@ static int adv7393_probe(struct i2c_client *client,
>         return err;
>  }
>
> -static int adv7393_remove(struct i2c_client *client)
> +static void adv7393_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct adv7393_state *state =3D to_state(sd);
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(&state->hdl);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id adv7393_id[] =3D {
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c=
/adv748x/adv748x-core.c
> index 4e54148147b9..4498d78a2357 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -815,7 +815,7 @@ static int adv748x_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int adv748x_remove(struct i2c_client *client)
> +static void adv748x_remove(struct i2c_client *client)
>  {
>         struct adv748x_state *state =3D i2c_get_clientdata(client);
>
> @@ -828,8 +828,6 @@ static int adv748x_remove(struct i2c_client *client)
>         adv748x_unregister_clients(state);
>         adv748x_dt_cleanup(state);
>         mutex_destroy(&state->mutex);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id adv748x_of_table[] =3D {
> diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511=
-v4l2.c
> index 202e0cd83f90..49aca579576a 100644
> --- a/drivers/media/i2c/adv7511-v4l2.c
> +++ b/drivers/media/i2c/adv7511-v4l2.c
> @@ -1923,7 +1923,7 @@ static int adv7511_probe(struct i2c_client *client,=
 const struct i2c_device_id *
>
>  /* ---------------------------------------------------------------------=
-- */
>
> -static int adv7511_remove(struct i2c_client *client)
> +static void adv7511_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct adv7511_state *state =3D get_adv7511_state(sd);
> @@ -1943,7 +1943,6 @@ static int adv7511_remove(struct i2c_client *client=
)
>         v4l2_device_unregister_subdev(sd);
>         media_entity_cleanup(&sd->entity);
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
> index bb0c8fc6d383..e63abf93ccac 100644
> --- a/drivers/media/i2c/adv7604.c
> +++ b/drivers/media/i2c/adv7604.c
> @@ -3661,7 +3661,7 @@ static int adv76xx_probe(struct i2c_client *client,
>
>  /* ---------------------------------------------------------------------=
-- */
>
> -static int adv76xx_remove(struct i2c_client *client)
> +static void adv76xx_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct adv76xx_state *state =3D to_state(sd);
> @@ -3678,7 +3678,6 @@ static int adv76xx_remove(struct i2c_client *client=
)
>         media_entity_cleanup(&sd->entity);
>         adv76xx_unregister_clients(to_state(sd));
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
> index 22caa070273b..a8dd92948df0 100644
> --- a/drivers/media/i2c/adv7842.c
> +++ b/drivers/media/i2c/adv7842.c
> @@ -3593,7 +3593,7 @@ static int adv7842_probe(struct i2c_client *client,
>
>  /* ---------------------------------------------------------------------=
-- */
>
> -static int adv7842_remove(struct i2c_client *client)
> +static void adv7842_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct adv7842_state *state =3D to_state(sd);
> @@ -3604,7 +3604,6 @@ static int adv7842_remove(struct i2c_client *client=
)
>         media_entity_cleanup(&sd->entity);
>         adv7842_unregister_clients(sd);
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/ak7375.c b/drivers/media/i2c/ak7375.c
> index 40b1a4aa846c..1af9f698eecf 100644
> --- a/drivers/media/i2c/ak7375.c
> +++ b/drivers/media/i2c/ak7375.c
> @@ -169,7 +169,7 @@ static int ak7375_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ak7375_remove(struct i2c_client *client)
> +static void ak7375_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ak7375_device *ak7375_dev =3D sd_to_ak7375_vcm(sd);
> @@ -177,8 +177,6 @@ static int ak7375_remove(struct i2c_client *client)
>         ak7375_subdev_cleanup(ak7375_dev);
>         pm_runtime_disable(&client->dev);
>         pm_runtime_set_suspended(&client->dev);
> -
> -       return 0;
>  }
>
>  /*
> diff --git a/drivers/media/i2c/ak881x.c b/drivers/media/i2c/ak881x.c
> index dc569d5a4d9d..0370ad6b6811 100644
> --- a/drivers/media/i2c/ak881x.c
> +++ b/drivers/media/i2c/ak881x.c
> @@ -297,13 +297,11 @@ static int ak881x_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int ak881x_remove(struct i2c_client *client)
> +static void ak881x_remove(struct i2c_client *client)
>  {
>         struct ak881x *ak881x =3D to_ak881x(client);
>
>         v4l2_device_unregister_subdev(&ak881x->subdev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ak881x_id[] =3D {
> diff --git a/drivers/media/i2c/bt819.c b/drivers/media/i2c/bt819.c
> index 73bc50c919d7..4d9bb6eb7d65 100644
> --- a/drivers/media/i2c/bt819.c
> +++ b/drivers/media/i2c/bt819.c
> @@ -446,14 +446,13 @@ static int bt819_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int bt819_remove(struct i2c_client *client)
> +static void bt819_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct bt819 *decoder =3D to_bt819(sd);
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(&decoder->hdl);
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/bt856.c b/drivers/media/i2c/bt856.c
> index c134fda270a1..70443ef1ac46 100644
> --- a/drivers/media/i2c/bt856.c
> +++ b/drivers/media/i2c/bt856.c
> @@ -223,12 +223,11 @@ static int bt856_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int bt856_remove(struct i2c_client *client)
> +static void bt856_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
> -       return 0;
>  }
>
>  static const struct i2c_device_id bt856_id[] =3D {
> diff --git a/drivers/media/i2c/bt866.c b/drivers/media/i2c/bt866.c
> index 1a8df9f18ffb..c2508cbafd02 100644
> --- a/drivers/media/i2c/bt866.c
> +++ b/drivers/media/i2c/bt866.c
> @@ -190,12 +190,11 @@ static int bt866_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int bt866_remove(struct i2c_client *client)
> +static void bt866_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
> -       return 0;
>  }
>
>  static const struct i2c_device_id bt866_id[] =3D {
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs=
-core.c
> index 7609add2aff4..4a14d7e5d9f2 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -3665,7 +3665,7 @@ static int ccs_probe(struct i2c_client *client)
>         return rval;
>  }
>
> -static int ccs_remove(struct i2c_client *client)
> +static void ccs_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *subdev =3D i2c_get_clientdata(client);
>         struct ccs_sensor *sensor =3D to_ccs_sensor(subdev);
> @@ -3687,8 +3687,6 @@ static int ccs_remove(struct i2c_client *client)
>         kfree(sensor->ccs_limits);
>         kvfree(sensor->sdata.backing);
>         kvfree(sensor->mdata.backing);
> -
> -       return 0;
>  }
>
>  static const struct ccs_device smia_device =3D {
> diff --git a/drivers/media/i2c/cs3308.c b/drivers/media/i2c/cs3308.c
> index ebe55e261bff..d901a59883a9 100644
> --- a/drivers/media/i2c/cs3308.c
> +++ b/drivers/media/i2c/cs3308.c
> @@ -99,13 +99,12 @@ static int cs3308_probe(struct i2c_client *client,
>
>  /* ---------------------------------------------------------------------=
-- */
>
> -static int cs3308_remove(struct i2c_client *client)
> +static void cs3308_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
>         kfree(sd);
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/cs5345.c b/drivers/media/i2c/cs5345.c
> index f6dd5edf77dd..591b1e7b24ee 100644
> --- a/drivers/media/i2c/cs5345.c
> +++ b/drivers/media/i2c/cs5345.c
> @@ -178,14 +178,13 @@ static int cs5345_probe(struct i2c_client *client,
>
>  /* ---------------------------------------------------------------------=
-- */
>
> -static int cs5345_remove(struct i2c_client *client)
> +static void cs5345_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct cs5345_state *state =3D to_state(sd);
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(&state->hdl);
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/cs53l32a.c b/drivers/media/i2c/cs53l32a.c
> index 9a411106cfb3..9461589aea30 100644
> --- a/drivers/media/i2c/cs53l32a.c
> +++ b/drivers/media/i2c/cs53l32a.c
> @@ -190,14 +190,13 @@ static int cs53l32a_probe(struct i2c_client *client=
,
>         return 0;
>  }
>
> -static int cs53l32a_remove(struct i2c_client *client)
> +static void cs53l32a_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct cs53l32a_state *state =3D to_state(sd);
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(&state->hdl);
> -       return 0;
>  }
>
>  static const struct i2c_device_id cs53l32a_id[] =3D {
> diff --git a/drivers/media/i2c/cx25840/cx25840-core.c b/drivers/media/i2c=
/cx25840/cx25840-core.c
> index dc31944c7d5b..f1a978af82ef 100644
> --- a/drivers/media/i2c/cx25840/cx25840-core.c
> +++ b/drivers/media/i2c/cx25840/cx25840-core.c
> @@ -6026,7 +6026,7 @@ static int cx25840_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int cx25840_remove(struct i2c_client *client)
> +static void cx25840_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct cx25840_state *state =3D to_state(sd);
> @@ -6034,7 +6034,6 @@ static int cx25840_remove(struct i2c_client *client=
)
>         cx25840_ir_remove(sd);
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(&state->hdl);
> -       return 0;
>  }
>
>  static const struct i2c_device_id cx25840_id[] =3D {
> diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
> index 206d74338b9c..af59687383aa 100644
> --- a/drivers/media/i2c/dw9714.c
> +++ b/drivers/media/i2c/dw9714.c
> @@ -190,7 +190,7 @@ static int dw9714_probe(struct i2c_client *client)
>         return rval;
>  }
>
> -static int dw9714_remove(struct i2c_client *client)
> +static void dw9714_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct dw9714_device *dw9714_dev =3D sd_to_dw9714_vcm(sd);
> @@ -206,8 +206,6 @@ static int dw9714_remove(struct i2c_client *client)
>         }
>         pm_runtime_set_suspended(&client->dev);
>         dw9714_subdev_cleanup(dw9714_dev);
> -
> -       return 0;
>  }
>
>  /*
> diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> index c086580efac7..0f47ef015a1d 100644
> --- a/drivers/media/i2c/dw9768.c
> +++ b/drivers/media/i2c/dw9768.c
> @@ -499,7 +499,7 @@ static int dw9768_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int dw9768_remove(struct i2c_client *client)
> +static void dw9768_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct dw9768 *dw9768 =3D sd_to_dw9768(sd);
> @@ -511,8 +511,6 @@ static int dw9768_remove(struct i2c_client *client)
>         if (!pm_runtime_status_suspended(&client->dev))
>                 dw9768_runtime_suspend(&client->dev);
>         pm_runtime_set_suspended(&client->dev);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id dw9768_of_table[] =3D {
> diff --git a/drivers/media/i2c/dw9807-vcm.c b/drivers/media/i2c/dw9807-vc=
m.c
> index 01c372925a80..3599720db7e9 100644
> --- a/drivers/media/i2c/dw9807-vcm.c
> +++ b/drivers/media/i2c/dw9807-vcm.c
> @@ -216,7 +216,7 @@ static int dw9807_probe(struct i2c_client *client)
>         return rval;
>  }
>
> -static int dw9807_remove(struct i2c_client *client)
> +static void dw9807_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct dw9807_device *dw9807_dev =3D sd_to_dw9807_vcm(sd);
> @@ -224,8 +224,6 @@ static int dw9807_remove(struct i2c_client *client)
>         pm_runtime_disable(&client->dev);
>
>         dw9807_subdev_cleanup(dw9807_dev);
> -
> -       return 0;
>  }
>
>  /*
> diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c=
/et8ek8/et8ek8_driver.c
> index 873d614339bb..ff9bb9fc97dd 100644
> --- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
> +++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
> @@ -1460,7 +1460,7 @@ static int et8ek8_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int __exit et8ek8_remove(struct i2c_client *client)
> +static void __exit et8ek8_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *subdev =3D i2c_get_clientdata(client);
>         struct et8ek8_sensor *sensor =3D to_et8ek8_sensor(subdev);
> @@ -1477,8 +1477,6 @@ static int __exit et8ek8_remove(struct i2c_client *=
client)
>         v4l2_async_unregister_subdev(&sensor->subdev);
>         media_entity_cleanup(&sensor->subdev.entity);
>         mutex_destroy(&sensor->power_lock);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id et8ek8_of_table[] =3D {
> diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
> index 055d1aa8410e..e422ac7609b5 100644
> --- a/drivers/media/i2c/hi556.c
> +++ b/drivers/media/i2c/hi556.c
> @@ -1101,7 +1101,7 @@ static int hi556_check_hwcfg(struct device *dev)
>         return ret;
>  }
>
> -static int hi556_remove(struct i2c_client *client)
> +static void hi556_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct hi556 *hi556 =3D to_hi556(sd);
> @@ -1111,8 +1111,6 @@ static int hi556_remove(struct i2c_client *client)
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
>         pm_runtime_disable(&client->dev);
>         mutex_destroy(&hi556->mutex);
> -
> -       return 0;
>  }
>
>  static int hi556_probe(struct i2c_client *client)
> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index ad35c3ff3611..c5b69823f257 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c
> @@ -2143,7 +2143,7 @@ static int hi846_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int hi846_remove(struct i2c_client *client)
> +static void hi846_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct hi846 *hi846 =3D to_hi846(sd);
> @@ -2158,8 +2158,6 @@ static int hi846_remove(struct i2c_client *client)
>         pm_runtime_set_suspended(&client->dev);
>
>         mutex_destroy(&hi846->mutex);
> -
> -       return 0;
>  }
>
>  static const struct dev_pm_ops hi846_pm_ops =3D {
> diff --git a/drivers/media/i2c/hi847.c b/drivers/media/i2c/hi847.c
> index 7e85349e1852..5a82b15a9513 100644
> --- a/drivers/media/i2c/hi847.c
> +++ b/drivers/media/i2c/hi847.c
> @@ -2903,7 +2903,7 @@ static int hi847_check_hwcfg(struct device *dev)
>         return ret;
>  }
>
> -static int hi847_remove(struct i2c_client *client)
> +static void hi847_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct hi847 *hi847 =3D to_hi847(sd);
> @@ -2913,8 +2913,6 @@ static int hi847_remove(struct i2c_client *client)
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
>         pm_runtime_disable(&client->dev);
>         mutex_destroy(&hi847->mutex);
> -
> -       return 0;
>  }
>
>  static int hi847_probe(struct i2c_client *client)
> diff --git a/drivers/media/i2c/imx208.c b/drivers/media/i2c/imx208.c
> index b9516b2f1c15..a0e17bb9d4ca 100644
> --- a/drivers/media/i2c/imx208.c
> +++ b/drivers/media/i2c/imx208.c
> @@ -1061,7 +1061,7 @@ static int imx208_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int imx208_remove(struct i2c_client *client)
> +static void imx208_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct imx208 *imx208 =3D to_imx208(sd);
> @@ -1075,8 +1075,6 @@ static int imx208_remove(struct i2c_client *client)
>         pm_runtime_set_suspended(&client->dev);
>
>         mutex_destroy(&imx208->imx208_mx);
> -
> -       return 0;
>  }
>
>  static const struct dev_pm_ops imx208_pm_ops =3D {
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 83c1737abeec..710c9fb515fd 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -1080,7 +1080,7 @@ static int imx214_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int imx214_remove(struct i2c_client *client)
> +static void imx214_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct imx214 *imx214 =3D to_imx214(sd);
> @@ -1093,8 +1093,6 @@ static int imx214_remove(struct i2c_client *client)
>         pm_runtime_set_suspended(&client->dev);
>
>         mutex_destroy(&imx214->mutex);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id imx214_of_match[] =3D {
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index e10af3f74b38..77bd79a5954e 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -1562,7 +1562,7 @@ static int imx219_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int imx219_remove(struct i2c_client *client)
> +static void imx219_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct imx219 *imx219 =3D to_imx219(sd);
> @@ -1575,8 +1575,6 @@ static int imx219_remove(struct i2c_client *client)
>         if (!pm_runtime_status_suspended(&client->dev))
>                 imx219_power_off(&client->dev);
>         pm_runtime_set_suspended(&client->dev);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id imx219_dt_ids[] =3D {
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index c249507aa2db..eab5fc1ee2f7 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -1338,7 +1338,7 @@ static int imx258_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int imx258_remove(struct i2c_client *client)
> +static void imx258_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct imx258 *imx258 =3D to_imx258(sd);
> @@ -1351,8 +1351,6 @@ static int imx258_remove(struct i2c_client *client)
>         if (!pm_runtime_status_suspended(&client->dev))
>                 imx258_power_off(&client->dev);
>         pm_runtime_set_suspended(&client->dev);
> -
> -       return 0;
>  }
>
>  static const struct dev_pm_ops imx258_pm_ops =3D {
> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> index 7de1f2948e53..a00761b1e18c 100644
> --- a/drivers/media/i2c/imx274.c
> +++ b/drivers/media/i2c/imx274.c
> @@ -2142,7 +2142,7 @@ static int imx274_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int imx274_remove(struct i2c_client *client)
> +static void imx274_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct stimx274 *imx274 =3D to_imx274(sd);
> @@ -2157,7 +2157,6 @@ static int imx274_remove(struct i2c_client *client)
>
>         media_entity_cleanup(&sd->entity);
>         mutex_destroy(&imx274->lock);
> -       return 0;
>  }
>
>  static const struct dev_pm_ops imx274_pm_ops =3D {
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 99f2a50d39a4..1ce64dcdf7f0 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -1119,7 +1119,7 @@ static int imx290_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int imx290_remove(struct i2c_client *client)
> +static void imx290_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct imx290 *imx290 =3D to_imx290(sd);
> @@ -1134,8 +1134,6 @@ static int imx290_remove(struct i2c_client *client)
>         if (!pm_runtime_status_suspended(imx290->dev))
>                 imx290_power_off(imx290->dev);
>         pm_runtime_set_suspended(imx290->dev);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id imx290_of_match[] =3D {
> diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
> index a2b5a34de76b..245a18fb40ad 100644
> --- a/drivers/media/i2c/imx319.c
> +++ b/drivers/media/i2c/imx319.c
> @@ -2523,7 +2523,7 @@ static int imx319_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int imx319_remove(struct i2c_client *client)
> +static void imx319_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct imx319 *imx319 =3D to_imx319(sd);
> @@ -2536,8 +2536,6 @@ static int imx319_remove(struct i2c_client *client)
>         pm_runtime_set_suspended(&client->dev);
>
>         mutex_destroy(&imx319->mutex);
> -
> -       return 0;
>  }
>
>  static const struct dev_pm_ops imx319_pm_ops =3D {
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> index 062125501788..7b0a9086447d 100644
> --- a/drivers/media/i2c/imx334.c
> +++ b/drivers/media/i2c/imx334.c
> @@ -1089,7 +1089,7 @@ static int imx334_probe(struct i2c_client *client)
>   *
>   * Return: 0 if successful, error code otherwise.
>   */
> -static int imx334_remove(struct i2c_client *client)
> +static void imx334_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct imx334 *imx334 =3D to_imx334(sd);
> @@ -1102,8 +1102,6 @@ static int imx334_remove(struct i2c_client *client)
>         pm_runtime_suspended(&client->dev);
>
>         mutex_destroy(&imx334->mutex);
> -
> -       return 0;
>  }
>
>  static const struct dev_pm_ops imx334_pm_ops =3D {
> diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> index 410d6b86feb5..078ede2b7a00 100644
> --- a/drivers/media/i2c/imx335.c
> +++ b/drivers/media/i2c/imx335.c
> @@ -1083,7 +1083,7 @@ static int imx335_probe(struct i2c_client *client)
>   *
>   * Return: 0 if successful, error code otherwise.
>   */
> -static int imx335_remove(struct i2c_client *client)
> +static void imx335_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct imx335 *imx335 =3D to_imx335(sd);
> @@ -1098,8 +1098,6 @@ static int imx335_remove(struct i2c_client *client)
>         pm_runtime_set_suspended(&client->dev);
>
>         mutex_destroy(&imx335->mutex);
> -
> -       return 0;
>  }
>
>  static const struct dev_pm_ops imx335_pm_ops =3D {
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index 3922b9305978..b46178681c05 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -1810,7 +1810,7 @@ static int imx355_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int imx355_remove(struct i2c_client *client)
> +static void imx355_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct imx355 *imx355 =3D to_imx355(sd);
> @@ -1823,8 +1823,6 @@ static int imx355_remove(struct i2c_client *client)
>         pm_runtime_set_suspended(&client->dev);
>
>         mutex_destroy(&imx355->mutex);
> -
> -       return 0;
>  }
>
>  static const struct dev_pm_ops imx355_pm_ops =3D {
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index a1394d6c1432..7f6d29e0e7c4 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -1257,7 +1257,7 @@ static int imx412_probe(struct i2c_client *client)
>   *
>   * Return: 0 if successful, error code otherwise.
>   */
> -static int imx412_remove(struct i2c_client *client)
> +static void imx412_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct imx412 *imx412 =3D to_imx412(sd);
> @@ -1272,8 +1272,6 @@ static int imx412_remove(struct i2c_client *client)
>         pm_runtime_set_suspended(&client->dev);
>
>         mutex_destroy(&imx412->mutex);
> -
> -       return 0;
>  }
>
>  static const struct dev_pm_ops imx412_pm_ops =3D {
> diff --git a/drivers/media/i2c/ir-kbd-i2c.c b/drivers/media/i2c/ir-kbd-i2=
c.c
> index 56674173524f..ee6bbbb977f7 100644
> --- a/drivers/media/i2c/ir-kbd-i2c.c
> +++ b/drivers/media/i2c/ir-kbd-i2c.c
> @@ -915,7 +915,7 @@ static int ir_probe(struct i2c_client *client, const =
struct i2c_device_id *id)
>         return err;
>  }
>
> -static int ir_remove(struct i2c_client *client)
> +static void ir_remove(struct i2c_client *client)
>  {
>         struct IR_i2c *ir =3D i2c_get_clientdata(client);
>
> @@ -924,8 +924,6 @@ static int ir_remove(struct i2c_client *client)
>         i2c_unregister_device(ir->tx_c);
>
>         rc_unregister_device(ir->rc);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ir_kbd_id[] =3D {
> diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
> index dc3068549dfa..246d8d182a8e 100644
> --- a/drivers/media/i2c/isl7998x.c
> +++ b/drivers/media/i2c/isl7998x.c
> @@ -1544,7 +1544,7 @@ static int isl7998x_probe(struct i2c_client *client=
)
>         return ret;
>  }
>
> -static int isl7998x_remove(struct i2c_client *client)
> +static void isl7998x_remove(struct i2c_client *client)
>  {
>         struct isl7998x *isl7998x =3D i2c_to_isl7998x(client);
>
> @@ -1552,8 +1552,6 @@ static int isl7998x_remove(struct i2c_client *clien=
t)
>         v4l2_async_unregister_subdev(&isl7998x->subdev);
>         isl7998x_remove_controls(isl7998x);
>         media_entity_cleanup(&isl7998x->subdev.entity);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id isl7998x_of_match[] =3D {
> diff --git a/drivers/media/i2c/ks0127.c b/drivers/media/i2c/ks0127.c
> index c077f53b9c30..215d9a43b0b9 100644
> --- a/drivers/media/i2c/ks0127.c
> +++ b/drivers/media/i2c/ks0127.c
> @@ -675,14 +675,13 @@ static int ks0127_probe(struct i2c_client *client, =
const struct i2c_device_id *i
>         return 0;
>  }
>
> -static int ks0127_remove(struct i2c_client *client)
> +static void ks0127_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
>         ks0127_write(sd, KS_OFMTA, 0x20); /* tristate */
>         ks0127_write(sd, KS_CMDA, 0x2c | 0x80); /* power down */
> -       return 0;
>  }
>
>  static const struct i2c_device_id ks0127_id[] =3D {
> diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
> index 9e34ccce4fc3..edad3138cb07 100644
> --- a/drivers/media/i2c/lm3560.c
> +++ b/drivers/media/i2c/lm3560.c
> @@ -443,7 +443,7 @@ static int lm3560_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int lm3560_remove(struct i2c_client *client)
> +static void lm3560_remove(struct i2c_client *client)
>  {
>         struct lm3560_flash *flash =3D i2c_get_clientdata(client);
>         unsigned int i;
> @@ -453,8 +453,6 @@ static int lm3560_remove(struct i2c_client *client)
>                 v4l2_ctrl_handler_free(&flash->ctrls_led[i]);
>                 media_entity_cleanup(&flash->subdev_led[i].entity);
>         }
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id lm3560_id_table[] =3D {
> diff --git a/drivers/media/i2c/lm3646.c b/drivers/media/i2c/lm3646.c
> index c76ccf67a909..0aaa963917d8 100644
> --- a/drivers/media/i2c/lm3646.c
> +++ b/drivers/media/i2c/lm3646.c
> @@ -377,15 +377,13 @@ static int lm3646_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int lm3646_remove(struct i2c_client *client)
> +static void lm3646_remove(struct i2c_client *client)
>  {
>         struct lm3646_flash *flash =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(&flash->subdev_led);
>         v4l2_ctrl_handler_free(&flash->ctrls_led);
>         media_entity_cleanup(&flash->subdev_led.entity);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id lm3646_id_table[] =3D {
> diff --git a/drivers/media/i2c/m52790.c b/drivers/media/i2c/m52790.c
> index 0a1efc1417bc..2ab91b993c33 100644
> --- a/drivers/media/i2c/m52790.c
> +++ b/drivers/media/i2c/m52790.c
> @@ -154,12 +154,11 @@ static int m52790_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int m52790_remove(struct i2c_client *client)
> +static void m52790_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/m5mols/m5mols_core.c b/drivers/media/i2c/m=
5mols/m5mols_core.c
> index c19590389bfe..2201d2a26353 100644
> --- a/drivers/media/i2c/m5mols/m5mols_core.c
> +++ b/drivers/media/i2c/m5mols/m5mols_core.c
> @@ -1020,15 +1020,13 @@ static int m5mols_probe(struct i2c_client *client=
,
>         return ret;
>  }
>
> -static int m5mols_remove(struct i2c_client *client)
> +static void m5mols_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
>         media_entity_cleanup(&sd->entity);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id m5mols_id[] =3D {
> diff --git a/drivers/media/i2c/max2175.c b/drivers/media/i2c/max2175.c
> index 0eea200124d2..1019020f3a37 100644
> --- a/drivers/media/i2c/max2175.c
> +++ b/drivers/media/i2c/max2175.c
> @@ -1403,15 +1403,13 @@ static int max2175_probe(struct i2c_client *clien=
t)
>         return ret;
>  }
>
> -static int max2175_remove(struct i2c_client *client)
> +static void max2175_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct max2175 *ctx =3D max2175_from_sd(sd);
>
>         v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
>         v4l2_async_unregister_subdev(sd);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id max2175_id[] =3D {
> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> index 3684faa72253..9c083cf14231 100644
> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -1378,7 +1378,7 @@ static int max9286_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int max9286_remove(struct i2c_client *client)
> +static void max9286_remove(struct i2c_client *client)
>  {
>         struct max9286_priv *priv =3D sd_to_max9286(i2c_get_clientdata(cl=
ient));
>
> @@ -1391,8 +1391,6 @@ static int max9286_remove(struct i2c_client *client=
)
>         gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
>
>         max9286_cleanup_dt(priv);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id max9286_dt_ids[] =3D {
> diff --git a/drivers/media/i2c/ml86v7667.c b/drivers/media/i2c/ml86v7667.=
c
> index 48cc0b0922f4..49ec59b0ca43 100644
> --- a/drivers/media/i2c/ml86v7667.c
> +++ b/drivers/media/i2c/ml86v7667.c
> @@ -415,15 +415,13 @@ static int ml86v7667_probe(struct i2c_client *clien=
t,
>         return ret;
>  }
>
> -static int ml86v7667_remove(struct i2c_client *client)
> +static void ml86v7667_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ml86v7667_priv *priv =3D to_ml86v7667(sd);
>
>         v4l2_ctrl_handler_free(&priv->hdl);
>         v4l2_device_unregister_subdev(&priv->sd);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ml86v7667_id[] =3D {
> diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp34=
00-driver.c
> index 39530d43590e..4ce7a15a9884 100644
> --- a/drivers/media/i2c/msp3400-driver.c
> +++ b/drivers/media/i2c/msp3400-driver.c
> @@ -859,7 +859,7 @@ static int msp_probe(struct i2c_client *client, const=
 struct i2c_device_id *id)
>         return 0;
>  }
>
> -static int msp_remove(struct i2c_client *client)
> +static void msp_remove(struct i2c_client *client)
>  {
>         struct msp_state *state =3D to_state(i2c_get_clientdata(client));
>
> @@ -872,7 +872,6 @@ static int msp_remove(struct i2c_client *client)
>         msp_reset(client);
>
>         v4l2_ctrl_handler_free(&state->hdl);
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
> index ad13b0c890c0..ebf9cf1e1bce 100644
> --- a/drivers/media/i2c/mt9m001.c
> +++ b/drivers/media/i2c/mt9m001.c
> @@ -833,7 +833,7 @@ static int mt9m001_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int mt9m001_remove(struct i2c_client *client)
> +static void mt9m001_remove(struct i2c_client *client)
>  {
>         struct mt9m001 *mt9m001 =3D to_mt9m001(client);
>
> @@ -853,8 +853,6 @@ static int mt9m001_remove(struct i2c_client *client)
>
>         v4l2_ctrl_handler_free(&mt9m001->hdl);
>         mutex_destroy(&mt9m001->mutex);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id mt9m001_id[] =3D {
> diff --git a/drivers/media/i2c/mt9m032.c b/drivers/media/i2c/mt9m032.c
> index ba0c0ea91c95..76b8c9c08c82 100644
> --- a/drivers/media/i2c/mt9m032.c
> +++ b/drivers/media/i2c/mt9m032.c
> @@ -858,7 +858,7 @@ static int mt9m032_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int mt9m032_remove(struct i2c_client *client)
> +static void mt9m032_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *subdev =3D i2c_get_clientdata(client);
>         struct mt9m032 *sensor =3D to_mt9m032(subdev);
> @@ -867,7 +867,6 @@ static int mt9m032_remove(struct i2c_client *client)
>         v4l2_ctrl_handler_free(&sensor->ctrls);
>         media_entity_cleanup(&subdev->entity);
>         mutex_destroy(&sensor->lock);
> -       return 0;
>  }
>
>  static const struct i2c_device_id mt9m032_id_table[] =3D {
> diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
> index afc86efa9e3e..f5fe272d1205 100644
> --- a/drivers/media/i2c/mt9m111.c
> +++ b/drivers/media/i2c/mt9m111.c
> @@ -1359,15 +1359,13 @@ static int mt9m111_probe(struct i2c_client *clien=
t)
>         return ret;
>  }
>
> -static int mt9m111_remove(struct i2c_client *client)
> +static void mt9m111_remove(struct i2c_client *client)
>  {
>         struct mt9m111 *mt9m111 =3D to_mt9m111(client);
>
>         v4l2_async_unregister_subdev(&mt9m111->subdev);
>         media_entity_cleanup(&mt9m111->subdev.entity);
>         v4l2_ctrl_handler_free(&mt9m111->hdl);
> -
> -       return 0;
>  }
>  static const struct of_device_id mt9m111_of_match[] =3D {
>         { .compatible =3D "micron,mt9m111", },
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index cbce8b88dbcf..00da584a47b7 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -1200,7 +1200,7 @@ static int mt9p031_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int mt9p031_remove(struct i2c_client *client)
> +static void mt9p031_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *subdev =3D i2c_get_clientdata(client);
>         struct mt9p031 *mt9p031 =3D to_mt9p031(subdev);
> @@ -1209,8 +1209,6 @@ static int mt9p031_remove(struct i2c_client *client=
)
>         v4l2_async_unregister_subdev(subdev);
>         media_entity_cleanup(&subdev->entity);
>         mutex_destroy(&mt9p031->power_lock);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id mt9p031_id[] =3D {
> diff --git a/drivers/media/i2c/mt9t001.c b/drivers/media/i2c/mt9t001.c
> index b651ee4a26e8..d5abe4a7ef07 100644
> --- a/drivers/media/i2c/mt9t001.c
> +++ b/drivers/media/i2c/mt9t001.c
> @@ -961,7 +961,7 @@ static int mt9t001_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int mt9t001_remove(struct i2c_client *client)
> +static void mt9t001_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *subdev =3D i2c_get_clientdata(client);
>         struct mt9t001 *mt9t001 =3D to_mt9t001(subdev);
> @@ -969,7 +969,6 @@ static int mt9t001_remove(struct i2c_client *client)
>         v4l2_ctrl_handler_free(&mt9t001->ctrls);
>         v4l2_device_unregister_subdev(subdev);
>         media_entity_cleanup(&subdev->entity);
> -       return 0;
>  }
>
>  static const struct i2c_device_id mt9t001_id[] =3D {
> diff --git a/drivers/media/i2c/mt9t112.c b/drivers/media/i2c/mt9t112.c
> index 8d2e3caa9b28..ad564095d0cf 100644
> --- a/drivers/media/i2c/mt9t112.c
> +++ b/drivers/media/i2c/mt9t112.c
> @@ -1102,14 +1102,12 @@ static int mt9t112_probe(struct i2c_client *clien=
t,
>         return v4l2_async_register_subdev(&priv->subdev);
>  }
>
> -static int mt9t112_remove(struct i2c_client *client)
> +static void mt9t112_remove(struct i2c_client *client)
>  {
>         struct mt9t112_priv *priv =3D to_mt9t112(client);
>
>         clk_disable_unprepare(priv->clk);
>         v4l2_async_unregister_subdev(&priv->subdev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id mt9t112_id[] =3D {
> diff --git a/drivers/media/i2c/mt9v011.c b/drivers/media/i2c/mt9v011.c
> index 7699e64e1127..9952ce06ebb2 100644
> --- a/drivers/media/i2c/mt9v011.c
> +++ b/drivers/media/i2c/mt9v011.c
> @@ -561,7 +561,7 @@ static int mt9v011_probe(struct i2c_client *c,
>         return 0;
>  }
>
> -static int mt9v011_remove(struct i2c_client *c)
> +static void mt9v011_remove(struct i2c_client *c)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(c);
>         struct mt9v011 *core =3D to_mt9v011(sd);
> @@ -572,8 +572,6 @@ static int mt9v011_remove(struct i2c_client *c)
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(&core->ctrls);
> -
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
> index 4cfdd3dfbd42..bc4388ccc2a8 100644
> --- a/drivers/media/i2c/mt9v032.c
> +++ b/drivers/media/i2c/mt9v032.c
> @@ -1192,7 +1192,7 @@ static int mt9v032_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int mt9v032_remove(struct i2c_client *client)
> +static void mt9v032_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *subdev =3D i2c_get_clientdata(client);
>         struct mt9v032 *mt9v032 =3D to_mt9v032(subdev);
> @@ -1200,8 +1200,6 @@ static int mt9v032_remove(struct i2c_client *client=
)
>         v4l2_async_unregister_subdev(subdev);
>         v4l2_ctrl_handler_free(&mt9v032->ctrls);
>         media_entity_cleanup(&subdev->entity);
> -
> -       return 0;
>  }
>
>  static const struct mt9v032_model_data mt9v032_model_data[] =3D {
> diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
> index 2dc4a0f24ce8..fe18e5258d7a 100644
> --- a/drivers/media/i2c/mt9v111.c
> +++ b/drivers/media/i2c/mt9v111.c
> @@ -1238,7 +1238,7 @@ static int mt9v111_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int mt9v111_remove(struct i2c_client *client)
> +static void mt9v111_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct mt9v111_dev *mt9v111 =3D sd_to_mt9v111(sd);
> @@ -1253,8 +1253,6 @@ static int mt9v111_remove(struct i2c_client *client=
)
>
>         mutex_destroy(&mt9v111->pwr_mutex);
>         mutex_destroy(&mt9v111->stream_mutex);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id mt9v111_of_match[] =3D {
> diff --git a/drivers/media/i2c/noon010pc30.c b/drivers/media/i2c/noon010p=
c30.c
> index bc5187f46365..ecaf5e9057f1 100644
> --- a/drivers/media/i2c/noon010pc30.c
> +++ b/drivers/media/i2c/noon010pc30.c
> @@ -789,7 +789,7 @@ static int noon010_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int noon010_remove(struct i2c_client *client)
> +static void noon010_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct noon010_info *info =3D to_noon010(sd);
> @@ -797,8 +797,6 @@ static int noon010_remove(struct i2c_client *client)
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(&info->hdl);
>         media_entity_cleanup(&sd->entity);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id noon010_id[] =3D {
> diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
> index 87179fc04e00..35663c10fcd9 100644
> --- a/drivers/media/i2c/og01a1b.c
> +++ b/drivers/media/i2c/og01a1b.c
> @@ -1015,7 +1015,7 @@ static int og01a1b_check_hwcfg(struct device *dev)
>         return ret;
>  }
>
> -static int og01a1b_remove(struct i2c_client *client)
> +static void og01a1b_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct og01a1b *og01a1b =3D to_og01a1b(sd);
> @@ -1025,8 +1025,6 @@ static int og01a1b_remove(struct i2c_client *client=
)
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
>         pm_runtime_disable(&client->dev);
>         mutex_destroy(&og01a1b->mutex);
> -
> -       return 0;
>  }
>
>  static int og01a1b_probe(struct i2c_client *client)
> diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
> index 0f08c05333ea..2c1eb724d8e5 100644
> --- a/drivers/media/i2c/ov02a10.c
> +++ b/drivers/media/i2c/ov02a10.c
> @@ -975,7 +975,7 @@ static int ov02a10_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ov02a10_remove(struct i2c_client *client)
> +static void ov02a10_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov02a10 *ov02a10 =3D to_ov02a10(sd);
> @@ -988,8 +988,6 @@ static int ov02a10_remove(struct i2c_client *client)
>                 ov02a10_power_off(&client->dev);
>         pm_runtime_set_suspended(&client->dev);
>         mutex_destroy(&ov02a10->mutex);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id ov02a10_of_match[] =3D {
> diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
> index e5ef6466a3ec..c1703596c3dc 100644
> --- a/drivers/media/i2c/ov08d10.c
> +++ b/drivers/media/i2c/ov08d10.c
> @@ -1415,7 +1415,7 @@ static int ov08d10_get_hwcfg(struct ov08d10 *ov08d1=
0, struct device *dev)
>         return ret;
>  }
>
> -static int ov08d10_remove(struct i2c_client *client)
> +static void ov08d10_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov08d10 *ov08d10 =3D to_ov08d10(sd);
> @@ -1425,8 +1425,6 @@ static int ov08d10_remove(struct i2c_client *client=
)
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
>         pm_runtime_disable(&client->dev);
>         mutex_destroy(&ov08d10->mutex);
> -
> -       return 0;
>  }
>
>  static int ov08d10_probe(struct i2c_client *client)
> diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
> index d5fe67c763f7..e618b613e078 100644
> --- a/drivers/media/i2c/ov13858.c
> +++ b/drivers/media/i2c/ov13858.c
> @@ -1769,7 +1769,7 @@ static int ov13858_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int ov13858_remove(struct i2c_client *client)
> +static void ov13858_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov13858 *ov13858 =3D to_ov13858(sd);
> @@ -1779,8 +1779,6 @@ static int ov13858_remove(struct i2c_client *client=
)
>         ov13858_free_controls(ov13858);
>
>         pm_runtime_disable(&client->dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ov13858_id_table[] =3D {
> diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
> index 7caeae641051..549e5d93e568 100644
> --- a/drivers/media/i2c/ov13b10.c
> +++ b/drivers/media/i2c/ov13b10.c
> @@ -1447,7 +1447,7 @@ static int ov13b10_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ov13b10_remove(struct i2c_client *client)
> +static void ov13b10_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov13b10 *ov13b =3D to_ov13b10(sd);
> @@ -1457,8 +1457,6 @@ static int ov13b10_remove(struct i2c_client *client=
)
>         ov13b10_free_controls(ov13b);
>
>         pm_runtime_disable(&client->dev);
> -
> -       return 0;
>  }
>
>  static const struct dev_pm_ops ov13b10_pm_ops =3D {
> diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
> index 4b75da55b260..29ed0ef8c033 100644
> --- a/drivers/media/i2c/ov2640.c
> +++ b/drivers/media/i2c/ov2640.c
> @@ -1271,7 +1271,7 @@ static int ov2640_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ov2640_remove(struct i2c_client *client)
> +static void ov2640_remove(struct i2c_client *client)
>  {
>         struct ov2640_priv       *priv =3D to_ov2640(client);
>
> @@ -1281,7 +1281,6 @@ static int ov2640_remove(struct i2c_client *client)
>         media_entity_cleanup(&priv->subdev.entity);
>         v4l2_device_unregister_subdev(&priv->subdev);
>         clk_disable_unprepare(priv->clk);
> -       return 0;
>  }
>
>  static const struct i2c_device_id ov2640_id[] =3D {
> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> index 13ded5b2aa66..42fc64ada08c 100644
> --- a/drivers/media/i2c/ov2659.c
> +++ b/drivers/media/i2c/ov2659.c
> @@ -1544,7 +1544,7 @@ static int ov2659_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ov2659_remove(struct i2c_client *client)
> +static void ov2659_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov2659 *ov2659 =3D to_ov2659(sd);
> @@ -1558,8 +1558,6 @@ static int ov2659_remove(struct i2c_client *client)
>         if (!pm_runtime_status_suspended(&client->dev))
>                 ov2659_power_off(&client->dev);
>         pm_runtime_set_suspended(&client->dev);
> -
> -       return 0;
>  }
>
>  static const struct dev_pm_ops ov2659_pm_ops =3D {
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index 906c711f6821..de66d3395a4d 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -1097,7 +1097,7 @@ static int ov2680_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ov2680_remove(struct i2c_client *client)
> +static void ov2680_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov2680_dev *sensor =3D to_ov2680_dev(sd);
> @@ -1106,8 +1106,6 @@ static int ov2680_remove(struct i2c_client *client)
>         mutex_destroy(&sensor->lock);
>         media_entity_cleanup(&sensor->sd.entity);
>         v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused ov2680_suspend(struct device *dev)
> diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
> index b6e010ea3249..a3b524f15d89 100644
> --- a/drivers/media/i2c/ov2685.c
> +++ b/drivers/media/i2c/ov2685.c
> @@ -798,7 +798,7 @@ static int ov2685_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int ov2685_remove(struct i2c_client *client)
> +static void ov2685_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov2685 *ov2685 =3D to_ov2685(sd);
> @@ -814,8 +814,6 @@ static int ov2685_remove(struct i2c_client *client)
>         if (!pm_runtime_status_suspended(&client->dev))
>                 __ov2685_power_off(ov2685);
>         pm_runtime_set_suspended(&client->dev);
> -
> -       return 0;
>  }
>
>  #if IS_ENABLED(CONFIG_OF)
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index d5f0eabf20c6..5d74ad479214 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -1053,7 +1053,7 @@ static int ov2740_check_hwcfg(struct device *dev)
>         return ret;
>  }
>
> -static int ov2740_remove(struct i2c_client *client)
> +static void ov2740_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov2740 *ov2740 =3D to_ov2740(sd);
> @@ -1063,8 +1063,6 @@ static int ov2740_remove(struct i2c_client *client)
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
>         pm_runtime_disable(&client->dev);
>         mutex_destroy(&ov2740->mutex);
> -
> -       return 0;
>  }
>
>  static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index db5a19babe67..7bcfdfdd1248 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -3180,7 +3180,7 @@ static int ov5640_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ov5640_remove(struct i2c_client *client)
> +static void ov5640_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov5640_dev *sensor =3D to_ov5640_dev(sd);
> @@ -3189,8 +3189,6 @@ static int ov5640_remove(struct i2c_client *client)
>         media_entity_cleanup(&sensor->sd.entity);
>         v4l2_ctrl_handler_free(&sensor->ctrls.handler);
>         mutex_destroy(&sensor->lock);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ov5640_id[] =3D {
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index 562c62f192c4..81e4e87e1821 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -1256,7 +1256,7 @@ static int ov5645_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ov5645_remove(struct i2c_client *client)
> +static void ov5645_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov5645 *ov5645 =3D to_ov5645(sd);
> @@ -1265,8 +1265,6 @@ static int ov5645_remove(struct i2c_client *client)
>         media_entity_cleanup(&ov5645->sd.entity);
>         v4l2_ctrl_handler_free(&ov5645->ctrls);
>         mutex_destroy(&ov5645->power_lock);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ov5645_id[] =3D {
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index d346d18ce629..847a7bbb69c5 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -1448,7 +1448,7 @@ static int ov5647_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ov5647_remove(struct i2c_client *client)
> +static void ov5647_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov5647 *sensor =3D to_sensor(sd);
> @@ -1459,8 +1459,6 @@ static int ov5647_remove(struct i2c_client *client)
>         v4l2_device_unregister_subdev(sd);
>         pm_runtime_disable(&client->dev);
>         mutex_destroy(&sensor->lock);
> -
> -       return 0;
>  }
>
>  static const struct dev_pm_ops ov5647_pm_ops =3D {
> diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
> index dfcd33e9ee13..84604ea7bdf9 100644
> --- a/drivers/media/i2c/ov5648.c
> +++ b/drivers/media/i2c/ov5648.c
> @@ -2587,7 +2587,7 @@ static int ov5648_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ov5648_remove(struct i2c_client *client)
> +static void ov5648_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *subdev =3D i2c_get_clientdata(client);
>         struct ov5648_sensor *sensor =3D ov5648_subdev_sensor(subdev);
> @@ -2597,8 +2597,6 @@ static int ov5648_remove(struct i2c_client *client)
>         v4l2_ctrl_handler_free(&sensor->ctrls.handler);
>         mutex_destroy(&sensor->mutex);
>         media_entity_cleanup(&subdev->entity);
> -
> -       return 0;
>  }
>
>  static const struct dev_pm_ops ov5648_pm_ops =3D {
> diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> index 02f75c18e480..bc9fc3bc90c2 100644
> --- a/drivers/media/i2c/ov5670.c
> +++ b/drivers/media/i2c/ov5670.c
> @@ -2557,7 +2557,7 @@ static int ov5670_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ov5670_remove(struct i2c_client *client)
> +static void ov5670_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov5670 *ov5670 =3D to_ov5670(sd);
> @@ -2568,8 +2568,6 @@ static int ov5670_remove(struct i2c_client *client)
>         mutex_destroy(&ov5670->mutex);
>
>         pm_runtime_disable(&client->dev);
> -
> -       return 0;
>  }
>
>  static const struct dev_pm_ops ov5670_pm_ops =3D {
> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> index 82ba9f56baec..94dc8cb7a7c0 100644
> --- a/drivers/media/i2c/ov5675.c
> +++ b/drivers/media/i2c/ov5675.c
> @@ -1175,7 +1175,7 @@ static int ov5675_check_hwcfg(struct device *dev)
>         return ret;
>  }
>
> -static int ov5675_remove(struct i2c_client *client)
> +static void ov5675_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov5675 *ov5675 =3D to_ov5675(sd);
> @@ -1185,8 +1185,6 @@ static int ov5675_remove(struct i2c_client *client)
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
>         pm_runtime_disable(&client->dev);
>         mutex_destroy(&ov5675->mutex);
> -
> -       return 0;
>  }
>
>  static int ov5675_probe(struct i2c_client *client)
> diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
> index 117ff5403312..5a05356bcfb6 100644
> --- a/drivers/media/i2c/ov5693.c
> +++ b/drivers/media/i2c/ov5693.c
> @@ -1489,7 +1489,7 @@ static int ov5693_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ov5693_remove(struct i2c_client *client)
> +static void ov5693_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov5693_device *ov5693 =3D to_ov5693_sensor(sd);
> @@ -1507,8 +1507,6 @@ static int ov5693_remove(struct i2c_client *client)
>         if (!pm_runtime_status_suspended(&client->dev))
>                 ov5693_sensor_powerdown(ov5693);
>         pm_runtime_set_suspended(&client->dev);
> -
> -       return 0;
>  }
>
>  static const struct dev_pm_ops ov5693_pm_ops =3D {
> diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
> index 910309783885..61906fc54e37 100644
> --- a/drivers/media/i2c/ov5695.c
> +++ b/drivers/media/i2c/ov5695.c
> @@ -1361,7 +1361,7 @@ static int ov5695_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int ov5695_remove(struct i2c_client *client)
> +static void ov5695_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov5695 *ov5695 =3D to_ov5695(sd);
> @@ -1377,8 +1377,6 @@ static int ov5695_remove(struct i2c_client *client)
>         if (!pm_runtime_status_suspended(&client->dev))
>                 __ov5695_power_off(ov5695);
>         pm_runtime_set_suspended(&client->dev);
> -
> -       return 0;
>  }
>
>  #if IS_ENABLED(CONFIG_OF)
> diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> index 6458e96d9091..18f041e985b7 100644
> --- a/drivers/media/i2c/ov6650.c
> +++ b/drivers/media/i2c/ov6650.c
> @@ -1096,13 +1096,12 @@ static int ov6650_probe(struct i2c_client *client=
,
>         return ret;
>  }
>
> -static int ov6650_remove(struct i2c_client *client)
> +static void ov6650_remove(struct i2c_client *client)
>  {
>         struct ov6650 *priv =3D to_ov6650(client);
>
>         v4l2_async_unregister_subdev(&priv->subdev);
>         v4l2_ctrl_handler_free(&priv->hdl);
> -       return 0;
>  }
>
>  static const struct i2c_device_id ov6650_id[] =3D {
> diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
> index 0e7be15bc20a..5d837a782ac8 100644
> --- a/drivers/media/i2c/ov7251.c
> +++ b/drivers/media/i2c/ov7251.c
> @@ -1766,7 +1766,7 @@ static int ov7251_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ov7251_remove(struct i2c_client *client)
> +static void ov7251_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov7251 *ov7251 =3D to_ov7251(sd);
> @@ -1780,8 +1780,6 @@ static int ov7251_remove(struct i2c_client *client)
>         if (!pm_runtime_status_suspended(ov7251->dev))
>                 ov7251_set_power_off(ov7251->dev);
>         pm_runtime_set_suspended(ov7251->dev);
> -
> -       return 0;
>  }
>
>  static const struct dev_pm_ops ov7251_pm_ops =3D {
> diff --git a/drivers/media/i2c/ov7640.c b/drivers/media/i2c/ov7640.c
> index 977cd2d8ad33..5e2d67f0f9f2 100644
> --- a/drivers/media/i2c/ov7640.c
> +++ b/drivers/media/i2c/ov7640.c
> @@ -70,13 +70,11 @@ static int ov7640_probe(struct i2c_client *client,
>  }
>
>
> -static int ov7640_remove(struct i2c_client *client)
> +static void ov7640_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ov7640_id[] =3D {
> diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
> index 1be2c0e5bdc1..4b9b156b53c7 100644
> --- a/drivers/media/i2c/ov7670.c
> +++ b/drivers/media/i2c/ov7670.c
> @@ -2009,7 +2009,7 @@ static int ov7670_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int ov7670_remove(struct i2c_client *client)
> +static void ov7670_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov7670_info *info =3D to_state(sd);
> @@ -2017,7 +2017,6 @@ static int ov7670_remove(struct i2c_client *client)
>         v4l2_async_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(&info->hdl);
>         media_entity_cleanup(&info->sd.entity);
> -       return 0;
>  }
>
>  static const struct i2c_device_id ov7670_id[] =3D {
> diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> index 78602a2f70b0..4189e3fc3d53 100644
> --- a/drivers/media/i2c/ov772x.c
> +++ b/drivers/media/i2c/ov772x.c
> @@ -1521,7 +1521,7 @@ static int ov772x_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ov772x_remove(struct i2c_client *client)
> +static void ov772x_remove(struct i2c_client *client)
>  {
>         struct ov772x_priv *priv =3D to_ov772x(i2c_get_clientdata(client)=
);
>
> @@ -1532,8 +1532,6 @@ static int ov772x_remove(struct i2c_client *client)
>         v4l2_async_unregister_subdev(&priv->subdev);
>         v4l2_ctrl_handler_free(&priv->hdl);
>         mutex_destroy(&priv->lock);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ov772x_id[] =3D {
> diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
> index 2539cfee85c8..c9fd9b0bc54a 100644
> --- a/drivers/media/i2c/ov7740.c
> +++ b/drivers/media/i2c/ov7740.c
> @@ -1153,7 +1153,7 @@ static int ov7740_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ov7740_remove(struct i2c_client *client)
> +static void ov7740_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov7740 *ov7740 =3D container_of(sd, struct ov7740, subdev)=
;
> @@ -1170,7 +1170,6 @@ static int ov7740_remove(struct i2c_client *client)
>         pm_runtime_put_noidle(&client->dev);
>
>         ov7740_set_power(ov7740, 0);
> -       return 0;
>  }
>
>  static int __maybe_unused ov7740_runtime_suspend(struct device *dev)
> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> index a9728afc81d4..efa18d026ac3 100644
> --- a/drivers/media/i2c/ov8856.c
> +++ b/drivers/media/i2c/ov8856.c
> @@ -2440,7 +2440,7 @@ static int ov8856_get_hwcfg(struct ov8856 *ov8856, =
struct device *dev)
>         return ret;
>  }
>
> -static int ov8856_remove(struct i2c_client *client)
> +static void ov8856_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov8856 *ov8856 =3D to_ov8856(sd);
> @@ -2452,8 +2452,6 @@ static int ov8856_remove(struct i2c_client *client)
>         mutex_destroy(&ov8856->mutex);
>
>         __ov8856_power_off(ov8856);
> -
> -       return 0;
>  }
>
>  static int ov8856_probe(struct i2c_client *client)
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index b8f4f0d3e33d..a233c34b168e 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -3119,7 +3119,7 @@ static int ov8865_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ov8865_remove(struct i2c_client *client)
> +static void ov8865_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *subdev =3D i2c_get_clientdata(client);
>         struct ov8865_sensor *sensor =3D ov8865_subdev_sensor(subdev);
> @@ -3131,8 +3131,6 @@ static int ov8865_remove(struct i2c_client *client)
>         media_entity_cleanup(&subdev->entity);
>
>         v4l2_fwnode_endpoint_free(&sensor->endpoint);
> -
> -       return 0;
>  }
>
>  static const struct dev_pm_ops ov8865_pm_ops =3D {
> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> index 2e0b315801e5..df144a2f6eda 100644
> --- a/drivers/media/i2c/ov9282.c
> +++ b/drivers/media/i2c/ov9282.c
> @@ -1091,7 +1091,7 @@ static int ov9282_probe(struct i2c_client *client)
>   *
>   * Return: 0 if successful, error code otherwise.
>   */
> -static int ov9282_remove(struct i2c_client *client)
> +static void ov9282_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov9282 *ov9282 =3D to_ov9282(sd);
> @@ -1106,8 +1106,6 @@ static int ov9282_remove(struct i2c_client *client)
>         pm_runtime_set_suspended(&client->dev);
>
>         mutex_destroy(&ov9282->mutex);
> -
> -       return 0;
>  }
>
>  static const struct dev_pm_ops ov9282_pm_ops =3D {
> diff --git a/drivers/media/i2c/ov9640.c b/drivers/media/i2c/ov9640.c
> index 9f44ed52d164..8b80be33c5f4 100644
> --- a/drivers/media/i2c/ov9640.c
> +++ b/drivers/media/i2c/ov9640.c
> @@ -744,15 +744,13 @@ static int ov9640_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int ov9640_remove(struct i2c_client *client)
> +static void ov9640_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov9640_priv *priv =3D to_ov9640_sensor(sd);
>
>         v4l2_async_unregister_subdev(&priv->subdev);
>         v4l2_ctrl_handler_free(&priv->hdl);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ov9640_id[] =3D {
> diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
> index c313e11a9754..4d458993e6d6 100644
> --- a/drivers/media/i2c/ov9650.c
> +++ b/drivers/media/i2c/ov9650.c
> @@ -1584,7 +1584,7 @@ static int ov965x_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ov965x_remove(struct i2c_client *client)
> +static void ov965x_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov965x *ov965x =3D to_ov965x(sd);
> @@ -1593,8 +1593,6 @@ static int ov965x_remove(struct i2c_client *client)
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
>         media_entity_cleanup(&sd->entity);
>         mutex_destroy(&ov965x->lock);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ov965x_id[] =3D {
> diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
> index df538ceb71c3..8b0a158cb297 100644
> --- a/drivers/media/i2c/ov9734.c
> +++ b/drivers/media/i2c/ov9734.c
> @@ -930,7 +930,7 @@ static int ov9734_check_hwcfg(struct device *dev)
>         return ret;
>  }
>
> -static int ov9734_remove(struct i2c_client *client)
> +static void ov9734_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov9734 *ov9734 =3D to_ov9734(sd);
> @@ -940,8 +940,6 @@ static int ov9734_remove(struct i2c_client *client)
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
>         pm_runtime_disable(&client->dev);
>         mutex_destroy(&ov9734->mutex);
> -
> -       return 0;
>  }
>
>  static int ov9734_probe(struct i2c_client *client)
> diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
> index 2615ad154f49..a2263fa825b5 100644
> --- a/drivers/media/i2c/rdacm20.c
> +++ b/drivers/media/i2c/rdacm20.c
> @@ -646,7 +646,7 @@ static int rdacm20_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int rdacm20_remove(struct i2c_client *client)
> +static void rdacm20_remove(struct i2c_client *client)
>  {
>         struct rdacm20_device *dev =3D i2c_to_rdacm20(client);
>
> @@ -655,8 +655,6 @@ static int rdacm20_remove(struct i2c_client *client)
>         v4l2_ctrl_handler_free(&dev->ctrls);
>         media_entity_cleanup(&dev->sd.entity);
>         i2c_unregister_device(dev->sensor);
> -
> -       return 0;
>  }
>
>  static void rdacm20_shutdown(struct i2c_client *client)
> diff --git a/drivers/media/i2c/rdacm21.c b/drivers/media/i2c/rdacm21.c
> index ef31cf5f23ca..9ccc56c30d3b 100644
> --- a/drivers/media/i2c/rdacm21.c
> +++ b/drivers/media/i2c/rdacm21.c
> @@ -614,7 +614,7 @@ static int rdacm21_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int rdacm21_remove(struct i2c_client *client)
> +static void rdacm21_remove(struct i2c_client *client)
>  {
>         struct rdacm21_device *dev =3D sd_to_rdacm21(i2c_get_clientdata(c=
lient));
>
> @@ -622,8 +622,6 @@ static int rdacm21_remove(struct i2c_client *client)
>         v4l2_ctrl_handler_free(&dev->ctrls);
>         i2c_unregister_device(dev->isp);
>         fwnode_handle_put(dev->sd.fwnode);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id rdacm21_of_ids[] =3D {
> diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0=
c.c
> index 2e4018c26912..1c3502f34cd3 100644
> --- a/drivers/media/i2c/rj54n1cb0c.c
> +++ b/drivers/media/i2c/rj54n1cb0c.c
> @@ -1398,7 +1398,7 @@ static int rj54n1_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int rj54n1_remove(struct i2c_client *client)
> +static void rj54n1_remove(struct i2c_client *client)
>  {
>         struct rj54n1 *rj54n1 =3D to_rj54n1(client);
>
> @@ -1410,8 +1410,6 @@ static int rj54n1_remove(struct i2c_client *client)
>         clk_put(rj54n1->clk);
>         v4l2_ctrl_handler_free(&rj54n1->hdl);
>         v4l2_async_unregister_subdev(&rj54n1->subdev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id rj54n1_id[] =3D {
> diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c=
/s5c73m3/s5c73m3-core.c
> index e2b88c5e4f98..d96ba58ce1e5 100644
> --- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
> +++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
> @@ -1770,7 +1770,7 @@ static int s5c73m3_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int s5c73m3_remove(struct i2c_client *client)
> +static void s5c73m3_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *oif_sd =3D i2c_get_clientdata(client);
>         struct s5c73m3 *state =3D oif_sd_to_s5c73m3(oif_sd);
> @@ -1785,8 +1785,6 @@ static int s5c73m3_remove(struct i2c_client *client=
)
>         media_entity_cleanup(&sensor_sd->entity);
>
>         s5c73m3_unregister_spi_driver(state);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id s5c73m3_id[] =3D {
> diff --git a/drivers/media/i2c/s5k4ecgx.c b/drivers/media/i2c/s5k4ecgx.c
> index af9a305242cd..3dddcd9dd351 100644
> --- a/drivers/media/i2c/s5k4ecgx.c
> +++ b/drivers/media/i2c/s5k4ecgx.c
> @@ -996,7 +996,7 @@ static int s5k4ecgx_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int s5k4ecgx_remove(struct i2c_client *client)
> +static void s5k4ecgx_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct s5k4ecgx *priv =3D to_s5k4ecgx(sd);
> @@ -1006,8 +1006,6 @@ static int s5k4ecgx_remove(struct i2c_client *clien=
t)
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(&priv->handler);
>         media_entity_cleanup(&sd->entity);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id s5k4ecgx_id[] =3D {
> diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
> index 6a5dceb699a8..5c2253ab3b6f 100644
> --- a/drivers/media/i2c/s5k5baf.c
> +++ b/drivers/media/i2c/s5k5baf.c
> @@ -2018,7 +2018,7 @@ static int s5k5baf_probe(struct i2c_client *c)
>         return ret;
>  }
>
> -static int s5k5baf_remove(struct i2c_client *c)
> +static void s5k5baf_remove(struct i2c_client *c)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(c);
>         struct s5k5baf *state =3D to_s5k5baf(sd);
> @@ -2030,8 +2030,6 @@ static int s5k5baf_remove(struct i2c_client *c)
>         sd =3D &state->cis_sd;
>         v4l2_device_unregister_subdev(sd);
>         media_entity_cleanup(&sd->entity);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id s5k5baf_id[] =3D {
> diff --git a/drivers/media/i2c/s5k6a3.c b/drivers/media/i2c/s5k6a3.c
> index f6ecf6f92bb2..a4efd6d10b43 100644
> --- a/drivers/media/i2c/s5k6a3.c
> +++ b/drivers/media/i2c/s5k6a3.c
> @@ -354,14 +354,13 @@ static int s5k6a3_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int s5k6a3_remove(struct i2c_client *client)
> +static void s5k6a3_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         pm_runtime_disable(&client->dev);
>         v4l2_async_unregister_subdev(sd);
>         media_entity_cleanup(&sd->entity);
> -       return 0;
>  }
>
>  static const struct i2c_device_id s5k6a3_ids[] =3D {
> diff --git a/drivers/media/i2c/s5k6aa.c b/drivers/media/i2c/s5k6aa.c
> index 105a4b7d8354..059211788a65 100644
> --- a/drivers/media/i2c/s5k6aa.c
> +++ b/drivers/media/i2c/s5k6aa.c
> @@ -1621,15 +1621,13 @@ static int s5k6aa_probe(struct i2c_client *client=
,
>         return ret;
>  }
>
> -static int s5k6aa_remove(struct i2c_client *client)
> +static void s5k6aa_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
>         media_entity_cleanup(&sd->entity);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id s5k6aa_id[] =3D {
> diff --git a/drivers/media/i2c/saa6588.c b/drivers/media/i2c/saa6588.c
> index d1e0716bdfff..d6a51beabd02 100644
> --- a/drivers/media/i2c/saa6588.c
> +++ b/drivers/media/i2c/saa6588.c
> @@ -484,7 +484,7 @@ static int saa6588_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int saa6588_remove(struct i2c_client *client)
> +static void saa6588_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct saa6588 *s =3D to_saa6588(sd);
> @@ -492,8 +492,6 @@ static int saa6588_remove(struct i2c_client *client)
>         v4l2_device_unregister_subdev(sd);
>
>         cancel_delayed_work_sync(&s->work);
> -
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/saa6752hs.c b/drivers/media/i2c/saa6752hs.=
c
> index a7f043cad149..5928cc6f4595 100644
> --- a/drivers/media/i2c/saa6752hs.c
> +++ b/drivers/media/i2c/saa6752hs.c
> @@ -764,13 +764,12 @@ static int saa6752hs_probe(struct i2c_client *clien=
t,
>         return 0;
>  }
>
> -static int saa6752hs_remove(struct i2c_client *client)
> +static void saa6752hs_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(&to_state(sd)->hdl);
> -       return 0;
>  }
>
>  static const struct i2c_device_id saa6752hs_id[] =3D {
> diff --git a/drivers/media/i2c/saa7110.c b/drivers/media/i2c/saa7110.c
> index 0c7a9ce0a693..5067525d8b11 100644
> --- a/drivers/media/i2c/saa7110.c
> +++ b/drivers/media/i2c/saa7110.c
> @@ -428,14 +428,13 @@ static int saa7110_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int saa7110_remove(struct i2c_client *client)
> +static void saa7110_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct saa7110 *decoder =3D to_saa7110(sd);
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(&decoder->hdl);
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
> index 15ff80e6301e..86e70a980218 100644
> --- a/drivers/media/i2c/saa7115.c
> +++ b/drivers/media/i2c/saa7115.c
> @@ -1927,13 +1927,12 @@ static int saa711x_probe(struct i2c_client *clien=
t,
>
>  /* ---------------------------------------------------------------------=
-- */
>
> -static int saa711x_remove(struct i2c_client *client)
> +static void saa711x_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
> -       return 0;
>  }
>
>  static const struct i2c_device_id saa711x_id[] =3D {
> diff --git a/drivers/media/i2c/saa7127.c b/drivers/media/i2c/saa7127.c
> index 891192f6412a..78c9388c2ea1 100644
> --- a/drivers/media/i2c/saa7127.c
> +++ b/drivers/media/i2c/saa7127.c
> @@ -785,14 +785,13 @@ static int saa7127_probe(struct i2c_client *client,
>
>  /* ---------------------------------------------------------------------=
-- */
>
> -static int saa7127_remove(struct i2c_client *client)
> +static void saa7127_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
>         /* Turn off TV output */
>         saa7127_set_video_enable(sd, 0);
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/saa717x.c b/drivers/media/i2c/saa717x.c
> index adf905360171..4f3d1b432a4e 100644
> --- a/drivers/media/i2c/saa717x.c
> +++ b/drivers/media/i2c/saa717x.c
> @@ -1324,13 +1324,12 @@ static int saa717x_probe(struct i2c_client *clien=
t,
>         return 0;
>  }
>
> -static int saa717x_remove(struct i2c_client *client)
> +static void saa717x_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/saa7185.c b/drivers/media/i2c/saa7185.c
> index 7a04422df8c8..266462325d30 100644
> --- a/drivers/media/i2c/saa7185.c
> +++ b/drivers/media/i2c/saa7185.c
> @@ -322,7 +322,7 @@ static int saa7185_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int saa7185_remove(struct i2c_client *client)
> +static void saa7185_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct saa7185 *encoder =3D to_saa7185(sd);
> @@ -330,7 +330,6 @@ static int saa7185_remove(struct i2c_client *client)
>         v4l2_device_unregister_subdev(sd);
>         /* SW: output off is active */
>         saa7185_write(sd, 0x61, (encoder->reg[0x61]) | 0x40);
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/sony-btf-mpx.c b/drivers/media/i2c/sony-bt=
f-mpx.c
> index ad239280c42e..927a9ec41463 100644
> --- a/drivers/media/i2c/sony-btf-mpx.c
> +++ b/drivers/media/i2c/sony-btf-mpx.c
> @@ -357,13 +357,11 @@ static int sony_btf_mpx_probe(struct i2c_client *cl=
ient,
>         return 0;
>  }
>
> -static int sony_btf_mpx_remove(struct i2c_client *client)
> +static void sony_btf_mpx_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
> -
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/sr030pc30.c b/drivers/media/i2c/sr030pc30.=
c
> index 19c0252df2f1..ff18693beb5c 100644
> --- a/drivers/media/i2c/sr030pc30.c
> +++ b/drivers/media/i2c/sr030pc30.c
> @@ -732,13 +732,12 @@ static int sr030pc30_probe(struct i2c_client *clien=
t,
>         return 0;
>  }
>
> -static int sr030pc30_remove(struct i2c_client *client)
> +static void sr030pc30_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
> -       return 0;
>  }
>
>  static const struct i2c_device_id sr030pc30_id[] =3D {
> diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid0=
2.c
> index ef976d085d72..0389223a61f7 100644
> --- a/drivers/media/i2c/st-mipid02.c
> +++ b/drivers/media/i2c/st-mipid02.c
> @@ -1041,7 +1041,7 @@ static int mipid02_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int mipid02_remove(struct i2c_client *client)
> +static void mipid02_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct mipid02_dev *bridge =3D to_mipid02_dev(sd);
> @@ -1052,8 +1052,6 @@ static int mipid02_remove(struct i2c_client *client=
)
>         mipid02_set_power_off(bridge);
>         media_entity_cleanup(&bridge->sd.entity);
>         mutex_destroy(&bridge->lock);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id mipid02_dt_ids[] =3D {
> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> index e18b8947ad7e..d99eedbdf011 100644
> --- a/drivers/media/i2c/tc358743.c
> +++ b/drivers/media/i2c/tc358743.c
> @@ -2169,7 +2169,7 @@ static int tc358743_probe(struct i2c_client *client=
)
>         return err;
>  }
>
> -static int tc358743_remove(struct i2c_client *client)
> +static void tc358743_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct tc358743_state *state =3D to_state(sd);
> @@ -2185,8 +2185,6 @@ static int tc358743_remove(struct i2c_client *clien=
t)
>         mutex_destroy(&state->confctl_mutex);
>         media_entity_cleanup(&sd->entity);
>         v4l2_ctrl_handler_free(&state->hdl);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id tc358743_id[] =3D {
> diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
> index 8fafce26d62f..47d60f9a656f 100644
> --- a/drivers/media/i2c/tda1997x.c
> +++ b/drivers/media/i2c/tda1997x.c
> @@ -2805,7 +2805,7 @@ static int tda1997x_probe(struct i2c_client *client=
,
>         return ret;
>  }
>
> -static int tda1997x_remove(struct i2c_client *client)
> +static void tda1997x_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct tda1997x_state *state =3D to_state(sd);
> @@ -2827,8 +2827,6 @@ static int tda1997x_remove(struct i2c_client *clien=
t)
>         mutex_destroy(&state->lock);
>
>         kfree(state);
> -
> -       return 0;
>  }
>
>  static struct i2c_driver tda1997x_i2c_driver =3D {
> diff --git a/drivers/media/i2c/tda7432.c b/drivers/media/i2c/tda7432.c
> index cbdc9be0a597..11e918311b13 100644
> --- a/drivers/media/i2c/tda7432.c
> +++ b/drivers/media/i2c/tda7432.c
> @@ -390,7 +390,7 @@ static int tda7432_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int tda7432_remove(struct i2c_client *client)
> +static void tda7432_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct tda7432 *t =3D to_state(sd);
> @@ -398,7 +398,6 @@ static int tda7432_remove(struct i2c_client *client)
>         tda7432_set(sd);
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(&t->hdl);
> -       return 0;
>  }
>
>  static const struct i2c_device_id tda7432_id[] =3D {
> diff --git a/drivers/media/i2c/tda9840.c b/drivers/media/i2c/tda9840.c
> index 8c6dfe746b20..aaa74944fc7c 100644
> --- a/drivers/media/i2c/tda9840.c
> +++ b/drivers/media/i2c/tda9840.c
> @@ -175,12 +175,11 @@ static int tda9840_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int tda9840_remove(struct i2c_client *client)
> +static void tda9840_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
> -       return 0;
>  }
>
>  static const struct i2c_device_id tda9840_id[] =3D {
> diff --git a/drivers/media/i2c/tea6415c.c b/drivers/media/i2c/tea6415c.c
> index 67378dbcc74b..50e74314f315 100644
> --- a/drivers/media/i2c/tea6415c.c
> +++ b/drivers/media/i2c/tea6415c.c
> @@ -134,12 +134,11 @@ static int tea6415c_probe(struct i2c_client *client=
,
>         return 0;
>  }
>
> -static int tea6415c_remove(struct i2c_client *client)
> +static void tea6415c_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
> -       return 0;
>  }
>
>  static const struct i2c_device_id tea6415c_id[] =3D {
> diff --git a/drivers/media/i2c/tea6420.c b/drivers/media/i2c/tea6420.c
> index 712141b261ed..246f2b10ccc7 100644
> --- a/drivers/media/i2c/tea6420.c
> +++ b/drivers/media/i2c/tea6420.c
> @@ -116,12 +116,11 @@ static int tea6420_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int tea6420_remove(struct i2c_client *client)
> +static void tea6420_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
> -       return 0;
>  }
>
>  static const struct i2c_device_id tea6420_id[] =3D {
> diff --git a/drivers/media/i2c/ths7303.c b/drivers/media/i2c/ths7303.c
> index 8206bf7a5a8f..2a0f9a3d1a66 100644
> --- a/drivers/media/i2c/ths7303.c
> +++ b/drivers/media/i2c/ths7303.c
> @@ -358,13 +358,11 @@ static int ths7303_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int ths7303_remove(struct i2c_client *client)
> +static void ths7303_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ths7303_id[] =3D {
> diff --git a/drivers/media/i2c/ths8200.c b/drivers/media/i2c/ths8200.c
> index c52fe84cba1b..081ef5a4b950 100644
> --- a/drivers/media/i2c/ths8200.c
> +++ b/drivers/media/i2c/ths8200.c
> @@ -468,7 +468,7 @@ static int ths8200_probe(struct i2c_client *client)
>         return 0;
>  }
>
> -static int ths8200_remove(struct i2c_client *client)
> +static void ths8200_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ths8200_state *decoder =3D to_state(sd);
> @@ -478,8 +478,6 @@ static int ths8200_remove(struct i2c_client *client)
>
>         ths8200_s_power(sd, false);
>         v4l2_async_unregister_subdev(&decoder->sd);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ths8200_id[] =3D {
> diff --git a/drivers/media/i2c/tlv320aic23b.c b/drivers/media/i2c/tlv320a=
ic23b.c
> index e4c21990fea9..937fa1dbaecb 100644
> --- a/drivers/media/i2c/tlv320aic23b.c
> +++ b/drivers/media/i2c/tlv320aic23b.c
> @@ -177,14 +177,13 @@ static int tlv320aic23b_probe(struct i2c_client *cl=
ient,
>         return 0;
>  }
>
> -static int tlv320aic23b_remove(struct i2c_client *client)
> +static void tlv320aic23b_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct tlv320aic23b_state *state =3D to_state(sd);
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(&state->hdl);
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/tvaudio.c b/drivers/media/i2c/tvaudio.c
> index e6796e94dadf..9f1ed078b661 100644
> --- a/drivers/media/i2c/tvaudio.c
> +++ b/drivers/media/i2c/tvaudio.c
> @@ -2065,7 +2065,7 @@ static int tvaudio_probe(struct i2c_client *client,=
 const struct i2c_device_id *
>         return 0;
>  }
>
> -static int tvaudio_remove(struct i2c_client *client)
> +static void tvaudio_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct CHIPSTATE *chip =3D to_state(sd);
> @@ -2079,7 +2079,6 @@ static int tvaudio_remove(struct i2c_client *client=
)
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(&chip->hdl);
> -       return 0;
>  }
>
>  /* This driver supports many devices and the idea is to let the driver
> diff --git a/drivers/media/i2c/tvp514x.c b/drivers/media/i2c/tvp514x.c
> index cee60f945036..a746d96875f9 100644
> --- a/drivers/media/i2c/tvp514x.c
> +++ b/drivers/media/i2c/tvp514x.c
> @@ -1121,7 +1121,7 @@ tvp514x_probe(struct i2c_client *client, const stru=
ct i2c_device_id *id)
>   * Unregister decoder as an i2c client device and V4L2
>   * device. Complement of tvp514x_probe().
>   */
> -static int tvp514x_remove(struct i2c_client *client)
> +static void tvp514x_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct tvp514x_decoder *decoder =3D to_decoder(sd);
> @@ -1129,7 +1129,6 @@ static int tvp514x_remove(struct i2c_client *client=
)
>         v4l2_async_unregister_subdev(&decoder->sd);
>         media_entity_cleanup(&decoder->sd.entity);
>         v4l2_ctrl_handler_free(&decoder->hdl);
> -       return 0;
>  }
>  /* TVP5146 Init/Power on Sequence */
>  static const struct tvp514x_reg tvp5146_init_reg_seq[] =3D {
> diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> index 65472438444b..de21e67c0709 100644
> --- a/drivers/media/i2c/tvp5150.c
> +++ b/drivers/media/i2c/tvp5150.c
> @@ -2230,7 +2230,7 @@ static int tvp5150_probe(struct i2c_client *c)
>         return res;
>  }
>
> -static int tvp5150_remove(struct i2c_client *c)
> +static void tvp5150_remove(struct i2c_client *c)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(c);
>         struct tvp5150 *decoder =3D to_tvp5150(sd);
> @@ -2250,8 +2250,6 @@ static int tvp5150_remove(struct i2c_client *c)
>         v4l2_ctrl_handler_free(&decoder->hdl);
>         pm_runtime_disable(&c->dev);
>         pm_runtime_set_suspended(&c->dev);
> -
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
> index 2de18833b07b..4ccd218f5584 100644
> --- a/drivers/media/i2c/tvp7002.c
> +++ b/drivers/media/i2c/tvp7002.c
> @@ -1044,7 +1044,7 @@ static int tvp7002_probe(struct i2c_client *c)
>   * Reset the TVP7002 device
>   * Returns zero.
>   */
> -static int tvp7002_remove(struct i2c_client *c)
> +static void tvp7002_remove(struct i2c_client *c)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(c);
>         struct tvp7002 *device =3D to_tvp7002(sd);
> @@ -1056,7 +1056,6 @@ static int tvp7002_remove(struct i2c_client *c)
>         media_entity_cleanup(&device->sd.entity);
>  #endif
>         v4l2_ctrl_handler_free(&device->hdl);
> -       return 0;
>  }
>
>  /* I2C Device ID table */
> diff --git a/drivers/media/i2c/tw2804.c b/drivers/media/i2c/tw2804.c
> index cd05f1ff504d..c7c8dfe8a8a8 100644
> --- a/drivers/media/i2c/tw2804.c
> +++ b/drivers/media/i2c/tw2804.c
> @@ -405,14 +405,13 @@ static int tw2804_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int tw2804_remove(struct i2c_client *client)
> +static void tw2804_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct tw2804 *state =3D to_state(sd);
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(&state->hdl);
> -       return 0;
>  }
>
>  static const struct i2c_device_id tw2804_id[] =3D {
> diff --git a/drivers/media/i2c/tw9903.c b/drivers/media/i2c/tw9903.c
> index f8e3ab4909d8..d7eef7986b75 100644
> --- a/drivers/media/i2c/tw9903.c
> +++ b/drivers/media/i2c/tw9903.c
> @@ -235,13 +235,12 @@ static int tw9903_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int tw9903_remove(struct i2c_client *client)
> +static void tw9903_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(&to_state(sd)->hdl);
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/tw9906.c b/drivers/media/i2c/tw9906.c
> index c528eb01fed0..549ad8f72f12 100644
> --- a/drivers/media/i2c/tw9906.c
> +++ b/drivers/media/i2c/tw9906.c
> @@ -203,13 +203,12 @@ static int tw9906_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int tw9906_remove(struct i2c_client *client)
> +static void tw9906_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(&to_state(sd)->hdl);
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/tw9910.c b/drivers/media/i2c/tw9910.c
> index 09f5b3986928..853b5acead32 100644
> --- a/drivers/media/i2c/tw9910.c
> +++ b/drivers/media/i2c/tw9910.c
> @@ -993,7 +993,7 @@ static int tw9910_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int tw9910_remove(struct i2c_client *client)
> +static void tw9910_remove(struct i2c_client *client)
>  {
>         struct tw9910_priv *priv =3D to_tw9910(client);
>
> @@ -1001,8 +1001,6 @@ static int tw9910_remove(struct i2c_client *client)
>                 gpiod_put(priv->pdn_gpio);
>         clk_put(priv->clk);
>         v4l2_async_unregister_subdev(&priv->subdev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id tw9910_id[] =3D {
> diff --git a/drivers/media/i2c/uda1342.c b/drivers/media/i2c/uda1342.c
> index b0a9c6d7163f..d0659c4392f2 100644
> --- a/drivers/media/i2c/uda1342.c
> +++ b/drivers/media/i2c/uda1342.c
> @@ -72,12 +72,11 @@ static int uda1342_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int uda1342_remove(struct i2c_client *client)
> +static void uda1342_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
> -       return 0;
>  }
>
>  static const struct i2c_device_id uda1342_id[] =3D {
> diff --git a/drivers/media/i2c/upd64031a.c b/drivers/media/i2c/upd64031a.=
c
> index ef35c6574785..4de26ed2ba00 100644
> --- a/drivers/media/i2c/upd64031a.c
> +++ b/drivers/media/i2c/upd64031a.c
> @@ -210,12 +210,11 @@ static int upd64031a_probe(struct i2c_client *clien=
t,
>         return 0;
>  }
>
> -static int upd64031a_remove(struct i2c_client *client)
> +static void upd64031a_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/upd64083.c b/drivers/media/i2c/upd64083.c
> index d6a1698caa2a..2bfd5443d406 100644
> --- a/drivers/media/i2c/upd64083.c
> +++ b/drivers/media/i2c/upd64083.c
> @@ -181,12 +181,11 @@ static int upd64083_probe(struct i2c_client *client=
,
>         return 0;
>  }
>
> -static int upd64083_remove(struct i2c_client *client)
> +static void upd64083_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.=
c
> index e08e3579c0a1..f15ef2d13059 100644
> --- a/drivers/media/i2c/video-i2c.c
> +++ b/drivers/media/i2c/video-i2c.c
> @@ -895,7 +895,7 @@ static int video_i2c_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int video_i2c_remove(struct i2c_client *client)
> +static void video_i2c_remove(struct i2c_client *client)
>  {
>         struct video_i2c_data *data =3D i2c_get_clientdata(client);
>
> @@ -908,8 +908,6 @@ static int video_i2c_remove(struct i2c_client *client=
)
>                 data->chip->set_power(data, false);
>
>         video_unregister_device(&data->vdev);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM
> diff --git a/drivers/media/i2c/vp27smpx.c b/drivers/media/i2c/vp27smpx.c
> index 492af8749fca..c832edad5fa7 100644
> --- a/drivers/media/i2c/vp27smpx.c
> +++ b/drivers/media/i2c/vp27smpx.c
> @@ -163,12 +163,11 @@ static int vp27smpx_probe(struct i2c_client *client=
,
>         return 0;
>  }
>
> -static int vp27smpx_remove(struct i2c_client *client)
> +static void vp27smpx_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
> -       return 0;
>  }
>
>  /* ---------------------------------------------------------------------=
-- */
> diff --git a/drivers/media/i2c/vpx3220.c b/drivers/media/i2c/vpx3220.c
> index 8be03fe5928c..b481ec196b88 100644
> --- a/drivers/media/i2c/vpx3220.c
> +++ b/drivers/media/i2c/vpx3220.c
> @@ -526,15 +526,13 @@ static int vpx3220_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int vpx3220_remove(struct i2c_client *client)
> +static void vpx3220_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct vpx3220 *decoder =3D to_vpx3220(sd);
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(&decoder->hdl);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id vpx3220_id[] =3D {
> diff --git a/drivers/media/i2c/vs6624.c b/drivers/media/i2c/vs6624.c
> index 29003dec6f2d..d496bb45f201 100644
> --- a/drivers/media/i2c/vs6624.c
> +++ b/drivers/media/i2c/vs6624.c
> @@ -824,13 +824,12 @@ static int vs6624_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int vs6624_remove(struct i2c_client *client)
> +static void vs6624_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
> -       return 0;
>  }
>
>  static const struct i2c_device_id vs6624_id[] =3D {
> diff --git a/drivers/media/i2c/wm8739.c b/drivers/media/i2c/wm8739.c
> index ed533834db54..180b35347521 100644
> --- a/drivers/media/i2c/wm8739.c
> +++ b/drivers/media/i2c/wm8739.c
> @@ -234,14 +234,13 @@ static int wm8739_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int wm8739_remove(struct i2c_client *client)
> +static void wm8739_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct wm8739_state *state =3D to_state(sd);
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(&state->hdl);
> -       return 0;
>  }
>
>  static const struct i2c_device_id wm8739_id[] =3D {
> diff --git a/drivers/media/i2c/wm8775.c b/drivers/media/i2c/wm8775.c
> index d4c83c39892a..8ff97867d3cd 100644
> --- a/drivers/media/i2c/wm8775.c
> +++ b/drivers/media/i2c/wm8775.c
> @@ -280,14 +280,13 @@ static int wm8775_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int wm8775_remove(struct i2c_client *client)
> +static void wm8775_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct wm8775_state *state =3D to_state(sd);
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(&state->hdl);
> -       return 0;
>  }
>
>  static const struct i2c_device_id wm8775_id[] =3D {
> diff --git a/drivers/media/radio/radio-tea5764.c b/drivers/media/radio/ra=
dio-tea5764.c
> index 877a24e5c577..abda40e81612 100644
> --- a/drivers/media/radio/radio-tea5764.c
> +++ b/drivers/media/radio/radio-tea5764.c
> @@ -487,7 +487,7 @@ static int tea5764_i2c_probe(struct i2c_client *clien=
t,
>         return ret;
>  }
>
> -static int tea5764_i2c_remove(struct i2c_client *client)
> +static void tea5764_i2c_remove(struct i2c_client *client)
>  {
>         struct tea5764_device *radio =3D i2c_get_clientdata(client);
>
> @@ -499,7 +499,6 @@ static int tea5764_i2c_remove(struct i2c_client *clie=
nt)
>                 v4l2_device_unregister(&radio->v4l2_dev);
>                 kfree(radio);
>         }
> -       return 0;
>  }
>
>  /* I2C subsystem interface */
> diff --git a/drivers/media/radio/saa7706h.c b/drivers/media/radio/saa7706=
h.c
> index adb66f869dd2..f9e990a9c3ef 100644
> --- a/drivers/media/radio/saa7706h.c
> +++ b/drivers/media/radio/saa7706h.c
> @@ -384,7 +384,7 @@ static int saa7706h_probe(struct i2c_client *client,
>         return err;
>  }
>
> -static int saa7706h_remove(struct i2c_client *client)
> +static void saa7706h_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct saa7706h_state *state =3D to_state(sd);
> @@ -393,7 +393,6 @@ static int saa7706h_remove(struct i2c_client *client)
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(&state->hdl);
>         kfree(to_state(sd));
> -       return 0;
>  }
>
>  static const struct i2c_device_id saa7706h_id[] =3D {
> diff --git a/drivers/media/radio/si470x/radio-si470x-i2c.c b/drivers/medi=
a/radio/si470x/radio-si470x-i2c.c
> index 59b3d77e282d..a6ad926c2b4e 100644
> --- a/drivers/media/radio/si470x/radio-si470x-i2c.c
> +++ b/drivers/media/radio/si470x/radio-si470x-i2c.c
> @@ -461,7 +461,7 @@ static int si470x_i2c_probe(struct i2c_client *client=
)
>  /*
>   * si470x_i2c_remove - remove the device
>   */
> -static int si470x_i2c_remove(struct i2c_client *client)
> +static void si470x_i2c_remove(struct i2c_client *client)
>  {
>         struct si470x_device *radio =3D i2c_get_clientdata(client);
>
> @@ -472,7 +472,6 @@ static int si470x_i2c_remove(struct i2c_client *clien=
t)
>
>         v4l2_ctrl_handler_free(&radio->hdl);
>         v4l2_device_unregister(&radio->v4l2_dev);
> -       return 0;
>  }
>
>
> diff --git a/drivers/media/radio/si4713/si4713.c b/drivers/media/radio/si=
4713/si4713.c
> index adbf43ff6a21..2aec642133a1 100644
> --- a/drivers/media/radio/si4713/si4713.c
> +++ b/drivers/media/radio/si4713/si4713.c
> @@ -1623,7 +1623,7 @@ static int si4713_probe(struct i2c_client *client)
>  }
>
>  /* si4713_remove - remove the device */
> -static int si4713_remove(struct i2c_client *client)
> +static void si4713_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct si4713_device *sdev =3D to_si4713_device(sd);
> @@ -1635,8 +1635,6 @@ static int si4713_remove(struct i2c_client *client)
>
>         v4l2_device_unregister_subdev(sd);
>         v4l2_ctrl_handler_free(sd->ctrl_handler);
> -
> -       return 0;
>  }
>
>  /* si4713_i2c_driver - i2c driver interface */
> diff --git a/drivers/media/radio/tef6862.c b/drivers/media/radio/tef6862.=
c
> index d8810492db4f..7b0870a9785b 100644
> --- a/drivers/media/radio/tef6862.c
> +++ b/drivers/media/radio/tef6862.c
> @@ -165,13 +165,12 @@ static int tef6862_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int tef6862_remove(struct i2c_client *client)
> +static void tef6862_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>
>         v4l2_device_unregister_subdev(sd);
>         kfree(to_state(sd));
> -       return 0;
>  }
>
>  static const struct i2c_device_id tef6862_id[] =3D {
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/med=
ia/test-drivers/vidtv/vidtv_demod.c
> index b7823d97b30d..e7959ab1add8 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_demod.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
> @@ -438,13 +438,11 @@ static int vidtv_demod_i2c_probe(struct i2c_client =
*client,
>         return 0;
>  }
>
> -static int vidtv_demod_i2c_remove(struct i2c_client *client)
> +static void vidtv_demod_i2c_remove(struct i2c_client *client)
>  {
>         struct vidtv_demod_state *state =3D i2c_get_clientdata(client);
>
>         kfree(state);
> -
> -       return 0;
>  }
>
>  static struct i2c_driver vidtv_demod_i2c_driver =3D {
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_tuner.c b/drivers/med=
ia/test-drivers/vidtv/vidtv_tuner.c
> index 14b6bc902ee1..aabc97ed736b 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_tuner.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
> @@ -414,13 +414,11 @@ static int vidtv_tuner_i2c_probe(struct i2c_client =
*client,
>         return 0;
>  }
>
> -static int vidtv_tuner_i2c_remove(struct i2c_client *client)
> +static void vidtv_tuner_i2c_remove(struct i2c_client *client)
>  {
>         struct vidtv_tuner_dev *tuner_dev =3D i2c_get_clientdata(client);
>
>         kfree(tuner_dev);
> -
> -       return 0;
>  }
>
>  static struct i2c_driver vidtv_tuner_i2c_driver =3D {
> diff --git a/drivers/media/tuners/e4000.c b/drivers/media/tuners/e4000.c
> index a3a8d051dc6c..61ae884ea59a 100644
> --- a/drivers/media/tuners/e4000.c
> +++ b/drivers/media/tuners/e4000.c
> @@ -706,7 +706,7 @@ static int e4000_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int e4000_remove(struct i2c_client *client)
> +static void e4000_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct e4000_dev *dev =3D container_of(sd, struct e4000_dev, sd);
> @@ -717,8 +717,6 @@ static int e4000_remove(struct i2c_client *client)
>         v4l2_ctrl_handler_free(&dev->hdl);
>  #endif
>         kfree(dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id e4000_id_table[] =3D {
> diff --git a/drivers/media/tuners/fc2580.c b/drivers/media/tuners/fc2580.=
c
> index 1b5961bdf2d5..f30932e1a0f3 100644
> --- a/drivers/media/tuners/fc2580.c
> +++ b/drivers/media/tuners/fc2580.c
> @@ -588,7 +588,7 @@ static int fc2580_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int fc2580_remove(struct i2c_client *client)
> +static void fc2580_remove(struct i2c_client *client)
>  {
>         struct fc2580_dev *dev =3D i2c_get_clientdata(client);
>
> @@ -598,7 +598,6 @@ static int fc2580_remove(struct i2c_client *client)
>         v4l2_ctrl_handler_free(&dev->hdl);
>  #endif
>         kfree(dev);
> -       return 0;
>  }
>
>  static const struct i2c_device_id fc2580_id_table[] =3D {
> diff --git a/drivers/media/tuners/m88rs6000t.c b/drivers/media/tuners/m88=
rs6000t.c
> index 8647c50b66e5..e32e3e9daa15 100644
> --- a/drivers/media/tuners/m88rs6000t.c
> +++ b/drivers/media/tuners/m88rs6000t.c
> @@ -697,7 +697,7 @@ static int m88rs6000t_probe(struct i2c_client *client=
,
>         return ret;
>  }
>
> -static int m88rs6000t_remove(struct i2c_client *client)
> +static void m88rs6000t_remove(struct i2c_client *client)
>  {
>         struct m88rs6000t_dev *dev =3D i2c_get_clientdata(client);
>         struct dvb_frontend *fe =3D dev->cfg.fe;
> @@ -707,8 +707,6 @@ static int m88rs6000t_remove(struct i2c_client *clien=
t)
>         memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
>         fe->tuner_priv =3D NULL;
>         kfree(dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id m88rs6000t_id[] =3D {
> diff --git a/drivers/media/tuners/mt2060.c b/drivers/media/tuners/mt2060.=
c
> index 204e6186bf71..322c806228a5 100644
> --- a/drivers/media/tuners/mt2060.c
> +++ b/drivers/media/tuners/mt2060.c
> @@ -509,11 +509,9 @@ static int mt2060_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int mt2060_remove(struct i2c_client *client)
> +static void mt2060_remove(struct i2c_client *client)
>  {
>         dev_dbg(&client->dev, "\n");
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id mt2060_id_table[] =3D {
> diff --git a/drivers/media/tuners/mxl301rf.c b/drivers/media/tuners/mxl30=
1rf.c
> index c628435a1b06..6422056185a9 100644
> --- a/drivers/media/tuners/mxl301rf.c
> +++ b/drivers/media/tuners/mxl301rf.c
> @@ -307,14 +307,13 @@ static int mxl301rf_probe(struct i2c_client *client=
,
>         return 0;
>  }
>
> -static int mxl301rf_remove(struct i2c_client *client)
> +static void mxl301rf_remove(struct i2c_client *client)
>  {
>         struct mxl301rf_state *state;
>
>         state =3D cfg_to_state(i2c_get_clientdata(client));
>         state->cfg.fe->tuner_priv =3D NULL;
>         kfree(state);
> -       return 0;
>  }
>
>
> diff --git a/drivers/media/tuners/qm1d1b0004.c b/drivers/media/tuners/qm1=
d1b0004.c
> index 008ad870c00f..9cba0893207c 100644
> --- a/drivers/media/tuners/qm1d1b0004.c
> +++ b/drivers/media/tuners/qm1d1b0004.c
> @@ -232,14 +232,13 @@ qm1d1b0004_probe(struct i2c_client *client, const s=
truct i2c_device_id *id)
>         return ret;
>  }
>
> -static int qm1d1b0004_remove(struct i2c_client *client)
> +static void qm1d1b0004_remove(struct i2c_client *client)
>  {
>         struct dvb_frontend *fe;
>
>         fe =3D i2c_get_clientdata(client);
>         kfree(fe->tuner_priv);
>         fe->tuner_priv =3D NULL;
> -       return 0;
>  }
>
>
> diff --git a/drivers/media/tuners/qm1d1c0042.c b/drivers/media/tuners/qm1=
d1c0042.c
> index 53aa2558f71e..2d60bf501fb5 100644
> --- a/drivers/media/tuners/qm1d1c0042.c
> +++ b/drivers/media/tuners/qm1d1c0042.c
> @@ -424,14 +424,13 @@ static int qm1d1c0042_probe(struct i2c_client *clie=
nt,
>         return 0;
>  }
>
> -static int qm1d1c0042_remove(struct i2c_client *client)
> +static void qm1d1c0042_remove(struct i2c_client *client)
>  {
>         struct qm1d1c0042_state *state;
>
>         state =3D cfg_to_state(i2c_get_clientdata(client));
>         state->cfg.fe->tuner_priv =3D NULL;
>         kfree(state);
> -       return 0;
>  }
>
>
> diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.=
c
> index 0de587b412d4..476b32c04c20 100644
> --- a/drivers/media/tuners/si2157.c
> +++ b/drivers/media/tuners/si2157.c
> @@ -951,7 +951,7 @@ static int si2157_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int si2157_remove(struct i2c_client *client)
> +static void si2157_remove(struct i2c_client *client)
>  {
>         struct si2157_dev *dev =3D i2c_get_clientdata(client);
>         struct dvb_frontend *fe =3D dev->fe;
> @@ -969,8 +969,6 @@ static int si2157_remove(struct i2c_client *client)
>         memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
>         fe->tuner_priv =3D NULL;
>         kfree(dev);
> -
> -       return 0;
>  }
>
>  /*
> diff --git a/drivers/media/tuners/tda18212.c b/drivers/media/tuners/tda18=
212.c
> index bf48f1cd83d2..eb97711c9c68 100644
> --- a/drivers/media/tuners/tda18212.c
> +++ b/drivers/media/tuners/tda18212.c
> @@ -242,7 +242,7 @@ static int tda18212_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int tda18212_remove(struct i2c_client *client)
> +static void tda18212_remove(struct i2c_client *client)
>  {
>         struct tda18212_dev *dev =3D i2c_get_clientdata(client);
>         struct dvb_frontend *fe =3D dev->cfg.fe;
> @@ -252,8 +252,6 @@ static int tda18212_remove(struct i2c_client *client)
>         memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
>         fe->tuner_priv =3D NULL;
>         kfree(dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id tda18212_id[] =3D {
> diff --git a/drivers/media/tuners/tda18250.c b/drivers/media/tuners/tda18=
250.c
> index 8a5781b966ee..e404a5afad4c 100644
> --- a/drivers/media/tuners/tda18250.c
> +++ b/drivers/media/tuners/tda18250.c
> @@ -856,7 +856,7 @@ static int tda18250_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int tda18250_remove(struct i2c_client *client)
> +static void tda18250_remove(struct i2c_client *client)
>  {
>         struct tda18250_dev *dev =3D i2c_get_clientdata(client);
>         struct dvb_frontend *fe =3D dev->fe;
> @@ -866,8 +866,6 @@ static int tda18250_remove(struct i2c_client *client)
>         memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
>         fe->tuner_priv =3D NULL;
>         kfree(dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id tda18250_id_table[] =3D {
> diff --git a/drivers/media/tuners/tua9001.c b/drivers/media/tuners/tua900=
1.c
> index af7d5ea1f77e..d141d000b819 100644
> --- a/drivers/media/tuners/tua9001.c
> +++ b/drivers/media/tuners/tua9001.c
> @@ -227,7 +227,7 @@ static int tua9001_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int tua9001_remove(struct i2c_client *client)
> +static void tua9001_remove(struct i2c_client *client)
>  {
>         struct tua9001_dev *dev =3D i2c_get_clientdata(client);
>         struct dvb_frontend *fe =3D dev->fe;
> @@ -243,7 +243,6 @@ static int tua9001_remove(struct i2c_client *client)
>                         dev_err(&client->dev, "Tuner disable failed (%pe)=
\n", ERR_PTR(ret));
>         }
>         kfree(dev);
> -       return 0;
>  }
>
>  static const struct i2c_device_id tua9001_id_table[] =3D {
> diff --git a/drivers/media/usb/go7007/s2250-board.c b/drivers/media/usb/g=
o7007/s2250-board.c
> index 1fa6f10ee157..2f45188bf9d4 100644
> --- a/drivers/media/usb/go7007/s2250-board.c
> +++ b/drivers/media/usb/go7007/s2250-board.c
> @@ -601,7 +601,7 @@ static int s2250_probe(struct i2c_client *client,
>         return err;
>  }
>
> -static int s2250_remove(struct i2c_client *client)
> +static void s2250_remove(struct i2c_client *client)
>  {
>         struct s2250 *state =3D to_state(i2c_get_clientdata(client));
>
> @@ -609,7 +609,6 @@ static int s2250_remove(struct i2c_client *client)
>         v4l2_device_unregister_subdev(&state->sd);
>         v4l2_ctrl_handler_free(&state->hdl);
>         kfree(state);
> -       return 0;
>  }
>
>  static const struct i2c_device_id s2250_id[] =3D {
> diff --git a/drivers/media/v4l2-core/tuner-core.c b/drivers/media/v4l2-co=
re/tuner-core.c
> index 2d47c10de062..33162dc1daf6 100644
> --- a/drivers/media/v4l2-core/tuner-core.c
> +++ b/drivers/media/v4l2-core/tuner-core.c
> @@ -779,7 +779,7 @@ static int tuner_probe(struct i2c_client *client,
>   * @client:    i2c_client descriptor
>   */
>
> -static int tuner_remove(struct i2c_client *client)
> +static void tuner_remove(struct i2c_client *client)
>  {
>         struct tuner *t =3D to_tuner(i2c_get_clientdata(client));
>
> @@ -789,7 +789,6 @@ static int tuner_remove(struct i2c_client *client)
>
>         list_del(&t->list);
>         kfree(t);
> -       return 0;
>  }
>
>  /*
> diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
> index eaf9845633b4..a30e47b74327 100644
> --- a/drivers/mfd/88pm800.c
> +++ b/drivers/mfd/88pm800.c
> @@ -583,7 +583,7 @@ static int pm800_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int pm800_remove(struct i2c_client *client)
> +static void pm800_remove(struct i2c_client *client)
>  {
>         struct pm80x_chip *chip =3D i2c_get_clientdata(client);
>
> @@ -592,8 +592,6 @@ static int pm800_remove(struct i2c_client *client)
>
>         pm800_pages_exit(chip);
>         pm80x_deinit();
> -
> -       return 0;
>  }
>
>  static struct i2c_driver pm800_driver =3D {
> diff --git a/drivers/mfd/88pm805.c b/drivers/mfd/88pm805.c
> index ada6c513302b..10d3637840c8 100644
> --- a/drivers/mfd/88pm805.c
> +++ b/drivers/mfd/88pm805.c
> @@ -239,7 +239,7 @@ static int pm805_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int pm805_remove(struct i2c_client *client)
> +static void pm805_remove(struct i2c_client *client)
>  {
>         struct pm80x_chip *chip =3D i2c_get_clientdata(client);
>
> @@ -247,8 +247,6 @@ static int pm805_remove(struct i2c_client *client)
>         device_irq_exit_805(chip);
>
>         pm80x_deinit();
> -
> -       return 0;
>  }
>
>  static struct i2c_driver pm805_driver =3D {
> diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.c
> index b1e829ea909b..5dc86dd66202 100644
> --- a/drivers/mfd/88pm860x-core.c
> +++ b/drivers/mfd/88pm860x-core.c
> @@ -1201,7 +1201,7 @@ static int pm860x_probe(struct i2c_client *client)
>         return 0;
>  }
>
> -static int pm860x_remove(struct i2c_client *client)
> +static void pm860x_remove(struct i2c_client *client)
>  {
>         struct pm860x_chip *chip =3D i2c_get_clientdata(client);
>
> @@ -1210,7 +1210,6 @@ static int pm860x_remove(struct i2c_client *client)
>                 regmap_exit(chip->regmap_companion);
>                 i2c_unregister_device(chip->companion);
>         }
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/mfd/acer-ec-a500.c b/drivers/mfd/acer-ec-a500.c
> index 80c2fdd14fc4..7fd8b9988075 100644
> --- a/drivers/mfd/acer-ec-a500.c
> +++ b/drivers/mfd/acer-ec-a500.c
> @@ -169,7 +169,7 @@ static int a500_ec_probe(struct i2c_client *client)
>         return 0;
>  }
>
> -static int a500_ec_remove(struct i2c_client *client)
> +static void a500_ec_remove(struct i2c_client *client)
>  {
>         if (of_device_is_system_power_controller(client->dev.of_node)) {
>                 if (pm_power_off =3D=3D a500_ec_poweroff)
> @@ -177,8 +177,6 @@ static int a500_ec_remove(struct i2c_client *client)
>
>                 unregister_restart_handler(&a500_ec_restart_handler);
>         }
> -
> -       return 0;
>  }
>
>  static const struct of_device_id a500_ec_match[] =3D {
> diff --git a/drivers/mfd/arizona-i2c.c b/drivers/mfd/arizona-i2c.c
> index 6d83e6b9a692..bfc7cf56ff2c 100644
> --- a/drivers/mfd/arizona-i2c.c
> +++ b/drivers/mfd/arizona-i2c.c
> @@ -84,13 +84,11 @@ static int arizona_i2c_probe(struct i2c_client *i2c,
>         return arizona_dev_init(arizona);
>  }
>
> -static int arizona_i2c_remove(struct i2c_client *i2c)
> +static void arizona_i2c_remove(struct i2c_client *i2c)
>  {
>         struct arizona *arizona =3D dev_get_drvdata(&i2c->dev);
>
>         arizona_dev_exit(arizona);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id arizona_i2c_id[] =3D {
> diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
> index 00ab48018d8d..8fd6727dc30a 100644
> --- a/drivers/mfd/axp20x-i2c.c
> +++ b/drivers/mfd/axp20x-i2c.c
> @@ -50,13 +50,11 @@ static int axp20x_i2c_probe(struct i2c_client *i2c,
>         return axp20x_device_probe(axp20x);
>  }
>
> -static int axp20x_i2c_remove(struct i2c_client *i2c)
> +static void axp20x_i2c_remove(struct i2c_client *i2c)
>  {
>         struct axp20x_dev *axp20x =3D i2c_get_clientdata(i2c);
>
>         axp20x_device_remove(axp20x);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_OF
> diff --git a/drivers/mfd/da903x.c b/drivers/mfd/da903x.c
> index a818fbb55988..3f8f6ad3a98c 100644
> --- a/drivers/mfd/da903x.c
> +++ b/drivers/mfd/da903x.c
> @@ -532,12 +532,11 @@ static int da903x_probe(struct i2c_client *client,
>         return da903x_add_subdevs(chip, pdata);
>  }
>
> -static int da903x_remove(struct i2c_client *client)
> +static void da903x_remove(struct i2c_client *client)
>  {
>         struct da903x_chip *chip =3D i2c_get_clientdata(client);
>
>         da903x_remove_subdevs(chip);
> -       return 0;
>  }
>
>  static struct i2c_driver da903x_driver =3D {
> diff --git a/drivers/mfd/da9052-i2c.c b/drivers/mfd/da9052-i2c.c
> index 8de93db35f3a..5a74696c8704 100644
> --- a/drivers/mfd/da9052-i2c.c
> +++ b/drivers/mfd/da9052-i2c.c
> @@ -168,12 +168,11 @@ static int da9052_i2c_probe(struct i2c_client *clie=
nt,
>         return da9052_device_init(da9052, id->driver_data);
>  }
>
> -static int da9052_i2c_remove(struct i2c_client *client)
> +static void da9052_i2c_remove(struct i2c_client *client)
>  {
>         struct da9052 *da9052 =3D i2c_get_clientdata(client);
>
>         da9052_device_exit(da9052);
> -       return 0;
>  }
>
>  static struct i2c_driver da9052_i2c_driver =3D {
> diff --git a/drivers/mfd/da9055-i2c.c b/drivers/mfd/da9055-i2c.c
> index bc60433b68db..276c7d1c509e 100644
> --- a/drivers/mfd/da9055-i2c.c
> +++ b/drivers/mfd/da9055-i2c.c
> @@ -41,13 +41,11 @@ static int da9055_i2c_probe(struct i2c_client *i2c,
>         return da9055_device_init(da9055);
>  }
>
> -static int da9055_i2c_remove(struct i2c_client *i2c)
> +static void da9055_i2c_remove(struct i2c_client *i2c)
>  {
>         struct da9055 *da9055 =3D i2c_get_clientdata(i2c);
>
>         da9055_device_exit(da9055);
> -
> -       return 0;
>  }
>
>  /*
> diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
> index 2774b2cbaea6..0a80d82c6858 100644
> --- a/drivers/mfd/da9062-core.c
> +++ b/drivers/mfd/da9062-core.c
> @@ -723,14 +723,12 @@ static int da9062_i2c_probe(struct i2c_client *i2c,
>         return ret;
>  }
>
> -static int da9062_i2c_remove(struct i2c_client *i2c)
> +static void da9062_i2c_remove(struct i2c_client *i2c)
>  {
>         struct da9062 *chip =3D i2c_get_clientdata(i2c);
>
>         mfd_remove_devices(chip->dev);
>         regmap_del_irq_chip(i2c->irq, chip->regmap_irq);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id da9062_i2c_id[] =3D {
> diff --git a/drivers/mfd/da9150-core.c b/drivers/mfd/da9150-core.c
> index 58009c8cb870..6ae56e46d24e 100644
> --- a/drivers/mfd/da9150-core.c
> +++ b/drivers/mfd/da9150-core.c
> @@ -471,15 +471,13 @@ static int da9150_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int da9150_remove(struct i2c_client *client)
> +static void da9150_remove(struct i2c_client *client)
>  {
>         struct da9150 *da9150 =3D i2c_get_clientdata(client);
>
>         regmap_del_irq_chip(da9150->irq, da9150->regmap_irq_data);
>         mfd_remove_devices(da9150->dev);
>         i2c_unregister_device(da9150->core_qif);
> -
> -       return 0;
>  }
>
>  static void da9150_shutdown(struct i2c_client *client)
> diff --git a/drivers/mfd/dm355evm_msp.c b/drivers/mfd/dm355evm_msp.c
> index 54fb6cbd2aa0..759c59690680 100644
> --- a/drivers/mfd/dm355evm_msp.c
> +++ b/drivers/mfd/dm355evm_msp.c
> @@ -375,11 +375,10 @@ static void dm355evm_power_off(void)
>         dm355evm_command(MSP_COMMAND_POWEROFF);
>  }
>
> -static int dm355evm_msp_remove(struct i2c_client *client)
> +static void dm355evm_msp_remove(struct i2c_client *client)
>  {
>         pm_power_off =3D NULL;
>         msp430 =3D NULL;
> -       return 0;
>  }
>
>  static int
> diff --git a/drivers/mfd/ene-kb3930.c b/drivers/mfd/ene-kb3930.c
> index 1b73318d1f1f..3eff98e26bea 100644
> --- a/drivers/mfd/ene-kb3930.c
> +++ b/drivers/mfd/ene-kb3930.c
> @@ -177,7 +177,7 @@ static int kb3930_probe(struct i2c_client *client)
>         return 0;
>  }
>
> -static int kb3930_remove(struct i2c_client *client)
> +static void kb3930_remove(struct i2c_client *client)
>  {
>         struct kb3930 *ddata =3D i2c_get_clientdata(client);
>
> @@ -187,8 +187,6 @@ static int kb3930_remove(struct i2c_client *client)
>                 unregister_restart_handler(&kb3930_restart_nb);
>         }
>         kb3930_power_off =3D NULL;
> -
> -       return 0;
>  }
>
>  static const struct of_device_id kb3930_dt_ids[] =3D {
> diff --git a/drivers/mfd/gateworks-gsc.c b/drivers/mfd/gateworks-gsc.c
> index d87876747b91..9d7d870c44a8 100644
> --- a/drivers/mfd/gateworks-gsc.c
> +++ b/drivers/mfd/gateworks-gsc.c
> @@ -255,11 +255,9 @@ static int gsc_probe(struct i2c_client *client)
>         return 0;
>  }
>
> -static int gsc_remove(struct i2c_client *client)
> +static void gsc_remove(struct i2c_client *client)
>  {
>         sysfs_remove_group(&client->dev.kobj, &attr_group);
> -
> -       return 0;
>  }
>
>  static struct i2c_driver gsc_driver =3D {
> diff --git a/drivers/mfd/intel_soc_pmic_core.c b/drivers/mfd/intel_soc_pm=
ic_core.c
> index 5e8c94e008ed..b824e15f4d22 100644
> --- a/drivers/mfd/intel_soc_pmic_core.c
> +++ b/drivers/mfd/intel_soc_pmic_core.c
> @@ -81,7 +81,7 @@ static int intel_soc_pmic_i2c_probe(struct i2c_client *=
i2c,
>         return ret;
>  }
>
> -static int intel_soc_pmic_i2c_remove(struct i2c_client *i2c)
> +static void intel_soc_pmic_i2c_remove(struct i2c_client *i2c)
>  {
>         struct intel_soc_pmic *pmic =3D dev_get_drvdata(&i2c->dev);
>
> @@ -91,8 +91,6 @@ static int intel_soc_pmic_i2c_remove(struct i2c_client =
*i2c)
>         pwm_remove_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
>
>         mfd_remove_devices(&i2c->dev);
> -
> -       return 0;
>  }
>
>  static void intel_soc_pmic_shutdown(struct i2c_client *i2c)
> diff --git a/drivers/mfd/iqs62x.c b/drivers/mfd/iqs62x.c
> index 575ab67e243d..1895fce25b06 100644
> --- a/drivers/mfd/iqs62x.c
> +++ b/drivers/mfd/iqs62x.c
> @@ -1008,13 +1008,11 @@ static int iqs62x_probe(struct i2c_client *client=
)
>         return ret;
>  }
>
> -static int iqs62x_remove(struct i2c_client *client)
> +static void iqs62x_remove(struct i2c_client *client)
>  {
>         struct iqs62x_core *iqs62x =3D i2c_get_clientdata(client);
>
>         wait_for_completion(&iqs62x->fw_done);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused iqs62x_suspend(struct device *dev)
> diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
> index 5690768f3e63..be32ffc5af38 100644
> --- a/drivers/mfd/lm3533-core.c
> +++ b/drivers/mfd/lm3533-core.c
> @@ -607,15 +607,13 @@ static int lm3533_i2c_probe(struct i2c_client *i2c,
>         return lm3533_device_init(lm3533);
>  }
>
> -static int lm3533_i2c_remove(struct i2c_client *i2c)
> +static void lm3533_i2c_remove(struct i2c_client *i2c)
>  {
>         struct lm3533 *lm3533 =3D i2c_get_clientdata(i2c);
>
>         dev_dbg(&i2c->dev, "%s\n", __func__);
>
>         lm3533_device_exit(lm3533);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id lm3533_i2c_ids[] =3D {
> diff --git a/drivers/mfd/lp8788.c b/drivers/mfd/lp8788.c
> index c223d2c6a363..e7c601bca9ef 100644
> --- a/drivers/mfd/lp8788.c
> +++ b/drivers/mfd/lp8788.c
> @@ -199,13 +199,12 @@ static int lp8788_probe(struct i2c_client *cl, cons=
t struct i2c_device_id *id)
>                                ARRAY_SIZE(lp8788_devs), NULL, 0, NULL);
>  }
>
> -static int lp8788_remove(struct i2c_client *cl)
> +static void lp8788_remove(struct i2c_client *cl)
>  {
>         struct lp8788 *lp =3D i2c_get_clientdata(cl);
>
>         mfd_remove_devices(lp->dev);
>         lp8788_irq_exit(lp);
> -       return 0;
>  }
>
>  static const struct i2c_device_id lp8788_ids[] =3D {
> diff --git a/drivers/mfd/madera-i2c.c b/drivers/mfd/madera-i2c.c
> index 7df5b9ba5855..915d2f95bad3 100644
> --- a/drivers/mfd/madera-i2c.c
> +++ b/drivers/mfd/madera-i2c.c
> @@ -112,13 +112,11 @@ static int madera_i2c_probe(struct i2c_client *i2c,
>         return madera_dev_init(madera);
>  }
>
> -static int madera_i2c_remove(struct i2c_client *i2c)
> +static void madera_i2c_remove(struct i2c_client *i2c)
>  {
>         struct madera *madera =3D dev_get_drvdata(&i2c->dev);
>
>         madera_dev_exit(madera);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id madera_i2c_id[] =3D {
> diff --git a/drivers/mfd/max14577.c b/drivers/mfd/max14577.c
> index 6c487fa14e9c..d44ad6f33742 100644
> --- a/drivers/mfd/max14577.c
> +++ b/drivers/mfd/max14577.c
> @@ -463,7 +463,7 @@ static int max14577_i2c_probe(struct i2c_client *i2c,
>         return ret;
>  }
>
> -static int max14577_i2c_remove(struct i2c_client *i2c)
> +static void max14577_i2c_remove(struct i2c_client *i2c)
>  {
>         struct max14577 *max14577 =3D i2c_get_clientdata(i2c);
>
> @@ -471,8 +471,6 @@ static int max14577_i2c_remove(struct i2c_client *i2c=
)
>         regmap_del_irq_chip(max14577->irq, max14577->irq_data);
>         if (max14577->dev_type =3D=3D MAXIM_DEVICE_TYPE_MAX77836)
>                 max77836_remove(max14577);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id max14577_i2c_id[] =3D {
> diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
> index 4e6244e17559..7088cb6f9174 100644
> --- a/drivers/mfd/max77693.c
> +++ b/drivers/mfd/max77693.c
> @@ -294,7 +294,7 @@ static int max77693_i2c_probe(struct i2c_client *i2c,
>         return ret;
>  }
>
> -static int max77693_i2c_remove(struct i2c_client *i2c)
> +static void max77693_i2c_remove(struct i2c_client *i2c)
>  {
>         struct max77693_dev *max77693 =3D i2c_get_clientdata(i2c);
>
> @@ -307,8 +307,6 @@ static int max77693_i2c_remove(struct i2c_client *i2c=
)
>
>         i2c_unregister_device(max77693->i2c_muic);
>         i2c_unregister_device(max77693->i2c_haptic);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id max77693_i2c_id[] =3D {
> diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
> index 41f566e6a096..c340080971ce 100644
> --- a/drivers/mfd/max8907.c
> +++ b/drivers/mfd/max8907.c
> @@ -282,7 +282,7 @@ static int max8907_i2c_probe(struct i2c_client *i2c,
>         return ret;
>  }
>
> -static int max8907_i2c_remove(struct i2c_client *i2c)
> +static void max8907_i2c_remove(struct i2c_client *i2c)
>  {
>         struct max8907 *max8907 =3D i2c_get_clientdata(i2c);
>
> @@ -293,8 +293,6 @@ static int max8907_i2c_remove(struct i2c_client *i2c)
>         regmap_del_irq_chip(max8907->i2c_gen->irq, max8907->irqc_chg);
>
>         i2c_unregister_device(max8907->i2c_rtc);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_OF
> diff --git a/drivers/mfd/max8925-i2c.c b/drivers/mfd/max8925-i2c.c
> index 114e905bef25..04101da42bd3 100644
> --- a/drivers/mfd/max8925-i2c.c
> +++ b/drivers/mfd/max8925-i2c.c
> @@ -198,14 +198,13 @@ static int max8925_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int max8925_remove(struct i2c_client *client)
> +static void max8925_remove(struct i2c_client *client)
>  {
>         struct max8925_chip *chip =3D i2c_get_clientdata(client);
>
>         max8925_device_exit(chip);
>         i2c_unregister_device(chip->adc);
>         i2c_unregister_device(chip->rtc);
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/mfd/mc13xxx-i2c.c b/drivers/mfd/mc13xxx-i2c.c
> index fb937f66277e..eb94f3004cf3 100644
> --- a/drivers/mfd/mc13xxx-i2c.c
> +++ b/drivers/mfd/mc13xxx-i2c.c
> @@ -85,10 +85,9 @@ static int mc13xxx_i2c_probe(struct i2c_client *client=
,
>         return mc13xxx_common_init(&client->dev);
>  }
>
> -static int mc13xxx_i2c_remove(struct i2c_client *client)
> +static void mc13xxx_i2c_remove(struct i2c_client *client)
>  {
>         mc13xxx_common_exit(&client->dev);
> -       return 0;
>  }
>
>  static struct i2c_driver mc13xxx_i2c_driver =3D {
> diff --git a/drivers/mfd/menelaus.c b/drivers/mfd/menelaus.c
> index 07e0ca2e467c..eb08f69001f9 100644
> --- a/drivers/mfd/menelaus.c
> +++ b/drivers/mfd/menelaus.c
> @@ -1222,14 +1222,13 @@ static int menelaus_probe(struct i2c_client *clie=
nt,
>         return err;
>  }
>
> -static int menelaus_remove(struct i2c_client *client)
> +static void menelaus_remove(struct i2c_client *client)
>  {
>         struct menelaus_chip    *menelaus =3D i2c_get_clientdata(client);
>
>         free_irq(client->irq, menelaus);
>         flush_work(&menelaus->work);
>         the_menelaus =3D NULL;
> -       return 0;
>  }
>
>  static const struct i2c_device_id menelaus_id[] =3D {
> diff --git a/drivers/mfd/ntxec.c b/drivers/mfd/ntxec.c
> index b711e73eedcb..e16a7a82a929 100644
> --- a/drivers/mfd/ntxec.c
> +++ b/drivers/mfd/ntxec.c
> @@ -239,15 +239,13 @@ static int ntxec_probe(struct i2c_client *client)
>         return res;
>  }
>
> -static int ntxec_remove(struct i2c_client *client)
> +static void ntxec_remove(struct i2c_client *client)
>  {
>         if (client =3D=3D poweroff_restart_client) {
>                 poweroff_restart_client =3D NULL;
>                 pm_power_off =3D NULL;
>                 unregister_restart_handler(&ntxec_restart_handler);
>         }
> -
> -       return 0;
>  }
>
>  static const struct of_device_id of_ntxec_match_table[] =3D {
> diff --git a/drivers/mfd/palmas.c b/drivers/mfd/palmas.c
> index f5b3fa973b13..8b7429bd2e3e 100644
> --- a/drivers/mfd/palmas.c
> +++ b/drivers/mfd/palmas.c
> @@ -700,7 +700,7 @@ static int palmas_i2c_probe(struct i2c_client *i2c,
>         return ret;
>  }
>
> -static int palmas_i2c_remove(struct i2c_client *i2c)
> +static void palmas_i2c_remove(struct i2c_client *i2c)
>  {
>         struct palmas *palmas =3D i2c_get_clientdata(i2c);
>         int i;
> @@ -716,8 +716,6 @@ static int palmas_i2c_remove(struct i2c_client *i2c)
>                 pm_power_off =3D NULL;
>                 palmas_dev =3D NULL;
>         }
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id palmas_i2c_id[] =3D {
> diff --git a/drivers/mfd/pcf50633-core.c b/drivers/mfd/pcf50633-core.c
> index e9c565cf0f54..4ccc2c3e7681 100644
> --- a/drivers/mfd/pcf50633-core.c
> +++ b/drivers/mfd/pcf50633-core.c
> @@ -273,7 +273,7 @@ static int pcf50633_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int pcf50633_remove(struct i2c_client *client)
> +static void pcf50633_remove(struct i2c_client *client)
>  {
>         struct pcf50633 *pcf =3D i2c_get_clientdata(client);
>         int i;
> @@ -289,8 +289,6 @@ static int pcf50633_remove(struct i2c_client *client)
>
>         for (i =3D 0; i < PCF50633_NUM_REGULATORS; i++)
>                 platform_device_unregister(pcf->regulator_pdev[i]);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id pcf50633_id_table[] =3D {
> diff --git a/drivers/mfd/retu-mfd.c b/drivers/mfd/retu-mfd.c
> index c748fd29a220..3b5acf7ca39c 100644
> --- a/drivers/mfd/retu-mfd.c
> +++ b/drivers/mfd/retu-mfd.c
> @@ -287,7 +287,7 @@ static int retu_probe(struct i2c_client *i2c, const s=
truct i2c_device_id *id)
>         return 0;
>  }
>
> -static int retu_remove(struct i2c_client *i2c)
> +static void retu_remove(struct i2c_client *i2c)
>  {
>         struct retu_dev *rdev =3D i2c_get_clientdata(i2c);
>
> @@ -297,8 +297,6 @@ static int retu_remove(struct i2c_client *i2c)
>         }
>         mfd_remove_devices(rdev->dev);
>         regmap_del_irq_chip(i2c->irq, rdev->irq_data);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id retu_id[] =3D {
> diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
> index 4142b638e5fa..d5d641efa077 100644
> --- a/drivers/mfd/rk808.c
> +++ b/drivers/mfd/rk808.c
> @@ -778,7 +778,7 @@ static int rk808_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int rk808_remove(struct i2c_client *client)
> +static void rk808_remove(struct i2c_client *client)
>  {
>         struct rk808 *rk808 =3D i2c_get_clientdata(client);
>
> @@ -792,8 +792,6 @@ static int rk808_remove(struct i2c_client *client)
>                 pm_power_off =3D NULL;
>
>         unregister_restart_handler(&rk808_restart_handler);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused rk8xx_suspend(struct device *dev)
> diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
> index 384acb459427..eb8005b4e58d 100644
> --- a/drivers/mfd/rn5t618.c
> +++ b/drivers/mfd/rn5t618.c
> @@ -241,7 +241,7 @@ static int rn5t618_i2c_probe(struct i2c_client *i2c)
>         return rn5t618_irq_init(priv);
>  }
>
> -static int rn5t618_i2c_remove(struct i2c_client *i2c)
> +static void rn5t618_i2c_remove(struct i2c_client *i2c)
>  {
>         if (i2c =3D=3D rn5t618_pm_power_off) {
>                 rn5t618_pm_power_off =3D NULL;
> @@ -249,8 +249,6 @@ static int rn5t618_i2c_remove(struct i2c_client *i2c)
>         }
>
>         unregister_restart_handler(&rn5t618_restart_handler);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused rn5t618_i2c_suspend(struct device *dev)
> diff --git a/drivers/mfd/rsmu_i2c.c b/drivers/mfd/rsmu_i2c.c
> index dc001c9791c1..f716ab8039a0 100644
> --- a/drivers/mfd/rsmu_i2c.c
> +++ b/drivers/mfd/rsmu_i2c.c
> @@ -146,13 +146,11 @@ static int rsmu_i2c_probe(struct i2c_client *client=
,
>         return rsmu_core_init(rsmu);
>  }
>
> -static int rsmu_i2c_remove(struct i2c_client *client)
> +static void rsmu_i2c_remove(struct i2c_client *client)
>  {
>         struct rsmu_ddata *rsmu =3D i2c_get_clientdata(client);
>
>         rsmu_core_exit(rsmu);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id rsmu_i2c_id[] =3D {
> diff --git a/drivers/mfd/rt4831.c b/drivers/mfd/rt4831.c
> index fb3bd788a3eb..c6d34dc2b520 100644
> --- a/drivers/mfd/rt4831.c
> +++ b/drivers/mfd/rt4831.c
> @@ -87,7 +87,7 @@ static int rt4831_probe(struct i2c_client *client)
>                                     ARRAY_SIZE(rt4831_subdevs), NULL, 0, =
NULL);
>  }
>
> -static int rt4831_remove(struct i2c_client *client)
> +static void rt4831_remove(struct i2c_client *client)
>  {
>         struct regmap *regmap =3D dev_get_regmap(&client->dev, NULL);
>         int ret;
> @@ -96,8 +96,6 @@ static int rt4831_remove(struct i2c_client *client)
>         ret =3D regmap_update_bits(regmap, RT4831_REG_ENABLE, RT4831_RESE=
T_MASK, RT4831_RESET_MASK);
>         if (ret)
>                 dev_warn(&client->dev, "Failed to disable outputs (%pe)\n=
", ERR_PTR(ret));
> -
> -       return 0;
>  }
>
>  static const struct of_device_id __maybe_unused rt4831_of_match[] =3D {
> diff --git a/drivers/mfd/si476x-i2c.c b/drivers/mfd/si476x-i2c.c
> index a2635c2d9d1a..8166949b725c 100644
> --- a/drivers/mfd/si476x-i2c.c
> +++ b/drivers/mfd/si476x-i2c.c
> @@ -835,7 +835,7 @@ static int si476x_core_probe(struct i2c_client *clien=
t,
>         return rval;
>  }
>
> -static int si476x_core_remove(struct i2c_client *client)
> +static void si476x_core_remove(struct i2c_client *client)
>  {
>         struct si476x_core *core =3D i2c_get_clientdata(client);
>
> @@ -851,8 +851,6 @@ static int si476x_core_remove(struct i2c_client *clie=
nt)
>
>         if (gpio_is_valid(core->gpio_reset))
>                 gpio_free(core->gpio_reset);
> -
> -       return 0;
>  }
>
>
> diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
> index 122f96094410..5dd7d9688459 100644
> --- a/drivers/mfd/stmfx.c
> +++ b/drivers/mfd/stmfx.c
> @@ -467,13 +467,11 @@ static int stmfx_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int stmfx_remove(struct i2c_client *client)
> +static void stmfx_remove(struct i2c_client *client)
>  {
>         stmfx_irq_exit(client);
>
>         stmfx_chip_exit(client);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/mfd/stmpe-i2c.c b/drivers/mfd/stmpe-i2c.c
> index d3eedf3d607e..4d55494a97c4 100644
> --- a/drivers/mfd/stmpe-i2c.c
> +++ b/drivers/mfd/stmpe-i2c.c
> @@ -91,13 +91,11 @@ stmpe_i2c_probe(struct i2c_client *i2c, const struct =
i2c_device_id *id)
>         return stmpe_probe(&i2c_ci, partnum);
>  }
>
> -static int stmpe_i2c_remove(struct i2c_client *i2c)
> +static void stmpe_i2c_remove(struct i2c_client *i2c)
>  {
>         struct stmpe *stmpe =3D dev_get_drvdata(&i2c->dev);
>
>         stmpe_remove(stmpe);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id stmpe_i2c_id[] =3D {
> diff --git a/drivers/mfd/tc3589x.c b/drivers/mfd/tc3589x.c
> index 13583cdb93b6..d5d0ec117acb 100644
> --- a/drivers/mfd/tc3589x.c
> +++ b/drivers/mfd/tc3589x.c
> @@ -429,13 +429,11 @@ static int tc3589x_probe(struct i2c_client *i2c,
>         return 0;
>  }
>
> -static int tc3589x_remove(struct i2c_client *client)
> +static void tc3589x_remove(struct i2c_client *client)
>  {
>         struct tc3589x *tc3589x =3D i2c_get_clientdata(client);
>
>         mfd_remove_devices(tc3589x->dev);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/mfd/tps6105x.c b/drivers/mfd/tps6105x.c
> index c906324d293e..b360568ea675 100644
> --- a/drivers/mfd/tps6105x.c
> +++ b/drivers/mfd/tps6105x.c
> @@ -179,7 +179,7 @@ static int tps6105x_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int tps6105x_remove(struct i2c_client *client)
> +static void tps6105x_remove(struct i2c_client *client)
>  {
>         struct tps6105x *tps6105x =3D i2c_get_clientdata(client);
>
> @@ -189,8 +189,6 @@ static int tps6105x_remove(struct i2c_client *client)
>         regmap_update_bits(tps6105x->regmap, TPS6105X_REG_0,
>                 TPS6105X_REG0_MODE_MASK,
>                 TPS6105X_MODE_SHUTDOWN << TPS6105X_REG0_MODE_SHIFT);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id tps6105x_id[] =3D {
> diff --git a/drivers/mfd/tps65010.c b/drivers/mfd/tps65010.c
> index 7e7dbee58ca9..c2afa2e69f42 100644
> --- a/drivers/mfd/tps65010.c
> +++ b/drivers/mfd/tps65010.c
> @@ -501,7 +501,7 @@ static int tps65010_gpio_get(struct gpio_chip *chip, =
unsigned offset)
>
>  static struct tps65010 *the_tps;
>
> -static int tps65010_remove(struct i2c_client *client)
> +static void tps65010_remove(struct i2c_client *client)
>  {
>         struct tps65010         *tps =3D i2c_get_clientdata(client);
>         struct tps65010_board   *board =3D dev_get_platdata(&client->dev)=
;
> @@ -517,7 +517,6 @@ static int tps65010_remove(struct i2c_client *client)
>         cancel_delayed_work_sync(&tps->work);
>         debugfs_remove(tps->file);
>         the_tps =3D NULL;
> -       return 0;
>  }
>
>  static int tps65010_probe(struct i2c_client *client,
> diff --git a/drivers/mfd/tps65086.c b/drivers/mfd/tps65086.c
> index 3bd5728844a0..eb5afbeb0e91 100644
> --- a/drivers/mfd/tps65086.c
> +++ b/drivers/mfd/tps65086.c
> @@ -119,14 +119,12 @@ static int tps65086_probe(struct i2c_client *client=
,
>         return ret;
>  }
>
> -static int tps65086_remove(struct i2c_client *client)
> +static void tps65086_remove(struct i2c_client *client)
>  {
>         struct tps65086 *tps =3D i2c_get_clientdata(client);
>
>         if (tps->irq > 0)
>                 regmap_del_irq_chip(tps->irq, tps->irq_data);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id tps65086_id_table[] =3D {
> diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
> index 8027b0a9e14f..a7200ddd85e6 100644
> --- a/drivers/mfd/tps65217.c
> +++ b/drivers/mfd/tps65217.c
> @@ -382,7 +382,7 @@ static int tps65217_probe(struct i2c_client *client)
>         return 0;
>  }
>
> -static int tps65217_remove(struct i2c_client *client)
> +static void tps65217_remove(struct i2c_client *client)
>  {
>         struct tps65217 *tps =3D i2c_get_clientdata(client);
>         unsigned int virq;
> @@ -396,8 +396,6 @@ static int tps65217_remove(struct i2c_client *client)
>
>         irq_domain_remove(tps->irq_domain);
>         tps->irq_domain =3D NULL;
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id tps65217_id_table[] =3D {
> diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
> index c9303d3d6602..fb340da64bbc 100644
> --- a/drivers/mfd/tps6586x.c
> +++ b/drivers/mfd/tps6586x.c
> @@ -579,7 +579,7 @@ static int tps6586x_i2c_probe(struct i2c_client *clie=
nt,
>         return ret;
>  }
>
> -static int tps6586x_i2c_remove(struct i2c_client *client)
> +static void tps6586x_i2c_remove(struct i2c_client *client)
>  {
>         struct tps6586x *tps6586x =3D i2c_get_clientdata(client);
>
> @@ -587,7 +587,6 @@ static int tps6586x_i2c_remove(struct i2c_client *cli=
ent)
>         mfd_remove_devices(tps6586x->dev);
>         if (client->irq)
>                 free_irq(client->irq, tps6586x);
> -       return 0;
>  }
>
>  static int __maybe_unused tps6586x_i2c_suspend(struct device *dev)
> diff --git a/drivers/mfd/tps65912-i2c.c b/drivers/mfd/tps65912-i2c.c
> index 06eb2784d322..cbbac1567eaa 100644
> --- a/drivers/mfd/tps65912-i2c.c
> +++ b/drivers/mfd/tps65912-i2c.c
> @@ -51,13 +51,11 @@ static int tps65912_i2c_probe(struct i2c_client *clie=
nt,
>         return tps65912_device_init(tps);
>  }
>
> -static int tps65912_i2c_remove(struct i2c_client *client)
> +static void tps65912_i2c_remove(struct i2c_client *client)
>  {
>         struct tps65912 *tps =3D i2c_get_clientdata(client);
>
>         tps65912_device_exit(tps);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id tps65912_i2c_id_table[] =3D {
> diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
> index bd6659cf3bc0..89a96db15b33 100644
> --- a/drivers/mfd/twl-core.c
> +++ b/drivers/mfd/twl-core.c
> @@ -1033,7 +1033,7 @@ static void clocks_init(struct device *dev,
>  /*----------------------------------------------------------------------=
*/
>
>
> -static int twl_remove(struct i2c_client *client)
> +static void twl_remove(struct i2c_client *client)
>  {
>         unsigned i, num_slaves;
>
> @@ -1051,7 +1051,6 @@ static int twl_remove(struct i2c_client *client)
>                 twl->client =3D NULL;
>         }
>         twl_priv->ready =3D false;
> -       return 0;
>  }
>
>  static struct of_dev_auxdata twl_auxdata_lookup[] =3D {
> diff --git a/drivers/mfd/twl6040.c b/drivers/mfd/twl6040.c
> index b9c6d94b4002..f429b8f00db6 100644
> --- a/drivers/mfd/twl6040.c
> +++ b/drivers/mfd/twl6040.c
> @@ -808,7 +808,7 @@ static int twl6040_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int twl6040_remove(struct i2c_client *client)
> +static void twl6040_remove(struct i2c_client *client)
>  {
>         struct twl6040 *twl6040 =3D i2c_get_clientdata(client);
>
> @@ -820,8 +820,6 @@ static int twl6040_remove(struct i2c_client *client)
>         mfd_remove_devices(&client->dev);
>
>         regulator_bulk_disable(TWL6040_NUM_SUPPLIES, twl6040->supplies);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id twl6040_i2c_id[] =3D {
> diff --git a/drivers/mfd/wm8994-core.c b/drivers/mfd/wm8994-core.c
> index 7b1d270722ba..7e88f5b0abe6 100644
> --- a/drivers/mfd/wm8994-core.c
> +++ b/drivers/mfd/wm8994-core.c
> @@ -657,13 +657,11 @@ static int wm8994_i2c_probe(struct i2c_client *i2c,
>         return wm8994_device_init(wm8994, i2c->irq);
>  }
>
> -static int wm8994_i2c_remove(struct i2c_client *i2c)
> +static void wm8994_i2c_remove(struct i2c_client *i2c)
>  {
>         struct wm8994 *wm8994 =3D i2c_get_clientdata(i2c);
>
>         wm8994_device_exit(wm8994);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id wm8994_i2c_id[] =3D {
> diff --git a/drivers/misc/ad525x_dpot-i2c.c b/drivers/misc/ad525x_dpot-i2=
c.c
> index 0ee0c6d808c3..28ffb4377d98 100644
> --- a/drivers/misc/ad525x_dpot-i2c.c
> +++ b/drivers/misc/ad525x_dpot-i2c.c
> @@ -67,10 +67,9 @@ static int ad_dpot_i2c_probe(struct i2c_client *client=
,
>         return ad_dpot_probe(&client->dev, &bdata, id->driver_data, id->n=
ame);
>  }
>
> -static int ad_dpot_i2c_remove(struct i2c_client *client)
> +static void ad_dpot_i2c_remove(struct i2c_client *client)
>  {
>         ad_dpot_remove(&client->dev);
> -       return 0;
>  }
>
>  static const struct i2c_device_id ad_dpot_id[] =3D {
> diff --git a/drivers/misc/apds9802als.c b/drivers/misc/apds9802als.c
> index 6fff44b952bd..a32431f4b370 100644
> --- a/drivers/misc/apds9802als.c
> +++ b/drivers/misc/apds9802als.c
> @@ -242,7 +242,7 @@ static int apds9802als_probe(struct i2c_client *clien=
t,
>         return res;
>  }
>
> -static int apds9802als_remove(struct i2c_client *client)
> +static void apds9802als_remove(struct i2c_client *client)
>  {
>         struct als_data *data =3D i2c_get_clientdata(client);
>
> @@ -256,7 +256,6 @@ static int apds9802als_remove(struct i2c_client *clie=
nt)
>         pm_runtime_put_noidle(&client->dev);
>
>         kfree(data);
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM
> diff --git a/drivers/misc/apds990x.c b/drivers/misc/apds990x.c
> index 45f5b997a0e1..e2100cc42ce8 100644
> --- a/drivers/misc/apds990x.c
> +++ b/drivers/misc/apds990x.c
> @@ -1185,7 +1185,7 @@ static int apds990x_probe(struct i2c_client *client=
,
>         return err;
>  }
>
> -static int apds990x_remove(struct i2c_client *client)
> +static void apds990x_remove(struct i2c_client *client)
>  {
>         struct apds990x_chip *chip =3D i2c_get_clientdata(client);
>
> @@ -1205,7 +1205,6 @@ static int apds990x_remove(struct i2c_client *clien=
t)
>         regulator_bulk_free(ARRAY_SIZE(chip->regs), chip->regs);
>
>         kfree(chip);
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/misc/bh1770glc.c b/drivers/misc/bh1770glc.c
> index 0581bb9cef2e..d0dfa674414c 100644
> --- a/drivers/misc/bh1770glc.c
> +++ b/drivers/misc/bh1770glc.c
> @@ -1280,7 +1280,7 @@ static int bh1770_probe(struct i2c_client *client,
>         return err;
>  }
>
> -static int bh1770_remove(struct i2c_client *client)
> +static void bh1770_remove(struct i2c_client *client)
>  {
>         struct bh1770_chip *chip =3D i2c_get_clientdata(client);
>
> @@ -1299,8 +1299,6 @@ static int bh1770_remove(struct i2c_client *client)
>
>         pm_runtime_disable(&client->dev);
>         pm_runtime_set_suspended(&client->dev);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/misc/ds1682.c b/drivers/misc/ds1682.c
> index 42f316c2d719..0698ddc5f4d5 100644
> --- a/drivers/misc/ds1682.c
> +++ b/drivers/misc/ds1682.c
> @@ -228,11 +228,10 @@ static int ds1682_probe(struct i2c_client *client,
>         return rc;
>  }
>
> -static int ds1682_remove(struct i2c_client *client)
> +static void ds1682_remove(struct i2c_client *client)
>  {
>         sysfs_remove_bin_file(&client->dev.kobj, &ds1682_eeprom_attr);
>         sysfs_remove_group(&client->dev.kobj, &ds1682_group);
> -       return 0;
>  }
>
>  static const struct i2c_device_id ds1682_id[] =3D {
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 633e1cf08d6e..938c4f41b98c 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -791,7 +791,7 @@ static int at24_probe(struct i2c_client *client)
>         return 0;
>  }
>
> -static int at24_remove(struct i2c_client *client)
> +static void at24_remove(struct i2c_client *client)
>  {
>         struct at24_data *at24 =3D i2c_get_clientdata(client);
>
> @@ -801,8 +801,6 @@ static int at24_remove(struct i2c_client *client)
>                         regulator_disable(at24->vcc_reg);
>                 pm_runtime_set_suspended(&client->dev);
>         }
> -
> -       return 0;
>  }
>
>  static int __maybe_unused at24_suspend(struct device *dev)
> diff --git a/drivers/misc/eeprom/ee1004.c b/drivers/misc/eeprom/ee1004.c
> index 9fbfe784d710..c8c6deb7ed89 100644
> --- a/drivers/misc/eeprom/ee1004.c
> +++ b/drivers/misc/eeprom/ee1004.c
> @@ -219,14 +219,12 @@ static int ee1004_probe(struct i2c_client *client)
>         return err;
>  }
>
> -static int ee1004_remove(struct i2c_client *client)
> +static void ee1004_remove(struct i2c_client *client)
>  {
>         /* Remove page select clients if this is the last device */
>         mutex_lock(&ee1004_bus_lock);
>         ee1004_cleanup(EE1004_NUM_PAGES);
>         mutex_unlock(&ee1004_bus_lock);
> -
> -       return 0;
>  }
>
>  /*----------------------------------------------------------------------=
---*/
> diff --git a/drivers/misc/eeprom/eeprom.c b/drivers/misc/eeprom/eeprom.c
> index 34fa385dfd4b..4a9445fea93d 100644
> --- a/drivers/misc/eeprom/eeprom.c
> +++ b/drivers/misc/eeprom/eeprom.c
> @@ -183,11 +183,9 @@ static int eeprom_probe(struct i2c_client *client,
>         return sysfs_create_bin_file(&client->dev.kobj, &eeprom_attr);
>  }
>
> -static int eeprom_remove(struct i2c_client *client)
> +static void eeprom_remove(struct i2c_client *client)
>  {
>         sysfs_remove_bin_file(&client->dev.kobj, &eeprom_attr);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id eeprom_id[] =3D {
> diff --git a/drivers/misc/eeprom/idt_89hpesx.c b/drivers/misc/eeprom/idt_=
89hpesx.c
> index b0cff4b152da..0c23e909bc3e 100644
> --- a/drivers/misc/eeprom/idt_89hpesx.c
> +++ b/drivers/misc/eeprom/idt_89hpesx.c
> @@ -1401,7 +1401,7 @@ static int idt_probe(struct i2c_client *client, con=
st struct i2c_device_id *id)
>  /*
>   * idt_remove() - IDT 89HPESx driver remove() callback method
>   */
> -static int idt_remove(struct i2c_client *client)
> +static void idt_remove(struct i2c_client *client)
>  {
>         struct idt_89hpesx_dev *pdev =3D i2c_get_clientdata(client);
>
> @@ -1413,8 +1413,6 @@ static int idt_remove(struct i2c_client *client)
>
>         /* Discard driver data structure */
>         idt_free_pdev(pdev);
> -
> -       return 0;
>  }
>
>  /*
> diff --git a/drivers/misc/eeprom/max6875.c b/drivers/misc/eeprom/max6875.=
c
> index 9da81f6d4a1c..6bd4f4339af4 100644
> --- a/drivers/misc/eeprom/max6875.c
> +++ b/drivers/misc/eeprom/max6875.c
> @@ -173,7 +173,7 @@ static int max6875_probe(struct i2c_client *client,
>         return err;
>  }
>
> -static int max6875_remove(struct i2c_client *client)
> +static void max6875_remove(struct i2c_client *client)
>  {
>         struct max6875_data *data =3D i2c_get_clientdata(client);
>
> @@ -181,8 +181,6 @@ static int max6875_remove(struct i2c_client *client)
>
>         sysfs_remove_bin_file(&client->dev.kobj, &user_eeprom_attr);
>         kfree(data);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id max6875_id[] =3D {
> diff --git a/drivers/misc/hmc6352.c b/drivers/misc/hmc6352.c
> index 572a2ff10f00..42b9adef28a3 100644
> --- a/drivers/misc/hmc6352.c
> +++ b/drivers/misc/hmc6352.c
> @@ -116,10 +116,9 @@ static int hmc6352_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int hmc6352_remove(struct i2c_client *client)
> +static void hmc6352_remove(struct i2c_client *client)
>  {
>         sysfs_remove_group(&client->dev.kobj, &m_compass_gr);
> -       return 0;
>  }
>
>  static const struct i2c_device_id hmc6352_id[] =3D {
> diff --git a/drivers/misc/ics932s401.c b/drivers/misc/ics932s401.c
> index 0f9ea75b0b18..2c4bb6d6e1a0 100644
> --- a/drivers/misc/ics932s401.c
> +++ b/drivers/misc/ics932s401.c
> @@ -93,7 +93,7 @@ static int ics932s401_probe(struct i2c_client *client,
>                          const struct i2c_device_id *id);
>  static int ics932s401_detect(struct i2c_client *client,
>                           struct i2c_board_info *info);
> -static int ics932s401_remove(struct i2c_client *client);
> +static void ics932s401_remove(struct i2c_client *client);
>
>  static const struct i2c_device_id ics932s401_id[] =3D {
>         { "ics932s401", 0 },
> @@ -460,13 +460,12 @@ static int ics932s401_probe(struct i2c_client *clie=
nt,
>         return err;
>  }
>
> -static int ics932s401_remove(struct i2c_client *client)
> +static void ics932s401_remove(struct i2c_client *client)
>  {
>         struct ics932s401_data *data =3D i2c_get_clientdata(client);
>
>         sysfs_remove_group(&client->dev.kobj, &data->attrs);
>         kfree(data);
> -       return 0;
>  }
>
>  module_i2c_driver(ics932s401_driver);
> diff --git a/drivers/misc/isl29003.c b/drivers/misc/isl29003.c
> index 703d20e83ebd..8ab61be79c76 100644
> --- a/drivers/misc/isl29003.c
> +++ b/drivers/misc/isl29003.c
> @@ -410,12 +410,11 @@ static int isl29003_probe(struct i2c_client *client=
,
>         return err;
>  }
>
> -static int isl29003_remove(struct i2c_client *client)
> +static void isl29003_remove(struct i2c_client *client)
>  {
>         sysfs_remove_group(&client->dev.kobj, &isl29003_attr_group);
>         isl29003_set_power_state(client, 0);
>         kfree(i2c_get_clientdata(client));
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/misc/isl29020.c b/drivers/misc/isl29020.c
> index fc5ff2805b94..c6f2a94f501a 100644
> --- a/drivers/misc/isl29020.c
> +++ b/drivers/misc/isl29020.c
> @@ -171,11 +171,10 @@ static int  isl29020_probe(struct i2c_client *clien=
t,
>         return res;
>  }
>
> -static int isl29020_remove(struct i2c_client *client)
> +static void isl29020_remove(struct i2c_client *client)
>  {
>         pm_runtime_disable(&client->dev);
>         sysfs_remove_group(&client->dev.kobj, &m_als_gr);
> -       return 0;
>  }
>
>  static const struct i2c_device_id isl29020_id[] =3D {
> diff --git a/drivers/misc/lis3lv02d/lis3lv02d_i2c.c b/drivers/misc/lis3lv=
02d/lis3lv02d_i2c.c
> index 52555d2e824b..d7daa01fe7ca 100644
> --- a/drivers/misc/lis3lv02d/lis3lv02d_i2c.c
> +++ b/drivers/misc/lis3lv02d/lis3lv02d_i2c.c
> @@ -177,7 +177,7 @@ static int lis3lv02d_i2c_probe(struct i2c_client *cli=
ent,
>         return ret;
>  }
>
> -static int lis3lv02d_i2c_remove(struct i2c_client *client)
> +static void lis3lv02d_i2c_remove(struct i2c_client *client)
>  {
>         struct lis3lv02d *lis3 =3D i2c_get_clientdata(client);
>         struct lis3lv02d_platform_data *pdata =3D client->dev.platform_da=
ta;
> @@ -190,7 +190,6 @@ static int lis3lv02d_i2c_remove(struct i2c_client *cl=
ient)
>
>         regulator_bulk_free(ARRAY_SIZE(lis3->regulators),
>                             lis3_dev.regulators);
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/misc/tsl2550.c b/drivers/misc/tsl2550.c
> index 6d71865c8042..1652fb9b3856 100644
> --- a/drivers/misc/tsl2550.c
> +++ b/drivers/misc/tsl2550.c
> @@ -389,7 +389,7 @@ static int tsl2550_probe(struct i2c_client *client,
>         return err;
>  }
>
> -static int tsl2550_remove(struct i2c_client *client)
> +static void tsl2550_remove(struct i2c_client *client)
>  {
>         sysfs_remove_group(&client->dev.kobj, &tsl2550_attr_group);
>
> @@ -397,8 +397,6 @@ static int tsl2550_remove(struct i2c_client *client)
>         tsl2550_set_power_state(client, 0);
>
>         kfree(i2c_get_clientdata(client));
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/mtd/maps/pismo.c b/drivers/mtd/maps/pismo.c
> index 946ba80f9758..5fcefcd0baca 100644
> --- a/drivers/mtd/maps/pismo.c
> +++ b/drivers/mtd/maps/pismo.c
> @@ -195,7 +195,7 @@ static void pismo_add_one(struct pismo_data *pismo, i=
nt i,
>         }
>  }
>
> -static int pismo_remove(struct i2c_client *client)
> +static void pismo_remove(struct i2c_client *client)
>  {
>         struct pismo_data *pismo =3D i2c_get_clientdata(client);
>         int i;
> @@ -204,8 +204,6 @@ static int pismo_remove(struct i2c_client *client)
>                 platform_device_unregister(pismo->dev[i]);
>
>         kfree(pismo);
> -
> -       return 0;
>  }
>
>  static int pismo_probe(struct i2c_client *client,
> diff --git a/drivers/net/dsa/lan9303_i2c.c b/drivers/net/dsa/lan9303_i2c.=
c
> index 8ca4713310fa..b25e91b26d99 100644
> --- a/drivers/net/dsa/lan9303_i2c.c
> +++ b/drivers/net/dsa/lan9303_i2c.c
> @@ -65,18 +65,16 @@ static int lan9303_i2c_probe(struct i2c_client *clien=
t,
>         return 0;
>  }
>
> -static int lan9303_i2c_remove(struct i2c_client *client)
> +static void lan9303_i2c_remove(struct i2c_client *client)
>  {
>         struct lan9303_i2c *sw_dev =3D i2c_get_clientdata(client);
>
>         if (!sw_dev)
> -               return 0;
> +               return;
>
>         lan9303_remove(&sw_dev->chip);
>
>         i2c_set_clientdata(client, NULL);
> -
> -       return 0;
>  }
>
>  static void lan9303_i2c_shutdown(struct i2c_client *client)
> diff --git a/drivers/net/dsa/microchip/ksz9477_i2c.c b/drivers/net/dsa/mi=
crochip/ksz9477_i2c.c
> index faa3163c86b0..ef9d3cc4b15a 100644
> --- a/drivers/net/dsa/microchip/ksz9477_i2c.c
> +++ b/drivers/net/dsa/microchip/ksz9477_i2c.c
> @@ -52,7 +52,7 @@ static int ksz9477_i2c_probe(struct i2c_client *i2c,
>         return 0;
>  }
>
> -static int ksz9477_i2c_remove(struct i2c_client *i2c)
> +static void ksz9477_i2c_remove(struct i2c_client *i2c)
>  {
>         struct ksz_device *dev =3D i2c_get_clientdata(i2c);
>
> @@ -60,8 +60,6 @@ static int ksz9477_i2c_remove(struct i2c_client *i2c)
>                 ksz_switch_remove(dev);
>
>         i2c_set_clientdata(i2c, NULL);
> -
> -       return 0;
>  }
>
>  static void ksz9477_i2c_shutdown(struct i2c_client *i2c)
> diff --git a/drivers/net/dsa/xrs700x/xrs700x_i2c.c b/drivers/net/dsa/xrs7=
00x/xrs700x_i2c.c
> index 6deae388a0d6..bbaf5a3fbf00 100644
> --- a/drivers/net/dsa/xrs700x/xrs700x_i2c.c
> +++ b/drivers/net/dsa/xrs700x/xrs700x_i2c.c
> @@ -105,18 +105,16 @@ static int xrs700x_i2c_probe(struct i2c_client *i2c=
,
>         return 0;
>  }
>
> -static int xrs700x_i2c_remove(struct i2c_client *i2c)
> +static void xrs700x_i2c_remove(struct i2c_client *i2c)
>  {
>         struct xrs700x *priv =3D i2c_get_clientdata(i2c);
>
>         if (!priv)
> -               return 0;
> +               return;
>
>         xrs700x_switch_remove(priv);
>
>         i2c_set_clientdata(i2c, NULL);
> -
> -       return 0;
>  }
>
>  static void xrs700x_i2c_shutdown(struct i2c_client *i2c)
> diff --git a/drivers/net/ethernet/mellanox/mlxsw/i2c.c b/drivers/net/ethe=
rnet/mellanox/mlxsw/i2c.c
> index ce843ea91464..50b7121a5e3c 100644
> --- a/drivers/net/ethernet/mellanox/mlxsw/i2c.c
> +++ b/drivers/net/ethernet/mellanox/mlxsw/i2c.c
> @@ -656,14 +656,12 @@ static int mlxsw_i2c_probe(struct i2c_client *clien=
t,
>         return err;
>  }
>
> -static int mlxsw_i2c_remove(struct i2c_client *client)
> +static void mlxsw_i2c_remove(struct i2c_client *client)
>  {
>         struct mlxsw_i2c *mlxsw_i2c =3D i2c_get_clientdata(client);
>
>         mlxsw_core_bus_device_unregister(mlxsw_i2c->core, false);
>         mutex_destroy(&mlxsw_i2c->cmd.lock);
> -
> -       return 0;
>  }
>
>  int mlxsw_i2c_driver_register(struct i2c_driver *i2c_driver)
> diff --git a/drivers/net/mctp/mctp-i2c.c b/drivers/net/mctp/mctp-i2c.c
> index 53846c6b56ca..670ad9b306fe 100644
> --- a/drivers/net/mctp/mctp-i2c.c
> +++ b/drivers/net/mctp/mctp-i2c.c
> @@ -986,7 +986,7 @@ static int mctp_i2c_probe(struct i2c_client *client)
>         return rc;
>  }
>
> -static int mctp_i2c_remove(struct i2c_client *client)
> +static void mctp_i2c_remove(struct i2c_client *client)
>  {
>         struct mctp_i2c_client *mcli =3D i2c_get_clientdata(client);
>         struct mctp_i2c_dev *midev =3D NULL, *tmp =3D NULL;
> @@ -1000,7 +1000,6 @@ static int mctp_i2c_remove(struct i2c_client *clien=
t)
>         mctp_i2c_free_client(mcli);
>         mutex_unlock(&driver_clients_lock);
>         /* Callers ignore return code */
> -       return 0;
>  }
>
>  /* We look for a 'mctp-controller' property on I2C busses as they are
> diff --git a/drivers/nfc/fdp/i2c.c b/drivers/nfc/fdp/i2c.c
> index 28a9e1eb9bcf..2d53e0f88d2f 100644
> --- a/drivers/nfc/fdp/i2c.c
> +++ b/drivers/nfc/fdp/i2c.c
> @@ -336,14 +336,12 @@ static int fdp_nci_i2c_probe(struct i2c_client *cli=
ent)
>         return 0;
>  }
>
> -static int fdp_nci_i2c_remove(struct i2c_client *client)
> +static void fdp_nci_i2c_remove(struct i2c_client *client)
>  {
>         struct fdp_i2c_phy *phy =3D i2c_get_clientdata(client);
>
>         fdp_nci_remove(phy->ndev);
>         fdp_nci_i2c_disable(phy);
> -
> -       return 0;
>  }
>
>  static const struct acpi_device_id fdp_nci_i2c_acpi_match[] =3D {
> diff --git a/drivers/nfc/microread/i2c.c b/drivers/nfc/microread/i2c.c
> index 067295124eb9..5eaa18f81355 100644
> --- a/drivers/nfc/microread/i2c.c
> +++ b/drivers/nfc/microread/i2c.c
> @@ -268,15 +268,13 @@ static int microread_i2c_probe(struct i2c_client *c=
lient,
>         return r;
>  }
>
> -static int microread_i2c_remove(struct i2c_client *client)
> +static void microread_i2c_remove(struct i2c_client *client)
>  {
>         struct microread_i2c_phy *phy =3D i2c_get_clientdata(client);
>
>         microread_remove(phy->hdev);
>
>         free_irq(client->irq, phy);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id microread_i2c_id[] =3D {
> diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
> index ceef81d93ac9..61f1e2019c0a 100644
> --- a/drivers/nfc/nfcmrvl/i2c.c
> +++ b/drivers/nfc/nfcmrvl/i2c.c
> @@ -231,13 +231,11 @@ static int nfcmrvl_i2c_probe(struct i2c_client *cli=
ent,
>         return 0;
>  }
>
> -static int nfcmrvl_i2c_remove(struct i2c_client *client)
> +static void nfcmrvl_i2c_remove(struct i2c_client *client)
>  {
>         struct nfcmrvl_i2c_drv_data *drv_data =3D i2c_get_clientdata(clie=
nt);
>
>         nfcmrvl_nci_unregister_dev(drv_data->priv);
> -
> -       return 0;
>  }
>
>
> diff --git a/drivers/nfc/nxp-nci/i2c.c b/drivers/nfc/nxp-nci/i2c.c
> index 7e451c10985d..82a2e2fb1472 100644
> --- a/drivers/nfc/nxp-nci/i2c.c
> +++ b/drivers/nfc/nxp-nci/i2c.c
> @@ -307,14 +307,12 @@ static int nxp_nci_i2c_probe(struct i2c_client *cli=
ent,
>         return r;
>  }
>
> -static int nxp_nci_i2c_remove(struct i2c_client *client)
> +static void nxp_nci_i2c_remove(struct i2c_client *client)
>  {
>         struct nxp_nci_i2c_phy *phy =3D i2c_get_clientdata(client);
>
>         nxp_nci_remove(phy->ndev);
>         free_irq(client->irq, phy);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id nxp_nci_i2c_id_table[] =3D {
> diff --git a/drivers/nfc/pn533/i2c.c b/drivers/nfc/pn533/i2c.c
> index 673eb5e9b887..ddf3db286bad 100644
> --- a/drivers/nfc/pn533/i2c.c
> +++ b/drivers/nfc/pn533/i2c.c
> @@ -227,7 +227,7 @@ static int pn533_i2c_probe(struct i2c_client *client,
>         return r;
>  }
>
> -static int pn533_i2c_remove(struct i2c_client *client)
> +static void pn533_i2c_remove(struct i2c_client *client)
>  {
>         struct pn533_i2c_phy *phy =3D i2c_get_clientdata(client);
>
> @@ -235,8 +235,6 @@ static int pn533_i2c_remove(struct i2c_client *client=
)
>
>         pn53x_unregister_nfc(phy->priv);
>         pn53x_common_clean(phy->priv);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id of_pn533_i2c_match[] __maybe_unused =3D=
 {
> diff --git a/drivers/nfc/pn544/i2c.c b/drivers/nfc/pn544/i2c.c
> index 62a0f1a010cb..9e754abcfa2a 100644
> --- a/drivers/nfc/pn544/i2c.c
> +++ b/drivers/nfc/pn544/i2c.c
> @@ -928,7 +928,7 @@ static int pn544_hci_i2c_probe(struct i2c_client *cli=
ent,
>         return 0;
>  }
>
> -static int pn544_hci_i2c_remove(struct i2c_client *client)
> +static void pn544_hci_i2c_remove(struct i2c_client *client)
>  {
>         struct pn544_i2c_phy *phy =3D i2c_get_clientdata(client);
>
> @@ -940,8 +940,6 @@ static int pn544_hci_i2c_remove(struct i2c_client *cl=
ient)
>
>         if (phy->powered)
>                 pn544_hci_i2c_disable(phy);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id of_pn544_i2c_match[] __maybe_unused =3D=
 {
> diff --git a/drivers/nfc/s3fwrn5/i2c.c b/drivers/nfc/s3fwrn5/i2c.c
> index 4d1cf1bb55b0..f824dc7099ce 100644
> --- a/drivers/nfc/s3fwrn5/i2c.c
> +++ b/drivers/nfc/s3fwrn5/i2c.c
> @@ -246,14 +246,12 @@ static int s3fwrn5_i2c_probe(struct i2c_client *cli=
ent,
>         return ret;
>  }
>
> -static int s3fwrn5_i2c_remove(struct i2c_client *client)
> +static void s3fwrn5_i2c_remove(struct i2c_client *client)
>  {
>         struct s3fwrn5_i2c_phy *phy =3D i2c_get_clientdata(client);
>
>         s3fwrn5_remove(phy->common.ndev);
>         clk_disable_unprepare(phy->clk);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id s3fwrn5_i2c_id_table[] =3D {
> diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
> index cbd968f013c7..89fa24d71bef 100644
> --- a/drivers/nfc/st-nci/i2c.c
> +++ b/drivers/nfc/st-nci/i2c.c
> @@ -250,13 +250,11 @@ static int st_nci_i2c_probe(struct i2c_client *clie=
nt,
>         return r;
>  }
>
> -static int st_nci_i2c_remove(struct i2c_client *client)
> +static void st_nci_i2c_remove(struct i2c_client *client)
>  {
>         struct st_nci_i2c_phy *phy =3D i2c_get_clientdata(client);
>
>         ndlc_remove(phy->ndlc);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id st_nci_i2c_id_table[] =3D {
> diff --git a/drivers/nfc/st21nfca/i2c.c b/drivers/nfc/st21nfca/i2c.c
> index 42dc0e5eb161..76b55986bcf8 100644
> --- a/drivers/nfc/st21nfca/i2c.c
> +++ b/drivers/nfc/st21nfca/i2c.c
> @@ -562,7 +562,7 @@ static int st21nfca_hci_i2c_probe(struct i2c_client *=
client,
>         return r;
>  }
>
> -static int st21nfca_hci_i2c_remove(struct i2c_client *client)
> +static void st21nfca_hci_i2c_remove(struct i2c_client *client)
>  {
>         struct st21nfca_i2c_phy *phy =3D i2c_get_clientdata(client);
>
> @@ -571,8 +571,6 @@ static int st21nfca_hci_i2c_remove(struct i2c_client =
*client)
>         if (phy->powered)
>                 st21nfca_hci_i2c_disable(phy);
>         kfree_skb(phy->pending_skb);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id st21nfca_hci_i2c_id_table[] =3D {
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 7f6bba18c515..e0b98ce9c5e8 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -2525,13 +2525,12 @@ static int unittest_i2c_dev_probe(struct i2c_clie=
nt *client,
>         return 0;
>  };
>
> -static int unittest_i2c_dev_remove(struct i2c_client *client)
> +static void unittest_i2c_dev_remove(struct i2c_client *client)
>  {
>         struct device *dev =3D &client->dev;
>         struct device_node *np =3D client->dev.of_node;
>
>         dev_dbg(dev, "%s for node @%pOF\n", __func__, np);
> -       return 0;
>  }
>
>  static const struct i2c_device_id unittest_i2c_dev_id[] =3D {
> @@ -2602,7 +2601,7 @@ static int unittest_i2c_mux_probe(struct i2c_client=
 *client,
>         return 0;
>  };
>
> -static int unittest_i2c_mux_remove(struct i2c_client *client)
> +static void unittest_i2c_mux_remove(struct i2c_client *client)
>  {
>         struct device *dev =3D &client->dev;
>         struct device_node *np =3D client->dev.of_node;
> @@ -2610,7 +2609,6 @@ static int unittest_i2c_mux_remove(struct i2c_clien=
t *client)
>
>         dev_dbg(dev, "%s for node @%pOF\n", __func__, np);
>         i2c_mux_del_adapters(muxc);
> -       return 0;
>  }
>
>  static const struct i2c_device_id unittest_i2c_mux_id[] =3D {
> diff --git a/drivers/platform/chrome/cros_ec_i2c.c b/drivers/platform/chr=
ome/cros_ec_i2c.c
> index 9f5b95763173..b6823c654c3f 100644
> --- a/drivers/platform/chrome/cros_ec_i2c.c
> +++ b/drivers/platform/chrome/cros_ec_i2c.c
> @@ -317,13 +317,11 @@ static int cros_ec_i2c_probe(struct i2c_client *cli=
ent,
>         return 0;
>  }
>
> -static int cros_ec_i2c_remove(struct i2c_client *client)
> +static void cros_ec_i2c_remove(struct i2c_client *client)
>  {
>         struct cros_ec_device *ec_dev =3D i2c_get_clientdata(client);
>
>         cros_ec_unregister(ec_dev);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/platform/surface/surface3_power.c b/drivers/platform=
/surface/surface3_power.c
> index 444ec81ba02d..3b20dddeb815 100644
> --- a/drivers/platform/surface/surface3_power.c
> +++ b/drivers/platform/surface/surface3_power.c
> @@ -554,7 +554,7 @@ static int mshw0011_probe(struct i2c_client *client)
>         return error;
>  }
>
> -static int mshw0011_remove(struct i2c_client *client)
> +static void mshw0011_remove(struct i2c_client *client)
>  {
>         struct mshw0011_data *cdata =3D i2c_get_clientdata(client);
>
> @@ -564,8 +564,6 @@ static int mshw0011_remove(struct i2c_client *client)
>                 kthread_stop(cdata->poll_task);
>
>         i2c_unregister_device(cdata->bat0);
> -
> -       return 0;
>  }
>
>  static const struct acpi_device_id mshw0011_acpi_match[] =3D {
> diff --git a/drivers/platform/x86/asus-tf103c-dock.c b/drivers/platform/x=
86/asus-tf103c-dock.c
> index 6fd0c9fea82d..62310e06282b 100644
> --- a/drivers/platform/x86/asus-tf103c-dock.c
> +++ b/drivers/platform/x86/asus-tf103c-dock.c
> @@ -878,14 +878,12 @@ static int tf103c_dock_probe(struct i2c_client *cli=
ent)
>         return 0;
>  }
>
> -static int tf103c_dock_remove(struct i2c_client *client)
> +static void tf103c_dock_remove(struct i2c_client *client)
>  {
>         struct tf103c_dock_data *dock =3D i2c_get_clientdata(client);
>
>         tf103c_dock_stop_hpd(dock);
>         tf103c_dock_disable(dock);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused tf103c_dock_suspend(struct device *dev)
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/plat=
form/x86/intel/int3472/tps68470.c
> index 22f61b47f9e5..5dd81bb05255 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -178,15 +178,13 @@ static int skl_int3472_tps68470_probe(struct i2c_cl=
ient *client)
>         return ret;
>  }
>
> -static int skl_int3472_tps68470_remove(struct i2c_client *client)
> +static void skl_int3472_tps68470_remove(struct i2c_client *client)
>  {
>         const struct int3472_tps68470_board_data *board_data;
>
>         board_data =3D int3472_tps68470_get_board_data(dev_name(&client->=
dev));
>         if (board_data)
>                 gpiod_remove_lookup_table(board_data->tps68470_gpio_looku=
p_table);
> -
> -       return 0;
>  }
>
>  static const struct acpi_device_id int3472_device_id[] =3D {
> diff --git a/drivers/power/supply/bq2415x_charger.c b/drivers/power/suppl=
y/bq2415x_charger.c
> index 5724001e66b9..6b99e1c675b8 100644
> --- a/drivers/power/supply/bq2415x_charger.c
> +++ b/drivers/power/supply/bq2415x_charger.c
> @@ -1696,7 +1696,7 @@ static int bq2415x_probe(struct i2c_client *client,
>
>  /* main bq2415x remove function */
>
> -static int bq2415x_remove(struct i2c_client *client)
> +static void bq2415x_remove(struct i2c_client *client)
>  {
>         struct bq2415x_device *bq =3D i2c_get_clientdata(client);
>
> @@ -1715,8 +1715,6 @@ static int bq2415x_remove(struct i2c_client *client=
)
>         dev_info(bq->dev, "driver unregistered\n");
>
>         kfree(bq->name);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id bq2415x_i2c_id_table[] =3D {
> diff --git a/drivers/power/supply/bq24190_charger.c b/drivers/power/suppl=
y/bq24190_charger.c
> index 27f5c7648617..2274679c5ddd 100644
> --- a/drivers/power/supply/bq24190_charger.c
> +++ b/drivers/power/supply/bq24190_charger.c
> @@ -1901,7 +1901,7 @@ static int bq24190_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int bq24190_remove(struct i2c_client *client)
> +static void bq24190_remove(struct i2c_client *client)
>  {
>         struct bq24190_dev_info *bdi =3D i2c_get_clientdata(client);
>         int error;
> @@ -1918,8 +1918,6 @@ static int bq24190_remove(struct i2c_client *client=
)
>                 pm_runtime_put_sync(bdi->dev);
>         pm_runtime_dont_use_autosuspend(bdi->dev);
>         pm_runtime_disable(bdi->dev);
> -
> -       return 0;
>  }
>
>  static void bq24190_shutdown(struct i2c_client *client)
> diff --git a/drivers/power/supply/bq24257_charger.c b/drivers/power/suppl=
y/bq24257_charger.c
> index 96cb3290bcaa..dafb64b32cef 100644
> --- a/drivers/power/supply/bq24257_charger.c
> +++ b/drivers/power/supply/bq24257_charger.c
> @@ -1077,7 +1077,7 @@ static int bq24257_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int bq24257_remove(struct i2c_client *client)
> +static void bq24257_remove(struct i2c_client *client)
>  {
>         struct bq24257_device *bq =3D i2c_get_clientdata(client);
>
> @@ -1085,8 +1085,6 @@ static int bq24257_remove(struct i2c_client *client=
)
>                 cancel_delayed_work_sync(&bq->iilimit_setup_work);
>
>         bq24257_field_write(bq, F_RESET, 1); /* reset to defaults */
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/power/supply/bq25890_charger.c b/drivers/power/suppl=
y/bq25890_charger.c
> index 852a6fec4339..06ea7399d151 100644
> --- a/drivers/power/supply/bq25890_charger.c
> +++ b/drivers/power/supply/bq25890_charger.c
> @@ -1258,7 +1258,7 @@ static int bq25890_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int bq25890_remove(struct i2c_client *client)
> +static void bq25890_remove(struct i2c_client *client)
>  {
>         struct bq25890_device *bq =3D i2c_get_clientdata(client);
>
> @@ -1269,8 +1269,6 @@ static int bq25890_remove(struct i2c_client *client=
)
>                 /* reset all registers to default values */
>                 bq25890_chip_reset(bq);
>         }
> -
> -       return 0;
>  }
>
>  static void bq25890_shutdown(struct i2c_client *client)
> diff --git a/drivers/power/supply/bq27xxx_battery_i2c.c b/drivers/power/s=
upply/bq27xxx_battery_i2c.c
> index cf38cbfe13e9..94b00bb89c17 100644
> --- a/drivers/power/supply/bq27xxx_battery_i2c.c
> +++ b/drivers/power/supply/bq27xxx_battery_i2c.c
> @@ -205,7 +205,7 @@ static int bq27xxx_battery_i2c_probe(struct i2c_clien=
t *client,
>         return ret;
>  }
>
> -static int bq27xxx_battery_i2c_remove(struct i2c_client *client)
> +static void bq27xxx_battery_i2c_remove(struct i2c_client *client)
>  {
>         struct bq27xxx_device_info *di =3D i2c_get_clientdata(client);
>
> @@ -214,8 +214,6 @@ static int bq27xxx_battery_i2c_remove(struct i2c_clie=
nt *client)
>         mutex_lock(&battery_mutex);
>         idr_remove(&battery_id, di->id);
>         mutex_unlock(&battery_mutex);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id bq27xxx_i2c_id_table[] =3D {
> diff --git a/drivers/power/supply/cw2015_battery.c b/drivers/power/supply=
/cw2015_battery.c
> index 728e2a6cc9c3..81e17ad80163 100644
> --- a/drivers/power/supply/cw2015_battery.c
> +++ b/drivers/power/supply/cw2015_battery.c
> @@ -725,13 +725,12 @@ static int __maybe_unused cw_bat_resume(struct devi=
ce *dev)
>
>  static SIMPLE_DEV_PM_OPS(cw_bat_pm_ops, cw_bat_suspend, cw_bat_resume);
>
> -static int cw_bat_remove(struct i2c_client *client)
> +static void cw_bat_remove(struct i2c_client *client)
>  {
>         struct cw_battery *cw_bat =3D i2c_get_clientdata(client);
>
>         cancel_delayed_work_sync(&cw_bat->battery_delay_work);
>         power_supply_put_battery_info(cw_bat->rk_bat, cw_bat->battery);
> -       return 0;
>  }
>
>  static const struct i2c_device_id cw_bat_id_table[] =3D {
> diff --git a/drivers/power/supply/ds2782_battery.c b/drivers/power/supply=
/ds2782_battery.c
> index 9ae273fde7a2..d78cd05402f6 100644
> --- a/drivers/power/supply/ds2782_battery.c
> +++ b/drivers/power/supply/ds2782_battery.c
> @@ -312,7 +312,7 @@ static void ds278x_power_supply_init(struct power_sup=
ply_desc *battery)
>         battery->external_power_changed =3D NULL;
>  }
>
> -static int ds278x_battery_remove(struct i2c_client *client)
> +static void ds278x_battery_remove(struct i2c_client *client)
>  {
>         struct ds278x_info *info =3D i2c_get_clientdata(client);
>         int id =3D info->id;
> @@ -325,8 +325,6 @@ static int ds278x_battery_remove(struct i2c_client *c=
lient)
>         mutex_lock(&battery_lock);
>         idr_remove(&battery_id, id);
>         mutex_unlock(&battery_lock);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/power/supply/lp8727_charger.c b/drivers/power/supply=
/lp8727_charger.c
> index 9ee54e397754..384a374b52c1 100644
> --- a/drivers/power/supply/lp8727_charger.c
> +++ b/drivers/power/supply/lp8727_charger.c
> @@ -590,13 +590,12 @@ static int lp8727_probe(struct i2c_client *cl, cons=
t struct i2c_device_id *id)
>         return 0;
>  }
>
> -static int lp8727_remove(struct i2c_client *cl)
> +static void lp8727_remove(struct i2c_client *cl)
>  {
>         struct lp8727_chg *pchg =3D i2c_get_clientdata(cl);
>
>         lp8727_release_irq(pchg);
>         lp8727_unregister_psy(pchg);
> -       return 0;
>  }
>
>  static const struct of_device_id lp8727_dt_ids[] =3D {
> diff --git a/drivers/power/supply/rt5033_battery.c b/drivers/power/supply=
/rt5033_battery.c
> index 7a23c70f4879..736dec608ff6 100644
> --- a/drivers/power/supply/rt5033_battery.c
> +++ b/drivers/power/supply/rt5033_battery.c
> @@ -149,13 +149,11 @@ static int rt5033_battery_probe(struct i2c_client *=
client,
>         return 0;
>  }
>
> -static int rt5033_battery_remove(struct i2c_client *client)
> +static void rt5033_battery_remove(struct i2c_client *client)
>  {
>         struct rt5033_battery *battery =3D i2c_get_clientdata(client);
>
>         power_supply_unregister(battery->psy);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id rt5033_battery_id[] =3D {
> diff --git a/drivers/power/supply/rt9455_charger.c b/drivers/power/supply=
/rt9455_charger.c
> index 74ee54320e6a..72962286d704 100644
> --- a/drivers/power/supply/rt9455_charger.c
> +++ b/drivers/power/supply/rt9455_charger.c
> @@ -1698,7 +1698,7 @@ static int rt9455_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int rt9455_remove(struct i2c_client *client)
> +static void rt9455_remove(struct i2c_client *client)
>  {
>         int ret;
>         struct rt9455_info *info =3D i2c_get_clientdata(client);
> @@ -1715,8 +1715,6 @@ static int rt9455_remove(struct i2c_client *client)
>         cancel_delayed_work_sync(&info->pwr_rdy_work);
>         cancel_delayed_work_sync(&info->max_charging_time_work);
>         cancel_delayed_work_sync(&info->batt_presence_work);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id rt9455_i2c_id_table[] =3D {
> diff --git a/drivers/power/supply/smb347-charger.c b/drivers/power/supply=
/smb347-charger.c
> index 1511f71f937c..996a82f8a2a1 100644
> --- a/drivers/power/supply/smb347-charger.c
> +++ b/drivers/power/supply/smb347-charger.c
> @@ -1595,14 +1595,12 @@ static int smb347_probe(struct i2c_client *client=
,
>         return 0;
>  }
>
> -static int smb347_remove(struct i2c_client *client)
> +static void smb347_remove(struct i2c_client *client)
>  {
>         struct smb347_charger *smb =3D i2c_get_clientdata(client);
>
>         smb347_usb_vbus_regulator_disable(smb->usb_rdev);
>         smb347_irq_disable(smb);
> -
> -       return 0;
>  }
>
>  static void smb347_shutdown(struct i2c_client *client)
> diff --git a/drivers/power/supply/z2_battery.c b/drivers/power/supply/z2_=
battery.c
> index 7ed4e4bb26ec..1897c2984860 100644
> --- a/drivers/power/supply/z2_battery.c
> +++ b/drivers/power/supply/z2_battery.c
> @@ -251,7 +251,7 @@ static int z2_batt_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int z2_batt_remove(struct i2c_client *client)
> +static void z2_batt_remove(struct i2c_client *client)
>  {
>         struct z2_charger *charger =3D i2c_get_clientdata(client);
>
> @@ -263,8 +263,6 @@ static int z2_batt_remove(struct i2c_client *client)
>                 free_irq(gpiod_to_irq(charger->charge_gpiod), charger);
>
>         kfree(charger);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM
> diff --git a/drivers/pwm/pwm-pca9685.c b/drivers/pwm/pwm-pca9685.c
> index c91fa7f9e33d..f230c10d28bb 100644
> --- a/drivers/pwm/pwm-pca9685.c
> +++ b/drivers/pwm/pwm-pca9685.c
> @@ -598,7 +598,7 @@ static int pca9685_pwm_probe(struct i2c_client *clien=
t,
>         return 0;
>  }
>
> -static int pca9685_pwm_remove(struct i2c_client *client)
> +static void pca9685_pwm_remove(struct i2c_client *client)
>  {
>         struct pca9685 *pca =3D i2c_get_clientdata(client);
>
> @@ -610,8 +610,6 @@ static int pca9685_pwm_remove(struct i2c_client *clie=
nt)
>         }
>
>         pm_runtime_disable(&client->dev);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused pca9685_pwm_runtime_suspend(struct device *dev=
)
> diff --git a/drivers/regulator/da9121-regulator.c b/drivers/regulator/da9=
121-regulator.c
> index 76e0e23bf598..e4c753b83088 100644
> --- a/drivers/regulator/da9121-regulator.c
> +++ b/drivers/regulator/da9121-regulator.c
> @@ -1164,7 +1164,7 @@ static int da9121_i2c_probe(struct i2c_client *i2c,
>         return ret;
>  }
>
> -static int da9121_i2c_remove(struct i2c_client *i2c)
> +static void da9121_i2c_remove(struct i2c_client *i2c)
>  {
>         struct da9121 *chip =3D i2c_get_clientdata(i2c);
>         const int mask_all[4] =3D { 0xFF, 0xFF, 0xFF, 0xFF };
> @@ -1176,7 +1176,6 @@ static int da9121_i2c_remove(struct i2c_client *i2c=
)
>         ret =3D regmap_bulk_write(chip->regmap, DA9121_REG_SYS_MASK_0, ma=
sk_all, 4);
>         if (ret !=3D 0)
>                 dev_err(chip->dev, "Failed to set IRQ masks: %d\n", ret);
> -       return 0;
>  }
>
>  static const struct i2c_device_id da9121_i2c_id[] =3D {
> diff --git a/drivers/regulator/lp8755.c b/drivers/regulator/lp8755.c
> index 321bec6e3f8d..31b43426d47c 100644
> --- a/drivers/regulator/lp8755.c
> +++ b/drivers/regulator/lp8755.c
> @@ -422,15 +422,13 @@ static int lp8755_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int lp8755_remove(struct i2c_client *client)
> +static void lp8755_remove(struct i2c_client *client)
>  {
>         int icnt;
>         struct lp8755_chip *pchip =3D i2c_get_clientdata(client);
>
>         for (icnt =3D 0; icnt < LP8755_BUCK_MAX; icnt++)
>                 regmap_write(pchip->regmap, icnt, 0x00);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id lp8755_id[] =3D {
> diff --git a/drivers/regulator/rpi-panel-attiny-regulator.c b/drivers/reg=
ulator/rpi-panel-attiny-regulator.c
> index fa8706a352ce..04b4ab131985 100644
> --- a/drivers/regulator/rpi-panel-attiny-regulator.c
> +++ b/drivers/regulator/rpi-panel-attiny-regulator.c
> @@ -385,13 +385,11 @@ static int attiny_i2c_probe(struct i2c_client *i2c,
>         return ret;
>  }
>
> -static int attiny_i2c_remove(struct i2c_client *client)
> +static void attiny_i2c_remove(struct i2c_client *client)
>  {
>         struct attiny_lcd *state =3D i2c_get_clientdata(client);
>
>         mutex_destroy(&state->lock);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id attiny_dt_ids[] =3D {
> diff --git a/drivers/rtc/rtc-bq32k.c b/drivers/rtc/rtc-bq32k.c
> index 2235c968842d..f198663f20c7 100644
> --- a/drivers/rtc/rtc-bq32k.c
> +++ b/drivers/rtc/rtc-bq32k.c
> @@ -298,11 +298,9 @@ static int bq32k_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int bq32k_remove(struct i2c_client *client)
> +static void bq32k_remove(struct i2c_client *client)
>  {
>         bq32k_sysfs_unregister(&client->dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id bq32k_id[] =3D {
> diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c
> index 8db5a631bca8..44148802b1a5 100644
> --- a/drivers/rtc/rtc-ds1374.c
> +++ b/drivers/rtc/rtc-ds1374.c
> @@ -531,7 +531,7 @@ static int ds1374_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int ds1374_remove(struct i2c_client *client)
> +static void ds1374_remove(struct i2c_client *client)
>  {
>         struct ds1374 *ds1374 =3D i2c_get_clientdata(client);
>
> @@ -543,8 +543,6 @@ static int ds1374_remove(struct i2c_client *client)
>                 devm_free_irq(&client->dev, client->irq, client);
>                 cancel_work_sync(&ds1374->work);
>         }
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/rtc/rtc-isl12026.c b/drivers/rtc/rtc-isl12026.c
> index 1fc6627d854d..1bfca39079d4 100644
> --- a/drivers/rtc/rtc-isl12026.c
> +++ b/drivers/rtc/rtc-isl12026.c
> @@ -472,12 +472,11 @@ static int isl12026_probe_new(struct i2c_client *cl=
ient)
>         return devm_rtc_register_device(priv->rtc);
>  }
>
> -static int isl12026_remove(struct i2c_client *client)
> +static void isl12026_remove(struct i2c_client *client)
>  {
>         struct isl12026 *priv =3D i2c_get_clientdata(client);
>
>         i2c_unregister_device(priv->nvm_client);
> -       return 0;
>  }
>
>  static const struct of_device_id isl12026_dt_match[] =3D {
> diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
> index d868458cd40e..e0b4d3794320 100644
> --- a/drivers/rtc/rtc-m41t80.c
> +++ b/drivers/rtc/rtc-m41t80.c
> @@ -989,7 +989,7 @@ static int m41t80_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int m41t80_remove(struct i2c_client *client)
> +static void m41t80_remove(struct i2c_client *client)
>  {
>  #ifdef CONFIG_RTC_DRV_M41T80_WDT
>         struct m41t80_data *clientdata =3D i2c_get_clientdata(client);
> @@ -999,8 +999,6 @@ static int m41t80_remove(struct i2c_client *client)
>                 unregister_reboot_notifier(&wdt_notifier);
>         }
>  #endif
> -
> -       return 0;
>  }
>
>  static struct i2c_driver m41t80_driver =3D {
> diff --git a/drivers/rtc/rtc-rs5c372.c b/drivers/rtc/rtc-rs5c372.c
> index cb15983383f5..9562c477e1c9 100644
> --- a/drivers/rtc/rtc-rs5c372.c
> +++ b/drivers/rtc/rtc-rs5c372.c
> @@ -910,10 +910,9 @@ static int rs5c372_probe(struct i2c_client *client,
>         return err;
>  }
>
> -static int rs5c372_remove(struct i2c_client *client)
> +static void rs5c372_remove(struct i2c_client *client)
>  {
>         rs5c_sysfs_unregister(&client->dev);
> -       return 0;
>  }
>
>  static struct i2c_driver rs5c372_driver =3D {
> diff --git a/drivers/rtc/rtc-x1205.c b/drivers/rtc/rtc-x1205.c
> index d1d5a44d9122..7792e22de805 100644
> --- a/drivers/rtc/rtc-x1205.c
> +++ b/drivers/rtc/rtc-x1205.c
> @@ -658,10 +658,9 @@ static int x1205_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int x1205_remove(struct i2c_client *client)
> +static void x1205_remove(struct i2c_client *client)
>  {
>         x1205_sysfs_unregister(&client->dev);
> -       return 0;
>  }
>
>  static const struct i2c_device_id x1205_id[] =3D {
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers=
/staging/media/atomisp/i2c/atomisp-gc0310.c
> index cbc8b1d91995..783f1b88ebf2 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -1194,7 +1194,7 @@ static const struct v4l2_subdev_ops gc0310_ops =3D =
{
>         .sensor =3D &gc0310_sensor_ops,
>  };
>
> -static int gc0310_remove(struct i2c_client *client)
> +static void gc0310_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct gc0310_device *dev =3D to_gc0310_sensor(sd);
> @@ -1207,8 +1207,6 @@ static int gc0310_remove(struct i2c_client *client)
>         media_entity_cleanup(&dev->sd.entity);
>         v4l2_ctrl_handler_free(&dev->ctrl_handler);
>         kfree(dev);
> -
> -       return 0;
>  }
>
>  static int gc0310_probe(struct i2c_client *client)
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers=
/staging/media/atomisp/i2c/atomisp-gc2235.c
> index 0e6b2e6100d1..4d5a7e335f85 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -952,7 +952,7 @@ static const struct v4l2_subdev_ops gc2235_ops =3D {
>         .sensor =3D &gc2235_sensor_ops,
>  };
>
> -static int gc2235_remove(struct i2c_client *client)
> +static void gc2235_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct gc2235_device *dev =3D to_gc2235_sensor(sd);
> @@ -965,8 +965,6 @@ static int gc2235_remove(struct i2c_client *client)
>         media_entity_cleanup(&dev->sd.entity);
>         v4l2_ctrl_handler_free(&dev->ctrl_handler);
>         kfree(dev);
> -
> -       return 0;
>  }
>
>  static int gc2235_probe(struct i2c_client *client)
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c b/drivers=
/staging/media/atomisp/i2c/atomisp-lm3554.c
> index e046489cd253..75d16b525294 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
> @@ -910,7 +910,7 @@ static int lm3554_probe(struct i2c_client *client)
>         return err;
>  }
>
> -static int lm3554_remove(struct i2c_client *client)
> +static void lm3554_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct lm3554 *flash =3D to_lm3554(sd);
> @@ -926,8 +926,6 @@ static int lm3554_remove(struct i2c_client *client)
>         lm3554_gpio_uninit(client);
>
>         kfree(flash);
> -
> -       return 0;
>  }
>
>  static const struct dev_pm_ops lm3554_pm_ops =3D {
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/driver=
s/staging/media/atomisp/i2c/atomisp-mt9m114.c
> index 00d6842c07d6..4601a238cb89 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> @@ -1711,7 +1711,7 @@ static const struct v4l2_subdev_ops mt9m114_ops =3D=
 {
>         .sensor =3D &mt9m114_sensor_ops,
>  };
>
> -static int mt9m114_remove(struct i2c_client *client)
> +static void mt9m114_remove(struct i2c_client *client)
>  {
>         struct mt9m114_device *dev;
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> @@ -1722,7 +1722,6 @@ static int mt9m114_remove(struct i2c_client *client=
)
>         media_entity_cleanup(&dev->sd.entity);
>         v4l2_ctrl_handler_free(&dev->ctrl_handler);
>         kfree(dev);
> -       return 0;
>  }
>
>  static int mt9m114_probe(struct i2c_client *client)
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers=
/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 4ba99c660681..8f48b23be3aa 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -1135,7 +1135,7 @@ static const struct v4l2_subdev_ops ov2680_ops =3D =
{
>         .sensor =3D &ov2680_sensor_ops,
>  };
>
> -static int ov2680_remove(struct i2c_client *client)
> +static void ov2680_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov2680_device *dev =3D to_ov2680_sensor(sd);
> @@ -1148,8 +1148,6 @@ static int ov2680_remove(struct i2c_client *client)
>         media_entity_cleanup(&dev->sd.entity);
>         v4l2_ctrl_handler_free(&dev->ctrl_handler);
>         kfree(dev);
> -
> -       return 0;
>  }
>
>  static int ov2680_probe(struct i2c_client *client)
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers=
/staging/media/atomisp/i2c/atomisp-ov2722.c
> index da98094d7094..715a7aeeda18 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> @@ -1094,7 +1094,7 @@ static const struct v4l2_subdev_ops ov2722_ops =3D =
{
>         .sensor =3D &ov2722_sensor_ops,
>  };
>
> -static int ov2722_remove(struct i2c_client *client)
> +static void ov2722_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov2722_device *dev =3D to_ov2722_sensor(sd);
> @@ -1107,8 +1107,6 @@ static int ov2722_remove(struct i2c_client *client)
>
>         media_entity_cleanup(&dev->sd.entity);
>         kfree(dev);
> -
> -       return 0;
>  }
>
>  static int __ov2722_init_ctrl_handler(struct ov2722_device *dev)
> diff --git a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c b/=
drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
> index 6c95f57a52e9..c1cd631455e6 100644
> --- a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
> +++ b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
> @@ -1877,7 +1877,7 @@ static const struct v4l2_subdev_ops ov5693_ops =3D =
{
>         .pad =3D &ov5693_pad_ops,
>  };
>
> -static int ov5693_remove(struct i2c_client *client)
> +static void ov5693_remove(struct i2c_client *client)
>  {
>         struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
>         struct ov5693_device *dev =3D to_ov5693_sensor(sd);
> @@ -1893,8 +1893,6 @@ static int ov5693_remove(struct i2c_client *client)
>         media_entity_cleanup(&dev->sd.entity);
>         v4l2_ctrl_handler_free(&dev->ctrl_handler);
>         kfree(dev);
> -
> -       return 0;
>  }
>
>  static int ov5693_probe(struct i2c_client *client)
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/=
media/max96712/max96712.c
> index 6b5abd958bff..99b333b68198 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -407,15 +407,13 @@ static int max96712_probe(struct i2c_client *client=
)
>         return max96712_v4l2_register(priv);
>  }
>
> -static int max96712_remove(struct i2c_client *client)
> +static void max96712_remove(struct i2c_client *client)
>  {
>         struct max96712_priv *priv =3D i2c_get_clientdata(client);
>
>         v4l2_async_unregister_subdev(&priv->sd);
>
>         gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id max96712_of_table[] =3D {
> diff --git a/drivers/staging/most/i2c/i2c.c b/drivers/staging/most/i2c/i2=
c.c
> index 7042f10887bb..285a071f02be 100644
> --- a/drivers/staging/most/i2c/i2c.c
> +++ b/drivers/staging/most/i2c/i2c.c
> @@ -340,14 +340,12 @@ static int i2c_probe(struct i2c_client *client, con=
st struct i2c_device_id *id)
>   *
>   * Unregister the i2c client device as a MOST interface
>   */
> -static int i2c_remove(struct i2c_client *client)
> +static void i2c_remove(struct i2c_client *client)
>  {
>         struct hdm_i2c *dev =3D i2c_get_clientdata(client);
>
>         most_deregister_interface(&dev->most_iface);
>         kfree(dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id i2c_id[] =3D {
> diff --git a/drivers/staging/olpc_dcon/olpc_dcon.c b/drivers/staging/olpc=
_dcon/olpc_dcon.c
> index 7284cb4ac395..aea2841f7598 100644
> --- a/drivers/staging/olpc_dcon/olpc_dcon.c
> +++ b/drivers/staging/olpc_dcon/olpc_dcon.c
> @@ -671,7 +671,7 @@ static int dcon_probe(struct i2c_client *client, cons=
t struct i2c_device_id *id)
>         return rc;
>  }
>
> -static int dcon_remove(struct i2c_client *client)
> +static void dcon_remove(struct i2c_client *client)
>  {
>         struct dcon_priv *dcon =3D i2c_get_clientdata(client);
>
> @@ -687,8 +687,6 @@ static int dcon_remove(struct i2c_client *client)
>         cancel_work_sync(&dcon->switch_source);
>
>         kfree(dcon);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM
> diff --git a/drivers/tty/serial/sc16is7xx.c b/drivers/tty/serial/sc16is7x=
x.c
> index 8472bf70477c..cc3b22cbda9b 100644
> --- a/drivers/tty/serial/sc16is7xx.c
> +++ b/drivers/tty/serial/sc16is7xx.c
> @@ -1683,11 +1683,9 @@ static int sc16is7xx_i2c_probe(struct i2c_client *=
i2c,
>         return sc16is7xx_probe(&i2c->dev, devtype, regmap, i2c->irq);
>  }
>
> -static int sc16is7xx_i2c_remove(struct i2c_client *client)
> +static void sc16is7xx_i2c_remove(struct i2c_client *client)
>  {
>         sc16is7xx_remove(&client->dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id sc16is7xx_i2c_id_table[] =3D {
> diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
> index 330f494cd158..3c9fa663475f 100644
> --- a/drivers/usb/misc/usb3503.c
> +++ b/drivers/usb/misc/usb3503.c
> @@ -289,14 +289,12 @@ static int usb3503_i2c_probe(struct i2c_client *i2c=
,
>         return usb3503_probe(hub);
>  }
>
> -static int usb3503_i2c_remove(struct i2c_client *i2c)
> +static void usb3503_i2c_remove(struct i2c_client *i2c)
>  {
>         struct usb3503 *hub;
>
>         hub =3D i2c_get_clientdata(i2c);
>         clk_disable_unprepare(hub->clk);
> -
> -       return 0;
>  }
>
>  static int usb3503_platform_probe(struct platform_device *pdev)
> diff --git a/drivers/usb/phy/phy-isp1301-omap.c b/drivers/usb/phy/phy-isp=
1301-omap.c
> index f8bd93fe69cd..e5d3f206097c 100644
> --- a/drivers/usb/phy/phy-isp1301-omap.c
> +++ b/drivers/usb/phy/phy-isp1301-omap.c
> @@ -1196,7 +1196,7 @@ static void isp1301_release(struct device *dev)
>
>  static struct isp1301 *the_transceiver;
>
> -static int isp1301_remove(struct i2c_client *i2c)
> +static void isp1301_remove(struct i2c_client *i2c)
>  {
>         struct isp1301  *isp;
>
> @@ -1214,8 +1214,6 @@ static int isp1301_remove(struct i2c_client *i2c)
>
>         put_device(&i2c->dev);
>         the_transceiver =3D NULL;
> -
> -       return 0;
>  }
>
>  /*----------------------------------------------------------------------=
---*/
> diff --git a/drivers/usb/phy/phy-isp1301.c b/drivers/usb/phy/phy-isp1301.=
c
> index ad3d57f1c273..c2777a5c1f4e 100644
> --- a/drivers/usb/phy/phy-isp1301.c
> +++ b/drivers/usb/phy/phy-isp1301.c
> @@ -120,14 +120,12 @@ static int isp1301_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int isp1301_remove(struct i2c_client *client)
> +static void isp1301_remove(struct i2c_client *client)
>  {
>         struct isp1301 *isp =3D i2c_get_clientdata(client);
>
>         usb_remove_phy(&isp->phy);
>         isp1301_i2c_client =3D NULL;
> -
> -       return 0;
>  }
>
>  static struct i2c_driver isp1301_driver =3D {
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.=
c
> index cd47c3597e19..2a58185fb14c 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -245,14 +245,12 @@ static int hd3ss3220_probe(struct i2c_client *clien=
t,
>         return ret;
>  }
>
> -static int hd3ss3220_remove(struct i2c_client *client)
> +static void hd3ss3220_remove(struct i2c_client *client)
>  {
>         struct hd3ss3220 *hd3ss3220 =3D i2c_get_clientdata(client);
>
>         typec_unregister_port(hd3ss3220->port);
>         usb_role_switch_put(hd3ss3220->role_sw);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id dev_ids[] =3D {
> diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4=
480.c
> index 6184f5367190..d6495e533e58 100644
> --- a/drivers/usb/typec/mux/fsa4480.c
> +++ b/drivers/usb/typec/mux/fsa4480.c
> @@ -181,14 +181,12 @@ static int fsa4480_probe(struct i2c_client *client)
>         return 0;
>  }
>
> -static int fsa4480_remove(struct i2c_client *client)
> +static void fsa4480_remove(struct i2c_client *client)
>  {
>         struct fsa4480 *fsa =3D i2c_get_clientdata(client);
>
>         typec_mux_unregister(fsa->mux);
>         typec_switch_unregister(fsa->sw);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id fsa4480_table[] =3D {
> diff --git a/drivers/usb/typec/mux/pi3usb30532.c b/drivers/usb/typec/mux/=
pi3usb30532.c
> index 6ce9f282594e..1cd388b55c30 100644
> --- a/drivers/usb/typec/mux/pi3usb30532.c
> +++ b/drivers/usb/typec/mux/pi3usb30532.c
> @@ -160,13 +160,12 @@ static int pi3usb30532_probe(struct i2c_client *cli=
ent)
>         return 0;
>  }
>
> -static int pi3usb30532_remove(struct i2c_client *client)
> +static void pi3usb30532_remove(struct i2c_client *client)
>  {
>         struct pi3usb30532 *pi =3D i2c_get_clientdata(client);
>
>         typec_mux_unregister(pi->mux);
>         typec_switch_unregister(pi->sw);
> -       return 0;
>  }
>
>  static const struct i2c_device_id pi3usb30532_table[] =3D {
> diff --git a/drivers/usb/typec/rt1719.c b/drivers/usb/typec/rt1719.c
> index f1b698edd7eb..ea8b700b0ceb 100644
> --- a/drivers/usb/typec/rt1719.c
> +++ b/drivers/usb/typec/rt1719.c
> @@ -930,14 +930,12 @@ static int rt1719_probe(struct i2c_client *i2c)
>         return ret;
>  }
>
> -static int rt1719_remove(struct i2c_client *i2c)
> +static void rt1719_remove(struct i2c_client *i2c)
>  {
>         struct rt1719_data *data =3D i2c_get_clientdata(i2c);
>
>         typec_unregister_port(data->port);
>         usb_role_switch_put(data->role_sw);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id __maybe_unused rt1719_device_table[] =
=3D {
> diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.=
c
> index e7745d1c2a5c..8638f1d39896 100644
> --- a/drivers/usb/typec/stusb160x.c
> +++ b/drivers/usb/typec/stusb160x.c
> @@ -801,7 +801,7 @@ static int stusb160x_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int stusb160x_remove(struct i2c_client *client)
> +static void stusb160x_remove(struct i2c_client *client)
>  {
>         struct stusb160x *chip =3D i2c_get_clientdata(client);
>
> @@ -823,8 +823,6 @@ static int stusb160x_remove(struct i2c_client *client=
)
>
>         if (chip->main_supply)
>                 regulator_disable(chip->main_supply);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused stusb160x_suspend(struct device *dev)
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fu=
sb302.c
> index 96c55eaf3f80..5e9348f28d50 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -1771,7 +1771,7 @@ static int fusb302_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int fusb302_remove(struct i2c_client *client)
> +static void fusb302_remove(struct i2c_client *client)
>  {
>         struct fusb302_chip *chip =3D i2c_get_clientdata(client);
>
> @@ -1783,8 +1783,6 @@ static int fusb302_remove(struct i2c_client *client=
)
>         fwnode_handle_put(chip->tcpc_dev.fwnode);
>         destroy_workqueue(chip->wq);
>         fusb302_debugfs_exit(chip);
> -
> -       return 0;
>  }
>
>  static int fusb302_pm_suspend(struct device *dev)
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpc=
i.c
> index f33e08eb7670..c48fca60bb06 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -869,7 +869,7 @@ static int tcpci_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int tcpci_remove(struct i2c_client *client)
> +static void tcpci_remove(struct i2c_client *client)
>  {
>         struct tcpci_chip *chip =3D i2c_get_clientdata(client);
>         int err;
> @@ -880,8 +880,6 @@ static int tcpci_remove(struct i2c_client *client)
>                 dev_warn(&client->dev, "Failed to disable irqs (%pe)\n", =
ERR_PTR(err));
>
>         tcpci_unregister_port(chip->tcpci);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id tcpci_id[] =3D {
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcp=
m/tcpci_maxim.c
> index df2505570f07..a11be5754128 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim.c
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
> @@ -493,14 +493,12 @@ static int max_tcpci_probe(struct i2c_client *clien=
t, const struct i2c_device_id
>         return ret;
>  }
>
> -static int max_tcpci_remove(struct i2c_client *client)
> +static void max_tcpci_remove(struct i2c_client *client)
>  {
>         struct max_tcpci_chip *chip =3D i2c_get_clientdata(client);
>
>         if (!IS_ERR_OR_NULL(chip->tcpci))
>                 tcpci_unregister_port(chip->tcpci);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id max_tcpci_id[] =3D {
> diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/t=
cpm/tcpci_rt1711h.c
> index b56a0880a044..9ad4924b4ba7 100644
> --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> @@ -263,12 +263,11 @@ static int rt1711h_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int rt1711h_remove(struct i2c_client *client)
> +static void rt1711h_remove(struct i2c_client *client)
>  {
>         struct rt1711h_chip *chip =3D i2c_get_clientdata(client);
>
>         tcpci_unregister_port(chip->tcpci);
> -       return 0;
>  }
>
>  static const struct i2c_device_id rt1711h_id[] =3D {
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.=
c
> index dfbba5ae9487..b637e8b378b3 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -857,15 +857,13 @@ static int tps6598x_probe(struct i2c_client *client=
)
>         return ret;
>  }
>
> -static int tps6598x_remove(struct i2c_client *client)
> +static void tps6598x_remove(struct i2c_client *client)
>  {
>         struct tps6598x *tps =3D i2c_get_clientdata(client);
>
>         tps6598x_disconnect(tps, 0);
>         typec_unregister_port(tps->port);
>         usb_role_switch_put(tps->role_sw);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id tps6598x_of_match[] =3D {
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/u=
csi_ccg.c
> index 6db7c8ddd51c..920b7e743f56 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1398,7 +1398,7 @@ static int ucsi_ccg_probe(struct i2c_client *client=
,
>         return status;
>  }
>
> -static int ucsi_ccg_remove(struct i2c_client *client)
> +static void ucsi_ccg_remove(struct i2c_client *client)
>  {
>         struct ucsi_ccg *uc =3D i2c_get_clientdata(client);
>
> @@ -1408,8 +1408,6 @@ static int ucsi_ccg_remove(struct i2c_client *clien=
t)
>         ucsi_unregister(uc->ucsi);
>         ucsi_destroy(uc->ucsi);
>         free_irq(uc->irq, uc);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ucsi_ccg_device_id[] =3D {
> diff --git a/drivers/usb/typec/wusb3801.c b/drivers/usb/typec/wusb3801.c
> index e63509f8b01e..3cc7a15ecbd3 100644
> --- a/drivers/usb/typec/wusb3801.c
> +++ b/drivers/usb/typec/wusb3801.c
> @@ -399,7 +399,7 @@ static int wusb3801_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int wusb3801_remove(struct i2c_client *client)
> +static void wusb3801_remove(struct i2c_client *client)
>  {
>         struct wusb3801 *wusb3801 =3D i2c_get_clientdata(client);
>
> @@ -411,8 +411,6 @@ static int wusb3801_remove(struct i2c_client *client)
>
>         if (wusb3801->vbus_on)
>                 regulator_disable(wusb3801->vbus_supply);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id wusb3801_of_match[] =3D {
> diff --git a/drivers/video/backlight/adp8860_bl.c b/drivers/video/backlig=
ht/adp8860_bl.c
> index 8ec19425671f..b0fe02273e87 100644
> --- a/drivers/video/backlight/adp8860_bl.c
> +++ b/drivers/video/backlight/adp8860_bl.c
> @@ -753,7 +753,7 @@ static int adp8860_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int adp8860_remove(struct i2c_client *client)
> +static void adp8860_remove(struct i2c_client *client)
>  {
>         struct adp8860_bl *data =3D i2c_get_clientdata(client);
>
> @@ -765,8 +765,6 @@ static int adp8860_remove(struct i2c_client *client)
>         if (data->en_ambl_sens)
>                 sysfs_remove_group(&data->bl->dev.kobj,
>                         &adp8860_bl_attr_group);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/video/backlight/adp8870_bl.c b/drivers/video/backlig=
ht/adp8870_bl.c
> index 8b5213a39527..5becace3fd0f 100644
> --- a/drivers/video/backlight/adp8870_bl.c
> +++ b/drivers/video/backlight/adp8870_bl.c
> @@ -925,7 +925,7 @@ static int adp8870_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int adp8870_remove(struct i2c_client *client)
> +static void adp8870_remove(struct i2c_client *client)
>  {
>         struct adp8870_bl *data =3D i2c_get_clientdata(client);
>
> @@ -937,8 +937,6 @@ static int adp8870_remove(struct i2c_client *client)
>         if (data->pdata->en_ambl_sens)
>                 sysfs_remove_group(&data->bl->dev.kobj,
>                         &adp8870_bl_attr_group);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/video/backlight/arcxcnn_bl.c b/drivers/video/backlig=
ht/arcxcnn_bl.c
> index 7b1c0a0e6cad..060c0eef6a52 100644
> --- a/drivers/video/backlight/arcxcnn_bl.c
> +++ b/drivers/video/backlight/arcxcnn_bl.c
> @@ -362,7 +362,7 @@ static int arcxcnn_probe(struct i2c_client *cl, const=
 struct i2c_device_id *id)
>         return ret;
>  }
>
> -static int arcxcnn_remove(struct i2c_client *cl)
> +static void arcxcnn_remove(struct i2c_client *cl)
>  {
>         struct arcxcnn *lp =3D i2c_get_clientdata(cl);
>
> @@ -376,8 +376,6 @@ static int arcxcnn_remove(struct i2c_client *cl)
>         lp->bl->props.brightness =3D 0;
>
>         backlight_update_status(lp->bl);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id arcxcnn_dt_ids[] =3D {
> diff --git a/drivers/video/backlight/bd6107.c b/drivers/video/backlight/b=
d6107.c
> index 515184fbe33a..a506872d4396 100644
> --- a/drivers/video/backlight/bd6107.c
> +++ b/drivers/video/backlight/bd6107.c
> @@ -175,14 +175,12 @@ static int bd6107_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int bd6107_remove(struct i2c_client *client)
> +static void bd6107_remove(struct i2c_client *client)
>  {
>         struct backlight_device *backlight =3D i2c_get_clientdata(client)=
;
>
>         backlight->props.brightness =3D 0;
>         backlight_update_status(backlight);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id bd6107_ids[] =3D {
> diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlig=
ht/lm3630a_bl.c
> index 1d17c439430e..475f35635bf6 100644
> --- a/drivers/video/backlight/lm3630a_bl.c
> +++ b/drivers/video/backlight/lm3630a_bl.c
> @@ -579,7 +579,7 @@ static int lm3630a_probe(struct i2c_client *client,
>         return 0;
>  }
>
> -static int lm3630a_remove(struct i2c_client *client)
> +static void lm3630a_remove(struct i2c_client *client)
>  {
>         int rval;
>         struct lm3630a_chip *pchip =3D i2c_get_clientdata(client);
> @@ -596,7 +596,6 @@ static int lm3630a_remove(struct i2c_client *client)
>                 free_irq(pchip->irq, pchip);
>                 destroy_workqueue(pchip->irqthread);
>         }
> -       return 0;
>  }
>
>  static const struct i2c_device_id lm3630a_id[] =3D {
> diff --git a/drivers/video/backlight/lm3639_bl.c b/drivers/video/backligh=
t/lm3639_bl.c
> index 48c04155a5f9..6580911671a3 100644
> --- a/drivers/video/backlight/lm3639_bl.c
> +++ b/drivers/video/backlight/lm3639_bl.c
> @@ -390,7 +390,7 @@ static int lm3639_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int lm3639_remove(struct i2c_client *client)
> +static void lm3639_remove(struct i2c_client *client)
>  {
>         struct lm3639_chip_data *pchip =3D i2c_get_clientdata(client);
>
> @@ -400,7 +400,6 @@ static int lm3639_remove(struct i2c_client *client)
>         led_classdev_unregister(&pchip->cdev_flash);
>         if (pchip->bled)
>                 device_remove_file(&(pchip->bled->dev), &dev_attr_bled_mo=
de);
> -       return 0;
>  }
>
>  static const struct i2c_device_id lm3639_id[] =3D {
> diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backligh=
t/lp855x_bl.c
> index 2b9e2bbbb03e..43b39cf68b04 100644
> --- a/drivers/video/backlight/lp855x_bl.c
> +++ b/drivers/video/backlight/lp855x_bl.c
> @@ -537,7 +537,7 @@ static int lp855x_probe(struct i2c_client *cl, const =
struct i2c_device_id *id)
>         return ret;
>  }
>
> -static int lp855x_remove(struct i2c_client *cl)
> +static void lp855x_remove(struct i2c_client *cl)
>  {
>         struct lp855x *lp =3D i2c_get_clientdata(cl);
>
> @@ -548,8 +548,6 @@ static int lp855x_remove(struct i2c_client *cl)
>         if (lp->supply)
>                 regulator_disable(lp->supply);
>         sysfs_remove_group(&lp->dev->kobj, &lp855x_attr_group);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id lp855x_dt_ids[] =3D {
> diff --git a/drivers/video/backlight/lv5207lp.c b/drivers/video/backlight=
/lv5207lp.c
> index 1842ae9a55f8..767b800d79fa 100644
> --- a/drivers/video/backlight/lv5207lp.c
> +++ b/drivers/video/backlight/lv5207lp.c
> @@ -124,14 +124,12 @@ static int lv5207lp_probe(struct i2c_client *client=
,
>         return 0;
>  }
>
> -static int lv5207lp_remove(struct i2c_client *client)
> +static void lv5207lp_remove(struct i2c_client *client)
>  {
>         struct backlight_device *backlight =3D i2c_get_clientdata(client)=
;
>
>         backlight->props.brightness =3D 0;
>         backlight_update_status(backlight);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id lv5207lp_ids[] =3D {
> diff --git a/drivers/video/backlight/tosa_bl.c b/drivers/video/backlight/=
tosa_bl.c
> index 6df6fcd132e3..f55b3d616a87 100644
> --- a/drivers/video/backlight/tosa_bl.c
> +++ b/drivers/video/backlight/tosa_bl.c
> @@ -121,12 +121,11 @@ static int tosa_bl_probe(struct i2c_client *client,
>         return ret;
>  }
>
> -static int tosa_bl_remove(struct i2c_client *client)
> +static void tosa_bl_remove(struct i2c_client *client)
>  {
>         struct tosa_bl_data *data =3D i2c_get_clientdata(client);
>
>         data->bl =3D NULL;
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/video/fbdev/matrox/matroxfb_maven.c b/drivers/video/=
fbdev/matrox/matroxfb_maven.c
> index 9a98c4a6ba33..f2e02958673d 100644
> --- a/drivers/video/fbdev/matrox/matroxfb_maven.c
> +++ b/drivers/video/fbdev/matrox/matroxfb_maven.c
> @@ -1276,11 +1276,10 @@ ERROR0:;
>         return err;
>  }
>
> -static int maven_remove(struct i2c_client *client)
> +static void maven_remove(struct i2c_client *client)
>  {
>         maven_shutdown_client(client);
>         kfree(i2c_get_clientdata(client));
> -       return 0;
>  }
>
>  static const struct i2c_device_id maven_id[] =3D {
> diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd130=
7fb.c
> index 5c765655d000..fbf26cdfb1c0 100644
> --- a/drivers/video/fbdev/ssd1307fb.c
> +++ b/drivers/video/fbdev/ssd1307fb.c
> @@ -817,7 +817,7 @@ static int ssd1307fb_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int ssd1307fb_remove(struct i2c_client *client)
> +static void ssd1307fb_remove(struct i2c_client *client)
>  {
>         struct fb_info *info =3D i2c_get_clientdata(client);
>         struct ssd1307fb_par *par =3D info->par;
> @@ -836,8 +836,6 @@ static int ssd1307fb_remove(struct i2c_client *client=
)
>         fb_deferred_io_cleanup(info);
>         __free_pages(__va(info->fix.smem_start), get_order(info->fix.smem=
_len));
>         framebuffer_release(info);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ssd1307fb_i2c_id[] =3D {
> diff --git a/drivers/w1/masters/ds2482.c b/drivers/w1/masters/ds2482.c
> index 6c962e88501c..62c44616d8a9 100644
> --- a/drivers/w1/masters/ds2482.c
> +++ b/drivers/w1/masters/ds2482.c
> @@ -525,7 +525,7 @@ static int ds2482_probe(struct i2c_client *client,
>         return err;
>  }
>
> -static int ds2482_remove(struct i2c_client *client)
> +static void ds2482_remove(struct i2c_client *client)
>  {
>         struct ds2482_data   *data =3D i2c_get_clientdata(client);
>         int idx;
> @@ -538,7 +538,6 @@ static int ds2482_remove(struct i2c_client *client)
>
>         /* Free the memory */
>         kfree(data);
> -       return 0;
>  }
>
>  /*
> diff --git a/drivers/watchdog/ziirave_wdt.c b/drivers/watchdog/ziirave_wd=
t.c
> index c5a9b820d43a..d0e88875443a 100644
> --- a/drivers/watchdog/ziirave_wdt.c
> +++ b/drivers/watchdog/ziirave_wdt.c
> @@ -708,13 +708,11 @@ static int ziirave_wdt_probe(struct i2c_client *cli=
ent,
>         return ret;
>  }
>
> -static int ziirave_wdt_remove(struct i2c_client *client)
> +static void ziirave_wdt_remove(struct i2c_client *client)
>  {
>         struct ziirave_wdt_data *w_priv =3D i2c_get_clientdata(client);
>
>         watchdog_unregister_device(&w_priv->wdd);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ziirave_wdt_id[] =3D {
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index fbda5ada2afc..066b541a0d5d 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -273,7 +273,7 @@ struct i2c_driver {
>
>         /* Standard driver model interfaces */
>         int (*probe)(struct i2c_client *client, const struct i2c_device_i=
d *id);
> -       int (*remove)(struct i2c_client *client);
> +       void (*remove)(struct i2c_client *client);
>
>         /* New driver model interface to aid the seamless removal of the
>          * current probe()'s, more commonly unused than used second param=
eter.
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index f0973da583e0..366e61639cb2 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -149,6 +149,7 @@ config KASAN_STACK
>         depends on KASAN_GENERIC || KASAN_SW_TAGS
>         depends on !ARCH_DISABLE_KASAN_INLINE
>         default y if CC_IS_GCC
> +       depends on !ARM
>         help
>           Disables stack instrumentation and thus KASAN's ability to dete=
ct
>           out-of-bounds bugs in stack variables.
> diff --git a/sound/aoa/codecs/onyx.c b/sound/aoa/codecs/onyx.c
> index 1abee841cc45..2d0f904aba00 100644
> --- a/sound/aoa/codecs/onyx.c
> +++ b/sound/aoa/codecs/onyx.c
> @@ -1029,7 +1029,7 @@ static int onyx_i2c_probe(struct i2c_client *client=
,
>         return -ENODEV;
>  }
>
> -static int onyx_i2c_remove(struct i2c_client *client)
> +static void onyx_i2c_remove(struct i2c_client *client)
>  {
>         struct onyx *onyx =3D i2c_get_clientdata(client);
>
> @@ -1037,7 +1037,6 @@ static int onyx_i2c_remove(struct i2c_client *clien=
t)
>         of_node_put(onyx->codec.node);
>         kfree(onyx->codec_info);
>         kfree(onyx);
> -       return 0;
>  }
>
>  static const struct i2c_device_id onyx_i2c_id[] =3D {
> diff --git a/sound/aoa/codecs/tas.c b/sound/aoa/codecs/tas.c
> index ab19a37e2a68..ab89475b7715 100644
> --- a/sound/aoa/codecs/tas.c
> +++ b/sound/aoa/codecs/tas.c
> @@ -912,7 +912,7 @@ static int tas_i2c_probe(struct i2c_client *client,
>         return -EINVAL;
>  }
>
> -static int tas_i2c_remove(struct i2c_client *client)
> +static void tas_i2c_remove(struct i2c_client *client)
>  {
>         struct tas *tas =3D i2c_get_clientdata(client);
>         u8 tmp =3D TAS_ACR_ANALOG_PDOWN;
> @@ -925,7 +925,6 @@ static int tas_i2c_remove(struct i2c_client *client)
>
>         mutex_destroy(&tas->mtx);
>         kfree(tas);
> -       return 0;
>  }
>
>  static const struct i2c_device_id tas_i2c_id[] =3D {
> diff --git a/sound/pci/hda/cs35l41_hda_i2c.c b/sound/pci/hda/cs35l41_hda_=
i2c.c
> index e810b278fb91..acab8c058e66 100644
> --- a/sound/pci/hda/cs35l41_hda_i2c.c
> +++ b/sound/pci/hda/cs35l41_hda_i2c.c
> @@ -30,11 +30,9 @@ static int cs35l41_hda_i2c_probe(struct i2c_client *cl=
t, const struct i2c_device
>                                  devm_regmap_init_i2c(clt, &cs35l41_regma=
p_i2c));
>  }
>
> -static int cs35l41_hda_i2c_remove(struct i2c_client *clt)
> +static void cs35l41_hda_i2c_remove(struct i2c_client *clt)
>  {
>         cs35l41_hda_remove(&clt->dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id cs35l41_hda_i2c_id[] =3D {
> diff --git a/sound/ppc/keywest.c b/sound/ppc/keywest.c
> index 6e5daae18f9d..80e5108157ef 100644
> --- a/sound/ppc/keywest.c
> +++ b/sound/ppc/keywest.c
> @@ -71,14 +71,12 @@ static int keywest_attach_adapter(struct i2c_adapter =
*adapter)
>         return 0;
>  }
>
> -static int keywest_remove(struct i2c_client *client)
> +static void keywest_remove(struct i2c_client *client)
>  {
>         if (! keywest_ctx)
> -               return 0;
> +               return;
>         if (client =3D=3D keywest_ctx->client)
>                 keywest_ctx->client =3D NULL;
> -
> -       return 0;
>  }
>
>
> diff --git a/sound/soc/codecs/adau1761-i2c.c b/sound/soc/codecs/adau1761-=
i2c.c
> index 0683caf86aea..0cefff49569c 100644
> --- a/sound/soc/codecs/adau1761-i2c.c
> +++ b/sound/soc/codecs/adau1761-i2c.c
> @@ -30,10 +30,9 @@ static int adau1761_i2c_probe(struct i2c_client *clien=
t)
>                 id->driver_data, NULL);
>  }
>
> -static int adau1761_i2c_remove(struct i2c_client *client)
> +static void adau1761_i2c_remove(struct i2c_client *client)
>  {
>         adau17x1_remove(&client->dev);
> -       return 0;
>  }
>
>  static const struct i2c_device_id adau1761_i2c_ids[] =3D {
> diff --git a/sound/soc/codecs/adau1781-i2c.c b/sound/soc/codecs/adau1781-=
i2c.c
> index e046de0ebcc7..39021b8cfb62 100644
> --- a/sound/soc/codecs/adau1781-i2c.c
> +++ b/sound/soc/codecs/adau1781-i2c.c
> @@ -30,10 +30,9 @@ static int adau1781_i2c_probe(struct i2c_client *clien=
t)
>                 id->driver_data, NULL);
>  }
>
> -static int adau1781_i2c_remove(struct i2c_client *client)
> +static void adau1781_i2c_remove(struct i2c_client *client)
>  {
>         adau17x1_remove(&client->dev);
> -       return 0;
>  }
>
>  static const struct i2c_device_id adau1781_i2c_ids[] =3D {
> diff --git a/sound/soc/codecs/ak4375.c b/sound/soc/codecs/ak4375.c
> index 9a7b662016b9..bfed08fe4b9e 100644
> --- a/sound/soc/codecs/ak4375.c
> +++ b/sound/soc/codecs/ak4375.c
> @@ -581,11 +581,9 @@ static int ak4375_i2c_probe(struct i2c_client *i2c)
>         return 0;
>  }
>
> -static int ak4375_i2c_remove(struct i2c_client *i2c)
> +static void ak4375_i2c_remove(struct i2c_client *i2c)
>  {
>         pm_runtime_disable(&i2c->dev);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id ak4375_of_match[] =3D {
> diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
> index baa9ff5d0ce5..919aa0973050 100644
> --- a/sound/soc/codecs/ak4458.c
> +++ b/sound/soc/codecs/ak4458.c
> @@ -826,11 +826,9 @@ static int ak4458_i2c_probe(struct i2c_client *i2c)
>         return 0;
>  }
>
> -static int ak4458_i2c_remove(struct i2c_client *i2c)
> +static void ak4458_i2c_remove(struct i2c_client *i2c)
>  {
>         pm_runtime_disable(&i2c->dev);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id ak4458_of_match[] =3D {
> diff --git a/sound/soc/codecs/ak4641.c b/sound/soc/codecs/ak4641.c
> index d8d9cc712d67..65a11cd39a43 100644
> --- a/sound/soc/codecs/ak4641.c
> +++ b/sound/soc/codecs/ak4641.c
> @@ -605,7 +605,7 @@ static int ak4641_i2c_probe(struct i2c_client *i2c)
>         return ret;
>  }
>
> -static int ak4641_i2c_remove(struct i2c_client *i2c)
> +static void ak4641_i2c_remove(struct i2c_client *i2c)
>  {
>         struct ak4641_platform_data *pdata =3D i2c->dev.platform_data;
>
> @@ -617,8 +617,6 @@ static int ak4641_i2c_remove(struct i2c_client *i2c)
>                 if (gpio_is_valid(pdata->gpio_npdn))
>                         gpio_free(pdata->gpio_npdn);
>         }
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id ak4641_i2c_id[] =3D {
> diff --git a/sound/soc/codecs/ak5558.c b/sound/soc/codecs/ak5558.c
> index c94cfde3e4a8..df8140907ac5 100644
> --- a/sound/soc/codecs/ak5558.c
> +++ b/sound/soc/codecs/ak5558.c
> @@ -481,11 +481,9 @@ static int ak5558_i2c_probe(struct i2c_client *i2c)
>         return 0;
>  }
>
> -static int ak5558_i2c_remove(struct i2c_client *i2c)
> +static void ak5558_i2c_remove(struct i2c_client *i2c)
>  {
>         pm_runtime_disable(&i2c->dev);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id ak5558_i2c_dt_ids[] __maybe_unused =3D =
{
> diff --git a/sound/soc/codecs/cs35l32.c b/sound/soc/codecs/cs35l32.c
> index badfc55bc5fa..7aec12688da9 100644
> --- a/sound/soc/codecs/cs35l32.c
> +++ b/sound/soc/codecs/cs35l32.c
> @@ -498,14 +498,12 @@ static int cs35l32_i2c_probe(struct i2c_client *i2c=
_client)
>         return ret;
>  }
>
> -static int cs35l32_i2c_remove(struct i2c_client *i2c_client)
> +static void cs35l32_i2c_remove(struct i2c_client *i2c_client)
>  {
>         struct cs35l32_private *cs35l32 =3D i2c_get_clientdata(i2c_client=
);
>
>         /* Hold down reset */
>         gpiod_set_value_cansleep(cs35l32->reset_gpio, 0);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM
> diff --git a/sound/soc/codecs/cs35l33.c b/sound/soc/codecs/cs35l33.c
> index 47dc0f6d90a2..46972c86fd88 100644
> --- a/sound/soc/codecs/cs35l33.c
> +++ b/sound/soc/codecs/cs35l33.c
> @@ -1251,7 +1251,7 @@ static int cs35l33_i2c_probe(struct i2c_client *i2c=
_client)
>         return ret;
>  }
>
> -static int cs35l33_i2c_remove(struct i2c_client *client)
> +static void cs35l33_i2c_remove(struct i2c_client *client)
>  {
>         struct cs35l33_private *cs35l33 =3D i2c_get_clientdata(client);
>
> @@ -1260,8 +1260,6 @@ static int cs35l33_i2c_remove(struct i2c_client *cl=
ient)
>         pm_runtime_disable(&client->dev);
>         regulator_bulk_disable(cs35l33->num_core_supplies,
>                 cs35l33->core_supplies);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id cs35l33_of_match[] =3D {
> diff --git a/sound/soc/codecs/cs35l34.c b/sound/soc/codecs/cs35l34.c
> index 50d509a06071..c36b824b66e6 100644
> --- a/sound/soc/codecs/cs35l34.c
> +++ b/sound/soc/codecs/cs35l34.c
> @@ -1129,7 +1129,7 @@ static int cs35l34_i2c_probe(struct i2c_client *i2c=
_client)
>         return ret;
>  }
>
> -static int cs35l34_i2c_remove(struct i2c_client *client)
> +static void cs35l34_i2c_remove(struct i2c_client *client)
>  {
>         struct cs35l34_private *cs35l34 =3D i2c_get_clientdata(client);
>
> @@ -1138,8 +1138,6 @@ static int cs35l34_i2c_remove(struct i2c_client *cl=
ient)
>         pm_runtime_disable(&client->dev);
>         regulator_bulk_disable(cs35l34->num_core_supplies,
>                 cs35l34->core_supplies);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused cs35l34_runtime_resume(struct device *dev)
> diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
> index 6b70afb70a67..0f6968a29ace 100644
> --- a/sound/soc/codecs/cs35l35.c
> +++ b/sound/soc/codecs/cs35l35.c
> @@ -1628,14 +1628,12 @@ static int cs35l35_i2c_probe(struct i2c_client *i=
2c_client)
>         return ret;
>  }
>
> -static int cs35l35_i2c_remove(struct i2c_client *i2c_client)
> +static void cs35l35_i2c_remove(struct i2c_client *i2c_client)
>  {
>         struct cs35l35_private *cs35l35 =3D i2c_get_clientdata(i2c_client=
);
>
>         regulator_bulk_disable(cs35l35->num_supplies, cs35l35->supplies);
>         gpiod_set_value_cansleep(cs35l35->reset_gpio, 0);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id cs35l35_of_match[] =3D {
> diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
> index dfe85dc2cd20..80844471309d 100644
> --- a/sound/soc/codecs/cs35l36.c
> +++ b/sound/soc/codecs/cs35l36.c
> @@ -1911,7 +1911,7 @@ static int cs35l36_i2c_probe(struct i2c_client *i2c=
_client)
>         return ret;
>  }
>
> -static int cs35l36_i2c_remove(struct i2c_client *client)
> +static void cs35l36_i2c_remove(struct i2c_client *client)
>  {
>         struct cs35l36_private *cs35l36 =3D i2c_get_clientdata(client);
>
> @@ -1925,8 +1925,6 @@ static int cs35l36_i2c_remove(struct i2c_client *cl=
ient)
>                 gpiod_set_value_cansleep(cs35l36->reset_gpio, 0);
>
>         regulator_bulk_disable(cs35l36->num_supplies, cs35l36->supplies);
> -
> -       return 0;
>  }
>  static const struct of_device_id cs35l36_of_match[] =3D {
>         {.compatible =3D "cirrus,cs35l36"},
> diff --git a/sound/soc/codecs/cs35l41-i2c.c b/sound/soc/codecs/cs35l41-i2=
c.c
> index 37c703c08fd5..3676b596f60b 100644
> --- a/sound/soc/codecs/cs35l41-i2c.c
> +++ b/sound/soc/codecs/cs35l41-i2c.c
> @@ -56,13 +56,11 @@ static int cs35l41_i2c_probe(struct i2c_client *clien=
t)
>         return cs35l41_probe(cs35l41, hw_cfg);
>  }
>
> -static int cs35l41_i2c_remove(struct i2c_client *client)
> +static void cs35l41_i2c_remove(struct i2c_client *client)
>  {
>         struct cs35l41_private *cs35l41 =3D i2c_get_clientdata(client);
>
>         cs35l41_remove(cs35l41);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_OF
> diff --git a/sound/soc/codecs/cs35l45-i2c.c b/sound/soc/codecs/cs35l45-i2=
c.c
> index 06c2ddffb9c5..39d28641429e 100644
> --- a/sound/soc/codecs/cs35l45-i2c.c
> +++ b/sound/soc/codecs/cs35l45-i2c.c
> @@ -36,13 +36,11 @@ static int cs35l45_i2c_probe(struct i2c_client *clien=
t)
>         return cs35l45_probe(cs35l45);
>  }
>
> -static int cs35l45_i2c_remove(struct i2c_client *client)
> +static void cs35l45_i2c_remove(struct i2c_client *client)
>  {
>         struct cs35l45_private *cs35l45 =3D i2c_get_clientdata(client);
>
>         cs35l45_remove(cs35l45);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id cs35l45_of_match[] =3D {
> diff --git a/sound/soc/codecs/cs4234.c b/sound/soc/codecs/cs4234.c
> index 881c5ba70c0e..18bddeb63762 100644
> --- a/sound/soc/codecs/cs4234.c
> +++ b/sound/soc/codecs/cs4234.c
> @@ -851,7 +851,7 @@ static int cs4234_i2c_probe(struct i2c_client *i2c_cl=
ient)
>         return ret;
>  }
>
> -static int cs4234_i2c_remove(struct i2c_client *i2c_client)
> +static void cs4234_i2c_remove(struct i2c_client *i2c_client)
>  {
>         struct cs4234 *cs4234 =3D i2c_get_clientdata(i2c_client);
>         struct device *dev =3D &i2c_client->dev;
> @@ -859,8 +859,6 @@ static int cs4234_i2c_remove(struct i2c_client *i2c_c=
lient)
>         snd_soc_unregister_component(dev);
>         pm_runtime_disable(dev);
>         cs4234_shutdown(cs4234);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused cs4234_runtime_resume(struct device *dev)
> diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
> index 86bfa8d5ec78..c16c0a0d3b56 100644
> --- a/sound/soc/codecs/cs4265.c
> +++ b/sound/soc/codecs/cs4265.c
> @@ -624,14 +624,12 @@ static int cs4265_i2c_probe(struct i2c_client *i2c_=
client)
>                         ARRAY_SIZE(cs4265_dai));
>  }
>
> -static int cs4265_i2c_remove(struct i2c_client *i2c)
> +static void cs4265_i2c_remove(struct i2c_client *i2c)
>  {
>         struct cs4265_private *cs4265 =3D i2c_get_clientdata(i2c);
>
>         if (cs4265->reset_gpio)
>                 gpiod_set_value_cansleep(cs4265->reset_gpio, 0);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id cs4265_of_match[] =3D {
> diff --git a/sound/soc/codecs/cs4270.c b/sound/soc/codecs/cs4270.c
> index 531f63b01554..6bfddb1b9968 100644
> --- a/sound/soc/codecs/cs4270.c
> +++ b/sound/soc/codecs/cs4270.c
> @@ -651,13 +651,11 @@ static const struct regmap_config cs4270_regmap =3D=
 {
>   * This function puts the chip into low power mode when the i2c device
>   * is removed.
>   */
> -static int cs4270_i2c_remove(struct i2c_client *i2c_client)
> +static void cs4270_i2c_remove(struct i2c_client *i2c_client)
>  {
>         struct cs4270_private *cs4270 =3D i2c_get_clientdata(i2c_client);
>
>         gpiod_set_value_cansleep(cs4270->reset_gpio, 0);
> -
> -       return 0;
>  }
>
>  /**
> diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
> index 4fade2388797..ab848fe5f721 100644
> --- a/sound/soc/codecs/cs42l42.c
> +++ b/sound/soc/codecs/cs42l42.c
> @@ -2342,7 +2342,7 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c=
_client)
>         return ret;
>  }
>
> -static int cs42l42_i2c_remove(struct i2c_client *i2c_client)
> +static void cs42l42_i2c_remove(struct i2c_client *i2c_client)
>  {
>         struct cs42l42_private *cs42l42 =3D i2c_get_clientdata(i2c_client=
);
>
> @@ -2359,8 +2359,6 @@ static int cs42l42_i2c_remove(struct i2c_client *i2=
c_client)
>
>         gpiod_set_value_cansleep(cs42l42->reset_gpio, 0);
>         regulator_bulk_disable(ARRAY_SIZE(cs42l42->supplies), cs42l42->su=
pplies);
> -
> -       return 0;
>  }
>
>  static const struct dev_pm_ops cs42l42_pm_ops =3D {
> diff --git a/sound/soc/codecs/cs42l51-i2c.c b/sound/soc/codecs/cs42l51-i2=
c.c
> index 3613fb12d623..85238339fbca 100644
> --- a/sound/soc/codecs/cs42l51-i2c.c
> +++ b/sound/soc/codecs/cs42l51-i2c.c
> @@ -28,11 +28,9 @@ static int cs42l51_i2c_probe(struct i2c_client *i2c)
>         return cs42l51_probe(&i2c->dev, devm_regmap_init_i2c(i2c, &config=
));
>  }
>
> -static int cs42l51_i2c_remove(struct i2c_client *i2c)
> +static void cs42l51_i2c_remove(struct i2c_client *i2c)
>  {
>         cs42l51_remove(&i2c->dev);
> -
> -       return 0;
>  }
>
>  static const struct dev_pm_ops cs42l51_pm_ops =3D {
> diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
> index 510c94265b1f..d1cae24d015f 100644
> --- a/sound/soc/codecs/cs42l56.c
> +++ b/sound/soc/codecs/cs42l56.c
> @@ -1321,13 +1321,12 @@ static int cs42l56_i2c_probe(struct i2c_client *i=
2c_client)
>         return ret;
>  }
>
> -static int cs42l56_i2c_remove(struct i2c_client *client)
> +static void cs42l56_i2c_remove(struct i2c_client *client)
>  {
>         struct cs42l56_private *cs42l56 =3D i2c_get_clientdata(client);
>
>         regulator_bulk_disable(ARRAY_SIZE(cs42l56->supplies),
>                                cs42l56->supplies);
> -       return 0;
>  }
>
>  static const struct of_device_id cs42l56_of_match[] =3D {
> diff --git a/sound/soc/codecs/cs42xx8-i2c.c b/sound/soc/codecs/cs42xx8-i2=
c.c
> index cb06a06d48b0..bd80e9fc907f 100644
> --- a/sound/soc/codecs/cs42xx8-i2c.c
> +++ b/sound/soc/codecs/cs42xx8-i2c.c
> @@ -30,11 +30,9 @@ static int cs42xx8_i2c_probe(struct i2c_client *i2c)
>         return 0;
>  }
>
> -static int cs42xx8_i2c_remove(struct i2c_client *i2c)
> +static void cs42xx8_i2c_remove(struct i2c_client *i2c)
>  {
>         pm_runtime_disable(&i2c->dev);
> -
> -       return 0;
>  }
>
>  static struct i2c_device_id cs42xx8_i2c_id[] =3D {
> diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
> index a2bce0f9f247..944bb9a26ca9 100644
> --- a/sound/soc/codecs/cs43130.c
> +++ b/sound/soc/codecs/cs43130.c
> @@ -2584,7 +2584,7 @@ static int cs43130_i2c_probe(struct i2c_client *cli=
ent)
>         return ret;
>  }
>
> -static int cs43130_i2c_remove(struct i2c_client *client)
> +static void cs43130_i2c_remove(struct i2c_client *client)
>  {
>         struct cs43130_private *cs43130 =3D i2c_get_clientdata(client);
>
> @@ -2611,8 +2611,6 @@ static int cs43130_i2c_remove(struct i2c_client *cl=
ient)
>
>         pm_runtime_disable(&client->dev);
>         regulator_bulk_disable(CS43130_NUM_SUPPLIES, cs43130->supplies);
> -
> -       return 0;
>  }
>
>  static int __maybe_unused cs43130_runtime_suspend(struct device *dev)
> diff --git a/sound/soc/codecs/cs4349.c b/sound/soc/codecs/cs4349.c
> index 7069e9b54857..41472ed22209 100644
> --- a/sound/soc/codecs/cs4349.c
> +++ b/sound/soc/codecs/cs4349.c
> @@ -306,14 +306,12 @@ static int cs4349_i2c_probe(struct i2c_client *clie=
nt)
>                 &cs4349_dai, 1);
>  }
>
> -static int cs4349_i2c_remove(struct i2c_client *client)
> +static void cs4349_i2c_remove(struct i2c_client *client)
>  {
>         struct cs4349_private *cs4349 =3D i2c_get_clientdata(client);
>
>         /* Hold down reset */
>         gpiod_set_value_cansleep(cs4349->reset_gpio, 0);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM
> diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
> index 360ca2ffd506..71298a18ee1a 100644
> --- a/sound/soc/codecs/cs53l30.c
> +++ b/sound/soc/codecs/cs53l30.c
> @@ -1044,7 +1044,7 @@ static int cs53l30_i2c_probe(struct i2c_client *cli=
ent)
>         return ret;
>  }
>
> -static int cs53l30_i2c_remove(struct i2c_client *client)
> +static void cs53l30_i2c_remove(struct i2c_client *client)
>  {
>         struct cs53l30_private *cs53l30 =3D i2c_get_clientdata(client);
>
> @@ -1053,8 +1053,6 @@ static int cs53l30_i2c_remove(struct i2c_client *cl=
ient)
>
>         regulator_bulk_disable(ARRAY_SIZE(cs53l30->supplies),
>                                cs53l30->supplies);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM
> diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
> index b35debb5818d..c24915f7dec3 100644
> --- a/sound/soc/codecs/cx2072x.c
> +++ b/sound/soc/codecs/cx2072x.c
> @@ -1676,10 +1676,9 @@ static int cx2072x_i2c_probe(struct i2c_client *i2=
c)
>         return 0;
>  }
>
> -static int cx2072x_i2c_remove(struct i2c_client *i2c)
> +static void cx2072x_i2c_remove(struct i2c_client *i2c)
>  {
>         pm_runtime_disable(&i2c->dev);
> -       return 0;
>  }
>
>  static const struct i2c_device_id cx2072x_i2c_id[] =3D {
> diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
> index 576277a82d41..416e6f660541 100644
> --- a/sound/soc/codecs/max98090.c
> +++ b/sound/soc/codecs/max98090.c
> @@ -2618,11 +2618,9 @@ static void max98090_i2c_shutdown(struct i2c_clien=
t *i2c)
>         msleep(40);
>  }
>
> -static int max98090_i2c_remove(struct i2c_client *client)
> +static void max98090_i2c_remove(struct i2c_client *client)
>  {
>         max98090_i2c_shutdown(client);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM
> diff --git a/sound/soc/codecs/max9860.c b/sound/soc/codecs/max9860.c
> index 82f20a8e27ad..2b0d0298da83 100644
> --- a/sound/soc/codecs/max9860.c
> +++ b/sound/soc/codecs/max9860.c
> @@ -702,14 +702,13 @@ static int max9860_probe(struct i2c_client *i2c)
>         return ret;
>  }
>
> -static int max9860_remove(struct i2c_client *i2c)
> +static void max9860_remove(struct i2c_client *i2c)
>  {
>         struct device *dev =3D &i2c->dev;
>         struct max9860_priv *max9860 =3D dev_get_drvdata(dev);
>
>         pm_runtime_disable(dev);
>         regulator_disable(max9860->dvddio);
> -       return 0;
>  }
>
>  static const struct i2c_device_id max9860_i2c_id[] =3D {
> diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
> index b7cff76d7b5b..c9694ba9c341 100644
> --- a/sound/soc/codecs/max98927.c
> +++ b/sound/soc/codecs/max98927.c
> @@ -935,15 +935,13 @@ static int max98927_i2c_probe(struct i2c_client *i2=
c)
>         return ret;
>  }
>
> -static int max98927_i2c_remove(struct i2c_client *i2c)
> +static void max98927_i2c_remove(struct i2c_client *i2c)
>  {
>         struct max98927_priv *max98927 =3D i2c_get_clientdata(i2c);
>
>         if (max98927->reset_gpio) {
>                 gpiod_set_value_cansleep(max98927->reset_gpio, 1);
>         }
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id max98927_i2c_id[] =3D {
> diff --git a/sound/soc/codecs/mt6660.c b/sound/soc/codecs/mt6660.c
> index ba11555796ad..4971cd0b90f8 100644
> --- a/sound/soc/codecs/mt6660.c
> +++ b/sound/soc/codecs/mt6660.c
> @@ -516,14 +516,13 @@ static int mt6660_i2c_probe(struct i2c_client *clie=
nt)
>         return ret;
>  }
>
> -static int mt6660_i2c_remove(struct i2c_client *client)
> +static void mt6660_i2c_remove(struct i2c_client *client)
>  {
>         struct mt6660_chip *chip =3D i2c_get_clientdata(client);
>
>         pm_runtime_disable(chip->dev);
>         pm_runtime_set_suspended(chip->dev);
>         mutex_destroy(&chip->io_lock);
> -       return 0;
>  }
>
>  static int __maybe_unused mt6660_i2c_runtime_suspend(struct device *dev)
> diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
> index ce4e7f46bb06..dcae41ba2e02 100644
> --- a/sound/soc/codecs/nau8821.c
> +++ b/sound/soc/codecs/nau8821.c
> @@ -1665,13 +1665,11 @@ static int nau8821_i2c_probe(struct i2c_client *i=
2c)
>         return ret;
>  }
>
> -static int nau8821_i2c_remove(struct i2c_client *i2c_client)
> +static void nau8821_i2c_remove(struct i2c_client *i2c_client)
>  {
>         struct nau8821 *nau8821 =3D i2c_get_clientdata(i2c_client);
>
>         devm_free_irq(nau8821->dev, nau8821->irq, nau8821);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id nau8821_i2c_ids[] =3D {
> diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
> index 20e45a337b8f..bd34c84507da 100644
> --- a/sound/soc/codecs/nau8825.c
> +++ b/sound/soc/codecs/nau8825.c
> @@ -2669,10 +2669,8 @@ static int nau8825_i2c_probe(struct i2c_client *i2=
c)
>                 &nau8825_dai, 1);
>  }
>
> -static int nau8825_i2c_remove(struct i2c_client *client)
> -{
> -       return 0;
> -}
> +static void nau8825_i2c_remove(struct i2c_client *client)
> +{}
>
>  static const struct i2c_device_id nau8825_i2c_ids[] =3D {
>         { "nau8825", 0 },
> diff --git a/sound/soc/codecs/pcm1789-i2c.c b/sound/soc/codecs/pcm1789-i2=
c.c
> index 1d2f7480a6e4..fafe0dcbe4ea 100644
> --- a/sound/soc/codecs/pcm1789-i2c.c
> +++ b/sound/soc/codecs/pcm1789-i2c.c
> @@ -27,11 +27,9 @@ static int pcm1789_i2c_probe(struct i2c_client *client=
)
>         return pcm1789_common_init(&client->dev, regmap);
>  }
>
> -static int pcm1789_i2c_remove(struct i2c_client *client)
> +static void pcm1789_i2c_remove(struct i2c_client *client)
>  {
>         pcm1789_common_exit(&client->dev);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_OF
> diff --git a/sound/soc/codecs/pcm3168a-i2c.c b/sound/soc/codecs/pcm3168a-=
i2c.c
> index c0fa0dc80e8f..a0eec82e9872 100644
> --- a/sound/soc/codecs/pcm3168a-i2c.c
> +++ b/sound/soc/codecs/pcm3168a-i2c.c
> @@ -26,11 +26,9 @@ static int pcm3168a_i2c_probe(struct i2c_client *i2c)
>         return pcm3168a_probe(&i2c->dev, regmap);
>  }
>
> -static int pcm3168a_i2c_remove(struct i2c_client *i2c)
> +static void pcm3168a_i2c_remove(struct i2c_client *i2c)
>  {
>         pcm3168a_remove(&i2c->dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id pcm3168a_i2c_id[] =3D {
> diff --git a/sound/soc/codecs/pcm512x-i2c.c b/sound/soc/codecs/pcm512x-i2=
c.c
> index 81754e141a55..9dfbbe8f4a0b 100644
> --- a/sound/soc/codecs/pcm512x-i2c.c
> +++ b/sound/soc/codecs/pcm512x-i2c.c
> @@ -29,10 +29,9 @@ static int pcm512x_i2c_probe(struct i2c_client *i2c)
>         return pcm512x_probe(&i2c->dev, regmap);
>  }
>
> -static int pcm512x_i2c_remove(struct i2c_client *i2c)
> +static void pcm512x_i2c_remove(struct i2c_client *i2c)
>  {
>         pcm512x_remove(&i2c->dev);
> -       return 0;
>  }
>
>  static const struct i2c_device_id pcm512x_i2c_id[] =3D {
> diff --git a/sound/soc/codecs/rt274.c b/sound/soc/codecs/rt274.c
> index ab093bdb5552..cb2147f86818 100644
> --- a/sound/soc/codecs/rt274.c
> +++ b/sound/soc/codecs/rt274.c
> @@ -1207,14 +1207,12 @@ static int rt274_i2c_probe(struct i2c_client *i2c=
)
>         return ret;
>  }
>
> -static int rt274_i2c_remove(struct i2c_client *i2c)
> +static void rt274_i2c_remove(struct i2c_client *i2c)
>  {
>         struct rt274_priv *rt274 =3D i2c_get_clientdata(i2c);
>
>         if (i2c->irq)
>                 free_irq(i2c->irq, rt274);
> -
> -       return 0;
>  }
>
>
> diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
> index ad8ea1fa7c23..c66db0760a0f 100644
> --- a/sound/soc/codecs/rt286.c
> +++ b/sound/soc/codecs/rt286.c
> @@ -1254,14 +1254,12 @@ static int rt286_i2c_probe(struct i2c_client *i2c=
)
>         return ret;
>  }
>
> -static int rt286_i2c_remove(struct i2c_client *i2c)
> +static void rt286_i2c_remove(struct i2c_client *i2c)
>  {
>         struct rt286_priv *rt286 =3D i2c_get_clientdata(i2c);
>
>         if (i2c->irq)
>                 free_irq(i2c->irq, rt286);
> -
> -       return 0;
>  }
>
>
> diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
> index c291786dc82d..9f44eabfdbdb 100644
> --- a/sound/soc/codecs/rt298.c
> +++ b/sound/soc/codecs/rt298.c
> @@ -1297,14 +1297,12 @@ static int rt298_i2c_probe(struct i2c_client *i2c=
)
>         return ret;
>  }
>
> -static int rt298_i2c_remove(struct i2c_client *i2c)
> +static void rt298_i2c_remove(struct i2c_client *i2c)
>  {
>         struct rt298_priv *rt298 =3D i2c_get_clientdata(i2c);
>
>         if (i2c->irq)
>                 free_irq(i2c->irq, rt298);
> -
> -       return 0;
>  }
>
>
> diff --git a/sound/soc/codecs/rt5616.c b/sound/soc/codecs/rt5616.c
> index 37f1bf552eff..7a994abeedb0 100644
> --- a/sound/soc/codecs/rt5616.c
> +++ b/sound/soc/codecs/rt5616.c
> @@ -1389,10 +1389,8 @@ static int rt5616_i2c_probe(struct i2c_client *i2c=
)
>                                       rt5616_dai, ARRAY_SIZE(rt5616_dai))=
;
>  }
>
> -static int rt5616_i2c_remove(struct i2c_client *i2c)
> -{
> -       return 0;
> -}
> +static void rt5616_i2c_remove(struct i2c_client *i2c)
> +{}
>
>  static void rt5616_i2c_shutdown(struct i2c_client *client)
>  {
> diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
> index c941e878471c..d82264edd25c 100644
> --- a/sound/soc/codecs/rt5631.c
> +++ b/sound/soc/codecs/rt5631.c
> @@ -1721,10 +1721,8 @@ static int rt5631_i2c_probe(struct i2c_client *i2c=
)
>         return ret;
>  }
>
> -static int rt5631_i2c_remove(struct i2c_client *client)
> -{
> -       return 0;
> -}
> +static void rt5631_i2c_remove(struct i2c_client *client)
> +{}
>
>  static struct i2c_driver rt5631_i2c_driver =3D {
>         .driver =3D {
> diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
> index 507aba8de3cc..e77bdbc1a098 100644
> --- a/sound/soc/codecs/rt5645.c
> +++ b/sound/soc/codecs/rt5645.c
> @@ -4146,7 +4146,7 @@ static int rt5645_i2c_probe(struct i2c_client *i2c)
>         return ret;
>  }
>
> -static int rt5645_i2c_remove(struct i2c_client *i2c)
> +static void rt5645_i2c_remove(struct i2c_client *i2c)
>  {
>         struct rt5645_priv *rt5645 =3D i2c_get_clientdata(i2c);
>
> @@ -4163,8 +4163,6 @@ static int rt5645_i2c_remove(struct i2c_client *i2c=
)
>         cancel_delayed_work_sync(&rt5645->rcclock_work);
>
>         regulator_bulk_disable(ARRAY_SIZE(rt5645->supplies), rt5645->supp=
lies);
> -
> -       return 0;
>  }
>
>  static void rt5645_i2c_shutdown(struct i2c_client *i2c)
> diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
> index e51eed8a79ab..15296e0fa545 100644
> --- a/sound/soc/codecs/rt5663.c
> +++ b/sound/soc/codecs/rt5663.c
> @@ -3711,7 +3711,7 @@ static int rt5663_i2c_probe(struct i2c_client *i2c)
>         return ret;
>  }
>
> -static int rt5663_i2c_remove(struct i2c_client *i2c)
> +static void rt5663_i2c_remove(struct i2c_client *i2c)
>  {
>         struct rt5663_priv *rt5663 =3D i2c_get_clientdata(i2c);
>
> @@ -3719,8 +3719,6 @@ static int rt5663_i2c_remove(struct i2c_client *i2c=
)
>                 free_irq(i2c->irq, rt5663);
>
>         regulator_bulk_disable(ARRAY_SIZE(rt5663->supplies), rt5663->supp=
lies);
> -
> -       return 0;
>  }
>
>  static void rt5663_i2c_shutdown(struct i2c_client *client)
> diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
> index 8a97f6db04d5..eb73e262457c 100644
> --- a/sound/soc/codecs/rt5670.c
> +++ b/sound/soc/codecs/rt5670.c
> @@ -3321,11 +3321,9 @@ static int rt5670_i2c_probe(struct i2c_client *i2c=
)
>         return ret;
>  }
>
> -static int rt5670_i2c_remove(struct i2c_client *i2c)
> +static void rt5670_i2c_remove(struct i2c_client *i2c)
>  {
>         pm_runtime_disable(&i2c->dev);
> -
> -       return 0;
>  }
>
>  static struct i2c_driver rt5670_i2c_driver =3D {
> diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
> index 4a8c267d4fbc..3161022f0757 100644
> --- a/sound/soc/codecs/rt5677.c
> +++ b/sound/soc/codecs/rt5677.c
> @@ -5694,11 +5694,9 @@ static int rt5677_i2c_probe(struct i2c_client *i2c=
)
>                                       rt5677_dai, ARRAY_SIZE(rt5677_dai))=
;
>  }
>
> -static int rt5677_i2c_remove(struct i2c_client *i2c)
> +static void rt5677_i2c_remove(struct i2c_client *i2c)
>  {
>         rt5677_free_gpio(i2c);
> -
> -       return 0;
>  }
>
>  static struct i2c_driver rt5677_i2c_driver =3D {
> diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.=
c
> index 3f72f6093436..2935c1bb81f3 100644
> --- a/sound/soc/codecs/rt5682-i2c.c
> +++ b/sound/soc/codecs/rt5682-i2c.c
> @@ -302,11 +302,9 @@ static void rt5682_i2c_shutdown(struct i2c_client *c=
lient)
>         rt5682_reset(rt5682);
>  }
>
> -static int rt5682_i2c_remove(struct i2c_client *client)
> +static void rt5682_i2c_remove(struct i2c_client *client)
>  {
>         rt5682_i2c_shutdown(client);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id rt5682_of_match[] =3D {
> diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
> index 4d44eddee901..a80c686613f4 100644
> --- a/sound/soc/codecs/rt5682s.c
> +++ b/sound/soc/codecs/rt5682s.c
> @@ -3195,11 +3195,9 @@ static void rt5682s_i2c_shutdown(struct i2c_client=
 *client)
>         rt5682s_reset(rt5682s);
>  }
>
> -static int rt5682s_i2c_remove(struct i2c_client *client)
> +static void rt5682s_i2c_remove(struct i2c_client *client)
>  {
>         rt5682s_i2c_shutdown(client);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id rt5682s_of_match[] =3D {
> diff --git a/sound/soc/codecs/rt9120.c b/sound/soc/codecs/rt9120.c
> index da495bdc8415..644300e88b4c 100644
> --- a/sound/soc/codecs/rt9120.c
> +++ b/sound/soc/codecs/rt9120.c
> @@ -572,11 +572,10 @@ static int rt9120_probe(struct i2c_client *i2c)
>                                                &rt9120_dai, 1);
>  }
>
> -static int rt9120_remove(struct i2c_client *i2c)
> +static void rt9120_remove(struct i2c_client *i2c)
>  {
>         pm_runtime_disable(&i2c->dev);
>         pm_runtime_set_suspended(&i2c->dev);
> -       return 0;
>  }
>
>  static int __maybe_unused rt9120_runtime_suspend(struct device *dev)
> diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
> index 2aa48aef6a97..f29bd50fe4cd 100644
> --- a/sound/soc/codecs/sgtl5000.c
> +++ b/sound/soc/codecs/sgtl5000.c
> @@ -1791,15 +1791,13 @@ static int sgtl5000_i2c_probe(struct i2c_client *=
client)
>         return ret;
>  }
>
> -static int sgtl5000_i2c_remove(struct i2c_client *client)
> +static void sgtl5000_i2c_remove(struct i2c_client *client)
>  {
>         struct sgtl5000_priv *sgtl5000 =3D i2c_get_clientdata(client);
>
>         clk_disable_unprepare(sgtl5000->mclk);
>         regulator_bulk_disable(sgtl5000->num_supplies, sgtl5000->supplies=
);
>         regulator_bulk_free(sgtl5000->num_supplies, sgtl5000->supplies);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id sgtl5000_id[] =3D {
> diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
> index 9189fb3648f7..0676c822458f 100644
> --- a/sound/soc/codecs/sta350.c
> +++ b/sound/soc/codecs/sta350.c
> @@ -1243,10 +1243,8 @@ static int sta350_i2c_probe(struct i2c_client *i2c=
)
>         return ret;
>  }
>
> -static int sta350_i2c_remove(struct i2c_client *client)
> -{
> -       return 0;
> -}
> +static void sta350_i2c_remove(struct i2c_client *client)
> +{}
>
>  static const struct i2c_device_id sta350_i2c_id[] =3D {
>         { "sta350", 0 },
> diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
> index b5c9c61ff5a8..0259ae96d97e 100644
> --- a/sound/soc/codecs/tas2552.c
> +++ b/sound/soc/codecs/tas2552.c
> @@ -737,10 +737,9 @@ static int tas2552_probe(struct i2c_client *client)
>         return ret;
>  }
>
> -static int tas2552_i2c_remove(struct i2c_client *client)
> +static void tas2552_i2c_remove(struct i2c_client *client)
>  {
>         pm_runtime_disable(&client->dev);
> -       return 0;
>  }
>
>  static const struct i2c_device_id tas2552_id[] =3D {
> diff --git a/sound/soc/codecs/tas5086.c b/sound/soc/codecs/tas5086.c
> index 5c0df3cd4832..b0a73244ee31 100644
> --- a/sound/soc/codecs/tas5086.c
> +++ b/sound/soc/codecs/tas5086.c
> @@ -982,10 +982,8 @@ static int tas5086_i2c_probe(struct i2c_client *i2c)
>         return ret;
>  }
>
> -static int tas5086_i2c_remove(struct i2c_client *i2c)
> -{
> -       return 0;
> -}
> +static void tas5086_i2c_remove(struct i2c_client *i2c)
> +{}
>
>  static struct i2c_driver tas5086_i2c_driver =3D {
>         .driver =3D {
> diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
> index 7b599664db20..1a060e85621f 100644
> --- a/sound/soc/codecs/tas571x.c
> +++ b/sound/soc/codecs/tas571x.c
> @@ -885,13 +885,11 @@ static int tas571x_i2c_probe(struct i2c_client *cli=
ent)
>         return ret;
>  }
>
> -static int tas571x_i2c_remove(struct i2c_client *client)
> +static void tas571x_i2c_remove(struct i2c_client *client)
>  {
>         struct tas571x_private *priv =3D i2c_get_clientdata(client);
>
>         regulator_bulk_disable(priv->chip->num_supply_names, priv->suppli=
es);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id tas571x_of_match[] __maybe_unused =3D {
> diff --git a/sound/soc/codecs/tas5805m.c b/sound/soc/codecs/tas5805m.c
> index fa0e81ec875a..4782d9c47992 100644
> --- a/sound/soc/codecs/tas5805m.c
> +++ b/sound/soc/codecs/tas5805m.c
> @@ -523,7 +523,7 @@ static int tas5805m_i2c_probe(struct i2c_client *i2c)
>         return 0;
>  }
>
> -static int tas5805m_i2c_remove(struct i2c_client *i2c)
> +static void tas5805m_i2c_remove(struct i2c_client *i2c)
>  {
>         struct device *dev =3D &i2c->dev;
>         struct tas5805m_priv *tas5805m =3D dev_get_drvdata(dev);
> @@ -532,7 +532,6 @@ static int tas5805m_i2c_remove(struct i2c_client *i2c=
)
>         gpiod_set_value(tas5805m->gpio_pdn_n, 0);
>         usleep_range(10000, 15000);
>         regulator_disable(tas5805m->pvdd);
> -       return 0;
>  }
>
>  static const struct i2c_device_id tas5805m_i2c_id[] =3D {
> diff --git a/sound/soc/codecs/tas6424.c b/sound/soc/codecs/tas6424.c
> index 22b53856e691..fd1f37d48982 100644
> --- a/sound/soc/codecs/tas6424.c
> +++ b/sound/soc/codecs/tas6424.c
> @@ -775,7 +775,7 @@ static int tas6424_i2c_probe(struct i2c_client *clien=
t)
>         return ret;
>  }
>
> -static int tas6424_i2c_remove(struct i2c_client *client)
> +static void tas6424_i2c_remove(struct i2c_client *client)
>  {
>         struct device *dev =3D &client->dev;
>         struct tas6424_data *tas6424 =3D dev_get_drvdata(dev);
> @@ -791,8 +791,6 @@ static int tas6424_i2c_remove(struct i2c_client *clie=
nt)
>                                      tas6424->supplies);
>         if (ret < 0)
>                 dev_err(dev, "unable to disable supplies: %d\n", ret);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id tas6424_i2c_ids[] =3D {
> diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320ad=
c3xxx.c
> index 82532ad00c3c..82d78e7c610e 100644
> --- a/sound/soc/codecs/tlv320adc3xxx.c
> +++ b/sound/soc/codecs/tlv320adc3xxx.c
> @@ -1427,7 +1427,7 @@ static int adc3xxx_i2c_probe(struct i2c_client *i2c=
)
>         return ret;
>  }
>
> -static int __exit adc3xxx_i2c_remove(struct i2c_client *client)
> +static void __exit adc3xxx_i2c_remove(struct i2c_client *client)
>  {
>         struct adc3xxx *adc3xxx =3D i2c_get_clientdata(client);
>
> @@ -1435,7 +1435,6 @@ static int __exit adc3xxx_i2c_remove(struct i2c_cli=
ent *client)
>                 clk_disable_unprepare(adc3xxx->mclk);
>         adc3xxx_free_gpio(adc3xxx);
>         snd_soc_unregister_component(&client->dev);
> -       return 0;
>  }
>
>  static const struct of_device_id tlv320adc3xxx_of_match[] =3D {
> diff --git a/sound/soc/codecs/tlv320aic32x4-i2c.c b/sound/soc/codecs/tlv3=
20aic32x4-i2c.c
> index 0645239901b1..d1e543ca3521 100644
> --- a/sound/soc/codecs/tlv320aic32x4-i2c.c
> +++ b/sound/soc/codecs/tlv320aic32x4-i2c.c
> @@ -45,11 +45,9 @@ static int aic32x4_i2c_probe(struct i2c_client *i2c)
>         return aic32x4_probe(&i2c->dev, regmap);
>  }
>
> -static int aic32x4_i2c_remove(struct i2c_client *i2c)
> +static void aic32x4_i2c_remove(struct i2c_client *i2c)
>  {
>         aic32x4_remove(&i2c->dev);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id aic32x4_i2c_id[] =3D {
> diff --git a/sound/soc/codecs/tlv320aic3x-i2c.c b/sound/soc/codecs/tlv320=
aic3x-i2c.c
> index 7bd9ce08bb7b..d7e94d564dbf 100644
> --- a/sound/soc/codecs/tlv320aic3x-i2c.c
> +++ b/sound/soc/codecs/tlv320aic3x-i2c.c
> @@ -41,11 +41,9 @@ static int aic3x_i2c_probe(struct i2c_client *i2c)
>         return aic3x_probe(&i2c->dev, regmap, id->driver_data);
>  }
>
> -static int aic3x_i2c_remove(struct i2c_client *i2c)
> +static void aic3x_i2c_remove(struct i2c_client *i2c)
>  {
>         aic3x_remove(&i2c->dev);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id aic3x_of_id[] =3D {
> diff --git a/sound/soc/codecs/tlv320dac33.c b/sound/soc/codecs/tlv320dac3=
3.c
> index 66f1d1cd6cf0..8a86bfe8266c 100644
> --- a/sound/soc/codecs/tlv320dac33.c
> +++ b/sound/soc/codecs/tlv320dac33.c
> @@ -1539,7 +1539,7 @@ static int dac33_i2c_probe(struct i2c_client *clien=
t)
>         return ret;
>  }
>
> -static int dac33_i2c_remove(struct i2c_client *client)
> +static void dac33_i2c_remove(struct i2c_client *client)
>  {
>         struct tlv320dac33_priv *dac33 =3D i2c_get_clientdata(client);
>
> @@ -1548,8 +1548,6 @@ static int dac33_i2c_remove(struct i2c_client *clie=
nt)
>
>         if (dac33->power_gpio >=3D 0)
>                 gpio_free(dac33->power_gpio);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id tlv320dac33_i2c_id[] =3D {
> diff --git a/sound/soc/codecs/wm1250-ev1.c b/sound/soc/codecs/wm1250-ev1.=
c
> index b6366dea15a6..49dbd19d26cc 100644
> --- a/sound/soc/codecs/wm1250-ev1.c
> +++ b/sound/soc/codecs/wm1250-ev1.c
> @@ -229,11 +229,9 @@ static int wm1250_ev1_probe(struct i2c_client *i2c)
>         return 0;
>  }
>
> -static int wm1250_ev1_remove(struct i2c_client *i2c)
> +static void wm1250_ev1_remove(struct i2c_client *i2c)
>  {
>         wm1250_ev1_free(i2c);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id wm1250_ev1_i2c_id[] =3D {
> diff --git a/sound/soc/codecs/wm2200.c b/sound/soc/codecs/wm2200.c
> index 1cd544580c83..8557c33eeee7 100644
> --- a/sound/soc/codecs/wm2200.c
> +++ b/sound/soc/codecs/wm2200.c
> @@ -2415,7 +2415,7 @@ static int wm2200_i2c_probe(struct i2c_client *i2c)
>         return ret;
>  }
>
> -static int wm2200_i2c_remove(struct i2c_client *i2c)
> +static void wm2200_i2c_remove(struct i2c_client *i2c)
>  {
>         struct wm2200_priv *wm2200 =3D i2c_get_clientdata(i2c);
>
> @@ -2428,8 +2428,6 @@ static int wm2200_i2c_remove(struct i2c_client *i2c=
)
>                 gpio_set_value_cansleep(wm2200->pdata.ldo_ena, 0);
>         regulator_bulk_disable(ARRAY_SIZE(wm2200->core_supplies),
>                                wm2200->core_supplies);
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM
> diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
> index a89870918174..211ef8190c61 100644
> --- a/sound/soc/codecs/wm5100.c
> +++ b/sound/soc/codecs/wm5100.c
> @@ -2636,7 +2636,7 @@ static int wm5100_i2c_probe(struct i2c_client *i2c)
>         return ret;
>  }
>
> -static int wm5100_i2c_remove(struct i2c_client *i2c)
> +static void wm5100_i2c_remove(struct i2c_client *i2c)
>  {
>         struct wm5100_priv *wm5100 =3D i2c_get_clientdata(i2c);
>
> @@ -2652,8 +2652,6 @@ static int wm5100_i2c_remove(struct i2c_client *i2c=
)
>                 gpio_set_value_cansleep(wm5100->pdata.ldo_ena, 0);
>                 gpio_free(wm5100->pdata.ldo_ena);
>         }
> -
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM
> diff --git a/sound/soc/codecs/wm8804-i2c.c b/sound/soc/codecs/wm8804-i2c.=
c
> index 04dc9fb5afb4..3ce1a39d76eb 100644
> --- a/sound/soc/codecs/wm8804-i2c.c
> +++ b/sound/soc/codecs/wm8804-i2c.c
> @@ -25,10 +25,9 @@ static int wm8804_i2c_probe(struct i2c_client *i2c)
>         return wm8804_probe(&i2c->dev, regmap);
>  }
>
> -static int wm8804_i2c_remove(struct i2c_client *i2c)
> +static void wm8804_i2c_remove(struct i2c_client *i2c)
>  {
>         wm8804_remove(&i2c->dev);
> -       return 0;
>  }
>
>  static const struct i2c_device_id wm8804_i2c_id[] =3D {
> diff --git a/sound/soc/codecs/wm8900.c b/sound/soc/codecs/wm8900.c
> index 84a3daf0c11e..28e296f2f969 100644
> --- a/sound/soc/codecs/wm8900.c
> +++ b/sound/soc/codecs/wm8900.c
> @@ -1283,10 +1283,8 @@ static int wm8900_i2c_probe(struct i2c_client *i2c=
)
>         return ret;
>  }
>
> -static int wm8900_i2c_remove(struct i2c_client *client)
> -{
> -       return 0;
> -}
> +static void wm8900_i2c_remove(struct i2c_client *client)
> +{}
>
>  static const struct i2c_device_id wm8900_i2c_id[] =3D {
>         { "wm8900", 0 },
> diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
> index 3c95c2aea515..967be629b846 100644
> --- a/sound/soc/codecs/wm8903.c
> +++ b/sound/soc/codecs/wm8903.c
> @@ -2183,7 +2183,7 @@ static int wm8903_i2c_probe(struct i2c_client *i2c)
>         return ret;
>  }
>
> -static int wm8903_i2c_remove(struct i2c_client *client)
> +static void wm8903_i2c_remove(struct i2c_client *client)
>  {
>         struct wm8903_priv *wm8903 =3D i2c_get_clientdata(client);
>
> @@ -2192,8 +2192,6 @@ static int wm8903_i2c_remove(struct i2c_client *cli=
ent)
>         if (client->irq)
>                 free_irq(client->irq, wm8903);
>         wm8903_free_gpio(wm8903);
> -
> -       return 0;
>  }
>
>  static const struct of_device_id wm8903_of_match[] =3D {
> diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
> index 8c8f32b23083..3c4cd47f5ad9 100644
> --- a/sound/soc/codecs/wm8960.c
> +++ b/sound/soc/codecs/wm8960.c
> @@ -1487,10 +1487,8 @@ static int wm8960_i2c_probe(struct i2c_client *i2c=
)
>         return ret;
>  }
>
> -static int wm8960_i2c_remove(struct i2c_client *client)
> -{
> -       return 0;
> -}
> +static void wm8960_i2c_remove(struct i2c_client *client)
> +{}
>
>  static const struct i2c_device_id wm8960_i2c_id[] =3D {
>         { "wm8960", 0 },
> diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
> index 5cca89364280..85089304f5e7 100644
> --- a/sound/soc/codecs/wm8962.c
> +++ b/sound/soc/codecs/wm8962.c
> @@ -3779,10 +3779,9 @@ static int wm8962_i2c_probe(struct i2c_client *i2c=
)
>         return ret;
>  }
>
> -static int wm8962_i2c_remove(struct i2c_client *client)
> +static void wm8962_i2c_remove(struct i2c_client *client)
>  {
>         pm_runtime_disable(&client->dev);
> -       return 0;
>  }
>
>  #ifdef CONFIG_PM
> diff --git a/sound/soc/codecs/wm8993.c b/sound/soc/codecs/wm8993.c
> index f4da77ec9d6c..fe1c5aab0ab6 100644
> --- a/sound/soc/codecs/wm8993.c
> +++ b/sound/soc/codecs/wm8993.c
> @@ -1723,15 +1723,13 @@ static int wm8993_i2c_probe(struct i2c_client *i2=
c)
>         return ret;
>  }
>
> -static int wm8993_i2c_remove(struct i2c_client *i2c)
> +static void wm8993_i2c_remove(struct i2c_client *i2c)
>  {
>         struct wm8993_priv *wm8993 =3D i2c_get_clientdata(i2c);
>
>         if (i2c->irq)
>                 free_irq(i2c->irq, wm8993);
>         regulator_bulk_disable(ARRAY_SIZE(wm8993->supplies), wm8993->supp=
lies);
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id wm8993_i2c_id[] =3D {
> diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
> index f7bb27d1c76d..5f2b3af47c12 100644
> --- a/sound/soc/codecs/wm8996.c
> +++ b/sound/soc/codecs/wm8996.c
> @@ -3067,7 +3067,7 @@ static int wm8996_i2c_probe(struct i2c_client *i2c)
>         return ret;
>  }
>
> -static int wm8996_i2c_remove(struct i2c_client *client)
> +static void wm8996_i2c_remove(struct i2c_client *client)
>  {
>         struct wm8996_priv *wm8996 =3D i2c_get_clientdata(client);
>
> @@ -3076,8 +3076,6 @@ static int wm8996_i2c_remove(struct i2c_client *cli=
ent)
>                 gpio_set_value_cansleep(wm8996->pdata.ldo_ena, 0);
>                 gpio_free(wm8996->pdata.ldo_ena);
>         }
> -
> -       return 0;
>  }
>
>  static const struct i2c_device_id wm8996_i2c_id[] =3D {
> diff --git a/sound/soc/codecs/wm9081.c b/sound/soc/codecs/wm9081.c
> index 87b58448cea7..6184d8c06564 100644
> --- a/sound/soc/codecs/wm9081.c
> +++ b/sound/soc/codecs/wm9081.c
> @@ -1357,10 +1357,8 @@ static int wm9081_i2c_probe(struct i2c_client *i2c=
)
>         return 0;
>  }
>
> -static int wm9081_i2c_remove(struct i2c_client *client)
> -{
> -       return 0;
> -}
> +static void wm9081_i2c_remove(struct i2c_client *client)
> +{}
>
>  static const struct i2c_device_id wm9081_i2c_id[] =3D {
>         { "wm9081", 0 },
> --
> 2.36.1
>
