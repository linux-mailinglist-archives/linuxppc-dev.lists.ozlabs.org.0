Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7722078F869
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 08:11:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=FER85wb4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcSMr59DSz3c5J
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 16:11:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=FER85wb4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::616; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcSLw1PgWz307h
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 16:10:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsutbdhqAqPXvBKHme9Kzc1C3lAP9fFwqDfgF0Rx2RQFr2hYe8j8qnz96Cp69ay653gKRWN2ywqdafpABWy6kOeg0m9mLQtNem8wUC/f+VW2vRFloTMamlU8H7+mGx8dNLoJXG08u1oMlS1/4h4eC1zgcvb7wM2iT2Zfb7EBdsypeZKIs1giZN8m8X6CW0fHKMKY9tAYLmCYLSdfdiujt5GgMNyv6oXZ/iuDU2O4UNye1ocrbboErYfik5EWmBjU84Sr+gv+W2I8wo/Wp1lczl4dLcKhHwfZT6YcId9M6V72/7IKWy9qIwUlEWnGWFh8faL5OPqHxky/TztpFBAnYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGAOTg9XkM2qqXMs0Yvs704UqiZscQjve96eCpENyOg=;
 b=bNiP/Zs4ZjBnaKWEFUcsja45dnVWhRCFjXunCva0pXKKLHM+hQpmdjjDI1BzgYfmIc43RQp5r7cCU63Yi7X/UiF50kQiZOoO5tMmSf4N9m08vYEKDgaFYGezjwT/OgR4XlTNID8ugTA9KiPRPf9atJ1LQhSYUJARAbZlUeyW4UoQmQKWEZpXiJnDriPlnxWVW+lEQEA23OPxjkPk/ryOYnDyIn8FxTXQFFtLXp8MXB1o2njr/lveU5UOjW9iIVuIVPSWZd/LIzWG5/Hp8KX3BimXV00wFwJPTat8s3jEo7nKYX5zvsEEmfMtp2xdbej3YT8VQmMy/BQ8iwEo4EJCSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGAOTg9XkM2qqXMs0Yvs704UqiZscQjve96eCpENyOg=;
 b=FER85wb4BZBVf+jKS7hdk1csU1ZmR2tHL14FS0fJnWXyZZ3UI/bbxajmmi3+Cydm+2UpoeS0qzmrQPiL9QZkNrAiHhqDPrfn6EozJmkrKKpE2gSHcfH9/sFnSzDpU8Efepu3Cnmvo1EJwp6Hvnj251iizQ0ChCOkgtLLidGSoK1ORHPZfK8QHTPWf4dRPN4dXanwLBXpvWCGyjoMxi51o6Ptj2LfrF6KKQkdBKfXRQ/2neuJe00g+ZkaRgObXM5bCqDRmZkL+Q1cqtv5Ng2ZxqmL9GIDJYWOF6eqkuOITo3KEYzMckJULij4CIXOVEe5YiKAA2gC15CfCJL5BPccsw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1542.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.25; Fri, 1 Sep 2023 06:10:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6745.023; Fri, 1 Sep 2023
 06:10:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Yuan Tan <tanyuan@tinylab.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"hdegoede@redhat.com" <hdegoede@redhat.com>
Subject: Re: [PATCH v2 3/3] kconfig: add dependencies of POWER_RESET for
 PowerMac
Thread-Topic: [PATCH v2 3/3] kconfig: add dependencies of POWER_RESET for
 PowerMac
Thread-Index: AQHZ3H4dkvaFC4VYs0uyiJcAQaQm/LAFfOsA
Date: Fri, 1 Sep 2023 06:10:08 +0000
Message-ID: <420a82eb-f6ed-7daf-6ca9-f14de7078b0d@csgroup.eu>
References: <cover.1693535514.git.tanyuan@tinylab.org>
 <60cbfd566777a6d6e3664d7f29fa91424716c873.1693535514.git.tanyuan@tinylab.org>
