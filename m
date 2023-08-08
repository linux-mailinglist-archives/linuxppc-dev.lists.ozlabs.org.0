Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CED67738AE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 09:41:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=mpfBeglS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKlWC1HkCz3brg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 17:41:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=mpfBeglS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::605; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20605.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKlVB6zr7z2ysC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 17:40:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIe+okqHWIuYanSP4axvOeu0deiTfwhI2SgaXnJxysSndCDb7cCn0jdY5R3Lccf+w+dbnIm7Fj5I7TpwJvq4ai9mNvhyCDk8bV78afJ5OPbNOCBC1KsXGNrsF9NuzDplFlx9RnFBn5Ckzu5QprGFmbGfAfzLizpfORkFq75uKycOCQiqQaJb0NFPXLYjSrJnJ0ZBOG1RLnLZcWacpM4ct9BwVyXs8Ceh8C35/VMTRFg+pNmgqLPpUVn27ovT4+komU02VcjwmVSy8qy3HnAbzw9OwjCsRDt03ubkZBWBstBKM7wNHjh41t5de4Q6QYlw15tro4+J1S//jV2wtomSxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtH6SY+cC7o/jfE2DkaDuBKvsy/VXgtbq/SnW4NpRFc=;
 b=CbVehEcqqItn155kFIahq0dL+Kn5OEGsg7TEo+maqDVM5dxs9hW6sN6vbA3Ooy29CXXf6V7ZfUwPkls08kfIiyEGWyG0Y4BiPI0cCVtV4B1C7yrY1Fo6mnCrxhbqt6loAvamAtXGUAQ1xYU54hwZNiRYCg+iDnuWrGUHgxjzYqVXUQ5IPfJderfVXl2ygWAcDJAIFz7kQwBVbuKeSHyP7Vdvve8qWdIdokGkqLXT/NwCVJJPsQ22AQjAAndkWrSGtzYVriQlDjeNY5coOouW19lMrDRZ9Ks5Vgis8sJAWqPzTNxu9DntZa4CvP1p2XvElYaoFeC8vnHr+sRnO9B6kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtH6SY+cC7o/jfE2DkaDuBKvsy/VXgtbq/SnW4NpRFc=;
 b=mpfBeglSBhASPeYuAniO/gImH7x50ycMGgfkoS1VMuJXD6iVFFQ5LF+xNUee7xhwDQJTX6YptC7Uj2vwwaTVr63OW3BSOrP/Eh+xuH3haQ35Jf9y4Rl7hzcjIMme5lL5SXYqU7XwzAl9W+Ct3Q60a2MGDSutRgQDpLAaGTg+Gmmj3T8mJTg2CHjv8X/SGJPbiJMrBvvdQv48xn/MnTQhilogZ/xkazkhRnI3BDGmJc4H54BEeG/swOkRZCm64l3rzP2yHk6KWwAK+WtGw/3krXqe8EjdiTGyl/0D1NrIDqiaxBnqQ2dByCFPEi285oDYbigsone2GTCBzNUxy0fHqA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3348.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:21::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 07:40:29 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 07:40:29 +0000
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
Subject: Re: [PATCH v2 01/28] soc: fsl: cpm1: tsa: Fix __iomem addresses
 declaration
Thread-Topic: [PATCH v2 01/28] soc: fsl: cpm1: tsa: Fix __iomem addresses
 declaration
