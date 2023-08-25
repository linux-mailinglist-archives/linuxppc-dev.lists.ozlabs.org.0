Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF32788CCE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 17:48:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=I/KZn7Pd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXPVY01vKz2ys9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 01:48:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=I/KZn7Pd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60e; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXPTf497Dz2xwG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 01:47:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNWr4mucMXd1eGdmYzNcm4IvDvlui3jdF68luKTRjkOFuVS8iUZCBBdwCkE8WOZO5CcuyuqATVmM9342ernoixcNZD0TZkZ8w0F7kJtutMB3YMaZe3j8qa8ic49fYoMaoG+3eu6+jEdbb1fgNU1u3xZTY6BArrt8AjqrWNBpBFEVjhD0h+1VqwJHR9fyvGAQPI+XTDs4p3w/+c4hIXoiaa7z2iofPXuFAaiJ9Nym+DtMemJS7X4Jcx/X28L+HI/kbD7FqqMqzsxwb9vQHs2npOTiqRCyXC/bU4A5MW/uHVNrhsQLBms1WaZHdMUhxSmO876zxANrvY/5K82RluLKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdgeSbZdKwWjGxqUmknzCdDK2Qv+S5drDu37I5+GvZI=;
 b=R+N8O2nnZrY0v6ujbT3tbauPLO4qEF9nRr3gjy+MlqG/pderaO2cNJx55BpxOIxjf4zrA7VeNefXFlE4RwreRTwVUbwFaXbzwpjcOqw61xZgaH2rvKrXTFGbUlXdcN8NCEFH/Gz4yJcffhP1+7NsoqLbNtLL8DRnGQXNi+uUcz3b76OaFUfR9fwT42/1XPb3v6VMSpllg1UilxffxYPREWhi2KL9FY21TVS9LV/zJHxVQvuFL+F2pucUJTvt6ArRfktr/y6SevuO7OKzzqhnp42z6Smr4SwvGMwom3qUMTYI0cbXa02POWm5xJey7KlsPUsOKcwe/lyKxqrzlfVwqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdgeSbZdKwWjGxqUmknzCdDK2Qv+S5drDu37I5+GvZI=;
 b=I/KZn7PdyJBEIpXArhiz9S+me1ltY0bpoD9nYGo4i7F5Feo0irnOzxVFReD7UpwiQEG/k6dbkkaNKQlUml/UYAQa1rPSvJEwqv0p1+y8aHwS9K3G2gjUbVY7GzYRdEEDBR6/tw10EpKNPJpU/B7EFJS3dSnSwpdeVbDjJQVrPCCiZoiEjyN3hqIztyAn3J21VB/IsdJ07zfVu6DSvHvHC51fKt4/gAtJ0a7z8P6lw+FbjhoZuu/F5yih1mG0/iy8wYmgD7p9u2/nbRz3drv36FHSvfa5zjOITeoAXxaFesPx8iB8hdb6sYhIKZ7SFg9s9XV9sOfBSsIJj8sILIJUzQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2354.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:33::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 15:46:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 15:46:54 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev
	<linuxppc-dev@lists.ozlabs.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Subject: Re: [PATCH v3 5/5] powerpc/bpf: use patch_instructions()
Thread-Topic: [PATCH v3 5/5] powerpc/bpf: use patch_instructions()
Thread-Index: AQHZ12dpYT8f2ZR0ckSZer1Ip7xjXq/7J+6A
Date: Fri, 25 Aug 2023 15:46:54 +0000
Message-ID: <5f41d2e4-878b-1c0b-f888-96b977065207@csgroup.eu>
References: <20230825151810.164418-1-hbathini@linux.ibm.com>
 <20230825151810.164418-6-hbathini@linux.ibm.com>
