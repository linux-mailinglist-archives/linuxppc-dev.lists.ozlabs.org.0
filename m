Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C5055FD16
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 12:25:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXyJp5jDVz3dx9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 20:25:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KDGJ+ZX0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kabel@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KDGJ+ZX0;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXwvg5XW4z3cFp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 19:21:51 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DA2E161E2A;
	Wed, 29 Jun 2022 09:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6A5C34114;
	Wed, 29 Jun 2022 09:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656494506;
	bh=HQ25Ow2lpsqgoUrUW/nG+URV4v3uVvi69tP+dqJVwS8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KDGJ+ZX0QDwKOanqLEHq4R3Rgk4gw7YBpXQ1tp5J2PbFlN9SFFfxpykmheKoDEBKH
	 GZdb6/Vu19P209bnRNGK3ZFDu4CTBf7M/1tGbAgk0qvALDE6m6bUxa1i55igZp5mYn
	 M9nKXnXHahfEJ1/gD9uIZsD8u8SACyrjQAA5RstBhscMb/v3jVsSe8amKh8qkDuMrS
	 GSpJXwgYiOg6nUIYiiXl948rxcrWW3Rc1By0vwkqaGsbNa0kxgo7uX8LQpEE5EFJvC
	 lXPBmC+HFU37tkvSye7TN5YXt1OC7tohvK8VYqANalwO76xOIXwCRjtMw86pXFhld/
	 h03Us4Elobz6g==
Date: Wed, 29 Jun 2022 11:20:42 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Message-ID: <20220629112042.221af80b@thinkpad>
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
	<20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 tti Palosaari <crope@iki.fi>, Wenyou Yang <wenyou.yang@microchip.com>, Dongchun Zhu <dongchun.zhu@mediatek.com>, Miaoqian Lin <linmq006@gmail.com>, Steve Longerbeam <slongerbeam@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>, Shunqian Zheng <zhengsq@rock-chips.com>, lijian <lijian@yulong.com>, Dan Carpenter <dan.carpenter@oracle.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Viorel Suman <viorel.suman@nxp.com>, Petr Machata <petrm@nvidia.com>, Guido =?UTF-8?B?R8O8bnRoZXI=?= <agx@sigxcpu.org>, Jean Delvare <jdelvare@suse.com>, linux-serial@vger.kernel.org, linux-pm@vger.kernel.org, Eddie James <eajames@linux.ibm.com>, Riku Voipio <riku.voipio@iki.fi>, James Schulman <james.schulman@cirrus.com>, Scott Wood <oss@buserror.net>, Cai Huoqing <cai.huoqing@linux.dev>, Jonas Malaco <jonas@protocubo.io>, Hsin-Yi Wang <hsinyi@chromium.org>, Haibo Chen <haibo.chen@nxp.com>, Petr Cvek <petrcvekcz@gmail.com>, linux-leds@vger.kernel.org, Joe Tessler <jrt@google.com>, Andrey Konovalov <
 andreyknvl@gmail.com>, Andy Shevchenko <andy@kernel.o

rg>, Robert Jones <rjones@gateworks.com>, George Joseph <george.joseph@fairview5.com>, Vincent Knecht <vincent.knecht@mailoo.org>, Robin van der Gracht <robin@protonic.nl>, Randy Dunlap <rdunlap@infradead.org>, linux-stm32@st-md-mailman.stormreply.com, Michael Tretter <m.tretter@pengutronix.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Phong LE <ple@baylibre.com>, Daniel Beer <daniel.beer@igorinstitute.com>, Krzysztof Opasiak <k.opasiak@samsung.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Heungjun Kim <riverful.kim@samsung.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, David Lin <CTLIN0@nuvoton.com>, Vladimir Oltean <olteanv@gmail.com>, David Rhodes <david.rhodes@cirrus.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Dan Robertson <dan@dlrobertson.com>, Martyn Welch <martyn.welch@collab
 ora.co.uk>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, Jon Nettleton <jon.nettleton@gmail.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Marco Felsch <m.felsch@pengutronix.de>, Wim Van Sebroeck <wim@linux-watchdog.org>, Sebastian Reichel <sre@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org, Martiros Shakhzadyan <vrzh@vrzh.net>, Guenter Roeck <groeck@chromium.org>, Matthias Schwarzott <zzam@gentoo.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Eric Dumazet <edumazet@google.com>, Leon Luo <leonl@leopardimaging.com>, Saranya Gopal <saranya.gopal@intel.com>, Lars-Peter Clausen <lars@metafoo.de>, Corey Minyard <minyard@acm.org>, Evgeny Novikov <novikov@ispras.ru>, Frank Rowand <frowand.list@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Manivannan Sadhasivam <mani@kernel.org>, Pierre-Louis Bossart 
 <pierre-louis.bossart@linux.intel.com>, Minghao Chi <
