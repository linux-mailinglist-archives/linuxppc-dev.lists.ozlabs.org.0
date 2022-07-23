Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B2257EFC9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jul 2022 16:43:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lqpvh06xrz3c8j
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jul 2022 00:43:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=iM11LdY7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.87; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=iM11LdY7;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120087.outbound.protection.outlook.com [40.107.12.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lqpts6bCtz304J
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jul 2022 00:42:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X07rwfFbmf7kkvShOput687pwyG/xEoMXJBC2tBnAMNx42y09SgYZCefJNgW0qTcCjX//WUOT9ZP1UzFOTNtyseIetMvzqljX0LYIykaTRhartWXAnV8pSvaZynGlx0ereJCV+I5+1cphWDqZlUa30BPgOf1qx2lGG/J68wlxggBZn52T7qo4JoRyZ/YJloF2BocqPrBdAwALrmTIRGLfP0m+iIH0XByxub6VrRq7b7HeFgiLUHptuMwuY0zVGjEGoQzv8WtfGzNSYcv3/MVjaWZPs+iA5E6NXAl13574w8tiBlacww9VsPagTOPe+IeC2vX18f3vX/XWeblvFIZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQSIWfzBjFyEsfPm93pFuUEjKH1f0cKa5OiK2uwSLow=;
 b=VFv0CO8FaOsV3Ivl6nFuCXfZCehCKJKvZOBZA/dmOc6rCOiXjId4oZYs+O9aeZdGGayT8JV0iDp4m+YvSe5rOPGDYwi0s2zV55QrIgwOakx9N3Chki0RguuxUSGr+2ANk58PTtYQA+XN9yWBjf+qcDT9ubybFqjs4jTzB3Xq3BAJq0hBRey5mYuq0SEvEyonLVIMc1IN3SzmifgM7UfWCdy5EayxWP1I4IEnhKY9PX5lA7lQmOctbDvWaP5hWlxdE83E5n3slekGgFlj/Nkm03FEfbc6GcWQGW/qtFKkdP5lfe5n1z03ghy6NqzgizW4P8Yiq9sE3qpCqP2fDQu5Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQSIWfzBjFyEsfPm93pFuUEjKH1f0cKa5OiK2uwSLow=;
 b=iM11LdY7PfE+9omRo9niKFZ/STuG+weKrpi8njNsC7dLM7LZfh3wOIV7fr7tkzbcUUmqdz8MfOm+h4ngLYTbclEOyF6BEmP6cZU8xDoxK1Fti53joB2ghALejsjE1ZmQpqpCserYzVOVMQRwHs0qzd8HxBb+KyWugX17pXMHdr+7VXdfsJ6+YiTVSCQMGs3f+f3hmIbh79W9Or4zrKYDr3LhgpfLDiCoWjtlUGCKyA6FO6YQiR4KlaQgL9W2yMgAbNGMZWbTP8/O698zS4Qags7YgsqF6/mjKiiBzk7pDuRymrt1j1wItBEnyCzW7Qr3vXJTn+FEtkpwFF5Uf1f9Ow==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3620.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Sat, 23 Jul
 2022 14:42:23 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%5]) with mapi id 15.20.5458.021; Sat, 23 Jul 2022
 14:42:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Michael Ellerman
	<mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: Regression: Linux v5.15+ does not boot on Freescale P2020
