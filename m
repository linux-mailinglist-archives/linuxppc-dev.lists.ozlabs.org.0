Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0A45BC2B3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 08:10:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWDmq30SVz3bhK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 16:10:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=m7nVWgag;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.57; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=m7nVWgag;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120057.outbound.protection.outlook.com [40.107.12.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWDm26mSpz300V
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 16:09:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIqPrp1403lQ7X4o6jL1UBnlXMuq5WCoee3gFqbTAtR7CAuyZ5chU4/BoXYxxGznEfHNFc0NK9bC9vuct9SgkkQzTH5SHPxOEzPgPN2prOHZluMA78+BOgoyaytEvvdxH0Yv3Rl4kDxDPRBp7HAYyq1h2w/difpfN8pjx59eUXtQTMLa6e3RGOug6EPxXxeeZKYsYhkLYRoTXg+m/eb9m7ekDWwGDmxsubYaJWFDHHSuJFOOyveTR4VMprmhroKFjYbqf6hFt6ruEVRH0fQJAJvOxFFMuNRytWWJEDFzVEtKMw3rnNFl88G3xPBbusqGBhHfLVV3R2FUJRh+XbpVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scy3F7I2aRz5Pfd5xP1yb7m0nmJzDG8+/KrHwrFSi3A=;
 b=Uq/rB7xbSvRFTQPbVq4mC6m51P+hrkr1zqHQMpUgCzE2jTWvk44ZQRaKR2UwBfUfSx0WYNuh1DewxfBxsV4xuyVpJCBjXYeTNIMiMNx8FCUxhAJG/bZiqTr+cttCrOhq05HtSK8wq5Eo3eAeyjsXc6bI2xaNmqOu5hzPZkp/CoaeW6ivPRvTOhrbbJTPrAvfp2g82dY4wWETkOSP1gltE6v7UPXF49uThsd9hIQ3uRrasyqBYQmD2CiYMc/UNKjJGCt2w4vckUIIKKW9HYtq2uXr0KpGi4O+84fFudnw+isdI6V2papCdWliwWPxjAKqkAyY2VTTSYn/aQciKw5Uxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scy3F7I2aRz5Pfd5xP1yb7m0nmJzDG8+/KrHwrFSi3A=;
 b=m7nVWgagxBEg+clRLMkhQLfiSnOSB0SCiMEFsQ0l72rJpubd+X8xNE8jACFRpI4+dj8ReJhaCWXtJEkxW8pZpJ7hiuH0zXNzHZR5Tf5EXKbn6Q1gD+IbC41yeHnGHldl1wjk4O656MOpuQBLovjuy0CFoCnkM5h7mk5TEfF706QdRHTdx7OqV8Y3Npv/CUDlo93/Y2ncIhQFiKf4t9uFtouiNVecek6mN8JQtGo5W79yYU/CysaRf10hGDCnO8OIUwqeX+Bn2f7WjWzNaxs6c4gezMaNwQZiT+4UD3eyHGhJ1368LKpsNxsR++xsCu2hFctGgRuqWNjMBGjqY0LMpg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2313.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:6::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.16; Mon, 19 Sep 2022 06:09:19 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%4]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 06:09:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 2/6] powerpc/module: Handle caller-saved TOC in module
 linker
Thread-Topic: [PATCH 2/6] powerpc/module: Handle caller-saved TOC in module
 linker
Thread-Index: AQHYyZT2mo7mt16PhUSRDUSytUbUFK3mSYuA
Date: Mon, 19 Sep 2022 06:09:18 +0000
Message-ID: <afad1073-d870-cd7d-040a-77ab10b3bb78@csgroup.eu>
References: <20220916062330.430468-1-bgray@linux.ibm.com>
 <20220916062330.430468-3-bgray@linux.ibm.com>
