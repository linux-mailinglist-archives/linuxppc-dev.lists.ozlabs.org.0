Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 073F3637FC8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 20:47:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJ7nB6Pvzz3f47
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 06:47:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Y3diq12L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61e; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Y3diq12L;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJ7m916Jdz3cLW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Nov 2022 06:46:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiO+DpCuVhFYIpaR9JT7mVLIY32vf578z+wQBv5VtECSz48/tAfAHaglYukAHcawyr+S19rYv5F2u/PnUEt0UBKHgnfFKhbDm0BGHYq9asJEJmPwllmoRyr2igiDFyUOlV231zGEkC6etbb/6ZHAUWf+YOCkwwKJuQMZ4o3GBtc3mHe8jpaZZrIqXx7s0xehh5ZP8S/TM0cASIMPZK9Onmouq5lQEb1PISGiclimoltDnaO2JfMF2xkbZ3e6BDWglSu/OmSA8dBodlloF9GqdBP6k1cl0/gl1KGIAsdRa7ZnloJFH3YckX9fWyqlproogf/3+2ddUMecBOQSk/qW9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiuVuAJj53LKLD+mSxusjS77bJ0O5KOC8PDq78YVEbY=;
 b=A9CW+xq4Bxi+HQDRBYAvabMtsxpO3FpDwGOaePy6o/H0aLrVsDhc0oudBzOlPNHvZwvqQumwpoFy1uPHeDqFqK6uV82q7Mc+YJdVSnrg7BrGZWeW8V1NhN7QvTNpkdkdbC13uUtYMJzazhaNkHjcLNSFLwQiHHxAkfv4ftnH/Fy785jtA+5B+9k/1eoFNvzaRJmC5936+w+KyT2qN/QmsFT+slPEO18derr0oMPEjy3dIZmci3W1YyQuRpRDFTCsrNCsf0UVvNvWHMdk1YcSuULl6OhnPQjejV8UTQnil/uN11OKFsXB4+VFAa4orXiwpuFPQ9LcnK4iD1Q0kNgDig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JiuVuAJj53LKLD+mSxusjS77bJ0O5KOC8PDq78YVEbY=;
 b=Y3diq12LqM8K779DK27vzylZZkmM0EkFTLxey7tqKm3nHDdZ3qlgYYfTURuO41JeI51hlVsIkmk4zJOFUNx1PQvVQnU54PdhatuDteKA1yT7CVX4Xo5E/Z5UrCsM4mybZADTEGTgEAjbYK/j79jizwYsN2CkQpgjw3uk2r6ogXveBIhG2tPfPbohEwmcLJLR9svso4nMcOz72jxbWBsbozC7FIzxbvTAx/HIkHuSXxL5iNxR7e9061EnuSST/zAr7Tc4TNVQwdNWEkoJ48B/MWR0Y3grtHVt8lQXx1zIelk1JBX/VYkJa9B/bO90G0HTGClrSXERHP8xIWKybpYr9Q==
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 MRZP264MB2330.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:7::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.20; Thu, 24 Nov 2022 19:46:08 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fd:d69d:cf17:c18]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fd:d69d:cf17:c18%3]) with mapi id 15.20.5857.020; Thu, 24 Nov 2022
 19:46:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/bpf: Only update ldimm64 during extra pass when
 it is an address
Thread-Topic: [PATCH] powerpc/bpf: Only update ldimm64 during extra pass when
 it is an address
Thread-Index: AQHY/+BWf7gs5QKIpkuwfOKyhRUrWq5N2yQAgAAkjgCAABeygIAAY6WA
Date: Thu, 24 Nov 2022 19:46:08 +0000
Message-ID: <ba982820-0a22-1180-7b3c-b32acae6e9f7@csgroup.eu>
References:  <3f6d302a2068d9e357efda2d92c8da99a0f2d0b2.1669278892.git.christophe.leroy@csgroup.eu>
 <1669284441.66eunvaboi.naveen@linux.ibm.com>
 <9f17237f-94da-f58f-4f4b-0068851b4123@csgroup.eu>
 <1669297066.kxu8xl391n.naveen@linux.ibm.com>
