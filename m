Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 231FC7B314C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 13:25:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=G5sQVv5D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rxp186z4zz3cMW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 21:25:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=G5sQVv5D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61b; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rxp0G0nq7z3c1H
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 21:24:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nd95XyPKqMpkaNh+Pv2jGqmXlruoGDHzkFpj+ZDigFz5fHUTikbJP5hHsXJ+H/h0ZS9DxCL8x7ALLstB4jFDjRPiUM11S11qyXhyVMuJf965QQGmqbPDdiay5DsnBeJhO6MJiZqWZLuyC9NELCNbttII5yxMp7aTP2rjEwwQd1JU9IaFwlBCkZSw/L5UxReppd3aeAJOOWx0d97oVRyjtaW/Ld8lb878wyVa+1ZoBZnLYa2MusDQe8RpRBP3SW4AJ/AW30ej5CLCztSpOaQNI0ca2A9LTv79uNgblTz1bw+PVy1wzhMXDGowzIKUuTQC9uuUnuwQWzhAk8LQjIjZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/z2rCrqQMYzQh9okOEmnVvarqCp6Yx9ylQb39908zwM=;
 b=DDMH1+uGPlzTiSk+eZ6TV82ylQCUvO+Z+5tyN0fucznS1Oa36gPEVQ98bCF/qp7riH9V0qPUqk75kSnSYhczg39d4QA4uLgO/lXvInC7CGDUcjlAW7xbKcRdndGSEO2IlIcfSxcX3zOEzdZ5Te91j7g3b/YiHXbO2fn5JuTXgvrTCrV9KIfr1QBG6ckWOfVpKK0yxh2zK91H5t+HMwK341qT4w6TuQRjiuXvLuZFXafkSKNtVzo62kFsjTnXWNcKIkAoJe46C/X6ZiBoE9VEQrpui1Im8xp4G49smnhL0t8tFm0g2oLCpfQOmcgwENX6sGCo9uaCPGjV/vSmzdCeDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/z2rCrqQMYzQh9okOEmnVvarqCp6Yx9ylQb39908zwM=;
 b=G5sQVv5DrgzpsA++WEpWa4UFLNOZhAbTjY7W5KbZxAFmijspkL5tWtZyjhd/3bwtZL2sjg3or8k+lPN2rYamMt8vK7Rm9PcMEYET0kyOVAD+aH0vt+vHpT/Ac7u/zSINC91NV65s8tvjSgCYpvC/B5JiaYWdnuPTEITQ4lQdE7wOfKNSeIFGmV1Dbe5QTGLHVa4UxIXkLpMRq0WRu3AftrGgFiwyi24foui9ASb7R7Qjzz49bFJFz+zGChncM85Jw2KdqlWfcOj4vGeDdcuVI3e0u3tCvwFWM/BazbvGTuTEWDALpdj15YudpCnxL2iX237JStbb6k8LR9/EcZArqg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3170.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 11:24:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::27df:697c:bd7d:774f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::27df:697c:bd7d:774f%6]) with mapi id 15.20.6838.024; Fri, 29 Sep 2023
 11:24:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Dan Whitehouse <drw@dim-sum.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: Kernel Panic 6.5.0-1 PPC
