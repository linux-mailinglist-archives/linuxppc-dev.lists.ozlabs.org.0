Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC7B788C77
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 17:30:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=XDh0QrgT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXP641MqTz301T
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 01:30:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=XDh0QrgT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::628; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXP562KN2z2xH6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 01:29:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UyqgNcjWMQZvDNAugBS1A5++jiPteqgObRQnzpk54gC4cGGqp8oLnfXUxJB9LNjSSj9aQye2yVrP8HzS5rcZaQQb7RSc3KvmpQUm+C6nYNLsbNIX1lK07pNgyGUNue2m9AsEwYA5Snv4DNk9PLJlWsEj9nUPajukRbsgp3vUdpGibJaQXnZWhoBeHu/eD1GkAsPOKfrYM2gsiqUxighln1/YX92bYgnnt5cSgG1OHI7W8MJgNLGHsQ+wc5TWzf4s75Xk5GAQBRVK7wJ/4Gr0uZDS/sIBIAxB1LrW7hdXUVCjomjPXKFUgeeUmoPH/VahSNSalZn3tmZTD9T4c5Vxag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxaB20WiIxbSOYg3CKfXg1+zziecGzzC/U/Da2ZYwEA=;
 b=Tj+CjceYNGjulSFCx5Qke+PWBOV1Kf3ftIHPUKtS7jI70gZeJtCZkvqrGV/3We2vY1KrS45MfBhlRIqN7kJESh4h4Vz28EPqQ9fEJ8z8KKmXZLmXemufVVYoOsxcMYM1yjhNMP8k0HOv83UGUbpTvXwUNXTfxnpHnZVLiD5UrsOsnfH9MDHvedwBDPRhDMHDhx0REso/5kWBaqVumMy8NN0WocB4XrkjXrCwIxhK43fL2LR2q1lqX6+gREwwWMn4W0Dvi02hU9rfyR6P28YYpTNHPgPiuDMBh7ho3zxclsimKrXTHMn9pFtIzG7chXGbE6Njx0jUealg68MiVvAvRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxaB20WiIxbSOYg3CKfXg1+zziecGzzC/U/Da2ZYwEA=;
 b=XDh0QrgTDf8HHZHXPISsIiS3MR1s6ovNiNaP+ok5MzNU6m9Rcx1ViwyRjfd3LkqsQkRn1iEnAGR8mdHUIWNw4Y9tFz42y5ZKtxELxsyavyQz1JNE0ryEBDuIAju0aBy1K0OZskuVvZHX0/g5HyKQYYya+1hwN0HASwWvV9olUiOBjC10tM2EIDxH/fdSNWL8/SJWbi+kA3VhR+7JIEUgTIkNgi53VoOZdbqCuXOy/aIc6UnVehsvB4yYZ60TAtXnKqJ98uLh4lySd/lft1eNWIjEknThftkAyy1OcqbSHxHZ9Q2CNUwnL2/5IXMhV1kb5+0H9cuyg+gfWte6WRFBGg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3076.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 15:29:09 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 15:29:09 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev
	<linuxppc-dev@lists.ozlabs.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Subject: Re: [PATCH v3 1/5] powerpc/bpf: implement bpf_arch_text_copy
Thread-Topic: [PATCH v3 1/5] powerpc/bpf: implement bpf_arch_text_copy
Thread-Index: AQHZ12dkPO6UzbZ5nEyPIBVsCXw6eq/7IvgA
Date: Fri, 25 Aug 2023 15:29:09 +0000
Message-ID: <39d180ea-129a-00f8-7c85-2b9af4feff55@csgroup.eu>
References: <20230825151810.164418-1-hbathini@linux.ibm.com>
 <20230825151810.164418-2-hbathini@linux.ibm.com>
