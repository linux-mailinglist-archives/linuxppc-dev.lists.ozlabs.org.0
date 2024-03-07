Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF3787482D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 07:30:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=OiktmLa3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tqztk6jccz3vbL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 17:30:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::701; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tqzsw4sRyz3d2W
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 17:29:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYgFvdMw7e9rMuP5R83WwyhHa47RVzSMbInTJu47lRKxGFyBHi5DWczqil9ulgz8ZJ52P2SH3TDVQij9PdoTy03y5aujB0S1h61tJvMj7PjvGA4WCVmd7me0PCi0agF5egBlScw8C3zRZrKNhWuV9TyMCSpnMlUDnHiT+IL2kEGxTNTk22UVwADZzmFrvwPqgbttq4b6tur/6zJSVSFzapyHG8z7xWQyMy9jIpz2tHlwYsxzWkLmtFbONGr4bJL3NZmiB6xTSUSBoBOysTPmA9cvhx+aZrusl4qytyQfXUvXg8Kp0/2zRYndN+fGLXz7wXkdc++ACJpHvXmyihQFiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMlcORUk/3grUhzcMjRz/O0+0zIYapH8DySvvwc3cl8=;
 b=ZaS+hkuYacBhXp3H8kt4ekqhZmaEIuS5DoypyY/B/uT2y76g431kFblToGLs0RbViDTN3DM2++Otsp4bKs28FQ6AtdPd8m/M1qNKFLfunLPZbwR3bh9lS875nPXgtgfVvKrm7OlQr183fLZTxjmr9WEjV+ZozWV4NqXy1Wwh4C5o1nGKRIWR/RMMxaPrG1WTuj9UdcVDhAxQRj997eyW+WoB8JTIkY18ej7utGIZG2b+WDD4OQCxF8xUUpPPTOSXMx+sshLLHdYwwZOE/yU65tLPII4lkelVFeWejdSAwxci7DKm6FLvzqe2h/dEL18o8g3z+AYSBDP+hKZ/ACEpVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMlcORUk/3grUhzcMjRz/O0+0zIYapH8DySvvwc3cl8=;
 b=OiktmLa3YElRNvIgwZTPFFl1PIg5Yn7cngH4HvkzflgKGFpYNgeZPl7fGN/IKOFPeVjicTf4InPxP1Kwni8pTSITX7j+8zp/Tf0jK55/8NHxnM5Z+xWz+ofnaONMEhYwsG8hYpw7AO7ZSrVTNJVMGVZ2kPBTG3XFjGexHufnKcyqOfMXbECEwQhR0zss5C3yO2oj0p3Uxeoayo6LathRWjSArh93DEB7tk9ZdFoyS7m1HuHX6oyGPQdsHopOT4XRaufoq+UGj86JZsxb3FmqQtTUs/RCctxomEYxsHGDoMhTZStWEcww2qZ69UVGzYC3/hRgG/c6dFLG6vogTXs/MQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2818.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:37::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 06:29:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7362.024; Thu, 7 Mar 2024
 06:29:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 3/3] macintosh/ams: Fix unused variable warning
Thread-Topic: [PATCH 3/3] macintosh/ams: Fix unused variable warning
Thread-Index: AQHab8ZUbltzgnJp8UWXb7URKbgjErEqscoAgAEQS4CAAA/bAA==
Date: Thu, 7 Mar 2024 06:29:02 +0000
Message-ID: <425898fd-151c-4b49-87e2-d18b8650cdf5@csgroup.eu>
References: <20240306125853.3714578-1-mpe@ellerman.id.au>
 <20240306125853.3714578-3-mpe@ellerman.id.au>
 <210b7f0e-9f1c-4f8d-8248-3d906121333a@csgroup.eu>
 <87plw6obdq.fsf@mail.lhotse>