chi.minghao@zte.com.cn>, linux-clk@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Charles Gorand <charles.gorand@effinnov.com>, Jagan Teki <jagan@amarulasolutions.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Miguel Ojeda <ojeda@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Martin Donnelly <martin.donnelly@ge.com>, Woojung Huh <woojung.huh@microchip.com>, Rudolf Marek <r.marek@assembler.cz>, Charles Keepax <ckeepax@opensource.cirrus.com>, linux-watchdog@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>, Ido Schimmel <idosch@nvidia.com>, acpi4asus-user@lists.sourceforge.net, Simon Trimmer <simont@opensource.cirrus.com>, Ricard Wanderlof <ricardw@axis.com>, Rikard Falkeborn <rikard.falkeborn@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, Jiri Valek - 2N <valek@2n.cz>, linux-rpi-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, Wayne Chang <wayne
 c@nvidia.com>, Chen-Yu Tsai <wens@csie.org>, Sing-Han Chen <singhanc@nvidia.com>, linux-arm-kernel@lists.infradead.org, Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund+renesas@ragnatech.se>, Hans de Goede <hdegoede@redhat.com>, Stephen Boyd <sboyd@kernel.org>, Maslov Dmitry <maslovdmitry@seeed.cc>, linux-gpio@vger.kernel.org, Jens Frederich <jfrederich@gmail.com>, Douglas Anderson <dianders@chromium.org>, "David S. Miller" <davem@davemloft.net>, Wolfram Sang <wsa@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, linux-usb@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, CGEL ZTE <cgel.zte@gmail.com>, Colin Leroy <colin@colino.net>, platform-driver-x86@vger.kernel.org, linux-integrity@vger.kernel.org, Kevin Tsai <ktsai@capellamicro.com>, Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Daniel Palmer <daniel@0x0f.com>, Arec Kao <arec.kao@intel.com>, Crt
  Mori <cmo@melexis.com>, Jose Cazarin <joseespiriki@g
mail.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org, Tom Rix <trix@redhat.com>, Michael Turquette <mturquette@baylibre.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Jan-Simon Moeller <jansimon.moeller@gmx.de>, Wei Yongjun <weiyongjun1@huawei.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Nikita Travkin <nikita@trvn.ru>, Jeremy Kerr <jk@codeconstruct.com.au>, Jasmin Jessich <jasmin@anw.at>, Sam Ravnborg <sam@ravnborg.org>, Kevin Cernekee <cernekee@chromium.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-rtc@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Lucas Tanure <tanureal@opensource.cirrus.com>, Stefan Mavrodiev <stefan@olimex.com>, Masahiro Yamada <masahiroy@kernel.org>, Sylvain Petinot <sylvain.petinot@foss.st.com>, netdev@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Xin Ji <xji@analogixsemi.com>, Seven Lee <wtli@nuvoton.com>, Matt Ranostay <matt.ranostay@konsulko.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Adrien Grassein <adrien.grassein@gmail.com>, Yang Yingliang <yangyingliang@huawei.com>, chrome-platform@lists.linux.dev, Mats Randgaard <matrandg@cisco.com>, Paolo Abeni <pabeni@redhat.com>, Alexey Dobriyan <adobriyan@gmail.com>, Joel Stanley <joel@jms.id.au>, linux-input@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Lyude Paul <lyude@redhat.com>, Kees Cook <keescook@chromium.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <uwe@kleine-koenig.org>, Jonas Karlman <jonas@kwiboo.se>, Yang Li <yang.lee@linux.alibaba.com>, Tim Harvey <tharvey@gateworks.com>, Jiri Kosina <jikos@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, Mark Gross <markgross@kernel.org>, Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <
 broonie@kernel.org>, wengjianfeng <wengjianfeng@yulon
