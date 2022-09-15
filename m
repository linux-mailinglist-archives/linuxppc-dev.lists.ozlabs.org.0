Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8907E5B940C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 07:54:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSmcd4JWHz3bpW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 15:54:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=simuiH5g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.84; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=simuiH5g;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90084.outbound.protection.outlook.com [40.107.9.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSmbv61wxz305M
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 15:54:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qsl5EYwCsZjTqo/mACmnjmsZy0poTELBgBYeDY0dTt+mdre9Y4ZzGNOoObgtqInxzsMEOoQPzhJluDEkYLsy8UKGuY7RjjUAbVPwIu5YtZXgrP1IkgnmXs49L77WeUxDcHOl8W4PmQLyPHn49dgil8dWmAQoDueR7tCXQIv5129qIToYBH34aSJyFATZRA4sSUqHy+z5D6lAQo6TlIevEl1/i4eb4LsDfAdXY+ejgV5S5rZntf0ibA4x9/wVPgkM3RZjsu8sXXNmAjo6SG8wAONSv7dxwR+fd9SZUoRmYkTu9MEpaIRrLJxWycROL6klx+lGR5ep61U6oud3YXDDVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=240Poe6E9ex26BUftOn3ipN2uNfE1y8jMFGL/tUcIec=;
 b=Vgd5XEeavfjxDCnNHGfaHaaZ91Rl9jleQVOlbEVSVFddatUYZ15Fu3c9YUmoW+sQi6gE+KvdcgqJ9ANAis5pKHksK4Qn/oyLe0RETWk7jmswrlLYIaEjFSrAwVt12eHmIyVVvtADtoQHB2myhPFzlqFcsGLjGT/x6V5DchLs5VHJdflMcVXJBGz0R19x6A1YUMtGvjrPps/+xpMcyHvbnwlq/nOTOXVbR5ICROvfdNnsmPzQUTdm/Lfif2EfNpMpgAH7fbm72m2czMhr05lE8FgpTyGM06Qopp5QCCFDP2GGX46r9uKqHVdr00mpkChpvkJbNClwNy780FcDN/1ObQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=240Poe6E9ex26BUftOn3ipN2uNfE1y8jMFGL/tUcIec=;
 b=simuiH5gUTMKIeZjLi8n6K7vngsfr0dt8s1NUtiBuuZpg9lNdtNPAYCKWLpwcQlq2qmkqkxczHyuqanOYIDyBa2aHhZSjEmyam8WJIIspR1zdZcT4gIvgQZU7645NJq3hDnzfY+eQpw+HVuRaIPGLrWycyv8/riFVZDi0dOcpq3OWX10BFdDUi6AXO3dxjk9/CsHrlhU0PMO1pomYtgrhKKDIZlUFvBDwtxiHRf7Snu6yE+/+Xh0uxG0XP8ThBXSACCYVgr+9DnNmrRzq92i2JTCiwF5AeCjcp/lmSgGsnO0DHCy1UHkx6xaGFl//twkUwszN6vst4BhM5gz5tp01w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2266.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:16::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 05:53:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%5]) with mapi id 15.20.5612.022; Thu, 15 Sep 2022
 05:53:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/7] powerpc/build: put sys_call_table in .data.rel.ro if
 RELOCATABLE
Thread-Topic: [PATCH 1/7] powerpc/build: put sys_call_table in .data.rel.ro if
 RELOCATABLE
Thread-Index: AQHYyFGE9vrXOrFO+0+cMXcYz+0wkq3f/mQA
Date: Thu, 15 Sep 2022 05:53:44 +0000
Message-ID: <2e9a7e03-f89d-15d8-d42b-f5a0b1f9c391@csgroup.eu>
References: <20220914154746.1122482-1-npiggin@gmail.com>
 <20220914154746.1122482-2-npiggin@gmail.com>
