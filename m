Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6688C788C80
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 17:34:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ggY+oMTN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXPBk1lb1z2yDd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 01:34:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=ggY+oMTN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62d; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXP9s2nLLz2xps
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 01:33:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WvtlMEwN97LYa6jzt8Mfvwo/iheJgdKeOMkJuXnp9ueO8oLT0I84Dso89xleedtgTGsC5lxBQ9WIElYqoIDbPLTgms19tGqimMK6DVsNXG/bGDhWKuYrxWinCCN4QXG1gzRp0seT9+WiLeqj/nmdiaHA8i9snyUaV9I1ar78KsgnydEEKdTuPjLcKuXc/BD+91dZYaWLUsQzAoCsflxMMU8l/Xax6jaUyAKj2YxmfDeG8i4STWm1iHF4jYbZy2dpEmkWxtbjgl9JFrdLX5Vz9bxweFMyyikBFlgDPUpTDmNhMM5tyVT4O+ahF3jCDcaDIM6iAsJIIVSLR1cG46OooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kx4xKKk4coci/J8S0E7yck0fgWGrZdtRS9o+qWEfH8=;
 b=gaEet2CXdeF28tQVoHAg0e6faSsVJsCEgkV26Ocw9n7Ru3uicSbr47Y49n5YRuiI7eygqzavhnqZ8JOKhczIdIWKBXq0zU/4c3cCzSr/do859cl3eX6WPQUi58FI8GDsXqzgxUoIVQZ4Riek/Gjpe+Oo9vOs/IroNknQlfOf2W1YYowzAc42M8diQCxbQmedLH+i17ScF7yeWzHQARut1uXkogf24SjSvEn4lTNazipSP/e1fn9RCdE/qUpEnjAq+Y8oagnm5fTDVByDcL8vPjQnHPMa2tC27wGxookRje2k/prkyNxM7PJ+ZcAKRk+v4vQXkPP99M6YSRXOrCIYhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kx4xKKk4coci/J8S0E7yck0fgWGrZdtRS9o+qWEfH8=;
 b=ggY+oMTNVQjsjXt8LBsD0n8wGrHqG/NJmEPT6zj4Za5FGOQ9Dl2MYbinDiYSMDUglCUCXX1gq8qGGnXdacgAmBkhw3R9AHOR80KlqShSNhxrptVjhmxWNSnZHI1AhhtzG2aiyA924sJf7v6sD8nDiQQ/P2wyGA9w9zIEDLGEGJDrr30A6/v2L788D+WggOzlKp/teSVWO9hd8aFm3QWK+Uq2Ov4E5m8WopxAnkPfnLjkbFTv3LM8tvknrYaBKVKAAon9vz4FR8zl/lmpYxT3SqQZImvWgLUnqiLX5cOa8KRCmWWLhBFmjVAYCgBvJd1CuxhUx8K3DNrRs+SGRvIbVA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2038.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 15:33:18 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 15:33:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev
	<linuxppc-dev@lists.ozlabs.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Subject: Re: [PATCH v3 2/5] powerpc/bpf: implement bpf_arch_text_invalidate
 for bpf_prog_pack
Thread-Topic: [PATCH v3 2/5] powerpc/bpf: implement bpf_arch_text_invalidate
 for bpf_prog_pack
Thread-Index: AQHZ12dk74BvXgU/t0ualS6i7QLvb6/7JCGA
Date: Fri, 25 Aug 2023 15:33:18 +0000
Message-ID: <7df92b0b-d260-addf-fc78-27690d72310f@csgroup.eu>
References: <20230825151810.164418-1-hbathini@linux.ibm.com>
 <20230825151810.164418-3-hbathini@linux.ibm.com>