In-Reply-To: <20230825151810.164418-2-hbathini@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3076:EE_
x-ms-office365-filtering-correlation-id: 7747c050-1b35-4f07-d00e-08dba5800701
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  12QixjQfqAc4Ep3h9EoJ5XLrzfS0VzZxpCwerN3kuQ2gNP8PViy3ngMahk5L3UFwTA9mO4DZ7gxag7VMIiWMj2G1et1T4lIBsPBncOICbb4tis3z2X1GRHC2BlC9FwM1MyMvctvxqj8WxTaifUD8lWvA+GSdngcr5X7EVKc78CY0qPt7u9D3a9zp5No9rNygnlvbn85AhvEEpwYmBFnJYTzH5vcXQoEnqp+qjl3VeadJHZdbnJqIS1wjMLL9g2W1C8aYoLRpnm0zYqR8DsdgUwi7Tv8w0SHqkCPLruMBTRxz8tOLuuNjkqWek7jJ/RAm4KvNSsKWc0FEw/7L/L8x6RqCSTgavso/MH/xcel+GtGOi09De73iTyouSFJjtBtkbQ4yrBeF1cRH7nCZYfZNr4m0/4XAhCI6/r+7yV1zkitgtlKN14sApm0b6jO1+3taTBJtT1VP68x9TS6VoZslXzmKR3QtqSdptnuEBvSgHYXXw4bL3ZVEYLceTqrthNnwAMg3wXj7NIUROYCMJxSt7OUBQ2KhO1TNK9dk31Xzs2luwTHKyXjlS3NU2r+tlUIVAxml7rJ5ImW++0uNG1Yz/G77VaMeeBcR+q3HmIm0h568SG8tV2HcGxaM6HUCUEfs2ExcUgju3xgIK6IN7Nvao9S+5pHv01hTFDKUolJtpxgmnhsGgc67gIXytWSXQ5lb
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39850400004)(346002)(366004)(376002)(1800799009)(451199024)(186009)(44832011)(83380400001)(6512007)(478600001)(66574015)(26005)(2616005)(5660300002)(31686004)(2906002)(8676002)(8936002)(4326008)(38070700005)(38100700002)(122000001)(66556008)(66946007)(76116006)(66476007)(86362001)(71200400001)(41300700001)(54906003)(31696002)(64756008)(6486002)(91956017)(36756003)(110136005)(66446008)(316002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SVhXbkJDSFFOTm40eTN1c2VEVXNYTmJNeVltQmlKZmM1K1dKT0RqRkVTRmRR?=
 =?utf-8?B?YmNLQmsvbzh4cmJsbkQweHJnd1NWK2hXcCs3bWZ6WEZBZHJ0TCtmcUlsZXhF?=
 =?utf-8?B?S2I4ek9Zc3pTWEMxMDErWlZKcTVNTkplS21rRUtZL00vUWFMbm5DOEYrenl3?=
 =?utf-8?B?MWlKZGo1Q0xkWVpVc0lNakI2enhhS2NGYk1sV0VsYzdodVZWdGFmOS9MZ0JX?=
 =?utf-8?B?bHJFNFJXdUtrMHlYeTlKMWNDeXBOcS9naFBnNG9YYWJBWm1WRjdIdXF4VnZU?=
 =?utf-8?B?K3hFeXpYSXBieS81U0c2OWhtcGpHeFB3Uk5Palh5MTZEcnJETXhEUUx3QkM4?=
 =?utf-8?B?VnQ3Y2gyVDArbm1zYlk2Y29xNXo5QjlZUk9aUFBNbUQ4RWNNQzNxeXdDZ09H?=
 =?utf-8?B?VlZIZlhaMEROMmdQWUIzTDRUSGxOTUxTZzhQUm9UcmdIM2NTSGJ3aWxKZjZz?=
 =?utf-8?B?dHlTQ1ltZlJTOUxoLy9rWlQxZERDQ3hLRXVLTWkzS2RPRXpSbHlNdFFrZHIx?=
 =?utf-8?B?eWRuOE9rQnU0K1VwY3lqUEJ2aTNUdDNHRElwRjg5c3c4ZjdyamNnK21Fbm4w?=
 =?utf-8?B?Mm42R3g1ald5aGJraVo3bURkTkVrREUyaUxBdEFGSUJvRk95b2Q1OWFQdWll?=
 =?utf-8?B?Z3RCcFErMWlkSmJoMkRvOGNJcFNpM3RBUVBreTZrRVRFOGFOUGlTa1BYRE1v?=
 =?utf-8?B?L25oRGRDWS8xZU5WdzhnZHhIRlBMTjZzZXZxdWprT2szaXRSWFVYOXQ2V0xZ?=
 =?utf-8?B?RnByNVNqMHViVjUxUlFOdjF4WGpmd1JlNjZucWtkbjRSc2Y5QlFXYUxDclBy?=
 =?utf-8?B?RXNMenpIUldXZ2pibnR2R013dk92aXFVVGJ5SG5LQWpPYTV4R25UY3NFcXZE?=
 =?utf-8?B?c0JRNnZ3MW5hemUxMTFYNkNDc3lPZDR6MVBtQTVyejgvRGFCWW5BMlNTNzVE?=
 =?utf-8?B?cGUrS3RaR0w3bTF2MXhGa04xeSsyZEpKTHVrbTQ1b205OTl4ZmFoSGl3NU4v?=
 =?utf-8?B?bW5DY1FiMHVkMHozd0I2Rm1tNzUrWGg5cml4NmhpWGx2cDU1ekJvRzB6RCsv?=
 =?utf-8?B?U3R1VE1nYUhCRmRvbkZGZEtXclhKMHloUnVlYmV3U1hiWGpUNFkvSUticjI1?=
 =?utf-8?B?dzhaRXhqQXpGK1JyTENGZ0t5QXVReENQajFUaUV6aGFPVld1SnpsZVE0NXRt?=
 =?utf-8?B?RGx1OXFyNnhEUkNCekNXVkdiVGVaZnUzbjRlMFRKVkRreEpFb2dHY2M5RXJG?=
 =?utf-8?B?ODlHNC9ONVhIMXJXVnVCWGZKM0RZNEtweGl5VFhsYjhnNmE3SXNTU2UvRUJl?=
 =?utf-8?B?eDU3eUVhMTdSRmpaNnAxVlBmcFpRSlA5QjdzMDFYT05uTnA0dUhtZXpKcWd0?=
 =?utf-8?B?ZkczektqSEZ1dks4Ujc2NWxqLzljaHpFNXN5M2lIbERYRFVsVFFzUlUzbXVE?=
 =?utf-8?B?a0t1aVFhakVua3ljSXZOOXVEQTFyRVlkSTFpZ3BPNnRBMHJpV2R3RG16Rjdh?=
 =?utf-8?B?VFl3MS9EOHYrWlMxZVVRVUJSbkx2N0hoRjlNMGovVDVEOHRKRjRzWHVyc3Jv?=
 =?utf-8?B?ZUQ0bnlwZjJCZEVOdTBwQndXNzJxUDFKMGUyeWFyczlXQyswTTRGaXRZZWRP?=
 =?utf-8?B?RmpZZFFuNktENS9jZ29sc0ZaSXA0b1JTbitDMVhrMVFRaE5XQzBudmlvdXdq?=
 =?utf-8?B?dnc5cnFrNE4ycXppV0FPRTV2bCtwdVFFbHF5ek4rUWdyMUMzYXB5R2dJRHp5?=
 =?utf-8?B?UEFzOEdUNnd1R2R4R1FPSTQybno1UzNzSURQWGIyeExEWUtVTFpEbTl4ZG9E?=
 =?utf-8?B?ejBIL29pZndiL1RYaXlsdDR2b1pVZzNlWkh0Tzl1aVdLQS9xMGNGbmoreHlU?=
 =?utf-8?B?SE5iT2cvVU92VG5Mb0VUZ1RsaGxHT2ZzQXM3aWR1Mk5xNUx0aWQ5VjVSZ1Rq?=
 =?utf-8?B?TXhBOXRUUGVRMmt1ZFVXdXI1eTVvdnhPV1VOTVRQazNKSnpIeHJkMXN3ZTV5?=
 =?utf-8?B?VTdjWmxrQS82aDYxditxQlFQYXk1dGVoMVlFeFJla3E5ZjYzOTRXbkhEcXZt?=
 =?utf-8?B?T0pCV3p4UCtOUENGS2IzWWJ3OW1MT3R6Qyt5NE15SGd2Y0FWdStKWmNHakNM?=
 =?utf-8?B?b3J6d2Z3cElFOWV2RkxSa0hVb3Z2QnhPL2JMNlVLS3p4anNWZ1pUd01PTEFK?=
 =?utf-8?B?WkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <52684D66B6E31E4F8DE9442E4113EA7C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7747c050-1b35-4f07-d00e-08dba5800701
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2023 15:29:09.4806
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: McqT/39YfowDJByW9BQexP9hHCaG75csQcCOoIUYtdE5bkeX4SderESqfimUEvLIeGVGt8B2pGK0GHSAXKAmCGamCpjdWEk4//ClQcvmAQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3076
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzA4LzIwMjMgw6AgMTc6MTgsIEhhcmkgQmF0aGluaSBhIMOpY3JpdMKgOg0KPiBi
cGZfYXJjaF90ZXh0X2NvcHkgaXMgdXNlZCB0byBkdW1wIEpJVGVkIGJpbmFyeSB0byBSWCBwYWdl
LCBhbGxvd2luZw0KPiBtdWx0aXBsZSBCUEYgcHJvZ3JhbXMgdG8gc2hhcmUgdGhlIHNhbWUgcGFn
ZS4gVXNlIHBhdGNoX2luc3RydWN0aW9uKCkNCj4gdG8gaW1wbGVtZW50IGl0Lg0KDQpCeSB1c2lu
ZyBwYXRjaF9pbnN0cnVjdGlvbigpIGZvciBkb2luZyB0aGF0IHlvdSBhcmUgbWFwcGluZyBhbmQg
DQp1bm1hcHBpbmcgdGhlIHNhbWUgcGFnZSBmb3IgZWFjaCBpbnN0cnVjdGlvbiB5b3UgY29weS4g
WW91IHNob3VsZCANCmltcGxlbWVudCBzb21ldGhpbmcgdG8gbWFwIGEgcGFnZSwgY29weSBhbGwg
aW5zdHJ1Y3Rpb24gZ29pbmcgaW50byB0aGF0IA0KcGFnZSwgdW5tYXAgdGhlIHBhZ2UgYW5kIG1h
cCBuZXh0IHBhZ2UsIGV0YyAuLi4uDQpBbmQgdGhlbiBwZXJmb3JtIHRoZSBpY2FjaGUgZmx1c2gg
YXQgdGhlIGVuZC4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSGFyaSBCYXRoaW5pIDxoYmF0aGlu
aUBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRfY29t
cC5jIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9hcmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRfY29tcC5jIGIvYXJjaC9wb3dlcnBjL25ldC9icGZf
aml0X2NvbXAuYw0KPiBpbmRleCAzNzA0M2RmYzFhZGQuLjE3MGViZjhhYzBmMiAxMDA2NDQNCj4g
LS0tIGEvYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXAuYw0KPiArKysgYi9hcmNoL3Bvd2Vy
cGMvbmV0L2JwZl9qaXRfY29tcC5jDQo+IEBAIC0xMyw5ICsxMywxMiBAQA0KPiAgICNpbmNsdWRl
IDxsaW51eC9uZXRkZXZpY2UuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvZmlsdGVyLmg+DQo+ICAg
I2luY2x1ZGUgPGxpbnV4L2lmX3ZsYW4uaD4NCj4gLSNpbmNsdWRlIDxhc20va3Byb2Jlcy5oPg0K
PiArI2luY2x1ZGUgPGxpbnV4L21lbW9yeS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9icGYuaD4N
Cj4gICANCj4gKyNpbmNsdWRlIDxhc20va3Byb2Jlcy5oPg0KPiArI2luY2x1ZGUgPGFzbS9jb2Rl
LXBhdGNoaW5nLmg+DQo+ICsNCj4gICAjaW5jbHVkZSAiYnBmX2ppdC5oIg0KPiAgIA0KPiAgIHN0
YXRpYyB2b2lkIGJwZl9qaXRfZmlsbF9pbGxfaW5zbnModm9pZCAqYXJlYSwgdW5zaWduZWQgaW50
IHNpemUpDQo+IEBAIC0yMyw2ICsyNiwyNyBAQCBzdGF0aWMgdm9pZCBicGZfaml0X2ZpbGxfaWxs
X2luc25zKHZvaWQgKmFyZWEsIHVuc2lnbmVkIGludCBzaXplKQ0KPiAgIAltZW1zZXQzMihhcmVh
LCBCUkVBS1BPSU5UX0lOU1RSVUNUSU9OLCBzaXplIC8gNCk7DQo+ICAgfQ0KPiAgIA0KPiArLyoN
Cj4gKyAqIFBhdGNoICdsZW4nIGJ5dGVzIG9mIGluc3RydWN0aW9ucyBmcm9tIG9wY29kZSB0byBh
ZGRyLCBvbmUgaW5zdHJ1Y3Rpb24NCj4gKyAqIGF0IGEgdGltZS4gUmV0dXJucyBhZGRyIG9uIHN1
Y2Nlc3MuIEVSUl9QVFIoLUVJTlZBTCksIG90aGVyd2lzZS4NCj4gKyAqLw0KPiArc3RhdGljIHZv
aWQgKmJwZl9wYXRjaF9pbnN0cnVjdGlvbnModm9pZCAqYWRkciwgdm9pZCAqb3Bjb2RlLCBzaXpl
X3QgbGVuKQ0KPiArew0KPiArCXdoaWxlIChsZW4gPiAwKSB7DQo+ICsJCXBwY19pbnN0X3QgaW5z
biA9IHBwY19pbnN0X3JlYWQob3Bjb2RlKTsNCj4gKwkJaW50IGlsZW4gPSBwcGNfaW5zdF9sZW4o
aW5zbik7DQo+ICsNCj4gKwkJaWYgKHBhdGNoX2luc3RydWN0aW9uKGFkZHIsIGluc24pKQ0KPiAr
CQkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7DQo+ICsNCj4gKwkJbGVuIC09IGlsZW47DQo+ICsJ
CWFkZHIgPSBhZGRyICsgaWxlbjsNCj4gKwkJb3Bjb2RlID0gb3Bjb2RlICsgaWxlbjsNCj4gKwl9
DQo+ICsNCj4gKwlyZXR1cm4gYWRkcjsNCj4gK30NCj4gKw0KPiAgIGludCBicGZfaml0X2VtaXRf
ZXhpdF9pbnNuKHUzMiAqaW1hZ2UsIHN0cnVjdCBjb2RlZ2VuX2NvbnRleHQgKmN0eCwgaW50IHRt
cF9yZWcsIGxvbmcgZXhpdF9hZGRyKQ0KPiAgIHsNCj4gICAJaWYgKCFleGl0X2FkZHIgfHwgaXNf
b2Zmc2V0X2luX2JyYW5jaF9yYW5nZShleGl0X2FkZHIgLSAoY3R4LT5pZHggKiA0KSkpIHsNCj4g
QEAgLTI3NCwzICsyOTgsMTcgQEAgaW50IGJwZl9hZGRfZXh0YWJsZV9lbnRyeShzdHJ1Y3QgYnBm
X3Byb2cgKmZwLCB1MzIgKmltYWdlLCBpbnQgcGFzcywgc3RydWN0IGNvZGUNCj4gICAJY3R4LT5l
eGVudHJ5X2lkeCsrOw0KPiAgIAlyZXR1cm4gMDsNCj4gICB9DQo+ICsNCj4gK3ZvaWQgKmJwZl9h
cmNoX3RleHRfY29weSh2b2lkICpkc3QsIHZvaWQgKnNyYywgc2l6ZV90IGxlbikNCj4gK3sNCj4g
Kwl2b2lkICpyZXQ7DQo+ICsNCj4gKwlpZiAoV0FSTl9PTl9PTkNFKGNvcmVfa2VybmVsX3RleHQo
KHVuc2lnbmVkIGxvbmcpZHN0KSkpDQo+ICsJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0KPiAr
DQo+ICsJbXV0ZXhfbG9jaygmdGV4dF9tdXRleCk7DQo+ICsJcmV0ID0gYnBmX3BhdGNoX2luc3Ry
dWN0aW9ucyhkc3QsIHNyYywgbGVuKTsNCj4gKwltdXRleF91bmxvY2soJnRleHRfbXV0ZXgpOw0K
PiArDQo+ICsJcmV0dXJuIHJldDsNCj4gK30NCg==