In-Reply-To: <20220916062330.430468-3-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2313:EE_
x-ms-office365-filtering-correlation-id: 443edc5f-941f-4c15-ee80-08da9a057d15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  fYlhf8p5iLj2Pj14Bd+oVYgQqLqcjd43oZ1is+t901qJmN+nKK3R7iqj4XUhDh9bbtSNmI33KK40cajGxZ4/YyoXMvMa+GoFSJOWgyXLT/Beyypn8/07OOzBaAlF31DYVOlHeeJ5CFTX27T/pMqMuho2nBdKPQuLSHiDVzj/trAKzERh0xfKuZ5zOIqYWzjPCqCHNVjO1JMkkidjAWILiLQf4Os8jV7Kis/dtOAU3A06XQfNIKXfxYUZ4tpEgSWU5hd1/2BZrek0rzkKF+Om9Qxm3Tvz7XsRSPLTvkmR6YFhJdMJQnCTR3zoh6HzG3hH23DTKSJUrhOZWHWMsuDCK0c5sXiLVKZnlLj88vNFJazzdwvBEMkwzAISSdVKGsbzMGbDKyq34IMcmNb9XeMdVh02SFXLwhtd/sWx2vckn/7nLpgQZgt0toeZ5vcTuNfFtfEgh8a56y0CQ2bmKbgP1KltZQNT697rKdAJnzu9nz/HS0tXq0XVCWtJsl3PXyhYGTH8z/ckU5CUjQLTWePUY1Jfl5Qt454X0u52icGMikroTtV0fYofSoDraY1SnjOMkBGxFiZtBeaxsofgvMbZ4GRTz+Gjg6GEeZ8Ek2V5LsXvBPwoBcs4hd1KDrvju+8rfFIwAq0JnEbB86/UfJvIvf8w+0IgXR/SkJAEEZKMrXIeMygAzY5wb3BteiPr8Q+UjiLvZoj8pOPmNA3MkRVnfvzJajoF+/T4Td8cwV3YbKSaU2ElxoTznTbEpRV1AieLIIDv9XGOAEu0T3MgvQpdxSZ7eesx7G196IjlnOaVgKH09sYBHFYoGAnw7XFyLy617yUclNj/9vBPrP2V5ydUjcAyYPZV47vTVnSi6CTVr+g=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(136003)(396003)(346002)(366004)(451199015)(66946007)(66556008)(8676002)(4326008)(66476007)(5660300002)(66446008)(64756008)(76116006)(7416002)(110136005)(8936002)(31696002)(91956017)(54906003)(86362001)(316002)(122000001)(66574015)(38100700002)(83380400001)(41300700001)(6486002)(966005)(71200400001)(6506007)(478600001)(2616005)(186003)(6512007)(26005)(38070700005)(31686004)(44832011)(36756003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TTJLK1ZTcWVSVWV0NTFyRkFmR3dWTFBHcFl4cGVOVUM3aGRLTlRWR0ZkUHIw?=
 =?utf-8?B?QmtPWXNUY0o0UlN6MjBlM2FQRVpYalRZNGcxU1BaeWZSZ2FocGpqVG1qZHJB?=
 =?utf-8?B?L2p2VmZaM0I1R09EbnprR09ERTRhTVhPL2tvWGdpZFVXcjNVa3V5R25vNEtI?=
 =?utf-8?B?UXBiZVBHdk5PMU9wMjc0ajFENEpzYUNwMDVWb043R2Z4K2h5ZG5WTUZPNjdT?=
 =?utf-8?B?cWpsWE9vbUdEYkNsMUFDdVlCSTc2cUZ3aVJ1U3JWa0VqdFMwQ00xSXNYemxF?=
 =?utf-8?B?ZG1GNnpGN3ovK2lhN1BPN0hsSExOcHp1WEJzTFZpS291NW1kR3l6UWR2OGhz?=
 =?utf-8?B?N1B2WXI3bkMrd2dlc0FLZ3lET09DRTRHS1hsM09wZzU0L3lEbHltZzVJdi9F?=
 =?utf-8?B?ZENVdWs4TzdBWHFrRVBHSks5Ly8zUGtCRlJuUmtDd3ZMY3hFdHhMM3h4WVhM?=
 =?utf-8?B?SitxMEtKODVHY240eVVydzRXWTljSjFBbTNzYUZ5RHBUdk9JNi8zcW9DVHps?=
 =?utf-8?B?YW1YMFpEVXRaK1cwQmJnT25HMVZKM0FoeWcxNS9kTHh5S3BQc2ZSRWV6M3JZ?=
 =?utf-8?B?T3BLSTBsc3hsMy9Nb2pteFhuNXhHakJnY3h5ZWVTWE96VlRGSDJqT2xDelcr?=
 =?utf-8?B?Q05vK1VnZ3VJQ1RNWm13dEZiRGFCZnU5KzVHRW1jVUlqSG9UOVVjWm1ZODJR?=
 =?utf-8?B?SmRDRXgzSFVQTnRUbDVQc2NUT0xqZVRYQVZiTlMwN3A2a1lDcUZVejlKa05v?=
 =?utf-8?B?eUxDUzdrQ0svTEVoMHNYSU9aeW1Fcm94cWNqRVhXRGpOd3RDbkYra2NNR1R4?=
 =?utf-8?B?d01VNTk3Z3pneXNMZERRR0tOdmdva0ZEblgzOFozT0NWSVIvcnNyVkVuWmNG?=
 =?utf-8?B?OXJEOXJPTTg3eUFxN0QzMktETEs2Sk1MTkZ5cnhyM2M4UmE1endWY3lGbEY1?=
 =?utf-8?B?YThDRjVHR1ZRemFNTzhNVUV5N215Ym10UzQ4SWw5WWhudENjOVc5WnMwQ2Zp?=
 =?utf-8?B?aFN6QWRCOE9vMlE1VXlYSHlydGlwaVkveUlHb3B2eHZkeURucTZRZkNkU1BE?=
 =?utf-8?B?aUY3dmtkL0xvbUt1cCtMSy81ZHF3UFd1WE1wTVltVWRwY1Y5TlVsUVpNSHVF?=
 =?utf-8?B?QUNNSlA3M3JhSktwRVR2c2laejA3K3ErRWxta2YxRDRRUnZDaUhyTkxsbDJD?=
 =?utf-8?B?VzQvWDBZdGlqNUhEeDV1U3RBTTNja3JON0l0bmFyMUlDUi95NFBDVU1qMGxV?=
 =?utf-8?B?NjZyak4vdFJtN0JXbGhaYUc2QVJ3aTlLeUpaeUc5ZWtmUnZrT1ljOUVDdlR3?=
 =?utf-8?B?MVlFdFE2cVY2eEZUcXplU0xCbWlMMXN4UE84SWVmV1JLYXFyNzYzc0JZNVo3?=
 =?utf-8?B?VEVRUWNqWVFOV1R4SVRLeHpaNmhjZWJpeUREejlHdEZJRlJDdkRhUFR2b0lo?=
 =?utf-8?B?WXNOK0ZJZTFHS2RUTzFwZ1BzT2pTSXp0N1VTS0JDRXowRG9zQjNseitzalhV?=
 =?utf-8?B?dWtQNVVheTVPbkxsNS93N1hGRzRTVWxuSFgzTS9Eb0lxY3haWlRXQXcvM1Bz?=
 =?utf-8?B?YnViZFMrZ3YxY1A0SW0wTGZzQ0tXUk9mNGNMbkd0WU9SWUhhL0t0VkF4dnlv?=
 =?utf-8?B?cFVBTFNYbHdsOVgyN0NuZ2FIS2RPZzR2SjV5dzN4ZmFFN1Q2Z1NZVEloNU9x?=
 =?utf-8?B?d1dqY2ZQbG9HOWZLVXBaRytCSmhuSjJzUVZOU1ZCR3drRjF0bHFnTzVaVTl5?=
 =?utf-8?B?TmpOUWlsOHFWLy9tbkRTbnVwbU1mNis5QnNSM0hyRFFlSVp3ODVIVkFZdURp?=
 =?utf-8?B?YU1LdXd1eStLTjFXU2RXbG1ra1VqdTFFeUFCOUs3VmFuaUFJNWl4Z1h2MEVo?=
 =?utf-8?B?UGFLTVlDTXFOK0tZMDBaMVRtSlN6aXJnK0J3ek4wTU5TWXVqRkVmajNNSWR0?=
 =?utf-8?B?d1pkT0lGNm9zUG9tekMwTmZxcEw3Y2NKT3V2RTRCNUlBOU1Yck1IeHZiN2hB?=
 =?utf-8?B?Vmd0OHU2NkIvcE5uWHl6ak9XMDBEZXFhRUpQYy9JTzliMEtYRm5CY3FZMHBu?=
 =?utf-8?B?OHVrSE5XdHhidkorZ2twYTYrdjdZcVRFZWdzRGVzdDM5NjlCb0VTSzRHdmQ0?=
 =?utf-8?B?U3Zta3RGQ3ZFTlY0dGRTTldQWHNQQTVDcE5oMHJrRnhQVFB0ZkdobzlVZUoz?=
 =?utf-8?Q?DNdDcnnBcUgzDqF698aiRn0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EF020CEDF346D4C996465C98A8D7673@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 443edc5f-941f-4c15-ee80-08da9a057d15
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 06:09:19.0293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gy6XfHL1Sri7BDzQ4NmmMqEqttrERWybvVJmClNq8OW2npSWnvChgpFhSdWfAzz9H1gzuBGqfwvoIF0hnpoXEkC5mwXGPhO3YYqvYEsrVnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2313
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE2LzA5LzIwMjIgw6AgMDg6MjMsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
VGhlIGNhbGxlZSBtYXkgc2V0IGEgZmllbGQgaW4gYHN0X290aGVyYCB0byAxIHRvIGluZGljYXRl
IHIyIHNob3VsZCBiZQ0KPiB0cmVhdGVkIGFzIGNhbGxlci1zYXZlZC4gVGhpcyBtZWFucyBhIHRy
YW1wb2xpbmUgbXVzdCBiZSB1c2VkIHRvIHNhdmUNCj4gdGhlIGN1cnJlbnQgVE9DIGJlZm9yZSBj
YWxsaW5nIGl0IGFuZCByZXN0b3JlIGl0IGFmdGVyd2FyZHMsIG11Y2ggbGlrZQ0KPiBleHRlcm5h
bCBjYWxscy4NCj4gDQo+IFRoaXMgaXMgbmVjZXNzYXJ5IGZvciBzdXBwb3J0aW5nIFYyIEFCSSBz
dGF0aWMgY2FsbHMgdGhhdCBkbyBub3QNCj4gcHJlc2VydmUgdGhlIFRPQy4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEJlbmphbWluIEdyYXkgPGJncmF5QGxpbnV4LmlibS5jb20+DQo+IC0tLQ0KPiAg
IGFyY2gvcG93ZXJwYy9rZXJuZWwvbW9kdWxlXzY0LmMgfCAxMiArKysrKysrKysrKy0NCj4gICAx
IGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvbW9kdWxlXzY0LmMgYi9hcmNoL3Bvd2VycGMv
a2VybmVsL21vZHVsZV82NC5jDQo+IGluZGV4IDdlNDVkYzk4ZGY4YS4uMzY1NjQ3NjA5N2MyIDEw
MDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL21vZHVsZV82NC5jDQo+ICsrKyBiL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwvbW9kdWxlXzY0LmMNCj4gQEAgLTU1LDYgKzU1LDExIEBAIHN0YXRp
YyB1bnNpZ25lZCBpbnQgbG9jYWxfZW50cnlfb2Zmc2V0KGNvbnN0IEVsZjY0X1N5bSAqc3ltKQ0K
PiAgIAkgKiBvZiBmdW5jdGlvbiBhbmQgdHJ5IHRvIGRlcml2ZSByMiBmcm9tIGl0KS4gKi8NCj4g
ICAJcmV0dXJuIFBQQzY0X0xPQ0FMX0VOVFJZX09GRlNFVChzeW0tPnN0X290aGVyKTsNCj4gICB9
DQo+ICsNCj4gK3N0YXRpYyBib29sIG5lZWRfcjJzYXZlX3N0dWIodW5zaWduZWQgY2hhciBzdF9v
dGhlcikgew0KDQpQbGVhc2UgcmVhZCANCmh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL3Byb2Nlc3Mv
Y29kaW5nLXN0eWxlLmh0bWwjcGxhY2luZy1icmFjZXMtYW5kLXNwYWNlcw0KDQoiIC4uLiBmdW5j
dGlvbnM6IHRoZXkgaGF2ZSB0aGUgb3BlbmluZyBicmFjZSBhdCB0aGUgYmVnaW5uaW5nIG9mIHRo
ZSANCm5leHQgbGluZSAuLi4iDQoNCj4gKwlyZXR1cm4gKChzdF9vdGhlciAmIFNUT19QUEM2NF9M
T0NBTF9NQVNLKSA+PiBTVE9fUFBDNjRfTE9DQUxfQklUKSA9PSAxOw0KPiArfQ0KPiArDQo+ICAg
I2Vsc2UNCj4gICANCj4gICBzdGF0aWMgZnVuY19kZXNjX3QgZnVuY19kZXNjKHVuc2lnbmVkIGxv
bmcgYWRkcikNCj4gQEAgLTY2LDYgKzcxLDEwIEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbG9jYWxf
ZW50cnlfb2Zmc2V0KGNvbnN0IEVsZjY0X1N5bSAqc3ltKQ0KPiAgIAlyZXR1cm4gMDsNCj4gICB9
DQo+ICAgDQo+ICtzdGF0aWMgYm9vbCBuZWVkX3Iyc2F2ZV9zdHViKHVuc2lnbmVkIGNoYXIgc3Rf
b3RoZXIpIHsNCj4gKwlyZXR1cm4gZmFsc2U7DQo+ICt9DQo+ICsNCj4gICB2b2lkICpkZXJlZmVy
ZW5jZV9tb2R1bGVfZnVuY3Rpb25fZGVzY3JpcHRvcihzdHJ1Y3QgbW9kdWxlICptb2QsIHZvaWQg
KnB0cikNCj4gICB7DQo+ICAgCWlmIChwdHIgPCAodm9pZCAqKW1vZC0+YXJjaC5zdGFydF9vcGQg
fHwNCj4gQEAgLTYzMiw3ICs2NDEsOCBAQCBpbnQgYXBwbHlfcmVsb2NhdGVfYWRkKEVsZjY0X1No
ZHIgKnNlY2hkcnMsDQo+ICAgCQljYXNlIFJfUFBDX1JFTDI0Og0KPiAgIAkJCS8qIEZJWE1FOiBI
YW5kbGUgd2VhayBzeW1ib2xzIGhlcmUgLS1SUiAqLw0KPiAgIAkJCWlmIChzeW0tPnN0X3NobmR4
ID09IFNITl9VTkRFRiB8fA0KPiAtCQkJICAgIHN5bS0+c3Rfc2huZHggPT0gU0hOX0xJVkVQQVRD
SCkgew0KPiArCQkJICAgIHN5bS0+c3Rfc2huZHggPT0gU0hOX0xJVkVQQVRDSCB8fA0KPiArCQkJ
ICAgIG5lZWRfcjJzYXZlX3N0dWIoc3ltLT5zdF9vdGhlcikpIHsNCj4gICAJCQkJLyogRXh0ZXJu
YWw6IGdvIHZpYSBzdHViICovDQo+ICAgCQkJCXZhbHVlID0gc3R1Yl9mb3JfYWRkcihzZWNoZHJz
LCB2YWx1ZSwgbWUsDQo+ICAgCQkJCQkJc3RydGFiICsgc3ltLT5zdF9uYW1lKTs=
