Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD22629C8E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 15:48:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBTZm1c1kz3cMn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 01:48:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=3VC/dYwT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61b; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=3VC/dYwT;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBTYp1wPhz2xKX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 01:47:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0cIFgUeCQmtvJelvoXj0/D9n1X6LqzNfvY8adyJyZKF947tfCgnSCzCIWvrt3jVO3mTn5gPrq4XcFEA4hXiTsbyLWdwykY9RBxJgj+uixN0A4MIjvq9Tg5ds7mjYSbvm4VNCWUNIcGnxSgBsPCyUC6oyNd4Bz+MDWJIpCiF7WhnfxLx+XyudNfq1A0iNryBBkTZS3JU5bZssEo/z6UW2Rv+QIIuOBxF7fTBAqPTXJ4/gAkSdVOU8j9hIDv7bY2Ib/AFmz5AbfmW+Wf4gaNbG7a3JKSgdOMyAZD7mUyLWAWUFJ3zLmu7NSCOVK8zeCtD5cvOehfyM85D19LMnrBm4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmRDLhmX/juQ/fpB196kO1JRCgITP5TSCjmRlUySN5Y=;
 b=TFKIBLOAx7MlZWZLnhcUUZ3BCslylAzv8I9oDc0/Pk2ywhhsh1PkbWCfYiVElPCmbXRuCrXZNLsQGuobpDRlRoS6Nxvy9iN2JqUJ0ixiEmKyIPEy7DGB/j2ZlviOM4vrYzF0h6lFlnVob+hb0wE9zyp3XxkW2rej27ij2oHHY/bjSkV5d9B7WbQ/y8doz5ayaQqFpPTDKUC/l+vZeiev7y85Yi8xTN6KLAT6sfOTCXTwT/xfcVVvUQmvWbIbWKSAGz4LG+W8azbTDWmUW3fCftPoHDZthdOjbVQLaHCV1K0hsJy63vI1vAJmGD27bnK++fJWUOV9TLEFaxYn/YRiTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmRDLhmX/juQ/fpB196kO1JRCgITP5TSCjmRlUySN5Y=;
 b=3VC/dYwTPusPwwN12H++chCSbsqT4udCBH0KyvSSItT9tpyTnZdcqv0XInjMW90MAtsYWnEAVacaf1792rg7UffrLeZUKEUSbuapHn7zVtAyA7jR6XVsdpT3nyd1ExXKOU5OKYMtVcAWNoUkJxQFwuUi+Qd0FV6aQwhhYVW9cUx2MI4RxIsWHgaFoSEnUoj/7gGz17gjAXqOERIUHRUmWCpf7U6YSKGgMC4BFZvGgTfr5uck6ebfZZZWDgt4Q8pX+TFEGK4a44+eg9zWb7ct/6gIi81xwY93dNzuqxr+Ihz5KeQOkY380fY1fLKbNjWwppoU9cTiU16gFnnjNte9Sw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2165.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 14:47:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 14:47:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Ash Logan <ash@heyquark.com>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "paulus@samba.org" <paulus@samba.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>
Subject: Re: [PATCH v3 00/12] powerpc: Nintendo Wii U support
Thread-Topic: [PATCH v3 00/12] powerpc: Nintendo Wii U support
Thread-Index: AQHYivNxcvJZwv2OREugnXya9y8Vhq5A7H0A
Date: Tue, 15 Nov 2022 14:47:34 +0000
Message-ID: <01823ce2-d1c6-6d56-7061-503e6e319237@csgroup.eu>
References: <20220622131037.57604-1-ash@heyquark.com>
 <20220628133144.142185-1-ash@heyquark.com>
