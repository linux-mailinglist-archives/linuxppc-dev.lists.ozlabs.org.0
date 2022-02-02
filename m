Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC2F4A6BA2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 07:20:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpWrl0V5Wz3cQZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 17:20:55 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpWrG3wKTz2xKT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 17:20:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l75UR6/+sdGQXA5mK6TmMEsa7ZM5qo9varlsv+TJxNDB6tNsrE2PToIS1wbz6K54KlnnqKPeArZSBwXtWAgshz2RBadn24ZnmKzoOeEDNKjtxG6wfAmd3MjcLYYyAr0ROGZSk4QfidYxskmHHajyLCrHLNRVR7Mju5dw2ayVhiqAepWddSK+sbndwMhy5Bk3AcdDT9k3GdgK0eufeg1H/W5XJQKKOqtSItd1xRHnICEary6rqRrXBX9YYI6Ipj9/bmUBJ7jq3tekqNyjaUQ9I+1Rz+CXSTGYil7lvy2OsHVtUyY9+HibRMuRZlvB8InQcHFbeCLqIDgIOTo3Ahiglg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zjNHj7rFzbTXiep8qFwU3UIhw7SxBQj9GlGynASuwA=;
 b=DNG62KnIvOeZItvvOohOs7tevMBUT/dM6uZB7wEPnfoG4FiaKWqxUixMXZIkIR/sQTCTAq93pztePrpBhCqOuRfCVHIfZ2UHEPfgUYJ/AmxlSv8IEy0TLHEeIdOhVOMZ6fDq6Ve5L9PVH54nhWDS5xSTclbpX3Zw2UYTlqh+1itgoF5/NFyBB61QPFWJHx3bHmj4ZPz/oy48QJ2AoO4WQd1bDmefwUXkf2mirmjZpwuUO4YK2eeCtILofZOj87p1omwlu8+jRuNNdCbRSJIQDoMaAOMSWC1Nbegb14TY6JyhvlYFmzSPVabSjJ1yjbfyn5Ne0QBNfZNegkV4XQngkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1812.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Wed, 2 Feb
 2022 06:20:08 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%9]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 06:20:08 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
 <linux-mm@kvack.org>
