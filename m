Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0365B0B73
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 19:26:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MN8M44Dg6z3c2N
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 03:26:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=qWAFFjbT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.57; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=qWAFFjbT;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120057.outbound.protection.outlook.com [40.107.12.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MN8LK5fcsz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 03:26:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmQwgv3nkVM4XqedW4LCLZDlOzW5UKZRg5/+CfAULsg3KCGKSCmSSh+rX5Nyyf40c5xXH2GZEq5IYFEBTjHINIi6VSomlF47DJ4rVPCqQ777MioPeCxgbhHEIYyD51bi6MCHC1uHVeAg3P/tN2p86lQa870hRvzCWDOilZ1gBlYQWw07NgVeHNwZeHr73gUW5TBK7pdlhOeMV3w++DVNVMOubGvxJc+46+9vWFt+v6k4IL0yPrjAvZZSgwaZRhK9I41hoLGN6t5U/JFhiXtlDFLl8QWL9aULupUGM/PIdKgTEfNkKoLeSopa++UhWculCpgrr1X6quKlcwv90DlMRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1uC295Pm1PwE0WgVeTbwz6CbpBcuBt9cdRKcgejMig=;
 b=Ds5hTU8eXve/cTRBih7bzSbsFTxPk54s5JKj6s6Xtw6JALspF/rwYNqSsanFZB/52lZK13HPxr63aDdr0Lo8gfAjJHuJ77DEQpsTiWOF31YZdN1rtRdgXC/yFb85fQ+MmZ7q5kcTI7A5sqxb9zK8t93eIchSVINP3+15Z9gHffMTdhcn3XHUCaHa18r9epeelg3pVuQG6zbRgtmEsMF78WOwuDAUGpfalAC9jI3n60Irn3VyrzThjUHyiz9wAKUiiHzP3d77z2e4zm2NgabHCgFm6fSkjcMk1nGoMAhfTOPtww2+LdXxEJBRdhLE3eK0RU+u9p962Li1e0pgkfFBEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1uC295Pm1PwE0WgVeTbwz6CbpBcuBt9cdRKcgejMig=;
 b=qWAFFjbThylNbXRTa46l7dW0q/14Di3U6NXONmECxlw0S5OMb5LBFi+Eubudq7wristEyh9gt32ClfCqtJcRXBhM8jKRJLmPX6I1BNE8dk5KVdBYmau1ec7Hs9syXPkVvQkWYSmT/6UsGxzzPODdN42IeCiOTANhA++QYouCd2gD7vC9BU7qgX9OdIVConVJ8kGEGOK6y6fG1nqc1LdFPvLUh6eCX8DuuAoAt5VgsTP4YGStRlZr9BSGRMnOUCag+YbUH9ml9HvAOvIMq0VNCBagtIbSqCF+12cLIRdK68DlW4iifaHS5E9HcRaxpLVQHXQIX8kHcsF0WYD3LcM3iw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1557.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 7 Sep
 2022 17:25:56 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 17:25:56 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Holger Brunck <holger.brunck@ch.abb.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/83xx: update kmeter1 defconfig and dts
Thread-Topic: [PATCH] powerpc/83xx: update kmeter1 defconfig and dts
Thread-Index: AQHYwt7jfIzzrAag70uL8Z8S6EN1Fg==
Date: Wed, 7 Sep 2022 17:25:56 +0000
Message-ID: <269be158-2451-30cc-f478-0b0453b58c3a@csgroup.eu>
References: <20191216095006.13590-1-holger.brunck@ch.abb.com>
In-Reply-To: <20191216095006.13590-1-holger.brunck@ch.abb.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e52592b-2f6b-4a2c-42a7-08da90f60639
x-ms-traffictypediagnostic: MRZP264MB1557:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  oDOv3NxznKA9U3QFqJ5tFeQb7P3PQpBLSDh2Px+CI/+2hjYZd9muECe/Ztjn0Ha3UcmSwmdwHqRpEk+gCFlafMyg/v2ySTF9ROiwOWUCZuiZmz3mH8rtb31agwuhjFGzOuOgLKPKwyCQBTqHf3cLWBvz6fE2mn9iIUbaKXMaYYQ7QTXmlGyILobBV8t8VM0CSfGDhhzeHyb2jXnMzraMbnAzA7ywJDIW/qfnEszjjviZU7W8RfJqWROZkgAufeLBDZCcY5ljW3V5BDF4cPkCSIWM0Aq0wwdvv5Cx7R1buo4gaeFpWsR6iVoCXkHutHLs4lkQr/Q0ymq0OgbKqembCP1d2oG/Rt0Zjs/44LqtwZiX5oD4+nQflnaLYWY3b7CV1KcLKaOck4kmCbwhjQjdeZrtG/fTeExbWjKMMflW7ZjmFYlHUfHJjvHesRcdk3uq1wpdq3bu1lXHBP8sqGALNC11txQMndlcodS2K5oXIeGBFVxDHhUu403VwnmtPcDHEc1yX7PWCLo/kQPyoOnleTjU/Yu8YEHrv8ZAZW0F0IoAZffjPuwlKn0/YqemPq3UONISKNh7PmD9RbzhNrUx7glw5wS5GbZQwi+32RISoY2fmbjH4bJUk4ox6PDStVwqQt6Ys/HX/0AFd8qH0eNUO1rbK9X+GRZaqsTzeVqkHpESZfmPG7wFLgvKm/g/A/ss4iKRIFchxepoes/Kmynpm7nichd32HEGo1WRnEDFdik6OX5Fa39fQGEjdpp69GYe7feuiBtaqDZEQc9y1YVIwvwDPxuxX41gEUYFKUu8+k/Vth1ODCZjqsRhoLGTnqGeDyKdvBcLyN2C5zKOErYlWQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(110136005)(71200400001)(31696002)(86362001)(122000001)(31686004)(38100700002)(36756003)(54906003)(316002)(66446008)(478600001)(76116006)(4326008)(66946007)(64756008)(66476007)(38070700005)(66556008)(8676002)(26005)(91956017)(2906002)(83380400001)(6506007)(5660300002)(41300700001)(6486002)(186003)(6512007)(44832011)(8936002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ckxpOW5yVkswMWJGekZsWkVJVVRLTzR2aGZPQlhOTGlxeXlYM1EwZitVR1di?=
 =?utf-8?B?aGZWSzhSanZsSk5sWGQ0ZFo2YWppbk8wQVQvZk1VWFd0NTAwSk15Y0hFeDBr?=
 =?utf-8?B?VmV0d3lNanhWY2dzM3VuUFdhTis2LzU1WWdVUDA2ZGZRSThXRjYrZWZHVCtX?=
 =?utf-8?B?NmVQdzN4SEFJeGtMeUVPZW5iUHJzWUEvMnVSQ1EzRFEwR1RaS1pjR1MzcktV?=
 =?utf-8?B?azlQa28yV3ZpV1l2VDFvK0JDblJ2MXlEdm9zMUpaL2Fmd2pXTytkcDFmVzFa?=
 =?utf-8?B?TXBJMHcwRi9BQVlDdmUvL2JGOUgvc2ZVMU94ZXRINXNKLzEzcE94Y014WEVq?=
 =?utf-8?B?Qy9VNkJVU0VCaTBHUG5VMzloUEIvd1QzSTFCdERxdmJUVmRDa2dBYkZVV3I2?=
 =?utf-8?B?dDNzSEltVWFZUkZPLzNRTmFsYm9GeUUvaUR2TlhubXlDY1B3cDIxd2V4cklS?=
 =?utf-8?B?d3FKcFJvUC9wTFBBNkdBQ3NhYWgzTnFSTHp1TmwwU2FhU3cwMU91b1BxSDhH?=
 =?utf-8?B?MGV0ZzNaTkF0OHRONTNKaHdSaHNuOVFYVHNPL3JLZ3lrcTBZS1hObVFrQnU5?=
 =?utf-8?B?QUVpYi9IK0MzMzlVNVViS1J1cFBVRVhRMFo2RXpBQ3FmOS9FNWY5SDBTa1Fs?=
 =?utf-8?B?MUxmUlBRNThnLzNMdGJZVm9XeEJ0WVNOV3dNclJkVVlPK2tQYzZYZkFTUnBN?=
 =?utf-8?B?WVFUMlZvYjd1R1c0QlpqcUtaTTdEWk1saFpJOSsyZkZwWC9aclEwekk2aWNQ?=
 =?utf-8?B?SzBzMzA0cGtOa0NoSWZsRjVrdjZMSk9IU3VZcFBTUUNoTFFSdGNPcGFBR2FU?=
 =?utf-8?B?ZHc2WE9vc3ptL2dQNUZ4dGFrbG05dmUxTlRSYXdpRldLdStUcXh5d2VERUVV?=
 =?utf-8?B?aEFHcE16dnNMR3ptalRnTVZ3clJEcFFoVVk3Sk1ubENxOWVQUGlFeWU3dVhq?=
 =?utf-8?B?c1N2VTN2RmtRTjlkdXNLQXZPTElVb2xzcEpyaVpEZTdPbXE2T3k0bEVFd2R4?=
 =?utf-8?B?Q3pQYzJiYjVZQ1dKTjFON2hUWkFMSVhpWEI2UmNyR3IyeE9adzFudEdmVFZh?=
 =?utf-8?B?cDhqZ0NkejhhRzZjL1hRMjZCV3VvV1ljblArVXBobVllWkRnL3p1RG53WHQ5?=
 =?utf-8?B?M3dFa2owMm9pWWc3WnNGNFVGSlZ4R2p1cTFLUXJRamQ1QTNkNDFKUWgyVFJu?=
 =?utf-8?B?RGhJbXYvbnZ2M2U0UVphSW55SUdvbnp2R2NkOUx1QUdBUC93VHBIUUM5QnFz?=
 =?utf-8?B?VGVMaFNzdEJxRnBzbEh1Ykp3UWdEWll5Rk5XTXJGRHVtbzU1dG4ySVZ4L3NQ?=
 =?utf-8?B?UDgxSUZEQzd3b1QrTGIwdmxnbHhlOUxJWW1ZOFBQamFhR0pBSGVRcVMxZzJv?=
 =?utf-8?B?VitGalhLZTEyeU9weEhZVDd4SlpCZ3hRR3ZUM0pCM2tLcEpHanVFc3lKajAx?=
 =?utf-8?B?aWFhTUdETlB4Mjh6NDNsQ0VkbU5wOHlZc3ZPQ01aK21jTHg4UmIwZ1ZqNW45?=
 =?utf-8?B?Q0JwcitlTjk2aW9ET2h6OVNNUUp6TUtnZDAvQTlON3BpejMwM2xENll5bTBt?=
 =?utf-8?B?dW1Pek9hTUlPdjI0TUFhQUtYVUVwUDZVY3Bsbko3UnhSazFiUzRlV1pvWFVt?=
 =?utf-8?B?bHhXYUtOTWx5aE5sbm1WaHIvWGwzbHVibWxkNzNIdjk4RzhRNUFaVk9JL1or?=
 =?utf-8?B?OHF3OWFGZEFRbDd3bGNHK3JJZEg4bUk1V2pEamszaW9uWlgrMWcxcjk0aVJL?=
 =?utf-8?B?djNSOEliYzZIcmxnQ0hwZjlkMTB0MWxwbko5N1FVcnorMFdNZzNveHZBZXU3?=
 =?utf-8?B?OWxsOWw3czYvMEp0bDBOa2p1UUN6a2h1ZVh0VkNWczBCREw2U1p1bWFjNnU4?=
 =?utf-8?B?L2ZkNmRHTkRuNzhrQWY4YU81eEM3a3VaZnVhaTJ4SlhIbWovaklRVnhKaGh3?=
 =?utf-8?B?S2llSTNzN3pHLzBCNkNnMXZJeHlZN1prMTJhNTVmMisybEZlaDNZWWFCaEV3?=
 =?utf-8?B?WXRoZVJlMGw3NmsrZktYMmlCZkh5TUYzYUhwaEp4SjdDUktiUEhXenYzVWhv?=
 =?utf-8?B?Zmw0d29MUnRPd2FjUW1XbFNxbDhKeHEzNnJLZVdFd1QyRzNXYTBMQThSQ3VN?=
 =?utf-8?B?ZG5XckY4LzBkZXVLenJ6U3RObHdNelFmcm9WdmZ0d00wdXRCeUcyajNScjVs?=
 =?utf-8?Q?V705o/eW5askqGNhN/BRZkA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4AEEC5A6F745A34DAD0701B3899C7602@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e52592b-2f6b-4a2c-42a7-08da90f60639
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 17:25:56.6492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wNVU2wGaY9UNykG80cxdb4Vt3Eyw+eSP2yE9rZpKv1DpPpV9NL7n1IDafQjF6mEM7h0wq2ezMAAtemBALs/YZ8uXT79EeX3jlZQKKiTstDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1557
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
Cc: Matteo Ghidoni <matteo.ghidoni@ch.abb.com>, Heiko Schocher <hs@denx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE2LzEyLzIwMTkgw6AgMTA6NTAsIEhvbGdlciBCcnVuY2sgYSDDqWNyaXTCoDoNCj4g
RnJvbTogTWF0dGVvIEdoaWRvbmkgPG1hdHRlby5naGlkb25pQGNoLmFiYi5jb20+DQo+IA0KPiBU
aGUgZGVmY29uZmlnIGlzIHN5bmNocm9uaXplZCBhbmQgdGhlIG1pc3NpbmcNCj4gTVREX1BIWVNN
QVAsIERFVlRNUEZTIGFuZCBJMkMgTVVYIHN1cHBvcnQgYXJlIHN3aXRjaGVkIG9uLg0KPiANCj4g
QWRkaXRpb25hbGx5IHRoZSBJMkMgbXV4IGRldmljZSBpcyBhZGRlZCB0byB0aGUgRFRTIHdpdGgN
Cj4gaXRzIGF0dGFjaGVkIHRlbXBlcmF0dXJlIHNlbnNvcnMgYW5kIEkyQyBjbG9jayBmcmVxdWVu
Y3kNCj4gaXMgbG93ZXJlZC4NCg0KVGhpcyBwYXRjaCBkb2Vzbid0IGFwcGx5Lg0KDQpJcyBpdCBz
dGlsbCByZWxldmFudCA/DQoNClRoYW5rcw0KQ2hyaXN0b3BoZQ0KDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBNYXR0ZW8gR2hpZG9uaSA8bWF0dGVvLmdoaWRvbmlAY2guYWJiLmNvbT4NCj4gU2lnbmVk
LW9mZi1ieTogSG9sZ2VyIEJydW5jayA8aG9sZ2VyLmJydW5ja0BjaC5hYmIuY29tPg0KPiBDQzog
SGVpa28gU2Nob2NoZXIgPGhzQGRlbnguZGU+DQo+IENDOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVA
ZWxsZXJtYW4uaWQuYXU+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9ib290L2R0cy9rbWV0ZXIx
LmR0cyAgICAgICAgICAgfCA0MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiAgIGFy
Y2gvcG93ZXJwYy9jb25maWdzLzgzeHgva21ldGVyMV9kZWZjb25maWcgfCAyMCArKysrKysrKyst
LS0tLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2Jvb3QvZHRzL2ttZXRlcjEuZHRz
IGIvYXJjaC9wb3dlcnBjL2Jvb3QvZHRzL2ttZXRlcjEuZHRzDQo+IGluZGV4IDE1NGY1ZDI5M2Zk
My4uYmMzM2YzYWQxOWEzIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvYm9vdC9kdHMva21l
dGVyMS5kdHMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2Jvb3QvZHRzL2ttZXRlcjEuZHRzDQo+IEBA
IC03MCw3ICs3MCw0NSBAQA0KPiAgIAkJCXJlZyA9IDwweDMwMDAgMHgxMDA+Ow0KPiAgIAkJCWlu
dGVycnVwdHMgPSA8MTQgMHg4PjsNCj4gICAJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZpcGljPjsN
Cj4gLQkJCWNsb2NrLWZyZXF1ZW5jeSA9IDw0MDAwMDA+Ow0KPiArCQkJY2xvY2stZnJlcXVlbmN5
ID0gPDEwMDAwMD47DQo+ICsNCj4gKwkJCW11eEA3MCB7DQo+ICsJCQkJY29tcGF0aWJsZSA9ICJu
eHAscGNhOTU0NyI7DQo+ICsJCQkJcmVnID0gPDB4NzA+Ow0KPiArCQkJCSNhZGRyZXNzLWNlbGxz
ID0gPDE+Ow0KPiArCQkJCSNzaXplLWNlbGxzID0gPDA+Ow0KPiArDQo+ICsJCQkJaTJjQDIgew0K
PiArCQkJCQlyZWcgPSA8Mj47DQo+ICsJCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiArCQkJ
CQkjc2l6ZS1jZWxscyA9IDwwPjsNCj4gKw0KPiArCQkJCQkvKiBUZW1wZXJhdHVyZSBzZW5zb3Jz
ICovDQo+ICsJCQkJCXRlbXBANDggew0KPiArCQkJCQkJbGFiZWwgPSAiVG9wIjsNCj4gKwkJCQkJ
CWNvbXBhdGlibGUgPSAibmF0aW9uYWwsbG03NSI7DQo+ICsJCQkJCQlyZWcgPSA8MHg0OD47DQo+
ICsJCQkJCX07DQo+ICsNCj4gKwkJCQkJdGVtcEA0OSB7DQo+ICsJCQkJCQlsYWJlbCA9ICJDb250
cm9sIjsNCj4gKwkJCQkJCWNvbXBhdGlibGUgPSAibmF0aW9uYWwsbG03NSI7DQo+ICsJCQkJCQly
ZWcgPSA8MHg0OT47DQo+ICsJCQkJCX07DQo+ICsNCj4gKwkJCQkJdGVtcEA0YSB7DQo+ICsJCQkJ
CQlsYWJlbCA9ICJQb3dlciI7DQo+ICsJCQkJCQljb21wYXRpYmxlID0gIm5hdGlvbmFsLGxtNzUi
Ow0KPiArCQkJCQkJcmVnID0gPDB4NGE+Ow0KPiArCQkJCQl9Ow0KPiArDQo+ICsJCQkJCXRlbXBA
NGIgew0KPiArCQkJCQkJbGFiZWwgPSAiRnJvbnQiOw0KPiArCQkJCQkJY29tcGF0aWJsZSA9ICJu
YXRpb25hbCxsbTc1IjsNCj4gKwkJCQkJCXJlZyA9IDwweDRiPjsNCj4gKwkJCQkJfTsNCj4gKwkJ
CQl9Ow0KPiArCQkJfTsNCj4gICAJCX07DQo+ICAgDQo+ICAgCQlzZXJpYWwwOiBzZXJpYWxANDUw
MCB7DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvY29uZmlncy84M3h4L2ttZXRlcjFfZGVm
Y29uZmlnIGIvYXJjaC9wb3dlcnBjL2NvbmZpZ3MvODN4eC9rbWV0ZXIxX2RlZmNvbmZpZw0KPiBp
bmRleCA2NDhjNmIzZGNjZjkuLjcyYWJkOGFlNjU0YSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dl
cnBjL2NvbmZpZ3MvODN4eC9rbWV0ZXIxX2RlZmNvbmZpZw0KPiArKysgYi9hcmNoL3Bvd2VycGMv
Y29uZmlncy84M3h4L2ttZXRlcjFfZGVmY29uZmlnDQo+IEBAIC0zLDIyICszLDIwIEBAIENPTkZJ
R19TWVNWSVBDPXkNCj4gICBDT05GSUdfUE9TSVhfTVFVRVVFPXkNCj4gICBDT05GSUdfTk9fSFo9
eQ0KPiAgIENPTkZJR19ISUdIX1JFU19USU1FUlM9eQ0KPiArQ09ORklHX1BSRUVNUFQ9eQ0KPiAg
IENPTkZJR19MT0dfQlVGX1NISUZUPTE0DQo+ICAgQ09ORklHX0VYUEVSVD15DQo+ICAgQ09ORklH
X1NMQUI9eQ0KPiAtQ09ORklHX01PRFVMRVM9eQ0KPiAtQ09ORklHX01PRFVMRV9VTkxPQUQ9eQ0K
PiAtIyBDT05GSUdfQkxLX0RFVl9CU0cgaXMgbm90IHNldA0KPiAtQ09ORklHX1BBUlRJVElPTl9B
RFZBTkNFRD15DQo+IC0jIENPTkZJR19NU0RPU19QQVJUSVRJT04gaXMgbm90IHNldA0KPiAtIyBD
T05GSUdfSU9TQ0hFRF9ERUFETElORSBpcyBub3Qgc2V0DQo+IC0jIENPTkZJR19JT1NDSEVEX0NG
USBpcyBub3Qgc2V0DQo+ICAgIyBDT05GSUdfUFBDX0NIUlAgaXMgbm90IHNldA0KPiAgICMgQ09O
RklHX1BQQ19QTUFDIGlzIG5vdCBzZXQNCj4gICBDT05GSUdfUFBDXzgzeHg9eQ0KPiAgIENPTkZJ
R19LTUVURVIxPXkNCj4gLUNPTkZJR19QUkVFTVBUPXkNCj4gICAjIENPTkZJR19TRUNDT01QIGlz
IG5vdCBzZXQNCj4gK0NPTkZJR19NT0RVTEVTPXkNCj4gK0NPTkZJR19NT0RVTEVfVU5MT0FEPXkN
Cj4gKyMgQ09ORklHX0JMS19ERVZfQlNHIGlzIG5vdCBzZXQNCj4gK0NPTkZJR19QQVJUSVRJT05f
QURWQU5DRUQ9eQ0KPiArIyBDT05GSUdfTVNET1NfUEFSVElUSU9OIGlzIG5vdCBzZXQNCj4gICBD
T05GSUdfTkVUPXkNCj4gICBDT05GSUdfUEFDS0VUPXkNCj4gICBDT05GSUdfVU5JWD15DQo+IEBA
IC0yOSwxMiArMjcsMTUgQEAgQ09ORklHX0lQX1BOUD15DQo+ICAgQ09ORklHX1RJUEM9eQ0KPiAg
IENPTkZJR19CUklER0U9bQ0KPiAgIENPTkZJR19WTEFOXzgwMjFRPXkNCj4gK0NPTkZJR19ERVZU
TVBGUz15DQo+ICtDT05GSUdfREVWVE1QRlNfTU9VTlQ9eQ0KPiAgIENPTkZJR19NVEQ9eQ0KPiAg
IENPTkZJR19NVERfQ01ETElORV9QQVJUUz15DQo+ICAgQ09ORklHX01URF9CTE9DSz15DQo+ICAg
Q09ORklHX01URF9DRkk9eQ0KPiAgIENPTkZJR19NVERfQ0ZJX0lOVEVMRVhUPXkNCj4gICBDT05G
SUdfTVREX0NGSV9BTURTVEQ9eQ0KPiArQ09ORklHX01URF9QSFlTTUFQPXkNCj4gICBDT05GSUdf
TVREX1BIWVNNQVBfT0Y9eQ0KPiAgIENPTkZJR19NVERfUEhSQU09eQ0KPiAgIENPTkZJR19NVERf
VUJJPXkNCj4gQEAgLTU3LDcgKzU4LDEwIEBAIENPTkZJR19TRVJJQUxfODI1MF9DT05TT0xFPXkN
Cj4gICBDT05GSUdfSFdfUkFORE9NPXkNCj4gICBDT05GSUdfSTJDPXkNCj4gICBDT05GSUdfSTJD
X0NIQVJERVY9eQ0KPiArQ09ORklHX0kyQ19NVVg9eQ0KPiArQ09ORklHX0kyQ19NVVhfUENBOTU0
eD15DQo+ICAgQ09ORklHX0kyQ19NUEM9eQ0KPiArQ09ORklHX0dQSU9MSUI9eQ0KPiAgICMgQ09O
RklHX0hXTU9OIGlzIG5vdCBzZXQNCj4gICAjIENPTkZJR19VU0JfU1VQUE9SVCBpcyBub3Qgc2V0
DQo+ICAgQ09ORklHX1VJTz15
