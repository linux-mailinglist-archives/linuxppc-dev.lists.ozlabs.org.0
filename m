Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9449773900
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 10:17:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=mdGuvWLZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKmK03TZsz3dWN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 18:17:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=mdGuvWLZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::619; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKmDC4kT1z3dBX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 18:13:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZaAkn0JRScEtDqli5Ah/m/hpU7osRpI+V2HB4ReXYzonXJoIlOzv0Doz8DKCslooPWCelvXmvz6e/Ua+R3Xe8402s6RAZvnRAheDFVIIW1OjNxIPnhRPg/jzhzkRWVnr5kn48YY+GqNGPLlKVxOyAajG3CKr9CKIztCYI3z+qMuRlT14hAT2DksSqnKmHIwO5CIPg49NFYlJwx3ZQF25CoLExFMp8fn0SEM5JudD8oqG1jI9DJs2IeYzO5Q9VdiHgC2ieO80ZbipIAso4vK3nRVCeLVpZLWwvaplWqnvN2inMRgz/zX2ix3SHZ4c6OUoiSD+HJ+iWfD5aO8m2OMHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvLjNxbZa/g1+6QiWhSRpdLXLqOdPgHgA0FTpD5hZSc=;
 b=TmezaLEWVw3MAwIatDUGeRVJvRiFxoyRa7ZBlh9lT0H/yUzEmwqiHLvkpMoYKWzlZLGVFLBM1Blhm7zu2R8flgmVu5ixJcbwAbFcQcGuiwEDiYHnHdOq2kmcMScXk4LZkg91I19HcLXWxnPbCIZBgGqOm6gIHaYlj9Y6K+yQlIC6fjZrvTsnhF/jKgl+tQW3+dqS5v/a8DTijFofrQsFntBdh2y7a2l7ouh4e3zmjB7oRr2dsqbMo77N79pS5DpLPLAURuwqrz9a/1rRfPiDaRkLPR7C/nXJcEj9s5E4rW6A1UV7pUmYbH8LXPwE+VSAOPwcducKrWNvaBFoIc0yRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvLjNxbZa/g1+6QiWhSRpdLXLqOdPgHgA0FTpD5hZSc=;
 b=mdGuvWLZCHRf6bnTv9X+RCHgo54/n9dtY4RILTkGMri/keh+IvTvuHG6d63SPzFCJ7Mw4ImUQ2JL4y5TTf6a1+eWNGjokj9yD8XMRZ+bc/9rtFLK+R1lZHsLXJXwN49wISWpfxL/CkLr36urNkhj3iXmfeQ6+sXG9zpyWVsQNcanQS2k3Hdd2yejZKeQ2nmPUQLiXIgdbTV2QkSPyMn8VsHmfVh5GhPTb2LYqtUROmJh5xU0m0eeD2ovuCQvUbF3nzN3B3gLku6+hxWwNY9JTKqP2oVCS1e6ti5QY9v8F1GLGQJchvIJnF/WSy21bQlKfqvcNa0U2EfkkMGg1aRngw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3396.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:21::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 08:13:27 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 08:13:27 +0000
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
Subject: Re: [PATCH v2 22/28] mfd: core: Ensure disabled devices are skiped
 without aborting
Thread-Topic: [PATCH v2 22/28] mfd: core: Ensure disabled devices are skiped
 without aborting
