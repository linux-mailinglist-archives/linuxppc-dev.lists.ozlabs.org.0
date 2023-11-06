Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A817E24AE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 14:24:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=QK7hgYo8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPBrp42b7z3cR4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 00:24:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=QK7hgYo8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62c; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2062c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPBqy32rsz2xTl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 00:23:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCPbHFzcGJ5NGnSw+sQb5tcUYwgMung2ij7sEycP6UrPA7tofWYcYcQcsGJA4SwaExQv61AAARKEyLWoxqDCYrINrWePOYMwvSZPV4Ok/WR0lBEVptkZDYoaJJTVfdOsr5hXp1AvrKVlN4+mGuMfj7aT1t5kOcL9uy3fcQnBfwUtMOG10eBvskVmjePo+wvW8cwi+9MgnoDRXxdtEp4JolKnvP0QuQY/RQsH62hm2MdG/fVYsrDW2IdrGVRRsb4XDVviVE8Fvsfg0pW3ZiI4x5YqMbPJCZHgDMxRsVf62xT4Fordna+M3SAaNheg1A4H59kazL6YYvC6cJ2TUd7kJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJPSrLZg9Wm/kJtaM674LvYEsirZCWvxZH3soeXGubQ=;
 b=C0dx5O0yhJXdH2Qf2ysXu4wP+fhmsrpwkstKKcbi9ZdClP+ii+sUlzvX6aGAW2zEEUkGOaLBdcZ/V26q/aRWdxAY5+jSTR7hXWtQKYn60eWWhilnkdHtnpN7kMyky+RmFGyIavfxjnLZcDA6Z8JvtlHPBeLS0qzO+DKqfme+YEpszmGMQA4cXlDYgQTwY7jESBXNZF5DbR6lYe/bDk1EtlWXBfXVql4Iz3b5dUZZhuel+YPVZqh8ikXrkjmisBpSzFjiBTcj0aKgJv7++An8bjK4ABEyYnf+MT+SngdDbqv7TY5O147tm8Ina+OaicckIimSUAlqOibeUNzAOIOWtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJPSrLZg9Wm/kJtaM674LvYEsirZCWvxZH3soeXGubQ=;
 b=QK7hgYo8FzKEYhvAQb4OgINuGo4YN0aLoCQAUqeYYTreLELniHvEv1i2eBUz0X+D2kkTVWThg95rq2pxElfZuInzIsizWKT0QV++0v+FIMHYxTitosdy0skobFiYRTZin911wI7zPO5S2oD9XGbucJ4JYwdOaMom225OqeqGNXEDV70FKujArMBtyTp8aMYgGcm8MmpU7DY+3cnF4ggYIY2jrakJN6LM928XE/GgvrtujiK5WWyV+Ebi0t/zfCQp3d4LwdmFPTk0kiY8lIgk4IOpJSM4QaTbcc+15dftuCRbCx00mlDuDXr5F7mXiNFghZg2gqknIK2ca0D/7k75uQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1612.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:167::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.16; Mon, 6 Nov
 2023 13:23:05 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.6977.016; Mon, 6 Nov 2023
 13:23:05 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 37/37] powerpc: Support execute-only on all powerpc
Thread-Topic: [PATCH v2 37/37] powerpc: Support execute-only on all powerpc
Thread-Index: AQHZ796dDkzQ9RA0FEmhJpkipCuR2LBmvjGAgAbK0YA=
Date: Mon, 6 Nov 2023 13:23:05 +0000
Message-ID: <efcfb376-5b43-4f35-e1d2-8cfce782ae3d@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
 <4283ea9cbef9ff2fbee468904800e1962bc8fc18.1695659959.git.christophe.leroy@csgroup.eu>
 <874ji4af3a.fsf@linux.ibm.com>
