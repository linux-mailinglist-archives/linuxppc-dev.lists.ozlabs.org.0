Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0790261646E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 15:06:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2TGF0NFwz3cGc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 01:06:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=oZ7bpkIs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.47; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=oZ7bpkIs;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120047.outbound.protection.outlook.com [40.107.12.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2TFG26L0z2xGD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 01:05:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfPmhVZUDYzbu2j7PYRskVsC9gOIptvVOI6VdJQSHbTMW+2jRjY3/e0PHsdQ09mykhmwFG3VRBmGwWfFn/ExRMvGbFkC+hmqfKNQxtIjtlrzCVxPe8SEYvIRQ3sfafjEjomuLrUhWGq/OBCjpn3s/py60c/eTtvRQMDL3WUn8x8ajRb6jwHwG9q0cawdSVTQrc1uyRCTT8htwt71UOyaefxNde+eLB0gKfeWRjC4bDG3L6AhWCyncNPwQStpj3AJ7qgwdxssdAx+Dej0NIJcm5rFgMykm9z44+wWzG3tZmUeDvA4zupkMR8LJQYdSTq5RjZjL7Fk8mIomR4hjGLZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgL6pbKNp6o3uSSmlP8oiXDlCLKBSlUHWLTsFMXCYJU=;
 b=g/NssiBNvEs8NBDPNImOwNhReAW2wG/cJeUf6clIdijQQZgysck1Ba7pAZY3O5hXIJ2+6C7jaKUolMwMD6630n9KETuDPrphgGW/gQb1TOKDklJ/uEkqxzmD9DOYHDyfq2xueO5/MwZR1dwXqSH+xk8LeHo0VqQK5MeSeZa/v3hzDfcvZ+BqDNllWu2uoj4suhDTUFr9vNyrAq46zvWurHKIUGj2b1zwQ18Npi6ACEoDe9wpilnv0wTdS86JNKkIyUbzHE9y/FuDUZduJfMlILhn21nP82EgD5qGsNCVqnNV/bya2wqYYb2zSoGUt0x7dRPv9jPEI0upbySem5NHFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgL6pbKNp6o3uSSmlP8oiXDlCLKBSlUHWLTsFMXCYJU=;
 b=oZ7bpkIsIAdrWsUSUYUwfNF3oFJdI5FGBd7KNRmEq3xiSMluPwobb3b8732l3nwzdQjDsW0gf2Tzs5Ozvh85Nvc2Zs/wPbSH/IWoHmvTn7540PhvBZH5fr8IChtqQSYUUbM2JiLY8VsnfcYr1EZhhR9Y565/T/zpoTdEEduartMSnfpXBZXrsLJMRZlL231Uabvw/HF9EAHdtAPSYdVXN4I9Y9+Odwn3yiHQaTKFE95pxULR+0ewvAVYdxJmXmgZkH28tJFav94NPV+UyhQn6imiHf+vcNWPd9YTg9EULpo/63UuQkxNi5SpLrKSiBZg8CaEWI7LpYYjAM1lRetCMw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2208.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Wed, 2 Nov
 2022 14:05:35 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8bbc:32cb:956d:88e8%2]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 14:05:35 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
Subject: Re: [PATCH v3] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Thread-Topic: [PATCH v3] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Thread-Index:  AQHYusSLeJySvCAqP0OhPUxxriPKGa3Eku+AgAABwQCAAACcgIAAAKWAgAD+hYCAQJR5AIAk37aAgAEKKwA=
Date: Wed, 2 Nov 2022 14:05:35 +0000
Message-ID: <00398948-d06c-3894-5be3-acb6cc09ff6b@csgroup.eu>
References: <20220820105200.30425-1-pali@kernel.org>
 <20220828095659.4061-1-pali@kernel.org>
 <e3cb2642-20e4-6c26-104d-329a04260946@csgroup.eu>
 <c8d657db-02da-7840-5b40-755e47277a2c@csgroup.eu>
 <20220828174135.rcql4uiunqbnn5gh@pali>
 <d49c5905-ff68-00e9-ddaf-d60d5e5ebe65@csgroup.eu>
 <20220829085451.upubyo5e7uop72lb@pali> <20221009110652.h7senqesk7nabxmn@pali>
 <20221101221255.gwaem6w7upv545fw@pali>
