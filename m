Return-Path: <linuxppc-dev+bounces-8348-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57389AAC6EE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 May 2025 15:50:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZsKX40R38z2ywC;
	Tue,  6 May 2025 23:49:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746539395;
	cv=none; b=Sv/uIS+RntQj7HbloZDD3nYiq3TGnPrKdSCDQK8rYtqpvdnHm5tgyZ3YWomGzZl89LGK6ZE8LHKEmePvtv8LcMH2mofAFN9XviCZm3+nqnlkoKac3kI9xq8x6Nq9ZHK7SQSzX8lxND7vGGSOuZ1F93DcwR1RT0EBmgbmkc4Y7IOvWxLPaXOe2r0pC3f0xyb3NDDmH+3IE7mULV9xhJosWBVmA3qaR7IaRnlGjRmGNI2m+O3SG+6YMkL61vHZIC0j42uA/kDt18iZ2weL556X7nvIOD6tmEsH77msu4niLjL8LwNE4CtEcb8Moyq+Hqo/xB+fsAnt2sArES8B3N/z+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746539395; c=relaxed/relaxed;
	bh=6KIDdrTanUmKEwxmKjGlY7d/jG09aY8AhXQLqxXMqzQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EqsB9iUHua4Lez3x9TvAJ+jd1UPXJSkeAEilQ5WGhZjmAWTlnGKd5hZ5KMnE0Ey+MloP947xGVrdLnJ00mfYt729lxLxFn50bj42cLLYvofcj809YsE1r4jvk6MEziExX5MAThs/VX2e/iREtQraIorSSeEUIWkS7taZFU1fQyJiVNy3HmkzXcDwvyzVQlpVW7PovWH0jljJfbQRtvUUG2cuB/0LVj4yF0bH5jQgZNkpzpCJRUACivMSO6hQ0rx5R499eyBfgn9Dhf6CXA/LNvyKffLnyc3mPvmPe579DKTxpdwhriiiKF6MNt1YpGL6VkKac/DilEcSxDjnZEEW8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Q2sp1Y2+; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=TpwMlv1G; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Q2sp1Y2+;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=TpwMlv1G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 469 seconds by postgrey-1.37 at boromir; Tue, 06 May 2025 23:49:54 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsKX25j85z2yw7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 23:49:54 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746538917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6KIDdrTanUmKEwxmKjGlY7d/jG09aY8AhXQLqxXMqzQ=;
	b=Q2sp1Y2+Xq68ZzKhzYZogyTqNgLrdCaqNxaBagnWo870Q1OnSlOsgKyJiav900B6qyHdm1
	L6CeSo6gv9d56bZGRLT6noxxbqxOZK3rDK5wNppbXvLTWKw8LMJtjCUcmlue78s7S3WeCj
	cGaZhrh/vHnUIKTf7/VPznBk4rnSb/V1DiHLfKM6i+fPMllG+tdC9OSYa+o/gKOOOFIAd4
	wKZgHD7rrMblwdpyngCi6FxefrHrxQAy1i0o64ef+KBg1TFRbwBYipPTxKQQWDHug5YkxA
	jUghLPlkOdAMplVZEriWKt0NWtKPEESJceuOBHnYGkEwGNoBz8Bx7dGduCJddw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746538917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6KIDdrTanUmKEwxmKjGlY7d/jG09aY8AhXQLqxXMqzQ=;
	b=TpwMlv1G6t0w5OOsJhlXfdhYR45rTjxnfzhQF2m3v1mOUEPfqGgpW9ah4wNI+4YXMTf9UM
	JFzC30iieDB1dnAA==
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: maz@kernel.org, linux-kernel@vger.kernel.org, "Jiri Slaby (SUSE)"
 <jirislaby@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Alex
 Deucher <alexander.deucher@amd.com>, Alex Shi <alexs@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Alvin =?utf-8?Q?=C5=A0ipraga?=
 <alsi@bang-olufsen.dk>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, amd-gfx@lists.freedesktop.org,
 Amit Kucheria <amitk@kernel.org>, Anatolij Gustschin <agust@denx.de>, Andi
 Shyti <andi.shyti@kernel.org>, Andreas =?utf-8?Q?F=C3=A4rber?=
 <afaerber@suse.de>, Andreas
 Kemnade <andreas@kemnade.info>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Andrew Lunn <andrew@lunn.ch>, Andy
 Shevchenko <andy@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Antoine Tenart
 <atenart@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Anup
 Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>,
 asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>, Baruch Siach
 <baruch@tkos.co.il>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Bjorn Andersson
 <andersson@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Borislav
 Petkov <bp@alien8.de>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Corentin Chary <corentin.chary@gmail.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, Daniel Golle
 <daniel@makrotopia.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Daniel Mack <daniel@zonque.org>, Daniel Palmer <daniel@thingy.jp>, Dave
 Hansen <dave.hansen@linux.intel.com>, David Airlie <airlied@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Dongliang Mu <dzm91@hust.edu.cn>, Doug
 Berger <opendmb@gmail.com>, dri-devel@lists.freedesktop.org, Eddie James
 <eajames@linux.ibm.com>, Eric Dumazet <edumazet@google.com>, Fabio Estevam
 <festevam@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Gregory Clement
 <gregory.clement@bootlin.com>, Guo Ren <guoren@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Haojian
 Zhuang <haojian.zhuang@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Herve Codina <herve.codina@bootlin.com>, Hou Zhiqiang
 <Zhiqiang.Hou@nxp.com>, "H. Peter Anvin" <hpa@zytor.com>, Huacai Chen
 <chenhuacai@kernel.org>, Changhuang Liang
 <changhuang.liang@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>, Christian =?utf-8?Q?K?=
 =?utf-8?Q?=C3=B6nig?=
 <christian.koenig@amd.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Chris Zankel <chris@zankel.net>, Ilpo
 =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Imre Kaloz
 <kaloz@openwrt.org>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, James
 Morse <james.morse@arm.com>, Janne Grunau <j@jannau.net>, Janusz
 Krzysztofik <jmkrzyszt@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Jassi
 Brar <jassisinghbrar@gmail.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Jianjun
 Wang <jianjun.wang@mediatek.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Jim Quinlan <jim2101024@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Joel Stanley <joel@jms.id.au>, Johannes
 Berg <johannes@sipsolutions.net>, John Crispin <john@phrozen.org>, John
 Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonas Bonn
 <jonas@southpole.se>, Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Jonathan Hunter <jonathanh@nvidia.com>, Jonathan
 =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Joyce Ooi
 <joyce.ooi@intel.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, Keerthy
 <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>, Konrad Dybcio
 <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Lakshmi Sowjanya D
 <lakshmi.sowjanya.d@intel.com>, Lars-Peter Clausen <lars@metafoo.de>, Lee
 Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>, Linus Walleij <linusw@kernel.org>,
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
 Ludovic Desroches <ludovic.desroches@microchip.com>, Lukasz Luba
 <lukasz.luba@arm.com>, "Luke D. Jones" <luke@ljones.dev>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Marek =?utf-8?Q?Beh=C3=BAn?=
 <kabel@kernel.org>, Marijn
 Suijten <marijn.suijten@somainline.org>, Mark Brown <broonie@kernel.org>,
 Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Mengyuan Lou <mengyuanlou@net-swift.com>,
 Michael Buesch <m@bues.ch>, Michael Ellerman <mpe@ellerman.id.au>, Michal
 Simek <michal.simek@amd.com>, Miodrag Dinic <miodrag.dinic@mips.com>,
 Naveen N Rao <naveen@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, netdev@vger.kernel.org, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Nikhil Agarwal
 <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>, Nishanth
 Menon <nm@ti.com>, Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>, Palmer
 Dabbelt
 <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, Paul Cercueil
 <paul@crapouillou.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Peter Rosin
 <peda@axentia.se>, Philipp Zabel <p.zabel@pengutronix.de>, Piotr
 Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 platform-driver-x86@vger.kernel.org, Prasad Kumpatla
 <quic_pkumpatl@quicinc.com>, Qiang Zhao <qiang.zhao@nxp.com>, Qin Jian
 <qinjian@cqplus1.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Randy
 Dunlap <rdunlap@infradead.org>, Ray Jui <rjui@broadcom.com>, Rengarajan
 Sundararajan <Rengarajan.S@microchip.com>, Richard Cochran
 <richardcochran@gmail.com>, Richard Weinberger <richard@nod.at>, Rich
 Felker <dalias@libc.org>, Rob Clark <robdclark@gmail.com>, Robert Jarzmik
 <robert.jarzmik@free.fr>, Robert Richter <rric@kernel.org>, Rob Herring
 <robh@kernel.org>, Roger Quadros <rogerq@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Ryan Chen <ryan_chen@aspeedtech.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Samuel Holland <samuel@sholland.org>, Santosh
 Shilimkar <ssantosh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Scott Branden <sbranden@broadcom.com>, Scott Wood <oss@buserror.net>, Sean
 Paul <sean@poorly.run>, Sean Wang <sean.wang@kernel.org>, Sean Wang
 <sean.wang@mediatek.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Sergio Paracuellos
 <sergio.paracuellos@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Shawn Lin
 <shawn.lin@rock-chips.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Simona Vetter <simona@ffwll.ch>, Stafford Horne <shorne@gmail.com>, Stefan
 Kristiansson <stefan.kristiansson@saunalahti.fi>, Stephen Boyd
 <sboyd@kernel.org>, Sven Peter <sven@svenpeter.dev>, Takashi Iwai
 <tiwai@suse.com>, Talel Shenhar <talel@amazon.com>, Tero Kristo
 <kristo@kernel.org>, Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Thara Gopinath <thara.gopinath@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Toan Le <toan@os.amperecomputing.com>,
 Tony Lindgren <tony@atomide.com>, Tony Luck <tony.luck@intel.com>,
 UNGLinuxDriver@microchip.com, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Vineet Gupta <vgupta@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 WANG Xuerui <kernel@xen0n.name>, Woojung Huh <woojung.huh@microchip.com>,
 x86@kernel.org, Yanteng Si <si.yanteng@linux.dev>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH v2 00/57] irqdomain: Cleanups and Documentation
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
Date: Tue, 06 May 2025 15:41:57 +0200
Message-ID: <874ixxonyy.ffs@tglx>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Mar 19 2025 at 10:28, Jiri Slaby wrote:

> Hi,
>
> tl;dr if patches are agreed upon, I ask subsys maintainers to take the
> respective ones via their trees (as they are split per subsys), so that
> the IRQ tree can take only the rest. That would minimize churn/conflicts
> during merges.

So. It's rc5 by now and I picked up everything which did not show up in
next yet. As there are some patches in next, I delayed the removal of
functions for the merge window so that we don't end up with merge
dependencies.

To reducde conflicts, I grabbed the irq branch from the PCI tree under
the assumption that this branch is stable.

The series sits now in

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/cleanups

and will be in next soon. If there are duplicates showing up in next,
I'm going to remove them from my branch, so the branch is not for basing
development on.

@Jiri, I fixed up all your subject prefixes as

  'irqdomain: subsys: Switch to foo()'

does not make any sense at all. These subsystems have their regular
prefixes and these changes do not justify made up irqdomain special
prefixes at all.

Thanks,

        tglx

