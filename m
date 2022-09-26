Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BD95EA8FC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:51:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mbm0S0TtYz3c6g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 00:51:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=0aqChwb9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.74; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=0aqChwb9;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90074.outbound.protection.outlook.com [40.107.9.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mblzd67TPz3c5v
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 00:50:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evjmkzLG1gpNU8xUTLY/UPVw0o82wbjA2H3Z9NspImEagWJDuN4LtxEfHb4TNscIQ5mwos/9vbvPhw60MNrreX93i1ZwG512zxsQCcPKbE5jlTgjql1+GxIVh6quzJAVdj0rNnRUMtPUmZIr7/edwgBTjS/JNr7wyY9wk6Ytq9QWFFe/TnPv8MqPSXdKhLVh/JIpXMtsiD/EhQTLgzWWervepRpHug3fTUfT6fMzcl/RVdXp9WxJRV5rHdTLbcIjJf4wKV7AjxtG0DdETary/8y42cqqi5KBR247N8HcbFT1/I1piBTBoN3xjukXjsL2Rmh0b3xjivoCs9lCVaqenA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFlV5jh5hqhPe9H+xvxV1LBEzHeG5Jtgm5TwAdhfNbE=;
 b=mF2iLs5VfAoA3uoFOOM44YdbhCxqxdtXqVYqOWuFP5cYfOX3+hndqnHj9tAwEM9CreDyy66pAgjuADq+2FO3zZl6lQ2SwuAaawa35H7nyOL3LwHhMP8InpsCeSwnHnOnfqpLeCC4OxNC1khb/VLM/AFYt2U/9dtI3NLKbQzfbiVPTkYGIXBiilfyGP6HqYrRwzJfuWyxlbfT3jlBGymH325H4sPPdgTd+L1SD/aehQajEAPfBdJo+kfeGK0Zi6Ky0JIZ0G+1FDS7IYcZFnfYjb6zRINjWRywYwFMWoeB5Q+qX4tWph1tsfg4n8P/Njb+mUu3kaBGPBENUu12OIr8eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFlV5jh5hqhPe9H+xvxV1LBEzHeG5Jtgm5TwAdhfNbE=;
 b=0aqChwb9oUnTviRv1z6T+eCRqzYQP8fvMG0uFAwtVUrTMcO+WxKRinBF5ewIXVu6H9Iu3N4E6jYKlijnWt2H58f63vMV5GTGr5IfEwspG47ffEbdQQkBXAKIzAraawCse36cOfcK+YynHkDZIQIuJFD0Y/0Oe+0unX6a2Q/Pm4C+BtpWPTRJiRrfqkhdv3Uuz5ituvscS8pvKbFcrnqIiqOOTOsgbvH6ltI/LT0VefRuIFifdDiKxIDBFNLdRILoxbYd1YD7WWAqDhrYhww5ucn2ydu85Xj2mMIAm9SXJwcoiGXRG3SnTTUA+rjmGIPchLJ7jmxoNbZFacdehEp8MQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1998.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Mon, 26 Sep
 2022 14:50:03 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%5]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 14:50:03 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 4/6] static_call: Move static call selftest to
 static_call_selftest.c
Thread-Topic: [PATCH v2 4/6] static_call: Move static call selftest to
 static_call_selftest.c
Thread-Index: AQHY0XNfF4BoyfjNuEu3SDLCxiErx63xy5wA
Date: Mon, 26 Sep 2022 14:50:03 +0000
Message-ID: <91b311cd-5e3a-ad15-c5b7-c0889a85c50d@csgroup.eu>
References: <20220926064316.765967-1-bgray@linux.ibm.com>
 <20220926064316.765967-5-bgray@linux.ibm.com>