In-Reply-To: <874ji4af3a.fsf@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1612:EE_
x-ms-office365-filtering-correlation-id: 26f375fa-67ee-4584-f7bd-08dbdecb8294
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Dky9hlllfEXzK2UOW9umNeDyxkRPvu7mHNuY25EAYGQMMDAZ/BL69hFc1Xat5aTRMq6WjXKuxx6zU9xWmhHFfU73XTKzqxc6U1+xqsxjrCozr3gOVOmPKOLZZpVQAzHOtAAa2xB+sFgfRxyZ5trc4t36Xo2ymD3zPcREt/GXQpVesvgu8ghiJuC6V6YpwB9rqLYEIEwFaoLWWBRunk1Zbfh+g+6lR9Y2BDTISUc8ulT6bgpFhSpKxpE98J4s2iVhNr4xAQT5F3cU1Ix6xpbP8rnP9m3dS7BbFgYM+oIA30zSBlXNLWoZe1FxEdVo2N9xDO+SSkvu6GmQBG9dOFH/LeHUJ5I36IxUdhX8XShN9ZyTWUPQQ3VqEtBX7HW4BfWwC4/4wKDGcwnrM7zq57AMvKiXJbCSC2Jnv5j5y7TDoNAIxU1AfO/V7rrSCaP6y7Hu6+6XEckg7sz4B291Tv7FToQB+MXQHDK21OsiRuFDrcE56+DaPleb3qwwB2ZSne9OQR2iBhL3lez+fcbzWFOELpB6nNF9uQ+PRzMarMBtKJWDFX9vjMe+pCsqieQ4/NjF9n+L9R7BB1bGbvC0TTTTNCc9WYOsXiNnSLgCUjvDa1LsD2M5P1A3xR9oepaEAlkscJd/WNHnzHxINsVf+ZbZBZHsUn3/xp5WDB7rI8nv8x0=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39850400004)(376002)(136003)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6506007)(6512007)(2616005)(478600001)(6486002)(966005)(71200400001)(83380400001)(110136005)(26005)(66574015)(2906002)(5660300002)(44832011)(66946007)(66476007)(91956017)(66556008)(66446008)(41300700001)(316002)(76116006)(8676002)(4326008)(8936002)(54906003)(38070700009)(64756008)(38100700002)(36756003)(31696002)(86362001)(122000001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?U1Bzb1RQa2lncWZ0ZnhpYkF5S21oTlhuZVdUdFczYUFaS0lqdVdFaXhvZ3hZ?=
 =?utf-8?B?TTFxbk5qQlBnWjYydmc2Z2J6azlSektvamRrbU9wZW1TbElHK1Nyd3hEUW1y?=
 =?utf-8?B?WGVCSFZlOHFwSmQ4YnpXYU1ENkdORFpFMWZSVzlrNDlNTkdiOTdIWW5tUkNY?=
 =?utf-8?B?aWNqb0RLcnZXdmlQQUgvbG1IVFAyYkVWMnc3d1JJblJVS2k5UXJOa21Bd3pC?=
 =?utf-8?B?Y2I0Mmc4dWl5YzAwQnN0ME40MXh4WU9KQzBGOTZhYTUvWmg3T0dCTDYxZnU2?=
 =?utf-8?B?ZFNCNWRSUzJoU091QUNzUFVWbzZMc2NuRTZ0Y0lBTnUzL0IyMFllQjdMcnNS?=
 =?utf-8?B?MGlybWo0bTZ6Q2p6NC9oMHpXS1hxTkdkeHZMK1I5UUs4b0kwcE9LTkJKRmYw?=
 =?utf-8?B?clAyeWxaaWtxYzIxN1N1cmV6UzJ4dXM1UGhwRFZWemI5S2NFbHQ5czNvc0sv?=
 =?utf-8?B?ZGY0YnpCRGttaENsc0VNdjg2SEVUak1Sb3g5MkYxR09XQ1Z5Rk5NaS9sdGZI?=
 =?utf-8?B?T1ArSks2bDYxU1dPYVpWNjJjQ0s2dFZrSjZzYmFXd3JiZHRhR0NVY0VRenp2?=
 =?utf-8?B?OERNK0lydlF6aXQxa3pjWFF5MThGUndwVlZlMDJaUmNnZ1dZSXBqVjZSb2FB?=
 =?utf-8?B?aDAwMzlINFRLNThESXdGelEzam0xbUZZWFJpTlliTnBLU0Zjajcya0dNM0FV?=
 =?utf-8?B?YXFHT0oyRUJlR0N5N2RhdDFlTFN4R3o4UEU0bVJrUkU2TVNmc29hb05ZNnpP?=
 =?utf-8?B?eW5neElJb1RWUzBwWER4dnNhY0wxeHBWKzdPOWdESWcyODFnd01Sd0hjZUwv?=
 =?utf-8?B?K3Ura3FLR2V5Z1BNbnpRWEFKcFdBQVhkaEV0ay91ZWFiVFRZQk00SDNrbDE0?=
 =?utf-8?B?azlWNjZUNFZ5TmViN0RHVCtjQnBMZVJWeEZrbTNDWWl6U0Z2azlsUWp4dWd1?=
 =?utf-8?B?TkpqRllGUUNMRlZvMXdDdVJ5RElPRllzRjdBdFNFRlQwbkd3aTFJNitKZWRM?=
 =?utf-8?B?Q0VieTlmQ0F5MnlORW9oWWtMdmVtNlBYdjZrdjlkZ0FkUmJtWmFmQWJxYmpM?=
 =?utf-8?B?cTU1UUo5NTgvVFMxYmdiY2ZiT05pMiszazlndlR4TnhvRW5PRWRVZ0g2S0lS?=
 =?utf-8?B?ZFNTRTEveTltRjk2UXl6SUhLVExUWUZ4Q0ZlK3F0ZkxmQmU3WEMxeEJ4UWJZ?=
 =?utf-8?B?RGZvajRDZm1Nc0lXVkZlaHdPa1FPYkozRUJZSDVTNWlqdWV1MG13bTJpWlo5?=
 =?utf-8?B?Q0JvSFNIQm9VZDRyQ1Z5UVdQdmVGdXExQVFhVXpOaVNFV2VsdmJrK1N3akx5?=
 =?utf-8?B?SFdWelZzTWl5Q0lUQ2MvK0MzQkVWajNweW9NRitIajlYd2loYXNnM0tXRDA3?=
 =?utf-8?B?bmpDSnZoN1U0VDM5SmZsZ2RrZTR2MXVVT1hjeUhza3lLREhvNnluYjZxSWht?=
 =?utf-8?B?dzZyKzNzbDZObnhtSGVVMysza0w0SnI3UHRSU3I1THg3ZVV4YmhWV0xRb1Ja?=
 =?utf-8?B?Njh5amhxVjkrTkJhNVRudm5kamVjYWMwN1o0ZCs5V282RG9IY0hJajZoOFg1?=
 =?utf-8?B?Y21xUGdRakxGZGVTUWhReUFXV1pLamEvRXEyZ3dXdzBRQzYxaEI3b0NITlQy?=
 =?utf-8?B?MlcwRkREcHBWTkdpTlY0YStudXFjamVmQ1BNcExQdHlHbFQzeEIydWRWT2cw?=
 =?utf-8?B?RWtvWXIvNlBFWnIxVW83SjJqV2tDblRmUGdzYmYwVlZSTkdKQkZkZUJkVE9U?=
 =?utf-8?B?Z2NsTTdKc1NVa1lIb2Zya0QvamJVd2VsdEFGMjlKc25iK1NqTm9QaHJVYitH?=
 =?utf-8?B?bHViME5jalVYbUt2MEVSQTVqdmV3aFdlbVJEblptNDFWalNlMkU2OUwranJi?=
 =?utf-8?B?dUJLVUI4QkpNZDhJV3AyZFlVM1VUTlE0Z1A0Mzd0WGFkNHZXUmp2SXJ6WEpo?=
 =?utf-8?B?TDBzcitEMFhXckJnT2hVMnJZbEQwR2dKOSs2Qk94VmRxak9Fajdab0UybExh?=
 =?utf-8?B?M2xlb1pWUC9OeFVwYVhORDdUT0hOTEJhOU52aDJjbUFkWU9XM3ZkMG42QUZr?=
 =?utf-8?B?Y2xkUFlFOVFYMGtKU2I1RU9MeDBYN0VVNE4rNnNiT3BkVElzNHpmOFNWTGVn?=
 =?utf-8?B?RDFnRFM5TGdyeTJieVpUanZKZ3YxaEE5YlJOc21FakE5eVJKNUlEOEF2dmRY?=
 =?utf-8?B?OXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51939473FF367144A5097EC5AF128E92@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f375fa-67ee-4584-f7bd-08dbdecb8294
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 13:23:05.3361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BImHEQHYkp86BHWrW7mlNrCY9HDLhghBT5yKgOWWU4y6Cq+K8/oZkPA7YQjRfJrldmTonEpq8Be4RN0PR4WgYHhZpvnIn5XQEZIlmwblhzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1612
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAyLzExLzIwMjMgw6AgMDY6MzksIEFuZWVzaCBLdW1hciBLLlYgYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+IA0KPj4gSW50cm9kdWNlIFBBR0VfRVhFQ09OTFlfWCBtYWNybyB3aGljaCBwcm92aWRlcyBl
eGVjLW9ubHkgcmlnaHRzLg0KPj4gVGhlIF9YIG1heSBiZSBzZWVuIGFzIHJlZHVuZGFudCB3aXRo
IHRoZSBFWEVDT05MWSBidXQgaXQgaGVscHMNCj4+IGtlZXAgY29uc2lzdGFuY3ksIGFsbCBtYWNy
b3MgaGF2aW5nIHRoZSBFWEVDIHJpZ2h0IGhhdmUgX1guDQo+Pg0KPj4gQW5kIHB1dCBpdCBuZXh0
IHRvIFBBR0VfTk9ORSBhcyBQQUdFX0VYRUNPTkxZX1ggaXMNCj4+IHNvbWVob3cgUEFHRV9OT05F
ICsgRVhFQyBqdXN0IGxpa2UgYWxsIG90aGVyIFNPTUVUSElOR19YIGFyZQ0KPj4ganVzdCBTT01F
VEhJTkcgKyBFWEVDLg0KPj4NCj4+IE9uIGJvb2szcy82NCBQQUdFX0VYRUNPTkxZIGJlY29tZXMg
UEFHRV9SRUFET05MWV9YLg0KPj4NCj4+IE9uIGJvb2szcy82NCwgYXMgUEFHRV9FWEVDT05MWSBp
cyBvbmx5IHZhbGlkIGZvciBSYWRpeCBhZGQNCj4+IFZNX1JFQUQgZmxhZyBpbiB2bV9nZXRfcGFn
ZV9wcm90KCkgZm9yIG5vbi1SYWRpeC4NCj4+DQo+PiBBbmQgdXBkYXRlIGFjY2Vzc19lcnJvcigp
IHNvIHRoYXQgYSBub24gZXhlYyBmYXVsdCBvbiBhIFZNX0VYRUMgb25seQ0KPj4gbWFwcGluZyBp
cyBhbHdheXMgaW52YWxpZCwgZXZlbiB3aGVuIHRoZSB1bmRlcmx5aW5nIGxheWVyIGRvbid0DQo+
PiBhbHdheXMgZ2VuZXJhdGUgYSBmYXVsdCBmb3IgdGhhdC4NCj4+DQo+PiBGb3IgOHh4LCBzZXQg
UEFHRV9FWEVDT05MWV9YIGFzIF9QQUdFX05BIHwgX1BBR0VfRVhFQy4NCj4+IEZvciBvdGhlcnMs
IG9ubHkgc2V0IGl0IGFzIGp1c3QgX1BBR0VfRVhFQw0KPj4NCj4+IFdpdGggdGhhdCBjaGFuZ2Us
IDh4eCwgZTUwMCBhbmQgNDR4IGZ1bGx5IGhvbm9yIGV4ZWN1dGUtb25seQ0KPj4gcHJvdGVjdGlv
bi4NCj4+DQo+PiBPbiA0MHggdGhhdCBpcyBhIHBhcnRpYWwgaW1wbGVtZW50YXRpb24gb2YgZXhl
Y3V0ZS1vbmx5LiBUaGUNCj4+IGltcGxlbWVudGF0aW9uIHdvbid0IGJlIGNvbXBsZXRlIGJlY2F1
c2Ugb25jZSBhIFRMQiBoYXMgYmVlbiBsb2FkZWQNCj4+IHZpYSB0aGUgSW5zdHJ1Y3Rpb24gVExC
IG1pc3MgaGFuZGxlciwgaXQgd2lsbCBiZSBwb3NzaWJsZSB0byByZWFkDQo+PiB0aGUgcGFnZS4g
QnV0IGF0IGxlYXN0IGl0IGNhbid0IGJlIHJlYWQgdW5sZXNzIGl0IGlzIGV4ZWN1dGVkIGZpcnN0
Lg0KPj4NCj4+IE9uIDYwMyBNTVUsIFRMQiBtaXNzZWQgYXJlIGhhbmRsZWQgYnkgU1cgYW5kIHRo
ZXJlIGFyZSBzZXBhcmF0ZQ0KPj4gRFRMQiBhbmQgSVRMQi4gRXhlY3V0ZS1vbmx5IGlzIHRoZXJl
Zm9yZSBub3cgc3VwcG9ydGVkIGJ5IG5vdCBsb2FkaW5nDQo+PiBEVExCIHdoZW4gcmVhZCBhY2Nl
c3MgaXMgbm90IHBlcm1pdHRlZC4NCj4+DQo+PiBPbiBoYXNoICg2MDQpIE1NVSBpdCBpcyBtb3Jl
IHRyaWNreSBiZWNhdXNlIGhhc2ggdGFibGUgaXMgY29tbW9uIHRvDQo+PiBsb2FkL3N0b3JlIGFu
ZCBleGVjdXRlLiBOZXZlcnRoZWxlc3MgaXQgaXMgc3RpbGwgcG9zc2libGUgdG8gY2hlY2sNCj4+
IHdoZXRoZXIgX1BBR0VfUkVBRCBpcyBzZXQgYmVmb3JlIGxvYWRpbmcgaGFzaCB0YWJsZSBmb3Ig
YSBsb2FkL3N0b3JlDQo+PiBhY2Nlc3MuIEF0IGxlYXN0IGl0IGNhbid0IGJlIHJlYWQgdW5sZXNz
IGl0IGlzIGV4ZWN1dGVkIGZpcnN0Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUg
TGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4+IENjOiBSdXNzZWxsIEN1cnJl
eSA8cnVzY3VyQHJ1c3NlbGwuY2M+DQo+PiBDYzogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1
bS5vcmc+DQo+PiAtLS0NCj4+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy8zMi9w
Z3RhYmxlLmggfCAgMiArLQ0KPj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0
L3BndGFibGUuaCB8ICA0ICstLS0NCj4+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFz
aC8zMi9wdGUtOHh4LmggfCAgMSArDQo+PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hh
c2gvcGd0YWJsZS5oICAgIHwgIDIgKy0NCj4+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25v
aGFzaC9wdGUtZTUwMC5oICAgfCAgMSArDQo+PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9w
Z3RhYmxlLW1hc2tzLmggICAgIHwgIDIgKysNCj4+ICAgYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0
L3BndGFibGUuYyAgICAgICAgICAgfCAxMCArKysrLS0tLS0tDQo+PiAgIGFyY2gvcG93ZXJwYy9t
bS9mYXVsdC5jICAgICAgICAgICAgICAgICAgICAgIHwgIDkgKysrKystLS0tDQo+PiAgIGFyY2gv
cG93ZXJwYy9tbS9wZ3RhYmxlLmMgICAgICAgICAgICAgICAgICAgIHwgIDQgKystLQ0KPj4gICA5
IGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL3BndGFibGUu
aCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvMzIvcGd0YWJsZS5oDQo+PiBpbmRl
eCAyNDQ2MjFjODg1MTAuLjUyOTcxZWUzMDcxNyAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9ib29rM3MvMzIvcGd0YWJsZS5oDQo+PiArKysgYi9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vYm9vazNzLzMyL3BndGFibGUuaA0KPj4gQEAgLTQyNSw3ICs0MjUsNyBAQCBz
dGF0aWMgaW5saW5lIGJvb2wgcHRlX2FjY2Vzc19wZXJtaXR0ZWQocHRlX3QgcHRlLCBib29sIHdy
aXRlKQ0KPj4gICB7DQo+PiAgIAkvKg0KPj4gICAJICogQSByZWFkLW9ubHkgYWNjZXNzIGlzIGNv
bnRyb2xsZWQgYnkgX1BBR0VfUkVBRCBiaXQuDQo+PiAtCSAqIFdlIGhhdmUgX1BBR0VfUkVBRCBz
ZXQgZm9yIFdSSVRFIGFuZCBFWEVDVVRFDQo+PiArCSAqIFdlIGhhdmUgX1BBR0VfUkVBRCBzZXQg
Zm9yIFdSSVRFDQo+PiAgIAkgKi8NCj4+ICAgCWlmICghcHRlX3ByZXNlbnQocHRlKSB8fCAhcHRl
X3JlYWQocHRlKSkNCj4+ICAgCQlyZXR1cm4gZmFsc2U7DQo+Pg0KPiANCj4gU2hvdWxkIHRoaXMg
bm93IGJlIHVwZGF0ZWQgdG8gY2hlY2sgZm9yIEVYRUMgYml0ID8NCg0KSSBkb24ndCB0aGluayBz
byBiYXNlZCBvbiB3aGF0IEkgc2VlIGluIGFybTY0OiANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L3Y2LjYvc291cmNlL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vcGd0YWJsZS5oI0wx
NDYNCg0KQ2hyaXN0b3BoZQ0K
