Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F1E52B948
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 14:05:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3BWf4lTlz3cLh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 22:05:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::630;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3BW84wBgz3bnZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 22:04:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARKu3STw5qyeMMDupVqqeLYLjY9hWoi+77RNazcV4j+cRxcutzxii+KhuKIaWn4OmaWGv8DFV0isXKymyJL7TVe0pBj7ih+b/WbfhA2JsSPjvINysYQMPdU6yGzqS4fxiCOnFXYqBsu36tuvWJC48X3zj5Im/mHHWN9QcNTn5D+xllbo1Z4zZ7aXCB7ArjFlSZkiMatkC3Yvn1zhg0fq4wBnf7jh5YO/zoOMGrZMvkYBik+x6/3eURjt/8AFhBvt10tYw+p9myCdBnT4LtvAmi6LaceoBR9XfvakB6Phb6DNf0U3UkKPBLscQsYJlToKt9S1KkxuZeUPYZY8LJhYkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lP0oP8TGaP6VrATCRKf57XhNTlUuTo3e7Sb2QMMDY8=;
 b=jQStHQlHu1/9z6N6EJ7ULnMoC/qKdoMN+nPQBOslZrdAJMEWPEliDs4fmO0PO00ihWMikbypnwgftz540X4auXX5K5plCb792WEhee63AMqOOtA3DrZS0/9pprS8DXnc7rqNMwLafIvLPo/7Y0siDvW+1lFnAKemWajUYxfC66KlQdsDe0MhSTw8VofFqlxHj2+2g41sezRl6+6iOiU6SIqgpBbKsjk8jXaq0YG9WoztXoYdlXbEEVtNQjiGL5/khovISKN3fDbVZ1ZWFafOsgkGyOAE7xm0BROcuFy+xBdxv4VCim3b5yDlM2AVacVlGOHOsrdkhdQ/b7s8PhOUYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3087.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Wed, 18 May
 2022 12:04:28 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d%8]) with mapi id 15.20.5273.015; Wed, 18 May 2022
 12:04:28 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v3 19/25] powerpc/ftrace: Minimise number of #ifdefs
Thread-Topic: [PATCH v3 19/25] powerpc/ftrace: Minimise number of #ifdefs
Thread-Index: AQHYY2bDo7452AR5CUeMZrEOJfuwwK0kcUMAgAAaGwCAAAysgA==
Date: Wed, 18 May 2022 12:04:28 +0000
Message-ID: <24d21ab6-06f6-8958-b8e5-ae0c228f55a8@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
 <18ce6708d6f8c71d87436f9c6019f04df4125128.1652074503.git.christophe.leroy@csgroup.eu>
 <1652866821.cdcfe8bs78.naveen@linux.ibm.com>
 <87leuznl5h.fsf@mpe.ellerman.id.au>
