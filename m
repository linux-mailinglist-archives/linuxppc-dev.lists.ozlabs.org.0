Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2711B7738FA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 10:15:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=R70yBgw8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKmGf6qthz3cGk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 18:15:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=R70yBgw8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::603; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20603.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::603])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKm9T371fz3dLQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 18:11:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GP+M58aLuyGu56BbHqqhjpLcsEaCO/8ObfNAR1a+TVsYrF3VFFwst346mDj3jvlDqM8btVIcZ+zGvFF214ButPxT9/SY7XL00qYrq976xGwm4tHpXDc6up7srD4VEfzzlwKVYh8pckFMznQY+VCEXwMdL83ELFrPGpREH/BguptopJaqYKQPDVUjIWkcxAK01cHCPQOw9LIA4Qz2w5qQv1z/Htx4vV/Wp1r3ETAkisZtUn5TxLFxOvTJvDDmb4W5ZOFIzxW4jkcYW5hJDHb+Wg26++7EvLIj9Op4vhdMrZJpOJH9Y3x1B7ooGqoKKZRS6FOULerpD7VUjrvmn3lI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrpdXZMbjeor5RmRbocOL0bGP4VIDWh2HZdlvIly6+0=;
 b=M+1Ki0ByeqLsiWtqQxv4ww9aFRMSn5jm4FzGAPp7m2zqbdD0EpkskPQy7xnIM93JBubZoSXZyCOIvEF65DAm1Ze3mN1Wid07BoFB77UtOpLR84OeBrNVFx1LDjOwMWpXq3ck9MSqQcIZ4pvGlZkPFrX7L3WlK2MsNFZmyvey6pCfGfxacxcaEVTbBlyVwdrypjuXFWVXugfCn4//qGi0ldqJkbWlzp0iOF+yQkAoSiBq+kC7RVf4JJmxNlt2LDftVbdTPdKg3T07NbjlgBf+P3NniXt1b1Dv5aFT/udRZzfPDLek5uD7pofxO22+1aIssT2iruZ35uXvO9/EG363hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrpdXZMbjeor5RmRbocOL0bGP4VIDWh2HZdlvIly6+0=;
 b=R70yBgw8RKWJiNIEO+CTsiZQ923nCFfZdGWxdewmyK6GS/dDczfhV1TOrPpO6A0crYlLQQDUPX+lya7zs8esxLby87mhPx+GuYc6/mhUgw8hJTODcE3ypkNSQeCQNbbiKKLid0J32CN5PqKYbFEFwC67fUCN6inrK64DmQLpuEHNopycga2a0HYNehlHrUpeILiTiRMTx7HTtW2qbS1hhpfs5yRyg970XfRLUczMpoXAfsqVFyMlnC2AU5wOz99ciwhMEUmFyejMnQnYr2DJcUU8zr3kJHnAllAHhP/yyrxY6cYAepIzW5NVPjYTHYnCTwi6J9uLnROcy1isVqzHrw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2014.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:193::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 08:11:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 08:11:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
	<andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Lee
 Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao
	<qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
	<shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
	<festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Randy Dunlap
	<rdunlap@infradead.org>
Subject: Re: [PATCH v2 19/28] wan: qmc_hdlc: Add runtime timeslots changes
 support
Thread-Topic: [PATCH v2 19/28] wan: qmc_hdlc: Add runtime timeslots changes
 support
