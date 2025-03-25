Return-Path: <linuxppc-dev+bounces-7321-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 384A5A6EA51
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Mar 2025 08:20:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMLsr6NZwz2yqm;
	Tue, 25 Mar 2025 18:20:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742887216;
	cv=none; b=efkdAJODUoSm2pmt0+qqrdJmWJ6V3OsMLpeQnoeN5Kk/bFNZMxZKcaf1Y+ln7peG2SyOOaqiunhjePcEc+Sk2+3o1ngwo5YQ4VLdpQXb8PGNYTRT287K4v86CpWeIbvBF8GRtQb5myKWE1k4H4wvEMQGJT9Ls58W7AHvIMpBd9Goy9yvr2ZNC0UdNrchOvtRG7TBAlutnjHFKxuM3Sq8BsD+7EOo78llPv7C/nD/Hii9F9dZz32LksBj9jlvS3XuYF60kD+tmRgVC59PR8xyW7+ZwASmdkIvadauGOZlGPLT84fJV/1fXen2eXOnxr8eHTJz2zj51quWpkLd+Wscqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742887216; c=relaxed/relaxed;
	bh=ogLiTva+0D7LvhmiL+r7dKkS43UnjgtUjLlP8SWiYBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YgfniHb2pbDxNGkN74F6cgwIIHIDeCPfzWdeRO1BgTx+d2ZIFJHABPCbrCHLaCyOsVcx2WVyXH1KhPF4WCFPtx/oUbA+x5YdtJNipu4vdGRfgqYFNdDIiBukRbpEnOEUx+oXdeYlZ0LLuQUJGRTArVShloUP2IvCxgmd5VT2fcqW3ptXWoRUnlHdyBdl5mvEUUyA9VfIxtxCDySjVHMDiM8mA1SCM7n5UOgP+IF1IWRIv56ls3DzS1ejy/nr3Lsf7aRTDtKVEKw5e2JdMOtwO7+Na5ThROPyeB13rxyM220HlYSL0yBMAg/swpn2Ca5Iq/SsBgaAn54yjl5DJ6/sfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZMLsr177Yz2yqg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Mar 2025 18:20:16 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ZMLXZ26Lwz9sSV;
	Tue, 25 Mar 2025 08:05:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RFFIDcgfzoK7; Tue, 25 Mar 2025 08:05:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ZMLXY2g73z9sSS;
	Tue, 25 Mar 2025 08:05:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DA00C8B766;
	Tue, 25 Mar 2025 08:05:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id FEOhRsdEs3K2; Tue, 25 Mar 2025 08:05:16 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 285238B763;
	Tue, 25 Mar 2025 08:05:15 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 52P756MK009381
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 08:05:07 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 52P742SQ009337;
	Tue, 25 Mar 2025 08:04:02 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: tglx@linutronix.de, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, maz@kernel.org,
        linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alex Deucher <alexander.deucher@amd.com>, Alex Shi <alexs@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        amd-gfx@lists.freedesktop.org, Amit Kucheria <amitk@kernel.org>,
        Anatolij Gustschin <agust@denx.de>, Andi Shyti <andi.shyti@kernel.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Andreas Kemnade <andreas@kemnade.info>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andy@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Antoine Tenart <atenart@kernel.org>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Baruch Siach <baruch@tkos.co.il>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Borislav Petkov <bp@alien8.de>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Corentin Chary <corentin.chary@gmail.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Daniel Golle <daniel@makrotopia.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Daniel Mack <daniel@zonque.org>, Daniel Palmer <daniel@thingy.jp>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        DENG Qingfang <dqfext@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Dongliang Mu <dzm91@hust.edu.cn>, Doug Berger <opendmb@gmail.com>,
        dri-devel@lists.freedesktop.org, Eddie James <eajames@linux.ibm.com>,
        Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Geoff Levand <geoff@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Guo Ren <guoren@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Herve Codina <herve.codina@bootlin.com>,
        Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, "H. Peter Anvin" <hpa@zytor.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Changhuang Liang <changhuang.liang@starfivetech.com>,
        Chen-Yu Tsai <wens@csie.org>,
        "Chester A. Unal" <chester.a.unal@arinc9.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Chris Zankel <chris@zankel.net>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Imre Kaloz <kaloz@openwrt.org>, Ingo Molnar <mingo@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>, James Morse <james.morse@arm.com>,
        Janne Grunau <j@jannau.net>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jianjun Wang <jianjun.wang@mediatek.com>,
        Jiawen Wu <jiawenwu@trustnetic.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Jim Quinlan <jim2101024@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Johannes Berg <johannes@sipsolutions.net>,
        John Crispin <john@phrozen.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Jonas Bonn <jonas@southpole.se>, Jonathan Cameron <jic23@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Joyce Ooi <joyce.ooi@intel.com>,
        Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
        Keerthy <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
        Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linus Walleij <linusw@kernel.org>, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-remoteproc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-sh@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linux-sound@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-um@lists.infradead.org,
        linux-wireless@vger.kernel.org, loongarch@lists.linux.dev,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Lukasz Luba <lukasz.luba@arm.com>, "Luke D. Jones" <luke@ljones.dev>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Mark Brown <broonie@kernel.org>,
        Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Mengyuan Lou <mengyuanlou@net-swift.com>, Michael Buesch <m@bues.ch>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Simek <michal.simek@amd.com>,
        Miodrag Dinic <miodrag.dinic@mips.com>,
        Naveen N Rao <naveen@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Nipun Gupta <nipun.gupta@amd.com>, Nishanth Menon <nm@ti.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
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
        Rob Clark <robdclark@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Robert Richter <rric@kernel.org>, Rob Herring <robh@kernel.org>,
        Roger Quadros <rogerq@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Samuel Holland <samuel@sholland.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Scott Branden <sbranden@broadcom.com>, Scott Wood <oss@buserror.net>,
        Sean Paul <sean@poorly.run>, Sean Wang <sean.wang@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        Simona Vetter <simona@ffwll.ch>, Stafford Horne <shorne@gmail.com>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stephen Boyd <sboyd@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Takashi Iwai <tiwai@suse.com>, Talel Shenhar <talel@amazon.com>,
        Tero Kristo <kristo@kernel.org>,
        Thangaraj Samynathan <Thangaraj.S@microchip.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Toan Le <toan@os.amperecomputing.com>,
        Tony Lindgren <tony@atomide.com>, Tony Luck <tony.luck@intel.com>,
        UNGLinuxDriver@microchip.com,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Vineet Gupta <vgupta@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>, WANG Xuerui <kernel@xen0n.name>,
        Woojung Huh <woojung.huh@microchip.com>, x86@kernel.org,
        Yanteng Si <si.yanteng@linux.dev>,
        Yoshinori Sato <ysato@users.osdn.me>, Zhang Rui <rui.zhang@intel.com>
Subject: Re: (subset) [PATCH v2 00/57] irqdomain: Cleanups and Documentation
Date: Tue, 25 Mar 2025 08:03:28 +0100
Message-ID: <174288553816.2234438.13558299160543301187.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742886214; l=533; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=EKh0/GewaFERhfnFRfKBg2j5NzMhdBBECdrA+NV/qUk=; b=vA70hw72XKaj1SXthnl6PXh4i9Z2K3Egqlb0PIRXfpHV2vrVCLTo/AG4L7b0hc2x3UCZ6Qx3v FOB4ERwauOeBecqk7A7PBvaW/237URvW4CKvgDK24Wh/OVU59RY4zZO
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
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

Applied, thanks!

[48/57] irqdomain: soc: Switch to irq_find_mapping()
        commit: a70a3a6322131632cc6cf71e9d2fa6409a029fd7

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>

