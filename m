Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E42A5FDD32
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 17:30:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpD463mM1z3dqq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 02:30:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=gHPp7zeF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.70; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=gHPp7zeF;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120070.outbound.protection.outlook.com [40.107.12.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpD360ChVz2xb4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 02:29:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AA0ffEjw8dxLIGK0tv9ts8rqIIjTf7LpC4eNLSM6VrIq/We1aQaw4+wzbjx6TLgN1dlCy6Z5ZII6ZTLG+8vUeDHiuHnslwJrCf2ARWRnOH/NRKz0ErMQcuZiomTtcYa+At1KhilGkt9ePneHtB58zzw0NHagCb/AwBdObhqoMJog/oqjZDVevcQvUVBmgtoz6J3HyYUoVNvVESP2q7Em4xv9Hpz52bmTA4zWrhtnO/EjMH3O1BUCdqWtIpHcwZMw8hlu16ax/L9VKNkoGCVYknnXctP2AF55mpz22j7uWeNnLQlKg0nHfnMmGiF1gc0NcvrKIzh79RwrjcnbSDVJJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpQOuaJGXaT4xRvZ0kH/4eyndfe3Ldb6M6Dlk6rEwjc=;
 b=nSfyibQXrb4pNdrrAwaAdlgsPlQPu9+PfUopHbzlmbg6kVbUiPVE6jdMPB07g58wGPB2GRkgRNDbceBFMKFc3AoEaQBoH26qNbYkCc0E0ry8SwVZNiMK8ouK9r/pK+wlyppdvwW7C6g5V1zFbVZZggqWi8SRlttQCx6fovHgcaTUpIScX/Rv26OEmxVwllg8m8VDoesW+VzBng+lRiXGeuQvvpoQRauKbG41gKZV1lRj/cMaIgZ++S0+xYlc09Nz48tzAS8sgPkznYQXG5Or+Kn+qd/LX5N2RsUln5sNMcMdmoF9cJC6vxetatOvNgbKM0g46X/Q2eHDiiZpnXhVYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpQOuaJGXaT4xRvZ0kH/4eyndfe3Ldb6M6Dlk6rEwjc=;
 b=gHPp7zeFkStGSwcKM57c8QAvaPBixaaoPT+QBiN16ViXzj2Inr24nYYUPWyOxJRl0wFll0vTVUskbhFH0vI8zcj/1nK7mVOiWjFvj/GPK/bFt81w25puFrFb1H4rxwfro13W9uahgG27E9TOJFbrEIzVP304Ph80rxgMABKYJjFMIsJzCaYHSbikwiYFB4Er2sY25GIiHJjK1YqNn9usd+XQU4MJR1gkOZ7fnlUZQvD4L4gjhCKciBV81pctv0fAFmrkMyeJ/hNrVT7YtQ0J2NAIj3ssbSy4QmxuV9YnF2KqssCnCwWZhxgbLV5HHPmabY+Kv1gwpPGwuc3ITwsldA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3016.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 15:29:16 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 15:29:16 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/3] powerpc/64s: Disable preemption in hash lazy mmu mode
Thread-Topic: [PATCH 1/3] powerpc/64s: Disable preemption in hash lazy mmu
 mode
