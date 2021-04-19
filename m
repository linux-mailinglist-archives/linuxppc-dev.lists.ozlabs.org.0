Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D011363E4D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 11:13:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP1M01cD5z3c0L
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 19:13:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=bW4A1J7e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.8.74;
 helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=alice.guo@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=bW4A1J7e;
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80074.outbound.protection.outlook.com [40.107.8.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNycZ2qC0z30GD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 17:09:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iojlI9EyTCguDYESDYdCASD0DnyIPwOUukfAIE9ab7XT051800/jMJmMkPjvysROPJxq+rVCiGj+U/gHuGIqtctjEPY/fPRqpgztLY7v8Lg9aqmyr9TuCHYHJ/Q6YUNxaO0OHIma+gjQiNVLdJTiXoVD631ooL2FHfmcDQEd8Lnget8vKfaHMfMhHuplhuEpEri7NsXadCJBkkFitjbWq9OzAsZw/GWIdlTrcywf015EcF7edwWjp7jL0UvfE64sYGCvh4h6KLU8z0la7D6pvRxju+6ElhSlP0iUkJx64HunmA6XKIJqn49pVzRxasvYgXIZHX7MozGl5aMuOmKKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQ1FZYODrvrpNRuNnaC34Fqlj+M8Uvap82OlKT3GEc0=;
 b=DJAZ8PXN925IHbj6Q3GqdfAkt+8QczFljxdXRR5mKU6K2YHWFk50Ydz3hLOLti1KkiyXJEW5MFo623kSf5IKD60y3FN6pDrOe0S/USc3McxQT+VFwotsSGZTQYKhhlsJu8t0ohgG4jljSMuPCodoXqE67SQmVi0vSXT8aMsZDkgUbVRboIjQDNzkA7ucg25wxzf7YRiC9sutcTz9hrwvA1SXUez8WFEs96bwZP8u0T249WLCS6kCSk09SiMGGifxbJeabU48UnDAggtwrlHXxez+ODxgT3dG4Z5mNSN77wPjpsxeodwL/kLsi7NVKLjfwzC6n3uqLl0bs0HfGDQBeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQ1FZYODrvrpNRuNnaC34Fqlj+M8Uvap82OlKT3GEc0=;
 b=bW4A1J7epeI/1RqVLtafivBpssZGcr+sSFLuXzF9r46LG9eqEYClBgwtWOP+cyaCNh+gVflzfjeigXq/MEjDxHQAjvcckaobAlkUrymxI6OWY28k8P4nIcIc8edJWbR21KE1lZFxQryPC1TC5OmnFVhRpBPl0mS4qmWgcGMtSWo=
Received: from AM6PR04MB6053.eurprd04.prod.outlook.com (2603:10a6:20b:b9::10)
 by AM6PR04MB4408.eurprd04.prod.outlook.com (2603:10a6:20b:26::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Mon, 19 Apr
 2021 07:09:36 +0000
Received: from AM6PR04MB6053.eurprd04.prod.outlook.com
 ([fe80::b034:690:56aa:7b18]) by AM6PR04MB6053.eurprd04.prod.outlook.com
 ([fe80::b034:690:56aa:7b18%4]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 07:09:35 +0000
From: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>
To: Dominique MARTINET <dominique.martinet@atmark-techno.com>, "Alice Guo
 (OSS)" <alice.guo@oss.nxp.com>
Subject: RE: [RFC v1 PATCH 3/3] driver: update all the code that use
 soc_device_match
Thread-Topic: [RFC v1 PATCH 3/3] driver: update all the code that use
 soc_device_match
Thread-Index: AQHXNNSAr/U3xBWFq0aUS8skt1OGlqq7SNGAgAAh55A=
Date: Mon, 19 Apr 2021 07:09:35 +0000
Message-ID: <AM6PR04MB6053B332D2FED8BD42C8642CE2499@AM6PR04MB6053.eurprd04.prod.outlook.com>
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-4-alice.guo@oss.nxp.com>
 <YH0O907dfGY9jQRZ@atmark-techno.com>
In-Reply-To: <YH0O907dfGY9jQRZ@atmark-techno.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: atmark-techno.com; dkim=none (message not signed)
 header.d=none;atmark-techno.com; dmarc=none action=none
 header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a92a2a28-9643-4ff6-c7f0-08d9030216f0
x-ms-traffictypediagnostic: AM6PR04MB4408:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB4408FF910D8CB4BEC016D687A3499@AM6PR04MB4408.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i5WhWlscsgPCprtAn7DRsIg6lchW+YpyzRqdEB49fTRes2Rv9wShq1HCTsiDVdDeSvoYkH+NKiNAj77ZhpK5aCnYsTwylKGzgUuXtOL3j6R7poCCqI/FYicIUrI/3b2zGp/qf38mBASevm/h89+jsry+Z2GY1QHTnPcnhGBT71SHJ4UjO4t1pFDAzlvUSmLD3xVyGDpgFeVHJhMA6ZoWf17YSZOKjiB+uTdtFonujdrnMRCLqSW/hBv+H+FZeG6YRU3nDpp9IUc1eiEEMOa4TfqPbn6X8p1+uUrlySesRdCdNXrMQOAH4qw2iZ2UjxMcFvFUk/O8wwBVf3pGPEdfDqM3Me1HUph5TKPSM5LUw+4Db+SF4LzCuEuF/jhDN6CXtmy8QrAv/gfjlmOgmICNOxPf/yW7wJLlFBzWSraopJcnBHGF4zdcaQGyGUsl5yNkBAmwDUJEULwNoxAR0/zw7Y2sRcYM2tRngkNx/PB+SZUeI9WywbHPM5HOH8zU9STN/FOWO99gM9mTPJbUm1CcckOUjTpI+qrqaNbsXJQQfkf0nDdcaxde+QzHEr34XNCOh3EXJEaad5NRFCTCYvqyeHOhmKVk0a3emGqs9rY9v/4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB6053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(7366002)(7406005)(122000001)(7416002)(55016002)(9686003)(8676002)(8936002)(15650500001)(2906002)(38100700002)(64756008)(66946007)(71200400001)(66446008)(52536014)(498600001)(26005)(6506007)(54906003)(53546011)(86362001)(5660300002)(66476007)(110136005)(76116006)(66556008)(186003)(33656002)(7696005)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Tjc3Y2JtT0kxTE1XczVHTDhpL0kzVkd0SmFEamt2T3plSXZPaTF4bFlaeVQ0?=
 =?utf-8?B?aFd6WXZtZUZvWEUwSnFvdituUjFNM2ZsVytkVHpWZ2lkZTJMZ1dGRXVpRTVC?=
 =?utf-8?B?c1dHdGJiMUgxUEtVN3l5SkdkbDBoVDdrR1JUU1k5M2hsT0JtRUZXQ2czK0M2?=
 =?utf-8?B?SktNT09ENldkVXl4Y3JHZzZ1ZDlQRWdKM0tqcytjUE1XbkVzbVl4SEMrWVRz?=
 =?utf-8?B?ajZlL1hhQWxhR0dTdnV2RzhWZ0U0NUt2b3ZYUm0xNjZ2Z3NaYklMQ3RZb3kw?=
 =?utf-8?B?VlRzc2tWQVU1d0I1czNCTUtJOFlPQ05IVmNJbjRNM2dYREUzWmNFUi8yTTZ2?=
 =?utf-8?B?aUxRNlE1aE1TZWp6eGNZQUIxb0tXWjJZNXFtSFg5T011TEk3b2RkeVlmWG80?=
 =?utf-8?B?R2tWdERDa2pxM3BDVmlHc0dHem5od1hqR2t3RkFOenc1RG42L2hsOExqRWhz?=
 =?utf-8?B?YVFaWHo5QldIME5nQUxSWVRsRzhPQ0kyRmxZakRoazdzaEU2MFkvVXJkRTl4?=
 =?utf-8?B?Sk5wckNFSzdQWlNDbWZZWFlkTGFzYStjcGc0RDBIL1lTemkyenpBakFUejU1?=
 =?utf-8?B?eWJGWUY3NVdXeWZ1SGxwZFBOb3NtZzFScWZIVEovbkNERzZYb05lVU51NFRJ?=
 =?utf-8?B?ZmdtL2pTVzNqbkU1MVQzeUhnTkNmUUNlNmhpWU9sOWE3TVNpOXZCZmZ0NHJp?=
 =?utf-8?B?NmxRcVVHZ3ZJR0d0U3dGWlpwWThjMGFSejBtZDJud0NHbEs1cUE1R1NsNmFI?=
 =?utf-8?B?Q0RXNW40TkhEYmF3ME1vby9QM3lHZWVrMDBZUFZuWXZpWi9SbFdwREg0K1Bu?=
 =?utf-8?B?QlNueTk5dXFyLyt3VmVLVjJXK0tjSUJwa0JPVHl5Ukx1bmxWWXR2WU9EQmQ0?=
 =?utf-8?B?N3FUbEVhRkVKYUNGQzY1L3g5dGdKWE1CcTA3Mmo1ZDhNU0VPcEUzYThXUkI5?=
 =?utf-8?B?OW1TbVZpaWxxYVVZZ08xZjJkWk5KajRpMEp2c2REY3VHb1oxQjFBV01CY1pX?=
 =?utf-8?B?TkZIaWdUa1dZenp5K3dxa2ZNNUFSampHTm9xa29NVjhWdXA4MWxHbVRwQlNC?=
 =?utf-8?B?dHlTblljRHVsSUU2WEtrRVQzWjl2Um91eTRVNkRnTVNLaDM2dWs1OTg1c01k?=
 =?utf-8?B?VE9qUWZrNC9tcThvQkptZVZGVjU3NWZ3YXpRU1kySkxRZkF2cExkaUhMWVll?=
 =?utf-8?B?Rll0R05XT2gxeXcyWS9Qa2Mya01QU3hXVGNQbXQ2VjMxSGlXbGNTb0J6cjh0?=
 =?utf-8?B?Q3hsYm1ZVjhhaStJQldIdEJyV2VXb201bWhkY0JUbnEvRFkxUDNyZG5Pa2xR?=
 =?utf-8?B?OHFFLzFYc1NKSlJIMjJ4UTIzUS9ZajhiZUdrZWxYVng5aXYvYjBZMEhmZUtO?=
 =?utf-8?B?MjRVczNIL3ZNeFZYNVQxMGdwZWU5RHg0WHF3QklYNjRKQUxLOWowNGlsZFJH?=
 =?utf-8?B?MVYvNnM3WDQ0OVRzOWVGUE1mVC9qNE4vYmMzSG5HdDBPUVNRQkJsZ0d0NTBi?=
 =?utf-8?B?SGxra3BQaS9tcU9EbHRWR2NqKzZZOVdzbWNDR1Q1ejlrRmtraWk3Z3dmTUpq?=
 =?utf-8?B?OFR4MG9zSFFTdnlZMVpiQVplWkdBVmNWUjlNVnBUWHJZK2w3SlRodk5vWU94?=
 =?utf-8?B?SGhuRFRoTjNpOFpocWU2OFBDZFg0U05aUDV3N1E1dGNXNG80Rk04TWJHSW00?=
 =?utf-8?B?NmJZMU1SWEdjOUIzMlAzRDRrLzdLd1ZxYTE2WEE1Rk03K0puWUFkWm53eGJo?=
 =?utf-8?Q?eWyvyzhNxJxf+V3/BnPA030pcgiXSy0rOf6lkiA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a92a2a28-9643-4ff6-c7f0-08d9030216f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 07:09:35.6483 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OubtVimkEhplOMgaJeCjU5BYtR0VOBRtUjwIAtsTam7SrRkUDpUiFZ0ePWu3QmDrv9g3HvtHgwO4S8GHvVVGUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4408
X-Mailman-Approved-At: Mon, 19 Apr 2021 19:11:47 +1000
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
Cc: "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 Aymen Sghaier <aymen.sghaier@nxp.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "rafael@kernel.org" <rafael@kernel.org>, "airlied@linux.ie" <airlied@linux.ie>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "will@kernel.org" <will@kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 Horia Geanta <horia.geanta@nxp.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "peter.ujfalusi@gmail.com" <peter.ujfalusi@gmail.com>,
 "kishon@ti.com" <kishon@ti.com>, "tony@atomide.com" <tony@atomide.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
 dl-linux-imx <linux-imx@nxp.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 Roy Pledge <roy.pledge@nxp.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "edubezval@gmail.com" <edubezval@gmail.com>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "ssantosh@kernel.org" <ssantosh@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "balbi@kernel.org" <balbi@kernel.org>, "tomba@kernel.org" <tomba@kernel.org>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>, Leo Li <leoyang.li@nxp.com>,
 "linux@prisktech.co.nz" <linux@prisktech.co.nz>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "j-keerthy@ti.com" <j-keerthy@ti.com>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "jyri.sarha@iki.fi" <jyri.sarha@iki.fi>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG9taW5pcXVlIE1BUlRJ
TkVUIDxkb21pbmlxdWUubWFydGluZXRAYXRtYXJrLXRlY2huby5jb20+DQo+IFNlbnQ6IDIwMjHl
ubQ05pyIMTnml6UgMTM6MDMNCj4gVG86IEFsaWNlIEd1byAoT1NTKSA8YWxpY2UuZ3VvQG9zcy5u
eHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW1JGQyB2MSBQQVRDSCAzLzNdIGRyaXZlcjogdXBkYXRl
IGFsbCB0aGUgY29kZSB0aGF0IHVzZQ0KPiBzb2NfZGV2aWNlX21hdGNoDQo+IA0KPiBBbGljZSBH
dW8gKE9TUykgd3JvdGUgb24gTW9uLCBBcHIgMTksIDIwMjEgYXQgMTI6Mjc6MjJQTSArMDgwMDoN
Cj4gPiBGcm9tOiBBbGljZSBHdW8gPGFsaWNlLmd1b0BueHAuY29tPg0KPiA+DQo+ID4gVXBkYXRl
IGFsbCB0aGUgY29kZSB0aGF0IHVzZSBzb2NfZGV2aWNlX21hdGNoDQo+IA0KPiBBIHNpbmdsZSBw
YXRjaCBtaWdodCBiZSBkaWZmaWN1bHQgdG8gYWNjZXB0IGZvciBhbGwgY29tcG9uZW50cywgYSBl
YWNoIG1haW50YWluZXINCj4gd2lsbCBwcm9iYWJseSB3YW50IHRvIGhhdmUgYSBzYXkgb24gdGhl
aXIgc3Vic3lzdGVtPw0KPiANCj4gSSB3b3VsZCBzdWdnZXN0IHRvIHNwbGl0IHRoZXNlIGZvciBh
IG5vbi1SRkMgdmVyc2lvbjsgYSB0aGlzIHdpbGwgcmVhbGx5IG5lZWQgdG8gYmUNCj4gY2FzZS1i
eS1jYXNlIGhhbmRsaW5nLg0KPiANCj4gPiBiZWNhdXNlIGFkZCBzdXBwb3J0IGZvciBzb2NfZGV2
aWNlX21hdGNoIHJldHVybmluZyAtRVBST0JFX0RFRkVSLg0KPiANCj4gKEVuZ2xpc2ggZG9lcyBu
b3QgcGFyc2UgaGVyZSBmb3IgbWUpDQo+IA0KPiBJJ3ZlIG9ubHkgY29tbWVudGVkIGEgY291cGxl
IG9mIHBsYWNlcyBpbiB0aGUgY29kZSBpdHNlbGYsIGJ1dCB0aGlzIGRvZXNuJ3Qgc2VlbQ0KPiB0
byBhZGQgbXVjaCBzdXBwb3J0IGZvciBlcnJvcnMsIGp1c3Qgc3dlZXAgdGhlIHByb2JsZW0gdW5k
ZXIgdGhlIHJ1Zy4NCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQWxpY2UgR3VvIDxhbGljZS5ndW9A
bnhwLmNvbT4NCj4gPiAtLS0NCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2J1cy90aS1z
eXNjLmMgYi9kcml2ZXJzL2J1cy90aS1zeXNjLmMgaW5kZXgNCj4gPiA1ZmFlNjBmOGMxMzUuLjAw
YzU5YWEyMTdjMSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2J1cy90aS1zeXNjLmMNCj4gPiAr
KysgYi9kcml2ZXJzL2J1cy90aS1zeXNjLmMNCj4gPiBAQCAtMjkwOSw3ICsyOTA5LDcgQEAgc3Rh
dGljIGludCBzeXNjX2luaXRfc29jKHN0cnVjdCBzeXNjICpkZGF0YSkNCj4gPiAgCX0NCj4gPg0K
PiA+ICAJbWF0Y2ggPSBzb2NfZGV2aWNlX21hdGNoKHN5c2Nfc29jX2ZlYXRfbWF0Y2gpOw0KPiA+
IC0JaWYgKCFtYXRjaCkNCj4gPiArCWlmICghbWF0Y2ggfHwgSVNfRVJSKG1hdGNoKSkNCj4gPiAg
CQlyZXR1cm4gMDsNCj4gDQo+IFRoaXMgZnVuY3Rpb24gaGFuZGxlcyBlcnJvcnMsIEkgd291bGQg
cmVjb21tZW5kIHJldHVybmluZyB0aGUgZXJyb3IgYXMgaXMgaWYNCj4gc29jX2RldmljZV9tYXRj
aCByZXR1cm5lZCBvbmUgc28gdGhlIHByb2JlIGNhbiBiZSByZXRyaWVkIGxhdGVyLg0KPiANCj4g
Pg0KPiA+ICAJaWYgKG1hdGNoLT5kYXRhKQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9y
ZW5lc2FzL3I4YTc3OTUtY3BnLW1zc3IuYw0KPiA+IGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yOGE3
Nzk1LWNwZy1tc3NyLmMNCj4gPiBpbmRleCBjMzJkMmM2NzgwNDYuLjkwYTE4MzM2YTRjMyAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3I4YTc3OTUtY3BnLW1zc3IuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcjhhNzc5NS1jcGctbXNzci5jDQo+ID4gQEAgLTQz
OSw2ICs0MzksNyBAQCBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHI4YTc3OTVlczJfbW9kX251
bGxpZnlbXQ0KPiA+IF9faW5pdGNvbnN0ID0gew0KPiA+DQo+ID4gIHN0YXRpYyBpbnQgX19pbml0
IHI4YTc3OTVfY3BnX21zc3JfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYpICB7DQo+ID4gKwljb25z
dCBzdHJ1Y3Qgc29jX2RldmljZV9hdHRyaWJ1dGUgKm1hdGNoOw0KPiA+ICAJY29uc3Qgc3RydWN0
IHJjYXJfZ2VuM19jcGdfcGxsX2NvbmZpZyAqY3BnX3BsbF9jb25maWc7DQo+ID4gIAl1MzIgY3Bn
X21vZGU7DQo+ID4gIAlpbnQgZXJyb3I7DQo+ID4gQEAgLTQ1Myw3ICs0NTQsOCBAQCBzdGF0aWMg
aW50IF9faW5pdCByOGE3Nzk1X2NwZ19tc3NyX2luaXQoc3RydWN0IGRldmljZQ0KPiAqZGV2KQ0K
PiA+ICAJCXJldHVybiAtRUlOVkFMOw0KPiA+ICAJfQ0KPiA+DQo+ID4gLQlpZiAoc29jX2Rldmlj
ZV9tYXRjaChyOGE3Nzk1ZXMxKSkgew0KPiA+ICsJbWF0Y2ggPSBzb2NfZGV2aWNlX21hdGNoKHI4
YTc3OTVlczEpOw0KPiA+ICsJaWYgKCFJU19FUlIobWF0Y2gpICYmIG1hdGNoKSB7DQo+IA0KPiBT
YW1lLCByZXR1cm4gdGhlIGVycm9yLg0KPiBBc3N1bWluZyBhbiBlcnJvciBtZWFucyBubyBtYXRj
aCB3aWxsIGp1c3QgbGVhZCB0byBoYXJkIHRvIGRlYnVnIHByb2JsZW1zDQo+IGJlY2F1c2UgdGhl
IGRyaXZlciBwb3RlbnRpYWxseSBhc3N1bWVkIHRoZSB3cm9uZyBkZXZpY2Ugd2hlbiBpdCdzIGp1
c3Qgbm90DQo+IHJlYWR5IHlldC4NCj4gDQo+ID4gIAkJY3BnX2NvcmVfbnVsbGlmeV9yYW5nZShy
OGE3Nzk1X2NvcmVfY2xrcywNCj4gPiAgCQkJCSAgICAgICBBUlJBWV9TSVpFKHI4YTc3OTVfY29y
ZV9jbGtzKSwNCj4gPiAgCQkJCSAgICAgICBSOEE3Nzk1X0NMS19TMEQyLCBSOEE3Nzk1X0NMS19T
MEQxMik7IFsuLi5dDQo+IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvaW9tbXUvaXBtbXUtdm1z
YS5jIGIvZHJpdmVycy9pb21tdS9pcG1tdS12bXNhLmMgaW5kZXgNCj4gPiBlYWFlYzBhNTVjYzYu
LjEzYTA2YjYxMzM3OSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2lvbW11L2lwbW11LXZtc2Eu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvaW9tbXUvaXBtbXUtdm1zYS5jDQo+ID4gQEAgLTc1NywxNyAr
NzU3LDIwIEBAIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgZGV2aWNlc19hbGxvd2xpc3RbXSA9
DQo+ID4gew0KPiA+DQo+ID4gIHN0YXRpYyBib29sIGlwbW11X2RldmljZV9pc19hbGxvd2VkKHN0
cnVjdCBkZXZpY2UgKmRldikgIHsNCj4gPiArCWNvbnN0IHN0cnVjdCBzb2NfZGV2aWNlX2F0dHJp
YnV0ZSAqbWF0Y2gxLCAqbWF0Y2gyOw0KPiA+ICAJdW5zaWduZWQgaW50IGk7DQo+ID4NCj4gPiAg
CS8qDQo+ID4gIAkgKiBSLUNhciBHZW4zIGFuZCBSWi9HMiB1c2UgdGhlIGFsbG93IGxpc3QgdG8g
b3B0LWluIGRldmljZXMuDQo+ID4gIAkgKiBGb3IgT3RoZXIgU29DcywgdGhpcyByZXR1cm5zIHRy
dWUgYW55d2F5Lg0KPiA+ICAJICovDQo+ID4gLQlpZiAoIXNvY19kZXZpY2VfbWF0Y2goc29jX25l
ZWRzX29wdF9pbikpDQo+ID4gKwltYXRjaDEgPSBzb2NfZGV2aWNlX21hdGNoKHNvY19uZWVkc19v
cHRfaW4pOw0KPiA+ICsJaWYgKCFJU19FUlIobWF0Y2gxKSAmJiAhbWF0Y2gxKQ0KPiANCj4gSSdt
IG5vdCBzdXJlIHdoYXQgeW91IGludGVuZGVkIHRvIGRvLCBidXQgIW1hdGNoMSBhbHJlYWR5IG1l
YW5zIHRoZXJlIGlzIG5vDQo+IGVycm9yIHNvIHRoZSBvcmlnaW5hbCBjb2RlIGlzIGlkZW50aWNh
bC4NCj4gDQo+IEluIHRoaXMgY2FzZSBpcG1tdV9kZXZpY2VfaXNfYWxsb3dlZCBkb2VzIG5vdCBh
bGxvdyBlcnJvcnMgc28gdGhpcyBpcyBvbmUgb2YgdGhlDQo+ICJkaWZmaWN1bHQiIGRyaXZlcnMg
dGhhdCByZXF1aXJlIHNsaWdodGx5IG1vcmUgdGhpbmtpbmcuDQo+IEl0IGlzIG9ubHkgY2FsbGVk
IGluIGlwbW11X29mX3hsYXRlIHdoaWNoIGRvZXMgcmV0dXJuIGVycm9ycyBwcm9wZXJseSwgc28g
aW4gdGhpcw0KPiBjYXNlIHRoZSBtb3N0IHN0cmFpZ2h0Zm9yd2FyZCBhcHByb2FjaCB3b3VsZCBi
ZSB0byBtYWtlDQo+IGlwbW11X2RldmljZV9pc19hbGxvd2VkIHJldHVybiBhbiBpbnQgYW5kIGZv
cndhcmQgZXJyb3JzIGFzIHdlbGwuDQo+IA0KDQpJIHdpbGwgcmVjb25zaWRlciB0aGUgZXhpc3Rp
bmcgcHJvYmxlbXMuIFRoYW5rIHlvdSBmb3IgeW91ciBhZHZpY2UNCg0KPiANCj4gLi4uDQo+IFRo
aXMgaXMgZ29pbmcgdG8gbmVlZCBxdWl0ZSBzb21lIG1vcmUgd29yayB0byBiZSBhY2NlcHRhYmxl
LCBpbiBteSBvcGluaW9uLCBidXQNCj4gSSB0aGluayBpdCBzaG91bGQgYmUgcG9zc2libGUuDQo+
IA0KPiBUaGFua3MsDQo+IC0tDQo+IERvbWluaXF1ZQ0K
