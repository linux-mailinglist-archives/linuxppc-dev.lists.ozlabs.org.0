Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 945648007FB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 11:13:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=JA6WKMw6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShTQm0XLyz3cW9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 21:13:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=JA6WKMw6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::627; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20627.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::627])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShTPw4TSYz3cQr
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 21:12:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1Rg000pT9TEaxoWbIH7JAbH/s2iJO8j7xFZRS8yBtrSAPKqnimWydNrghINKD18a7eQc3JBYij3mnp03nwWeIXqtLj+GgzAe4/FE9wrR1/4hQc6RavNZa4Mcqi9kZwT1REVcEqz/mYl73aVF00gK2oGIcleKG/vC0rCeHHPf06WWzdIcMp6SxD5/uOse0twmlm+BvPLJtf6jHm2H7je1J+16OWxnC5QLJ6HH7f+oNXE83xnMdy4qaeDQNd36TqlDdUOdrRCAYckCP4a8SDdlh6czG6gjIF1fLaiXflkv1Nb/31gg1ePnjHV3UBIUB9RrsZCghPGa5onNFKGUvIrdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=boBFCkr0HPWYtJTZjBl9PzdNmexLHym0k7AU7ruokP0=;
 b=hLfdy4mVF/FaQiQDH4PMAslu3onefjwe5sAdeHi5RkUybrG0TPmZXgs9K3y0TPa8D4GZHLxJFVrH4EbRJNaVkWZH7B7/I9Le2D3gxlnU48klBCouZ1HneEGrq5AVWb9S32mf1BzZ2bAxVjZCYRJSVb7H/OuY9e13TP4tdjcWO6MjXQ3tbIyEQuRHs1uH1mYroXCzbblEIO6i3cafQl5pVEWF0KluykTswAoJWtWg1kEX4t6UJe1//MF1jn+XEiiJgK57MoN8FxNWf065a8UTHh/xhP65YO19pkPouDQnYh3RNdJXTqCu/WY+/tqicTZGVPE1rPHvdVpOwjR6rdxenQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=boBFCkr0HPWYtJTZjBl9PzdNmexLHym0k7AU7ruokP0=;
 b=JA6WKMw67wx2AJGW+Ihq73CNOmUABNL/YfZkkMSf7K+kf73VAzclWNAwuciZrr+dtOdEXv1w186q8ojALHUiSwn+IY9nfy6sfjpQMy1ijObw2pSRffmA5e3oHEPCDvQK29wngqBydAm3WfYGfK19cAc7YVVSYaCUAx5J9N4qsScT2RvfxZXuVg22yGn16j1BwMIhpOdSGEo7dKffq8xzYkkublG1qKOF/mFOaReOohhhytXV12GdzmE8PH8ZRzuguATjbYO8OdX4phNsaQDD21tThhXwGf3ksi1501/dI9d6RCaAD/eYP8F/gEGw051csnct0Wt+3qOqmwn5Q+l7Hg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2058.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:168::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.15; Fri, 1 Dec
 2023 10:11:52 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.014; Fri, 1 Dec 2023
 10:11:52 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/irq: Allow softirq to hardirq stack transition
Thread-Topic: [PATCH] powerpc/irq: Allow softirq to hardirq stack transition
Thread-Index: AQHaI4v/GaSM9UOZTUyS6175YVG11bCS+SMAgAE7lYCAAAHLAA==
Date: Fri, 1 Dec 2023 10:11:52 +0000
Message-ID: <1e696926-a6de-48dc-b9ec-213091b82839@csgroup.eu>
References: <20231130125045.3080961-1-mpe@ellerman.id.au>
 <77e18f24-7f06-4d91-b57c-af8837be0420@csgroup.eu>
 <87fs0m1bmg.fsf@mail.lhotse>
