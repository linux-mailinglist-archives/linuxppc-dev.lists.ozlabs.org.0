Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BA0852A56
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 08:55:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=l+8oeWf0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYtsn3hZ9z3dWd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 18:55:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=l+8oeWf0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::700; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYts32yJrz3bbW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 18:54:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QCIkf8fuP+Oexb4eZhP1f1UKu6Sbo9zrvPmR64Jkcag3VkHW0Gr2yGykFHL8N4yd5k/iYlBlWi7o/FymoBtOSylqJ8PRip9H0PjRnJBwEd/QfiP8G8kUGG3dCLgPd+D+/CBVLm/lGvcUPodQLLxxmyg0IsvTegm7vAxKUfN0sOA93T+hHSeJLPLuud9m8emg6Umd0J2qi/G0hQOnThrO3xmei7R+i6/n9DMQc9XfgGbL1+6PFr7RgcGgi5MHu1PWtKibHDBGMsZgdkYr75+FQlvbuHPxk0oaZ9PJZ99C/LItDfM2cNqnocLJOueOGCXyfhQS7+LseLfmENGSPQ/5qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=md+VWlPyzJYbXfXN9qsj1Z4G+IoHRN9RzLBIvfBBmAQ=;
 b=cvj03J6Yj/FfYdQWHL7af6/8P/CHl40ck5IXDToiOKS2+uduhhYcJY50+8G2PqhkRCvkOssee7A+lNRCz89ARtccLnZwYrALFjl8jXa9iHlAQrWFswGOXMsYDg/FRuPqudoxwEzgMkkiVczmr3LRg3+JuMYx4OARCtYsCYqZM8NKIdt7+kpWhWiBY/VheAziTPTm2YMRMv48zRRt1cv9w9UfkgkJGGjDWqmNIjNkljB85w11673Jy18bgM4DvbPmIY2OPZU6u7LZNX9+0KiT4WSIv1qITI6Z+zboTfQXGeJ3AvlhGIghT+PIzb++ZIMTOTm1Q5MFu1+NbvPHi245gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=md+VWlPyzJYbXfXN9qsj1Z4G+IoHRN9RzLBIvfBBmAQ=;
 b=l+8oeWf0JW5XFoD0xyp+24ou5SRHILKvKbmqkwkLypjZPw9VuSE3HCUZUdM4YN5OCZBGL04icEsKi44qF3XsLbCs0bD6z1IjX8K48UsnUsBGVmNnI/93lsuob08N1q2PbMfF/CrO9efVGg+WtKhl6UGvwxQN8wdDm2JOy0nFqLDN3vuUZt0UYb9qdoSbPEHis6GBSXEZtU0lX0l0pVFVXUztNz+YN/bccLknVXSK1iVBpnL14vqSabHLyWzAwc6dtIlj9QGZIQEEouu0Q6UmI9tPAsKWPATtUEnBXyveAYl/Og3eMR5hYTggJb3v0HqghlDwsvjLW+DqL+9YmFPX1Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB3487.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:126::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Tue, 13 Feb
 2024 07:54:27 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589%6]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 07:54:27 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev
	<linuxppc-dev@lists.ozlabs.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] powerpc/bpf: enable kfunc call
Thread-Topic: [PATCH v2 2/2] powerpc/bpf: enable kfunc call
Thread-Index: AQHaVTHsCxvb6u4WckSOAE4o/DY9RrEH+VWA
Date: Tue, 13 Feb 2024 07:54:27 +0000
Message-ID: <4dd99601-6990-444c-af23-95cb3f7b156b@csgroup.eu>
References: <20240201171249.253097-1-hbathini@linux.ibm.com>
 <20240201171249.253097-2-hbathini@linux.ibm.com>