In-Reply-To: <87plw6obdq.fsf@mail.lhotse>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2818:EE_
x-ms-office365-filtering-correlation-id: 3b2cc95c-53da-4e32-285b-08dc3e6fe170
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  gSDNYlHt4LYIbuRwuBXMl7scdL+axt9uIhLeW16uFVkFgZW1p9rQq4dmKG30bK7lcIqtOfvzLjhAGtqr6ZZE7NA5nFpskgGNzCYDiF8da6sVVSn1Qsq8jVG0ZBTGUZp3YCtaJ9XReXIkmT3XeJri2MqD1TNsboDonhJb+x4Dc8PopjMIH0P4zRO4yHbqz/y7ZHY4pH+kXfghhHES1pgZ3vJoitKUg0A4Ob/6ZsEMneT1t8jTzxIIU+zFkrKBuOoO/9YGyVvBOTcT8X6+E6vtx/H+BUgSVi7MnjgDsGaAT+E3Ke65NnsQzk4K5qOfq99lKoEMkZ4f0C+bC1iK4LgOD+QlirExbXXZGpcn3UAj9l5yl/EBu20KtM+we9BCGxMhbanfQhA3ByU1fFYGp5UALGgPEsEZNp38SNdSvLrtzKetKoNP7N4iX2jVyd0K/49SpdIdRmuZJPmC2+cYskoFdDDJApjjpiXdrPzRW+yZktlPr2CXfBV1t3pFsHPo/7kEUOoRgAlFNe10Na7rA/rXkKikfBufnxd8NDoKpZ0ca5gP28MXLwCpPChQrBuJUfEkoipv2ON7uWuYAPrwHLdnAq/roBtJToQNUFZoht+bOnf1apgFxA4V4/RyjRtQ3THi18zdr04OFtpOwZXI6PjSGeexFIsZeIu/n5DCsiyelQcG5HzqsVfj7wjof07anHJsuUSLdnfW6HKJqG5gXTfISw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OFJyVWxPS0ZyeXcvd1lvOUV5NmEraVc2aGpsWmRwaUZ0L2lmbmJ4QVM1dEtC?=
 =?utf-8?B?OVBXRXd6QnQ1dXk0R1k4TXNrWGtOby9pdCtQV1RQMWU4T2VZZFF0TW9GVTNF?=
 =?utf-8?B?Zng2N3dGdWFPdkd2QlMydE05TEh0aERmSmpLaUFYYmxySVFDK1NzaUlXT0p1?=
 =?utf-8?B?cE1nZ2lZdndFci84dFFDcHBaVE8rMS9nY2NmdGpZV3lFdTdFNWRZUjF4NHNY?=
 =?utf-8?B?OXpkTnZzRm1TaWxML0xjZ3pBeDJrZ3RqblduajVHZFRhYjFiL003UlB4TTJy?=
 =?utf-8?B?UVVqendUbitQUTAzVW9Pd3l5aUlhL0RNaVE2MVloejcrbmRDVlp3UVZPcTdi?=
 =?utf-8?B?bXdCZzJPMGpEMFlqb1o0WXc4T01nUUNiUVFXMXNSM3ZEaFdyTzRYdzJ6UnVP?=
 =?utf-8?B?YXpxLytXZ0N0SFBVMzBzazZFVE1WZDFqaWhKWFIyaWhkemJHM1E3TVpNaWY0?=
 =?utf-8?B?SWd1YU1vSHVjZGZhL1IzVHpHVW9TdzY3bGxGcXVoSjFqRXNSMExWM0cxamFX?=
 =?utf-8?B?S2NzMVNWUE5ocWRUbi9vQTkyN2Fzai94Ykw0czlvVWs4c3VyWXNCSkhLUndG?=
 =?utf-8?B?R0diTGU2VE8vUnBBbnN6N0RmUVl3U3dYZEtRd1hMdVBOQjF0ZlJQNzQxVE1Y?=
 =?utf-8?B?bjFyNEthQWRyaEZjMUp1VTk2bEFqeDQzTHFvOFR5WVduQlVFdXh0cWZpNFg5?=
 =?utf-8?B?Um43VzZKTFl4MC8zOVdnSWV1QUxzU29qSHd5Q3A2ZEozb0ZlSDMxS2NSbnp2?=
 =?utf-8?B?TEdPbzA0dFpwRFBJWmU0MjBmWTFwbFVUNjNxNG9xZzRLOFMxaFBBRGpUWnVM?=
 =?utf-8?B?aUdFN29FZ2VySk04cUNQRFNxVFNVMVRSb09PU25RdnI1RjgzUXhFVzhIWDZQ?=
 =?utf-8?B?WlpLY3JXWXRUSndTRlM0OXFhNkZueUozeXBYcm9yRXZaRnczUUMzYVhhNEdN?=
 =?utf-8?B?akFlck9KY2hsZVhVelBmNThKOHY0c3dRMmQ1L0VTYnJYT2NQSFJLcWpXRkt3?=
 =?utf-8?B?S2FoOHVueGluRS9sYVB4SG9KL3Z1V25idDcrdy9NcTdaZFZIR1FhZGc1UzVk?=
 =?utf-8?B?QnQ2MDk1dXB1bXltUzRZbUdUa2JpUE5ZdzZiNEVKOS9RbFIxcTZTbnQvZkhK?=
 =?utf-8?B?THpDK244UGlCNWs5MlZDNjNnV0pWTnU3Y1k3ODRFWDhvcHk2NEViUTlQeHlW?=
 =?utf-8?B?Z1hmRDk2YXNWUmFwdkxyVG5jQ004U2tYSTV3NERlaDNXaXRGWXR2WlJrY0hI?=
 =?utf-8?B?Zk9KUjRab012ZTJ4MHB3dDFHcy9JaG54UWdMa1FqcXFvbUFsV2srbFdJZWx6?=
 =?utf-8?B?WHFhS0x3WVF6bkcrMjhMT2hGSFFGRU55NmpXemJlZlB0eDYxL3ZvTStmZ1pF?=
 =?utf-8?B?R1ZUZ0tXYVA0eFgvOVQ2MnJmaTN1cTR2eXlGaUlDN1F6NUlzV1FIRlhEUDBv?=
 =?utf-8?B?SG1PeU9uTFdKTG5BRGlvZHpaMC9pZE1nTHVDS2kzc0ZFSjNaQ0dVVGFyQTBs?=
 =?utf-8?B?RkV2amczeVMxWlY1QUZjTUVQb2pBRHFrdHBVSk5leVN3MkRYQnFKWXE1alFS?=
 =?utf-8?B?UENsbnlFcWVtRWdWK0pyb0lhbUpMTkxiSFA1VnVOakY5NFRya1JJenBWUnZG?=
 =?utf-8?B?NUdGaXl5bXN5dkNtdjBkK0llZU04V2NqeG9HR0M0bW1YNkpvUlJjMjF2MlJY?=
 =?utf-8?B?amUwNFo4NVZaNTJhblVWREEvUCtIOWRTdk1uaFM1Q2VEeW9SdHJxT3JYcWwy?=
 =?utf-8?B?MnZ5NnZiT3hOd0hpSEJtb3FIVWlieW9RbW9kSlVXMFAycDZNZjR4bSt0SjMz?=
 =?utf-8?B?dXIxMVd1MVM4M0RuTWFIazlxSCtPV3pheTRrVWpuenZ5WkprSjBkMWxQQnNx?=
 =?utf-8?B?dzJaRm0xRTVyMWZHc3NJZEtwRzBtY0xXSjlVVTF6SGJzVG5wYXRtZnFOZzJO?=
 =?utf-8?B?TFBiNDdXbDJVSGJyajBJWkZCTTJYbXFzMzBZRUhLeDErQlpKbVBRQnhUL29G?=
 =?utf-8?B?amhUTmFKWnYzM1VRNlpjNEY0QUZVZktNUlc3R2VycHc4SDBqYzdmZkFLUVRX?=
 =?utf-8?B?ZTdQbEJpbG5PT0xreW5rK0I1WjZlTGlwUU90YTJFV24wQWhzbkRvNnBMTXQ0?=
 =?utf-8?B?bjlIRGZmcHA2QTlnRDE0eHhxaDAyL0QvNVliV0w3WGozbEszZ3RHN00vRXcw?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE36081CD18A724A995A86613C9245A1@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2cc95c-53da-4e32-285b-08dc3e6fe170
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 06:29:02.3733
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eDbDBJtAbJbM+T68l/dMazpb/498CZ0jL/0lerfqkfT89BCvafnvQwUqHIQyNBarh7ipKH9wiYFKD8iW3bAUF3myGzrF2L60BFTixBAd3nU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2818
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

