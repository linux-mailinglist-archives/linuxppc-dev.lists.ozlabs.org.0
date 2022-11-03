Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CED76177BD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 08:39:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2wdM72hvz3c5G
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 18:39:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=QXPEe2GT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.59; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=QXPEe2GT;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120059.outbound.protection.outlook.com [40.107.12.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2wcM4bWVz2xl2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 18:38:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntQ9oFoet8O9FgbaPoO6ZFQr8+A12RmA9NxX+b+GkXjttJCtQ/JoJQ8PuDM5ocNnq1M1CkaJuKGvy/3JUH6aCv4IWJis/Krlhpp3wY+sMdAshwJUGibBhtRs5bDymv1d73voaGQSMRiw+NYBjSCStdWSn9VqJQ5/e1VCiYqHnqDn20ZVBM/2bkXgeEHnm1YgjIcxTCbgOftNMylAgzcSgsr5E3P4a5ck1Ul7Nla7FM4kFB012e9JNWAEKfN2+CU4PLWq/ko5I6Rwbd1JPgBta1no4v5U5eJ4cABbpDwRZIPGU1IUqi/KixRIv67JfrymUBC2jdR7chwYvzPR64sINg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7c0QXft0IMiy48tJG/KLHltBt3NSpF8tpq59HwPmdTg=;
 b=MPCi46XKgII3M0fbuGLvMyYlmEJ+FHcOZ5qAu1LiUuc4cy8KvfCD4kKy6aJg6p/UF0LNlHYR6xmDmPrdacyiGUAx+/0IjCW7n8+Rc+b12P8u++4/NgYuxQ+WkN+xUheFQHVPIT1P3X1OrKeBfPkhdwZcuMCYcMKnmfqV64jcoZzwfAun86egijdORB0cNzvXyUhkB28txkJg/yjpnRIWl6RWAuaelfbPuHHJRqbJZDAfHH7QYYXWZQ/aRkj0wNLJFSfX6cYYm6AM9l+7H0Qsu2m7qS6YCnaTzFSa0u83LRkvqb1gHV6PYYZnSJgQv1jBMY9YoWsaskT/hTaVKxVAtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7c0QXft0IMiy48tJG/KLHltBt3NSpF8tpq59HwPmdTg=;
 b=QXPEe2GT5KpvA8j+B1oPdICOYjoNPVpIu1aqNBDbXgqmEUGA79gp9HKO1rKuyHFDhbqSViXGFgLuj1TEPkBKlqo1++xVvHDacT8SP/R/TM3gGTsR7X/p45mATVpHjV6KUTK38V1kGp0T2iOeAFFOxD7KMABkdWNkIgxl0bY3qLpP3TSbPybIgP15kly2w403MCEovnhxBQm5azc8CYM8l8oKeMduGaZYJsCYi7Ge56Q62pvqc/Ft7JJKd6WBwX4j571by/IyTneSVUyNM48mm20ttx4yJz7ZdcT27uPktfF7RDWzoOI5cqt/8/mClTzZ6yNy68uNx+nxeGqhEiY8Sg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2105.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 07:38:38 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Thu, 3 Nov 2022
 07:38:38 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Chen Lifu <chenlifu@huawei.com>, "benh@kernel.crashing.org"
	<benh@kernel.crashing.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"npiggin@gmail.com" <npiggin@gmail.com>, "nick.child@ibm.com"
	<nick.child@ibm.com>, "zhengzucheng@huawei.com" <zhengzucheng@huawei.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 -next] powerpc/powermac: Fix symbol not declared
 warnings
Thread-Topic: [PATCH v3 -next] powerpc/powermac: Fix symbol not declared
 warnings
