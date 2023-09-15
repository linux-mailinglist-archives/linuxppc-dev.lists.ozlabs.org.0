Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D81047A151C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 07:06:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=RQnIhUl1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn2Gf5Chcz3dD9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 15:06:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=RQnIhUl1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::628; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn2Fj4WS9z3bxY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 15:05:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8BaiHbRhdoNrNkcY52YR8o45q1h7/A2bglB2LVfOdNaGyt2QKoWy8X1uMwWltNLfYcwsAYi9ZP5i4HTbtSqC2xD1myBV3y5QyFfcBNvOwUnedZF8tQMVW/yjiByyB8ZhQKV0RlFLf0PjVoCi9W55DT7OFPbFApt+NpUCnnFtWVjN4NehTWn0DeJDOnYbU+Xj11cCxkgAR+JVad/549zsHjRl62+Ln6u2CIh/3jIKXv+bQJcsB1PPMBqa0ObpD7sX2R79xi0MTT1iQxl9s7ajHKPuKkBo5uq+ur5pyVBJa+jyVsuDdHwEtkSehuIzPeaolrWBJwTHaq6raM2shvs5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqqrAPdyjvvJA1dYAZU7Typa555c+MdIk0w8etrn5Ow=;
 b=a90+1zODwvdcOADRoUlkxto3OgypVLklORsGLTS5iA0COXQt+fY2AI1qeO6faMXL4dKtcp35WHY93PK8XOXzAmNAHQ45bAOJssto1U0cFzESCfFsu+1T1ONb3lDMEtSaN0uaVabfr91A1HePj/jwpq39B5OpaQgad2KY/GboW/GkXVAr/g5/Ip60ZYrktTLlAGK7CxmHQSOETdSY3Bl3CWjlPr20f8f9ScbVJkwZdyjKsofJR7rveTaJ6djzjNNIcpgxcyfFrcvtcdW5H/cExORS2fcBjq20v60ecLY8oMhm1Oka11sOt0SrB1zz0XsajrnfhDtNJkHUiNywK6c91g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqqrAPdyjvvJA1dYAZU7Typa555c+MdIk0w8etrn5Ow=;
 b=RQnIhUl1aDKaMlOFXJ4D2fklYswx9Y5UrVngabfaVRu/MoO9zTpzw6W7f9zkKIqH2QtX2FHrdnIPZy/8l+PdurmVDnn/JkmxPITbmXT5gdEHijWhKzJV1Wj9m2Fj2V16y5OSmhTQ2XSpMLQphtpsenN3Pubh7R9MexxPXzdBPSPqd5wdCFo9xp8nOUa3OPj8Mg244Jq2NNcuYt24MurV2cykJJYG7zvqN92mWeNQifOfdAc7Neo+KPynoMJeTn9fkkWaDmK/JmwfDrjhgzu2j/ga0VW38cRSfOS+nSN8AI2xSYI5xuaCXgEX9zLxJOuugDVsj6WKIvtUaG0DHhzhsQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3418.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:181::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Fri, 15 Sep
 2023 05:05:21 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6792.021; Fri, 15 Sep 2023
 05:05:21 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/82xx: Select FSL_SOC
Thread-Topic: [PATCH] powerpc/82xx: Select FSL_SOC
Thread-Index: AQHZ5x+BaAGcyaRyjEqAtwm8NNEjybAbDSyAgABJBQA=
Date: Fri, 15 Sep 2023 05:05:21 +0000
Message-ID: <c481fa91-0cfb-1c19-2da7-cf768bc56aea@csgroup.eu>
References:  <7ab513546148ebe33ddd4b0ea92c7bfd3cce3ad7.1694705016.git.christophe.leroy@csgroup.eu>
 <87led86zaq.fsf@mail.lhotse>
