Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D724634472
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 20:19:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGvGH4n63z3cNj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 06:19:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=U9hVv2Rt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::612; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=U9hVv2Rt;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on0612.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGvFH6MXNz3cKY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 06:18:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYnbjpcaFPvz34UrUmM6H1dk6DN+vbXQRrXteJCmKP7zD/iQRt8PvDE94T70LZB+3nUwwdylt0JZHHdHv4UJ3UKpCDJAFvTBj5ukEyig/QLQbShcgTaolx30tJ7DKwf3sZWGmqYQ5T/4CxdPrV+zRsSI0pHS5YTlu5SyBDDNq+/y3jncp5sYcgU7XeaFIJbfvZALj4GaV3pvwqog51q2T72W/gqkk0f+ifQwdsh9zpWUPFSysFnQax9qwU5T0acpE7amyVuc8QKtGdu6yD1T2rQrFkXwEB8gEotnetHAOB+LFFLANPVOuBqTMHF/BQDt9jODnmptTv9zuUfswWIgLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdLiJmagklMimBEYFmd8K6JFaA1p+m3CbC2rSZx7fQk=;
 b=TIjofb3jLZu4rP/9ALDrqwfwdb+d+Cjne64mXlgDcVNZuoJGNxqIG/9xBHKRMLCgGrbvkQxRTfjomG5VARBwPJRfR1HxRqpBwafDDZT+OUnuEL80cEfAGV78mBc07glxiqNpbSeR6lMjj39I/v3fZeJZeIrme5PafNHoidM3MMuXYxbKsvy1IQZkftk+42HF7mLBD6jIX2hWUnZdu7q8OVOibq2hCeMgnLvJ0tdPisAKKIg51IrVx5lqfLoHBF3jZrWqrbYtP1IzW2dUfY360eW4kHI1J+zZ/9OKV3ewkLPV2mRKNi5QPtvwubwk80JgIlmCzdOpEjcXS9kmR5Pwiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdLiJmagklMimBEYFmd8K6JFaA1p+m3CbC2rSZx7fQk=;
 b=U9hVv2Rt25eKnT/ukfnBrqVwc3fmnJegLt5iKU7BbwjxQ/fcrzyteRij/54rdGHK5szJKkPoR47XQ9miSOaK9i18gYoYjeyXGMgzp5sf4Bzujng1nWBpRqiJ6VDqWlebIgfKjGgievesrgqAclrGtLU+G8nhsNDtIjsEwMBKR2euDZGcRdNTeraCCBqiNUnTObHEa9cGW/p/SpHRNXPEMEsJXme5C6Em5mDBE7GGVjnhHQAVX/gO0ncAklwTcXnAuZ3bmoJgOJWskKf+DqaHpSb5k2xuWsGCLiF87JUkcKn7HNJLzlJv7dnGZac1+0KhYoNNBHKD0Cpcd5xx5JsRTg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2067.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:11::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 19:18:37 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 19:18:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Arnaldo Carvalho de
 Melo <acme@kernel.org>
Subject: Re: [PATCH] perf test: Skip watchpoint tests if no watchpoints
 available
Thread-Topic: [PATCH] perf test: Skip watchpoint tests if no watchpoints
 available