In-Reply-To: <20220628133144.142185-1-ash@heyquark.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2165:EE_
x-ms-office365-filtering-correlation-id: 549377c4-d601-4367-fc77-08dac71854c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  rh4TtxAy/CVQFw3VDkZFGjC7uzCBj1BbZDqAInG9jKlpl46/XcdQsvCVwrtbqfjgSQJZnyK+G1g/ESA7Ym4oi62rWFXYBgwhjMLiMpGtIYa+OH3pHSk5K0xX15uJ4TBCAPc8TItjBUI40mh9kLiRlUsvu/dIZl+xMRkIRY32frThgnlppQ5he32ry1NedLFX3DiZilVkoKWFL7pewSiX6APUY9X1y44bxLrPxhSqwQjGhj5FHyFZGVAoDeGRMjcjZqf9iUWIDcxxcD46QQDq+rNM2Q021g4L4Egm52O8zpjGH5Aa4slPeJFa98eKtuHMcLfwxoU87nXe0/3c6jspqwNg70ew0kdYVu2VnyflG+IA6qSXMoX1lcYF8zIP5CdhB1eTBJcVIn8R3qTPy/A3mCbHA1MZdm/RQGE8EQoGy0E+2PXPyQ0pd6lk14mRZF1WJDMtqRRLcxHIoIXx+WU2N530vVNjlkUqIPh+ygUpW0P9+o/xjSVJssUZNuVLvGRunhDthaPbcqB8IHYqN9NgnxscXROcdJDBJvrY0ET5lO5HuFZZP9/AFhKhVHfhYlmqsz1ErUpbzqXsj8bCc9nHbMgKjZvfFe1p+700h0S0LNE52+vjrcaFgPfbaFWgHgEhOk49itNxAiVzgTEi0y2KuOaEl+b5v51zA0WO6WtUaF4ucpwDpU2D708Cg22SaGPlAqAR1L0si3BblvywZOxTIIPJPkqWMNDFejIIPKeAqvv/hnB3zDW0BlfSp8XDicYMooO3sbbk+fji8vkRRIU0c7QcVqJuyKZkgZG2JgFEddmCUhjzcrl+qt6ro4x69oFOuskPQDeQMFnAFLEM2SlMOxjMF/ylH7LQN61TBMbcOh4=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199015)(71200400001)(478600001)(6486002)(54906003)(110136005)(966005)(31686004)(5660300002)(66574015)(66556008)(8936002)(7416002)(36756003)(6506007)(41300700001)(2616005)(44832011)(2906002)(66476007)(91956017)(316002)(6512007)(26005)(8676002)(76116006)(4326008)(64756008)(66946007)(66446008)(186003)(83380400001)(86362001)(31696002)(122000001)(38100700002)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?KzhWTi96bHh1VlJSZ2cvbmR2KzEwa0l4bmtTc0hvMnNUbXZGWHdWM1hoRFVz?=
 =?utf-8?B?U0xzQ0VnZTZtaFg3OEF3ckFVRkFzR1IycTF4aFhsOW80MC9EZDdVQ0lRY2xV?=
 =?utf-8?B?TnJpb2Q0S3Z4OUY3d3RGYXIrZWlJQVZEVU9kUGlNTHI5RkY3Y0o3QTY1d1gz?=
 =?utf-8?B?eW1UcVZYNFN2OFF0WWU1dks4SlVLWVRHTGVoenQyb2k0c3dpS3lJMTFxQ3A2?=
 =?utf-8?B?VDE0b0JINHhjcGRvRVk3dFZ5eE1iY0NKZ0IreG5UNnZPOGhiMzFzeEVoMlRI?=
 =?utf-8?B?TGpmaFpxQWE5ZENZK1ZPMmtJZ05UZ09lbkpBTFpoS25USjMwNDJqUzdjVytS?=
 =?utf-8?B?bkUvZ3ZIczhPS1RqWXJhbDloM0RWc3VoNU9mL3U3Nmd0UWwwMUZ3SUZUWi9Z?=
 =?utf-8?B?Y0YyNEoxYVVFZGdUMVhYK2VzUW44ZFZYL1lRMHJsenFwaGN5Mlo5SGp4akhm?=
 =?utf-8?B?aVVZanZIYXhoMzRSY3YxUVk2OWRvZ1g4UW9QTWJnRUtpN1JiWGlKckFmeXNi?=
 =?utf-8?B?NkhnaDVyR0RJeVZJYW8rM0pNM2pHcDZLRUYzVVExQjV2bkt5VnhjQ3AyZ2F5?=
 =?utf-8?B?K2djbVNtdS8yMjAwb2tRMWF3NlNYZVAyTW5FSVNXeGcwN0xvQTZURS9jZlJu?=
 =?utf-8?B?bSttQ3BLRTZhRlRTZWhvL1JjcWVhbEViTlRmTVZXbW9Fcit1ZEs0Qko0ZGpu?=
 =?utf-8?B?Q2t2UzZpTzF2WWRzUjQvdDBjcXR1R1VFK0pqeUhEcW1NbTZ4blRoajk0N3p4?=
 =?utf-8?B?MkliYlJUaHlzYWlqcUd0dmxMcmRudWZBOFY5aTExLzJGR3EyNnRsSU5icWoy?=
 =?utf-8?B?UzVWSkFCdkhaN24yVzZwemQ4dHdFendHS0xtaVdRdU1JRS9tejh3T0N4NHY1?=
 =?utf-8?B?TFJzU0VKQmRMdmVjUUFmbzZGK21SMHdjSStxRDh6ajBPUm5aTCtpSzJmTFov?=
 =?utf-8?B?WTBJdjZvYVB2c083SngyZ1hxMGJ4TzFhMTBuYStkQXVpdllHRFF4TElPcDQ5?=
 =?utf-8?B?RkYwMTNlZFBrMCt0NDd2KzhGNmFXenVyUHBTNlRMclArK3JCZVZoQjBCc2Jx?=
 =?utf-8?B?QS95K2Y0OFdCZGtwdElQRU1QRmJFU0VhZEp2YVRmbkphMkhXdUlBRnhFMGtX?=
 =?utf-8?B?UFIvVEoya3RvU1laNDJoeG9hZUtudnlxc05RZTZNU2pmVXRLcER2cDlXb0JJ?=
 =?utf-8?B?MGFlMXJDTHp2czhpVDdxcUNsZ09VOHBFdHZkdFdPYlh2WHhKc2ZHaDV6clo4?=
 =?utf-8?B?eVF1OGhkek9pUEg3a3BXTlU4SlduaGRnaEorZzlhd0VaUTl6bC9GUThVQjBW?=
 =?utf-8?B?UHRSRkg4VFBrYjUrbmxvYzlTOGxZTDBicHpnMTY5YVJibWtGYUZ3aHpUdHpl?=
 =?utf-8?B?OUU5MXdnbWFxOTFnV3FibWJGbEJyMkszbzB0U1ZYWCt6Nm5kS3VBcEc1NWVR?=
 =?utf-8?B?MEZGNzRENStPbFNTZ21aaG9DK0NzWjFRa1IrQXdORmc2aVFXZ1B1ZTZ1K21S?=
 =?utf-8?B?RDBUeE1LdGZMeTdPZ1RyTDhmV05pakpiWHR2Y3h1ZFAwZXBsUUxWUE9mczNK?=
 =?utf-8?B?ZlE1V1ZEcGNhU2VwQXlubVVSaGtHNGhua1pWenRFV0R5dzZ6WkV3SHhCalZV?=
 =?utf-8?B?anVVV2NzeGZiNnFMaVc5eXhDaFBLNWZNV0E1SFZTL2cvR2dsV2YrNzRMZS81?=
 =?utf-8?B?djdGY0FmTENvMkkwYlVGNEhraXcrTG1odXN1MHAybjh2bU84QS85S3pjaEtl?=
 =?utf-8?B?SEpOTnI0b0tDMmtFaGc1YnZxMDQ0T243N0ZlMHZVZ0hKRTY3bVN2S3o3UDlJ?=
 =?utf-8?B?a0hIdmgxRGRtT2pnUkVsd2VyNE5MWVNkcW5yYzFLckg4QkVpOTFTczV2U0lC?=
 =?utf-8?B?QnhsL2c1bDJ1YkIzZ0thTFFkL2E1czhRR0NxVDFoc1cxSTZYK3A1SVlLbXNK?=
 =?utf-8?B?dTJMLzFDcmEzM1IwcGhnSlJNZmlES0dMU1hVZVBFU1VNV242SjFHRG5ENnhl?=
 =?utf-8?B?QjJsUnZFQzgzeXRPbmRTeERETTN6Nk5mb3I4T0V0QkNUZ2U2SzRlWHI1RzYz?=
 =?utf-8?B?OXpMS1Zvdllod3EzUXlvczUyR1lBaS9TaWl1R3BFMk9Eck9hMVV6SE9ZOS9F?=
 =?utf-8?B?LzdNWG1Db0ZzWVVVVldSR240eFpyRU1lVXJwL25TUXYrZXZGZk9pWHJtOCtz?=
 =?utf-8?B?MFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6E1823A7D0A0C4692D37525C9478180@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 549377c4-d601-4367-fc77-08dac71854c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2022 14:47:34.1085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kV1a9I63VJgtZusXJubiT2c7iBab2YVH7BXD3OgkW3jDb0liujEjzE30Khyj4PpzrVvTb+6RbKfU5GclSc0bvuS2/CqKz8vObVk2Rk7GKP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2165
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linkmauve@linkmauve.fr" <linkmauve@linkmauve.fr>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rw-r-r-0644@protonmail.com" <rw-r-r-0644@protonmail.com>, "joel@jms.id.au" <joel@jms.id.au>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "j.ne@posteo.net" <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCllvdXIgc2VyaWVzIGRvZXNuJ3QgYXBwbHkgYW55bW9yZSwgY2FuIHlvdSByZWJhc2Ug
Pw0KDQpUaGFua3MNCkNocmlzdG9waGUNCg0KTGUgMjgvMDYvMjAyMiDDoCAxNTozMSwgQXNoIExv
Z2FuIGEgw6ljcml0wqA6DQo+IFRoZSBmb2xsb3dpbmcgcGF0Y2hlcyBhZGQgYmFzaWMgc3VwcG9y
dCBmb3IgdGhlIE5pbnRlbmRvIFdpaSBVIHZpZGVvDQo+IGdhbWUgY29uc29sZSwgYSBQb3dlclBD
IHN5c3RlbSBzb21ld2hhdCBzaW1pbGFyIHRvIHRoZSBHYW1lQ3ViZSBhbmQNCj4gV2lpLg0KPiAN
Cj4gVGhpcyBpbmNsdWRlczoNCj4gLSBkZXZpY2V0cmVlIHNvdXJjZQ0KPiAtIGJvb3R3cmFwcGVy
IHN1cHBvcnQNCj4gLSB1ZGJnIGNvbnNvbGUgdG8gYm9vdGxvYWRlcg0KPiAtIGVhcmx5IHVkYmcg
Y29uc29sZQ0KPiAtIGludGVycnVwdCBjb250cm9sbGVycw0KPiAtIHBsYXRmb3JtIHN1cHBvcnQN
Cj4gLSByZWNvZ25pdGlvbiBvZiB0aGUgRXNwcmVzc28gcHJvY2Vzc29yDQo+IC0gd29ya2Fyb3Vu
ZCBmb3IgdGhlIGRpc2NvbnRpZ3VvdXMgUkFNIGJsb2Nrcw0KPiANCj4gVGhpcyBpcyBlbm91Z2gg
dG8gYm9vdCBvbiBoYXJkd2FyZS4gZG1lc2cgcGljcyAod2l0aCBhIHNtYWxsIGhhY2sgdG8NCj4g
dWRiZy1pbW1vcnRhbCwgbm90IGluY2x1ZGVkKToNCj4gTGluazogaHR0cHM6Ly93aWtpLmxpbnV4
LXdpaXUub3JnL2ltYWdlcy83LzdlL01haW5saW5lLWluaXRpYWwtZG1lc2cxLnBuZw0KPiBMaW5r
OiBodHRwczovL3dpa2kubGludXgtd2lpdS5vcmcvaW1hZ2VzLzkvOTEvTWFpbmxpbmUtaW5pdGlh
bC1kbWVzZzIucG5nDQo+IA0KPiBGb3IgdGhvc2Ugd2hvIGhhdmUgaGFyZHdhcmUgYW5kIHdvdWxk
IGxpa2UgdG8gdHJ5IHRoZXNlIHBhdGNoZXMsIHNvbWUNCj4gbW9kaWZpY2F0aW9uIGlzIHJlcXVp
cmVkIHRvIHRoZSBzdG9jayBPUyB0byBhbGxvdyBMaW51eC4gRm9yIGluZm86DQo+IGh0dHBzOi8v
d2lraS5saW51eC13aWl1Lm9yZy93aWtpL0FkdmFuY2VkU2V0dXANCj4gDQo+IFNvbWUgb2YgdGhl
IGRlc2lnbiBjaG9pY2VzIChuZXcgcGxhdGZvcm0gPiBlbWJlZGRlZDZ4eCkgd2VyZSBkaXNjdXNz
ZWQNCj4gcHJldmlvdXNseToNCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8w
MDIwZDQ3Yy0wZTIzLTgyMmMtMzNmNS1jY2I3ZWE0YzEwNzJAaGV5cXVhcmsuY29tL1QvDQo+IA0K
PiBUdXJucyBvdXQgZXZlbiBsZXNzIGNoYW5nZXMgd2VyZSBuZWVkZWQgdGhhbiBwcmV2aW91c2x5
IGFudGljaXBhdGVkIGZvcg0KPiBkaXNjb250aWd1b3VzIG1lbW9yeSwgYW5kIEtVQVAgaXMgeWV0
IHRvIGdpdmUgdHJvdWJsZS4gVGhhbmtzIHRvIHRob3NlDQo+IHdobyBoZWxwZWQgYW5kIGRpc2N1
c3NlZCB0aGlzLg0KPiANCj4gQ2hhbmdlcyBzaW5jZSB2MjoNCj4gICAtIEZpeGVkIHNvbWUgb3Zl
cnplYWxvdXMgZGVsZXRpbmcgaW4gdGhlIGRldmljZXRyZWUsIG9vcHMuDQo+ICAgLSBGaXhlZCBt
aXNzaW5nIGRlY2xhcmF0aW9ucyBmb3Igc29tZSBmdW5jdGlvbnMgKHRoYW5rcyByb2JvdHMpDQo+
ICAgLSBGaXhlZCBzb21lIGNoZWNrcGF0Y2ggd2FybmluZ3MuDQo+ICAgLSBNYXJrIGxhdHRlIGFz
IGEgc2ltcGxlLWJ1cyBhbmQgdXNlIG9mX3BsYXRmb3JtX2RlZmF1bHRfcG9wdWxhdGUuDQo+IENo
YW5nZXMgc2luY2UgdjE6DQo+ICAgLSBTdHlsZSBhbmQgZm9ybWF0dGluZyB0d2Vha3MgdG8gdGhl
IGRldmljZXRyZWUsIHRoYW5rcyBSb2IgSGVycmluZyBmb3INCj4gICAgIHRoZSByZXZpZXcuDQo+
IA0KPiBBc2ggTG9nYW4gKDEyKToNCj4gICAgZHQtYmluZGluZ3M6IHdpaXU6IERvY3VtZW50IHRo
ZSBOaW50ZW5kbyBXaWkgVSBkZXZpY2V0cmVlDQo+ICAgIHBvd2VycGM6IHdpaXU6IGRldmljZSB0
cmVlDQo+ICAgIHBvd2VycGM6IHdpaXU6IGJvb3R3cmFwcGVyIHN1cHBvcnQNCj4gICAgcG93ZXJw
Yzogd2lpdTogaW50cm9kdWNlIHdpaXUgcGxhdGZvcm0NCj4gICAgcG93ZXJwYzogd2lpdTogZGVj
bGFyZSBhcyBub24tY29oZXJlbnQNCj4gICAgcG93ZXJwYzogd2lpdTogdWRiZyBzdXBwb3J0IGZv
ciBsYXR0ZWlwYw0KPiAgICBwb3dlcnBjOiB3aWl1OiBlc3ByZXNzbyBpbnRlcnJ1cHQgY29udHJv
bGxlciBzdXBwb3J0DQo+ICAgIHBvd2VycGM6IHdpaXU6IGxhdHRlIGludGVycnVwdCBjb250cm9s
bGVyIHN1cHBvcnQNCj4gICAgcG93ZXJwYzogZXNwcmVzc28gcHJvY2Vzc29yIHN1cHBvcnQNCj4g
ICAgcG93ZXJwYzogd2lpdTogcGxhdGZvcm0gc3VwcG9ydA0KPiAgICBwb3dlcnBjOiB3aWl1OiBk
b24ndCBlbmZvcmNlIGZsYXQgbWVtb3J5DQo+ICAgIHBvd2VycGM6IHdpaXU6IGFkZCBtaW5pbWFs
IGRlZmF1bHQgY29uZmlnDQo+IA0KPiAgIC4uLi9iaW5kaW5ncy9wb3dlcnBjL25pbnRlbmRvL3dp
aXUueWFtbCAgICAgICB8ICAyOCArKw0KPiAgIC4uLi9wb3dlcnBjL25pbnRlbmRvL3dpaXUvZXNw
cmVzc28tcGljLnlhbWwgICB8ICA0MiArKysNCj4gICAuLi4vYmluZGluZ3MvcG93ZXJwYy9uaW50
ZW5kby93aWl1L2dwdTcueWFtbCAgfCAgNDEgKysrDQo+ICAgLi4uL3Bvd2VycGMvbmludGVuZG8v
d2lpdS9sYXR0ZS1haGNpLnlhbWwgICAgIHwgIDQzICsrKw0KPiAgIC4uLi9wb3dlcnBjL25pbnRl
bmRvL3dpaXUvbGF0dGUtZHNwLnlhbWwgICAgICB8ICAzNSArKw0KPiAgIC4uLi9wb3dlcnBjL25p
bnRlbmRvL3dpaXUvbGF0dGUtcGljLnlhbWwgICAgICB8ICA0NiArKysNCj4gICAuLi4vcG93ZXJw
Yy9uaW50ZW5kby93aWl1L2xhdHRlLXNkaGNpLnlhbWwgICAgfCAgNDAgKysrDQo+ICAgLi4uL2Jp
bmRpbmdzL3Bvd2VycGMvbmludGVuZG8vd2lpdS9sYXR0ZS55YW1sIHwgIDI1ICsrDQo+ICAgYXJj
aC9wb3dlcnBjL0tjb25maWcuZGVidWcgICAgICAgICAgICAgICAgICAgIHwgICA5ICsNCj4gICBh
cmNoL3Bvd2VycGMvYm9vdC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgIDQgKw0KPiAg
IGFyY2gvcG93ZXJwYy9ib290L2R0cy93aWl1LmR0cyAgICAgICAgICAgICAgICB8IDMyNiArKysr
KysrKysrKysrKysrKysNCj4gICBhcmNoL3Bvd2VycGMvYm9vdC93aWl1LWhlYWQuUyAgICAgICAg
ICAgICAgICAgfCAxMDMgKysrKysrDQo+ICAgYXJjaC9wb3dlcnBjL2Jvb3Qvd2lpdS5jICAgICAg
ICAgICAgICAgICAgICAgIHwgIDczICsrKysNCj4gICBhcmNoL3Bvd2VycGMvYm9vdC93cmFwcGVy
ICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKw0KPiAgIGFyY2gvcG93ZXJwYy9jb25maWdzL3dp
aXVfZGVmY29uZmlnICAgICAgICAgICB8ICAgNyArDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL3VkYmcuaCAgICAgICAgICAgICAgIHwgICAxICsNCj4gICBhcmNoL3Bvd2VycGMva2VybmVs
L2NwdXRhYmxlLmMgICAgICAgICAgICAgICAgfCAgMTYgKw0KPiAgIGFyY2gvcG93ZXJwYy9rZXJu
ZWwvaGVhZF9ib29rM3NfMzIuUyAgICAgICAgICB8ICAyMCArKw0KPiAgIGFyY2gvcG93ZXJwYy9r
ZXJuZWwvdWRiZy5jICAgICAgICAgICAgICAgICAgICB8ICAgMyArDQo+ICAgYXJjaC9wb3dlcnBj
L21tL2luaXRfMzIuYyAgICAgICAgICAgICAgICAgICAgIHwgICA0ICstDQo+ICAgYXJjaC9wb3dl
cnBjL3BsYXRmb3Jtcy9LY29uZmlnICAgICAgICAgICAgICAgIHwgICAxICsNCj4gICBhcmNoL3Bv
d2VycGMvcGxhdGZvcm1zL0tjb25maWcuY3B1dHlwZSAgICAgICAgfCAgIDIgKy0NCj4gICBhcmNo
L3Bvd2VycGMvcGxhdGZvcm1zL01ha2VmaWxlICAgICAgICAgICAgICAgfCAgIDEgKw0KPiAgIGFy
Y2gvcG93ZXJwYy9wbGF0Zm9ybXMvd2lpdS9LY29uZmlnICAgICAgICAgICB8ICAyMiArKw0KPiAg
IGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvd2lpdS9NYWtlZmlsZSAgICAgICAgICB8ICAgNCArDQo+
ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy93aWl1L2VzcHJlc3NvLXBpYy5jICAgIHwgMTgzICsr
KysrKysrKysNCj4gICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3dpaXUvZXNwcmVzc28tcGljLmgg
ICAgfCAgNTkgKysrKw0KPiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvd2lpdS9sYXR0ZS1waWMu
YyAgICAgICB8IDI1OSArKysrKysrKysrKysrKw0KPiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMv
d2lpdS9sYXR0ZS1waWMuaCAgICAgICB8ICAyMyArKw0KPiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9y
bXMvd2lpdS9zZXR1cC5jICAgICAgICAgICB8ICA2MCArKysrDQo+ICAgYXJjaC9wb3dlcnBjL3Bs
YXRmb3Jtcy93aWl1L3VkYmdfbGF0dGVpcGMuYyAgIHwgMTI0ICsrKysrKysNCj4gICBhcmNoL3Bv
d2VycGMvcGxhdGZvcm1zL3dpaXUvdWRiZ19sYXR0ZWlwYy5oICAgfCAgMjcgKysNCj4gICAzMiBm
aWxlcyBjaGFuZ2VkLCAxNjMyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlcnBj
L25pbnRlbmRvL3dpaXUueWFtbA0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXJwYy9uaW50ZW5kby93aWl1L2VzcHJlc3NvLXBpYy55
YW1sDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9wb3dlcnBjL25pbnRlbmRvL3dpaXUvZ3B1Ny55YW1sDQo+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlcnBjL25pbnRlbmRvL3dp
aXUvbGF0dGUtYWhjaS55YW1sDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlcnBjL25pbnRlbmRvL3dpaXUvbGF0dGUtZHNwLnlhbWwN
Cj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3Bvd2VycGMvbmludGVuZG8vd2lpdS9sYXR0ZS1waWMueWFtbA0KPiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXJwYy9uaW50ZW5kby93
aWl1L2xhdHRlLXNkaGNpLnlhbWwNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VycGMvbmludGVuZG8vd2lpdS9sYXR0ZS55YW1sDQo+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcG93ZXJwYy9ib290L2R0cy93aWl1LmR0cw0KPiAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Bvd2VycGMvYm9vdC93aWl1LWhlYWQuUw0KPiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Bvd2VycGMvYm9vdC93aWl1LmMNCj4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9wb3dlcnBjL2NvbmZpZ3Mvd2lpdV9kZWZjb25maWcNCj4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy93aWl1L0tjb25maWcNCj4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy93aWl1L01ha2VmaWxlDQo+ICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvd2lpdS9lc3ByZXNzby1w
aWMuYw0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3dpaXUv
ZXNwcmVzc28tcGljLmgNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9wb3dlcnBjL3BsYXRm
b3Jtcy93aWl1L2xhdHRlLXBpYy5jDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcG93ZXJw
Yy9wbGF0Zm9ybXMvd2lpdS9sYXR0ZS1waWMuaA0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L3Bvd2VycGMvcGxhdGZvcm1zL3dpaXUvc2V0dXAuYw0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBh
cmNoL3Bvd2VycGMvcGxhdGZvcm1zL3dpaXUvdWRiZ19sYXR0ZWlwYy5jDQo+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvd2lpdS91ZGJnX2xhdHRlaXBjLmgNCj4g
DQo+IA0KPiBiYXNlLWNvbW1pdDogMDNjNzY1YjBlM2I0Y2I1MDYzMjc2YjA4NmM3NmY3YTYxMjg1
NmE5YQ0K
