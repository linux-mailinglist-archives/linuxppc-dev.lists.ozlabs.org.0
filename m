Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C27E4CA94B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 16:41:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7yyT1bsGz3c4J
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 02:41:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61e;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::61e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7yxz2ynlz30Hg
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 02:40:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khZMyRAAjpH4yzx9l4qkyWz3XgKQHS+xB/ZwPakuI2P9CZjXu9RHMCIPuQ5XlmfxH4A7rvOofe3AUQczBsj05963QfIA7IoGp80RlJzLqHtczrupu1o2v21CHyIEdgthAaGxNPBLfrL/cpY9lpfqCtHxaS+0Hk6egFRO8k8fALXG0qzqzNi2SnKHJWJBvaUwamrSd//UOAxjc5yrrzSEDxtTGw/zy4Ys4Bz/f//PUSh0kvR1QYcNAtm9FPq7PK9W0p4YwpK5f7H2eVtQFW1KlzUl8U6Pj66+BbqnLZn3p7WIjqWkCzE/1SLlg//BReqR6Una1SYp/bD22IM0K1gzag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5U4KnRA1hCPq16GxInZv7+fsnQn+t7vVMauiGg6DexI=;
 b=h06vs1pzEHuJ8ratKv6ex0M8hcb758mR69Aus9ygSl9thclXf+bqYNcAV3EoVUJlmCcBDp7JveQNa+tFM8avxxO9VfffI7obkTFQiCe/ziNWyUtyF9GRoO2e4EZOR19dT/KxYAuf4p+vCE43F+c33cm03+CtLYyvUftyrTq+Bf7cj82SnNvLPyMWXxEKuGXiBlqSSNZBOGLIdw9SXTtYhQaHUyHR4ZZqCqk5Hr+iuyKuAivyYiNfbjqliRcvoSw7q6olo7IR04edjGl83DVAdXzrUqw4cSs2AddY6aOk3ubwGjrEzi9OpzW6+YV6JtX5B1AkwX3uhdYUF34mTIXT4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB4123.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:25d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 15:40:32 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%4]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 15:40:32 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Joel Stanley <joel@jms.id.au>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH] powerpc: Implement hotplug smt control
