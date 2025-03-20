Return-Path: <linuxppc-dev+bounces-7236-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D42A6A98C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Mar 2025 16:19:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJTkZ149Hz2yvk;
	Fri, 21 Mar 2025 02:19:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742483942;
	cv=none; b=GsZV/fUm+hLIdTdsFGrd/L8401pzqyKfWhiTattBmUaZkPP+pcHtg57YqrcR8WjieJxCzX5o7X6xsxp0Gzf2xbJ5YrC/tveMJ5wrJzlCsTSDXygpyPOExTGj9GPCGi9OBjOipn9YeXyEJoBSnaKSYWHg0vbDuXTZUNq5qhJEhUvAScPLIgXa+HuLKaVCZ3f7XVP7C6tCZ4hRhIHJP496Ogn/kzXwpLfRWgU+NGwSWU0VYGKP4G4VBm8SoGvy08i0qsg62cCG5AYHJVSlfuC75ozQUR/pvxIwcKgMnsPPxO4d0Enge1CSt+hckRKVSa2yynA7fYkUjEbhtu03XqRovA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742483942; c=relaxed/relaxed;
	bh=rCzcmXMuHtfzs90QYD8k+YqTGhYvPxzH2rNIAb2m1Pk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MfsDOqVVXEYJMFAxobztTWAPDe61n8MKdhloUCEQT53cQe1EqlqfrOYNEekqVGhP2p6tOLilaVc5qscc7nRT/KXWzDvLuze/r6z1FKGPl0CHEMilBSdZq4i2HBsez/4MS3kVybRfw3dG3WOOUObkkTTA8UB8Teg9kZUY0dvT/YTQWTzGaVjxfMB1Na5GHfErAFbt/zdTdGtJL+2mIgyUXrGLyYiqqSqbLll5KUvblOCBTsz8cSuKPHe3QJ4kSUZudbU8z6cKNVo3Qo0qht8FgDXqS8wH5OquaJD3MXhW4ZyI0cWQg7YMDODKYehy67pYON+5VUB3b2MAdU6z10g9eA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jtAZa04N; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jtAZa04N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJTkY00rsz2yfT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 02:19:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 77FA76115E;
	Thu, 20 Mar 2025 15:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A232C4CEDD;
	Thu, 20 Mar 2025 15:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742483936;
	bh=1Z6H2iLvH3rXMt19HL+9taZFJeo/GqQ1pEgfLHm/VO8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jtAZa04NkVALEmArILtqhgvGWzNrqybg3hrSGdZZ2VVAFhkXh1nT4jpUcZ4Kc2DDn
	 0A6i4ERYcuiCeprXqYIMy4u4kiFrkwJYEeYsWv+53EA4mBSJ6BqBYD7yzk5jl0BW7F
	 3K+uSeS65G8FFh9VmSyWsSaODa9u59R3cNyzrD/bWKcMoby2y3/LjyBnzNkYD+iJSL
	 9QHQkLG/EQ0PXCuzUmTG72RV9mKDT4ZRjt1NiAC6yuM4pg17khef1prwdyUg+6q41R
	 XwbECsZNkZ4re5+LVruYEIZ107+IH+Jq6zDSLtPqFFjlA4zbkDNY4cbCQwK98Zoq0c
	 4mfWfzYas3b3w==
From: Mark Brown <broonie@kernel.org>
To: tglx@linutronix.de, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: maz@kernel.org, linux-kernel@vger.kernel.org, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Alex Shi <alexs@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, amd-gfx@lists.freedesktop.org, 
 Amit Kucheria <amitk@kernel.org>, Anatolij Gustschin <agust@denx.de>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
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
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
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
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Herve Codina <herve.codina@bootlin.com>, 
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, "H. Peter Anvin" <hpa@zytor.com>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Chen-Yu Tsai <wens@csie.org>, "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Chris Zankel <chris@zankel.net>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Imre Kaloz <kaloz@openwrt.org>, Ingo Molnar <mingo@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, James Morse <james.morse@arm.com>, 
 Janne Grunau <j@jannau.net>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Jiawen Wu <jiawenwu@trustnetic.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Jim Quinlan <jim2101024@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Joel Stanley <joel@jms.id.au>, Johannes Berg <johannes@sipsolutions.net>, 
 John Crispin <john@phrozen.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Jonas Bonn <jonas@southpole.se>, Jonathan Cameron <jic23@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Jonathan Hunter <jonathanh@nvidia.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Joyce Ooi <joyce.ooi@intel.com>, 
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
 Keerthy <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
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
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, "Luke D. Jones" <luke@ljones.dev>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Mark-PK Tsai <mark-pk.tsai@mediatek.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Mengyuan Lou <mengyuanlou@net-swift.com>, Michael Buesch <m@bues.ch>, 
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <michal.simek@amd.com>, 
 Miodrag Dinic <miodrag.dinic@mips.com>, Naveen N Rao <naveen@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>, 
 Nishanth Menon <nm@ti.com>, =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Peter Rosin <peda@axentia.se>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 platform-driver-x86@vger.kernel.org, 
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>, 
 Qiang Zhao <qiang.zhao@nxp.com>, Qin Jian <qinjian@cqplus1.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Ray Jui <rjui@broadcom.com>, 
 Rengarajan Sundararajan <Rengarajan.S@microchip.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Richard Weinberger <richard@nod.at>, Rich Felker <dalias@libc.org>, 
 Rob Clark <robdclark@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Robert Richter <rric@kernel.org>, Rob Herring <robh@kernel.org>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, Ryder Lee <ryder.lee@mediatek.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
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
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Vineet Gupta <vgupta@kernel.org>, 
 Vladimir Oltean <olteanv@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 WANG Xuerui <kernel@xen0n.name>, Woojung Huh <woojung.huh@microchip.com>, 
 x86@kernel.org, Yanteng Si <si.yanteng@linux.dev>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Zhang Rui <rui.zhang@intel.com>
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
Subject: Re: (subset) [PATCH v2 00/57] irqdomain: Cleanups and
 Documentation
Message-Id: <174248389026.68765.4225899402848645156.b4-ty@kernel.org>
Date: Thu, 20 Mar 2025 15:18:10 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 19 Mar 2025 10:28:53 +0100, Jiri Slaby (SUSE) wrote:
> tl;dr if patches are agreed upon, I ask subsys maintainers to take the
> respective ones via their trees (as they are split per subsys), so that
> the IRQ tree can take only the rest. That would minimize churn/conflicts
> during merges.
> 
> ===
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[35/57] irqdomain: sound: Switch to irq_domain_create_linear()
        commit: 83eddf0116b09186f909bc643f2093f266f204ea

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


