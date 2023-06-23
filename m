Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F24B73BB29
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 17:10:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=lwjPnlEF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qngf82rrkz3brp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 01:10:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=lwjPnlEF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::613; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20613.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qngd71cPVz3bT2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jun 2023 01:09:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3g1RGvZuAgytTXfMJEvUFmpPja90PEOtrSw2eRbbblc4K4hBwE029gXpsQTjpGZ6xOM0JeuFiBcBQPy/ZJn+2IthuOZx7K7yElVI70vDn6WYSPyg0Rb4NNMaZTmKiFA3vuCTch/jIuIuZeXibofb9Eb2NOe332fdoamFUE8u9F0q69f3U4pNhmXSSPeVrfbrxYLwYiQUa55hURnrj4B17I0r7dbr4c2sRSFcIKnq4XTSkNHsx6VT+hY56DlH8Llil/cuGIQP/KLNkZ2alJRnERUXZIdFtqpfO1pOjNS7EYSstilttNxYFYRacF6LIJ+4GuDq2d/TMpEaRGrpV8lCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5z0gIGyUjn4hEycQ0ERaQkqe92M1u4/gYzrMo67SjPI=;
 b=Yy9cMGuN4/Rd5uU9TFAfPGSy1XHwTwa3emCSlqPyfD6KYlDM+jA9JxdelP7kwDb5gZL2bEciEh3VcLtGszgQjbfgrNOjTEzz6qtcCKlZat8ubGp9pWXlPXsBr5V8p/NqmjD1Lu8OJbMwQ21i2L6hGjZFs8YfAXFe5oMIgc5MbG38t9xdt+WMdO7lB88l8i6EItLAUHAS62lBF6MtjyI8j/imvbMMQu2d/vHfZBfRr+OA8gb8ADqfqJ3WXsBoMb1nfQA8DsD4Q/woFW6NiRDxJsUREjo23ZnjVur2pcz2X14rZBLOLrBY+1V13OiU7wcAhjvAWYAleU5oBVAnLOAxIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5z0gIGyUjn4hEycQ0ERaQkqe92M1u4/gYzrMo67SjPI=;
 b=lwjPnlEFLyoxHxr54M+I0K1508u2GdXi39xIlnTX/Pzgv8A87yiWaMXglcrf2RI0NZXKb4AW2INWa/FtrBQbFHds4dFNmFizrzd3wRA5RhFmFuUT1g8DwLoUdvgVBOdP6WOkJ0P7AwPzCsIrxKqrDQcX7aoNK81XEiLgdoZlu29sCHLCJ9SuDPE7nucuMUxjjg/+Jp3PyzvjJKbndNQ1bIb1b9S1rhXZOiLDeLoNpmy1z8VolNtEOa+Ty6aJwwbdpvkcm5IecBs5DS8i7Wm4HYqBv37b3iK3G6wD++D4uQex7krgTNPxjbigBm11WxjQlmmdJ0c5QcYbtqsYHBJBSw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3200.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 15:09:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6521.026; Fri, 23 Jun 2023
 15:09:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 10/14] objtool: Add support for relative switch tables
Thread-Topic: [PATCH v2 10/14] objtool: Add support for relative switch tables
Thread-Index: AQHZpPgE93fnhCbGDUC2/2OnL4Qn/K+WtOaAgAHKd4A=
Date: Fri, 23 Jun 2023 15:09:06 +0000
Message-ID: <4905e75d-b561-6fa2-c877-426d69d38790@csgroup.eu>
References: <cover.1687430631.git.christophe.leroy@csgroup.eu>
 <1d60e0ffe692289fd01485f680e87161bef98760.1687430631.git.christophe.leroy@csgroup.eu>
 <20230622114811.GL4253@hirez.programming.kicks-ass.net>
