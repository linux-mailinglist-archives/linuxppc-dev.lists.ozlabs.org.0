Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26579719BFA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 14:23:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX4zm5hH3z3fbQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 22:23:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=MvJg1McE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bp.renesas.com (client-ip=2a01:111:f403:700c::714; helo=jpn01-os0-obe.outbound.protection.outlook.com; envelope-from=biju.das.jz@bp.renesas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=MvJg1McE;
	dkim-atps=neutral
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on20714.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::714])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWymd4djwz30Ky;
	Thu,  1 Jun 2023 17:43:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OC2tx1raS4xFiYTU9nkqZSP8KQBu86kUpGyYxpPoEdKgqwf1HfLohfisQ2v/kl5ogvpBtNLfJglIGgloLsmjKR4t802NrQNlTXKGRO7TaTiaksHSyEnTCY1KY1gOh5wvAuS3DfHMWo1k6BjBGw9cBr2czF/DMMzL6NhMDLyP4A1ebRVpw1qoVzSIsGg/YDDpEbKzj51QyiLBdiovDyU5CtvQe5Ytj0RRggj/qhUw6S09lUynsFw/Bl6wmfEqBd5NPBIwwnffLlONjg/z/2xroYvFwKzbVawInNSaLW/GGWAzbXP1rOPRs9ApNa1g7Cgsv2ZKXJc//Zeh8mZMqWiEOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wqYbsrJQXqF9GvntmGttKH2tgPG0mx6kMRLo1jitRU=;
 b=btAqEc+SKroA9itXE3oM2t/quHTI010pLBofb0+s8Plfq93EwO67akKdoUyuelBSh189IhP/51tuSvSULV+/7QSjKowlZYDYK/9znw7bB4TrnzLCiJyX6v0mpHMqeOTfBcPvbsMZyueTeNIwT0NY183p82l4O/j8gAAD6O8A9html8DMzc8z00XW4dDSqs78HRiV1UztFHSK4F9noFs33Xf0AUAZibZyFq9ZPIgIjHYL/30BkKEqVa+hF94m+S8RQZ+WvkQsulx4ENKSbBL/btp1nVI73MYJ7IYRZtMgDXrQh0FV+HWC0tTABy75wa5uJE87rw6wGsnhoOEUEqaL8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wqYbsrJQXqF9GvntmGttKH2tgPG0mx6kMRLo1jitRU=;
 b=MvJg1McEKIF1XxnBZh9LrleKU9LtoRkD3cnVrLh9jmVOoUqcg+De/6Bj4lO72yOu6ovw3DKBv7aVveYP3PhQqlmLvGELREU0X6gXYt9kStPAd7QRG2DNDXf4G5bPbWT9MPvdnmUPXHjyDlYWqj3E4iINe1AowK0hqDRW87/rFlQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSYPR01MB5334.jpnprd01.prod.outlook.com (2603:1096:604:8a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 07:43:00 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 07:43:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH 00/89] i2c: Convert to platform remove callback returning
 void
Thread-Topic: [PATCH 00/89] i2c: Convert to platform remove callback returning
 void
