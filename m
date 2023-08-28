Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 133C778A7DB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 10:39:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=VO2rCsZg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZ3rD6sH2z3brX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 18:39:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=VO2rCsZg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::631; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20631.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::631])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZ3qJ48MVz30BZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 18:38:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hN6jW+QPlfcJ2T6i09RUT+kmqdzTD1I/wpouPdcl2SzVGhvrohJNaVLHTTJDNkkUDQ0XhzB2nZ+cckl6VUqGv1Z21XpRv47BTjwkkDJ8S3rq6o94DcZ/ayi9tYb8yhb3kzw26/iAmMPmhdM1/u93LKl8Qp/rCuwJM6y/ig8ICmXjCxXoyjq1tc4XteTtotw1CCJZ8t6X4H9H+rnYx+LVpQhCPv0pBgoh4qviZ/hJk7nY64PyG/fGP3bfjzfgPOQUZc4KLbhG4BNtkW3pkK28tbILnFGVwaUJgTrOm1+iaPZUO0BZC7cCZm/bp9TriLZIl1XKVYcEzusWoXWvcmpduw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miQcqVQAIK40XZWAirwwaTMjLdUH5f2pre4v1Eyeu9k=;
 b=BtTF3xuyhVEXrzmtom+JfCAG0V8LADXKkQbbX6aCm0v83Q2WMrHeGJwYQai7jMdiFrpGXx3ez2aYKekSFGWTDQSEoKXvkhxXb7Qfvs1H1vBTLopcqxMIfpM0SSNXxwWKl+Ttn1CqvCup3EOvzuxOFU96KT1WNg+UcyPNsZgY5u8J8eDYELScczaBe1o2LMq2+No8TC6SUVFEq7CoyUMJurr6bGy9gO5yhsyS3RA84yoEfw3CtMZ1EFtyvceKdiibBxwpjMaj4A58ww0aL0Zid1R5sbFywAV2tZ/bUCR4UUnikB66jWMPUU2bEZiMU3HQjMkM7Y6bioZhbbeztPw94A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miQcqVQAIK40XZWAirwwaTMjLdUH5f2pre4v1Eyeu9k=;
 b=VO2rCsZgg7YjIAI/i3+GaQfRHnN3frfhobZzTu3+s09WNX867tlMOaTK0VX7aP/f3FwwOmcdzxSdNqbvkCkvrXGBcY+zKOgRxC5kJXyaS8N1ce8C1cAVrtXBnfUcmz1vzKNDWnQ6lAnTpUY82AMIwYcaKSZjUFnZBvLjntgi0wH6Lqx42448szLcC2H+Y4nbP7juV09/CkERmangu8gqtMHmlBe8szb0D6KAX08MC9igJPNC3nw81YoMQiQ6Y+MA1EhCIuVUmv9lqqrgNGbCAcFBd1LpHhcGccFOtn0vynypJGIXGmfapOQZLTOUMgm8RtZhl2jaEvq2xRmGkPvUoQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2487.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 08:37:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 08:37:55 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Alexandra Diupina <adiupina@astralinux.ru>, Zhao Qiang
	<qiang.zhao@nxp.com>
Subject: Re: [PATCH v2] fsl_ucc_hdlc: add a check of the return value from
 hdlc_open
Thread-Topic: [PATCH v2] fsl_ucc_hdlc: add a check of the return value from
 hdlc_open
