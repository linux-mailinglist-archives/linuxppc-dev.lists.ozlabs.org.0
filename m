Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A05635A5BEB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:34:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGyGG3d9tz3dqC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 16:34:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=FS+z0JWJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.54; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=FS+z0JWJ;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90054.outbound.protection.outlook.com [40.107.9.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGyFW1bDFz30Qc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 16:34:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAeKYzyYZhvnXCB2nOSrgOQew3d7sXVjeyiIncs9yuhfOLEHJM0mhW6m/qB4oJ1pgzoDHsFFxnM8K03plNr0/9Xxyev3tNCPH5Md07M0DGzjBuOEzrYYl6ktNCoIn8gVDZTlYTTeWwQWcR1WtYS1HOZzns+SyL8rCkfsa0EgPZBI5H44ZDdEbPySH4MwLlbyhHBUWqFrWajiXTkfMzRx0T8neihjFqiHZnQzCLXmETNvzQ3JtF7gQVG2/enEIEh7LBtH2fQSIp3ziRcKzf8+UA35cpVFZCPbjfntptIWHbPE67uwwL6kDK/gF3Dt074tFXrEFP3hBS1QokrbS/foJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQUXhY7QTTAe/E9bo5Fz/rO7/2cW0ILnxP+tp8k77rA=;
 b=EV0yMt84EaGeWcnZx9b7HbawsVXE753t1YcEeT3KyNuTIxxuFwU/Nye1U6gUXUR3UUDA674GdESfM/00g4k5CtqjVTnIi4SzkwA4hKhG13of7anZnoT8KBuU5TZlXeZJidd/N1nl7czrVAW77D7c5VOdNvghVS9GBwiJ0+gzw0OECb2ZrvJBCXtcTqoM5UqedTdLg5f17wMe/rBwCz+LEFF0H++JCoOsZVJivcXqOoiF3X19ipiDB83gLLrjVvgtkd8lW5lK3hFZy9rJCCc9+vlAGxuRPNgFCMVoaIcEkFEvImAjKEG5sdK1qR7SrR7OZkfS9Xg/kS30WXSeMnY5Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQUXhY7QTTAe/E9bo5Fz/rO7/2cW0ILnxP+tp8k77rA=;
 b=FS+z0JWJgmp56J2HkX2e89i/70oFePUo7Jd3/I4OW1yTZd1CEG2vJuyoqxCPVC+IKXEVbupmzFm/xpvZPpm3fbEiyCGMXfCMZXmNSU7Hzthz2QJMnUJADSQ5lbKbWNSLs4P2ISLudUp9EDwwB/ftJuSmBBourHRyr2ZbPPVC720HW3kNEfdw000Fsi3mJvetM7LHDlLwNovyh/WKoQmiQwX+rKCLxTumntRmSt7ZN6KPhOpafJU27lITXgAUD4BETJuCC5SE+sdq8O00IqEDFOS+h8aRyRWxUNewODItpD1EFoL6bz8bISN9aNtt3plaI8/eiqKFsiqFcpzCgn8umg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3417.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:180::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 06:33:49 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 06:33:49 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 13/16] objtool: Use macros to define arch specific
 reloc types
Thread-Topic: [PATCH v2 13/16] objtool: Use macros to define arch specific
 reloc types
