Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E679860A53
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 06:39:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Cpy6yo7T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgzNH3cngz3vXH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 16:39:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Cpy6yo7T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::700; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgzMR6C8qz3cVG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 16:38:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7PXWWY09PDOaWu3x1zWir06i7wBVITViH/fdOB8xfRYrD7LgvzF7J7tp543Bc0NdVA/RihdhJH5BJ0xRFXMpCCvYim9bom8dQRZxYd7+UjBX63Co0TgdtgrTjJZdhWxUl7ENqR9pj9WAeo3sqw6pvkJYBws+UCkJxl4xM6trhAM7cYevDwtg9vPAL3ozVkv+BiWD7C8Q+M2jNtFr2EqiUTvFWGgbXrISt0bouH5/439d7ePackLZSLCV4DiiC+Si3uhaKxHhmEBqg6pDqGq9V1vQpVeAEkCv6Vg1du/ITb+yUKyWoupdwuSYdlwwszemhQn//Ti6GP/rnqwP3A1Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZeyYhMthn/M8FtSeTVimdX3vpOlquYV5wEbqxx9G3r4=;
 b=kLcV5SZbiDow4trzGcSKgNN8LFEE+qfevxBYEh6nqbEmJUgPbDrTBHrX1SOE4UNPG0G+5mN4okUq4Mr0nXJsm1JLvWtJqF3A753VvHzdzCUNzyA/EFhbRtAKQM8OPkcbjk/ABNsiWjC0tiiuR9OrJd0HCqxjH6spNtTBuK0hYCnVzxGWYbgapU66Ht/k+Ms5iDpnrOrb/BWO9pWwOHBX0FDiIpjFYY4Aq8/IZ1cPi3n0dx1XhMH/FnpIodhynzCmMHe5qLJZ2mSKqLTp4jh7R0JYHLAx7iLhKZwrB7mWS8SiffwYLZKkYvYeHPJZ/zh861EzwEpiiSHcwn1ZWByAoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZeyYhMthn/M8FtSeTVimdX3vpOlquYV5wEbqxx9G3r4=;
 b=Cpy6yo7TQ9XXN6ZbAZ+xnicLZ8J3sfQ14j99rtj8q+FWSFU3+4LICljsm1DV5UNzenhXxTxP5IfPIbDYrCTk38zDUbwfpTK8lY1zfi2qMgvSu3V1T/RxtPIEk1fGtTUaurFPJGmU+c5BZDRYXNzGqiT9+17gp7wIi24gPBBt3lMNbq69rv9gZsMV0/vy5AwdETXoMv2aLQZleOMtykY/LoJ/+HwXfjiFi7dUeSX4H+BAP/aqIPraB//zQXYhaPowVfq2U/GmiI4RuHbJBejirlTX/HoSk26yrEOWayqBnxVFnfK51cBE7VkuWCfHEWun6YIxZi1kLZj9lQJ8+rI3oA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3849.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:12b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 05:38:19 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::46af:917d:3bb2:167e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::46af:917d:3bb2:167e%6]) with mapi id 15.20.7316.023; Fri, 23 Feb 2024
 05:38:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sean Anderson <sean.anderson@linux.dev>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
Subject: Re: [RESEND2 PATCH net v4 2/2] soc: fsl: qbman: Use raw spinlock for
 cgr_lock
Thread-Topic: [RESEND2 PATCH net v4 2/2] soc: fsl: qbman: Use raw spinlock for
 cgr_lock
Thread-Index: AQHaZdeC5vKcuo5tRk2VejKV5WBHHLEXaVAA
Date: Fri, 23 Feb 2024 05:38:18 +0000
Message-ID: <53b401d7-934c-4937-ab83-6732af47668d@csgroup.eu>
References: <20240222170749.2607485-1-sean.anderson@linux.dev>
 <20240222170749.2607485-2-sean.anderson@linux.dev>
