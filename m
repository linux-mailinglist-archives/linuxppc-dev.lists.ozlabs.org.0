Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9A370A927
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 May 2023 18:30:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QNq1w16BGz3fFd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 May 2023 02:30:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=3kpMiv39;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::605; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=3kpMiv39;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20605.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QNq103GHLz3cgv
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 May 2023 02:29:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVBpBDhxGL++mDOCUShI8e9fZeniNz2TzfRauOgbIgu20YYDWyBj4ZEidAzR/vorZXn0bINMQecAXqPkqCSHXvFATGA7U9/sA8rLhtJ1DXIaiS/6qi5fOrsh/Ie/DL52LwqUa0VVAGpofa1bqzFIt7fnXQR0yqi3XL7vJe779LklrfLKshaCR75wVY1MhPjtXufjN8oWFz/GUadGeRFmmu7MyRWc2oOq0qRG32kJ4jW3t8uhAEi8TFCJRVtb9buuNrboXYTJ2KivjYIcKtJ75pg04pJgSUIo+DNFhuGUzO1OfUa2yzU8Wg5D1PId9UZa3pUz+YOB4fKs3EHG81OgRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ok/vyv4TpYu9FR6EZbOHsxQuU5jl5GnIyuiQcIK7bfg=;
 b=PDKGcLIBjXtHmiM272Km7qq+5F8qpRG3GJCZea6gu9bWFO6N1X2Feeqk1PEBhNdWY2Jih8he3D4jL8hJoTbNbk18uBN4t/26Ja38Fiz3uYthisznpXUDFjSEEc6yR+dBtiaNLRKeeSzq6xViod/1aq2OpsvioE4L7PU9mw3+vMHJ9EFERbovdAyIN/YSbeDLvvmuj+e8bb7jKXWXV13jvsJGNvQ3ScUMa6yCHQ97CbML0B7MGBvjvxyG1+KPF2UqudUQuCLiELISCKydCK/7Mhd/ifCAZQRZIlaAj3n+InyUUs3EWOxSdFhdd/l260XmVeWT+1vi2Jue3OnD1GeqQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ok/vyv4TpYu9FR6EZbOHsxQuU5jl5GnIyuiQcIK7bfg=;
 b=3kpMiv39ypGAfG1X4tL8lBGzx30s2tBS3U0PZI0c60juAiXSVQYRuXE/2XwHt4Cz6cSm5ErN9+jLUgYb7YEICktgkKV/os5gmQG793zTXl2gYw8AaeLUkb6H4UoDEjugUtAgBZTJ01geqCAubkea1UXgj5/hb106ajWwvihKhULh5SfHWZLtDRy6CWX/EQ7C3qCEk2YfOsopy1BwfuFssF83ThohmziFkR+IU8B8jHpJhm5XMLy3hmLnC+LCs7OMqXA/HPpQ7EVoG+SHn3CAFK9oosYhQBUl8OrAcb67LRSn1GsgkG/rdA6/HyaQ/Tgo+9gJk0Sfr9XCgxIPJv1R9w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2087.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:17::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.23; Sat, 20 May
 2023 16:28:59 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::447b:6135:3337:d243]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::447b:6135:3337:d243%3]) with mapi id 15.20.6411.025; Sat, 20 May 2023
 16:28:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Naveen N Rao <naveen@kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH] powerpc/ftrace: Refactoring and support for
 -fpatchable-function-entry
Thread-Topic: [RFC PATCH] powerpc/ftrace: Refactoring and support for
 -fpatchable-function-entry
Thread-Index: AQHZiojBbqr4duIEo0Gy73hFswcDS69i+CKAgABjJwA=
Date: Sat, 20 May 2023 16:28:59 +0000
Message-ID: <85460820-e5e0-57e3-68a7-dd7a562c9eb0@csgroup.eu>
References: <20230519192600.2593506-1-naveen@kernel.org>
 <3527b8d2-275e-29d8-fd3b-4002a4a901fd@csgroup.eu>
