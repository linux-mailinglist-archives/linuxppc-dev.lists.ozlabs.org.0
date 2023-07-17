Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6910755967
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 04:08:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=HZgM7YG4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R458p68Twz3brX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 12:08:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=HZgM7YG4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1b::616; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=wei.fang@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R44hb1FLbz30dx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 11:47:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAdP3iVmDrbh53KfrBYzvPIWgdl1jknoID96NwJoog5uicIza9i34kObv32Imt3RqlTwPr2e+4X1LR8F5yV2CqD8O3TtLP4W/gzkATOlgtcfatSkgnvA3IWcymACQm5T4gwT4hLyTmvTVz0w1ojCkzpChWlHqSAwVluRy+L5WioMCvLAmZoKvdmO5zaQ9dvv5RHvZCMzHv7wSQnHVLkiYZxCvq03Jqn+Zj7jkJ2nWVKye+OG1MO65tIhg9yw2KheTlHAxHpb30GT1kvW2VUSMs0gUMRVBSD8vfGVa16Bdo5MeXdqkZ1J2IAGqQ7YVVfpW0iV/gOIbDaXVlBKm+N1uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdGLVLFbPENnnU0PQ5jZZVtnDWmJ0CNbuonp9r/KhIM=;
 b=ce1H6SlBlg/kYDBwTcq736bi2cTyeZUx4Q+r9pqqx7q7F8IKoOaql5AlSas+EFOF4OUaO/ipx5JFiltc/e86XdJKRTCu8hV1EA4IbvWaLUzaOE1ySlwq/YMPhMz2sFHN4kzxkXnamfNsKzG0q0PS0O9ROpof4tMb/HmGtMyVKF1BL4WfOSscP3KCT2bFe3PtV9AqYee2S+e34VRk9+OTRW1yj7nGWUupVirw3zl0C0jKjbTa4cD37oBQUm6uGw1Xu6ZZnYf2notX/2QGEGsi77UnSZ3FoClWoA0N0Us03VXq15ywzhtIIQsD+O65RP5zVjFlXh46JA9+LzEq58+vSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdGLVLFbPENnnU0PQ5jZZVtnDWmJ0CNbuonp9r/KhIM=;
 b=HZgM7YG4FkwpG1nMtbRKpz3/j6rA54pdRTo1Nf3D3FUYj1g+mcSpdshZFt/otRHsoIT4evU+ezIKpQMSXogMyf2H4ZpLSTJVDddAFcqSXsMKMzXdUTUVWuih8ahdNiM3EQpUpiKKaLocjjTOoznT1986Q+kcInzWiVraW55N0xU=
