Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BC47E1BB9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 09:14:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=c+Zx0Crn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SP3zR1LxNz3cPj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 19:14:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=c+Zx0Crn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::630; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SP3yZ6FpFz3c3g
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Nov 2023 19:13:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cq9Hb1LnB+rSp50xB9cWX2JD5NxuExheBP5UHnGYf1/8lA7NBXodglrIPB6eLsv1f/tX/FsbuFyV4RDF12io6NjfI9vT4GA1HmXP55N2dXFcru4SBuTa8MpQoxVCNoPQ/pC+wdXc6d35xC6xyXY3RPXrbUwWkoDpg6HVvl+oRmUvMKRjZl93j7IHoOkRwddtlBl4BqWYJYccXPzmxAKURV/VFB+FQKH9+/enBB07S2AgcyTLMoRDUIU58dChrMlP79FZgWMIAxHl+ry4QV+tePdGCx5oqG7dMmkLU0Bz7U/yM0PYPIX0PflGsN2+r5Pxc+ISMqnOOoPQzkmBCw1pjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6k4PVASu4wBgXyEoiJzUG3OTDK08Z74QaJlAZuolUA=;
 b=RSi8/d4nCfSEeDAVNp9IDfGZgBL9U1Udjw/CpE0VfAJba0dL4Uf9GggI1DYiLCjYshYN+5ncjcQEhjRGzzKUJn0DA1mcomBOyiep0zmEzt97IAx/01NTxhnyYg10xA+aVwB4WSu6j3kJoCjkDKefyBQSj1CVf5x1O3KFUaqBgO1C6ZxrnMbJ+5l9chEvXmOuO/Qqu/ht+/iBJ/Aulxi1CYQf0Vla0Ch9gmIi/zf20IP/wxMLpOa3cjN6hlz1lyQ1xhyDQppYaKnaEaO0NF/o9TmO2yn+66sJorozqZOxdf4F2eelp95afRUcZ21w5vKVu7ahWNnkXPOxq7a5ljNuSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6k4PVASu4wBgXyEoiJzUG3OTDK08Z74QaJlAZuolUA=;
 b=c+Zx0CrnH5LneyjmSQU6c9v151r1CeNFBdJR7jgkcja0ZtN7deFJhrdoI8tqREIktW/Yiw+gf8rPxWnYBsdV9QFVnVCHi80pf5Gm9hKp7aNfmXBE+ZzKyNNq2Gu4NlwYMxoplBpqBXrqAd9o65jiJhZLpW+chxIZMA/opct34x0dKZ/L0N6ALvHbU2vYTn9n9Yrrgio1Tnu+jeGB0iKktrinF02ldHoC0jTQtFVPrWu/w0nnUdhKabmC/2vuBNQr6VQz5KSGTv+0aUTV7+NxBSAyvElZbLamtNyTqxtmE7tfbvdd2S6T3/LO3knX/Qx0SQnSf9mzae7kBJEjq4zrAQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1726.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.16; Mon, 6 Nov
 2023 08:13:19 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.6977.016; Mon, 6 Nov 2023
 08:13:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: George Stark <gnstark@salutedevices.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
	"lee@kernel.org" <lee@kernel.org>, "vadimp@nvidia.com" <vadimp@nvidia.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "npiggin@gmail.com"
	<npiggin@gmail.com>
Subject: Re: [PATCH 2/8] leds: nic78bx: explicitly unregister LEDs at module's
 shutdown
Thread-Topic: [PATCH 2/8] leds: nic78bx: explicitly unregister LEDs at
 module's shutdown
Thread-Index: AQHaB0RDN4KBGCQZfUKPPM6Ze+W+qbBtA6kA
Date: Mon, 6 Nov 2023 08:13:19 +0000
Message-ID: <810346b6-c8a4-8c40-8fe3-242332428313@csgroup.eu>
References: <20231025130737.2015468-1-gnstark@salutedevices.com>
 <20231025130737.2015468-3-gnstark@salutedevices.com>