In-Reply-To: <87fs0m1bmg.fsf@mail.lhotse>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2058:EE_
x-ms-office365-filtering-correlation-id: d03f12ac-33f6-4042-e5b7-08dbf255f0a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  U+1vfqqu77LMTNSprTSqNtQwSYnls1Lb3SKHVwlJ4B6ysz1Fm/1cJO+SO1h15IhwNaw/fy0D2oV4NQy8h5vAjy5XBLRkvQ8IHfKGd9FIwxAWuflplTV0nmKm0mPPF7C8FrAQrULT57+uN0XoqGiycwSvAeAgUkzpCZDN+mcOvF1oKu6RAYIxVD1NccH+NBwuHsUubHXxckXcTkz8L44hSa+5PzmnuTiP4Ax0A7WIyMggb9Tm5qWBxRsgnSPfrBbKtFRGGA9Gq/ryIVYT/be+KueLGG8Gp2+uLzvXtieIqpGULZupe1MbPaiaV/vjP/tYi+bLFzN96hO8NQ/bx6SkbVOjqUhYzZe2cXykjA50VWByDL7aMRLRLYf9f2puAzo1J7F/acNbQLJA/FAraf7ZAbioXgiO6ujeiS8HoBJibBv84XqeBN1IaHrDuO4hxNrQ6W3YK5ISKrd7zU+LGn5xInNQtbYWPbY8zKdNSXal6WpdPAcg8rd802pup6d4ZpkJMULt4Y83IVukT6eW/l6zha6WSwUVEjZT2k4ILDGWq8V2nPCiFO/GvpUjI9xH/c0Od78E/RQOzyvX+QWljNgTxkap7Uy6UjA6+NPLPRsVthUn/D/yVnUeeO5CCDJo9GHB6J0vJpAEmto8+D7lFDHwX13GS8SqqFPqV2ZPiXBiVYM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(136003)(39850400004)(346002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(31686004)(36756003)(122000001)(38100700002)(86362001)(31696002)(38070700009)(6486002)(478600001)(91956017)(966005)(8936002)(4326008)(8676002)(66476007)(316002)(66446008)(64756008)(66556008)(66946007)(110136005)(71200400001)(6506007)(76116006)(6512007)(2616005)(5660300002)(41300700001)(2906002)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?N0FiM3poZHg0T1grb2hKT0RibUY3TTJwSmVpY3NiOThlbWY5U3A2MXlvNWNF?=
 =?utf-8?B?RkFFbjlRQ1RwL2VSbUNxZUhqMXFVb1dPeDQ3UnFXNmR1UzFQMHZwRy8zVEx2?=
 =?utf-8?B?N1Z4b3lxK29DTUpGV1ZsdWE4bmdKN0doZEFDcjJqRlVxZk9JNmRaa08zdmlJ?=
 =?utf-8?B?eUdrZjNRNVlIbkl5T1NLTUk3NHdyN3ZEYlhnQzlwYnVSVGhhOGM2VUxVYXR1?=
 =?utf-8?B?MFJGRVhqeHlOeURaaTNIZjl0aFA0aEZzbSttZ0VQYzZxTzJvenZEVGFJR0hW?=
 =?utf-8?B?OExDRjBqaWhpL0lTNjlBNU9YeVQ4YUNEdnY2aEN5OWUrbEpETmlqdU5MSFFG?=
 =?utf-8?B?ZkE3aElyUlRqRVZXQWo2RVhHWWJuV0lvVWtyZkFPMCtkS1N6ZUt4VFVqVStx?=
 =?utf-8?B?MG5GejdIa3dKeGMza2pmamkzbHRldDV2aC9wdFlETE9NY08wMVpxeHBXT1g4?=
 =?utf-8?B?cDNSaVFGSWJQSFdlS1R3Y1dObHMycS9YU2NLblhqUEcrUkNoQUNYdUcxOGtz?=
 =?utf-8?B?b2pKU1FSRy85SXZYeUtoUHMrQnRUa2dqMkR3Ly9XWHE2WDBYMTE4RTdEeU1H?=
 =?utf-8?B?bnNjMVZOR05nQUwvOFRtdTBXdWY4MS9Sc3AyYXJ1c0Z6bldvdXV6am5EVkow?=
 =?utf-8?B?bzM1OVh3TmxYS1pjN2VqcjNMelRUWEtBMFZrOHA0Mkh4ZGNlSWc1bnVxKzcz?=
 =?utf-8?B?N2xGdEdMQWFaN25sellpKzNwWTNoRnFhdGpabVVleHB0OXJEMGdDbmw5Mmpn?=
 =?utf-8?B?dnVZS3o1dS9mcTJhRFdVSzFEVTNxbXMwVjdwbnNPNEUvRFE1TzhEamZzb21L?=
 =?utf-8?B?ZlJyTHBxaEd3MmxoVmYxcWdDaGZhUVZwK0prZDRCRXpRWWM4Zm1KYzNSR0wv?=
 =?utf-8?B?cmxWWUw4SUc2d2JEajhNdFVBMlZlYncyWFVLZmF1T0hXYnNXTUZCaTh3TWpL?=
 =?utf-8?B?V1JFMjlpdnpZY2dBVGtVU0l6eHEralE3dmJveFUzbTByZXQxWmIzWGx0cG5I?=
 =?utf-8?B?aUV6NU9qN3dqd1BUc1ZPOURNbkFOeEowZkVTc2xScW9icTNmaHh6V1d6SmFa?=
 =?utf-8?B?QldvbTBHOXJxWGFnNHgrbHhSMm5jbnQ5VkhndFNLY1JBU0hNVUh3QlFDNFBY?=
 =?utf-8?B?cUR1WnhXNnlVVFMrbktuRmIxQXRMcEZjb0NYOXZkbkZPSy9JV0hrVzNrRjcr?=
 =?utf-8?B?WWVEZFJEd1Fzd0Z1dWxyRmFaZUYwRk1CMXVKYUtFVnVpQ0o0M0FtMURNSlVn?=
 =?utf-8?B?QndTTC9tczNJTGRGRjYzcmxDN09oM0tuRWFPa2lHME5kUXFFaGk2cTJJUk0y?=
 =?utf-8?B?a0h6MU5SZEh2d2IzYXZxOFpiTzhFVm4zWTltcWhRbWVYUU8wN3NiQytIakc0?=
 =?utf-8?B?dTFzY1Nhb3NTMzlxdkVLS01Ed0xDMjhncW82dlRQSkc0WWtxdVg0SjBkSjJD?=
 =?utf-8?B?M2xVRXlsM0F1RjJhbGhHQm9HWXRLekljcGFGd2xXR3RveEZDQWV1bm8rODhT?=
 =?utf-8?B?MkRaTDVES3YzZHhCdlRGUmMyZ0xRTHlLUFhTcUFhaUJWS29yMmt2YW9oOEZj?=
 =?utf-8?B?QTE2azB0aUtNVHIxdmxldWs2SmlFaDZlR25sTk5DVitvZm5qS00yM0xFdlZQ?=
 =?utf-8?B?S0Z1SlhWZ1VMTFdEL2JTVHFBbGhxQ1J5M1FRNFhzcCs5dHFvRDE4ckxNekxz?=
 =?utf-8?B?dmx5Qm8zNTRyTXpvY2hhYUVSYXgrc0JVVGNlMWRmdjBsZmhpUTZBTjJXdXNC?=
 =?utf-8?B?NVhIODJEM1lnZ2F6Uyt3OFJUK1hmTzFtN0FTUFNqd0tNUGd2Z3Z5MXhOc2pZ?=
 =?utf-8?B?Z0M0TE1JamgxV0R0OFdzQktiNFhFMFc3dnV4STQ2VnlvRnpJUGRvRS94bVEz?=
 =?utf-8?B?SGR3TUs2NlloR2phN0VhRGRJVXJYeE5oOXBwZHdGTnY3TDdlTW5NRE5nQldT?=
 =?utf-8?B?cVlBcHdITk4wSWZINmNiUTU1QTVPZ2dDMmJtN1hGWFpnek1odk13cTRodDlp?=
 =?utf-8?B?WW1Md3EyU3lFSWw5YUVlMzlNR1NGRkI4dnNITi8wSk5oUUsvUi93bkdsbERJ?=
 =?utf-8?B?L1pONnMrL201amJreG9vOGFSV2tNN0RwdTFEbXR5OVJCRE0zWEE2MmVSb0k5?=
 =?utf-8?B?b2tiYkdvTDVMNkYzbytlN2tlRTVLeWYrTlQyZFdZNDczQ2dtcWdnb0VCTjV5?=
 =?utf-8?B?TXVFZDlvNVhLdDNaMjVudy9nL3RJeFoxM1BJQjNVL2RMYTNvODhHS0d2d1JJ?=
 =?utf-8?B?cjdGWEJySG84Ky9MemhzeTc5ajZRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB7970F435D69E4DAA6E80237B161FC5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d03f12ac-33f6-4042-e5b7-08dbf255f0a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 10:11:52.5970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m3924ySBAX1Q+s4ZMuHNF3ou1NfM7yv5bRKvXbXiwcu//5miQu8u9qNV6Ywr0CTokw1r+Ky4eyQxXhqDsAg6ORCwePua+IfkGOYkVo53sKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2058
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
Cc: "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzEyLzIwMjMgw6AgMTE6MDUsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBMZSAzMC8xMS8yMDIzIMOgIDEzOjUwLCBNaWNoYWVsIEVsbGVybWFuIGEgw6ljcml0wqA6
DQo+Pj4gQWxsb3cgYSB0cmFuc2l0aW9uIGZyb20gdGhlIHNvZnRpcnEgc3RhY2sgdG8gdGhlIGhh
cmRpcnEgc3RhY2sgd2hlbg0KPj4+IGhhbmRsaW5nIGEgaGFyZGlycS4gRG9pbmcgc28gbWVhbnMg
YSBoYXJkaXJxIHJlY2VpdmVkIHdoaWxlIGRlZXAgaW4NCj4+PiBzb2Z0aXJxIHByb2Nlc3Npbmcg
aXMgbGVzcyBsaWtlbHkgdG8gY2F1c2UgYSBzdGFjayBvdmVyZmxvdyBvZiB0aGUNCj4+PiBzb2Z0
aXJxIHN0YWNrLg0KPj4+DQo+Pj4gUHJldmlvdXNseSBpdCB3YXNuJ3Qgc2FmZSB0byBkbyBzbyBi
ZWNhdXNlIGlycV9leGl0KCkgKHdoaWNoIGluaXRpYXRlcw0KPj4+IHNvZnRpcnEgcHJvY2Vzc2lu
Zykgd2FzIGNhbGxlZCBvbiB0aGUgaGFyZGlycSBzdGFjay4NCj4+Pg0KPj4+IFRoYXQgd2FzIGNo
YW5nZWQgaW4gY29tbWl0IDFiMWI2YTZmNGNjMCAoInBvd2VycGM6IGhhbmRsZSBpcnFfZW50ZXIv
DQo+Pj4gaXJxX2V4aXQgaW4gaW50ZXJydXB0IGhhbmRsZXIgd3JhcHBlcnMiKSBhbmQgMTM0NmQw
MGUxYmRmICgicG93ZXJwYzoNCj4+PiBEb24ndCBzZWxlY3QgSEFWRV9JUlFfRVhJVF9PTl9JUlFf
U1RBQ0siKS4NCj4+Pg0KPj4+IFRoZSBhbGxvd2VkIHRyYW5zaXRpb25zIGFyZSBub3c6DQo+Pj4g
ICAgLSBwcm9jZXNzIHN0YWNrIC0+IGhhcmRpcnEgc3RhY2sNCj4+PiAgICAtIHByb2Nlc3Mgc3Rh
Y2sgLT4gc29mdGlycSBzdGFjaw0KPj4+ICAgIC0gcHJvY2VzcyBzdGFjayAtPiBzb2Z0aXJxIHN0
YWNrIC0+IGhhcmRpcnEgc3RhY2sNCj4+DQo+PiBJdCBtZWFucyB5b3UgZG9uJ3QgbGlrZSBteSBw
YXRjaA0KPj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRl
di9wYXRjaC82Y2Q5ZDhiYjIyNThkOGI1MTk5OWMyNTg0ZWFjNzQ0MjNkMmI1ZTI5LjE2NTcyMDM3
NzQuZ2l0LmNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldS8NCj4+ID8NCj4gDQo+IEkgZGlkIGxp
a2UgeW91ciBwYXRjaCA6KQ0KPiANCj4gQnV0IHRoZW4gd2UgZ290IHJlcG9ydHMgb2YgZm9sa3Mg
aGl0dGluZyBzdGFjayBvdmVyZmxvdyBpbiBzb21lIGRpc3Rybw0KPiBrZXJuZWxzLCBhbmQgaW4g
YXQgbGVhc3Qgc29tZSBjYXNlcyBpdCB3YXMgYSBoYXJkaXJxIGNvbWluZyBpbiBkdXJpbmcNCj4g
c29mdGlycSBoYW5kbGluZyBhbmQgb3ZlcmZsb3dpbmcgdGhlIHNvZnRpcnEgc3RhY2suDQoNCkZh
aXIgZW5vdWdoLCBJJ2xsIGRpc2NhcmQgaXQuDQoNCj4gDQo+PiBJIG5ldmVyIGdvdCBhbnkgZmVl
ZGJhY2suDQo+IA0KPiBTb3JyeSwgbm90IGVub3VnaCBob3VycyBpbiB0aGUgZGF5Lg0KPiANCg0K
WWVzIHNhbWUgcHJvYmxlbSBoZXJlIDopDQo=