In-Reply-To: <20240222170749.2607485-2-sean.anderson@linux.dev>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3849:EE_
x-ms-office365-filtering-correlation-id: 58c43cca-885e-440a-e33d-08dc3431a3fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /fKvm988U+JN8rFEFKjutizwWps+Ji0htJLUjqud5CCmsV8bU4Zr1RM/QgouNLp+XjIgHca17IJtPBNApNB7i6NArO73oCoeAHlvW/coBjwLHckTOTcLSTiQcgZVAGW+3nQAchbgU35APd8DR6/UwaZzrKcpQi5CLmABCNUx8iiW5gisC6e0V+xywVK7QRd/UyUSD0Wb+qdA0AorYfZiNc0mbATmNi7cOqx/QQ4uPNGmnKbhN5Cgw/hpMLtQe3km4E3Zms5UrCDkwCPWJYzqi/6DhD9aBn+/tfGTUOWRGCWp4iA32M5M40PRGjU8Gj3BW+A0IJ9K1lewZ4IjYng1+VtVB8z4zD5aKLdN3Ds0b1LEwftHdyQlaCYOJWb2gthKmJPq3fq8pSrOUuacbdk5CylIFefTlUswkdTix7Eq5rXkUMhc0ymHfvYmob+jsubmOXFfhjiYZtrNTPaHsQmR4IgITmn4vUwY/YkmakveeeAHzQEnF6muktJ2CfBbn3Y+1R3fz7g9N+0iSDpXHicy3l/ZDkip+o5H/DjNRBYzrvuylma4ajbU7J+bPTng8wvqGwNtA7g+OozpjDrQ0m+IcVNhGhokZLAS+o5nPIJEIh0=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RWZoaXBPRUFZSXFwMmJmSis5bk5KUDM0OU5vR0dvVkp0eUlSUHJRUGhqNjNQ?=
 =?utf-8?B?VjFqQ3UyYzFab3FidmR0dVFMc3BCcUxzTTFRcDdEUWY3QzFZZFRLbHBrVEo1?=
 =?utf-8?B?QU1xMUl2OGd2blVaUmVJYS9WSHlRWlZZWlZjdHEwMUtMRis3T3kzb2FOSG9B?=
 =?utf-8?B?ZzBPN01MaWN0Ly8rRGdTMVFNU3BsT01CbHU3a2N3YWx6ZG9KbzQ2bGpFa1Na?=
 =?utf-8?B?WWdEcXcvRkhSSDNKZDliREp1NXBZVkttZFExL0dGMFhLN3pSM29YS0pRMWo0?=
 =?utf-8?B?cVpmbEpZRjQxcWRtaE81ZXUrbTl4TWxYWGRQVi9KanBXOURyT0RKcWVqZEtP?=
 =?utf-8?B?Q2d6dkV3REtnZUlsS2VicHNtTHpOaVo4dC9jT09uZEJLR1NXeTJzUzBETUhL?=
 =?utf-8?B?UEsxRXNtcDZTNC9LVUhZaHFDaTBDV3B0TEhjOExWdVRJbld4dGw5emxaMjFi?=
 =?utf-8?B?OXRSZS9yaUZzTitZd3B5K2duWnVVT0RWTXhDSHlDdWJqN2IxcnlJamsvUWJT?=
 =?utf-8?B?cXFLSm5KK2FDRjNrdTJkMUtWekFybjdsbVYyVnorNHkwcnpXWWx6cU1LaS93?=
 =?utf-8?B?YXd0VkQxUFZmeXZnV1Y0YXl5eWRFZHRUQVVBdHpSRmQyRVJFdFQ3QmRSck81?=
 =?utf-8?B?S1RNVmhNeGgxeVhqQ1hJQ213ZVArSXRiZGdINjNkT2g0d1pZQmdETG5qa0tp?=
 =?utf-8?B?ZGsrRis1TnJRK0NzUnJRcVJBc0hhNkFXeVJseHRQV0Q2MFRKcVlEQU5Yd1p1?=
 =?utf-8?B?ZlhOcG1YOTFodmQvTzkyeGxVcXlnYnlTTmRYNzVYZ0F0UHJsU0dYT3ZWZFQ5?=
 =?utf-8?B?bzZYM1JzMWZSMk5Ja1dNNFhsN3c1TmFsV0NmNjlzbmdMVDdSYitWR1N6dTRr?=
 =?utf-8?B?VUZYL2NFdE5IeklMcnk5UjZCWHdZOWxzM0V1MVVWbGFMQXRqbjdraHNtU3Rw?=
 =?utf-8?B?cHJ3ODZDbU5sVzJsRkVVZ2lPOUNYY1RUb083K3l1emVaWnVGZkNUZU1tR1FO?=
 =?utf-8?B?bnNtWVJKSko3SGpYS1NJWXJDeDU2R01Hei9oSXR5ME80a2JkVUl1WFpteGEv?=
 =?utf-8?B?TTFBUkF1VjVWeWJxNHQwQjVPOG9PNkRiRm5lVmcrcmZrSVdJMjZTUUgwTUxv?=
 =?utf-8?B?WjFUdzlEeWs4VksyWGl0Zy9UMWNWeDk2RDFpVEU1Mjk3RlRhQWo1M2EvSCtq?=
 =?utf-8?B?RlhVd09odXFpUjZWbHMzQ3BzYktmMC80Ui9kdTNtbDgzZXk3S0RNeE5zallz?=
 =?utf-8?B?ODVoYS9tQ21sN1JvVlliUStmalZxNVNBT254YzFrMEhvVlBQMUtxSTBkYStm?=
 =?utf-8?B?WE8yUzVCaDg0RTFMTUNqSVVtejh3VlVvWmdHK28xNHpCempIMXFSNjRQRkpZ?=
 =?utf-8?B?eXBUNHRNMzIwbitDZ0dNS2VodTJCMDNmSnd3VUxoTDVkR3c2bWI5ZUl2a3dC?=
 =?utf-8?B?cjN5S3VuRkNqSUNhQkJjVTlCQklEUUtnbTczUGZRWmZNdVpwMXpZWUQ3V2Vw?=
 =?utf-8?B?cXZPRXgzNHFMaGxIL3p1U2VZVjFZS0dSOWhYWlVaem12bVhRR3hiZ1VBTnJw?=
 =?utf-8?B?MDMwRUxiRXg2SXBJV2ZaelJERWZKbzhZWENtR3ljU0xhMVRzYlYyd3FRTGdx?=
 =?utf-8?B?ZE5NZXpqRlZnbE9HWjFUVWZNMUtBdDYxWVl1NWxhVU9RS1crMmsxV05EbC8v?=
 =?utf-8?B?cHpxZkVSa0xuMGdrZ21seDZtZzNBYmwwaEtnZWE2Q09CdE1BMHRWWGF5aGNB?=
 =?utf-8?B?dDZSSHl0RFpteExJQzh5a1pUL3hiSnQ5TCtkaFRWWmlrblk5QSsvZm1iT1lD?=
 =?utf-8?B?bldzOHRaQnZ3OXZMTjZ6Qnc2ckVlWnlhd0FWbzFqamFsalZ2alRoR0x3cC9j?=
 =?utf-8?B?K0daUHJhL1dXQjhobmE5QVJ6dWFUMHM5U1p3Rzk0ZG9Xa09rMWo2ZndpY0xP?=
 =?utf-8?B?S1RicGZCZTl1dWEwMUtBRVVyMkQ2QldURjBzdXBPYUNzb2laMjBQWGtuRXAw?=
 =?utf-8?B?aEJFaEU0UkdCYzREVElOc3VTcVdDM0NNL3Jtd29PTnZWb2V3dTI1Uzl0VmVn?=
 =?utf-8?B?ZHJwNFU1Zmxlc2Q1NGVDUjRDaTNFV3k1elZRbWgzOUpsMkRSTkFMTElYcitU?=
 =?utf-8?B?R1JDQVBDZUFLNGVWcW9aYlZNVDM2UEFjU1hQZGJBcStFaDNBUVlWWEFHeklJ?=
 =?utf-8?B?SUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E38EA6B23B3C224A8CF524925C69A067@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c43cca-885e-440a-e33d-08dc3431a3fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 05:38:18.8527
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RWXkNaILAsBYWAfzGQW4r8p3qfna+1RoHvWCTqEheoem04+fakZpeFBOHFsKIe6Ebc4oIGuobqADhdn8dxp9YLeFYNW0ePgwu6DEy8A+ktk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3849
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
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, Roy Pledge <roy.pledge@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Camelia Groza <camelia.groza@nxp.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzAyLzIwMjQgw6AgMTg6MDcsIFNlYW4gQW5kZXJzb24gYSDDqWNyaXTCoDoNCj4g
W1ZvdXMgbmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3VycmllcnMgZGUgc2Vhbi5hbmRlcnNv
bkBsaW51eC5kZXYuIETDqWNvdXZyZXogcG91cnF1b2kgY2VjaSBlc3QgaW1wb3J0YW50IMOgIGh0
dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0KPiBjZ3Jf
bG9jayBtYXkgYmUgbG9ja2VkIHdpdGggaW50ZXJydXB0cyBhbHJlYWR5IGRpc2FibGVkIGJ5DQo+
IHNtcF9jYWxsX2Z1bmN0aW9uX3NpbmdsZS4gQXMgc3VjaCwgd2UgbXVzdCB1c2UgYSByYXcgc3Bp
bmxvY2sgdG8gYXZvaWQNCj4gcHJvYmxlbXMgb24gUFJFRU1QVF9SVCBrZXJuZWxzLiBBbHRob3Vn
aCB0aGlzIGJ1ZyBoYXMgZXhpc3RlZCBmb3IgYQ0KPiB3aGlsZSwgaXQgd2FzIG5vdCBhcHBhcmVu
dCB1bnRpbCBjb21taXQgZWYyYThkNTQ3OGI5ICgibmV0OiBkcGFhOiBBZGp1c3QNCj4gcXVldWUg
ZGVwdGggb24gcmF0ZSBjaGFuZ2UiKSB3aGljaCBpbnZva2VzIHNtcF9jYWxsX2Z1bmN0aW9uX3Np
bmdsZSB2aWENCj4gcW1hbl91cGRhdGVfY2dyX3NhZmUgZXZlcnkgdGltZSBhIGxpbmsgZ29lcyB1
cCBvciBkb3duLg0KDQpXaHkgYSByYXcgc3BpbmxvY2sgdG8gYXZvaWQgcHJvYmxlbXMgb24gUFJF
RU1QVF9SVCwgY2FuIHlvdSBlbGFib3JhdGUgPw0KDQpJZiB0aGUgcHJvYmxlbSBpcyB0aGF0IGlu
dGVycnVwdHMgYXJlIGFscmVhZHkgZGlzYWJsZWQsIHNob3VsZG4ndCB5b3UgDQpqdXN0IGNoYW5n
ZSB0aGUgc3Bpbl9sb2NrX2lycSgpIGJ5IHNwaW5fbG9ja19pcnFzYXZlKCkgPw0KDQpDaHJpc3Rv
cGhlDQoNCg0KPiANCj4gRml4ZXM6IDk2ZjQxM2Y0NzY3NyAoInNvYy9mc2wvcWJtYW46IGZpeCBp
c3N1ZSBpbiBxbWFuX2RlbGV0ZV9jZ3Jfc2FmZSgpIikNCj4gQ0M6IHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmcNCj4gUmVwb3J0ZWQtYnk6IFZsYWRpbWlyIE9sdGVhbiA8dmxhZGltaXIub2x0ZWFuQG54
cC5jb20+DQo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwMzIzMTUz
OTM1Lm5vZm5qdWNxanFuejM0ZWpAc2tidWYvDQo+IFJlcG9ydGVkLWJ5OiBTdGVmZmVuIFRydW10
cmFyIDxzLnRydW10cmFyQHBlbmd1dHJvbml4LmRlPg0KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvODd3bXN5dmNsdS5mc2ZAcGVuZ3V0cm9uaXguZGUv
DQo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQW5kZXJzb24gPHNlYW4uYW5kZXJzb25AbGludXguZGV2
Pg0KPiBSZXZpZXdlZC1ieTogQ2FtZWxpYSBHcm96YSA8Y2FtZWxpYS5ncm96YUBueHAuY29tPg0K
PiBUZXN0ZWQtYnk6IFZsYWRpbWlyIE9sdGVhbiA8dmxhZGltaXIub2x0ZWFuQG54cC5jb20+DQo+
IA0KPiAtLS0NCj4gDQo+IENoYW5nZXMgaW4gdjQ6DQo+IC0gQWRkIGEgbm90ZSBhYm91dCBob3cg
cmF3IHNwaW5sb2NrcyBhcmVuJ3QgcXVpdGUgcmlnaHQNCj4gDQo+IENoYW5nZXMgaW4gdjM6DQo+
IC0gQ2hhbmdlIGJsYW1lZCBjb21taXQgdG8gc29tZXRoaW5nIG1vcmUgYXBwcm9wcmlhdGUNCj4g
DQo+ICAgZHJpdmVycy9zb2MvZnNsL3FibWFuL3FtYW4uYyB8IDI1ICsrKysrKysrKysrKysrLS0t
LS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvZnNsL3FibWFuL3FtYW4uYyBi
L2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9xbWFuLmMNCj4gaW5kZXggMWJmMWYxZWE2N2YwLi43ZTkw
NzQ1MTlhZDIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9xbWFuLmMNCj4g
KysrIGIvZHJpdmVycy9zb2MvZnNsL3FibWFuL3FtYW4uYw0KPiBAQCAtOTkxLDcgKzk5MSw3IEBA
IHN0cnVjdCBxbWFuX3BvcnRhbCB7DQo+ICAgICAgICAgIC8qIGxpbmtlZC1saXN0IG9mIENTQ04g
aGFuZGxlcnMuICovDQo+ICAgICAgICAgIHN0cnVjdCBsaXN0X2hlYWQgY2dyX2NiczsNCj4gICAg
ICAgICAgLyogbGlzdCBsb2NrICovDQo+IC0gICAgICAgc3BpbmxvY2tfdCBjZ3JfbG9jazsNCj4g
KyAgICAgICByYXdfc3BpbmxvY2tfdCBjZ3JfbG9jazsNCj4gICAgICAgICAgc3RydWN0IHdvcmtf
c3RydWN0IGNvbmdlc3Rpb25fd29yazsNCj4gICAgICAgICAgc3RydWN0IHdvcmtfc3RydWN0IG1y
X3dvcms7DQo+ICAgICAgICAgIGNoYXIgaXJxbmFtZVtNQVhfSVJRTkFNRV07DQo+IEBAIC0xMjgx
LDcgKzEyODEsNyBAQCBzdGF0aWMgaW50IHFtYW5fY3JlYXRlX3BvcnRhbChzdHJ1Y3QgcW1hbl9w
b3J0YWwgKnBvcnRhbCwNCj4gICAgICAgICAgICAgICAgICAvKiBpZiB0aGUgZ2l2ZW4gbWFzayBp
cyBOVUxMLCBhc3N1bWUgYWxsIENHUnMgY2FuIGJlIHNlZW4gKi8NCj4gICAgICAgICAgICAgICAg
ICBxbWFuX2NncnNfZmlsbCgmcG9ydGFsLT5jZ3JzWzBdKTsNCj4gICAgICAgICAgSU5JVF9MSVNU
X0hFQUQoJnBvcnRhbC0+Y2dyX2Nicyk7DQo+IC0gICAgICAgc3Bpbl9sb2NrX2luaXQoJnBvcnRh
bC0+Y2dyX2xvY2spOw0KPiArICAgICAgIHJhd19zcGluX2xvY2tfaW5pdCgmcG9ydGFsLT5jZ3Jf
bG9jayk7DQo+ICAgICAgICAgIElOSVRfV09SSygmcG9ydGFsLT5jb25nZXN0aW9uX3dvcmssIHFt
X2Nvbmdlc3Rpb25fdGFzayk7DQo+ICAgICAgICAgIElOSVRfV09SSygmcG9ydGFsLT5tcl93b3Jr
LCBxbV9tcl9wcm9jZXNzX3Rhc2spOw0KPiAgICAgICAgICBwb3J0YWwtPmJpdHMgPSAwOw0KPiBA
QCAtMTQ1NiwxMSArMTQ1NiwxNCBAQCBzdGF0aWMgdm9pZCBxbV9jb25nZXN0aW9uX3Rhc2soc3Ry
dWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiAgICAgICAgICB1bmlvbiBxbV9tY19yZXN1bHQgKm1j
cjsNCj4gICAgICAgICAgc3RydWN0IHFtYW5fY2dyICpjZ3I7DQo+IA0KPiAtICAgICAgIHNwaW5f
bG9ja19pcnEoJnAtPmNncl9sb2NrKTsNCj4gKyAgICAgICAvKg0KPiArICAgICAgICAqIEZJWE1F
OiBRTV9NQ1JfVElNRU9VVCBpcyAxMG1zLCB3aGljaCBpcyB0b28gbG9uZyBmb3IgYSByYXcgc3Bp
bmxvY2shDQo+ICsgICAgICAgICovDQo+ICsgICAgICAgcmF3X3NwaW5fbG9ja19pcnEoJnAtPmNn
cl9sb2NrKTsNCj4gICAgICAgICAgcW1fbWNfc3RhcnQoJnAtPnApOw0KPiAgICAgICAgICBxbV9t
Y19jb21taXQoJnAtPnAsIFFNX01DQ19WRVJCX1FVRVJZQ09OR0VTVElPTik7DQo+ICAgICAgICAg
IGlmICghcW1fbWNfcmVzdWx0X3RpbWVvdXQoJnAtPnAsICZtY3IpKSB7DQo+IC0gICAgICAgICAg
ICAgICBzcGluX3VubG9ja19pcnEoJnAtPmNncl9sb2NrKTsNCj4gKyAgICAgICAgICAgICAgIHJh
d19zcGluX3VubG9ja19pcnEoJnAtPmNncl9sb2NrKTsNCj4gICAgICAgICAgICAgICAgICBkZXZf
Y3JpdChwLT5jb25maWctPmRldiwgIlFVRVJZQ09OR0VTVElPTiB0aW1lb3V0XG4iKTsNCj4gICAg
ICAgICAgICAgICAgICBxbWFuX3BfaXJxc291cmNlX2FkZChwLCBRTV9QSVJRX0NTQ0kpOw0KPiAg
ICAgICAgICAgICAgICAgIHJldHVybjsNCj4gQEAgLTE0NzYsNyArMTQ3OSw3IEBAIHN0YXRpYyB2
b2lkIHFtX2Nvbmdlc3Rpb25fdGFzayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+ICAgICAg
ICAgIGxpc3RfZm9yX2VhY2hfZW50cnkoY2dyLCAmcC0+Y2dyX2Nicywgbm9kZSkNCj4gICAgICAg
ICAgICAgICAgICBpZiAoY2dyLT5jYiAmJiBxbWFuX2NncnNfZ2V0KCZjLCBjZ3ItPmNncmlkKSkN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIGNnci0+Y2IocCwgY2dyLCBxbWFuX2NncnNfZ2V0
KCZyciwgY2dyLT5jZ3JpZCkpOw0KPiAtICAgICAgIHNwaW5fdW5sb2NrX2lycSgmcC0+Y2dyX2xv
Y2spOw0KPiArICAgICAgIHJhd19zcGluX3VubG9ja19pcnEoJnAtPmNncl9sb2NrKTsNCj4gICAg
ICAgICAgcW1hbl9wX2lycXNvdXJjZV9hZGQocCwgUU1fUElSUV9DU0NJKTsNCj4gICB9DQo+IA0K
PiBAQCAtMjQ0MCw3ICsyNDQzLDcgQEAgaW50IHFtYW5fY3JlYXRlX2NncihzdHJ1Y3QgcW1hbl9j
Z3IgKmNnciwgdTMyIGZsYWdzLA0KPiAgICAgICAgICBwcmVlbXB0X2VuYWJsZSgpOw0KPiANCj4g
ICAgICAgICAgY2dyLT5jaGFuID0gcC0+Y29uZmlnLT5jaGFubmVsOw0KPiAtICAgICAgIHNwaW5f
bG9ja19pcnEoJnAtPmNncl9sb2NrKTsNCj4gKyAgICAgICByYXdfc3Bpbl9sb2NrX2lycSgmcC0+
Y2dyX2xvY2spOw0KPiANCj4gICAgICAgICAgaWYgKG9wdHMpIHsNCj4gICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgcW1fbWNjX2luaXRjZ3IgbG9jYWxfb3B0cyA9ICpvcHRzOw0KPiBAQCAtMjQ3Nyw3
ICsyNDgwLDcgQEAgaW50IHFtYW5fY3JlYXRlX2NncihzdHJ1Y3QgcW1hbl9jZ3IgKmNnciwgdTMy
IGZsYWdzLA0KPiAgICAgICAgICAgICAgcW1hbl9jZ3JzX2dldCgmcC0+Y2dyc1sxXSwgY2dyLT5j
Z3JpZCkpDQo+ICAgICAgICAgICAgICAgICAgY2dyLT5jYihwLCBjZ3IsIDEpOw0KPiAgIG91dDoN
Cj4gLSAgICAgICBzcGluX3VubG9ja19pcnEoJnAtPmNncl9sb2NrKTsNCj4gKyAgICAgICByYXdf
c3Bpbl91bmxvY2tfaXJxKCZwLT5jZ3JfbG9jayk7DQo+ICAgICAgICAgIHB1dF9hZmZpbmVfcG9y
dGFsKCk7DQo+ICAgICAgICAgIHJldHVybiByZXQ7DQo+ICAgfQ0KPiBAQCAtMjUxMiw3ICsyNTE1
LDcgQEAgaW50IHFtYW5fZGVsZXRlX2NncihzdHJ1Y3QgcW1hbl9jZ3IgKmNncikNCj4gICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gDQo+ICAgICAgICAgIG1lbXNldCgmbG9jYWxf
b3B0cywgMCwgc2l6ZW9mKHN0cnVjdCBxbV9tY2NfaW5pdGNncikpOw0KPiAtICAgICAgIHNwaW5f
bG9ja19pcnFzYXZlKCZwLT5jZ3JfbG9jaywgaXJxZmxhZ3MpOw0KPiArICAgICAgIHJhd19zcGlu
X2xvY2tfaXJxc2F2ZSgmcC0+Y2dyX2xvY2ssIGlycWZsYWdzKTsNCj4gICAgICAgICAgbGlzdF9k
ZWwoJmNnci0+bm9kZSk7DQo+ICAgICAgICAgIC8qDQo+ICAgICAgICAgICAqIElmIHRoZXJlIGFy
ZSBubyBvdGhlciBDR1Igb2JqZWN0cyBmb3IgdGhpcyBDR1JJRCBpbiB0aGUgbGlzdCwNCj4gQEAg
LTI1MzcsNyArMjU0MCw3IEBAIGludCBxbWFuX2RlbGV0ZV9jZ3Ioc3RydWN0IHFtYW5fY2dyICpj
Z3IpDQo+ICAgICAgICAgICAgICAgICAgLyogYWRkIGJhY2sgdG8gdGhlIGxpc3QgKi8NCj4gICAg
ICAgICAgICAgICAgICBsaXN0X2FkZCgmY2dyLT5ub2RlLCAmcC0+Y2dyX2Nicyk7DQo+ICAgcmVs
ZWFzZV9sb2NrOg0KPiAtICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnAtPmNncl9sb2Nr
LCBpcnFmbGFncyk7DQo+ICsgICAgICAgcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnAtPmNn
cl9sb2NrLCBpcnFmbGFncyk7DQo+ICAgICAgICAgIHB1dF9hZmZpbmVfcG9ydGFsKCk7DQo+ICAg
ICAgICAgIHJldHVybiByZXQ7DQo+ICAgfQ0KPiBAQCAtMjU3Nyw5ICsyNTgwLDkgQEAgc3RhdGlj
IGludCBxbWFuX3VwZGF0ZV9jZ3Ioc3RydWN0IHFtYW5fY2dyICpjZ3IsIHN0cnVjdCBxbV9tY2Nf
aW5pdGNnciAqb3B0cykNCj4gICAgICAgICAgaWYgKCFwKQ0KPiAgICAgICAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOw0KPiANCj4gLSAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmcC0+Y2dyX2xv
Y2ssIGlycWZsYWdzKTsNCj4gKyAgICAgICByYXdfc3Bpbl9sb2NrX2lycXNhdmUoJnAtPmNncl9s
b2NrLCBpcnFmbGFncyk7DQo+ICAgICAgICAgIHJldCA9IHFtX21vZGlmeV9jZ3IoY2dyLCAwLCBv
cHRzKTsNCj4gLSAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZwLT5jZ3JfbG9jaywgaXJx
ZmxhZ3MpOw0KPiArICAgICAgIHJhd19zcGluX3VubG9ja19pcnFyZXN0b3JlKCZwLT5jZ3JfbG9j
aywgaXJxZmxhZ3MpOw0KPiAgICAgICAgICBwdXRfYWZmaW5lX3BvcnRhbCgpOw0KPiAgICAgICAg
ICByZXR1cm4gcmV0Ow0KPiAgIH0NCj4gLS0NCj4gMi4zNS4xLjEzMjAuZ2M0NTI2OTUzODcuZGly
dHkNCj4gDQo=
