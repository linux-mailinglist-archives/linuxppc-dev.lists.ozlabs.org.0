Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA52F479BB7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Dec 2021 17:13:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JGW9P4Wclz3bmc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Dec 2021 03:13:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::606;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::606])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JGW8w1xkrz2ygC
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Dec 2021 03:12:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eoEY2ygIDg6ZfnZNgq5x8mzrIfzjldZOUr2LKU/zrgHSWdjLqAYt8htDgFiQ0zXK1FX9FpuWAYkpHN78EcEvBKEmOpl0qPiLQe+Ya2KLiGgnRQ26qePP2mOqOM8qb+KrscvUjvplF/S1d9IcDJk4F2t2+Tr0eKACK9doCrdz+/1jnN4kubLxvNli5HjfkCmD3Q3RUDn8i8CFtO5NpNvfeIIl4H/wEw+cBJPpGUVI2QsZbPxLct4RWwylBnPV61v0qr5DdyHRiS5uUexW/alTM7jQ57fj0qAcAtRnl3kZvnrvk/Nkh89goE0YdJpORuXJshSzssxceUPZoqn8JX/W2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WS98UrZ2QTlU2q2CA0E+f2vNNhzQxghO1XRjC+vS06s=;
 b=YgwffdDSqxhuWfpMGTZrNQ/RtrpTMeG+DOu7kog6NYUZr4DTSpncIkJxFBCxc2eQIBqBzOlSs5B55V3ELFxBpOEQCS9/kKXrKtPvaZ+HzlBQ335L4jqV6BbQGYbgFhsrbXMHJ7TIs001GcQ0eRnKBx/1matmkqDeWuo8EOi9Rq2H1QwCErb88Df6sWzOQh3HR5JD1DLhHHEJbYDXrs8qxk89+SbJXEH1NAX9oxSMrGOzoY5W/KWsKA4pM0Bhu4k2vhOf8S7A/ypO1MtbkVDUS7bP93GE/tsJ7jGjPtEwrvWk67N6Vw221fWS1Bfcgi4OhaV+p/s2kDNrnG+lJssolg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1750.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.17; Sat, 18 Dec 2021 16:12:25 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.017; Sat, 18 Dec 2021
 16:12:24 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v1 0/5] Implement livepatch on PPC32
Thread-Topic: [PATCH v1 0/5] Implement livepatch on PPC32
Thread-Index: AQHXy/a61L5ufkyTwk+E9T1IN+85JqvoaYCAgEhc+YCAACuvAIAABD6AgAAAzACAAATPgIAAEbEAgAALEoCAAANtgIAArk+AgAAX1gCAAGwBAIAGbdEA
Date: Sat, 18 Dec 2021 16:12:24 +0000
Message-ID: <d14826b6-adbf-8825-d097-8b0b1eac8574@csgroup.eu>
References: <cover.1635423081.git.christophe.leroy@csgroup.eu>
 <20211028093547.48c69dfe@gandalf.local.home>
 <6209682d-0caa-b779-8763-376a984d8ed8@csgroup.eu>
 <20211213121536.25e5488d@gandalf.local.home>
 <5511f43c-192a-622b-7c72-52e07f0032c2@csgroup.eu>
 <20211213123338.65eda5a0@gandalf.local.home>
 <fc3099b8-9f12-3e47-08a0-05abc37a0482@csgroup.eu>
 <20211213135410.12642d8f@gandalf.local.home>
 <8df90f94-9939-0178-b92b-6ae6ea81784c@csgroup.eu>
 <20211213144603.47d7c908@gandalf.local.home>
 <76ce2dd7-691e-df73-727c-110713c07cda@csgroup.eu>
 <aac75717-a3ac-c0b4-3e79-dc6eb9c26d8c@csgroup.eu>
 <20211214090148.264f4660@gandalf.local.home>
