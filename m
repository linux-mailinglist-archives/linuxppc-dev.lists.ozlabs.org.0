Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2889C869895
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 15:40:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=kglxTfdY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkgBF6gPMz3vbK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 01:40:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=kglxTfdY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::700; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tkg9T1fCHz3cGc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 01:39:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5lXCChcUuusInnBYqhu0l3yNsEeyV/Zdz5/A/FV2xdZ5ZyHdrTUoG6AfPB03YfuYedDp4yknPTb1MZIjN2bT3bJi7xiVmoSXlax+0D6xLNCpxXJ/pN3aUP2Ha+BcH83S/vgFq5CdrY5+Q1f/BrXSzI8WHpkNQmO8xd1Jix5umHDk//lueBGpyxTltf+2PSwh0ML+L+Gbf4oooOMY6plgi7XwbSNR3DVSwBgEKwrHbqk8lqZrD3lhzoV6fD+sWh8qUX/fdyjEfXsMKjx9abvMTfpT34nQUbu4rmTAH+pz9W9/sIK9lanqPL2584AIOThu8nH7eSkJ4hPQsTBO7xPiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wudxy9U+w0ZYHwyVyptGM0IGlYINb8/zVrmIZojubAQ=;
 b=kYOR0umdy9Dl+ymtUIOErQTmpJFntetFs7nRCpj6JOvqdCkHpL2qTo1woryNo62861zVcNiVxFmNIZOtK0YLX8c5lCnm9ChkOe4R05kKtKT34UjR2mNAn0FIl1uwZc+12Q6DcJi97JC51cWQKXutfc+ow6HdU9mh/F3abGgaKgP9KD+Dm9dwamkDJML2venP8yVjTkyyUSHeyBTY/wCVjNWJ7t5McuCL3QAUHH5N2P4r0gRtGkJaHu1kBQ4n1f76XkTG9rRNhLTjaRPhBKWrtiozWijQ/ZbHWUC8t3Fw/9+ijbd5Xnw9l+lSaqypsK+KywfYmN17zEovOahF2U3QWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wudxy9U+w0ZYHwyVyptGM0IGlYINb8/zVrmIZojubAQ=;
 b=kglxTfdYQrveIo48fb/pV7D/IdnuTDka5nL0yUrUN69hAREdbS2RDUiWeeVzhvGNA6HdO6x1QZs4ZSv136udlamHe2C1sYxz2tcWY18Dbrbskv0rhIQgukc5OWBuJ+lVxUHMzipwnq0LGDTBv1pTyTqQhiJjcAQFvGA8QqO97zV8aQYSNnx+Auy/y0I7pxf3xZocHPWTUCqwz7E6jrHjj9JOoq6YgdvbhUib4fNj5Sp0wPTewF4a6CWn9SSOVIuE+wNJoIKZjV8DVmZOAxq62r8I0iD5QXc4wSO0dXkxjhrHOJpKrwdbQcrcoHyMp3X9ELJJgZ01Kbl9oZUEV8J2PQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2448.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.35; Tue, 27 Feb
 2024 14:38:58 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7316.035; Tue, 27 Feb 2024
 14:38:58 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Subject: Re: Increasing build coverage for drivers/spi/spi-ppc4xx.c
Thread-Topic: Increasing build coverage for drivers/spi/spi-ppc4xx.c
Thread-Index: AQHaaVmCK95ONeBdo0m9TjsdjqM3v7Ed+80AgAAJa4CAADBigIAAAlgAgAAKvwA=
Date: Tue, 27 Feb 2024 14:38:58 +0000
Message-ID: <a9d99374-a118-4f7d-9e31-8cb7db657212@csgroup.eu>
References: <qvuhez7vrcoui7i6s4yohd4ednneuoejcp6tw6iwzeefgpyvd6@fkwwtwozhakf>
 <6fab09e0-1f21-4ada-b5ae-472bf71a1225@csgroup.eu>
 <7ah7rzijbwkvr3hmtqfjh7syxave756usevumrypqspn27wgyv@ln42tyqxo5ai>
 <2fe58bc5-2f1b-4f51-8f01-fa397a1c9291@csgroup.eu>
 <645ngchmigftlvbvquprqqjcn2frogkihdplbmngnz6hvywefo@rvthwy2epwg3>
