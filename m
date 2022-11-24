Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD356378CE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 13:25:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHxzn3xJ8z3dvf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 23:25:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=VegD0zDF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62e; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=VegD0zDF;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on062e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHxyn6pD1z2xvF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 23:25:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euW3KDDMQvAsFmRfqEy6vCRbsr9kZcREb6QpZ0XHKVdSzQN8x6wPBuDO3oY1nj6ohztA58QThjW8rKYUBJodLR1u/jiMtWcnvVg97GERSVMdITQbojin1Hqa+//cZafkjH3wANbVsJ4xqdGxnSkGK+BHgbKHUAYN3yvxvN34jMy1/qysff9MKKDAhPKvbs+6feSuz9z2kF9uWE+2BSAIPdT905YIyq3zK8BqoCZt0TOPH+soTXrX7/l9IY3OJEfLOyKG+FvG/CxNnTMwJd9kmHL89XrJKN/5sEa8JBSuvJqCCXntuQx0WkTVosdPtf5bDeu+IK9ZwepBN8DfCH46lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TgDfMsBZn/QLbFUqGM/xo1UrJTPuLSc0hZzpJxVoq4=;
 b=K5lKCt7WpL3JtJuaqg+ZGAouUz24LqNzJe6EU0F7QU2G1n900T4HgNW9P/AVJAbzkNGK9XtC9pTRJWpIe7Z8yEZOgZXOIyKRuGXrZfrflYp3PvxPU10MpyTKqLomXEqw5LlBuqHpP0oPPd2I4TyvxMknmcn87M3Cpbnm1m9EoFESb7JFeG3AvdpBcHp17hiMVU5d/yn5b1z8mU4gJtcI3wumlvn38AP94svLGta0JGcm+z73sU3pBmQ+lw2/ia0Z98i3iad8eoPN7JT/yDgWyjRAbyXb6EqRslM0ZlmKG2nXlDfA1oMqe+8C1NUir47pQCkTARvxRzY1hLTC5lq/YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TgDfMsBZn/QLbFUqGM/xo1UrJTPuLSc0hZzpJxVoq4=;
 b=VegD0zDFny8LMiszdSlfpa1zQ1gaiFrvFSbZ/brC1Ier0XX9Px2wUBJLTd/rIgAZQYz+qAF2prVHLGxFqTAH8g4OMgc4zUQkFixvrO9uB1BUvjIp3VlexMWWHvlQF2S7KuF8UNKNKmYyQCXjpni/+PTFOWNzVvRmyWjLkCTl87TG1nxQ+QXJvkO0mQ29egR1FgQIoFj4kjdwC6GkfZzXudyyQ7iiGoln2qVfv7Oq126zCxsOmciuYxPhd/GBSvkSLQ2jY1RMywE3W5/w6uwtPeL5qu/QAReOnk76G6qEqVaTzET7P32thM2NwaEHNOUNubTn/dygrjUFrfZu/SjzqA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2091.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 12:24:40 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5834.015; Thu, 24 Nov 2022
 12:24:40 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/bpf: Only update ldimm64 during extra pass when
 it is an address
Thread-Topic: [PATCH] powerpc/bpf: Only update ldimm64 during extra pass when
 it is an address
Thread-Index: AQHY/+BWf7gs5QKIpkuwfOKyhRUrWq5N2yQAgAAkjgA=
Date: Thu, 24 Nov 2022 12:24:40 +0000
Message-ID: <9f17237f-94da-f58f-4f4b-0068851b4123@csgroup.eu>
References:  <3f6d302a2068d9e357efda2d92c8da99a0f2d0b2.1669278892.git.christophe.leroy@csgroup.eu>
 <1669284441.66eunvaboi.naveen@linux.ibm.com>