Thread-Index: AQHZv9Jig710YswJH0mj/lL3EClQwq/gIB+A
Date: Tue, 8 Aug 2023 08:11:07 +0000
Message-ID: <92729ac9-d2ae-65e5-b38d-807943afd25a@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-20-herve.codina@bootlin.com>
In-Reply-To: <20230726150225.483464-20-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2014:EE_
x-ms-office365-filtering-correlation-id: e3c323ea-3465-44de-5f64-08db97e70474
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  x/Ksw1E6fgA2c/DBbYKtEj8URh2mPWzftrCj/mX0g+DNL2/GZ0glOnaMnnCIxTv0ALojfQpWStzmzemBdrO6hRmfMjWVQxUXVUAXMQUl2KzakISU/lJVRLtoot4PuUmVbZjtTU9v+pPhy06YLyDUScjmIPXYXT48jiHXSQH9ro/9tXsZ/k/TWlydEHEQAWuNEDoOYsB/Z9Gs+ItbzEsaZhIN83Eb0POZguJD5zz5P/1mkrhxROXWiTfC7CHHiy/C24pmgEKQqv6EfdReie9Uq63rAyZE/4pFUO5xWFRCjdbgdLthWQMXOjpWPqFJ4JqSc8mKptNOW5pv/IoFjBnd3fbBMc0ElaoZ8bq1jQz37zF0B53DsuGdojXA+Tu7V25jHOzVg9uIG0+D3rPZZZrr//pEpu4fHZvOWTfWWWKdh/rowaKS1REnYWuJ2lAF9WSHcnXAgByepd1xuUPcZ4vTRoStTzzyLw9RqYthK29Fg2DtCAJ4ent+aIiWLhK47wPvU0qDY22kANyD4lHUlkpyxRXATOyE4X8lp1E/tZewvQQkfSHDflx/Lm0wATqKuKIfe9eEWXLzEmvg1k7yq71oio7+aKbDxH2Qk5pg1AlX5TPeeBCg2kc6fv0CaYofZpBMwLdDOFt0nZVvxeWVVfD4Og9byQeUYdKIYIiNddqQNZmUWFZe6FF/ipui5B+X8pRfPULHHQQD86DrMQf8XGT6iWoeQp+USkCFGayWQzRewWJ/SVASj2dXDNqOKiNdmwiQx9s/P17KQZC0VigBbgbcSQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(366004)(39850400004)(396003)(451199021)(1800799003)(186006)(90021799007)(90011799007)(31686004)(316002)(83380400001)(66574015)(2616005)(2906002)(122000001)(921005)(36756003)(8936002)(8676002)(26005)(38100700002)(6486002)(5660300002)(7416002)(66946007)(41300700001)(66556008)(76116006)(66476007)(44832011)(66446008)(4326008)(6506007)(7406005)(64756008)(478600001)(91956017)(54906003)(110136005)(31696002)(86362001)(71200400001)(6512007)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?U3hzMnZCWnE4cXp2Q0JhcGQrcG4yZE1BaE8xWjU0S01xdUcyZmdCMjQvQ0l5?=
 =?utf-8?B?QUJqZXpva29oL0pIaHgzMEY0RXc4by9ONGNRdGlxWmV2UzZKMURFN0Q1bTJM?=
 =?utf-8?B?VXJvdUgrckZLa3V2UmdYdEl2TEJIZll3VzNTWUlrOXc0YjA2T1VtdXNWa1g5?=
 =?utf-8?B?NTU4Njl1aDZrMENCVjZGYTdNaTZ6bWhqQ2Y5STVVL1ZPMndJRHN5WklZVDZz?=
 =?utf-8?B?QlBXOU1HLzRiQlU0WDI4dGtvUCs1S3ovcGlPQjl4UGdnMWx6NEhFQjZWOXV1?=
 =?utf-8?B?elFaSjkvK0FjQTBJZVdydUxLbXZRS0lwOUVFbW0zRGh5dktQaHhmejVIYjlM?=
 =?utf-8?B?NEJVUzB2bkkwdWlGSmhta3pXRGhZNVZFZXQyT2pEWm5UUW1SbzZwSXJQQ1VB?=
 =?utf-8?B?NXNKTkpRcHJIMkd2UXcveE5rV2RWczlUd1pPRFVXQUF2NDBwdVlBSkQrLzZa?=
 =?utf-8?B?QmVsR3VnUXBpYjBiZkRxa1lzSGZMNW9uMjdyZ1lDeXEvbEJHaTd0eW0zMTRm?=
 =?utf-8?B?Vk1jTzZsUStHY3dXemNyWUp2OFBRZDU3VGhwMUIyT3dsQzlzRzNIQWN5S1g1?=
 =?utf-8?B?bkRSdjB0ang4dVNlZ2VIdnFjMm9lWFM2Z3dqZU5GTVQxMlBuQlZMUS9WMmZ2?=
 =?utf-8?B?cFhmZW85a0JyQWVTNXpZV0hEQ1lsSFh6b01jcTNCU1Z3VUU1c0hmdjNTWFdq?=
 =?utf-8?B?djVrZFUzTEdOUnV3amFkclh6SFFhS3Vjc1JJbHpKekxLcm1nTnNCMnplWUNN?=
 =?utf-8?B?cGJnWC9ZcmIzbGNjeE9kV3JuQ2IwS2NPazB5ZTU4YTh3Y3hGcmhvTXZCNlA5?=
 =?utf-8?B?cXJHbEFXRnV5cGltb2ZzUk9vS0FwVE9VNGF5QUpMMU1HdUlmdjYzcmZ6Y21a?=
 =?utf-8?B?M083c0x4Rkh1UlRJSmh0NU9VaG02eFpoNktWVHlxemx6MmFETDZFdEUvbE9T?=
 =?utf-8?B?eTFlTDd5NjRXK3VoOThtZVY4WTQ5KzJJakxySzV4L29lOEZiZXd4YVgrT1pq?=
 =?utf-8?B?RzkyMHUxVzhBcWQ3SGdFMVBVY2lXVG5XdHhkb3pEbmVKcktaWXFrcFdCL09U?=
 =?utf-8?B?b3hNNWxYc09tTjI3YnQrZHJXVVdGRWhwcy9UOGJlYkpCYWMzQnNjTTBuN0dI?=
 =?utf-8?B?YTNCazNoS0RLZyt4VjYvbkpwSXpQbTh5NktlalVkY3FDb3pxcC9YcjQxUEtz?=
 =?utf-8?B?bVU2endtdmVXci9Oa2RKYSt6bXcyNHFjSGNZVmhxeURrNUlWMkx0YnVZQWds?=
 =?utf-8?B?dFFTUnFhLzNmWUE1R0YrRkxPMTRWblJ4Y1N4MjFveVQ2cWRuRldERWxYa2Yv?=
 =?utf-8?B?VjN5N2Y1dmZpelJjRkkyOVgwdW0xTEc5eVZPSmtDb240eWpYT2poRUxEOTBs?=
 =?utf-8?B?SDhvMzAvT3NmL0RLNTFMdXNlY2dIOGFOYTdpdkNXNzlXajZkaVRub0NEV1Q1?=
 =?utf-8?B?djdmS3ptWWEybEVITTdvZDA2TzBSb1RKYkhnQXkvK2FrTDFYNmZQVU1Da3Yw?=
 =?utf-8?B?eGVBZmR3bjFKaHRQL2RHeTVMcitVcllVSmpVRmxHQTB0eEwzLzM2YWJpWEtD?=
 =?utf-8?B?VlhBR2hsb2YzT25TOHVQdm0zTFg5UHQvUXNaMG9OWGhVQnN3eWlPdUljSHZK?=
 =?utf-8?B?bmdJWW81bFJRLzltalV1Nk5jaFZ2bGVIT1lUQ3VPUmNFZitvWUx1bFkyK0dj?=
 =?utf-8?B?OWQ0aG1sWk5wZ1lCRUpJQU42SStzRDBUWTE0UlJlZTFXdnk3NVNheEFoWUFX?=
 =?utf-8?B?cDJpejJPVmt6T2ZZMWoxcVpNbi9QZ2tlZTNod25KYm43MWRXdnYyN0dBcERl?=
 =?utf-8?B?VHY2aTlNSjZjQjRVU1dwMllndVNJMHZwcTNPNjNQMmZ3Qk1QeEdrTWd3NmJD?=
 =?utf-8?B?TkpxQ0gxbURKUnVZV3VZOHViWDBmYi9qNHk1cTB5c215TjQxQnY3dG0wbENP?=
 =?utf-8?B?aXE5MzNSdXJJSGxCM3dXb3N1SlZ2L3VVaWhJMnNiMmpLSDRIUG1HUzFsS1p2?=
 =?utf-8?B?UHd1Y29sLzlET0tvbStoS0lWWXl3UXNteWdXN3lUc3YxMlBYOVF0NXlFcFRI?=
 =?utf-8?B?VWNtMHNsZGpMOC92aWRnajVZbnc3Ym54emxJL0Nta09rL1ZIYXoyWE5jTnBj?=
 =?utf-8?Q?ExbeCyxLygs/ps1CHMjaAeEuu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B29338BD21C43F488F05C83E5888893D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c323ea-3465-44de-5f64-08db97e70474
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 08:11:07.0586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mYdFjSpWWj7ACp6BIynjGkAqu5cpX05ea7kjmjr8F6ElKQstOgGzbkF2DgbCNa67hWZXdm7ZIBCaBAKkJY3iQnOo00u0/bAxlJ35S4ogJCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2014
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI2LzA3LzIwMjMgw6AgMTc6MDIsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBR
TUMgY2hhbm5lbHMgc3VwcG9ydCBydW50aW1lIHRpbWVzbG90cyBjaGFuZ2VzIGJ1dCBub3RoaW5n
IGlzIGRvbmUgYXQNCj4gdGhlIFFNQyBIRExDIGRyaXZlciB0byBoYW5kbGUgdGhlc2UgY2hhbmdl
cy4NCj4gDQo+IFVzZSBleGlzdGluZyBJRkFDRSBpb2N0bCBpbiBvcmRlciB0byBjb25maWd1cmUg
dGhlIHRpbWVzbG90cyB0byB1c2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIZXJ2ZSBDb2RpbmEg
PGhlcnZlLmNvZGluYUBib290bGluLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVy
b3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL25l
dC93YW4vZnNsX3FtY19oZGxjLmMgfCAxNjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE2OCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2FuL2ZzbF9xbWNfaGRsYy5jIGIvZHJp
dmVycy9uZXQvd2FuL2ZzbF9xbWNfaGRsYy5jDQo+IGluZGV4IGI0ZWJhZTk2M2QzOS4uYzQ0OWVk
ZjBhMzVlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL25ldC93YW4vZnNsX3FtY19oZGxjLmMNCj4g
KysrIGIvZHJpdmVycy9uZXQvd2FuL2ZzbF9xbWNfaGRsYy5jDQo+IEBAIC0zMiw2ICszMiw3IEBA
IHN0cnVjdCBxbWNfaGRsYyB7DQo+ICAgCXN0cnVjdCBxbWNfaGRsY19kZXNjIHR4X2Rlc2NzWzhd
Ow0KPiAgIAl1bnNpZ25lZCBpbnQgdHhfb3V0Ow0KPiAgIAlzdHJ1Y3QgcW1jX2hkbGNfZGVzYyBy
eF9kZXNjc1s0XTsNCj4gKwl1MzIgc2xvdF9tYXA7DQo+ICAgfTsNCj4gICANCj4gICBzdGF0aWMg
aW5saW5lIHN0cnVjdCBxbWNfaGRsYyAqbmV0ZGV2X3RvX3FtY19oZGxjKHN0cnVjdCBuZXRfZGV2
aWNlICpuZXRkZXYpDQo+IEBAIC0yMDIsNiArMjAzLDE2MiBAQCBzdGF0aWMgbmV0ZGV2X3R4X3Qg
cW1jX2hkbGNfeG1pdChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgbmV0X2RldmljZSAqbmV0
ZGV2KQ0KPiAgIAlyZXR1cm4gTkVUREVWX1RYX09LOw0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyBp
bnQgcW1jX2hkbGNfeGxhdGVfc2xvdF9tYXAoc3RydWN0IHFtY19oZGxjICpxbWNfaGRsYywNCj4g
KwkJCQkgICB1MzIgc2xvdF9tYXAsIHN0cnVjdCBxbWNfY2hhbl90c19pbmZvICp0c19pbmZvKQ0K
PiArew0KPiArCXU2NCB0c19tYXNrX2F2YWlsOw0KPiArCXVuc2lnbmVkIGludCBiaXQ7DQo+ICsJ
dW5zaWduZWQgaW50IGk7DQo+ICsJdTY0IHRzX21hc2s7DQo+ICsJdTY0IG1hcCA9IDA7DQo+ICsN
Cj4gKwkvKiBUeCBhbmQgUnggbWFza3MgbXVzdCBiZSBpZGVudGljYWwgKi8NCj4gKwlpZiAodHNf
aW5mby0+cnhfdHNfbWFza19hdmFpbCAhPSB0c19pbmZvLT50eF90c19tYXNrX2F2YWlsKSB7DQo+
ICsJCWRldl9lcnIocW1jX2hkbGMtPmRldiwgInR4IGFuZCByeCBhdmFpbGFibGUgdGltZXNsb3Rz
IG1pc21hdGNoICgweCVsbHgsIDB4JWxseClcbiIsDQo+ICsJCQl0c19pbmZvLT5yeF90c19tYXNr
X2F2YWlsLCB0c19pbmZvLT50eF90c19tYXNrX2F2YWlsKTsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7
DQo+ICsJfQ0KPiArDQo+ICsJdHNfbWFza19hdmFpbCA9IHRzX2luZm8tPnJ4X3RzX21hc2tfYXZh
aWw7DQo+ICsJdHNfbWFzayA9IDA7DQo+ICsJbWFwID0gc2xvdF9tYXA7DQo+ICsJYml0ID0gMDsN
Cj4gKwlmb3IgKGkgPSAwOyBpIDwgNjQ7IGkrKykgew0KPiArCQlpZiAodHNfbWFza19hdmFpbCAm
IEJJVF9VTEwoaSkpIHsNCj4gKwkJCWlmIChtYXAgJiBCSVRfVUxMKGJpdCkpDQo+ICsJCQkJdHNf
bWFzayB8PSBCSVRfVUxMKGkpOw0KPiArCQkJYml0Kys7DQo+ICsJCX0NCj4gKwl9DQo+ICsNCj4g
KwlpZiAoaHdlaWdodDY0KHRzX21hc2spICE9IGh3ZWlnaHQ2NChtYXApKSB7DQo+ICsJCWRldl9l
cnIocW1jX2hkbGMtPmRldiwgIkNhbm5vdCB0cmFuc2xhdGUgdGltZXNsb3RzIDB4JWxseCAtPiAo
MHglbGx4LDB4JWxseClcbiIsDQo+ICsJCQltYXAsIHRzX21hc2tfYXZhaWwsIHRzX21hc2spOw0K
PiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICsNCj4gKwl0c19pbmZvLT50eF90c19tYXNr
ID0gdHNfbWFzazsNCj4gKwl0c19pbmZvLT5yeF90c19tYXNrID0gdHNfbWFzazsNCj4gKwlyZXR1
cm4gMDsNCj4gK30NCj4gKw0KPiArc3RhdGljIGludCBxbWNfaGRsY194bGF0ZV90c19pbmZvKHN0
cnVjdCBxbWNfaGRsYyAqcW1jX2hkbGMsDQo+ICsJCQkJICBjb25zdCBzdHJ1Y3QgcW1jX2NoYW5f
dHNfaW5mbyAqdHNfaW5mbywgdTMyICpzbG90X21hcCkNCj4gK3sNCj4gKwl1NjQgdHNfbWFza19h
dmFpbDsNCj4gKwl1bnNpZ25lZCBpbnQgYml0Ow0KPiArCXVuc2lnbmVkIGludCBpOw0KPiArCXU2
NCB0c19tYXNrOw0KPiArCXU2NCBtYXAgPSAwOw0KPiArDQo+ICsJLyogVHggYW5kIFJ4IG1hc2tz
IG11c3QgYmUgaWRlbnRpY2FsICovDQo+ICsJaWYgKHRzX2luZm8tPnJ4X3RzX21hc2tfYXZhaWwg
IT0gdHNfaW5mby0+dHhfdHNfbWFza19hdmFpbCkgew0KPiArCQlkZXZfZXJyKHFtY19oZGxjLT5k
ZXYsICJ0eCBhbmQgcnggYXZhaWxhYmxlIHRpbWVzbG90cyBtaXNtYXRjaCAoMHglbGx4LCAweCVs
bHgpXG4iLA0KPiArCQkJdHNfaW5mby0+cnhfdHNfbWFza19hdmFpbCwgdHNfaW5mby0+dHhfdHNf
bWFza19hdmFpbCk7DQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArCX0NCj4gKwlpZiAodHNfaW5m
by0+cnhfdHNfbWFzayAhPSB0c19pbmZvLT50eF90c19tYXNrKSB7DQo+ICsJCWRldl9lcnIocW1j
X2hkbGMtPmRldiwgInR4IGFuZCByeCB0aW1lc2xvdHMgbWlzbWF0Y2ggKDB4JWxseCwgMHglbGx4
KVxuIiwNCj4gKwkJCXRzX2luZm8tPnJ4X3RzX21hc2ssIHRzX2luZm8tPnR4X3RzX21hc2spOw0K
PiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICsNCj4gKwl0c19tYXNrX2F2YWlsID0gdHNf
aW5mby0+cnhfdHNfbWFza19hdmFpbDsNCj4gKwl0c19tYXNrID0gdHNfaW5mby0+cnhfdHNfbWFz
azsNCj4gKwltYXAgPSAwOw0KPiArCWJpdCA9IDA7DQo+ICsJZm9yIChpID0gMDsgaSA8IDY0OyBp
KyspIHsNCj4gKwkJaWYgKHRzX21hc2tfYXZhaWwgJiBCSVRfVUxMKGkpKSB7DQo+ICsJCQlpZiAo
dHNfbWFzayAmIEJJVF9VTEwoaSkpDQo+ICsJCQkJbWFwIHw9IEJJVF9VTEwoYml0KTsNCj4gKwkJ
CWJpdCsrOw0KPiArCQl9DQo+ICsJfQ0KPiArDQo+ICsJaWYgKGh3ZWlnaHQ2NCh0c19tYXNrKSAh
PSBod2VpZ2h0NjQobWFwKSkgew0KPiArCQlkZXZfZXJyKHFtY19oZGxjLT5kZXYsICJDYW5ub3Qg
dHJhbnNsYXRlIHRpbWVzbG90cyAoMHglbGx4LDB4JWxseCkgLT4gMHglbGx4XG4iLA0KPiArCQkJ
dHNfbWFza19hdmFpbCwgdHNfbWFzaywgbWFwKTsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJ
fQ0KPiArDQo+ICsJaWYgKG1hcCA+PSBCSVRfVUxMKDMyKSkgew0KPiArCQlkZXZfZXJyKHFtY19o
ZGxjLT5kZXYsICJTbG90IG1hcCBvdXQgb2YgMzJiaXQgKDB4JWxseCwweCVsbHgpIC0+IDB4JWxs
eFxuIiwNCj4gKwkJCXRzX21hc2tfYXZhaWwsIHRzX21hc2ssIG1hcCk7DQo+ICsJCXJldHVybiAt
RUlOVkFMOw0KPiArCX0NCj4gKw0KPiArCSpzbG90X21hcCA9IG1hcDsNCj4gKwlyZXR1cm4gMDsN
Cj4gK30NCj4gKw0KPiArc3RhdGljIGludCBxbWNfaGRsY19zZXRfaWZhY2Uoc3RydWN0IHFtY19o
ZGxjICpxbWNfaGRsYywgaW50IGlmX2lmYWNlLCBjb25zdCB0ZTFfc2V0dGluZ3MgKnRlMSkNCj4g
K3sNCj4gKwlzdHJ1Y3QgcW1jX2NoYW5fdHNfaW5mbyB0c19pbmZvOw0KPiArCWludCByZXQ7DQo+
ICsNCj4gKwlyZXQgPSBxbWNfY2hhbl9nZXRfdHNfaW5mbyhxbWNfaGRsYy0+cW1jX2NoYW4sICZ0
c19pbmZvKTsNCj4gKwlpZiAocmV0KSB7DQo+ICsJCWRldl9lcnIocW1jX2hkbGMtPmRldiwgImdl
dCBRTUMgY2hhbm5lbCB0cyBpbmZvIGZhaWxlZCAlZFxuIiwgcmV0KTsNCj4gKwkJcmV0dXJuIHJl
dDsNCj4gKwl9DQo+ICsJcmV0ID0gcW1jX2hkbGNfeGxhdGVfc2xvdF9tYXAocW1jX2hkbGMsIHRl
MS0+c2xvdF9tYXAsICZ0c19pbmZvKTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0K
PiArDQo+ICsJcmV0ID0gcW1jX2NoYW5fc2V0X3RzX2luZm8ocW1jX2hkbGMtPnFtY19jaGFuLCAm
dHNfaW5mbyk7DQo+ICsJaWYgKHJldCkgew0KPiArCQlkZXZfZXJyKHFtY19oZGxjLT5kZXYsICJz
ZXQgUU1DIGNoYW5uZWwgdHMgaW5mbyBmYWlsZWQgJWRcbiIsIHJldCk7DQo+ICsJCXJldHVybiBy
ZXQ7DQo+ICsJfQ0KPiArDQo+ICsJcW1jX2hkbGMtPnNsb3RfbWFwID0gdGUxLT5zbG90X21hcDsN
Cj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IHFtY19oZGxjX2lv
Y3RsKHN0cnVjdCBuZXRfZGV2aWNlICpuZXRkZXYsIHN0cnVjdCBpZl9zZXR0aW5ncyAqaWZzKQ0K
PiArew0KPiArCXN0cnVjdCBxbWNfaGRsYyAqcW1jX2hkbGMgPSBuZXRkZXZfdG9fcW1jX2hkbGMo
bmV0ZGV2KTsNCj4gKwl0ZTFfc2V0dGluZ3MgdGUxOw0KPiArDQo+ICsJc3dpdGNoIChpZnMtPnR5
cGUpIHsNCj4gKwljYXNlIElGX0dFVF9JRkFDRToNCj4gKwkJaWZzLT50eXBlID0gSUZfSUZBQ0Vf
RTE7DQo+ICsJCWlmIChpZnMtPnNpemUgPCBzaXplb2YodGUxKSkgew0KPiArCQkJaWYgKCFpZnMt
PnNpemUpDQo+ICsJCQkJcmV0dXJuIDA7IC8qIG9ubHkgdHlwZSByZXF1ZXN0ZWQgKi8NCj4gKw0K
PiArCQkJaWZzLT5zaXplID0gc2l6ZW9mKHRlMSk7IC8qIGRhdGEgc2l6ZSB3YW50ZWQgKi8NCj4g
KwkJCXJldHVybiAtRU5PQlVGUzsNCj4gKwkJfQ0KPiArDQo+ICsJCW1lbXNldCgmdGUxLCAwLCBz
aXplb2YodGUxKSk7DQo+ICsNCj4gKwkJLyogVXBkYXRlIHNsb3RfbWFwICovDQo+ICsJCXRlMS5z
bG90X21hcCA9IHFtY19oZGxjLT5zbG90X21hcDsNCj4gKw0KPiArCQlpZiAoY29weV90b191c2Vy
KGlmcy0+aWZzX2lmc3UudGUxLCAmdGUxLCAgc2l6ZW9mKHRlMSkpKQ0KPiArCQkJcmV0dXJuIC1F
RkFVTFQ7DQo+ICsJCXJldHVybiAwOw0KPiArDQo+ICsJY2FzZSBJRl9JRkFDRV9FMToNCj4gKwlj
YXNlIElGX0lGQUNFX1QxOg0KPiArCQlpZiAoIWNhcGFibGUoQ0FQX05FVF9BRE1JTikpDQo+ICsJ
CQlyZXR1cm4gLUVQRVJNOw0KPiArDQo+ICsJCWlmIChuZXRkZXYtPmZsYWdzICYgSUZGX1VQKQ0K
PiArCQkJcmV0dXJuIC1FQlVTWTsNCj4gKw0KPiArCQlpZiAoY29weV9mcm9tX3VzZXIoJnRlMSwg
aWZzLT5pZnNfaWZzdS50ZTEsIHNpemVvZih0ZTEpKSkNCj4gKwkJCXJldHVybiAtRUZBVUxUOw0K
PiArDQo+ICsJCXJldHVybiBxbWNfaGRsY19zZXRfaWZhY2UocW1jX2hkbGMsIGlmcy0+dHlwZSwg
JnRlMSk7DQo+ICsNCj4gKwlkZWZhdWx0Og0KPiArCQlyZXR1cm4gaGRsY19pb2N0bChuZXRkZXYs
IGlmcyk7DQo+ICsJfQ0KPiArfQ0KPiArDQo+ICAgc3RhdGljIGludCBxbWNfaGRsY19vcGVuKHN0
cnVjdCBuZXRfZGV2aWNlICpuZXRkZXYpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgcW1jX2hkbGMgKnFt
Y19oZGxjID0gbmV0ZGV2X3RvX3FtY19oZGxjKG5ldGRldik7DQo+IEBAIC0zMjgsMTMgKzQ4NSwx
NCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG5ldF9kZXZpY2Vfb3BzIHFtY19oZGxjX25ldGRldl9v
cHMgPSB7DQo+ICAgCS5uZG9fb3BlbiAgICAgICA9IHFtY19oZGxjX29wZW4sDQo+ICAgCS5uZG9f
c3RvcCAgICAgICA9IHFtY19oZGxjX2Nsb3NlLA0KPiAgIAkubmRvX3N0YXJ0X3htaXQgPSBoZGxj
X3N0YXJ0X3htaXQsDQo+IC0JLm5kb19zaW9jd2FuZGV2CT0gaGRsY19pb2N0bCwNCj4gKwkubmRv
X3Npb2N3YW5kZXYgPSBxbWNfaGRsY19pb2N0bCwNCj4gICB9Ow0KPiAgIA0KPiAgIHN0YXRpYyBp
bnQgcW1jX2hkbGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gICB7DQo+
ICAgCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBwZGV2LT5kZXYub2Zfbm9kZTsNCj4gICAJc3Ry
dWN0IHFtY19oZGxjICpxbWNfaGRsYzsNCj4gKwlzdHJ1Y3QgcW1jX2NoYW5fdHNfaW5mbyB0c19p
bmZvOw0KPiAgIAlzdHJ1Y3QgcW1jX2NoYW5faW5mbyBpbmZvOw0KPiAgIAloZGxjX2RldmljZSAq
aGRsYzsNCj4gICAJaW50IHJldDsNCj4gQEAgLTM2NCw2ICs1MjIsMTUgQEAgc3RhdGljIGludCBx
bWNfaGRsY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgIAkJcmV0dXJu
IC1FSU5WQUw7DQo+ICAgCX0NCj4gICANCj4gKwlyZXQgPSBxbWNfY2hhbl9nZXRfdHNfaW5mbyhx
bWNfaGRsYy0+cW1jX2NoYW4sICZ0c19pbmZvKTsNCj4gKwlpZiAocmV0KSB7DQo+ICsJCWRldl9l
cnIocW1jX2hkbGMtPmRldiwgImdldCBRTUMgY2hhbm5lbCB0cyBpbmZvIGZhaWxlZCAlZFxuIiwg
cmV0KTsNCj4gKwkJcmV0dXJuIHJldDsNCj4gKwl9DQo+ICsJcmV0ID0gcW1jX2hkbGNfeGxhdGVf
dHNfaW5mbyhxbWNfaGRsYywgJnRzX2luZm8sICZxbWNfaGRsYy0+c2xvdF9tYXApOw0KPiArCWlm
IChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gICAJcW1jX2hkbGMtPm5ldGRldiA9IGFs
bG9jX2hkbGNkZXYocW1jX2hkbGMpOw0KPiAgIAlpZiAoIXFtY19oZGxjLT5uZXRkZXYpIHsNCj4g
ICAJCWRldl9lcnIocW1jX2hkbGMtPmRldiwgImZhaWxlZCB0byBhbGxvYyBoZGxjIGRldlxuIik7
DQo=