Received: from AM5PR04MB3139.eurprd04.prod.outlook.com (2603:10a6:206:8::20)
 by PAXPR04MB8718.eurprd04.prod.outlook.com (2603:10a6:102:21d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 17 Jul
 2023 01:47:00 +0000
Received: from AM5PR04MB3139.eurprd04.prod.outlook.com
 ([fe80::2468:a15e:aa9b:7f8e]) by AM5PR04MB3139.eurprd04.prod.outlook.com
 ([fe80::2468:a15e:aa9b:7f8e%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 01:47:00 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Rob Herring <robh@kernel.org>, Dario Binacchi
	<dario.binacchi@amarulasolutions.com>, Wolfgang Grandegger
	<wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Chandrasekar
 Ramakrishnan <rcsekar@samsung.com>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>, Andrew Lunn
	<andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, Kurt Kanzenbach
	<kurt@linutronix.de>, Woojung Huh <woojung.huh@microchip.com>,
	"UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Daniel Golle
	<daniel@makrotopia.org>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Claudiu Manoil
	<claudiu.manoil@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>, =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?=
	<alsi@bang-olufsen.dk>, George McCollister <george.mccollister@gmail.com>,
	Andreas Larsson <andreas@gaisler.com>, Iyappan Subramanian
	<iyappan@os.amperecomputing.com>, Keyur Chudgar
	<keyur@os.amperecomputing.com>, Chris Snook <chris.snook@gmail.com>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Madalin Bucur <madalin.bucur@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	dl-linux-imx <linux-imx@nxp.com>, Sean Anderson <sean.anderson@seco.com>,
	Pantelis Antoniou <pantelis.antoniou@gmail.com>, Leo Li <leoyang.li@nxp.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
	Douglas Miller <dougmill@linux.ibm.com>, Marcin Wojtas <mw@semihalf.com>,
	Russell King <linux@armlinux.org.uk>, Tara s Chornyi
	<taras.chornyi@plvision.eu>, Mirko Lindner <mlindner@marvell.com>, Stephen
 Hemminger <stephen@networkplumber.org>, Felix Fietkau <nbd@nbd.name>, John
 Crispin <john@phrozen.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo
 Bianconi <lorenzo@kernel.org>, Horatiu Vultur <horatiu.vultur@microchip.com>,
	Timur Tabi <timur@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, Steve
 Glendinning <steve.glendinning@shawell.net>, Kunihiko Hayashi
	<hayashi.kunihiko@socionext.com>, Giuseppe Cavallaro
	<peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Vinod Ko ul <vkoul@kernel.org>, Bhupesh
 Sharma <bhupesh.sharma@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Samin Guo <samin.guo@starfivetech.com>, Thierry Reding
	<thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Nobuhiro
 Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Grygorii Strashko
	<grygorii.strashko@ti.com>, Kevin Brace <kevinbrace@bracecomputerlab.com>,
	Francois Romieu <romieu@fr.zoreil.com>, Michal Simek <michal.simek@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Alexander Aring
	<alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Alex Elder <elder@kernel.org>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, Heiner Kallweit
	<hkallweit1@gmail.com>, SkyLake Huang <SkyLake.Huang@mediatek.com>, Kalle
 Valo <kvalo@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	=?utf-8?B?SsOpcsO0bWUgUG91aWxsZSBy?= <jerome.pouiller@silabs.com>, Richard
 Cochran <richardcochran@gmail.com>
Subject: RE: [PATCH] net: Explicitly include correct DT includes
Thread-Topic: [PATCH] net: Explicitly include correct DT includes
Thread-Index: AQHZtsYftE63Op7iH02aV+zMmTK2wq+9MuVQ
Date: Mon, 17 Jul 2023 01:47:00 +0000
Message-ID:  <AM5PR04MB3139EAC2307DB55168828AD6883BA@AM5PR04MB3139.eurprd04.prod.outlook.com>
References: <20230714174809.4060885-1-robh@kernel.org>
In-Reply-To: <20230714174809.4060885-1-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM5PR04MB3139:EE_|PAXPR04MB8718:EE_
x-ms-office365-filtering-correlation-id: 6962b983-1238-481a-9271-08db8667b66b
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  UPSu5KOnNqoMx+96goO9rxLVBybvmmLK64iGtk2pZbNhzGJzJZmJIKZPkcL3IWFthMTHdKS0f5qcIA1kBlHgOFCROonItm2nRjnE74tlV/Poh5z5lqUw9uGcteKvEHYi50O5afOHEuhog7eDde0FvwkztjJXeY7Tf9/y4EgcTK1SlUPJAtc9PKOqba7RO2Vcj3JVeDDP9PTL9Ls+588qFcpuUM/FzOHvMlzRIKLS7lGAHV8ivPE55uKv9iV2OKS5jcespElhRWwqpjPIvt2RNFkxc6Ok5Qz1H6KuR8E8f0nqV+5Oup+cKYn8FYm+G83+CWbAnV7TEaTbKCPhZUN3xeTMa3hHw5ltTP8lsIMJeqeAzuPKdtX+XBDi3g0BlQNcJ7aYRDI0J4yZjmugT/HTXeh0UlitCDRzHIFs7OuP5JE+tHkw36CZANvqapzEJdePpjlJY5AVB9H/SvRjKvcGp4nX7XE1NUsDV7qz6wfmJnT+hqLB6mI11zbGePCj4XJk5H0diqHc6GhCcJjQb4HD28pCYPAZHG9cKvbHQCWx5S63T4GBjXQ7DbltWejnyVIzhwsBgeDRidB/4LQZy4+unAAQpA0YtzH+MkBad3TUeN53PFFBhK+yzKgjhT6s+SolGI/HAFFaFNoRuh+pwwq3WQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3139.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(451199021)(1191002)(2906002)(54906003)(110136005)(478600001)(71200400001)(7696005)(7406005)(7366002)(7416002)(7276002)(44832011)(7336002)(316002)(41300700001)(76116006)(66556008)(66476007)(4326008)(64756008)(66946007)(66446008)(38070700005)(921005)(186003)(66574015)(83380400001)(55016003)(38100700002)(8936002)(122000001)(86362001)(53546011)(33656002)(52536014)(5660300002)(26005)(8676002)(6506007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MkR1VjROWVBNY2preTJYdTBHY0xpNjdxOU5MaDRBU1djSVptVjhDS3JnRisy?=
 =?utf-8?B?a0VWdU9mNjlJK1BaNlhwblFIZ1IvaVN1VFVDQThBTTNFRE1WeHQ0U2d5Q21X?=
 =?utf-8?B?UVNldk4yOWg5Q0IvRW8vSnpReXhnREpxY3VnZDBGMG12NzdydHIyZlhuTXZj?=
 =?utf-8?B?eHRRbkVFSXN1dndpK1NLTkVZMllhMjdzaXBQYzZuMkI1YTh4T1BLdGkraExn?=
 =?utf-8?B?WENBYkMzWWFwUjNsVnFSVUNkMURXQnFhbGhDYklTdm1KVUZvajNtQUFpaU1F?=
 =?utf-8?B?alQzclNYc2Vzdllvb2Q3NUtsZFVvc2xZZ0dGU2xXTWNEWGc2THFwVEgrcHZB?=
 =?utf-8?B?V2dOcHJ5SjArUHZ5clJSTDAvYXU2OGZSSEdNYjVZNE9MR01ZalhWYzBGWGQ3?=
 =?utf-8?B?T3B1Z3J6NGxBeXdPSitqTXo4RDlqT3h1TENzNGpXUklPTFFJMFpsQk9LTHNK?=
 =?utf-8?B?T1c4YW90Zk85VC96Y0ppVTZ6T2ZENmJKQTNFcjVxQWVuWG9FelRIRm5zcXJq?=
 =?utf-8?B?bjBZTGJTTnc2am1sd1N6Y3ExYzRBMzVyNWlpbE9semU4SFRwRkx3YnVoRlJZ?=
 =?utf-8?B?VmxsQ2pJeEZXdk5GNmczN3lkOGNXcDR6Z01GSjFoVkhrUitNTjgxZE1aU1V0?=
 =?utf-8?B?V29Md2IvZFcrQ3NYdWZXdmxsWldGMVdSYkxPUWkveUk4VGJ2MVhYR2FkbTI2?=
 =?utf-8?B?T3Z2c1E5aHVnZHJRaGkrLzFMQklQK3ZRQzFGS0dGVWdhTHZ6Sll6STBNM1Zn?=
 =?utf-8?B?MlBLdTBsT0RGL3IxWEdGM0EwNjFDNHY4RzhhMDBHWkxjdkJrMEgrWHNjeHVt?=
 =?utf-8?B?clNuRkZyTVdSSnFGY0YvWi8zU3dweExDVTBWVy82djZlQ3dwdFFVZ0JneWFo?=
 =?utf-8?B?Y0VFK3ErUk9KTSt6ZG1yK2RYQStiMjUwaFZ1V1RIQTdidkRGSGlXeEtielQv?=
 =?utf-8?B?ckRVOWlPNkhybXZNcC9YVzcxbGFld2lxblNJWkhQNDZaMEtzNmZSdHo2QnZN?=
 =?utf-8?B?NVU0TWxnYmdmMTZGZ2FHM0FkZlBiaENtS3BPWG5pdlVXRW8xdVpRWUhDTkNR?=
 =?utf-8?B?anZDTkRUekp1VFR6UnQxbjNOY25maGFYd2s5Zy9kMENKWGIvcG5HbUJiZWUw?=
 =?utf-8?B?V085VXczSVdZMVZhQ05Ydk5ZRUE3bS9TZ3VaVGNtNE1OVzllY3BMc001YUEr?=
 =?utf-8?B?SXJ4YWZ3UHNieFFzM2dyVnlnM050bFZsQ0lwSWRzcmJlQUMxSDVVNUxNVVUx?=
 =?utf-8?B?c0szaWlSUTNjWkY3MnE3NENpdFNqcmxqNis1K2Q1bjN6NGs0VlZ5ajZxU0VR?=
 =?utf-8?B?NGt3am9lOGZva00vYlNPbWNKb3Zha2x3ZHZnRWhkZDJvWXYzbTdXdzJWOUNo?=
 =?utf-8?B?Q2RDczhXblZ3U1hxUDZmemdOT2QyM1ZPOXdRRUtLSWxHeEl5cjBVdVlwRERi?=
 =?utf-8?B?YnRXNE4rc2p3bjNoL2JHaWFwU1NYUjdiNmxONWhWbXliU0ZHKzVSOE1jYjln?=
 =?utf-8?B?VEx6blZuWDA2U2poSjJtMXI3ZWFXdGQ4U0ZheDRMZmNrY0lRVWFVOHdDNDho?=
 =?utf-8?B?eVpKc0plbEY2c2FjcWE2cEhIaTk1bkx3QU5ycnlhbnh0OHN5Sk5VbEdweitY?=
 =?utf-8?B?dUdqdm9nSyt1YUhBeVVnN0NlMVE4Y05ZT0tTVjBkSjM5Tm5EZG9yblBIUzM2?=
 =?utf-8?B?ejJVamg2bXdNWitMc3hHZFZEdjdPWHBpRU0rTnhqSllWaVlZMjU2d3NLVWlk?=
 =?utf-8?B?UHo1R3MrZTdteE5sK042aldabndFeHExU2hxOTVDVnR0RDdvZ3p4NXlWY2R6?=
 =?utf-8?B?ZGd2Z05vS0NLcDlVVlBvS1BtL204QXVRNDdCMEFSai9EK2pNTnVFaldFUGVP?=
 =?utf-8?B?K3pZSjVtbTFpZ2twY1BicGV5cjkrZEg3UlNYR0lPQmUvZnprT3ltNDY2dnA3?=
 =?utf-8?B?RE52QTUrL2pQV1pyK3VOTEJnUmZXcFdwbnN3YXIwK2w3aFJlSGF1SzJ6WGxM?=
 =?utf-8?B?SGN4UXluWVIzZGd6d3gwWmZXVlI2aml3OFQ3ajE2VFllNmU0cTBzSVBhK1VN?=
 =?utf-8?B?VmpNUlk0OVNMc2VFZE9MajV3c2Rhb3RpcVgwdkJueGFDTk42dkRIaG9LYis5?=
 =?utf-8?Q?sbGA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3139.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6962b983-1238-481a-9271-08db8667b66b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2023 01:47:00.3263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gesFS+aomEFQAylxGSS40GzSyjARt6BDTcWPClxAI2kcrvBnErjxAN1A7qrHE46uFQ0oBFsyc3QDk3plbIgtyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8718
X-Mailman-Approved-At: Mon, 17 Jul 2023 12:07:42 +1000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-wpan@vger.kernel.org" <linux-wpan@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>, "wcn36xx@lists.infradead.org" <wcn36xx@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>, "linux-oxnas@groups.io" <linux-
 oxnas@groups.io>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPg0KPiBTZW50OiAyMDIz5bm0N+aciDE15pelIDE6NDgNCj4gVG86IERhcmlvIEJp
bmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT47IFdvbGZnYW5nDQo+
IEdyYW5kZWdnZXIgPHdnQGdyYW5kZWdnZXIuY29tPjsgTWFyYyBLbGVpbmUtQnVkZGUNCj4gPG1r
bEBwZW5ndXRyb25peC5kZT47IERhdmlkIFMuIE1pbGxlciA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD47
IEVyaWMNCj4gRHVtYXpldCA8ZWR1bWF6ZXRAZ29vZ2xlLmNvbT47IEpha3ViIEtpY2luc2tpIDxr
dWJhQGtlcm5lbC5vcmc+OyBQYW9sbw0KPiBBYmVuaSA8cGFiZW5pQHJlZGhhdC5jb20+OyBDaGFu
ZHJhc2VrYXIgUmFtYWtyaXNobmFuDQo+IDxyY3Nla2FyQHNhbXN1bmcuY29tPjsgQ2hlbi1ZdSBU
c2FpIDx3ZW5zQGNzaWUub3JnPjsgSmVybmVqIFNrcmFiZWMNCj4gPGplcm5lai5za3JhYmVjQGdt
YWlsLmNvbT47IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWxAc2hvbGxhbmQub3JnPjsgRmxvcmlhbg0K
PiBGYWluZWxsaSA8Zmxvcmlhbi5mYWluZWxsaUBicm9hZGNvbS5jb20+OyBBbmRyZXcgTHVubiA8
YW5kcmV3QGx1bm4uY2g+Ow0KPiBWbGFkaW1pciBPbHRlYW4gPG9sdGVhbnZAZ21haWwuY29tPjsg
S3VydCBLYW56ZW5iYWNoIDxrdXJ0QGxpbnV0cm9uaXguZGU+Ow0KPiBXb29qdW5nIEh1aCA8d29v
anVuZy5odWhAbWljcm9jaGlwLmNvbT47DQo+IFVOR0xpbnV4RHJpdmVyQG1pY3JvY2hpcC5jb207
IEFyxLFuw6cgw5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT47DQo+IERhbmllbCBHb2xsZSA8
ZGFuaWVsQG1ha3JvdG9waWEub3JnPjsgTGFuZGVuIENoYW8NCj4gPExhbmRlbi5DaGFvQG1lZGlh
dGVrLmNvbT47IERFTkcgUWluZ2ZhbmcgPGRxZmV4dEBnbWFpbC5jb20+OyBTZWFuDQo+IFdhbmcg
PHNlYW4ud2FuZ0BtZWRpYXRlay5jb20+OyBNYXR0aGlhcyBCcnVnZ2VyDQo+IDxtYXR0aGlhcy5i
Z2dAZ21haWwuY29tPjsgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8NCj4gPGFuZ2Vsb2dpb2Fj
Y2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT47IENsYXVkaXUgTWFub2lsDQo+IDxjbGF1ZGl1
Lm1hbm9pbEBueHAuY29tPjsgQWxleGFuZHJlIEJlbGxvbmkNCj4gPGFsZXhhbmRyZS5iZWxsb25p
QGJvb3RsaW4uY29tPjsgTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPjsN
Cj4gQWx2aW4gxaBpcHJhZ2EgPGFsc2lAYmFuZy1vbHVmc2VuLmRrPjsgR2VvcmdlIE1jQ29sbGlz
dGVyDQo+IDxnZW9yZ2UubWNjb2xsaXN0ZXJAZ21haWwuY29tPjsgQW5kcmVhcyBMYXJzc29uIDxh
bmRyZWFzQGdhaXNsZXIuY29tPjsNCj4gSXlhcHBhbiBTdWJyYW1hbmlhbiA8aXlhcHBhbkBvcy5h
bXBlcmVjb21wdXRpbmcuY29tPjsgS2V5dXIgQ2h1ZGdhcg0KPiA8a2V5dXJAb3MuYW1wZXJlY29t
cHV0aW5nLmNvbT47IENocmlzIFNub29rIDxjaHJpcy5zbm9va0BnbWFpbC5jb20+Ow0KPiBOaWNv
bGFzIEZlcnJlIDxuaWNvbGFzLmZlcnJlQG1pY3JvY2hpcC5jb20+OyBDbGF1ZGl1IEJlem5lYQ0K
PiA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlwLmNvbT47IE1hZGFsaW4gQnVjdXIgPG1hZGFsaW4u
YnVjdXJAbnhwLmNvbT47DQo+IFdlaSBGYW5nIDx3ZWkuZmFuZ0BueHAuY29tPjsgU2hlbndlaSBX
YW5nIDxzaGVud2VpLndhbmdAbnhwLmNvbT47DQo+IENsYXJrIFdhbmcgPHhpYW9uaW5nLndhbmdA
bnhwLmNvbT47IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+Ow0KPiBTZWFuIEFuZGVy
c29uIDxzZWFuLmFuZGVyc29uQHNlY28uY29tPjsgUGFudGVsaXMgQW50b25pb3UNCj4gPHBhbnRl
bGlzLmFudG9uaW91QGdtYWlsLmNvbT47IExlbyBMaSA8bGVveWFuZy5saUBueHAuY29tPjsgWWlz
ZW4gWmh1YW5nDQo+IDx5aXNlbi56aHVhbmdAaHVhd2VpLmNvbT47IFNhbGlsIE1laHRhIDxzYWxp
bC5tZWh0YUBodWF3ZWkuY29tPjsNCj4gRG91Z2xhcyBNaWxsZXIgPGRvdWdtaWxsQGxpbnV4Lmli
bS5jb20+OyBNYXJjaW4gV29qdGFzDQo+IDxtd0BzZW1paGFsZi5jb20+OyBSdXNzZWxsIEtpbmcg
PGxpbnV4QGFybWxpbnV4Lm9yZy51az47IFRhcmEgcyBDaG9ybnlpDQo+IDx0YXJhcy5jaG9ybnlp
QHBsdmlzaW9uLmV1PjsgTWlya28gTGluZG5lciA8bWxpbmRuZXJAbWFydmVsbC5jb20+Ow0KPiBT
dGVwaGVuIEhlbW1pbmdlciA8c3RlcGhlbkBuZXR3b3JrcGx1bWJlci5vcmc+OyBGZWxpeCBGaWV0
a2F1DQo+IDxuYmRAbmJkLm5hbWU+OyBKb2huIENyaXNwaW4gPGpvaG5AcGhyb3plbi5vcmc+OyBN
YXJrIExlZQ0KPiA8TWFyay1NQy5MZWVAbWVkaWF0ZWsuY29tPjsgTG9yZW56byBCaWFuY29uaSA8
bG9yZW56b0BrZXJuZWwub3JnPjsNCj4gSG9yYXRpdSBWdWx0dXIgPGhvcmF0aXUudnVsdHVyQG1p
Y3JvY2hpcC5jb20+OyBUaW11ciBUYWJpDQo+IDx0aW11ckBrZXJuZWwub3JnPjsgU2VyZ2V5IFNo
dHlseW92IDxzLnNodHlseW92QG9tcC5ydT47IFN0ZXZlIEdsZW5kaW5uaW5nDQo+IDxzdGV2ZS5n
bGVuZGlubmluZ0BzaGF3ZWxsLm5ldD47IEt1bmloaWtvIEhheWFzaGkNCj4gPGhheWFzaGkua3Vu
aWhpa29Ac29jaW9uZXh0LmNvbT47IEdpdXNlcHBlIENhdmFsbGFybw0KPiA8cGVwcGUuY2F2YWxs
YXJvQHN0LmNvbT47IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5j
b20+Ow0KPiBKb3NlIEFicmV1IDxqb2FicmV1QHN5bm9wc3lzLmNvbT47IE1heGltZSBDb3F1ZWxp
bg0KPiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbT47IFNoYXduIEd1byA8c2hhd25ndW9Aa2Vy
bmVsLm9yZz47IFNhc2NoYQ0KPiBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT47IFBlbmd1
dHJvbml4IEtlcm5lbCBUZWFtDQo+IDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+OyBGYWJpbyBFc3Rl
dmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBOZWlsDQo+IEFybXN0cm9uZyA8bmVpbC5hcm1zdHJv
bmdAbGluYXJvLm9yZz47IEtldmluIEhpbG1hbg0KPiA8a2hpbG1hbkBiYXlsaWJyZS5jb20+OyBK
ZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT47IE1hcnRpbg0KPiBCbHVtZW5zdGlu
Z2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+OyBWaW5vZCBLbyB1bA0KPiA8
dmtvdWxAa2VybmVsLm9yZz47IEJodXBlc2ggU2hhcm1hIDxiaHVwZXNoLnNoYXJtYUBsaW5hcm8u
b3JnPjsgRW1pbA0KPiBSZW5uZXIgQmVydGhpbmcgPGtlcm5lbEBlc21pbC5kaz47IFNhbWluIEd1
bw0KPiA8c2FtaW4uZ3VvQHN0YXJmaXZldGVjaC5jb20+OyBUaGllcnJ5IFJlZGluZyA8dGhpZXJy
eS5yZWRpbmdAZ21haWwuY29tPjsNCj4gSm9uYXRoYW4gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlh
LmNvbT47IE5vYnVoaXJvIEl3YW1hdHN1DQo+IDxub2J1aGlybzEuaXdhbWF0c3VAdG9zaGliYS5j
by5qcD47IEdyeWdvcmlpIFN0cmFzaGtvDQo+IDxncnlnb3JpaS5zdHJhc2hrb0B0aS5jb20+OyBL
ZXZpbiBCcmFjZQ0KPiA8a2V2aW5icmFjZUBicmFjZWNvbXB1dGVybGFiLmNvbT47IEZyYW5jb2lz
IFJvbWlldQ0KPiA8cm9taWV1QGZyLnpvcmVpbC5jb20+OyBNaWNoYWwgU2ltZWsgPG1pY2hhbC5z
aW1la0BhbWQuY29tPjsgUmFkaGV5DQo+IFNoeWFtIFBhbmRleSA8cmFkaGV5LnNoeWFtLnBhbmRl
eUBhbWQuY29tPjsgQWxleGFuZGVyIEFyaW5nDQo+IDxhbGV4LmFyaW5nQGdtYWlsLmNvbT47IFN0
ZWZhbiBTY2htaWR0IDxzdGVmYW5AZGF0ZW5mcmVpaGFmZW4ub3JnPjsNCj4gTWlxdWVsIFJheW5h
bCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT47IEFsZXggRWxkZXIgPGVsZGVyQGtlcm5lbC5v
cmc+Ow0KPiBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+OyBIZWlu
ZXIgS2FsbHdlaXQNCj4gPGhrYWxsd2VpdDFAZ21haWwuY29tPjsgU2t5TGFrZSBIdWFuZyA8U2t5
TGFrZS5IdWFuZ0BtZWRpYXRlay5jb20+Ow0KPiBLYWxsZSBWYWxvIDxrdmFsb0BrZXJuZWwub3Jn
PjsgTG9pYyBQb3VsYWluIDxsb2ljLnBvdWxhaW5AbGluYXJvLm9yZz47IFJ5ZGVyDQo+IExlZSA8
cnlkZXIubGVlQG1lZGlhdGVrLmNvbT47IFNoYXluZSBDaGVuIDxzaGF5bmUuY2hlbkBtZWRpYXRl
ay5jb20+Ow0KPiBKw6lyw7RtZSBQb3VpbGxlIHIgPGplcm9tZS5wb3VpbGxlckBzaWxhYnMuY29t
PjsgUmljaGFyZCBDb2NocmFuDQo+IDxyaWNoYXJkY29jaHJhbkBnbWFpbC5jb20+DQo+IENjOiBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtY2FuQHZnZXIua2VybmVsLm9yZzsNCj4g
bmV0ZGV2QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4g
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC1zdW54aUBsaXN0cy5s
aW51eC5kZXY7DQo+IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4cHBj
LWRldkBsaXN0cy5vemxhYnMub3JnOw0KPiBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5v
cmc7DQo+IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb207DQo+IGxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgtb3huYXNAZ3JvdXBzLmlvOw0KPiBs
aW51eC10ZWdyYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LW9tYXBAdmdlci5rZXJuZWwub3JnOw0K
PiBsaW51eC13cGFuQHZnZXIua2VybmVsLm9yZzsgYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmc7
DQo+IGxpbnV4LXdpcmVsZXNzQHZnZXIua2VybmVsLm9yZzsgYXRoMTFrQGxpc3RzLmluZnJhZGVh
ZC5vcmc7DQo+IHdjbjM2eHhAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBbUEFUQ0hd
IG5ldDogRXhwbGljaXRseSBpbmNsdWRlIGNvcnJlY3QgRFQgaW5jbHVkZXMNCj4gDQo+IFRoZSBE
VCBvZl9kZXZpY2UuaCBhbmQgb2ZfcGxhdGZvcm0uaCBkYXRlIGJhY2sgdG8gdGhlIHNlcGFyYXRl
DQo+IG9mX3BsYXRmb3JtX2J1c190eXBlIGJlZm9yZSBpdCBhcyBtZXJnZWQgaW50byB0aGUgcmVn
dWxhciBwbGF0Zm9ybSBidXMuDQo+IEFzIHBhcnQgb2YgdGhhdCBtZXJnZSBwcmVwcGluZyBBcm0g
RFQgc3VwcG9ydCAxMyB5ZWFycyBhZ28sIHRoZXkNCj4gInRlbXBvcmFyaWx5IiBpbmNsdWRlIGVh
Y2ggb3RoZXIuIFRoZXkgYWxzbyBpbmNsdWRlIHBsYXRmb3JtX2RldmljZS5oIGFuZCBvZi5oLg0K
PiBBcyBhIHJlc3VsdCwgdGhlcmUncyBhIHByZXR0eSBtdWNoIHJhbmRvbSBtaXggb2YgdGhvc2Ug
aW5jbHVkZSBmaWxlcyB1c2VkDQo+IHRocm91Z2hvdXQgdGhlIHRyZWUuIEluIG9yZGVyIHRvIGRl
dGFuZ2xlIHRoZXNlIGhlYWRlcnMgYW5kIHJlcGxhY2UgdGhlDQo+IGltcGxpY2l0IGluY2x1ZGVz
IHdpdGggc3RydWN0IGRlY2xhcmF0aW9ucywgdXNlcnMgbmVlZCB0byBleHBsaWNpdGx5IGluY2x1
ZGUgdGhlDQo+IGNvcnJlY3QgaW5jbHVkZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiAtLS0NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0
L2V0aGVybmV0L2ZyZWVzY2FsZS9mZWNfcHRwLmMNCj4gYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9m
cmVlc2NhbGUvZmVjX3B0cC5jDQo+IGluZGV4IGFiODZiYjg1NjJlZi4uOTQyOGEwNmI2YTg3IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9mcmVlc2NhbGUvZmVjX3B0cC5jDQo+
ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2ZyZWVzY2FsZS9mZWNfcHRwLmMNCj4gQEAgLTMw
LDcgKzMwLDYgQEANCj4gICNpbmNsdWRlIDxsaW51eC9waHkuaD4NCj4gICNpbmNsdWRlIDxsaW51
eC9mZWMuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiAtI2luY2x1ZGUgPGxpbnV4L29m
X2RldmljZS5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L29mX2dwaW8uaD4NCj4gICNpbmNsdWRlIDxs
aW51eC9vZl9uZXQuaD4NCj4gDQpUaGFua3MhDQpSZXZpZXdlZC1ieTogV2VpIEZhbmcgPHdlaS5m
YW5nQG54cC5jb20+DQoNCg==
