Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA2B563CB8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 01:18:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZWMp6gjYz3dpm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 09:18:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axentia.se header.i=@axentia.se header.a=rsa-sha256 header.s=selector2 header.b=A+2TT0uR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=axentia.se (client-ip=40.107.21.119; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=peda@axentia.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=axentia.se header.i=@axentia.se header.a=rsa-sha256 header.s=selector2 header.b=A+2TT0uR;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2119.outbound.protection.outlook.com [40.107.21.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZNkj17wlz3bpb
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jul 2022 04:19:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5xaZNS9YkQAA4IRbpfFSdJ7ihM1u6gpHb9gUle52f4uYsNnBl2Y1HC7C+Gwv1+gOkzgt+SrM1go65jeeGlPuxZ+oSUGYHxk6VURQWBJyVb2Ghx+bK9jsBb4OyqEPMk7285/IeB44OPDJ8nAVIhte8Gcet8ziAXk2HbfNnJhW6mK5gkONb19nv44g5MpRRQi4yI/QJlm4HJttBZRzT2/efbIzP8ZK7bnfGfD2BJqYRJBfiubi40oVqHzeQntXlbqgXdnS+U7pEuXsPnfZ6asWfwgHl4rw0p3hC1Rv0/CXAkVgbhQtq2WbDzJg9Mj9VsuLRaRRsHlEpZkc2B9gTdIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9xpzPqVYAgwPLCnJG7IfZSJEh9UMzLzMOjw4DnB994=;
 b=GOwfaoBzhhzjoX6z0r2dQLynJ4LDMPPaXEbZr0b2sfqDh6/H0xjQIVJP2Wp1ByngqIFANVAWAYrU+8GquJBDhmqNSJPXP+AAm+gNHN2X33Qq4cBvhaqtUaj6fTjY64bNnamyDPiBzTdaBldwyah6vdaCmnFz0gWXF7UXf4WF4v+c1kLo/NMMV12Fe3KIPr0Dhssgsc7JkmHCGFXKruUgTjNjQ2t3GYdcmOv26HsJCreUp2N3dg2BH4bdLvDVwOKLMi80lEnAymPWV4WXgn3PYSJz2zjPjIL0dWAQPPZgyxM7mslDlP84dSrsHqLY8kgsKmgwnWaNBHgF5ygt8+kDeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9xpzPqVYAgwPLCnJG7IfZSJEh9UMzLzMOjw4DnB994=;
 b=A+2TT0uR5CJU8xlX302W7U5F48QbULEo+YsrOweRzsfR0ZRSL0OsRiJeYSTUbeL9lCYPSXdocrnPCCRSzHRSKt0GAFuuK7qU9EsuTTfH7l3cXnMqT1biKLFO1ZmPDeZBzfCh2w1CXdhQnyhD6kOMc9Wm3azv5yTQCTyMQZqhGy4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AM7PR02MB6484.eurprd02.prod.outlook.com (2603:10a6:20b:1b1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Fri, 1 Jul
 2022 18:18:46 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::11f2:df70:b231:2b45]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::11f2:df70:b231:2b45%4]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 18:18:46 +0000
Message-ID: <23b70c51-4bd7-84f9-e72c-ba6547eedf7d@axentia.se>
Date: Fri, 1 Jul 2022 20:18:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Wolfram Sang <wsa@kernel.org>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV3P280CA0069.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::30) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35b97d70-9d53-435a-bdda-08da5b8e22b6
X-MS-TrafficTypeDiagnostic: AM7PR02MB6484:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	vzChXohioRsHMfghJ5DgMO1CzBWBEheYRx7EtN0uNy9oOHWXqIk0jDSm9a5jy6/z7EHDKaikwrcKQY92OExj1jew9G991gwN8YUn7QKOQosVGv3Z6CJOsWZ+c30sDCljKLMIiJvgiDSoQKT+8JMuDWCPfFO3YmELn33KHn0OrSjiYC3ot39ejoiYmeGTqv54qpaoRXu+jpPjgNagufDxiT/B7AXF5HaimcBdY/FDoukGbZcNJOQqGv/EuxOe+OYjvjVL4/SbLTasuOdiQrYtXmijyp6x3DizUWKLPQSVVcyzzthRilHeDhat8Lwu2isx4HYmAK6buRwpD8+JQbNzlhuByD/RaaL85bxr93FaKdywfidBucgKS/GCX9i6D69Xt5n5v40Yfndm3W2Yej/+dOnOJtalv9yagNACQ8998v9ZfKcRh0D+br1uRMRH6TPCgKwvAaT8dpWCaJhfxhgzlBDywh+GHHqztfFaLVSvBdsZaoGi4GzhfjMNdal6ncuR4PEARpk1ey0OhNAqQHnhL2YzbISzuJWoOv+iExDoYP3j2AOZoMGiPGzCTGbd+Atreod9SRVCbZv/4suBGv+LEP5XrcravOI2sQ/qd21KF0jrHhV9LEsYGDVGwNkSEi29cx3khF9PmqsUVSL01AMa24iQzvOK9+67Plf0BPrwfw7MoeKHubjHYwcdtYMZDzrUsWGlMoccLnVxpaQlbtT1gB5SQ6M4v7r6laeOzyVcJU2rFMKEAhBP3lEyrEsDhHfe2sZXL3R14Bv94Evh4fr4nsbnZIyvwYmOsx3kEjVNVgQdk1XPlSo7u9A96QehSVTwxwWYRUXTWiW+fXyt9utdJA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39830400003)(396003)(366004)(346002)(136003)(376002)(7416002)(7366002)(2616005)(7336002)(7276002)(7406005)(8936002)(86362001)(478600001)(5660300002)(6506007)(6666004)(4744005)(6512007)(41300700001)(2906002)(26005)(38100700002)(31696002)(83380400001)(186003)(31686004)(110136005)(316002)(36756003)(6486002)(76576003)(66556008)(8676002)(88732003)(66946007)(4326008)(54906003)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bjVtdjdXeHdlMUZNZGR2Z2lTeHRadllpMEQ5SHo1ZGFHSlI3OW96YnZDOUlL?=
 =?utf-8?B?S3lMZW1JeTFVQ3dsTDUraHd6U2krQUNOWVpob0hvcVNvN0FZZkpId2RWUFZh?=
 =?utf-8?B?c2oxZ0wzcGxQRy9RTlhLTmc4VElDWXZTUkJTWFNDNWdBMHFWUUpVcEZSK2JF?=
 =?utf-8?B?Z2NtSFZRZGt0ZGwwVXQ5WlREem5oamRUUzU0Z29OOHQ3Sk5mOUI4S0ZONEJT?=
 =?utf-8?B?TjZ0TjBjcDJVNW1sMHowSko2RkFLZklzNUlVUVFJVkFoZFVodDVlcWZYWThJ?=
 =?utf-8?B?WUMvVzNJa2F4OFN4dTAwT1BGY3dWOXVPQjB0WDBmU3BXWDdVNzhtTG5wZFJG?=
 =?utf-8?B?S2xUZ2hlWFRVS1NjaDVLUm9TamFoQXV5WW5hcjBjamtPOVJSM3NINGtvMmpN?=
 =?utf-8?B?Vjg4eFdDU0VGWXA2R2plbDlJT1BxeHBYVDI0Yk9uNmFrMk5pWGROUEk5OHd4?=
 =?utf-8?B?RDB2S01xY1lxUUhML3dWeWF4YVBhT3lTRmN6emkyVmFYRW9mWmptQjJqNlBW?=
 =?utf-8?B?VjhmeHF5ZVloVjI5REpiakY5Mi9zVU1qZU8yTzlKTGltbWpNbFZNSnhNWmZQ?=
 =?utf-8?B?dEVja2ROUmxxVjhoUWJNai9ZMDNjY3NSYmF2SXFCZUNNcHJZWiszTmM3TUhj?=
 =?utf-8?B?YTN0MXFBcldYN0F1eGVzSkJpNDBPVTNLTTNKOGZ3NldnVmo1VXdsNGV5RVVN?=
 =?utf-8?B?ayt2L2dtYlAwUDVvRk9aak1ScmVTY01EK01jRWlBSUtUeEdQWFl1L29jUnlp?=
 =?utf-8?B?c2xNSFhlZU1FTHhaYVp2dXN4QXU3bU5YczBHdVZSbFFVakxZNmp5VHBMTXlu?=
 =?utf-8?B?Wk40VXBETkJ2bVpzV2ZGTitBL0tyUFcyVmFNZGhuak40S0ZlZkxpV1VwQkUx?=
 =?utf-8?B?ZlE4OHNWTlQzc2hxL3Z5Q0ZoTGQyZ0V6dUE2RnF3VzhnSkd1eHFlNWx4R25m?=
 =?utf-8?B?VmRWMzVHbFpBR0FmZk9tbWNmWEVRdXZVb3lxWFdvSTVFTUQ4RllGQmo0UVNI?=
 =?utf-8?B?UmVIcGpWMFM2QzZnWEU4TTZEVG1qVE1oVmRrcStsK2JWTytvRjJ6UU9CZ0w2?=
 =?utf-8?B?Z05ZdEhGZU1kREIwQSttcUlFY2M2OVJhaXM5L0ErNi85SG5QSFJtbTNTVTly?=
 =?utf-8?B?RldPSXdUbjZPVXNGa01xTUhpdGV0OWFGN3oyQnMrcGE3RFVYRGRPWWtVQWhT?=
 =?utf-8?B?UFVCSzJJa2ZTTllKR21wb1R6WkRzdSt4dkRjZ0tIZnpXaUIvOHZvbE0wWlVr?=
 =?utf-8?B?NS9wZmxuZzZBZC9zeUhWd0VLVXI3K2VyV3lIOWNUUXlkdm81YUNCY0ZPZFVJ?=
 =?utf-8?B?T1gxVThnREZBcU5ZTUJaRnNEd0FzVGhvWTZaLzRkNnRJR3FxQTE2UU5kcTJa?=
 =?utf-8?B?YktXS1g1Z2VqVEVRYnJRM2lvcFNIY0NjS3JsOWRTMDlzZGMxa0pKcXRYWmU3?=
 =?utf-8?B?VDVrWUFYRVRIN0NUTjRLTEtPU0cyN3dvbFV0amFBTWtQV0hOTklCb2U4aWFp?=
 =?utf-8?B?TEI3ckt2akdiajRUdEp1eGZ3SkZYVDB6YjVUZWV4MHJKYmx3bVFPS1VlTzBH?=
 =?utf-8?B?bUE3QlVCL2hMTlhENU5KR1J5N0crUHVvcWJDMlRnNUV5T3NSLzRXU3E0YXJR?=
 =?utf-8?B?ZStWbnI5RTYzUE5kd3VCMzEweGlCV0hEN1VocUhJbkRab3lWODl0S1QzOUxj?=
 =?utf-8?B?bGVsWWl1djk4a21SL09TRnd4WDQrK1B4WnpNcm94ZXVkOEFjK2wwSkNsd2JV?=
 =?utf-8?B?VTkvVlV1amV0QjhwNlEwUVRxL3lGR0xzQmRDb2ZhcUw5eWEzU2RCRmRZa3Er?=
 =?utf-8?B?c0diOC9pdTR3V0ExL1hpWS9CUG44R2RQci93UUNDUG5BMDVvSkowZkV6ZlE4?=
 =?utf-8?B?VHNCYTZMSjhtVk9pemFINHU4dURrNGlLbjY1Z3g5b1R6aElCMkRvdTFTdnFl?=
 =?utf-8?B?RnJqMUNJYURHeGU2RnhlV014ODl2dTYrS2lPR21qMmhaZWU3UG5KQ3ZUeXJt?=
 =?utf-8?B?TDhmY0dFeHpTNnp1TjcybHpzR1JSczFhQVpuQTRJNUFnL2RmNi9NTDhHN2FU?=
 =?utf-8?B?dDBhUGcxQS9JTVpZQ2cyR05WdGR2bGtGeTZOR0poVmtVSDg3KzRsZXU5end5?=
 =?utf-8?Q?PS8vfUp9/wumobatJ4oqkDV4f?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b97d70-9d53-435a-bdda-08da5b8e22b6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 18:18:45.9418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nFh0/44uvyj3javqv3b8IjXK7y15J32AjB08PgER4p7+h3bXau7gVVrkFFI7qx3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6484
