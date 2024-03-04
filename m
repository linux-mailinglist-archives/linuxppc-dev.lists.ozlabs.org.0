Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 479B087093F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 19:14:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=AQkXWCzu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpRfK0F8tz3vdf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 05:14:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=AQkXWCzu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::700; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpRdb1F1Hz30gn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 05:13:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iK4qClUiMg8S8ydFH+GZO54xF3gzwBAZLIqNuyHI0XEy2IDAWS47jQ0FGwQvazC+0IgK4GPFAijYuoDQN10l4+uUat2lBRjcwys4+MtGrA1bT/muY9CK+rDmiq589adjMGiY6HEazEn1NAmM1R3jaGBH/UGVKSP+nWYSukLCo7ZIcZPS45Zpks+9tf9kJwRM22l0PyplPjpnuyJHaOTSSpwQBvtjJhgK1j8KDHk82Va/a5a7oHS6GE/DNScaAyJ46XMUCmiNQhs76KhuaAA4xhJhVmOZtm5t4b1XnbNRQrydVhhxcMpQTE62w5yRrPaverj0zYDsH6mAa6Gl2lexig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZqT4+9Gr8s37n+LX2357Wqq4/DVAyexBLsGsWbAQyE=;
 b=HbKau8YA95E66C0NI1GZSpIgr7VWiW1K1LCcgg6zev4N3aEFA/CqQezYPBEOH44hLtITXkP9QbIqXOxfsDwTbKAq8CdxKU6jfJJwtSKbLIfE1JUHQ3PNzOqJV5VibFAHNJEc2qJNpfe4uJpI3aBFIjdY91yC/TzCjFqPX7PF98d6PSYwv2kYwxNfQcX1bTBkw+JkRQOAqfBeuTga1TIxyhKoTp0BuIcRirBkBfdbn/YckKr/XcU72bfPwVKTb/iT78wVnDTVKQLONfxyf7Qk0WGAIL0KVhUSZ6rYbjnSoGO7tgRKvPSW4XSQZ+Lh6fxcbCcSvAuJm9J+k/PATCnkOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZqT4+9Gr8s37n+LX2357Wqq4/DVAyexBLsGsWbAQyE=;
 b=AQkXWCzu9NzNJZofGCGsGzJPLY8p5ztmMyHuvpPITfjBE/EcBcTL/eswugCrXO7xQR5+zOmX3/9n6qKoQTbJ/kyXGHn0fMBOOBgJV0Jp/PjjAEWaajwb1d+0xrgQCN9ztmqOxj+fuMZyIV9MRRjZ4rhblRhyBf/OGk6+Sc51WD5iOAWT03kJpxRjOAiIAwcJIUJ9qfdiHGPsQFPXoy5bl5WRdb8mvmQKDyb+mWkrp/rFjRxyXdUS04TNyzSf+ShUS6lMFHPh0gZPAKkjKiSH3xtVRT6/2kkVD1aNwHQt8Ae16HaCnQrjQlestGljW+T3fczKtcFjW+Ws90Rgi7PDZw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2444.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Mon, 4 Mar
 2024 18:13:01 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7339.035; Mon, 4 Mar 2024
 18:13:01 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula
	<jani.nikula@intel.com>, Michael Ellerman <mpe@ellerman.id.au>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc: include linux/backlight.h from asm/backlight.h
Thread-Topic: [PATCH] powerpc: include linux/backlight.h from asm/backlight.h
Thread-Index: AQHabhpX5/mQAZSSV0274uSQf7awc7EnYl4AgACAnYA=
Date: Mon, 4 Mar 2024 18:13:01 +0000
Message-ID: <e5a0e44d-d2b9-49f0-9a08-fb7d9254266c@csgroup.eu>
References:  <CA+G9fYsAk5TbqqxFC2W4oHLGA0CbTHMxbeq8QayFXTU75YiueA@mail.gmail.com>
 <20240304095512.742348-1-jani.nikula@intel.com>
 <eed9bb0f-486f-47f3-b4b5-c07adda4a1c7@suse.de>
