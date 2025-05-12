Return-Path: <linuxppc-dev+bounces-8501-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9B1AB3424
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 May 2025 11:56:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zww3q19hYz2yhX;
	Mon, 12 May 2025 19:56:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747043783;
	cv=none; b=JpmSYlpSAXsV/T1tehTu+Ha0t8pDdwDSnxgQe5yo21J0igzIps8Tq9+yCT6gWjkuBoVRsjYfJAy7yAr+eG5GCjguu4X+CIctsGlwRDPM4t+VODje5tZ1by6IOR4f7b15lHDWaVsF/1TEKieo2yuJ10NBbz1nJdAZZ5x797m5VuDEO1t6mOEGClvcMxW5g3C+eW2CuizqMYAL/rx7Lv9KX4r4Ia1lMsMH3xe0R5wWu6m7c9539T0p8q/0IJmG9GAt7UH7tLv2JQG6eI8TKQluGb+ZoNX+ohxgWSA+0OqKPEDQ1aStZqHuGKKpOhbU3q6yHJOwx//f+rggopE+JA95IA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747043783; c=relaxed/relaxed;
	bh=w3cLh8i5gT8GjSFip3hkBzThljF32klNzJvJkPOx2SM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fxho+elWiKHeVE3eUYCm6EhucQWCntViSkf3jminGXwfGBGbiiPH6vlC6d0DprJeT0UZ5Fz7JRqAUUJdtjl4nA19sU3PAx551P7Xhhs/LGju1WBQsRBEfOEN43JVvnlq7JuCINdM3RWcXLcQJKJvZj95xG0rxrx1YUea1+fQ3NVmkCXCHNvzsOkL2K+8myGHQRYQ9HHSEs4U1NolH8YwzKnSzuEkHLtuODBAEWdMcRooYQDjAvrMuYcKN9axFiL1L7J+AvmCYI7Kf/7ApilNjMq/5C/XS8JW8xv2Agsd4WRFqelAKHZUZi7IPoVJ5FHFsSrz6UlwiVALF2LP2mXq7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qRopC9c+; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qRopC9c+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zww3p19YLz2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 19:56:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6C6DDA4C9E3;
	Mon, 12 May 2025 09:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20E1C4CEE7;
	Mon, 12 May 2025 09:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747043779;
	bh=i+C4MquKCE5DzjebZIg1suA7nSkmpPf5qHNeApUsg1A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qRopC9c+wx/+YYC0sJ/UvJzWi+Nuq8Af/LOL6TTdw1ObAiA1N4EP+e6QolBr4MpT6
	 p5ltChjlCbyDDYRz89R5OVuaZ83tbLw+pYcksx/XVXGNoBUri07jOIpHu8d097AHB/
	 gSDUJRuD+w/qmayEwLfKcRkm+4e+sfpRcvHaPFTEPbrRTxGpnFsatWWUdcTBd7OQnA
	 w+ym87xDkxssPWo79tPQu/rSntgc4PEKUjTQ4e3C6qaM9CVgjCp/lHxzZltc1AavRM
	 /LPUSo4AklmCrtIuWgWZpLqR0YnBmCrfB22k4a1IjHg5OgJnYBulNV1QgQrtx5KTRE
	 uIiF1y2I3VB1w==