In-Reply-To: <20230825151810.164418-3-hbathini@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2038:EE_
x-ms-office365-filtering-correlation-id: 448dbe07-221e-4c09-3e65-08dba5809b84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  yJtWvxqNQRc2Bjo9m61JQZj9qC22TievqkOdafR7su9ch/Da7JMXd+1DmQ6z/vv1UzEnQFl59B2L4o7RXpFSbPzdWUKf3soi7MLlra75jkxR5p5cuikTu9CB1UzJWOn6fFfL8r76VQ+een9w7T++G9RZhCDIHhLbt/OM0JTKYOb3AI5ryX1HVNzg5cAKJc/FNHKXhlJQFOej3BVvZHk0r+9rh0eFgiVyaVSnXDSafH/zRSBNToFsOTyc+1e6TGKLav1Lw2AmjRsVIa/nkWgv5HGLpUx9K7/4SSj+wzilrJlzX/KTGX+pZLNPnnFMkXHZswuoCH2MyUlNcWM5hWkO9JiRUexCDxJ3XOj7TRBFQ7DJKOk6/K7EXVbU+UlPA5KdPsdpZSJ3+PFsJ/SlAanknX81t9saJBhjVLST19V2TwYx+sdymok/1kue8SldZnjarIH2nx+6MRIedd3lkhMD78QGXvtngeEcwj1ko6WKWjnfE1MGbGUqgdePdQJnMsuVuqukPSpQJKuZWcyT6SRd8U9MIOqJxkTa26Pu9AxYLES4m83gxuDm99iConpcfUbqMhaQRzQFYi2/K5bb1Hh7ex/PMTpGj2NrgpGDChXNZvzMabN8aQLSSSxyGdLsZ1kwVsqsrHFRkOC3hPpE3K8csq9nIUsddJCJWG5iAVe11jc+aUaEOqcB2B8GoTMivkKg
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39850400004)(366004)(376002)(451199024)(186009)(1800799009)(64756008)(66946007)(54906003)(66446008)(76116006)(66476007)(66556008)(316002)(122000001)(478600001)(110136005)(91956017)(26005)(44832011)(38070700005)(38100700002)(71200400001)(41300700001)(86362001)(6486002)(31696002)(6512007)(6506007)(2906002)(31686004)(8676002)(4326008)(8936002)(2616005)(5660300002)(66574015)(83380400001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?VS8vMDBsdFNESHBDdDZmWHFLZ3dvemw0UlcrYjdaUUlZbTdWOXlsVGUxTkVO?=
 =?utf-8?B?b2h1a05ZaVRwTkJ5OWZ1Rk9veitJMHJOQmcvOGxWcmtBUkY0TkNaZklXMFBJ?=
 =?utf-8?B?UE4zUjNJRytsM0IrZkJKRloxUytqQjhYeE8zd1FlYVdXUDBPS0pCV21ZakRw?=
 =?utf-8?B?QUkxMmdadjhYU2tCV1RZSGNWbmZqMXowSy9FNVBFN1U3MDJVWDFnTEFSZGVM?=
 =?utf-8?B?YnlBU2R5azh3dzFoR25weWk5VEJkY1I5RGJWRkZtaE5QVUtKVnJ0TjVONHU4?=
 =?utf-8?B?UHJSeDVobXVQWXdUQmlBT04rN3VKRGpXcFo0QlFhTXlIVVZ3NndkSTROTC9h?=
 =?utf-8?B?dVh0Qi9rUmRCNDZhWWhaOFVzT0VsVklINWJHYTFyM0VxZ3JLRVNhZFZSZ3Ra?=
 =?utf-8?B?Qmt0YkFBQTVGbU1TckxRRXBMUHRUeDNaZHAwMTJ0cHdIQ0JEdUM5bHhUU1FM?=
 =?utf-8?B?NTBZUzRrbjZJeE9pZ2dFNnlwUVpJdUxScUI1cWdpVzQwV1NvaXRSNEFnekxh?=
 =?utf-8?B?Yy9kYUxUSkRrSUh0ZEFaZGRpeVU2c1lkUGF4ZGlFdGo2a0NPYTVEVlRORHFs?=
 =?utf-8?B?c2U3NisyOWY1UGNUZzlNVFh3NU9CM3VEMExLRWp6OU1xbDV2U3ZSQUd6Z2pE?=
 =?utf-8?B?N1VxMSsranVad2laVWxJVisyUmlwaStkQjh0YVJPc2NlTm15V1JjZU1oSnRz?=
 =?utf-8?B?S1daNlVCajJSZE1oRVRlLzZJdlBaOXBPSExpNjJDSDZ1UHdFSisrVHdaekcw?=
 =?utf-8?B?WkV2SnZxeUxjT0RnREVhSU5wVGVFQnl2MkROb1FFNXE1WlRhRmRlc2VJa1Rz?=
 =?utf-8?B?R1NRSndpWWdGazY2djFQYzJSemJIb0R1MW8zVkRyTVBuMUJ2blNTSFZKL2lw?=
 =?utf-8?B?YmM4R2lvK2NSbXExZVNQbWJVTEtKSS9nRzJPS0k5RFRlbkF4ZElSTUF1N3Nq?=
 =?utf-8?B?SWMwalV3K20wajBXWEJxR1lGUEdpVDRQbU0yR3RFUEhvcEVqa1RudmUwbmRx?=
 =?utf-8?B?Nm1QbTVNTkMyMklRWGxWd3VwUkhvOGJ4NUdQSzRjNnVZTm9OeTYwaTFCVzlZ?=
 =?utf-8?B?UitYNE4zTHR2SmVoOUQ0azVYS1hqMkl0cWdxRG1qVUFQb2cvZ3VBOFJDZzdN?=
 =?utf-8?B?TE1ZSE92ZWo0SGR6V3ZlbFhWa1YvaVdVcVErcmkyQktNcVRTU2tNbU1oQkxy?=
 =?utf-8?B?Um0zWTVtMFVqOXorcEVPcnhuT09nb0hOSllQN0o3MlJOOW91YWxzejNLU2Vj?=
 =?utf-8?B?cTJuU2VWQUxKbXVLU0hDNk1WeWJ4c2NSanRqUUxpcUlSZGZRcUZ1SWFsT3RD?=
 =?utf-8?B?QlZ5N3FzUWpZdTNtOGN1RVB3SzhweWlFSkJHSGZtaWkvN1dGUGR5YWJLb0dm?=
 =?utf-8?B?dGhmVEd3TEgxSlorRldqYXZRMlVnbDI3NkY5VFNaUTRBTGtHVmVWWDFPU056?=
 =?utf-8?B?M1ZCV0RJT25BRTRRQTRYL2ZHUlhncmkzNXBHREdMSHIxM1RCOGJjNW5BOTZW?=
 =?utf-8?B?dHdZU29KTktrYXN4OUtOL1dTYTdOamtwUjdIQ1FveW5tMnJmRGxjayswQjg5?=
 =?utf-8?B?RjM2eHBTOWF1OHFHUFFSOEFqY05iZU5OU2F5YXhwR2UvanJnYU43Um1oMmZP?=
 =?utf-8?B?MzAxYms1WnVqam1ueEZReDJEbjhNby95MnBKem96bkpGblVzc1RiVm94dnNI?=
 =?utf-8?B?SFppM21MdXk4OVAxZEVJZUk4SEZLQTdoU0JvN09DOEFJT2w2R3FueDZzcEFY?=
 =?utf-8?B?ZVA3eWdxOEc1K29Db1UxNnlOTGQ5a1RiNEpwYVlNUERsc0tCdDBhVUNUeWYz?=
 =?utf-8?B?UVg2MVN3VDBZMFBYK3p2dmxJVkpDUGZ2NW5nL1ZUaHdFM0xvZStmdEF3L2d5?=
 =?utf-8?B?SDFud3JTaWVBZzErd3RONDVQSTdSZnhMdlM3OTZZZkh0VW1vK1BLajErQWh1?=
 =?utf-8?B?Q25pbEpnUVRUZnFsOVZyYkhuK0k5V1VxUytBZWlrSmllbHNYNVd1RGVpdUlC?=
 =?utf-8?B?Q01BQXJsanBZWnQyZDNkTnArVTZCMHgwaWZFTHBrZm9SdUxlNFNoYWFBWFpm?=
 =?utf-8?B?QkZKdW5tZHUya2FINXlHcGt0dm55d2puRXBYdVdUUHdPeXovS2x0ZkFNTWNt?=
 =?utf-8?B?dmRPZ1MycW9tRTlWNmhaWEFDYnhjZXgwaDVacWdZRjZEYUhQeE1uWEozYXFl?=
 =?utf-8?B?TXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05B0F125BF056D439C18615BE6966226@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 448dbe07-221e-4c09-3e65-08dba5809b84
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2023 15:33:18.6490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zMTQrteOovXnhmPySQo3Y8rPXlQPM5VNauLCQLf1pUA+eRGGJBjMrE87PWm6+FSKOb/dlNeirvQyyLaMymkFu4Dy/oRzxHbMV5NhnptoSrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2038
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

DQoNCkxlIDI1LzA4LzIwMjMgw6AgMTc6MTgsIEhhcmkgQmF0aGluaSBhIMOpY3JpdMKgOg0KPiBJ
bXBsZW1lbnQgYnBmX2FyY2hfdGV4dF9pbnZhbGlkYXRlIGFuZCB1c2UgaXQgdG8gZmlsbCB1bnVz
ZWQgcGFydCBvZg0KPiB0aGUgYnBmX3Byb2dfcGFjayB3aXRoIHRyYXAgaW5zdHJ1Y3Rpb25zIHdo
ZW4gYSBCUEYgcHJvZ3JhbSBpcyBmcmVlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhhcmkgQmF0
aGluaSA8aGJhdGhpbmlAbGludXguaWJtLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL25l
dC9icGZfaml0X2NvbXAuYyB8IDIyICsrKysrKysrKysrKysrKysrKystLS0NCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRfY29tcC5jIGIvYXJjaC9wb3dlcnBjL25ldC9i
cGZfaml0X2NvbXAuYw0KPiBpbmRleCAxNzBlYmY4YWMwZjIuLjdjZDRjZjUzZDYxYyAxMDA2NDQN
Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXAuYw0KPiArKysgYi9hcmNoL3Bv
d2VycGMvbmV0L2JwZl9qaXRfY29tcC5jDQo+IEBAIC0zMCw3ICszMCw3IEBAIHN0YXRpYyB2b2lk
IGJwZl9qaXRfZmlsbF9pbGxfaW5zbnModm9pZCAqYXJlYSwgdW5zaWduZWQgaW50IHNpemUpDQo+
ICAgICogUGF0Y2ggJ2xlbicgYnl0ZXMgb2YgaW5zdHJ1Y3Rpb25zIGZyb20gb3Bjb2RlIHRvIGFk
ZHIsIG9uZSBpbnN0cnVjdGlvbg0KPiAgICAqIGF0IGEgdGltZS4gUmV0dXJucyBhZGRyIG9uIHN1
Y2Nlc3MuIEVSUl9QVFIoLUVJTlZBTCksIG90aGVyd2lzZS4NCj4gICAgKi8NCj4gLXN0YXRpYyB2
b2lkICpicGZfcGF0Y2hfaW5zdHJ1Y3Rpb25zKHZvaWQgKmFkZHIsIHZvaWQgKm9wY29kZSwgc2l6
ZV90IGxlbikNCj4gK3N0YXRpYyB2b2lkICpicGZfcGF0Y2hfaW5zdHJ1Y3Rpb25zKHZvaWQgKmFk
ZHIsIHZvaWQgKm9wY29kZSwgc2l6ZV90IGxlbiwgYm9vbCBmaWxsX2luc24pDQoNCkl0J3MgYSBw
aXR0eSB0aGF0IHlvdSBoYXZlIHRvIG1vZGlmeSBpbiBwYXRjaCAyIGEgZnVuY3Rpb24geW91IGhh
dmUgDQphZGRlZCBpbiBwYXRjaCAxIG9mIHRoZSBzYW1lIHNlcmllcy4gQ2FuJ3QgeW91IGhhdmUg
aXQgcmlnaHQgZnJvbSB0aGUgDQpiZWdpbmluZyA/DQoNCj4gICB7DQo+ICAgCXdoaWxlIChsZW4g
PiAwKSB7DQo+ICAgCQlwcGNfaW5zdF90IGluc24gPSBwcGNfaW5zdF9yZWFkKG9wY29kZSk7DQo+
IEBAIC00MSw3ICs0MSw4IEBAIHN0YXRpYyB2b2lkICpicGZfcGF0Y2hfaW5zdHJ1Y3Rpb25zKHZv
aWQgKmFkZHIsIHZvaWQgKm9wY29kZSwgc2l6ZV90IGxlbikNCj4gICANCj4gICAJCWxlbiAtPSBp
bGVuOw0KPiAgIAkJYWRkciA9IGFkZHIgKyBpbGVuOw0KPiAtCQlvcGNvZGUgPSBvcGNvZGUgKyBp
bGVuOw0KPiArCQlpZiAoIWZpbGxfaW5zbikNCj4gKwkJCW9wY29kZSA9IG9wY29kZSArIGlsZW47
DQo+ICAgCX0NCj4gICANCj4gICAJcmV0dXJuIGFkZHI7DQo+IEBAIC0zMDcsNyArMzA4LDIyIEBA
IHZvaWQgKmJwZl9hcmNoX3RleHRfY29weSh2b2lkICpkc3QsIHZvaWQgKnNyYywgc2l6ZV90IGxl
bikNCj4gICAJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0KPiAgIA0KPiAgIAltdXRleF9sb2Nr
KCZ0ZXh0X211dGV4KTsNCj4gLQlyZXQgPSBicGZfcGF0Y2hfaW5zdHJ1Y3Rpb25zKGRzdCwgc3Jj
LCBsZW4pOw0KPiArCXJldCA9IGJwZl9wYXRjaF9pbnN0cnVjdGlvbnMoZHN0LCBzcmMsIGxlbiwg
ZmFsc2UpOw0KPiArCW11dGV4X3VubG9jaygmdGV4dF9tdXRleCk7DQo+ICsNCj4gKwlyZXR1cm4g
cmV0Ow0KPiArfQ0KPiArDQo+ICtpbnQgYnBmX2FyY2hfdGV4dF9pbnZhbGlkYXRlKHZvaWQgKmRz
dCwgc2l6ZV90IGxlbikNCj4gK3sNCj4gKwl1MzIgaW5zbiA9IEJSRUFLUE9JTlRfSU5TVFJVQ1RJ
T047DQo+ICsJaW50IHJldDsNCj4gKw0KPiArCWlmIChXQVJOX09OX09OQ0UoY29yZV9rZXJuZWxf
dGV4dCgodW5zaWduZWQgbG9uZylkc3QpKSkNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4g
KwltdXRleF9sb2NrKCZ0ZXh0X211dGV4KTsNCj4gKwlyZXQgPSBJU19FUlIoYnBmX3BhdGNoX2lu
c3RydWN0aW9ucyhkc3QsICZpbnNuLCBsZW4sIHRydWUpKTsNCg0KV2h5IElTX0VSUiA/DQoNCkFz
IGZhciBhcyBJIHVuZGVyc3RhbmQgZnJvbSB0aGUgd2VhayBkZWZpbml0aW9uIGluIGtlcm5lbC9i
cGYvY29yZS5jLCANCnRoaXMgZnVuY3Rpb24gaXMgc3VwcG9zZWQgdG8gcmV0dXJuIGFuIGVycm9y
LCBub3QgYSBib29sLg0KDQo+ICAgCW11dGV4X3VubG9jaygmdGV4dF9tdXRleCk7DQo+ICAgDQo+
ICAgCXJldHVybiByZXQ7DQo=