In-Reply-To: <3527b8d2-275e-29d8-fd3b-4002a4a901fd@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2087:EE_
x-ms-office365-filtering-correlation-id: 98cdc8c5-12c0-4844-119f-08db594f50ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Au+8AfxlxXnlKhk9caBxAGONE/KTHN3yuws8bOgrsiSkRxu79KdJgS559b3a/uivJhGy79Osse2pZ6QxDs+Anu54GeMvluPYHnDBhsa93SKp32N/DTD+NN2NBJD4UJ4PBFc04zBn7JbQRljdYDhETjHUEdMVny0Fu2ZOj+mC5VqD7d5wJQkqhQywzRaMFunsz7+RwS8PsJyo4vrIdTKBNfjJAH0R6iS1I8Z3PvYtG2v4/9w4F3giGfzVHcE3EUWrrIZhl8C0jx7BPLjrZoliDS11BdOpKTYmBBXtZHdPR0hUSt/dfj0PNF+zbhS+LBLyeA1ypXOqrQZsRpeqgjKk4cTOodttuEvUfY6oTb5Z9/dlHxigx0l9W2qudtgOoH4qBlUAAoKSlS0ERbGfmt/kYAZCKk2XmkpntC0cWbfiH/KDndi8qjxlTyPeMv377VAaYc41XZ/hZI1XTAeRarvxam6X6mYDIOss/ian5W9F5VatwzZNYbfpeDFuK+h86pRUD0KSO+5q5EpsrO2A1jdG0+QEABHXn7V45CLenSkFsOVcmYUQPHx/g9zJ2z13pfIDWxZ3xWeMHFhMi7qbpc28TMpu7bm0j72NdBaiXKzT5u7c4NhL9ruuuAO7CugLJN7xYDePlc1M06N7MSGZBC6kAPtf3grcK5hZXLnZVKwDHQ4=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(346002)(39850400004)(136003)(451199021)(8676002)(8936002)(5660300002)(44832011)(83380400001)(66574015)(6506007)(6512007)(186003)(26005)(2616005)(31696002)(86362001)(122000001)(38100700002)(38070700005)(71200400001)(478600001)(6486002)(966005)(36756003)(4326008)(64756008)(66446008)(66476007)(66556008)(66946007)(41300700001)(76116006)(54906003)(316002)(110136005)(91956017)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RkExc3FnTTRHdnIzalcvSXBwK0Q0b2tBUis0NHJnM003cVIzY1c4dXZCTlZH?=
 =?utf-8?B?RTFNT0xmYlpjUzNzNklOa0wzOHVNZUp1UWpjU1kwc0ZZR1BLTjhuUk1GT2dP?=
 =?utf-8?B?SWd2NjZVd3lheVc1SXpRN0JNTjFxUXJRMm5pL1hxeWJoeTBRMUEzQ2p4MDZ3?=
 =?utf-8?B?bDJsaGJBbGRhVmhSZy9PWHRnWFlqM21aSGhtRHh5V2ZhLzByalRUSjdUUWZB?=
 =?utf-8?B?RW1EMUNQV1JFTnVsREg1OVBGcVVCZjlXZnd6R2E4QXFKWTBlRnNxdWV4UXI2?=
 =?utf-8?B?enJ0OUZoc01RVDhQSysvN2pnMzJZUkhDN1J0ZGNlYmlQdjVJbFRaVis3d2xB?=
 =?utf-8?B?TWRZa2wwYXJwaERPY1p0T0dsUVBvYm1hUFdlcjR5V1RUSGZoWFgwYysxbS9x?=
 =?utf-8?B?c1RQRFpuWkwycHZ2SWFzbDU5NXNRLytNTS9oaEJrNmVzNzF2bEJJaDg1ekpM?=
 =?utf-8?B?ZFdZVVlxTEhObG9nU3R5VXJPNExuV0JGdUltSURadGU0OHhqdHg5NmxRUTNI?=
 =?utf-8?B?RHoyRmMxaVljU0JBdEUrVUlVNWh1dTU5cXpLbUxpcmFrZ0I4MUFHT3FuZFkw?=
 =?utf-8?B?bXJJUDVRRGtZUjFwaE51OWt3RXBUVzBRd3pkaG1UZ3dBNnpPMDJoYmNvR082?=
 =?utf-8?B?dHhLQUVjNjJld1Y0VEFSby8rY1h4RGRFNktqaE9YbUJUS3VaRTFwekVnTXFl?=
 =?utf-8?B?SitVTFpJalpIWGpOWU83ak9LTWJVZnI1ai9KTjNacUUwakdMM2lQQ1FaQ2lI?=
 =?utf-8?B?Y3RNL2VmZDdrT0V0S0xYYzdjbXAxcjIzdmlzdWVaRjI1cXlsaFRPbVdQWlpv?=
 =?utf-8?B?VDFWVHdPak12ZkE4cUV3WnZpUXFjUXp6WlB4UjNTdVBFT0ljNEUxUWU5dVlQ?=
 =?utf-8?B?Ui9iMFpobStWTkwvbGVnKzYvTTl1TXovTVcxUzczVWZpZmdxY05zSURiY0l3?=
 =?utf-8?B?d1BMQWJnL0pNbnJqTExvYnJzK0crQXJjRnA2TkFDMndjUFJRNkJzeENCdGQ4?=
 =?utf-8?B?eU13ejdkZVVNc3prUG1GcTkvakVMWnB2Y0tYTzB5bWFIaTRmZkc0QTdwdzRj?=
 =?utf-8?B?aklhRE1jNlgxWFBsM3VLaUppNnd5a2hBLzV6YThZSE5QQXVnbk9qc3JwbkFK?=
 =?utf-8?B?NUNOa1I1OHRtVUhndHR1UENGdWVOaG5GRW1NaDlIZ3d0Nk81QmtxV2pySjJr?=
 =?utf-8?B?L3RTNS9lOTJic1I0MTY3cGdob1UwRUpFd3JzSHJMc05OK0hicW5Ta1NGSFRE?=
 =?utf-8?B?MUlWdjlUNU9saWY4WjI2dklCMDJtUUZ3OUtPYnJLaXZic01MOFVPbjRZRmd1?=
 =?utf-8?B?RmpsczdqMzIwMVNjdjkzS2NmdXdtQm83dytMbG52ZEhGZFN3dG0zQzkrVkw2?=
 =?utf-8?B?SnVqbzUyMUNwRktYTjRUSG1KTVRxb0x0Sk5ERHZqRXpaSkUwUGtzQXZTMGhm?=
 =?utf-8?B?czNaZ0tjUlNmU3B2Vlp6MkR4SnB0cnh0TFlEVUtFWlR6bDZHbEc5Q0xYNXhi?=
 =?utf-8?B?REgvOGVidEdBZTNoY0N4TXpZSkVxeGtNa1I4RmR0eEpwNFJCT2Eyd2E2bUh1?=
 =?utf-8?B?Z1l2dVZUU290TUxZM0tSME9CTXVWNkxWcHR4YnlIUXFHS3k3WnNTaUxpS2xR?=
 =?utf-8?B?ejNiTWp0QUpjNzRVUDFJUFdCbm5vU3ZwcC82WDRPK09QN2VpeTVva29Od2N3?=
 =?utf-8?B?bWlkNUJkakJ3T3FCRVZFd2hkWlR4WUR0U3p2bmN6U0dKV0xZdWgvNHBHbDRs?=
 =?utf-8?B?a1ZYa2cvWmFwbVh2ZUVHZXBoR1BkQWVpY3dFM0NrSm90TXhqOE9HTkdiQld1?=
 =?utf-8?B?ZEw5eC9VZUNIRDhiY05sZ0NzUUxTRkZOMUkzcUVRY2p0cThwL2k0MEhjZ1pF?=
 =?utf-8?B?Y1lvamsrMDcxWVIrYTVwWldUbyt4Q2xMNjg2STRKV1ZvbityNGRNVEM5OUJP?=
 =?utf-8?B?d3NmRktwSlJOL2FsbFUrMCtueEtkZ0Myd0wwYStySUk0UTN1SmhPSEdzZVNO?=
 =?utf-8?B?ZzNVL3lvNms5ZGROMXZSdzRZVnZjVElQNExuVjY1OVByaHF5dUx6QjhVcmZ0?=
 =?utf-8?B?dE1WSWVMNVFGZmZlUEFVaDZuOHNHUU5tckNPVWlYeE1SOWx2UGVpUTF1Y1Ew?=
 =?utf-8?Q?hSwjMgb7rIBZbgKexHmQQxmeW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21181F3399E4D04497518B71E466E070@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 98cdc8c5-12c0-4844-119f-08db594f50ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2023 16:28:59.4304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9N0KW0E9kgVA3mqAKfESdU+cwLARaFnwBfn1rC11WSg2BVAm5RKu2HKTTWHVjCprPGC0AHUy7YRy3puSt0n8ycXHZkXWEm5CLbOSZ/rSofg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2087
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIwLzA1LzIwMjMgw6AgMTI6MzQsIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXTCoDoN
Cj4gDQo+IA0KPiBMZSAxOS8wNS8yMDIzIMOgIDIxOjI2LCBOYXZlZW4gTiBSYW8gYSDDqWNyaXTC
oDoNCj4+IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIG5hdmVl
bkBrZXJuZWwub3JnLiANCj4+IETDqWNvdXZyZXogcG91cnF1b2kgY2VjaSBlc3QgaW1wb3J0YW50
IMOgIA0KPj4gaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0N
Cj4+DQo+PiBSZWZhY3RvciBmdHJhY2UgY29kZSBhbmQgbW92ZSB0byB1c2luZyBmdHJhY2VfcmVw
bGFjZV9jb2RlKCkgdG8gaGVscA0KPj4gc2ltcGxpZnkgYW5kIG1ha2UgdGhlIGNvZGUgbW9yZSBt
YWludGFpbmFibGUuDQo+Pg0KPj4gLSBUaGUgZXhpc3RpbmcgZnRyYWNlLmMgY29kZSBpcyBtb3Zl
ZCB0byBhIHNlcGFyYXRlIGZpbGUgc28gdGhhdCBwcGM2NA0KPj4gwqDCoCBlbGZ2MSBhbmQgY2xh
bmcgLXBnIG9ubHkgc3VwcG9ydCBjb250aW51ZS4gVGhpcyBtYWtlcyBpdCBwb3NzaWJsZSB0bw0K
Pj4gwqDCoCBjb252ZXJnZSBwcGMzMiBhbmQgcHBjNjQgc3VwcG9ydCBmdXJ0aGVyLg0KPj4gLSBE
cm9wIGNvZGUgdG8gcmUtcHVycG9zZSBjb21waWxlci1nZW5lcmF0ZWQgbG9uZyBicmFuY2hlcyBm
b3IgZnRyYWNlDQo+PiDCoMKgIHVzZSBpbiBzdXBwb3J0IG9mIGxhcmdlIGtlcm5lbHMuIFdlIHN0
aWxsIHJldGFpbiB0aGUgZnRyYWNlIHN0dWJzIGF0DQo+PiDCoMKgIHRoZSBlbmQgb2YgLnRleHQs
IHNvIHdlIG5vdyBzdXBwb3J0IGtlcm5lbHMgdXB0byB+NjRNQi4NCj4+IC0gQWRkIGZ0cmFjZV9p
bml0X25vcCgpIHRvIGtlZXAgYm9vdC10aW1lIHZhbGlkYXRpb25zIGFuZCBpbml0IHNlcGFyYXRl
DQo+PiDCoMKgIGZyb20gcnVudGltZS4NCj4+IC0gSW1wbGVtZW50IGZ0cmFjZV9yZXBsYWNlX2Nv
ZGUoKSB0byBzaW1wbGlmeSBvdmVyYWxsIGZ0cmFjZSBzZXR1cC4gVGhpcw0KPj4gwqDCoCB3aWxs
IGJlIGVzcGVjaWFsbHkgdXNlZnVsIHdoZW4gYWRkaW5nIGFiaWxpdHkgdG8gbm9wIG91dCAnbWZs
ciByMCcNCj4+IMKgwqAgbGF0ZXIsIGFuZCBmb3Igb3RoZXIgc3Vic2VxdWVudCBmdHJhY2UgZmVh
dHVyZXMuDQo+PiAtIEFkZCBzdXBwb3J0IGZvciAtZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeS4g
T24gcHBjNjQsIHRoaXMgbmVlZHMgZ2NjDQo+PiDCoMKgIHYxMy4xIHNvIHRoYXQgdGhlIG5vcHMg
YXJlIGdlbmVyYXRlZCBhdCBMRVAuIFRoaXMgYWxzbyBtb3ZlcyBwcGMzMiB0bw0KPj4gwqDCoCB1
c2luZyB0aGUgc2FtZSB0d28taW5zdHJ1Y3Rpb24gc2VxdWVuY2UgYXMgdGhhdCBvZiBwcGM2NC4N
Cj4+DQo+PiBUaGlzIGFwcGxpZXMgYXRvcCBwYXRjaGVzIDEtMyBvZiBOaWNrJ3Mgc2VyaWVzIGZv
ciBlbGZ2MiBjb252ZXJzaW9uLCBhcw0KPj4gd2VsbCBhcyBOaWNrJ3MgcGF0Y2ggZW5hYmxpbmcg
LW1wcm9maWxlLWtlcm5lbCBmb3IgZWxmdjIgQkU6DQo+PiAtIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDIzMDUwNTA3MTg1MC4yMjg3MzQtMS1ucGlnZ2luQGdtYWlsLmNvbS8NCj4+IC0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwNTA2MDExODE0Ljg3NjYtMS1ucGlnZ2lu
QGdtYWlsLmNvbS8NCj4+DQo+PiBUaGlzIGJ1aWxkcyBmb3IgbWUgYW5kIHBhc3NlcyBhIHF1aWNr
IHRlc3QsIHBvc3RpbmcgdGhpcyBhcyBhbiBlYXJseQ0KPj4gUkZDLg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IE5hdmVlbiBOIFJhbyA8bmF2ZWVuQGtlcm5lbC5vcmc+DQo+IA0KPiBMb29rcyBnb29k
LCB3b3JrcyBvbiBQUEMzMiBidXQgSSBvYnNlcnZlZCBzb21lIHBlcmZvcm1hbmNlIGRlZ3JhZGF0
aW9uLCANCj4gYXJvdW5kIDI1JSBtb3JlIHRpbWUgbmVlZGVkIHRvIGFjdGl2YXRlIGZ1bmN0aW9u
IHRyYWNlciBhbmQgYXJvdW5kIDEwJSANCj4gbW9yZSB0aW1lIG5lZWRlZCB0byBkZS1hY3RpdmF0
ZSBmdW5jdGlvbiB0cmFjZXIgKGJ5IHdyaXR0aW5nIA0KPiBmdW5jdGlvbi9ub3AgaW50byAvc3lz
L2tlcm5lbC9kZWJ1Zy90cmFjaW5nL2N1cnJlbnRfdHJhY2VyLg0KDQoNCnBlcmYgcmVjb3JkIHdp
dGggeW91ciBwYXRjaCBhcHBsaWVkOg0KDQogICAgIDIwLjU5JSAgZWNobyAgICAgW2tlcm5lbC5r
YWxsc3ltc10gICAgICBba10gZnRyYWNlX2NoZWNrX3JlY29yZA0KICAgICAxNS43MSUgIGVjaG8g
ICAgIFtrZXJuZWwua2FsbHN5bXNdICAgICAgW2tdIHBhdGNoX2luc3RydWN0aW9uDQogICAgICA2
Ljc1JSAgZWNobyAgICAgW2tlcm5lbC5rYWxsc3ltc10gICAgICBba10gZnRyYWNlX3JlcGxhY2Vf
Y29kZQ0KICAgICAgNC4zMCUgIGVjaG8gICAgIFtrZXJuZWwua2FsbHN5bXNdICAgICAgW2tdIF9f
ZnRyYWNlX2hhc2hfcmVjX3VwZGF0ZQ0KICAgICAgMy45NiUgIGVjaG8gICAgIFtrZXJuZWwua2Fs
bHN5bXNdICAgICAgW2tdIA0KX19yYl9yZXNlcnZlX25leHQuY29uc3Rwcm9wLjANCiAgICAgIDMu
MjAlICBlY2hvICAgICBba2VybmVsLmthbGxzeW1zXSAgICAgIFtrXSBmdHJhY2VfZ2V0X2NhbGxf
aW5zdC5pc3JhLjANCiAgICAgIDIuNjIlICBlY2hvICAgICBba2VybmVsLmthbGxzeW1zXSAgICAg
IFtrXSBmdHJhY2VfZ2V0X2FkZHJfbmV3DQogICAgICAyLjQ0JSAgZWNobyAgICAgW2tlcm5lbC5r
YWxsc3ltc10gICAgICBba10gZnRyYWNlX3JlY19pdGVyX25leHQNCiAgICAgIDIuMTUlICBlY2hv
ICAgICBba2VybmVsLmthbGxzeW1zXSAgICAgIFtrXSBmdW5jdGlvbl90cmFjZV9jYWxsDQogICAg
ICAyLjA5JSAgZWNobyAgICAgW2tlcm5lbC5rYWxsc3ltc10gICAgICBba10gcmJfY29tbWl0DQog
ICAgICAxLjkyJSAgZWNobyAgICAgW2tlcm5lbC5rYWxsc3ltc10gICAgICBba10gcmluZ19idWZm
ZXJfdW5sb2NrX2NvbW1pdA0KICAgICAgMS42OSUgIGVjaG8gICAgIFtrZXJuZWwua2FsbHN5bXNd
ICAgICAgW2tdIHJpbmdfYnVmZmVyX2xvY2tfcmVzZXJ2ZQ0KICAgICAgMS42MyUgIGVjaG8gICAg
IFtrZXJuZWwua2FsbHN5bXNdICAgICAgW2tdIGNvcHlfcGFnZQ0KICAgICAgMS40NSUgIGVjaG8g
ICAgIFtrZXJuZWwua2FsbHN5bXNdICAgICAgW2tdIA0KZnRyYWNlX2NyZWF0ZV9icmFuY2hfaW5z
dC5jb25zdHByb3AuMA0KICAgICAgMS40MCUgIGVjaG8gICAgIFtrZXJuZWwua2FsbHN5bXNdICAg
ICAgW2tdIHVubWFwX3BhZ2VfcmFuZ2UNCiAgICAgIDEuMzQlICBlY2hvICAgICBba2VybmVsLmth
bGxzeW1zXSAgICAgIFtrXSBtYXNfbmV4dF9lbnRyeQ0KICAgICAgMS4yOCUgIGVjaG8gICAgIGxk
LTIuMjMuc28gICAgICAgICAgICAgWy5dIGRvX2xvb2t1cF94DQogICAgICAxLjIyJSAgZWNobyAg
ICAgW2tlcm5lbC5rYWxsc3ltc10gICAgICBba10gZnRyYWNlX2NhbGwNCiAgICAgIDEuMDUlICBl
Y2hvICAgICBba2VybmVsLmthbGxzeW1zXSAgICAgIFtrXSB0cmFjZV9mdW5jdGlvbg0KICAgICAg
MC45OSUgIGVjaG8gICAgIFtrZXJuZWwua2FsbHN5bXNdICAgICAgW2tdIGZ0cmFjZV9jYWxsZXIN
CiAgICAgIDAuODElICBlY2hvICAgICBba2VybmVsLmthbGxzeW1zXSAgICAgIFtrXSBmdHJhY2Vf
cmVjX2l0ZXJfcmVjb3JkDQoNCnBlcmYgcmVjb3JkIHdpdGhvdXQgeW91ciBwYXRjaDoNCg0KICAg
ICAyMi41OCUgIGVjaG8gICAgIFtrZXJuZWwua2FsbHN5bXNdICBba10gcGF0Y2hfaW5zdHJ1Y3Rp
b24NCiAgICAgMTcuODUlICBlY2hvICAgICBba2VybmVsLmthbGxzeW1zXSAgW2tdIGZ0cmFjZV9j
aGVja19yZWNvcmQNCiAgICAgMTEuNjUlICBlY2hvICAgICBba2VybmVsLmthbGxzeW1zXSAgW2td
IGZ0cmFjZV9yZXBsYWNlX2NvZGUNCiAgICAgIDYuNzYlICBlY2hvICAgICBba2VybmVsLmthbGxz
eW1zXSAgW2tdIGZ0cmFjZV9tYWtlX2NhbGwNCiAgICAgIDYuNjglICBlY2hvICAgICBba2VybmVs
LmthbGxzeW1zXSAgW2tdIF9fZnRyYWNlX2hhc2hfcmVjX3VwZGF0ZQ0KICAgICAgMy41MCUgIGVj
aG8gICAgIFtrZXJuZWwua2FsbHN5bXNdICBba10gZnRyYWNlX2dldF9hZGRyX2N1cnINCiAgICAg
IDMuNDIlICBlY2hvICAgICBba2VybmVsLmthbGxzeW1zXSAgW2tdIGZ0cmFjZV9nZXRfYWRkcl9u
ZXcNCiAgICAgIDIuMzYlICBlY2hvICAgICBba2VybmVsLmthbGxzeW1zXSAgW2tdIGNvcHlfcGFn
ZQ0KICAgICAgMS4yMiUgIGVjaG8gICAgIFtrZXJuZWwua2FsbHN5bXNdICBba10gX19yYl9yZXNl
cnZlX25leHQuY29uc3Rwcm9wLjANCiAgICAgIDEuMjIlICBlY2hvICAgICBsZC0yLjIzLnNvICAg
ICAgICAgWy5dIGRvX2xvb2t1cF94DQogICAgICAxLjA2JSAgZWNobyAgICAgW2tlcm5lbC5rYWxs
c3ltc10gIFtrXSBmdHJhY2VfbG9va3VwX2lwDQogICAgICAwLjczJSAgZWNobyAgICAgbGQtMi4y
My5zbyAgICAgICAgIFsuXSBfZGxfcmVsb2NhdGVfb2JqZWN0DQogICAgICAwLjY1JSAgZWNobyAg
ICAgW2tlcm5lbC5rYWxsc3ltc10gIFtrXSBmbHVzaF9kY2FjaGVfaWNhY2hlX3BhZ2UNCiAgICAg
IDAuNjUlICBlY2hvICAgICBba2VybmVsLmthbGxzeW1zXSAgW2tdIGZ1bmN0aW9uX3RyYWNlX2Nh
bGwNCg==
