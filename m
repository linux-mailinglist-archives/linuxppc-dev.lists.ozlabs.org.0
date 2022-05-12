Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9993D5250B1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 16:53:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzZXZ3N7pz3cHZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 00:53:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62c;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzZX21w5kz3bYJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 May 2022 00:53:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huWUlNoe/5GLeRM78PqjKHmqr4r5jMLrCWMxIMJ03ZqqJb6qtxu9P2Oq+MdS/g1cGUf1dNampffT11II+lyFLv+0y2Dzd4Vvenr52XtWPcAkY8ffsim1QeU2I60sl4/CFlWJH6aNQUxZ6SuMg2gxo+jjIjVFiyWAZ/J2WybjbkpICHBP98XCNxApKaDY7R0XlhZWAlFhZdSkH2e1/mjrlQvO4A1TrMZPBGU0vTV1SBmKddT5J/ZVy+7XIZyOvbKb/Y5Ic5L6oPklMdCPfiItCNOCg6hcQuHAf7ctOvmD2kX/Y+E437FdojpT9y8HurqeJLnYl1ypNl4WLy1XaioRjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cI/I+pIEj9Z5D85O2tWCj2klYCfaTcunEVa/uh/UKuw=;
 b=T7aWoRzGR/SFyhp/6mOWumfDYUnZiqN1RPIkq3ZG4KNDqILO4B/o/uYTkoYeNo7anpaIRMWEFsJItsSUlAvMPJmNwwAb+CVeHqk9yzPPAAqKURgW61pEen9HNhEFBXJFAubD7sTbfiMFVyynDfnziuuPDP6imB3lVjU9j9PwnLX1TylOe+Vja9J8VkorcXh+blKtslUmQXuc0I1sPx/6rUj2ZwVosGWsASff94GstGp5cDtc7Ez9Q1P9KhPtCcGvd8uBZgY4vPMaD9NYHjCUxmM5JYR5QfJ4OZ2mWeLMLpW8UouTQKVPKv/9Rc0xzPO9LTQQRpa/wSnY4vXMFxzjTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB3320.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Thu, 12 May
 2022 14:52:40 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d%6]) with mapi id 15.20.5250.013; Thu, 12 May 2022
 14:52:40 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Thread-Topic: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Thread-Index: AQHYOsOkMhd+XrYXYE6fzWpV8XELvKzS/yUAgAJH8wCARmM5AA==
Date: Thu, 12 May 2022 14:52:40 +0000
Message-ID: <b8fac6e2-c117-86cf-2901-5ae0852ca403@csgroup.eu>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-4-sv@linux.ibm.com>
 <YjR6kHq4c/rjCTpr@hirez.programming.kicks-ass.net>
 <0b55f122-4760-c1ba-840a-0911cefec2ad@csgroup.eu>
 <20220328195920.dqlfra3lcardko6r@treble>