In-Reply-To: <20230622114811.GL4253@hirez.programming.kicks-ass.net>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3200:EE_
x-ms-office365-filtering-correlation-id: b3881016-d762-4bf6-8cd6-08db73fbc9d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  yOC0m9I0de8HpCoGx6BcaqNMwPtxdN2m7EIYWbafNX1RXsWY4w+LWf+s2jqbBScNocAsQAINedGg2l5sBOfSoMsDSSpFrih+ZCQH4R3gWmcVycC7wFBBiBLgJ9m+ExnLNNySXGwgA73bhjgsNG9eK+zLphOGy5fEnBe3LF7YXeFC6x03pxs8DyOI5K+4ZGhtTcE6oLqfwHv2ba9Zc1UFcF7j7WCtesU4la1JVHPgRpezsBFK6ZcgaV0WU32CdvUg8m/KRB+WuKTiIHq69DnKLF2cutxi120nSDuQb9KPb+nndn0mE2tWuAeBN7dE3r07z9ymYoYsBCc9HePWa3ktk69i/4OYpGqOxb3wWplvqS2xd0MtxPWzSMVFq/vPrGJNPw/a2ldVr1wXiiwUJyD+1eIq4d9Tj1yzvSsubBOTjgPefu4XxHl7t6JeKA48SR+O8VuBSWEfKd6M2wYrCFsR6DXYddTfnWibfWvFgQJPVUwlJK/UFuOO8Fr2qPmUy4pNEVzOF2JxkkyYWcQNSDwdws8uM/HQsvs+8O2zVzn1r+Cz/f/12gmxUVEWTsZXwDRCacFgSkibx4Ls5Cl7FQ0N9NulnI7eW1fUkkIEygOLs+6x7eyiHx9p8usjGaOTV7hsYmHMFgERuLDIRpgC9dw0HaGOgmCLgxkbbx3EyNRkWxUQ3KbL0pUnPEmzQIFRFgDW
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(451199021)(31686004)(478600001)(71200400001)(54906003)(4326008)(91956017)(76116006)(2616005)(66574015)(86362001)(83380400001)(36756003)(38070700005)(31696002)(2906002)(6486002)(186003)(26005)(6506007)(66946007)(6512007)(38100700002)(122000001)(66556008)(66476007)(66446008)(5660300002)(316002)(8936002)(64756008)(41300700001)(8676002)(6916009)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bVJ4eXdrVXM0cmxYeHdrQmEwazRPMUN5NXlIQ1F5R0xTR2hEMVlnODE4MDYw?=
 =?utf-8?B?eFNzYTIyN2ZySDROaDNOSldqTnM0ZXFvVTQ3T1RPeVIyejJ0R1V0ME1aeTZH?=
 =?utf-8?B?T1dPaEpXV3JaaTJLTFJWVHpVOVlKWGY4YnRMVGltV3RuQnZiWkFTd1h6d1Ji?=
 =?utf-8?B?bm1wQTFoRHcrU3FRMGl6ZjAvKzdhL3dxUzQvTWZXN3MvMnJLc1BueEh4bDY5?=
 =?utf-8?B?SGlURk9lS2ZvbjcyTHk5M2RHUjF3TlVaUG5JL3EvUDNqVXc0MVk2alhuZVVK?=
 =?utf-8?B?eVZXRGk0U0RFRlR6bUJPcjk5Mld1TmVxeGsyMnB2dFJhb0U4TVVJb0o3N09I?=
 =?utf-8?B?TVRRMDF1d1paMnkvZmxoU213aG96SHZaVlpJbXdRRmF1RDhEbVltYWpWMklT?=
 =?utf-8?B?MG5XYThGYUhWWnh5SkIyR29PRHRpZWFOazhnN0RJeDgvOG5qNU44RWZaTjFV?=
 =?utf-8?B?bmhJaWduc0RSektmcnk3V1RLdmxRUVN1aVR4ZW0vbUVMc1QwQnBhazR1djNY?=
 =?utf-8?B?TXhtUmd1L0toTENmdllEZlpLcTR5RWQ5a0Z3VUxtTGJqOUdEbEJ0SzdrL0lh?=
 =?utf-8?B?WXJkazBPTWpIQUZLeXhFMjVpc0F2YkI3emFYS1lXcVpMaFhQVDR4WFh2YnBr?=
 =?utf-8?B?L010RTJVV3d0RHE1S2YxdjZCZDlSMzEyRlFUR3BTOXpGNG0yam5iS3VwM0dp?=
 =?utf-8?B?M1V2M1gyNWNMQUR1V0NPd1N4L3lqZWowOEphcHlrYTZEUUFScW1mYWtxYWhj?=
 =?utf-8?B?bFk2b2t2NzVRLzZ0VmM0TVNMRVU4UmhUS0JmUTdreFVWSkhtbTFSRTNYQldT?=
 =?utf-8?B?OVE4cWhOMlR4WFk1THFSU3dUQmdKT2M2Wk8zT1d1QjNoWWZhV250TStMTERX?=
 =?utf-8?B?aG5wbzM1cTRFdy9RSUk0dkFNa2IyV01CUHlxZjh3eUdSd0dsdXFQOEhPcHBJ?=
 =?utf-8?B?SWFOdnBwdHdDL0ZrS3pSRkRveWNIMDJyR01mU0FweUlBcVBBU3pwL3lxOWY2?=
 =?utf-8?B?WTJjTHhrWnZ4NXlvNDloQTJBdUZaUFl2cW1kamMwS2RPcU5kck9IRDI5Vi9H?=
 =?utf-8?B?dkNTamQ2cDBOeGlCd1VDU3dpRGppLzFMc2NpMVM3SHlacWNDWTUzM1hQSUVB?=
 =?utf-8?B?UTBKWVkzMVdMdk0yL2xVZEtVN3IrcTUxRlVOOWI3a2FtSXdjbkdiOXpmRldJ?=
 =?utf-8?B?ZHZOREhla21oMVRpZHBEYWtVZEI5bm1RRmtxaytheTVxV0k3cUM2VHBDL3Fm?=
 =?utf-8?B?eE1Qd01zZW5IaFY0UGhOU0IrNExlMUF6a0cxN255bUoxL0t2L3dtQkNkVm9n?=
 =?utf-8?B?b1pWSVovQ1hkb0RucCtQd1Q4ZU1WVWxWN1FEU0dkaEdjYTlUeUJpSThjTG8w?=
 =?utf-8?B?VGZLdHlnMXA4dFJoY3ZtNFJNU2YzNU1LQjBqSGpMcWJmcHN3bHNMZlBmcEhu?=
 =?utf-8?B?dEY4UkthNUlOSnpCNzhBZXFoVmNCbWQrVE1wMWpkUjFqcHZCZWtHcW5Ldzlm?=
 =?utf-8?B?OUI3QXhGdklib2pHMk5vYlBQaUtLWWFNbWdCZ056WW9aQm5YYWJ3NXZWc3hJ?=
 =?utf-8?B?azZ5R0VRNnJNSE5zdk1SS3ZnYkJBcStRV1dwOStyS0o2UTBTZ0IrM3J3TE9R?=
 =?utf-8?B?S2JTQ1g5RUNFTnpJNUN5U29hWGZsKzJvc0tHajdISzlaZkZyd2JKMXZ5QmF6?=
 =?utf-8?B?Skx6L3diQ3U5a1hzSjU1QWVSWHZNMUROMVVLcEg3Zis1WXVUSW44WThCOG0z?=
 =?utf-8?B?M3FOcWRSazNpZEtCdmh1anlrb1NtU3lwbW96M2lTa1JZV3R0UitMZW11MXFM?=
 =?utf-8?B?MWs0YTdaLzJiVUR6b3JOMHNKMlVOdDNzNHI3anJSRm81NjhDbCsyWXM4UlZw?=
 =?utf-8?B?Q0pBcGl3K2E4MjZwWGlPQStWNUttZStwellDOFVwYTVlM0VmYmp6R0ZIQXAz?=
 =?utf-8?B?Q241Q1pEa1FFcDg3ZklzVWgyTUJVckNhOGRmSkJ3TUF4bm9sNm9PUkZUbTdL?=
 =?utf-8?B?RXF1djZncXhHZnJiY2IrZGl3L2FiMVJHWWNNOTNBaWxDcURpVG5EL3g3N1p2?=
 =?utf-8?B?NkRwZ0FhWUdid0w1ZEpVU2VoVEg2eHBRSlNqNW5JOU05N1Z5UHhMbW9TQVlK?=
 =?utf-8?B?dEFLU2psdXJpam1waTBHUE52R2pRU1Q4U3JWUDRyK21RMHd2d3ZOME1Sdlor?=
 =?utf-8?B?bGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <61CE342DB674514EB5B122AC587C1E22@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b3881016-d762-4bf6-8cd6-08db73fbc9d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2023 15:09:06.2772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fQDKWymwLv+9++T1Gz5rKiilbIey9rneaKRsJowhhz2VpBdJRabCepvwgSsAGfRZdP0pwXS2HR4odQ/4ohOA2McyxV5AFTeYhGvwVztUBJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3200
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzA2LzIwMjMgw6AgMTM6NDgsIFBldGVyIFppamxzdHJhIGEgw6ljcml0wqA6DQo+
IE9uIFRodSwgSnVuIDIyLCAyMDIzIGF0IDEyOjU0OjMyUE0gKzAyMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+PiBPbiBwb3dlcnBjLCBzd2l0Y2ggdGFibGVzIGFyZSByZWxhdGl2ZSwgdGhh
biBtZWFucyB0aGUgYWRkcmVzcyBvZiB0aGUNCj4+IHRhYmxlIGlzIGFkZGVkIHRvIHRoZSB2YWx1
ZSBvZiB0aGUgZW50cnkgaW4gb3JkZXIgdG8gZ2V0IHRoZSBwb2ludGVkDQo+PiBhZGRyZXNzOiAo
cjEwIGlzIHRoZSB0YWJsZSBhZGRyZXNzLCByNCB0aGUgaW5kZXggaW4gdGhlIHRhYmxlKQ0KPj4N
Cj4+ICAgICAgICBsaXMgICAgIHIxMCwwCQk8PT0gTG9hZCByMTAgd2l0aCB1cHBlciBwYXJ0IG9m
IC5yb2RhdGEgYWRkcmVzcw0KPj4gICAgICAgICAgICBSX1BQQ19BRERSMTZfSEEgICAgIC5yb2Rh
dGENCj4+ICAgICAgICBhZGRpICAgIHIxMCxyMTAsMAkJPD09IEFkZCBsb3dlciBwYXJ0IG9mIC5y
b2RhdGEgYWRkcmVzcw0KPj4gICAgICAgICAgICBSX1BQQ19BRERSMTZfTE8gICAgIC5yb2RhdGEN
Cj4+ICAgICAgICBsd3p4ICAgIHI4LHIxMCxyNAkJPD09IFJlYWQgdGFibGUgZW50cnkgYXQgcjEw
ICsgcjQgaW50byByOA0KPj4gICAgICAgIGFkZCAgICAgcjEwLHI4LHIxMAk8PT0gQWRkIHRhYmxl
IGFkZHJlc3MgdG8gcmVhZCB2YWx1ZQ0KPj4gICAgICAgIG10Y3RyICAgcjEwCQk8PT0gU2F2ZSBj
YWxjdWxhdGVkIGFkZHJlc3MgaW4gQ1RSDQo+PiAgICAgICAgYmN0cgkJCTw9PSBCcmFuY2ggdG8g
YWRkcmVzcyBpbiBDVFINCj4+DQo+PiBCdXQgZm9yIGNfanVtcF90YWJsZXMgaXQgaXMgbm90IHRo
ZSBjYXNlLCB0aGV5IGNvbnRhaW4gdGhlDQo+PiBwb2ludGVkIGFkZHJlc3MgZGlyZWN0bHk6DQo+
Pg0KPj4gICAgICAgIGxpcyAgICAgcjI4LDAJCTw9PSBMb2FkIHIyOCB3aXRoIHVwcGVyIC5yb2Rh
dGEuLmNfanVtcF90YWJsZQ0KPj4gICAgICAgICAgICBSX1BQQ19BRERSMTZfSEEgICAucm9kYXRh
Li5jX2p1bXBfdGFibGUNCj4+ICAgICAgICBhZGRpICAgIHIyOCxyMjgsMAkJPD09IEFkZCBsb3dl
ciBwYXJ0IG9mIC5yb2RhdGEuLmNfanVtcF90YWJsZQ0KPj4gICAgICAgICAgICBSX1BQQ19BRERS
MTZfTE8gICAucm9kYXRhLi5jX2p1bXBfdGFibGUNCj4+ICAgICAgICBsd3p4ICAgIHIxMCxyMjgs
cjEwCTw9PSBSZWFkIHRhYmxlIGVudHJ5IGF0IHIxMCArIHIyOCBpbnRvIHIxMA0KPj4gICAgICAg
IG10Y3RyICAgcjEwCQk8PT0gU2F2ZSByZWFkIHZhbHVlIGluIENUUg0KPj4gICAgICAgIGJjdHIJ
CQk8PT0gQnJhbmNoIHRvIGFkZHJlc3MgaW4gQ1RSDQo+Pg0KPj4gQWRkIHN1cHBvcnQgdG8gb2Jq
dG9vbCBmb3IgcmVsYXRpdmUgdGFibGVzLCB3aXRoIGEgZmxhZyBpbiBvcmRlciB0bw0KPj4gdGVs
bCB0YWJsZSBieSB0YWJsZSBpZiB0aGF0IHRhYmxlIHVzZXMgcmVsYXRpdmUgb3IgYWJzb2x1dGUg
YWRkcmVzc2luZy4NCj4+DQo+PiBBbmQgdXNlIGNvcnJlY3Qgc2l6ZSBmb3IgJ2xvbmcnIGluc3Rl
YWQgb2YgaGFyZCBjb2RpbmcgYSBzaXplIG9mICc4Jy4NCj4gDQo+IEFnYWluLCBzZWUgdGlwL29i
anRvb2wvY29yZS4uLg0KPiANCj4gVGhpcyBvbmUgaXMgZ29pbmcgdG8gYmUgYSBsaXR0bGUgaGFy
ZC4gSXQgd291bGQgYmUgdmVyeSBnb29kIGlmIHlvdSBjYW4NCj4gYXZvaWQgZ3Jvd2luZyBzdHJ1
Y3QgcmVsb2M7IEpvc2ggd2VudCB0aHJvdWdoIGEgdG9uIG9mIGVmZm9ydCB0byBzaHJpbmsNCj4g
aXQuDQo+IA0KPiBXb3VsZCBpdCB3b3JrIHRvIHVzZSByZWxvYy0+c3ltLT5pc19yZWxfanVtcHRh
YmxlID8gVGhhdCBzdGlsbCBoYXMgYSBmZXcNCj4gc3BhcmUgYml0cyBpbiBpdCdzIGJpdGZpZWxk
Lg0KPiANCg0KSSBub3RpY2VkIHRoYXQgdGhlIHJlbG9jYXRpb24gdHlwZXMgYXJlIGRpZmZlcmVu
dCwgc28gdGhlIGZsYWcgaXMgaW5kZWVkIA0Kbm90IG5lZWRlZC4gSSBoYXZlIG5vdyBkb25lIHRo
ZSBmb2xsb3dpbmcsIHdpbGwgaXQgd29yayBmb3IgeDg2ID8NCg0KZGlmZiAtLWdpdCBhL3Rvb2xz
L29ianRvb2wvY2hlY2suYyBiL3Rvb2xzL29ianRvb2wvY2hlY2suYw0KaW5kZXggYWU0YTE2MDhk
OTdlLi4wNWQ3ODllNmQzYjYgMTAwNjQ0DQotLS0gYS90b29scy9vYmp0b29sL2NoZWNrLmMNCisr
KyBiL3Rvb2xzL29ianRvb2wvY2hlY2suYw0KQEAgLTE5ODgsNyArMTk4OCw3IEBAIHN0YXRpYyBp
bnQgYWRkX2p1bXBfdGFibGUoc3RydWN0IG9ianRvb2xfZmlsZSANCipmaWxlLCBzdHJ1Y3QgaW5z
dHJ1Y3Rpb24gKmluc24sDQogIAlzdHJ1Y3Qgc3ltYm9sICpwZnVuYyA9IGluc25fZnVuYyhpbnNu
KS0+cGZ1bmM7DQogIAlzdHJ1Y3QgcmVsb2MgKnRhYmxlID0gaW5zbl9qdW1wX3RhYmxlKGluc24p
Ow0KICAJc3RydWN0IGluc3RydWN0aW9uICpkZXN0X2luc247DQotCXVuc2lnbmVkIGludCBwcmV2
X29mZnNldCA9IDA7DQorCXVuc2lnbmVkIGludCBvZmZzZXQsIHByZXZfb2Zmc2V0ID0gMDsNCiAg
CXN0cnVjdCByZWxvYyAqcmVsb2MgPSB0YWJsZTsNCiAgCXN0cnVjdCBhbHRlcm5hdGl2ZSAqYWx0
Ow0KDQpAQCAtMjAwMyw3ICsyMDAzLDcgQEAgc3RhdGljIGludCBhZGRfanVtcF90YWJsZShzdHJ1
Y3Qgb2JqdG9vbF9maWxlIA0KKmZpbGUsIHN0cnVjdCBpbnN0cnVjdGlvbiAqaW5zbiwNCiAgCQkJ
YnJlYWs7DQoNCiAgCQkvKiBNYWtlIHN1cmUgdGhlIHRhYmxlIGVudHJpZXMgYXJlIGNvbnNlY3V0
aXZlOiAqLw0KLQkJaWYgKHByZXZfb2Zmc2V0ICYmIHJlbG9jX29mZnNldChyZWxvYykgIT0gcHJl
dl9vZmZzZXQgKyA4KQ0KKwkJaWYgKHByZXZfb2Zmc2V0ICYmIHJlbG9jX29mZnNldChyZWxvYykg
IT0gcHJldl9vZmZzZXQgKyANCmVsZl9hZGRyX3NpemUoZmlsZS0+ZWxmKSkNCiAgCQkJYnJlYWs7
DQoNCiAgCQkvKiBEZXRlY3QgZnVuY3Rpb24gcG9pbnRlcnMgZnJvbSBjb250aWd1b3VzIG9iamVj
dHM6ICovDQpAQCAtMjAxMSw3ICsyMDExLDEyIEBAIHN0YXRpYyBpbnQgYWRkX2p1bXBfdGFibGUo
c3RydWN0IG9ianRvb2xfZmlsZSANCipmaWxlLCBzdHJ1Y3QgaW5zdHJ1Y3Rpb24gKmluc24sDQog
IAkJICAgIHJlbG9jX2FkZGVuZChyZWxvYykgPT0gcGZ1bmMtPm9mZnNldCkNCiAgCQkJYnJlYWs7
DQoNCi0JCWRlc3RfaW5zbiA9IGZpbmRfaW5zbihmaWxlLCByZWxvYy0+c3ltLT5zZWMsIHJlbG9j
X2FkZGVuZChyZWxvYykpOw0KKwkJaWYgKHJlbG9jX3R5cGUocmVsb2MpID09IFJfQUJTMzIgfHwg
cmVsb2NfdHlwZShyZWxvYykgPT0gUl9BQlM2NCkNCisJCQlvZmZzZXQgPSByZWxvY19hZGRlbmQo
cmVsb2MpOw0KKwkJZWxzZQ0KKwkJCW9mZnNldCA9IHJlbG9jX2FkZGVuZChyZWxvYykgKyByZWxv
Y19vZmZzZXQodGFibGUpIC0gDQpyZWxvY19vZmZzZXQocmVsb2MpOw0KKw0KKwkJZGVzdF9pbnNu
ID0gZmluZF9pbnNuKGZpbGUsIHJlbG9jLT5zeW0tPnNlYywgb2Zmc2V0KTsNCiAgCQlpZiAoIWRl
c3RfaW5zbikNCiAgCQkJYnJlYWs7DQoNCg0KQ2hyaXN0b3BoZQ0K
