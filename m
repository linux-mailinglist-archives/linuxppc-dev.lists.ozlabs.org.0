Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A49A56D08B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Jul 2022 19:39:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LgvQx6v94z3c1m
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 03:39:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Y4oP1GpL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.83; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Y4oP1GpL;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90083.outbound.protection.outlook.com [40.107.9.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LgvQ62klgz2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 03:38:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QB6K4htvjm3YzNRiM4NxKbV8QVnv57OfSYN0gSBo+y4tmEq2mWJISJKVMtTpTzuM+MC6Mj9UHU0IZy6gGST1gAmyT5+QPQ3dqEIEfvAT5AeUn5xX2Mkj6a5CqkBf0ht+SAWgSzjaAdb3hearq8LGS8FumYGTQQMgzXungxwzEdwo3y8P71bJA0KQ0CEP+sCLn1t0KaGlRec2x0/a0hGHFFkQLfNXo6FzRhI3ETewhMMiBLv/Lp2+3vhp6TY6rdAAkfFkXXBCvZmtfXVrys8begQPhLfoG8vyPZaFLpKGpYMJWJ1jejLEaMMFTrLijMkPILNVFgIFwDnAU4+sCUEOLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZHAayDDGDIuqb+MzX/L915xnF7k9pBlUrLvQL9Ac/I=;
 b=MDeVv16zqk8kSvm0uH3zwiOw/CEcJHs/AHsKJG+i6k0v2wLYPg/kBc2kqgjTMWb10RJK1RRoBR/k9js/pek0/zf9KSjo5EV6gtMWE4LHXgCTJurBaiKMslYpbiAzU83pnQmwPIGDdLynCbZ+Y5rRBUbOpBRQCnGWC3wSRs2gBMKAnzFYP4UCd4pCLl8/S0kpF7KzSzyM4YK20gbNoOSVE5arwHX1zbRcYgG35K4Q9IOCUJT9JWDmp6VZCu4lBmhIScf8bvG+B/Q8O5zcWAFts1xrscWzCut3oWnMAT5DqaY+kg/JZRa6FGeWbHgCzQj3rrfsITnAgg9g9SXz4qGZfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZHAayDDGDIuqb+MzX/L915xnF7k9pBlUrLvQL9Ac/I=;
 b=Y4oP1GpLK0qIxrZJ/OAaiDsV79gnBqyMdnC/1EoCflLuhEi42BuIHSLE3/tH+ly1Fh9yQP/h7hHcyS2UVBHLAtEMQCpGKSGUwv0QdamdXLFMcIJg64RqsUdmVgl8Z2BIzCPrH839wx0rRkg03I8rxOp/QukEN45N7OcdZNRJf6DYghwlQ6nHFtQ0EzanNXAEHxhWbj2iqNNKh2l8RF5/Vlob8CllQ9/dCwZAVTAn7w3aS1a6xjjQYWIqyPKEviWd1upl872JvcFMdLnkLRKccUYUHjuhZzuGUSDoBRBvttnEULY+Gk4lpPbAIbgqTJxwnvKQYNYlwRN/jgnQ+H7umA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1848.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Sun, 10 Jul
 2022 17:38:33 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5417.026; Sun, 10 Jul 2022
 17:38:33 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Thread-Topic: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Thread-Index:  AQHYb1JWsYyBCWIvdkmnZDAus5gR661rEeSAgAMvrICAAASSgIAAGGYAgAASqgCABox+AIABDLsAgAASsICAAgwAgA==
Date: Sun, 10 Jul 2022 17:38:33 +0000
Message-ID: <c77df184-c79c-8d81-0327-9eaefb71c890@csgroup.eu>
References: <20220524093939.30927-1-pali@kernel.org>
 <20220702094405.tp7eo4df7fjvn2ng@pali>
 <8D562851-304F-4153-9194-426CC22B7FF2@ellerman.id.au>
 <20220704103951.nm4m4kpgnus3ucqo@pali>
 <CAK8P3a2tdny8SA7jcqhUZT13iq1mYqjFueC-gnTUZA1JKCtfgg@mail.gmail.com>
 <20220704131358.fy3z7tjcmk2m6pfh@pali> <20220708171422.mpbhb4ejarwnce6m@pali>
 <358f5a57-5eee-56af-fe73-f5d11cfad98e@csgroup.eu>
 <20220709102305.t2ouadn6zscp2m7i@pali>
In-Reply-To: <20220709102305.t2ouadn6zscp2m7i@pali>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a024d496-0fa2-4dcf-53ec-08da629b0323
x-ms-traffictypediagnostic: MRZP264MB1848:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ipA2Ja43iA7RurAvDwdCqtFHVHPSmcl4tMkWqKV+4omP2W4PuQ5nN/1G9icV7Ky++htQEVARLSxT6TFJQQnU4ITY5pt8MRQDIe8aDkLB6A+ssBMa+V0zzGNZSSmPJROHNYnOtSMNQzxkjYos0GQqTYGCj8iKFIkkPbUh6Q4CxnMJPtT1RepBS/jpRTfccFdhinYhhhHE1VAg9LnfMep49K4dWTvcDC0GXiFADJ+1+3GGp4TyJG1gTelLkVMsFSOpfBZNe+cAfmjB5dW7RsWdukrCLxZuz4RbYTRsJONgHaxYs40tP7Gnzmh0wT2nH9Awy7po+8W8090BNU1PpNlwRybNo75N99Y1J4rAa/iypDY1yWI+Si4YHOW2skI9gcsF+Q71mOvfVrqaEZ8YwOjDjWsihrnrAr1Q82QqwcSXwCSKG+P9BzMWn2Ey2fDZ34TJINN66vXaj4eFRDQxwAQIzAfeM03+QTUiMoXuk+ZLjxjRnm1UfTkfmJwGWA15IxLisARUEnfJ6OTO1V7hbTNVL218DwRr/DG/1W3RVe2J4vWd0qW7oGyiVgz9b7/3GiWi9eAuT6LRrh1G6CJXZV8YG69akXbDZJ9gStof45HiwLUcF+4YMgRx+bJYORUTTO0zKbXhadN7CippLAL39sDJIAVUzXr8Tyu6Qtk0gfY1QEFk0pbjjHtBv4lXpdsDB41joKs9XN7jgdjpnbRuylhCyFA0E/b/tPBwStNiLlBBJXxZU9WB47d4MzSjwbGMuz8acdxZMsPrfb4ZEu2+dZ564qy3ZTQeomEwxnT4CP0b3fOwzkRin9G88U0ANW27ThP8C5JmqoJyy56JVknwW8/OC4M6T41+yDu2t9i5AKpjhWYKnDlRoQqvyTAe981lGSpe
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(396003)(346002)(136003)(39850400004)(6512007)(2906002)(478600001)(8676002)(6486002)(86362001)(6506007)(8936002)(31696002)(41300700001)(26005)(38070700005)(2616005)(5660300002)(44832011)(186003)(38100700002)(122000001)(6916009)(76116006)(36756003)(71200400001)(66946007)(54906003)(66556008)(316002)(66476007)(4326008)(31686004)(64756008)(66446008)(91956017)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SytFRnlOTGRjUkkwS1piKys5TTRuZ05OVnBFRUUrMFhJckJkUCtJTWJ1WlBQ?=
 =?utf-8?B?RWlyQjhoa0NPbW12Nzc3V0MvcEVMMi9wSk53bkgxSVpoaDJzcmc2czF6QjdV?=
 =?utf-8?B?eTYwOEZ5aHRDTlNBWkQvRHdGNFBMcUJTWldhNFFDQUFDSUtqUGM3dlJYM0Zs?=
 =?utf-8?B?eWhBUGtPRXgwSldMTTdqUGIzZ2R2cUxWeURTb1A3aFl0RlJnMUNvL25TTEpM?=
 =?utf-8?B?Nm0vN0RFa2czMUUzMXI3SDBFZC9aQklkWHZINC9QaGNBUS96bSt4VkdoVlNI?=
 =?utf-8?B?OVR6bGRkZDNQMWRUT3d1c0NjcHRTWWRhVCs4dHZDNmNjdm0yU2xldjNaMytL?=
 =?utf-8?B?UXc3ZDlhSGh0UDBnY1dJQ3p0QkFxS3ZkeVRhZmdBRnZZYzR4aWlYNGp1dEhB?=
 =?utf-8?B?b3VTV2p4cGNBWS9ZQktpbkxVbmNSNUNjVUpwSUlXZkcvQTNOcS92QVFaSmVN?=
 =?utf-8?B?UzJqTmtpN2t1SW5OaWFYdVhPdDhZNVJwZkdZdkhNTTNYVmJveVdXTWRrVTc1?=
 =?utf-8?B?elRRbjRPOUhLRzhUZEVubDJEdkxqa1lQbmxZYW5LOUgvdzNvRDBsUk5zekla?=
 =?utf-8?B?Tnd1UWxnYWNqcmlkOWtCbDRCekpDdk5md1dCanlWVlVSaU0yMkZVbkIvVXVG?=
 =?utf-8?B?a3NWanJvRmRRVHpSYUVmL3RXTVVsUlRuNEJtMzNtOXVmNDZvQ3g0NVEvV1gz?=
 =?utf-8?B?UjhiN052bjFrTFBFb0ZVdk1yV010bEJ6VDk0RUtvb0RXSlVvTXhnaDEzd1lE?=
 =?utf-8?B?d3Z0ZEp2a2lYZEgzNFZxNHQ1R2NuRlo2RVpFTFJMWGEyenBkalVLK09NejVJ?=
 =?utf-8?B?NWtMYWgreHRCc2JDWFpvSjlNaUl4NjgwTjRjSGp1YlRWRElEMDRkcW5PSlNV?=
 =?utf-8?B?SWd3M1NYcmNxQmVmcCtvKytsTFV5SE1QZzgvZjE0YjdKTktwempxcHNldTJI?=
 =?utf-8?B?UFhpRjN1d1hReXNuQk11ZEEvUStxZWJQaDNSU3MrM3g3TzhnZDcvaG5VYjNM?=
 =?utf-8?B?S21WclV5SG5BVnJHcHhmQktoa3hESGNuMitsanFwWjgrcGEwZU5OVlRhOTRJ?=
 =?utf-8?B?cXJIUzQvUGlpVkpNME1LRk1aM3dPN3BGSitsanRqWm5aQW5aY1hQTXRnbjNY?=
 =?utf-8?B?NU1lMXhQZFRaMnl1dURrdW5vclNkVGIzdlZGUllEaDk2UU9EZ29TRTEzL2Va?=
 =?utf-8?B?elJQL1RrZ2JDVXF2dVVXdmM0VDBGcW5rVmFLZEUzVEdDVXBUMzRpVnkxTVBw?=
 =?utf-8?B?dzRvcGFKREVSYUFkdFJxOUg0S3ZpaGdCNXJkYnhRSVJoSmpaU0pWdzBYTFh2?=
 =?utf-8?B?Wm4zMlNSZDZUeEw3aTcxWFZDblY1dnRjcUdxYlBJVE5jVHB4UVRsMGkyYzdR?=
 =?utf-8?B?Skh1WUxTUmxoZ3YzUzJqci9YWkowUTcvci9iMkc2Y3p5czZsb2NrNklTcjJl?=
 =?utf-8?B?Skk4c2ZoV2VpSGVmejdQdWtKNlBoOVVnNEZuUlJxbk1SL0FvNGwwcTRlWG9x?=
 =?utf-8?B?M0pFZ0FNOHFNQWMzWXMxaVFnNkUwWXJSRHFwdHpMY20zMmZ0RER3ZFV2c3VQ?=
 =?utf-8?B?T3ZOLzllYW9MdzRJdXIzVTZhMDNZTFlWTWFHS01FMVNHRzhBRE1Sb2phOVJs?=
 =?utf-8?B?enFHeW5JQUZCbndnazR6ZnBCMHkvNUJXU2g5dHhxY2FjUFc0VnpuVHZwZU4x?=
 =?utf-8?B?TEhSYjBJTHlZc2prek5uN3ZXWjNYcThZVWd4cjFUeklMRGdOeDZ3ZFdVYTRw?=
 =?utf-8?B?THhTSjVMK1VBUDlaeDlHWXhUbEYxQ3p6UUhuUVBtT0diakNqUGJNMEVrd1JQ?=
 =?utf-8?B?Qlh3RDJpQVNpQUFJVVR6NDZoM1ZFQTVqV3hUUVZaWDZhVVhkTnRMWGxtcUNK?=
 =?utf-8?B?L2d2b2ZtY2wxYmhkTlhuK1ptVjVTejIxVysxT09PSlFMU003ZDBwblBwcVhh?=
 =?utf-8?B?NjdsRS9BcGNleld0dk5DaGo2V2dqNG92Y2FZNVZBZlVtN2lvckJQYWNjVTlj?=
 =?utf-8?B?VUprU3Y1L1k0RVhFWFJyRlU1VDU4dEpFWERSb2lxeWZQZW5iOTNpKzA4Witj?=
 =?utf-8?B?VEhpYnN5bDNnRUpTcG5wNS81UW82eS96U09OK2ppNFhacGR0TlZJeWJHTU1a?=
 =?utf-8?B?V045a1RRT3lRUlZhNmY2QkR5SWhzZG05UWhLaXFGc0F3ZlBzcitUUTF2UEJa?=
 =?utf-8?Q?G9/t8eylLHizchU1kjscfkg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B32ADB6235C6D947932F54239CA680D2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a024d496-0fa2-4dcf-53ec-08da629b0323
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2022 17:38:33.8134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t3IOz3OAssl5aaAjeYcWvDGeS9P79KfsfOIgI+7S5hcRQZkazq3GexmfQ8WxmzzYqCtsG4wS7XSZv8eVKpKIk9E5vSzFE8P+OYGHPOXnAiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1848
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
Cc: Michael Ellerman <michael@ellerman.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzA3LzIwMjIgw6AgMTI6MjMsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+Pj4g
ICAgDQo+Pj4gLWlmZGVmIENPTkZJR19QUENfQk9PSzNTXzY0DQo+Pj4gICAgaWZkZWYgQ09ORklH
X0NQVV9MSVRUTEVfRU5ESUFODQo+Pj4gLUNGTEFHUy0kKENPTkZJR19HRU5FUklDX0NQVSkgKz0g
LW1jcHU9cG93ZXI4DQo+Pj4gLUNGTEFHUy0kKENPTkZJR19HRU5FUklDX0NQVSkgKz0gJChjYWxs
IGNjLW9wdGlvbiwtbXR1bmU9cG93ZXI5LC1tdHVuZT1wb3dlcjgpDQo+Pj4gK0NGTEFHUy0kKENP
TkZJR19QUENfQk9PSzNTXzY0KSArPSAtbWNwdT1wb3dlcjgNCj4+PiArQ0ZMQUdTLSQoQ09ORklH
X1BQQ19CT09LM1NfNjQpICs9ICQoY2FsbCBjYy1vcHRpb24sLW10dW5lPXBvd2VyOSwtbXR1bmU9
cG93ZXI4KQ0KPj4+ICAgIGVsc2UNCj4+PiAtQ0ZMQUdTLSQoQ09ORklHX0dFTkVSSUNfQ1BVKSAr
PSAkKGNhbGwgY2Mtb3B0aW9uLC1tdHVuZT1wb3dlcjcsJChjYWxsIGNjLW9wdGlvbiwtbXR1bmU9
cG93ZXI1KSkNCj4+PiAtQ0ZMQUdTLSQoQ09ORklHX0dFTkVSSUNfQ1BVKSArPSAkKGNhbGwgY2Mt
b3B0aW9uLC1tY3B1PXBvd2VyNSwtbWNwdT1wb3dlcjQpDQo+Pj4gLWVuZGlmDQo+Pj4gLWVsc2Ug
aWZkZWYgQ09ORklHX1BQQ19CT09LM0VfNjQNCj4+PiAtQ0ZMQUdTLSQoQ09ORklHX0dFTkVSSUNf
Q1BVKSArPSAtbWNwdT1wb3dlcnBjNjQNCj4+PiArQ0ZMQUdTLSQoQ09ORklHX1BQQ19CT09LM1Nf
NjQpICs9ICQoY2FsbCBjYy1vcHRpb24sLW10dW5lPXBvd2VyNywkKGNhbGwgY2Mtb3B0aW9uLC1t
dHVuZT1wb3dlcjUpKQ0KPj4+ICtDRkxBR1MtJChDT05GSUdfUFBDX0JPT0szU182NCkgKz0gJChj
YWxsIGNjLW9wdGlvbiwtbWNwdT1wb3dlcjUsLW1jcHU9cG93ZXI0KQ0KPj4NCj4+IFNvIGJlZm9y
ZSB0aGF0IGNoYW5nZSBJIGdvdCAtbWNwdT1wb3dlcjkNCj4+DQo+PiBOb3cgSSBnZXQgLW10dW5l
PXBvd2VyNyAtbWNwdT1wb3dlcjUgLW1jcHU9cG93ZXI5DQo+IA0KPiBJIGRpZCBpdCBsaWtlIEFy
bmQgd3JvdGUuDQo+IA0KPiBBbmQgc2VlbXMgdGhhdCBpdCBkb2VzIG5vdCB3b3JrIGFuZCBub3cg
aXMgZnVsbHkgb3V0IG9mIHRoZSBzY29wZSBvZiB0aGUNCj4gb3JpZ2luYWwgaXNzdWUuIE5vdyBJ
J20gcmVhbGx5IGxvc3QgaGVyZS4NCj4gDQo+IFNvIEkgbm9ib2R5IGNvbWVzIHdpdGggYmV0dGVy
IHNvbHV0aW9uLCBJIHdvdWxkIHByZWZlciB0byBzdGljayB3aXRoIG15DQo+IG9yaWdpbmFsIHZl
cnNpb24gd2hpY2ggdGFyZ2V0cyBfb25seV8gZTUwMCBjb3Jlcy4NCj4gDQo+IEFueSBvdGhlciBz
dWdnZXN0aW9uPw0KDQpJIHNlbnQgYSBwYXRjaCBiYXNlZCBvbiB0aGUgVEFSR0VUX0NQVSBsb2dp
YywgZG9lcyBpdCB3b3JrIGZvciB5b3UgPw0KDQpDaHJpc3RvcGhl
