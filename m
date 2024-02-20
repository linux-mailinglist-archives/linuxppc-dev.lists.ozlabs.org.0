Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E65785B5DE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 09:52:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=GLfB5+mf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfCnt0dK5z3dTr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 19:52:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=GLfB5+mf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::700; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfCn63bDDz3c12
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 19:51:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvF8rFeEH+oRMs3LGY9oKogs+r2nl3boJaJ0TT84nZnL7o5oIgj4K3Dko62f8Xu0QM1GpgtLqQ2JlZY1lc6tWgfsiMpJXi8it7wuPQYiFxsb9CJvlE2TqOUsJtYubCWRgClkXnIRNAyAouaJDnBoyrrNT4DV07qZmRANo2kFH9kOhziWO1d9lde1KnBpODq7+LqolDEV3pB6HCVQo8WfWNWug+2W7DESrBECmnV3Ux+HVNC0OxoNcDYUg3W4Hma37S82fM75QNAf3F8q+X6eV2a9Dd5c+L1W37cmZVeR+4Z84JqpDrwZURWvF5K5SD0bZxSH6pZc9rHwU06zZOtK4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8YeOqvGbsR8kekM/slI83aP4zRRX/WkaGwaFAdF0j8=;
 b=SHp16Amm2tvrr86W4aGGJjpRVDXsxCDgXOkQ7Uh0oRic18XEI4FVimHXeXXivoYfv/47FzFBe42Pmdo82Xv9uMj7Ni/sL0jV5x5W1EK5DCIgKzIOu1VONjRGa9xtw/OgC9gniBRJFmhxb0i6YFAV9n9hSTOlSfl8d45/yGZgIBcMuAtKOtv33C3TX6++WzImebnfcYdBBY16t1Pd023zYPHwUUxgX/s4kle27hlrxDV04iPo0P1F4jQgjBA+uPc/GBnNQq9N35LaC6BXkoUfVMy/YpCjNblWn/0cICjF8w2uv+AByGj764GCtZxqr8OKcY6d9tOwK0nHhGBM4bLKdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8YeOqvGbsR8kekM/slI83aP4zRRX/WkaGwaFAdF0j8=;
 b=GLfB5+mfjQBeKA7vJ3ELc1HAVEN8j/9I74Gfr0fX5EaUoKvGYikMBMcbWTIa5licXqVFtAqZjni8+N29jIi7N/dcqqLERQn4/QzMdQSh1pLBTuF9hkAS7pmgLahZMh2Rqq5y5sTu2IV5PA/lkri2XpdanXQYfd7oZjNh78Asr/uj+SlMI/razkQPwzPUYd0mxOD4L1gs7b5YqKB76h80vBfIFb8ycX10piI1XlYnFvkdZHuk8rSBtCm/vauBPRtcNHPYXRUc6H6Tin6NX7f83dlESAW+OtarcnK9017Su7cvnbyMFBO04WnWsUWc7jml0VCIim4UIfUZgLO8rmLoFQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3872.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:110::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 08:51:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589%7]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 08:51:01 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Aneesh Kumar K.V
	<aneesh.kumar@kernel.org>, Luming Yu <luming.yu@shingroup.cn>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH v1 2/2] powerpc/debug: hook to user return notifier
 infrastructure
Thread-Topic: [PATCH v1 2/2] powerpc/debug: hook to user return notifier
 infrastructure
Thread-Index: AQHaMWA8BiP7gdISFEqfwH/9reLJhrCuxVyAgAFidoCAYylJgA==
Date: Tue, 20 Feb 2024 08:51:01 +0000
Message-ID: <2acd6623-952b-4659-bc26-c632e94560a8@csgroup.eu>
References: <B375A36C9C4D73FF+20231218031338.2084-1-luming.yu@shingroup.cn>
 <8734vzsw0q.fsf@kernel.org> <8734vyn1ky.fsf@mail.lhotse>