X-Mailman-Approved-At: Sat, 02 Jul 2022 09:16:22 +1000
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
 tti Palosaari <crope@iki.fi>, Wenyou Yang <wenyou.yang@microchip.com>, Dongchun Zhu <dongchun.zhu@mediatek.com>, Miaoqian Lin <linmq006@gmail.com>, Steve Longerbeam <slongerbeam@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>, Shunqian Zheng <zhengsq@rock-chips.com>, lijian <lijian@yulong.com>, Dan Carpenter <dan.carpenter@oracle.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Viorel Suman <viorel.suman@nxp.com>, Petr Machata <petrm@nvidia.com>, =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>, Jean Delvare <jdelvare@suse.com>, linux-serial@vger.kernel.org, linux-pm@vger.kernel.org, Eddie James <eajames@linux.ibm.com>, Riku Voipio <riku.voipio@iki.fi>, James Schulman <james.schulman@cirrus.com>, Scott Wood <oss@buserror.net>, Cai Huoqing <cai.huoqing@linux.dev>, Jonas Malaco <jonas@protocubo.io>, Hsin-Yi Wang <hsinyi@chromium.org>, Haibo Chen <haibo.chen@nxp.com>, Petr Cvek <petrcvekcz@gmail.com>, linux-leds@vger.kernel.org, Joe Tessler <jrt@google.com>, Andrey Konovalov <
 andreyknvl@gmail.com>, Andy Shevchenko <andy@kernel.o