DQoNCkxlIDA3LzAzLzIwMjQgw6AgMDY6MzIsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBMZSAwNi8wMy8yMDI0IMOgIDEzOjU4LCBNaWNoYWVsIEVsbGVybWFuIGEgw6ljcml0wqA6
DQo+Pj4gSWYgYm90aCBDT05GSUdfU0VOU09SU19BTVNfUE1VIGFuZCBDT05GSUdfU0VOU09SU19B
TVNfSTJDIGFyZSB1bnNldCwNCj4+PiB0aGVyZSBpcyBhbiB1bnVzZWQgdmFyaWFibGUgd2Fybmlu
ZyBpbiB0aGUgYW1zIGRyaXZlcjoNCj4+Pg0KPj4+ICAgICBkcml2ZXJzL21hY2ludG9zaC9hbXMv
YW1zLWNvcmUuYzogSW4gZnVuY3Rpb24gJ2Ftc19pbml0JzoNCj4+PiAgICAgZHJpdmVycy9tYWNp
bnRvc2gvYW1zL2Ftcy1jb3JlLmM6MTgxOjI5OiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUgJ25w
Jw0KPj4+ICAgICAgIDE4MSB8ICAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpucDsNCj4+Pg0K
Pj4+IEZpeCBpdCBieSB1c2luZyBJU19FTkFCTEVEKCkgdG8gY3JlYXRlIGEgYmxvY2sgZm9yIGVh
Y2ggY2FzZSwgYW5kIG1vdmUNCj4+PiB0aGUgdmFyaWFibGUgZGVjbGFydGlvbiBpbiB0aGVyZS4N
Cj4+Pg0KPj4+IFByb2JhYmx5IHRoZSBkZXBlbmRlbmNpZXMgc2hvdWxkIGJlIGNoYW5nZWQgc28g
dGhhdCB0aGUgZHJpdmVyIGNhbid0IGJlDQo+Pj4gYnVpbHQgd2l0aCBib3RoIHZhcmlhbnRzIGRp
c2FibGVkLCBidXQgdGhhdCB3b3VsZCBiZSBhIGxhcmdlciBjaGFuZ2UuDQo+Pg0KPj4gQ2FuIGJl
IGRvbmUgZWFzaWx5IHRoYXQgd2F5IEkgdGhpbms6DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWFjaW50b3NoL0tjb25maWcgYi9kcml2ZXJzL21hY2ludG9zaC9LY29uZmlnDQo+PiBpbmRl
eCBhMGU3MTdhOTg2ZGMuLmZiMzhmNjg0NDQ0ZiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvbWFj
aW50b3NoL0tjb25maWcNCj4+ICsrKyBiL2RyaXZlcnMvbWFjaW50b3NoL0tjb25maWcNCj4+IEBA
IC0yNjIsNyArMjYyLDcgQEAgY29uZmlnIFNFTlNPUlNfQU1TDQo+PiAgICAJICB3aWxsIGJlIGNh
bGxlZCBhbXMuDQo+Pg0KPj4gICAgY29uZmlnIFNFTlNPUlNfQU1TX1BNVQ0KPj4gLQlib29sICJQ
TVUgdmFyaWFudCINCj4+ICsJYm9vbCAiUE1VIHZhcmlhbnQiIGlmIFNFTlNPUlNfQU1TX0kyQw0K
Pj4gICAgCWRlcGVuZHMgb24gU0VOU09SU19BTVMgJiYgQURCX1BNVQ0KPj4gICAgCWRlZmF1bHQg
eQ0KPj4gICAgCWhlbHANCj4gDQo+IFRoYW5rcy4gSXQncyBhIGxpdHRsZSBjbHVua3kuIEZvciBl
eGFtcGxlIGlmIHlvdSBhbnN3ZXIgbm8gdG8gYm90aA0KPiBwcm9tcHRzLCBpdCBzdGlsbCBzZWxl
Y3RzIFNFTlNPUlNfQU1TX1BNVSwgYnV0IEkgZ3Vlc3MgaXQgZG9lc24ndCByZWFsbHkNCj4gbWF0
dGVyLg0KPiANCj4gICAgJCBtYWtlIG9sZGNvbmZpZw0KPiAgICAuLi4NCj4gICAgICBBcHBsZSBN
b3Rpb24gU2Vuc29yIGRyaXZlciAoU0VOU09SU19BTVMpIFtOL20veS8/XSAoTkVXKSB5DQo+ICAg
ICAgICBQTVUgdmFyaWFudCAoU0VOU09SU19BTVNfUE1VKSBbWS9uLz9dIChORVcpIG4NCj4gICAg
ICAgIEkyQyB2YXJpYW50IChTRU5TT1JTX0FNU19JMkMpIFtZL24vP10gKE5FVykgbg0KPiAgICAj
DQo+ICAgICMgY29uZmlndXJhdGlvbiB3cml0dGVuIHRvIC5jb25maWcNCj4gICAgIw0KPiAgICBt
YWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2hvbWUvbWljaGFlbC9saW51eC8uYnVpbGQnDQo+
ICAgIA0KPiAgICAkIGdyZXAgU0VOU09SU19BTVMgLmJ1aWxkLy5jb25maWcNCj4gICAgQ09ORklH
X1NFTlNPUlNfQU1TPXkNCj4gICAgQ09ORklHX1NFTlNPUlNfQU1TX1BNVT15DQo+ICAgICMgQ09O
RklHX1NFTlNPUlNfQU1TX0kyQyBpcyBub3Qgc2V0DQo+IA0KPiANCj4gSSdsbCB0dXJuIHRvIHRo
aXMgaW50byBhIHBhdGNoIGFuZCBhZGQgeW91ciBTb0I/DQoNClRoYXQncyBmaW5lIGZvciBtZS4N
Cg0KWW91IGNhbiBhbHRlcm5hdGl2ZWx5IHVzZSBTdWdnZXN0ZWQtYnk6ICwgSSBkb24ndCByZWFs
bHkgbWluZC4NCg0KVGhhbmtzDQpDaHJpc3RvcGhlDQo=
