Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FC07738CD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 10:03:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=lcvfBGSp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKm0s1SVrz3c5k
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 18:03:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=lcvfBGSp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61f; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKlzv39xfz2yjj
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 18:03:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5TFc4c0nMjSvJQqee02D425bPFwX3IAHXUQX7B4dlcC6JLkIEZefSv/S2B0yFEGm52MeYghUTjtrhZhApxF6C1gz2tObfe19uxCS4C0s0+4GcqaVxgKyPHcxhaob8HnI8dWeBM4Ep6TkeDCPLqlGgUO96vOkZoLDo4xL+tlp9KiUN87hn+9ivskSxBwpZ/7GDdUPhAZFnjNqedYUc2Q/+8fwENyP8cujd5wtjMdR6PuucnNeMJ58Fwps8ZJTr54FayWe2JzH5PBKdZuVqRdwGcaPcfn/bJwh+bDI5V+3gE3oEZsQjd0qFv0a2X2DytzUJhkNXc/S2VStLR+bp5MNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEg0vpSaqg4odkNA2xuO84Ta66x8OGNSUmS+ICrCKbk=;
 b=OwlpTkvpHmHvjYsi76kNCikYx40+HFJOUHNVzsyA4A2yzXtZwuexVEcV/lGYCuJSvAwddkfw+spENmr8QhDglkcUBypJvOdqUQlXZunwTbOKjnwuZyTcI5/kinLe6Q/AAwMnXFaU+JnNM+Ro70xke+1khuYszJdHUI+dEMC2Ei1c2nMJ7fggB7DEsThpSI1YHo+kVsMjSsoX9Pf6Z/o1kkh7+jBu5bE+I/eHi3H8XBB0O8hj5Ih/siIrxwXg9JR7XWI6ZFkk87CMklKqbZacYh5JgrG5pBVtkOP1CuP2ermpB+6fBWII5ZpRW8ASPjnD86UnX98JN1H8KZgChQSH5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEg0vpSaqg4odkNA2xuO84Ta66x8OGNSUmS+ICrCKbk=;
 b=lcvfBGSpeV1bTzR4WmbyyQ+hFBx76BK/d+cLuEr34fQVC5fd/S/AIGbxTlir1Gp+v/FgKBRcUYIZAr4wt3ITZHYWSDSWjqoQ5Vlr2QXLEgwDY6pjRm3CV/xthnuCjkILPmPdhJN+Od2T6MzRb4xf9QEh32rC1lRz2toMOXL9IKQb3HUGw01gtH2FFPwwP09ZBMHHfQL1iGQatxhYWlzBZYFE6CWINdr5Evk9drD3GXrqaV4ABt6MaXWyK1QWuJ4ilOICieYuOgvysothgW5432aIgrkkvst13gZibPOHqtKquDgSVHVWMNv48jlm8y3ttbS0MSpkW7PPPIyzDpoI6g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3291.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:145::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 08:02:46 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 08:02:46 +0000
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
Subject: Re: [PATCH v2 06/28] net: wan: Add support for QMC HDLC
Thread-Topic: [PATCH v2 06/28] net: wan: Add support for QMC HDLC
Thread-Index: AQHZv9JEUyQ5iyCDNEeCyxTyaUOJ5K/gHcoA
Date: Tue, 8 Aug 2023 08:02:46 +0000
Message-ID: <a81edd8d-3b0c-4945-50c4-c299109de3a2@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-7-herve.codina@bootlin.com>
In-Reply-To: <20230726150225.483464-7-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3291:EE_
x-ms-office365-filtering-correlation-id: 27b04f50-8b5f-40c3-f540-08db97e5da28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Yo7l/Gyu1OO3UsxBV9cyB2pi3S3FFJ+8B6EqHFpjsXEkJxNPPwM5VlGs9GSrCnwiiC/zyN5ThQpB3vAhM6MAoBUjxfEnesApJwCxHwDGjosQcgRImJKqkucEVoF+LZEnHASLwGa+zcBwUN8PCRPhfMexSa+FoNwa91fbO6LdKWAlwB2VnV/y1MidzlH/gAPOHV2rLpQNamh7KqgCDiB90yiUTv6plnyDn4vY1KbaDMic4unJfNmQ9oJLyZolKH9NsIpzOK9Y0PzbgUjTg1nXADrmwMBPS1WkE2Y+SgPCGjZbNNtuvOWOANdl3Ql+hIos02QjJG9H4qL36rF3SPbUKNYEiApwZDsVrVJyREj2brVjUPf6FTJzU45OStOZ6ZosCZqZR43KkZhKQScc0Sm9Jdt8KaYXZSvePLPaxcQL83dtUFWeAp8SnEu5St8FXlhYqfIgd/vkfUufms12ZZDWkAVSk1BGKlYx4S+nk0zoY8hN74MK83eckeclJS6nkJwCVmYbGpMql8fe03OiwNcLatoTM1uDfwjMFRaUnvtVgGcvO2SmbA/QpRl7KCUHSO0rPTckP66YzHDMMkvNhvUuvxX9JS/Z7pX8W3g6aW6+8v7vh1j6kkddOMWGg7COGFusyudUnVbTDovb5xN1DPEXI8DbXp6TKP0PqZUAQLpUS/aHs3UQd0NIAm0jAxvd0hkl0y+2IKA+lJKi7VCWqB6O3pH9hooKGVg6CZVonMUEzyMfbNtT1DeurmaMY7qwS7PhIDJchMvwPrF8lOFfiBclqw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(39850400004)(346002)(396003)(136003)(1800799003)(90021799007)(186006)(451199021)(90011799007)(31686004)(478600001)(122000001)(921005)(6512007)(86362001)(6486002)(26005)(6506007)(66946007)(66556008)(66476007)(66446008)(64756008)(91956017)(76116006)(4326008)(71200400001)(110136005)(38100700002)(54906003)(2616005)(316002)(41300700001)(2906002)(4744005)(36756003)(38070700005)(44832011)(7406005)(7416002)(5660300002)(8936002)(8676002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WGt6QzhvQzNQS3crYnRpVDBVajRvM1FJZHlOeVdkMnJyeWU1dStwT0NTR0Zv?=
 =?utf-8?B?c0EyTDZhY2lWNEhPK1RvbGJYNGhnd3k5UnZFcEFGWXR6K3NZRHhUeGVjNkI2?=
 =?utf-8?B?Ym9idndmNFY3YnNpdVhSZGZnb2VjSDZwTlhDd1BPOHAwblJLRDlHTFd1eVZL?=
 =?utf-8?B?Z2hSUm05eE5tMjRnVU1oUHdaUHE1Y3loYlFlalNpb3NMcnovbyt1WVZKUXJ2?=
 =?utf-8?B?SHh0N0RtODJqUTQ3NDlHR2JHdC9ubVcxQWtBa0IzV2NtZ2w5azN1V29RbURF?=
 =?utf-8?B?azR2RndiN3lsZXZtcGthOVdvbm5mUFVkUGI4RWhwK255eEFrYUZRSkdjRFc3?=
 =?utf-8?B?ZUh0cUdtNXJPQW4yS2hBVVVsU3V0YjhGZzVkbzBBNkFHRjhvVXNVaUFYNzhG?=
 =?utf-8?B?QWoxZG5VOExXNU9xckdpcmFGYzhYOFhTaFR6QzgzV1BTeEoxazROTnFSQlRX?=
 =?utf-8?B?YXNCckQ2UHNabXd1VzMzYzJXZlpmL1lXRnpNK3NYRWVxSk8yZGR1aTM0SE9X?=
 =?utf-8?B?K3BPc1hNMXB2NnlzZGc3Nm9JWmY2akJialkvbHdxcncxTHpWSnRpZTA5YkdT?=
 =?utf-8?B?SFBjMklwU0RVWG5mck0rWGR1OCtuOXoyRzVSb1FSZVp0OSsya0d0aXhNbUtC?=
 =?utf-8?B?L2ZPKzhsWEhMS3VnMFBiUE5nRTlOZ2xSUDlldG80Uis2d0lQN2hqZndlaFJ2?=
 =?utf-8?B?YnNpaWRnajAvdzE3MmlUVEcwelh1MVNwR1d2WjJXRHBGYkkxenFIeXRCZVBL?=
 =?utf-8?B?MzQ5WGRKMTBPdXdqeG9kT01IeGQwQlhRaG50dGsrcUpRbi9uamExMEJtNDhl?=
 =?utf-8?B?bWZJS0NnZ0VhTU8zRXBCM2lmb0FpdkViTjN0L2RacnppR2FhZ2doL0tld2hy?=
 =?utf-8?B?c3VlbFdvVXRHRUI2S1ozZVkxVHNRRzZKT0hhclpYMmZkQUZCbU1mWXFmZnNk?=
 =?utf-8?B?c0lBaXpxb2Zmai93Y1pEelZUNlFjNzVYNStXZ3NlcnFId1lOR2FBeFFxL1Va?=
 =?utf-8?B?UGsyY3FzczUxNWMxaTBIUDREaVB0REFWQnM0ZnJiYk5VWFZyWm5Pc1FZNUhh?=
 =?utf-8?B?MGw1bzdPaWZIMGFNaThNaGRKRlZRL3ZMNTQyZHl2MEJjcVJ4cXpucHIxYUJO?=
 =?utf-8?B?dmxQU0FyK2FVSjVPaTRBSGpqZkpnODlnamJoS1k0aWpEdkNNYkJNV3BXRUYw?=
 =?utf-8?B?T1NGcmJKazk2YXBQMXV3d3NraFBNRjE5MlFud2ZlRmRKRWdnTDV1emxGdmR6?=
 =?utf-8?B?ZE1DNVVNQUVxcDlDTmJSUlJVQmZoR1ZGKzBaTnlqRU85YTc5eTdxNk1LMW9I?=
 =?utf-8?B?eXVnS3J5UzhNUjNKUVh0UzdwclJOR3lTbno4RlhTWWFGR2ZWbGtYTWlnNDNQ?=
 =?utf-8?B?K3dVZGR0cFgwUGE5NUp4bGl5cllPYmtTUXNyVGZUa2JwNUo4cmpwQ3BMYjVn?=
 =?utf-8?B?TlEzdUdCN29abG9XK09ObFJQR0lVU254THMxOVpuMElHSVJlU3QzNENDOXp2?=
 =?utf-8?B?L3Yzeis0Q1BETXhmZ05QRmpFWU5rWTVGKzJ2SWRUMms0azhiamlnTVM2TXZs?=
 =?utf-8?B?VEE0OHJidWNzNEJhOXNTL2IxS1JydzBBb3VGaFYrZjFyU28wbG1hQ3F0KzdU?=
 =?utf-8?B?QU90NDJUc2JRaVc3SFpoR1BYaDhXUXFjQ29FdW5mK0Y3TkhXT0hpcTYwVmpn?=
 =?utf-8?B?QUh2R3pLSHpmeFduM0pkNzBBOU1FaFFwZFhGWWYwOTFnWGNFaVpwekxBLzFV?=
 =?utf-8?B?d08wWkNOSHUvQW1FZjlKM3NVZWd0dnRYVjVFa3pFVGJMTUNJSDd2Nm0rbFht?=
 =?utf-8?B?SWJ3L0lvTE1QaGhyL011KzJTV0ZyZlh6S1VtS0VPcnJpVmdWVzFSNUdjTGVC?=
 =?utf-8?B?TzBjL3pXOHVhWE9MQjBLTFVBRGdvYTc5RENTSzVOaWxGNVV3QVBxQk1iei8x?=
 =?utf-8?B?ZHZxZ05RNWh2dkMybzBFSng2YzY3WTkrVjFiZHBtVWF5cTcvVDVPOWJsYnFl?=
 =?utf-8?B?VUIyTHgya0xSV05YNUIwalVOU3N0NTNGcDJBR2xqOVlPWnN4T0xUVlBXUkNq?=
 =?utf-8?B?U1RYdngyWER3UUx6RXhFTnkreUNqb0NQUEVrcVpNV1p0dTd1djJGa1FIbmFo?=
 =?utf-8?B?NGhsMGRnSmVsTldabUd6akpSeWZueHJkeUdlWjBrNFVCVHdVUmwrZVRPTGhz?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8317301DFECB54896D5361F5F561E92@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b04f50-8b5f-40c3-f540-08db97e5da28
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 08:02:46.6406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5I72VPAUpLvx4ONAg7neM7aa9FC56qZLJbw4kB9JM3iQBUgs7MGc7UlT12zryxa0bCuu659hcRlNheGOrQ0Tvco51ktsxR3s2v0fa9jnlP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3291
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
aGUgUU1DIEhETEMgZHJpdmVyIHByb3ZpZGVzIHN1cHBvcnQgZm9yIEhETEMgdXNpbmcgdGhlIFFN
QyAoUVVJQ0MNCj4gTXVsdGljaGFubmVsIENvbnRyb2xsZXIpIHRvIHRyYW5zZmVyIHRoZSBIRExD
IGRhdGEuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBi
b290bGluLmNvbT4NCg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3Bo
ZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93YW4vZnNs
X3FtY19oZGxjLmMgYi9kcml2ZXJzL25ldC93YW4vZnNsX3FtY19oZGxjLmMNCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi5iNGViYWU5NjNkMzkNCj4gLS0tIC9k
ZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL25ldC93YW4vZnNsX3FtY19oZGxjLmMNCg0KPiArDQo+
ICtzdGF0aWMgaW5saW5lIHN0cnVjdCBxbWNfaGRsYyAqbmV0ZGV2X3RvX3FtY19oZGxjKHN0cnVj
dCBuZXRfZGV2aWNlICpuZXRkZXYpDQo+ICt7DQo+ICsJcmV0dXJuIChzdHJ1Y3QgcW1jX2hkbGMg
KilkZXZfdG9faGRsYyhuZXRkZXYpLT5wcml2Ow0KDQotPnByaXYgaXMgdm9pZCogc28gbm8gY2Fz
dCBzaG91bGQgYmUgbmVjZXNzYXJ5Lg0KDQo=