Thread-Index: AQHZv9I5RrWj+TgqK020DgIWYi8Mmq/gF5CA
Date: Tue, 8 Aug 2023 07:40:29 +0000
Message-ID: <8b0eb254-2fb7-34bf-b110-30da0c2c8597@csgroup.eu>
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-2-herve.codina@bootlin.com>
In-Reply-To: <20230726150225.483464-2-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3348:EE_
x-ms-office365-filtering-correlation-id: 4f7790ed-5f93-46eb-48a8-08db97e2bd26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  00OGdAjF4uWI4hccakzIXx/jWajfvEpVN5xi+2ZWb5I1Ques8YBiP2OuwQ4te1Of87U79xSZkLj6CPLOsCuiFK1kEhdiiDTYUc3QSKyjrJ6ZDKls6i7CSAdZAYLf02nIQkc5eUPeZIvucmkgixBl0ymrciArgtSv7qO3aKEi8X5cG0+2NH5V446X4bo68duP1EixYWTDXtGMmtxd1lx2kkqACU9Vdv5Z+W9zOkQnitBhd2GqcHghNgjIA/8aC+wNWaqf5bI08TI5l25AY/3/EmnJqBhSVsvsJmJQOhkKHXrLHbOoTXANjg+RaXetIgLLnO3Tu+TI7NMIb1JaCXICO4+hLo3tkDpriSlHkSXDM1RpUHLxgG8ONA6JanDOt4xMUrwVYBUzhg2scl5yE0Oiq0CNXjiaJt2VLcHIw4Q5IHREK2C5DEEqEAv0GLdEydpe8gd4M88jzJPL0xPFbdFTUyYrZJ5+ik3cz7tnClV+9lkF/CLxoplSb7aQur82g+3fx1rFCTa+yBu0K6JkOoxwsHXjBxn7Ct47QBKyTf7Vn9L1CLLOffOtwTXvIcfawNDoWKGQmm0z+oHmmXeemzYp1qSRqjk6N9hc2yiaRfbkuh+lgNNOQEiuB2ve35XzdUqRWsIlkgSuID2d0qOI7Cs4YTuiI6vWvixQdCuhz4tjXgZV6zJbWnyCQ/L5kwzb0xmzk5hWf+VDSDrMg/sHwKV5fhPLhWKkxQAUP+IwXU6b9QvypyS+fAw2M30jjgxGEpP+atOYCLDy5rWQ+j/6SOXs0Q==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(376002)(39850400004)(136003)(90011799007)(186006)(1800799003)(90021799007)(451199021)(2616005)(6486002)(122000001)(921005)(478600001)(83380400001)(31686004)(66574015)(6512007)(6506007)(26005)(41300700001)(66446008)(76116006)(66556008)(66946007)(91956017)(64756008)(66476007)(316002)(8936002)(8676002)(31696002)(4326008)(2906002)(71200400001)(36756003)(110136005)(54906003)(38100700002)(38070700005)(86362001)(44832011)(7406005)(5660300002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?V1dIRFdONTU5dXZJQ3dnZWFqUFQwMlErb3E0eFkzU0JmVk9ZYVhHUFdmRVIz?=
 =?utf-8?B?ZTNzUW53a016Z1RnS2ppeFdLOURIcm02WXVrbTVQZi9GNXFHRkZaQzQrWnZj?=
 =?utf-8?B?MURPZUk3NE02TlhweC95NUpYdHdYN1g1SVJFOE5EdG80cXQ1dG9rM09lRDdq?=
 =?utf-8?B?OHR4OEcxdloyUnQwemx5TmRQbkd4cmNERU5Rb0Q4WnViLzJ5dmNUdXJVRzFQ?=
 =?utf-8?B?QWwrdU5hTHNxZnpqZGozQ0dTNjd0ckQ3em9Db0x4THI3YnhQNTh4Q21MdG1j?=
 =?utf-8?B?dEgwdjBOQXJ4TDBoNS91bWo0R2JsNTdJemw3bHYxVW5sdjd0VEJXcXFJbEZz?=
 =?utf-8?B?QTRQSFcwLzBuUW9sSldVRHF0YlJNTDlCWkpReXdjUTFvV0Vhbkt3elZ5ajVH?=
 =?utf-8?B?WXIrMW9YNitkK0hmYUEzNVNibEpYNWo5dGRRcGFhb2EyS0RUOEZvZHlldzg1?=
 =?utf-8?B?QnM4UnpDVXpvTmIwekhoUnRFdVZuR2ljaDdrYVBkM1dhelVFT1ZURFc1dlRn?=
 =?utf-8?B?RTNad1MxN0hLWDl1bkhKQWRWNHY0dHNrbWhIMEFIU284Q2oxdGtrWW9RRnYx?=
 =?utf-8?B?SWNWZFVmMlhzQXVGdTBQVUpYN055L1dNaVJUV1JCblFhYnJ6MVphbDMzTHdZ?=
 =?utf-8?B?VWx1UnR3bVZkNHZqUHV3OUI2S05FWkpOOWNGVVdIT25INmRhYlFzelZrZHRo?=
 =?utf-8?B?OS94a0VFMVI2WGpMUFJaRTZBbGJZOEVCZDdnT1pGK1RpNFdTcjFvb1BrTWRE?=
 =?utf-8?B?Ty9rV0VHQXVDbTBjQ1VFdFFZejFvVmlXTnppclZsYVJ1ZGxxOCtvNXF1RG9F?=
 =?utf-8?B?aFB1NzFJOHdIY1pHVnZpWHJCKzJuWXcwMkg4Mjh5QVA0dkpBaTVNbVJ0ZlRN?=
 =?utf-8?B?Y0ROV05FWDg0NURBQzRodUY1TnNjRnVtWnl2bG5nZkVGZmd2UDlrazV0SEJq?=
 =?utf-8?B?UjZqNnhjZmx3L3BPT2k0WjVIQ3hGdGlLVk9nWkpMc2k5NmRad3l6TFZ0QURr?=
 =?utf-8?B?d3FIRDdpVzhiN1B4Ym5VVk91VENJYkZ1TzA0NDNsUU5IazRyck4rTXJnSjJt?=
 =?utf-8?B?VDZOMU9OMVpCdHZEVW1iS2NvZ0tiNU03KzZTRjl4WG5NN3R4Qmx5WEptVzhZ?=
 =?utf-8?B?RHR0bVhwYmVNZkZCQlcwY3IxZlVCOUk5M0lJZ1licmp1SWdCOElqK0ZxUTRD?=
 =?utf-8?B?Q1FVWGt5ZE5UeG1QTzlHOExabGs2UmllUkJkZUh4YmtCY2M0YmJtVitMM0hr?=
 =?utf-8?B?bkxqUkxSaFFyUFllRC8xZXJZU1dSNExRckM5NTV6TkU0L1Z3b29QKzM2K1Ay?=
 =?utf-8?B?bzVuUW5vZDZYUjFtV29Ra3VhME5KK0VGWlNjTWlTem5xRXlaYmhrMWFyVVd2?=
 =?utf-8?B?K2EwdFdSdzNoOHhURkwwRlk1dGhpWXU4bjRYbWxhVVVYTmVSK1N4MUlmYmJm?=
 =?utf-8?B?d2VlY3RlZmtXWWI2cW1IaGVaVlFES0ZmVWFzdWFLajNYRy92c1R4WXh6S1NC?=
 =?utf-8?B?SGptYjRCWmZYOVVwOUZKcVRBYWFuNkdFeXZUU2lQaWQyNm5kMWZCVG1tTDB5?=
 =?utf-8?B?UlhZWHlRWmk5a1A1MTVPbktWOUhiVEUzM3ZES25ra2NrdUY1bVJrZjQ1MHFI?=
 =?utf-8?B?VXp5b2R2NmRmTUoyUno2VVo1YmpNUlp1WlRtOXZ5OHYyZHBDUjM2M3pEaTJ0?=
 =?utf-8?B?T2YzY1VSdVhGVHF0aXNYbGRzUVljTHRFejNBYmtxeTl6REhQLzgwdzZzZmdQ?=
 =?utf-8?B?cGlqWmtBN1pGdEtJeWE4VHpPdC82ZW0rR2VzQ2NiRDBRSHYzV3JPcmdpV0dx?=
 =?utf-8?B?WUpSbGE3RW1EZU1PSnhPTTRXT25GZ3BJcFpLNUtIY1dJMmVVTGR1Y1N4cVBI?=
 =?utf-8?B?SjdrZ1NGeGFxN093STgyeTFITm5kYUJNaUxqRitQVndrS040NW9IY2w3eE9O?=
 =?utf-8?B?SXVuTDU2NjVDSmZIbVFJWkxxek5RUHN5NHI4M25LNmViN1p2ZUk0U1F5VmdU?=
 =?utf-8?B?dFJ3eHAzZVVoK0dBN1pSdnNuMnhhVlhLamdpbDdwbitobWRIVDRvQ3ZBNm9E?=
 =?utf-8?B?MDJPMmpNU2x6Qk01T3kzNmdKcnRDdFZKLzlFQ2wyczhWdVZaZklldnljbHl5?=
 =?utf-8?Q?GmKd7RMJj2PgJRutEnDPph6lq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FAFE8EEBE2FA94B9D9A724EB3CBFA58@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7790ed-5f93-46eb-48a8-08db97e2bd26
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 07:40:29.4607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NUUrMMDz2t/Cf4D41ufSJYXE7QboEP1EWv96R0w9P4puT770XJalW6j7FQ6VJBQ242EL0y7i5xKamXrzdkHK1MtEOWicQXkr487vTFoIrTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3348
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

DQoNCkxlIDI2LzA3LzIwMjMgw6AgMTc6MDEsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBS
dW5uaW5nIHNwYXJzZSAobWFrZSBDPTEpIG9uIHRzYS5jIHJhaXNlcyBhIGxvdCBvZiB3YXJuaW5n
IHN1Y2ggYXM6DQo+ICAgIC0tLSA4PCAtLS0NCj4gICAgd2FybmluZzogaW5jb3JyZWN0IHR5cGUg
aW4gYXNzaWdubWVudCAoZGlmZmVyZW50IGFkZHJlc3Mgc3BhY2VzKQ0KPiAgICAgICBleHBlY3Rl
ZCB2b2lkICpbbm9kZXJlZl0gc2lfcmVncw0KPiAgICAgICBnb3Qgdm9pZCBbbm9kZXJlZl0gX19p
b21lbSAqDQo+ICAgIC0tLSA4PCAtLS0NCj4gDQo+IEluZGVlZCwgc29tZSB2YXJpYWJsZSB3ZXJl
IGRlY2xhcmVkICd0eXBlICpfX2lvbWVtIHZhcicgaW5zdGVhZCBvZg0KPiAndHlwZSBfX2lvbWVt
ICp2YXInLg0KPiANCj4gVXNlIHRoZSBjb3JyZWN0IGRlY2xhcmF0aW9uIHRvIHJlbW92ZSB0aGVz
ZSB3YXJuaW5ncy4NCj4gDQo+IEZpeGVzOiAxZDRiYTBiODFjMWMgKCJzb2M6IGZzbDogY3BtMTog
QWRkIHN1cHBvcnQgZm9yIFRTQSIpDQo+IFNpZ25lZC1vZmYtYnk6IEhlcnZlIENvZGluYSA8aGVy
dmUuY29kaW5hQGJvb3RsaW4uY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvc29jL2Zz
bC9xZS90c2EuYyB8IDIyICsrKysrKysrKysrLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9zb2MvZnNsL3FlL3RzYS5jIGIvZHJpdmVycy9zb2MvZnNsL3FlL3RzYS5jDQo+IGlu
ZGV4IDM2NDYxNTMxMTdiMy4uZTA1MjdiOWVmZDA1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3Nv
Yy9mc2wvcWUvdHNhLmMNCj4gKysrIGIvZHJpdmVycy9zb2MvZnNsL3FlL3RzYS5jDQo+IEBAIC05
OCw5ICs5OCw5IEBADQo+ICAgI2RlZmluZSBUU0FfU0lSUAkweDEwDQo+ICAgDQo+ICAgc3RydWN0
IHRzYV9lbnRyaWVzX2FyZWEgew0KPiAtCXZvaWQgKl9faW9tZW0gZW50cmllc19zdGFydDsNCj4g
LQl2b2lkICpfX2lvbWVtIGVudHJpZXNfbmV4dDsNCj4gLQl2b2lkICpfX2lvbWVtIGxhc3RfZW50
cnk7DQo+ICsJdm9pZCBfX2lvbWVtICplbnRyaWVzX3N0YXJ0Ow0KPiArCXZvaWQgX19pb21lbSAq
ZW50cmllc19uZXh0Ow0KPiArCXZvaWQgX19pb21lbSAqbGFzdF9lbnRyeTsNCj4gICB9Ow0KPiAg
IA0KPiAgIHN0cnVjdCB0c2FfdGRtIHsNCj4gQEAgLTExNyw4ICsxMTcsOCBAQCBzdHJ1Y3QgdHNh
X3RkbSB7DQo+ICAgDQo+ICAgc3RydWN0IHRzYSB7DQo+ICAgCXN0cnVjdCBkZXZpY2UgKmRldjsN
Cj4gLQl2b2lkICpfX2lvbWVtIHNpX3JlZ3M7DQo+IC0Jdm9pZCAqX19pb21lbSBzaV9yYW07DQo+
ICsJdm9pZCBfX2lvbWVtICpzaV9yZWdzOw0KPiArCXZvaWQgX19pb21lbSAqc2lfcmFtOw0KPiAg
IAlyZXNvdXJjZV9zaXplX3Qgc2lfcmFtX3N6Ow0KPiAgIAlzcGlubG9ja190CWxvY2s7DQo+ICAg
CWludCB0ZG1zOyAvKiBUU0FfVERNeCBPUmVkICovDQo+IEBAIC0xMzUsMjcgKzEzNSwyNyBAQCBz
dGF0aWMgaW5saW5lIHN0cnVjdCB0c2EgKnRzYV9zZXJpYWxfZ2V0X3RzYShzdHJ1Y3QgdHNhX3Nl
cmlhbCAqdHNhX3NlcmlhbCkNCj4gICAJcmV0dXJuIGNvbnRhaW5lcl9vZih0c2Ffc2VyaWFsLCBz
dHJ1Y3QgdHNhLCBzZXJpYWxzW3RzYV9zZXJpYWwtPmlkXSk7DQo+ICAgfQ0KPiAgIA0KPiAtc3Rh
dGljIGlubGluZSB2b2lkIHRzYV93cml0ZTMyKHZvaWQgKl9faW9tZW0gYWRkciwgdTMyIHZhbCkN
Cj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB0c2Ffd3JpdGUzMih2b2lkIF9faW9tZW0gKmFkZHIsIHUz
MiB2YWwpDQo+ICAgew0KPiAgIAlpb3dyaXRlMzJiZSh2YWwsIGFkZHIpOw0KPiAgIH0NCj4gICAN
Cj4gLXN0YXRpYyBpbmxpbmUgdm9pZCB0c2Ffd3JpdGU4KHZvaWQgKl9faW9tZW0gYWRkciwgdTMy
IHZhbCkNCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB0c2Ffd3JpdGU4KHZvaWQgX19pb21lbSAqYWRk
ciwgdTMyIHZhbCkNCj4gICB7DQo+ICAgCWlvd3JpdGU4KHZhbCwgYWRkcik7DQo+ICAgfQ0KPiAg
IA0KPiAtc3RhdGljIGlubGluZSB1MzIgdHNhX3JlYWQzMih2b2lkICpfX2lvbWVtIGFkZHIpDQo+
ICtzdGF0aWMgaW5saW5lIHUzMiB0c2FfcmVhZDMyKHZvaWQgX19pb21lbSAqYWRkcikNCj4gICB7
DQo+ICAgCXJldHVybiBpb3JlYWQzMmJlKGFkZHIpOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyBp
bmxpbmUgdm9pZCB0c2FfY2xyYml0czMyKHZvaWQgKl9faW9tZW0gYWRkciwgdTMyIGNscikNCj4g
K3N0YXRpYyBpbmxpbmUgdm9pZCB0c2FfY2xyYml0czMyKHZvaWQgX19pb21lbSAqYWRkciwgdTMy
IGNscikNCj4gICB7DQo+ICAgCXRzYV93cml0ZTMyKGFkZHIsIHRzYV9yZWFkMzIoYWRkcikgJiB+
Y2xyKTsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgaW5saW5lIHZvaWQgdHNhX2NscnNldGJpdHMz
Mih2b2lkICpfX2lvbWVtIGFkZHIsIHUzMiBjbHIsIHUzMiBzZXQpDQo+ICtzdGF0aWMgaW5saW5l
IHZvaWQgdHNhX2NscnNldGJpdHMzMih2b2lkIF9faW9tZW0gKmFkZHIsIHUzMiBjbHIsIHUzMiBz
ZXQpDQo+ICAgew0KPiAgIAl0c2Ffd3JpdGUzMihhZGRyLCAodHNhX3JlYWQzMihhZGRyKSAmIH5j
bHIpIHwgc2V0KTsNCj4gICB9DQo+IEBAIC0zMTMsNyArMzEzLDcgQEAgc3RhdGljIHUzMiB0c2Ff
c2VyaWFsX2lkMmNzZWwoc3RydWN0IHRzYSAqdHNhLCB1MzIgc2VyaWFsX2lkKQ0KPiAgIHN0YXRp
YyBpbnQgdHNhX2FkZF9lbnRyeShzdHJ1Y3QgdHNhICp0c2EsIHN0cnVjdCB0c2FfZW50cmllc19h
cmVhICphcmVhLA0KPiAgIAkJCSB1MzIgY291bnQsIHUzMiBzZXJpYWxfaWQpDQo+ICAgew0KPiAt
CXZvaWQgKl9faW9tZW0gYWRkcjsNCj4gKwl2b2lkIF9faW9tZW0gKmFkZHI7DQo+ICAgCXUzMiBs
ZWZ0Ow0KPiAgIAl1MzIgdmFsOw0KPiAgIAl1MzIgY250Ow0K