In-Reply-To: <20220914154746.1122482-2-npiggin@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2266:EE_
x-ms-office365-filtering-correlation-id: ce547b75-5de5-4780-eb48-08da96dea67b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ryDfADTwBnF0saPVRo1It7TZvCi7MhKDfkAMsAK1SlDRgzNtzB9kkSb7n0ASGEaV1X6oyO7kqd0rUrZpUSnhVK96j7DNUqKWndTyiBaX0ud2NdtU6Hd1OfNMsX5eq4PVmjWRvBRmoPbkKZDzRq8aBolw/W5LFs1YWazFuVLRDTOBGryUKG6kfKXR4Thm5EO3lVG0EoyXCKjcjlEufBo5Hu8c2NaZOA2rHI6iOti4gLRJSKs2xrm7PWEyEBM0FBEl5L2aVzp2/Q+JemUSW9CZWCYhK2B/nw53oXfhkm69BY9RtpEll7QLuTOx8qaria5l0738Wx35xf7haWj9Bq8GQoPRPmoXFgKx0HY+FIsxxD1EuWikR3qalu5nMMMgWa8oacHJcN7TXZT+VmMA3NAai5VRuzQQXBwrZN8cVQFVaYVIBjdLrAU1FDDjEVJVbAwrfTTSMROzbtYGqiA4WxaLbzpCDE7hPr//aD5jT1fPK7mhvh9wu1uo/wCjkXhAWxQ++tTuamUXu+rGdrMTsKuoXpTR1AKlL/m1EYqGZQ0P+yvcj2smHwdD2l1TJ+z9C4TT55edh24mXEpmy6EsAt25gA4Te0j7m4BbvHGemIn57XFYo8keP9FbNnkY0YExcK8Vv69YTJD1qO5JNBsv6kVn3SZ3xIH7lBZKg0U1Ho5LTo0oi9SLpOy5t27cracnfHazCfYpvS+sXu+Plnm5NYqrU+xJPk3M4KslU3ep9Mvzxgl+haXRQ9naaOXqfYJ4zHeWGORXPgkwbcSA/MlFfXbrUsZdkDVpJoSr+16I9L6F3sbNmGtYmE4/rpfWXTSFhRhVCH4HI3rYVRHELj7ZaoPlBbEIzyaClQnSu7z4X44n8D0=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(451199015)(316002)(26005)(6512007)(110136005)(31696002)(6506007)(41300700001)(478600001)(6486002)(36756003)(71200400001)(38100700002)(122000001)(38070700005)(186003)(2616005)(86362001)(44832011)(31686004)(5660300002)(8676002)(8936002)(66476007)(66556008)(66446008)(76116006)(2906002)(64756008)(91956017)(66946007)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WUd2eUIwcWc3VHovUy9GMy9QMTZUL0JsVGl5T3ZqbzM0UHZvNEpFbmtXTk94?=
 =?utf-8?B?VVNjcGp3U3hyWnV4MU1reUpmcU9JajNmQ09DK1ZiZi9lazBramVOUkl4OXFv?=
 =?utf-8?B?bTE1TW0xSjRCenZFd3JpbXdmaVhhRFNTRmRvRStXTXhEL3AxUll2bHNVMlJ6?=
 =?utf-8?B?YXVXeWJVWHJiNUIwc2s1b25SMGhHNW9CWFk0TUJVK3dudnVUanJuRTdXWWE3?=
 =?utf-8?B?bzNNeVNjaUh3cWZJNDFHUHlZU2pmUXJYNlhEaU52MUQxZlAvVWdocUpXTHNr?=
 =?utf-8?B?eHBjUTBRN2p2MkJhcDQ5NUI4QjZhV1orSEtnZVJDbHVjSVc5VjZCSVlWb3Jp?=
 =?utf-8?B?ZmxvTUxGNWZtY3NYaUhad3FSaE5xbU9ucFhvdXZwZjN1YnU1MmU0TnFvM0NH?=
 =?utf-8?B?NTZEREZZdjJDR1BqM05QSURrMlBodklrMTh1b1Q2Yml6STVQQUd4a1lJaGhE?=
 =?utf-8?B?TUtPNklPNXp3Y3h3RW94YmNOeFlxOEFETy9FOHhtRjhIdTNTN0RqZ0diNEg1?=
 =?utf-8?B?Zi9pdm00am53SzFLbGZBQnZ3SmdQODBmbU5oNGYxYVpoaDAwR29wZnQ5VjBo?=
 =?utf-8?B?ZFQwZ1FhRGlJdkRIM040SmtoWm5xcHpGVm9hUklFUStOQkNCVFRKWVZVYjEr?=
 =?utf-8?B?bzQvdURRWlpSTnpKVUNNVVY3cDZNTUpLYWt0RGV3YllQU2xxVEpWWkFKSmdZ?=
 =?utf-8?B?OCtod050U2xGdlk0SkJTL3FlSWl3RzFqN3pnZmN5SGQyVzIrcFdOM0hId1BH?=
 =?utf-8?B?VzhDVjlteGZ3TkRoMWdWWWx0N2dRcXdxTjNic1BwdGZqVmdTcU05aXlUaEtW?=
 =?utf-8?B?d0lyNTFFdzlha3h5dVc4blZQQXBpMkc4V1h5RXY5RmVaQUl2RWk4MldtWTZz?=
 =?utf-8?B?blk1eCt6K1VRT1IyV0c1TURjSmFjOFdteTg2aEFQbU9ZRis4S1R1WGpEdFVq?=
 =?utf-8?B?bitaNFVqOE9BRnVZU0g2RU9MQkFhNWgvSW1GZU9yV2IxczZTVDRGbWh1Z001?=
 =?utf-8?B?R0V4cHUwK3p1OTBPZ09waTZCVVA3UWpWR2dreWZOa1FEbVhUS1loZUxUN0ox?=
 =?utf-8?B?cGx0MkhXSUJUTjJiWW8vZWRWSndHSlp1ZUFaNXVSTWZ6RUhQb3YxbWZpSFda?=
 =?utf-8?B?TnNKTmJOUVNPUDl0Qm5SY0p6TXVDMnpyUEJpMExydk1pMXVsODJFWno5K2xa?=
 =?utf-8?B?aHBVbk9pemhoRVlkOUdEanNCV3JGK2MwQTkvQWozSFhWVDluTGpuc0cvaGhx?=
 =?utf-8?B?Q3pZd2FPaTBlNlhjTWNmajQ1M01GU0lteGJtQ3VodFczd1l5MUtpVzBYVVRU?=
 =?utf-8?B?YmFhQWV0N2t0TkR3L1VGZE9oYjdpRlY2S1B0V2lzQ1lQUDBUZDRXTVIrV3dS?=
 =?utf-8?B?SGpRSGpseUU1OE5Fbk4zL2NNUlp3VGVtREV0WXptbGoxTVBKOThOS0pOTTJR?=
 =?utf-8?B?Z0pBT1BybWQrUTZieFplMEg4aFR0VC9LSXBsZmJ5enBFVWdaaEg0UnpqL2pZ?=
 =?utf-8?B?ekxkRllYRzVHU2grd0RjNlBBRnA2Y0FuVGJMU2tqb0F2Q0ZJV1l0MHg0S0Z6?=
 =?utf-8?B?VTB4QTZPNHFpU0pCcjgvMGFtcmxZNE5wNThIM0lUOXMzQkl5aEhvSDdKcXV5?=
 =?utf-8?B?aGRWVnBNc1MvSnljV2hKZ1JvV1NhSXFrcmlzbTU4U01nK0tOQTdzZkNjeDg0?=
 =?utf-8?B?SlNqSkFWS2cxTUpZQXpEZitXWmFaaUhwTzREa3F1VTkySGJEdzBSYXRMUElm?=
 =?utf-8?B?OHNaUG1pRDFkelJFMHpPbE9ZbysyOVFnaGJkK1F0SHM0UXd3U01JVkszbzQ4?=
 =?utf-8?B?SHNmK09pUkl6NUNxWEpqaUJERTlLbWJQak9RNDliVmdUWDg5ZDN2K2JRY2k4?=
 =?utf-8?B?R0VxOUZkUEpaQU04R3J2N0JmU0UxYmoxdEV2aXBla2VSRW9jdzRwTmdIc0RE?=
 =?utf-8?B?MHFvam9LN2gxSU9IckZocUhJYXZUYnhiYXNhamd5VGFha0NGbkpUc01DYklo?=
 =?utf-8?B?SDZ1eGg0Rk5KaFlwMUMyeHd1TXN6bTU4bzdiUXpSYW5WQjNCOTRVd0Q1amxs?=
 =?utf-8?B?TmNZQ3laNHFCWWtzQVRjQytjZ2lTcVEvM1N2aGJTNHNjSjZ3Q25DR2JJUHc2?=
 =?utf-8?B?Zi9GeDAydlRSbFI4a0svaWVxcERvUGJHVjViOGhSMlhTKzJMeDVZUDJWT0JP?=
 =?utf-8?Q?Qjg7RtrQjK4mbJmHKc7lh40=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9EEEB5B730B354284B534B005A0D5B0@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ce547b75-5de5-4780-eb48-08da96dea67b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2022 05:53:44.6079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ie7IlR4i1Ll3ulA19MqZyFGGGkf+S7ErnmS8i4PGF/rheC85UIHdu5FvJCjxW9lsfZ5GCZVqP4o6owol2dIz1pI0RmsVtbPvVJhrMwirvB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2266
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzA5LzIwMjIgw6AgMTc6NDcsIE5pY2hvbGFzIFBpZ2dpbiBhIMOpY3JpdMKgOg0K
PiBDb25zdCBmdW5jdGlvbiBwb2ludGVycyBsaXZlIGluIC5kYXRhLnJlbC5ybyByYXRoZXIgdGhh
biAucm9kYXRhIGJlY2F1c2UNCj4gdGhleSBtdXN0IGJlIHJlbG9jYXRlZC4gVGhpcyBjaGFuZ2Ug
cHJldmVudHMgcG93ZXJwYy8zMiBmcm9tIGdlbmVyYXRpbmcNCj4gUl9QUENfVUFERFIzMiByZWxv
Y2F0aW9ucyAod2hpY2ggYXJlIG5vdCBoYW5kbGVkKS4gVGhlIHN5c19jYWxsX3RhYmxlIGlzDQo+
IG1vdmVkIHRvIHdyaXRlYWJsZSBtZW1vcnksIGJ1dCBhIGxhdGVyIGNoYW5nZSB3aWxsIG1vdmUg
aXQgYmFjay4NCg0KQXJlbid0IHlvdSBtaXNzaW5nIGNvbW1pdCBjN2FjZWUzZDJmMTIgKCJwb3dl
cnBjOiBhbGlnbiBzeXNjYWxsIHRhYmxlIA0KZm9yIHBwYzMyIikgPw0KDQpJIGNhbid0IHNlZSBh
bnkgUl9QUENfVUFERFIzMiByZWxvY2F0aW9ucyBnZW5lcmF0ZWQgYnkgcHBjNHh4X2RlZmNvbmZp
ZyANCisgQ09ORklHX1JFTE9DQVRBQkxFIHVubGVzcyBJIHJldmVydCB0aGF0IGNvbW1pdC4NCg0K
DQoNCj4gDQo+IEFmdGVyIHRoaXMgcGF0Y2gsIDQ0eF9kZWZjb25maWcgKyBDT05GSUdfUkVMT0NB
VEFCTEUgYm9vdHMgdG8gYnVzeWJveC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pY2hvbGFzIFBp
Z2dpbiA8bnBpZ2dpbkBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwv
c3lzdGJsLlMgfCA0ICsrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9zeXN0YmwuUyBiL2FyY2gvcG93
ZXJwYy9rZXJuZWwvc3lzdGJsLlMNCj4gaW5kZXggY2IzMzU4ODg2MjAzLi4wYmVjMzNlODZmNTAg
MTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvc3lzdGJsLlMNCj4gKysrIGIvYXJj
aC9wb3dlcnBjL2tlcm5lbC9zeXN0YmwuUw0KPiBAQCAtMTIsNyArMTIsMTEgQEANCj4gICANCj4g
ICAjaW5jbHVkZSA8YXNtL3BwY19hc20uaD4NCj4gICANCj4gKyNpZmRlZiBDT05GSUdfUkVMT0NB
VEFCTEUNCj4gKy5zZWN0aW9uIC5kYXRhLnJlbC5ybywiYXciDQo+ICsjZWxzZQ0KPiAgIC5zZWN0
aW9uIC5yb2RhdGEsImEiDQo+ICsjZW5kaWYNCj4gICANCj4gICAjaWZkZWYgQ09ORklHX1BQQzY0
DQo+ICAgCS5wMmFsaWduCTM=