Thread-Index: AQHZv9Jo1/EbRm0k7Uq4zOCd0hCY16/gIMWA
Date: Tue, 8 Aug 2023 08:13:27 +0000
Message-ID: <651ad095-8753-762e-d3f0-aec74c5794c2@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-23-herve.codina@bootlin.com>
In-Reply-To: <20230726150225.483464-23-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3396:EE_
x-ms-office365-filtering-correlation-id: 4c0e46f1-60b8-4132-44f1-08db97e75849
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  wCi7U2CKxigbF0d0B2PBN8E4PPfZjTXRXgj/L29b9SWPzCYhTwVk3n5tDs6dGQUdc0bFplSmawd4G4gjnHBdP2v0DCIbJAqvEgQfKGWDBTKlb53T9+ApJU1Qvz5SmYdFBY8g7l8Uxx6NI2Q2iZagbMiJ49ey5ZpkO88ORAXsXQH2bOF5zKEbag1btjv9gg67dfZzG5lcT7T29Qf89/8WmSdDWCS2SUwi/9kGuwSQwbhaabeifzR1Er+6e5/5FMjmsn/geeAbgtGIMmQfLW+p9DnDiomUGG9MIDnZoif0ljvTfnceLI4aRCqhrFzCxqh0riaRMdB1n3y2kKB/Tx+tvZDNbCHQ4Q3h6mFRI3vsqJ1Jyxez8qpObY6pxPlYBFZIsTNugfgLD+YdJlTJmlGO8B2n7Fwnu91Jn3Ny1H5pC+zLHp3JDwkQi3Cr3LwC1CJTG2MvNZ6EQ7TyLi2kqRUnWRRlReouyyZ0i1691wvkesezQ1H/vmsoaw/OPROSPFdJOCdeGWo2zc5DJPEa/aLTZ/8b0y3699b1AOYexYzv0q1CNvqPg2sIo/LeBU0dyNGe/W3bXGEm+0X96yjRFkTFWWFhctpuPTliHYe0lQyKWEAz6mlbI4E9PUvwcXNHTxd4yhvkA5lzOtlyb3UeiONtwto2grSaL+disi233xdZVB8YqSgP872jLAb9QJ9nepr0iG9SxDNrVdKD8kr4sDdt87T/Eeq3Af/20qIxqE8RQr1hztw35XMyXBFpSDc/xyRlrHGeph28eCUyhU07GE658Q==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(136003)(39850400004)(396003)(366004)(90021799007)(1800799003)(186006)(451199021)(90011799007)(38070700005)(66574015)(41300700001)(26005)(2906002)(31686004)(44832011)(83380400001)(5660300002)(7406005)(7416002)(8936002)(8676002)(2616005)(478600001)(316002)(921005)(31696002)(110136005)(91956017)(54906003)(76116006)(6506007)(6486002)(66476007)(64756008)(66446008)(66556008)(38100700002)(71200400001)(66946007)(86362001)(122000001)(6512007)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?clJxNE1zMSt4RGVLQWFMMm9ubmVMQlg0TG10NkRqbTl5YVM0dkhYNDZYeXZ0?=
 =?utf-8?B?MlFvZEtuR3ViZEVmYityRVN5K0QxeWxZMm1yNXkyNXlTNXBqbmZleEZnTGJO?=
 =?utf-8?B?Qm1EbFRWYkdDcjJPTGJRTEZLSmRMSitvdkw5V21mYVJncHNTSXdraXpNUDgx?=
 =?utf-8?B?Vjg0aUx1NEVPejQ2VFlOckdmRWRlRXFwTW9JNzNNNEp0L21ERlRudEVuSXZv?=
 =?utf-8?B?OWk3NDlwVkdWSUgxbmFNVW5ZSTltZk14OEUwNUxFYUVDM0wybWtZSmd3Tm5Q?=
 =?utf-8?B?cHlNbSs0UUlpQ25GVURjOTlURnhmRkFEamkzK2RjM3luakNwYU53ekFuSGFM?=
 =?utf-8?B?Vk5MWWl4cHpkekYwdTN2dXVOMnl5ajdFbkVSL01IQkJFK0VRK0IyQTdLSFhm?=
 =?utf-8?B?dElZN0tPOEp0UnBvZHFhK1RBSHBBVmxRZ1dmRjNLOWE3b0FJS0hWV0VLcVo2?=
 =?utf-8?B?TGZvbWpZSUhnRmxFN0RkWk9HQXNINngyYmVMaEdmN000TXNOZFlDMnJ5VHVu?=
 =?utf-8?B?RFpBTzFMelFoSENNMTVBRDB0NElXSHJiZEYxQXVoakJPQm1kMDZwcTNyR05o?=
 =?utf-8?B?TEx3SkxvK0x3cUhxRUk4a3ZHYXZxeFJwL0lEc2ltdXl1bHBCMTdvbXFCQkdB?=
 =?utf-8?B?ZExHc1hvZGkvR051UlE0cXY2S1ZyMHI1OTkyOVR0ZDVMY0ZCOVZCOHlQTC9O?=
 =?utf-8?B?Wi9LSFRMcytRNXc2R2VwcW5Ieml4RjVNSHpBNXgxb3ZxbzhTSnBWaHlQY3lY?=
 =?utf-8?B?S3ZXaGZSV2dkKzcvL0xJNlRyKzFsaGd0cUpCcFlYSUxxN1dBTFZvZ2draHJD?=
 =?utf-8?B?ZTgyU3JRVG5pcjdnd3Z4cTNiTnl3UkswaGpYdEt6eUYxTFoxdE1uNE9ON1g0?=
 =?utf-8?B?L2JIZSs0bXY5Qk9LYmFPVERyaXJEdnhnSFkvVHhjcU9RYVNvTEVycTR6Mlhr?=
 =?utf-8?B?dnRhNmdWMnlXcFAvZHc5Zk9NSDNQTGZUNVR5Z09qY21mZnY3Qm9MVVM3UFZN?=
 =?utf-8?B?UUE3b1VoWEVhSUtETFVQeEh1bTUrNHJyRFJLamUrbktDb0Vad1YyM1RTMUdG?=
 =?utf-8?B?MEFEd1FlbmVsMHF5UXVucGNZN2ZxWDA0Q1A3eThUSmFTbEsyazU3Yk1tUEVH?=
 =?utf-8?B?MVRFMGV3UUs1TWhzVjF0bWptSkxHaHhiUm9aUEhZTGpkQkx3YXR6V2s4eDM0?=
 =?utf-8?B?ODVtditoNml0K1BKelZtRXhYNms5U1E1S1ZYZmFoc3pJeml2dnhEQzFvQUxv?=
 =?utf-8?B?NmlpWVIzZThHR3RydVdxT1dRYmFDVFRSREIzQ3J1a0xOY05RSDhOVDBFckc4?=
 =?utf-8?B?N0VrOWZJTC9xSU5JSElOWk9ZS2I1UllhZjFCSG5SRnNIQWZKdVhGUTlNUCs5?=
 =?utf-8?B?RlpFREh2NmdldEtNOTcwRDNKbjhlcEZ2bzNoajE1QlA0UlQ1THkwRGZLdmFz?=
 =?utf-8?B?RTZ5akk3Nm5OSDMvYUdGaXBROW90UWIvWTlKZE1DZERYTUllTE5wUUMwL3I4?=
 =?utf-8?B?SHAxeFo4S3l1TFNmS0gvZnJjUjVrOElKMDlGNXpUeE8vMG5aS2hYQkdCdDdT?=
 =?utf-8?B?T2ZvbEVuZnB2d295VUpIRndQUlIrSEpLYmRjVzNvYW9FMUVER2xQV1BsWUxv?=
 =?utf-8?B?Yzd4eWZGZzFQUmRmVkVDaE5iL3Q3eEFCZFB2cExzRTUyNndVTzF3YjJTWGNr?=
 =?utf-8?B?SXA4bFhaWDBNT09CNGt3RG4rNFlBZG9tK2Q0cnNHSTNPU2tIbEthdkVybWlJ?=
 =?utf-8?B?b1lWdHYwR0ZHTkg0RlNVWGVIS0hGUVBkUm85QjBWbnF4Ym0xaWcxdmowaUtX?=
 =?utf-8?B?MjVYTlFRRW0vUDRNTWRzZE96WEU2eDRIbzMwRkMxeGZZVTB5WStkV3ZHVXZ0?=
 =?utf-8?B?WFcwOGtwKzhTWVVnVXVXNng5OFhHM3JlU25mZTVZZFRUT0JqTTl4QW1nZjRr?=
 =?utf-8?B?cEdRYXpnZkRwaVRzWFN5YzR3ZUZtR01nOVJtMGpEbHlGQkNPSXVxMTJNc0pS?=
 =?utf-8?B?ZGw2amV0Zm9WV1R2K0JkbTNiVDdCNVY5UVBjVnl5aGs3bGpkQUVIWTBibGZ3?=
 =?utf-8?B?RVVieGRmZ1krZmdpb3ZkMnFLc2hFa1JReDBML2FDcWUzMC9ZTkZYSGNCWDg5?=
 =?utf-8?Q?SRyi0RhJxqCmWGFKIlY/fCOKH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6FB4558DFBEDC4DAD3BB23C408C63E5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0e46f1-60b8-4132-44f1-08db97e75849
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 08:13:27.7235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GAZPOcGjDZcsfrIATGs6E8p5K2vccGnRh2yUNLGBLgQvX7VhFNbRQ5tZQTdzlJhoYOZukqXwNXB6Vr9JniVn2tv2/dgwDTlzcFUy+lGEJR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3396
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
aGUgbG9vcCBzZWFyY2hpbmcgZm9yIGEgbWF0Y2hpbmcgZGV2aWNlIGJhc2VkIG9uIGl0cyBjb21w
YXRpYmxlDQo+IHN0cmluZyBpcyBhYm9ydGVkIHdoZW4gYSBtYXRjaGluZyBkaXNhYmxlZCBkZXZp
Y2UgaXMgZm91bmQuDQo+IFRoaXMgYWJvcnQgYXZvaWQgdG8gYWRkIGRldmljZXMgYXMgc29vbiBh
cyBvbmUgZGlzYWJsZWQgZGV2aWNlDQo+IGlzIGZvdW5kLg0KDQpzL2F2b2lkL3ByZXZlbnRzLw0K
DQo+IA0KPiBDb250aW51ZSBzZWFyY2hpbmcgZm9yIGFuIG90aGVyIGRldmljZSBpbnN0ZWFkIG9m
IGFib3J0aW5nIG9uIHRoZQ0KPiBmaXJzdCBkaXNhYmxlZCBvbmUgZml4ZXMgdGhlIGlzc3VlLg0K
PiANCj4gRml4ZXM6IDIyMzgwYjY1ZGM3MCAoIm1mZDogbWZkLWNvcmU6IEVuc3VyZSBkaXNhYmxl
ZCBkZXZpY2VzIGFyZSBpZ25vcmVkIHdpdGhvdXQgZXJyb3IiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBI
ZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENo
cmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4g
ICBkcml2ZXJzL21mZC9tZmQtY29yZS5jIHwgMTggKysrKysrKysrKysrKy0tLS0tDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tZmQvbWZkLWNvcmUuYyBiL2RyaXZlcnMvbWZkL21mZC1jb3JlLmMN
Cj4gaW5kZXggMGVkN2MwZDc3ODRlLi5iY2MyNmU2NDYzOWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvbWZkL21mZC1jb3JlLmMNCj4gKysrIGIvZHJpdmVycy9tZmQvbWZkLWNvcmUuYw0KPiBAQCAt
MTQ2LDYgKzE0Niw3IEBAIHN0YXRpYyBpbnQgbWZkX2FkZF9kZXZpY2Uoc3RydWN0IGRldmljZSAq
cGFyZW50LCBpbnQgaWQsDQo+ICAgCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXY7DQo+ICAg
CXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBOVUxMOw0KPiAgIAlzdHJ1Y3QgbWZkX29mX25vZGVf
ZW50cnkgKm9mX2VudHJ5LCAqdG1wOw0KPiArCWJvb2wgZGlzYWJsZWQ7DQo+ICAgCWludCByZXQg
PSAtRU5PTUVNOw0KPiAgIAlpbnQgcGxhdGZvcm1faWQ7DQo+ICAgCWludCByOw0KPiBAQCAtMTgx
LDEzICsxODIsMTMgQEAgc3RhdGljIGludCBtZmRfYWRkX2RldmljZShzdHJ1Y3QgZGV2aWNlICpw
YXJlbnQsIGludCBpZCwNCj4gICAJCWdvdG8gZmFpbF9yZXM7DQo+ICAgDQo+ICAgCWlmIChJU19F
TkFCTEVEKENPTkZJR19PRikgJiYgcGFyZW50LT5vZl9ub2RlICYmIGNlbGwtPm9mX2NvbXBhdGli
bGUpIHsNCj4gKwkJZGlzYWJsZWQgPSBmYWxzZTsNCj4gICAJCWZvcl9lYWNoX2NoaWxkX29mX25v
ZGUocGFyZW50LT5vZl9ub2RlLCBucCkgew0KPiAgIAkJCWlmIChvZl9kZXZpY2VfaXNfY29tcGF0
aWJsZShucCwgY2VsbC0+b2ZfY29tcGF0aWJsZSkpIHsNCj4gLQkJCQkvKiBJZ25vcmUgJ2Rpc2Fi
bGVkJyBkZXZpY2VzIGVycm9yIGZyZWUgKi8NCj4gKwkJCQkvKiBTa2lwICdkaXNhYmxlZCcgZGV2
aWNlcyAqLw0KPiAgIAkJCQlpZiAoIW9mX2RldmljZV9pc19hdmFpbGFibGUobnApKSB7DQo+IC0J
CQkJCW9mX25vZGVfcHV0KG5wKTsNCj4gLQkJCQkJcmV0ID0gMDsNCj4gLQkJCQkJZ290byBmYWls
X2FsaWFzOw0KPiArCQkJCQlkaXNhYmxlZCA9IHRydWU7DQo+ICsJCQkJCWNvbnRpbnVlOw0KPiAg
IAkJCQl9DQo+ICAgDQo+ICAgCQkJCXJldCA9IG1mZF9tYXRjaF9vZl9ub2RlX3RvX2RldihwZGV2
LCBucCwgY2VsbCk7DQo+IEBAIC0xOTcsMTAgKzE5OCwxNyBAQCBzdGF0aWMgaW50IG1mZF9hZGRf
ZGV2aWNlKHN0cnVjdCBkZXZpY2UgKnBhcmVudCwgaW50IGlkLA0KPiAgIAkJCQlpZiAocmV0KQ0K
PiAgIAkJCQkJZ290byBmYWlsX2FsaWFzOw0KPiAgIA0KPiAtCQkJCWJyZWFrOw0KPiArCQkJCWdv
dG8gbWF0Y2g7DQo+ICAgCQkJfQ0KPiAgIAkJfQ0KPiAgIA0KPiArCQlpZiAoZGlzYWJsZWQpIHsN
Cj4gKwkJCS8qIElnbm9yZSAnZGlzYWJsZWQnIGRldmljZXMgZXJyb3IgZnJlZSAqLw0KPiArCQkJ
cmV0ID0gMDsNCj4gKwkJCWdvdG8gZmFpbF9hbGlhczsNCj4gKwkJfQ0KPiArDQo+ICttYXRjaDoN
Cj4gICAJCWlmICghcGRldi0+ZGV2Lm9mX25vZGUpDQo+ICAgCQkJcHJfd2FybigiJXM6IEZhaWxl
ZCB0byBsb2NhdGUgb2Zfbm9kZSBbaWQ6ICVkXVxuIiwNCj4gICAJCQkJY2VsbC0+bmFtZSwgcGxh
dGZvcm1faWQpOw0K