Thread-Index: AQHY71KWlQ0BIUUBTE28ih1PZTYora4sz+qA
Date: Thu, 3 Nov 2022 07:38:38 +0000
Message-ID: <310993b1-9293-f64c-ac4b-73ed8fd73aae@csgroup.eu>
References: <20221103070122.340773-1-chenlifu@huawei.com>
In-Reply-To: <20221103070122.340773-1-chenlifu@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2105:EE_
x-ms-office365-filtering-correlation-id: 99e0d714-702c-430d-b9d3-08dabd6e6bf8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  XlIbpp1ydme8Qsj8BsK932pVzuVzpLvJHnNkDm9aZPv0XuucM9p6DRMziy8LdCO19dtwmGjVOzSvo16JnKo47+8dDep1VMeu6n3ulxL8NP7ng198j7zXRRE2YFL989k2RShkGnJGKfVsntHjXjvaZe56oy8JWHIvSwRNj/7tH0zvzGC3vBPL6UEfNiUvNvLgPnah4pWGDbY0yn4G5YJSOMmRmHXwgTizjhCVHV4TVUlkZNCGh/LErQs5c6a+O26nEETKIDpKVPsA2TG/vOtxpbYxFiw8+vw3kGWwgtr7J6MgAaJt+ZYTm/huMncQkGOb2QUHtn68dFHMMoDEdBFF3aZUIFgeVegWoN1N62NAnjg/j/J7mliWd7wLM8aaABd+uqlij6MvqpjGZhcwSLtexX6YOGzge1tAJ4Cco0KAhCiTdj9bUn6ZEHxDmGITHJ59JrG4wC0ej8KIZB35JdQoX2w+6fWWw2ybjG9em4a3r3BNxBqy9XVe0tFoirhSENnUoqLyf/vEulinggEK8a2cLcsp4QSPkIcyy+KPvIFl8566X+ePsFGzolxKYzoleM+kp2mbEZ8U9lYMZ7j5DJYywBLgqIZ4888w/rHFVqlpdc4X92nb2Qmav7yuyH91+afSL4rfQW+mWQ5LbTZC72PfwthLj6c63MDyid2r7zioAq/oTYr2FUf7ePsxaihDmIJcdOHENvom79aCXyyocA2RnrLQu/Y1rf896Wxb7/NJIzOlbkdMEGBqGo5ggkZV1chYzjuS1vDVFVG0cjKFuYx31E+HHG5zlor7uXnuGHM2G0QCkf9D8u+Yy2m7KckqsKnnH2Zipu7gMUhtyLuOTHZ0gA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(376002)(39850400004)(136003)(396003)(451199015)(66476007)(6486002)(66446008)(64756008)(44832011)(66556008)(478600001)(66946007)(76116006)(91956017)(66574015)(8676002)(186003)(2616005)(5660300002)(38100700002)(316002)(122000001)(2906002)(41300700001)(71200400001)(83380400001)(38070700005)(110136005)(36756003)(31686004)(6506007)(8936002)(86362001)(6512007)(26005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?LzQ0a2piK3A4Znp6dTJMVlU0Mk1sNGUzS0R2VnU0MnVvMVpzNXhwMXJmdHgr?=
 =?utf-8?B?WXBBV0kxYlR5UWhzK2lZQTA1Mkl2enlocmhNa2c3WnFuMU5hNTVPSWhuaWJB?=
 =?utf-8?B?alRNY2RBT01SL2E3WWNWMDRrV1V2dno3QkcxcG12elo4emthRnV3QnFWWW4w?=
 =?utf-8?B?WkE2bUVrUDNSVjQrVzBCTlJLNksvZTByV2lBRHVqU1QzMUZUa3ZvVjUxd3lT?=
 =?utf-8?B?aDlWclFNb2tOSUhhTkVaMFJYemR0dEdjMFJOcFMvVmVmSHpVb0NvejZJaC82?=
 =?utf-8?B?V1ZiSFJubHRQalV4S09YYVJUSzE2ZmdhdHBUYmJkNjR2SGRUUDVOblpWTmR4?=
 =?utf-8?B?ZitBWk5lNWd4eURibTV2TUx6Zkl6VkdFalVPNllUYXZqbXZVU3A3UzFJYmxq?=
 =?utf-8?B?RDhNS1JLVE1jVU5hT2ZhQWxwS3FUWWFJNmN5VHF3UWMyTHUzbDdZTkVpUDcx?=
 =?utf-8?B?MjE2TnRsb1ZvMWU1a3dvSU11YVpIV2JhbzUzcEhkTTRUTGRzV1Z3Tk9lRjQy?=
 =?utf-8?B?dS9wbkdKMjlOUVdoaW1zN25BSlRoTG42cjZTSCtGWmIrZ2hvZTRmWkdwU1py?=
 =?utf-8?B?cWlWZEY3UkN0Smp5TFVXSnhFZUpQYVpaNm00Q1BodSsvM3pJK0ZMVnpSM2wz?=
 =?utf-8?B?Ty9kenRSMGYybDZ1SjhkN0tMSXVTWGZ6MXdRam5tcTVPRlRaNVhZUFBVR2Yr?=
 =?utf-8?B?cmlldXBNelhhcmNuV3FZT1Eyb21CUHNyQ3hrbllmam96dXhCbTNhTnhhTmU3?=
 =?utf-8?B?NGRvWm9YTnhYVDdzWGhtRFkzY25hQjVwZHBZU0dTYmtMSWZ4MFJoVGdRMFMx?=
 =?utf-8?B?NXNZRG1YM2p6U0V3b0xiMC9rMENFWEYyOUVlZ292bVZCdE0zQ0MzTkpYeGpy?=
 =?utf-8?B?SHVpdDcrVVd0R0JOSWxQWXpUd1dIak45UllFRWcwbDlBbHBuZFZqWWpPMFZZ?=
 =?utf-8?B?RVZBc3FYZ1p4V1hreWVmWmNWcUdxSzhyOGs5TzRBcXpCazJEcmx4U1hyU3Vx?=
 =?utf-8?B?bEpjNTM5YlRVNEFnUXNQUXczVEVnTlhidDJVYWZHTTBFQUhvdWxBMVZXVTlV?=
 =?utf-8?B?TmF0VnY2M245VFFGNlRvQ24rWC9XOVN3b0FVenY5MUhjNU96TndqNmFPMWht?=
 =?utf-8?B?QUNKaXdoN09ibzZCNW5vdmlpMHZEUzhOV1piTjFZS1dpWWtWM2RNR3p0QnY2?=
 =?utf-8?B?elR3MXJEUU5SbFFlSDJrcVhXb1JGRG44VGZ3REJFMEs4K1FJNmtqTjd0Rjd6?=
 =?utf-8?B?UGVnNWlOVU8vYlE3UDVCNm9nY3R6R0RXM1loMzZxNlFub2J4RnF5WnZIRU9k?=
 =?utf-8?B?SERyekRJeEdyM1ViWW9WQzNJWTZxd0lRVUZnWGxxbi9OM2VYaUF6ZzkvZlh4?=
 =?utf-8?B?TFB4cTMrMDAvN1p0S1JMb3hSYWNwN0V5R0JIMHhQb3BQdFlWbUphRDJoNlZO?=
 =?utf-8?B?R0RTdW5XbDFRTFZpUmNhS1RoR2xKYU01RzRQVGtRSmZXZVczRUFOUkFCdFo2?=
 =?utf-8?B?MVd3cHZBS05UbnViVVREYWdDSnhTeGptdk5neElkU2Exb1hrNFl0UnllZWJ6?=
 =?utf-8?B?MGpaNUFBQVlhM3dBR0JLSXgvaHlxS0oxWDUvRHllcmMzSXRoNElQbGFKenh0?=
 =?utf-8?B?NXJmaHBiN2dmZVRGcTU1b2lVUk1ZVXNSakZNb2NocGtOMGxjWkF4SE9kQ09J?=
 =?utf-8?B?ZVBJbysyaVNwamp3bXFPZldja2RnZElkb0xmbTQ1RHd3OThXWVVQd21Fd1V0?=
 =?utf-8?B?Qjhvd1hjWnNpb2ZpOGo2Y3VEV1ZzSWFuNWFrYkdoM3pESjdsd2huUjNFUlJV?=
 =?utf-8?B?cU0vZW43bTdJN3ZGUjBzN20xVHNLazg2RDE2OHZhd2xSQVkwZ2thQzM1bXRt?=
 =?utf-8?B?UXVPalQzMWRUc0lLd2RxSGM2ZUtFQjEwZHREUkZnT2p1d1lnRWVudFU2ck5x?=
 =?utf-8?B?bm43T2dvTzhxYTkrdzF1QzR6S1dnOGtISlBmdllIbU1GV05mWDlBSWpBdnRT?=
 =?utf-8?B?S2pUamkxVzVtZVQwY2lDT2NEYzFkTll6SHoyN2R1NXpNc3dxemVCdnlSWTV3?=
 =?utf-8?B?UWNsUzFlT2VNNXVyYnR2Mk50QUh5QWpONWJXUE5SWGk5Wm9EQWdBWlUxRDFP?=
 =?utf-8?B?VG1wbHhnK1plL2ZYenJQdlozRnc3dlY1QnVRMTc5NzdEczlRTUoxNE0wZERk?=
 =?utf-8?Q?mmKriEqfgIM7PJt80S+1oSE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51098DF1B7A28C4B97467D475BC32EAB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e0d714-702c-430d-b9d3-08dabd6e6bf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 07:38:38.1380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KfsN9gueztykxeQ8f4eWG8+zK+E+bDbxT/npI5kb9pLfbPrdExAFdLFKkphNFWXebG1Xumr+ZwRJUWmh5F7Y3kq+XrN9XNlU4Z44FRqXpTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2105
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

DQoNCkxlIDAzLzExLzIwMjIgw6AgMDg6MDEsIENoZW4gTGlmdSBhIMOpY3JpdMKgOg0KPiAxLiBw
cGNfb3ZlcnJpZGVfbDJjciBhbmQgcHBjX292ZXJyaWRlX2wyY3JfdmFsdWUgYXJlIG9ubHkgdXNl
ZCBpbg0KPiAgICAgIGwyY3JfaW5pdCgpIGZ1bmN0aW9uLCByZW1vdmUgdGhlbSBhbmQgdXNlZCAq
bDJjciBkaXJlY3RseS4NCj4gMi4gaGFzX2wyY2FjaGUgaXMgbm90IHVzZWQgb3V0c2lkZSBvZiB0
aGUgZmlsZSwgc28gbWFyayBpdCBzdGF0aWMgYW5kDQo+ICAgICAgZG8gbm90IGluaXRpYWxpc2Ug
c3RhdGljcyB0byAwLg0KPiANCj4gRml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nOg0KPiANCj4g
YXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm1hYy9zZXR1cC5jOjczOjU6IHdhcm5pbmc6IHN5
bWJvbA0KPiAncHBjX292ZXJyaWRlX2wyY3InIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBi
ZSBzdGF0aWM/DQo+IGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJtYWMvc2V0dXAuYzo3NDo1
OiB3YXJuaW5nOiBzeW1ib2wNCj4gJ3BwY19vdmVycmlkZV9sMmNyX3ZhbHVlJyB3YXMgbm90IGRl
Y2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPw0KPiBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bv
d2VybWFjL3NldHVwLmM6NzU6NTogd2FybmluZzogc3ltYm9sDQo+ICdoYXNfbDJjYWNoZScgd2Fz
IG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IENoZW4gTGlmdSA8Y2hlbmxpZnVAaHVhd2VpLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9w
aGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBhcmNo
L3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybWFjL3NldHVwLmMgfCAxOSArKysrKystLS0tLS0tLS0t
LS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm1hYy9zZXR1
cC5jIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm1hYy9zZXR1cC5jDQo+IGluZGV4IDA0
ZGFhN2YwYTAzYy4uY2I5YTMyOTA4NDlhIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvcGxh
dGZvcm1zL3Bvd2VybWFjL3NldHVwLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9w
b3dlcm1hYy9zZXR1cC5jDQo+IEBAIC02OCwxMyArNjgsMTEgQEANCj4gICANCj4gICAjaW5jbHVk
ZSAicG1hYy5oIg0KPiAgIA0KPiAgICN1bmRlZiBTSE9XX0dBVFdJQ0tfSVJRUw0KPiAgIA0KPiAt
aW50IHBwY19vdmVycmlkZV9sMmNyID0gMDsNCj4gLWludCBwcGNfb3ZlcnJpZGVfbDJjcl92YWx1
ZTsNCj4gLWludCBoYXNfbDJjYWNoZSA9IDA7DQo+ICtzdGF0aWMgaW50IGhhc19sMmNhY2hlOw0K
PiAgIA0KPiAgIGludCBwbWFjX25ld3dvcmxkOw0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgY3VycmVu
dF9yb290X2dvb2RuZXNzID0gLTE7DQo+ICAgDQo+IEBAIC0yMzQsMjYgKzIzMiwyMSBAQCBzdGF0
aWMgdm9pZCBfX2luaXQgbDJjcl9pbml0KHZvaWQpDQo+ICAgDQo+ICAgCQlmb3JfZWFjaF9vZl9j
cHVfbm9kZShucCkgew0KPiAgIAkJCWNvbnN0IHVuc2lnbmVkIGludCAqbDJjciA9DQo+ICAgCQkJ
CW9mX2dldF9wcm9wZXJ0eShucCwgImwyY3ItdmFsdWUiLCBOVUxMKTsNCj4gICAJCQlpZiAobDJj
cikgew0KPiAtCQkJCXBwY19vdmVycmlkZV9sMmNyID0gMTsNCj4gLQkJCQlwcGNfb3ZlcnJpZGVf
bDJjcl92YWx1ZSA9ICpsMmNyOw0KPiAgIAkJCQlfc2V0X0wyQ1IoMCk7DQo+IC0JCQkJX3NldF9M
MkNSKHBwY19vdmVycmlkZV9sMmNyX3ZhbHVlKTsNCj4gKwkJCQlfc2V0X0wyQ1IoKmwyY3IpOw0K
PiArCQkJCXByX2luZm8oIkwyQ1Igb3ZlcnJpZGRlbiAoMHgleCksICINCj4gKwkJCQkJImJhY2tz
aWRlIGNhY2hlIGlzICVzXG4iLA0KPiArCQkJCQkqbDJjciwgKCgqbDJjcikgJiAweDgwMDAwMDAw
KSA/DQo+ICsJCQkJCSJlbmFibGVkIiA6ICJkaXNhYmxlZCIpOw0KPiAgIAkJCX0NCj4gICAJCQlv
Zl9ub2RlX3B1dChucCk7DQo+ICAgCQkJYnJlYWs7DQo+ICAgCQl9DQo+ICAgCX0NCj4gLQ0KPiAt
CWlmIChwcGNfb3ZlcnJpZGVfbDJjcikNCj4gLQkJcHJpbnRrKEtFUk5fSU5GTyAiTDJDUiBvdmVy
cmlkZGVuICgweCV4KSwgIg0KPiAtCQkgICAgICAgImJhY2tzaWRlIGNhY2hlIGlzICVzXG4iLA0K
PiAtCQkgICAgICAgcHBjX292ZXJyaWRlX2wyY3JfdmFsdWUsDQo+IC0JCSAgICAgICAocHBjX292
ZXJyaWRlX2wyY3JfdmFsdWUgJiAweDgwMDAwMDAwKQ0KPiAtCQkJCT8gImVuYWJsZWQiIDogImRp
c2FibGVkIik7DQo+ICAgfQ0KPiAgICNlbmRpZg0KPiAgIA0KPiAgIHN0YXRpYyB2b2lkIF9faW5p
dCBwbWFjX3NldHVwX2FyY2godm9pZCkNCj4gICB7
