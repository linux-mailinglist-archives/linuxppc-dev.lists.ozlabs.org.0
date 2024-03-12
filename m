Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D72F4878F1C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 08:38:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=XQdhW987;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv58v4ww5z3dWZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 18:38:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=XQdhW987;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv58622jmz3cGb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 18:37:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqmBjnzbn+8DoY10vMHjpM1Y7SyDZPa4YxtBEk/SV+rC21xC1kIuVQGBDSkuhvtjIr6AEFmPMFWOV6spC+eppZJjkZ5vAcPkcyzF0EoulUccDoHJ+gRpcjomzwW/s/kSW9BWBbzspYllyDSpGCk2E3dNjvlvWN4Vm4FAWEqrR4UxQPnEcg4RxbRt7gOh3Tee61kBXfDIMASRU6qVJ1PAmjEuqdL0HzH6CHDbLa1P0W05hRYRttgCc7WbiLSxLC5i9JsRsGoTab8Jyt9r58uo+IPayMjIPbT1umGz4gSkXGRKx1bQse7FI/XXc529R4RAAzm+CPhgkud16QxV3/WRbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+IE7ZAaKus+3HefAVoE6C77EXGslqK2uItnUFyq630=;
 b=nDOP66CWtPenYyeu/1F1DF9csJFe5qIUUUOwRSzdGyo61PkiPg9g40Lj6Qvc79aHz319yzc4/+qY1lfEMaM+YPpxWmHBP2o+Z76kdu5IJbnLBe43lyxg6RhmqISeTse/H6ORqOlGh373UTRgRMIDRl5dtD/OPy3Oacxds2BYVJud6ci61DRiDt5IWhS6RoPuzsQdp/76w70rpseWBLGuG/s/zxN/xgiiyT4IwEj1/7j5tfTIgnTyOSoQyMMR0TKEdqejaPhzBKEyWFkJz/P38FezXux1UqJg/Gc/KPMY7PCP5EeEcuiPPc0mwkWa71lmgyycX41CxsJzJVcWRv/Emw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+IE7ZAaKus+3HefAVoE6C77EXGslqK2uItnUFyq630=;
 b=XQdhW987hPSVnpSv9JEvyg/k1jc4QeP+gYL12WHm0tHYK5hS/VOCplXv7cqeyuxFrmhneLoeSnff9mH7tNClkTbhYVfoeesJWt/KgE2iSmgSXmccp3aDSYDX+ezN+BsgT+mcjjC1F3uA4c7frul86ctu/IudMYNBJA4uEV8SIJx8TDXvH0LZINYOQqI4K8TcRAUXqtLECNJ3lGT7FiWP4Ya/3S7QdBc224JZGdhqXp6RfCZcx9OCoijtDvOIWyO1VJeOVIWV+XoxI3u4JXm2LR5/7fLwQihjzZHEUHjoW2QGm3S3VLmaonKbd1okbh3pv+/EuGh4r9HbQqj711i9HQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2822.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Tue, 12 Mar
 2024 07:36:52 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7362.035; Tue, 12 Mar 2024
 07:36:52 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.vnet.ibm.com>, "npiggin@gmail.com"
	<npiggin@gmail.com>
Subject: Re: [PATCH] powerpc: build-time fixup alternate feature relative
 addresses
Thread-Topic: [PATCH] powerpc: build-time fixup alternate feature relative
 addresses
Thread-Index: AQHaUnv6aaQ/oOIM6UqLwC1R47uVXLEz+yCA
Date: Tue, 12 Mar 2024 07:36:52 +0000
Message-ID: <59ed9af0-4ea2-4b5d-9b87-db7be883658a@csgroup.eu>
References: <20170521010130.13552-1-npiggin@gmail.com>
 <bfe238da-c5e3-4478-8c3d-c4ebd584fcb4@csgroup.eu>
 <4af58af4-9fe6-47f6-a896-63c1bb6012ee@linux.vnet.ibm.com>