In-Reply-To:  <60cbfd566777a6d6e3664d7f29fa91424716c873.1693535514.git.tanyuan@tinylab.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1542:EE_
x-ms-office365-filtering-correlation-id: 3f45349a-83db-4bf6-86ee-08dbaab217c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Q/8opar7l7UkP56nNUbGn3hfvdf6lxHF+FHqIugHFBa9ChbAzV9pLbLey5V3UAcZwqvDYV3Qw0srqLeFrvnmXuYmknxV2clJgbk2ufnVNAmkslNcVBAIDJnY/rvOJ3uRtq0TjUTNd+CoYEUtrxCU9W6o6mG3LCc4mFGEJ5ZM1Ogm4zr3AMVOpXGxE11es0zXNV/WlorWufGfer0gzqcJVQN8CunOdWUiMe6U9+5mnvQw4SNFMEy8MMc+q5A7tGiKHw2fY65R3DigPpo5huv1TYPZzgzEBajqWljUIJ/57Gc98Uu4gPdcFgdW3yeLyQAipF2ZhqN5FB5Yl7sHZesscOr01PpiwYsqYjhfrSStIFZ+ipGy220PcnsHevtomlKq0zp6/8aPZTydE9FyF9RnmBDv85ceVkkCmuxNgKT1/T9HqoUrzwliaIiZslAvwsQCgoeX7NLzz0zkInBxzz85f4/hImagIPzuLLcBqw20VaPLtLXwe/9KQ8ufS7uAHIB/MR0h1LTgBW2KFNnDS0EZAm5KLFLY1CtFNGuIfL4hGTtXsTdWdBG+8VNuTLzJvKLUiqZSZmk2aivuRWn015l5QiowdM+d4H67ZzCJ+goJajyBxXC22RAk+YI0JR4nnlPEEEW8Mf5QKchDuEqzu72cKWs7IGa7Q6FkoEWle/rzPzrNEgf7bmiz2MlnVVymsKBe
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(366004)(376002)(346002)(136003)(1800799009)(186009)(451199024)(4744005)(7416002)(2906002)(316002)(41300700001)(5660300002)(44832011)(8676002)(4326008)(8936002)(36756003)(31696002)(86362001)(31686004)(71200400001)(122000001)(478600001)(2616005)(26005)(6506007)(6486002)(6512007)(76116006)(66946007)(38070700005)(38100700002)(66556008)(91956017)(110136005)(66446008)(64756008)(54906003)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Z1diaXpYODROQ01rVk1ZQXprazVtTzVyTkVFUHQ1V2NmOTlkbFpKZ3lUQlBD?=
 =?utf-8?B?MDBlRG9LMDNObUc5cjB4VFdzcHdnczRhbW03ZlFwYWtvRkkrMEtpQnE4RUdr?=
 =?utf-8?B?TjJMZzNqWmQyb09NTjU5dktWQ21xQ2hoTzJiN21NVEF5QllSNkFJd3QxOUVF?=
 =?utf-8?B?R2MwSko0cmpyZ3FsYmFXVkt1WUpXR2VqeEREeHhqeVlTSUFPeWFtWGIrNTJ4?=
 =?utf-8?B?eEMvNVZMbUhWdDZVNEdVMytHMG1lNUpYQzZVWThMUUZuSWQvdU9DVVBCVmRN?=
 =?utf-8?B?TVhXOXBQelI5ajZkSGZnQy9NUTFkRnZubzUxTXZOL2xqc0tUSmV6R1drSGp1?=
 =?utf-8?B?ZWpxL1l4RVZ3bzFQREdRREtQbWNpTUxLQSs4ZWJIL0t5RDgrbjh6SzR5MUhS?=
 =?utf-8?B?ZHRiOURNVVhIaVZrbHpNVWtIdWpmeDNJeUFjQXlhVUNIR3dpaTdvTkEyVlRu?=
 =?utf-8?B?K2R3VWVUdUNnYmYxZEJkL09JVUd2Q3FZOTJEekg5elNVbkd1eGhPK1oxZVkx?=
 =?utf-8?B?aFNScnJ4dzY5M2MraC8zSGwxNFdEUlpndEZhMTM3aENadWp2dTBKMHg4U09k?=
 =?utf-8?B?Sno4WlhZVlJwZFpHMmpTckFEUzBibGVHbmxCYzN5ZURYakhMS1N1a3pFTTZX?=
 =?utf-8?B?bmY4eGE5ZE90NUo5bHI0RkhaeHZUTHZXTm5uRC9aVnZCRW8vUWYvVjVzYWdk?=
 =?utf-8?B?c0N1M1NGeGlKUDloaVNXVXBOWnMwbUlQSHh6TkQwblJaTmg5MGJUUEcxNU1U?=
 =?utf-8?B?ajVKV0xKdmV6T2RQbzUxakpQT0FjU21DYU5mSnk3TzBjOW84YXpheXRuVGlK?=
 =?utf-8?B?RlFabXN4UEpCTU5wZUROYVlsVjRSS2lyNllFcTJFSVVSd05KbHRlU1NMQjZU?=
 =?utf-8?B?TUYrNmUwK3hJK3JhbHVnUSs5dnFrRVFlL3FnUXhkdkswRTYxbkhvM2lyVDNY?=
 =?utf-8?B?SHRLckM0eCtkY2pHcUJxZzNaMWJ3UndpeFF3NVk3QjhGR2JWUUJ0TUIyWkFk?=
 =?utf-8?B?OElKd3VZTnV3WXpmcUppb25LRW1nWFRnZTI3QjlwYjc1MFVXd0hlcmxlemht?=
 =?utf-8?B?QTRJRUV1UE41VTErK3pyTm1vOGhUQUdJR0V5bkJlb2ZmT2drcHViOHZBVzJT?=
 =?utf-8?B?Y1N6dUJJWDYzTHkwaXhBVitGWEUvOEptd3A5RWE4RU15VFY0Sm1qVWxNODZM?=
 =?utf-8?B?aFFhdVk0eE1aWFU0dWw4emdOTlRZc1UxbC9JOFgwL3IxTm5QMTd1QzdNVllJ?=
 =?utf-8?B?aUpUY2E2S1dZSVhFbzJhM2o2S1BHTG1FbnZscWJvSnZHcnNBLzR2NTk0QmJp?=
 =?utf-8?B?MVNXVkY3NVY4RXAxNmdSS2E2VVNFYnR3RHMzWkpYQzVLWGxFZXRTYjJyQlVN?=
 =?utf-8?B?QTV3YU1td0wyemY4dWJPVG52aW9xenZ6TThGWE5wMDRrYzVnRmI3Z1dmZU9X?=
 =?utf-8?B?dnNxTms0OHBJeW5WMHVEcitybG5sQ2M0TlBSVUw1UU56NnFTZnJManRYVGht?=
 =?utf-8?B?RXdSaGptaGxhSXVPejFLZEZLeUR2V1RLN094eFdpNXcwN284cmRlR1dEV2hz?=
 =?utf-8?B?QmRFaEJpRFpkajdsYXdCWGlGTTJuZ00vZmJ1ZFdkTTRSOU5VUVRVVWY2UXg3?=
 =?utf-8?B?TmY4aHJJL0g1Z1RGenNSUzNvYUhFSXp5cm1XTU1ZVmt2elQwOGJMZkZUdzRE?=
 =?utf-8?B?SFVaMkRtUkU1V2RDT2hIdjJLc0dNa0pMVmNyMldnb0lYT21WVnZJZC9JdzE1?=
 =?utf-8?B?UzEzUm9OK1FBc2c1d3lqM0czQ21NOTlvczl3d3pTajdzaDFYcklZVFUwWUta?=
 =?utf-8?B?L0JlZ0ZQc1hMRXJ3NGxkTDBPTVNVc3NpRXVxSlp0d1R4VXM5aWJvY2xNUjBO?=
 =?utf-8?B?Ujlqb0tHM2JLcDZpVDJ0clYzQjBRcDFZS0pQUjE2SVVxcFBtL05sajhDMExN?=
 =?utf-8?B?bjJvN3NhL0pYSFFlQkJEdTlvT0RmcTc0bEdOT2FHRXFNTDEycWFEYVFHcytl?=
 =?utf-8?B?TGVVRzMyZXpSYVQ1Q1ZRYURtbmZEMWlGUUJ5K2IrU21EcVVtbVVLR1c0Mzhn?=
 =?utf-8?B?bFJ2UGpZc3h6ZXYwMm5KUEtpczhPOUlDd3hTT2dIY1o2QlVwa2VUemhCTnpl?=
 =?utf-8?B?TzE3Vk1YUThrWlZpVkJoanFYd3NDY1h4eWZxUWVIbUtoNEpZclVWWm5nZ0pw?=
 =?utf-8?B?QkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <795045BEA484DF4797968B1F2CE0A07A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f45349a-83db-4bf6-86ee-08dbaab217c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2023 06:10:08.2551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wgo+H8q/k8sd0sksrjcj7IwcyEopY0znFeQ2/h+hFWiXxPZD20tU42KxCoz5yOE8GgwlP1wKsW2rTfqRayPOyTeqc+wyYA0B+PPRGpClPns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1542
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux@weissschuh.net" <linux@weissschuh.net>, "falcon@tinylab.org" <falcon@tinylab.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "w@1wt.eu" <w@1wt.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzA5LzIwMjMgw6AgMDQ6NDMsIFl1YW4gVGFuIGEgw6ljcml0wqA6DQo+IFBvd2Vy
TWFjJ3MgcG93ZXIgb2ZmIGRlcGVuZHMgb24gQURCX0NVREEgdG8gd29yay4gRW5hYmxlIGl0IHdo
ZW4NCj4gUE9XRVJfUkVTRVQgaXMgc2V0IGZvciBjb252ZW5pZW5jZS4NCj4gDQo+IFN1Z2dlc3Rl
ZC1ieTogWmhhbmdqaW4gV3UgPGZhbGNvbkB0aW55bGFiLm9yZz4NCj4gU2lnbmVkLW9mZi1ieTog
WXVhbiBUYW4gPHRhbnl1YW5AdGlueWxhYi5vcmc+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9w
bGF0Zm9ybXMvcG93ZXJtYWMvS2NvbmZpZyB8IDEgKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93
ZXJtYWMvS2NvbmZpZyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJtYWMvS2NvbmZpZw0K
PiBpbmRleCAxMzA3MDdlYzlmOTkuLjllNjMzZDdlODM2NyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9w
b3dlcnBjL3BsYXRmb3Jtcy9wb3dlcm1hYy9LY29uZmlnDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9w
bGF0Zm9ybXMvcG93ZXJtYWMvS2NvbmZpZw0KPiBAQCAtMiw2ICsyLDcgQEANCj4gICBjb25maWcg
UFBDX1BNQUMNCj4gICAJYm9vbCAiQXBwbGUgUG93ZXJNYWMgYmFzZWQgbWFjaGluZXMiDQo+ICAg
CWRlcGVuZHMgb24gUFBDX0JPT0szUyAmJiBDUFVfQklHX0VORElBTg0KPiArCXNlbGVjdCBBREJf
Q1VEQSBpZiBQT1dFUl9SRVNFVA0KDQpBREJfQ1VEQSBkZXBlbmRzIG9uICFQUENfUE1BQzY0Lg0K
DQpXaGF0IHdpbGwgaGFwcGVuIGlmIFBQQ19QTUFDNjQgaXMgc2VsZWN0ZWQgPw0KDQo+ICAgCXNl
bGVjdCBNUElDDQo+ICAgCXNlbGVjdCBGT1JDRV9QQ0kNCj4gICAJc2VsZWN0IFBQQ19JTkRJUkVD
VF9QQ0kgaWYgUFBDMzINCg==