Thread-Index: AQHY3xcUA9QmIh+TkU+4qBgecXYWP64McuKA
Date: Thu, 13 Oct 2022 15:29:16 +0000
Message-ID: <80c35aa7-36cb-6701-9b5e-57c37638555e@csgroup.eu>
References: <20221013151647.1857994-1-npiggin@gmail.com>
In-Reply-To: <20221013151647.1857994-1-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3016:EE_
x-ms-office365-filtering-correlation-id: 545f9059-361b-4e8b-eada-08daad2fb0bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  XIkrhztV5ims1gKUDF8cHYfeydr6atjD/n9s/dcRbG/K8BCA11nxEYUII3eIP53bUivatUkpsApGtLvKT36Dxw3D4TvNkyvvsGi3SGbRye1/pvQPT2AiWvSy9GMbtuf3t57K1jynQdC1045rAuRSO3353zoSM9VA7swNEVSCtioQDx3FNLrV6ZEYagRaZL0AVJfoqDBzU1/r3tZv+utH3ha3VHg7K8J4Ue8i+GeXKtD5/nSmQfkDYHGqWf8ci8RdDOsCztkXwO/nJoZlGaIUxJ7F9ToGa5CkrT9iPj+HVMBOKnDcbLun7wmfH8NCaRww7mcbjXw7VgWYXM4v+oaQT45qpFeimkQTr+MZiV000VUljmVi/N+Y5yIw5uvrNqlbHmkZfb5SQrq0mpdgnDOzsgh6XwYykever9MmCZ38vKzgRKGNci31d74s4fHObDA8aBMMFEmumCgeCF4GKx2bPhvu0kQ4O0yKkt46n7lrrWqQMR8vsF++ywiyYMaHGabiiS3gHUVxnbW+YnuKyYtpKgXWfV6+Fmsjr3o1EMZ1f71ZCvYCkcCwAnRcJDexzDv7uqVKxPHiuVGrPo857yulT6bbmIpAbGDpX4VHeMlN9uaCUc+jtU3XLjnl4wf9BY0dj+876+nQ/eR7D2LZBJxPGvI05n0J+tph/u4WY4UbgpgZH3DjhPmtr8+mIj2Ud2WjVZv+AZez6Hnq0E+bRdlkvlvRqqeupNzLNx0BnM9Jybm6q+An5W0FZeNhgp62vHbUBkcWGTHDfHpNKAIbN/NvbaAQonHUs31/LVWl+aNLNHwYOXDav8S+mHI0n3ij5vu6Dugb80Y8cJIRlUlEzmxL4Q==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(451199015)(26005)(66574015)(64756008)(31696002)(36756003)(83380400001)(4326008)(86362001)(38100700002)(110136005)(8676002)(6506007)(66446008)(66476007)(44832011)(66946007)(66556008)(91956017)(76116006)(2906002)(2616005)(41300700001)(186003)(5660300002)(8936002)(6512007)(31686004)(316002)(71200400001)(478600001)(122000001)(6486002)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TDg4QUdpaG1yNVhLZ2hhV0V4U2hVK2t6cCthOVFuSG1SN2h6QStZMVNnMC9W?=
 =?utf-8?B?Yk1acW40NzF4cU5DQmhhVDg1L0ErUkxucjB2QXM0dWNhT0ZRWWpNY0RBWnZH?=
 =?utf-8?B?YTVUcVo5NHpzMk9WRHFZSGZzUWJCVUdQMkVxb3lLM1Bva1E4eU1vdjhINEJm?=
 =?utf-8?B?QVI0R2ozRzJWZkh3RjYyTEU0OTZWUXdoRERHa2cwc3lCbkNUZ1QxMmVqVFAr?=
 =?utf-8?B?Znk4M1FHL0k1eks3bUpuK0xEbm9PVmlDTHh6Unp5WmY0ZDdXWFZNeW51bEQ4?=
 =?utf-8?B?TnF2cno2ZjZrOENqbkRYRzZUS0FBY05zcjRyVFlCTWluTzVLQ1dZVVNUNzNX?=
 =?utf-8?B?YnJaajRqbTU3VVAzOGM4U2ZHVkFqbUdGSkJKUVBtVGVVVzZqR1RuUFZVTHVO?=
 =?utf-8?B?c3lFL0VsQTY5VkpNaDlqL0NwSzVGOTFGSzFVYmRVL2FDOXQ5RjFMcy9HRWY5?=
 =?utf-8?B?ejdNYWtnMFFMN1AzbW5LSTBPYnVCZHFrQ2cycTltLzFaWlFYNEtJNGRvdm9x?=
 =?utf-8?B?dVhtZE03VUV0MmR2OUN3dW12OGYwQldYc3oxbm01dVk2TDhtMGJDRnk3ajlz?=
 =?utf-8?B?U3dnUXRZTEhrTlRxYnpFaXpDK2w3NjFjZTlEaTRwbkZaaFhZRURRNm8wOUlN?=
 =?utf-8?B?TXNUZDZpUTdyaDZsQzN3bTFZUzlJQjZOKzNiRzM5cURQUkQwTEpjMHBlc0VC?=
 =?utf-8?B?cEE1MG0wTlRyazR0ZUZRWEhDUEVjRGIzb2hkTXE0L1VDQ0RBRVpML2NxRVBJ?=
 =?utf-8?B?bE1Dejc0MDZYMTMvdHdHUjJKbDFUdTJHelZFaU4yTjJzYVlpdWpIVDlGcmhZ?=
 =?utf-8?B?T1FuaThDVFJ5K2V2am1TTCtzc1dBRExldngvRURlUVV3VTNRQ3VuWkdaMlBE?=
 =?utf-8?B?aURmS3ROVlRGR1VLVW9Xam9hbjBCQ0swcEI5S2ErZFlUaUxOMlA4OWhmT1pr?=
 =?utf-8?B?NEl3ei8yVzVZaXM3WUpRK1IvUVRZakhrV1R2TmphS212cGU2VDR3dDRsWjVv?=
 =?utf-8?B?WlZvWTZEUS9DNlRsUFNXWkh6VVBoTjhYMnRiMVVLR0JzUU9LZGhOTEdzc2J6?=
 =?utf-8?B?am45b0pxbi9ueHYxeXJTLy9QNE1QTGRJeGdlaTFVWEZKei9pZWZXbTJLakF3?=
 =?utf-8?B?YVY3YmlDNEIwVHJZbjBJVTBjSTFSZWM1c1NySHlsYkx5b3BncWJLRzlHSGEw?=
 =?utf-8?B?dTRxVDZiZjkwQlpGK0Y3VzNEYitaSDZ4dVQxeXYxUFlxWDBtWmJ3SFRDNndj?=
 =?utf-8?B?bGpEZ3cxUXZveXNsY2gyNkl5OXJ5UTBoUnFocTloZjY1RVJ3QzAzTEtHL3Ja?=
 =?utf-8?B?a2xQR0NlcjcxTzRSUFJSUklGb2tRcDYzd3JlVWc5NnBweGhleW9xV0RtSnpu?=
 =?utf-8?B?cmwwMkdYeFB4NGRlUXhESGVWRUpUNlNpQ3puaG9wcWozSDEwVlQySHAwZ3B1?=
 =?utf-8?B?TEVKNWhpTnpsS0RheHdodEJKU0lndGl2eUVuUWJFQnNPK3JvRU4vV0pLVGlk?=
 =?utf-8?B?L3J4d3MzNU9FUnovTVp1N2FzN0drdHpVOHR3b0s1WnZMYmIzVUVlVTJzU0l2?=
 =?utf-8?B?bnM5Q0xHa3lIVDBrbTRuTWMzSWJERWxsK2JlY0J6K21XOVltK3JhQ3l2enBu?=
 =?utf-8?B?VDJsRDUwUnlzRjZyTVlZSURpU005ZUpOaUZwZmMyb3RMeFRZRGNRQ0RoRFUy?=
 =?utf-8?B?b2tIci9KbWJ3RlNMbW5INDVCa3BqR3ZGbWdIbHllV2RjTnQrSDBZeFlEdU5l?=
 =?utf-8?B?dFNCYXg1ZUUvRU5xQXprd040R2tsVkVkcnpuSmNCZzBLaWxLdzJ2ZWRjOHRl?=
 =?utf-8?B?YTYxZExheXVYTVNXY0JvOXNuSlRoQzZsN3pEZVJpN1cwRWFKbEZ2YmJMdEpW?=
 =?utf-8?B?WEJSL0xINUdFUGhVcGZEWWoxMDQ0Qk5jSVN4S0dTYlN2YmJqZm1yMXNVb3c1?=
 =?utf-8?B?dkNLRjIyUGRtdFlVNW9oaWxpamczREdqanlyM1BQWXFYcGJYUldUcWw0NWF1?=
 =?utf-8?B?Vi9IYVpKUENrWUFIYzgwZXNpN08yOGttUmZsQXl2cjE2aDRWRzlscExkV2Fn?=
 =?utf-8?B?Wnl4cWJrZzNvUEpXYmZTSHlBRC94elR1ZjVXKzdNQXpTaWhha3pvVmx0VmlH?=
 =?utf-8?B?S0dxQnQrQkIybEthK1RZK1J5MUZ0cmQvYVNYMzBFNU1QR0dsazI0Uml5YjVt?=
 =?utf-8?Q?/cD/nnJmXCQGBJiGuy/yJT8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0DDB6E8FAF6104098E3FF87D58CEEF1@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 545f9059-361b-4e8b-eada-08daad2fb0bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2022 15:29:16.6207
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iewHV9dQpVh8XqJnofW3T+OzHLU9VVv35V/wMauXZF1cUG1uruCGpBLBx2Tqf8GkrG37+LYp2YqOQETvaeYX5RlBFr6XSmzIeGpjv20w4rU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3016
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
Cc: Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzEwLzIwMjIgw6AgMTc6MTYsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBhcHBseV90b19wYWdlX3JhbmdlIG9uIGtlcm5lbCBwYWdlcyBkb2VzIG5vdCBkaXNhYmxlIHBy
ZWVtcHRpb24sIHdoaWNoDQo+IGlzIGEgcmVxdWlyZW1lbnQgZm9yIGhhc2gncyBsYXp5IG1tdSBt
b2RlLCB3aGljaCBrZWVwcyB0cmFjayBvZiB0aGUNCj4gVExCcyB0byBmbHVzaCB3aXRoIGEgcGVy
LWNwdSBhcnJheS4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vj
ay11cy5uZXQ+DQo+IFNpZ25lZC1vZmYtYnk6IE5pY2hvbGFzIFBpZ2dpbiA8bnBpZ2dpbkBnbWFp
bC5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvdGxi
Zmx1c2gtaGFzaC5oIHwgNiArKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82
NC90bGJmbHVzaC1oYXNoLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3Rs
YmZsdXNoLWhhc2guaA0KPiBpbmRleCBmYWI4MzMyZmUxYWQuLjc1MTkyMWY2ZGI0NiAxMDA2NDQN
Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJmbHVzaC1oYXNo
LmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJmbHVzaC1o
YXNoLmgNCj4gQEAgLTMyLDYgKzMyLDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBhcmNoX2VudGVy
X2xhenlfbW11X21vZGUodm9pZCkNCj4gICANCj4gICAJaWYgKHJhZGl4X2VuYWJsZWQoKSkNCj4g
ICAJCXJldHVybjsNCj4gKwkvKg0KPiArCSAqIGFwcGx5X3RvX3BhZ2VfcmFuZ2UgY2FuIGNhbGwg
dXMgdGhpcyBwcmVlbXB0IGVuYWJsZWQgd2hlbg0KPiArCSAqIG9wZXJhdGluZyBvbiBrZXJuZWwg
cGFnZSB0YWJsZXMuDQo+ICsJICovDQo+ICsJcHJlZW1wdF9kaXNhYmxlKCk7DQo+ICAgCWJhdGNo
ID0gdGhpc19jcHVfcHRyKCZwcGM2NF90bGJfYmF0Y2gpOw0KPiAgIAliYXRjaC0+YWN0aXZlID0g
MTsNCj4gICB9DQo+IEBAIC00Nyw2ICs1Miw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBhcmNoX2xl
YXZlX2xhenlfbW11X21vZGUodm9pZCkNCj4gICAJaWYgKGJhdGNoLT5pbmRleCkNCj4gICAJCV9f
Zmx1c2hfdGxiX3BlbmRpbmcoYmF0Y2gpOw0KPiAgIAliYXRjaC0+YWN0aXZlID0gMDsNCj4gKwlw
cmVlbXB0X2VuYWJsZSgpOw0KDQpZb3UnbGwgc2NoZWR1bGUoKSBoZXJlLiBJcyB0aGF0IGFjY2Vw
dGFibGUgaW4gdGVybXMgb2YgcGVyZm9ybWFuY2UgPyANCk90aGVyd2lzZSB5b3UgaGF2ZSBwcmVl
bXB0X2VuYWJsZV9ub19yZXNjaGVkKCkNCg0KPiAgIH0NCj4gICANCj4gICAjZGVmaW5lIGFyY2hf
Zmx1c2hfbGF6eV9tbXVfbW9kZSgpICAgICAgZG8ge30gd2hpbGUgKDAp