In-Reply-To: <20220926064316.765967-5-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1998:EE_
x-ms-office365-filtering-correlation-id: 801deb1b-ded7-44de-7d2f-08da9fce6505
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  xD5tAjJ0gmBwTaTeh76CvNoyYkOFKrpjvFd2kjT8pjuwdy1THx87iwg5yA+aFCMD3Xva+ecsns62POaC4kbU05bwTjynZKSPwViE2BzQqZSigmjWYjNufIwqF03hHlxCpz0fNYrxZTSSC1lHnhbMzTkpsAtyPwDKYoCtfJnuuN8ecL2BJ3TfMME6S0MgIdZCxFoFksMoYrlmeBa0KailIHz8pMEYrV0jN38VOqdhECaaW/rUun1kTpzhjTP+Gfzg+MejtuYlaGsUh1d0KHA2/ozCWoONdrQcElsbcog3rpo9tIOzM8e9hyfb8KHxG9UAae+Ut5UMC+RX8vcyaNHyzfezSNqIecj9qSMRJJ06lczFESolRFAL5VklfTMB8vzMsv59KG+srSwrOOFyVSLk5yZJgiOISEw9O1THTW4jx9d4hNutilsiw70OfR2KJkMHaoY281kvJrgbj4n1Fx1y3P17ovuXcU2wBmup0iJtDn3Ss3HZGimgFLiasK1oI2XlGtZ8+hOL4rffG2V+43zMcvQpI/eE9BMRjnunjPRtZFrbn9ghf+/t2lOtdcdmwomD7wCqY6rQeaSb7Rg0MLpG6v5X7hPylfuVIXGB5MrCx1+6RYGf0dqDVPyvZ1KBimxClPYdSCmOvORPuTKd2IIqhZtOxBCY7yHzUyJsGdtGwK+w4HbN83QoItz7Ncn/8fn3SU3/csdav3YrptABbOWVrJ/2z72vV45nhIYJ/XtB+iW4IXtfJrLJusN2I9oDZ7z/R5/0iWx5zYJzehUM6SDYTWy6JQkhi3JZzWz8tfaEqBeLYzRJC9U3S91eXH7aNp/hIcHEtIGNTeWM+ph3aA1ioA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39840400004)(366004)(396003)(136003)(451199015)(36756003)(110136005)(54906003)(31686004)(86362001)(31696002)(38070700005)(7416002)(5660300002)(2616005)(66574015)(38100700002)(122000001)(83380400001)(186003)(6506007)(6512007)(26005)(41300700001)(76116006)(6486002)(478600001)(4326008)(44832011)(91956017)(66946007)(71200400001)(66476007)(316002)(66556008)(8676002)(66446008)(64756008)(8936002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?a1VOdDJqZHduZENlWmlURWRxT2VGWU5scGwzR3d5N3lKenY1NzFsWXVLY2dF?=
 =?utf-8?B?ZldTemRFMmJUa3lTOXlJVkJJaGl6RGoxcno3WktQTXB6SktYaDUrcitQc29n?=
 =?utf-8?B?cTlqZzZtdm5TU3JCSEdGSXJqVzY2N1g4MkZTcnJZeUlvbHE5ci9taEFuRUtK?=
 =?utf-8?B?aW1zaE5rRjlNWDB6WndPdWozeCtPeG5sR3lJdGphNUhqUUhtZWMrNG84Zi9X?=
 =?utf-8?B?SnN6ekUvWitVMXprbllYdXVXbmVYaGVoeTRSenhEUi9IbExMTWF1eDVMVzd2?=
 =?utf-8?B?NTlUMFpjb0tCWlVqTi81dzNWQ1NCOGNmTzRjK2t4T3JENEVQOVhvQkRtWkpO?=
 =?utf-8?B?eWFIRnZDSjBJL21tbVFxR3p3c2JlLzJqYlYzcEdKK3VVVEhjVU9HeHlZNXFR?=
 =?utf-8?B?MmRlU3U5eUFzcDlNYkxDOXQ5T3QxT2V4T1pQZFVZK2xaTWRiU1RCaWZRdDVU?=
 =?utf-8?B?L0xTRnFkQjJNeExGS0k1VXlKYjFKelR0ZWJJWlQ2REcwUDZNSVVHNThEa0RZ?=
 =?utf-8?B?MllqdnVaUWJ2dG5EWDdHZEJUK1V3NjJTU01FUDk1RWhYcTh1SHpTVXlNeDhM?=
 =?utf-8?B?NC8xcHgwWlhzMmJiMG5hTkpEdHk2d1lTL25YdkpOTDRKclhHZ1BiS3AxQ3lx?=
 =?utf-8?B?VGE5U0liYzc0bTVwYjVOL09pRkYzaVF3ZFlYbUx3LzNjVHdJVXZjdW1DV1Iv?=
 =?utf-8?B?L1hMVlk1djcreUMzV1NQZ0tybmltSFNTNVlLMnp6blBmRTN6VTQvUkFLM0lI?=
 =?utf-8?B?VjhvNFpHVUZlWXBzWUFwVC81TFJCZ2pBRnV0eTBEdEIvUWpQZFlwZkM2VUk0?=
 =?utf-8?B?Z3lIUUVKYmhubDlMRmhDZGZ0TFVaUmZ3RHlkWlNBNXdnS0h3U2ZwSHJSaG9l?=
 =?utf-8?B?UDZlcVVHaGJJZUtOU25VNEV4U0x2eWlsc0F3TGFLcm9GcDNBaXFKMGszZTc4?=
 =?utf-8?B?VGV4aUY1d3NVdjVWcWw2OU5XdzJhR1pFSnl1TmM3bktJLzZ3RFlhYlI1dHdQ?=
 =?utf-8?B?R3JLRkZ2MW9FalVyaml0cWhMekRKNWhLRzFyelppbmNvWElkK3RaYS93VlIx?=
 =?utf-8?B?RDVOTXovdE5XanZYbVovMWxScHVERnlKVTVqN2tvb1ZXZEVWalhtUHdOU3BN?=
 =?utf-8?B?QzNiL1A0ZHJrcFRLWlFoallMalpKUE1ZeEtvdUJrSWRHeXRJYVJnOWVYcm1N?=
 =?utf-8?B?NG9HWUxMa3ZjY1dyS0hhaW16dHg5WWlLNWpRamdZSmluRFZWdG9XaEVONUxD?=
 =?utf-8?B?c3A4RVYyT01STWcxaC9PSm5nUCszMHdNdWZwK3FNZ3d1MkhEK3BicmlvcEN1?=
 =?utf-8?B?SHFmakJnQ3RiaWQ0NFcxNUJwNmJrcis0K3JLZnhGb0NkN21NdG9QN2d2OVhj?=
 =?utf-8?B?dU9QNFNLRUpLbEhJZ3o2ck5pSnBhQ0RZbnA5NXZrL3NjMmx3SEFTVW01YjUr?=
 =?utf-8?B?anc3VlA0MTZWQ2pCMWJqR0twQXZkZEk5ZEV0L2k0cC9yR25sakMrcDRMdEZp?=
 =?utf-8?B?Q3dqalNPeGtSRFpWU2ZGS0w5THJIUUF1bWVlaTRRT3N2SzdEcTEyVmo1QnZi?=
 =?utf-8?B?d1VTVHI0SnlkMHRqVloydzFDOUIrYjYxOFFBaEYyZkhjdjFKTEVJTnBYUmpQ?=
 =?utf-8?B?MVozRmlFWXYrMWhMdFhTZ2g2SGdsYlNDZnoxZzhFeXVaQnMxSTV3UlFRUFo3?=
 =?utf-8?B?YWhJREpzd00xNkZXcGh3K1RxSzBTdU5UR0hBV01ob0hma2p4WGpnbVhZRlhG?=
 =?utf-8?B?Z3VsY2l6MCtHdW43V3ZkTnMxZkpuc1VQbGJvWkJOelNOWnYwSks2MjB5SCtW?=
 =?utf-8?B?cFB2VVhHMDR0bUdBbjgxM0VIQTZZRHNwU25EYTJyam8zYU1aWXVqd3R3aVpv?=
 =?utf-8?B?Y3FsMy9HTTc5cDJ4UzBpVy9tTXB2TVl0V2pGaTg4U3RmZnhJWDNYQ2hXQWxi?=
 =?utf-8?B?TUVFSnFuQUlhTWZYZC9lcEpaZnpHbVN4NFlnbG1tZnlVRUJYZDBOZnBDZFZB?=
 =?utf-8?B?YUU1UytvdFNWVTZRQXBvTjR1QjNVMStYNVFPYkpqRGhIaDk2V3duQXpPNE5P?=
 =?utf-8?B?TTFqZ1d5QmFJbXZmamlWQW5zd1R5WWtTTzVTN1pXS3JaS3QreUlVY3Q0ZDZw?=
 =?utf-8?B?NUxVTndGRTBPdk5iVG5Rc1FPVGNaMDNVTlBYUXN2eUNSeVBlM2hKQ24rbkdZ?=
 =?utf-8?Q?Zoxv8G0/+P6T7+/hVTl1aD4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0576193D4DA3A647BA02C102364195EA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 801deb1b-ded7-44de-7d2f-08da9fce6505
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 14:50:03.3122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jwnQp7cocOWRggs1P6CSIfBK9g0dBMcJWuHrZPXsFQQgc7OhJTDlzOJdXCzyTi17TuTbxwn0SFDeMDYJpNORs6mnJQti/DsE8VCDF6cSlXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1998
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

DQoNCkxlIDI2LzA5LzIwMjIgw6AgMDg6NDMsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
VGhlc2UgdGVzdHMgYXJlIG91dC1vZi1saW5lIG9ubHksIHNvIG1vdmluZyB0aGVtIHRvIHRoZQ0K
PiB0aGVpciBvd24gZmlsZSBhbGxvd3MgdGhlbSB0byBiZSBydW4gd2hlbiBhbiBhcmNoIGRvZXMN
Cj4gbm90IGltcGxlbWVudCBpbmxpbmUgc3RhdGljIGNhbGxzLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQmVuamFtaW4gR3JheSA8YmdyYXlAbGludXguaWJtLmNvbT4NCg0KSSB0aGluayB5b3UgZ290
IGEgUmV2aWV3ZWQtYnkgZnJvbSBwcmV2aW91cyBzZXJpZXMuDQoNCj4gLS0tDQo+ICAga2VybmVs
L01ha2VmaWxlICAgICAgICAgICAgICAgfCAgMSArDQo+ICAga2VybmVsL3N0YXRpY19jYWxsX2lu
bGluZS5jICAgfCA0MyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIGtl
cm5lbC9zdGF0aWNfY2FsbF9zZWxmdGVzdC5jIHwgNDEgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCA0MyBkZWxl
dGlvbnMoLSkNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQga2VybmVsL3N0YXRpY19jYWxsX3NlbGZ0
ZXN0LmMNCj4gDQo+IGRpZmYgLS1naXQgYS9rZXJuZWwvTWFrZWZpbGUgYi9rZXJuZWwvTWFrZWZp
bGUNCj4gaW5kZXggMzE4Nzg5YzcyOGQzLi44Y2U4YmVhYTNjYzAgMTAwNjQ0DQo+IC0tLSBhL2tl
cm5lbC9NYWtlZmlsZQ0KPiArKysgYi9rZXJuZWwvTWFrZWZpbGUNCj4gQEAgLTExMyw2ICsxMTMs
NyBAQCBvYmotJChDT05GSUdfS0NTQU4pICs9IGtjc2FuLw0KPiAgIG9iai0kKENPTkZJR19TSEFE
T1dfQ0FMTF9TVEFDSykgKz0gc2NzLm8NCj4gICBvYmotJChDT05GSUdfSEFWRV9TVEFUSUNfQ0FM
TCkgKz0gc3RhdGljX2NhbGwubw0KPiAgIG9iai0kKENPTkZJR19IQVZFX1NUQVRJQ19DQUxMX0lO
TElORSkgKz0gc3RhdGljX2NhbGxfaW5saW5lLm8NCj4gK29iai0kKENPTkZJR19TVEFUSUNfQ0FM
TF9TRUxGVEVTVCkgKz0gc3RhdGljX2NhbGxfc2VsZnRlc3Qubw0KPiAgIG9iai0kKENPTkZJR19D
RklfQ0xBTkcpICs9IGNmaS5vDQo+ICAgDQo+ICAgb2JqLSQoQ09ORklHX1BFUkZfRVZFTlRTKSAr
PSBldmVudHMvDQo+IGRpZmYgLS1naXQgYS9rZXJuZWwvc3RhdGljX2NhbGxfaW5saW5lLmMgYi9r
ZXJuZWwvc3RhdGljX2NhbGxfaW5saW5lLmMNCj4gaW5kZXggZGM1NjY1YjYyODE0Li42NGQwNGQw
NTQ2OTggMTAwNjQ0DQo+IC0tLSBhL2tlcm5lbC9zdGF0aWNfY2FsbF9pbmxpbmUuYw0KPiArKysg
Yi9rZXJuZWwvc3RhdGljX2NhbGxfaW5saW5lLmMNCj4gQEAgLTQ5OCw0NiArNDk4LDMgQEAgaW50
IF9faW5pdCBzdGF0aWNfY2FsbF9pbml0KHZvaWQpDQo+ICAgCXJldHVybiAwOw0KPiAgIH0NCj4g
ICBlYXJseV9pbml0Y2FsbChzdGF0aWNfY2FsbF9pbml0KTsNCj4gLQ0KPiAtI2lmZGVmIENPTkZJ
R19TVEFUSUNfQ0FMTF9TRUxGVEVTVA0KPiAtDQo+IC1zdGF0aWMgaW50IGZ1bmNfYShpbnQgeCkN
Cj4gLXsNCj4gLQlyZXR1cm4geCsxOw0KPiAtfQ0KPiAtDQo+IC1zdGF0aWMgaW50IGZ1bmNfYihp
bnQgeCkNCj4gLXsNCj4gLQlyZXR1cm4geCsyOw0KPiAtfQ0KPiAtDQo+IC1ERUZJTkVfU1RBVElD
X0NBTEwoc2Nfc2VsZnRlc3QsIGZ1bmNfYSk7DQo+IC0NCj4gLXN0YXRpYyBzdHJ1Y3Qgc3RhdGlj
X2NhbGxfZGF0YSB7DQo+IC0gICAgICBpbnQgKCpmdW5jKShpbnQpOw0KPiAtICAgICAgaW50IHZh
bDsNCj4gLSAgICAgIGludCBleHBlY3Q7DQo+IC19IHN0YXRpY19jYWxsX2RhdGEgW10gX19pbml0
ZGF0YSA9IHsNCj4gLSAgICAgIHsgTlVMTCwgICAyLCAzIH0sDQo+IC0gICAgICB7IGZ1bmNfYiwg
MiwgNCB9LA0KPiAtICAgICAgeyBmdW5jX2EsIDIsIDMgfQ0KPiAtfTsNCj4gLQ0KPiAtc3RhdGlj
IGludCBfX2luaXQgdGVzdF9zdGF0aWNfY2FsbF9pbml0KHZvaWQpDQo+IC17DQo+IC0gICAgICBp
bnQgaTsNCj4gLQ0KPiAtICAgICAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoc3RhdGljX2Nh
bGxfZGF0YSk7IGkrKyApIHsNCj4gLQkgICAgICBzdHJ1Y3Qgc3RhdGljX2NhbGxfZGF0YSAqc2Nk
ID0gJnN0YXRpY19jYWxsX2RhdGFbaV07DQo+IC0NCj4gLSAgICAgICAgICAgICAgaWYgKHNjZC0+
ZnVuYykNCj4gLSAgICAgICAgICAgICAgICAgICAgICBzdGF0aWNfY2FsbF91cGRhdGUoc2Nfc2Vs
ZnRlc3QsIHNjZC0+ZnVuYyk7DQo+IC0NCj4gLSAgICAgICAgICAgICAgV0FSTl9PTihzdGF0aWNf
Y2FsbChzY19zZWxmdGVzdCkoc2NkLT52YWwpICE9IHNjZC0+ZXhwZWN0KTsNCj4gLSAgICAgIH0N
Cj4gLQ0KPiAtICAgICAgcmV0dXJuIDA7DQo+IC19DQo+IC1lYXJseV9pbml0Y2FsbCh0ZXN0X3N0
YXRpY19jYWxsX2luaXQpOw0KPiAtDQo+IC0jZW5kaWYgLyogQ09ORklHX1NUQVRJQ19DQUxMX1NF
TEZURVNUICovDQo+IGRpZmYgLS1naXQgYS9rZXJuZWwvc3RhdGljX2NhbGxfc2VsZnRlc3QuYyBi
L2tlcm5lbC9zdGF0aWNfY2FsbF9zZWxmdGVzdC5jDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+
IGluZGV4IDAwMDAwMDAwMDAwMC4uMjQ2YWQ4OWY2NGViDQo+IC0tLSAvZGV2L251bGwNCj4gKysr
IGIva2VybmVsL3N0YXRpY19jYWxsX3NlbGZ0ZXN0LmMNCj4gQEAgLTAsMCArMSw0MSBAQA0KPiAr
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gKyNpbmNsdWRlIDxsaW51eC9z
dGF0aWNfY2FsbC5oPg0KPiArDQo+ICtzdGF0aWMgaW50IGZ1bmNfYShpbnQgeCkNCj4gK3sNCj4g
KwlyZXR1cm4geCsxOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IGZ1bmNfYihpbnQgeCkNCj4g
K3sNCj4gKwlyZXR1cm4geCsyOw0KPiArfQ0KPiArDQo+ICtERUZJTkVfU1RBVElDX0NBTEwoc2Nf
c2VsZnRlc3QsIGZ1bmNfYSk7DQo+ICsNCj4gK3N0YXRpYyBzdHJ1Y3Qgc3RhdGljX2NhbGxfZGF0
YSB7DQo+ICsJaW50ICgqZnVuYykoaW50KTsNCj4gKwlpbnQgdmFsOw0KPiArCWludCBleHBlY3Q7
DQo+ICt9IHN0YXRpY19jYWxsX2RhdGEgW10gX19pbml0ZGF0YSA9IHsNCj4gKwl7IE5VTEwsICAg
MiwgMyB9LA0KPiArCXsgZnVuY19iLCAyLCA0IH0sDQo+ICsJeyBmdW5jX2EsIDIsIDMgfQ0KPiAr
fTsNCj4gKw0KPiArc3RhdGljIGludCBfX2luaXQgdGVzdF9zdGF0aWNfY2FsbF9pbml0KHZvaWQp
DQo+ICt7DQo+ICsJaW50IGk7DQo+ICsNCj4gKwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShz
dGF0aWNfY2FsbF9kYXRhKTsgaSsrICkgew0KPiArCQlzdHJ1Y3Qgc3RhdGljX2NhbGxfZGF0YSAq
c2NkID0gJnN0YXRpY19jYWxsX2RhdGFbaV07DQo+ICsNCj4gKwkJaWYgKHNjZC0+ZnVuYykNCj4g
KwkJCXN0YXRpY19jYWxsX3VwZGF0ZShzY19zZWxmdGVzdCwgc2NkLT5mdW5jKTsNCj4gKw0KPiAr
CQlXQVJOX09OKHN0YXRpY19jYWxsKHNjX3NlbGZ0ZXN0KShzY2QtPnZhbCkgIT0gc2NkLT5leHBl
Y3QpOw0KPiArCX0NCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArZWFybHlfaW5pdGNhbGwo
dGVzdF9zdGF0aWNfY2FsbF9pbml0KTs=