Subject: Re: [PATCH] mm: Merge pte_mkhuge() call into arch_make_huge_pte()
Thread-Topic: [PATCH] mm: Merge pte_mkhuge() call into arch_make_huge_pte()
Thread-Index: AQHYF/dYV4AUAj+Hv022zLzZ8RKrYKx/yemA
Date: Wed, 2 Feb 2022 06:20:08 +0000
Message-ID: <a969f100-02fb-63f7-4469-b3c8e23d8cfb@csgroup.eu>
References: <1643780286-18798-1-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1643780286-18798-1-git-send-email-anshuman.khandual@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e29c6e5-fe68-4ae3-8e62-08d9e6140fb6
x-ms-traffictypediagnostic: MR1P264MB1812:EE_
x-microsoft-antispam-prvs: <MR1P264MB1812000DBFDB10B905D161C6ED279@MR1P264MB1812.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:663;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gcjpZ9RRTRJX1lKtQ9XCF4VfvZIwuXkA1hxbCmKHUiRUjmOeT22DYOkDjOosBvnjg/RpJ12qTAy/CkM6nHKY7Kg2IY8TUKlf0XRr1aTLlAFDCUioyXRquNMwEPd/IBXzkEQi1vPGexuBlTvBxmP3NCPosJZycMjfUVRgrel4QqOBM1MeZevW2uu6aLf0C+IkO0Ys2RIUa3tKoPxoVWDKdEuPgdSzXCpKX4p8Qk36K+SqOFyGrUpzjXHlRd8+o79x3gPQJfJZNnkGhy/cwhNl6iYCIzAs6osJbOk7b8tdXAO/NuZQrUbd8bp6j0XaCvbkzMWQXUI0FULNDLJjSdr2ovTxVafe7ZRlsnU58PNcWmGHdLNXHpE1faqxd6smq74qGgA3uii7aQGonIPTE98oo5njww3oKOGQxSANscoB0+0EcBZOCRJPvhWLhRvKeeZQjvItqK3Qq0MtlLMv6572FaKaB9P45Ie9K8OCsidZPhlbVhSaZsxnYXklYbnsgWYoeNNsJVJ+KlysYt67i0Lj1/o3tso6tz4UwTmuv6nSP22AcV9CzpjI+6LcK0ORi2ItUhgiXeSyLw5TJWLTUvDRe7R3ZhejphHem34g33BUsr7pG/zOT7ZGTHVadB03FibytJMtBz1HK2d+MJWk41fUd6c6HusF73+9Blp9K1Ad/28hrYTGAvDwrAIv7B8kWMXCSyUAH5YzpemnDLszYTXqFYpKJmi9UKA6PYXy/5rdDXDrRBG4qMg4pFY402KIja0wCeMcg+NjdDFxzx//J8okoaZPwzGA5XWWe4YfIrino/k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(76116006)(186003)(91956017)(54906003)(31696002)(26005)(86362001)(2616005)(4326008)(8676002)(66556008)(66476007)(8936002)(66946007)(64756008)(38100700002)(110136005)(6486002)(508600001)(6506007)(71200400001)(38070700005)(122000001)(7416002)(66446008)(6512007)(31686004)(2906002)(36756003)(83380400001)(44832011)(5660300002)(14583001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmlrYmM3dndZOFpkaUxFeGgxa1NRVDlQWmwxS3dKR2o1c1dLQVJWZG9XM00x?=
 =?utf-8?B?QjB2VWg4MUQxemFBM1A3M2ZjRVZubjNMY1ZGZEtvczh3SWhuMnMwUkNqOUFW?=
 =?utf-8?B?TGEveVc5Nzk2TUZtazRqTDFjUElNN0NSUU9uQktmZzR1T2xvbkxaNzZVdVBs?=
 =?utf-8?B?Ujk4L1E2T0k4NGowWnRFYTFOZ2VBMW5TalRjUFhyd24wbjJSOVN0R3k1bEhE?=
 =?utf-8?B?bjA0cnpBVnBrRG1Ha094QXlDV2tLQmhkQnR2eUZob3hMWHR3TU5xUmdkcEF6?=
 =?utf-8?B?eE1SYXV2V1dvQTAra1N3UExIZklVaGJkUWlzUVdYM1BERG1TNHo2ejc0QTVT?=
 =?utf-8?B?bUtpMXRqaTYyNFBNMWFsdWEvYW8vR0Izdk9ONkwrRVI2ZUxLa3NMWFRMYWlh?=
 =?utf-8?B?L2RzVXBHblB5Nys4YllEdjlqZW5raHNUUTJhKzV3MWJiakNlRGNRTVFuUTJx?=
 =?utf-8?B?dEpHOHFOZzk2NmhXMy9MZDBDUktmWWxrSUh6RWxVL1BvYWV3aE1rZzUvYW8w?=
 =?utf-8?B?b21SOEJtV3o3T3RoZEhkbDlORDRHdndhMmNreFlMSWpWV21ydnhieWZCYlVU?=
 =?utf-8?B?ZkYyUjEvamloWGp1RTNYNVljNjB2QnNUbHBWbjNtK0QyRmFOZCtPYVNQTW4w?=
 =?utf-8?B?Vys0OWVSV1NldVpxMGJmM1I4SXorWm92b2lyN0t5azJDWGdTOXRXcDQvdGR5?=
 =?utf-8?B?dVlHbUREb1diZm5sREl5ajBaU1k2TmcxVEVpU21hc25hZ0NWdGZrVEN4dDho?=
 =?utf-8?B?cVk3L2htak4zMDk3QUFGV3BxZWNXWVFoS3hzV0hFL0RPRlA0TGdPdDE3Mkcx?=
 =?utf-8?B?K2FFSVNzOVYyREZsSythdkx2S0hMQVlaTVVIOFhlK0RNbnEyczkxYmRaRW1H?=
 =?utf-8?B?ZUVkaDlzVE5yVWF2MzZRVmYweCtnSlRzOXlnbkRwMzcvcWlKTjRRU1hjV1hi?=
 =?utf-8?B?ekJ5OTlrTWVnSXpEQkc3NHpMN2ZjMGVBZzdCaXhZWFQ2eFhCbUxGN1hvUVRP?=
 =?utf-8?B?Y2JyQjRtU0VwQVh1dGxyMnl4UEJGQzdyZk5iQzBocmhKTmJoREd0bVppSnFP?=
 =?utf-8?B?SmNnNFN2VUFkL1llaHVveVcyNWdROHJwd2JHVkhCNG9TMFZFYlNlM2ExRGdq?=
 =?utf-8?B?VXhEdkhOODIvR3plbzFTSUVnSVVQZ2VNN0tyMW1qRkRGS2IxblZhSVJnUmpu?=
 =?utf-8?B?WlRnVDJUdGdzOUNwV0ZuVytHOVFEang1N2w5ZFdvYWpIcVN0Qk40WXVrZDd6?=
 =?utf-8?B?N0ljU0J5bmZQZHYyaDVqZ1NkWkFYUzBUT25FbGhVVFhrN2oySm5GdFpuS25I?=
 =?utf-8?B?cW5MbGJuTWFvM28vNEkxRTVNdFhHTHoxQ21KemkxY3NVWjJCQlhRTkxyQmFY?=
 =?utf-8?B?OXBCdVIxNU53NVJVM0wvaVpPZFA3cEsrdmx0Sy9LQjNlc0RXTFBBWWRtamo1?=
 =?utf-8?B?VGRlK2tYV0s1b1lMNG5nNmdNcjlYcE9kcGI1dUJ4UXZobFdVc1lhRlVKR2JL?=
 =?utf-8?B?c2NGZWcwSVVBTXFqSEh5M2lOeCt5Z0xKY2d1bWZER0NFMVZjM2p5WWpkZVRB?=
 =?utf-8?B?NFlGTUNwczNRNTgyUndSNksxdnkyWVpUYllBZjg4cUVuSWxhUHdDMHpEdFRG?=
 =?utf-8?B?L0N2NFh3MmVEWng4cWMxczJFQitjcVdnRW5YRnZaeXptSzFteHVCbnFKNFlH?=
 =?utf-8?B?b0lSZGFPdWhRcUpjcG1zQWJVK21RUUVybHRHSVZ2WWhlZUsvWFMzdTFXZS9C?=
 =?utf-8?B?bW45Y0FCemFMN0tCYjZBd2Z2VHoxN0srUXl6dmNLUDZsUTU2WXhEYnlJZWYr?=
 =?utf-8?B?eVhWc09vU1BJUjVKNk9HaG1VaTNZSVVPYlgzRjQ1Wkx5TG4yeTVPeDlyM1pO?=
 =?utf-8?B?RFp6a2Mzbm5TZFdmVVl5ZUIzb1dEQ0tNdmp1cVZTNHdEc0hKKzNPQTB6TXpi?=
 =?utf-8?B?ZFVxaTJMV0pQM2FvbTl5MjRZR3kxc2pOa1cwaUtpMlptVGZvNERIcnFBd3p3?=
 =?utf-8?B?c0drVWRwbnZyRXZPZXBHRU9KR2QrSzAvSHN1UWlrL1U2c3FKZUl6eTBBb1Y5?=
 =?utf-8?B?bERyWDB2RDZRTGU1VUJ5WUlETnV4QTN1TGgzWVZhOXgvNjNuV1VudHFSbDFX?=
 =?utf-8?B?M1o2Y3M3Nk1nMEZTellhRUllQzZsK0o5bFdoNnFFRGxnaWdjUEJjUHViVStj?=
 =?utf-8?B?aUdyRW1QcVJSTFJsc1NDdkU3WWRZbVp6cTBWbi9JaWtKY2V4akI4WGQ4MDFJ?=
 =?utf-8?Q?YpQJMs2dPGK29iwF9m+13Q/9iwhYyz/yC8XWSa8Z+4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81F5EAFD0E47A6409A12D7ACEBFA7BD4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e29c6e5-fe68-4ae3-8e62-08d9e6140fb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 06:20:08.6367 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d2fgsoAea1te+di2eKBbLmFzB8qc7uPyW1xawuYwoLACULKbQgbjQy/Z8O+eCYS+YUXUMe9QHNetwNrtJWRBYIoRwgjmihMddT/uiH+5zXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1812
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
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAyLzAyLzIwMjIgw6AgMDY6MzgsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6
DQo+IEVhY2ggY2FsbCBpbnRvIHB0ZV9ta2h1Z2UoKSBpcyBpbnZhcmlhYmx5IGZvbGxvd2VkIGJ5
IGFyY2hfbWFrZV9odWdlX3B0ZSgpLg0KPiBJbnN0ZWFkIGFyY2hfbWFrZV9odWdlX3B0ZSgpIGNh
biBhY2NvbW1vZGF0ZSBwdGVfbWtodWdlKCkgYXQgdGhlIGJlZ2lubmluZy4NCj4gVGhpcyB1cGRh
dGVzIGdlbmVyaWMgZmFsbGJhY2sgc3R1YiBmb3IgYXJjaF9tYWtlX2h1Z2VfcHRlKCkgYW5kIGF2
YWlsYWJsZQ0KPiBwbGF0Zm9ybXMgZGVmaW5pdGlvbnMuIFRoaXMgbWFrZXMgaHVnZSBwdGUgY3Jl
YXRpb24gbXVjaCBjbGVhbmVyIGFuZCBlYXNpZXINCj4gdG8gZm9sbG93Lg0KDQpJIHRoaW5rIGl0
IGlzIGEgZ29vZCBjbGVhbnVwLiBJIGFsd2F5cyB3b25kZXIgd2h5IGNvbW1pdCBkOWVkOWZhYWMy
ODMgDQooIm1tOiBhZGQgbmV3IGFyY2hfbWFrZV9odWdlX3B0ZSgpIG1ldGhvZCBmb3IgdGlsZSBz
dXBwb3J0IikgZGlkbid0IG1vdmUgDQp0aGUgcHRlX21raHVnZSgpIGludG8gYXJjaF9tYWtlX2h1
Z2VfcHRlKCkuDQoNCldoZW4gSSBpbXBsZW1lbnRlZCBhcmNoX21ha2VfaHVnZV9wdGUoKSBmb3Ig
cG93ZXJwYyA4eHgsIGluIG9uZSBjYXNlIA0KYXJjaF9tYWtlX2h1Z2VfcHRlKCkgaGF2ZSB0byB1
bmRvIHRoZSB0aGluZ3MgZG9uZSBieSBwdGVfbWtodWdlKCksIHNlZSBiZWxvdw0KDQpBcyBhIHNl
Y29uZCBzdGVwIHdlIGNvdWxkIHByb2JhYmx5IHRyeSB0byBnZXQgcmlkIG9mIHB0ZV9ta2h1Z2Uo
KSANCmNvbXBsZXRlbHksIGF0IGxlYXN0IGluIHRoZSBjb3JlLg0KDQo+IA0KPiBDYzogQ2F0YWxp
biBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4NCj4gQ2M6IFdpbGwgRGVhY29uIDx3
aWxsQGtlcm5lbC5vcmc+DQo+IENjOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQu
YXU+DQo+IENjOiBQYXVsIE1hY2tlcnJhcyA8cGF1bHVzQHNhbWJhLm9yZz4NCj4gQ2M6ICJEYXZp
ZCBTLiBNaWxsZXIiIDxkYXZlbUBkYXZlbWxvZnQubmV0Pg0KPiBDYzogTWlrZSBLcmF2ZXR6IDxt
aWtlLmtyYXZldHpAb3JhY2xlLmNvbT4NCj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgt
Zm91bmRhdGlvbi5vcmc+DQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcNCj4gQ2M6IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnDQo+IENjOiBzcGFyY2xpbnV4
QHZnZXIua2VybmVsLm9yZw0KPiBDYzogbGludXgtbW1Aa3ZhY2sub3JnDQo+IENjOiBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFNpZ25lZC1vZmYtYnk6IEFuc2h1bWFuIEtoYW5kdWFs
IDxhbnNodW1hbi5raGFuZHVhbEBhcm0uY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBM
ZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiAgIGFyY2gvYXJt
NjQvbW0vaHVnZXRsYnBhZ2UuYyAgICAgICAgICAgICAgICAgICAgICB8IDEgKw0KPiAgIGFyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIvaHVnZXRsYi04eHguaCB8IDEgKw0KPiAgIGFy
Y2gvc3BhcmMvbW0vaHVnZXRsYnBhZ2UuYyAgICAgICAgICAgICAgICAgICAgICB8IDEgKw0KPiAg
IGluY2x1ZGUvbGludXgvaHVnZXRsYi5oICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0N
Cj4gICBtbS9odWdldGxiLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAz
ICstLQ0KPiAgIG1tL3ZtYWxsb2MuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDEgLQ0KPiAgIDYgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvbW0vaHVnZXRsYnBhZ2UuYyBiL2Fy
Y2gvYXJtNjQvbW0vaHVnZXRsYnBhZ2UuYw0KPiBpbmRleCBmZmI5YzIyOTYxMGEuLjIyODIyNmM1
ZmE4MCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm02NC9tbS9odWdldGxicGFnZS5jDQo+ICsrKyBi
L2FyY2gvYXJtNjQvbW0vaHVnZXRsYnBhZ2UuYw0KPiBAQCAtMzQ3LDYgKzM0Nyw3IEBAIHB0ZV90
IGFyY2hfbWFrZV9odWdlX3B0ZShwdGVfdCBlbnRyeSwgdW5zaWduZWQgaW50IHNoaWZ0LCB2bV9m
bGFnc190IGZsYWdzKQ0KPiAgIHsNCj4gICAJc2l6ZV90IHBhZ2VzaXplID0gMVVMIDw8IHNoaWZ0
Ow0KPiAgIA0KPiArCWVudHJ5ID0gcHRlX21raHVnZShlbnRyeSk7DQo+ICAgCWlmIChwYWdlc2l6
ZSA9PSBDT05UX1BURV9TSVpFKSB7DQo+ICAgCQllbnRyeSA9IHB0ZV9ta2NvbnQoZW50cnkpOw0K
PiAgIAl9IGVsc2UgaWYgKHBhZ2VzaXplID09IENPTlRfUE1EX1NJWkUpIHsNCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIvaHVnZXRsYi04eHguaCBiL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIvaHVnZXRsYi04eHguaA0KPiBpbmRleCA2
NGI2YzYwOGVjYTQuLmU0MWUwOTUxNThjNyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL25vaGFzaC8zMi9odWdldGxiLTh4eC5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9p
bmNsdWRlL2FzbS9ub2hhc2gvMzIvaHVnZXRsYi04eHguaA0KPiBAQCAtNzAsNiArNzAsNyBAQCBz
dGF0aWMgaW5saW5lIHB0ZV90IGFyY2hfbWFrZV9odWdlX3B0ZShwdGVfdCBlbnRyeSwgdW5zaWdu
ZWQgaW50IHNoaWZ0LCB2bV9mbGFncw0KPiAgIHsNCj4gICAJc2l6ZV90IHNpemUgPSAxVUwgPDwg
c2hpZnQ7DQo+ICAgDQo+ICsJZW50cnkgPSBwdGVfbWtodWdlKGVudHJ5KTsNCg0KQ291bGQgZHJv
cCB0aGF0IGFuZCByZXBsYWNlIHRoZSBiZWxvdyBieToNCg0KCWlmIChzaXplID09IFNaXzE2SykN
CgkJcmV0dXJuIF9fcHRlKHB0ZV92YWwoZW50cnkpIHwgX1BBR0VfU1BTKTsNCgllbHNlDQoJCXJl
dHVybiBfX3B0ZShwdGVfdmFsKGVudHJ5KSB8IF9QQUdFX1NQUyB8IF9QQUdFX0hVR0UpOw0KCQ0K
DQo+ICAgCWlmIChzaXplID09IFNaXzE2SykNCj4gICAJCXJldHVybiBfX3B0ZShwdGVfdmFsKGVu
dHJ5KSAmIH5fUEFHRV9IVUdFKTsNCj4gICAJZWxzZQ0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9zcGFy
Yy9tbS9odWdldGxicGFnZS5jIGIvYXJjaC9zcGFyYy9tbS9odWdldGxicGFnZS5jDQo+IGluZGV4
IDBmNDlmYWRhMjA5My4uZDhlMGUzYzcwMzhkIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3NwYXJjL21t
L2h1Z2V0bGJwYWdlLmMNCj4gKysrIGIvYXJjaC9zcGFyYy9tbS9odWdldGxicGFnZS5jDQo+IEBA
IC0xODEsNiArMTgxLDcgQEAgcHRlX3QgYXJjaF9tYWtlX2h1Z2VfcHRlKHB0ZV90IGVudHJ5LCB1
bnNpZ25lZCBpbnQgc2hpZnQsIHZtX2ZsYWdzX3QgZmxhZ3MpDQo+ICAgew0KPiAgIAlwdGVfdCBw
dGU7DQo+ICAgDQo+ICsJZW50cnkgPSBwdGVfbWtodWdlKGVudHJ5KTsNCj4gICAJcHRlID0gaHVn
ZXBhZ2Vfc2hpZnRfdG9fdHRlKGVudHJ5LCBzaGlmdCk7DQo+ICAgDQo+ICAgI2lmZGVmIENPTkZJ
R19TUEFSQzY0DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2h1Z2V0bGIuaCBiL2luY2x1
ZGUvbGludXgvaHVnZXRsYi5oDQo+IGluZGV4IGQxODk3YTY5YzU0MC4uNTJjNDYyMzkwYWVlIDEw
MDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2h1Z2V0bGIuaA0KPiArKysgYi9pbmNsdWRlL2xp
bnV4L2h1Z2V0bGIuaA0KPiBAQCAtNzU0LDcgKzc1NCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBh
cmNoX2NsZWFyX2h1Z2VwYWdlX2ZsYWdzKHN0cnVjdCBwYWdlICpwYWdlKSB7IH0NCj4gICBzdGF0
aWMgaW5saW5lIHB0ZV90IGFyY2hfbWFrZV9odWdlX3B0ZShwdGVfdCBlbnRyeSwgdW5zaWduZWQg
aW50IHNoaWZ0LA0KPiAgIAkJCQkgICAgICAgdm1fZmxhZ3NfdCBmbGFncykNCj4gICB7DQo+IC0J
cmV0dXJuIGVudHJ5Ow0KPiArCXJldHVybiBwdGVfbWtodWdlKGVudHJ5KTsNCj4gICB9DQo+ICAg
I2VuZGlmDQo+ICAgDQo+IGRpZmYgLS1naXQgYS9tbS9odWdldGxiLmMgYi9tbS9odWdldGxiLmMN
Cj4gaW5kZXggNjE4OTVjYzAxZDA5Li41Y2EyNTNjMWI0ZTQgMTAwNjQ0DQo+IC0tLSBhL21tL2h1
Z2V0bGIuYw0KPiArKysgYi9tbS9odWdldGxiLmMNCj4gQEAgLTQ2MzcsNyArNDYzNyw2IEBAIHN0
YXRpYyBwdGVfdCBtYWtlX2h1Z2VfcHRlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCBzdHJ1
Y3QgcGFnZSAqcGFnZSwNCj4gICAJCQkJCSAgIHZtYS0+dm1fcGFnZV9wcm90KSk7DQo+ICAgCX0N
Cj4gICAJZW50cnkgPSBwdGVfbWt5b3VuZyhlbnRyeSk7DQo+IC0JZW50cnkgPSBwdGVfbWtodWdl
KGVudHJ5KTsNCj4gICAJZW50cnkgPSBhcmNoX21ha2VfaHVnZV9wdGUoZW50cnksIHNoaWZ0LCB2
bWEtPnZtX2ZsYWdzKTsNCj4gICANCj4gICAJcmV0dXJuIGVudHJ5Ow0KPiBAQCAtNjE3Miw3ICs2
MTcxLDcgQEAgdW5zaWduZWQgbG9uZyBodWdldGxiX2NoYW5nZV9wcm90ZWN0aW9uKHN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hLA0KPiAgIAkJCXVuc2lnbmVkIGludCBzaGlmdCA9IGh1Z2VfcGFn
ZV9zaGlmdChoc3RhdGVfdm1hKHZtYSkpOw0KPiAgIA0KPiAgIAkJCW9sZF9wdGUgPSBodWdlX3B0
ZXBfbW9kaWZ5X3Byb3Rfc3RhcnQodm1hLCBhZGRyZXNzLCBwdGVwKTsNCj4gLQkJCXB0ZSA9IHB0
ZV9ta2h1Z2UoaHVnZV9wdGVfbW9kaWZ5KG9sZF9wdGUsIG5ld3Byb3QpKTsNCj4gKwkJCXB0ZSA9
IGh1Z2VfcHRlX21vZGlmeShvbGRfcHRlLCBuZXdwcm90KTsNCj4gICAJCQlwdGUgPSBhcmNoX21h
a2VfaHVnZV9wdGUocHRlLCBzaGlmdCwgdm1hLT52bV9mbGFncyk7DQo+ICAgCQkJaHVnZV9wdGVw
X21vZGlmeV9wcm90X2NvbW1pdCh2bWEsIGFkZHJlc3MsIHB0ZXAsIG9sZF9wdGUsIHB0ZSk7DQo+
ICAgCQkJcGFnZXMrKzsNCj4gZGlmZiAtLWdpdCBhL21tL3ZtYWxsb2MuYyBiL21tL3ZtYWxsb2Mu
Yw0KPiBpbmRleCA0MTY1MzA0ZDM1NDcuLmQwYjE0ZGQ3M2FkYyAxMDA2NDQNCj4gLS0tIGEvbW0v
dm1hbGxvYy5jDQo+ICsrKyBiL21tL3ZtYWxsb2MuYw0KPiBAQCAtMTE4LDcgKzExOCw2IEBAIHN0
YXRpYyBpbnQgdm1hcF9wdGVfcmFuZ2UocG1kX3QgKnBtZCwgdW5zaWduZWQgbG9uZyBhZGRyLCB1
bnNpZ25lZCBsb25nIGVuZCwNCj4gICAJCWlmIChzaXplICE9IFBBR0VfU0laRSkgew0KPiAgIAkJ
CXB0ZV90IGVudHJ5ID0gcGZuX3B0ZShwZm4sIHByb3QpOw0KPiAgIA0KPiAtCQkJZW50cnkgPSBw
dGVfbWtodWdlKGVudHJ5KTsNCj4gICAJCQllbnRyeSA9IGFyY2hfbWFrZV9odWdlX3B0ZShlbnRy
eSwgaWxvZzIoc2l6ZSksIDApOw0KPiAgIAkJCXNldF9odWdlX3B0ZV9hdCgmaW5pdF9tbSwgYWRk
ciwgcHRlLCBlbnRyeSk7DQo+ICAgCQkJcGZuICs9IFBGTl9ET1dOKHNpemUpOw==