rg>, Robert Jones <rjones@gateworks.com>, George Joseph <george.joseph@fairview5.com>, Vincent Knecht <vincent.knecht@mailoo.org>, Robin van der Gracht <robin@protonic.nl>, Randy Dunlap <rdunlap@infradead.org>, linux-stm32@st-md-mailman.stormreply.com, Michael Tretter <m.tretter@pengutronix.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Phong LE <ple@baylibre.com>, Daniel Beer <daniel.beer@igorinstitute.com>, Krzysztof Opasiak <k.opasiak@samsung.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Heungjun Kim <riverful.kim@samsung.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, David Lin <CTLIN0@nuvoton.com>, Vladimir Oltean <olteanv@gmail.com>, David Rhodes <david.rhodes@cirrus.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Dan Robertson <dan@dlrobertson.com>, Martyn Welch <martyn.welch@collab
 ora.co.uk>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, Jon Nettleton <jon.nettleton@gmail.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Marco Felsch <m.felsch@pengutronix.de>, Wim Van Sebroeck <wim@linux-watchdog.org>, Sebastian Reichel <sre@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org, Martiros Shakhzadyan <vrzh@vrzh.net>, Guenter Roeck <groeck@chromium.org>, Matthias Schwarzott <zzam@gentoo.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Eric Dumazet <edumazet@google.com>, =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>, Saranya Gopal <saranya.gopal@intel.com>, Lars-Peter Clausen <lars@metafoo.de>, Corey Minyard <minyard@acm.org>, Evgeny Novikov <novikov@ispras.ru>, Frank Rowand <frowand.list@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Manivannan Sadhasivam <mani@kernel.org>, Pierre-Lo
 uis Bossart <pierre-louis.bossart@linux.intel.com>, M
