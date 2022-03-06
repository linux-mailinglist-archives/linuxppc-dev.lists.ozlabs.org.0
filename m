Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E40604CED98
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Mar 2022 21:05:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBXdM6F4Nz3bcK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 07:05:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::617;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::617])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBXcs1DRXz2x9P
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Mar 2022 07:04:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhBe+f87/k9Tm9v8Y7m+ERakg2KJ7hjHtnDQdiNO1JylKVbv9+n7SOSUXkI4u3whuMRJXBP0uMfO1w3Uhry90Fw0Mxg/vkvQbmtGH23ui3jWHxq0GwdyECzN9n750u5fTuZK5meDo+7nm73WsOBY6EWi375De5gLg7arid/6E4ZatDVbnixxtVvzThUI9MH5EWSGRNKSTAa8oc1rPeXTB/jIpYU4by8qmgdA2Udlml75wkWyGz0kbZRlzclWPAswefaWwoMTX0g037wpTO+lLcnsPlzKvRUQkHunTPFMZTbhnQuep0IJBQG/oR/tr+IRPREvJIX2J9tjJlGFgaqsBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=My70ewoGJ8jgzeTnraJRoJGw5MYrxOCUi3YC4g5HMng=;
 b=Dnz9dOcuXU9i5WrRvsUj5Ol55OShdMcUTPk8v+63Z8Rk8ITPR+sVACUoRXUgpcakSXkrTdi52KZqPi2dLJOtiX92sdexLVrMLIyIDLnbsy/4I9u7f2WQohO5nYUHBay8may++IiPzTfw8vvdR9Fu3AMJHzG73kPq2UMb73VVHMkUXalQWL2VEciMGQ2TpNHUIt2d7/ap7ulfWa7BIIW+kKDqP3OTp/C2kuNn34PpSs8u12tseEdVg2tkk+BBRaeTvpwlij7LOROv5b0eaDrTH4SyLS4oq7DMC5VwupwkbpHgs7MLlLXZGvzC2Sfp/qpuGWxHOurtR6MJb34Xb6OH7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR2P264MB0306.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Sun, 6 Mar
 2022 20:04:37 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%4]) with mapi id 15.20.5038.026; Sun, 6 Mar 2022
 20:04:37 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: YueHaibing <yuehaibing@huawei.com>, "jk@ozlabs.org" <jk@ozlabs.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "paulus@samba.org"
 <paulus@samba.org>
Subject: Re: [PATCH -next] powerpc/spufs: Fix build warning when
 CONFIG_PROC_FS=n
Thread-Topic: [PATCH -next] powerpc/spufs: Fix build warning when
 CONFIG_PROC_FS=n
