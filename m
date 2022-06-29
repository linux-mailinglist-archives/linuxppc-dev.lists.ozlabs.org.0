Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1157E55F91F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 09:36:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXtYd6B90z3dpQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 17:36:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=dCLJPF/u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.80; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=dCLJPF/u;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120080.outbound.protection.outlook.com [40.107.12.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXtXw46Fzz2xTc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 17:35:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZioiwLiS/aTudu3ZdIMkbQOT2nOWmUr/ShPOGAHOvF1pzK+Hb/xsT5stxk27ruStz4W/yfwtQQtWCfEu8hGRuYInJ1DOzqoNqk+naSy7d+X5s76CeYWK+aOfKd31eCc5m6L4izQBqhfK4U8L9QAT/hTOIwkZH6SaSQx51i3vpcmX16NF++AOTXUb4+T3u0J43AUIGFzC40jw4TCjWCMjnVcj/62kBf5YNlGGjDCX1bRyLJai9PxJ8SYfvuzs56Z+ncjDMaLSqILtMSkJmpzFTIB7Wg+t7Bygci3qtESJucwnAe0+dGyvr7ryj1+XrviLkabwiQbV4fPtqmS8hclVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AefbEkyJvWDBbSgS8lQMvKbuzWFfTOPvMReMuuTVRt8=;
 b=LVNgcZ2YhH83HujEdLIEc8wy2i/3dvUrD3aIsj/LtIqMCf2rolY/EyN/hBwnN5s0SNA/0Yit7U47/5mnXlISGzSS6YuDM585gxtnXn9TMMJmXAa8qbkCPgtmynoIfB+EwonH/0+PuUvmxUB+K2MqVFxh+5tg71ErssgEg11PHCrrLOI5Aa6mOspDlm/SEzcMAZcuJv5n88nHcTViKKuQemPEkqGBl6x2u+semqPQSpn9tWYUFNOqkgQ3JIMJF0P+zO7/pzFGdtoj7sgP3jj2HLABvowQ6EYxPE7eC4InS3zN3Blm0nA7usXUQfkI+NR150kgnI+YbWa6yZvRwt2iIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AefbEkyJvWDBbSgS8lQMvKbuzWFfTOPvMReMuuTVRt8=;
 b=dCLJPF/uXMMeR6cxOKU7BislDnHL3l+Wt6gX6VtOlsZ8d85VmJmYGn3KUBAnMUU5kLL6MVFf/Cf1CuVlQtB9Wvn14+sgzgh8gyBzQX8pV83R/XcZTYo5cd/8EjNZvz5ERaAF1NSGuSaox2v2Net61jqvbahhXW+HK8pD3bUJ91g7LPajwWaBAAA0zPt4FYv0uPU0g2hozHsO1wd47eMZ6NxBdst/UXEuiwdiwB8D/Ika6H5g/HncLP+0zy/0c+VKaeiKk/Q0igDjefYRr03RHoVp2o1Ydxy2G1v2k0earQApE6Riv2ohcWfCo0vX0hxClYk7Vb9jTxLzzwSZBxrPYQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2885.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 07:35:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44%3]) with mapi id 15.20.5373.022; Wed, 29 Jun 2022
 07:35:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "GONG, Ruiqi" <gongruiqi1@huawei.com>, Kees Cook <keescook@chromium.org>,
	Marco Elver <elver@google.com>
Subject: Re: [PATCH v2] stack: Declare {randomize_,}kstack_offset to fix
 Sparse warnings
Thread-Topic: [PATCH v2] stack: Declare {randomize_,}kstack_offset to fix
 Sparse warnings
