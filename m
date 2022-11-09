Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FE06223E6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 07:19:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6ZYs3dXzz3cNJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 17:19:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=0AwM7UBt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.87; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=0AwM7UBt;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120087.outbound.protection.outlook.com [40.107.12.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6ZWB5NYVz3cFS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 17:17:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQssZd/n2+sc3Dzjn3OEt+Z1vBU+mRGzS/GAdfQapMhQIy1cmjsUMofqJ/4s9aqSCF/mcLpCC2Q51D8IlFfGK9qvlJ4Gk1RxlOtfeSFVrQRDZwPlDCFBKCJXTz4vhf8M2++qxtnPhqQ1P9lV0vRBD3ec1rhl1qichcj7969P1qzCosFRqebjItwS2XApnrWiaCJUY7ithB98PwzEy6va95jxcPF76i0ht1a9Hn9t1BlRMU77RBu7q/u+2lQl+0mbh7DVAKuoXlGSEVxe5D0NBHP2Ki+LXnYYWpL5A3mRShxnnHF/Stut4v0mEaVl0HXmQQEfxp5zpzAULAyS1lSejA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVo1eMKTpNKRuvthFWJPVmyP3bwseLbpr8e0i9k+8FA=;
 b=dqbV5UEterFxPhqyxJysp9PsBqGSaYPIZx3odYIXz8d6nDG9XQQQmvQ0AH4gYQLfaJSKjLrHFry0Y5o+3skF3Ibi+QB1bJ7RbbCnzcfroRwlKqvpWbfIbc7dRXEDAk3CETxhDh7ClknwshIaIRa3NX6CdkBnJdUjtbtUsvSQvexTdfJJXQwKUE5kjWcQy/gMikIMPMQGvaM7icF06yUfo2NtuXtelTPNXC4QErKCN6xqgT7xurmvKdR9xcVve1eGA0xlw8807bF4VKVVW+ynV3tMwyXKoVoiMNNy3hsHDS2RyO4fGVHI/bWzg4nhO6pUbup6yhvhrdu8vsvoSPkopA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVo1eMKTpNKRuvthFWJPVmyP3bwseLbpr8e0i9k+8FA=;
 b=0AwM7UBtyVWAK7wlAC5HE4wX2lDYYtODyoCMGJ18UC+WU1Zesx/N4Yk1uSqXzTk9D683nJjJy8lNd8Psv6/jYhylZjkXt1TqZX9Wr+3dFSRArRlzyK/kdAQPstn4hLM8LWs8t8KV1sHu1Iqo4Uhyl4bprS326QxCn6Aq4oZbijP0rrYq59z5DxIU7zsRtCQ2jwYEIa3BNvDOzRVOJYeDPjC07qcUjmA3areOMcS5/ndshOOXooj4FZVogsjfETQQOuPlzCd0iid5MIuRlxp6aFBqwtp5Sm0l0vrfwBHRsdJGuGQ+y6kvN4ZAru5H/oNYuuKG7NNe2pjZ17H0e4LJ5Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1865.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 06:16:52 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 06:16:52 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v10 5/9] cxl: Use radix__flush_all_mm instead of generic
 flush_all_mm
Thread-Topic: [PATCH v10 5/9] cxl: Use radix__flush_all_mm instead of generic
 flush_all_mm
Thread-Index: AQHY8/b5rWJXrRqw9E237RapfLBgNq42HciA
Date: Wed, 9 Nov 2022 06:16:52 +0000
Message-ID: <1a8e3c6b-4894-68f7-f72f-1fea693963c1@csgroup.eu>
References: <20221109045112.187069-1-bgray@linux.ibm.com>
 <20221109045112.187069-6-bgray@linux.ibm.com>
