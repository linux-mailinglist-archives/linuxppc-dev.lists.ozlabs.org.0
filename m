Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECC369F20F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 10:44:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMB881ZpXz3bqw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 20:44:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=wR5LnBBt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::608; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=wR5LnBBt;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20608.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::608])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMB771Jx8z3bT5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 20:43:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMtLXYaIBlDavge3RKTiAm2fuEF1RCHv3xHKkgtUybR4HbRE8OFtkzaMLPx3PHagdCu4s70folyo66gWeiyVM27Glxgt9swzZbryanczVKqu3l8zlT7g7sx5gmHzTV3jrLyyN24ZHRlqV1MdRaYZ98Rh0bnYOe7giLPd+52BZjWalt6oOT1UbaK2l17lj1mzOS6YP8keulzOIjyEwtAvo16k6+zF/1+1+DfB0idvuYjcJ/6FQskJiUxk2N5DFJbW3dI32fCNXbZw0rzotMi4YS/nMWeI0EyK5OPrsvPdE2MnfMW3b3NUMBT10Zd21flu67Uy0qAhfgGdHjU9k93TzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6Z9K6C6hEJ5Jw4OinMKNRvEqzzR6bLnjne/cabYn0g=;
 b=AncPWt2Iva/oKb1uKR2lxrAa8ndyzqwsTJ7Omh6xdBi1QIFBAghANwf7vXhXB1Cx5z13G9+KqWyU2nBu71YhFSGKwwFeJKgfUJobI2/dkhPUFRKEQCTmN47ZfKDkdR1i5XE1BL4ZTYLGsN9TiocSTlOUwvebLyunwoypfoycuFgcWbbQUx0AEppAl3DrrAiP5AkdLVxIlv/s8K1+vatLNFrqi9VPiNmUoMeKD2rJ2SnOmvDI3mBsr54s347yD1LBArCeyw26JseryWAvuV0P8ifqrH8ggXTgxHjVA6nPsHN9mC/MSCzmCUy/O4Ytc+qDh7sOaqqaMvrbqM7VQ3JP1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6Z9K6C6hEJ5Jw4OinMKNRvEqzzR6bLnjne/cabYn0g=;
 b=wR5LnBBt6qe+oAvyjtFME6hdOkVpitWEqsDqGbNh/rIR+MGTZndvzHKjcJq6KYL31eXjxu0PwYy8ikvHxRjBJFHKgUIlCEM/UxYv8DlzcRC7OkdFAheBRDCrj8yhIsKSNxHS1n6dT0f7Q/cquI9anHyGEfO5Al9sKLZu0VN8yO2BorKm10bq8oJIM64690raRlNf68a797760l5KVf27mquhZ5AlJieZP26PSBWGAMDVmScsxFOBkpfFat6Ej3VUjCzMBOtMxR7FdCqOohdj0suT+2T7Hm0YTt27G6Yv9UIey79nwjNn9Ge/CNUwtIswjSyrg5Qn4Z/Q+8sM5zGiCA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2214.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.19; Wed, 22 Feb 2023 09:43:21 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 09:43:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Rohan McLure
	<rmclure@linux.ibm.com>
Subject: Re: [PATCH v2] arch/powerpc/include/asm/barrier.h: redefine rmb and
 wmb to lwsync
Thread-Topic: [PATCH v2] arch/powerpc/include/asm/barrier.h: redefine rmb and
 wmb to lwsync