Thread-Index: AQHZ2YmRzikzhm7cMk6JFcaykijhh6//Ys6A
Date: Mon, 28 Aug 2023 08:37:55 +0000
Message-ID: <896acfac-fadb-016b-20ff-a06e18edb4d9@csgroup.eu>
References: <20230828082703.3246-1-adiupina@astralinux.ru>
In-Reply-To: <20230828082703.3246-1-adiupina@astralinux.ru>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2487:EE_
x-ms-office365-filtering-correlation-id: a17dccbe-d5cd-4edb-79d3-08dba7a21394
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  CJLTJLAmn+TYYLUHHjCe5/l4DdYx7dOazlbEBrB4UqtlS1wdJ50yOZpfCktp6+HKvfxKSwGIBw26W4INUc9L9v3g7hFYDcDz7z5VjCPljZMj0izVXYl2BcrH1He/nLllewB0myLiP8dUc7v40xQKV8c1KGEpJwX80jfZ9F/PLtSep3emRmNfz3r95nKDjklXFSmCrXJsb4r7f18RFU0GutJCJ1irAX99mOROi0dEit4lj6fnVudTylhK4JA3Wn3mp+WvNWsb6Nss27zcDcBsJA6kTZPwVns1ZoovWGklmn1PlbewLDGIIXboJaBm02ygdPNRgoE+u9lHb6wBuyv91DNzMoilEIMGBck1RmqSY71OCPS/PF8fq+UKBh+zZCnZ/WX5duGtmmIOwgJGa/dlJrMgKfNbKWeq7F1rp+/wP7EDQu2w/0x7y8vVkdhNeWQ5aF7U2pPoWA+PTdP0r8fGlQCmQM7ZbGEVYVDa2nKUnJlkFh8+6pVa2St9R71hw8VAx0oeoUNB9v23X3urP29En8QDrRxc6EHpyL4p7jNPsKPuhX7RnekB2sa18y0F+gevsS4SZsy6L5vHVg7QxerjEMRr41/Npdit6Tc210tCSJmmcgvS0FxcVp6ObdFTgH9+oVARD9Wki8vm2mGrUxtf3HhZ5QroMzvHB4xbIaHXmmAyjjiO4wAKvPZwytrgOfWU
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(376002)(346002)(39850400004)(1800799009)(186009)(451199024)(71200400001)(6506007)(6486002)(66574015)(86362001)(31696002)(36756003)(26005)(2616005)(83380400001)(6512007)(38070700005)(7416002)(316002)(5660300002)(110136005)(91956017)(66946007)(76116006)(66556008)(38100700002)(64756008)(54906003)(66476007)(66446008)(41300700001)(44832011)(31686004)(966005)(2906002)(122000001)(478600001)(8936002)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bHJ3QVVxQ0ZWT2VucFNmUkhxTUVTUVoxZ3QrYWsremk3MHkzSEVLWVU3cEhD?=
 =?utf-8?B?NjZMNnp1LzM2cjAwQUFJcTNmdnFhQldBM0gxTVNRbDNBMmhuaHV6dlJBaC9l?=
 =?utf-8?B?RE1qVXU1Uk16OFRMOVBTZmxyeXk3dnA3NDE0K2w2OEVUMUM4T254OUdQemNF?=
 =?utf-8?B?Y3ovVW9jUmlaU2lzZGRvSGN5SjF6aWFqQXRnekQxV1ZhWGliRlhQeFV6dXU4?=
 =?utf-8?B?c29UdWRrOHVpTDYvOVRRWEtuVTVQN0thSUgvbjYrbm9yTVIySWlidmhTL1Bm?=
 =?utf-8?B?R0g4M2RUZFcva0JsZXMrOEJDenlEdkRHZnhaSC9wOFd2MHhsV2gzK0pqdzdl?=
 =?utf-8?B?Nyt1M3p5ZTlOMDRiWE5JUU5uTHNKOXB4VmZId1BOdTRveTZZMGpzQ1h0MHJV?=
 =?utf-8?B?VGlhQkdEZUZ5ZmRYWVF3YWtINXJVczQ5OXgwMUJ2d2VlcDNYQXZIT0dITENq?=
 =?utf-8?B?T2hwdzlGell4QnRFdVFDN0Q0c1E3Ly9ERDZBRVM2NmlLQW9nSVNJWlhIV2tV?=
 =?utf-8?B?YmlmYWtvZmxCamRTR3lGVENSb082RHY2bTZiaW85MHhFV1hOckozbHUxYzI1?=
 =?utf-8?B?dXJaK09RdFA0ckZuV0xqaFJtbGtEZjBuM2hJaU8ybXNtdDBoUmZVWkxhQldk?=
 =?utf-8?B?NEorQTNaZVpIWkVBSm1UcXAvTUJYNmN1ZFpkUVpycjFmQnNUU3FpUkNGVHE2?=
 =?utf-8?B?RXBMMnNtUzhrY05qcjFpOUhIYVdQU01CcHRzdVU5K3V4NWVWajdhaVdKeWNo?=
 =?utf-8?B?WGQxbUkvZE9mRDcwRDdZS3N1VVk2WjBwbjExZENpbXIreDhNR0JhMzFUODBU?=
 =?utf-8?B?Sm4vUk9pWU9Tei9tVEVZU2RRdEtGT1VTa3M1bmQ5dUdhWjYrbWV0Ung2UEJy?=
 =?utf-8?B?VUtPV2IwdWYycnNySko4SENQelNrWW5VZ0g5YlR4Vnc4ZElwTVh3SlUxeXly?=
 =?utf-8?B?MlZTM3BEazRMVVVGeDZ0UDI5dHFQZ211LzRSSDh1OU4wT2ZkejhJVTJha3V6?=
 =?utf-8?B?cDg0aFBPLzRwZmY2d1FaUjVPck91akVwcWpSb0RqNVBxUENHeVVqS2VIUmRa?=
 =?utf-8?B?Z0o5OGc0NzFzbzlhQ3psQUp6QjlNbTkyQi9na1lWZzRGcGpzSjBveFVydTB2?=
 =?utf-8?B?dVVET09sdUx4TDlqRTlWNzhpb0VUeVNYWHdpUUxIM0tZTmozdW1xQmRXUTNN?=
 =?utf-8?B?R2hLbm9nVGF1OW16N01XN0NDRUFLTm51d1NlYUEzUGcwS2dZb2dHd1o3RFNB?=
 =?utf-8?B?aFhCdXkwQk4yaWxHMytlaitYVzlXVEJMTGpOOGZQTXc4TklaY0ExSlRWR0ZO?=
 =?utf-8?B?c0JlRG41OVJHeTE1aExtUWxBMFI4cWhVa2JjOHA1RFVYbjFtakdKWWpjTnYy?=
 =?utf-8?B?bVpESllSYjY5ZXp0SnNvQjVZOXd5dzZVR3VvODBmQytseG9KQk15SFl5NEpW?=
 =?utf-8?B?OXU3VjJpYXdRbEE4Q0hOSWN4b2NycGNnWWF6QjFUZU1UV3BHWnBsdzFJMmNI?=
 =?utf-8?B?MFlXMTRyMTl3Y3VROGoxbVVKQXJhOFU5d0VKbml0M2NCZ1BsR3Zzci9SaGY0?=
 =?utf-8?B?cEFXMVozbGFXSXFxcWFuT2hjT2xkZnhialF3VnpvQmp4Wk9VUFNrR2g5T0lt?=
 =?utf-8?B?d045NndabHVsZlQ3ZzZJT3RiRXpiTUVqNmRMWS9uY1dZNGpHOS9jbkRrZVpy?=
 =?utf-8?B?V2ZyMWE2OVdRVUNFL2doeHppZnFNL1p6cXQwVitZcFhYWmI5WWxCL1c1MGpo?=
 =?utf-8?B?WW4xd21HNkRXS0lsVHUzUTdkakhCYUY2K1o5WGtvbWQzQXQ5SGp0TWNoczdp?=
 =?utf-8?B?Wmd2RlFQdFUvak83cnlKZ0N1NHRWbEttTEppUFpTVkNNY2JaWGZCT21VL0U2?=
 =?utf-8?B?cWQzQUxzQTQ5MVgrU1dNbmk5V1Z4UmFIVXVXWHU1ZnltdWE5WGJRM1Z5eUFJ?=
 =?utf-8?B?UmVhTVNIaTIvdnVVd0ZER0RwUWttclpiem1GbW1tSTVlZUJBVjYwM3pJRVRG?=
 =?utf-8?B?MEtvOXJMeStZWjRJMXBGY1BJSy9BMmY2TDVVZ1E4czYrQStwYk8wVFJKbDN1?=
 =?utf-8?B?N2tHSnZ1OUQ5eHA1UGxWU0tHTjdKMkQ4dE9sbUtlTjZxWHNNYkhqK0lrOW1o?=
 =?utf-8?Q?L+qiBioqGPAarKz7pgDDunJv7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <61A39E2CB21B4F448953D63FBE1C8D4A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a17dccbe-d5cd-4edb-79d3-08dba7a21394
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 08:37:55.7821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NoWzfRQx8AX0hZYEzuLPeKwzPfsdOnY5440J5mj48K6/iysV2eZEua2teKUtKlvHJGcFvWpyuuCbha9SA2ayycbbhabWCLJKrvywa6/ivOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2487
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
Cc: "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzA4LzIwMjMgw6AgMTA6MjcsIEFsZXhhbmRyYSBEaXVwaW5hIGEgw6ljcml0wqA6
DQo+IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIGFkaXVwaW5h
QGFzdHJhbGludXgucnUuIETDqWNvdXZyZXogcG91cnF1b2kgY2VjaSBlc3QgaW1wb3J0YW50IMOg
IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0KPiBQ
cm9jZXNzIHRoZSByZXN1bHQgb2YgaG9sZF9vcGVuKCkgYW5kIHJldHVybiBpdCBmcm9tDQo+IHVo
ZGxjX29wZW4oKSBpbiBjYXNlIG9mIGFuIGVycm9yDQo+IEl0IGlzIG5lY2Vzc2FyeSB0byBwYXNz
IHRoZSBlcnJvciBjb2RlIHVwIHRoZSBjb250cm9sIGZsb3csDQo+IHNpbWlsYXIgdG8gYSBwb3Nz
aWJsZSBlcnJvciBpbiByZXF1ZXN0X2lycSgpDQo+IA0KPiBGb3VuZCBieSBMaW51eCBWZXJpZmlj
YXRpb24gQ2VudGVyIChsaW51eHRlc3Rpbmcub3JnKSB3aXRoIFNWQUNFLg0KPiANCj4gRml4ZXM6
IGMxOWI2ZDI0NmEzNSAoImRyaXZlcnMvbmV0OiBzdXBwb3J0IGhkbGMgZnVuY3Rpb24gZm9yIFFF
LVVDQyIpDQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyYSBEaXVwaW5hIDxhZGl1cGluYUBhc3Ry
YWxpbnV4LnJ1Pg0KPiAtLS0NCj4gdjI6IFJlbW92ZSB0aGUgJ3JjJyB2YXJpYWJsZSAoc3RvcmVz
IHRoZSByZXR1cm4gdmFsdWUgb2YgdGhlDQo+IGhkbGNfb3BlbigpKSBhcyBDaHJpc3RvcGhlIExl
cm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+IHN1Z2dlc3RlZA0KPiAgIGRyaXZlcnMv
bmV0L3dhbi9mc2xfdWNjX2hkbGMuYyB8IDcgKystLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQoNCkkgdGhpbmsgeW91IGRpZCBhIG1pc3Rh
a2UuIEEgdjIgc2hvdWxkIHN1YnN0aXR1dGUgdjEsIG5vdCBjb21lIGluIA0KYWRkaXRpb24gdG8g
aXQuIFNvIHlvdSBoYXZlIHRvIHNxdWFzaCB0aGlzIHBhdGNoIGludG8gcHJldmlvdXMgb25lIA0K
YmVmb3JlIHJlc2VuZGluZy4NCg0KQ2hyaXN0b3BoZQ0KDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9uZXQvd2FuL2ZzbF91Y2NfaGRsYy5jIGIvZHJpdmVycy9uZXQvd2FuL2ZzbF91Y2NfaGRs
Yy5jDQo+IGluZGV4IGNkZDk0ODljNzEyZS4uNDE2NGFiZWE3NzI1IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL25ldC93YW4vZnNsX3VjY19oZGxjLmMNCj4gKysrIGIvZHJpdmVycy9uZXQvd2FuL2Zz
bF91Y2NfaGRsYy5jDQo+IEBAIC03MDgsNyArNzA4LDYgQEAgc3RhdGljIGludCB1aGRsY19vcGVu
KHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpDQo+ICAgICAgICAgIGhkbGNfZGV2aWNlICpoZGxjID0g
ZGV2X3RvX2hkbGMoZGV2KTsNCj4gICAgICAgICAgc3RydWN0IHVjY19oZGxjX3ByaXZhdGUgKnBy
aXYgPSBoZGxjLT5wcml2Ow0KPiAgICAgICAgICBzdHJ1Y3QgdWNjX3RkbSAqdXRkbSA9IHByaXYt
PnV0ZG07DQo+IC0gICAgICAgaW50IHJjID0gMDsNCj4gDQo+ICAgICAgICAgIGlmIChwcml2LT5o
ZGxjX2J1c3kgIT0gMSkgew0KPiAgICAgICAgICAgICAgICAgIGlmIChyZXF1ZXN0X2lycShwcml2
LT51dF9pbmZvLT51Zl9pbmZvLmlycSwNCj4gQEAgLTczMiwxMiArNzMxLDEwIEBAIHN0YXRpYyBp
bnQgdWhkbGNfb3BlbihzdHJ1Y3QgbmV0X2RldmljZSAqZGV2KQ0KPiAgICAgICAgICAgICAgICAg
IG5hcGlfZW5hYmxlKCZwcml2LT5uYXBpKTsNCj4gICAgICAgICAgICAgICAgICBuZXRkZXZfcmVz
ZXRfcXVldWUoZGV2KTsNCj4gICAgICAgICAgICAgICAgICBuZXRpZl9zdGFydF9xdWV1ZShkZXYp
Ow0KPiAtICAgICAgICAgICAgICAgcmMgPSBoZGxjX29wZW4oZGV2KTsNCj4gLSAgICAgICAgICAg
ICAgIGlmIChyYykNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOw0KPiArICAg
ICAgICAgICAgICAgcmV0dXJuIGhkbGNfb3BlbihkZXYpOw0KPiAgICAgICAgICB9DQo+IA0KPiAt
ICAgICAgIHJldHVybiByYzsNCj4gKyAgICAgICByZXR1cm4gMDsNCj4gICB9DQo+IA0KPiAgIHN0
YXRpYyB2b2lkIHVoZGxjX21lbWNsZWFuKHN0cnVjdCB1Y2NfaGRsY19wcml2YXRlICpwcml2KQ0K
PiAtLQ0KPiAyLjMwLjINCj4gDQo=
