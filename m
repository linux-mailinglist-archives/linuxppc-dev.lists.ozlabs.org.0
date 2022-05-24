Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AF05325D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 10:58:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6p5X0xXwz3bcv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 18:58:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::601;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6p515y0Dz2ywc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 18:58:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImBAJ/PIt1D6PCtxRvGhltUMr3oHhlO6s1Ny1C8VQHKr8yPdROD9ruVz9Y23mZPmiTuvKR8OiKYSlT1auNXYtgAQHUTxyR+uRhMmlh3x5wbYLCeS1XTQz0xC3ZKE/G+QKurhviFcbGkh+jkpcP240u9EvZaQ1Jch61T7WboOtSb31BinDZsAqHBFxffouhir60pYuhJN0AhBPCoN+bofwAKn+Rf7owiAZz9a0l6LwbLGLwth9BOlUP2aldclTKi68F+2yMDCH1ApugCpbW2N5TdsXToVKOQdWNZZ/UJHzjlQR1iEjK06fd9kLYSHPC2PxL9pHooOSVY2PRBFTyJAwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxl9pOJypERjti+3taVx5+Jnx7x8CBZH8XqL1LmTF5k=;
 b=XW0irjPXiB6FAOls8uSBMe4GbWZNGdDnbzVpQoJouWCeA/0hG9Fi9qfxtUtu0M1tDu7ZDySxd9HtE1+4azZXmDzDQl13wxsp0LtIKsFaCk7rm7Rh2fLoecnzrLasudK5pVyvhFIz4RAie4OPKsUOCELzZLnUoDYwemI464GWg9Miea8HZtxvO6NxNhO0OnHTuZtZGcDeGlurDkEyf67aCFdE67f58Xxz3qro/srBC0eUtZG4jY7EEvEuCjQUOfiVhL26Y1qQt2vj899hAL1sK2Fj4ucSi76HJfSmr7UPDacv5GEkYo0QeAb9HSXm5rQzAKRKL2AbTGvSd2HHbpCGMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB4008.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:253::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Tue, 24 May
 2022 08:57:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 08:57:55 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 2/4] objtool: Enable objtool to run only on files with
 ftrace enabled
Thread-Topic: [RFC PATCH 2/4] objtool: Enable objtool to run only on files
 with ftrace enabled
Thread-Index: AQHYbs5kDECg5GS16kaacJPiXFfVO60tuxeA
Date: Tue, 24 May 2022 08:57:55 +0000
Message-ID: <89012c4c-e989-6092-d4f1-0dc4eca983f1@csgroup.eu>
References: <20220523175548.922671-1-sv@linux.ibm.com>
 <20220523175548.922671-3-sv@linux.ibm.com>