Thread-Index: AQHZRqIYy2O+IIPrGE++STBKDzHI9g==
Date: Wed, 22 Feb 2023 09:43:19 +0000
Message-ID: <c4dcf969-0836-cc78-63d9-db83b9ebfa1d@csgroup.eu>
References: <20230222090344.189270-1-kconsul@linux.vnet.ibm.com>
In-Reply-To: <20230222090344.189270-1-kconsul@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2214:EE_
x-ms-office365-filtering-correlation-id: a50bbf48-1dd9-4069-1fb1-08db14b93afd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Mhn89ljbSZj/i/AiBYASTGF5anT/o2aPJFi3TCfp7Cn7DM3vmFaNvJeP7L7zIWyhODYM6EssisNttvNR/mprI2Fn1dcUKpoNxM/OQHLZ4F6PSrGPPgasQHxWW9GUWuW1jItgElx1Yj4iIuMP8z4O+qPVR0PnRIe7gzvHL7bxfbhinPzwhz9gg6AuR7bCfjnon3QgA83IsilH4YCWbDRNr3MQGDdcMmn6skm1JGP/e8Ks3CKrE90Ji0dDdLaEya2rKQLZXUpWvoEZigtEUPiAnjuGl1/3TtsqXBvsEy1hUJx4wNDMVSI+LLHP67Dz0lcGqF9dp49IBDbx5KkaBPrO0K41Ndv1f/WwiuN1ExiFDQtV0+JVJSLdn1tPuWEthusd7VXwayNV4PVR6mvN8pfvv8ZHvdUsT1kl0A26m+suR7wUgGE4VE3O4HkS9wsZLX+XdcIvpXrslw4zuiA5/jWavKPaHIm/nohtFWDA1HgMivoClAkdKB9qn1dIagD2VIFvEUOwfbX7BeTHqUnenUZMNSbS4A0/HjPAeJpE13xWkbbBuzYUrZezSn5fmg33ZyP5V9KBeOLeSWZQJWMUzMn03hJ90TAUCmOau+HlEkpxm6FFWw8heS8LHsuhd5hxSiHwk6bs3adKeV1arlF0OyyHbMeSo9i5iVSTqP5xNx5GIjCB4A41j48VehzA9qcdTDHxWkWNM+k1ry+VwfySckXNS6YaIXtNL8goihbWg5W5SjfpSwA6yXmiC+bomtDH9NppLcA5k84tdegCsYOGKuRWzQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(346002)(376002)(396003)(366004)(136003)(451199018)(478600001)(66574015)(71200400001)(31696002)(122000001)(86362001)(2906002)(38100700002)(38070700005)(44832011)(316002)(110136005)(54906003)(41300700001)(36756003)(5660300002)(8936002)(83380400001)(66946007)(66476007)(66446008)(8676002)(76116006)(64756008)(66556008)(4326008)(91956017)(31686004)(186003)(26005)(6512007)(6486002)(2616005)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UDVCWnVQWW1UY0pCelBXajQvY1FkL0FyYk5CWnRsNjVGK05zc2N5eWxRclRY?=
 =?utf-8?B?c1BFTnpMNjdIMzJJSVBkTURJeG5FM205TWVQRmorUXJxdXVPU0dNbmNmNWcw?=
 =?utf-8?B?Z0Z0Y09kWTdKZWxBSlEvcXdPand2QUFDSmVvR1BWb0ZYU0JZNHpGQkdUOHox?=
 =?utf-8?B?c3dHd3QyMnVjTGpIblQvV05VNUhIQ3VpUkNKQ2drV0pHUSthSTFsVkw1YjFt?=
 =?utf-8?B?VVptUjZJQ3ZyQm03TzcrRXR0cis3dEZyQ0dXSCttRWQvcnQ4VEVGaUdMNi9n?=
 =?utf-8?B?MVFiVDl6VzhFdVV2cU4wMU95NGtPdlhyN1pvRk5SNG9ReitXNWdiMU01Nkg3?=
 =?utf-8?B?dzV3d25zTmZPYVF1NURMaXFGWGVBZUN6MmxEUTJzWGRLVnJtaGlOM0dZcVFU?=
 =?utf-8?B?YWgvVEZRUzAzdGhTVnVqVEpHK3RLSEpwenFGSnk1VjF3QmtsYlliUEl2aHE3?=
 =?utf-8?B?QW1oYWNnVkl2Z2czRWp2VWtCU1ZWYUp4azNqeEs4OHFnRmQreHFYbEcwc2tq?=
 =?utf-8?B?RnVaODJmcncvUmh3Yk96RFlRMXJWWm5TQXUycFJJWFpySkNtRkxUTlJMUkJU?=
 =?utf-8?B?SVpSVjNZcGFXMit2UEUrNmhySnlTQW4vNFpzbnpnUTI2Z3YwSWVlbjg3eVhR?=
 =?utf-8?B?U3Z3VEExMlExOS9GdUtWb1hZN3NHd3BBMDZMdER3eE5jZ1V6ZndOR3RjWUQr?=
 =?utf-8?B?c3hOL29tU3dtYlZzWFpuSUxpZTl4Z2J1ZW5JaHpuZkV0N0xBRGx1NVpyWUpt?=
 =?utf-8?B?RU9FL2VRZ2QrczlJU3FFSzhFVWd2eldIdHVhcGlLaTF6VzQxOERBQVpyN0pj?=
 =?utf-8?B?azc4eGp3MmU0YUs0M2xTYUVBMjJ2Q0VBOWZWbjdLb0t1MllIN3BmNEFUSVRQ?=
 =?utf-8?B?NnRBWkdYNnVzSnJPNTNrOEdZMUVoNC9WeTd1Yk5ncEhLV21mYS93L3VRY0Jx?=
 =?utf-8?B?bEphOVIvQTI0RUZLTE5UY1dDUTN2ZjBZZW9yMDN0YW9lcmVqaTUrRGFhWUZB?=
 =?utf-8?B?Z2RoTXRmM0UzUlBBR1d5WDl1MXR2aVE3aVBKdEF4T3N3RyttMTV2NlNRSVBr?=
 =?utf-8?B?MW9sYjhvTTBNeGtVNzd2eEtROW83MkNROGJlUjNDRllXbldURnUwcXhVNTlX?=
 =?utf-8?B?UXdMQzZZTU9HUG5aTXkxdWdJV2dzbC9pVmNFZkZLM0grSXd4Z0loR1ZlR2Fh?=
 =?utf-8?B?dGdObEtxbkUrcXF4K1B2V3NoR1RTKzV2NnVJNlJ1Q084eWw2Y21pNCsxZ2Vk?=
 =?utf-8?B?QjNBSkxGa2NyQVN6cU9MVHdmREFKWnBTRlNqYXM0Umt2NHB0aXpFdzVCWlNt?=
 =?utf-8?B?RUtsYUpFaWRQUDF3Z29GdXpteUxvQXU5ZFN5Um9BblYzNkgxVk5EMjUrSnkz?=
 =?utf-8?B?bE9OZ1g4WkQySWNETmpWZnZ6WFhYWWlSUWdSVlc0Z21MNCtOWU5lMDlCSGVS?=
 =?utf-8?B?MjZ1d01qRVpENkZENnUrMVBNY3drbHV4OHUrcTJOcTdHMTJKU3A0ZGNpN015?=
 =?utf-8?B?Um4wRmkvWXpsVnQ1Ymp5MUw2R0RBSDA4czJYOE15UEVUUkIyamV4Y0RoN2Ev?=
 =?utf-8?B?MFV5VWQ3ZWJvT3FRaUwwYTFtc283YmFtS1BQSjRkNnh6SThEdXNpQmNJVlBz?=
 =?utf-8?B?ZzZ5WjJuZVhtUUZ4cklqdHNhZ1FDMVBLeUlFTExHdUhoMFd1NXgwRXlTOGNj?=
 =?utf-8?B?dEFqQU0wU3BGTEZwbFJiRXhXY2xjN0pPUkxxZUZGdndiMDQ4U25OeGRoMlVm?=
 =?utf-8?B?WHhkTjR6RFIvNVQyV2hHeUdzVmljVThaWEJ1aldTa3lKWk4zb1JIRUkxQnJy?=
 =?utf-8?B?NnVZaE95SG5BS1k5QytqdzBNaXNFR1NvbnhqV0pJc1huOHhxYWM1S3psaEdZ?=
 =?utf-8?B?WjZqWjBRRlJlbjFheldCQm9PQ2N1cU9ycjFzNHFlZGUxZmZDOEZ0SE51UFJS?=
 =?utf-8?B?MzVhTXNxc09zcGliRDcra09KZEpnMlJaY29hdGhkTTQwYUFRa2MwZkNnNFJM?=
 =?utf-8?B?MjRZNExzZlFFdklnMHc4aytiSVYycVdGZmlLSmY3N29XcE4xQTgxc3IrREpF?=
 =?utf-8?B?a3Irdk5kc01Yak90d0FvZXN0N0s4K2lrcVVYZlFXcWdaR012WUMwMnF1VXRr?=
 =?utf-8?B?MzBoZ3lMNHFyWitvbUpMVW9jcDQxL2U2UllnNmpRdE5YOGd5Y2xFYUl4bjlN?=
 =?utf-8?B?eHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0762418E085C414398EAC7424DB7843D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a50bbf48-1dd9-4069-1fb1-08db14b93afd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 09:43:19.3604
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aGCKovhzeRoPJHhLk2/UiG4BgCCOofGEHrW7dZKY/zRgpAqLlElWfDkksdMnGisAMV9jpRDFMLLaAn3QandAphl2281lKry1UnwXfKLcuww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2214
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzAyLzIwMjMgw6AgMTA6MDMsIEthdXR1ayBDb25zdWwgYSDDqWNyaXTCoDoNCj4g
QSBsaW5rIGZyb20gaWJtLmNvbSBzdGF0ZXM6DQo+ICJFbnN1cmVzIHRoYXQgYWxsIGluc3RydWN0
aW9ucyBwcmVjZWRpbmcgdGhlIGNhbGwgdG8gX19sd3N5bmMNCj4gICBjb21wbGV0ZSBiZWZvcmUg
YW55IHN1YnNlcXVlbnQgc3RvcmUgaW5zdHJ1Y3Rpb25zIGNhbiBiZSBleGVjdXRlZA0KPiAgIG9u
IHRoZSBwcm9jZXNzb3IgdGhhdCBleGVjdXRlZCB0aGUgZnVuY3Rpb24uIEFsc28sIGl0IGVuc3Vy
ZXMgdGhhdA0KPiAgIGFsbCBsb2FkIGluc3RydWN0aW9ucyBwcmVjZWRpbmcgdGhlIGNhbGwgdG8g
X19sd3N5bmMgY29tcGxldGUgYmVmb3JlDQo+ICAgYW55IHN1YnNlcXVlbnQgbG9hZCBpbnN0cnVj
dGlvbnMgY2FuIGJlIGV4ZWN1dGVkIG9uIHRoZSBwcm9jZXNzb3INCj4gICB0aGF0IGV4ZWN1dGVk
IHRoZSBmdW5jdGlvbi4gVGhpcyBhbGxvd3MgeW91IHRvIHN5bmNocm9uaXplIGJldHdlZW4NCj4g
ICBtdWx0aXBsZSBwcm9jZXNzb3JzIHdpdGggbWluaW1hbCBwZXJmb3JtYW5jZSBpbXBhY3QsIGFz
IF9fbHdzeW5jDQo+ICAgZG9lcyBub3Qgd2FpdCBmb3IgY29uZmlybWF0aW9uIGZyb20gZWFjaCBw
cm9jZXNzb3IuIg0KPiANCj4gVGhhdHMgd2h5IHNtcF9ybWIoKSBhbmQgc21wX3dtYigpIGFyZSBk
ZWZpbmVkIHRvIGx3c3luYy4NCj4gQnV0IHRoaXMgc2FtZSB1bmRlcnN0YW5kaW5nIGFwcGxpZXMg
dG8gcGFyYWxsZWwgcGlwZWxpbmUNCj4gZXhlY3V0aW9uIG9uIGVhY2ggUG93ZXJQQyBwcm9jZXNz
b3IuDQo+IFNvLCB1c2UgdGhlIGx3c3luYyBpbnN0cnVjdGlvbiBmb3Igcm1iKCkgYW5kIHdtYigp
IG9uIHRoZSBQUEMNCj4gYXJjaGl0ZWN0dXJlcyB0aGF0IHN1cHBvcnQgaXQuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBLYXV0dWsgQ29uc3VsIDxrY29uc3VsQGxpbnV4LnZuZXQuaWJtLmNvbT4NCg0K
UmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5l
dT4NCg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYmFycmllci5oIHwgNyAr
KysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9iYXJyaWVyLmggYi9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vYmFycmllci5oDQo+IGluZGV4IGI5NWI2NjZmMDM3NC4uZTA4OGRhY2MwZWU4
IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYmFycmllci5oDQo+ICsr
KyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9iYXJyaWVyLmgNCj4gQEAgLTM2LDggKzM2LDE1
IEBADQo+ICAgICogaGVhdnktd2VpZ2h0IHN5bmMsIHNvIHNtcF93bWIoKSBjYW4gYmUgYSBsaWdo
dGVyLXdlaWdodCBlaWVpby4NCj4gICAgKi8NCj4gICAjZGVmaW5lIF9fbWIoKSAgIF9fYXNtX18g
X192b2xhdGlsZV9fICgic3luYyIgOiA6IDogIm1lbW9yeSIpDQo+ICsNCj4gKy8qIFRoZSBzdWIt
YXJjaCBoYXMgbHdzeW5jLiAqLw0KPiArI2lmIGRlZmluZWQoQ09ORklHX1BQQzY0KSB8fCBkZWZp
bmVkKENPTkZJR19QUENfRTUwME1DKQ0KPiArI2RlZmluZSBfX3JtYigpIF9fYXNtX18gX192b2xh
dGlsZV9fICgibHdzeW5jIiA6IDogOiAibWVtb3J5IikNCj4gKyNkZWZpbmUgX193bWIoKSBfX2Fz
bV9fIF9fdm9sYXRpbGVfXyAoImx3c3luYyIgOiA6IDogIm1lbW9yeSIpDQoNCkknZCBoYXZlIHBy
ZWZlcnJlZCB3aXRoICdhc20gdm9sYXRpbGUnIHRob3VnaC4NCg0KPiArI2Vsc2UNCj4gICAjZGVm
aW5lIF9fcm1iKCkgIF9fYXNtX18gX192b2xhdGlsZV9fICgic3luYyIgOiA6IDogIm1lbW9yeSIp
DQo+ICAgI2RlZmluZSBfX3dtYigpICBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoInN5bmMiIDogOiA6
ICJtZW1vcnkiKQ0KPiArI2VuZGlmDQo+ICAgDQo+ICAgLyogVGhlIHN1Yi1hcmNoIGhhcyBsd3N5
bmMgKi8NCj4gICAjaWYgZGVmaW5lZChDT05GSUdfUFBDNjQpIHx8IGRlZmluZWQoQ09ORklHX1BQ
Q19FNTAwTUMpDQo=