inghao Chi <chi.minghao@zte.com.cn>, linux-clk@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Charles Gorand <charles.gorand@effinnov.com>, Jagan Teki <jagan@amarulasolutions.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Miguel Ojeda <ojeda@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Martin Donnelly <martin.donnelly@ge.com>, Woojung Huh <woojung.huh@microchip.com>, Rudolf Marek <r.marek@assembler.cz>, Charles Keepax <ckeepax@opensource.cirrus.com>, linux-watchdog@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>, Ido Schimmel <idosch@nvidia.com>, acpi4asus-user@lists.sourceforge.net, Simon Trimmer <simont@opensource.cirrus.com>, Ricard Wanderlof <ricardw@axis.com>, Rikard Falkeborn <rikard.falkeborn@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, Jiri Valek - 2N <valek@2n.cz>, linux-rpi-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, Wayne 
 Chang <waynec@nvidia.com>, Chen-Yu Tsai <wens@csie.org>, Sing-Han Chen <singhanc@nvidia.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Hans de Goede <hdegoede@redhat.com>, Stephen Boyd <sboyd@kernel.org>, Maslov Dmitry <maslovdmitry@seeed.cc>, linux-gpio@vger.kernel.org, Jens Frederich <jfrederich@gmail.com>, Douglas Anderson <dianders@chromium.org>, linux-media@vger.kernel.org, UNGLinuxDriver@microchip.com, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Jarkko Sakkinen <jarkko@kernel.org>, linux-usb@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, CGEL ZTE <cgel.zte@gmail.com>, Colin Leroy <colin@colino.net>, platform-driver-x86@vger.kernel.org, linux-integrity@vger.kernel.org, Kevin Tsai <ktsai@capellamicro.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Daniel Palmer <da
 niel@0x0f.com>, Arec Kao <arec.kao@intel.com>, Crt Mo