In-Reply-To: <645ngchmigftlvbvquprqqjcn2frogkihdplbmngnz6hvywefo@rvthwy2epwg3>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB2448:EE_
x-ms-office365-filtering-correlation-id: 800557bd-9ee6-48b7-593d-08dc37a1d518
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  mVolHcNvT3/sRlKBYaanTQ2OCeMdItR8riPeIxObqyv5Spgg9juRrz29l5AZVLU0gL/qkLEHpnKzeQ69VTD1rACoXVpIPLj2ca4JO7XS98/e+6OvVT+dvmd5/ZbS9wJZtcZ0fH6UnsyNutPOszd9WSjNWcIQVn1BMROWUYjQyJkdMS+/yV8TOvBv7O/TkGqKLBpPz8b8lkq2Ez5Om/CtRf9paY+6fUVrIx63BA14J2Jelf4o3vAPaaBdMLfjlItFBa5XYQeV1cDE8YEAOBDQmXfF9yvQhPoKiw3X0r4dZShbeDEuvi9QxDkn67EozibG1Q8jgqHhjmcWvIbh/2RdXJFUuP/qG9ZCLtE0/hGm/dhCM9UcRzf3XPXnW/QkD65mm4FfrT670z2yzVsg/BYs23PsU5WcNZitbud3zX6MrME7j3PDWrVemPaqlGDCMuTaTD5dBZy1i+8/dJC7rEwQbRj/nfOuAFuyqp0XK44L0axqew5lpLhpfnledRtlkvnTRzHLowCXXhqPtOyPe9BBw96obOmZD8lzjLqTC/567XNk9pWYhmuQr4XOMuv6nGr/p/lRxQ7xkbO4INW5YfBZK5cPbymcxrLmkZfsvoefCvNBpzn7QNruP/Sh4UGVp6Nw8RLuYAjRTOzpwg61Z5+RvD3ofBYnKMEI1FdLNOQDc9khM9yoH3LqEf9H1HHbQB8F71v6DtXjRswSOYqHF850K8y31kPYQziJEhssmaj2PsI=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YXppcUt6S3VIQ203S21yaDc4T2ViN0QybzFaNk1maUZLWncxVzlnRW9YZzZn?=
 =?utf-8?B?NkE3RHFMSnBlVlRKSWMxajd4SUJkSjgrZWUrQWhETlFscmRYYWpCMTFuWG9S?=
 =?utf-8?B?bnNNVDJyeWpPU040QkdvMWorZHBBcFFoN25PL1h5Q2tpOFlnWXVmZXZWeFNM?=
 =?utf-8?B?N05hWHZLd1Y1bjB6L3RyY1BpdjgzYnlYOXFheW92ekF4MXZhWFFZMFdFY2pV?=
 =?utf-8?B?Y2t0VDVIeFI2TGdXcXBCSndlSDVEWklkbm1vNGpicWFnaTVYVmNTVERvaVNC?=
 =?utf-8?B?NTJETVhXS2NzTVdrajMweGJ1TEk4TFVxZDhzeHNHNlZHR09ORUVLQzBOVmZT?=
 =?utf-8?B?TTlqbWtUbmM5RFJBd1B4RXJrRHpKZm53UjQxUk5HY1NpdmFCTHVWZjFlWFJn?=
 =?utf-8?B?R3VDR0FCWWxCdUVSbWxrRVVsVFFzNnRrais5VC9Wa3NiYUlmWUVzMUVBN0NX?=
 =?utf-8?B?b2V2cXFXNTg4a2tPbU5UTnhwaTVSUjlKWC9LblVnR2dxakdmT3lMdzFacjdo?=
 =?utf-8?B?TzBFbU00UjFmSktrYjF2c3Q4ZEE4OGQwR003aEYwcGVFTmFpU2krOUJzeTVt?=
 =?utf-8?B?dndhbUxFWDU2L3ZIUmtOdEhNSVVESVQxRWw4TXFEU1ZjdU02YlpPZEoyaGZx?=
 =?utf-8?B?R0NmK2VtUTJ4VEs3bmRrYWt6ai9PcFA2bTFCVTd5dHQ1eGU5a01YY1NldCtL?=
 =?utf-8?B?d1lnS1BrMlY1QlV6VFp6Skh2QlIyK1JLVU9pdVhPSFkrK0hiTWJKMUxrSUlW?=
 =?utf-8?B?WnRDYU5jM0FoQWswb3AvZ3JTS1dqN0hwREFvUDY1V3hHeC9UUEZBSTNJNnQ0?=
 =?utf-8?B?dTh3a1N4M1VhN3VUVmVhUEorVzVaY0tOMm5lUHh4VFF5NEJ0L1JXckVaUTgz?=
 =?utf-8?B?azVPNmhpMDgrYys4Y01NQVFLOEovRUkrN0NiY2JJcEhDYzFVZ1g0Q0NkOEl5?=
 =?utf-8?B?NW9YZHYyWldNR3JHZnpsTFJ5NnBjSVF6Q3RoQUFyR3ljOU4zY3pBVHB6Q3NB?=
 =?utf-8?B?OG5sQU1USmtZYTlXVzM5YnEzczg2WHIvUmNNUkNoWTQvNXZJVVVnbWg4elBw?=
 =?utf-8?B?NnJFVnJwQXRUWStyOW15NXV6Uzl6ZThCdjhoZUxKOEt0ODFHR1RldlE3eUFQ?=
 =?utf-8?B?RTJ2dFdCT1FiU1pKOXhzZXlVV2htM2phcjcraXA2Z1dad0FVdmJpaTc0KzhM?=
 =?utf-8?B?ZUJxQlZVd3JReUNQV0VJVEJKMUZnK3Y3bmwwWllXRWlzbHk2MEVwUk5DZm0z?=
 =?utf-8?B?OWZwNzlOUXYzcGZRT2ZXQ01BWHUzYUlwUGJGRFVvTUVrc2l5eStoc2VHazJs?=
 =?utf-8?B?ZmNNWGlnUEdMaWlXTVZiTVhPUkUzcitsQ05CSlVmZGtFV2Rya2JDdGJKbWpQ?=
 =?utf-8?B?Y2pRYk1WcFh5dWw5M216WldTYk9maGJWM25BYkhQUHR0MGpialN5V0ZlR1Qy?=
 =?utf-8?B?VlYvdHpnV1ZFajNpNkx5NSt3RnhvNXRzVGhFQVJUdGlQRFdjUG44ZXo5NWVC?=
 =?utf-8?B?RWllNHdmNzdrNGI1by9heTNxYVBZSmF1RU5FZFptd2RueUd3T0lwRmpwa0Nu?=
 =?utf-8?B?TDFRdkhxUk9Ndi9oWU9XWUZjVW1KSXdXTHc3Q2dQN2ZRUHpxeFVZMlpuM09Z?=
 =?utf-8?B?Mng5NjVhOHFIREljaGpqNDFOQ2x1a01Uem5mcWs1ekFsYkpZZEovNXdnMUp6?=
 =?utf-8?B?OVF3RVFXV09OYWtyQVJEUHdkcW1nRStHY3dWcFdlODdLellNZkNSZVFxUzNn?=
 =?utf-8?B?UEowYjdLcVBwTDNzS29oYkp5YkZScWtPNFphbTI4TC95RXVEekJmeTRSS05R?=
 =?utf-8?B?d1ZGK0xnZ2pVWEkxZ0tzQTA5eWRyYmxJeDJNbmhqWkQxclVnZTFMRFVLWDdh?=
 =?utf-8?B?RGh4NU01VWlDTk5WcHFZSklJTUEvMXp4ZTVtbTNMWUtNUkRET2hMYmZoY0pv?=
 =?utf-8?B?emw0QVJXUjJqYlZsV09nZEZzVDR4dmR3dDRCRzZJajN5cXZiSkUrRy9nazBO?=
 =?utf-8?B?QzYvRURkcUc3a1dQczRiMWN2TG02WXM2MFdOY0VLT3ByaEcwOXdFQWI1UnJX?=
 =?utf-8?B?TTVlRERLNHduK2dsN0FFMlhadmdYUFF4dVRTRG1aK0hiNk9IS0ZSaGs1MXpr?=
 =?utf-8?B?ckVNM0pMOSt0QWRtMFRzWEFNUEJ3T0daQ2JXMTJzYVZIVzNFamd6RWVocm1j?=
 =?utf-8?B?U0lwVWRCSVR3NzQ1dmRmL3FoQVRFMmNzbm1uNjJrWStvUTVrOFNyMUw2RkEw?=
 =?utf-8?B?MmVRSEEyS3pVUTBsQk5EWlF1UzR3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <735EC82B5EC2B84B829C244C8D0A6827@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 800557bd-9ee6-48b7-593d-08dc37a1d518
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2024 14:38:58.3820
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aj/x0kpIN4TeMlKLxtzlxpeTcG8oxe4HWpWiiyN5sY+KRnqxUj32rxOEKWAqs9IU0YozeLmPjjvxA1zPKpFt+8CZo36Pp0sbTRVE1J6nkVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2448
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
Cc: Nicholas Piggin <npiggin@gmail.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Mark Brown <broonie@kernel.org>, "Naveen N.
 Rao" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzAyLzIwMjQgw6AgMTU6MDAsIFV3ZSBLbGVpbmUtS8O2bmlnIGEgw6ljcml0wqA6