In-Reply-To: <4af58af4-9fe6-47f6-a896-63c1bb6012ee@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2822:EE_
x-ms-office365-filtering-correlation-id: d3503092-7712-4755-674c-08dc42672f64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ffnMWLL+mGXeM2dpNlhPclpd7cilSAIq7En3GxzrjxTQrodqi8ejh76R0xAJw2NP+/iKuF5krR6Hzwk54tjN4aE02uEkJOwTpRCOIGA+BDOARDDP63zc6zbCarucydjXBeMVCdahxBzTjKjafgiOn0pVV0R3CstDDgbnXxQKRtByL6lkzrlllk/vsSHDaPgNnai+PlA6k3wPZY+joFKuPLj00mHOjZbL6VXJcOHq4jOaEUKEznNF2vAR7PttmhHqY5nfe0+a82dra1k4AjKeoL++SazyHTCHvfsj5wpMMM2n2pjZ81wSx4gsXfr/ns1qj195c4FvYz5bRIONWSBV5TS4ABfFdxHxf97WQVKlXVVmLaXR4K4Xj3LZiQs3hakSTD9n/fw67fdcu+R8MtlnzvRpG10yMKifbCmZh00+WrVGQZEX/z7MiZWTXWYXuc+BtgenOFDKPD2qLXCiT5Ub0tsg8rNLRj1Pvuyx8VHrJTj/1Cgirahei3er1W+dOOveOPnek2/Gxi9aE1DLfEZfc3g46wvBQWBd8tiErvTBt9RPUFNZEpTf2ccTZX5mllIhFSoUAX3jpnLP/iVwMH/IE0iY6YEwG4cKgz5xOZfvBThZiUe5csOtEQ2suna1yjmXSnCqN9ajv6Ou0hKDr8RWk72ZwgtnkYswYYVZVXaoe/I=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OURtZmM0S1k0RzltNVBDVG5vWjlYQS9wRVdFUDVnR2pFOWRrOWNYV2E2Z1Q0?=
 =?utf-8?B?Y2RjODVPWVQ3cmJYaUR0WUZXbnFoYnp2b1pMQXcvbGNCeElkOEJGbnMxM2c2?=
 =?utf-8?B?SjZ1em5meWF6TmN5akRUNEZUQ0FDZndKc3R0WkFIc0dtck9HbkJ0REd3QmZl?=
 =?utf-8?B?SjJTLzViUEhtMHZucFhSZWY5Uks5cHl2K3RYWDdwdVkvZzZsOUF0Y3lGOHNP?=
 =?utf-8?B?MzZFRmpzT04vbnM5UkMvbjh4RitPMTRtSDc1UERQV21DRWhTUHJkbHFyTWtK?=
 =?utf-8?B?UWpCZHplYW9OaG9pNHhCaWpmTTZSeEtoUVV2b256QVJlSUV2c3QwSUhNRFh4?=
 =?utf-8?B?bGczbTNEMDRTN1pVUEZZbDNLRE50aHQ2RTQyOEt6Y0kvenFDbWZPUC9naXlm?=
 =?utf-8?B?cDRKeEhjejZGcXdERlVtRU5CbWVwNXZPOFZIUFhvNTZrclFOK3RjNk5TVTlF?=
 =?utf-8?B?TFYrcHdqeUlRN2o3VjE1MTVyV3dZTlhKK2VGSGtGdVZ1VWZ6QkRZWmd1WERO?=
 =?utf-8?B?Sm16MDZSNlkwalZ4RVoreVI4SkczN05vTis0VFRYVGxSQW40VnRCaFVadElt?=
 =?utf-8?B?SDF6ekVqNC9VVzJOc2RLNktRY284MTAvbWtvWXNNcXBDb0ZCbUg5dW9VbFEr?=
 =?utf-8?B?K2FQTUJqUVJacE1uaytIQzFQUnUwNmV1cEp0UUhyTnUreSszR3lQd3lpNVkr?=
 =?utf-8?B?a0lmWWNmMUFObkJpZnc0Snl6UUxwOENZSXlsRmhGN2hPVkRveDZ1WXhxTlVy?=
 =?utf-8?B?QUx0T0F2S0U2L3lGaS9HM3IyNno3cXRXcjk0QnZiTkQ2bWE5QXYxNHJGUmU2?=
 =?utf-8?B?R1c3VzhvK0JlV1orQlYwWW5oV01qandLZ3paWkZyUWR6NWtDNXlLVkE0MTFu?=
 =?utf-8?B?My9JbGJBM1kyanVrYkFLVTB4SlAxbWc2VHhEd213RllDL2pKdXdqVit0Wkoz?=
 =?utf-8?B?ZW00S0R0MXUwNDVRbWJpcEwwSzA5SG0rQndiU2pzSDIwdnBrNndDL3cxaHg5?=
 =?utf-8?B?RjFHUlJiSHZ3MGVwSEdQb0dvckxKbkQ0VXFLUVN3WUVEalgzY1lGRFM0SUJk?=
 =?utf-8?B?RVNTUDBPTXpkcGlKUGtubytZalZNTVFvVDVlVE12eitqdmRhTVlhcHVnZUFF?=
 =?utf-8?B?c0YwNlY2aWZOOUtFVGRjb1FFOVhJNkNIYUw5alMwemZMdDhYZHFpZ3IyNjZ5?=
 =?utf-8?B?Y3hXWTAwYUNualplWGVKblhldGRlQTNlbTIrSUY0M2UzY2pudVR0YzJQU3FF?=
 =?utf-8?B?d1JYZDF3dEtQcm5xZnhLMzBTbEZPeFBjTWQvTHpmc3Q4dzVCVlNMajdndTN0?=
 =?utf-8?B?U2g2QkZnT3l6cVZRT3VmWnJhdEFSdkU5ZWU4YkpBbnhRQnpuREJOMDZscTBn?=
 =?utf-8?B?QUhvVDc2Z1pSa3VyNXpMWWVkLzNhV3pkc1dmOWZmaTFaUkNWV1VTYXR4TkNO?=
 =?utf-8?B?NnpxaEJSQXlxYzZvV0NlTHdQSVlnN2ZSekVBeDFlaW1HOWtqT05tTERSZmFr?=
 =?utf-8?B?cjdybVZkY2laRG9ScFo4NUM3VUtSZXZIOHZ4UmRJU2RTWkczSVFjcC9sczVa?=
 =?utf-8?B?MEZZOFh4WGF5bUJObktScmQ5QjRYSEQwRitRSzltQ0NiNWNueVc5MUhUcWlQ?=
 =?utf-8?B?M01DRlJNd05SL3FQT2lvbkhaY3EzSjgzM3JmeVg5RXJKQldOdnBzdUNHM1RB?=
 =?utf-8?B?U0RqNWY2cXVmay9yK3c2Z29rd2UvSjVjeW9Ed1NGeklIMHkrcXBYMnlHYlNX?=
 =?utf-8?B?WWE5Skl5ZTNhUVdzc3lDR2VNNjIvd0Nrck5wRTVKRERnV0hqc0liak5WTHVF?=
 =?utf-8?B?c1BmSzZUNWpxL1FtenJlWEJ2WUZ4Y3V4N3h4R05xcW1lUksxcWtaMlFQSGFT?=
 =?utf-8?B?U3JDL0ZyS1RST1N4RnFXekhlcjlpZFZZa2hIaHQxeFZ5TmQ3TTc5WExyTHNY?=
 =?utf-8?B?UUhwTG1nSHBNRldoQm1tRDZnSkdIdHdVOXpjc1B4d3VneWVraDlTOWNXTU94?=
 =?utf-8?B?YVViSUVWVjFiWE9JaGt2K2MyZVNQN3NETm94TkVVcTJ2K0hwSEkxcmp4OXpK?=
 =?utf-8?B?QUZtdHYydmJuTW5tV3c0WWxOZU9IcmhHMFM3amNHUHRuM1N0cUVyNU9MZWw4?=
 =?utf-8?B?cFgxZHRqaEszZ2l4V20vcnkvclNOSG1CZmZPdTN4dC9DVmo5Zi94TWd3bDlq?=
 =?utf-8?B?WXZPUGJQeUhDRjNGaEl6VmdxcjB4ejZOa3Z2M2RaYnhrcERpQXFPMGRjRkll?=
 =?utf-8?B?Q3NoVFR0L1lXVjdOTnBwM0t4ZTZBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1AA6DFAC6E8474B85346702008D2AF2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d3503092-7712-4755-674c-08dc42672f64
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2024 07:36:52.3552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z/GCLpG9JDT+PUa7KIY/L+M+dUBMQdiMRTK8dzf5aF/AGf2LeE+6yPAVpVDzCHobP9GbjeUsZQHUr5gGJK8fzV0AoRFlPUh3DFtZ7cygZYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2822
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "sv@linux.ibm.com" <sv@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzAxLzIwMjQgw6AgMDc6MjUsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBIaSBDaHJpc3RvcGhlLCBOaWNrDQo+IA0KPiBPbiAxLzI2LzI0IDEyOjMyIEFNLCBDaHJp
c3RvcGhlIExlcm95IHdyb3RlOg0KPj4gSGkgTmljLA0KPj4NCj4+IExlIDIxLzA1LzIwMTcgw6Ag
MDM6MDEsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0KPj4+IEltcGxlbWVudCBidWlsZC10
aW1lIGZpeHVwIG9mIGFsdGVybmF0ZSBmZWF0dXJlIHJlbGF0aXZlIGFkZHJlc3NlcyBmb3INCj4+
PiB0aGUgb3V0LW9mLWxpbmUgKCJlbHNlIikgcGF0Y2ggY29kZS4gVGhpcyBpcyBkb25lIHBvc3Qt
bGluayB3aXRoIGEgbmV3DQo+Pj4gcG93ZXJwYyBidWlsZCB0b29sIHRoYXQgcGFyc2VzIHJlbG9j
YXRpb25zIGFuZCBmaXh1cCBzdHJ1Y3R1cmVzLCBhbmQNCj4+PiBhZGp1c3RzIGJyYW5jaCBpbnN0
cnVjdGlvbnMuDQo+Pj4NCj4+PiBUaGlzIGdpdmVzIHVzIHRoZSBhYmlsaXR5IHRvIGxpbmsgcGF0
Y2ggY29kZSBhbnl3aGVyZSBpbiB0aGUga2VybmVsLA0KPj4+IHdpdGhvdXQgYnJhbmNoZXMgdG8g
dGFyZ2V0cyBvdXRzaWRlIHRoZSBwYXRjaCBjb2RlIGhhdmluZyB0byBiZQ0KPj4+IHJlYWNoZWQg
ZGlyZWN0bHkgKHdpdGhvdXQgYSBsaW5rZXIgc3R1YikuIFRoaXMgYWxsb3dzIHBhdGNoIGNvZGUg
dG8gYmUNCj4+PiBtb3ZlZCBvdXQgZnJvbSB0aGUgaGVhZCBzZWN0aW9uLCBhbmQgYXZvaWRzIGJ1
aWxkIGZhaWx1cmVzIHdpdGgNCj4+PiB1bnJlc29sdmFibGUgYnJhbmNoZS4NCj4+DQo+PiBJcyBp
dCB3b3J0aCBrZWVwaW5nIHRoaXMgaGFuZ2luZyBpbiBwYXRjaHdvcmsgPyBJdCBzZWVtcyBvdXRk
YXRlZCBhbmQgDQo+PiBkb2Vzbid0IGFwcGx5LiBDb3VsZCB0aGlzIG1lIGRvbmUgd2l0aCBvYmp0
b29sIGluc3RlYWQgPw0KPj4NCj4+IENocmlzdG9waGUNCj4gDQo+IFllcywgdGhpcyBjYW4gYmUg
ZG9uZSB3aXRoIG9ianRvb2wuIEkgYW0gd29ya2luZyBvbiB0aGlzIGFuZCB3aWxsIHBvc3QgDQo+
IGFuIFJGQyB0aGlzIHdlZWsuDQo+IA0KDQpOaWNlLg0KDQpJJ3ZlIG9wZW4gYW4gaXNzdWUgdG8g
dHJhY2sgaGlzIGF0IA0KaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4cHBjL2lzc3Vlcy9pc3N1ZXMv
NDc5IGFuZCBoYXZlIHJldGlyZWQgTmljJ3MgDQpwYXRjaCBpbiBwYXRjaHdvcmsuDQoNCkNocmlz
dG9waGUNCg==
