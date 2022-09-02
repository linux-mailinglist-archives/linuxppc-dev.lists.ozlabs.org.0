Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADF05AB64E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 18:12:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MK2xY6sf2z305v
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 02:12:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=SehtCIAb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.49; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=SehtCIAb;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120049.outbound.protection.outlook.com [40.107.12.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MK2wn4z3fz2xvr
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 02:11:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yxfi2F0pXnbmlqb+mtXfL1fFv1UQ7VML0G/LoP2zOFb0GO8s5mKFy8vc1kb66hqp0Yv47u4R8iHICOkQ2JKI7je2GPE/7+7lJLnF22kh5RaJL7XYjoeknhalDsYq/80kksZiBNn9t7ek6hZ1DF3bV/eoEIKY47RDvWaiXa/GQCuLfKxG/ty7XaD2z1ELnUN8xApJur29o8lpjjvAB9C8yd4zQK9PeZ4cYuEN7FNduGkDgiZcV/6wNn66GD8RVfmQxDLLyIMDtrRFx8CwQj/feAoZhm16S1uHMqV93CHwVCcGdaQrGosNIyg1NyOljgLnSbvplkgVH4YOHbHgofO2kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flIbVd3RBd3r/+Go/FKKwjkBtN+KyKzD++EGRLk1Q38=;
 b=nK+SMwvkqDoRgUYyuQJDIv/eYxVC9tMDPT4i0UzdusZ6J5k3KWwkwK+2NKCbCTn+iqmHPEekh0hgPJELmLShc/8McS76BDNCr3Wn5/w6t1hme2wtMqN/RioZ+RmOQPqhP13lAcWG6BFDiAywPV9MVwfzAzjDA7G2H4jnugOhlhc8vt/eWO06dzIBdDdgOEsStra5viagCphTpAhsWNWa1qsqsiNIFAWXdVp+BEUC5hxTSnsOJMXbYIucBnqs0Iy81c5FRuSnbQ64+2Mabmf8BUd3Q4cgbwH4aU15FUrRtZq0seTq0rfmwFz1UV655ZmwKNNQARGwgl6f8l5ayhfICw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flIbVd3RBd3r/+Go/FKKwjkBtN+KyKzD++EGRLk1Q38=;
 b=SehtCIAbNRSDaKvLzWg/O/jK1wUyq7CWlFAPs+2pv+lFD2ZbY2ul3NEMoWBFI4pb1l0dDPRvEVvC8WBkg5kUCfrvMJOsbUIreY08AMfm4G81TM5wLNgnMnKt26BIKS6ObwZSdTHpieZH6wjOoaOpk58nakSg5uBaJURcUMh29GMlcvEdNaQhml66GJIRMrImazxHeuPRmyf0CkYxJQRnsDyaSEbSrmW3OVX3b3iQFeTjHoDZaBncSYwkahpWADHRJiSgaZbCDn53rMSJvjwQh/z9v8DE3YuFtC7yIwu8tF+NjywuK1CKOxidonSOA7wI/OeERdWE7rfGki2AFS+Hvg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2055.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Fri, 2 Sep
 2022 16:11:33 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.014; Fri, 2 Sep 2022
 16:11:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Segher Boessenkool <segher@kernel.crashing.org>, Nathan Chancellor
	<nathan@kernel.org>
Subject: Re: [PATCH v2 2/2] powerpc/math-emu: Remove -w build flag and fix
 warnings
Thread-Topic: [PATCH v2 2/2] powerpc/math-emu: Remove -w build flag and fix
 warnings
Thread-Index: AQHYvrQQ+S0EhS3hjkeplqlJfSj6Ca3MRmKAgAAGSgCAAANAAA==
Date: Fri, 2 Sep 2022 16:11:33 +0000
Message-ID: <c8fccaf2-9153-8cec-c683-870e52735e68@csgroup.eu>
References:  <a7384eafc6a27aea15bdc9e8f9a12aac593fccb7.1662113301.git.christophe.leroy@csgroup.eu>
 <35c86b7ca823954c6cd593acc3690dc3748da9b1.1662113301.git.christophe.leroy@csgroup.eu>
 <YxIjM/jdLajq4dFk@dev-arch.thelio-3990X>
 <20220902155954.GP25951@gate.crashing.org>
In-Reply-To: <20220902155954.GP25951@gate.crashing.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0ade7a5-642e-4aef-e091-08da8cfdcdbf
x-ms-traffictypediagnostic: MRZP264MB2055:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  zyZ8Io3d+u7oLohTA+UlD6hhyb/fJGo7jbvpW02ry+vWKyZ5LXxUpSGrE9qmUfYEOxo4t3+RLee77GkEY78+/E0C7friAvV2y0j21VuPnAKzU/D6M08qO7zrXhMatPnudbjdxa8F/DtN0Om87yzkDrBgIcUAmNCnOJMSOPiY31XE1IuOkpgTfOPHvygdfzFgTgw32Y3GyoUUix9lpZEu863pzs3fKP9ppxFfuVIPpUEvmhWLpunWL7BUCD1/z/TX1R/aaw6Mw6almlKUjJGhTsGXMqPMc4icgRItAQBxD51ifjU4SAGus18CAUZeuPCVPS+WVqw+82wKvAy9/kJmJohDh93XBCRZoGRSuUhXIEVclah7raQ3is3mX4/kRwNiV2I7Oz1U882QjQ8ImRUzMQ4EbAsRjuoFYzr7fjxVISHoafhPep6oSjfHYbvje0v8XzxbZwAqDKCrsYKhvSzEpid1N79y88rX1CSNFjjacInk/NXuFKYIBWmEr/ufhihEbxNwAlBitzLLMdUy5Qu+etoqhv+guYvsNzNgAIgk4d+gboQ2NvppHRflLAYo0pR19G8h7KRh+mmBKw42wOcWlLgViGCpMildEK5bMGctblfqAl2IZdVXv9jQfGAG4Az3QzhrIAy8rQGavJiMx9vtdET9GKWTnT/m+Bs4GW+aYDpsYpX3C9vqyhK9wCxFuY0aGKKVOoEEpwRsjpN66mu/T0fZcBRBGrPyWZymJ3qVgB+FfiCNrzRksgRVZpX0R8Wa9lIFpOPSQxWHZOhj1sbsETWpEd9423Wa4GlH06EyFb6BcH1zVE+oV4dSLVkN4Kvcbg6hsxWP0R6a8r+ffbL9YA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(122000001)(2616005)(26005)(186003)(71200400001)(36756003)(8936002)(44832011)(31686004)(478600001)(5660300002)(2906002)(6486002)(4744005)(31696002)(66556008)(64756008)(8676002)(66446008)(4326008)(91956017)(86362001)(76116006)(66946007)(38100700002)(66476007)(41300700001)(66574015)(83380400001)(54906003)(38070700005)(6512007)(6506007)(316002)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TUNSamNYcTBIcnpVVlB4OVdJdXZxQm1aSlRIZzZyNWxjVmZJczBTNTJhdldk?=
 =?utf-8?B?N3VoOUl6NEt3bUVuOGp4VVZRU2VBYjZuWmx1STgveEJRQlNZVzQxZmJVL3BW?=
 =?utf-8?B?Q0FUbkdNR3pvQ1F1L25rUm9tR2p1NzdDTEpOZjBpRVRDUUNCMG1OUDBkZzAw?=
 =?utf-8?B?R0lmVkxnelZTbG5LTnZwckRIVTl4QUVXZjRVMUpWV2RoL0Z5RWpUSXJVTG1z?=
 =?utf-8?B?bkQwOHhIZEZwVi8ycjkwQ3NDRDVkWm9na0wzU1NnbXkyd2l5NFQwaGpBRGpT?=
 =?utf-8?B?aDhUaExlcm5zejdYNTlvV1JrU3ppTjJZTkZjV1ZZbjNWL3pYS3dCSG40b1FC?=
 =?utf-8?B?V0pJNVBPZ3ZzclVyWVFSWitIUW9xWDNVMGNCTEt1R0ZlVkZXR0ovejlXZ0lN?=
 =?utf-8?B?eHhhRFNqczJmdnBGcVVaR21kbFM1OXVNSlc2U1N0Sndsa0oxZXNFV25KdWEz?=
 =?utf-8?B?OEY1cVQwOWkzVDZZemV1TmNPU1czbUtnN1hMaG00cFNMUUEyQjlldEZqR2Zk?=
 =?utf-8?B?RkIyc1VnRG9vamJmQnMveU5wSG8wdzFweVp5NDc0eWtPUlVOYzJDWE9VcVIx?=
 =?utf-8?B?cjVSb2UwRFl1SU9YNHR4UWE0dk4zdTg1aE1EekV4MWhHamMzck9XYUhEcXdV?=
 =?utf-8?B?TElVR3A4L005VmRmWkZUQVRHSG54TStxUGN3a2pORmd5TmRxdmlaZ0tWS0N3?=
 =?utf-8?B?TlpNU1EwS2FKVHRpTUxySGV2T2VvMksvWFAwZm1lRjkvVDhubEJUVk9rUFFM?=
 =?utf-8?B?bDRXeEQwUnJvaDA1aDlCRDdDTW1BeENNSmtDSDNjNDA4dTgyNHdqbHFBenBD?=
 =?utf-8?B?WlZZMC9ybTU5bVg3dE9xdzhqUFZYbzNtVm1sd3ZQMFBUa0FVeGtzUmcvbDJO?=
 =?utf-8?B?cFcvK1hpbjU3Zkl4RzhBNjh1WTVkbmd2bm05Z1E0b1UyTDNKNUJTSmp5SW1S?=
 =?utf-8?B?YkpISkNoQStNRUhCK1p5bmtOVnAzWkdET1lpNnEyRzNXSGQ5TXhLU3YxTzZu?=
 =?utf-8?B?S1FCWXRnc1RJS2JBZk81cHB1MWNFN042akUwZWc0ZENuOUE1KzZOUlFOSlVD?=
 =?utf-8?B?Ymw1dHdsb0dpbTlXNUFvVm53dWF6RUJZMytQdFluWHZSYWVxcjZzYnJPUUlz?=
 =?utf-8?B?bnJHU0VxNnA2dlZmdHdsUC9ld0o5WGVha1c3cEcvZTlWY2xHR0RhWS82UW5r?=
 =?utf-8?B?cDRpeVFUb0JHdEZBVUZBWUh3T2ZYc25QMmEvcFNWZEU0SmhBcGxQVUU5N3JQ?=
 =?utf-8?B?SG12bHZYSWlaMnpMOXFTQ3RZa3FadDU5ZUhYTHRnWkl4ZjNvelZtbmVVdDhO?=
 =?utf-8?B?NDZhcWo2T3hEQW4xQTRFWTdOS01FaXdtTVBsQ0JjcWo0ZTcwc2M0bCs2V2VW?=
 =?utf-8?B?TGlCUnZMeEtQYTJreGRwaXl4VTlvK1A4aWJ1WiszSlFaYlVEcXZEU0Fzc0o0?=
 =?utf-8?B?MGdacTYweUpPWGk4bjNqbEZJZzN2ZWpic0NseXRjN2hSTFR5TWFHMzk5aGZN?=
 =?utf-8?B?TTlGanNGU2UzVlM3aFZpbEdsZERWeG5GT21hTFFRZ0pnVkVHMUg2bko1aWFI?=
 =?utf-8?B?MjRtZEtyZ25UQS9aZjNxaHdOOEN5ZlU0RHdQV0R4QnBnWnlGeTNjM1hDWnpv?=
 =?utf-8?B?enFGK3NnbzFxckVxTFR4WU9jNVN6ZTRqZEE5RmVkYlVwcHlkTlVJcXlpTENi?=
 =?utf-8?B?Nm1WYU40ZnJpNTFyQ1UzcXU2aGVDRlI2Qk9tSXBrL09qWW51THkvZDV4c3ZI?=
 =?utf-8?B?amlZU0hqcXZPbU9PTkMzUW4wZkplR29uMHVTaS9FRXc2eUc0T2lNMHNWcnQr?=
 =?utf-8?B?MG9mTSthYi9sWGtXU0tQSUZFd00vZjFUTElNaWJoaTBDd3N5ZGdrVG5aMURj?=
 =?utf-8?B?NWYvNFVzTDR3cGhHZHhUNlFwVzNmNGxURjc3WmdvRjBpdFNGZDBWMTdpa084?=
 =?utf-8?B?aWlMaGdSNzRxaUpMWmk2QjhFck5RRStab1lhWXRTdEl4WWF4MkpoTUVrUk13?=
 =?utf-8?B?RWYweE1tblVYWFRPNGttL1E3Y0JsRTVKZnVqNlVsMlBGOG13NkVlZ2wwdXVm?=
 =?utf-8?B?Y2o0ZXR3cmZrbksrc3BGZFY4S1FDTkRqbFZwU1d5bXY4L3ZJZ1ZMRjVBUmpa?=
 =?utf-8?B?NWZSVjFTd1ovUVlMckhDdTljNWhjUGk4YzV6N1lyRHJCTDRVcUorVjJsZTVT?=
 =?utf-8?Q?ule+xWRdiGjjDdtY9TsqqK4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71EE4330CE7A094CB723260F8EE14BB6@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ade7a5-642e-4aef-e091-08da8cfdcdbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 16:11:33.2396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DPZoumMn2sWCnsDnVUYmt/6m6I4bqGu0O28AOq1yybbu1s05ktj96WGaNHO1u/jcmvBcbfzSzYlk9Xp29ANghPmSsNDhAVLYPsELVdWnc1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2055
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAyLzA5LzIwMjIgw6AgMTc6NTksIFNlZ2hlciBCb2Vzc2Vua29vbCBhIMOpY3JpdMKg
Og0KPiBPbiBGcmksIFNlcCAwMiwgMjAyMiBhdCAwODozNzoyM0FNIC0wNzAwLCBOYXRoYW4gQ2hh
bmNlbGxvciB3cm90ZToNCj4+IE9uIEZyaSwgU2VwIDAyLCAyMDIyIGF0IDEyOjA4OjU1UE0gKzAy
MDAsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+Pj4gVGhpcyBzaG91bGQgaGF2ZSBiZWVuIGRl
dGVjdGVkIGJ5IGdjYyBhdCBidWlsZCB0aW1lLCBidXQgZHVlIHRvDQo+Pj4gJy13JyBmbGFnIGl0
IHdlbnQgdW5kZXRlY3RlZC4NCj4+Pg0KPj4+IFJlbW92aW5nIHRoYXQgZmxhZyBsZWFkcyB0byBt
YW55IHdhcm5pbmdzIGhlbmNlIGVycm9ycy4NCj4gDQo+PiBUaGFua3MgZm9yIGZpZ3VyaW5nIG91
dCB3aGF0IHdhcyBnb2luZyBvbiBoZXJlISBJIHRvb2sgdGhpcyBwYXRjaCBmb3IgYQ0KPj4gc3Bp
biB3aXRoIGNsYW5nIGFuZCBpdCBoYXMgYSBmZXcgbW9yZSBlcnJvcnMgYXJvdW5kDQo+PiAtV2lt
cGxpY2l0LWZhbGx0aHJvdWdoOg0KPiANCj4gTWF5YmUgYWRkIC1Xbm8taW1wbGljaXQtZmFsbHRo
cm91Z2g/ICBUaGlzIGNvZGUgaXMgYSBjb3B5IGZyb20gb3V0c2lkZQ0KPiB0aGUga2VybmVsLCBu
byBvbmUgaGFzIGV2ZXIgd2FudGVkIHRvIG1haW50YWluIGl0LCBpZiBub3RoaW5nIGVsc2UgKHRo
ZQ0KPiBtb3JlIHBvbGl0aWNhbGx5IGNvcnJlY3QgZm9ybXVsYXRpb24gaXMgIndlIGNhbm5vdCBh
cyBlYXNpbHkgcGljayB1cA0KPiBpbXByb3ZlbWVudHMgZnJvbSB1cHN0cmVhbSBpZiB3ZSBtb2Rp
Znkgc3R1ZmYiKS4NCj4gDQoNClRoZXJlIGFyZSBhbHJlYWR5IHN1Y2ggY2hhbmdlcyBpbiB0aGF0
IGNvbW1vbiBmaWxlLCBzZWUgZm9yIGluc3RhbmNlIA0KY29tbWl0IGYzMzZhMDA5ZjhlMyAoIm1h
dGgtZW11OiBGaXggZmFsbC10aHJvdWdoIHdhcm5pbmciKSwgd2FzIGluIEp1bHkgDQoyMDIxLg0K
DQpDaHJpc3RvcGhl