ri <cmo@melexis.com>, Jose Cazarin <joseespiriki@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org, Tom Rix <trix@redhat.com>, Michael Turquette <mturquette@baylibre.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>, Jan-Simon Moeller <jansimon.moeller@gmx.de>, Wei Yongjun <weiyongjun1@huawei.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Nikita Travkin <nikita@trvn.ru>, Jeremy Kerr <jk@codeconstruct.com.au>, Jasmin Jessich <jasmin@anw.at>, Sam Ravnborg <sam@ravnborg.org>, Kevin Cernekee <cernekee@chromium.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-rtc@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Lucas Tanure <tanureal@opensource.cirrus.com>, Stefan Mavrodiev <stefan@olimex.com>, Masahiro Yamada <masahiroy@kernel.org>, Sylvain Petinot <s
 ylvain.petinot@foss.st.com>, netdev@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Xin Ji <xji@analogixsemi.com>, Seven Lee <wtli@nuvoton.com>, Matt Ranostay <matt.ranostay@konsulko.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Adrien Grassein <adrien.grassein@gmail.com>, Yang Yingliang <yangyingliang@huawei.com>, chrome-platform@lists.linux.dev, Mats Randgaard <matrandg@cisco.com>, Paolo Abeni <pabeni@redhat.com>, Alexey Dobriyan <adobriyan@gmail.com>, Joel Stanley <joel@jms.id.au>, linux-input@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Lyude Paul <lyude@redhat.com>, Kees Cook <keescook@chromium.org>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>, Jonas Karlman <jonas@kwiboo.se>, Yang Li <yang.lee@linux.alibaba.com>, Tim Harvey <tharvey@gateworks.com>, Jiri Kosina <jikos@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, Mark Gross <markgross@kernel.org>, Richard F
 itzgerald <rf@opensource.cirrus.com>, Mark Brown <bro
