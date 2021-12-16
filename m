Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 037C5477471
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 15:26:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFDv36H2tz3cCT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 01:26:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::601;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFDtZ21Q8z2ywv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 01:25:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRxTJAcyIzXXBPZWep2CisVzrGhWXn8u1frdotjZ+aVFy1E7IzTkBRl8G8onyFxypHSqblOx7QJdqjPHyRw0WD7vx1yuVEGuLrgXsr6bOxoiDyFMSvntQMJzO6CAOk755edtXnU5RxX1X2nSNJ4RwpKMMv05H5QjLPFAGji1ibrqXLGHI/8BPibOeu+TdpThJ6iZk9k0Q8vNz7PGisKChEahxEJHSqNWlm+XowuiXSJtmlMLa7n0/s5DDDCwW7sb4NPf1/xkqj0jkvQRHfFQMAJjXS5kuLBU0SNQ63J6i7VupQz7pHm3OrI6cSkjs+6hYRAGoUtqX7t1JAXLnOF8Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHFcv/uWYYqAaqOhnhlXsVYnzi133ItBn613xcU4+bQ=;
 b=ewFMu22jfk5ohZcn51oVbvAGZClJ/p7BezMvLR8rwoZroPXtehbtEswOW8ZfFnPZAWKOlZe2lO0GoiUraNAsGIOhP32FWTmuPaES1y0dHwNJTd6GcIvr+ES1NrW7Ed8T/DQTP/xNEes4jTcliWI+SPyvMdzZ9+XFoZkePQz1wsqVBQaGXSLiu+S2iLpKs+sIpqHhvoi3sQB70g4okXNy0nDfretE7ONbShG50GdN54ICC81X9oaO6kAr2PoazHOghQwt28XttrOVr4OV0/XVLzrk1j+iIGYv1G/vsV01RuqXz0QfPrhsmxRdgPSECMp96/tSh5I2wGOiIOAtOwy2tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 MR1P264MB3121.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3a::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.16; Thu, 16 Dec 2021 14:25:38 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::30e4:16d5:f514:b8f8%2]) with mapi id 15.20.4801.015; Thu, 16 Dec 2021
 14:25:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "alex@ghiti.fr" <alex@ghiti.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v4 06/10] powerpc/mm: Use generic_get_unmapped_area() and
 call it from arch_get_unmapped_area()
Thread-Topic: [PATCH v4 06/10] powerpc/mm: Use generic_get_unmapped_area() and
 call it from arch_get_unmapped_area()
Thread-Index: AQHX7FeZYbkFB7BK6kOFRdVEM/XL8Kwp65yAgAtNSgA=
Date: Thu, 16 Dec 2021 14:25:36 +0000
Message-ID: <37997658-a990-51ba-94e2-b022f7cf5904@csgroup.eu>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
 <8f54a8d097c402d808147b2044365ebfda2862dd.1638976229.git.christophe.leroy@csgroup.eu>
 <1639042828.6q5z2bujam.astroid@bobo.none>