Thread-Index: AQHYi4kwZkw/dESsW0e+vxWYeoL4l61l/mwA
Date: Wed, 29 Jun 2022 07:35:06 +0000
Message-ID: <b59a7b51-141e-cc80-eb09-a357d3853c11@csgroup.eu>
References: <20220629060423.2515693-1-gongruiqi1@huawei.com>
In-Reply-To: <20220629060423.2515693-1-gongruiqi1@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7f7b0cb-3a87-4f7f-56d8-08da59a1e32d
x-ms-traffictypediagnostic: PR0P264MB2885:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  +UOL0iQV2UAyPiA/u1+c6oLXdMHw0xgXVo+1iRjZvalNrPkQTYLeM/uUQXZ2H1tmrHvqFUi/wgw/wht/Hq4ICsZjCzx06l439+IZGJf6VGIVMkgSbcU7IPdf7ZoXqzsSJmWs30FkZS3bJadIZIuRRuAohcBzarp/75e11YDmBukjQ5GxzRVLgUJYaWRf6ux76INGj6SqdWaN6CaRb0cPdyuTwPBd4WfT7985dJQCSseLGyFQHHyqDSjB2R8fC3F5uxufwvvRsxO3zgTf6eYHjC2Tm4VVXoNw+48G1ch5hjaawNyGgqDdp9bYQSoepVItmdXBbKBvKI4x3EVNu5dl7OpodGqwi0WkIZEAClEFXis966MakYj144zVbOMbltt64fFN+XHz2sGXtgAJdGJE0V6Zx0oBUQqgmFyK1zPoOjXoRMOefaobO32oAikD62Ejz7hledhtfzudODYKSeTfLzV+naHfKRe6SJ7bfr+bPLbdDtXJm9vWsaNp04YsZph1VoPZNgQwt3yHw51hQFfJRiUSqr4/nwg8VlnI4ycIYwEaYspOT1ChCBMk3hcoDNjHkliDtlYITJ4dCFsk8gQuCjS6mxtIQWyInan+EJcZBn6dfFWhYujUArNoTN670MRLXlrodzxlKKp66rPBL9zKlunGce4dQiXgBXsVGTzcIh0c4P/4sLqMh4scjWvpyKZdmr8yMBTgbUy0nTDy+wYKenDWftKX9/I/VZpzQ/+Q9Twn9s2HvtjXVnHgKcFkgwbDnTEkTyUmjGZmW3CrCpTXZd8V5lYLA+ODFCA/mrYrAhBFlbYkxgzu5EhXo2T9c5FeMWIOKc4e6uULpGd4I4SOIrIuAXYNKR0JZY36GyL65AKU7byvX1Rfx255pVsmNMFXFcDNv05OSjNUDsWEy0E3Ew==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(376002)(136003)(39850400004)(396003)(38100700002)(122000001)(186003)(8936002)(36756003)(2906002)(31686004)(5660300002)(83380400001)(316002)(66574015)(110136005)(54906003)(2616005)(64756008)(86362001)(66476007)(966005)(66556008)(6486002)(44832011)(8676002)(31696002)(66946007)(71200400001)(4326008)(38070700005)(91956017)(6506007)(76116006)(6512007)(26005)(478600001)(41300700001)(66446008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?a1hkWXFRaXliUkZTUnpxdHY1aWNqeWlrSGxtZEpJM2lnczhOMWJXT0ZIY1FE?=
 =?utf-8?B?bUNqeHVIa0V2TDZMa2tiZDFPRUNKRXVvN0s1N0FGMHMyc1kzNDk0bVBWQVZM?=
 =?utf-8?B?WHJxTi9oam9iQlJyOExjL0tYVnRXVU9neEpJL29ib0pOalZoL0Vpa0RyNmZ5?=
 =?utf-8?B?OW41QlQzUUFKSmFkYnJRdWUwZmFJOGR4M1RDK0xoS2ZOM3JiSWxyZFdwNlFp?=
 =?utf-8?B?MVJ3SGZEazdMOXkraGgzRnlLdlZlS0YraXVSNExuQ09DVWxXeDIveXpZU3pY?=
 =?utf-8?B?THkrdDVhZ014ZUQ0TjZmVGc4UkV2Ti9KVkNzM0wzMFo3ejF6dUJHWFYxQ2pq?=
 =?utf-8?B?V3NIaHQ5eklBeDlPQXRoWFFmemN6U1E5MHBpQzc0K1pQLy9Kam5yMzIxMDM1?=
 =?utf-8?B?ZmFFU0dQTDNxVWgxRG5yNnNmdnJLZjRmb1dJOTd4OGtkbnJJZ1VEVGhOWEV3?=
 =?utf-8?B?RDZRQm1hRUVwUVhtZ21YdXllVlFkSStmUU1tQm42MWYxaGxTSmVQM3h5bkYx?=
 =?utf-8?B?ZXcyTG01UllscU1rN2FLWTQ5RHlUS2xPM0h6Tko1dEI3OU1nMkJyWmswSlVQ?=
 =?utf-8?B?aFVyT3pGdEFzK2g2ejdMZ2RWbVg5NHRCb0VTVHJRbWFOQVBBL05LVmsrUTBO?=
 =?utf-8?B?TG4raDZSTjJVMC9uODRJLzJNWE84TTVOaDVSVDdBcm5vdFhGOG5rU2d2N2J2?=
 =?utf-8?B?aVRBYVZwUjEybnNNNjJhWjJSZU1xVFVyRkRRR2tPSGZpWk0yN1J2Vy9xVFNv?=
 =?utf-8?B?dFpuVkgyK0tYK3NKK0xGL1Z2VTFvRHZRRmd0SkJSaWttSlR4T0VjTXBiTkRY?=
 =?utf-8?B?OXZocGdoYXBFajJjOHJkWlAzMis3U1FEd0pkUFdNSm0vU3ZTbXBKWlE3aW5H?=
 =?utf-8?B?VjNJNE1mazhKMVFOYWlIaXIxdmpheHJGekxId1VLY1AvMnVDQ3M1TUpaUDln?=
 =?utf-8?B?S1BIdUJ4WUdYTHZUeFMydnd0S0I3MUlkMkUvejlTVUkwd0hWTHhRRlByYkFI?=
 =?utf-8?B?YUFtRm9YQUJ1R0NLdGpMRHR0UW4yOWl1NGRoS2N3bHBLSDVTaW9qczViWmEz?=
 =?utf-8?B?OTI1Q1lDRUIvaWxlUDZwRWl2RUNSdy9DWEJXaDBuNzNGcDFCcFZKSEhZUitG?=
 =?utf-8?B?bk1wQzd4UjZHRHlxYjMvK1JWYWxna3p5Tm9HaFEzM1dla3cxTFhaT0xUWlQx?=
 =?utf-8?B?VFVEaHV1aFdwMjdjYlFaeFlmWWxaS2ZlU2Q5clZqVUV2YWlkMFlRV1lhTGcw?=
 =?utf-8?B?cVFGaXQzd1NaTlRxcjBKMzdvZk9ycjA1SjdFREVkcGtDOEU5aW9IdWFYeUNo?=
 =?utf-8?B?QTM3TnJsbmQ0aEVPR0RsY0RhODJmU2x1WWNaVVNhcFZ1dUM4cEFMV0liWXp1?=
 =?utf-8?B?TE5nRFdyZlVIVjFZSGNGaCtkUS9TYjQrOVpzcmxqd25ZUS90OGNZT3NaLzBh?=
 =?utf-8?B?TTlHbzJjV1VOZjVFSitDbXU3QURkUjVORUhpeUV0QXpQRkkvUWJrbDE1VkZT?=
 =?utf-8?B?R29qL2swcHIxS2lsc0N1YWNBSTVYSXVSZDJ3ZU5zbTJkcmZkMktQeFFJMmxz?=
 =?utf-8?B?N2NBbVNCdW5xckFjTVg4R1BBeW95cHZyY1hXNXFZbTFJRS9WNDJWOWZhNk1u?=
 =?utf-8?B?Z1ZXemdlcGZwR2NLZ051djZQS0lLVjc1Q1pSUTFmcGR6UjJBSTVlK29LU2tW?=
 =?utf-8?B?TXpPRkVjL1pjeDJXQkpRVkk4WmJEeHdaSm1xOVN0S3VaL0xWSnY2RjJMQlhP?=
 =?utf-8?B?VFhINmV1TTVodEVLOGQ3VkJwQzlHSngrWlF0d1pKdDI0N1pmMi9sUFdNR2Ew?=
 =?utf-8?B?a1Zuc2lFMldjbXV0azJBTEphRXl6VnFCaC8yZ3RnTlpFb21jaXFLY0RiY3FV?=
 =?utf-8?B?cXNxWlAyeXNOZmFIRno1eUJzZ2hKNWdTUTdqMEhWQVhTWkkyc0YrK3ozYXZJ?=
 =?utf-8?B?aVdMdzZxWkJBbHVrbldCL3BsZk9XSjJma0pvTUU1ZVE4bUt1NEhmaGJYTXdQ?=
 =?utf-8?B?MUVDeHhrRUZ4VGR6Z2J5ZVZaWDdXd3lmdWJmZE1aT1llVVRjQWFielE2SUF1?=
 =?utf-8?B?OHRCa2xTZDdUTWJOZ1phbENXRW5oRk9rdjFza09peXdVQTJCUTNCamFGeFV0?=
 =?utf-8?B?MkttRU1ITEFFUWczVVJDNGs5Zy9rSTNvZUNoTWdnMENMN1J5eFVFTVZxY0ox?=
 =?utf-8?Q?QOgbK1V1amk/X5Honr7yOJM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F85E99B6A240D6409A99EDAA13F70989@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f7b0cb-3a87-4f7f-56d8-08da59a1e32d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 07:35:06.1883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e0NpedwdjljiMYbkqVTV37qVweGrGnDALcVpjf05/WwvRiSaUxj9PLYpak7m5j31z6XR75F/gkOwkaQMM/nj8xPITVSUjxfIi6MdT4aLWdo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2885
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Xiu Jianfeng <xiujianfeng@huawei.com>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzA2LzIwMjIgw6AgMDg6MDQsIEdPTkcsIFJ1aXFpIGEgw6ljcml0wqA6DQo+IFtW
b3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIGdvbmdydWlxaTFAaHVh
d2VpLmNvbS4gRMOpY291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBpbXBvcnRhbnQgw6AgaHR0cHM6
Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IEZpeCB0aGUg
Zm9sbG93aW5nIFNwYXJzZSB3YXJuaW5ncyB0aGF0IGdvdCBub3RpY2VkIHdoZW4gdGhlIFBQQy1k
ZXYNCj4gcGF0Y2h3b3JrIHdhcyBjaGVja2luZyBhbm90aGVyIHBhdGNoIChzZWUgdGhlIGxpbmsg
YmVsb3cpOg0KPiANCj4gaW5pdC9tYWluLmM6ODYyOjE6IHdhcm5pbmc6IHN5bWJvbCAncmFuZG9t
aXplX2tzdGFja19vZmZzZXQnIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/
DQo+IGluaXQvbWFpbi5jOjg2NDoxOiB3YXJuaW5nOiBzeW1ib2wgJ2tzdGFja19vZmZzZXQnIHdh
cyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/DQo+IA0KPiBXaGljaCBpbiBmYWN0
IGFyZSB0cmlnZ2VyZWQgb24gYWxsIGFyY2hpdGVjdHVyZXMgdGhhdCBoYXZlDQo+IEhBVkVfQVJD
SF9SQU5ET01JWkVfS1NUQUNLX09GRlNFVCBzdXBwb3J0IChmb3IgaW5zdGFuY2VzIHg4NiwgYXJt
NjQNCj4gZXRjKS4NCj4gDQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvZTdi
MGQ2OGItOTE0ZC03MjgzLTgyN2MtMTAxOTg4OTIzOTI5QGh1YXdlaS5jb20vVC8jbTQ5YjJkNDQ5
MDEyMTQ0NWNlNGJmNzY1MzUwMGFiYTU5ZWVmY2I2N2YNCj4gQ2M6IENocmlzdG9waGUgTGVyb3kg
PGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4gQ2M6IFhpdSBKaWFuZmVuZyA8eGl1amlh
bmZlbmdAaHVhd2VpLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogR09ORywgUnVpcWkgPGdvbmdydWlx
aTFAaHVhd2VpLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9w
aGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gDQo+IHYyOiByZW1vdmUgdW5uZWNlc3Nh
cnkgI2lmZGVmIGFyb3VuZCB0aGUgaGVhZGVyDQo+IA0KPiAgIGluaXQvbWFpbi5jIHwgMSArDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5p
dC9tYWluLmMgYi9pbml0L21haW4uYw0KPiBpbmRleCBlMjQ5MDM4N2RiMmIuLmViOWJmN2M1YjI4
YiAxMDA2NDQNCj4gLS0tIGEvaW5pdC9tYWluLmMNCj4gKysrIGIvaW5pdC9tYWluLmMNCj4gQEAg
LTk5LDYgKzk5LDcgQEANCj4gICAjaW5jbHVkZSA8bGludXgva2NzYW4uaD4NCj4gICAjaW5jbHVk
ZSA8bGludXgvaW5pdF9zeXNjYWxscy5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9zdGFja2RlcG90
Lmg+DQo+ICsjaW5jbHVkZSA8bGludXgvcmFuZG9taXplX2tzdGFjay5oPg0KPiAgICNpbmNsdWRl
IDxuZXQvbmV0X25hbWVzcGFjZS5oPg0KPiANCj4gICAjaW5jbHVkZSA8YXNtL2lvLmg+DQo+IC0t
DQo+IDIuMjUuMQ0KPiA=