onie@kernel.org>, wengjianfeng <wengjianfeng@yulong.com>, Maxime Ripard <maxime@cerno.tech>, Sven Peter <sven@svenpeter.dev>, Martin Kepplinger <martink@posteo.de>, openipmi-developer@lists.sourceforge.net, Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>, "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-hwmon@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Support Opensource <support.opensource@diasemi.com>, Alexandru Ardelean <ardeleanalex@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Marc Hulsman <m.hulsman@tudelft.nl>, Corentin Chary <corentin.chary@gmail.com>, Stephen Kitt <steve@sk2.org>, Daniel Scally <djrscally@gmail.com>, linux-fbdev@vger.kernel.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Kirill Shilimanov <kirill.shilimanov@huawei.com>, Sakari Ailus <sakari.ailus@l
 inux.intel.com>, patches@opensource.cirrus.com, Zheng Yongjun <zhengyongjun3@huawei.com>, Alejandro Tafalla <atafalla@dnyon.com>, "David S. Miller" <davem@davemloft.net>, Arnaud Ferraris <arnaud.ferraris@collabora.com>, Hector Martin <marcan@marcan.st>, Vignesh Raghavendra <vigneshr@ti.com>, Nick Dyer <nick@shmanahar.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tony Lindgren <tony@atomide.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Takashi Iwai <tiwai@suse.com>, Paul Cercueil <paul@crapouillou.net>, George McCollister <george.mccollister@gmail.com>, Mac Chiang <mac.chiang@intel.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, Alexander Potapenko <glider@google.com>, linux-staging@lists.linux.dev, Adam Ford <aford173@gmail.com>, Peter Huewe <peterhuewe@gmx.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Lee Jones <lee.jones@linaro.org>, linux-mtd@lists.infradead.org, Alexey Khoroshilov <khoroshilov@ispras.ru>, Marek Vasut <marex@denx.de>, Yizhuo <yzhai003@
 ucr.edu>, alsa-devel@alsa-project.org, Dmitry Rokosov
 <DDRokosov@sberdevices.ru>, Eric Piel <eric.piel@tremplin-utc.net>, Herbert Xu <herbert@gondor.apana.org.au>, Tobias Schrammm <t.schramm@manjaro.org>, Richard Weinberger <richard@nod.at>, Tomasz Duszynski <tduszyns@gmail.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-pwm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Thomas Zimmermann <tzimmermann@suse.de>, Bastien Nocera <hadess@hadess.net>, Jingoo Han <jingoohan1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>, Shawn Tu <shawnx.tu@intel.com>, Leon Luo <leonl@leopardimaging.com>, Yan Lei <yan_lei@dahuatech.com>, Akihiro Tsukada <tskd08@gmail.com>, Tudor Ambarus <tudor.ambarus@microchip.com>, Oliver Graute <oliver.graute@kococonnector.com>, Alistair Francis <alistair@alistair23.me>, Dongliang Mu <mudongliangabcd@gmail.com>, =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>, Eduardo Valentin <edubezval@gmail.com>, Rui Miguel Silva <rmfrf
 s@gmail.com>, Michael Srba <Michael.Srba@seznam.cz>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, kasan-dev@googlegroups.com, "Paul J. Murphy" <paul.j.murphy@intel.com>, Nicola Lunghi <nick83ola@gmail.com>, Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Dmitry Vyukov <dvyukov@google.com>, Ramesh Shanmugasundaram <rashanmu@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Juerg Haefliger <juergh@gmail.com>, Oder Chiou <oder_chiou@realtek.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Robert Foss <robert.foss@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Alvin_=c5=a0ipraga?= <alsi@bang-olufsen.dk>, Luca Ceresoli <luca@lucaceresoli.net>, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, Colin Ian King <colin.king@in
 tel.com>, Maximilian Luz <luzmaximilian@gmail.com>, H
elge Deller <deller@gmx.de>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

2022-06-28 at 16:03, Uwe Kleine-König wrote:
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
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

For drivers I'm involved in, namely:

>  drivers/i2c/muxes/i2c-mux-ltc4306.c                       | 4 +---
>  drivers/i2c/muxes/i2c-mux-pca9541.c                       | 3 +--
>  drivers/i2c/muxes/i2c-mux-pca954x.c                       | 3 +--
>  sound/soc/codecs/max9860.c                                | 3 +--

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