In-Reply-To: <20231025130737.2015468-3-gnstark@salutedevices.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1726:EE_
x-ms-office365-filtering-correlation-id: 5d128e69-19bc-4e49-faae-08dbdea03c4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Bk1OQbN0HpawmcgwpcXPnOUwUrFGdGr3/YAnqqHJzZ8rj3KyqFAnyzNbbiGZRPrG1esXuGZw71oK1ZY47BUt6qEBeWCINDl/i8GEWC26NE0YT9vHr2wGxIFXA1dp9daJBuxfdIlHcwigjQ/ERaTa3//e/p2Vv7Pd5iNVgm+FQanfhSX2KIZKBDH57Y4O3Ots0fQjU06RhaNXgpNJFxlYHTh/LVSsxnsuYQ/IH/eP6mZ5xBwajql5piiB9G+8yZMOjsmDgH9BqcMUYcvIfAIv8lMelh3NoOOhSZOie9/CSHfWWoqskCJvHAF6V0/lDEbxYn2qAFzYIgt0IIzjjVbNyw7fCvnrPRCWtW8vUhHeJFESTYMVufX8Y/RCoE755PFe0ot/xQATkWuvHtbeYdopKJm6FUawKbzgEOuKadV6yJ78GobOzzI5doKEKYP/Q++1kIlJymKWwYJNTaCg61WkD53/+ALOpcPsRAgHETZIGI/MiosgkFztzWdB0KXOdvWC53kZJ0GeZ0bAjWeHqFJFDMfYsElpLw5Oh4PDXFdv7i7mR4AvMK3UAJ4sPbgWUCgccu+Hbc/qU7hpOr+t4hAqqrGQC+5GIYeuzWcazsyjruJC2mTTX3RqlfRuZw3pxaa8i4IptDQ+hX3Ub3he7AstNgS8s9EoOcDU0OeoMxa8yfYYHbe8Q0I6qXPYrW/TGMOF
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(136003)(376002)(39850400004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38070700009)(36756003)(66574015)(316002)(4326008)(8676002)(8936002)(83380400001)(66476007)(26005)(110136005)(2906002)(64756008)(66446008)(54906003)(66946007)(66556008)(91956017)(76116006)(5660300002)(44832011)(41300700001)(478600001)(6486002)(6512007)(71200400001)(6506007)(2616005)(7416002)(31686004)(122000001)(86362001)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?STNDRWRGT25UQ3Y4eTBEQ3VsdUhhcFV4aVpmaGVaRDQvem45clQ0SkhabTV5?=
 =?utf-8?B?L2lPcVd2R0ZROGIxVk5Yb0xPTkRlMDEreGZaRS9GQ1dZeU53MGpjUUt6d0NR?=
 =?utf-8?B?b2F1MmtaN2RNSDBSQk5pMWhPLytPWENid1VKK29GVE5ES0c1UENsY3ZWUTlx?=
 =?utf-8?B?Y09abTk5U0NsbktVQ0luMEEwSDJlQW9CenhRd1VJNHpFUThnZW1uT3dyRVcx?=
 =?utf-8?B?RXNENzgyaXhLL3gveGluOGkyWmZXSkYzS3daWTJYN3o3dXVTQnJ4MFVPWXFq?=
 =?utf-8?B?MjdxN2pvTVJiZkNudmJrdndRUllOb2hDQXFQaWpKWmk1MXREdkpEbUY1VCs4?=
 =?utf-8?B?SUVod3J6ci9IdlhtZ3RuSjJoT21RZzJEWHhEcmhiUWFBMXJEb2toTVZNWDZK?=
 =?utf-8?B?UjRtVDJxMndyUEJvQWo1R0dWUEZQbmtMM3lZV1ZHVCtQY3JDanc1VSs1QS94?=
 =?utf-8?B?Z3Eza1FjVk9lMWRRemNnNE9HcDZhUE04MjFmeGhYV2FDY3hWZnI4RVRlQ0sz?=
 =?utf-8?B?T2ZGUDZVWjlmU3BiQXF4NGRZQjBPaWhXSjNFOGgzYXZXTDk1ZGtPalhrT1VL?=
 =?utf-8?B?YnVlbkdReFFJc243T2tSR09MaWM5K2o5S2lqUXZNRnlOd1d3Z2kvU3BUczRm?=
 =?utf-8?B?L1Mrby9mVjFVaC90dmxhK2tSemFXdHVsSlZjREJKMkN6Tk1uQzZqTWQ5cmF3?=
 =?utf-8?B?R1Q1Sk83RjNIU3NxaEMyQU5xUXFoQWRVemJCZE1yKzNBZnA1QlhBa1FHZkha?=
 =?utf-8?B?TXJkZitpTVQwVnFEWFN4bEF5VXlpOGk2UDVaQnE2WXFjQmVTQU9sdVlMNmNs?=
 =?utf-8?B?TnRVdjlpeDd6dGhrcWNTUmZoRlk1RlFmS1poL3lpWUk3QXlxTmlnd2E1eUdQ?=
 =?utf-8?B?S1dvejM1ZkVweUpwczQwWG91a0xzYm4vZTgyTFJyRTdFOThxbXVNL0tuK3Jp?=
 =?utf-8?B?T1AwMys3QlNVcCsvUjh0MVpHZFJKcVlhaDRtbVFpK1lITUhKMUQxMDhMZXRi?=
 =?utf-8?B?MWxoeHpvMWcrTnluREo1VlJld2tubHVUNDhGUkdhVnVQcjJyVGdJRVlhTVVo?=
 =?utf-8?B?dHVheXk3dUdpMit1ZWtYMXlqLzNaOWJ5Q2FOWHhtb2w0TTZWUStmS3BPbERZ?=
 =?utf-8?B?M2tsKzV3emtpRjlSMXVBendVemJjT2lSYy8rZXp2VU9aWnBzVmlza2ZBdnNE?=
 =?utf-8?B?NnBXTnRnYXo2TWxVaGIzMG0vdm1xVzhBelNxaXQ3NzQ3UXZlRkRaRkphcm01?=
 =?utf-8?B?Tk9UOUxyYk1PZjVvamVKemxGMExkcXpiOElSTkFTOW5JQXliZE5KeHhFWmIr?=
 =?utf-8?B?MWpjM0FLMDlFUlFIUXZ1eEh1L2JrczJ2NnVBRzRUd2Y4dnpjSEJmcjE2NjFC?=
 =?utf-8?B?U0VzRWVPempwNEpUalRBc1JYOU1Jb3lmanhwek5xSDl0MnUyVWF5NVp0R3c1?=
 =?utf-8?B?QlRlVk5BYXlMNTBaYktqbVU1Y0dSUlJJU3RKSEx4V0lZTlhhUE1NaGM4RlpQ?=
 =?utf-8?B?U05BOHovc3RNMmludVplaURJYi9xTlB0a3kybXZ3cXIwNDFpM0dBV0xmNjVn?=
 =?utf-8?B?dVdlY1JYZDJMcFpSTWw2NERsaFYyWmJrWHRObVVmVUNHUXhpOVJYTm5CaHM5?=
 =?utf-8?B?QnV3b0NCaG9xUENudzlVQmZ4aERUMEVjSHpJQkxBSlh1UzhqSUNVTlZVSllr?=
 =?utf-8?B?OG9SVG5oZ1FjdlhoSnhtRFBHTmlCTjlwbTJOSGxrbVViTEdHSlFORUR1Y0tE?=
 =?utf-8?B?cXp5QkRIVksxSUFYVEVzeEhxRmZ1RmtCV3lsS0ZtYTdnQXp1Mkk0Mmw0RHd4?=
 =?utf-8?B?T1hQWG1sbjMzOUdyUGZHazJaMy9vb0dRN2ZVenVvb0xnNFE4dmpFYVQ0emxX?=
 =?utf-8?B?d1RNUWFXNU1BanY5aEpMU2pjVitSRVlFc1QzV3NyMngyaDB5aUJOeThvSDU3?=
 =?utf-8?B?YjA3Vm5odFBNcWMwOHhIOXpoSmNQVWF1Wi9ybEJWM1IrVzBiM3hLLzVpQjdN?=
 =?utf-8?B?OURhOHpKNkE1LzI1SmlvNGUxWDU2Zm9lZVUzYjdEU1Q1OEpjcmo5MmQ1WitP?=
 =?utf-8?B?anJIR3RMaTIrRUJ0TUZKRTk4T0l6Tk5Qc3hJbUpNOHZCMEQrbnB1N3JmdDg3?=
 =?utf-8?B?RFN0NnJHMUlJSEgyRmlkb0NVK0FaMHpkZjNoejVjd0pOaytkUFRKWkFwWTFQ?=
 =?utf-8?B?c0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F51D87CC6F97074CB7AF73B7245BE27F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d128e69-19bc-4e49-faae-08dbdea03c4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 08:13:19.0323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CnumUsX+gGE56aizfAwJ8/bzcfim/1PjHJFsGsxf6NlsD6gsDbH5EUzAd6I0pTgVFy+FLHTSwFsvllpwvYCO9IxIuI3mXpZQyUsfw4vgVfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1726
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
Cc: "kernel@sberdevices.ru" <kernel@sberdevices.ru>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzEwLzIwMjMgw6AgMTU6MDcsIEdlb3JnZSBTdGFyayBhIMOpY3JpdMKgOg0KPiBM
RURzIGFyZSByZWdpc3RlcmVkIHVzaW5nIGRldm1fbGVkX2NsYXNzZGV2X3JlZ2lzdGVyKCkgYW5k
IGF1dG9tYXRpY2FsbHkNCj4gdW5yZWdpc3RlcmVkIGFmdGVyIG1vZHVsZSdzIHJlbW92ZSgpLiBs
ZWRfY2xhc3NkZXZfdW5yZWdpc3RlcigpIGNhbGxzDQo+IGxlZF9zZXRfYnJpZ2h0bmVzcygpIHRv
IHR1cm4gb2ZmIHRoZSBMRURzIGFuZCBtb2R1bGUncyBhcHByb3ByaWF0ZSBjYWxsYmFjaw0KPiB1
c2VzIHJlc291cmNlcyB0aG9zZSB3ZXJlIGRlc3Ryb3llZCBhbHJlYWR5IGluIG1vZHVsZSdzIHJl
bW92ZSgpLg0KPiBTbyBleHBsaWNpdGx5IHVucmVnaXN0ZXIgTEVEcyBhdCBtb2R1bGUgc2h1dGRv
d24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgU3RhcmsgPGduc3RhcmtAc2FsdXRlZGV2
aWNlcy5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvbGVkcy9sZWRzLW5pYzc4YnguYyB8IDQgKysr
Kw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2xlZHMvbGVkcy1uaWM3OGJ4LmMgYi9kcml2ZXJzL2xlZHMvbGVkcy1uaWM3OGJ4
LmMNCj4gaW5kZXggZjE5NmY1MmVlYzFlLi4xMmI3MGZjYWQzN2YgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvbGVkcy9sZWRzLW5pYzc4YnguYw0KPiArKysgYi9kcml2ZXJzL2xlZHMvbGVkcy1uaWM3
OGJ4LmMNCj4gQEAgLTE3MCw2ICsxNzAsMTAgQEAgc3RhdGljIGludCBuaWM3OGJ4X3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgc3RhdGljIGludCBuaWM3OGJ4X3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgIHsNCj4gICAJc3RydWN0IG5pYzc4
YnhfbGVkX2RhdGEgKmxlZF9kYXRhID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+ICsJ
aW50IGk7DQo+ICsNCj4gKwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShuaWM3OGJ4X2xlZHMp
OyBpKyspDQo+ICsJCWRldm1fbGVkX2NsYXNzZGV2X3VucmVnaXN0ZXIoJnBkZXYtPmRldiwgJm5p
Yzc4YnhfbGVkc1tpXS5jZGV2KTsNCg0KVGhlIHdob2xlIHB1cnBvc2Ugb2YgZGV2bV8gZnVuY3Rp
b25zIGlzIHRoYXQgeW91IGRvbid0IG5lZWQgdG8gY2FsbCANCnVucmVnaXN0ZXIgd2hlbiByZW1v
dmluZyB0aGUgZHJpdmVyIGFzIHRoZSBkZXYgY29yZSB3aWxsIGRvIGl0IGZvciB5b3UuIA0KSSB1
bmRlcnN0YW5kIHlvdXIgcHJvYmxlbSBidXQgSSB0aGluayB0aGlzIGlzIG5vdCB0aGUgc29sdXRp
b24uDQoNCj4gICANCj4gICAJLyogTG9jayBMRUQgcmVnaXN0ZXIgKi8NCj4gICAJb3V0YihOSUM3
OEJYX0xPQ0tfVkFMVUUsDQo=
