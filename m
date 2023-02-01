Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FE3686406
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 11:17:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6Hsb57cQz3f37
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 21:17:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ryCjKhqd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:fe0d::60e; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ryCjKhqd;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on060e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6HrZ2Nt1z3bP0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 21:16:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fhy2GMEmTABgoJ4C1dgEWo0D4BD369FzMty7h9GxThWmGd0LSf5cmZGWMqvd0t8BtzQty2bZ34pHZVz5jcUY7+XJ9btc1MQH72qChfluvHI2dNluz/C8+p7+qefklcmFL2ibPTzZLemcltorYiHHFRT/CjMD46wzGbhPYVClLrS9SWqQWEf7Kg6t2bZYCKkVuK/6PtnSBbu7k232T6azOYkfZBcI9ro9z9rlHWLXx9c9hm95bJDevCOEQ4wEB0nc+vK5diIKlx+DBPeUf///2ksxbegp4J2Em2VlMIgyUKstkCJKDik0KUqsGvtjzNI9ypum/mKFVQxFsaUcbgL1aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w982aML5GxHuET0c/uF/icCrO9WadS7kHblXnPH1DqI=;
 b=i2duxe65rOs5yPig5hY4G4tiHQpQziKnpG+7i8OEd4Xyz3jMDjPG180Upc6SZZzFeb9RfTwEitnMSGKf4VJoabisP2OpA/4/QA7JHOOmkt9AErzfzgLMqp+75gRWaHVT/2Tqejh9hbFKVfTSHb/2pXeXnxs7wvefbrBld9ZpJjgNvNzcmjKUDfguaaT9XkYtJ7m7MjYSWqXkOiF77wg+2ovsqm8rCGeITO88EB2wMnL55jVZb8eS5kVkzgB6edzR7C2lFCuDYzFzFdJQEDSJv/zNZDITRRtauwzWVawW5JfrpDcWK6p5/vOQcBgqMO+4XDaUaimOz/z9NEuh3nHR4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w982aML5GxHuET0c/uF/icCrO9WadS7kHblXnPH1DqI=;
 b=ryCjKhqdhmBgTl1yKUgjqqrFj9eKfTRmX5/XAUbtAh9PNEM1nWBqDE4E3fzSVOs4ksl2cymkUxhQr8JdYutYAmnIFSwy4bXCPBxcDr46xJD0xaXcutdQiIjobJTpa/LsZiV0DslsMBgRpFyUKYhG+MnRMdXeB+6dQPShYmajLyJqbktU+rSir46qOvoPldxCyatP/r0k76yUkNqk6UoYA2dw6kGNvVjcWVU596wwJSiWmv47na2fr/LeWBHwgflhV4NnZEY+hMEKhJmCKSLNMZzC6X5K/gVREkOU+uKXm31KLvYnC/oV5KSwE/p1r3o1+wcwXuIXPAkDr13go2BxJg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB3440.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 1 Feb
 2023 10:16:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%5]) with mapi id 15.20.6064.024; Wed, 1 Feb 2023
 10:16:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/tlb: Implement book3s/32/tlbflush.h
 local_flush_tlb_page_psize
Thread-Topic: [PATCH] powerpc/tlb: Implement book3s/32/tlbflush.h
 local_flush_tlb_page_psize
Thread-Index: AQHZNR/tYZTE+/A9A0SyFlqRUThyaa64EaIAgAECfICAAM4GAA==
Date: Wed, 1 Feb 2023 10:16:06 +0000
Message-ID: <f39527f6-23ff-2e25-ed44-26639332aaac@csgroup.eu>
References: <20230131025817.279417-1-bgray@linux.ibm.com>
 <2de01197-54b6-0e96-5615-3cd212cfec83@csgroup.eu>
 <1271da6e844106255546eb909f215ef816ad5c97.camel@linux.ibm.com>