In-Reply-To: <eed9bb0f-486f-47f3-b4b5-c07adda4a1c7@suse.de>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2444:EE_
x-ms-office365-filtering-correlation-id: 1b47e3d6-d77d-471e-dccb-08dc3c76bab2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  d75Y1DLtcoO7ti/OQFT81tU4E4B0NIfjGD/TGGWCFhL/r+C8e5OIrzNUGOERFq06gdCtQkY3Xo1AFtd9LdGEZNIgEwb8lsX/KpZ0OTbZ0jjqLSRjzGLgIG5jj52XYaLxe3Kp7UaNXHkHOHzff7x7REL5yF4E+pZmG1EvMyOVIx8GBkCtzKpNudhw7WDb+Rt2nmsHAlZaWVc93bkEJPqsAb3z4rDiD4KIdiRKlVYpwQikW3/AZ9HSLWniBVyI9CFPbvkfZaf9YaG9fTzVqxyxhnja/kqRvZoz8XuL8V6DogOqapzYtKoxVZ2NOyTseIp836kWGpkjnrMPW5ruOLTUzJp4pB3eHd3HmNHzYbNnc8zRlof1MV9y12+/7MA2Bv4RVGY4+tV9rkPWCM8yScjZlB35hWNYDUNpsote8SvVS+MS94HIv2a2JxvawMPnlI0LzSK41Dsq+nmaQyng49ubmoKvKlJSY0DsbXHtcuORAQcxbWQgtnDIn4EpNyXLHM/G3Nxr5xUFQ3e1q/M0tAhAe5LrgTls9Vmcsslo9rvFEXoAxw9EH1ZzkeS897X0XR82wJP6hpU/q8C/RhSLObiBvQKKhvEVLAJ8P/uaWOOPUTUjVeM6GDbIUgrFgMVcZYpNQeVln/yf0p2eqLMBC3mTAJ0nyCy2ZHzjKJ9x0pDQ5cY=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Ny83MXhBcmZaNysvZElmK25VczZGSWMvOHhWc2FxbVR1NFNxZ2RuRTMwTURn?=
 =?utf-8?B?NFJKWmg0N2k5a2RKc0NOay84alUrKzg5ZlBjR0cwSjJNdVJWUVZhOURDcVJO?=
 =?utf-8?B?NTltWFkveEpwaldrTzY3VDFnb1NJMExNY1EyNG5FVE1kZEV5VytGNTVnT2Q2?=
 =?utf-8?B?RlRvNWFCRVd2UzR0S0ZoZzlrL1pPWnlURjYxdkVUOWM3NlhOelFENjJNclBh?=
 =?utf-8?B?czJIVkhOZzI4dFFwa0pWN1Z3UmZwUkNyVURIaVluUlh6M2dnUFF0SnJkV1hM?=
 =?utf-8?B?bmdVSEpJZk9BMjA2QW9ua3RnQXgrNG9BVjRxS3AxbUtRQnZsbXNZVVZvYWdG?=
 =?utf-8?B?Y3ROaVg5QUgyOVVwcG5OQVk1cHZ1aWZrdkd5c0ZOU293bUpDUlFmbml6RkhG?=
 =?utf-8?B?LzJmNFdHSklIdnFFVFBlREpyM24rYVEwL1c4NzRIbCtNbEJLUmE2L1M2QlFN?=
 =?utf-8?B?bC8xZThqK3ZEaGtyN0NLYXRybDJBYzJEV0pZS2VRTHc3RnRObmtxVEd3MWxX?=
 =?utf-8?B?Qi9JdkVyaHJYT0wxMDN1Wk1lUFJmWUVlV0JBTkdUVzlyYjF5dzVhQnMrQVAr?=
 =?utf-8?B?NGp4T29PWDBtVWZKb3ZJaUNOR21SV1NkdG9LRmcrb09MbUNjZm9Yb01NWVFu?=
 =?utf-8?B?eER1MGpBbEQ4czlTQlkrUzY1NkFnRWNQdmtNVmoza2ZCckFZYjlueERvWTFp?=
 =?utf-8?B?R0RqemJjdWxaU084Y0hzQnBYNGQ4UkNnQkc5K08vTllJR3l1ZFNaZnVVZXd6?=
 =?utf-8?B?VVM0N1hqMFlPbWVZNW5oZzZyUXdiYURBY1pZazdxVDFaU0gxNENDcUVFMjVC?=
 =?utf-8?B?WEdYbHNmQUlrUERmOTR2RVZBQWdPSGJ0dTZTajcxK3lsbGVFVFV2czhXVk5B?=
 =?utf-8?B?czR1OVlQTVhJUEtndmNRMjhRWnBZSitqcFRCNy9WNng3a01HRlJmeGF0STc5?=
 =?utf-8?B?NHFlS0pFQUpndG0rM3pabzlJNzZVWnBzaVNoZUdLZkp3RElrR0ZiMEVuTXJa?=
 =?utf-8?B?ZVpwQ3RTMldEQWRZWW9SRlhDd0FVbmNySEZSbGhTd0JVQkRocS94VGJMaDVY?=
 =?utf-8?B?SVpKVVphMjdHNjdmT1pILzUrc3JreEN6eTVTa1pSNjVGbEFpTzZDWERNejR6?=
 =?utf-8?B?VjNnK0RtRVZMRjJvNkxUNUdpZmhCdWFDdnhpeXA3Q1cyOHExMmtBUjJPdE9F?=
 =?utf-8?B?Z3VlOFlKVzA4QVRsNUdOZzJDZHI4ZThRUVVPTHVsMHY0aG1ScHZMaDE1UjJJ?=
 =?utf-8?B?WlRaNzErMk9xRW1CYmgxTEF3cTdwZlY3Rmk3ZUxYSlJYRFRHTko1MVI1U0Ey?=
 =?utf-8?B?YUdMT2thaVJwa042NEpyV01maW1hWFRTNndTWDFoTjIxaVF3VzJUVGhGNStV?=
 =?utf-8?B?U2gvWmhEVzdrUk8yZElac1o3Y2tiazNQTWlmRlJscW5LbE5ONTVqMUN6V2dz?=
 =?utf-8?B?RE5xcWtDTWtJMVozTnpwSno0M2Y3L1R5Sy95TG1hN25RRjYxVi95c1JXTCtJ?=
 =?utf-8?B?NWZTVXNmQWFxMUpZNGNsT2pQS0duSUYyRlVKVGdLUFFVSHlISWF6dGhlSVZC?=
 =?utf-8?B?YWtJa25JcktNbzhHYkh1Z3ByN0syQVg1K2ZXTEZTZEM0ekJVVm9mZ3QyaEZW?=
 =?utf-8?B?bm5HanN4M1N6NFlNd2pPL01VZ3RrWUwydENyZzFYcGx3U2ZiN0ZuM2tqUW5H?=
 =?utf-8?B?eVYyRyt6NFJZRTBKcGZIczg0TkxHVFJ3U1hvYWthNG5rVjFMRlZidXVRQThp?=
 =?utf-8?B?eEdqdGtuMTU2L2tBR29nUjY5eDV3RjkxMlJoaTV4eXhELzZ2c2I1Q3JzNlh5?=
 =?utf-8?B?QmEwYk9KU2JHZ1Y5TEpvd0RKTkJRVDNFZHZOa0tyZ2VUMXlsdzVMcmJpUVEv?=
 =?utf-8?B?YnlaaVQ4QUpKOS92dWp3bTkxNjFGN3ZBWlY2bkpiai9YcUVQMGtVWVlCamVC?=
 =?utf-8?B?cUt2WVM4aUFDUXQwa2xLSVdiallJK3RxdUZ2dlppQlU4UEZORU9TRXlROU4y?=
 =?utf-8?B?Njd4cE9YR1ViWW9lNVNPMVdEajJIZ1dEcU1NblozWG03d09Oa1dtRERvNmtK?=
 =?utf-8?B?VjFQMTVPakRBd2Z2THo2VXFuczdMMUN4UG94dmNhVUdCNGpCc2ZTMm5KQ2gy?=
 =?utf-8?Q?5P9YVGFQKuTq/tPXNNwDuemAP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7AF28CAB10A12B4DB6A0E4DBA0BE7D18@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b47e3d6-d77d-471e-dccb-08dc3c76bab2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2024 18:13:01.5497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qzvri0MEV4dPRCdClGttLeaueVeDL/jESUB4gPIy98cuig5mg6iPEFaHA8AeN4Qze0jfzqUXqOj2GgbeZzdXgGCSFpXwJ6x7cx9JNWjpWMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2444
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>, Helge Deller <deller@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA0LzAzLzIwMjQgw6AgMTE6MzIsIFRob21hcyBaaW1tZXJtYW5uIGEgw6ljcml0wqA6
DQo+IEhpDQo+IA0KPiBBbSAwNC4wMy4yNCB1bSAxMDo1NSBzY2hyaWViIEphbmkgTmlrdWxhOg0K
Pj4gUmVtb3ZhbCBvZiB0aGUgYmFja2xpZ2h0IGluY2x1ZGUgZnJvbSBmYi5oIHVuY292ZXJlZCBh
biBpbXBsaWNpdA0KPj4gZGVwZW5kZW5jeSBpbiBwb3dlcnBjIGFzbS9iYWNrbGlnaHQuaC4gQWRk
IHRoZSBleHBsaWNpdCBpbmNsdWRlLg0KPj4NCj4+IFJlcG9ydGVkLWJ5OiBOYXJlc2ggS2FtYm9q
dSA8bmFyZXNoLmthbWJvanVAbGluYXJvLm9yZz4NCj4+IENsb3NlczogDQo+PiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yL0NBK0c5ZllzQWs1VGJxcXhGQzJXNG9ITEdBMENiVEhNeGJlcThRYXlG
WFRVNzVZaXVlQUBtYWlsLmdtYWlsLmNvbQ0KPj4gRml4ZXM6IDExYjRlZWRmYzg3ZCAoImZiZGV2
OiBEbyBub3QgaW5jbHVkZSA8bGludXgvYmFja2xpZ2h0Lmg+IGluIA0KPj4gaGVhZGVyIikNCj4+
IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IENjOiBIZWxn
ZSBEZWxsZXIgPGRlbGxlckBnbXguZGU+DQo+PiBDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwu
b3JnDQo+PiBTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29t
Pg0KPj4NCj4+IC0tLQ0KPj4NCj4+IE5vdCBldmVuIGNvbXBpbGUgdGVzdGVkIQ0KPiANCj4gVGhh
dCdzIG9uZSBvZiB0aGUgY2FzZXMgdGhhdCdzIGhhcmQgdG8gY2F0Y2ggdW5sZXNzIHlvdSBnZXQg
dGhlIGNvbmZpZyANCj4gcmlnaHQuDQo+IA0KPj4gLS0tDQo+PiDCoCBhcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vYmFja2xpZ2h0LmggfCAxICsNCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYmFj
a2xpZ2h0LmggDQo+PiBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9iYWNrbGlnaHQuaA0KPj4g
aW5kZXggMWI1ZWFiNjJlZDA0Li4yNzVkNWJiOWFhMDQgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vYmFja2xpZ2h0LmgNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9iYWNrbGlnaHQuaA0KPj4gQEAgLTEwLDYgKzEwLDcgQEANCj4+IMKgICNkZWZpbmUg
X19BU01fUE9XRVJQQ19CQUNLTElHSFRfSA0KPj4gwqAgI2lmZGVmIF9fS0VSTkVMX18NCj4+ICsj
aW5jbHVkZSA8bGludXgvYmFja2xpZ2h0Lmg+DQo+IA0KPiBUaGFua3MsIGJ1dCBJIHRoaW5rIHRo
aXMgc2hvdWxkIGdvIGRpcmVjdGx5IGludG8gY2hpcHNmYi5jLiBJIHdvdWxkIGhhdmUgDQo+IHBy
b3ZpZGVkIGEgcGF0Y2ggYWxyZWFkeSwgaWYgb3VyIG1haWwgc2VydmVyIGRpZG4ndCBoYXZlIGlz
c3VlcyB0aGlzIA0KPiBtb3JuaW5nLiBMZXQgbWUgdHJ5IGFnYWluLg0KDQphc20vYmFja2xpZ2h0
LmggbmVlZHMgaXQgZm9yIHN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlDQoNCkF0IGxlYXN0IGlmIHlv
dSBkb24ndCB3YW50IHRvIGluY2x1ZGUgbGludXgvYmFja2xpZ2h0LmggaW4gDQphc20vYmFja2xp
Z2h0LmgsIHRoZW4geW91IG5lZWQgYSBmb3J3YXJkIGRlY2xhcmF0aW9uIG9mIHN0cnVjdCANCmJh
Y2tsaWdodF9kZXZpY2U7DQoNCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBUaG9tYXMNCj4gDQo+PiDC
oCAjaW5jbHVkZSA8bGludXgvZmIuaD4NCj4+IMKgICNpbmNsdWRlIDxsaW51eC9tdXRleC5oPg0K
PiANCg==
