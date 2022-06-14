Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F50C54B415
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 17:00:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMs7s0tnhz3cdW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 01:00:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=bc3rUUuh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60f; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=bc3rUUuh;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on060f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::60f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMs753sQvz2xKl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 01:00:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HDCcheZJ8nCovrIRQeLQmZgGr+YhS5+FBaTpUPtcV65VF5i7sw7HyJjPNyNwimHcbuODalzv1LLYNC8eEIlgr0h3gaiO7gTIipRa77dVVkF/nfuwxQoKbNsvUK0hI6YpWX3tbQJwBNpMnvtjE8BpLVCOktPDtFN6KvUHIcPI/KaKxHHv2D6d2jJTlbPuEa08Clw9hbMvUYT38bm3uKYhjP1GQfQn5T3dRtx6GNDCXQdpe64aTTC7Viei3hkAJAN+MUoIqH1saM6HBwVtUxBw+Tnf1fTDV9KeyRMi2uGyL5yCXpNHcruIBhVKW3PkLgnzVjCuPT+sx2I0dCXLkZ3hXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCLs40HRqrqKexiiNZ0GO+u8HpXWKxyvkofn+Z739Wg=;
 b=EOef8F2hwWvK4Y+FM+uuCabdAJA2Qbraz5jmLOMS6DXVf7VJ9+Hva2oaYWhAW3GZBfAOfPG+C2O3izP4BnotERcpJZMEij9iM5R4YCLd2y3pHGCLe1jzc7j3ie5PEwXBYto1uPYBrtd1OKvf3+GB5j9gse8JcJhwz3kXPZwlO0H9HgOrcQRJBKo5nDebv9s75s73uLxGMe+TWcf0zjHFybQ5M+OqeMGy6oZp7U9+Mk1penrokLeRwP8XS9A3tKjNh32uV1yn5WRa+s666RCmY1J4X0lPyth+6BA0Y9fRysRhrYofhczal5zax/RDRdxHxiqFRcJUjbkcyFiNdQ3vVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCLs40HRqrqKexiiNZ0GO+u8HpXWKxyvkofn+Z739Wg=;
 b=bc3rUUuhgrvglARNEeWdfLicRJoinL8BDRd8l6n2+25w3pzDN46Nu9A93YjHyMsfNUJjHDPZazwGwdGLxj/6d2GC3PKbl1yJ3k6VOjTwc0tTzSAE9Y5e+I4cpUnu/7sp68dSKSgGDCDGz99p9VLHHAildnmub7rur8C2j6bYA+p+HbSYH7a+NFrqSx1i8WZP8Kx3WzeQIASkTRs1n5zymMwC131ltx0t0pf79wc/HZ7KCDAo8D3grkq2KA6K2Dk3AlXbxF2wYlozPV5eLzcRZHihJ9bhPWlXpDJOjRBvGONC/FkQiWJxLapcHg2ZLZJrIWD+GMAM+PtTp1G6QhmhKA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2161.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Tue, 14 Jun
 2022 14:59:55 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 14:59:55 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Wenhu Wang <wenhu.wang@hotmail.com>, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] uio:powerpc:mpc85xx: l2-cache-sram uio driver
 implementation
Thread-Topic: [PATCH 2/2] uio:powerpc:mpc85xx: l2-cache-sram uio driver
 implementation
Thread-Index: AQHYf8PkgM4WA889DEagnEGgUozdtK1O+bgAgAAFjoA=
Date: Tue, 14 Jun 2022 14:59:55 +0000
Message-ID: <99646595-d09a-e49e-d0b2-c2a317b19d09@csgroup.eu>
References: <20220609102855.272270-1-wenhu.wang@hotmail.com>
 <SG2PR01MB295139AA7360917B2C4846E19FA79@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
 <YqHy1uXwCLlJmftr@kroah.com>
 <SG2PR01MB2951EA9ED70E5F766DD26A069FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
 <efebcb50-0481-622a-894c-7000999aacc6@csgroup.eu>
 <c76598b5-2d60-ea22-d590-4cc6998a8830@csgroup.eu>
 <SG2PR01MB29516D3BB7525390ADD5B0829FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
 <SG2PR01MB2951CE54262F791931F4AAE19FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