In-Reply-To: <87leuznl5h.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2a5d8bc-8d35-41bf-281d-08da38c68f21
x-ms-traffictypediagnostic: PAZP264MB3087:EE_
x-microsoft-antispam-prvs: <PAZP264MB30878EC6DFF544FE2753E940EDD19@PAZP264MB3087.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gLJ7+TbzIf65eKRae7YwRZyEhWJMkJmr7fmFTaZos8+ONbQRpDB21H+BPuuJfu8oUGu5UW52H6T35EKc/inGOI5vxQJXsMfRQCyMzZkqHPD0e9vfxWqllWaFnMYTTFEuEa5Wafm8kGZ2gbaRTDqurSCuv2vtH7Lkl0UqFYz6hz2SX9/z/5o9u3dqQMtbZWH2cXAODCAVI2O+o3q5l44n5efviKmnhXKQaQaxDQ6D228KZhdqenTYu/bP5Y3XT6viWNecaCl5fNy2UN97Ww3ZOtwinsmEmYdghrICQN4C7wAQ+1P/zHLkig0FOUSmqmbdsyMv1A65hKyH5UIZC32hAEs2fe8iHbkVWhX77sft2+z5VeSRXHG3PVupqpVP78jztGjLEQEJ27ivMLtb7fAizdIRLHLZOacItf9AzU8qCRaPp8to9+lE+i1vXHWOdpuaqtVCfHRePilPkL046J72UJk9yAgqWG20tgri86jO5rUrsF4cVaU8Khv8oolJNlhqnJZCcwqWCd/5LSS69nCoEDbn3VaqtrT2UIjJFuaOZni+ucE1HBj7A+ZBfZ3AvYkiCQVGhX0wzUIbkwI5Z8bYb27dV/7+wPvYhMNLn7wq4ckplYHxKoIQY3hgc6gW9CzanDXTx3l7NQHsQN/YApoNihZWh0dWY6gmdcDR4cGNE3iB7SG/c9Abqm7kTIuT4HgkiSuJa3n8Q4ktBZ8O0bZIbYwGKnWRTZKStegunEqOi54V6J9FhPy5YzNEkr8l39izBErjr65G25RyRK1a23qAgadGgqvSoxvhEX9XOLPvWiyoA9IDMCO1En7hje4QqAyN9KWNnwBfIKfU9A5CYMemsjHHXoI5u3pOVjA4rxetsLU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(316002)(64756008)(508600001)(966005)(2906002)(66476007)(66446008)(4326008)(110136005)(54906003)(86362001)(38070700005)(66556008)(8676002)(31696002)(122000001)(38100700002)(71200400001)(76116006)(5660300002)(6512007)(186003)(31686004)(44832011)(66574015)(66946007)(8936002)(2616005)(83380400001)(36756003)(6506007)(91956017)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlpQcW15UjBqalRLRGp3Wm5TMVhsOGYxQ0RHa240aEdMdGZrYzVtM0Q0U2tl?=
 =?utf-8?B?Y2IrR25Mazc3SjRWZVNrcGRPWlI5UmY5NGZiSzFkTTQzWHlSTWU4S2QwcXlP?=
 =?utf-8?B?L1pDcEV5a2VJNGRmSG02NTR5dXFib1ViczZHMWVWWHMweTdYT2JnSGhlNVJQ?=
 =?utf-8?B?TjhHRU5vN1lEU21MNFBlNHhXaVp1bFNURDhJMHo4VWpJR0wyb3lUYkJMK2VT?=
 =?utf-8?B?MnUvS000d1RvSTRqSTY4bEpXODRPU3NmaXJJKzhkaWh5aGtJaFFXUjNqcmRw?=
 =?utf-8?B?OWRiZ2czTVloS2tCdTZUeGQ4ZDAxaThITWI5Z2xJRVJmUEc0UTBTOExxRDJt?=
 =?utf-8?B?ZjhFaENBS3ZTaW1NTFpwbDBXSE01bGFyaXBUbjZEM1RQZ3N6bVdkZEltVVdO?=
 =?utf-8?B?VHplSnpNdjkrSDFQYlltQVFXSDM5aU5VMDhMTm12L0ZoUTdKQ1lSak1yeGli?=
 =?utf-8?B?VnpCS2kwV3VQSjdOMDRyRGxNcEJUdmo4TGc5dWtGcG5tSzVPYjA2YkRyQW5r?=
 =?utf-8?B?L2VXREV0L1orT09mVmN1dTQzUlgrVUljb2hTZHVRdVFqTzVwbGxmVmQvS1Y4?=
 =?utf-8?B?Z1F1TlVjOWJZZkcwd0d3M3d2a0tSUlFEMWpMbWIva1pnR0E2Y2pHMzBUT3pT?=
 =?utf-8?B?dWNOd1ZrcFVWcG9acHNyOU9oQnoyU1pKQVVVd0N2VHpiOE8yNEtmenp0d2ZB?=
 =?utf-8?B?RlJmMEFZU2d0R21iZXRFeTNwREN6NDAwM0RTdGRFMkxMVzhmUWp6SEpyMzVK?=
 =?utf-8?B?aVR5d0JsdGE1c0JEMUlMV2xqaFh4ZitoQkw3dGVLTUxNNTVVcSsxUTFZbjNx?=
 =?utf-8?B?MEJtYmFLY0VQOEJwRVRuU3JXT2xpNmIrMUZCRnRRVlNBVnVkeUFteWkyMjVC?=
 =?utf-8?B?cGpzVE5WeDVTbTB2TzZPZUZiU3loL0crekNkTmJzYVpHaXJRVXlKWnNHK2ZU?=
 =?utf-8?B?RDYyejd2U282YnBiaWd3WUlOWlFQNm9KS01WMmx6Q3BKTnVhYnlKUk9UT0hR?=
 =?utf-8?B?V25MZVR1MmhkM1BManpHSWxNMkNxdWdta2ova1Z3UzhHcHV6TEJodFg5RHNF?=
 =?utf-8?B?V3E2ZDVpem10bU51UTA0YkRWQjl6bUw3M3kwSWNJc0Vwa2gxU2dhWUVCSXdn?=
 =?utf-8?B?N0xMbUJ5cW1NdzFEbWNqanpsMXZjZ3JzbGZkb2kwbnZmY0FBUEQxQnpFaWM2?=
 =?utf-8?B?NWFiY1E1NTcxSkJGWUxTV1RoZWtDTzl2VnBwelZPc1NqOW12bmtUTGdHRDhC?=
 =?utf-8?B?Skx6RmsrTW43bmgxZ0lzZWlVY2htZEVKUE82cGVNZUxiS0RnRDFqWWRqZ1ZO?=
 =?utf-8?B?NWcrZ0Z4TW42TGVIVGRGeFY0ZEFPSEZVcmZsZ0d3TzBMZ2pIampSMzduNXQy?=
 =?utf-8?B?NXJ0c3dUUmhYOWMyMHJzK000dlNMUzdSNklCY3VaQkZHR1VudjRJVkxIQ2lN?=
 =?utf-8?B?V1pEamc4aGIyUlVTQkxMdWxxTyt2V3hBeTd2SU8wU3FBVktNb2s4TTQ0ZTRD?=
 =?utf-8?B?SWZTSnJNc2NrNDZKazM2Q1piMEg4Q1Q0dEVTRWlGbXlBcUFJTkZ3NlBwYzdD?=
 =?utf-8?B?MkJPNXpDKzQ0aVFXWEJTS0wzN3lrYjhvcjBlK20xL05pdVc5bm1kakdYdzFz?=
 =?utf-8?B?eUVJQ05BaDJmWlhKSnRzMzlHYUxYTnF6dHZtNSt5TjlDbW1SUnN0dlY3Q3gv?=
 =?utf-8?B?ekEyTGRwQnRMYm1oV3pIeXF1a3lOVEtZUm0zblJDY1NmSWlXV3ZEUVRxRTZX?=
 =?utf-8?B?eUhwM1lmZk5GdC9janhTTHJLTW42Zkd0dVB5ajFjUzZZb2J6bno2RHFpWDY0?=
 =?utf-8?B?MVcxNVhRMk9HTXg3K0tSOHBvdTRrYzgvV3ZKbzc1OWxkL0J1Q0NGdEh0cFQy?=
 =?utf-8?B?RFZyOWhTN05JY0ljN1RzWWtZU1o1aDlpTklwN3g2S241MlJ4Ris2eVMvV2dW?=
 =?utf-8?B?K2JVMGVpTkJaSXEvdXJINFN1SUhEVTU2aWc2eG9sZFEvYjl1ZVhwNTFTWWZw?=
 =?utf-8?B?NGljdytCYjh6cnpKcnZkOTdmNmU3YzhDOE0wb0szeExrTjJzeG1RUE0vRXFo?=
 =?utf-8?B?dTNoNDQ1ZHE5L2l1d2VwdTJTRXkxbDFqVGJJVXpYVHFKbTVqazNwR25rMGZ0?=
 =?utf-8?B?Y0JVMGp3QUdKNi9GMXVNczF6ZTRtbkwwQkhNZmZkSi9UWURrVTdpTFBxWXhK?=
 =?utf-8?B?VDkwSk5aWHpiRWo4UWpxVThPcXI3TWFic0xoTzVYbkJkcHVqTTdPbExoZ3R0?=
 =?utf-8?B?bXNrUG83L1BGWVNNNXNkVlFoQmVxbk9Ibm5IQmVpMDlsMkpOKzd4NHdqMVJp?=
 =?utf-8?B?TnJZWkNZUEFQSys5UEdUNVJGbWc3dHVsVnRlVndTS0Z2bnlPM1pyNzZYK2hQ?=
 =?utf-8?Q?BA7IEdxUJKIG2FIhlKG6aJDpfR/ffVKwVgFQv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB1D638A2132424FAB27D7FB681AA02C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a5d8bc-8d35-41bf-281d-08da38c68f21
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 12:04:28.2028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8nL/iCCx4c07IggLuQZpZRnSAa1uidBvaCBLBK8Po2biRwdiv83dJ46UGrf1+S/Epn2R/FjyJyAy7t4HhnGUqdhB3LVTcxeMnBUGYrfw4JM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3087
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE4LzA1LzIwMjIgw6AgMTM6MTksIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gIk5hdmVlbiBOLiBSYW8iIDxuYXZlZW4ubi5yYW9AbGludXgudm5ldC5pYm0uY29tPiB3cml0
ZXM6DQo+PiBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4+IEEgbG90IG9mICNpZmRlZnMgY2Fu
IGJlIHJlcGxhY2VkIGJ5IElTX0VOQUJMRUQoKQ0KPj4+DQo+Pj4gRG8gc28uDQo+Pj4NCj4+PiBU
aGlzIHJlcXVpcmVzIHRvIGhhdmUga2VybmVsX3RvY19hZGRyKCkgZGVmaW5lZCBhdCBhbGwgdGlt
ZQ0KPj4+IGFzIHdlbGwgYXMgUFBDX0lOU1RfTERfVE9DIGFuZCBQUENfSU5TVF9TVERfTFIuDQo+
Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95
QGNzZ3JvdXAuZXU+DQo+Pj4gLS0tDQo+Pj4gdjI6IE1vdmVkIHRoZSBzZXR1cCBvZiBwb3Agb3V0
c2lkZSBvZiB0aGUgYmlnIGlmKCkvZWxzZSgpIGluIF9fZnRyYWNlX21ha2Vfbm9wKCkNCj4+PiAt
LS0NCj4+PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9jb2RlLXBhdGNoaW5nLmggfCAgIDIg
LQ0KPj4+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL21vZHVsZS5oICAgICAgICB8ICAgMiAt
DQo+Pj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vc2VjdGlvbnMuaCAgICAgIHwgIDI0ICst
LQ0KPj4+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC90cmFjZS9mdHJhY2UuYyAgICAgICB8IDE4MiAr
KysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPj4+ICAgNCBmaWxlcyBjaGFuZ2VkLCAxMDMgaW5zZXJ0
aW9ucygrKSwgMTA3IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pg0KPj4gPHNuaXA+DQo+Pg0KPj4+IEBA
IC03MTAsNiArNzA3LDkgQEAgdm9pZCBhcmNoX2Z0cmFjZV91cGRhdGVfY29kZShpbnQgY29tbWFu
ZCkNCj4+Pg0KPj4+ICAgI2lmZGVmIENPTkZJR19QUEM2NA0KPj4+ICAgI2RlZmluZSBQQUNBVE9D
IG9mZnNldG9mKHN0cnVjdCBwYWNhX3N0cnVjdCwga2VybmVsX3RvYykNCj4+PiArI2Vsc2UNCj4+
PiArI2RlZmluZSBQQUNBVE9DIDANCj4+PiArI2VuZGlmDQo+Pg0KPj4gVGhpcyBjb25mbGljdHMg
d2l0aCBteSBmaXggZm9yIHRoZSBmdHJhY2UgaW5pdCB0cmFtcDoNCj4+IGh0dHBzOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvcGF0Y2gvMjAyMjA1MTYwNzE0MjIu
NDYzNzM4LTEtbmF2ZWVuLm4ucmFvQGxpbnV4LnZuZXQuaWJtLmNvbS8NCj4+DQo+PiBJdCBwcm9i
YWJseSBtYWtlcyBzZW5zZSB0byByZXRhaW4gI2lmZGVmIENPTkZJR19QUEM2NCwgc28gdGhhdCB3
ZSBjYW4NCj4+IGdldCByaWQgb2YgdGhlIFBBQ0FUT0MuIEhlcmUgaXMgYW4gaW5jcmVtZW50YWwg
ZGlmZjoNCj4gDQo+IFdoZXJlIGlzIHRoZSBpbmNyZW1lbnRhbCBkaWZmIG1lYW50IHRvIGFwcGx5
Pw0KPiANCj4gSXQgZG9lc24ndCBhcHBseSBvbiB0b3Agb2YgcGF0Y2ggMTksIG9yIGF0IHRoZSBl
bmQgb2YgdGhlIHNlcmllcy4NCg0KV2hpdGUgc3BhY2UgZGFtYWdlIGl0IHNlZW1zLg0KDQpJJ2xs
IHNlbmQgeW91IGEgcHJvcGVyIGZpeHVwIGZvciB0aGF0IHBhdGNoIGluIGEgZmV3IG1pbnV0ZXMu
DQoNCg0KPiANCj4gY2hlZXJzDQo+IA0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJu
ZWwvdHJhY2UvZnRyYWNlLmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jDQo+
PiBpbmRleCBkYTFhMmY4ZWJiNzJmMy4uMjgxNjlhMWNjYzczNzcgMTAwNjQ0DQo+PiAtLS0gYS9h
cmNoL3Bvd2VycGMva2VybmVsL3RyYWNlL2Z0cmFjZS5jDQo+PiArKysgYi9hcmNoL3Bvd2VycGMv
a2VybmVsL3RyYWNlL2Z0cmFjZS5jDQo+PiBAQCAtNzAxLDExICs3MDEsNiBAQCB2b2lkIGFyY2hf
ZnRyYWNlX3VwZGF0ZV9jb2RlKGludCBjb21tYW5kKQ0KPj4gICB9DQo+PiAgIA0KPj4gICAjaWZk
ZWYgQ09ORklHX1BQQzY0DQo+PiAtI2RlZmluZSBQQUNBVE9DIG9mZnNldG9mKHN0cnVjdCBwYWNh
X3N0cnVjdCwga2VybmVsX3RvYykNCj4+IC0jZWxzZQ0KPj4gLSNkZWZpbmUgUEFDQVRPQyAwDQo+
PiAtI2VuZGlmDQo+PiAtDQo+PiAgIGV4dGVybiB1bnNpZ25lZCBpbnQgZnRyYWNlX3RyYW1wX3Rl
eHRbXSwgZnRyYWNlX3RyYW1wX2luaXRbXTsNCj4+ICAgDQo+PiAgIHZvaWQgZnRyYWNlX2ZyZWVf
aW5pdF90cmFtcCh2b2lkKQ0KPj4gQEAgLTcyNCw3ICs3MTksNyBAQCBpbnQgX19pbml0IGZ0cmFj
ZV9keW5fYXJjaF9pbml0KHZvaWQpDQo+PiAgIAlpbnQgaTsNCj4+ICAgCXVuc2lnbmVkIGludCAq
dHJhbXBbXSA9IHsgZnRyYWNlX3RyYW1wX3RleHQsIGZ0cmFjZV90cmFtcF9pbml0IH07DQo+PiAg
IAl1MzIgc3R1Yl9pbnNuc1tdID0gew0KPj4gLQkJUFBDX1JBV19MRChfUjEyLCBfUjEzLCBQQUNB
VE9DKSwNCj4+ICsJCVBQQ19SQVdfTEQoX1IxMiwgX1IxMywgb2Zmc2V0b2Yoc3RydWN0IHBhY2Ff
c3RydWN0LCBrZXJuZWxfdG9jKSksDQo+PiAgIAkJUFBDX1JBV19BRERJUyhfUjEyLCBfUjEyLCAw
KSwNCj4+ICAgCQlQUENfUkFXX0FEREkoX1IxMiwgX1IxMiwgMCksDQo+PiAgIAkJUFBDX1JBV19N
VENUUihfUjEyKSwNCj4+IEBAIC03MzMsOSArNzI4LDYgQEAgaW50IF9faW5pdCBmdHJhY2VfZHlu
X2FyY2hfaW5pdCh2b2lkKQ0KPj4gICAJdW5zaWduZWQgbG9uZyBhZGRyOw0KPj4gICAJbG9uZyBy
ZWxhZGRyOw0KPj4gICANCj4+IC0JaWYgKElTX0VOQUJMRUQoQ09ORklHX1BQQzMyKSkNCj4+IC0J
CXJldHVybiAwOw0KPj4gLQ0KPj4gICAJYWRkciA9IHBwY19nbG9iYWxfZnVuY3Rpb25fZW50cnko
KHZvaWQgKilGVFJBQ0VfUkVHU19BRERSKTsNCj4+ICAgCXJlbGFkZHIgPSBhZGRyIC0ga2VybmVs
X3RvY19hZGRyKCk7DQo+PiAgIA0KPj4gQEAgLTc1NCw2ICs3NDYsNyBAQCBpbnQgX19pbml0IGZ0
cmFjZV9keW5fYXJjaF9pbml0KHZvaWQpDQo+PiAgIA0KPj4gICAJcmV0dXJuIDA7DQo+PiAgIH0N
Cj4+ICsjZW5kaWYNCj4+ICAgDQo+PiAgICNpZmRlZiBDT05GSUdfRlVOQ1RJT05fR1JBUEhfVFJB
Q0VSDQo+PiAgIA0KPj4NCj4+IC0gTmF2ZWVu