Thread-Topic: [RFC PATCH] powerpc: Implement hotplug smt control
Thread-Index: AQHYI8y4A7DJzJWHdEGRilbfzG69PaysUBmA
Date: Wed, 2 Mar 2022 15:40:32 +0000
Message-ID: <869d7fbb-4420-4721-d301-546f5fa4c1f6@csgroup.eu>
References: <20220217070419.351683-1-joel@jms.id.au>
In-Reply-To: <20220217070419.351683-1-joel@jms.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae9dd507-697f-4294-70e3-08d9fc62fc6c
x-ms-traffictypediagnostic: PR0P264MB4123:EE_
x-microsoft-antispam-prvs: <PR0P264MB4123D27839E9F0A9BF9C3017ED039@PR0P264MB4123.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8k40xv3mJQexzNVpFOrZ4x40AzDRB8UuMsM4FZBaVYQtHzd8OOB48i13KCAT03VgxFV0ozzL4Gqji3RLVVcYRdoHfAJEqSRDANIJLMALUJCIog2KzFfyF5KMv3jPana3gPZOAye2BI9inLlEmF1cboPRy9ppIqgcS2lshittzrPrpDSIrf0LwYqiXy5FKFBGSqK2QjIHciZAyPLlCcij9U0mR81dcFEbyregjZjQQasLdMhzmD8qW1ROnaYPvgX+3LTIVQ0o60aIwu+quptq5BNP1R1qwBHlwGG5QERZADckO+9cHHIDypRJZvSLaHWbZBiWuQOREQdF2ofb19i9w7MD31kRwqGf+mIRFm/auQfE+ftHSZALhE3TxE6cZzo3tH+EJTjJtpgqeXO/xAX3zqWxqpjMpn5WzBgIlH8Ql5TpwdHFBQ+u9D4U0w0zmvttv7aPXMPvCNQ5PNOrfpSoJmOS+CQQISdqpqSiXC0wowdkvb0ulAEzQ9JWLXTAbD3+DhhoQCkG64GfID5jDJsr7kzHst0RpsrohX0Z9HynOADMGrrDoKyfx2W6JDq7GOXuN68KA5lYKQ/T+rdU9nLyI2FaCAHUKMxKi9p3Ivl2u5pXUOYQXGzxggtOUQqVegmWzOnJ/Kk+Uy86z3yCw3RCM6T9S2bPr4cnIIvcR5c2aupCOYN/mMea0G6Jjq9xlkUcaldfJ0oZ3QYcA5i7w+RdXAWgVhneVPpYHQjhb42xDt1JcVPZ8Rlu0SpGlwV1XAT5M+MzJzjz8YCeHbJcuiH8vQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(36756003)(508600001)(83380400001)(2616005)(44832011)(86362001)(6486002)(71200400001)(66574015)(31696002)(26005)(186003)(5660300002)(110136005)(316002)(31686004)(66556008)(66946007)(64756008)(66446008)(66476007)(122000001)(38070700005)(8676002)(38100700002)(6506007)(6512007)(2906002)(76116006)(91956017)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmdzRjR0L01OWVBpOTY2dzZhbVU4bitrTWI4MFoyN3BVWGlYMjcvMFZKMWlC?=
 =?utf-8?B?R3hISnZtYWJjZkxmVGplaVFRdVcyMzN5clZ5cGtBWEV2SWtodG9wQWdhcDNr?=
 =?utf-8?B?NHh2MjB4L01hVytrWWYzMmtIazhhaVRBOEd2OTZpeGd6Mjc1ZEtDVnBQRE1h?=
 =?utf-8?B?dkhESWl2TEs1WHNXUmZERU0vRHYzRUEyajJkWTcvelVBRUlQdjNQQmluTVRv?=
 =?utf-8?B?bkhkazh3TXNaNG5MMGxWZzFhYVlXd3ZTaTVqWDhYT1hzSGhhS0VRbmxKMkFJ?=
 =?utf-8?B?Q2NpbzkzckhCd3djUmxlU3RTR2E0WG9NTkRCbVFIaGhpdHQ3WnJNQ3hOQUtT?=
 =?utf-8?B?d1dXS3RkY1krOXVsNDlvYStIOTkycExqREVHN2ZER3VueFZxZUlOQTBZRG85?=
 =?utf-8?B?Tk01K0t6eTlKM0tNVERCeEJLUjdVVCtWVllUbUw4VEhEQzF2bm9uUlJJdS9z?=
 =?utf-8?B?WmFQdnVTalFBRVNZVEg3SkZUUjgrVExha0NwUjlvVWJUMitvN0xLRms5ajBQ?=
 =?utf-8?B?czlyTzB3d1o5U3YvV0pySHpOYTV2REVHdFM5a00rY1ltKzVBOEd1VXliUW11?=
 =?utf-8?B?cjZqbzB1WHRuMXdWR3dYak84aU1FSVNNMEpRMkVyQWNVaHlhOWRZbXNOcGJB?=
 =?utf-8?B?Rnp4VHBSb29RQU95aldTMUUvakN2a0VMcWxZOW8wNHQwUHRBekVhY2o5aE5u?=
 =?utf-8?B?M1FIWmhiWGJteDliemE0NkhWaEFRTURDUUZWWGV6UnBvbzVNTzFsMDRYaGQy?=
 =?utf-8?B?N1BwcWRUNjNEWXByR2RFdzBaa05NNXFqUHRNOCtHUk1PZUtOOE1wcmZiWnVI?=
 =?utf-8?B?Wi9HZ2l6RVJrbXk2N1RXaDl5djBvVWhtSTZGQnowNzNFd0pTcUFxV2JVS1lW?=
 =?utf-8?B?ZXczdENBa1RNS3JpeGorR2tiQ3BQMGZwblFrdWwreXZScVZQMVJKMVk2NFFk?=
 =?utf-8?B?TGh3L1JoemZpU3ZGY3l2WGhmRjFMcmRrTlNMMFFad0h0SWg2Um41M09yMndw?=
 =?utf-8?B?eGh3U2o1ZEZScVphbnNuaXphNld4cUV5b3FmbFo5Qm5qak1lU3RXNXd6TUZQ?=
 =?utf-8?B?cm9SMVc3cm5Ec1h2VkltQlRiVDNHS0pmRmI2bWJ0Ym1KZEpKdU0vQlBzUHRC?=
 =?utf-8?B?Qm83RkV2MGR1bnIzczNVWGtsZFJuN0h5dzJCSE55S042eDB2V2JSQklzZVVq?=
 =?utf-8?B?d29PUTVOWFZvVHFXdnVqY0p4bmN0ajdtTkJINU5QWFZjYzhUczlnZFZWMk5X?=
 =?utf-8?B?NWF0d01UbFpZQzRCbC9RUWlySnBGUXFhVlJVUWRkTE81dW9qZzNMTHUzNEZz?=
 =?utf-8?B?YXZkMjE4bEhpRGI5UVJQQm8yRFM3KzBQNThRMGRwcWdPMENCaUI3NG1BdktM?=
 =?utf-8?B?Q0hKSnJ4V0tnR3hOTFhSNDJOMlpQRjN0aEsyemJudXl6amFnRkFOQU1VSlJH?=
 =?utf-8?B?OXUycXJXTFhIVXU0U0htOTRrSGFCVE9UYUJEdXZ5SUIrNzI0RHNtNzdUM2lk?=
 =?utf-8?B?R2VUUUxaVlZuVE5mQ2Q4Wmg4NEZ1UE01QnlSRHRmd0pERkRxNCtRYmMzS0hT?=
 =?utf-8?B?akdUcXFhV3VoZHNUck40Q3ltY2ZRbGlDZzkzcVhyODcwUUZnNjJuQXpKSmpI?=
 =?utf-8?B?QmFtQ3AwWlNhdk9TME12MjR0RitzZWhYa09MTlhLQnQ3NzdjMDN2NHhSK3RB?=
 =?utf-8?B?LzFnRzV2V1RBbmwvSEdaZVZmT24weStjblhQNE1hWnFqTWd3SHV3ZlZqWDRl?=
 =?utf-8?B?VXc3Q0ZpWnJxNWQzY3BNcmh4U0R3b2lLeVk2Z3VaMC9jOUNLR3pIVGdKMmtF?=
 =?utf-8?B?RE16QU1GYnVxaDVBQjZCY1MzWVNZd0J3dHovL1BXT2tWak13UlcxcGUxd0I4?=
 =?utf-8?B?SVgrRVpDQzdUdklKa0VLSzBVMWgzbVlOVE4vSU00cUxiV3NnQjVmZkhwTnhv?=
 =?utf-8?B?Snp3U0x1Mmh2NG94dFIvTDhVdE1ScGsxaFV6MWIvUVE4R2lnUjlka2pvaWJJ?=
 =?utf-8?B?VHhBc0lodFQ0S3dXYnpiSkFnU1N2Yjg2dC9HdEhLempRdDVBMzl6RzdIcDM1?=
 =?utf-8?B?VkF1OEovVFVBbWd3bnNKUFJRbXN3eTBkT3ZUanVWMlcxN21aalZWZ2VzV1Ay?=
 =?utf-8?B?SDZ4cEhXOWhHVk5PeGJueXJDMHpPL0wrNnZPS2dSbmJENDNia29sWDd2c2cy?=
 =?utf-8?B?MWd6c3Fib0pTQXhwM3M5aThYNGpDM3MvS1hOaUluMlJTdEd5d2R3Z2tIaHhp?=
 =?utf-8?Q?PkpjxPHWTr7ovZ1w2DgsNQxCQT3Du/aFeiSvlBe9Lo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77EFAB9535CF62499013C04CC98722D4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9dd507-697f-4294-70e3-08d9fc62fc6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2022 15:40:32.0970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sast6wZ9NPs+dPFwwlB4c8pcJ0KlbZYDuccJr1WYEA5YzRslz1UXvPkCyPO2svqUYx08qURDENdUUEJ3wS1Z6MNQA+J5PR/KcbnCH1czJkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB4123
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE3LzAyLzIwMjIgw6AgMDg6MDQsIEpvZWwgU3RhbmxleSBhIMOpY3JpdMKgOg0KPiB4
ODYgYWRkZWQgYSBjb250cm9sIGZvciB0dXJuaW5nIFNNVCBvbiBhbmQgb2ZmIGluIGNvbW1pdCAw
NTczNmU0YWMxM2MNCj4gKCJjcHUvaG90cGx1ZzogUHJvdmlkZSBrbm9icyB0byBjb250cm9sIFNN
VCIpLg0KPiANCj4gSW1wbGVtZW50IHRoaXMgZm9yIHBvd2VycGMgYXMgYW4gYWx0ZXJuYXRpdmUg
dG8gdGhlIGN1cnJlbnRseSBtZXRob2Qgb2YNCj4gaXRlcmF0aW5nIHRocm91Z2ggL3N5cy9kZXZp
Y2VzL3N5c3RlbS9jcHUvY3B1Ti9vbmxpbmUgZm9yIGV2ZXJ5IENQVS4NCj4gDQo+ICAgICMgcHBj
NjRfY3B1IC0taW5mbw0KPiAgICBDb3JlICAgMDogICAgMCogICAgMSogICAgMiogICAgMyogICAg
NCogICAgNSogICAgNiogICAgNyoNCj4gICAgQ29yZSAgIDE6ICAgIDgqICAgIDkqICAgMTAqICAg
MTEqICAgMTIqICAgMTMqICAgMTQqICAgMTUqDQo+ICAgICMgZ3JlcCAuIC9zeXMvZGV2aWNlcy9z
eXN0ZW0vY3B1L3NtdC8qDQo+ICAgIC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L3NtdC9hY3RpdmU6
MQ0KPiAgICAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9zbXQvY29udHJvbDpvbg0KPiAgICAjIGVj
aG8gb2ZmID4gL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvc210L2NvbnRyb2wNCj4gICAgIyBwcGM2
NF9jcHUgLS1pbmZvDQo+ICAgIENvcmUgICAwOiAgICAwKiAgICAxICAgICAyICAgICAzICAgICA0
ICAgICA1ICAgICA2ICAgICA3DQo+ICAgIENvcmUgICAxOiAgICA4KiAgICA5ICAgIDEwICAgIDEx
ICAgIDEyICAgIDEzICAgIDE0ICAgIDE1DQo+ICAgICMgZ3JlcCAuIC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L3NtdC8qDQo+ICAgIC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L3NtdC9hY3RpdmU6MA0K
PiAgICAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9zbXQvY29udHJvbDpvZmYNCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+DQoNCkJ1aWxkIGZhaWxzIHdp
dGggY29yZW5ldDY0X3NtcF9kZWZjb25maWc6DQoNCiAgIENDICAgICAga2VybmVsL2NwdS5vDQpr
ZXJuZWwvY3B1LmM6IEluIGZ1bmN0aW9uICdjcHVocF9zbXRfZGlzYWJsZSc6DQprZXJuZWwvY3B1
LmM6MjIyMDoyMzogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIA0KJ2Nw
dV9kb3duX21hcHNfbG9ja2VkJyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlv
bl0NCiAgMjIyMCB8ICAgICAgICAgICAgICAgICByZXQgPSBjcHVfZG93bl9tYXBzX2xvY2tlZChj
cHUsIENQVUhQX09GRkxJTkUpOw0KICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+
fn5+fn5+fn5+fn5+fn5+DQpjYzE6IHNvbWUgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJv
cnMNCm1ha2VbMV06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyODg6IGtlcm5lbC9jcHUu
b10gRXJyb3IgMQ0KDQpDaHJpc3RvcGhl