Thread-Index: AQHYu2u2eG2AyZ67OUiYZVGxcLJ1Nq3G/hOA
Date: Tue, 30 Aug 2022 06:33:49 +0000
Message-ID: <82ba7d85-5873-5da4-1125-0c3a9bbd927f@csgroup.eu>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-14-sv@linux.ibm.com>
In-Reply-To: <20220829055223.24767-14-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b24b0186-961d-47ed-9c12-08da8a51990b
x-ms-traffictypediagnostic: PR1P264MB3417:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6DduNhfKm0HRYHNgTF3Gtzw5b9V6m8//1B5Pfsxt5wkXdLgCfM4WyfbFI1aB5AZL+ziqMGFcfrsOlTN3IxM1m+rDAj631uvMpDjkZyhTurt0K5MlwK2pHUEdoU+iuEYgYansIGAAgoHasM7+p/nIxGxmIwAK2oPWpL+GBQbsfO6sr1z/vzBIssMNQIwxCbs9B/cscHpXwVGhamNNFsF+O/e/2dm14RNgSd9267TGWTEK4CfeLoXh1EBsI9w/2C07bgn9DIzQ40Te2hdoDNXfff0FmnLsnd745Owho6I1nfHYgXtRo7dalOKsgdLHjkBulb/AuXB1y/wvSc0xsCMYVDhGYFesH1jcsfi+pn9qkzZUYOWZ/yBGK3oZgCbAwV6ppZwMtCkMmLBwC9LDe60f45txWG/0UynnW0hyI1TOa8OaOd8gDRZKzRHQPbh72SqkI0gPz56Srd9kiVibVuS049uu36Ps2RWdxIN0aWFKqC0chQGZjpxc5lU4F0FNfdWVSzjor2avJR7JSPCc56Rr3+1ujx22j9knvlGyAdM2ZJDlHgpsekKG7rXGyrw2x8GOyRBRKl7XhovDWgljbtEm2bs5TjCYXTSlon0Ciq41ZIhrUSeRiOCXd0OMgasvT3UeLBBcInPApW/SAVBOpVjamc/iBJmzqzZWyKJZVaqrGOLeVR6wJsCojVFKSGSreZfvXVb7a3oK9YGoQulOiKccRiQKMu4ek8hbG4eB9txIcK3OctONwq+HtMFCBxd7U2L1FPeWMB+MmaVnaKSys/5CbVqO/l7hRwdTLCOkATynP7qxuWDD9C1w0X/K+VJ8ZaYelDlhKhHhcJSyMI1g+3IfAA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39850400004)(366004)(346002)(396003)(376002)(6486002)(316002)(110136005)(66446008)(66556008)(66946007)(66476007)(31696002)(4326008)(8676002)(64756008)(31686004)(76116006)(41300700001)(86362001)(36756003)(5660300002)(8936002)(54906003)(478600001)(71200400001)(7416002)(38070700005)(122000001)(26005)(2616005)(6506007)(6512007)(2906002)(44832011)(38100700002)(83380400001)(66574015)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MUFkL0svamNvV1p4bW92RVUreExDZTIwU1dNeDhHNTgrcDFiaWlsbkErdlhQ?=
 =?utf-8?B?ZUl3Wnlxcmh2NUQ3WDJqazJmZGNrODB2eFhHTGFRL1hEM2FRUmVGYWtUWkR6?=
 =?utf-8?B?UEhuZUw4dFZvMVRqbDNjaEhIZkJlb256cFFJZ1pXcWN3dU9SRVNyc0RtdStm?=
 =?utf-8?B?SUlPcktqTU1mZkdkUFkyUFZXNTN4UVp0VGVNQ3FhVjNlOThwQS9BUEY0R2Mr?=
 =?utf-8?B?M2M1Rmh1MTlJQ0FLdENKcVVyemc5b29xK0NaS05HcHNialh2THd0M2ZteHVX?=
 =?utf-8?B?bGxjUUVPeUxaekVwcnlReW16Y2NnWGJBeUNqWnZHb3ZwMTU1OW5FKzZkWFZL?=
 =?utf-8?B?MlptVGJZRU1Fa1FjeE9HQjlObWJ4dEZES1Z6WnhXTk4vMHhkNU9laEd2cENm?=
 =?utf-8?B?MFRDWDJqUXBLZnIyODFsTjg1Tlh4dEFPZlZzNUpLZlRDd3pwZFdoWmkvWnhG?=
 =?utf-8?B?STFzdTNnSmlmK256cEhTdElTcWEreUtMQVJaZ2YvRXFpTnJMM1BibVh5dzJY?=
 =?utf-8?B?TnluQnpoRW41bWhtb1FCVExYWmp3TStLSmFWdDk0N0d0ZHZsVUFwLzgrOG5r?=
 =?utf-8?B?WjI5NFl0YzM4NmViSUw1dzFUaHBWbUs1Um5SdVludnJlZ29wbXRrLzc5UzdD?=
 =?utf-8?B?aUhQS0lZWUlsSm0ycWZtbWt6Wm1aZUZSSXdCL3dHc3pRZ1NlY0d1R1kvYVVI?=
 =?utf-8?B?WFF2bDVMOGRjQ0hBdkIvUTNraUdvaCtLZVZTdE4xVnl2YmlPL1IyamtnVXln?=
 =?utf-8?B?V1NQMmhJSmtTc2RrazdJVzZPZXMyU0VlcUJtbFlpaktLOGdxeWZNVkUvWlFY?=
 =?utf-8?B?emR3ZFlPbnFKUnBkVUoveGpKZjBiaEVNd2poN1h2Z2ZzR2dnbks4cXNvRXY2?=
 =?utf-8?B?SUI5MWlISTFUL1hCMlZ3elV2ZXQvY0JQaHlsT0hqVHVPQ3dxaDhpbW0vL3pu?=
 =?utf-8?B?MU10cnp2c05nVkVVRU5HaXRLQTM1UGJxSWJPa3IwZUdYTzJQRnFrLzFCZ1Ja?=
 =?utf-8?B?WTZKMXlYV2hLcm1sZnB5ejUwU2FLZ1o5TkxleWZ4U09BL3d6MVRTQ3Q1ellF?=
 =?utf-8?B?ZFJBWWFaRWNNTU5iZlRGc2d0ZzkrR2h4QjVRVmkyQWlMclU3YTNHcjlkNTFW?=
 =?utf-8?B?dWdyTHh4UjNySXBWSG1ldnU5cTJTcFVuSzZrbGszeURJN0s0NzZVck9WQndy?=
 =?utf-8?B?THJxeVU3S29kR3ozdDJTVzlIeFBmdXBuZmRpR09lSkowZkpTalVmbTVHWVYx?=
 =?utf-8?B?MkVicXBZYzJUU3d5dWptdkVwbGQ2bFBxc0VaeWhoS2FrMCszT3djYzAybFlQ?=
 =?utf-8?B?aW1nT2JKakVURG1HT1lNTmp2QWw3VE1SR3dMRVk5UTJJVkdFbTlmTzNEQTgr?=
 =?utf-8?B?SjhmYmphdW9YODVjbWJSbFc2c3N4RlJPaFkySE9FNWpNL2RQWklEclhGMXJQ?=
 =?utf-8?B?VUd4NDFuLzFTaEVra3NBdGY1N0o5dERNbEY0eEZKM1BnQldUQVgxbTJuMEpy?=
 =?utf-8?B?cWk4R2QrM1NoR1dmcWFrRDJGZ29LNE9HWlhxMFhzeFk3UEQzaUhqUUJGMG05?=
 =?utf-8?B?Qjl0cUppRVlsL3NzNW5UV1NCakNJd1NJbURDbm9rQ2xYSzN4MnEvRE9VTCs5?=
 =?utf-8?B?cjl6UVNONFNzYUJOc05WbkM5NTFlRnhLUWJUWGltclgzZDNJUmQ1eUovUEdu?=
 =?utf-8?B?VkQ5bDRvL0k2dzdQQUJsSjVkWGF2Q0p4bFlIRTVyK1FVNlZVTlZyOWxMdmZJ?=
 =?utf-8?B?R0lHMzhYcjdHL05tNzhHWHNOamdnaTZMUWx3UU5EWER4NDk1UmdpTEd5TFpQ?=
 =?utf-8?B?aDhaVzdiT2tDaGE3ajBHOUZZbXgyTkR2eTFtdjVJNDY3QVZBQnZGSDZDS3dh?=
 =?utf-8?B?WVNkZFltZXk1dEoxaE1SRTNYSjVZc0kxODBOVUVsQ0lSWk9HeGVYNEZmbjlH?=
 =?utf-8?B?T0VoWDc1T2lmczlKbHBzMUV4VG9PNDNnZDFranNOWEVVQXU5OU1CeHVIQTBx?=
 =?utf-8?B?ZWZtTE9nUW44eWF2S0llQVd0SVMydVZiMkF4Z3hBS096TW5DdC9HR25UeWVv?=
 =?utf-8?B?NDFqeXNRUWRBdHBkRHZyVDY5R2pCRVFpNENvajhoc0hEZGdFa1ZXMXEweUdq?=
 =?utf-8?B?Nk5UTU5CNmFPcXU5OG5KRFBvU05DTDQyVldYayt2eU11R1M1VlpaMVFUOGUv?=
 =?utf-8?B?SlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF0F79F96687854F96C16A50142E6563@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b24b0186-961d-47ed-9c12-08da8a51990b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 06:33:49.0536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dB7EZnEO3RDjE14OtK/yOLsqXPi0BvDx2LI2/3iGGl3/6EZ/DL96jwl6CP/Zq8CiViBAODhHwuudRC8DmBrLmRov2ML5ebQdhsGCo6LawEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3417
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzA4LzIwMjIgw6AgMDc6NTIsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBNYWtlIHJlbG9jYXRpb24gdHlwZXMgYXJjaGl0ZWN0dXJlIHNwZWNpZmljLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogU2F0aHZpa2EgVmFzaXJlZGR5IDxzdkBsaW51eC5pYm0uY29tPg0KDQpS
ZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1
Pg0KDQo+IC0tLQ0KPiAgIHRvb2xzL29ianRvb2wvYXJjaC94ODYvaW5jbHVkZS9hcmNoL2VsZi5o
IHwgMiArKw0KPiAgIHRvb2xzL29ianRvb2wvY2hlY2suYyAgICAgICAgICAgICAgICAgICAgIHwg
MiArLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2JqdG9vbC9hcmNoL3g4Ni9pbmNsdWRlL2FyY2gv
ZWxmLmggYi90b29scy9vYmp0b29sL2FyY2gveDg2L2luY2x1ZGUvYXJjaC9lbGYuaA0KPiBpbmRl
eCA2OWNjNDI2NGIyOGEuLmFjMTQ5ODdjZjY4NyAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvb2JqdG9v
bC9hcmNoL3g4Ni9pbmNsdWRlL2FyY2gvZWxmLmgNCj4gKysrIGIvdG9vbHMvb2JqdG9vbC9hcmNo
L3g4Ni9pbmNsdWRlL2FyY2gvZWxmLmgNCj4gQEAgLTIsNSArMiw3IEBADQo+ICAgI2RlZmluZSBf
T0JKVE9PTF9BUkNIX0VMRg0KPiAgIA0KPiAgICNkZWZpbmUgUl9OT05FIFJfWDg2XzY0X05PTkUN
Cj4gKyNkZWZpbmUgUl9BQlM2NCBSX1g4Nl82NF82NA0KPiArI2RlZmluZSBSX0FCUzMyIFJfWDg2
XzY0XzMyDQo+ICAgDQo+ICAgI2VuZGlmIC8qIF9PQkpUT09MX0FSQ0hfRUxGICovDQo+IGRpZmYg
LS1naXQgYS90b29scy9vYmp0b29sL2NoZWNrLmMgYi90b29scy9vYmp0b29sL2NoZWNrLmMNCj4g
aW5kZXggNTI5OGExNDNjZWFjLi5mMWQwNTU0Njc5MjYgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL29i
anRvb2wvY2hlY2suYw0KPiArKysgYi90b29scy9vYmp0b29sL2NoZWNrLmMNCj4gQEAgLTg4Myw3
ICs4ODMsNyBAQCBzdGF0aWMgaW50IGNyZWF0ZV9tY291bnRfbG9jX3NlY3Rpb25zKHN0cnVjdCBv
Ymp0b29sX2ZpbGUgKmZpbGUpDQo+ICAgCQltZW1zZXQobG9jLCAwLCBhZGRyc2l6ZSk7DQo+ICAg
DQo+ICAgCQlpZiAoZWxmX2FkZF9yZWxvY190b19pbnNuKGZpbGUtPmVsZiwgc2VjLCBpZHgsDQo+
IC0JCQkJCSAgUl9YODZfNjRfNjQsDQo+ICsJCQkJCSAgYWRkcnNpemUgPT0gc2l6ZW9mKHU2NCkg
PyBSX0FCUzY0IDogUl9BQlMzMiwNCj4gICAJCQkJCSAgaW5zbi0+c2VjLCBpbnNuLT5vZmZzZXQp
KQ0KPiAgIAkJCXJldHVybiAtMTsNCj4gICA=