In-Reply-To: <1271da6e844106255546eb909f215ef816ad5c97.camel@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAYP264MB3440:EE_
x-ms-office365-filtering-correlation-id: bb0ffe23-6877-4650-6762-08db043d54da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  dBVRgiHG0AlmyVbauv9Y+wJQgaiYMU0jSx+1pGE5Fi91PvQKOKmNSOa1GFkbUvHQDHgt3QcGiLRis6ndx9glhZkubnult00Hs9eqks+ikbjCwo3ubEPfJk4I4nwtdfq3/TlVbs+IU1iFVs+ErGeeeMmgp98gocqlj+wTEF1Hf8EJ9Gz+9jVWCOnTatBR7eXbAlQIM8mSaxH3qJqxOUfASD7vO7XfIfkeU8oWEwucH1SDCr1uL6vHYFzGQDPnIWW+0NlHxyoOvI0P3ILeIPsrY22/UCXJ4M7snvCT1xiLhso+rC7+EVpmao4HuN5StpYhfFYhlxXQ9ys2EvcIb6h++iQWVZWyFWzbG8PJ88A87FaYzjN/B1gYXodz5Q3b11Emciu+QIHV3gSCVXqNmDwdfzBGO7CaQV8VVy2qckvIX3AkrGxn7mCIMZdv/BHWQGh372XQ4/p1JR4ttafoFv2hGLmD8l6GM3hR068KbFB8ttUb03UTsdbSsxFZqAgcNazFBAVButsQ0yr1T0TAriW/qas6nTS5DIKRYUTiFx4O/GG07KN4q25cBABkBSI8augoLqinBRqA4xiGeKs1IUNMCccmsp8XBD+g+2teNQNZNpqwAOw9QnffAojr6nQQHSSyoz+barjzkFDo6VL5ZS/na15yxrbebE/ZB5G9rEdzoe5Piu7dg32/ncHyeVbMHENnzzI+TRHXw3bafN9UckW5/5YN4oTUgsvo+f+ISYBvEDtDLXVUPgPfoRV0x6I1PZeM/p65N9CVzZEROfM4gMbHI4GKx5kyumYqb+1cSfjtRbE=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39850400004)(136003)(376002)(396003)(346002)(451199018)(6512007)(122000001)(44832011)(36756003)(71200400001)(186003)(6486002)(41300700001)(38100700002)(478600001)(316002)(54906003)(66946007)(4326008)(66476007)(76116006)(66446008)(91956017)(38070700005)(8676002)(66556008)(86362001)(64756008)(26005)(8936002)(6506007)(110136005)(31696002)(5660300002)(83380400001)(31686004)(2616005)(2906002)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Mmx1eGh3UE4rRWZuQjFOMEpwS0QwMnIxZ1dSQStGbnovUGtPMlBFMG1jUncx?=
 =?utf-8?B?WHI2eUEwdkZUUWg0SDdwUUV4Y056T202T0hyUEFkZUZrOXJXMExPUENoTkF2?=
 =?utf-8?B?Y3BFTkE1TDFrR29CYndMTG1mNzZRVFFjMGtXN2RpSWQvMC9zenJpR0s5STJC?=
 =?utf-8?B?d1BucU50c3dSamRZblRHZ2JPOHBrWFI5SGdvUWZ1L2RzOXh6am5oK3N0cTdI?=
 =?utf-8?B?bmIrYmhueHZUREZMODNPUHpQalY5aGVnNnF4M0Qrcml2Y0pTU2M0R3RrZnhi?=
 =?utf-8?B?YlM2TXBadlEyK1BhMTE5eWVXNGs0NjZOTldmcTRsS1BpaUptck10VENTZjlQ?=
 =?utf-8?B?bWdEaGxEd0xKazNWQ0M5MTE3bEJQR1hkS0V0QnlNMVl2SnlJdFlUYnF1Uk00?=
 =?utf-8?B?dG1SMk9NbUN3Q2xtWEMrRjFzK1ZSaHE4VnRKMzBHYm5JdmJ6ZGs5enJlU3Nu?=
 =?utf-8?B?aHlzbzRUSlQzZWgrQjlEdm1QQ0FXNjhDYVhBMXFpOFNWRkMyNTVVNHliUjha?=
 =?utf-8?B?bFNrYllTSFF3dUVseTkxdGU2MjE4bFQvaG1hN3AzUnhmSHM5UkNNaTM4cUgz?=
 =?utf-8?B?OVZRZExjUjFvbnZDeU9TZ21xRHBFTTFXTVlpQ2FPcVRtOTFxZjhmcVUrSEZT?=
 =?utf-8?B?NTBFekpKRm9SbEpBdjN4VnVJRnFkY3FjNE5tYjhUYTZJTEIxWU1KUkJMbGRU?=
 =?utf-8?B?NmRFTEFIMEw2cVh2MVYrTmRLUmFCVVNOODk0OU5iU2dKSzhTVFBDeEk3Z29G?=
 =?utf-8?B?Wm9nKzZaNnEwSUMxcFlCRy9RNm5Rd2E2WTRxejNweThMcE55VjMyTzE4WG1G?=
 =?utf-8?B?Y3o4SGtZKzh2SGpzamJEQTczalU4YUxvSW5hc1l1ZExGbW1uYm0zcGZBcmxl?=
 =?utf-8?B?elJpbHlDNlBXSzBvS0lyRWxDRkQxZitZYnBLNlBhQmVMS2VtWTVuMHRpTEM0?=
 =?utf-8?B?VjgwcFJUWTNteG5nNUVCZDN6MkpCUDl3Qk8xU2YrL2JjM1c3bW10bkN0NnMv?=
 =?utf-8?B?QmViWTBRRm1EOHh0Z0RvVTRwblFnTzQ2UDIxRUV6UnBzTzNHQ3NTVXZxdDgw?=
 =?utf-8?B?SlFaU3owZHdwZ0tlZjZRdkNkMGJKbGZpZGxWMUxBam1IQjQvZjNMRko4YnhF?=
 =?utf-8?B?VnpzNzhETjY1NjUrNTBzOFpyb3I4bDBmbndsa1o2RzUxdzQ5c1JmMmQwWUVZ?=
 =?utf-8?B?U2k0dnFDTGo5Q01lVjVrQXc5WE0vVm5kanlVSVVjNUhFMzVhbnY0Rjg4L3FQ?=
 =?utf-8?B?RkFPRkwzTWdWMGFmTzV5dmR6UVdLRzdZeERUbXFHUW9ZejdqN3NEamlCMVNM?=
 =?utf-8?B?MFErV1F5L25HOGVlOTNMbTFMN0FPSGlKcG1kS0JmZi9xR2QyR05yaEk2amRC?=
 =?utf-8?B?dFZuY0t1YmlwSTZjTFo2aS9uSGUyZCtHbkRzMkpvUXhKSk5MM0I3WlUwbm85?=
 =?utf-8?B?MzJoWlZPWHZZS1I5QmNSUlZ3QTA2LzRsbXJ2TzdWMUVueHJPeEpVbDFUbFA0?=
 =?utf-8?B?SDNCeWdWMTJsaW9ORlNEdGxVaHFWYWNtSitvUGlQZ0FQVUJKRVpCQlRzanZR?=
 =?utf-8?B?R2FEUXZJNDhxdTRiemNhZTBTajYxK2ptMExKUmp2OFFDcjh3UTBvSUJZMFk3?=
 =?utf-8?B?Y00vU0hzR1M2dlhSU1VHZExrVkNZd2tlWkVkVzZ5OCs0YmREYUJ3Um1FVXJu?=
 =?utf-8?B?Ly9LZEtEUzVKZ2lOMC93VHlwQlUwbE9YMjhpN3QwKzJxa2RuS1hldzdEZXhq?=
 =?utf-8?B?WVUxVkJDRFJOdmpYaDRZMjcxemUxYVVWaThaREdaaktUVExjMGhjYVA5cDUw?=
 =?utf-8?B?S1B0bGo0a0ZpRU02dlpJWDlhUWlCQjh1Z0hNenIyNnRqeW8xVER0ZFpwZ2hm?=
 =?utf-8?B?Uy9IVS9RZzRFQ2pMV2d5TFlGajh4OXFtWVZZblNMSWg1NDlGQ0traTRZblpQ?=
 =?utf-8?B?RG00bExJWXdkVk1UeTgyUlkxSUU4cW03OXNPcGhzZkJaSmwvenZXOS85eG1B?=
 =?utf-8?B?NnFtTzVPZGd3Mlk0VHBzWmlBYm5GMEZ2Yk8vTmFFeVpLTjViVHpvSXJ5ZXpH?=
 =?utf-8?B?MEE2b3BCVk9hL2lmMDRnZWJ5ZmhmRHAydkRMQkp6YTZzcFJFcnAvNTk0dklW?=
 =?utf-8?B?Z1RDaGJmNGgvd3I4WXExNGFsY1VHa0crTXFjUThPK3k4SXlEQXRzazBoM2Jh?=
 =?utf-8?B?MUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C69BAC293FEF95439B9DBED18D73FF15@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0ffe23-6877-4650-6762-08db043d54da
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2023 10:16:06.6016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7UPDJ0Orovihy67H7FtbtnTFIpOxz4jNi26+4qR5Q+3KMf9lJIea32MVqKH11nveSQwbB6q32vqnQ5+YIV7owSkIhRSzLjQbbbghF1VK0CM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB3440
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
Cc: kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMxLzAxLzIwMjMgw6AgMjI6NTgsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
T24gVHVlLCAyMDIzLTAxLTMxIGF0IDA2OjMzICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPj4gSSBzdGlsbCB0aGluayBpdCBpcyBub3QgdGhlIGNvcnJlY3QgZml4LiBZb3UgYXJlIHB1
dHRpbmcgdGhlIHByb2JsZW0NCj4+IHVuZGVyIHRoZSBjYXJwZXQgaW5zdGVhZCBvZiBmaXhpbmcg
aXQuIFRoZXJlIGFyZSBtYW55IG90aGVyIHBsYWNlcw0KPj4gd2hlcmUNCj4+IHJhZGl4X2VuYWJs
ZWQoKSBvciBvdGhlciBtbXVfaGFzX2ZlYXR1cmUoKSBhcmUgdXNlZCB3aXRoIHRoZQ0KPj4gZXhw
ZWN0YXRpb24NCj4+IHRoYXQgb25lIGxlZyB3aWxsIGJlIGVsaW1pbmF0ZWQgYXQgYnVpbGQgdGlt
ZS4NCj4gDQo+IEFuZCBub25lIG9mIHRoZW0gYXJlIGFjdGl2ZWx5IGNhdXNpbmcgYnVpbGQgZmFp
bHVyZXMgQUZBSUsuIEkgYWdyZWUNCj4gdGhhdCB0aGVyZSBtYXkgYmUgYSBwcmUtZXhpc3Rpbmcg
b3B0aW1pc2F0aW9uIHByb2JsZW0sIGJ1dCBJJ20gbm90DQo+IHRyeWluZyB0byBhZGRyZXNzIGl0
IGluIHRoaXMgcGF0Y2guIEknbSBqdXN0IHRyeWluZyB0byBmaXggdGhlIGJ1aWxkIEkNCj4gYnJv
a2UuIEFzIHN1Y2ggSSBoYXZlbid0IG9wZW5lZCBhbiBpc3N1ZSB3aXRoIENsYW5nIHlldCBlaXRo
ZXIuDQo+IA0KPj4gQXMgd3JpdHRlbiBpbiBwcmV2aW91cyB0aHJlYWQsIGhhdmUgeW91IGNvbnNp
ZGVyZWQgcmV3b3JraW5nDQo+PiBtbXVfaGFzX2ZlYXR1cmUoKSB0byBtb3ZlIHRoZSBDT05GSUdf
SlVNUF9MQUJFTF9GRUFUVVJFX0NIRUNLX0RFQlVHDQo+PiBhZnRlciB0aGUgYmVsb3cgYmxvY2s6
DQo+Pg0KPj4gIMKgwqDCoMKgwqDCoMKgwqBpZiAoTU1VX0ZUUlNfQUxXQVlTICYgZmVhdHVyZSkN
Cj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiB0cnVlOw0KPj4NCj4+
ICDCoMKgwqDCoMKgwqDCoMKgaWYgKCEoTU1VX0ZUUlNfUE9TU0lCTEUgJiBmZWF0dXJlKSkNCj4+
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBmYWxzZTsNCj4+DQo+IA0K
PiBZZXMsIEkgZGlkLiBJIGFsc28gZGlzY3Vzc2VkIHdpdGggTWljaGFlbCBFbGxlcm1hbiB3aGF0
IGhlIHdvdWxkDQo+IHByZWZlciwgYW5kIGhlIGluZGljYXRlZCBoZSBzdGlsbCB3b3VsZCBzdGls
bCBsaWtlIHRvIGp1c3QgaW1wbGVtZW50DQo+IHRoZSBmdW5jdGlvbi4NCg0KSSdtIGZpbmUgd2l0
aCB0aGF0LiBCdXQgaWYgaXQgaXMgdGhlIGludGVudGlvbiwgZG9uJ3QgZm9jdXMgb24gdGhlIGJ1
ZyANCml0IGZpeGVzLCBidXQgbW9yZSBvbiB3aGF0IGl0IGltcGxlbWVudHMgYW5kIGhvdy4gVGhh
dCdzIHdoYXQgSSB3b3VsZCANCmxpa2UgdG8gcmVhZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIEl0
IGlzIG5pY2UgdG8gZXhwbGFpbiB0aGF0IHRoZXJlIGlzIA0KYSBwcm9ibGVtIHdpdGggQ0xBTkcg
YW5kIHdoYXQgdGhlIHByb2JsZW0gaXMsIGJ1dCBvbmx5IGFzIHNpZGUgYmVuZWZpdCANCm9mIHRo
ZSBjb21taXQuDQoNCkZvciBpbnN0YW5jZSwgZXhwbGFpbiB3aHkgeW91IGNhbiB1c2UgZmx1c2hf
cmFuZ2UoKSB0byBpbXBsZW1lbnQgaXQsIGFuZCANCndoeSB5b3UgdXNlIFBBR0VfU0laRSBhbmQg
bm90IHBzaXplLCBldGMgLi4uDQoNCkNocmlzdG9waGUNCg==