In-Reply-To: <20221109045112.187069-6-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1865:EE_
x-ms-office365-filtering-correlation-id: 86283e62-7c50-46f4-f7a9-08dac219fe49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  IICTfmH3Fqt8PoELmIwMsBfwMgzqMO1TGD36V29iqiTP585huyJhRYj+JYz7WJ8AFCM7jMm9K0GyMSG/eBzkXghGedad6CwuHdge7QxhWQOb6jVJeds8kdB1fMGr2qAx2Mt1ZYipgobAwQR9pRIUOsWMVFNqwbj3lIMVouSjpwJFVtnSD+0vVl3SFquW5k4NpBcL0uyD1Jt24sSM1BnwFiLZdtzNshtBlGUOrGtkhhN0YyBMRXj/SMRo+mxrdhMkgnxxyahRHO9OTbeFGImgpeO8CvErpgzxqDqh8X5uMaiHpXHZdVRQKw0X/Rmps2NgR/6NY0WI0LJ8g1z+0diBUrBKFt3rOU5MN7xsRZ4T3v5mYJ6yMwbCQCDw9qWXZCpPm6/17B3bz3CR5kTnOg/R6KF2mOXJe9gHGLYwQh7h16lTLmGF3XeH+/iUzNpmYZ7IrWZiGeexvvQQEqOSWEQsSoDkvyPKa7vF5lXIMCH6JUVykq5KILACUwpLZSgKsivfBGR7sNNqz/QLfiNFX+L0Ia+eo2zPE6ZZJwksF/wx8KgqCJ2xlE97CZo/dQbcM3XEJfRGDviD8u8Ug/c1T1yJpvYcz+Xu056L9MfqOp55LTYzUHYdrEx9GWPTRAfoPVvzKCcTFl7TNt7wVaR0EDiAOLIp5av/GKH0tLeNfsxulrc0rs+4c9Pw4J73q35nlEQonFAgMzH32zSQtQQq+E4S/JtzRgykSG5LMINEOJ0FxmeZs+MpmGCzLJvjKQbRWOZw8FFl3iJaEXH7QeJPxfNcdDL3pW1sSboT75Cflm0Cyxvn74R9vx8R0HA1vyTrB2Z4ErFKFT5Qa4I4V9y2Fys3E4lGfFTMK0bgOXLDnuiUt7TJFz71RaFpDncFJrhBXVKb/NDiQfP1uyDa8icqSQDUxA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199015)(91956017)(8676002)(86362001)(66946007)(4326008)(66446008)(64756008)(66476007)(76116006)(31696002)(316002)(66556008)(6506007)(6486002)(478600001)(2616005)(66574015)(186003)(26005)(36756003)(54906003)(110136005)(38100700002)(6512007)(38070700005)(83380400001)(122000001)(8936002)(71200400001)(5660300002)(44832011)(31686004)(2906002)(41300700001)(41533002)(101420200003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?d1ljb05Xak1WUUtwcEFFSFZsT2RIZUpXMnNEYkU2QndiUUJMR3AzeHM3NVVP?=
 =?utf-8?B?aWswaHRFaWhBWVZtN0c3Mms3a0t5UFNqenorYUxTQXBZWWh4T2VxN3JxVFpR?=
 =?utf-8?B?VVlsOTJMZVB4cDZyeHRsZmpyaHZubUo0YzF1UjMxY1VDV0owYkorcE1zT0Fu?=
 =?utf-8?B?c1oyQXRKQXRWKzRtUEZ4RkVlUFNtd0tSRVpweHJXcU9ONUFEcVdjWmVoSnR2?=
 =?utf-8?B?c21QbnUxbURWNWJKQ1J4OVN6cTFRNzZRMm9CSVZHMUpNaHZ4bkdXUUZQQmlY?=
 =?utf-8?B?Qy9DUnlmTWZwSzBLb2Z6clRjNEFMeklWWGNhdS9GSlNCZkZqUXM1UUtoLzZR?=
 =?utf-8?B?MGJQZWljMkxFNVlZQUxjMU5VTmUyNjFUVk5HZ0Zrbk56Q3I2R2dsbmdPdyt4?=
 =?utf-8?B?cTdma0hHcm1WQ2wrdWNiVTA5TXNJQnV1NzBURitCOWY1MXNoS05WS1pOZGpK?=
 =?utf-8?B?WXpHZUc3aEh5RjZBS3V0cWd3V1JRRlZjU1ZvbW1Ncmg0S1ZHWWt6bmZYT2hV?=
 =?utf-8?B?TEJybTlQNE9penV5Z2NUeFU2OUVvVlJrbnJxOS9aZTUybkRXZnlLZUl2ZmZy?=
 =?utf-8?B?Yzl4OU5FdG1LWWlnVElLWHZ5ZVR3N2wzZkU2R0hJM2VHd2pKVi95U3phMVpF?=
 =?utf-8?B?ZzdKK0pCRWVnT0lsbG1BNDg3RGZDbHF6cWlkdXpIMkJGSTQ0a0ViWC9JMHpQ?=
 =?utf-8?B?blRxN2FsZC8xOGd5TUhhUGdsY1EvNGR1QjBzUTExZktXYU9JZGptSmdaVCtY?=
 =?utf-8?B?NWJtTGl6bUpTai9oYWpFcWtETU5YRXJNekZHN1N3SmRNaXRNamUrWHVwMHZT?=
 =?utf-8?B?ZVRYZVFac1oxNnhSZlg4TzIyUUt6M3RlVWpzYmhNWUhXaU9tR3FnWTEzMTV3?=
 =?utf-8?B?REx4OHNHTWtySWpBSUdpWEVHVHN2dzAvMkx2d01adGVWTHNtVHJKZWh2U1J5?=
 =?utf-8?B?TjlqeUNpYkxHT2paR093UTdQVFlZalRxNlc1OS82aTZUZ3IzM1RnUEpsLzZl?=
 =?utf-8?B?ei9jQURhR0tGK21laEVBcmt5R0ZjbHJuZVhjdFpTd3F1d0hUZzRPZTNXZUNi?=
 =?utf-8?B?RnpLc0laZDhISkRSd3c1RWh6Z3dKWTRRSUtuOXpJeXNidzFIZ3N0R3k3aVF1?=
 =?utf-8?B?TUNnRWVXR29VUkx0YzVkcEpTUjlMU1BCMnNvSDcrcmlJQ2kwTm51MjNiVURs?=
 =?utf-8?B?OURHRUtHVW9veTN6amJ1RG52bXJEMm5GVFRBODFFdEJQSUQ4YjR2cWh6Vlh0?=
 =?utf-8?B?bGlXUXVMS2Vab1d5TnpmaGc1RE02NENVdHNDTWRQR1pucU9VUXpRVU81dXEx?=
 =?utf-8?B?cW9FR0FsbFcwS3FBaEZNSmJ4alNLM3NhVkNMV0pzcWxnOVJiMXBoVDlaMkZl?=
 =?utf-8?B?VHgwMUhIWGZZRGt5c3F6cmZnazhwVzY2TkFtVm1Oc0NzS1NCU282SGUzYjMz?=
 =?utf-8?B?akE1K2tKTkczcHlVSWtuSzdBKzlrUmhNKzNMTWhGcnJ0cFNHNFdFVGp6ajNO?=
 =?utf-8?B?eFVOUGl4Mk9rNklBZGV3dVhtVVA2YlQ2TE5tR09zWTI1TWRDUnh0ZU5idzNH?=
 =?utf-8?B?eitpbnoxZ1ZPRmJCQnpBcHF2WHZHSWZPRkdSMGZyb2YwUUErZEovaWNuVEVH?=
 =?utf-8?B?ZDdmQjZlZVlGeFVKZjUxbGJTcEN2SWxzL1Y5OXRrWWk5MHlQSzNrWVJmS3lp?=
 =?utf-8?B?elVVWVN3Q253L2dFcVFFTXM3ZGYwS2lOSnJPV1hmVlN6ajVyaVpRU21mdFhI?=
 =?utf-8?B?Q2lYQit0b3pwejhBdTV1Z2tOSm5wR1A1TTZUR1BFeXY5UTZyOFo4M1lnZ3Y4?=
 =?utf-8?B?VHAzNE5sUWNTSkFZbDNDODJ4VDF2TDBHQmRpRVB0ck9kYjFyaUZud2pQLy9S?=
 =?utf-8?B?Sll4YVByeC9vWkNaS2VxRFBic2Z3NXAvYnhTdDRmeFZEcUoyNXBBRTVaUkFl?=
 =?utf-8?B?dllDRWZMb0E5NzFDY0JGNC9MNFg1dDErWEo2WHhzelhMUzgvcmRQckR2OTlE?=
 =?utf-8?B?cVBMNUdvUUNOOEw3ODEvN0djVjFtU24rN1pzS2VkdVJsK3RFa1NSK2JUeExt?=
 =?utf-8?B?TjI5SFVnRmZIY3dHTG5qUkNBRkMzVExnbFVSbFFHZGdodCtkaytZbXYyOUE1?=
 =?utf-8?B?Ykt0dGwxcmVHTDBKbmNSRFNnTXBEVVJ6ZXpnOGoydkFJMmVnbzNWU0NJYUd2?=
 =?utf-8?Q?5cr20RhJ3P0T5wTF1op+seU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E181C6438B6BCE47A12AE2B91D1EDE98@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 86283e62-7c50-46f4-f7a9-08dac219fe49
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 06:16:52.1952
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z9V3JVCjk6HpNQl2Rf5Wb2biJV+lNzu0tOmWir0yzR4FP+y2BcPxUcIE5PF8WMPYsV+8AkUQs7Uo7+Rnc2GFKthVWnhGYXu76Z331EvI+R0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1865
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
Cc: "jniethe5@gmail.com" <jniethe5@gmail.com>, "cmr@bluescreens.de" <cmr@bluescreens.de>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzExLzIwMjIgw6AgMDU6NTEsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
VGhlIGdlbmVyaWMgaW1wbGVtZW50YXRpb24gb2YgdGhpcyBmdW5jdGlvbiBpc24ndCByZWFsbHkg
Z2VuZXJpYyAoSGFzaA0KPiBpcyBub3QgaW1wbGVtZW50ZWQpLiBVbmZvcnR1bmF0ZWx5LCB0aGUg
cnVudGltZSB3YXJuaW5ncyBjYW5ub3QgYmUNCj4gcmVwbGFjZWQgd2l0aCBCVUlMRF9CVUcncywg
c28gaXQgc2VlbXMgc2FmZXIgbm90IHRvIHByb3ZpZGUgYSBzdHViIGluDQo+IHRoZSBmaXJzdCBw
bGFjZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEJlbmphbWluIEdyYXkgPGJncmF5QGxpbnV4Lmli
bS5jb20+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95
QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+IHYxMDoJKiBOZXcgaW4gdjEwIHRvIHJlbW92ZSBoYXNo
X19mbHVzaF9hbGxfbW0sIGhhc2hfX2xvY2FsX2ZsdXNoX2FsbF9tbQ0KPiAtLS0NCj4gICBhcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vbW11X2NvbnRleHQuaCB8IDYgKysrLS0tDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbW11X2NvbnRleHQuaCBiL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9tbXVfY29udGV4dC5oDQo+IGluZGV4IGMxZWEyNzBiYjg0OC4uNTdmNTAx
NzExMWY0IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbW11X2NvbnRl
eHQuaA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbW11X2NvbnRleHQuaA0KPiBA
QCAtMTUxLDggKzE1MSw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBtbV9jb250ZXh0X3JlbW92ZV9j
b3BybyhzdHJ1Y3QgbW1fc3RydWN0ICptbSkNCj4gICAJICogbk1NVSBhbmQvb3IgUFNMIG5lZWQg
dG8gYmUgY2xlYW5lZCB1cC4NCj4gICAJICoNCj4gICAJICogQm90aCB0aGUgJ2NvcHJvcycgYW5k
ICdhY3RpdmVfY3B1cycgY291bnRzIGFyZSBsb29rZWQgYXQgaW4NCj4gLQkgKiBmbHVzaF9hbGxf
bW0oKSB0byBkZXRlcm1pbmUgdGhlIHNjb3BlIChsb2NhbC9nbG9iYWwpIG9mIHRoZQ0KPiAtCSAq
IFRMQklzLCBzbyB3ZSBuZWVkIHRvIGZsdXNoIGZpcnN0IGJlZm9yZSBkZWNyZW1lbnRpbmcNCj4g
KwkgKiByYWRpeF9fZmx1c2hfYWxsX21tKCkgdG8gZGV0ZXJtaW5lIHRoZSBzY29wZSAobG9jYWwv
Z2xvYmFsKQ0KPiArCSAqIG9mIHRoZSBUTEJJcywgc28gd2UgbmVlZCB0byBmbHVzaCBmaXJzdCBi
ZWZvcmUgZGVjcmVtZW50aW5nDQo+ICAgCSAqICdjb3Byb3MnLiBJZiB0aGlzIEFQSSBpcyB1c2Vk
IGJ5IHNldmVyYWwgY2FsbGVycyBmb3IgdGhlDQo+ICAgCSAqIHNhbWUgY29udGV4dCwgaXQgY2Fu
IGxlYWQgdG8gb3Zlci1mbHVzaGluZy4gSXQncyBob3BlZnVsbHkNCj4gICAJICogbm90IGNvbW1v
biBlbm91Z2ggdG8gYmUgYSBwcm9ibGVtLg0KPiBAQCAtMTY0LDcgKzE2NCw3IEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCBtbV9jb250ZXh0X3JlbW92ZV9jb3BybyhzdHJ1Y3QgbW1fc3RydWN0ICptbSkN
Cj4gICAJICogaW4tYmV0d2Vlbi4NCj4gICAJICovDQo+ICAgCWlmIChyYWRpeF9lbmFibGVkKCkp
IHsNCj4gLQkJZmx1c2hfYWxsX21tKG1tKTsNCj4gKwkJcmFkaXhfX2ZsdXNoX2FsbF9tbShtbSk7
DQo+ICAgDQo+ICAgCQljID0gYXRvbWljX2RlY19pZl9wb3NpdGl2ZSgmbW0tPmNvbnRleHQuY29w
cm9zKTsNCj4gICAJCS8qIERldGVjdCBpbWJhbGFuY2UgYmV0d2VlbiBhZGQgYW5kIHJlbW92ZSAq
Lw==
