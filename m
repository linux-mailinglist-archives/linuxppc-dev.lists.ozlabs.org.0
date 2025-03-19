Return-Path: <linuxppc-dev+bounces-7212-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 657A8A68963
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 11:22:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHlBz0zTgz2yt0;
	Wed, 19 Mar 2025 21:22:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742379755;
	cv=none; b=VhcFl0McnM3s+Ts/TvALdeRe8BuvF2JwXEOwciBK0utoWPcGlOHBbokeG0UPM4jw6ZjCCUGq7Zn0h85UqbsXEKUkmcVaiRrr9/Bi/PISlom2gGClL+rxb2uZGSPsKqNnbGYBq98RURkIIWtFZjf1JKtDypGG88qcuXeES1FP9/Uz4FvZcRm8nRbxXvaMyqh1OJcJlVMeusjQmIfAp+/r+2ZR1h07H2ICryFsP2iExvsvk7du803wpC8MjfvPMiA5JGIa7a7fKbP7+AKWv9rt2/YjTKNZxlSOD/ZhnffstZrx8qC7DztDK1jzsRP1I6Sgp1NdgeB5ZuxC8u6WFK7XzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742379755; c=relaxed/relaxed;
	bh=YAciZfuoMKuWSR7eQBgdr98ucgp4qUAEyHPTl4MU2Sc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L7HVGHYBN/KXvUtDMltHSusFZzuja3bMu51xDJAqQPHk0VXXxMPHPt3fXIQFLZeDMjksH7NJFXBPG8lEc+rv2KxOdTjeUVKR/OitPvUQZCf9oHgUllrWx2j2kMcEima3iMdHQiUMSoXYyKHYvHN6Nk5oK2B31pZAvMeGcvKb4XUTkTlrR6Jd/0gtqKF8UtNK6jRtQTv34SiGnCSPqkJsM2NERfk4VGw4WPuy5/mx9zQqRV+R3lsT1lzDyNEq4EEo++m6Uakv9kQ0fdtE5eEVIUdx1V3W1d6p/iDTSBIKURM69rRtuAlQYp8uaqEXNllck9p1kD4GgC6fdXqOGTmRcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kFDywb/8; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kFDywb/8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHlBx2LGGz2ys0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 21:22:33 +1100 (AEDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ac3b12e8518so165421566b.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 03:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742379750; x=1742984550; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAciZfuoMKuWSR7eQBgdr98ucgp4qUAEyHPTl4MU2Sc=;
        b=kFDywb/8GhYcpOTfBvYCTuHnTf2ykOlbIqUvx8Tmz6KXS6fZ7XxRi5MhqdRlXVLIje
         FhqJY9VzqxbEeXfMuT/5u4YNWjHYSwOFsB3+xPcr6taBOhcUVq0ziOhf+gEnRtLka6rH
         fWeUUn5/JNyB89ufKRaHhkXIqGwdErXs+wzMcevCCPcZaOyZm5Jxvl72wBDIYQiict9l
         YgJKmMIWCjFQmR0bOwDYV5I3wVrbuN4DwDgQfe1H16RjuSiDvSHNFSYLbyxq9XgHsK/U
         8/01Qe3z/nN/HpFZwJ9N7I3a3c7rxblSJppFRlIWCWKlWlR08eRC7JBKyFVTxWOuI53j
         TxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742379750; x=1742984550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAciZfuoMKuWSR7eQBgdr98ucgp4qUAEyHPTl4MU2Sc=;
        b=bcbUAQ/rWa0FteV/3kmqwtUuoZygHIHn5Ut5EL4hjnwI3dJG0FGUVM+N4jearksIgn
         Ob2qPDIH88VOzSsSWnmw/zz5T1AOpdNkSF1VEeIBaac/mv+TUuDK777tYJMsk+XyxvBw
         zwIhbOjCNx0Zb9YBXK2O/7cZeRyFPoXfm7v91EM+mYgAxAGN5bOQqfN77QbSYrPv5Fr+
         dnywwa6iI9HqR+pEfFIv8e1EgO926vkLgF2ZQ+gPoE76lN34lyVqSY0nmvEwQdwODCRj
         zatn0dTbmDbDLLQKZdWjnwHObKI8YqX4gkQIgtPmAZA5FoGiGMtGFs5kDsdBtPSPNnpX
         fnCw==
X-Forwarded-Encrypted: i=1; AJvYcCVB2zjRKO/k9Pztly+O2A9knl26pmH9o2q6ESns1X8QgQkFNmKiEutlu7uB00AoCvdWt9volFm9TYGH9pA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyxb8iGXSSlP1l58tyjbZ+L2EQy3BnEedq+dGbyEATY5hZBKaCX
	gGJ/1foSUjBGUtANzramhTki21SjokDIIW/Xsc34eg9oeQOk8J7/8ton5oO0yCqwFwCZ3oIgMZ+
	uOQea3wLdr3v8Vb3Ugqj1RJTeK+Q=
X-Gm-Gg: ASbGncvKgfv9omV81QgFslqGFKMVLP9Vp5pGUvsVRdkHwiPs8SXCqWkiK8ut7dblp4g
	lNetQFjkGAzmWFsVCtWodwosq15RCm4VitmBKkFoC/BtH+ccYD9lFOy262rxLxD2sLnQlJh8VgV
	Zk/YYiP1vWnwqEG2YsFUR5s1pQa0xw
X-Google-Smtp-Source: AGHT+IFUke584GUxH6BvQB3fX7lUAUv9QcZ9e9muiwjx2XhCfAyl6Rwt1VC/I5GgI047etAZIOOFi7pICkkhLIq8oi8=
X-Received: by 2002:a17:906:f59f:b0:ac3:97f4:9c08 with SMTP id
 a640c23a62f3a-ac3b7de1176mr194902266b.31.1742379749621; Wed, 19 Mar 2025
 03:22:29 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20250319092951.37667-1-jirislaby@kernel.org>
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Mar 2025 12:21:53 +0200
X-Gm-Features: AQ5f1JplWeGobilHQOGjnSRx3FqTIg2f9LEWqzrz_L_kygQImpD-DssVqoDvovg
Message-ID: <CAHp75VfJPgaGyERBaSxSGap+Daeuy8kOjyjg+QkCtzxUydzHiQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/57] irqdomain: Cleanups and Documentation
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: tglx@linutronix.de, maz@kernel.org, linux-kernel@vger.kernel.org, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Alex Shi <alexs@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, amd-gfx@lists.freedesktop.org, 
	Amit Kucheria <amitk@kernel.org>, Anatolij Gustschin <agust@denx.de>, Andi Shyti <andi.shyti@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Andreas Kemnade <andreas@kemnade.info>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andy@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Antoine Tenart <atenart@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Baruch Siach <baruch@tkos.co.il>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Borislav Petkov <bp@alien8.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Corentin Chary <corentin.chary@gmail.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Daniel Golle <daniel@makrotopia.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Daniel Mack <daniel@zonque.org>, 
	Daniel Palmer <daniel@thingy.jp>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Airlie <airlied@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	DENG Qingfang <dqfext@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Doug Berger <opendmb@gmail.com>, dri-devel@lists.freedesktop.org, 
	Eddie James <eajames@linux.ibm.com>, Eric Dumazet <edumazet@google.com>, 
	Fabio Estevam <festevam@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Gregory Clement <gregory.clement@bootlin.com>, Guo Ren <guoren@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Herve Codina <herve.codina@bootlin.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Changhuang Liang <changhuang.liang@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Chris Zankel <chris@zankel.net>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Imre Kaloz <kaloz@openwrt.org>, Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
	James Morse <james.morse@arm.com>, Janne Grunau <j@jannau.net>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Jim Quinlan <jim2101024@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Joel Stanley <joel@jms.id.au>, Johannes Berg <johannes@sipsolutions.net>, 
	John Crispin <john@phrozen.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Jonas Bonn <jonas@southpole.se>, Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Joyce Ooi <joyce.ooi@intel.com>, Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
	Keerthy <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-edac@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-remoteproc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	loongarch@lists.linux.dev, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	"Luke D. Jones" <luke@ljones.dev>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Mark Brown <broonie@kernel.org>, 
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	Michael Buesch <m@bues.ch>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <michal.simek@amd.com>, 
	Miodrag Dinic <miodrag.dinic@mips.com>, Naveen N Rao <naveen@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>, 
	Nipun Gupta <nipun.gupta@amd.com>, Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, 
	Paul Cercueil <paul@crapouillou.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Peter Rosin <peda@axentia.se>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	platform-driver-x86@vger.kernel.org, 
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>, Qiang Zhao <qiang.zhao@nxp.com>, 
	Qin Jian <qinjian@cqplus1.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Ray Jui <rjui@broadcom.com>, 
	Rengarajan Sundararajan <Rengarajan.S@microchip.com>, Richard Cochran <richardcochran@gmail.com>, 
	Richard Weinberger <richard@nod.at>, Rich Felker <dalias@libc.org>, Rob Clark <robdclark@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Robert Richter <rric@kernel.org>, Rob Herring <robh@kernel.org>, 
	Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Samuel Holland <samuel@sholland.org>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Scott Branden <sbranden@broadcom.com>, 
	Scott Wood <oss@buserror.net>, Sean Paul <sean@poorly.run>, Sean Wang <sean.wang@kernel.org>, 
	Sean Wang <sean.wang@mediatek.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Simona Vetter <simona@ffwll.ch>, Stafford Horne <shorne@gmail.com>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stephen Boyd <sboyd@kernel.org>, 
	Sven Peter <sven@svenpeter.dev>, Takashi Iwai <tiwai@suse.com>, Talel Shenhar <talel@amazon.com>, 
	Tero Kristo <kristo@kernel.org>, Thangaraj Samynathan <Thangaraj.S@microchip.com>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Toan Le <toan@os.amperecomputing.com>, Tony Lindgren <tony@atomide.com>, 
	Tony Luck <tony.luck@intel.com>, UNGLinuxDriver@microchip.com, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Vineet Gupta <vgupta@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, WANG Xuerui <kernel@xen0n.name>, 
	Woojung Huh <woojung.huh@microchip.com>, x86@kernel.org, 
	Yanteng Si <si.yanteng@linux.dev>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Zhang Rui <rui.zhang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Mar 19, 2025 at 11:30=E2=80=AFAM Jiri Slaby (SUSE) <jirislaby@kerne=
l.org> wrote:
>
> Hi,
>
> tl;dr if patches are agreed upon, I ask subsys maintainers to take the
> respective ones via their trees (as they are split per subsys), so that
> the IRQ tree can take only the rest. That would minimize churn/conflicts
> during merges.
>
> =3D=3D=3D
>
> While I was reading through the irqdomain code and headers, I found some
> naming and documentation hard to follow or incomplete. Especially the
> naming of _add/_create/_instantiate functions.
>
> I tried to come up with a better state with this patchset:
> * only irq _domain_ (not host),
> * only irq_domain_create*() functions, all taking fwnode uniformly,
>
> Finally, all the irqdomain stuff is now plugged (and generated) into
> Documentation. So that everyone can walk through it at
> https://www.kernel.org/doc/ (once applied, of course).

I am all to support the idea, but in some cases I would think of a bit
more work to be done to get rid of the of_fwnode_handle(np) in favour
of dev_fwnode(dev). Note, this is based on a brief look, I haven't any
example at hand right now.

--=20
With Best Regards,
Andy Shevchenko