In-Reply-To: <20230825151810.164418-6-hbathini@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2354:EE_
x-ms-office365-filtering-correlation-id: c1ee2445-9414-487e-410a-08dba582820b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  qonyLelUWMvAUwVOgiCUxPvwolVDQOKjQzHsoKhke8INTZwazzYFkk0Xwy9/SvWv2kc9aeEBlTUQiNTmyVtvz3nNK8J+Wvrlitf1qb19CZkhCgiuXdCz+L4NmLzHbP5xU7XwrVi4aTPRgZ9eAJT4vt40SYrRAwD0zaOq17kZJeji0Y3wxk8c/zIu05Ys9/F1B3VoRpWXXynVmPebTzmJ/yHB0GT1NEGNphDe5LqQk9SSOBVIusCzzbWXvQJKrKJDMQhvgGKbv15gRAhm1a+yB3q0tQvVtVpWW3BdKZ/Hl8qgTCmPQkR4P3QCVoinH2jEtbnA7sgQb7BC26NuRVMtV2qWOrcEkdNSI8PizwwLyjrYMh55/HE5UGTLsuHtE7LQ2Zh06YWuQGxU9NKwe5GDNloGlJQh4z1bCMVcZvpGV8yttcr4KPKy3zp05UcpFaSV3iIB9gWjPhUHCuwPz9RYgyamwbNwB8ZxwEKfShnuFgNk0aMXiLUrgbFKXO4eSw8aEfnIDQ1fwdIrpzGqtkSHHbxRdnoQHPZX7VRufqC1q3WNoXxLPRbmgrr+xK3oTkb151laAmOlGB4qlfLZxuZqZ59EE9JpIL4kJTmyeuYDLM0RvHzYrx8+ZXgIFKI/sFO5sRBdotxFSEMOjBoJcK9buBv+5sszP0OPleDTwQDRuiJSRfXHhaaRFfySiSNQg7Vo
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39850400004)(366004)(376002)(451199024)(186009)(1800799009)(64756008)(66946007)(54906003)(66446008)(76116006)(66476007)(66556008)(316002)(122000001)(478600001)(110136005)(91956017)(26005)(44832011)(38070700005)(38100700002)(71200400001)(41300700001)(86362001)(6486002)(31696002)(6512007)(6506007)(2906002)(31686004)(8676002)(4326008)(8936002)(2616005)(5660300002)(66574015)(83380400001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UENMeFBLOHdiblIvdHdaRlg5SkZmcmEzOEhvYUZ0Sm1laFg0a3BhS2ZvNHls?=
 =?utf-8?B?UkdCTE9udzhqc0NWbWFWQXBSOGVSWGk3cEhqbFk2bkhPeVlVbjQxMXNBaStO?=
 =?utf-8?B?bTZWa0xRWWN6RXVleGZ5NjJjWnNQMmxDMFNnVTRTVzBhcjdKMEpjS0hULzdn?=
 =?utf-8?B?SzNhUUFMREc3aTY3NUJFYjY3ZjcvUUNTZEZRUmFUdHlIa0p4bHQwcXJ0NkI2?=
 =?utf-8?B?SkNjY3NnODBmVEFLU0c0WEE5cnVlM29VUFRaVmwxcWk0dElOYWViMURiVWRh?=
 =?utf-8?B?N2p0LytRb0p1MmhWaUVIK04xRTBLRk8xeXFWekpHWUlRdENVcDQrNjN0NUx2?=
 =?utf-8?B?MWNRK2N6RVFZMCtaVnY2QnNuR0h1bytOY2FBcjZkRHlVbVZNbjJ6ME9hSUI3?=
 =?utf-8?B?c1BLM2xDVldnekEwbVc4Mk56aldWNGVScjhkTU1LTlNnMEcwQjlJRlYrQmVX?=
 =?utf-8?B?aHZLWDl1VWNWUFpDUEoxZW1Kb3NGSlUrQVhvbmVnT2lVSC96RWZISkdqTDdD?=
 =?utf-8?B?Rkl5VGpZQUJ0dEk2SVRoRHRNbHBpWmp1aGlPdGZUUjQ5T2Q2Ri8yUFFyYzQv?=
 =?utf-8?B?UFdXMzkyUmJhdEVBLzB6TnJySlI3QjV4cWJydHo0RkJBQ2JMZVFqaUFhWnd1?=
 =?utf-8?B?cHlla3haRjZ2WXVLcmlNQWRtNWlMQkJwNDVIQnYzbktFV2hucENXc1dRRkxY?=
 =?utf-8?B?eStXK0VNakpMRk9aOEUzMHJnVk05TWRhRVhpeWNQekNZTkdOL09OYmRaM3dh?=
 =?utf-8?B?d244QmlQU1A4WlRzYkZPRklMRnpWdDJFTnJ3aVJXSE1yZk1kSlVvWHNWdm00?=
 =?utf-8?B?Z2xQWGxFM3U1NDhld2JQUlNycUlZa1BSNTNuVmpCVzRBN2NLVm5vdTlXNjh3?=
 =?utf-8?B?SDNteEdpMmtzL0sya2NaZ0s1eW92OTZxb1NCMUxZeFVaRm9ib1g4MlF5MnU4?=
 =?utf-8?B?YjJxd0hpNENyZjdaZFBySHBBUlRXbzU3UG53L3hnRWtNSzFDWFArUitvRzJF?=
 =?utf-8?B?NnFzT3o4Z1VNSW9wMzRDQzZ3R0FOdzVpWk9iek5Ua2xCQmRlVDFCNnpXcHJO?=
 =?utf-8?B?L3BxVU1sZjZCOHdtWUFTWm1wQXcrUGpkQ1NJbzZIcFZDR2tjYXpPV3c0ZUox?=
 =?utf-8?B?YlAzM1dLa2tEL1l1T2RnbEorT204emw3Y2p2bHp4b3Jiem9VZFJReGFWRzV3?=
 =?utf-8?B?NmRxZU94YlJUMzl0dmp2dW93VmNuT2tGc1VXRUgvaEFSakI3cWFoMm50S2p5?=
 =?utf-8?B?K3VkL2pDL0UvTjdETCsyUzg3T1NWeE8vQmFtdVlhbGxQR3NBRE1oWCtUZ1JO?=
 =?utf-8?B?RGt1K2hrVm9kZTF5Z0pIcjFEb3pJWWhhYXZ3N0RMUWtKVGRkaHdRZmFxbTJZ?=
 =?utf-8?B?MHhOb05EalA4N2EwK1Fjc3ZzY2h6c1huMlFFaEVrdTNwbkg0R3BEcjZtL3Rp?=
 =?utf-8?B?QW5SaWhjUWFnS2tOQjJGVGtQSWVaaVBTdHdVNk9NZkdXVTdqZ2R3ejRhZzc5?=
 =?utf-8?B?R2JYaDdhMFdUMVFjSG5lQWVVQ2VWNm4zSytCMGtpelc3WFJvbXBDcStaL0wy?=
 =?utf-8?B?eEZBQmNCdm84MlFmcXFTZlFhSmt6TzRqelZ4RWRiL1NzQ1pMdk9Bdmt2cThs?=
 =?utf-8?B?TktzclZVRnZ6anpuNWJKL2dGMmI2aE1jMkVWZUFQQmd0ZTJhRGFjK3I1dzVi?=
 =?utf-8?B?SENuUDRXbGhoNHNaSEZnbnVoeUdpeUlNdGdmcDFpeWJzaUllZ3FhT1htY1BC?=
 =?utf-8?B?K0VxYnB5di9ocGhMY2NwbHlmZ0J3aVo4c2IvdTFTN2JvLzhjYTdMTElGZGlR?=
 =?utf-8?B?ZzViNm9HNFFQSmRZYk9rc2w1U2NtVmhZenVXUnFSdDlqTXptcGZldVhINDk5?=
 =?utf-8?B?dE9ZQit5MW1XK21UNDhjblhNdHRFMUUwNFdCOFFTSXg3MkgvNGJDR0dmNnB2?=
 =?utf-8?B?a3plbXM2cHRpazlOVkpseERRdnBnL3VUR3M4SFJNT2ZhcGw1Q3pQdlF2M1FM?=
 =?utf-8?B?RHhvMFRWSldSZ2pKTlM3WDg2Tkx3Y0pRRDVnYUMzQ1Fvd242WW5hMUkva3lo?=
 =?utf-8?B?ZVNkQS9Ka0ZpVXZUdjNZcnJtZ3Fia0JTbWZEdFhBTTZpVGNDZ2VIZUpUTGtG?=
 =?utf-8?B?KzBFWmllSjRJdDQ3NU5Udy9NcHV5MDlRcWF3NHFEd2NDM0duZ3lMOFA3dDRt?=
 =?utf-8?B?aHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD92BEE23832894DAC345A48DD5FC05F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ee2445-9414-487e-410a-08dba582820b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2023 15:46:54.8940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9TdLYjhPluEsDyR7NrFOI0ocR2zYHyFKeDaBK64gDnGdBCmfyqcgTpli72fdM6+H2BWsMPGJ2OxyrgknA5thfPHP1UBYsiDNIBmLQT7yrhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2354
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

DQoNCkxlIDI1LzA4LzIwMjMgw6AgMTc6MTgsIEhhcmkgQmF0aGluaSBhIMOpY3JpdMKgOg0KPiBV
c2UgdGhlIG5ld2x5IGludHJvZHVjZWQgcGF0Y2hfaW5zdHJ1Y3Rpb25zKCkgdGhhdCBoYW5kbGVz
IHBhdGNoaW5nDQo+IG11bHRpcGxlIGluc3RydWN0aW9ucyB3aXRoIG9uZSBjYWxsLiBUaGlzIGlt
cHJvdmVzIHNwZWVkIG9mIGV4ZWN0dXRpb24NCj4gZm9yIEpJVCdpbmcgYnBmIHByb2dyYW1zLg0K
PiANCj4gV2l0aG91dCB0aGlzIHBhdGNoIChvbiBhIFBPV0VSOSBscGFyKToNCj4gDQo+ICAgICMg
dGltZSBtb2Rwcm9iZSB0ZXN0X2JwZg0KPiAgICByZWFsICAgIDJtNTkuNjgxcw0KPiAgICB1c2Vy
ICAgIDBtMC4wMDBzDQo+ICAgIHN5cyAgICAgMW00NC4xNjBzDQo+ICAgICMNCj4gDQo+IFdpdGgg
dGhpcyBwYXRjaCAob24gYSBQT1dFUjkgbHBhcik6DQo+IA0KPiAgICAjIHRpbWUgbW9kcHJvYmUg
dGVzdF9icGYNCj4gICAgcmVhbCAgICAwbTUuMDEzcw0KPiAgICB1c2VyICAgIDBtMC4wMDBzDQo+
ICAgIHN5cyAgICAgMG00LjIxNnMNCj4gICAgIw0KDQpSaWdodCwgc2lnbmlmaWNhbnQgaW1wcm92
ZW1lbnQuIEZvcmdldCBieSBjb21tZW50IHRvIHBhdGNoIDEsIEkgc2hvdWxkIA0KaGF2ZSByZWFk
IHRoZSBzZXJpZXMgdXAgdG8gdGhlIGVuZC4gSnVzdCB3b25kZXJpbmcgd2h5IHlvdSBkb24ndCBq
dXN0IA0KcHV0IHBhdGNoIDQgdXAgZnJvbnQgPw0KDQpDaHJpc3RvcGhlDQoNCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEhhcmkgQmF0aGluaSA8aGJhdGhpbmlAbGludXguaWJtLmNvbT4NCj4gLS0tDQo+
ICAgYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXAuYyB8IDMwICsrKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDI2IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9j
b21wLmMgYi9hcmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRfY29tcC5jDQo+IGluZGV4IGM2MGQ3NTcw
ZTA1ZC4uMWU1MDAwZDE4MzIxIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvbmV0L2JwZl9q
aXRfY29tcC5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wLmMNCj4gQEAg
LTI2LDI4ICsyNiw2IEBAIHN0YXRpYyB2b2lkIGJwZl9qaXRfZmlsbF9pbGxfaW5zbnModm9pZCAq
YXJlYSwgdW5zaWduZWQgaW50IHNpemUpDQo+ICAgCW1lbXNldDMyKGFyZWEsIEJSRUFLUE9JTlRf
SU5TVFJVQ1RJT04sIHNpemUgLyA0KTsNCj4gICB9DQo+ICAgDQo+IC0vKg0KPiAtICogUGF0Y2gg
J2xlbicgYnl0ZXMgb2YgaW5zdHJ1Y3Rpb25zIGZyb20gb3Bjb2RlIHRvIGFkZHIsIG9uZSBpbnN0
cnVjdGlvbg0KPiAtICogYXQgYSB0aW1lLiBSZXR1cm5zIGFkZHIgb24gc3VjY2Vzcy4gRVJSX1BU
UigtRUlOVkFMKSwgb3RoZXJ3aXNlLg0KPiAtICovDQo+IC1zdGF0aWMgdm9pZCAqYnBmX3BhdGNo
X2luc3RydWN0aW9ucyh2b2lkICphZGRyLCB2b2lkICpvcGNvZGUsIHNpemVfdCBsZW4sIGJvb2wg
ZmlsbF9pbnNuKQ0KPiAtew0KPiAtCXdoaWxlIChsZW4gPiAwKSB7DQo+IC0JCXBwY19pbnN0X3Qg
aW5zbiA9IHBwY19pbnN0X3JlYWQob3Bjb2RlKTsNCj4gLQkJaW50IGlsZW4gPSBwcGNfaW5zdF9s
ZW4oaW5zbik7DQo+IC0NCj4gLQkJaWYgKHBhdGNoX2luc3RydWN0aW9uKGFkZHIsIGluc24pKQ0K
PiAtCQkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7DQo+IC0NCj4gLQkJbGVuIC09IGlsZW47DQo+
IC0JCWFkZHIgPSBhZGRyICsgaWxlbjsNCj4gLQkJaWYgKCFmaWxsX2luc24pDQo+IC0JCQlvcGNv
ZGUgPSBvcGNvZGUgKyBpbGVuOw0KPiAtCX0NCj4gLQ0KPiAtCXJldHVybiBhZGRyOw0KPiAtfQ0K
PiAtDQo+ICAgaW50IGJwZl9qaXRfZW1pdF9leGl0X2luc24odTMyICppbWFnZSwgc3RydWN0IGNv
ZGVnZW5fY29udGV4dCAqY3R4LCBpbnQgdG1wX3JlZywgbG9uZyBleGl0X2FkZHIpDQo+ICAgew0K
PiAgIAlpZiAoIWV4aXRfYWRkciB8fCBpc19vZmZzZXRfaW5fYnJhbmNoX3JhbmdlKGV4aXRfYWRk
ciAtIChjdHgtPmlkeCAqIDQpKSkgew0KPiBAQCAtMzMwLDE2ICszMDgsMTYgQEAgaW50IGJwZl9h
ZGRfZXh0YWJsZV9lbnRyeShzdHJ1Y3QgYnBmX3Byb2cgKmZwLCB1MzIgKmltYWdlLCB1MzIgKmZp
bWFnZSwgaW50IHBhc3MNCj4gICANCj4gICB2b2lkICpicGZfYXJjaF90ZXh0X2NvcHkodm9pZCAq
ZHN0LCB2b2lkICpzcmMsIHNpemVfdCBsZW4pDQo+ICAgew0KPiAtCXZvaWQgKnJldDsNCj4gKwlp
bnQgZXJyOw0KPiAgIA0KPiAgIAlpZiAoV0FSTl9PTl9PTkNFKGNvcmVfa2VybmVsX3RleHQoKHVu
c2lnbmVkIGxvbmcpZHN0KSkpDQo+ICAgCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCj4gICAN
Cj4gICAJbXV0ZXhfbG9jaygmdGV4dF9tdXRleCk7DQo+IC0JcmV0ID0gYnBmX3BhdGNoX2luc3Ry
dWN0aW9ucyhkc3QsIHNyYywgbGVuLCBmYWxzZSk7DQo+ICsJZXJyID0gcGF0Y2hfaW5zdHJ1Y3Rp
b25zKGRzdCwgc3JjLCBsZW4sIGZhbHNlKTsNCj4gICAJbXV0ZXhfdW5sb2NrKCZ0ZXh0X211dGV4
KTsNCj4gICANCj4gLQlyZXR1cm4gcmV0Ow0KPiArCXJldHVybiBlcnIgPyBFUlJfUFRSKGVycikg
OiBkc3Q7DQo+ICAgfQ0KPiAgIA0KPiAgIGludCBicGZfYXJjaF90ZXh0X2ludmFsaWRhdGUodm9p
ZCAqZHN0LCBzaXplX3QgbGVuKQ0KPiBAQCAtMzUxLDcgKzMyOSw3IEBAIGludCBicGZfYXJjaF90
ZXh0X2ludmFsaWRhdGUodm9pZCAqZHN0LCBzaXplX3QgbGVuKQ0KPiAgIAkJcmV0dXJuIC1FSU5W
QUw7DQo+ICAgDQo+ICAgCW11dGV4X2xvY2soJnRleHRfbXV0ZXgpOw0KPiAtCXJldCA9IElTX0VS
UihicGZfcGF0Y2hfaW5zdHJ1Y3Rpb25zKGRzdCwgJmluc24sIGxlbiwgdHJ1ZSkpOw0KPiArCXJl
dCA9IHBhdGNoX2luc3RydWN0aW9ucyhkc3QsICZpbnNuLCBsZW4sIHRydWUpOw0KPiAgIAltdXRl
eF91bmxvY2soJnRleHRfbXV0ZXgpOw0KPiAgIA0KPiAgIAlyZXR1cm4gcmV0Ow0K