In-Reply-To:  <SG2PR01MB2951CE54262F791931F4AAE19FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2ea6de2-5a9d-41c0-af29-08da4e168b1d
x-ms-traffictypediagnostic: MR1P264MB2161:EE_
x-microsoft-antispam-prvs:  <MR1P264MB2161E4610D95906555AABB85EDAA9@MR1P264MB2161.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  V6iq16wkpGIfbm/0K1+WsZCe3nGcot3p+5Tg0k8tZRa7tjCGb14MvDZ2A8Y3ynhiLj0sn2DQ2r5AWQ6ndDZ2hhWZNVfYMjFODNeQaqu1gIh7lMcB6Vsc2DhAzD7HqlBsGtSByma50HRuBeGXWreIGumuEz4CkGhYqVtVGu9FMDv+VP869nxjFkkvF374K6pKLLJ7cwe4f0yNWdiYrTnylVlZ7s8J1UB31Jr6V3wMkVJr9hyGsluTWcaU9L0s6BTPIub+3ZYFxtyrWbDq/89kcAYjugKvt38F3vcKdYgFzFmI62RlzVPZoc74VGo5mgdTO25meWw00ottUi50TSxkrHKZevNZ+0iiVPTi5FSeEprag3ldVSYMuMUH9uYccuqY7b8gKJPw6+3Zq2c02SiBfFOkGBrRAqZ9udXqmvE6F1viTFqZytorzb1/r3fBl1WuQnlxyurHTY6i8+7w7ErgPzeFU6fY/mecLA+drn7nXqHvwfOjnPeVBNSxZ74KxZDmPrCS+c2APJkFbz3Hwdnzv9iMifKJQyGVabmQK5lY65JrHdKy8H6ohF7ORto6qpYqqWF40rIbR4atvKaRWS6pv1rNLkMWX9WIPNAA1znrMLoCYcz1eoph4Hu4EkTphULrzrgWtQ66WRhE1Kq+nMcbhdZxdiwmXtT5NnGDDNL1rxSWHhwFryX3MtL3aKPqzSLrZcot70zu1OS1HPxzKboOEyCahJgzTMux9WssG4S+d0892Xm4GCY9iXG5x+MT5yQHzEjyAn6Gos8t5YiWu5F6RA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(6512007)(83380400001)(26005)(36756003)(8936002)(38100700002)(186003)(66574015)(6506007)(31686004)(2616005)(44832011)(38070700005)(110136005)(316002)(2906002)(76116006)(64756008)(66946007)(31696002)(4326008)(8676002)(66556008)(86362001)(508600001)(6486002)(5660300002)(66446008)(54906003)(122000001)(91956017)(66476007)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?T09KcDJMazQ0a3VGTDF0VTJTSjR4QkdFUE0xUmF1MlNmaTRnajRmN0R2MUF5?=
 =?utf-8?B?T0N0UVFPQ05USmV1ekhCSmk3eDV4KzJmUGNxVTlRSlp3akJycWpCRTNLbE4w?=
 =?utf-8?B?WjlodmszcnhMMndDdHN1MWpkeTR1YVloSm05L0EvUVpqZFkyNmM5azZsRmdl?=
 =?utf-8?B?OW1MM3FnOGVURnhDaWJBN2RTd2ZIMGUrOEd6YzhINW9vTzlXVFoxRlBCbGxh?=
 =?utf-8?B?VFlNSitON0F3Q3MvQTFsdlRwaE9DUG8vSnZ6T3pKcFhZQk8vMFZrbWJKdThB?=
 =?utf-8?B?ZG9qa3M4K1RrNXZ6dmZyM0Y0YUcrVmsrUENNQ2Y0WjMwWjA4YmFJclIyR2dP?=
 =?utf-8?B?S2R5SkdDTDRWTmhucS9QVkZ5Tk5veU9BaVZsTis0eXl3dWduZFJPaU5CUElz?=
 =?utf-8?B?WHdSZE44bjhETXdxY0I3S0E0QWpZRGJEREoyOWFWeUxUaFJoNXkxcStqdURD?=
 =?utf-8?B?OS9LV3FWVUdlbi9UQTZHRXR6aytzOGkwczFGMVRSTlZkTEpqQmNJb3JVNHhD?=
 =?utf-8?B?dGVaSHRJOGgvdEtCNWVzcDVRM0U3cG1VSmdQbytDWW5OZ0ZsYVJSL2o0ZVJa?=
 =?utf-8?B?VkNjSGVlV3psa1d5TjBJUVZBSVdrT1NTcGhIMVlPU05wZW5VTHB0SjZKb3Ew?=
 =?utf-8?B?UEtkRXVkVk9yaTBTWFRwRTUxRWsxbkxBSlR6RG9JMTVpVGYzVGVSMm5BTi9E?=
 =?utf-8?B?cncvS1lZaFZIcVlBU08rVXUxNC9xRHA2MDJNamNGVnBFSkZ5Q1JMTHNoRVR1?=
 =?utf-8?B?MEFhOTg5SU5PS3liaTlKQTZES1hObFNXdzBGakpQeGxTMWZpRXB6QkZOa2dP?=
 =?utf-8?B?VGZRYVNWdTFrVjdOVHRmdG1QcjNudHZBTm42bVBrNVBOblZyVDZ3bGNsREVS?=
 =?utf-8?B?cy8zdHlMV3lNSWdibHNBSnI2anlQOVpWK2hxZE03RWFhOExJbXpCYWhYYWNT?=
 =?utf-8?B?TWZheVRzWSt1eldhQ3hvVWxMMHFzOEpFNmwrbmcwaU9QS3UvNFJtc1NOVHdk?=
 =?utf-8?B?MzR0Q2FOeExCMlg0dG9DdGRRZWlyb3JyWktySkZFN1ZIUG1XdDduREk5WHA2?=
 =?utf-8?B?ZWU1bHIwVVFHVjk0VURUeGc4TjRrM0FoYnR5NG0yTndORlQrOG5vRWJjSk5F?=
 =?utf-8?B?dmNYU01hb3JlRkdPTXV1R0p4ZHl5YmhwQjdRYyt5QVJjamtrNVZwTi90djdm?=
 =?utf-8?B?anpFWXZiRjh6eDdVbTMrMmxhcUNBWWtRZ0MxNWVaaG9FZ21CVWVGYVd3OXl1?=
 =?utf-8?B?aW5rTVlwa0ViaFJZMHBwU1VyWHF4cTUvcTBtVzgxNkhlSE9ycjhDNjY5Tkx1?=
 =?utf-8?B?dzhSVG5Oa2dTaHdRQnVTMHl0b0gwSjNwYnRkcW5sOU9JeDh3blRLTEg0djh1?=
 =?utf-8?B?TVlrbzFPWkRUa0xBWUNMNFFBdzN6UmNNN0luUVE4dUFsRjh5WmgzQWRwaHpi?=
 =?utf-8?B?ZzNNU0tadFJMNnR0VHNCaWtGa0FNK1Y4bElmQUErZEdtTVpFcklPZVQ4bnlQ?=
 =?utf-8?B?cHg2QnF5Vnc0d1BpbEFSbWxHSjFFN0RrU2ZjVTJhcXNGVjBoUHcrV2pXSVF4?=
 =?utf-8?B?Mkt2enR2U01CZVE0TW42eVA0YXRGVG5MZTl0cC9XN0k3bmNvRGtIUFdPdDBv?=
 =?utf-8?B?aXVCdytGeGJPaG83WGVScTJ6VEcrdkdnWlBYUDJQSmJHUUh4ZjdBMlFRZ3Rr?=
 =?utf-8?B?OS84UHZpTm15bXNEaXJNUExyOExCd2JYai8zd2NndmJxbWpWWVNpb1kyZ3pC?=
 =?utf-8?B?czFRSnNXT0hhYTJtckxkeUQrODZGYXZpaDd5bWRIN0xNV2g1OHJPNzFNYmww?=
 =?utf-8?B?dzE3MERya1FQY2NPYlBsRncyTEQzY1VKa3RpQmZLVDl0UDZwV3pTZUkzekdV?=
 =?utf-8?B?OENORHNqbG5NNGlRQ0dRemVBUVNKSHhDNmRxcE9qajJZeXBncno3Mi9PNEho?=
 =?utf-8?B?YU1OOWRHbHNZTWZuSGVQbEFBUWkwVmRBQ0VzcHFPRDZWdFZ2OVR6UGlwTnh0?=
 =?utf-8?B?V3dSSSttTkpobWtNNzdXVm8yMm1nVWl3UzI2TTA3UWJqSEpCLzc3WktUVzlu?=
 =?utf-8?B?Z004T3UzOUpMbk0wZU96aWlGcXVoZzRvYXNSNW5ZRG4wYnQrQVZxYjJWb3Ey?=
 =?utf-8?B?Z2FMZGhZYU52RFRUMEIwS1UyZEpzNjJvUHlwRVhFcVlqSjl0MlhDdEVKQ013?=
 =?utf-8?B?aUdibmN5OGllUWZ0WWQreW1mK2NBK2NtZ1ByNzJkcWt3ajhpdkJFZXZISEZa?=
 =?utf-8?B?bjR6Smh4UTA5aUdvdjJwYytQakVBbHo5TFlyWGhYVkdiUjVsaFY1b1JMYXR6?=
 =?utf-8?B?UkRNNFhQaElNRUxYWDliZjJGVHQvK0puTE9yUXdWdVZ3NUxEM2VodTViNGh4?=
 =?utf-8?Q?lv/rtITK9jH1VDlxAShJNdaJwE5wbGsLvKlgS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC910C3BB2667246A9353EE01C974F87@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ea6de2-5a9d-41c0-af29-08da4e168b1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 14:59:55.5947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JfCLOjDUrRVKh7PA4u2eZiSDCIXLdL7sF6YWo0erCk7Zcd6KufRE+Q8DoWRRCXX2R8WilTuszFcObY9Mr4TPumP0934Kwznn/VbXqT3FhqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2161
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzA2LzIwMjIgw6AgMTY6NDAsIFdlbmh1IFdhbmcgYSDDqWNyaXTCoDoNCj4+Pj4N
Cj4+Pj4gSSBsb29rZWQgYXQgdGhhdCBwYXRjaC4NCj4+Pj4NCj4+Pj4gSSBkb24ndCB0aGluayB5
b3UgY2FuIGp1c3QgZHJvcCB0aGUgI2lmZGVmIGluIGZ1bmN0aW9uDQo+Pj4+IF9fYWNjZXNzX3Jl
bW90ZV92bSgpIGluIG1tL21lbW9yeS5jDQo+Pj4+DQo+Pj4+IFlvdSBoYXZlIHRvIHJlcGxhY2Ug
aXQgd2l0aCBzb21ldGhpbmcgbGlrZToNCj4+Pj4NCj4+Pj4gIMKgwqDCoMKgwqAgaWYgKCFJU19F
TkFCTEVEKENPTkZJR19IQVZFX0lPUkVNQVBfUFJPVCkpDQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKg
wqAgYnJlYWs7DQo+Pj4+DQo+Pj4NCj4+Pg0KPj4+IEFub3RoZXIgdGhpbmcgaW4gdGhhdCBwYXRj
aDoNCj4+Pg0KPj4+IEJ5IG1ha2luZyBnZW5lcmljX2FjY2Vzc19waHlzKCkgYSBzdGF0aWMgaW5s
aW5lLCBpdCBtZWFucyB0aGF0IGV2ZXJ5dGltZQ0KPj4+IHlvdSByZWZlciB0byB0aGUgYWRkcmVz
cyBvZiB0aGF0IGZ1bmN0aW9uIGluIGEgdm1fb3BlcmF0aW9uc19zdHJ1Y3QNCj4+PiBzdHJ1Y3Qs
IHRoZSBjb21waWxlciBoYXMgdG8gcHJvdmlkZSBhbiBvdXRsaW5lZCBpbnN0YW5jZSBvZiB0aGUN
Cj4+PiBmdW5jdGlvbi4gSXQgbWVhbnMgeW91J2xsIGxpa2VseSBoYXZlIHNldmVyYWwgaW5zdGFu
Y2VzIG9mIGENCj4+PiBnZW5lcmljX2FjY2Vzc19waHlzKCkuDQo+Pj4NCj4+PiBXaGF0IHlvdSBj
b3VsZCBkbyBpbnN0ZWFkIGlzIHRvIGFkZCB0aGUgZm9sbG93aW5nIGF0IHRoZSBzdGFydCBvZg0K
Pj4+IGdlbmVyaWNfYWNjZXNzX3BoeXMoKSBpbiBtbS9tZW1vcnkuYyA6DQo+Pj4NCj4+PiAgwqDC
oMKgwqDCoMKgwqAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19IQVZFX0lPUkVNQVBfUFJPVCkpDQo+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+Pg0KPj4NCj4+
IEl0IGlzIHJlYWxseSBhIGJldHRlciBjaG1vY2UsIHRoYW5rcyBmb3IgdGhlIGFkdmljZS4NCj4+
IE11bHRpcGxlIGluc3RhbmNlcyBleGlzdCBhcyB5b3UgbWVudGlvbmVkLCB0aGUgYmxvY2sgcmV0
dXJucyAwIHdpdGggbm8tb3ANCj4+IGluc3RhbmNlIHdoaWNoIG1ha2VzIG5vIGRpZmZlcmVuY2Ug
d2l0aCB0aGUgZnVuY3Rpb24gcmV0dXJuIHZhbHVlLg0KPj4NCj4+IEkgd2lsbCB1cGRhdGUgdGhl
IHBhdGNoIGFmdGVyIGEgcmUtY29uZmlybWluZy4NCj4+DQo+IA0KPiBJIHRyaWVkIGFzIGFkdmlj
ZWQgYnV0IHdoZW4gbm90IGRlZmluZWQsIGVycm9yIGhhcHBlbnMgb24gYXJjaGVjdHVyZXMgc3Vj
aA0KPiBhcyBhcm02NC4gQWN0dWFsbHkgdGhlIGZ1bmN0aW9uIGdlbmVyaWNfYWNjZXNzX3BoeXMg
Y2FsbHMgYSBsb3Qgb2YgZnVuY3Rpb25zDQo+IHRoYXQgYmVjb21lIHVuZGVmaW5lZCBpZiB3ZSBj
b21waWxlIGl0IHdpdGggQ09ORklHX0hBVkVfSU9SRU1BUF9QUk9UIGRpc2FibGVkLg0KPiBUaGUg
YXJjaGVjdHVyZXMgdGhhdCBzdXBwb3J0IENPTkZJR19IQVZFX0lPUkVNQVBfUFJPVCBhcmUgbWlw
cywgeDg2LCBzaCwgYXJjLA0KPiBzMzkwLCBsb29uZ2FyY2ggYW5kIHBvd2VycGMuDQo+IA0KPiBT
byB3ZSBtYXkganVzdCBkZWZpbmUgdGhlIGZ1bmN0aW9uIHdpdGggc3RhdGljIGlubGluZSBhbmQg
YWRkIElTX0VOQUJMRUQNCj4gY29uZGl0aW9uIGJyYW5jaCBpbiBmdW5jdGlvbiBfX2FjY2Vzc19y
ZW1vdGVfdm0gaW4gbW0vbWVtb3J5LmMuIFRoZSBleGVjdXRpbmcNCj4gcGF0aCBicmVha3MgaWYg
Q09ORklHX0hBVkVfSU9SRU1BUF9QUk9UIGlzIGRpc2FibGVkLCBhbmQgbmV2ZXIgZ29lcyBpbnRv
IHRoZQ0KPiBzdGF0aWMgbm8tb3AgZnVuY3Rpb24uDQo+IA0KPiBJbiBzaG9ydCwgdGhlIHN0YXRp
YyBpbmxpbmUgbm8tb3AgZnVuY3Rpb24gd291bGQgbmV2ZXIgYmUgZXhlY3V0ZWQsIHRoZSBvbmx5
DQo+IGRpZmZlcmVuY2UgaXMgdGhhdCB0aGVyZSB3b3VsZCBiZSBhIGxvdCBvZiBmdW5jdGlvbiBj
b2RlIGluIGNvbXBpbGVkIHRhcmdldC4NCj4gDQoNCkluIHRoYXQgY2FzZSBhbGwgeW91IGhhdmUg
dG8gZG8gaXM6DQoNCmRpZmYgLS1naXQgYS9tbS9tZW1vcnkuYyBiL21tL21lbW9yeS5jDQppbmRl
eCA3YTA4OTE0NWNhZDQuLjM5YjM2OWZjNzdmNiAxMDA2NDQNCi0tLSBhL21tL21lbW9yeS5jDQor
KysgYi9tbS9tZW1vcnkuYw0KQEAgLTU0MTMsNiArNTQxMywxMyBAQCBpbnQgZ2VuZXJpY19hY2Nl
c3NfcGh5cyhzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgDQoqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIs
DQogIAlyZXR1cm4gcmV0Ow0KICB9DQogIEVYUE9SVF9TWU1CT0xfR1BMKGdlbmVyaWNfYWNjZXNz
X3BoeXMpOw0KKyNlbHNlDQoraW50IGdlbmVyaWNfYWNjZXNzX3BoeXMoc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkciwNCisJCQl2b2lkICpidWYsIGludCBsZW4s
IGludCB3cml0ZSkNCit7DQorCXJldHVybiAwOw0KK30NCitFWFBPUlRfU1lNQk9MX0dQTChnZW5l
cmljX2FjY2Vzc19waHlzKTsNCiAgI2VuZGlmDQoNCiAgLyoNCg0KDQpDaHJpc3RvcGhl