Thread-Topic: Kernel Panic 6.5.0-1 PPC
Thread-Index: AQHZ8mxuvcSx4z2as0mUTuzFVvr/YrAxqg4A
Date: Fri, 29 Sep 2023 11:24:06 +0000
Message-ID: <2d5d9c82-427e-9384-3ffe-fddf6e1d4d8a@csgroup.eu>
References: <ZRV3Y3g2fTvE91Zs@dim-sum.org>
In-Reply-To: <ZRV3Y3g2fTvE91Zs@dim-sum.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3170:EE_
x-ms-office365-filtering-correlation-id: cfc0e078-670c-4d37-3cf7-08dbc0de97a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  +LE88yySNOL3BZhWFx4sXLXsW8fqybyMqp4NHumEct2NkDRHB0v6AEOltyIxoM8AKW2oqRFcDTpWFmsCD5ToNTCjLWvqSmYhgHbinhtthKto91wQYZjyAIsM4H0O2QU9SGah4VjhnLdsnUWZgqXvwzMOWDOMUgJj8oPcOUYgofgaJVtfPEWdCnuugQrAEvkKm+akzirolWGZ78uTy6QImxu/DyMgfFeOO58cB6QVNhsxgF7vVyEywDMBOZRCzaj7gZPfs/TK2TQPhRXSjktlZXs11dnRjuJqi6gihEKApdrPJnudz1zRTUI7Q0K/+kjsOF97uON+7HuEeFkjTDXjoJ3Xyp023dVy/47KOFo0BUKPZ+foxXt+HGFK6X69FY/sKsP6PjQC9q422kLjtk71R17NNHKM/kxbyGYbBLSjgODbNh1OAXZmRPoV84NNPZdkIyjNs5vI3NBWaMbis5bnYEQPjiLdYy1G33DF0isc4kMtwnp0i34x3lB6EvMfemTicKsK1TqCM/PjCXcMqeSfA+9z8bg1WzqRWnmDGIE1ESQNTtpeDoGIVsOV6qLCGpUr1LycPuFIV4JUd3puoB9GzuUm4+tdFRjkmTqtD8B3JuXU11uVJwSMs/WZ2T8rLK5SRqI8O6yR/XDf78MwrViOGdwekYIOq0HtwBXVfXEHcXs=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39850400004)(366004)(396003)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(83380400001)(26005)(66574015)(86362001)(31696002)(36756003)(122000001)(110136005)(38070700005)(38100700002)(76116006)(64756008)(91956017)(66476007)(66446008)(66556008)(66946007)(41300700001)(5660300002)(8676002)(316002)(6486002)(8936002)(966005)(31686004)(44832011)(2906002)(2616005)(478600001)(6506007)(6512007)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NmdIYVNjZ3Q2ODQzeWlrN0NyQWEvM2tTejF1TSt2SytWNnJYVVZNemdXa3hQ?=
 =?utf-8?B?enVEeEpLU1VrSy9qcWl2R1o5WFVoRVl3T1hVY2F5T2dPWlBUUGtaYktOcDN6?=
 =?utf-8?B?amRHRFRSOFJQVkdZd2poUjFuWmU0OFA5cGpSdzR4bldQZnd0bS9zZVhlOHRl?=
 =?utf-8?B?dlc4aU13b2dkazFtNldvNE5CWEoydkxxVjhrcWl2SkVMSHlLRkhoK3JmRnJm?=
 =?utf-8?B?SEZmUGlXb2hPN2pRZ3EwL0JscTFPYXZtT2oxWWdBTVFsejVMSGtweEV0d296?=
 =?utf-8?B?TmpnSjRJUEE2WnRWc1dxMTJGZ2NVM2x2bTNESWNIT1lMaWgvTzJBMDZKM1J0?=
 =?utf-8?B?KzAyRCtINVVMVUUyKzhXWHpTaU1ScGd6d3VOeEhmVHZsak9HbDl3VStNOUth?=
 =?utf-8?B?aTl5NnROTVhpWjQva09Wekt6MHQ4cWdSb3hWODRXWkZ6OWNCeFRvamVZQ0JP?=
 =?utf-8?B?dE5xWUVWbG82eURRZ1haYjdQd1F1ZnRKcmdFc3FUdXZ3Wmg2TndtMmJNZi8x?=
 =?utf-8?B?d0xuL1lzRmU5K08vWG5ubUdWajJaUFNwL3N5RUhnMWlCeWptN0lKbEhJQUxq?=
 =?utf-8?B?TENGcjNCSzNSeUN2QW5nWHJ1Nk1NdDRjZ2gwbGJOcXlZSCtPNVp6K1Z0SW8r?=
 =?utf-8?B?d3Z1M0orbVNhY2dBL0habnN0NzB5S2tIQjFOV3ZiTllLOVhpVFJlMTlMTW9Q?=
 =?utf-8?B?MHFUR04zbzlDV1RTdlR3TzJxSFJydUxrZndnamJDUFcvSVRpNlZpaXZIZVZN?=
 =?utf-8?B?YWpJMlArQldDNDQzdWZ6cEpPL1VneDFlQXRDTFFSQzc5ZUh5Qyt4TXVsMFNs?=
 =?utf-8?B?bEFIRFQxOFlFVVQrQlZrdGhyM2R5bkxKcCt5WVVTLzRyT2s3cWYzamc2cEYy?=
 =?utf-8?B?aU9oQm8vTldIYklxc1VaUVphRS82SjQrMmRGTmJFZ2k5RXBFd0s3SmdHYnN0?=
 =?utf-8?B?WXFXY2lZc3p5MGtwQm9QaTZSaFZVN3VnYVdMV0JsRTFDZGpnVUJpZ1pHZyts?=
 =?utf-8?B?cDI0N2pXUUFEM09aaldndEZwTmpMUWNnZUVUTlVJT0NPanNRR1dpQVJjZXpt?=
 =?utf-8?B?cStIbHg5bVlNdGowNkl2b2hCay9neDZzRk05dWxTa0tmSmRCdVBXRmFpaWox?=
 =?utf-8?B?QUpQc0Z2UnJkcnIwUjRqR2l1R1d5bmwveEgzTm9DbnFaY3o1aHFLU29lNmNn?=
 =?utf-8?B?aDd3dkF5elRmUUgxS01zYzFLc256eHlPcllUTi9LR1l4S0xqT0lkSGxSSC8y?=
 =?utf-8?B?U0s5N012ZS9IR2VCOHVPYXdHUlNndWtNSU1uQXM1L2NGZXhUM1ZYUGVlWUl4?=
 =?utf-8?B?eEFPV2FjMTM5VHJpUFdPUE1UMmVBeFhCbG1oMHUybkZUbC91Qy9vU2tXMkMr?=
 =?utf-8?B?ZldhbUdtY3RkMFFrVVJwZHc1SnJManU3TFdLRTh3dXd2cGhESTNkS3diMGM4?=
 =?utf-8?B?QUNNRExUbWlPZHhoSldlLzZCaUZ1dy9VODgwdnhSMWVmWGhubmY0K0oxRlRD?=
 =?utf-8?B?R1JweU9JbkZMOVE4TTYyR0dYM29mSUxKQkhIZ3d1c2tZUXhscW5aSi8rZmgv?=
 =?utf-8?B?SnZsT283UlhLdGR1UUlZQTVtbHhtcUJYek5JNyttWXBrTmxHa3U2RVZ5aEZs?=
 =?utf-8?B?UmowL3JkeUt1YVVEQ3hVZmFKY0FiSWNmcTlLNzhHejJodFBxU0tZZnRXRG9i?=
 =?utf-8?B?aDcvR2JUL3ZxbEdlVzNnMUNsa3VvUzV5bVE2N2tLTGc1Y01RTCtCWDV3QjRl?=
 =?utf-8?B?WlFVaks5Y1JIVHBCMXZOc3Y0MnNGc0oxUWo0dnVTWVUyUmVWZlQ5bERCUVI4?=
 =?utf-8?B?cFgzZjFZUVIyZW5PK0tJSHF4MFNjV3NORWMxMTd6eC9kNkxQTmRBQVlaWG94?=
 =?utf-8?B?aGtWeEZsZkkvSEU0S3pGZUsrSjkraTdnOE9HbnZLb1ROZXZrMTdqR0M4dUdI?=
 =?utf-8?B?NHhRSXVWa0dBWS9RRTN3alV0VTRFcWZheFJuYUNGbWNlbDI2Myt0UDBMTmM3?=
 =?utf-8?B?UVhOL3l2Vi9oMHc3K0ZoQlpOa0FVTzFQRklaaWErNTFnV2FiSzFudHN6Q3lU?=
 =?utf-8?B?b0t2d1N4RjdyM3dtWFFpa1dUdThLNU51QmlxMTQ1SFNyK0EzWkxLU29TTzBF?=
 =?utf-8?B?U2hxWkxuazVhVlk1bVNDYlQ2K3NLWXpaTHVyMnhzNW5oTUw1UU5UNzNta3cr?=
 =?utf-8?B?SkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E413F42325F13C4CAE2DBBC84E8AABE8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc0e078-670c-4d37-3cf7-08dbc0de97a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2023 11:24:06.1876
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y5e34gEUVDvE4xYQkfLjFCMXroPlw/aV1Tt2/I7GsAz835SjAg0JyU8hv0/VGbXnC6CqPXi3346Icfd+bTI4DOOalQvkNRsF+HqToKmtCPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3170
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

