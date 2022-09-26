Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D235EA842
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:20:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MblKd5yBJz3c4K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 00:20:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Copc37f8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.70; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Copc37f8;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120070.outbound.protection.outlook.com [40.107.12.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MblJr4kJqz2x9L
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 00:20:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDWquem12QhfUvdqEQxNPuxwhOBs0WQgPaqkGNf7I78Js71gmNQOdBRnruSKV8YR1hxQvvwUrjxdHqb5Jkuvl7gm2yN3LfcNCtD38OTLZsPKBB7OhhX0uK9/LI1q4AQftBaCyP4iUyDrUY2cevNusIhVyspv8sDGG/b5xG8OhUfFPVhCp1tWTP95kR3Zmr56KxgU9Bsc9pC3nRFZIDoqLjH8J0yAJ4Wz8dfIQq4YxbbrWEBIpeupCAtumjevLL6o/093OQptuvmpTNG4NDR0Nw9NAUqHpmTq8ZI2p+iYu1n0/64ZtnvDIhSPsjNz8gb7vjpMLdHOefzQc6pf0ttO2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2OxbT5R5YvHGeTYRUo5RbNeoi3HHdf5hkBLI/i72gQ=;
 b=elnuhMLd/JoxD47yRNixN+CAFFMLER8++/R5oVaqBhgVPyyqDrgjGuwMS+Wmd9qEo+Dba+085r/4QT0for+fLd5LKqHyF2dD1W2EqY6LGFPXTuz0+79zf9zrx2eo2NalxXJEeDc8L1AkBjTGUXJ9oX0uwE0//6O9AyrwyiC5r2BQ7cmGYXx52rN1VL3tXACzslY+ywQNCJ7lX4ZMrB10n6RGwJj5uMe8k0KrTNu9Uw45Ws8jAayO2mQe/oYD4MF/CMoNjrjqAENcu0IexAE66nONg2YbLDVVqLMm+fCv0nHgWbZSrJySpDYAPh6SeITHpJAQ9vrynB2vC8DQNanbRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2OxbT5R5YvHGeTYRUo5RbNeoi3HHdf5hkBLI/i72gQ=;
 b=Copc37f8mUWSljq141mpuxmC+jtXR020huFQIg5zBs+6kTv0IWtKG6kSYz6aqEvnGxxKNbl4uT/tQ5k15NQkaLY9N0YD1ksUIop/b0sMJR2jhKStNqzMRM50fkwo+1wpHyvzSsHs2AfRz1EIHvkDCNIPP5xJ4jCUM7nMzq2vPS5GzI3Jx4SNEKKXi7+vffyS0UIATKqAw/XSv0abD9RHh9v6bW6rk+WOk6ajJZEOaF5cWGN/GIBrUQNDWX1E3AtMVHMipss+hYS/YsW9JXktB+R3EAM5FxKg5IArcf2l9vU+8XdDOCmVaL7gM8MSg81deKs3AX93Lr8Da2JQZuFjJQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2918.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Mon, 26 Sep
 2022 14:19:51 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%5]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 14:19:51 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 0/6] Out-of-line static calls for powerpc64 ELF V2