DQo+IE9uIFR1ZSwgRmViIDI3LCAyMDI0IGF0IDAxOjUyOjA3UE0gKzAwMDAsIENocmlzdG9waGUg
TGVyb3kgd3JvdGU6DQo+Pg0KPj4NCj4+IExlIDI3LzAyLzIwMjQgw6AgMTE6NTgsIFV3ZSBLbGVp
bmUtS8O2bmlnIGEgw6ljcml0wqA6DQo+Pj4gSGVsbG8gQ2hyaXN0b3BoZSwNCj4+Pg0KPj4+IE9u
IFR1ZSwgRmViIDI3LCAyMDI0IGF0IDEwOjI1OjE1QU0gKzAwMDAsIENocmlzdG9waGUgTGVyb3kg
d3JvdGU6DQo+Pj4+IExlIDI3LzAyLzIwMjQgw6AgMDk6NDYsIFV3ZSBLbGVpbmUtS8O2bmlnIGEg
w6ljcml0wqA6DQo+Pj4+PiByZWNlbnRseSB0aGUgc3BpLXBwYzR4eC5jIGRyaXZlciBzdWZmZXJl
ZCBmcm9tIGJ1aWxkIGVycm9ycyBhbmQgd2FybmluZ3MNCj4+Pj4+IHRoYXQgd2VyZSB1bmRldGVj
dGVkIGZvciBsb25nZXIgdGhhbiBJIGV4cGVjdGVkLiBJIHRoaW5rIGl0IHdvdWxkIGJlDQo+Pj4+
PiB2ZXJ5IGJlbmVmaWNpYWwgaWYgdGhpcyBkcml2ZXIgd2FzIGVuYWJsZWQgaW4gKGF0IGxlYXN0
KSBhIHBvd2VycGMNCj4+Pj4+IGFsbG1vZGNvbmZpZyBidWlsZC4NCj4+Pj4+DQo+Pj4+PiBUaGUg
Y2hhbGxlbmdlIHRvIGRvIHNvIGlzIHRoYXQgc3BpLXBwYzR4eC5jIHVzZXMgZGNyaV9jbHJzZXQo
KSB3aGljaCBpcw0KPj4+Pj4gb25seSBkZWZpbmVkIGZvciA0eHggKGFzIHRoZXNlIHNlbGVjdCBQ
UENfRENSX05BVElWRSkuDQo+Pj4+Pg0KPj4+Pj4gSSB3b25kZXIgaWYgZGNyaV9jbHJzZXQoKSBj
b3VsZCBiZSBkZWZpbmVkIGZvciB0aGUgUFBDX0RDUl9NTUlPIGNhc2UsDQo+Pj4+PiB0b28uIEkg
dHJpZWQgYW5kIGZhaWxlZC4gVGhlIGJlc3QgSSBjYW1lIHVwIHdpdGhvdXQgZXh0ZW5zaXZlIGRv
Yw0KPj4+Pj4gcmVhZGluZyBpczoNCj4+Pj4+DQo+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL2Rjci1uYXRpdmUuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9k
Y3ItbmF0aXZlLmgNCj4+Pj4+IGluZGV4IGE5MjA1OTk2NDU3OS4uMTU5YWI3YWJmZTQ2IDEwMDY0
NA0KPj4+Pj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Rjci1uYXRpdmUuaA0KPj4+
Pj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Rjci1uYXRpdmUuaA0KPj4+Pj4gQEAg
LTExNSwxNSArMTE1LDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX2RjcmlfY2xyc2V0KGludCBi
YXNlX2FkZHIsIGludCBiYXNlX2RhdGEsIGludCByZWcsDQo+Pj4+PiAgICAgCXVuc2lnbmVkIGlu
dCB2YWw7DQo+Pj4+PiAgICAgDQo+Pj4+PiAgICAgCXNwaW5fbG9ja19pcnFzYXZlKCZkY3JfaW5k
X2xvY2ssIGZsYWdzKTsNCj4+Pj4+IC0JaWYgKGNwdV9oYXNfZmVhdHVyZShDUFVfRlRSX0lOREVY
RURfRENSKSkgew0KPj4+Pj4gLQkJbXRkY3J4KGJhc2VfYWRkciwgcmVnKTsNCj4+Pj4+IC0JCXZh
bCA9IChtZmRjcngoYmFzZV9kYXRhKSAmIH5jbHIpIHwgc2V0Ow0KPj4+Pj4gLQkJbXRkY3J4KGJh
c2VfZGF0YSwgdmFsKTsNCj4+Pj4+IC0JfSBlbHNlIHsNCj4+Pj4+IC0JCV9fbXRkY3IoYmFzZV9h
ZGRyLCByZWcpOw0KPj4+Pj4gLQkJdmFsID0gKF9fbWZkY3IoYmFzZV9kYXRhKSAmIH5jbHIpIHwg
c2V0Ow0KPj4+Pj4gLQkJX19tdGRjcihiYXNlX2RhdGEsIHZhbCk7DQo+Pj4+PiAtCX0NCj4+Pj4+
ICsNCj4+Pj4+ICsJbXRkY3IoYmFzZV9hZGRyLCByZWcpOw0KPj4+Pj4gKwl2YWwgPSAobWZkY3Io
YmFzZV9kYXRhKSAmIH5jbHIpIHwgc2V0Ow0KPj4+Pj4gKwltdGRjcihiYXNlX2RhdGEsIHZhbCk7
DQo+Pj4+PiArDQo+Pj4+PiAgICAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRjcl9pbmRfbG9j
aywgZmxhZ3MpOw0KPj4+Pj4gICAgIH0NCj4+Pj4+ICAgICANCj4+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3NwaS9LY29uZmlnIGIvZHJpdmVycy9zcGkvS2NvbmZpZw0KPj4+Pj4gaW5kZXggYmM3
MDIxZGEyZmU5Li45YTBhNWU4YzcwYzggMTAwNjQ0DQo+Pj4+PiAtLS0gYS9kcml2ZXJzL3NwaS9L
Y29uZmlnDQo+Pj4+PiArKysgYi9kcml2ZXJzL3NwaS9LY29uZmlnDQo+Pj4+PiBAQCAtODEwLDcg
KzgxMCw4IEBAIGNvbmZpZyBTUElfUEwwMjINCj4+Pj4+ICAgICANCj4+Pj4+ICAgICBjb25maWcg
U1BJX1BQQzR4eA0KPj4+Pj4gICAgIAl0cmlzdGF0ZSAiUFBDNHh4IFNQSSBDb250cm9sbGVyIg0K
Pj4+Pj4gLQlkZXBlbmRzIG9uIFBQQzMyICYmIDR4eA0KPj4+Pj4gKwlkZXBlbmRzIG9uIDR4eCB8
fCBDT01QSUxFX1RFU1QNCj4+Pj4+ICsJZGVwZW5kcyBvbiBQUEMzMiB8fCBQUEM2NA0KPj4+Pj4g
ICAgIAlzZWxlY3QgU1BJX0JJVEJBTkcNCj4+Pj4+ICAgICAJaGVscA0KPj4+Pj4gICAgIAkgIFRo
aXMgc2VsZWN0cyBhIGRyaXZlciBmb3IgdGhlIFBQQzR4eCBTUEkgQ29udHJvbGxlci4NCj4+Pj4+
DQo+Pj4+PiBXaGlsZSB0aGlzIGlzIGEgc3RlcCBpbiB0aGUgcmlnaHQgZGlyZWN0aW9uIChJIHRo
aW5rKSBpdCdzIG5vdCBlbm91Z2ggdG8NCj4+Pj4+IG1ha2UgdGhlIGRyaXZlciBidWlsZCAoYnV0
IG1heWJlIG1ha2UgaXQgZWFzaWVyIHRvIGRlZmluZQ0KPj4+Pj4gZGNyaV9jbHJzZXQoKT8pDQo+
Pj4+Pg0KPj4+Pj4gQ291bGQgc29tZW9uZSB3aXRoIG1vcmUgcG93ZXJwYyBrbm93bGVkZ2UganVt
cCBpbiBhbmQgaGVscCAoZm9yIHRoZQ0KPj4+Pj4gYmVuZWZpdCBvZiBiZXR0ZXIgY29tcGlsZSBj
b3ZlcmFnZSBvZiB0aGUgc3BpIGRyaXZlciBhbmQgc28gbGVzcw0KPj4+Pj4gYnJlYWthZ2UpPyAo
SWYgeW91IGRvIHNvIGJhc2VkIG9uIG15IGNoYW5nZXMgYWJvdmUsIHlvdSBkb24ndCBuZWVkIHRv
DQo+Pj4+PiBjcmVkaXQgbWUgZm9yIG15IGVmZm9ydCwgY2xhaW0gaXQgYXMgeW91cidzLiBJJ20g
aGFwcHkgZW5vdWdoIGlmIHRoZQ0KPj4+Pj4gc2l0dWF0aW9uIGltcHJvdmVzLikNCj4+Pj4NCj4+
Pj4gV2hhdCBhYm91dCB0aGlzID8NCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJw
Yy9pbmNsdWRlL2FzbS9kY3ItbW1pby5oDQo+Pj4+IGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNt
L2Rjci1tbWlvLmgNCj4+Pj4gaW5kZXggZmM2ZDkzZWY0YTEzLi4zOGI1MTVhZmJmZmMgMTAwNjQ0
DQo+Pj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9kY3ItbW1pby5oDQo+Pj4+ICsr
KyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9kY3ItbW1pby5oDQo+Pj4+IEBAIC0zOCw2ICsz
OCwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZGNyX3dyaXRlX21taW8oZGNyX2hvc3RfbW1pb190
IGhvc3QsDQo+Pj4+ICAgICAJb3V0X2JlMzIoaG9zdC50b2tlbiArICgoaG9zdC5iYXNlICsgZGNy
X24pICogaG9zdC5zdHJpZGUpLCB2YWx1ZSk7DQo+Pj4+ICAgICB9DQo+Pj4+DQo+Pj4+ICtzdGF0
aWMgaW5saW5lIHZvaWQgX19kY3JpX2NscnNldChpbnQgYmFzZV9hZGRyLCBpbnQgYmFzZV9kYXRh
LCBpbnQgcmVnLA0KPj4+PiArCQkJCSB1bnNpZ25lZCBjbHIsIHVuc2lnbmVkIHNldCkNCj4+Pj4g
K3sNCj4+Pj4gK30NCj4+Pj4gKw0KPj4+DQo+Pj4gVGhlIGRvd25zaWRlIG9mIHRoYXQgb25lIGlz
IHRoYXQgaWYgd2UgZmluZCBhIG1hdGNoaW5nIGRldmljZSB3aGVyZQ0KPj4+IGRjci1tbWlvIGlz
IHVzZWQsIHRoZSBkcml2ZXIgY2xhaW1zIHRvIHdvcmsgYnV0IHNpbGVudGx5IGZhaWxzLiBJcyB0
aGlzDQo+Pj4gZ29vZCBlbm91Z2g/DQo+Pg0KPj4gSSBkb24ndCBrbm93IHRoZSBkZXRhaWxzIG9m
IERDUiwgYnV0IGl0IGxvb2tzIGxpa2UgdGhpcyBzcGktcHBjNHh4DQo+PiBkcml2ZXIgaXMgcmVh
bGx5IHNwZWNpZmljIHRvIDR4eCwgd2hpY2ggaXMgUFBDMzIuDQo+Pg0KPj4gRG8geW91IHJlYWxs
eSBuZWVkL3dhbnQgaXQgdG8gYmUgYnVpbHQgd2l0aCBhbGxtb2Rjb25maWcgPw0KPj4NCj4+IE1h
eWJlIGl0IHdvdWxkIGJlIGVhc2llciB0byBoYXZlIGl0IHdvcmsgd2l0aCBwcGMzMl9hbGxtb2Rj
b25maWcgPw0KPj4NCj4+IE9yIGV2ZW4gZWFzaWVyIHdpdGggcHBjNDR4X2RlZmNvbmZpZyA/DQo+
IA0KPiBUaGUgcmVhc29uIEknZCBsaWtlIHRvIHNlZSBpdCBpbiBhbGxtb2Rjb25maWcgaXMgdGhh
dCB0ZXN0aW5nDQo+IGFsbG1vZGNvbmZpZyBvbiBzZXZlcmFsIGFyY2hzIGlzIHRoZSBjaGVjayBJ
IGRvIGZvciBteSBwYXRjaCBzZXJpZXMuDQoNCkkgdGhpbmsgZm9yIHBvd2VycGMgeW91IHNob3Vs
ZCByZWFsbHkgY2hlY2sgcHBjMzJfYWxsbW9kY29uZmlnIGluIA0KYWRkaXRpb24gdG8gYWxsbW9k
Y29uZmlnDQoNCj4gQWxzbyBJIGFzc3VtZSBJJ20gbm90IHRoZSBvbmx5IG9uZSByZWx5aW5nIG9u
IGFsbG1vZGNvbmZpZyBmb3IgdGhpcw0KPiBwdXJwb3NlLiBTbyBpbiBteSBleWVzIGV2ZXJ5IGRy
aXZlciB0aGF0IGlzIGJ1aWx0IHRoZXJlIGlzIGEgbmV0IHdpbi4NCg0KV2hlbiBJIGxvb2sgaW50
byBkcml2ZXJzL25ldC9ldGhlcm5ldC9pYm0vZW1hYy9jb3JlLmMgaXQgaXMgbm90IG11Y2ggDQpk
aWZmZXJlbnQsIHRoZXkgI2lmZGVmIG91dCB0aGUgY2FsbCB0byBkY3JpX2NscnNldCgpIHdoZW4g
DQpDT05GSUdfUFBDX0RDUl9OQVRJVkUgaXMgbm90IGRlZmluZWQuDQoNCkEgcG9zc2libGUgd2F5
IGlzIHRvIGRvOg0KDQorc3RhdGljIGlubGluZSB2b2lkIF9fZGNyaV9jbHJzZXQoaW50IGJhc2Vf
YWRkciwgaW50IGJhc2VfZGF0YSwgaW50IHJlZywNCisJCQkJIHVuc2lnbmVkIGNsciwgdW5zaWdu
ZWQgc2V0KQ0KK3sNCisJQlVJTERfQlVHX09OKCFJU19FTkFCTEVEKENPTkZJR19DT01QSUxFX1RF
U1QpOw0KK30NCg0KDQpDaHJpc3RvcGhlDQo=
