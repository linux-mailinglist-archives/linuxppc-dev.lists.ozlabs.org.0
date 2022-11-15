Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4583C62AF93
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 00:39:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBjMW1G63z3cNY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 10:39:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256 header.s=selector2 header.b=biDuyZGE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=vmware.com (client-ip=2a01:111:f403:c002::1; helo=na01-obe.outbound.protection.outlook.com; envelope-from=namit@vmware.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256 header.s=selector2 header.b=biDuyZGE;
	dkim-atps=neutral
Received: from na01-obe.outbound.protection.outlook.com (mail-westus2azlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c002::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBjLW4JTbz3blr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 10:38:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q2RU2o5oU1kpyrQK6ziDu/DHY1vQuLUXJS8Izp5DUViPz1CIJqKNkqcWtwAR1XyMMRFjBEVLEFXqdkdEqiFk8YCyWOi4JsWhde+iACzeWZ5mtdCeTGyiUcNumI596cu24r9pZPu3oAbZ/izXfhWbmppxJRCnL6VaSl6/uR+euq8Q+AWZNNE8cK3deOv0TaKz1YmDusAnWhgah1VMdXqufgqtMNrCkWhtsYrarLmDT7Z9Yfs3mpDg60MUTLagsx4nJbK3N5NFFkAPerIFWAxJZPGt6lz5v04zr8h4CGs47KFaYvX1Jr9gIX4q7cbAYllx4c4ctT3/5Chb8LGfP7uepA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/h24+KAlJUir032lcuocK6slfOPynm839hYVKJMOmU=;
 b=f6R4hGrLwWl8rKa2xWGjbOkcPYg5ksitOjN6nq9Z7erl+AJn53wuBiX64oapt7luQBeHRlZHoMNg7buLiuspA2ziKdmjTkNyTUOe6X69E5PiAyVYzKpTHFMm9Y3WnAzcjX6+VvcRMR7NdHaPy0EgpojGDK7fRMoIucMIha18d1bAgWvEgqcEqvx1gjlP41y4qOFdRApahTpDH3pGC5gJjKl0EBrDTBUnFey7KPh8CyuB9QMOBnguAGrG6++6Ek5UFVi9DnsZMSGvvcxr/jugjlH/o4lIEX0cVKZ57LX6kUZfrgH2gWffEylQFvSlkHH72CZP/g4Cd+1s8piDhTp8Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/h24+KAlJUir032lcuocK6slfOPynm839hYVKJMOmU=;
 b=biDuyZGEn72ATWZGpJAo8XtjwhYc2Sj6tQhrXF2IL+Gf3/PdACpBNdkqiLaEJyUO2KaIjIcHE27CQsj34DEQMlpiQ+tMTCDGJrfBhNbUqSiUVnsePY/0/HzP098F4KtB4JWWHKsZjYeCFCtB5z99A2zK4YweuwgNi/OZ90sDZSs=
Received: from BY3PR05MB8531.namprd05.prod.outlook.com (2603:10b6:a03:3ce::6)
 by SN6PR05MB4254.namprd05.prod.outlook.com (2603:10b6:805:35::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Tue, 15 Nov
 2022 23:38:33 +0000
Received: from BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::f57e:85ed:97ea:b642]) by BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::f57e:85ed:97ea:b642%7]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 23:38:32 +0000
From: Nadav Amit <namit@vmware.com>
To: Yicong Yang <yangyicong@huawei.com>
Subject: Re: [PATCH v6 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
Thread-Topic: [PATCH v6 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
Thread-Index: AQHY+KCRQOqO5HL84U+KIvlNnJJGba5ApXuA
Date: Tue, 15 Nov 2022 23:38:32 +0000
Message-ID: <0D3A45FE-5367-40CD-A035-37F6EE98B25E@vmware.com>
References: <20221115031425.44640-1-yangyicong@huawei.com>
 <20221115031425.44640-3-yangyicong@huawei.com>
In-Reply-To: <20221115031425.44640-3-yangyicong@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR05MB8531:EE_|SN6PR05MB4254:EE_
x-ms-office365-filtering-correlation-id: d8a34ad8-a90b-4178-50a1-08dac76281fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  PQt7JzsVK+PuDMbZJ+FLPJZCPqmuEttug5yHCzQ2wWlby2ywOxn3y9E6ph/6GsbKZ6uC6Eh/keAJ2tU0utEWMkNOta8H6JKjoMv0xWMt1eg3Q/JS9VB4yyVRIKtNWUQxs2WO+DDH6lv+LwKaNOymGyCKJMW2C3B2CkBv+5GATgqjVOFufXTkdLTtY5iVxSZI5m6ttJzIRhjWRVa6oolvCI+3uO2yOTSN5AA4owLCTnDpezxL7p2sPvr5er4Cf6MGqwYf3e0Q8B7scuo5/2vWzaGJiTv9ySXUspTA/mu5F4U5TquDmQbVNpAvNlyo3SLrMzURnLz7h3VOu4ezelJNko1OG7sOQwN2TX+J6GfyjJe4HorRKkzNXtslPitn4Fxzr9VEZmvYPgGp20mgiBhdp+IFfxddkUlukg2SFI6H/fW6z+rt+rkEqtiezaqRmejx7zq2hBacpr69ANQPIOjLop9t7/bbUt5UUuUcCvuJ3MVSLDG/DsN96zG3itIGfj9A3QLa0D6lm+/m3snWfmvsfPm8O7semIwAEV125QuVmxFWe3JiwGhPWjEYbqg8ni/6dsaKRZh5bwl9HZHBsDfa8kMeD3QCwHzkrVN2EMYbzoNROzVEiv2c2/HMtpSNlCUkQ5q5lrwpzz7e2OqzrUPGI1w5RdhxUsVTBjRBb+wVvPRoPwTH+jMNAjg/aMVVRpjoxiEJ/Rmz8rTGzMqpM+AsKZQ3sjN+RoTV++nbm1lnGtunV2cIMBpS+Pr1oDYLA/Q7UkSnq30G+OBEcUL8TgGopkNyA3pwr6FCigP7KnsnZ1o=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR05MB8531.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199015)(8676002)(76116006)(7406005)(8936002)(66446008)(36756003)(4744005)(478600001)(7416002)(53546011)(5660300002)(33656002)(66946007)(4326008)(64756008)(41300700001)(86362001)(66476007)(83380400001)(6506007)(66556008)(71200400001)(6512007)(2616005)(186003)(38100700002)(316002)(38070700005)(122000001)(54906003)(6486002)(6916009)(26005)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NUZpSXBXYnkrRHozZnZpdWJPL2xtcjJ5RlJqeUxOMjYxMzdiUnJtNEorSUlP?=
 =?utf-8?B?UVpiTTZzOG5KYkJ3aXJtdnEyOXB4ZzJsSUhtSi8vNmgxVjQ2MzFhZFRWN1RS?=
 =?utf-8?B?MEZkTFF1dU5ZNUJKaXNMeE9USWc5TTBRWUtMN2IzMDUrSklxTDdNa2MvRGhW?=
 =?utf-8?B?MTJnVDVCZmFiZmQ3SkJ3Z3g5US9TRUx3ak1TSGRvUTllY2dnOXgzVWVkZTJn?=
 =?utf-8?B?SXNJb0lmWldkYWFxZEpBTERjTHFIMjQzYU5ZdkwzT3hKN0RzYmg2Y1d1UWFh?=
 =?utf-8?B?QXRVTVIyQkxuU2o4dlNuMXB1dHkxQWczbUJzOUtvNWJaNHhzZU9qRk5rM0Vs?=
 =?utf-8?B?ZWVETEpGRFo2dzBKU3gyUFNWaHllZnFITG44YVBIeGtra0V1OUJmMm9NQlIx?=
 =?utf-8?B?d2xDVndoSG1ac2NyWkxveCtSSVIwMVhuaGlhSUdKRk91T1lRMnU3dnJnNVdN?=
 =?utf-8?B?dVFycjJuSHBZeDNmVlp5VmRwY3Y0ejdxaXhobHgrR2YxQmlnb0V0bHBPc1h3?=
 =?utf-8?B?Vkcva3dMNVM2Yzh1Tyt4UGpmNHd1dEhRcVhTdUJnT1B1SDJjNlpDcS85SHF4?=
 =?utf-8?B?bU5hSUFQbzd5TThOQUVYVlZTdllVN3BlQkJWblZ0OEUrbHFkRUc5QitkanZs?=
 =?utf-8?B?aWxuSEs4dGNLaHhOMkpoVTloRkx2TDNiclJlaDlsYnRWQ1VwbHBRNkFiamhZ?=
 =?utf-8?B?aHBzSzhpWUx1cVhhRDgvWXNmZ0VkOCtMUDg0WEFLb0Rad2JXZzdxVlRYajV1?=
 =?utf-8?B?ZGMxR3RMMU9FVm5salRHQWlIUHFnYWpqdlU1TitjOTBPUkJ0UlRBajk0RUpm?=
 =?utf-8?B?S2RGSG4wYnVFUUNmYkdqT0s2YktqcCtPQzNZQ1hJclN5a0dORUN6RUVPWjQv?=
 =?utf-8?B?ZDV5aFFLK3pqdy8vcXBHYkszSWkvNXdkeFRYMlFzS1U2NER1aThRa3h2UzJI?=
 =?utf-8?B?dlBzQXRJaXRDUEp3SE1wOGRhblBvaE56bEwyQ3kvczhqanBpT2ZVYTI0WDZr?=
 =?utf-8?B?QW1qeGJRbVFiNllTbit0am9kTFlrQWxYR3ZLblp4eXVEQmxtV2JSdWpER2g3?=
 =?utf-8?B?TlRYWkJ5a0pvRjY2WDF6TlJhTjNQTndRRFRhQkYvSlBtYnZyNWJ1NC9uMWxv?=
 =?utf-8?B?c1paWnhQd2FHaVdaSWFyUndEMmNJd2FHUm5pY0k5MlRCQnMxQlQrSjliS1hq?=
 =?utf-8?B?NDJCc0wySEJXb1Buc3M2bTBPM0N4b0I1ZTZNWGdJNTNVOXFKTk5NMVIrWlFk?=
 =?utf-8?B?S2tQZnNVZFAvUWQ3VzVNb0l6UG8xUU1UTS96d3RJVVJRdG9LbTl4Wk00eGtQ?=
 =?utf-8?B?NkZKellFVVFRYU1YNTN0WDgvRm9EOWp2STRVSkI2SHk5NlQ3MXhaN3FJMGhU?=
 =?utf-8?B?QlV3cnJUMUk0OGpzcDJuNElqYVc4L01SUkRMb0JHdFNpOFBWSVRQTkJ5QkpM?=
 =?utf-8?B?b2FFeWgxNzgxdTU2akVVMXpFTGVOVUVocUJHeGgzV1pIZ0NaRFc1c3VpcWRk?=
 =?utf-8?B?aXh6ZWE5bzVYTWI2UytyeHY4aUdTVlhmVitTUXhSUDZLa05ybmZKSEd1SkNn?=
 =?utf-8?B?Q09ISDRPOGR3alpFajgyZWxTUTRHN09mYUtGZzlXZE9zZnVmQ1BoU2NpM3RZ?=
 =?utf-8?B?TEQzZzVYUTJWdEN2SWpNOEJML0FreXM5RFNZdWF3OGhOdmdad0ZOcVd1dFg1?=
 =?utf-8?B?K1VtMDNrcWQ1d242ellPRkJPUGwwSUt3eHE0SHFxM1Q4UHluWGFQVVUvOTds?=
 =?utf-8?B?TUJNRTc1dXZDSkd3UHFNYmdRNEVPZ0hTTloyOWdraXdBak9nNVp5MTRCb3c3?=
 =?utf-8?B?bFVTWHdqbnE5cFBFOTAvVG9WSTN5TGRvczNINThuNEsyMS9aNkZuRUg1eWJ3?=
 =?utf-8?B?Ym1vY01xRldGOUpQMURzVko3WjJTd1N5RUNQY3NxT0FYR3BQaWR2R3FnUThG?=
 =?utf-8?B?ZkZoaDQ0OWY5Y3p5ZVhla3ZJMlk1T0ZnY05JcDFFTmhwU05KQVJBZHRqaDg0?=
 =?utf-8?B?YWxkdTNCZkd3UGVaSHF5a0J6NFBhalpkcDZkclVFd04zZFhvd3dKTDFwL25h?=
 =?utf-8?B?V2tIWTVOQll5TG9kOW9LOGJKaC9XRFhnNVVwc3ZMS1ZRUXoxVFpOVnNiQWJT?=
 =?utf-8?Q?MLpTTCAPEKgttprb1oH+hKoW9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <203C57998426924AAEC0E150DE930AEC@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR05MB8531.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a34ad8-a90b-4178-50a1-08dac76281fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2022 23:38:32.7396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rJ7QpwADEaLNDg4yHAU+xKUu07Kt4fxv2+Wsw/hflnIjmVDym5dydFY7Rrjb6BPrmdfeZjVwT8qPTzv4hoyxNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR05MB4254
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
Cc: "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>, "prime.zeng@hisilicon.com" <prime.zeng@hisilicon.com>, "realmz6@gmail.com" <realmz6@gmail.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, kernel list <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, "punit.agrawal@bytedance.com" <punit.agrawal@bytedance.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, "zhangshiming@oppo.com" <zhangshiming@oppo.com>, "lipeifeng@oppo.com" <lipeifeng@oppo.com>, Jonathan Corbet <corbet@lwn.net>, X86 ML <x86@kernel.org>, Barry Song <21cnbao@gmail.com>, Mel Gorman <mgorman@suse.de>, Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Barry Song <v-songbaohua@oppo.com>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, "darren@os.amperecomputing.com"
  <darren@os.amperecomputing.com>, "yangyicong@hisilicon.com" <yangyicong@hisilicon.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "guojian@oppo.com" <guojian@oppo.com>, haoxin <xhao@linux.alibaba.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "huzhanyuan@oppo.com" <huzhanyuan@oppo.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gTm92IDE0LCAyMDIyLCBhdCA3OjE0IFBNLCBZaWNvbmcgWWFuZyA8eWFuZ3lpY29uZ0BodWF3
ZWkuY29tPiB3cm90ZToNCg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdGxi
Zmx1c2guaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgNCj4gaW5kZXggOGE0OTdk
OTAyYzE2Li41YmQ3OGFlNTVjZDQgMTAwNjQ0DQo+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNt
L3RsYmZsdXNoLmgNCj4gKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vdGxiZmx1c2guaA0KPiBA
QCAtMjY0LDcgKzI2NCw4IEBAIHN0YXRpYyBpbmxpbmUgdTY0IGluY19tbV90bGJfZ2VuKHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tKQ0KPiB9DQo+IA0KPiBzdGF0aWMgaW5saW5lIHZvaWQgYXJjaF90bGJi
YXRjaF9hZGRfbW0oc3RydWN0IGFyY2hfdGxiZmx1c2hfdW5tYXBfYmF0Y2ggKmJhdGNoLA0KPiAt
CQkJCQlzdHJ1Y3QgbW1fc3RydWN0ICptbSkNCj4gKwkJCQkJc3RydWN0IG1tX3N0cnVjdCAqbW0s
DQo+ICsJCQkJCXVuc2lnbmVkIGxvbmcgdWFkZHIpDQoNCkxvZ2ljLXdpc2UgaXQgbG9va3MgZmlu
ZS4gSSBub3RpY2UgdGhlIOKAnHY2IiwgYW5kIGl0IHNob3VsZCBub3QgYmUgYmxvY2tpbmcsDQpi
dXQgSSB3b3VsZCBub3RlIHRoYXQgdGhlIG5hbWUgImFyY2hfdGxiYmF0Y2hfYWRkX21tKCnigJ0g
ZG9lcyBub3QgbWFrZSBtdWNoDQpzZW5zZSBvbmNlIHRoZSBmdW5jdGlvbiBhbHNvIHRha2VzIGFu
IGFkZHJlc3MuDQoNCkl0IGNvdWxk4oCZdmUgYmVlbiBzb21ldGhpbmcgbGlrZSBhcmNoX3NldF90
bGJfdWJjX2ZsdXNoX3BlbmRpbmcoKSBidXQgdGhhdOKAmXMNCnRvbyBsb25nLiBJ4oCZbSBub3Qg
dmVyeSBnb29kIHdpdGggbmFtaW5nLCBidXQgdGhlIGN1cnJlbnQgbmFtZSBpcyBub3QgZ3JlYXQu
DQoNCg0K