In-Reply-To: <20211214090148.264f4660@gandalf.local.home>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93b56b1a-4d2f-4733-a4ea-08d9c2412dfe
x-ms-traffictypediagnostic: MRZP264MB1750:EE_
x-microsoft-antispam-prvs: <MRZP264MB17507A7C55F831671D06AC59ED799@MRZP264MB1750.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6Xb+eaOrlGl1ZhC2jOPuiLv1FzujEeWUQb2RcMStPTKjZTQ4PeQNpudl69+ZyrxyCek61vHWru4GIUjS5O/mzHLekVqUz5kGEwPBMMmFxfz7kBiRbZkjZ2P6RVou7Y0VTZBublE/V3DVvL2ODySquNjih6qfC6MUOQUddz/Hd9JhNP1qvdRsXafHxl1/v902LJBRAGfWGkLp6YftJps3Ex5PJ9vYtBGwCYUHBQ9iIeuStpnakAHI1rlUSl3MIftukEPDtOD4pkHFeLv305TkPRE9ChxIpOdy6Ytow5TtSpu2Cjg17L5KjHy4YbszeEbUtrv/zpj3vCXCQ/L01oVdRW5clldDye5oZLENUI/6hoQG1o6kaJi14nDwWWKmuaxErjF+JkD5/VAk2Tnx3+/lL4IIL0W+2zhKelDueKCDz+ts/gz1um956TudsmIptq+RTzdLWqNJR2gZ7XbllzkmO6TMSO839vV00ftVrutuC+vSURBTJhHQmiy4zbQW4vxIN75w5OiSfJUEkJqHDgfgJDwaMI8lGfT/kx7sI0YK5p/mjeSJ4qlmlgRSiPaJ7FpKQXDgfM44tBMuCEfRSC5xNuUGKOFLmWlzBtqykjb74hnFoXh19NB9MyXvAcMwsdl+/PCltX23DP8s2oqtyUHezZNfMj9qHcV1GJvmoYkzZ5ptasNwqFaEz5Fb4HE1cukoSYdoMw6VL7Ddszqbc/ZT2RUku61y2fV1ubzB9CzcgwzFqe7y/Qp6WVTiaUIZrL5CvhsB1Eio/gLtIuDSxzI6KA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(316002)(4326008)(31696002)(6512007)(54906003)(91956017)(44832011)(86362001)(76116006)(31686004)(7416002)(71200400001)(8676002)(8936002)(66446008)(64756008)(66556008)(66476007)(38100700002)(6486002)(122000001)(6916009)(508600001)(26005)(6506007)(186003)(5660300002)(2616005)(83380400001)(38070700005)(2906002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2ZrM2JYQnoxaUtQUzVOUURGYjlaREszNkNzQlFFUEkyWnVzZjhmN3pWRTVm?=
 =?utf-8?B?Q0QyMjdlODJaaElES3hUc0RKQU5mTUorUXBVMXQycG9DL0VLZmczdG96Q1RC?=
 =?utf-8?B?YzM1VmF4MmpESFloQU9PeUx4ejJZV05xRkdTMjhBRHRMZUxHM1hGcFROa3FT?=
 =?utf-8?B?TDFwWW0xWE8yMzVNWlJYeDF4c0JnWXNEQ05pREpYamtFT1VzK1MvK21OcDc1?=
 =?utf-8?B?Z2JOVVBwSlBqbDR2T1FlU2VLdVJVK0pLOFBtWUI1eHo4a1Jla3BITy80WEZI?=
 =?utf-8?B?ODVGSGkrZmtwKzRQQjRjUXpyTGxOM3Era2pTZUxaTWRPcitOSTRtekFaTzZ2?=
 =?utf-8?B?ajU0d0VNY0xZaS9vRFRSeUptR3pEV2xQYlVsTGNoUVRVUnU3UFZja040dmU5?=
 =?utf-8?B?TGZkV0ZIZlN5OWZwS3o4WUxweTBqT2QrOXR2TUtISUtrUFFmMTNmWDl2dnVM?=
 =?utf-8?B?UHV1Mk9UVXdFQzFqMnFKUXZQQWZGTm9GWHF5UXp6b1lSZW5YS3hFUWEvNG5r?=
 =?utf-8?B?aW9OSDY1dmt4c1FjcExDTitwRzFMa0s3R0s5ZnFvbnFJMEQ1WUF2dUdLQkkx?=
 =?utf-8?B?d0V5YjVYYWpaMW12dXExb1pvaXBEQU1FcjY1QUpMTVJXME0zQUdSU2lXemww?=
 =?utf-8?B?M0FQWHU5TXJvV3JYaUlLMnRyY245Y3VKbE1ZMERGN3FKcUZsc3RFd1hXTUN2?=
 =?utf-8?B?Wndad3NhT0xpR01lbGViM3FyZU1HT200Z1NFM1dvTGl2NFlXNVUwemY5M0hW?=
 =?utf-8?B?MHd2dEQxakw2OGNVMHM0VEkzbHBTby9sdXIxQ293STZFSy9ydVRWZkF3NmV6?=
 =?utf-8?B?OWZLM2lFaUZjSmNFN3gzRnhNN3IxOWM0WFYzdXRFa1BPL2RKbTNPdGtsdERn?=
 =?utf-8?B?S2FXMnV2RURxdXAzckNQa3B1TndHNlRKVGF2WWVHNTIwaXIvRHFEK2kzWDkv?=
 =?utf-8?B?b0hFOUtJOXRsSEhGbm1aSjRnR1lMai9BalcyS3MwSmFQV21IZDZwbzVJVldJ?=
 =?utf-8?B?TzJqNk42eW1leXl3K1dZUFlCVDhUYUFSK2xjMjY4cCtNN2daTkNhbW1qK3BR?=
 =?utf-8?B?c2Q3c2R2YzNEanpieVkwUkcvbU4zNHFBdllSUE5FOEJiZW1zU3FUQXdETUlv?=
 =?utf-8?B?ZkVnblFzTjV0VHd2UlZiS3YvQmJBOFVXbFN5N21jcUo2QVJ3U0JrSkw3QkVG?=
 =?utf-8?B?RkZGUkhRSjRSU3JZbVVnVS9iQ2tqVkJSbmh6ZHFSMkJiSUhrdDRFeDl6RnRx?=
 =?utf-8?B?TGlGeGMzZVdkUklvNlF6dUpNNTZSVUZ1a1FLTHk5Z3VFcS9yZ3FaOG0ycUhD?=
 =?utf-8?B?T1Zpd0xaclVFdmlpYUVBSU4rV3pCbUhaKzFQT2FGbzRTWUtwWkpldXQ3a21j?=
 =?utf-8?B?cjJNNlplMkhGNXRDM21PbFBiRzJPWjVkYy9lbm9ZMXFudkRjaWZkSEIrOTll?=
 =?utf-8?B?dk42eEZKZzZiSGtCdmpYTFRydldTWWcwYUh5TWVpbjFER2xHTmFzNzV1Z2xv?=
 =?utf-8?B?d0NRQ04rUjJSSko3a0dBakY3TlErRDRLaUtuWkNlL1hsYkJDdzBVRVlldkFR?=
 =?utf-8?B?Y2tNaFNPcDZmRDRMR291Skl6WHVXUVl3L0JRWFlGNUp2djVSSGY3d24wd1U2?=
 =?utf-8?B?V2V3cGE3T1JSM2JvcW1vSlp6SmNkajJ1Y2c5QXlKWThlV2h3NHBBQUtYUS9V?=
 =?utf-8?B?dzJLTGttTnJiSFBPRVR3T0NyWXhKSlloRFUweEFqWk41RjF2VDdvbE9xOE1u?=
 =?utf-8?B?dS9oSE90N2xnOUd5cXpzS2Q0SFlQcHI4bkE3VDRJVXpSaUxQNkw1MzNlc2sy?=
 =?utf-8?B?Q1BlQWtJWmxWYk82eVV5d0k0TnRjREVaeVpiSE9LU0JyOHlTSExQSjVnSHlS?=
 =?utf-8?B?aWxhZUZXN2xJSFNrNGZaQ1FZbllrUHFySEIyQmk1Qm9uRUtMVFRYeERPQ25y?=
 =?utf-8?B?MUtJRFlRaEZMczRJTllUaVpUUWk4UTNvNTlnQml2aDRFRHBQMDJZU1hob0dl?=
 =?utf-8?B?ZFphWGpaVmhiS2c2MEUrN1Bab0ZsT2s1VHo4RExFRmQ1MEc3aFRmMlhwd3lk?=
 =?utf-8?B?L2lxeUxqWURMZEtEb1lHS2d2TkE3dzlsdTNCQ3NjWjd4MUxiWWZiOVd1R1Y5?=
 =?utf-8?B?R3hhcEZ0ZXhGcEMxVHRVWmtHMWdpWUN4S1pEcERCR05FUXFONkJWL3ByZnV2?=
 =?utf-8?B?VC9kZFpkUWI5Y0d4U0tHMEoxSnlYZW5NT1ZQbEZZbkxNbWtXYnlvTGNJbUFU?=
 =?utf-8?Q?2x8rrQRI4EyRGMXAgLOcghbz0DG4Jo88UawCdH2q+I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFE1DE220091514AADBF0C09C41558E2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b56b1a-4d2f-4733-a4ea-08d9c2412dfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2021 16:12:24.9180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ThK6kQpPtghxDOw8nol8aE1ESPAiz4Kr0xOnbr0myItOSTxEjY5pF1fyeEfZ+jFOF/vwajs22zpajIwP3ggfMJnoeMhyWhmZ+q7ykUdg7AY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1750
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Jiri Kosina <jikos@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Miroslav Benes <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzEyLzIwMjEgw6AgMTU6MDEsIFN0ZXZlbiBSb3N0ZWR0IGEgw6ljcml0wqA6DQo+
IE9uIFR1ZSwgMTQgRGVjIDIwMjEgMDg6MzU6MTQgKzAxMDANCj4gQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4gDQo+Pj4gV2lsbCBjb250aW51
ZSBpbnZlc3RpZ2F0aW5nLg0KPj4+ICAgIA0KPj4NCj4+IHRyYWNlX3NlbGZ0ZXN0X3N0YXJ0dXBf
ZnVuY3Rpb25fZ3JhcGgoKSBjYWxscyByZWdpc3Rlcl9mdHJhY2VfZGlyZWN0KCkNCj4+IHdoaWNo
IHJldHVybnMgLUVOT1NVUFAgYmVjYXVzZSBwb3dlcnBjIGRvZXNuJ3Qgc2VsZWN0DQo+PiBDT05G
SUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMuDQo+Pg0KPj4gU2hvdWxkIFRFU1Rf
RElSRUNUX1RSQU1QIGRlcGVuZCBvbiBDT05GSUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1Rf
Q0FMTFMgPw0KPiANCj4gWWVzLCB0aGF0IHNob3VsZCBiZToNCj4gDQo+ICNpZiBkZWZpbmVkKENP
TkZJR19EWU5BTUlDX0ZUUkFDRSkgJiYgXA0KPiAgICAgIGRlZmluZWQoQ09ORklHX0hBVkVfRFlO
QU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMpDQo+ICNkZWZpbmUgVEVTVF9ESVJFQ1RfVFJB
TVANCj4gbm9pbmxpbmUgX19ub2Nsb25lIHN0YXRpYyB2b2lkIHRyYWNlX2RpcmVjdF90cmFtcCh2
b2lkKSB7IH0NCj4gI2VuZGlmDQo+IA0KPiANCj4gQW5kIG1ha2UgaXQgdGVzdCBpdCB3aXRoIG9y
IHdpdGhvdXQgdGhlIGFyZ3MuDQo+IA0KDQpTaG91bGRuJ3QgaXQganVzdCBiZToNCg0KI2lmZGVm
IENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX0RJUkVDVF9DQUxMUw0KDQpCZWNhdXNlDQoNCnJl
Z2lzdGVyX2Z0cmFjZV9kaXJlY3QoKSBkZXBlbmRzIG9uIHRoYXQgc3ltYm9sLCBzbyBpZiB5b3Ug
aGF2ZSANCkNPTkZJR19EWU5BTUlDX0ZUUkFDRSAmJiBDT05GSUdfSEFWRV9EWU5BTUlDX0ZUUkFD
RV9XSVRIX0RJUkVDVF9DQUxMUyANCmJ1dCBub3QgRFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdTIHRo
ZW4gDQpDT05GSUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMgaXMgdW5zZXQgYW5k
IA0KcmVnaXN0ZXJfZnRyYWNlX2RpcmVjdCgpIHJldHVybnMgLUVOT1RTVVBQDQoNCkNocmlzdG9w
aGU=