In-Reply-To: <20220328195920.dqlfra3lcardko6r@treble>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35f04daf-d8c4-4590-fb8d-08da3427100c
x-ms-traffictypediagnostic: PAYP264MB3320:EE_
x-microsoft-antispam-prvs: <PAYP264MB33203A1412632FB55439BBD0EDCB9@PAYP264MB3320.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aIWPbxf7WWqu9eOcCx6o/E1oyE+dNggzEnWeh4yeW1Jh6I/5vcjMG/vc3bHaYiNRE5rzD2eZKEZEI5wq9YmfqpyoHmruuhfeBw+CIvqlHqBB6aY6XO1o2o79+ryAiIMFnOkSaL2BGEV9b2Dg9/12dudo8WYNcS6bhvrKxcRlKMrah4qG54OQYi0j+pEFeJ1Qfis21KnfMdy/ij4TrehdZrVJOuYpQQdh6thHg6WsfW0CIm5MEIbqjwPtfKmQ9GP6fEabPZfTBjjtza4r2tFaSRhNeAjXq/Yqs+G+QjDVuMHkglc+k7O+IhWpJB3cffzU8ARgBuvXBOMmrVv5O1mZmj8H6H9lH7gJ+78dtPqVC6FsfSyJpS8tHQq6p3lkTMteOcA8qmowZO5d1Dv2a7/0nnMsmpv3SZn7fPhHtu+nwz2Ow5wo+2K23Jm0hp32ooMFQ35ghysh2/Z36sYCCmsE3jbW49VOmQbZ735dYiOfNU78CrCfVBgDoEDkRtLJUvJGN8SACcgR4jOcdjmyQUAKCPLmM/CIfveGKNs04ScM0z+EYpNwvKnWGRr8vwTt7aNj9gvpTsGLSDfqEDe84qmKt6AhMozKBL4hkfLFBwTKfVrWxnw79RXyhL/krK6e472FyEFJ8oY+x7puoW5C4t4t5gwaemdBVHjpGk1khVaJRrWc7Ed3f9EvglPoeMmbsiwb+MPKJLB9e7B+s6zeWjuU2mzahO63UA53p93w6ZmrDchPeWBe273OEyHzuA41j3/+212oKjFXLi7ok5qcGdTtag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(76116006)(66946007)(2906002)(66476007)(91956017)(66556008)(6512007)(86362001)(31686004)(6486002)(36756003)(71200400001)(508600001)(31696002)(66446008)(4744005)(316002)(64756008)(44832011)(4326008)(8676002)(38070700005)(6506007)(122000001)(83380400001)(38100700002)(8936002)(26005)(5660300002)(6916009)(54906003)(186003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFZ4U214Vk01aS9WQlRKSm1KT212Qlphak4xZG52OXlVd09MajQwQ0Jobmcw?=
 =?utf-8?B?UCs3MXE1RzJKUVZaNWFWYVJ2TWJ2bmwrZFV6V0xhbHhjMzV3cXZuM0taRW1l?=
 =?utf-8?B?MmtLY3VQamZDR2ZOTWdhMG9DK3dEanVwL2tpSzJMVzNIRlVqV1FZNG0wQ3J3?=
 =?utf-8?B?SFM1TUxMWVIyWHhlc05tRUYzYVIwSUpqdjAxbnJzYkowRnVyajMyUDY3VFFK?=
 =?utf-8?B?aCt0ZmxpRWZFL2lSVmNUS21OTzMybGRIaVVvMTMxUjVlQkNqVFRqVEtoUGVU?=
 =?utf-8?B?MTlDUXB6NjhaZ3RPemsxM3V4TXpES282L21kSFRqYWxNTlhwYmFvb0dLUXdu?=
 =?utf-8?B?MTNxNDdQbGMyR1Y4anlVQVEraVltaTdzM2N4cTI0N0dpdlFmcG82L2REZGJT?=
 =?utf-8?B?Nzl6NTlDZG93WUxkZFRtekJSNUV1TFdQcHFQbjBGQVRSajlQNHZFRjllYXRj?=
 =?utf-8?B?clZxU1kvYWhsTjhFZ0d5TEJLbDE1WmNvVjJkYlgvbEJ6MVN6VnBiL25LMDkw?=
 =?utf-8?B?bTBFL3VKTGlHRloxdTQ0SjYvemliRHdtYUVaMmRYMS9sZ3NmelFLWkJoaENa?=
 =?utf-8?B?QjVOaFNhVmtoY3B3dWdiYk1xektJRDcvWGJKMXgwOUdDK0RSenREdnUwUUhB?=
 =?utf-8?B?S0EyTXFLS2R1ZVd2b3NVMFpWc0lpWFBqSDZFTlR5MnNVNHRINVc3VWh0b0hC?=
 =?utf-8?B?UkpGTjZmSmNLcVBocXRvbSttZGVmdkRnU3VWbU9TSXdtekpIeUNsZW5IT2lW?=
 =?utf-8?B?VGI5Y3ZHM1hVc0hOUHplUFgxREw4ZUhZOVM3K0ZJQkdsdWtFMC9hYzBBbjhl?=
 =?utf-8?B?WG5pcmVLQ2RXZEJYN2o1cmI1b1h4MmloekV1a21RQ1padjZtTFRxdlNtdHo2?=
 =?utf-8?B?a3d3emF3c0lnbmwxazhlZkxPdU5McTlUa0gybC82b1hrWWhpZ2lGVTE2SzlK?=
 =?utf-8?B?RE9sKzBtd1FwS1FTNUNGRUNPNnkzd3BjbVdYTXpqSCs3ZFQybXBNMDNSUDBs?=
 =?utf-8?B?ZUNCdXYrdHZESEQ1d0VvZFI0c0ExZ2hzQnNMc1RQaHpjMG5Sd242T0lsZkJZ?=
 =?utf-8?B?ZVhEMVdxcjlUeS9RQXFlVDBXU0ZLN08zSkFUanprTkJ0S1RJNzV4S1FEYU1H?=
 =?utf-8?B?N1Y0VUhFV1dmMlhpV1BxdjNoMkFVaHVLRGkzbGJkV0ZHcWRMbGxHejVxUlJ3?=
 =?utf-8?B?L2ZLbUk4eWt6VXNCazFxbkJnYTEwcUpLYVM0TGdhVHJTdmVKdUp6NnpSVk84?=
 =?utf-8?B?eElta09FMk1PY3FRN3BUN0pqMVZLUnhHVWxoZ2dMU0JGS3oyeVZ5ZlRBeVdQ?=
 =?utf-8?B?NGdMNENLWUdEeDU5clExN0QwV0ZSanNIcFNWL2d0YW5pSWxWOVhTZWhlcFdE?=
 =?utf-8?B?aWI1NE50cVVNVkNSVHJSWkNEd2VVS2VnRkhEQURBejY2RDE4YS9qaVo2b0RK?=
 =?utf-8?B?bllyODdHQm9zQVlxMDRicDNManpWWUtldkxPQnZvZnN3V28xQVJXODlPUit3?=
 =?utf-8?B?TUxvWW9IWmhEd3VidzNrNGdiRU5WQ1B1dFhhbGE2MGhZVjAyT0FWT3dsMm52?=
 =?utf-8?B?NXBFYmIzT3B5NWxlSzlaNEw1RTNTU0grMnV2ZzR6MDZXV1V4NFRDS2h4UGpj?=
 =?utf-8?B?ZWUyVWV5eXBPbzVBT0hMWGtUTkZJWmVmOEdhTlNqeU52NGpsSEtRNmZWbTJH?=
 =?utf-8?B?b1YxQ1BuRjJ1cUpmTmtURnRKQnVNTFhzYlhVd1ZIR3V5emEzS25sL0pjbWNo?=
 =?utf-8?B?dXlQVU9YYzI2UGg0SllyNUJHUFcxNU5JNHZPQm8zZmwrOFViczlqTDVjSy9D?=
 =?utf-8?B?U2IvSThSYUVULzVTSW1tdHBabVpRYkI0SHZCVG1zUWNkSm04MFN1UDlQdUk0?=
 =?utf-8?B?N3hlaVpaSFdnNlJvUzhSbXNkSWE2MVVwUTBQZTdlcHZrM2pYWE9nbVA3OWNY?=
 =?utf-8?B?ZjYzZjhEVGVyRkhYU0g2TzhETkdDeUpCMytwM1VpbzY5bmZ1OEdtdFhHZ0ZF?=
 =?utf-8?B?NTYwOGJxSURXOWRPdHB5QVZrUnRJdXFqcldZKzNPZElXbEd1MCttSFVYak1h?=
 =?utf-8?B?eHM0TTRqN0crNEtIWXpJZm96cVc3TWdQODJES0hTWTNOdDZMS1NFMlZzSmFZ?=
 =?utf-8?B?S2hRdjM5MUhETXhBTUM0M2xVSWxkaVpMRFRLcXpjbUxYSkl5bGdPNUMxaFJm?=
 =?utf-8?B?OUlYdDkxVW1NbkI3ZWhtMGlJclR2WXZFbEk4a1VJVUxLRnhJTFdTdkJGeWlL?=
 =?utf-8?B?ZDBrM3VWSW5oMG0vZWU2Nm4rZTd2TFQ3VHFBWTVsQ1UvUkw4d1NhcjdnWVR0?=
 =?utf-8?B?cFMwZ3JGa3NIUmFMTTEvVVZ5Zy9kb1pNN05GbytUV3BkcnlWeUZqZW9idDUr?=
 =?utf-8?Q?ehWNmKNIGbzdtGN6FHwbcnkhYcQWIRTiT5dT5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D492214A4CFCBD44AC1977FC5BCE98DB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f04daf-d8c4-4590-fb8d-08da3427100c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2022 14:52:40.3845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: omZZtUJ26UjuH4rOFSiO3kPbw6bpAAHrul4caO6Mcg38WRI+CWH4tmPRRJrPkD0a5yFo0BcdjN5cctIm3I5cibM9aBPXzoLtrh34+OGFcCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB3320
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 Sathvika Vasireddy <sv@linux.ibm.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgSm9zaCwNCg0KTGUgMjgvMDMvMjAyMiDDoCAyMTo1OSwgSm9zaCBQb2ltYm9ldWYgYSDDqWNy
aXTCoDoNCj4gT24gU3VuLCBNYXIgMjcsIDIwMjIgYXQgMDk6MDk6MjBBTSArMDAwMCwgQ2hyaXN0
b3BoZSBMZXJveSB3cm90ZToNCj4+IFdoYXQgYXJlIGN1cnJlbnQgd29ya3MgaW4gcHJvZ3Jlc3Mg
b24gb2JqdG9vbCA/IFNob3VsZCBJIHdhaXQgSm9zaCdzDQo+PiBjaGFuZ2VzIGJlZm9yZSBzdGFy
dGluZyBsb29raW5nIGF0IGFsbCB0aGlzID8gU2hvdWxkIEkgd2FpdCBmb3IgYW55dGhpbmcNCj4+
IGVsc2UgPw0KPiANCj4gSSdtIG5vdCBtYWtpbmcgYW55IG1ham9yIGNoYW5nZXMgdG8gdGhlIGNv
ZGUsIGp1c3Qgc2h1ZmZsaW5nIHRoaW5ncw0KPiBhcm91bmQgdG8gbWFrZSB0aGUgaW50ZXJmYWNl
IG1vcmUgbW9kdWxhci4gIEkgaG9wZSB0byBoYXZlIHNvbWV0aGluZw0KPiBzb29uICh0aGlzIHdl
ZWspLiAgUGV0ZXIgcmVjZW50bHkgYWRkZWQgYSBiaWcgZmVhdHVyZSAoSW50ZWwgSUJUKSB3aGlj
aA0KPiBpcyBhbHJlYWR5IGluIC1uZXh0Lg0KPiANCg0KV2VyZSB5b3UgYWJsZSB0byBzZW5kIG91
dCBzb21ldGhpbmcgPw0KDQpUaGFua3MNCkNocmlzdG9waGU=