In-Reply-To: <20221101221255.gwaem6w7upv545fw@pali>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2208:EE_
x-ms-office365-filtering-correlation-id: 734e2364-9839-4936-cc7f-08dabcdb501d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  jRWwXyA9R8g2BGMUziGXN6hcT8W9msq8ZHS2b9uZqSeJholClil+hhz6e3702hTOO6BxOZ4mf+CR+dLZL/MMm/xlUB17lZOj+3423BX9hbJM6SU6zr5HfU/21WfUsFtwqlaBe3xIDRFZnj4Ht0IgdlkLu6drxWBgJDx1TYXPlsT0o1Wf47nfhohWoDv9L50WZRE/wrR10HZvMVaXmeaLj3Qhqxp5Ws94yUnpt4+vqD8GF4FiEBsxkLIzDLYXGLeHzMzn/igi5VGKJMx0MwBcfWcQ+NaxjtDTwQqtPk6QGp59Y+5xTtFWS7fM9bD1Z2X/g1JFUNAFlKR1rZ1k8ElAxRREqvkCIbPMZqORVmRH7eWVKs6oRcXbbCpBcXRuYGwctvfRF3Flqse9fUhhXfQn6zo+GbITzKEU1xvjIloak/BkI2kD/U9QLT3ihIsyoRGAf34mTaBVGluGVsNUwUu1gMgRQcpzPWmB8wIMa5Wbh00eSs0jtD6PG7y7EOov1iux/GM2q96dJDaPXFRtKjwamYZW0+WLQ0ZinSBhaN62dp8UXYjVKEJY0lxzHzyUWsLPznfJKwbj9+0co7rVo0cBxQ7s1aFZYJQzeDxc/p1H+pNxjtE0vvRruSoHVdnYoJe+W7ybi5mHQKDa6aw+pq6564Bk8fJnYjGFyyn6hFIsdFDsRcNH6SAptahZu9bBZn6mrgKPVQCUp2LcRjMnnhwGjxRpwqheLnOPpQ5knyuwi+A88HqodN87Zt66Qk2zQcDbd/LE4NwWpMBtGA1fkfqdeVoN8xqRBxqzCWWjJQrQv/JMyHQGEi7LBpDLj2pWsnPhCa0a0XsDXEIcNTLNcRrN2w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(396003)(376002)(39850400004)(136003)(451199015)(66574015)(31686004)(83380400001)(36756003)(2906002)(44832011)(71200400001)(6486002)(122000001)(86362001)(31696002)(38070700005)(38100700002)(26005)(2616005)(6512007)(8676002)(186003)(478600001)(6916009)(5660300002)(64756008)(66556008)(66446008)(91956017)(76116006)(4326008)(66476007)(6506007)(316002)(54906003)(41300700001)(66946007)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QXR2RTVXSkFBMi94ZE9sdHpwYW5DTEJhOU4rZitJNkY5di85YVhZbUhoVUJ0?=
 =?utf-8?B?MXRIcUJTM1Q1QWZLUGlSczRTOE5VN0IxcGdPV3RBY1pMelRyYUZyVkY0VVVE?=
 =?utf-8?B?VnozS242bWdPV2dOTkFPUjNQZTBQYVduZ0doNUVvM0RlQkRpKzhIdXgwd1ZN?=
 =?utf-8?B?YkJYQlJxRk1idzlTMFU5dXlqa1RuRTNLZ1Vtci9EenZwc2dyYXNONmpldWVU?=
 =?utf-8?B?M2hmQkxWbm02bHpUSHJtVWpsWEUzSE5RVGEranhFQTZVT2Z5UkhrazJJaWtC?=
 =?utf-8?B?a1V4bkhZMkdGOGxCZDAxMWtPS2pteFp3emxydFQ0Wk9VZ3BJRGRBbk9VWDY2?=
 =?utf-8?B?eVVlQ21OcHNTbW0rTHowWUd0bk1PaVlrc0UrVDdiMHF3NUhxYXNnMFZISzZU?=
 =?utf-8?B?Y0t2dHZNUXRqMy8yU3VwcGQyVWNzUk9ZaVpjMFBBOFpJa3BDOGwrNFdRSFB3?=
 =?utf-8?B?cU5vTjRtazVZQkdxcVVpNUVONFJZWGFSa0VpalZNV3JCOWtXVHJxM1VyVWtG?=
 =?utf-8?B?enJ0L0R6aXNiVithcFNVN3pQdWw3U2tER3lLYytZYUVoT0o1Tm9SanZZTXpY?=
 =?utf-8?B?aW9iSGxUUDRNNG91NFJaNGRFYUtCeFBxelFLMGh3YXVwRzVGYiszRnJLMHJW?=
 =?utf-8?B?MmVZUDQyL3BaOXUxbWVqZHFGU3phdDVWTW9oUVZHbTBoajNIcUZOZDNzVmVI?=
 =?utf-8?B?RjQvMW5rb3hHZDI4bGJXRjg1U2tZVDJSSC9vRFRJcXR1YlV5WWxUSlREa0RC?=
 =?utf-8?B?Ym50OHI0cVc5UWt1aFJhZVhqQVpZZlBoYnEvTTNLNURGS2VseXlwVnV6aWxN?=
 =?utf-8?B?VWx1YmxCMVhOVjJWRUVmMFV3KzN3c1NXY2Q1aTd1Z0tVVVdkTHpZODE3THZh?=
 =?utf-8?B?dzcvaXREK1Z4dEFuUU80bzdhTXppWEJHSFlZWG9IUEhjZzlTc1ZEZlJ4akVt?=
 =?utf-8?B?eUlaU3B6TnFENjZFOG55RHQ5bm5ZUzlBeTNRdVRMdG9tUENjOXNHM2ZxTzNp?=
 =?utf-8?B?cFhtVjhpU0EzOVpOdUNiUXhZOHlRT0pjWlJCQ3RLM3JuUStxcWYzV3cycFU5?=
 =?utf-8?B?MjYwQUpITENkTSthZWc0aFJCNngzYjdYQkN2WGhuQ0JXV2FEVDJlNzhuMkl1?=
 =?utf-8?B?THJlRWFWVWZJekpXNFZSOWFBWmkyN0d2TXRKcTk3THFqS0NxMTFaaE9VWisx?=
 =?utf-8?B?UGxnbUFRWFpqaExJcGwxdkFjaGxRR3piUHl3MGR0M2N0YmhqYjVBd0E5TW9L?=
 =?utf-8?B?ZjRRWFRKZU5acEVRVW9zUEpKYzhzcWVQN1MvRWJyTjg1RjlEUDZYaEx2dFhy?=
 =?utf-8?B?ZW9KQUhMbVY0Z1J1N1pEcEtEWkpDNk5EaE0zbzJ3YTQ3MXI3bytONzk0cndx?=
 =?utf-8?B?QXdtNkFsc1FBYXQ3NkZicWY2MC9Mb1BFU2lBT3Z2TEdzOFRTeTJ2UmQrc2Yv?=
 =?utf-8?B?RTFKRk9hWGpUam5vdjVtcUc5S2pMUVVramtGOGV6N2hyd0lJYVVDUmVEcGhO?=
 =?utf-8?B?WHJMcUtwMG5FTThVWDZwRGFtOUo5d1dxNFIvaGZJUmVMdnM4dnYvUmpQQnNP?=
 =?utf-8?B?OFMyZ1R6Y2lzK2tWNXZFZ04rTzFrdjlrT3h6U2x4cGJqaW10Nnc3dDd2Q1hz?=
 =?utf-8?B?bmxiRzI2bGlqbjk2VzNPUi9KVUZQVGw0U2VZajR6VER4b2FTdzVpelRyaThi?=
 =?utf-8?B?dXkydm9nYjByZEd0djdValptUHgxSmJkZFNJK2k3QUU1eTJBbE1PVVJqRU5B?=
 =?utf-8?B?OXIwemFwVVVoa0FMMU13L002SnFXdWpIemhrT1FWelRacDVDRlZGSFVSd3py?=
 =?utf-8?B?bWdJN0pYWU1JUmkrUlAwYXNnQ1pNTy9FSUV2WmU1eG5FOC9yK0pnRmNZNkZ6?=
 =?utf-8?B?SHpWRFZuQk1TRWd6citSdXAwMFRpZi9yYjVSSFZSTEFSenlOTlozTWxEVjUr?=
 =?utf-8?B?RFNyZXFKOUhHVmxBYi9vN0xIU0VXMXBDdEdsaWFkakNzYTdwNEZudSsvVEdU?=
 =?utf-8?B?Zk0xM1VDQmQ5Y1hRY0plWE8yaVhYQTQzREhxWUIzQ0xTc2E2bG95UjBoUkE5?=
 =?utf-8?B?MFB0YVRDUjFnQVNZcUtRaVZqd2JaZ3pXZTZPdm01cGNJK0FGQmEyaXovQzdu?=
 =?utf-8?B?UEhRdndhQXJCc1MrRmJ1QWt4OHlhZko1Tk9MMmhNU2t4K3JRMzdUdTBhckhm?=
 =?utf-8?Q?mtNO5vrgs0z8JIB6cy0W4kQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <480F461EB3F2AB45B863715BEC454C82@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 734e2364-9839-4936-cc7f-08dabcdb501d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 14:05:35.4023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q5b7mpLz8O5ZYh9el0640CHiDdpe/sWLdHH78etjdn7bIvJAzQa6bcRJtRngjvZmFD7Zbu6xDyZ/xh/fU6LArUdtte1WmdxIgwN0uSWfXQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2208
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzExLzIwMjIgw6AgMjM6MTIsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IE9u
IFN1bmRheSAwOSBPY3RvYmVyIDIwMjIgMTM6MDY6NTIgUGFsaSBSb2jDoXIgd3JvdGU6DQo+PiBP
biBNb25kYXkgMjkgQXVndXN0IDIwMjIgMTA6NTQ6NTEgUGFsaSBSb2jDoXIgd3JvdGU6DQo+Pj4g
T24gU3VuZGF5IDI4IEF1Z3VzdCAyMDIyIDE3OjQzOjUzIENocmlzdG9waGUgTGVyb3kgd3JvdGU6
DQo+Pj4+IExlIDI4LzA4LzIwMjIgw6AgMTk6NDEsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+
Pj4+PiBPbiBTdW5kYXkgMjggQXVndXN0IDIwMjIgMTc6Mzk6MjUgQ2hyaXN0b3BoZSBMZXJveSB3
cm90ZToNCj4+Pj4+PiBMZSAyOC8wOC8yMDIyIMOgIDE5OjMzLCBDaHJpc3RvcGhlIExlcm95IGEg
w6ljcml0wqA6DQo+Pj4+Pj4+DQo+Pj4+Pj4+DQo+Pj4+Pj4+IExlIDI4LzA4LzIwMjIgw6AgMTE6
NTYsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+Pj4+Pj4+PiBXaGVuIENPTkZJR19UQVJHRVRf
Q1BVIGlzIHNwZWNpZmllZCB0aGVuIHBhc3MgaXRzIHZhbHVlIHRvIHRoZSBjb21waWxlcg0KPj4+
Pj4+Pj4gLW1jcHUgb3B0aW9uLiBUaGlzIGZpeGVzIGZvbGxvd2luZyBidWlsZCBlcnJvciB3aGVu
IGJ1aWxkaW5nIGtlcm5lbCB3aXRoDQo+Pj4+Pj4+PiBwb3dlcnBjIGU1MDAgU1BFIGNhcGFibGUg
Y3Jvc3MgY29tcGlsZXJzOg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+ICAgwqDCoMKgwqAgQk9PVEFTwqAg
YXJjaC9wb3dlcnBjL2Jvb3QvY3J0MC5vDQo+Pj4+Pj4+PiAgIMKgwqAgcG93ZXJwYy1saW51eC1n
bnVzcGUtZ2NjOiBlcnJvcjogdW5yZWNvZ25pemVkIGFyZ3VtZW50IGluIG9wdGlvbg0KPj4+Pj4+
Pj4g4oCYLW1jcHU9cG93ZXJwY+KAmQ0KPj4+Pj4+Pj4gICDCoMKgIHBvd2VycGMtbGludXgtZ251
c3BlLWdjYzogbm90ZTogdmFsaWQgYXJndW1lbnRzIHRvIOKAmC1tY3B1PeKAmSBhcmU6DQo+Pj4+
Pj4+PiA4NTQwIDg1NDggbmF0aXZlDQo+Pj4+Pj4+PiAgIMKgwqAgbWFrZVsxXTogKioqIFthcmNo
L3Bvd2VycGMvYm9vdC9NYWtlZmlsZToyMzE6DQo+Pj4+Pj4+PiBhcmNoL3Bvd2VycGMvYm9vdC9j
cnQwLm9dIEVycm9yIDENCj4+Pj4+Pj4NCj4+Pj4+Pj4gY29yZW5ldDY0X3NtcF9kZWZjb25maWcg
Og0KPj4+Pj4+Pg0KPj4+Pj4+PiAgICDCoCBCT09UQVPCoCBhcmNoL3Bvd2VycGMvYm9vdC9jcnQw
Lm8NCj4+Pj4+Pj4gcG93ZXJwYzY0LWxpbnV4LWdjYzogZXJyb3I6IG1pc3NpbmcgYXJndW1lbnQg
dG8gJy1tY3B1PScNCj4+Pj4+Pj4gbWFrZVsxXTogKioqIFthcmNoL3Bvd2VycGMvYm9vdC9NYWtl
ZmlsZToyMzcgOiBhcmNoL3Bvd2VycGMvYm9vdC9jcnQwLm9dDQo+Pj4+Pj4+IEVycmV1ciAxDQo+
Pj4+Pj4+IG1ha2U6ICoqKiBbYXJjaC9wb3dlcnBjL01ha2VmaWxlOjI1MyA6IHVJbWFnZV0gRXJy
ZXVyIDINCj4+Pj4+Pj4NCj4+Pj4+Pj4NCj4+Pj4+Pg0KPj4+Pj4+IFNlZW1zIGxpa2UgaW4gZmFj
dCwgRTU1MDBfQ1BVIGFuZCBFNjUwMF9DUFUgYXJlIG5vdCB0YWtlbiBpbnRvIGFjY291bnQNCj4+
Pj4+PiBpbiBDT05GSUdfVEFSR0VUX0NQVSwgYW5kIGdldCBzcGVjaWFsIHRyZWF0bWVudCBkaXJl
Y3RseSBpbg0KPj4+Pj4+IGFyY2gvcG93ZXJwYy9NYWtlZmlsZS4NCj4+Pj4+Pg0KPj4+Pj4+IFRo
aXMgZ29lcyB1bm5vdGljZWQgYmVjYXVzZSBvZiBDRkxBR1MtJChDT05GSUdfVEFSR0VUX0NQVV9C
T09MKSArPQ0KPj4+Pj4+ICQoY2FsbCBjYy1vcHRpb24sLW1jcHU9JChDT05GSUdfVEFSR0VUX0NQ
VSkpDQo+Pj4+Pj4NCj4+Pj4+PiBJIHRoaW5rIHdlIG5lZWQgdG8gZml4IHRoYXQgcHJpb3IgdG8g
eW91ciBwYXRjaC4NCj4+Pj4+DQo+Pj4+PiBJdCBsb29rcyBsaWtlIHRoYXQgQ09ORklHX1RBUkdF
VF9DUFUgaXMgYnJva2VuLg0KPj4+Pj4NCj4+Pj4+ICAgICAkIG1ha2UgQVJDSD1wb3dlcnBjIGNv
cmVuZXQ2NF9zbXBfZGVmY29uZmlnIENST1NTX0NPTVBJTEU9cG93ZXJwYzY0LWxpbnV4LWdudS0N
Cj4+Pj4+ICAgICAuLi4NCj4+Pj4+ICAgICAjIGNvbmZpZ3VyYXRpb24gd3JpdHRlbiB0byAuY29u
ZmlnDQo+Pj4+Pg0KPj4+Pj4gICAgICQgZ3JlcCBDT05GSUdfVEFSR0VUX0NQVSAuY29uZmlnDQo+
Pj4+PiAgICAgQ09ORklHX1RBUkdFVF9DUFVfQk9PTD15DQo+Pj4+Pg0KPj4+Pj4gQ09ORklHX1RB
UkdFVF9DUFVfQk9PTCBpcyBzZXQgYnV0IENPTkZJR19UQVJHRVRfQ1BVIG5vdCENCj4+Pj4NCj4+
Pj4gWWVzLCBiZWNhdXNlIHRoZXJlIGlzIG5vIGRlZmF1bHQgdmFsdWUgZm9yIEU1NTAwX0NQVSBh
bmQgRTY1MDBfQ1BVLiBXZQ0KPj4+PiBuZWVkIHRvIGFkZCBvbmUgZm9yIGVhY2guDQo+Pj4NCj4+
PiBJIHNlZS4uLiBXaWxsIHlvdSBwcmVwYXJlIHRoaXMgZml4dXAgZm9yIHlvdXIgcHJldmlvdXMg
cGF0Y2g/DQo+Pj4NCj4+PiBBbmQgSSB0aGluayB0aGF0IGZvbGxvd2luZyBjb25zdHJ1Y3QNCj4+
Pg0KPj4+ICAgICQoY2FsbCBjYy1vcHRpb24sLW1jcHU9JChDT05GSUdfVEFSR0VUX0NQVSkpDQo+
Pj4NCj4+PiBzaG91bGQgYmUgY2hhbmdlZCBqdXN0IHRvDQo+Pj4NCj4+PiAgICAtbWNwdT0kKENP
TkZJR19UQVJHRVRfQ1BVKQ0KPj4+DQo+Pj4gQmVjYXVzZSBpZiB1c2VyIHNwZWNpZmllZCB0aGF0
IHdhbnQgYnVpbGQgZm9yIHNwZWNpZmljIHRhcmdldCBDUFUsIGl0DQo+Pj4gc2hvdWxkIG5vdCBi
ZSBzaWxlbnRseSBpZ25vcmVkLg0KPj4NCj4+IENocmlzdG9waGUsIHNob3VsZCBJIGRvIHNvbWV0
aGluZyBpbiB0aGlzIGFyZWE/DQo+IA0KPiBDaHJpc3RvcGhlLCBhbnkgaW5wdXQgZnJvbSB5b3Vy
IHNpZGU/DQoNCkhpLCBzb3JyeSBJIHdhcyBvbiBob2xpZGF5IHVudGlsIHRvZGF5LiBJJ2xsIHRy
eSB0byBoYXZlIGEgbG9vayBpbiB0aGUgDQpjb21pbmcgZGF5cy4=
