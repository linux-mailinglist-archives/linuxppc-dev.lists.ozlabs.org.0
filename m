Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF1A773906
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 10:27:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=DAMhTTvX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKmWw0xxPz3cQq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 18:27:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=DAMhTTvX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::606; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20606.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKmVz6ZvLz2xFm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 18:26:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzKWuU7ewddT2fRd4fZt6+aZ5Ut+JFJT4vmstvJUrPw4uzJ7jrMviEyyV+tP5edA3kEJwxZ37yIoec60B2OwrSG883uCDx6J1nuOmrsTzHZ7bXVuotX6imtTr1LxPNBGNxUOFtrEbBg2JXxivxr8+0d7MdaJnctyDaLoI7cgu+djesxSrH6u8XBQP/Ie/s+u2TVbzNdyWF5DxaLpq8Acndwptn8EF3BXKqmeX99hGNvuCEX+p3bRgFy3J3M4fp3YRJjjETJnmeHpP8dL1JRpwqRn72NoyQIxdBbLX9MezE+w5Xx48rcJVAjzY2w4DjD5Zy9MLuQe+c5+wRhhk1sfgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWjf2SmyS4VeCInhyaZ5PHYVuC2GOQIpXUQktgQPmrI=;
 b=BIStGLEGGADrbg25SbluUH9GT1wK8V6ZIU+VgKi+NR9lR4981nyDwUbUrt6o+UYN5IIrVxb4mAYbkt8OaH9YoWKZMV+bqE8P7LWZ9gXWEULXWU0TGYyPXmaqj2jO0eSAWu+rXoAhTM/plv7Y399E+qmQ7mPgxcD/RRmPqFu4VHzVTpww5PRZ97hVSXaluxhGBG8hp7vAEZexlGeW8MHRbUUiEDotrLWp1/vQ7vgb3lvz0q11E49WLG2xrYhGGEXSa8VXoNNMI3IwBxLIOd+toSgDWf2hiw/4Pjuw1kbf8emFt60op2lIT4+2BOMdl1Ov69wbYQesYMK3jPzVEn3qPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWjf2SmyS4VeCInhyaZ5PHYVuC2GOQIpXUQktgQPmrI=;
 b=DAMhTTvXDVYoIhV2BYVTjIdG97D7pZ8eOTqxKpNyz9Va8XZQOk2IlGh11nEQL9zLjAdIBGa8jhLSW14+V/ACFc+RgshCRas36g8tZyR39p49/CiAjFtC/4pcmNZOAwGK7wLfRquOUkcPuS52BWU2gCyWOk57LcBQBl6uWuRJUf87ygRuc7ljZwIVLd27J+XcBsYZI0hN1c7IgRvexS7Wn1hvUq/A/0CLMwE4Gzhn7Zqz33sN0duoTbY0HMCJJ/9X0BfQUv6TbmOlx/+DDTKVdoyLhyAgwRqv86wXtB0mTra/p5Mp7LhnOsbk6w4op1BJRYYTgQwCjLLtr4HLTZ0gow==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2233.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 08:26:16 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 08:26:16 +0000
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
Subject: Re: [PATCH v2 26/28] ASoC: codecs: Add support for the framer codec
Thread-Topic: [PATCH v2 26/28] ASoC: codecs: Add support for the framer codec
Thread-Index: AQHZv9Jx+N6zVlph+UGCmOtoSxJyw6/gJFmA
Date: Tue, 8 Aug 2023 08:26:16 +0000
Message-ID: <a1b5120b-feb0-5c87-0605-e1e170d9268d@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-27-herve.codina@bootlin.com>
In-Reply-To: <20230726150225.483464-27-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2233:EE_
x-ms-office365-filtering-correlation-id: 9c4e8eff-8797-4741-d767-08db97e9223e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  0SjxXFOfK9VCylBtb0ti4U914/PROAMNLM18VKPMgIgTDm9LcgtVx4dW+qu+rFChUiImw6Hy21DNFxUj27psWpJOt/6gxvA61aSoO0ZpvYD28IB/jFNdROPcFhuQJ3nkY9nCygjyu+lbq2cBq3wiNJ1I1vc2F0LmEZbi+5VYA3DCyCR3eMEGQqLZJKj5KaA0fa+c9VRZDnMbHh4gdbkFdBfdi/R5QiCA7zrb1UQYL86dIJpOqXox6J1MgNpu0JynqlKkCNC4L/4EPsX1D8mKm8yyYZn6BGnt8cxkAZQuDj+UrDeAlURxNyEDv2MFbKMVRuqFLt0ZUbdcyQk/gO3xcNE7BZ7ANhpidYQyuQXasUPLDi/JE6muIGk/KW9SjtJ9L5vMJ+3yuyJLQuX/TThcxu2WzKthbQgwxS85/R7r7EGpAsIj9TxRpVq7lDNbAcyjAv0tvSGxXJ//7QkKxFzlhBjJ+5hsEyB0fJS+xtsjRuHVt7BgPXQGRf8LcEBkVP9sGi7u/nfXjE4LxT911hfm8YiDu7ULajvan5GGrVVZf4XcQ/Mpoob8tydaHEk2qHRjg2QNc2NW38RWnXYFv0YpVGAnywyMq01hrgfs52sW+S6OlAZJsbV6jpw+JCvWG5uKF1fdZi2+nbjN5raPNlgLFAuugOUzJDM2xUawDCOYzlvfMI+89H3E5awwC9UxIWz0s7t4mdRyjr/IFxJSglkLVD9TtokgMOduriW6jhNpkAiXOX1IpqdKsd+H1sIgFTeF
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(136003)(39850400004)(376002)(90021799007)(186006)(1800799003)(451199021)(90011799007)(2616005)(921005)(122000001)(478600001)(31686004)(83380400001)(6486002)(6512007)(6506007)(26005)(66446008)(66556008)(66476007)(64756008)(41300700001)(8936002)(316002)(8676002)(76116006)(31696002)(4326008)(2906002)(66946007)(71200400001)(36756003)(54906003)(110136005)(38100700002)(44832011)(91956017)(86362001)(5660300002)(7416002)(38070700005)(7406005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MktPbWo0Vk5SOGc3ZGNUdFVLM1U5aTduMG5oREpPMUdDU1dMVTgyblVZNGd6?=
 =?utf-8?B?b0xocG4wZjR5TGF6ZDFCUXJEdUhjNGx0ZDdHSERiWDV3WkdDa1k3VjZZVUVv?=
 =?utf-8?B?ZTc1ZmIxQXgveVdlaGMzWHR2YlFxeXBnVDJpS3k0WFFvUTMrQURnRktybDlN?=
 =?utf-8?B?VFRvKzVYNG9jZFlQSWhtU1pwaGFvcVdlTUtJa080eFhNeGFndEFxdGlLSURs?=
 =?utf-8?B?ZllKZWhPNVFrSXd4eVJCNDJrbWJCMVcyTExmUHA0QkRlcUI1T2JOejZZektH?=
 =?utf-8?B?R1hMMFlrT0l6bFdRM0JkcEVDOGxqR1pUbjNMNzU5Z21QYmNDV0xGanVIYXVu?=
 =?utf-8?B?VXRTWW5XSjFOK29QM0QzNm0yZldJckZhc2JmL3hWU1lYVGxycmxPeFdtOUxu?=
 =?utf-8?B?K3d5Ynd6bDV5U2tBNmhyalNiVVZIUWh2MHdyV05OZ1NYM2l1R0UxVFYrbW5y?=
 =?utf-8?B?YWJ0Smg4dzAxVWJVdFJDYml3Ry83clc3UFZsNWpZN0ZpdStCUTlRU0NZUWYr?=
 =?utf-8?B?Q0NtMGlGYXRHcTE5bU1YVFY0Qm1POVl4YTJ6RFk2eHZsRUw5Q1lpei9oVmFa?=
 =?utf-8?B?VlRYZWJXaGQ0SVRkc0xUUW9nQS8wbUlyUEFMOUFpRld6ZlQrZE1xdE81TVg1?=
 =?utf-8?B?MGRRMEFHdWNBdUJ1azZJVk1YOU5RcFhnWU5keTdNMXBZSjc0Vk16NTNDYzMw?=
 =?utf-8?B?UXUzRGttUklTWEFLOFRQNHRXckk4SUIzOEY0QmJKQm0xMzk1SnFMQ1Fud2wx?=
 =?utf-8?B?YVNma3dwZytiOU9ZNE5HUUhOdlZuV25RdGpWRldDUVJkSHVsSGNMWERFZSt2?=
 =?utf-8?B?K2hpRWUwQXg4QzR2Y1I1aG4rdnNEMlQ2YlZCWlk3eWRscmRUazB4ajlZb3I5?=
 =?utf-8?B?cXFTVU1UeHJjYzRneC83M0ppSExwVVBFbXlzWG5JZDlBSTNHOWJoYURQS3Z2?=
 =?utf-8?B?ZFV3OGErSlhRc2tsQ1ZTd0F3MW03UitLYzJHUXN1a0w5amIwY3JOYjdBU1VF?=
 =?utf-8?B?M3M3cE85Y2tqaUlEN3NORnRNY2lKVDdlUDAxNTcxQjVKVkpqTTBwb0pBb3pQ?=
 =?utf-8?B?Tks5SjJLN0toaCt6Sm5FRnUrOHJvaGw5U0JDSDFwV3FsT3hDd0tQcFY5aGxV?=
 =?utf-8?B?WHJrZ1dRanlnbG14TVJhaGZjckhtMmg1ZFdWaVdBZXVHSk1lZDNIeElab2Q4?=
 =?utf-8?B?dmo4TzR3MmloVU9DNDhTSVlGTVFraGRhTFVPOFhHendXaDJOL3E1VDRLTHJG?=
 =?utf-8?B?Y3IzOUZUVnZpNW5INlAvTXNtTXF3Q2N2RkpuVWxzdVBNdnphNUxxc2J2VWJ6?=
 =?utf-8?B?T25IaVR0bTlPWExPNVpQUUxJTVhjdlFQQWgxdHdRZHNieXRhRWE3cFlXbC9B?=
 =?utf-8?B?cjROK0VRYTFqNHNGazVXbFZ4TDZZVCtjK3pWcUdSZVVlYXZ6d2QwQXFmMEtW?=
 =?utf-8?B?cHYzaFJsME40U3FHcTdUMkRUR2ViWm9CT3pQSm1xd1BaRXhKc2hBRGdUOWlX?=
 =?utf-8?B?eSsxVkhDSVEwb3ZhVkM0U0J0N0FEOE1MazZ6NVNFOG9adXlWWjNDTyt5aEQw?=
 =?utf-8?B?YWI4SlhuOHZiL3I4RXpoeTZWQVIrYWJ4TlhSQzROT2ViNytqS0w0VEhobmM0?=
 =?utf-8?B?ZVdLWUpuSVRnOFVkT2g3OHdZZTNGeXY3cEpIbkJjMlF5ZnpsT2JPNWc3T2lV?=
 =?utf-8?B?cS9ncjVnUmdJL1ZsNGJsZGVQcDdEUWhqNkZMTlpqMEg0UUVIUlptamE2enpG?=
 =?utf-8?B?bHNUWUtaRkh6ZG9LaTlyYzlDejZ0eTJzYi8zcmZ6TVN3VXhNKzRHV2hZQ0h1?=
 =?utf-8?B?WURWTHB2MGtpRC9USGsvaWFsVGtnbGhkb0tpQmhxc2dwQWJwQkpMd01SUVBo?=
 =?utf-8?B?WDZkSFlaVTFCaC9vUVhrUGltV21LeGt3eDFxNlNzeVR6NTUzaCtuMndiR1Vs?=
 =?utf-8?B?eVY0SWdTYzFTcGhZSS9SYVF1WUJTYVNFL2o4TGh1bm9IY3EycDEydGVneVYz?=
 =?utf-8?B?U0R6R250YkdVZ1cyaUFNajNia21mUVFNUGVWTnJBNFJzTDhzc3B0cjJXdzRv?=
 =?utf-8?B?SFR6b0VOZWh6MHpKUUMrOHpFVlYrSWppM0lJN3lWY0VMTVlMdEVaY2ZxTWpF?=
 =?utf-8?Q?+DMv6oagg7AprsLbYt5h1XsYe?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E218A5E19BD694BBAC4E01645BB2A89@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4e8eff-8797-4741-d767-08db97e9223e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 08:26:16.0298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: viP9U7pi3zGJyuNiJStfTqFTdWvOIKXCUC6Ov2OycAcIfTRaRM0pP6d+xpjCSxwoYOFspodXn9swcPocH0X4o9/IwOB2o9bAOB6YRwXQCD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2233
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

DQoNCkxlIDI2LzA3LzIwMjMgw6AgMTc6MDIsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBU
aGUgZnJhbWVyIGNvZGVjIGludGVycmFjdHMgd2l0aCBhIGZyYW1lci4NCj4gSXQgYWxsb3dzIHRv
IHVzZSBzb21lIG9mIHRoZSBmcmFtZXIgdGltZXNsb3RzIGFzIGF1ZGlvIGNoYW5uZWxzIHRvDQo+
IHRyYW5zcG9ydCBhdWRpbyBkYXRhIG92ZXIgdGhlIGZyYW1lciBFMS9UMS9KMSBsaW5lcy4NCj4g
SXQgYWxzbyByZXBvcnRzIGxpbmUgY2FycmllciBkZXRlY3Rpb24gZXZlbnRzIHRocm91Z2ggdGhl
IEFMU0EgamFjaw0KPiBkZXRlY3Rpb24gZmVhdHVyZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhl
cnZlIENvZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hy
aXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQpTZWUgYmVsb3cN
Cg0KPiArc3RhdGljIGludCBmcmFtZXJfZGFpX2h3X3J1bGVfY2hhbm5lbHNfYnlfZm9ybWF0KHN0
cnVjdCBzbmRfc29jX2RhaSAqZGFpLA0KPiArCQkJCQkJIHN0cnVjdCBzbmRfcGNtX2h3X3BhcmFt
cyAqcGFyYW1zLA0KPiArCQkJCQkJIHVuc2lnbmVkIGludCBuYl90cykNCj4gK3sNCj4gKwlzdHJ1
Y3Qgc25kX2ludGVydmFsICpjID0gaHdfcGFyYW1faW50ZXJ2YWwocGFyYW1zLCBTTkRSVl9QQ01f
SFdfUEFSQU1fQ0hBTk5FTFMpOw0KPiArCXNuZF9wY21fZm9ybWF0X3QgZm9ybWF0ID0gcGFyYW1z
X2Zvcm1hdChwYXJhbXMpOw0KPiArCXN0cnVjdCBzbmRfaW50ZXJ2YWwgY2ggPSB7MH07DQo+ICsN
Cj4gKwlzd2l0Y2ggKHNuZF9wY21fZm9ybWF0X3BoeXNpY2FsX3dpZHRoKGZvcm1hdCkpIHsNCj4g
KwljYXNlIDg6DQo+ICsJCWNoLm1heCA9IG5iX3RzOw0KPiArCQlicmVhazsNCj4gKwljYXNlIDE2
Og0KPiArCQljaC5tYXggPSBuYl90cyAvIDI7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgMzI6DQo+
ICsJCWNoLm1heCA9IG5iX3RzIC8gNDsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSA2NDoNCj4gKwkJ
Y2gubWF4ID0gbmJfdHMgLyA4Ow0KPiArCQlicmVhazsNCj4gKwlkZWZhdWx0Og0KPiArCQlkZXZf
ZXJyKGRhaS0+ZGV2LCAiZm9ybWF0IHBoeXNpY2FsIHdpZHRoICV1IG5vdCBzdXBwb3J0ZWRcbiIs
DQo+ICsJCQlzbmRfcGNtX2Zvcm1hdF9waHlzaWNhbF93aWR0aChmb3JtYXQpKTsNCj4gKwkJcmV0
dXJuIC1FSU5WQUw7DQo+ICsJfQ0KDQpXaGF0IGFib3V0DQoNCgl3aWR0aCA9IHNuZF9wY21fZm9y
bWF0X3BoeXNpY2FsX3dpZHRoKGZvcm1hdCk7DQoNCglpZiAod2lkdGggPT0gOCB8fCB3aWR0aCA9
PSAxNiB8fCB3aWR0aCA9PSAzMiB8fCB3aWR0aCA9PSA2NCkgew0KCQljaC5tYXggPSBuYl90cyAq
IDggLyB3aWR0aDsNCgl9IGVsc2Ugew0KCQlkZXZfZXJyKGRhaS0+ZGV2LCAiZm9ybWF0IHBoeXNp
Y2FsIHdpZHRoICV1IG5vdCBzdXBwb3J0ZWRcbiIsIHdpZHRoKTsNCgkJcmV0dXJuIC1FSU5WQUw7
DQoJfQ0KDQo=