In-Reply-To: <87led86zaq.fsf@mail.lhotse>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3418:EE_
x-ms-office365-filtering-correlation-id: 3867ec5c-fd17-4cc9-8c07-08dbb5a95ca6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  bPk4srsZTZ58p5OHUk/Y7xsLnQ3cupOB74KkY0yB49vGmZyxJsMwf+6Ady5w/ZrWPpHd0m+/LkKHEwCOsh+16V3sOE3HGVpFauKXiLE7dBVym8lzueNvJA875pD+XArhLwMOGaK+2o3ENshgNn3/aIcXzCwFPMTgqjLqEA8rBQW23CnjQvRPpOEDJgGpOc2e/gmqUb9i7QLZWb4TwFkdVr1GXN0uZiq0fHYvz2S4MF2U4z8iNWcnE5YeMa9EdCqYYCBLl4lI7timw9ERAomU5Oue5OGpyAzIRt3eGafg+nOzzSHn3aYM02KqgYJePgLxlWlTDtd87zlCTMliuqZ3IzCnEhdw0NB+Ean+3N7ZqBEtHeVGDbpPVCXyQXMbjFk2NpeaACXXpTuI40SqkyPLajCHsts1m9DMbXXVGq8TeYHzW6/oEf+CFJ+/qKI6IJE+5yX0J2yW2EGXVW9HA7uxXQzStuvZeEquO92Mcvp4ezC6GgQ+JBKGBb1VcVWaBZ2omji+lfs5XzarAtL1uRlkCWnk2PytzbeD2GzuCs+1Bv9rAPhJtW/PyRTiotxVdWnOxiOgMtT/g8zfSohOm+dg8ZsdWuTK0Slx5qt9aRjtk8kH71ejGfGAfefR7nFZwS8Lt6iQc7rvGcONv8SzmlBOK7Uw2dmSMn6GGR/2rGkm1PPeH0jdsc7bGF4XKceDUR2M
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(136003)(366004)(346002)(376002)(451199024)(1800799009)(186009)(38100700002)(38070700005)(66574015)(41300700001)(110136005)(36756003)(91956017)(122000001)(316002)(8936002)(8676002)(2906002)(66946007)(66556008)(76116006)(4326008)(66476007)(44832011)(66446008)(64756008)(6512007)(54906003)(71200400001)(6506007)(5660300002)(6486002)(83380400001)(26005)(86362001)(31696002)(2616005)(31686004)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dmVmbWQwZ24yYzZuNllZMjBEYnNmdFIxTFJuc0RIZXBOUm81eEp6WEh5aXVo?=
 =?utf-8?B?ZzM1d0FYY1JGeFFsSGhLZnR0MzlYWWkrTW1vL3lhaDdOU3VZR1haVWxDMnRQ?=
 =?utf-8?B?RFJ2UE9yLzhuU08zYnJXSkRHQ3NYZ2lDQkZycEtaMUhZalRJaXR4dVhNQ0lZ?=
 =?utf-8?B?UndTTjRMVG9IdHUxazNHQTlTOTZKV2t6UWhkT0Z2dThxRUllb0VwdVBjdmZs?=
 =?utf-8?B?NDRmL0NlNzF4NEIwSDdPNjl5WU5HS09xZzYrR0pVaisvdEx2NnBFNzhlTC8w?=
 =?utf-8?B?WHZja0tCODJwZTJaM1ZzY1lKR09YOGhpUllHVjh3ZWMrT3E0RjV6ekhIUWcw?=
 =?utf-8?B?Y1orYWhoQ1V5d1NYc0JzMnZjRW1Dbk9heG5Kd3pkczcxYm5kQ1lJd0NuVEY5?=
 =?utf-8?B?YTlOV2k0dERCNFVIb0JydTl5clB1UVdxaktFYkVkMkFwN2pRMWdQdEhrU1Rs?=
 =?utf-8?B?dlc0cEFiVmtPSGRVdDBNL0laQzg3OXJwdk84V0VCcnlrOVVXNUNOVUF4SS9H?=
 =?utf-8?B?OURnVFlGd1p3cENBZ09zTlhhazFta25ZaEF0b083YmZSaWtUVEM1Z05IZ09q?=
 =?utf-8?B?ekRHK2RoRkhWS0RPYlMzL3QvUi9uMWNET3ppcWhEdGxxaFNqZ3dmNXkxOGwv?=
 =?utf-8?B?QW1ZRy9mWWFVMGYrcUlxcGh1bm9uNnJ6dW5WUjlOT0NONk55NUJBRE5HaDhs?=
 =?utf-8?B?MzBvMWJaTmhZclRHb3NMaVBiemFpSlpaNkJrYzRmNzd3K1h4djExYjVJZFYr?=
 =?utf-8?B?c3p6RkgwNm9TUGF5SEFOVURVRjkvSzc5eWlHaG04OWRXSWJUWUFWU3NPNlpo?=
 =?utf-8?B?TjY2MDV6TVA5U2NzSmM1VXpOWXYxZ1hHL3pLUHhzMW1sNnc3TkNuZHd6OEZJ?=
 =?utf-8?B?YUdGMWJKQyt2N2xUWitHeUFycndPVGZBRTYycCtiYTIzU3M5SFV0OSt6bmQ2?=
 =?utf-8?B?OGxtOXZtbFJNK251RXJZcHFySFF3c3RnYXlGZzRkSzJGa3FyOU16L2ZVeVAz?=
 =?utf-8?B?UU5IS2cxaklYaUt6UTFPNjUvUGV4Rm9LRC9NK3prSytkcnVrU2xpclRNT3gy?=
 =?utf-8?B?M1BUeGlhTStTeGdjTEpnZzNiR3V5NGcrYUtrOTk2WUwxSEFyQzJpdEUrby83?=
 =?utf-8?B?TkZmT2ZQSlZxTkVUZHZZbHFQeDFXVXMvUlBDN2hGSWRRejl2QkRvczQ4c2ky?=
 =?utf-8?B?M1JmSnFydWdESEpzVkpwUkt4SU1VQ01hOStTV2JHMUJBbXZoZEZ5Y3Q0YTF3?=
 =?utf-8?B?KzFuSmJxUUYvVkxKK3FJSnByZFVENlVDUHN0ckpQZDlMVEpVMkVQcm9BWno2?=
 =?utf-8?B?aWZCOGY3UkFrN01GRFBzV0w4blhwd3BHY01UR3o0NXUrNHdRWHI3U0tucURI?=
 =?utf-8?B?dURMQ0hZZlAwK2Z0ZjdrNzEzT25CS003ZzNqUWJDQjBwbUdOU29uUUtlZjlV?=
 =?utf-8?B?eFZwaFZoak13cHlqc3Jmcm9NcE8vbG1mdjM3TGovNTlTYWNzbVFWOXpVWjZl?=
 =?utf-8?B?RWhTQ1Ixb2tZaU01UC9wd2JncjNVU2JLS0hCa25hWGUzYS8vVWRqV0ltaXdQ?=
 =?utf-8?B?Qlo4dzdLT1cxck5sYlJQczVObWZGTHZjY2F1UzRNWE8yTm1kMTlWWXNodFF3?=
 =?utf-8?B?QnpZbytkUTlkZFpXOVRna0ltY05BdTJ6c1lVRjRyTGlaTHVjak4vSEc3WDN1?=
 =?utf-8?B?TGVJUjlpRklua1RGNFR1WVFuVHNNeFQwbldwOHkxRVFWeEdpRGxDNkpOY0c4?=
 =?utf-8?B?amVndjJFVWZDZHZHWVJsbTE1UVRmTkdUdTRPdUtqcm95Rk5jM2FrbjJVNjJX?=
 =?utf-8?B?TXVpK2JnT0NNbXhhK0F4TUZiVTZ5eTFMeEFTSnozbmlDNUUwanZaSmtjYjlh?=
 =?utf-8?B?bHBhVGVVTXdmaTZ3anhJZTloTWxiSjBMMmxuZEszd1VNcVBOaEpXdUd4ckMv?=
 =?utf-8?B?UEhwaUlvZGtHV0tBS0FpN0h6RjRJcWhhV2YrOG1HRWkyazVHYTZVRFRxSmEw?=
 =?utf-8?B?aVk1ZGJNVUZTNVY4WDhUTm1YaU5taXdIaCtSZWwzZTh4Q2NYM1hPdHdiOWNn?=
 =?utf-8?B?bXJOUkZSVEIzUWhCcitKNU9SZ0hNMVZxeWZKOStOQU91UTJPcElSc1BicTV2?=
 =?utf-8?Q?LAcCev/Wd37kHBDFHvCGxi737?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2465177CBB33334BA337744C49C1A01E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3867ec5c-fd17-4cc9-8c07-08dbb5a95ca6
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2023 05:05:21.1148
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: //SOaI2nadY1TXjFYQiPzEBW88Qg7TOI75FifS3x889dg977pvkbzWu8ZbJtfJZDhwuufAlzdmlGpg4jwDDVSqbfvZn4xKNLeGJcCoE6ZMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3418
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
Cc: Randy Dunlap <rdunlap@infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE1LzA5LzIwMjMgw6AgMDI6NDMsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBJdCB1c2VkIHRvIGJlIGltcG9zc2libGUgdG8gc2VsZWN0IENPTkZJR19DUE0yIHdpdGhv
dXQgc2VsZWN0aW5nDQo+PiBDT05GSUdfRlNMX1NPQyBhdCB0aGUgc2FtZSB0aW1lIGJlY2F1c2Ug
Q09ORklHX0NQTTIgd2FzIGRlcGVuZGVudA0KPj4gb24gQ09ORklHXzgyNjAgYW5kIENPTkZJR184
MjYwIHdhcyBzZWxlY3RpbmcgQ09ORklHX0ZTTF9TT0MuDQo+Pg0KPj4gQnV0IGFmdGVyIGNvbW1p
dCBlYjVhYTIxMzcyNzUgKCJwb3dlcnBjLzgyeHg6IFJlbW92ZSBDT05GSUdfODI2MA0KPj4gYW5k
IENPTkZJR184MjcyIikgQ09ORklHX0NQTTIgZGVwZW5kcyBvbiBDT05GSUdfTVBDODJ4eCBpbnN0
ZWFkDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXg0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENPTkZJR19QUENfODJ4
eA0KPiANCj4gQWxsIHRoZSByZWZlcmVuY2VzIHRvIENPTkZJR19NUEM4Mnh4IHNob3VsZCBiZSBD
T05GSUdfUFBDXzgyeHggcmlnaHQ/DQo+IEkgY2FuIHVwZGF0ZSB3aGVuIGFwcGx5aW5nLg0KDQpB
aCByaWdodCwgSSBtaXhlZCB0aGluZ3MgdXAuIFRoaXMgaXMgQ09ORklHX1BQQ184Mnh4LCBDT05G
SUdfUFBDXzh4eCwgDQpDT05GSUdfUFBDXzgzeHggYW5kIENPTkZJR19QUENfTVBDNTEyeA0KDQo+
IA0KPiBjaGVlcnMNCj4gDQo+IA0KPj4gYnV0IENPTkZJR19NUEM4Mnh4IGRvZXNuJ3QgZGlyZWN0
bHkgc2VsZWN0cyBDT05GSUdfRlNMX1NPQy4NCj4+DQo+PiBGaXggaXQgYnkgZm9yY2luZyBDT05G
SUdfTVBDODJ4eCB0byBzZWxlY3QgQ09ORklHX0ZTTF9TT0MganVzdA0KPj4gbGlrZSBhbHJlYWR5
IGRvbmUgYnkgTVBDOHh4LCBNUEM1MTJ4LCBNUEM4M3h4LCBQUENfODZ4eC4NCj4+DQo+PiBSZXBv
cnRlZC1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+DQo+PiBGaXhlczog
ZWI1YWEyMTM3Mjc1ICgicG93ZXJwYy84Mnh4OiBSZW1vdmUgQ09ORklHXzgyNjAgYW5kIENPTkZJ
R184MjcyIikNCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUu
bGVyb3lAY3Nncm91cC5ldT4NCj4+IC0tLQ0KPj4gICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzgy
eHgvS2NvbmZpZyB8IDMgKy0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jt
cy84Mnh4L0tjb25maWcgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzgyeHgvS2NvbmZpZw0KPj4g
aW5kZXggZDlmMWEyYTgzMTU4Li4xODI0NTM2Y2Y2ZjIgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3Bv
d2VycGMvcGxhdGZvcm1zLzgyeHgvS2NvbmZpZw0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL3BsYXRm
b3Jtcy84Mnh4L0tjb25maWcNCj4+IEBAIC0yLDYgKzIsNyBAQA0KPj4gICBtZW51Y29uZmlnIFBQ
Q184Mnh4DQo+PiAgIAlib29sICI4Mnh4LWJhc2VkIGJvYXJkcyAoUFEgSUkpIg0KPj4gICAJZGVw
ZW5kcyBvbiBQUENfQk9PSzNTXzMyDQo+PiArCXNlbGVjdCBGU0xfU09DDQo+PiAgIA0KPj4gICBp
ZiBQUENfODJ4eA0KPj4gICANCj4+IEBAIC05LDcgKzEwLDYgQEAgY29uZmlnIEVQODI0OEUNCj4+
ICAgCWJvb2wgIkVtYmVkZGVkIFBsYW5ldCBFUDgyNDhFIChhLmsuYS4gQ1dILVBQQy04MjQ4Ti1W
RSkiDQo+PiAgIAlzZWxlY3QgQ1BNMg0KPj4gICAJc2VsZWN0IFBQQ19JTkRJUkVDVF9QQ0kgaWYg
UENJDQo+PiAtCXNlbGVjdCBGU0xfU09DDQo+PiAgIAlzZWxlY3QgUEhZTElCIGlmIE5FVERFVklD
RVMNCj4+ICAgCXNlbGVjdCBNRElPX0JJVEJBTkcgaWYgUEhZTElCDQo+PiAgIAloZWxwDQo+PiBA
QCAtMjIsNyArMjIsNiBAQCBjb25maWcgTUdDT0dFDQo+PiAgIAlib29sICJLZXltaWxlIE1HQ09H
RSINCj4+ICAgCXNlbGVjdCBDUE0yDQo+PiAgIAlzZWxlY3QgUFBDX0lORElSRUNUX1BDSSBpZiBQ
Q0kNCj4+IC0Jc2VsZWN0IEZTTF9TT0MNCj4+ICAgCWhlbHANCj4+ICAgCSAgVGhpcyBlbmFibGVz
IHN1cHBvcnQgZm9yIHRoZSBLZXltaWxlIE1HQ09HRSBib2FyZC4NCj4+ICAgDQo+PiAtLSANCj4+
IDIuNDEuMA0K