g.com>, Maxime Ripard <maxime@cerno.tech>, Sven Peter <sven@svenpeter.dev>, Martin Kepplinger <martink@posteo.de>, openipmi-developer@lists.sourceforge.net, Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>, "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-hwmon@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Support Opensource <support.opensource@diasemi.com>, Alexandru Ardelean <ardeleanalex@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Marc Hulsman <m.hulsman@tudelft.nl>, Corentin Chary <corentin.chary@gmail.com>, Stephen Kitt <steve@sk2.org>, Daniel Scally <djrscally@gmail.com>, linux-fbdev@vger.kernel.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Kirill Shilimanov <kirill.shilimanov@huawei.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, patches@opensource.cirrus.com, Zh
 eng Yongjun <zhengyongjun3@huawei.com>, Alejandro Tafalla <atafalla@dnyon.com>, Peter Rosin <peda@axentia.se>, Arnaud Ferraris <arnaud.ferraris@collabora.com>, Hector Martin <marcan@marcan.st>, Vignesh Raghavendra <vigneshr@ti.com>, Nick Dyer <nick@shmanahar.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tony Lindgren <tony@atomide.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Takashi Iwai <tiwai@suse.com>, Paul Cercueil <paul@crapouillou.net>, George McCollister <george.mccollister@gmail.com>, Mac Chiang <mac.chiang@intel.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, Alexander Potapenko <glider@google.com>, linux-staging@lists.linux.dev, Adam Ford <aford173@gmail.com>, Peter Huewe <peterhuewe@gmx.de>, UNGLinuxDriver@microchip.com, Lee Jones <lee.jones@linaro.org>, linux-mtd@lists.infradead.org, Alexey Khoroshilov <khoroshilov@ispras.ru>, Marek Vasut <marex@denx.de>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, alsa-devel@alsa-project.org, Vincenzo Frasc
 ino <vincenzo.frascino@arm.com>, Eric Piel <eric.piel
@tremplin-utc.net>, Herbert Xu <herbert@gondor.apana.org.au>, Tobias Schrammm <t.schramm@manjaro.org>, Richard Weinberger <richard@nod.at>, Tomasz Duszynski <tduszyns@gmail.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-pwm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Thomas Zimmermann <tzimmermann@suse.de>, Bastien Nocera <hadess@hadess.net>, Jingoo Han <jingoohan1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>, Yizhuo <yzhai003@ucr.edu>, Shawn Tu <shawnx.tu@intel.com>, linux-media@vger.kernel.org, Yan Lei <yan_lei@dahuatech.com>, Akihiro Tsukada <tskd08@gmail.com>, Tudor Ambarus <tudor.ambarus@microchip.com>, Dmitry Rokosov <DDRokosov@sberdevices.ru>, Oliver Graute <oliver.graute@kococonnector.com>, Alistair Francis <alistair@alistair23.me>, Dongliang Mu <mudongliangabcd@gmail.com>, Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>, Eduardo Valentin <edubezval@gmail.com>, Rui Migue
 l Silva <rmfrfs@gmail.com>, Michael Srba <Michael.Srba@seznam.cz>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, kasan-dev@googlegroups.com, "Paul J. Murphy" <paul.j.murphy@intel.com>, Nicola Lunghi <nick83ola@gmail.com>, Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Dmitry Vyukov <dvyukov@google.com>, Ramesh Shanmugasundaram <rashanmu@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Juerg Haefliger <juergh@gmail.com>, Oder Chiou <oder_chiou@realtek.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Robert Foss <robert.foss@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, Alvin =?UTF-8?B?xaBpcHJhZ2E=?= <alsi@bang-olufsen.dk>, Luca Ceresoli <luca@lucaceresoli.net>, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, Colin Ian King 
 <colin.king@intel.com>, Maximilian Luz <luzmaximilian
@gmail.com>, Helge Deller <deller@gmx.de>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Jun 2022 16:03:12 +0200
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

> From: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
>=20
> The value returned by an i2c driver's remove function is mostly ignored.
> (Only an error message is printed if the value is non-zero that the
> error is ignored.)
>=20
> So change the prototype of the remove function to return no value. This
> way driver authors are not tempted to assume that passing an error to
> the upper layer is a good idea. All drivers are adapted accordingly.
> There is no intended change of behaviour, all callbacks were prepared to
> return 0 before.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

For

>  drivers/leds/leds-turris-omnia.c                          | 4 +---

Acked-by: Marek Beh=C3=BAn <kabel@kernel.org>