In-Reply-To: <20240201171249.253097-2-hbathini@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAYP264MB3487:EE_
x-ms-office365-filtering-correlation-id: 3ea676f1-57d1-4526-be03-08dc2c6900ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  zu+3dt6VeTalTttIA0rqaIzVQWT/GwnFKs7K0iFRlMxE91wbpvH9sVHHO/igwQoliY4alhV2eVvfBiLXOWjtjLIymWsTELXJquQ8eFA0meZNXGvsK+QmuBSYyNtYT72dy4hP4miFH0vWDKoB/Hsp3hz1dmjq57PCc+6hTUEaXLVlZffXloTuQnC0Wga5YJ1Ob9AbdzOXqdaQz3UeRnsLTvnTrppqnz6PWGCAF5CIGqC8VmA46pqpSd89ENw2s9rO4D7lF97qrneZHrMkoYW6nedfhMYMSlcJZgxXTM5ydXvbPPwkurc1ixomSpfSbWtsmgrKthqc/2kJOVYco/1mmiNKstYp9hQpv3RSuvZHrjUNTksF5iA5dtReyiIF71Q7kYU56LAcrhDJ8AuoiEJZL7+hQP/vDCNkR3mri6BgHQguLZ2XHqys+42kaANfV4atETgf63fiIuP7Cb/Hp/iBgCSanSDoYPtmYuSv/mlzUzeNKlol4aUUgQxuwpi0+YYEtmzhG4OvjqPzLo+kfi96qPuD6SjeCz1+x/JZVcCCzThx0bFgal/1SRmTxKSsw3Ne3JiAugZkV8KMmy4L7WN+6tSYp+3Ly6hn7ZSDmeMZETAeRuAtWlV7l3p5eu6I7GYT
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39850400004)(346002)(366004)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(31686004)(71200400001)(26005)(41300700001)(2616005)(110136005)(2906002)(4326008)(4744005)(66446008)(66556008)(76116006)(66946007)(66476007)(64756008)(7416002)(8676002)(91956017)(8936002)(44832011)(5660300002)(38070700009)(478600001)(83380400001)(316002)(54906003)(6506007)(6486002)(6512007)(31696002)(86362001)(122000001)(38100700002)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aHhTZVp5aUwvbjBMUjRKNHVYbEVKRzNMZE1oYlVxb3oydGJRb0hJd212UHd0?=
 =?utf-8?B?a0c5MS91M3hWNFdpUGUyaVFDdFRiRjQ0NmNZZy94a3hVbGZ1MzNTQ1pOWkJR?=
 =?utf-8?B?eHNkOXFtblpNWWRvZWlLclpiU2NvMUFjak5IMzBFUFBjazNoU28vbkQzUDBJ?=
 =?utf-8?B?TnZicENmMndzZmI4UWhhUk1OdEFmMlBGQUNRcUFWV2E4bHZZK2FEaGxsaXZX?=
 =?utf-8?B?M1A5bXl0TzloT21DRTFpWmxUck01MmthcHJTN04xeUlNSlFNOUZWcEFGOEJU?=
 =?utf-8?B?RkFjaWRhOHhvWnFEZXJjK3h3QUsxMmhZek0zS1QvZDh3bTdDdHhmZGJNL0lh?=
 =?utf-8?B?UGRieFVydTZQMkpua0Mza0xNOUpOMUdIYUg5V0o2MkUxcUhzVE9RU2t4Wmly?=
 =?utf-8?B?S21ESkJvQzBucnFFWWpaMC9ORE05UEI4RTZTZS85YnlGcWRnc2I0Z0YvUkp0?=
 =?utf-8?B?bS9yeEFjSi9wbUVudG1oZkRERU9UUUhjVWxZdTltOERLb0lVaDY5dm9jTXc4?=
 =?utf-8?B?ai9FaHh6NGl1S0UzMkhNZmpscHdZS3AwZGd0cjdGRjNhMzhnRjdoSi9NRjdq?=
 =?utf-8?B?ZXgwRmlnMG1aY2NYSmZpQmhZUXQwREpUbXFKdUVHWGpjaTFIeDRLVDJrRWV3?=
 =?utf-8?B?L2l3Q3RaTnNxWWl1ZzNOTXRnRnF6T1pCSkdSMzFGZkZMbU4ya1F4WDh1T3pD?=
 =?utf-8?B?YmFyRUNZRmNha0dQbW0xWWI5aEZVMEtWN0xlL1N3K2QvbzVMQWx2TklnNFVY?=
 =?utf-8?B?SFIwS0RiWnZPYmhXckVMMnhiT1c1SnhSaWtLRThRTDFnTm9sdEdHYkZqWS8r?=
 =?utf-8?B?d1Fod2hHeVpIKzdYaUtDem93ZXpFK2k3QmNZaEg5U205TEZoMUF3TXA2eW1V?=
 =?utf-8?B?VURvYWJFcDFzcjQwWHhKVUJVd2MwekJvTFlCM29JeWMrNktqZ1BnZFlYUGxz?=
 =?utf-8?B?bXdMdWVtR0VVS0h3c05EcUpndDVBOXB2UzdKZURGZ3lnNFQyQkNqclJrWXF6?=
 =?utf-8?B?Z3NWZThWMDRUaGtYQUlIMjFBN2ZONGJ0TVBHdFFsd0RsY2UyQzhBZnRqTFpv?=
 =?utf-8?B?NUZxL3RJUEphb2JTNUIxVmIwZzQrZWpQVXRsdUdLNDhVVGNTazhLVjZKcFlW?=
 =?utf-8?B?NjdJUEdlejY3QzdTUnNCek4xdlgzcTBSbXVtUVlKRmdvaTlvY3h5RXdNZjgz?=
 =?utf-8?B?WlpZK3hUOHdQWE9tc3hvdDlmaXkyMWU4eUpmdjE5STdTc0ViOHdaVGlmVnRi?=
 =?utf-8?B?emJNMUt5MjZMakNKRDQvdWFHOE9nOEhTdkduN0ZnNFFCTkhSajZJK09JbU0y?=
 =?utf-8?B?UUprZldacTlyTlNKU1FUbmUvaTd4OGx4NGFxQ1ZYT3o0bTRqYVBqWDA1N2Nq?=
 =?utf-8?B?OEdLYUpZcDV0cUxYN1pucnJ4TXF2WFp3RWtkemtwV1llZTd2SzJTQm1XajIz?=
 =?utf-8?B?YitmOS9mNHJVV1ZITlJjWHNpci9mZmNPV0VQV2lETDEzNkNiUDdjT3p4RUdM?=
 =?utf-8?B?YWtPU2gxWGtWd3p0ekhqNGJ0Mnh4Qi9Hek85UWhIT0hBMS9mdm1weWRJWjNl?=
 =?utf-8?B?c2dBWkorNzZxRGhpUVF0L2xwdCtNTGdiYVlVMFhHbCtMN3gxNVNjOHFVVXN2?=
 =?utf-8?B?MGQ2QlBRVTdlVHptdkIzRWQzOHBkNjBOaWNndytOQnFaWUZ3YmRacjlIUGFj?=
 =?utf-8?B?MUhyMEUyOWNMWmdDQU9CZDNPK1JzSi9NWlJ0RGZ0VGxZYm5ZUndkZmkyQXYy?=
 =?utf-8?B?TmwyRGxRSnJ4Z3piNGVVY2Y4RDZOU0tRckdyOXF0clBXU0Zxd0ViUSttYjdL?=
 =?utf-8?B?VzgwSUxncEV5S2JOdytaNWl2cnFvT2cwYVcvMmpvb3c3STNVRTVORDJYM1Qw?=
 =?utf-8?B?cXo1N3QveUNEU3crcXhtZ3hGb1VmQnFuU1dZaE13SUl1TEZQQkJFUnREWjd5?=
 =?utf-8?B?NEVzUlRCNm9kNWJCalZBT2VReWpJY0dkZUtnOVRKVzVQQjBVZVUzYlNZaG5H?=
 =?utf-8?B?UDdXRVRVRm5LSXB4b0VNRXdxNmsvT0NBQ3VVOFBwYTh1RHNWdzVvQWxBaEFn?=
 =?utf-8?B?eFk2WEJVajY3SXMrMGNkd1JmY2tydVE2Vk01a1cwUkUwck5MN0Ryem1DVnRm?=
 =?utf-8?B?U2VlNnNrcFhIcUxoYytOMGtkMzROTEd2K3lhRVRNZCs3QWJObEVERmV0eFpU?=
 =?utf-8?B?VlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A13B34754A7624BBCD8FA71D3376C56@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea676f1-57d1-4526-be03-08dc2c6900ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2024 07:54:27.4145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0c+5+2OZxzYQmRv3efTLo9LjU/Jjkfr04Mz14vhYcFtiCYz7ebB0naxMzytz/nyBTC86jRCGPwrBobsLTiokUxO4tvjp8jA06bhPOcrKSTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB3487
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzAyLzIwMjQgw6AgMTg6MTIsIEhhcmkgQmF0aGluaSBhIMOpY3JpdMKgOg0KPiBX
aXRoIG1vZHVsZSBhZGRyZXNzZXMgc3VwcG9ydGVkLCBvdmVycmlkZSBicGZfaml0X3N1cHBvcnRz
X2tmdW5jX2NhbGwoKQ0KPiB0byBlbmFibGUga2Z1bmMgc3VwcG9ydC4gTW9kdWxlIGFkZHJlc3Mg
b2Zmc2V0cyBjYW4gYmUgbW9yZSB0aGFuIDMyLWJpdA0KPiBsb25nLCBzbyBvdmVycmlkZSBicGZf
aml0X3N1cHBvcnRzX2Zhcl9rZnVuY19jYWxsKCkgdG8gZW5hYmxlIDY0LWJpdA0KPiBwb2ludGVy
cy4NCg0KV2hhdCdzIHRoZSBpbXBhY3Qgb24gUFBDMzIgPyBUaGVyZSBhcmUgbm8gNjQtYml0IHBv
aW50ZXJzIG9uIFBQQzMyLg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIYXJpIEJhdGhpbmkgPGhi
YXRoaW5pQGxpbnV4LmlibS5jb20+DQo+IC0tLQ0KPiANCj4gKiBObyBjaGFuZ2VzIHNpbmNlIHYx
Lg0KPiANCj4gDQo+ICAgYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXAuYyB8IDEwICsrKysr
KysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2FyY2gvcG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wLmMgYi9hcmNoL3Bvd2VycGMvbmV0
L2JwZl9qaXRfY29tcC5jDQo+IGluZGV4IDdiNDEwM2I0YzkyOS4uZjg5NmE0MjEzNjk2IDEwMDY0
NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRfY29tcC5jDQo+ICsrKyBiL2FyY2gv
cG93ZXJwYy9uZXQvYnBmX2ppdF9jb21wLmMNCj4gQEAgLTM1OSwzICszNTksMTMgQEAgdm9pZCBi
cGZfaml0X2ZyZWUoc3RydWN0IGJwZl9wcm9nICpmcCkNCj4gICANCj4gICAJYnBmX3Byb2dfdW5s
b2NrX2ZyZWUoZnApOw0KPiAgIH0NCj4gKw0KPiArYm9vbCBicGZfaml0X3N1cHBvcnRzX2tmdW5j
X2NhbGwodm9pZCkNCj4gK3sNCj4gKwlyZXR1cm4gdHJ1ZTsNCj4gK30NCj4gKw0KPiArYm9vbCBi
cGZfaml0X3N1cHBvcnRzX2Zhcl9rZnVuY19jYWxsKHZvaWQpDQo+ICt7DQo+ICsJcmV0dXJuIHRy
dWU7DQo+ICt9DQo=