Thread-Index: AQHZlFxg9nu96Paupk+lXeVwp1GaX691kEww
Date: Thu, 1 Jun 2023 07:43:00 +0000
Message-ID:  <OS0PR01MB5922C27820E42F49E2209F4686499@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230601073322.ww25ajaurktqsryr@pengutronix.de>
In-Reply-To: <20230601073322.ww25ajaurktqsryr@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSYPR01MB5334:EE_
x-ms-office365-filtering-correlation-id: 68444b02-9af2-4654-15bd-08db6273d306
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  4dOQfpC12pbg2IZRoP/BCp+WhuK+HGi65mvG1E9zwUHLj2uhjxjEkWBPNkBTorfYQCrCWlVL8ofABywH1BBFOcySEEGqJ/yaiA7nMZo5Z6cCaazrnnD+Fw9E0fXgMKoh5548BQBs/iTGBfrfVwlZiaUusHk0XoHNRf3oZCvAi7vgvEi37B/hUxoN5wCWg0vC1ICZU0cJcv7jHtgk6whWmNO8vXF33wjwC83Mp+oYjqwS9L9lbs8K4Nrs28tu8/AWqhTGSLX/HhfHyGHjpVWuHKfVtUKT/IV2mdTqJ16wW7S30SHISkTj2GmfeANoRZZR+SrhFwHgDMH536qGFi4jfGRk86AWHw+xyhFsMTgRApbNvUH+wzornVLvyAYvAIl1TwWcwzT8rbOkvhl2eKZhwR99tv5KCjLux5Amy7BeIwhCnT/aUcue1tCct97UMeOlk4rBWYfL3rB5QdXt2Fdv71Qso5O8oe3guEOesvxuMj2nIqVvEft8XtWWGc7QJkyFmgKNxpQeWJOezX6zp3Huu/jBr+Lo4OdCRxbfRGsDyKXoub8luUghj4ayp5NdMYjW0o2WkkpedWI/Tmhv59zsVAjHIV5aFFirpS8ySG6J2kI=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(38100700002)(122000001)(86362001)(38070700005)(558084003)(33656002)(8936002)(8676002)(41300700001)(7416002)(7406005)(5660300002)(7276002)(26005)(52536014)(6506007)(7336002)(9686003)(7366002)(55016003)(66556008)(2906002)(186003)(7696005)(66476007)(66446008)(71200400001)(316002)(76116006)(66946007)(478600001)(110136005)(54906003)(4326008)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?6zLKumqWor09XNaKmUNXfbflmWds0r7E7K+AVAf0KYDKV+i1B9zou9Zu9K?=
 =?iso-8859-1?Q?4xsdx0akn3mF+2pMB/YdDWVQs4iiu5PC3lXVJSKOZgYVGJO8V3qHuywQqj?=
 =?iso-8859-1?Q?5fRyUVvI0xGhujpZpEP/CKTfXwaKeUVNrAKgKndC10G8215bGjNIervVAC?=
 =?iso-8859-1?Q?S1C404b2v8LRFuA0MY6xejIEv1wWp8DNEOUAGy0KJyfLx4hnCwuC6uieTW?=
 =?iso-8859-1?Q?lNVgwHl/Znvz+ShRPYzd7Kb6MU5//bpCj0Pz7Pg0+xnIIsJ8DDz06VlqI+?=
 =?iso-8859-1?Q?Yh15bXTj2BiqCrzobqXBygE+rs/Feo8K3K2/oRrZqB7G/VQrbDqFE+u/C2?=
 =?iso-8859-1?Q?sh0uaVUqKizGddvgkI/utR8RxAoLvuS86Ler4o/JDpGqQHMXm4tWLsuZGH?=
 =?iso-8859-1?Q?SY0EslsbM7FZjI3q5MwXHkPTZKjxDuhfnVkdnkN3Ml4RNCWNDVstog0V2n?=
 =?iso-8859-1?Q?paf45EZmXWaa7kYzjShuPaO4ibnQNLD2kHPLz9UifNf5MiHdrKS9RAIO04?=
 =?iso-8859-1?Q?8Ts1bBxGNpdIEF0rBGQ+Bh1NaH70lZ5O5iMJbfigAkx+2wS2uWF0u3RFob?=
 =?iso-8859-1?Q?5oJoWrFgjYiCL925RLFLcioVkGGhw3o2+UpdrtNRcmIgg/R70BsgfYnTF3?=
 =?iso-8859-1?Q?KArwzU8Box7RETjddbzmPwFDl7qI0SoUlAC04/NP32Ts9FyDglo5pHFBWN?=
 =?iso-8859-1?Q?R93l9xBmIIDX56hZafNV509vHigf+0TbbqoQ2BcyvopRoJ0WB8ySKIe418?=
 =?iso-8859-1?Q?iM473tWRALPtpZTmi5YXfxakxFqBiT8F1vGGfgx77UycKVryRhXjYL6n3d?=
 =?iso-8859-1?Q?GsNJm+feJG1snLXLpiCn9NKgpVCRH8R3PGwxyPk56OeH9BDwPWmgWrIU0C?=
 =?iso-8859-1?Q?uK/CLCWUiEplrEI75qY15wiS/1fj74aVkDs3pkrrpYrSlG7tta13x+pMO1?=
 =?iso-8859-1?Q?Vvz1QznoO+VVlDkUxVqtD2DJzIqAHEA87XYZaqGB4ni70g5+SX9VjT+ByX?=
 =?iso-8859-1?Q?7rZYRzp8+cFe4kDDM9oSbqUsVFMNLi16PApH1mSsW8lvy2brPeixhbfTXe?=
 =?iso-8859-1?Q?7YUtUs4OULZQoJjUsDjbj794M1Mhv6E9K4ibUMvRMUKYhmrY3DUTCySuFC?=
 =?iso-8859-1?Q?6qte6tPzLH5Pf35UAhTdwM5cQkht9yWdZHTVuINFh2mhSbKLXZ4ITLyjAs?=
 =?iso-8859-1?Q?b9e4E/Sz7CCdQPhN4oqmqcXDhkc1TFJ3bkDwaJnmRhyjVNy3AXmWThQ2g2?=
 =?iso-8859-1?Q?ErOcK2a0D3FiW8rmslkXpzDeyFObaOR8Vh7TIMgIhjEaHgEUL3U9oNb+U6?=
 =?iso-8859-1?Q?ee0EYe7Bvwwn51nCaGHeJ6OOBfznACqzg81geVH1htxm7G2zhtFGdoM3Be?=
 =?iso-8859-1?Q?eQScPd5tglRWHsIPQeIFFArfVa6BxtOCU1/zt0WP28RMy7tCSGYd4oXcxP?=
 =?iso-8859-1?Q?qKN/8GIYeB2+/82VQoC3djYurs70Y6Lmml0fy966NpIpUbcEq1D8ZHzkog?=
 =?iso-8859-1?Q?Sr63jHh5FExLk85nVWLoEMoQfCADp4C+lGFhQaoZhcFmH52n070W5DOH6g?=
 =?iso-8859-1?Q?LHjnsH4pmJSzX2pbeUX0cWAprbzSImnsJqUEKZMquiocUeouLu6P8hYWZQ?=
 =?iso-8859-1?Q?GcLjGezxDdMq7KO8zewEEP8fZKNnu3vtGq?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68444b02-9af2-4654-15bd-08db6273d306
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 07:43:00.3777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dbtV87nHOi+46FblUUCpZdTZvmcGMKm/GxDqOyKN3WNlUkdfhhR/EhiEvf+Oi05X9EJeq0Ae76YS9XmFamb4ENhjCguR0uteotyJc7KD6UY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5334
X-Mailman-Approved-At: Thu, 01 Jun 2023 22:22:24 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>, Tomer Maimon <tmaimon77@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, Alim Akhtar <alim.akhtar@samsung.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Dmitry Osipenko <digetx@gmail.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, Heiko Stuebner <heiko@sntech.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>, Khalil Blaiech <kblaiech@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>, Jean Delvare <jdelvare@suse.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, ye xingchen <ye.xingchen@zte.com.cn>, Sascha Hauer <s.hauer@pengutronix.de>, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-omap@vger.kernel.org" <linu
 x-omap@vger.kernel.org>, Allison Randal <allison@lohutok.net>, Scott Branden <sbranden@broadcom.com>, Daire McNamara <daire.mcnamara@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Jeffery <andrew@aj.id.au>, Masami Hiramatsu <mhiramat@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Claudiu Beznea <claudiu.beznea@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Thierry Reding <thierry.reding@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Guenter Roeck <groeck@chromium.org>, Stefan Wahren <stefan.wahren@i2se.com>, "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.
 infradead.org>, Peter Korsgaard <peter.korsgaard@barco.com>, Alain Volmat <alain.volmat@foss.st.com>, Jerome Brunet <jbrunet@baylibre.com>, Chris Pringle <chris.pringle@phabrix.com>, Andi Shyti <andi.shyti@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Chris Packham <chris.packham@alliedtelesis.co.nz>, "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>, Nick Hawkins <nick.hawkins@hpe.com>, "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>, Michal Simek <michal.simek@amd.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Benjamin Fair <benjaminfair@google.com>, Dong Aisheng <aisheng.dong@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, Jim Cromie <jim.cromie@gmail.com>, Hector Martin <marcan@marcan.st>, Wolfram Sang <wsa@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kevin Hilman <khilman@baylibre.c
 om>, Aaro Koskinen <aaro.koskinen@iki.fi>, Thor Thayer <thor.thayer@linux.intel.com>, Vadim Pasternak <vadimp@nvidia.com>, Jean-Marie Verdun <verdun@hpe.com>, Brendan Higgins <brendan.higgins@linux.dev>, Elie Morisse <syniurge@gmail.com>, Stefan Roese <sr@denx.de>, Krzysztof Adamski <krzysztof.adamski@nokia.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, Peter Korsgaard <peter@korsgaard.com>, Florian Fainelli <f.fainelli@gmail.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Wei Chen <harperchen1110@gmail.com>, Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Joel Stanley <joel@jms.id.au>, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Robert Richter <rric@kernel.org>, Asmaa Mnebhi <asmaa@nvidia.co
 m>, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, Benson Leung <bleung@chromium.org>, Qii Wang <qii.wang@mediatek.com>, Avi Fishman <avifishman70@gmail.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Sebastian Reichel <sre@kernel.org>, Oleksij Rempel <linux@rempel-privat.de>, Julia Lawall <Julia.Lawall@inria.fr>, Laxman Dewangan <ldewangan@nvidia.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, "asahi@lists.linux.dev" <asahi@lists.linux.dev>, Shawn Guo <shawnguo@kernel.org>, Peter Rosin <peda@axentia.se>, Baruch Siach <baruch@tkos.co.il>, Vignesh R <vigneshr@ti.com>, Tony Lindgren <tony@atomide.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Chris Brandt <Chris.Brandt@renesas.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Jan Dabros <jsd@semihalf.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Ard Biesheu
 vel <ardb@kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Kamal Dasu <kdasu.kdev@gmail.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andy Gross <agross@kernel.org>, Sven Peter <sven@svenpeter.dev>, Hans de Goede <hdegoede@redhat.com>, George Cherian <gcherian@marvell.com>, Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Loic Poulain <loic.poulain@linaro.org>, Patrick Venture <venture@google.com>, Bjorn Andersson <andersson@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Michael Shych <michaelsh@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Grego
 ry CLEMENT <gregory.clement@bootlin.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Subject: Re: [PATCH 00/89] i2c: Convert to platform remove callback
> returning void
>=20
> [Dropped Phil Edworthy from recipents as his email address has problems]

Phil no longer works with Renesas. Adding Fabrizio who is taking care of
RZ/V2M I2C driver.

Cheers,
Biju