In-Reply-To: <1669284441.66eunvaboi.naveen@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2091:EE_
x-ms-office365-filtering-correlation-id: c9116359-99c4-4de8-4700-08dace16dc11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  1tmIq5CmZfaknpu/aAoI7PH+p+d69f2JCyixkbUZC1l5WYZNFkcsRJrYhjkOz92nkXlo7rVOQIpCSxsCRVvEmN9PEjGTm5hoBtt7u7n7kfMbZE9mG+XuB9YytYSwQPcxBVBwUjGfKH9A5x05xi4C8tQbvKGST1zf2CMuifT4D2Lek8VaffVK3ApsT/sGJCnYVHSKEo4D11iJY6EGpcmOaiiuSLIwuE6XTR5g+N7mrXw5ZC0xidnksoUD8YDO6nC/2zpQdb5yXbIG/0GvGjvrzeraVwK1MAIDjpZoj4G+oUaI08g0U8miXAeNMK0461wCMzICGzhKIPl7b5wK3wUAMzrEEgyxT7QNKNbaOgj5FjpgBoUS49q0HpJ8Pd/UHBrppsC3xp5niWyh/2USm1JnFNOsZILWp0OsTcfHl2PYDj5MFADFOltu3+l1RGprEc73p8s3UGDwDEujwTfhw5qhQi4dB/f2I5Mi+v2ddCnzpr6ruZdzuLJWtCU2eKku7CFIlPsu6+hP3IOakBovtn1XHzkdTyN8X18v0WP+MwOaZP8IBTGo+LbpP4AvAbbBChVaXZAnirZfzomwJGE/GaYvg9Rv73/driwwlXYPG7rLakFSXEJ1bpqN7KJDpB1WhdJ+Q3HnFwhnQmNwWSrKRyjhOX45N15sROdcLwasJdUcjsfLyXulNH6zg47dzLlYz8iX1wy5mXCx/zBiOkiFFxDcbFUyzNYxNESP6e2eSB164W4eIwQNv2CaK9K6Jfy/Yw8agx3T/hmd/uoiH9j7qQpN7w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(396003)(346002)(136003)(39850400004)(451199015)(2616005)(186003)(66574015)(44832011)(36756003)(5660300002)(38070700005)(8936002)(7416002)(6506007)(6512007)(41300700001)(26005)(31696002)(86362001)(316002)(54906003)(110136005)(66476007)(8676002)(66556008)(6486002)(71200400001)(66446008)(66946007)(4326008)(64756008)(91956017)(478600001)(76116006)(38100700002)(2906002)(31686004)(122000001)(15650500001)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?S1loYW9wQXNObVRubi93dml1MjlKN29JbEdWSytHL2Z2UnZrOXVrTWFzQ1BD?=
 =?utf-8?B?eWJIWjNKTmNZZGpQVkpZQWlMYW05QkljMWJyRkR3N1pGQWY4SExiSTJORkZC?=
 =?utf-8?B?RTJRbVgxQnBmbkRlaWpOVmQ5N01NWmFoaFc1OHY5aFZyamtQU0V2QnQ0REJO?=
 =?utf-8?B?MUo1VTFIZFI5U0RPcGtwQUdaOExHVWVOOThVZStKMVRTVUNwUGFjU0dJZzJU?=
 =?utf-8?B?QXBNd0FRVi9Cei8vZXlFSkVGTTQ5Vm1RNHM2ZXIyUmRrNjhtQjA3bjFuSXZ1?=
 =?utf-8?B?NEZqY3c5Y2RsSEZHamxyQWVuTUtRTFA5ZkhCclRTUmlsenYzVnNiMnkyQVI1?=
 =?utf-8?B?bUI2RUpQZFFBQnpxOGR6cDdLVnM3RzIxRDMvOC8wZ3lSQitKWTFvM3RWYXZa?=
 =?utf-8?B?eW03UTNOeGp3bldYa090ak9lUkwrUmJVV1hFZzJpZEF5NjNaUEYvc1FJT1R6?=
 =?utf-8?B?Z2tVNGIvMTJJZUdrRnhqTFlSWFplczhxakpOaCtuUnU5NVI3eE9odmpvY1hr?=
 =?utf-8?B?Y2ZEWHAxaXk1c2xJNVNQakprblRtdGVKb3FOa0thak5zcDRFcDlEbnBzYktu?=
 =?utf-8?B?cjJUUUdRUTNySWJLVVEwdy80am1QOGdyQVh0d3FIWURKQmJ6bWxtK2s3ajhz?=
 =?utf-8?B?Wk9HZXpwYXJCY2RULzF2WU4xbUNjUlZQVmVsTFFEcDhuNVBjZjZXRGtINUd6?=
 =?utf-8?B?aFQwTlFDK0VCbndNWmR0cUZpWUFUWVpXTUhXdm5aNXBza1pYM21VUzNPV1Qz?=
 =?utf-8?B?VHlGQnIrTFpGcWJIcjV4TFN2NnRVWWo0NzFGVnFFVjIvekRJb2U3TGlLbFRM?=
 =?utf-8?B?c3lzQ24xSkZZWnhLbmRqZHBwM2hsUXA1eXdtWEJaUnFwdGlpK3N5enpJR3Jy?=
 =?utf-8?B?Z3l5RGFSUTZxQ0IyaGtNVDN4aGxnR3BrQ2Rub2JaekkxaVhWZ3hnV3BFbXBG?=
 =?utf-8?B?Z0hPd2FidjJIRU00cTVkWGNTSVhlOU9CTlZZenFQKzNPUERuc1RJc3I2UDRF?=
 =?utf-8?B?RHpicUx5d0pnVmJrdFBRR2RRamJPUzdxb09mNzJoL0hwTWQ0b2NaZ011ODZ5?=
 =?utf-8?B?eGlZRFljRHg3ZnJFOEJqRGtzbkV5ZHBoRHc5US9qdUlpeE1vbGh2Y002NThm?=
 =?utf-8?B?YVJRY2UzZWRFeVptdHd1emkwbm9PcTFRU01XeUNiTWk0RWovWHFSekJqL3Ey?=
 =?utf-8?B?OXNvOXVid2tUUTBhQzd0UzJnVDRSVFJwMlR6clRiVkl2WnJJNzhYQnBaY1hX?=
 =?utf-8?B?d2tSNmJFenhoQmE5c3NGaVMyeENwMzZiVkJJbmd0OCtPWG5taGdqTWRFWWl6?=
 =?utf-8?B?Z2Q2bkFUMmFHYjk1Y1p5NjBjUHRVQ0NuT0hVbzJnN0Q0MDVqaHRkMzVacGJU?=
 =?utf-8?B?Tm51c0d1bk9yak1GQjczR25na21hVjZlRkNZM1Y5aUdDRWNpcDVzNlhoMkhm?=
 =?utf-8?B?TzdnWVQwZ0RVMWdPQS9RVEdOZFE5VXpuTU1leSsvOW9lQ0Z6ZzlMeC9nT1Y2?=
 =?utf-8?B?bGIyS0M2NHRrRG1tS1ZTZmNXM1lFa1R0b2lzZU04akJzUEEvcGhxRndRbW5G?=
 =?utf-8?B?bit2K1lEZy9saCtNNk9xTVFpcmVWVWhHWkpmUWs2RGhmZmdkOC9ib2hUWksr?=
 =?utf-8?B?dGpsUWh4bGJZTW1vVjlMQlB2T1MzN0ZacVpoeGdubkZhVGJrbkZTUUI5R0dX?=
 =?utf-8?B?MnI0VW94TXhEdjFTWlNsV05PVU10eGdRSXpOZlVyS2c0QW15OEZ4RnNvMVVY?=
 =?utf-8?B?RnpwVGNVRXB5bGxNdkFZZG9NMUlQdFgwT3NYeDN6T3lpMTFLWis4QmFMY1ht?=
 =?utf-8?B?T1hwR1BEYkV1Nzl6OTZORCsraDlkaDMvRml0b2IyWVpvTHpTZVM0UVo3SGxn?=
 =?utf-8?B?eERBNjFyMEd3R09CVVhPSkc5ZXhNSnp5Mk5Fdjg0Y1JqQjZ5SGY4U3JNY3JS?=
 =?utf-8?B?WmJ4SmRFSThYaVNXb1FFTUQ3VmcxOGhuMEdMaGVxWTdSVWZ4V0ozL29TaVF3?=
 =?utf-8?B?c1VwSzFVemt0QnJEYWRCc1ljcWlHWHl6Zmhxc21neThJZmZWbGlKU3BmZ3Mw?=
 =?utf-8?B?d2Nsek5Dak52YjlPOGpBTU4xWFhjeEtHVk1iQjdDeml1V0VXUSs5ZUR0RER6?=
 =?utf-8?Q?4X3j7MbcHNAHz0bBP7WMGVwXc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E0DDB26DF6C3884A82861D8B209CB340@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c9116359-99c4-4de8-4700-08dace16dc11
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 12:24:40.2600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LncGPwBvqOHCIHYh06K8bksVXxBgSh5Mc2Zhr3qV6TsSRFXjKnBpOm1DonZyRDnuj+VFp08HMOa+zjRMkGldPTp6eRLU6fiQ2DNmYp/nBk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2091
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
Cc: Hao Luo <haoluo@google.com>, Daniel Borkmann <daniel@iogearbox.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>, Jiri Olsa <jolsa@kernel.org>, KP Singh <kpsingh@kernel.org>, Yonghong Song <yhs@fb.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzExLzIwMjIgw6AgMTE6MTMsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+IGxkaW1tNjQgaXMgbm90IG9ubHkgdXNlZCBmb3Ig
bG9hZGluZyBmdW5jdGlvbiBhZGRyZXNzZXMsIGFuZA0KPiANCj4gVGhhdCdzIHByb2JhYmx5IHRy
dWUgdG9kYXksIGJ1dCBJIHdvcnJ5IHRoYXQgdGhhdCBjYW4gY2hhbmdlIHVwc3RyZWFtIA0KPiBh
bmQgd2UgbWF5IG5vdCBub3RpY2UgYXQgYWxsLg0KDQpOb3Qgc3VyZSB3aGF0IHlvdSBtZWFuLg0K
DQpUb2RheSBQT1dFUlBDIGNvbnNpZGVycyB0aGF0IGxkaW1tNjQgaXMgX2Fsd2F5c18gbG9hZGlu
ZyBhIGZ1bmN0aW9uIA0KYWRkcmVzcyB3aGVyZWFzIHVwc3RyZWFtIEJQRiBjb25zaWRlcnMgdGhh
dCBsZGltbTY0IGlzIGEgZnVuY3Rpb24gb25seSANCndoZW4gaXQgaXMgZmxhZ2dlZCBCUEZfUFNF
VURPX0ZVTkMuDQoNCkluIHdoYXQgZGlyZWN0aW9uIGNvdWxkIHRoYXQgY2hhbmdlIGluIHRoZSBm
dXR1cmUgPw0KDQpGb3IgbWUgaWYgdGhleSBjaGFuZ2UgdGhhdCBpdCBiZWNvbWVzIGFuIEFQSSBj
aGFuZ2UuDQoNCkNocmlzdG9waGUNCg0KDQo+IA0KPj4gdGhlIE5PUHMgYWRkZWQgZm9yIHBhZGRp
bmcgYXJlIGltcGFjdGluZyBwZXJmb3JtYW5jZSwgc28gYXZvaWQNCj4+IHRoZW0gd2hlbiBub3Qg
bmVjZXNzYXJ5Lg0KPj4NCj4+IE9uIFFFTVUgbWFjOTksIHdpdGggdGhlIHBhdGNoOg0KPj4NCj4+
IHRlc3RfYnBmOiAjODI5IEFMVTY0X01PVl9LOiBhbGwgaW1tZWRpYXRlIHZhbHVlIG1hZ25pdHVk
ZXMgaml0ZWQ6MSANCj4+IDE2NzQzNjgxMCBQQVNTDQo+PiB0ZXN0X2JwZjogIzgzMSBBTFU2NF9P
Ul9LOiBhbGwgaW1tZWRpYXRlIHZhbHVlIG1hZ25pdHVkZXMgaml0ZWQ6MSANCj4+IDE3MDcwMjk0
MCBQQVNTDQo+Pg0KPj4gV2l0aG91dCB0aGUgcGF0Y2g6DQo+Pg0KPj4gdGVzdF9icGY6ICM4Mjkg
QUxVNjRfTU9WX0s6IGFsbCBpbW1lZGlhdGUgdmFsdWUgbWFnbml0dWRlcyBqaXRlZDoxIA0KPj4g
MTczMDEyMzYwIFBBU1MNCj4+IHRlc3RfYnBmOiAjODMxIEFMVTY0X09SX0s6IGFsbCBpbW1lZGlh
dGUgdmFsdWUgbWFnbml0dWRlcyBqaXRlZDoxIA0KPj4gMTc2NDI0MDkwIFBBU1MNCj4+DQo+PiBU
aGF0J3MgYSAzLjUlIHBlcmZvcm1hbmNlIGltcHJvdmVtZW50Lg0KPiANCj4gQSBiZXR0ZXIgYXBw
cm9hY2ggd291bGQgYmUgdG8gZG8gYSBmdWxsIEpJVCBkdXJpbmcgdGhlIGV4dHJhIHBhc3MuIA0K
PiBUaGF0J3Mgd2hhdCBtb3N0IG90aGVyIGFyY2hpdGVjdHVyZXMgZG8gdG9kYXkuIEFuZCwgYXMg
bG9uZyBhcyB3ZSBjYW4gDQo+IGVuc3VyZSB0aGF0IHRoZSBKSVQnZWQgcHJvZ3JhbSBzaXplIGNh
biBuZXZlciBpbmNyZWFzZSBkdXJpbmcgdGhlIGV4dHJhIA0KPiBwYXNzLCB3ZSBzaG91bGQgYmUg
b2sgdG8gZG8gYSBzaW5nbGUgZXh0cmEgcGFzcy4NCj4gDQo+IA0KPiAtIE5hdmVlbg0K