In-Reply-To: <1639042828.6q5z2bujam.astroid@bobo.none>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3448c0c4-8fc5-44a4-e679-08d9c09fed96
x-ms-traffictypediagnostic: MR1P264MB3121:EE_
x-microsoft-antispam-prvs: <MR1P264MB3121861196E6289C0C87AB5BED779@MR1P264MB3121.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1N0AxooY1daR0r6M6LoIkRn4CtTwJYpmKtKkIW2iPK7VPY9fg5VJHkDSZHaF32reuXJtX8K5nd7BWi/q/E0guC4aPOWDqE4IV//48dDA5fdAtb5Qm6WwTpyHRquXFytqR6OKStsevnJlvDFjH/0mlyZKf5gFuZnm2QUgif7hoPcuwDRhWIJiU5/blWoPAxp4gTKSabZNXdfk7dGlnljmxwfSm5zmDIi2yugkUyzCQZANXtwsVdaLl4/7GjGar64nedENANDP0ynawsISaEoQx8jWNUpfAwP5r3gcMZPTXdzdnd4H5zl/c4oAkGmEgh6ZDWIn7DupRvU4IgicDBgojWSpOnOb6th0MrKzdJLIKccsYaVOlMDlsGIsdp2o2kBv4JMJ1/YIaQ3waxYgCsjOgnbOa4xE0ESGm859kO6CrJuaibvjsi5m4WKXcmuxol/ChHU7a3T92qKjkvYIYS7sPCZhnqe5I/qGAm/FEx+yI5P1cJ1hjAxA620M3uUFbvx2BfiSh1BiAHzSyyGcRWUTsKn3A3bNVwsYkpDxFdLCKitj6SyOBdUf2X2qJJ8/3LWaou8lNpIHjcMrz8f6bry05VDseu6frVWYYDlkETjFUXuooxCK+li7iUHnxQfZu8itpJUtjYJ3jkCKHiV0VoEMxU2skifuEkfOpWWlo/oHnLmCS3RVIQKhVjIhDRlPpl1g+CThdAtxIZRvb3+J3wX3MnEZ4fUCJDxTgeOU5F/5j/o3FukOausVR0RMTWR3+ML+wrnZwtD6ZFeTf6FfSQmCKIhduk3INETPq7uFkoHL0Pg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(71200400001)(66574015)(5660300002)(31686004)(38100700002)(316002)(38070700005)(44832011)(2616005)(122000001)(4326008)(8676002)(110136005)(186003)(31696002)(6512007)(66476007)(54906003)(36756003)(508600001)(83380400001)(64756008)(66446008)(66946007)(66556008)(2906002)(76116006)(6486002)(6506007)(86362001)(8936002)(91956017)(26005)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3BzaHlWYTBSMDZNQXZxTVkzd2NRWWMrTmlBc2RycktnVGQxRG1uTVo0VTBO?=
 =?utf-8?B?d21aa1RQVTMrajd5Y1RiZ3d2U0gxaFduTEcrUFdSbUE4OGNpa2dpVTdWOXVm?=
 =?utf-8?B?U3JEMExxemppUWxhWVJ0VlNGZDlvVTkwWU1TeFR2Ri9LWVdweVluRlgvMTkw?=
 =?utf-8?B?ZWRCNDUrZkhYOE5BRzk4Z2hWUWpJWEVqcHJLMGV1R0FkUW9xdllySjlPTGVQ?=
 =?utf-8?B?dkVjRHZTcnFXTmdrT0dyc0s5ZW5pS0dYSXNvQ1k4TWUzeVZXQnoyek82NDZG?=
 =?utf-8?B?Vll6Z3h1dFdYU1VYYTdVVFAwMExQYzBoWnhKRytNUkhrak1EazdwVDQ1aXJq?=
 =?utf-8?B?QUJQR2g0dWpnUTU5elVmTHRxK0l1ZGMzSk4rVWNXVGs2NElFdnEraEtFZGJt?=
 =?utf-8?B?NWNwL3RybFV4R3JuWnRsZFl1RUlCUmtWY2YzVUt4bmRpcmswY3NwSGo5KzZN?=
 =?utf-8?B?MlBuVzI2RkcvTHc4R2pSWTMrTDJmejBPUFRIOHRoWU5zNmdFU0NLRnVheUdJ?=
 =?utf-8?B?ckduVlpJQ2hpbzdDblVndURFUmtNL2tiM3VYa3B0WnFOV1ZXWnRvaUxGZEZY?=
 =?utf-8?B?NFhoRUNWUW8vZlBwNUxFaHFVdDh6MnJRaVY2ZVkwQitJTytMRFBYbGlNUWl2?=
 =?utf-8?B?WTRmSWlGcnVXc0hMZXJIcmFtTVF0clRkc0ZVWktRM00rOFdFZExKOWdQWDdM?=
 =?utf-8?B?UU14Wk9XNE9OS0hySjdZRVdpRlYyRGFRNisxc1g1V3orV0xDU2RUcm5EbUF1?=
 =?utf-8?B?VFZ4UDhTZGZHUlliZ0FteUt5TmFnNjZ1eW02WHpjejdRT2lNNXIvbzRQTkxR?=
 =?utf-8?B?UWhwWEo5Nnl1TEVSZHdUQWxHcWxTQSt2c21TL3ZTYmZvR3RTSHNjZm5LQVly?=
 =?utf-8?B?a0k1dXpPTDJwL1owUGNsRFAxZThjTld5OGtwVEE5WGZKejVHemt6Z3BJU2Z0?=
 =?utf-8?B?eEVCOEh3UDZnS2dnbzRYRVlTZVQ5NUNGbHJCcjM2NzgvcjNWZHF2akQybWFm?=
 =?utf-8?B?dElxKzIzVC9Hdm5EeXE1dTBwZjNwWVo5eFU1aWJiOGxUcm9iWnhKTURkL0l1?=
 =?utf-8?B?LzlOMkVNUVRNdTZFZU0wekF0UVl0bm5rVDROTWRsVUkrTWRUWVpQcUhLVGp5?=
 =?utf-8?B?N1U5TzFOYkk0VkUwY1ppVWRKKzkyMmxmUDdyRkJjNVZBYVdCZlhrSEdScmc3?=
 =?utf-8?B?amd6ZkhqZUsvSUljK3BMTlB2cUdwWitqRVJGNWVaWWl1bVdTTDM3b0dNVU9x?=
 =?utf-8?B?MG8xK2NlcUF6QWp1RWZzR1VhcEtUclM1WUpRS25mMXA3ejRBSURpT29WZWFP?=
 =?utf-8?B?KzJCM2QrNGUzVnlrUlQydHRnd3oyd1FNUnpKWmthd1k1SkVPRDkrNUlxWXlG?=
 =?utf-8?B?WmVLdTJ4c1hxUktkUDd0dFdhSkNmdXNsdEg5eTNhb2xqaWhWc1VKSHIwVlMr?=
 =?utf-8?B?T2tjV1E1ek1Nc0QrZnd6M2lMUlJ5NytoN2tRQ1o1bGZxMUp0ZW5wSDRvQ2NG?=
 =?utf-8?B?bzUvbXlyVDAxREFLK2p2THk2OUhRYmJXRXVTWnRZSVNWa2J3SEs5S1BTUFlt?=
 =?utf-8?B?aE5GelFYbk5HODBJZzJmMC9TYW5qNTV3K2RCRUF0THVzclRFeUJFYzhia2k2?=
 =?utf-8?B?U1NkRXpaRlpuR0daSjRBMUIzWTB2aitXRlVlNGIyRkdONUFxV0NFMmZsdVB0?=
 =?utf-8?B?bEFxamFvb3BCVXBIT2xsOXZLS0hjNjRkbVYwU05TeDZQQno5ckZnZEVMdzZh?=
 =?utf-8?B?YkVIZm1kM2M5RytPTGQ2OUpZVThwVHlMMUpWOWgzY0VsQktHZC9lNEN0VGo0?=
 =?utf-8?B?MTg1VjVVTnQzdy9RM051QzRHZGhQd0ZiTTBlbk1pbXd0S2RDdmJGSU9ZamFL?=
 =?utf-8?B?L3JGQmRHQWtqNjRVU0lBSnFBSFJzenJjMkRoNXZic2RUMmp1SU41UlFFT0NY?=
 =?utf-8?B?SmZRMlVuU1Rma2g3ZERodTNabXFSUDZGV0FiZFJpaEh5RFFSRE5uV0IwOVJE?=
 =?utf-8?B?YU5qNHJDczcyNXZ4SkxkVXdEeExPQ09yVGw4dU1GM0drRUgzZXZXanhpY2Vl?=
 =?utf-8?B?UjFCNjk5L2pzSFRmK3N1S1hjYlJrNGFxLzZjWktuRUpBK0xlNDh6L0VEYVVM?=
 =?utf-8?B?WlMyUWY4OEhjTmhPalpObFJMaUMrcDhIR0tDYXQ4bWVaaW9uZjY1U0Y0elB1?=
 =?utf-8?B?UCtVZ3VzUElMK1dnZllzSEtlL05MaEwwcXZIbWpyMjBsYjhwUkg3TG03TFNN?=
 =?utf-8?Q?thiK/gcOxIHWXR2uXlDc/7gfdcVbMg8E3cBmpuaJnk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21AA081257D1E849A8778E26EC9C803D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3448c0c4-8fc5-44a4-e679-08d9c09fed96
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 14:25:36.7311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QE6JVHcn490Wc9QAuBo9g9OWHO8LLDQugSUiZLw9me525PodDPKwgpeKSubY2ZCeU5Sv0dGmThVT/0FGhQJbUxRrYXopl60kZD3MEs3aV0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3121
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzEyLzIwMjEgw6AgMTA6NTAsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBFeGNlcnB0cyBmcm9tIENocmlzdG9waGUgTGVyb3kncyBtZXNzYWdlIG9mIERlY2VtYmVyIDks
IDIwMjEgMzoxOCBhbToNCj4+IFVzZSB0aGUgZ2VuZXJpYyB2ZXJzaW9uIG9mIGFyY2hfZ2V0X3Vu
bWFwcGVkX2FyZWEoKSB3aGljaA0KPj4gaXMgbm93IGF2YWlsYWJsZSBhdCBhbGwgdGltZSBpbnN0
ZWFkIG9mIGl0cyBjb3B5DQo+PiByYWRpeF9fYXJjaF9nZXRfdW5tYXBwZWRfYXJlYSgpDQo+Pg0K
Pj4gSW5zdGVhZCBvZiBzZXR0aW5nIG1tLT5nZXRfdW5tYXBwZWRfYXJlYSgpIHRvIGVpdGhlcg0K
Pj4gYXJjaF9nZXRfdW5tYXBwZWRfYXJlYSgpIG9yIGdlbmVyaWNfZ2V0X3VubWFwcGVkX2FyZWEo
KSwNCj4+IGFsd2F5cyBzZXQgaXQgdG8gYXJjaF9nZXRfdW5tYXBwZWRfYXJlYSgpIGFuZCBjYWxs
DQo+PiBnZW5lcmljX2dldF91bm1hcHBlZF9hcmVhKCkgZnJvbSB0aGVyZSB3aGVuIHJhZGl4IGlz
IGVuYWJsZWQuDQo+Pg0KPj4gRG8gdGhlIHNhbWUgd2l0aCByYWRpeF9fYXJjaF9nZXRfdW5tYXBw
ZWRfYXJlYV90b3Bkb3duKCkNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95
IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+PiAtLS0NCj4+ICAgYXJjaC9wb3dlcnBj
L21tL21tYXAuYyB8IDEyNyArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxMjEgZGVsZXRpb25zKC0p
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9tbWFwLmMgYi9hcmNoL3Bvd2Vy
cGMvbW0vbW1hcC5jDQo+PiBpbmRleCA5YjBkNmUzOTViYzAuLjQ2NzgxZDAxMDNkMSAxMDA2NDQN
Cj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9tbWFwLmMNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9t
bS9tbWFwLmMNCj4+IEBAIC04MSwxMTUgKzgxLDE1IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQg
bG9uZyBtbWFwX2Jhc2UodW5zaWduZWQgbG9uZyBybmQsDQo+PiAgIH0NCj4+ICAgDQo+PiAgICNp
ZmRlZiBIQVZFX0FSQ0hfVU5NQVBQRURfQVJFQQ0KPj4gLSNpZmRlZiBDT05GSUdfUFBDX1JBRElY
X01NVQ0KPj4gLS8qDQo+PiAtICogU2FtZSBmdW5jdGlvbiBhcyBnZW5lcmljIGNvZGUgdXNlZCBv
bmx5IGZvciByYWRpeCwgYmVjYXVzZSB3ZSBkb24ndCBuZWVkIHRvIG92ZXJsb2FkDQo+PiAtICog
dGhlIGdlbmVyaWMgb25lLiBCdXQgd2Ugd2lsbCBoYXZlIHRvIGR1cGxpY2F0ZSwgYmVjYXVzZSBo
YXNoIHNlbGVjdA0KPj4gLSAqIEhBVkVfQVJDSF9VTk1BUFBFRF9BUkVBDQo+PiAtICovDQo+PiAt
c3RhdGljIHVuc2lnbmVkIGxvbmcNCj4+IC1yYWRpeF9fYXJjaF9nZXRfdW5tYXBwZWRfYXJlYShz
dHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhZGRyLA0KPj4gLQkJCSAgICAgdW5zaWdu
ZWQgbG9uZyBsZW4sIHVuc2lnbmVkIGxvbmcgcGdvZmYsDQo+PiAtCQkJICAgICB1bnNpZ25lZCBs
b25nIGZsYWdzKQ0KPj4gLXsNCj4+IC0Jc3RydWN0IG1tX3N0cnVjdCAqbW0gPSBjdXJyZW50LT5t
bTsNCj4+IC0Jc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7DQo+PiAtCWludCBmaXhlZCA9IChm
bGFncyAmIE1BUF9GSVhFRCk7DQo+PiAtCXVuc2lnbmVkIGxvbmcgaGlnaF9saW1pdDsNCj4+IC0J
c3RydWN0IHZtX3VubWFwcGVkX2FyZWFfaW5mbyBpbmZvOw0KPj4gLQ0KPj4gLQloaWdoX2xpbWl0
ID0gREVGQVVMVF9NQVBfV0lORE9XOw0KPj4gLQlpZiAoYWRkciA+PSBoaWdoX2xpbWl0IHx8IChm
aXhlZCAmJiAoYWRkciArIGxlbiA+IGhpZ2hfbGltaXQpKSkNCj4+IC0JCWhpZ2hfbGltaXQgPSBU
QVNLX1NJWkU7DQo+IA0KPiBEb2VzIDY0cyByYWRpeCBuZWVkIHRvIGRlZmluZSBhcmNoX2dldF9t
bWFwX2VuZCgpIHRvIGRvIHRoZSBhYm92ZSBub3c/DQo+IA0KPiBPdGhlcndpc2UgZ3JlYXQgdG8g
Y29uc29saWRhdGUgdGhpcyB3aXRoIGNvcmUgY29kZSwgbmljZSBwYXRjaC4NCj4gDQoNClllcyBp
dCBuZWVkcyBhcmNoX2dldF9tbWFwX2VuZCgpIGFuZCBhbHNvIGFyY2hfZ2V0X21tYXBfYmFzZSgp
Lg0KDQpJIGFkZGVkIGl0IGluIHY1LCB0YWtpbmcgYWxzbyBzdWdnZXN0aW9uIGZyb20gTWljaGFl
bC4NCg0KVGhhbmtzDQpDaHJpc3RvcGhl