Message-ID: <a40c0dfc-b531-4cc0-80b2-5b972d9fb65c@kernel.org>
Date: Mon, 12 May 2025 11:55:32 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/57] irqdomain: Cleanups and Documentation
To: Thomas Gleixner <tglx@linutronix.de>
Cc: maz@kernel.org, linux-kernel@vger.kernel.org,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alex Deucher <alexander.deucher@amd.com>, Alex Shi <alexs@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, =?UTF-8?Q?Alvin_=C5=A0ipraga?=
 <alsi@bang-olufsen.dk>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 amd-gfx@lists.freedesktop.org, Amit Kucheria <amitk@kernel.org>,
 Anatolij Gustschin <agust@denx.de>, Andi Shyti <andi.shyti@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Andreas Kemnade <andreas@kemnade.info>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Andrew Lunn <andrew@lunn.ch>,
 Andy Shevchenko <andy@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Antoine Tenart <atenart@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>,
 asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
 Baruch Siach <baruch@tkos.co.il>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
 Bjorn Andersson <andersson@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Borislav Petkov <bp@alien8.de>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Corentin Chary <corentin.chary@gmail.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Daniel Mack <daniel@zonque.org>,
 Daniel Palmer <daniel@thingy.jp>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Airlie <airlied@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 DENG Qingfang <dqfext@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dongliang Mu <dzm91@hust.edu.cn>, Doug Berger <opendmb@gmail.com>,
 dri-devel@lists.freedesktop.org, Eddie James <eajames@linux.ibm.com>,
 Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gregory Clement <gregory.clement@bootlin.com>, Guo Ren <guoren@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Haojian Zhuang <haojian.zhuang@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Herve Codina <herve.codina@bootlin.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Chen-Yu Tsai <wens@csie.org>, "Chester A. Unal" <chester.a.unal@arinc9.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Chris Zankel <chris@zankel.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Imre Kaloz <kaloz@openwrt.org>, Ingo Molnar <mingo@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, James Morse <james.morse@arm.com>,
 Janne Grunau <j@jannau.net>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Jassi Brar <jassisinghbrar@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, Jiawen Wu
 <jiawenwu@trustnetic.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Jim Quinlan <jim2101024@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Johannes Berg <johannes@sipsolutions.net>,
 John Crispin <john@phrozen.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonas Bonn <jonas@southpole.se>, Jonathan Cameron <jic23@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Joyce Ooi <joyce.ooi@intel.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, Keerthy
 <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij
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
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Lukasz Luba <lukasz.luba@arm.com>, "Luke D. Jones" <luke@ljones.dev>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Mark Brown <broonie@kernel.org>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Max Filippov
 <jcmvbkbc@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>, Michael Buesch <m@bues.ch>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <michal.simek@amd.com>,
 Miodrag Dinic <miodrag.dinic@mips.com>, Naveen N Rao <naveen@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Nikhil Agarwal
 <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Peter Rosin <peda@axentia.se>, Philipp Zabel <p.zabel@pengutronix.de>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 platform-driver-x86@vger.kernel.org,
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>, Qiang Zhao
 <qiang.zhao@nxp.com>, Qin Jian <qinjian@cqplus1.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Randy Dunlap
 <rdunlap@infradead.org>, Ray Jui <rjui@broadcom.com>,
 Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Richard Weinberger <richard@nod.at>, Rich Felker <dalias@libc.org>,
 Rob Clark <robdclark@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Robert Richter <rric@kernel.org>, Rob Herring <robh@kernel.org>,
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Samuel Holland <samuel@sholland.org>, Santosh Shilimkar
 <ssantosh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Scott Branden <sbranden@broadcom.com>, Scott Wood <oss@buserror.net>,
 Sean Paul <sean@poorly.run>, Sean Wang <sean.wang@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Simona Vetter <simona@ffwll.ch>,
 Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stephen Boyd <sboyd@kernel.org>, Sven Peter <sven@svenpeter.dev>,
 Takashi Iwai <tiwai@suse.com>, Talel Shenhar <talel@amazon.com>,
 Tero Kristo <kristo@kernel.org>,
 Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>, Tony Lindgren <tony@atomide.com>,
 Tony Luck <tony.luck@intel.com>, UNGLinuxDriver@microchip.com,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Vineet Gupta <vgupta@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 WANG Xuerui <kernel@xen0n.name>, Woojung Huh <woojung.huh@microchip.com>,
 x86@kernel.org, Yanteng Si <si.yanteng@linux.dev>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Zhang Rui <rui.zhang@intel.com>
References: <20250319092951.37667-1-jirislaby@kernel.org>
 <874ixxonyy.ffs@tglx>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <874ixxonyy.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 06. 05. 25, 15:41, Thomas Gleixner wrote:
> On Wed, Mar 19 2025 at 10:28, Jiri Slaby wrote:
> 
>> Hi,
>>
>> tl;dr if patches are agreed upon, I ask subsys maintainers to take the
>> respective ones via their trees (as they are split per subsys), so that
>> the IRQ tree can take only the rest. That would minimize churn/conflicts
>> during merges.
> 
> So. It's rc5 by now and I picked up everything

Good, thanks.

> which did not show up in next yet. 

Which is the majority -- routing through subsystems didn't work as well 
as I anticipated.

I planned to retry with v3 after the next merge window, but you were faster.

V3 contains a switch from nodes to dev_fwnode() in some cases. It 
simplifies the code there. This did not get lost, I will send this 
separately to maintainers once everything from this series settles in 
the tree. I.e. likely after the next merge window.

> @Jiri, I fixed up all your subject prefixes as
> 
>    'irqdomain: subsys: Switch to foo()'
> 
> does not make any sense at all. These subsystems have their regular
> prefixes and these changes do not justify made up irqdomain special
> prefixes at all.

Yes.

thanks,
-- 
js
suse labs