In-Reply-To: <20220523175548.922671-3-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 74a1cc2c-c5c4-456c-58e1-08da3d637e01
x-ms-traffictypediagnostic: PR1P264MB4008:EE_
x-microsoft-antispam-prvs: <PR1P264MB4008584EC95AB42114B943D4EDD79@PR1P264MB4008.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7i7zwBb7ehibt3KB5elBNcDNO/1hmNX7XgT19HEHbguA/0ElhOYHyd+p+rlzk3Y8ZyG0qyNBMH5tPCMpPiTp3KSriHIa6wCfYYgfjNls/7pj9FF1w0rAxwK+FnOmJjdzirDL1a0s3doFAnn6PdzLKWcNkR7I8nLtTH6OSMROO5WXRK6ORScN+u6+eu3C+CZj7jjHIJ1zEdUYOj6ijWKn+onbxdMoFmsCz9qUzp1L1SggqECSLXWrCuICR9C1OFxqiysXsKZVvKipeLcuqQrBeqOX+P4n807bMOd5B5ADsNLONZFcUlqx2zmKEFbVM0vSxIitoy27lzo6By8xdC0PsvFkrzZt45FM9hZC5MuiozD4w5txyySYuaO4PYwymkylszHzXJWfKFBFZAnYNoy6wqu1GlGM52kAwIWOzAaTrAR6eTakalHuumY3Ml7sHEkS8pfODuex67UnFA5HoOhrlNBwCv7I45MtFWt2WDIw0kGNbTWnRhJJ33B4E0nwZgbMWuK7ygoSwTc1GupccFd6v+vrTsq3BxJ7dt8RoWP/eL0qyAOWe6lWAKwHlxK0RTBLNY1UkQqX4w8ekLHqyQw93VT2vpcDp3dF6mCpL1X8dna0FFf7M1HWusodnsd2bMdybB/Gi1WSr/DaoJV1/Q2FyPQpiDuc7l9IK04NNqv18IC1xN95Nc8ClZwquNhM7IcSVm8DPGzHzb3F2Cxd7q8T8NjzbdH370NYhWf2FxDsZKhM3HLBE5+h3Ehv2h345MiSdBUYmLh8LU3JKtE0Ihnf2g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66446008)(316002)(66476007)(2906002)(54906003)(71200400001)(91956017)(66556008)(66946007)(110136005)(6486002)(508600001)(64756008)(5660300002)(44832011)(6512007)(7416002)(86362001)(31696002)(8936002)(31686004)(2616005)(4326008)(8676002)(26005)(66574015)(76116006)(83380400001)(186003)(36756003)(122000001)(38100700002)(6506007)(38070700005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHhMQS9zQ28rQ3Z2YW56YXJYNXdqRVJXUzNnNkxlN0ZKL1IxSEpON1djUE0z?=
 =?utf-8?B?SUdaRDA4YXVNa3crVEhiU3JWOGo1M1lvaTVaN3AxYkg4cDNEQlRJT2lKQXR6?=
 =?utf-8?B?MmVlMmhzL28vdUY1RksyUTFYWllISjdSbDZJUTJxMUpZWmszWnpGMTJGeXRQ?=
 =?utf-8?B?RGcxWGJvTEhZblpMMFAvUmFuN2lmRDJINXh2SDc5NXlKU1huM3VPUHVySG5T?=
 =?utf-8?B?aTNoZEl6eWpPUE5wbzJBT2I2K3BrV0xHRjl1YWdsdkxvemdJdndKbEFLT3lx?=
 =?utf-8?B?WG9rRVBJVUhQRkI3aFdtVG9SUEJqZHRabkYrMFN1dGFaRDFwSjJYRXh3dlRF?=
 =?utf-8?B?REw5ai80ZHhSTytDbTFJdW4vZzhEVUV5OXZPVFdPSnk4TzRkNlNZL2pVVkNV?=
 =?utf-8?B?a040SFprZHFNRU80UGNPUGh1SFFSVkJNTEVkM2ZXbUJhd0Q4cDlPUk4rdlpt?=
 =?utf-8?B?NWVPdDN0UWpYdVRTSjluc1loVmo2N1U3SkIyWnZrV0tielN2bytWeUU3eGJq?=
 =?utf-8?B?UDdGS1c0czRxUHZFK3BpcVZFS2hyTDBrRDBZa3lTRGxGNXFoTWRwOHVSWE4y?=
 =?utf-8?B?Vjk2Q3ZXMDNUQnBBRzFCNndJeVhjQjFmSjM5NlRqM3R4cjU3TjlwbHRvemVu?=
 =?utf-8?B?ZFRkdUFFWUN4Q0FVTHJzbjRSRXllQnBzTUxKL3V1WHY3ZFY3Qk95TUkxbnpm?=
 =?utf-8?B?VFRIaHdNN3JlZnUwUDh2MVRkTWZHNFZtWW1EV1k0NWdhek9waTJzTU93d0VQ?=
 =?utf-8?B?a2FSUjRFYVNzNDQvblBGcFdtMUpDVUpKWDB5Tkx4SHQxRGJjMlZyd3JrWXg4?=
 =?utf-8?B?L2FTK3BWdjN3ajF3SGxwSFZGRlFaVm04LzEyU3dWS0pqUXBTbjlIK3JKamlO?=
 =?utf-8?B?Z3RoaTJVMnVDTzZyd0M5SGdjQ0NCVytnd3M0NWl1YnplVXN5YzRLaG9UVmIv?=
 =?utf-8?B?U3FaMEFsODQ4R0lrUFRIQlJrZHhGWVE3VjRweUNYMDBrNTFrTzEzMXliZUZX?=
 =?utf-8?B?MEFETk9QbXR1REM4cXVFYSs2WXFBZ1g4d3ByaWdUVS9FVjVKeVJHdmNoMVhw?=
 =?utf-8?B?bVZMbWswZWlvYUhPZ3ZnU2JCOTF4dXhjb282bHUrT0ZQWlV5L0QzTG8xVTZp?=
 =?utf-8?B?Z2VsYXRwMHQrTmU2dlNQcEhnbDVCSWxzYitnVVIrazZ5RTVZQ3JaTDNaOUFL?=
 =?utf-8?B?SCtrYXEvbzJFenJ0eWRuOEdtSEpJMnNYTjgzWkFlME81Unp5Mnc1VGR1QkN2?=
 =?utf-8?B?TDJrczZ4eWl6a0VnanJoak1aTnduMzNZR1RtamZ2VWRxanpPR3M0YVEwTHVk?=
 =?utf-8?B?cmFoRXFScDNzSnNEcXg4NmVPV1IzcXQ5YW9GMi9xODFBMFFCODY5QmM4U2xx?=
 =?utf-8?B?T2pPYzFBei9mVWdQUTVoNTVUSzUzckR3OHNSMjVsUzkxem5mT0JxeVhxeVE4?=
 =?utf-8?B?T2lvWHE1ZEgvZUxNdzdoNWMyWUZSNVlOekdITzVVR3lwUnFRUXBmWTU3Zk5i?=
 =?utf-8?B?ZFBsYUg1bnpKU29XSTk2Q3BaRDJoRXczT2ptaDBvNEpnd0ZJNWVocUpoeFZv?=
 =?utf-8?B?Rm9Kck9tQVNxa09iRjdKaDl4Zm42S2N2SW5CaHlPSE1QNE92dVAzaHNHY0wr?=
 =?utf-8?B?TytKWGQrT3JLdi9FcTRVNXFpKzVMT1dRTkVNdGFSUlFqVElmUjIwbHBKS1Zj?=
 =?utf-8?B?bHVVVm9ONHFCNTJ1V2VGVFdmcHRGeGVuRGF2MDMzSXg4dUFoZ2liNzFwdkJL?=
 =?utf-8?B?ejVHeHBYdGpJSDNWREJpOWtHN3dtUDdabnhEMmsrM21xZmRwbjhEemszTTAw?=
 =?utf-8?B?TVZEcU5ZZzlwdkIwWHRnNktXeWlkZjJSdFlOdElxUFhCMTJvd2s1d2M2TGNI?=
 =?utf-8?B?UVZBNmUzR1FYOXFQZkhKNUltUTNaWlY2Ry91a3padXJFWHNMSWhYUnFuOStQ?=
 =?utf-8?B?dUd5Z2xuOENBSDVQa0hsMGFST0NCb2F6WUx1TVIrYlk5aXM3VjU5alNydnhH?=
 =?utf-8?B?YXJ0S1Vkb09LVzFwU3c1T3h4NXkvcElmN3I1VCtIbXk2MzRpMU0ybTBjSXNi?=
 =?utf-8?B?emtLWUJHcFg2QzA3VFF1UUhLRDhWQ1NieWdUaEY0L1h2VGh2Tnp1eUVyT2dQ?=
 =?utf-8?B?Qld2NGExTlNPOE4rbnlBcGxWRFRuTTh3K2ZCRkVIV3c3RWppL1hnbnlmTVla?=
 =?utf-8?B?b2xxM1oyRVhYQjV6dmNKcys2NEpacjJYWWFHamxhekRvczR4Z1dnTGtVQ2J1?=
 =?utf-8?B?TnQ0bTQrdmsvbm9IVkZXRkNYNDhaamN4UEVlZ0xjSVlSTmE4ZC9DNHh1eUVI?=
 =?utf-8?B?VDV4YXI1VU9HQkk2bUV4UGxvZlBjWFJSdEJyVE1tZWs3MGlzZ0VvS2w5c0ZI?=
 =?utf-8?Q?V0Gg2MH8cYqNInwS6kzWrNdgumBJ1huLf1vp1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B97420C6D675F4D82E2C129184B9D06@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a1cc2c-c5c4-456c-58e1-08da3d637e01
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2022 08:57:55.1264 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4GZPwlfF7Y4egFbwWQi+vn2fIHeEMM9U27hs/tOw+7x2CBtRULyHYVeMEsEqFDVArQY2M//0pfKhD8yIncfZ+0Kc+6mLUAYfeGpOfA94mSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB4008
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
Cc: "peterz@infradead.org" <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "mbenes@suse.cz" <mbenes@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIzLzA1LzIwMjIgw6AgMTk6NTUsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBUaGlzIHBhdGNoIG1ha2VzIHN1cmUgb2JqdG9vbCBydW5zIG9ubHkgb24gdGhlIG9iamVj
dCBmaWxlcw0KPiB0aGF0IGhhdmUgZnRyYWNlIGVuYWJsZWQsIGluc3RlYWQgb2YgcnVubmluZyBv
biBhbGwgdGhlIG9iamVjdA0KPiBmaWxlcy4NCg0KV2h5IGRvIHRoYXQgPw0KDQpXaGF0IGFib3V0
IHN0YXRpY19jYWxscyA/IFRoZXJlIG1heSBiZSBmaWxlcyB3aXRob3V0IGZ0cmFjZSBidXQgd2l0
aCANCnN0YXRpYyBjYWxscy4NCg0KQnkgdGhlIHdheSwgaXQgd291bGQgYmUgbmljZSBpZiB3ZSBj
b3VsZCB1c2UgaXQgb25seSBvbiBDIGZpbGVzLg0KSSBnZXQgdGhlIGZvbGxvd2luZyBlcnJvcnMg
Zm9yIEFTTSBmaWxlczoNCg0KYXJjaC9wb3dlcnBjL2tlcm5lbC9lbnRyeV8zMi5vOiB3YXJuaW5n
OiBvYmp0b29sOiAudGV4dCsweDFiNDogDQp1bmFubm90YXRlZCBpbnRyYS1mdW5jdGlvbiBjYWxs
DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5hdmVlbiBOLiBSYW8gPG5hdmVlbi5uLnJhb0BsaW51
eC52bmV0LmlibS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFNhdGh2aWthIFZhc2lyZWRkeSA8c3ZA
bGludXguaWJtLmNvbT4NCj4gLS0tDQo+ICAgc2NyaXB0cy9NYWtlZmlsZS5idWlsZCB8IDQgKyst
LQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9NYWtlZmlsZS5idWlsZCBiL3NjcmlwdHMvTWFrZWZp
bGUuYnVpbGQNCj4gaW5kZXggMmUwYzNmOWMxNDU5Li4wNmNlZmZkOTI5MjEgMTAwNjQ0DQo+IC0t
LSBhL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQNCj4gKysrIGIvc2NyaXB0cy9NYWtlZmlsZS5idWls
ZA0KPiBAQCAtMjU4LDggKzI1OCw4IEBAIGVsc2UNCj4gICAjICdPQkpFQ1RfRklMRVNfTk9OX1NU
QU5EQVJEX2Zvby5vIDo9ICd5Jzogc2tpcCBvYmp0b29sIGNoZWNraW5nIGZvciBhIGZpbGUNCj4g
ICAjICdPQkpFQ1RfRklMRVNfTk9OX1NUQU5EQVJEX2Zvby5vIDo9ICduJzogb3ZlcnJpZGUgZGly
ZWN0b3J5IHNraXAgZm9yIGEgZmlsZQ0KPiAgIA0KPiAtJChvYmopLyUubzogb2JqdG9vbC1lbmFi
bGVkID0gJChpZiAkKGZpbHRlci1vdXQgeSUsIFwNCj4gLQkkKE9CSkVDVF9GSUxFU19OT05fU1RB
TkRBUkRfJChiYXNldGFyZ2V0KS5vKSQoT0JKRUNUX0ZJTEVTX05PTl9TVEFOREFSRCluKSx5KQ0K
PiArJChvYmopLyUubzogb2JqdG9vbC1lbmFibGVkID0gJChhbmQgJChpZiAkKGZpbHRlci1vdXQg
eSUsICQoT0JKRUNUX0ZJTEVTX05PTl9TVEFOREFSRF8kKGJhc2V0YXJnZXQpLm8pJChPQkpFQ1Rf
RklMRVNfTk9OX1NUQU5EQVJEKW4pLHkpLCAgICAgICAgXA0KPiArICAgICAgICAkKGlmICQoZmlu
ZHN0cmluZyAkKHN0cmlwICQoQ0NfRkxBR1NfRlRSQUNFKSksJChfY19mbGFncykpLHkpLHkpDQo+
ICAgDQo+ICAgZW5kaWYNCj4gICA=