Thread-Topic: Regression: Linux v5.15+ does not boot on Freescale P2020
Thread-Index: AQHYnarFcL6sKMJcmk+y5CiOp18nOa2MCX8A
Date: Sat, 23 Jul 2022 14:42:22 +0000
Message-ID: <6b227478-73b8-2a97-1c78-89570d928739@csgroup.eu>
References: <20220722090929.mwhmxxdd7yioxqpz@pali>
In-Reply-To: <20220722090929.mwhmxxdd7yioxqpz@pali>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ccbbd04e-e9c5-4131-c2ee-08da6cb98db8
x-ms-traffictypediagnostic: MR1P264MB3620:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  7InffaT1KftqWYMf5smrGVKq7FzcsTjtHI8H7ADzqLsz+VjU2qaTt9NAJCjGcdA39wPhlobxe3Xf4+Y+Ns1pobIK7KTkzoyhOSENhDyjEoghTYLO/fyWPNmLDhKFy3HXOXCC//GYS8SujzbiFOjrQWBXB+OTjfs12VTN0m41Hwz89fXtEnI+n3PaxFtwz1qdWTH/uid8fkGkq080vIY265urXyeEnCK1LfKoWlmR9t0/fSEac6WWC5ZniGCYU/Uhj9JZaw3Ul3fvkKW/I5X30wlAxx2Mc1RBaoZ6UhUC9Ij0A00fcfuDR5/AwppVKh/yl1tRGD8G66z+XTQGGjGV3gsw4extLc/el4LhG/Dc4UffAZtLI9+grJU8Au1jJwLwRpOPBzJ8LGmuWDt5Lvx46gmq5vIp43kQHRh1MRht9YxZfaTtLXqz2eUQUO+gNPnDgzupP+Wiz7GTZXRJjgFYJgs0ARvLnoVcu/sqIEVddDyZIE+vCtMP3CJmqjI4+foXx3lC9+/z0Yn4+uyiLRA8vlmAfX9JWrjTD2EAp5+KRi/5DFFUp3+qtuIvSB/ztK4J5BiSQORFLzPyef0b1s7+2iLy36qfUWgZ5zbOIAUT8Y+SWgNfrD/vWTow+KDJgCUjJht0o/m68TSjAYGmWqqXDv/rvG0T3kuKP568rOY8VCM1YW67raxzynnPJjYwXH7yCekNGEf4ZpZJL7gXh2e/IupD56eSbQuK5q2B81RNZ4ymB3EzUW6gKI96rUDW6RkSRS2nGePF4XJ84pjMtqNdxrpbwTmrt675mT+dZC5Wp8RH7oZ3p4pL0kEI3r3BLYN4iferztN9qOUEBVY8pqYtbdwK2DWzO3/vVMaGmw0axh/2BVbeiOZRzCKBozRqLI4mM3W0a5nRu8F45OvJtgZxkQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(39850400004)(346002)(376002)(136003)(186003)(2616005)(83380400001)(122000001)(38070700005)(6512007)(38100700002)(26005)(41300700001)(91956017)(66476007)(66556008)(66446008)(64756008)(76116006)(6506007)(66946007)(110136005)(71200400001)(478600001)(966005)(6486002)(31696002)(316002)(2906002)(44832011)(5660300002)(36756003)(8936002)(8676002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?V2Rwd3pxNERkcE82MlJwTGpGeHFJTVl1bmtNRHZOSElOcDJNQVRPZlM4SmVZ?=
 =?utf-8?B?TEVjR3JMV3ZCNGdjTHhjU0oyeTNQZ2pNOW9JN0tmMGNqT01ZcFdQanFkc0RV?=
 =?utf-8?B?aU1RQng5a3AwWml2U2dtMTlaTVBqRnBUeEV1cEZPRUE1Y1ZlbWxTM2F6MW1Q?=
 =?utf-8?B?TzZoRlVPYmhsVW9vOEZxTitQL2w5V01NRGdyOGZUZUVMUElDRlBoTUg3OTdO?=
 =?utf-8?B?YXNPWHZLWVlCWHJaN1pJUkVDdHJhZ1kzckoyb2FUcXBMeEtPN3g1ZDA5VSt6?=
 =?utf-8?B?dWRhbklWQlQ5RGY0SDFoa1pPSUNPbDBFSHpha203dlljTExmQTYxdXZGYWZn?=
 =?utf-8?B?SG5HbXV6SHF3Ni9iYURBYTgxWVFxelBYbi9CRGhzNUhJS1IxdVFDRmhFaGFF?=
 =?utf-8?B?aFlqeGY1cFpUMEttbUJYVFJtcmYvaWdkSHB6RmFmRVoxdHE5ZDVheG0yZGFr?=
 =?utf-8?B?VG4vaWUxRFQvTytDSjNIMUJUMk9mTXhlMXQrd1c1K1ljdi9CY0J1ZHpwRDVP?=
 =?utf-8?B?a0o0QTRGUGVBM2dYYml3R1orQStORXhBcTB3QVdhNGNIYy9DY1Bad0xLd2Ji?=
 =?utf-8?B?U2hvRXlJdW1OTDErWkw1M0UwRzRFcFRGWi9POW0rY05WUUdERk82bnhUQ0kw?=
 =?utf-8?B?djNMSWpwbVZrREtWcDVEZXMwRWRKbU1zK2VMRUY0R203OHBYaWgzWmx2cVEr?=
 =?utf-8?B?VU8vb3JBUlpySkVhN2NnR2drYnlZQkxJL0ttZjd2WHgvS0I3azhQSFJ4VzVM?=
 =?utf-8?B?R2gzTWUrelN6Y0E3ekh3L0dUclNSb1crSFd2UEpLaUs2bmN3UlFVMVppL2hn?=
 =?utf-8?B?TXlYU2p5SVdUKzdvSlpKdlBxUEtTRm1rT0dHRzNHL1hWREkyUkRsSDdtakpJ?=
 =?utf-8?B?ZG1lWS93LzJCM3FSRy9STTlLcHg5WjJrNkNZRWU2S3M2NTBmQVRLQ3FNSE9V?=
 =?utf-8?B?S29xZ1h3dzl2REhyM0MxNVd3TWlkTkxoT0NqSm9xZnl4Wis5QkJQb25tVCsx?=
 =?utf-8?B?V2xlZWhlWnRmbmZwZFdSZ1BGbjdiRTlRbmtIeGhHRG5aTVFhY0NraGVnc3BV?=
 =?utf-8?B?cEVRRnUxeXU2MjRBOEJZdGRIRmx0YlMweGxQZFpFdTJjYlVVZDU2dnNPMzg0?=
 =?utf-8?B?NjF2d3E4Y2J2UkRFNi9mR3ZFL1JUUFFmM2NrV2d6YWd1UndkVVdNOWVaOERM?=
 =?utf-8?B?ZXlWWDN1M1R6L0VMSk5vWEJhd3Y0aWpvdG0yRnl5czg4cVFrTnRodjMvT3VG?=
 =?utf-8?B?UFZybHhmbklGUnMxWFUyRGs2ckxVelliejBiK2Z5emJYN09oMjcrZHRwVFRV?=
 =?utf-8?B?Z1paWVJlSlVxWk1aVnY1blhkOWlTOU9XZTlaUlk0elhEaWZFMVN5Z004cDdR?=
 =?utf-8?B?eEwzMEd1VUpLMWZwWitRT0lsNkRvRnM0ZytDVGtTR0o4dUE5V1BiSTM1T1RP?=
 =?utf-8?B?RGprb083NnFOYzF4cVJkbFo5SnFEZkVCNlAvbTduR2R2eG1leDdyb0plY0pu?=
 =?utf-8?B?disyam84WWlNenNkN3VFTzJWbFlUaHR3OHJENWJuaUNsRDBqbmRqaHh2bGJN?=
 =?utf-8?B?bXdWL1RLMWY1MGFMYXRsL3V2RUlLa0YzbE9nbzNUcFZkdE1meDNNNDFMQWtS?=
 =?utf-8?B?K3V2L0txMzdZNDlNOUxpRDhuK2tRYTBjK25lRldwSHNNM2xrK2NZbURVVTMz?=
 =?utf-8?B?akdzNTlMekhqMVdEREdLTWxtb29BYTNDbEtWbjIvaExDL3dmWWVVNHRQcmRP?=
 =?utf-8?B?MVdOeXpMMVkwdDNuMFh6cG1VQkR6RElzNDZiT0svSElXaHlhSGxkdUpYUlJN?=
 =?utf-8?B?T0xpQTY3YWgvSi9Tb2UxR2VmazRoMVJpVHI1SzNaUW52azJiYnhLemh6Tk9Y?=
 =?utf-8?B?T3NDb2NPVG0xRGtsblR5UklwU25qTVJ4OEN2a0U2eHZYcTErenZNZ0dzV3R6?=
 =?utf-8?B?T0JVV25TL3B5TGRrTlk4WlFiUXI3b3A0UnRKOXlGSHZwNmdEUzRtbi95ZG9y?=
 =?utf-8?B?Z3JvcWdnNHd2U3FDREhXRStxMUVIOEZuWEluT1IrVkdXaldqMm9DMGlIMUhq?=
 =?utf-8?B?dCtLZC9ueUpKbU1XVnk2UGFZV0FZdzNodjNZc2s4anZTdFZhc3RtSXJmNmw3?=
 =?utf-8?B?YzhHOUs1c012anIyd1czS2VQL3NLWERyUDUyL3BLNnRmMTIwbEZFK2RETjR4?=
 =?utf-8?Q?ukq3LuKK+nX8HwiS6S6dLTA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7DADFFDF134304AA3C0DE38BB80FFA2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ccbbd04e-e9c5-4131-c2ee-08da6cb98db8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2022 14:42:22.8479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U7w3HQGDWYMoOBvgNdOTGaqsdR/3YGlR3GqpQ6gbC+PS7X91xZkeRR8Ew1OKeaurwtNZQ67ukrAJeoLNZmaWYPyVpAPsZ6fmQnyOGwByPqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3620
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGVsbG8sDQoNCkxlIDIyLzA3LzIwMjIgw6AgMTE6MDksIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6
DQo+IEhlbGxvIQ0KPiANCj4gVHJ5aW5nIHRvIGJvb3QgbWFpbmxpbmUgTGludXgga2VybmVsIHY1
LjE1KywgaW5jbHVkaW5nIGN1cnJlbnQgdmVyc2lvbg0KPiBmcm9tIG1hc3RlciBicmFuY2gsIG9u
IEZyZWVzY2FsZSBQMjAyMCBkb2VzIG5vdCB3b3JrLiBLZXJuZWwgZG9lcyBub3QNCj4gcHJpbnQg
YW55dGhpbmcgdG8gc2VyaWFsIGNvbnNvbGUsIHNlZW1zIHRoYXQgaXQgZG9lcyBub3Qgd29yayBh
bmQgYWZ0ZXINCj4gdGltZW91dCB3YXRjaGRvZyByZXNldCB0aGUgYm9hcmQuDQoNCkNhbiB5b3Ug
cHJvdmlkZSBtb3JlIGluZm9ybWF0aW9uID8gV2hpY2ggZGVmY29uZmlnIG9yIC5jb25maWcsIHdo
aWNoIA0KdmVyc2lvbiBvZiBnY2MsIGV0YyAuLi4gPw0KDQo+IA0KPiBJIHJ1biBnaXQgYmlzZWN0
IGFuZCBpdCBmb3VuZCBmb2xsb3dpbmcgY29tbWl0Og0KPiANCj4gOTQwMWY0ZTQ2Y2Y2OTY1ZTIz
NzM4ZjcwZTE0OTE3MjM0NGEwMWVlZiBpcyB0aGUgZmlyc3QgYmFkIGNvbW1pdA0KPiBjb21taXQg
OTQwMWY0ZTQ2Y2Y2OTY1ZTIzNzM4ZjcwZTE0OTE3MjM0NGEwMWVlZg0KPiBBdXRob3I6IENocmlz
dG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4gRGF0ZTogICBUdWUg
TWFyIDIgMDg6NDg6MTEgMjAyMSArMDAwMA0KPiANCj4gICAgICBwb3dlcnBjOiBVc2UgbHdhcngv
bGRhcnggZGlyZWN0bHkgaW5zdGVhZCBvZiBQUENfTFdBUlgvTERBUlggbWFjcm9zDQo+IA0KPiAg
ICAgIEZvcmNlIHRoZSBlaCBmbGFnIGF0IDAgb24gUFBDMzIuDQo+IA0KPiAgICAgIFNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4g
ICAgICBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+
DQo+ICAgICAgTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8xZmM4MWYwN2NhYmViYjg3
NWI5NjNlMjk1NDA4Y2MzZGQzOGM4ZDg1LjE2MTQ2NzQ4ODIuZ2l0LmNocmlzdG9waGUubGVyb3lA
Y3Nncm91cC5ldQ0KPiANCj4gOjA0MDAwMCAwNDAwMDAgZmU2NzQ3ZTQ1NzM2ZGZjYmE3NDkxNGE5
NDQ1ZTVmNzBmNTEyMDYwMCA5NjM1OGQwOGI2NWQzMjAwOTI4YTk3M2VmYjViOTY5YjNkNDVmMmIw
IE0gICAgICBhcmNoDQo+IA0KPiANCj4gSWYgSSByZXZlcnQgdGhpcyBjb21taXQgdGhlbiBrZXJu
ZWwgYm9vdHMgY29ycmVjdGx5LiBJdCBhbHNvIGJvb3RzIGZpbmUNCj4gaWYgSSByZXZlcnQgdGhp
cyBjb21taXQgb24gdG9wIG9mIG1hc3RlciBicmFuY2guDQo+IA0KPiBGcmVlc2NhbGUgUDIwMjAg
aGFzIHR3byAzMi1iaXQgZTUwMCBwb3dlcnBjIGNvcmVzLg0KPiANCj4gQW55IGlkZWEgd2h5IGFi
b3ZlIGNvbW1pdCBpcyBjYXVzaW5nIGNyYXNoIG9mIHRoZSBrZXJuZWw/IEFuZCB3aHkgaXQgaXMN
Cj4gbmVlZGVkPyBDb3VsZCBlaCBmbGFnIHNldCB0byAwIGNhdXNlIGRlYWRsb2NrPw0KDQpTZXR0
aW5nIHRoZSBlaCBmbGFnIHRvIDAgaXMgbm90IHN1cHBvc2VkIHRvIGJlIGEgY2hhbmdlIGludHJv
ZHVjZWQgYnkgDQp0aGF0IGNvbW1pdC4gSW5kZWVkIHRoYXQgY29tbWl0IGlzIG5vdCBzdXBwb3Nl
ZCB0byBjaGFuZ2UgYW55dGhpbmcgYXQgDQphbGwgaW4gdGhlIGdlbmVyYXRlZCBjb2RlLg0KDQpD
aHJpc3RvcGhlDQoNCj4gDQo+IEkgaGF2ZSBsb29rZWQgaW50byBlNTAwIFJlZmVyZW5jZSBNYW51
YWwgZm9yIGx3YXJ4IGluc3RydWN0aW9uIChwYWdlIDU2MikNCj4gaHR0cHM6Ly93d3cubnhwLmNv
bS9maWxlcy1zdGF0aWMvMzJiaXQvZG9jL3JlZl9tYW51YWwvRVJFRl9STS5wZGYgYW5kDQo+IGJv
dGggMCBhbmQgMSB2YWx1ZXMgZm9yIEVIIGZsYWcgc2hvdWxkIGJlIHN1cHBvcnRlZC4=