Thread-Index: AQHYMI/JaxR2O8+ZXk+GW3DAquAf+qyyybCA
Date: Sun, 6 Mar 2022 20:04:37 +0000
Message-ID: <860002a4-4e52-c399-fda6-054fa64df3ce@csgroup.eu>
References: <20220305123116.26828-1-yuehaibing@huawei.com>
In-Reply-To: <20220305123116.26828-1-yuehaibing@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ea622f4-3da4-4e24-c7af-08d9ffac8a7f
x-ms-traffictypediagnostic: MR2P264MB0306:EE_
x-microsoft-antispam-prvs: <MR2P264MB0306CE7D14A1824392696CA1ED079@MR2P264MB0306.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R9IJ5sYZ2h6skzicIgCXltNFsC04WXEW10q7qGQ11kDyYKD6OGtObAcifovxBqdB3SBlZGDZORpi67bnI47dAvg8O84Hsp/JbPccQgfDdE8AiLRL1hkdcH7R6zAbK7/U25XDFkd1TVoV74kCRvhVmM2m7RG5MtNBPGNYi75HSOlCwLpNMKpNf+l7ot4N7WY1acgJUI2kcbkxrYz5sr4U4sUnpEtNMWRMz1ZfccuffS5FnWnYMsYkkoUXx898BUeXxmqhex0pgOtc4GTJsXieMwOnf6LoOUtFxiXl4uh/VjkOEyGlnYbJha3ncPAVLpXoKhDPhjG7UR8Xm+R1N+riwQksnLL6kyYR9lgGmHThMT0CgtWVMpKJfhg7GtkrBZbs5JbgIHqeWGolcnhhlFIjvqCklwBIHodV+R0U5w3mUrprSQFV1QwgLDPyUp9if35G/58o6LsUeI7kedAnFD6PAO6RJ0f7pimlbMGF50obiSnZGiKoXPWPwsTTdY7CTF6UtDchlLCLJBZ3oFbHA2Fgi0MiDXElVjjP7pF07TQ6FCqUf49HU1VLMK3YSvjw88GAoD4U4rcCOAaIHjUmSAWR/1wus29EhvjMAuvnJqFVZHUE6nC6ytd5X1l4y00OVqy+oGoyhemy9rqecJ56xW6bT9yiFPpHX1u9RBKg5iHee0PZi2Ee8ZFhv90bBFrApFJOZh/f2NBlWWGhIjAFRbL2qvua7dEa48sik21i6QkV9i21LdHk92ZmHCm/z6xFIazKRK8Efix1QV8evQFaqXv9Jg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(316002)(66476007)(66446008)(8676002)(64756008)(76116006)(66556008)(66946007)(4326008)(66574015)(91956017)(44832011)(5660300002)(2906002)(2616005)(26005)(186003)(6512007)(83380400001)(8936002)(31696002)(38100700002)(86362001)(508600001)(31686004)(38070700005)(36756003)(6486002)(110136005)(71200400001)(122000001)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFpacnVlOUV2WjV4Vnc1cHo5YktGZlFXMlZaY2FqTE0ySmFyTHhsQ1h3bTB3?=
 =?utf-8?B?K0o3citIQ0RUdExScTdRM2UrRndORW9sTWxtazZDSklac2RtNmJUUWdjTXRj?=
 =?utf-8?B?bmZXWGRmeS9yQU56YWx5OGVJQzhuZmF0K2xGUWUxUTZlc1pJMnF3dGpFd0Qz?=
 =?utf-8?B?NDNsOFVtOUFzZWFiUXVtWUVkdmF4UStRaFh5SXIzc2E4alVidHNBbzBZSy91?=
 =?utf-8?B?QUdkSWZ1YU0vRmpwcDRlSGc5U2FJQ042cTB4UjEwUUUrQ0loNGQ5ZFBoL0pZ?=
 =?utf-8?B?TWlJaXIwQm9wLzNKeDhCZUNVZ25mMXB3Z0FuTk1YUk5XeDJFaDYxN29Uempv?=
 =?utf-8?B?TG1KQ3RtT3F1L3BTOVZYQ1gzZzlnOUZjcUZZcWpobExoTnNMZHlLN2E4TE94?=
 =?utf-8?B?YUhKa2FsR21oMmVXM1R0SkpDNzZGUGwybVdmeHFIemp3QjlYOGthcXBFTjFU?=
 =?utf-8?B?RXdNYmRxN1ZGOU02NkVSdU91aGY3c1VCQXJzY05OYk9uN2dxdTVlTTMzNk5i?=
 =?utf-8?B?eDJCeHF6dHNYdkNIVnB2bUtEQWpZcUFqbldjL1c5NHIxWktPZld2cjI4UWRq?=
 =?utf-8?B?RFBzZmd4SkhTcUo1b21xWEhtWG80K1VMOXBkbW5OMUtyeldPZVQvUjJSMWNI?=
 =?utf-8?B?OGNYWXJBcFVLSzA4TWlRcFVZN2k4dTh5dHRqaFFvMFplTktOQjg1N1dxbkJx?=
 =?utf-8?B?dGEzREpsMU5mcmJORm1BQVkrc3JpOHJySFY1WnVWZmxOeC9mY3pWZVJ5ZDVw?=
 =?utf-8?B?cG4xTmg4K0dQR3JZeDk3emZReWRhbVZvc0xRL05UdWkrYlR6SlMxVkpYRE9Y?=
 =?utf-8?B?NEhiV09rMzUwbnpIQ3dpZlhqWVlTd01FcDBaZFRDeTNPejdHMjhKekw4amdC?=
 =?utf-8?B?c3RaOGd2QjNISzJ6MDU2YmNCR3FvUnBSa3B2Mng3ZUl2a0kxbTVVSWp6UCtS?=
 =?utf-8?B?UGgvdjZTVk5JTE9IVTNrRnlBd2pkOWQrNWRzTzdCZ2V5azU2YXJ2MDVzZnNY?=
 =?utf-8?B?Z0tQKzErMVhVVUdRYjl0dEJiczRaTDNLUFRER2VjS3pLT0Nnd2RpSHRQK1Vx?=
 =?utf-8?B?RTFIVWhUeHFuSzhtTU00Z08rbUgrQ0RSbnFwMTNjSmhzRHZ1Tjg4SWQ0cFRN?=
 =?utf-8?B?cXNsMkczZHhkTTVEZlFRU1VGdUpycU5jVGkwd1FUMmRjTUp6dkZoKzNhNjh6?=
 =?utf-8?B?UldvQjlRZi9LSkphRCtpVXNCNDgyMVV4eVIzUHk4QXRjVWdRQlZSb0hBL1Za?=
 =?utf-8?B?YSs4ME1nT2svNXd3aU83cW1xVENleUNuYmx2QlRPTVJQaVlyOE1NUG9GNVZE?=
 =?utf-8?B?Wkw5UUhmREUwOTA5UGU2aldTaGZwb3MwQW9mdXVQL0tBUE1zWXJaSVc4MDBm?=
 =?utf-8?B?SUcrM3lBRFlkL05CM2RlTEo2NVpsTEZaWjZNUStDNmNjYSs1NlBzbHFzUDNh?=
 =?utf-8?B?NkNtOGo4VGFiYTVFRXJyK2V6ZkNaMlROWjAzYlJ6TkJsNFJCWVVDay9jOFh1?=
 =?utf-8?B?VWVWUWpBVmJaUEt1V1NpNVFYRzdQL0dVZmNkS3FGeU9LOVpSa3MyUG4rTjUz?=
 =?utf-8?B?UjIxWTh2MVFkdkJXNStST2JHMmNCTDZQNFJva2hBTyt4T3lQbUsrL29WdGlJ?=
 =?utf-8?B?SXBQSGRHZGp3MmpLbUhMN0hMK2V1T29YMTMrbStqTDAzQW5CczVPUVp0SlFI?=
 =?utf-8?B?MDZUbWFtZk1rTUVTdy93TW5yZTBuckJGdmphV3pxMnpLUy90N0xMeUcvOEY4?=
 =?utf-8?B?NUZPS2x0SzIrOE1aQndRdXlNTkdHdlY1S3JoSUJRZkUvT0NlUkl6WDlKNXp1?=
 =?utf-8?B?ZytUMTcxRnduRE5qb2NIQkc5dWRHbnZLem9hUHJ2MHFuOExQVklsMG80Q1gx?=
 =?utf-8?B?Qi9zZGcvUk9JUkVBYnlMdTc5SEtwL3U1ajJJVXlZbGREMmRaWnpBNFBQNDQv?=
 =?utf-8?B?U3EyWUpmVnd4V1p2MWF2amNzRkxKanAwaUZsT2JVNW55dGQwZ0g1QW1Zak9r?=
 =?utf-8?B?NC9ybi8rQ01ydTJRaE9MbWRqVkRpOE01TFpKQkdjVStidVpoWXRyS1dtUXlK?=
 =?utf-8?B?MGdpUThsNFhRdzhTWHhYUlNnUThyOUNrcTQzVCsxZ0I5YTNuTXdWK2xTallx?=
 =?utf-8?B?a0wzejZYMDFHeWZKWFVBd1FGdXVzdDU1bTZ3WndXZ1NGL2tTeXErVS93d2Js?=
 =?utf-8?B?WkE4TkRCME5iaTBZbldvaXRBa0xxNGswbWIzUnZXNUlVY0w5blVoSExDNzdz?=
 =?utf-8?Q?Q8ekLZ9bd3fUsp04+NTM3PQZLWlApjgqrE4idpIuoM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <042EF85253D0EF4BA592702AEFC96ADA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea622f4-3da4-4e24-c7af-08d9ffac8a7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2022 20:04:37.1928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H9c05mnT3tm61xtv5H91w4UbmklzpPiGzTwTZ92jE5nNWw3po2Swd17E69o/1cqvSQKRRHINvYdT+xCEcolqQR6/caJxeUzYp4Ee9p69Dt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0306
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA1LzAzLzIwMjIgw6AgMTM6MzEsIFl1ZUhhaWJpbmcgYSDDqWNyaXTCoDoNCj4gYXJj
aC9wb3dlcnBjL3BsYXRmb3Jtcy9jZWxsL3NwdWZzL3NjaGVkLmM6MTA1NToxMjogd2FybmluZzog
4oCYc2hvd19zcHVfbG9hZGF2Z+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtZnVu
Y3Rpb25dDQo+ICAgc3RhdGljIGludCBzaG93X3NwdV9sb2FkYXZnKHN0cnVjdCBzZXFfZmlsZSAq
cywgdm9pZCAqcHJpdmF0ZSkNCj4gICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4NCj4gDQo+
IE1hcmsgdGhpcyBhcyBfX21heWJlX3VudXNlZCB0byBmaXggdGhpcy4NCg0KTWFya2luZyBpdCBh
cyBfX21heWJlX3VudXNlZCBkb2Vzbid0IGZpeCBpdC4gSXQganVzdCBwdXNoZXMgdGhlIGR1c3Qg
DQp1bmRlciB0aGUgY2FycGV0Lg0KDQpwcm9jX2NyZWF0ZV9zaW5nbGUgbWFjcm8gc2hvdWxkIGJl
IGZpeCB0byBhdm9pZCB0aGF0IHdhcm5pbmcuDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhh
aWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL3Bs
YXRmb3Jtcy9jZWxsL3NwdWZzL3NjaGVkLmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL3BsYXRmb3Jtcy9jZWxsL3NwdWZzL3NjaGVkLmMgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1z
L2NlbGwvc3B1ZnMvc2NoZWQuYw0KPiBpbmRleCBkMDU4ZjYyMzNlNjYuLmM0NjgzNTYyNTEzMyAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9jZWxsL3NwdWZzL3NjaGVkLmMN
Cj4gKysrIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9jZWxsL3NwdWZzL3NjaGVkLmMNCj4gQEAg
LTEwNTIsNyArMTA1Miw3IEBAIHZvaWQgc3B1Y3R4X3N3aXRjaF9zdGF0ZShzdHJ1Y3Qgc3B1X2Nv
bnRleHQgKmN0eCwNCj4gICAJfQ0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyBpbnQgc2hvd19zcHVf
bG9hZGF2ZyhzdHJ1Y3Qgc2VxX2ZpbGUgKnMsIHZvaWQgKnByaXZhdGUpDQo+ICtzdGF0aWMgaW50
IF9fbWF5YmVfdW51c2VkIHNob3dfc3B1X2xvYWRhdmcoc3RydWN0IHNlcV9maWxlICpzLCB2b2lk
ICpwcml2YXRlKQ0KPiAgIHsNCj4gICAJaW50IGEsIGIsIGM7DQo+ICAg
