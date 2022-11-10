Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B360623BF5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 07:38:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7Bx61KjGz3dv0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 17:38:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=UQERDCHI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.50; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=UQERDCHI;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90050.outbound.protection.outlook.com [40.107.9.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7Bw43rWNz3cC5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 17:37:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZDi/Bbhl7kSZsx+T52+QW00ABIiSgTRiBSIFwxj5NGjxcSNwMy6anV9FaMVtwaGcl2YNs9oZPA5H3TMXt+p6CThcXRu0eDesGIn8b24j+fg5mFfecMlcy1pERfu8CjOrBaSOeRqAJBkNHBOt/ChTLAhya8ap5ZotkGXT1RGMGbZUm20bQM9m6w4ZBq9Oo5NuT3hic2xF3s+riGv0n02EVF+sxCAZQTJGGhprGemFx7NGpQOrpkp5Mx3to3a/ep1c0f3EIVp3Dtznvyiyhm5FWdBSNtD6zXOdwuiu5KJUqMEV1hqCpY1GOszOYvHapvgEE6XPh4r9Um30TCxA7fWQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4Sj6Z4z7JnU1muNwQnGkTden1EawfWR9EVqZfl2oog=;
 b=aoOEGQ37tmlVecsW4RsWLyHPMh7yfAq3/CIzwpgAbVwqierh+DXNolGLtz4t91oHAezytu8gxhvkogVOQqXYApO3XyKuSLZgqLBW+rEHDsxSRuAn6xzDJQ9mFim6A51znK5SlXFDwdofehDFYyi+AtcFAk3qR2vdXtO5xB72/lBq3egLoNZO1MHjVuuUUI4AdEkpJ5vcgEWcIDaaBQXeWn0n0xYBm/UowjDIgtjLUvP67KPYhSHWsF62QAl90zfuVWmxYwyq2mSpfupjEdVSO33ENp4pcMGI6Wu7pweJELiKrwkZhdbDwv3FRd+oMEHlwIwo3oIOzEwstiwnfJfYRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4Sj6Z4z7JnU1muNwQnGkTden1EawfWR9EVqZfl2oog=;
 b=UQERDCHIhNG3kZftHtq6ceM97CDbrQYLc9CbY/drOHB2kvm4JZY4n0VVw08YW8TaEtzf0Ac8WDXh0bu0y46vIDzKt+xK3BKZDCRHaOisfbV56YUA74x9m5QpJYpqfNN//lUONJkP9jjUOuHv70Wtw89Owr0Md+bBNTkwfkR1adl+tUUPJpOTqW+EwaiYfi2Y7v/ZcP4uvyBm6skyvKs6FxjKYqVQSIOas+crVfONrNxyXlzrPnKWsM3V/d6kncolIDym298DZtAFNhpD5Zgu9/Wexq04zUqYENTYZZbhJh69pWAfT+NId70gQaKJ9jf5NslXLnB/KoYI7PqwHMUo5Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3327.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 06:37:03 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 06:37:03 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jordan Niethe <jniethe5@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 01/17] powerpc/qspinlock: powerpc qspinlock implementation
Thread-Topic: [PATCH 01/17] powerpc/qspinlock: powerpc qspinlock
 implementation
Thread-Index: AQHYokvMeG9HO3isIk2Jm4Vuf+afUK439AmAgABlD4A=
Date: Thu, 10 Nov 2022 06:37:02 +0000
Message-ID: <ba2122e0-69a9-aa85-9bef-b0bfc5d44b65@csgroup.eu>
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-2-npiggin@gmail.com>
 <c1bc04fd0c09537cf77461754f5a940d782bfbd7.camel@gmail.com>
In-Reply-To: <c1bc04fd0c09537cf77461754f5a940d782bfbd7.camel@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3327:EE_
x-ms-office365-filtering-correlation-id: 196e6c1e-8fd8-4037-da36-08dac2e5fa58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  r2cEVoKQJxL+wmsgdSJC0O60vnXg4OI7Ka35f+Qiu0A4RhvfKs/JpfYfwjiZTE6s7XRZVDwa5cc+jU/F/GbKMkGFc+sG4Kbu10WLM973JPFNRexNsxdD0PTe3cUqJWtQhwdEZp6uxhg8NkCLvn+AOKUmQTTO5I724mMv1sN7KAyC8nhCMXicok76StIrRyUO+UwfFp1VsQtzUa7yDcrBtBd9gPgseVhVcIIqP2vJkgl4XfH0kQ3redqOHeIOi0HEdJkG/nxJy9hefalTWky6mSu20c27y7XxzizzVwuDQyvn0vg0LCX6CJkNb4YlmJaK2D86FzrzkEDJhYTHX/SEtJ8n/KHNPaON1l9npMl9v7jaYZ2kvbnkShgFyDWzIq5DTAG0LhrNsmwuAhTdG2BLoeH03HUMaQY6FzRDKlVcq6RMdg8FapNjq4WHeRoI/yuTMkMcCtzpNkdI7E4NSmRocZReX/1OtwhsW4i3tSMJLuA+JJQTaib016zbhVGXXR55T4mcevldSaH7dB2iqTc++ugnNeCRBb9lyVmBfdZmhfpkQ1M8lvw4XsYojj6fQie8Vi+nq+vEnTksOo4Aniu5AMoiFqf5vxq3d+NU3cASa7KDlkR5xV8L3RJqp1swoR6b5jPvyngvxBJ89U0mqsKGit+vRGAoaKbQmAzPEOuCER8LtEI3WxSOfoFc7qBzT3wzN3etvjBu9AnzjWIByFTCLxlV3g/fjYenNdtf1Nx22/nX0yRDIwRBFKfWiUDlGd1iQA0fcJiSIg+W/fxwAgE1QC0fZgp4yxCxVpA8UjgHWtifZEDR76Du6NnfikkcK1tbPE0igEwxHV4g4y3fwRfWiw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(451199015)(36756003)(38070700005)(86362001)(31696002)(66556008)(6506007)(2906002)(44832011)(5660300002)(4744005)(66574015)(186003)(6512007)(26005)(83380400001)(122000001)(2616005)(38100700002)(91956017)(8676002)(76116006)(66946007)(66476007)(66446008)(64756008)(316002)(31686004)(8936002)(6486002)(71200400001)(41300700001)(478600001)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bWxVMW8rZlNYSlA2cVBzZ0RZN3BtcjFwcVE5YnM1bERoTWxLZEVjWEEremdO?=
 =?utf-8?B?dG1zc2MvUmU3c3NuQmYxVklkZUcydi9vYnlING13VGV5R1JyMXBPN3doaXRt?=
 =?utf-8?B?Ujg0OGVtQlA5Vk16OFBXbHdyTkdHd214d1p1NTRVZzNBZXdneWVQeCthYTBY?=
 =?utf-8?B?Ty9RaXBXV2lkbU5mNjl1UEpSdE9xNzZEQndaeGNjVmFzRmthM1dtSC9rc1po?=
 =?utf-8?B?Wm9JeUhibW4yTXhad0lQdXVxOHNsRUVvS2xaYmpDV3lUVXFoNGRpUTg0VlNV?=
 =?utf-8?B?OUFNY0tKbml5enJ3Q0N3Tzh1SkpDYkVrWHNLYTRDQ0hCOVVzNGxaSG16V21h?=
 =?utf-8?B?OWRsK2pBYkE0TWo1TVlEUVNKTGhxQmVIL1JSTVE2WTVEV0EvMFNZT3hzUHJo?=
 =?utf-8?B?U1FSaVR0ZTY4aDUrMnRvMmhobjcrSVlmTlAyejVZWnpSbWxtSjFBQWcxNkN3?=
 =?utf-8?B?VnBXNkdwSlp1YVVTR1A5cHNPV294dGM5d2IvOHN2TjU0ZFEwaXcyL0lPVXZL?=
 =?utf-8?B?cm11eEcrMUZiZnNFa25iQnBNUjJhMUQ3WnZsOW9hV2I5TUcvY1hHOG9WeFNR?=
 =?utf-8?B?TkdrckV0dVN2RElmNy9MQTRKYkd5N3lEbXlzcHhpaDlvN1hGTy82MEdaUlpa?=
 =?utf-8?B?SWF6cUJQckVEWFZUaHJVNmppWEJ4R3pHWUV3UnpQTk5pcXhxRlBLdjJzWlRZ?=
 =?utf-8?B?WEhHTllSaGVJSm9PRHRtak5GNkY4K1VwajlMalhobzBMMyt3dzhoMnJLRzJ2?=
 =?utf-8?B?UDk3eERsb0dXOHdiUkNIWUlycGNYcFdieDJFS3Q0VFord0MvRk1PaDA1MWs2?=
 =?utf-8?B?WTIzUTRUYitWREZFMWMzdjlpa1VaK1p1ZXU1Y2hpcUVZZnZtQjMzQlovdGhy?=
 =?utf-8?B?VE5FcWNIYXNUMmFXUmpxaGh0RXZ5ZWlBMCtsUW9FZmNHSWNrMitJQnhQK0Vn?=
 =?utf-8?B?WVptYWN2M3pENjhVRVI4OHg0bzRDdVFVRDA5eXdFMlVtU3pFeVYxOFFqY3lw?=
 =?utf-8?B?UlB1VmFEVmhNaDNMQkp1REE1ZzEyZko2Mk5XeVREOFEvaExGaDAxTnR5dlRs?=
 =?utf-8?B?cHRNMXFDU3ExR3Rsa2lrRkNJWG10aythOUtIb2VUMk1XN21KQkVaRGVzVytQ?=
 =?utf-8?B?ekZtdi9kOFdsTTM0M0V3UGVJeFhraXQvUzBpNVpXT3Rjd0crZnJPaEhTZnpi?=
 =?utf-8?B?QTVOM2dPU3RaQVhCWlR2emNsd3cvWllkNFQyT3p0RVZaRUYwSHVxVndFSXl5?=
 =?utf-8?B?bnZvQ3FNaFdaSlpTSFlMLzY0NUZrNXJ6YzNFNFZaRzdoYlpvelByaFYrYmdw?=
 =?utf-8?B?SU80ejNNcEY1Rm5hcllBTWIrK1JQS3YxUFRkdERjWFcxWC9VTGwzcGpLcjF3?=
 =?utf-8?B?NnkvTEVHM0tESHZvZDN3YWxtVUg0eVUxKzFaVXZhUklPU3VWU1JKSUYzOUZu?=
 =?utf-8?B?NXdkYzRnUkI5a2h0TWVxUzd2Ri9vZkRkQkdEYlhrYlk5aUNlNURUUDc0VWxH?=
 =?utf-8?B?Y2ZHVmxOdFQ5dTJUNXhHWUhOZFdualFEMlFjdXUwVHNyUlBuekFEUlR4UnQr?=
 =?utf-8?B?Z2xuQVlaaFlUak9za3NxMzFaSlQxZUpFNlZqNHQyWkgwdGdFWmlMa2VSbjBq?=
 =?utf-8?B?d3krZExhSkZTY1hWclc3U0prRjFld3lFZ1I5dFJsUEw3cGM0S0VrU3FLMkla?=
 =?utf-8?B?WGlQK0duVFNrUVo3VFJZU1kxbzJVMTRZZllMY1VLQXo4Sm5xSWxaMkF0WElW?=
 =?utf-8?B?TitCSTVzeDRnNTE5TnVFRWJRSXpPdzBpRlFjOGdVWUhha0ZZSExtd0NnbXNX?=
 =?utf-8?B?RmVVNzhVQWo5NTVnUUVaMDgxWEZaT2RUbzF1YlQ5aG8yaUlEL3VmRy9GVy9p?=
 =?utf-8?B?dWh2MUJWSi9jYW4wSmgyQXNHY0N5N1daU1VHVWxtWUZDakdYUjlkdEppZzZ0?=
 =?utf-8?B?V3hLbWZOa3dCNWdFMWVTVzBSeXJvc21mS3ZRN2xyRkh6azhlY21ROTVlcnJJ?=
 =?utf-8?B?NTlmNm96VDFPM2toWEY3elN6Y2V6Z25BcS9VTzZGQmRzaXZBUE00MWRKQ2U3?=
 =?utf-8?B?N2k2THJzdjlaTUFiclowWE5Nc2Zzd1JlR1ZlZzBRTmdUSGxnVEV5TG1ETndU?=
 =?utf-8?B?ODZZZGY5YzhVWHdNRjVsWW1qQTJBOUZ0b2VTLytvTmxHbDNWQTJVbGRRblpC?=
 =?utf-8?Q?57/1x/kUltLWiqLvghG4Ulo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFC19EC0EFB174479087B8C6616B0FFD@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 196e6c1e-8fd8-4037-da36-08dac2e5fa58
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 06:37:02.9460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h8P8+AsLOxYUbalxyWd7aapDMAkGvpx38HiR+RG+WZ6ALrAWqnA5VaAIECjbEPFbNJ7tbRQARJSLl5h238YFGFelEJrCR2dt2QroLXwtKZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3327
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzExLzIwMjIgw6AgMDE6MzUsIEpvcmRhbiBOaWV0aGUgYSDDqWNyaXTCoDoNCj4g
T24gVGh1LCAyMDIyLTA3LTI4IGF0IDE2OjMxICsxMDAwLCBOaWNob2xhcyBQaWdnaW4gd3JvdGU6
DQo+IDxzbmlwPg0KPj4gLSNkZWZpbmUgcXVldWVkX3NwaW5fbG9jayBxdWV1ZWRfc3Bpbl9sb2Nr
DQo+PiAgIA0KPj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBxdWV1ZWRfc3Bpbl91bmxvY2soc3RydWN0
IHFzcGlubG9jayAqbG9jaykNCj4+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIGludCBxdWV1ZWRf
c3Bpbl90cnlsb2NrKHN0cnVjdCBxc3BpbmxvY2sgKmxvY2spDQo+PiAgIHsNCj4+IC0JaWYgKCFJ
U19FTkFCTEVEKENPTkZJR19QQVJBVklSVF9TUElOTE9DS1MpIHx8ICFpc19zaGFyZWRfcHJvY2Vz
c29yKCkpDQo+PiAtCQlzbXBfc3RvcmVfcmVsZWFzZSgmbG9jay0+bG9ja2VkLCAwKTsNCj4+IC0J
ZWxzZQ0KPj4gLQkJX19wdl9xdWV1ZWRfc3Bpbl91bmxvY2sobG9jayk7DQo+PiArCWlmIChhdG9t
aWNfY21weGNoZ19hY3F1aXJlKCZsb2NrLT52YWwsIDAsIDEpID09IDApDQo+PiArCQlyZXR1cm4g
MTsNCj4+ICsJcmV0dXJuIDA7DQo+IA0KPiBvcHRpb25hbCBzdHlsZSBuaXQ6IHJldHVybiAoYXRv
bWljX2NtcHhjaGdfYWNxdWlyZSgmbG9jay0+dmFsLCAwLCAxKSA9PSAwKTsNCg0KTm8gcGFyZW50
aGVzaXMuDQpObyA9PSAwDQoNClNob3VsZCBiZSA6DQoNCglyZXR1cm4gIWF0b21pY19jbXB4Y2hn
X2FjcXVpcmUoJmxvY2stPnZhbCwgMCwgMSk7DQoNCj4gDQo+IFtyZXNlbmQgYXMgdXRmLTgsIG5v
dCB1dGYtN10NCj4g