In-Reply-To: <8734vyn1ky.fsf@mail.lhotse>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3872:EE_
x-ms-office365-filtering-correlation-id: 441e9c37-be55-487c-4fb8-08dc31f110db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  K8WH8/9JCMGI251ljEzqkvlT1dNoocnnosiRPKbIfoy0Z1Me3nd5HIN6lpKCb2CMe+F7Li/6jjn8rEwYjlf6F9rbm3yLlIIzAL0bSA37+jMZeqXdjOlAY0dl1E0GgaXwON9yXP7kzZ6jqoY6lybxnEuRG8ytSRu0BX1jUKXUYO835nlawNBVd8UOebRPdXZa3uVNvcS2Z+GJPwfTGhPsx6OKV17Lgrda4YDFYRKgelTAO1EP4SapXXnd2xOHOo8xZhnkxAK2QkFEnC1vkh/K7dzzNEwRdT2HTmqSGRWoSEpNNlbp1tVpnOL19C0iyPj9adtWIR27UeRACnIE8tIDe67XEJbXSFiOv75su3s3Lv3x17gurf5GVlJzsWj9wSEM9N3hkXcCgplO7RmcYhi3ykHa4cinx2GBPOYFj2EGpRgox3jxliabEEzmX7BoqI6RwDZD40uA1XR2wI3iTyIXxTu2t2SZmvuiCmzTCg+FWnXGl/0Yvu4ukl/CmwzhGsQpch1Ug2OsAItrI2nVeCJIgkVB7Z2on8aw63ajDA+tTS/lSeSRdnJzacvNr+FXAkKS1IRaSdsrMRNfeizZgouDuwoCAKJ65CtPEK4IOjrlGgs=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?V0xaQ1h5Rm02QkttMFZWWkcrVHZDY05wamtqOVM0QkMxWllMakNudngvRUlG?=
 =?utf-8?B?aGJaN3k3KzFvOCtLaUxlME15NFJ1Qkd0eFovY2FGWXoyR2FOeEZhT1REaFBL?=
 =?utf-8?B?cUtjSW1QZFd2T01nSUZSY0ZHUWtlV3gwS1U0RU9sZG81SHB1NW4vMkFUTWN3?=
 =?utf-8?B?TytFZ2R1SjhXQ1N6aDNZVnFZd28wQWtmQVJCOXpCdWF1SGNmNVhIa2hKVENG?=
 =?utf-8?B?Q0k3aXJuU1NReTkzOFNyQyszaDZ3NXJnZlc5SVBENlpVci9ZUmNzelNjOU1W?=
 =?utf-8?B?Vm1UV1F6UDlmNC95Vy9iaHRKSmlXWDlKekF4MS9IUVFlRmpBZ2tabUNEZ2JL?=
 =?utf-8?B?WlJKUHZqanBlcXJMNVkwK3M0dFFmNTR4Z1VtMnQ2d0sybHZOZm5FSFRZOG9E?=
 =?utf-8?B?eGxuN3RQV2xESzVLbjIyekg2SGV5TklXNXBzNEtMSStpM25jMFJYRlZMakY2?=
 =?utf-8?B?bVNIYWxQN09PQ3RXT0NiRUtYNytQNEUyMEtLc2VpZ3Faa3JkSi9jNWQ0ajdS?=
 =?utf-8?B?NUxadk9QZTB2eFhOVFBNWkZQaVBwaWJEbk5HSWhLRzdTQk0rVmJyOE11VTA0?=
 =?utf-8?B?a2grWHNtSW1YS0xBSVBaRVFNb3JpTE43WEF6TnpnTW1JR3Vvc3ozRHdhSjNG?=
 =?utf-8?B?MFpNRVVlbXMwZXM2aUhzd25xb3pMV0JaWmYwUkpWSGZoVFNxWEd2YkFDeHM4?=
 =?utf-8?B?VmdHRG41dmFFN1dMdkxZd25od0NhYzRHL2M0ajIzNjVibVFJdTdySFI1MG5G?=
 =?utf-8?B?NVJ4MWtVSHVWQkNlQTlTQUNTQ1daY1l4T2o0UjBzcmVUcU5rdE5jNG1qMHhz?=
 =?utf-8?B?a3RhcHVMRjk3NkVwREYwaGY4OHRSUDY3VnRab21XM1Z5K0ZkU2pYbUh2Rk1M?=
 =?utf-8?B?NWNWRUtiL2VXRW9sRkZDWGZnYWJ3T25KSWZpempadGVkQ0hXZnphRTVDNzN1?=
 =?utf-8?B?S3FhTElQT3BGV20xR0xrV1d6ZUN3by9uRU81NHhtOWR6WFMvRUJLMWE3K09i?=
 =?utf-8?B?R01vU1c0OU1IUUUxUWxkQnA5eldMN2Y5TTVDT0p4QTE2eUtPQUlUNm9XQ0ZX?=
 =?utf-8?B?RDJwbzZVVVVQbHREMFRXV2ovaXg1TG1wZ28wbnVDTmNOeFZsQ1Zvckd0b2s0?=
 =?utf-8?B?MGllWDNPdlNDaU1tY0lWcTR0NC8ySUNkbkN3alhwa1J3bnZQQUtHak16MUxh?=
 =?utf-8?B?UCtwV2ZyNUFGajRZY0p6Rk5nNXpqdzR3UCtVOHM1L0oyRU04R0Q3OXRwWHRP?=
 =?utf-8?B?WnhoTktWdTliMjZaZ2IwTmJ3Ri93bmFLMWdYeGpWTWlpWkNjZEhlTXpWQmhk?=
 =?utf-8?B?T0ozbWZ4ektlMWEwQ1pKT09IR1lRaEdybUQxNUdLTys5ZEs0emZGeTdibWlV?=
 =?utf-8?B?TUx0VnBRVWt3bk5jdEFOTU1CZmY1cnBQa2FZS080ZGI5OXByUlJ5ZlhNbTFK?=
 =?utf-8?B?WkNFaE1kMVJzUDZycWJiRXBTMGoxN0x2SGlVVWNYb3ptR0hDNlExM2IwRVk5?=
 =?utf-8?B?RUJLZ1JSSXlSYnZOZzNpZXQ0YnlzMFRWNzI0blNwOStrZ1NVYXVYTFVubFox?=
 =?utf-8?B?WWRhQi83aG5NWEsrajRtSEhiRkVmM0ZxRlAxVDd0NmlObnVvVWZMbGttZFBq?=
 =?utf-8?B?cmlENGR4QStzVlJBcWhHd2lkT000QXpITDMxdDZMRTk2Uy9JbmJlU1JvQk5Z?=
 =?utf-8?B?QWJhOVZhcUN4dldGOEhFZ241c2lIUXB4SnJlVm01RDhPVFMvcVVLZmd4R2Iv?=
 =?utf-8?B?bWRlVW1PT3RNSThwZFEwR21jcksvbFdNTXZQeHdGa3VpeDk0WkdBVXA3MlhV?=
 =?utf-8?B?TWovYzh5bVNnSGFOK2ZJSk41UjdYOHo2b1dpQkFDSnVlMGpuSkg5bXlxN29s?=
 =?utf-8?B?U1pZelVsTWtHdmdud1ppUjlnUUtSakdXUk5rU29IVjRKb2RlWHhVNENDUmtS?=
 =?utf-8?B?Y2VwUHI0d2J4NXpMR0hrVTE3NVVKUk5lMDlXeWxXRllHUGJWVU9BK3UyTTBu?=
 =?utf-8?B?UlExdmtDKzk1OHV4TVV4WFhQRS9qZnV0TFNBc0hQNDBWK2hOVXNTZ3lFb01Y?=
 =?utf-8?B?QURWakhiMlljT0VCVU1wNnp5QWVvLzIwekpjVmIyS0tJL2NoNURFeDdMajc1?=
 =?utf-8?Q?XvZII/T+7i6c5mbfjXTtF88LM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B695F754D4797D48944ABE82E27948B3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 441e9c37-be55-487c-4fb8-08dc31f110db
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 08:51:01.9268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S6YGldxGOSOjcfK8LKjhELBdwsYvgFxJ7jxv2Fgt1XjiYRK23ptTTwJMOGdOd+qOBlQZQ6mfKqkrRv6ATMFpg1yknXHS9B5xVX8HDjrY/R4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3872
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
Cc: "shenghui.qu@shingroup.cn" <shenghui.qu@shingroup.cn>, "dawei.li@shingroup.cn" <dawei.li@shingroup.cn>, "ke.zhao@shingroup.cn" <ke.zhao@shingroup.cn>, "luming.yu@gmail.com" <luming.yu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzEyLzIwMjMgw6AgMDc6MzMsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQW5lZXNoIEt1bWFyIEsuViA8YW5lZXNoLmt1bWFyQGtlcm5lbC5vcmc+IHdyaXRlczoNCj4+
IEx1bWluZyBZdSA8bHVtaW5nLnl1QHNoaW5ncm91cC5jbj4gd3JpdGVzOg0KPj4NCj4+PiBCZWZv
cmUgd2UgaGF2ZSBwb3dlcnBjIHRvIHVzZSB0aGUgZ2VuZXJpYyBlbnRyeSBpbmZyYXN0cnVjdHVy
ZSwNCj4+PiB0aGUgY2FsbCB0byBmaXJlIHVzZXIgcmV0dXJuIG5vdGlmaWVyIGlzIG1hZGUgdGVt
cG9yYXJpbHkgaW4gcG93ZXJwYw0KPj4+IGVudHJ5IGNvZGUuDQo+Pj4NCj4+DQo+PiBJdCBpcyBz
dGlsbCBub3QgY2xlYXIgd2hhdCB3aWxsIGJlIHJlZ2lzdGVyZWQgYXMgdXNlciByZXR1cm4gbm90
aWZpZXIuDQo+PiBDYW4geW91IHN1bW1hcml6ZSB0aGF0IGhlcmU/DQo+IA0KPiBmaXJlX3VzZXJf
cmV0dXJuX25vdGlmaWVycygpIGlzIGRlZmluZWQgaW4ga2VybmVsL3VzZXItcmV0dXJuLW5vdGlm
aWVyLmMNCj4gDQo+IFRoYXQncyBidWlsdCB3aGVuIENPTkZJR19VU0VSX1JFVFVSTl9OT1RJRklF
Uj15Lg0KPiANCj4gVGhhdCBpcyBub3QgdXNlciBzZWxlY3RhYmxlLCBpdCdzIG9ubHkgZW5hYmxl
ZCBieToNCj4gDQo+IGFyY2gveDg2L2t2bS9LY29uZmlnOiAgICAgICAgc2VsZWN0IFVTRVJfUkVU
VVJOX05PVElGSUVSDQo+IA0KPiBTbyBpdCBsb29rcyB0byBtZSBsaWtlIChjdXJyZW50bHkpIGl0
J3MgYWx3YXlzIGEgbm9wIGFuZCBkb2VzIG5vdGhpbmcuDQo+IA0KPiBXaGljaCBtYWtlcyBtZSB3
b25kZXIgd2hhdCB0aGUgcG9pbnQgb2Ygd2lyaW5nIHRoaXMgZmVhdHVyZSB1cCBpcyA6KQ0KPiBN
YXliZSBpdCdzIG5lZWRlZCBmb3Igc29tZSBvdGhlciBmZWF0dXJlIEkgZG9uJ3Qga25vdyBhYm91
dD8NCj4gDQo+IEFyZ3VhYmx5IHdlIGNvdWxkIGp1c3QgZW5hYmxlIGl0IGJlY2F1c2Ugd2UgY2Fu
LCBhbmQgaXQgY3VycmVudGx5IGRvZXMNCj4gbm90aGluZyBzbyBpdCdzIHVubGlrZWx5IHRvIGJy
ZWFrIGFueXRoaW5nLiBCdXQgdGhhdCBhbHNvIG1ha2VzIGl0DQo+IGltcG9zc2libGUgdG8gdGVz
dCB0aGUgaW1wbGVtZW50YXRpb24gaXMgY29ycmVjdCwgYW5kIHJ1bnMgdGhlIHJpc2sgdGhhdA0K
PiBvbmUgZGF5IGluIHRoZSBmdXR1cmUgd2hlbiBpdCBkb2VzIGdldCBlbmFibGVkIG9ubHkgdGhl
biBkbyB3ZSBkaXNjb3Zlcg0KPiBpdCBkb2Vzbid0IHdvcmsuDQoNCk9wZW5lZCBhbiAiaXNzdWUi
IGZvciB0aGUgZGF5IHdlIG5lZWQgaXQ6IA0KaHR0cHM6Ly9naXRodWIuY29tL0tTUFAvbGludXgv
aXNzdWVzLzM0OA0K