In-Reply-To: <1669297066.kxu8xl391n.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB2980:EE_|MRZP264MB2330:EE_
x-ms-office365-filtering-correlation-id: fd88f15b-1015-4519-6541-08dace54884d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Na5BNWAqvsuuMjoBwWCiWcg/6r291fSQG0P6zxFHaiRJjSSgYAiz6x92GK+xDCx8KWLWiw7yLoyv2m6/R40ZRHXLJlBi1XtcF6Sjdx7hrNk9VLiMuC8j9Z6KgZvIaBF/IPuvAt4UHz42TpCy/wrne26DOmlQhgk9UuWrMAoHeyjXa05CPaGLPkMvZlIwjzVW1YpCleir56/HZBjuRsusD1seLjPVDfhpYHMyt+CoOy6JirPY3KlJ9TvnkKwujZug4GTAFKx4UHTMwFPsPzNkw9vmkMtZakXspRV7Bn1j25SOD89hyyjbz9JEsyjhCt7wGdmo9UfKbGm6hJGDL4fFIUz9PbTdcEv4hIX4mqI/h/LI4MwG7fjcSO6lhN9uwiibxCGmfhel7fq0eoU57T3G3qTAcmU6n1JklhxjDRQJ8KoSYHYLhQymF91rufCsMER213rm2vN8PBazcgBIyKuP/oPjS5v9YBoptYksNO8GvDoDYmtA68VkUgoIx9DwhHlLOOEiDRl3qDrUON3w21xFfTi2ZadW28NjKlibbTvRVpN+jTSdzv3CC/GYSV6RBTwgA9GLxHO6XSNj7X+xRnC3yKdaCbA8702n1C9A7Zfi78CCWHOWvXTXfLhn6McZyRuvMq0BYu1+xkv9202wGuT6qK6NN+6PgsQGAQKSNNy2C56ZB7JLBmiMBbijWVxwy9U1eLz7XCjIK8bNrY6FsVlUY7YCkEPJwzwcYOknBxEYwbB1BA5jB0MgMj2QgjLSWGGYuI0VREGB66LXrbfQLCx4mg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199015)(38100700002)(122000001)(316002)(8676002)(31686004)(6486002)(478600001)(66446008)(31696002)(54906003)(8936002)(15650500001)(186003)(86362001)(41300700001)(44832011)(66946007)(6512007)(26005)(38070700005)(66476007)(64756008)(36756003)(71200400001)(110136005)(66574015)(4326008)(2616005)(76116006)(91956017)(83380400001)(5660300002)(66556008)(6506007)(7416002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?a1VXUmR6VnJMWHNybjFWWFlMOU1mRTZ2Q3diMzFFdzZJWkRwMS9jaEdDekVZ?=
 =?utf-8?B?ejV3M3EwWkMvUjNtL2VDTENYeHJhYW5wYUxKY3ZTN1lnMVVGdGVHZE5NQ1g0?=
 =?utf-8?B?TVRGU3MzWGp2RDQ2OWJQYkdwaVlvT3lJc3MrcTRwbWxzbVZIdUxlWEJaL21w?=
 =?utf-8?B?aTlGTVJKR2M4MG5DRE1UU0dOUnZMVlVjREdTVkhyTGhTMUlVckw5TGNWT1pP?=
 =?utf-8?B?YWpWNXdLWVR4U0lNbzl3UW1kYkliZlZ1ekw5dzh2cmtibCsyNVdTZXR0Y0JK?=
 =?utf-8?B?UHRFbVlBQzBaNXBBelBHT00xT1hkTFVESFFxNUFBQXNiemJnM3MycVBDaWxs?=
 =?utf-8?B?bi9HL2daRnFpNzQreFpzK095V3V5NEx1TURIRGJWRUhzTElYTUNEMllZZGNu?=
 =?utf-8?B?OUZneHh1cCtxZDZsd0owZmFqQUsvdThtczBqZ0ltM0dWTE1oZ0YvS2pQeWVB?=
 =?utf-8?B?V0VKWXlMaWxycm4yWm83eFpwRlpwRGc2dmp4THQ1ZzA1RVU0V3Y4azdCb3RC?=
 =?utf-8?B?cGVuREwySVJkTk9tMjgyaWhJWjhVUmNWMStmSHdWc2NRUUxLeU12dlNWMGgw?=
 =?utf-8?B?a0VBeGczV1BrY1Q0Rm9oaFo1RmUwbWRBN1Z6VHZUdGlCdlIzZkxyZjlsdUxR?=
 =?utf-8?B?MWcrV2ZBaHhWM2RSZ3RlMXAzdFZ2TkxoUVM3clFnMFJFSDhHS2RTRDRyWTI3?=
 =?utf-8?B?RUhKdWdORVpLVFhtNlhIRmNJRUM0d1VLZWRwYjIyMUxaa3NjaHRkd3IyQ3JL?=
 =?utf-8?B?K3dSVjJUV0dNMXJOM2VSRXd1M0JCWkpwV2pOOWxCVU1EYVUxNFhRUWFIcTZy?=
 =?utf-8?B?OTBLcFlFUGJjZk15V3ZQTzMyMUVnNzBBUkVSemF0OVFra282MXFmcklMNVJX?=
 =?utf-8?B?S0FJeUNCelUrUTA3WVZxMXRWR05meUNwNnZWbVdwUkJSblJQdC81ZWRWUzRY?=
 =?utf-8?B?WE9kZU9HeWViQkRKaTZjQlBmY1ZsUlVkVDZrYi8wZ3ZXSGNWM2RYK2xhTWhH?=
 =?utf-8?B?UkNNdDFSVS8vN0w3bG1ZU0NiekNmU0xGNmxKVnVZTGlmUTZ3N0dHMkRjRFh5?=
 =?utf-8?B?dkNKUS9UdGV4R2pjbkI2SmVaQUlsMFhHcHlCeXlDL0pUNjMvUkd0ODAvenFq?=
 =?utf-8?B?bElwa3Q5dEhOSnlTby96di95ZEY0RkxBUUgxVmMwSnhid0UxQjM0WkhTVTZk?=
 =?utf-8?B?V0NRTTZqcDhZOUtNdklhL2xDdkt6S3hNUkc3am1XR1hwMHpOTXptQU00ajJQ?=
 =?utf-8?B?Q1dicnVQUlZMaUZoWVpPMWxFOHVzbC9IQWJBU3cxQzJ6UjBiTWJmakJWbS9K?=
 =?utf-8?B?ODBCemM4RUlFWjRqV3kwQVlrRDVCbmNDNm83ekJNRE41Sk1MTWRDRklaanZL?=
 =?utf-8?B?T285OHBNcE44UjFYbElLbFQ4aEpWSnF6c3hqUzZYamVEczZ4bEVsYWVaUmx0?=
 =?utf-8?B?ay9XU0szWXJQZGRmcWxoYW42QUtISzdaMlZRWXA4NXhiL3FXaXNZZTZzTjVD?=
 =?utf-8?B?Vy9CQWtKUlVaMm1JYm50WHBaMmhOQmc0bko0bkl1c1FITEVQZkJVNjZTcHlz?=
 =?utf-8?B?R2ozODlFd3RKTkswQllGS0x6V2V5MFAwRk1CV1BRbUV6VnpZMFliSU1SRGFn?=
 =?utf-8?B?THYrb2o1a2I0dWpTQ1cxWU10cFRKUjR6UEtyc1JsbU8rRXl3WWNHOWc3UFhY?=
 =?utf-8?B?eStIc2t5UTFUMHNIdmZmeEdaZnJXUjhGMnVVVzUvNEtBei9QN2tuMmlINlFQ?=
 =?utf-8?B?cDZjc3pPNmx2SWdIYktJaEsxNHBoUWU3R0t2VHRpUXBLeGx6b1NJNkY5Mnlm?=
 =?utf-8?B?U2tweEQ4c1IxSy9lVFZjQ1docG9IMDcwbGkzQUI0RVc5clljcG9jTkI3M01l?=
 =?utf-8?B?WWd6UzhwYWRvdC9RUDVUVGZ1N1JJUHV5TFRmbGkyMXBOY3A3SGpJRVlEeEFj?=
 =?utf-8?B?ZzJrdmhkRVJRajdyTTNDbmlWcWg2U1FSNERMcDZ4NHNTU1NpUzlvT3hWZkR2?=
 =?utf-8?B?bk5jUjNDTFE4VytOMmYzQWtseW1oZElUZE1hT0xSdS80SHBHMnZnL09IUDN3?=
 =?utf-8?B?M2N2SW5sWTA5ZkJSd2RZbjc0aHQwVHI2SmthVjNjamhHWGhnWEZwS3A2ZW5a?=
 =?utf-8?Q?ZHWAT7491XoumnP0mbdFJKH+a?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <234F92CFDC06CE46AE7AE256C6B93962@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fd88f15b-1015-4519-6541-08dace54884d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 19:46:08.5069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ELOEtgx5gO0ty3GvHcupUjqumm+EolK21OGdjx2CoppoC16x/tHTfsz65abOZU+vPX5TpK2l6Hcc4fr2zNcAP6rjA4NMH3ds3f7SUxLUN2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2330
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
Cc: Hao Luo <haoluo@google.com>, Daniel Borkmann <daniel@iogearbox.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>, Jiri Olsa <jolsa@kernel.org>, KP Singh <kpsingh@kernel.org>, Yonghong Song <yhs@fb.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzExLzIwMjIgw6AgMTQ6NDksIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+DQo+Pg0KPj4gTGUgMjQvMTEvMjAyMiDDoCAxMTox
MywgTmF2ZWVuIE4uIFJhbyBhIMOpY3JpdMKgOg0KPj4+IENocmlzdG9waGUgTGVyb3kgd3JvdGU6
DQo+Pj4+IGxkaW1tNjQgaXMgbm90IG9ubHkgdXNlZCBmb3IgbG9hZGluZyBmdW5jdGlvbiBhZGRy
ZXNzZXMsIGFuZA0KPj4+DQo+Pj4gVGhhdCdzIHByb2JhYmx5IHRydWUgdG9kYXksIGJ1dCBJIHdv
cnJ5IHRoYXQgdGhhdCBjYW4gY2hhbmdlIHVwc3RyZWFtIA0KPj4+IGFuZCB3ZSBtYXkgbm90IG5v
dGljZSBhdCBhbGwuDQo+Pg0KPj4gTm90IHN1cmUgd2hhdCB5b3UgbWVhbi4NCj4+DQo+PiBUb2Rh
eSBQT1dFUlBDIGNvbnNpZGVycyB0aGF0IGxkaW1tNjQgaXMgX2Fsd2F5c18gbG9hZGluZyBhIGZ1
bmN0aW9uIA0KPj4gYWRkcmVzcyB3aGVyZWFzIHVwc3RyZWFtIEJQRiBjb25zaWRlcnMgdGhhdCBs
ZGltbTY0IGlzIGEgZnVuY3Rpb24gb25seSANCj4+IHdoZW4gaXQgaXMgZmxhZ2dlZCBCUEZfUFNF
VURPX0ZVTkMuDQo+IA0KPiBOb3Qgc3VyZSB3aHkgeW91IHRoaW5rIHdlIGNvbnNpZGVyIGxkaW1t
NjQgdG8gYWx3YXlzIGJlIGxvYWRpbmcgYSANCj4gZnVuY3Rpb24gYWRkcmVzcy4gUGVyaGFwcyBp
dCBpcyBkdWUgdG8gdGhlIHBvb3JseSBjaG9zZW4gdmFyaWFibGUgbmFtZSANCj4gZnVuY19hZGRy
IGluIGJwZl9qaXRfZml4dXBfYWRkcmVzc2VzKCksIG9yIGR1ZSB0byB0aGUgZmFjdCB0aGF0IHdl
IA0KPiBhbHdheXMgdXBkYXRlIHRoZSBKSVQgY29kZSBmb3IgbGRpbW02NC4gSW4gYW55IGNhc2Us
IHdlIHNpbXBseSBvdmVyd3JpdGUgDQo+IGltbTY0IGxvYWQgaW5zdHJ1Y3Rpb25zIHRvIGVuc3Vy
ZSB3ZSBhcmUgdXNpbmcgdGhlIHVwZGF0ZWQgYWRkcmVzcy4NCg0KV2VsbCB0aGF0J3MgdGhlIHBh
ZGRpbmcgd2hpY2ggbWFrZSBtZSB0aGluayB0aGF0LiBXaGVuIGxkaW1tNjQgaXMgdXNlZCANCndp
dGggaW1tZWRpYXRlIHZhbHVlLCBpdCB3b24ndCBjaGFuZ2UgZnJvbSBvbmUgcGFzcyB0byB0aGUg
b3RoZXIuIFdlIA0KaGF2ZSB0aGUgbmVlZCBmb3IgdGhlIHBhZGRpbmcgb25seSBiZWNhdXNlIGl0
IG1heSBjb250YWluIGFkZHJlc3NlcyB0aGF0IA0Kd2lsbCBjaGFuZ2UgZnJvbSBvbmUgcGFzcyB0
byBhbm90aGVyLg0KDQo+IA0KPj4NCj4+IEluIHdoYXQgZGlyZWN0aW9uIGNvdWxkIHRoYXQgY2hh
bmdlIGluIHRoZSBmdXR1cmUgPw0KPj4NCj4+IEZvciBtZSBpZiB0aGV5IGNoYW5nZSB0aGF0IGl0
IGJlY29tZXMgYW4gQVBJIGNoYW5nZS4NCj4gDQo+IE1vcmUgb2YgYW4gZXh0ZW5zaW9uLCB3aGlj
aCBpcyBleGFjdGx5IHdoYXQgd2UgaGFkIHdoZW4gQlBGX1BTRVVET19GVU5DIA0KPiB3YXMgaW50
cm9kdWNlZC4gVG9vayB1cyBuZWFybHkgYSB5ZWFyIGJlZm9yZSB3ZSBub3RpY2VkLg0KPiANCj4g
QmVjYXVzZSB3ZSBkbyBub3QgZG8gYSBmdWxsIEpJVCBkdXJpbmcgdGhlIGV4dHJhIHBhc3MgdG9k
YXkgbGlrZSBvdGhlciANCj4gYXJjaGl0ZWN0dXJlcywgd2UgYXJlIHRoZSBleGNlcHRpb24gLSB0
aGVyZSBpcyBhbHdheXMgdGhlIHJpc2sgb2YgYnBmIA0KPiBjb3JlIGNoYW5nZXMgYnJlYWtpbmcg
b3VyIEpJVC4gU28sIEkgc3RpbGwgdGhpbmsgaXQgaXMgYmV0dGVyIGlmIHdlIGRvIGEgDQo+IGZ1
bGwgSklUIGR1cmluZyBleHRyYSBwYXNzLg0KPiANCg0KSSBsaWtlIHRoZSBpZGVhIG9mIGEgZnVs
bCBKSVQgZHVyaW5nIGV4dHJhIHBhc3NlcyBhbmQgd2lsbCBzdGFydCBsb29raW5nIA0KYXQgaXQu
DQoNCldpbGwgaXQgYWxzbyBhbGxvdyB1cyB0byByZXZlcnQgeW91ciBjb21taXQgZmFiMDc2MTFm
YjJlIA0KKCJwb3dlcnBjMzIvYnBmOiBGaXggY29kZWdlbiBmb3IgYnBmLXRvLWJwZiBjYWxscyIp
ID8NCg0KVGhhbmtzDQpDaHJpc3RvcGhlDQo=