DQoNCkxlIDI4LzA5LzIwMjMgw6AgMTQ6NTMsIERhbiBXaGl0ZWhvdXNlIGEgw6ljcml0wqA6DQo+
IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIGRyd0BkaW0tc3Vt
Lm9yZy4gRD9jb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCA/IGh0dHBzOi8vYWth
Lm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0KPiBIaSwNCj4gSSdtIHJ1
bm5pbmcgRGViaWFuIG9uIGFuIG9sZCBQb3dlcm1hYyAoMzItYml0IFBQQyBHNCkuDQo+IEknbSBz
ZWVpbmcga2VybmVsIHBhbmljcyB3aXRoIDYuNS4wLTEuDQo+IEV2ZXJ5dGhpbmcgc2VlbXMgdG8g
YmUgZmluZSB3aXRoOg0KPiANCj4gTGludXggcG93ZXJtYWMtZzQgNi40LjAtNC1wb3dlcnBjICMx
IERlYmlhbiA2LjQuMTMtMSAoMjAyMy0wOC0zMSkgcHBjDQo+IEdOVS9MaW51eA0KDQpDYW4geW91
IHRyeSBwYXRjaCBhdCANCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51
eC1tbS9wYXRjaC8yMDIzMDkxNTE3NDQ0NC4yODM1MzA2LTEtTGlhbS5Ib3dsZXR0QG9yYWNsZS5j
b20vDQoNCklmIGl0IGRvZXNuJ3QgZml4IHlvdXIgcHJvYmxlbSwgcGxlYXNlIHByb3ZpZGUgdGhl
IGJlZ2luaW5nIG9mIHRoZSBPb3BzLg0KDQo+IA0KPiAgIDAuMDAwMDAwXSBNU1I6ICAgIDAwMDA5
MDMyIDxFRSxNRSxJUixEUixSST4gIENSOiAgNDgwMjQyNDIgIFhFUjogIDAwMDAwMDAwDQo+ICAg
ICAgMC4wMDAwMDBdDQo+ICAgICAgMC4wMDAwMDBdIEdQUjAwOiBjMGIyOTIzNCBjMTNmZGU2MCBj
MTJmMzU4MCBjMTJmMzU4MCBjMTJmMzU4MCBjMTNmZGU3NCAwMDAwDQo+IGNjMCAwMDAwMDAwMA0K
PiAgICAgIDAuMDAwMDAwXSBHUFIwODogMDAwMDAwMDAgMDAwMDkwMzIgMDAwMDAwMDAgMDAwMDAw
MDAgMjgwMjQyNDIgMDAwMDAwMDAgMDAwMA0KPiAwMDAgMDAwMDAwMDQNCj4gICAgICAwLjAwMDAw
MF0gR1BSMTY6IDAyZDE1OWY0IDAwMDAwMDAwIDAyZDE1MTVjIGMwMGY2ZDM4IDAwMDAwMDAwIDAw
MDAwMDA0IDAwMDANCj4gY2MwIDAwMDAwMDAwDQo+ICAgICAgMC4wMDAwMDBdIEdQUjI0OiBjMTJm
Mzk4YyBjMGIyOTcwNCAwMDAwMDAwMSAwMDAwMDAwMyBjMTJmMzU4MCBjMTMwNTA4MCBjMTJmDQo+
IDVjYyBjMTJmMzU4MA0KPiAgICAgIDAuMDAwMDAwXSBOSVAgW2MwYjI4ZTRjXSBfX3NjaGVkdWxl
KzB4MzY0LzB4OTIwDQo+ICAgICAgMC4wMDAwMDBdIExSIFtjMGIyOTIzNF0gX19zY2hlZHVsZSsw
eDc0Yy8weDkyMA0KPiAgICAgIDAuMDAwMDAwXSAtLS0gaW50ZXJydXB0OiA5MDANCj4gICAgICAw
LjAwMDAwMF0gW2MxM2ZkZWIwXSBbYzBiMjk3MDRdIF9fY29uZF9yZXNjaGVkKzB4NDAvMDYwDQo+
ICAgICAgMC4wMDAwMDBdIFtjMTNmZGVjMF0gW2MwYjJiNWYwXSBtdXRleF9sb2NrX2tpbGxhYmxl
KzB4MjQvMHg3NA0KPiAgICAgIDAuMDAwMDAwXSBbYzEzZmRlZTBdIFtjMDJjMzkzMF0gcGNwdV9h
bGxvYysweDU0Yy8weDc5OA0KPiAgICAgIDAuMDAwMDAwXSBbYzEzZmRmNTBdIFtjMDBmNmQzOF0g
YWxsb2NfZGVzYy5pcnNhLjArMHg2MC8weDE3NA0KPiAgICAgIDAuMDAwMDAwXSBbYzEzZmRmODBd
IFtjMTE5OWM1OF0gZWFybHlfaXJxX2luaXQrMHg3MC8weDljDQo+ICAgICAgMC4wMDAwMDBdIFtj
MTNmZGZhMF0gW2MxMTgzYWJjXSBzdGFydF9rZXJuZWwrMHg0ZTQvMHg2NDANCj4gICAgICAwLjAw
MDAwMF0gW2MxM2ZkZmYwXSBbMDAwMDM1NDBdIDB4MzU0MA0KPiAgICAgIDAuMDAwMDAwXSBDb2Rl
OiA3ZDJhMDFhNCA0YzAwMDEyYyA0YmZmZmYyOCA3YzA4MDJhNiA5MDAxMDAwNCA2MDAwMDAwMCA5
NDIxZg0KPiBlMCA3YzA4MDJhNiAzZDIwYzE0MSA5M2UxMDAxYyA5MDAxMDAyNCA4M2U5YzI5NCA8
OTQzZjFmZjA+IDdmZTFmYjc4IDQ4YjI0OTA5IDgwDQo+IDEwMDAwDQo+ICAgICAgMC4wMDAwMDBd
IC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQ0KPiAgICAgIDAuMDAwMDAwXQ0K
PiAgICAgIDAuMDAwMDAwXSBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogQXR0ZW1wdGVkIHRv
IGtpbGwgdGhlIGlkbGUgdGFzayENCj4gICAgICAwLjAwMDAwMF0gLS0tWyBlbmQgS2VybmVsIHBh
bmljIC0gbm90IHN5bmNpbmc6IEF0dGVtcHRlZCB0byBraWxsIHRoZSBpZGxlIHQNCj4gYXNrISBd
LS0tDQo+IA0KPiAtLQ0KPiBEYW4gV2hpdGVob3VzZQ0KPiANCj4gR1BHOiAzQUE0IDM2OUMgODZF
MSA0OTM5IEQ0MjAgIEFCMjUgRDBEQyA3QkREIENBOTIgQUQyRQ0KPiBUZWxlcGhvbmU6ICs0NCgw
KTIwMyAwOTU1MDg4DQo=