Thread-Topic: [PATCH v2 0/6] Out-of-line static calls for powerpc64 ELF V2
Thread-Index: AQHY0XNfMj4f6w6V/k2SBTvbDLei+a3xwywA
Date: Mon, 26 Sep 2022 14:19:51 +0000
Message-ID: <867c18f0-837a-1a74-fc1a-19a18ec2eb93@csgroup.eu>
References: <20220926064316.765967-1-bgray@linux.ibm.com>
In-Reply-To: <20220926064316.765967-1-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2918:EE_
x-ms-office365-filtering-correlation-id: 6073754b-c72f-4a8a-1490-08da9fca2d30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hNxuhu+BRAQEhwMFq6nD/alut+2Hq5ATiwx/olVj1EByfck9D9SQ/+l3wQtXSSIpAsYPDXgggRrMf2orQu6hkaCY71gDHgxd0ZG05/wNNZ7JYsJAQQ4KHUhz0M6mWJ5mebVDuU0OUPcXljuxtVNsUWjt7YQqX+bB9Ixxwo/5AV9afLLLPhri3OFMG2v1807jzmUJbBeLyHoZvOOebfJySY5D5SEdjEINM31GdFV32/px7qiL7Cwb4UPH9QOjzIj9ay/WR0/A0DI2QLdj39K86C3oeZbNHdsyzjsvi3edXpiBmL6FjfTqIIC5qTI9nEvTaVkmCYONhY+NYn0HvAdYa0Hl5bsB/JUsmAlvvYTQWZD3LZqNp2+liBILLLkCG9Idi2pSFeMRiZUGsFFI8NAqi0PfzxrlOPkrtaXaLQkj61+/0XJrThRep5yRB2nnGKGuG/OQfZWqBr2Avp1IpjEnqT+d6I3ewWuPRcaJMVARkutpJ8uOLsWcUEuqjtjaPG0bhu6X0+nTuuUuxmCitHXmlqIDs4qtlUIefCKIx6QMolEXTAnZHAsyeDtsc369pOhlPZ9NdZe9eg1PjzE3v2X+5obYL4RI4d1KYdJU6xLVdBaI2AAKyyHBRN8F3DMPbmaEpR2RGxV+8tL8MXLVTovECvf9C2IlwqFJqMBUuMAkypJg4Djq1zbNCiJYbqiY17l5OBK0ALasFy94vOGLbcloO7Jnl2Kv6WfeI08TJbOsVCDHyQa+IkmdsqM/0HeNQl+zfJOnTy1TEiTYj4rF6yVtLZE2kfq9f7cOZif2hjRk4QTUXr/7XN9nAxMUftLu6P7Spr4fjEAUsp5kC30EWBl5+YZHD78AK6wh2ZsfnUkNbhA=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(39850400004)(366004)(451199015)(186003)(2906002)(66574015)(83380400001)(2616005)(38070700005)(122000001)(38100700002)(36756003)(86362001)(31696002)(91956017)(76116006)(66476007)(66446008)(64756008)(66946007)(66556008)(478600001)(8676002)(54906003)(110136005)(316002)(6486002)(966005)(4326008)(8936002)(6506007)(44832011)(26005)(6512007)(7416002)(71200400001)(5660300002)(41300700001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bDJiYTFJV2NCcUdrLzVDdXdKbkxacURjNFMyWXlvdmtNVVhURGdOekRLV2JK?=
 =?utf-8?B?RmFhM3FSclVMNjdCK2lQMmhiZU1KS001ZVZFMkEvSGpYS0h1VTEzZnk3SmdC?=
 =?utf-8?B?bW5BYzNCTnNkeWhsZkZlQS9VREEwUG00dnYrTU5JcStSakhvWDhZNXBQUCtK?=
 =?utf-8?B?NjByYWM1VTJJNFN2THBuRXJiNWVuQnpsRk9kQkFJTjB3ejNzUTdETzVSSVhB?=
 =?utf-8?B?Nmp1TzVCc21wU252OE1PMnpMUUM4RitIOVNTbWVQa0dTY2pTV1V4aTZ4cUdh?=
 =?utf-8?B?WnNlQjEyUzFPQkx4TE1YbE9qT0VINDM3b2phK0pwVkJpbGM1UDJNMDNvVVRX?=
 =?utf-8?B?UTc4alFGSVVHT0ZFUU9TL2dJWHVzdVFIRUg2dzRPTFlkOVBETUg2YzJlS2pl?=
 =?utf-8?B?N2w2NEJudWhaWERRc1VtT2xoYUsyYzJPcnBmcmhxMWVNVWIvZzNPRTVYWHNJ?=
 =?utf-8?B?MFBjV3U0WnpwNFF3Wi9tZWk0WFNlZU5FREVVZmFzL0FJVnVjaDl6RFhqbXlK?=
 =?utf-8?B?b3JSdmh1cm9xWTU2REJ6blk0ZFRYYmg2K1VzVU9sVm5qWHZ1cWx5STRuRzJH?=
 =?utf-8?B?VTBUMXhWSFY3U29TcWdtdXJ3TmtqNXNTTk90K041L0twVExiVVR1RjEwMHcx?=
 =?utf-8?B?VXF3YUhnU0lGUUd6SlQwZndYY3pUZmpxcG9xTy9RdnR4bUlYdjUySzhyMDM0?=
 =?utf-8?B?b3FzMDNrQmRrNUIyZVVpRjBQczZVOEl6K2dpa2tvM0dpMnNSSS8xdUUrMWh6?=
 =?utf-8?B?akNqZVh3ViszdGE3M0xkMVJFaVNBb2RqQnV6aHJlaWFXaEpsYXZGd0lxN1FW?=
 =?utf-8?B?aVlCc3dhVXh0dS92NHNDSGxGY2VpRDdMN251K1crMnpHekRyaWkzNXJiZkQy?=
 =?utf-8?B?MmJWMkM4amxpNWVBcHdXWE9kZlM3Mkh6eURBdHgyeWM5U1BpeTJ6MVdNd0xE?=
 =?utf-8?B?STRPVG9kMml1ZlVOVlVaSEVHcHNlYnlENkhmbEVWdnZ0U1NGSzBpT3NnYnhS?=
 =?utf-8?B?SEEzbERZWHdlZjJSd2JJMFgwRXFqYXJqTUg1eXZqRUZEUmhqWVVSN3htTmhD?=
 =?utf-8?B?d3AzQU1sZCsrY0tVSUw1R21vK0NqN1FYbFpJK3pLTGhYVy9RaTZ1OXAzT2o0?=
 =?utf-8?B?Mk1KYi9BTUlGV0tFY084ejZQSityYUNGdGJBZTZWczY3K0twU01ONC9pcjRF?=
 =?utf-8?B?WUdDS2ljVkprZEJHVWJDZy85TVZWWnlrbGVuUG9WK0lZeHgzRFp2Mm1aSE5U?=
 =?utf-8?B?Y24wRFdnNzZGSGhjSWtrVE44ZENzYm9jSlhhOWgzSWNIT2FUTURZUUxpZU1I?=
 =?utf-8?B?bkhYcWZOdUhTaVRUck0xUy9IQjVPVG12K1FiNVRMelNJenJqRmFBNlprc2ZT?=
 =?utf-8?B?dVFWRnU3a01uWHJXOUtlOWdTelVMVjdSOS9GTlAvK05aTFdUVDJncFFVVzlO?=
 =?utf-8?B?RzJMRy9zL3VzcGZOcWtNNGZvUTNXTE1TZnVaMklKWUdHenpDOVVTb3E1d2NE?=
 =?utf-8?B?R0hpQkh0K0xhRkZuNmE2R29NOGZZNUVpRWhJUXVpTnMvQ1hVZU5NaDFEMFYr?=
 =?utf-8?B?UjkvYXYvNFJ4bHVydmlxVCt6bi9nT2VCUDZyaWkvejRobnJyR2dzMWpja2Yx?=
 =?utf-8?B?YmIyRm1BYmoxZHY5bGJBWG13Y0orcFR6cWEwVkZTVXhxYjZwalZiNVVYTFlx?=
 =?utf-8?B?azZtQUxMZEpQRS8rSFpiUHU0Yi9vVVBBYmdjQ3AyVmhtbkpKbEZJMkVUaUlY?=
 =?utf-8?B?Qm5lelRRSnRPMHBTUnhOTUtiZnNSNk94YzR0M0o3dmNhRFFOY0c4eWltQXBy?=
 =?utf-8?B?WkpuanFqM3l1RTAwZVI0anhObWRMTjJaRDlaZ1crWU1JWGF2NkJMeFVXK1Zq?=
 =?utf-8?B?SkdSM2ZTeFdvZ0lOeGFvU2Z5RTk5eG9MVGx1Ry9mWmZMN3BucUl6djFESm5W?=
 =?utf-8?B?a1FGeUdNYkhuTUpJY29UTmJNZU0yRHZ3QTBQK0FxRVRickFuT2dtYkwzdVVh?=
 =?utf-8?B?d0hLRUF6dk95cEJIUmcvR0J3cmVoNFlkbDFSMkpLeGRiR0xiWlJLc1V0ZzRK?=
 =?utf-8?B?MkJtaUxJS3pibWVmWXBNOEdXSFpza0JNUVlwT3lHTkI1M0lndlhSWHZ2ZDE4?=
 =?utf-8?B?ZUNUbS80cFMwRm85aWZkeG9GK1dOaE9oMlFnNG9YTXhJVGxmQlBGdHNJcytJ?=
 =?utf-8?Q?p7N7MFZ/QBut4GHypJBa1wY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8795239A823B5140A9EE2D36FE08471F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6073754b-c72f-4a8a-1490-08da9fca2d30
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 14:19:51.6057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ETruPHR207PFVko/Dvnl4Z9S9J6qOeE6Ni6LSmqOQoLRaajGG3I2YyqaLtJINJ93FWZCb3vlw1+RE6pxM4rg0STDufrB+NaC0bOrFR3G2Qo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2918
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI2LzA5LzIwMjIgw6AgMDg6NDMsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
SW1wbGVtZW50YXRpb24gb2Ygb3V0LW9mLWxpbmUgc3RhdGljIGNhbGxzIGZvciBQb3dlclBDIDY0
LWJpdCBFTEYgVjIgQUJJLg0KPiBTdGF0aWMgY2FsbHMgcGF0Y2ggYW4gaW5kaXJlY3QgYnJhbmNo
IGludG8gYSBkaXJlY3QgYnJhbmNoIGF0IHJ1bnRpbWUuDQo+IE91dC1vZi1saW5lIHNwZWNpZmlj
YWxseSBoYXMgYSBjYWxsZXIgZGlyZWN0bHkgY2FsbCBhIHRyYW1wb2xpbmUsIGFuZA0KPiB0aGUg
dHJhbXBvbGluZSBnZXRzIHBhdGNoZWQgdG8gZGlyZWN0bHkgY2FsbCB0aGUgdGFyZ2V0Lg0KPiAN
Cj4gUHJldmlvdXMgdmVyc2lvbiBoZXJlOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyMjA5MTYwNjIzMzAuNDMwNDY4LTEtYmdyYXlAbGludXguaWJtLmNvbS8NCj4gDQo+IEkgY291
bGRuJ3Qgc2VlIGEgZGVkaWNhdGVkIGZ0cmFjZSBiZW5jaG1hcmsgaW4gdGhlIGtlcm5lbCwgYnV0
IG15IG93bg0KPiBiZW5jaG1hcmtpbmcgc2hvd2VkIG5vIHNpZ25pZmljYW50IGltcGFjdCB0byBm
dHJhY2UgYWN0aXZhdGlvbi4NCg0KSSB1c2UgdGhlIGZvbGxvd2luZyBoYWNrIGZvciBiZW5jaG1h
cmtpbmc6DQoNCmRpZmYgLS1naXQgYS9rZXJuZWwvdHJhY2UvZnRyYWNlLmMgYi9rZXJuZWwvdHJh
Y2UvZnRyYWNlLmMNCmluZGV4IDQzOWUyYWI2OTA1ZS4uZTdkMGQzZGViOGJmIDEwMDY0NA0KLS0t
IGEva2VybmVsL3RyYWNlL2Z0cmFjZS5jDQorKysgYi9rZXJuZWwvdHJhY2UvZnRyYWNlLmMNCkBA
IC0yNjI4LDEwICsyNjI4LDExIEBAIHZvaWQgX193ZWFrIGZ0cmFjZV9yZXBsYWNlX2NvZGUoaW50
IG1vZF9mbGFncykNCiAgICAgICAgIGJvb2wgZW5hYmxlID0gbW9kX2ZsYWdzICYgRlRSQUNFX01P
RElGWV9FTkFCTEVfRkw7DQogICAgICAgICBpbnQgc2NoZWR1bGFibGUgPSBtb2RfZmxhZ3MgJiBG
VFJBQ0VfTU9ESUZZX01BWV9TTEVFUF9GTDsNCiAgICAgICAgIGludCBmYWlsZWQ7DQorICAgICAg
IGludCB0MDsNCg0KICAgICAgICAgaWYgKHVubGlrZWx5KGZ0cmFjZV9kaXNhYmxlZCkpDQogICAg
ICAgICAgICAgICAgIHJldHVybjsNCi0NCit0MCA9IG1mdGIoKTsNCiAgICAgICAgIGRvX2Zvcl9l
YWNoX2Z0cmFjZV9yZWMocGcsIHJlYykgew0KDQogICAgICAgICAgICAgICAgIGlmIChyZWMtPmZs
YWdzICYgRlRSQUNFX0ZMX0RJU0FCTEVEKQ0KQEAgLTI2NDYsNiArMjY0Nyw4IEBAIHZvaWQgX193
ZWFrIGZ0cmFjZV9yZXBsYWNlX2NvZGUoaW50IG1vZF9mbGFncykNCiAgICAgICAgICAgICAgICAg
aWYgKHNjaGVkdWxhYmxlKQ0KICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmRfcmVzY2hlZCgp
Ow0KICAgICAgICAgfSB3aGlsZV9mb3JfZWFjaF9mdHJhY2VfcmVjKCk7DQordDAgPSBtZnRiKCkg
LSB0MDsNCitwcl9lcnIoIiVzOiAlZFxuIiwgX19mdW5jX18sIHQwKTsNCiAgfQ0KDQogIHN0cnVj
dCBmdHJhY2VfcmVjX2l0ZXIgew0KDQoNCj4gDQo+IFRoZSBfX3BhdGNoX21lbW9yeSBmdW5jdGlv
biBpcyBtZWFudCB0byBiZSBhY2Nlc3NlZCB0aHJvdWdoIHRoZSBzaXplIGNoZWNraW5nDQo+IHBh
dGNoX21lbW9yeSB3cmFwcGVyLiBJIGRvbid0IHRoaW5rIHRoZXJlJ3MgYSB3YXkgdG8gZXhwb3Nl
IHRoZSBtYWNybyB3aXRob3V0DQo+IGFsc28gZXhwb3NpbmcgX19wYXRjaF9tZW1vcnkgdGhvdWdo
LiBJIGNvbnNpZGVyZWQgbWFraW5nIHRoZSB0eXBlIGFuIGV4cGxpY2l0DQo+IG1hY3JvIHBhcmFt
LCBidXQgdXNpbmcgdGhlIHZhbHVlIHR5cGUgc2VlbWVkIG1vcmUgZXJnb25vbWljLg0KPiANCj4g
VjI6DQo+IE1vc3RseSBhY2NvdW50aW5nIGZvciBmZWVkYmFjayBmcm9tIENocmlzdG9waGU6DQo+
ICogQ29kZSBwYXRjaGluZyByZXdyaXR0ZW4NCj4gICAgICAtIFJlbmFtZSB0byAqX21lbW9yeQ0K
PiAgICAgIC0gVXNlIF9fYWx3YXlzX2lubGluZSB0byBnZXQgdGhlIGNvbXBpbGVyIHRvIHJlYWxp
c2UgaXQgY2FuDQo+ICAgICAgICBjb2xsYXBzZSBhbGwgdGhlIHN1Yi1mdW5jdGlvbnMNCj4gICAg
ICAtIFBhc3MgZGF0YSBkaXJlY3RseSBpbnN0ZWFkIG9mIHRocm91Z2ggYSBwb2ludGVyLCBlbGxp
ZGluZyBhIHJlZHVuZGFudCBsb2FkDQo+ICAgICAgLSBGbHVzaCB0aGUgbGFzdCBieXRlIG9mIGRh
dGEgdG9vICh0ZWNobmljYWxseSByZWR1bmRhbnQgaWYgYW4gaW5zdHJ1Y2lvbiwgYnV0DQo+ICAg
ICAgICBzYXZlcyBhIGNvbmRpdGlvbmFsIGJyYW5jaCArIHRoZSBpc3luYyB3aWxsIGJlIHRoZSBi
b3R0bGVuZWNrKS4NCj4gICAgICAtIEhhbmRsZSBhIG5vbi1jb2hlbnJlbnQgaWNhY2hlLCBhc3N1
bWUgYSBjb2hlcmVudCBkY2FjaGUNCj4gICAgICAtIEhhbmRsZSB3aGVuIHdlIGRvbid0IGFzc3Vt
ZSBhIDY0IGJ5dGUgaWNhY2hlIG9uIDY0LWJpdHMNCj4gICAgICAtIEZsYXR0ZW4gdGhlIHBva2Ug
YWRkcmVzcyBpbml0IGFuZCB0ZWFyZG93bg0KPiAgICAgIC0gQ2hlY2sgdGhlIGRhdGEgc2l6ZSBp
biBwYXRjaF9tZW1vcnkgYXQgYnVpbGQgdGltZQ0KPiAgICAgICAgKGlubGluZSBmdW5jdGlvbiB3
YXMgc3VnZ2VzdGVkLCBidXQgYSBtYWNybyBtYWtlcyBjaGVja2luZw0KPiAgICAgICAgIGJhc2Vk
IG9uIHRoZSBkYXRhIHR5cGUgZWFzaWVyKS4NCj4gICAgICAtIEl0IGJ1aWxkcyBub3cgb24gMzIg
Yml0IGFuZCB3aXRob3V0IHN0cmljdCBSV1gNCj4gKiBTdGF0aWMgY2FsbCBlbmFibGluZyBpcyBu
byBsb25nZXIgY29uZmlndXJhYmxlDQo+ICogUmVmYWN0b3JlZCBhcmNoX3N0YXRpY19jYWxsX3Ry
YW5zZm9ybSB0byBtaW5pbWlzZSBjYXN0aW5nDQo+ICogTWFkZSB0aGUgS1VuaXQgdGVzdHMgbW9y
ZSByb2J1c3QgKHByZXZpb3VzbHkgdGhleSBjaGFuZ2VkIG5vbi12b2xhdGlsZQ0KPiAgICByZWdp
c3RlcnMgaW4gdGhlIGluaXQgaG9vaywgYnV0IHRoYXQncyBpbmNvcnJlY3QgYmVjYXVzZSBpdCBy
ZXR1cm5zIHRvDQo+ICAgIHRoZSBLVW5pdCBmcmFtZXdvcmsgYmVmb3JlIHRoZSB0ZXN0IGNhc2Ug
aXMgY2FsbGVkKS4NCj4gKiBTb21lIG90aGVyIG1pbm9yIHJlZmFjdG9yaW5nIGluIG90aGVyIHBh
dGNoZXMNCj4gDQo+IA0KPiBCZW5qYW1pbiBHcmF5ICg2KToNCj4gICAgcG93ZXJwYy9jb2RlLXBh
dGNoaW5nOiBJbXBsZW1lbnQgZ2VuZXJpYyB0ZXh0IHBhdGNoaW5nIGZ1bmN0aW9uDQo+ICAgIHBv
d2VycGMvbW9kdWxlOiBIYW5kbGUgY2FsbGVyLXNhdmVkIFRPQyBpbiBtb2R1bGUgbGlua2VyDQo+
ICAgIHBvd2VycGMvbW9kdWxlOiBPcHRpbWlzZSBuZWFyYnkgYnJhbmNoZXMgaW4gRUxGIFYyIEFC
SSBzdHViDQo+ICAgIHN0YXRpY19jYWxsOiBNb3ZlIHN0YXRpYyBjYWxsIHNlbGZ0ZXN0IHRvIHN0
YXRpY19jYWxsX3NlbGZ0ZXN0LmMNCj4gICAgcG93ZXJwYy82NDogQWRkIHN1cHBvcnQgZm9yIG91
dC1vZi1saW5lIHN0YXRpYyBjYWxscw0KPiAgICBwb3dlcnBjLzY0OiBBZGQgdGVzdHMgZm9yIG91
dC1vZi1saW5lIHN0YXRpYyBjYWxscw0KPiANCj4gICBhcmNoL3Bvd2VycGMvS2NvbmZpZyAgICAg
ICAgICAgICAgICAgICAgIHwgIDEyICstDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Nv
ZGUtcGF0Y2hpbmcuaCB8ICAgOCArDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3N0YXRp
Y19jYWxsLmggICB8ICA4MCArKysrKysrLQ0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvTWFrZWZp
bGUgICAgICAgICAgICAgfCAgIDQgKy0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL21vZHVsZV82
NC5jICAgICAgICAgIHwgIDI3ICsrLQ0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvc3RhdGljX2Nh
bGwuYyAgICAgICAgfCAxNTEgKysrKysrKysrKysrKy0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVs
L3N0YXRpY19jYWxsX3Rlc3QuYyAgIHwgMjUxICsrKysrKysrKysrKysrKysrKysrKysrDQo+ICAg
YXJjaC9wb3dlcnBjL2tlcm5lbC9zdGF0aWNfY2FsbF90ZXN0LmggICB8ICA1NiArKysrKw0KPiAg
IGFyY2gvcG93ZXJwYy9saWIvY29kZS1wYXRjaGluZy5jICAgICAgICAgfCAgOTAgKysrKystLS0N
Cj4gICBrZXJuZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsNCj4g
ICBrZXJuZWwvc3RhdGljX2NhbGxfaW5saW5lLmMgICAgICAgICAgICAgIHwgIDQzIC0tLS0NCj4g
ICBrZXJuZWwvc3RhdGljX2NhbGxfc2VsZnRlc3QuYyAgICAgICAgICAgIHwgIDQxICsrKysNCj4g
ICAxMiBmaWxlcyBjaGFuZ2VkLCA2ODIgaW5zZXJ0aW9ucygrKSwgODIgZGVsZXRpb25zKC0pDQo+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcG93ZXJwYy9rZXJuZWwvc3RhdGljX2NhbGxfdGVz
dC5jDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcG93ZXJwYy9rZXJuZWwvc3RhdGljX2Nh
bGxfdGVzdC5oDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGtlcm5lbC9zdGF0aWNfY2FsbF9zZWxm
dGVzdC5jDQo+IA0KPiANCj4gYmFzZS1jb21taXQ6IDNkN2ExOThjZmRiNDc0MDVjZmI0YTNlYTUy
Mzg3NjU2OWZlMzQxZTYNCj4gLS0NCj4gMi4zNy4z