Thread-Index: AQHY/ZQd/uAE3UdleUCVB4ePW795Ga5LU0oA
Date: Tue, 22 Nov 2022 19:18:36 +0000
Message-ID: <a9f0f8f1-96cd-f6a8-9dda-d4744b938f97@csgroup.eu>
References: <20221121102747.208289-1-naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <20221121102747.208289-1-naveen.n.rao@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2067:EE_
x-ms-office365-filtering-correlation-id: fb5f0f06-1ef4-47b0-cf20-08daccbe5b0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  IqZl4S/FE/mseoXYvnkq2GBj7CN9JiWPrhfxUA5eq1JFQyYXJmHRE1mlrhjP7ti2a5z73kcDloFWtuBafjC8/uHRdqmv32qCq+PXsJiCbYO/AD5oUubmny6yjOqHVsSu66VJBX6EqNQ7PB8gfuhlEOWHVfTzlxl44/Dyx1Qe5d6SvgnyfQ4U6GnhF7oxCbbu9F1cISKPmYPNaZg+O3z+0RLgFSlTBirG4yWwCPSFspY9l5ZNYy4XhZZdFf8/GkMrckAsegoyyXjA5Ya55Gv1Kc5U9PtrJ06Dmt7FPn6JDYFFi6iG8F6w40qIuXyrfFoRCvU+aTaOA4NCz0xz65AENSAaHzVZLy40euVDEeuVmDbubkjQrvyvPRpuMkCBWs7Q656cO/agmtlnhqNe08AXJYcPJmmsqeSNDaXqWpAigNgcchOhZJwMoVMrguqMMXj4hzRHdPSto17dUbzGbBXA9LWrN4QoLYSHi+XocWjIWmdxhUKkqjp9Ibtflw083hfnYrrqovnFTiVMlsfhCx9xm8rA/mvt8pGjSz0/Z6XKCaplNvCBrmUJx2kluzC2Ltp2m8f6rSeeDrXAOFr86ig2MFO/XDxpPEGOEPwWunSMPdUGJGFCM2I+NXjOGpywJ3flS8BeiPVH26H25GvJBx3lrskEbZjMvfk3cHz3J0NM73vmPwkdKTjNUk66RA1xrESMP87zlCHtZm1EqMyfO41WW1/ALyJKEJ17FRJyNzdp3lNJsZqta9B81XYgSHzE04wc
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(451199015)(31696002)(86362001)(38070700005)(5660300002)(31686004)(36756003)(71200400001)(2616005)(6506007)(66556008)(76116006)(66446008)(64756008)(91956017)(66476007)(66946007)(8676002)(6512007)(316002)(4326008)(110136005)(41300700001)(26005)(54906003)(8936002)(83380400001)(186003)(478600001)(44832011)(66574015)(6486002)(122000001)(2906002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NGt0d1k2TmRZdHNyc01wdld3ZTUwNDJFMUt2OVV6LytJMy9hNE41WGtiRGRK?=
 =?utf-8?B?Y2k0eEtuQlVqMlBkVkFocFF1ZHBzUytkV042b2lDd3ZMcmpVQ3FpVlVrb2R5?=
 =?utf-8?B?bXl4Y3A2WXFNblprY3NwUFFQZkh4REQ4UlpBRGtYTWlpajB6NDVWME9kTjZO?=
 =?utf-8?B?MmpXQnZYekNnN1J6VlZERklFTGc4YlhGOXhNVVRNUy9adnhCYkE3eTY4Y2pz?=
 =?utf-8?B?OVZ3VHBpU2JmK3B6b3JXZDFZanU5UXRJVjByUTN4UmJ3SjFOSFpWd1BYWERE?=
 =?utf-8?B?bVdOTjFNT2UyaFZVcVcwaitic2hLaFNuWUNCZU1RNnlMaWk2VStBMjN3eDBh?=
 =?utf-8?B?L09nMFR5cXMweWtlSVlxbnd6bFN5Z2c3QngyT2RmQ2s5cmdPZWJJOXZzNi9E?=
 =?utf-8?B?c0JGcTlIcmxKMjRaUldTdERFS3YwKzRXcWRqMmZZdkNPQUJpZEVaSEo0bDYw?=
 =?utf-8?B?amNTTzlRRjBiOXJJQzVtR2poYkQ2RGRNclg4MTkxcGRMUHc4WHppMXJnd05m?=
 =?utf-8?B?b3R4Umo4VG9aN3hEOS9jNHFlenIwY2hEWThBdm5pMG82b29DQmlkS2tISTYx?=
 =?utf-8?B?Q1hCTWtNWEtNQlNSTnBRVldrRS91amxKVitUWVNQQm4wVkFHNTFWNzRQM3gx?=
 =?utf-8?B?dlJMZzBkbk5YcElZOHVXWm9Pejdta1UzbDRocElqcFFDVXRuWUpVR0NBdEtS?=
 =?utf-8?B?Wnpjei83YVVTN3QxekFPTm93US9QMkJ4Q2xHVjZrTno4WGJNMjNHQTFxdUdE?=
 =?utf-8?B?VkZkVWVZRHRwZE1oaFdRcDhHU2prdDlxeWJrWG5BMFdlOU55Vkh1a01pVm9k?=
 =?utf-8?B?d0VHWVFKdTNYV2pZa21qUS9oS04rLy9VOE1JQklVeEIyMGt5VHBCWnlaTGhy?=
 =?utf-8?B?NGRUdnczYS83QTVOY0RaeDlsaTRPTitvNFZxeC9NMzcxdGx6OXA0ekNVcE5u?=
 =?utf-8?B?bWQrK1pMN3BhRjZWZHh6SEpVbFdFR01jOVhoejFvcFBwekt2RjZ6eExacWpQ?=
 =?utf-8?B?YUtmZzFDTjlsckNhSFc1Q1kvK0NpOFphdGxUbHBqZ3ZwU2tvUmpyWUxoRjB0?=
 =?utf-8?B?ZndnZS8zaGdNNjV5YnpxMklsRkVwVW8waGJuNmVWdXc4VTF6d1RsbkhYT1RM?=
 =?utf-8?B?ejUrci94bmRkMmJaV3JMYk0ya1dGc1JZUWFuZ1BTcG5MN0FiVTZzYlQ5MSsx?=
 =?utf-8?B?THA3WUZQeWJvUndrTDFCZzR6TGJNOTg0NkFoc2ZCVURHV3l5K0ZsSVcxMklX?=
 =?utf-8?B?WitlUWNvNG8vdjBjWnhhVndYU2pBakpESmUrWlpGZUpnSDhSczI5dHNSK0ln?=
 =?utf-8?B?NEVDODNUd0dkd2VyMTc5ZG1NMXFmWElNeXFtVVc3RWw1ZUlMZXViU1FLZFpt?=
 =?utf-8?B?MFBGNUhDaDF6NVo2Wi84SXp3dTczUmh3akRBNytOM0xaR1p4Y3RtbjROQnk0?=
 =?utf-8?B?WmkrRis1a1ZSdGR3N3lvYWRGak1TWm82RjgvNHhrRGpCYk9tQUp6bjBQa1dD?=
 =?utf-8?B?ajZYdGY4WnZ3UGwwM2hnZlp0MWpuU3B4RG9WK0U0SVdkYXdicWo2bytsT0NE?=
 =?utf-8?B?STZWVjkzVVBRRGdlMzl4c2pkZm41aXlWVXR0NjlGQ0plcSttMHBFUW16eStq?=
 =?utf-8?B?dFJheW84TEg2YXY5YkNZcjBNWXhWNkJmZlNpYzR1akZNK2VqZlh0elBjU0Yy?=
 =?utf-8?B?aVNLdENwR2w1RW5xeW54VUhFRHZrZ1NoaGRobVNrWTBueWhuMHF6NEE5aXBB?=
 =?utf-8?B?YXgyMEttS2lUVTNad0NsMDIwMFFJZjlZdDEyMExQNEhFa3lpbXU0K3UxOTla?=
 =?utf-8?B?V2t5dHhaNWpBOEF0L3BoaW9iY0pVQS9UaXkrWm1PU1JOQVcrWGJvczc0bElh?=
 =?utf-8?B?K2pvZlZaRjNpaHpreUJCMm85RjZXdVF0alc5dERSNGZqRVNYWnhYR3BJSXk0?=
 =?utf-8?B?YmZzRzZ1bnhmR0N3QkltT1JuRU94WXBPRkg4VUdtaXdHa1hPaHhyQ2x4WVFa?=
 =?utf-8?B?TXVyZ09MeFc1dlAveWJQbUhsQ2J6SUpMUHhoK1hFMzVSbFJYcXQ4SEU0dnlv?=
 =?utf-8?B?SlFEejZjR0RYWGoxb0tkUXhyZ1RCandwaitkWlJnZVdubVRpKy85eGJSL2lV?=
 =?utf-8?Q?fLNoR6ZOwBKqC4CVMZG41K153?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <95F1BB16BA7C764C8469CCA272A1E26D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5f0f06-1ef4-47b0-cf20-08daccbe5b0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2022 19:18:36.9296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iIh4PlMAcmsHF8LsMGM70b5yKXNVYK3XAxyvyPPjPp/ZwNpcDykJ4cCCTp5kpkCiovtsYPnzZtRQ2Y1DivoMsBKrgsKzdTngkwwEX2jGusw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2067
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
Cc: "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, Ravi Bangoria <ravi.bangoria@amd.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzExLzIwMjIgw6AgMTE6MjcsIE5hdmVlbiBOLiBSYW8gYSDDqWNyaXTCoDoNCj4g
T24gSUJNIFBvd2VyOSwgcGVyZiB3YXRjaHBvaW50IHRlc3RzIGZhaWwgc2luY2Ugbm8gaGFyZHdh
cmUgYnJlYWtwb2ludHMNCj4gYXJlIGF2YWlsYWJsZS4gRGV0ZWN0IHRoaXMgYnkgY2hlY2tpbmcg
dGhlIGVycm9yIHJldHVybmVkIGJ5DQo+IHBlcmZfZXZlbnRfb3BlbigpIGFuZCBza2lwIHRoZSB0
ZXN0cyBpbiB0aGF0IGNhc2UuDQo+IA0KPiBSZXBvcnRlZC1ieTogRGlzaGEgR29lbCA8ZGlzZ29l
bEBsaW51eC52bmV0LmlibS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IE5hdmVlbiBOLiBSYW8gPG5h
dmVlbi5uLnJhb0BsaW51eC52bmV0LmlibS5jb20+DQo+IC0tLQ0KPiAgIHRvb2xzL3BlcmYvdGVz
dHMvd3AuYyB8IDEyICsrKysrKystLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi90ZXN0
cy93cC5jIGIvdG9vbHMvcGVyZi90ZXN0cy93cC5jDQo+IGluZGV4IDU2NDU1ZGEzMDM0MWI0Li5j
Yzg3MTk2MDliMTllYSAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvcGVyZi90ZXN0cy93cC5jDQo+ICsr
KyBiL3Rvb2xzL3BlcmYvdGVzdHMvd3AuYw0KPiBAQCAtNTksOCArNTksMTAgQEAgc3RhdGljIGlu
dCBfX2V2ZW50KGludCB3cF90eXBlLCB2b2lkICp3cF9hZGRyLCB1bnNpZ25lZCBsb25nIHdwX2xl
bikNCj4gICAJZ2V0X19wZXJmX2V2ZW50X2F0dHIoJmF0dHIsIHdwX3R5cGUsIHdwX2FkZHIsIHdw
X2xlbik7DQo+ICAgCWZkID0gc3lzX3BlcmZfZXZlbnRfb3BlbigmYXR0ciwgMCwgLTEsIC0xLA0K
PiAgIAkJCQkgcGVyZl9ldmVudF9vcGVuX2Nsb2V4ZWNfZmxhZygpKTsNCj4gLQlpZiAoZmQgPCAw
KQ0KPiArCWlmIChmZCA8IDApIHsNCj4gKwkJZmQgPSAtZXJybm87DQo+ICAgCQlwcl9kZWJ1Zygi
ZmFpbGVkIG9wZW5pbmcgZXZlbnQgJXhcbiIsIGF0dHIuYnBfdHlwZSk7DQo+ICsJfQ0KDQpEbyB5
b3UgcmVhbGx5IG5lZWQgdGhhdCA/DQoNCkNhbid0IHlvdSBkaXJlY3RseSBjaGVjayBlcnJubyBp
biB0aGUgY2FsbGVyID8NCg0KPiAgIA0KPiAgIAlyZXR1cm4gZmQ7DQo+ICAgfQ0KPiBAQCAtNzcs
NyArNzksNyBAQCBzdGF0aWMgaW50IHRlc3RfX3dwX3JvKHN0cnVjdCB0ZXN0X3N1aXRlICp0ZXN0
IF9fbWF5YmVfdW51c2VkLA0KPiAgIA0KPiAgIAlmZCA9IF9fZXZlbnQoSFdfQlJFQUtQT0lOVF9S
LCAodm9pZCAqKSZkYXRhMSwgc2l6ZW9mKGRhdGExKSk7DQo+ICAgCWlmIChmZCA8IDApDQo+IC0J
CXJldHVybiAtMTsNCj4gKwkJcmV0dXJuIGZkID09IC1FTk9ERVYgPyBURVNUX1NLSVAgOiAtMTsN
Cj4gICANCj4gICAJdG1wID0gZGF0YTE7DQo+ICAgCVdQX1RFU1RfQVNTRVJUX1ZBTChmZCwgIlJP
IHdhdGNocG9pbnQiLCAxKTsNCj4gQEAgLTEwMSw3ICsxMDMsNyBAQCBzdGF0aWMgaW50IHRlc3Rf
X3dwX3dvKHN0cnVjdCB0ZXN0X3N1aXRlICp0ZXN0IF9fbWF5YmVfdW51c2VkLA0KPiAgIA0KPiAg
IAlmZCA9IF9fZXZlbnQoSFdfQlJFQUtQT0lOVF9XLCAodm9pZCAqKSZkYXRhMSwgc2l6ZW9mKGRh
dGExKSk7DQo+ICAgCWlmIChmZCA8IDApDQo+IC0JCXJldHVybiAtMTsNCj4gKwkJcmV0dXJuIGZk
ID09IC1FTk9ERVYgPyBURVNUX1NLSVAgOiAtMTsNCj4gICANCj4gICAJdG1wID0gZGF0YTE7DQo+
ICAgCVdQX1RFU1RfQVNTRVJUX1ZBTChmZCwgIldPIHdhdGNocG9pbnQiLCAwKTsNCj4gQEAgLTEy
Niw3ICsxMjgsNyBAQCBzdGF0aWMgaW50IHRlc3RfX3dwX3J3KHN0cnVjdCB0ZXN0X3N1aXRlICp0
ZXN0IF9fbWF5YmVfdW51c2VkLA0KPiAgIAlmZCA9IF9fZXZlbnQoSFdfQlJFQUtQT0lOVF9SIHwg
SFdfQlJFQUtQT0lOVF9XLCAodm9pZCAqKSZkYXRhMSwNCj4gICAJCSAgICAgc2l6ZW9mKGRhdGEx
KSk7DQo+ICAgCWlmIChmZCA8IDApDQo+IC0JCXJldHVybiAtMTsNCj4gKwkJcmV0dXJuIGZkID09
IC1FTk9ERVYgPyBURVNUX1NLSVAgOiAtMTsNCj4gICANCj4gICAJdG1wID0gZGF0YTE7DQo+ICAg
CVdQX1RFU1RfQVNTRVJUX1ZBTChmZCwgIlJXIHdhdGNocG9pbnQiLCAxKTsNCj4gQEAgLTE1MCw3
ICsxNTIsNyBAQCBzdGF0aWMgaW50IHRlc3RfX3dwX21vZGlmeShzdHJ1Y3QgdGVzdF9zdWl0ZSAq
dGVzdCBfX21heWJlX3VudXNlZCwgaW50IHN1YnRlc3QgXw0KPiAgIA0KPiAgIAlmZCA9IF9fZXZl
bnQoSFdfQlJFQUtQT0lOVF9XLCAodm9pZCAqKSZkYXRhMSwgc2l6ZW9mKGRhdGExKSk7DQo+ICAg
CWlmIChmZCA8IDApDQo+IC0JCXJldHVybiAtMTsNCj4gKwkJcmV0dXJuIGZkID09IC1FTk9ERVYg
PyBURVNUX1NLSVAgOiAtMTsNCj4gICANCj4gICAJZGF0YTEgPSB0bXA7DQo+ICAgCVdQX1RFU1Rf
QVNTRVJUX1ZBTChmZCwgIk1vZGlmeSB3YXRjaHBvaW50IiwgMSk7DQo+IA0KPiBiYXNlLWNvbW1p
dDogNjNhM2JmNWU4ZDllNzljZTQ1NmM4ZjczZDQzOTVhNWE1MWQ4NDFiMQ0K
