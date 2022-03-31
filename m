Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA044ED53C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 10:11:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTbbr2VPHz2yQ6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 19:11:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::609;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::609])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTbbL1FtLz2x98
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 19:10:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwFme1kQXH3RPbXeuvAa/yRTLF+bOIfKooTt81EBioJg6sjiFQ3vgGwcfdxE5n2VJziAn6rnyYLTYDwBduK8PG4wSZi8cwWMPWrThM6aSdlldf1ccF1Lofnib5f76CXpjkTuSBlo4lTh76LIntij/8LdFYb6LD8AIqfW/ULucw0eK7Vu/FLt8J36hbeFq5Nx5v3BWsJ3vx4lPqDzMpdMK5W6uwk1FY15IlhgoHpCxw0Ix4HCjJqDcJSR8mhSDvzm1AA/dwqD7ei3lPuy+mFQ1M0gEtPx24uBelCtLEVAvmpLn82bKE9IwdDCFLJzYKBGTIPhv8CHxR1HN+mfNfFQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dP4Ss7y5zdmvftj/6iNAP9d8whG4qhRibjmFLI2k8qo=;
 b=Lej/XTEaz13NBysXX6b8ZwxU7Aq90e9N7BFphMtK+rZNhca9aUg9CyV4xoCKYJpYlsfXMnRdnCazeOFEtIDYzrsEIP58Oj8rkdCajRO2t6nPyUKLIhCBWG/qM00it3beUU/TKY9+INtqxiSzg/t6Pv47TdZ58rDYwBaMAGwEvqx8pVwNp1Qr8V0vs7uR/r5ZIxCpnCu9RDC09GYM48JgNyVBO2J8tNGHnlo/fDPe8Jcj/pKOhYRkyalf5L4ccv0bUlICTYYHwaKLK9DILdBPlJvcJIbGH0jdBqsKdKMpdKgp0RULj/1W7hHeCGXixlnix57+WD3gs3jS2sRB+g/Qxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2859.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:18::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 08:10:29 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::59c:ae33:63c1:cb1c%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 08:10:29 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC PATCH v1] objtool: Use target file endianness instead of a
 compiled constant
Thread-Topic: [RFC PATCH v1] objtool: Use target file endianness instead of a
 compiled constant
Thread-Index: AQHYRNRKJ6ALQybCh0KTwMUAnhSTmazZI0gAgAAAnoA=
Date: Thu, 31 Mar 2022 08:10:29 +0000
Message-ID: <2c2bcb5f-e9bd-d7fc-effd-81aed6bd27e6@csgroup.eu>
References: <7c503552c4bc1f0e1aa4775765f8f24e9d1b0a04.1648713067.git.christophe.leroy@csgroup.eu>
 <20220331080814.GQ8939@worktop.programming.kicks-ass.net>
In-Reply-To: <20220331080814.GQ8939@worktop.programming.kicks-ass.net>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43107699-98ee-4b71-e337-08da12edebbf
x-ms-traffictypediagnostic: MRZP264MB2859:EE_
x-microsoft-antispam-prvs: <MRZP264MB2859E89F5DC3FC3D27C5E89CEDE19@MRZP264MB2859.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fZPDkVMNiXscxovzfjnC8XrrPK3QXksWZ/Ph8tNFbz2KXT7yq0uD0Ymi85MMTShQNAs9nUmTNS/xjDhWzAfWHtnw1kMEoyD3JQ8eV3JoW/FTwCcbseG/0ZVsD5svG7xo5816ajJXCwGyXTcZjG/uFBhOpuUXuAelLdA/IgkxMiPj3pZiWKuz+41e5s1CwjLNrjfsLGRax/E/hYg9iaFth+vdVUOqAYux80ar80U+NQ2cLSLWry4R8NRMcKWZQ2jOp489xtJUcP7g6ObgR+hq4cPrv/Grx29ro8cL3Jr3GgTozCc90x9jZdZ1u363y63lNFQJEKJ+BO+Ghc4lmuHDnJz4Y1hQ0pTPsiLCcFIFzCEIDyrTCpwyKIDTEHPA3pbp3D7eu2M/6iVj3uTiy844d7SzXCXlLXGJ1jk3MBknR6/0KUZ2Rrtq12jIAg4p/8EvcC9GMWilge38G9SKgt40c7PCT1vQjIkCryCu+FrWpajUBnPL1Oda9gC97OXju3PQpE9DNRx1LYLTiGFA7L1d6OT0j75XgWahKo7CeAyX8oicc400viwsdCgeFIEDwoGh3sDeTRmpVNFTOlIqlN5OzjauBI/pV6QA6MuzLxhQWX5W/dXTPUULcwWAOaMC0uHT5O8xeRHOg52CcxIrXy0ua2xN5wIofHsqns2U+bewXOs1k0Le1wsPvg5efSdyWTn6MCwIWjw3HcKw1IF/I5TrmxfyZGVrWv6eajfTxqzBqNQVlG5QAUrJy7lhiPuLi8IfBrYZOAsxIq1mbE65aCqTkg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(38100700002)(122000001)(66574015)(38070700005)(316002)(6506007)(91956017)(2616005)(71200400001)(54906003)(31686004)(86362001)(6486002)(6916009)(508600001)(76116006)(44832011)(2906002)(6512007)(66476007)(26005)(8676002)(4326008)(186003)(66946007)(66446008)(5660300002)(8936002)(36756003)(31696002)(66556008)(64756008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDc4WEZqaUxtRWFrRFVWRVd1SCs3ZXR0Yk43d0pMT2tnZE91MG5wV1E0QmhM?=
 =?utf-8?B?RWgyWm9KL3FWZklIOTNwbFZpS2RES0tVTGNRak1UYkMwclRYeElwNWF1a0kx?=
 =?utf-8?B?VThmY3RFVHFDVlZXblRQT2pvbzBKcjd6cWFrQ1dTSGFnZFlONnJiRW5sL2Vj?=
 =?utf-8?B?SiswMFpXWDJsK1lxcG4xeExpNWxpZGw0eE9xM1dvVFY3S2plNlFwZy9DS3NV?=
 =?utf-8?B?cDRKT3BPeHVNMkJnMXhvbDV3RDRrMDYvNzcrbUhOaXZqbVB4L3JSeEV3K2Fm?=
 =?utf-8?B?WHVOUDk0Q3hwL0Q1eGhlTnFqNEhUWXg4TzEyNkZPRHNaSXpFOS9yTE5aZEFp?=
 =?utf-8?B?V0dRVXNiRWM1WUYvU3FIRVBWSkhIR3E1bm83R2hlMGphYW5tME9aMHBacmVP?=
 =?utf-8?B?UEROOUpyVTFOa25QMW5lRTJvQWdVK2FYdUhZNCs3a2l1Zm9xK2NHQndqVmpi?=
 =?utf-8?B?WVg4ckFxaFZ3VzNpNnJLNlN1ME94RXhZa0E5NGdaeWFIT0psU20rWGw5MmxS?=
 =?utf-8?B?UUlUWEh6OXExdkJ3MlIzV3huNjhJY2ZaUldTejhBYlU1OGhMdWhJYXpwL3V2?=
 =?utf-8?B?cnlvR1o5eTNuWmtFZk1LR3dybExBSFhReVgvUFk1c2JXWGVtSUlGSnU3dHZN?=
 =?utf-8?B?SzdlUFBSajNCdzR4eHJ4NXZnQnNxOXVmeVNuV0lObG1HeHZqSnc4RGtweGpC?=
 =?utf-8?B?R1NJcENqRmRzNWlVbXlZc3JjcnBnUnA2Y0x6QmtVdVE2aFdEeEJJSW5RazFZ?=
 =?utf-8?B?elRQdFZMaWFZZUNseTFadk5NZkV6K1hNWTlveG9RMjV1c2E3TnB5SHNXLzlC?=
 =?utf-8?B?bGFwWGVwVlcxaVJKNFYweG9mWVJ3TTNOOFNoQzlGa29naVErS2VnSTFPQ0lr?=
 =?utf-8?B?MWx1K1luekxORzZ3VmZ2bkR5eUlNcjFKT3dJSE9HK0MzYzladEJtMUhyZXNp?=
 =?utf-8?B?eGsxaU5sMkVZTVlneUxYRHk0YlpBaldXeUhua01ubXZKaldyVmpla0lheWg1?=
 =?utf-8?B?OU9KWjcwREJGYmRlT3lxN1FjUGFqSE5aVDJwUDAydGIrNmVOYnFwbVpobUVE?=
 =?utf-8?B?QmVBTGdocWMyNlRSL2JFdHp1V2VFV1VaamFWTllLeVhsUnlwbjhWM0duS01j?=
 =?utf-8?B?ZlJkMStEQ3dSWkNkRGVRQ09JNUtTb0ZhTXVjc2h3c0MydXRkaWIvKy9GVE16?=
 =?utf-8?B?cEtTd2dIdkRhYWJYRjJiVXZrRGlPT2RpbUh1TU95VFpmNDN1VE1TcGJCMlBl?=
 =?utf-8?B?NFAvQjZFdlNOellzVHMxUlpXQXpEcjZNS0FXZEZyRDRwcmZzYTdGOWx0QS9I?=
 =?utf-8?B?a0RzNDhla25pTURQTlYrQ0lMNXNUZVpVZEpvZ2VkZjhKbS9MT3U5QzVZSWZZ?=
 =?utf-8?B?cDR3eTloNm4xSjJ0dm1rcXcwSXBWVW5jZWlJNDdkRWw3bDlXdENtNTVqSnFo?=
 =?utf-8?B?YXYycUdpclllSW8vUHhWZVlVRkRwSSsrdE03djZZUWhvVDNEcFVsNFBYaERj?=
 =?utf-8?B?NzlmTlQzVmxuc3UwbDlpSjA0U3NDQ3llajRVVWdzZ0N2VWFBdGk2bTdUaUpV?=
 =?utf-8?B?MHhoN0IwS2lvT0hTTW9SbWVEUElpa1RzTENvSSs1Zlo3SEJZU041WFFGNWxY?=
 =?utf-8?B?WVNsdVBENzlyQXRjL0xuZE4yZEZoN3pnUWxOand4Y2RqRU1tbDlaaUNwYy8z?=
 =?utf-8?B?ZWtCMFNPd05hNWw5ZnZ0cXdoNStjR1lDaXNyQ1d3L0paRTE4c1kwQkRKU3VZ?=
 =?utf-8?B?WjI1U25LYjRuRmVaN2dsZ0NGOFBVMVM4NzVFN1lFd1FBanFWaUVpbExLam9T?=
 =?utf-8?B?MkxORFFOcml2ZG8vU1BTMEZiY040aWxnVXZiVEdmb2V1eFFOaFZvVE9BMGgw?=
 =?utf-8?B?MFMyRXdUYldZMzRqMVZPMnRPV1dsYUtpblJJRGlSayt3dFl5dkZja09VZmlU?=
 =?utf-8?B?TFJ3QitvbUdSNEVWbWVVbWRuVzQrUHVVY0dFeklKSE14eG9VbXZ4ZStCd0dE?=
 =?utf-8?B?NXdDOVI5dlNkOUtiUXdDMFJ6NUhRdnZpZC9oMVpGcHdRYjV6aVVVNkxTMDNM?=
 =?utf-8?B?dFhsb3FZMytXb29yYnN2Mk5NMjR5cWx3UzQwdmoxTXpaMmhVcDBCdkU2dnoz?=
 =?utf-8?B?c1lMNDBVVVpoaDNncHJXYTR0SUFjcjNZc1F3N09QUUhQMkJuYVdzR3BmbXRL?=
 =?utf-8?B?cThONnV3KzRBUjBLdGs2OGc1ZnU2NGQ5ZWlmeFI5ZjNEalJ2VUc4Yi9WSW1u?=
 =?utf-8?B?ZTlsOE5WaFpqVVFuRGtwcXdYaHdQVnNFTFlhb00ySldWanZ2MnByb05aSGtj?=
 =?utf-8?B?Rjc1UzM2YXhJOVdTcjdiNllNUW4xWWhRSUkyVTJkVkJqUjBCVkxJZkUxcXJY?=
 =?utf-8?Q?Gw/Q/TytNm4rlN+Raa7f8DA9ihxE9apC76Rij?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8459B396F107FF4385317028A908EAAB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 43107699-98ee-4b71-e337-08da12edebbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 08:10:29.7804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gb8gQ2FI/aB3zNVbsDmNv2Zg6S6FcMEiRDKeOmnZILQXzSdZcXYpKeDFW4nhV4QnG5wBI6XGDfh8JbtISEeloP8dJnLsXSs/PCzqFPd8E2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2859
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Sathvika Vasireddy <sv@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMxLzAzLzIwMjIgw6AgMTA6MDgsIFBldGVyIFppamxzdHJhIGEgw6ljcml0wqA6DQo+
IE9uIFRodSwgTWFyIDMxLCAyMDIyIGF0IDA5OjUyOjA3QU0gKzAyMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+PiBTb21lIGFyY2hpdGVjdHVyZXMgbGlrZSBwb3dlcnBjIHN1cHBvcnQgYm90
aCBlbmRpYW5uZXNzLCBpdCdzDQo+PiB0aGVyZWZvcmUgbm90IHBvc3NpYmxlIHRvIGZpeCB0aGUg
ZW5kaWFubmVzcyB2aWEgYXJjaC9lbmRpYW5uZXNzLmgNCj4+IGJlY2F1c2UgdGhlcmUgaXMgbm8g
ZWFzeSB3YXkgdG8gZ2V0IHRoZSB0YXJnZXQgZW5kaWFubmVzcyBhdA0KPj4gYnVpbGQgdGltZS4N
Cj4+DQo+PiBVc2UgdGhlIGVuZGlhbm5lc3MgcmVjb3JkZWQgaW4gdGhlIGZpbGUgb2JqdG9vbCBp
cyB3b3JraW5nIG9uLg0KPj4NCj4gDQo+PiArI2luY2x1ZGUgPG9ianRvb2wvZWxmLmg+DQo+PiAg
IA0KPj4gICAvKg0KPj4gLSAqIERvZXMgYSBieXRlIHN3YXAgaWYgdGFyZ2V0IGVuZGlhbm5lc3Mg
ZG9lc24ndCBtYXRjaCB0aGUgaG9zdCwgaS5lLiBjcm9zcw0KPj4gKyAqIERvZXMgYSBieXRlIHN3
YXAgaWYgdGFyZ2V0IGZpbGUgZW5kaWFubmVzcyBkb2Vzbid0IG1hdGNoIHRoZSBob3N0LCBpLmUu
IGNyb3NzDQo+PiAgICAqIGNvbXBpbGF0aW9uIGZvciBsaXR0bGUgZW5kaWFuIG9uIGJpZyBlbmRp
YW4gYW5kIHZpY2UgdmVyc2EuDQo+PiAgICAqIFRvIGJlIHVzZWQgZm9yIG11bHRpLWJ5dGUgdmFs
dWVzIGNvbnZlcnNpb24sIHdoaWNoIGFyZSByZWFkIGZyb20gLyBhYm91dA0KPj4gICAgKiB0byBi
ZSB3cml0dGVuIHRvIGEgdGFyZ2V0IG5hdGl2ZSBlbmRpYW5uZXNzIEVMRiBmaWxlLg0KPj4gICAg
Ki8NCj4+IC0jZGVmaW5lIGJzd2FwX2lmX25lZWRlZCh2YWwpCQkJCQkJXA0KPj4gK3N0YXRpYyBp
bmxpbmUgYm9vbCBuZWVkX2Jzd2FwKEdFbGZfRWhkciAqZWhkcikNCj4+ICt7DQo+PiArCXJldHVy
biAoX19CWVRFX09SREVSID09IF9fTElUVExFX0VORElBTikgXg0KPj4gKwkgICAgICAgKGVoZHIt
PmVfaWRlbnRbRUlfREFUQV0gPT0gRUxGREFUQTJMU0IpOw0KPj4gK30NCj4+ICsNCj4+ICsjZGVm
aW5lIGJzd2FwX2lmX25lZWRlZChlaGRyLCB2YWwpCQkJCQlcDQo+PiAgICh7CQkJCQkJCQkJXA0K
Pj4gICAJX190eXBlb2ZfXyh2YWwpIF9fcmV0OwkJCQkJCVwNCj4+ICsJYm9vbCBfX25lZWRfYnN3
YXAgPSBuZWVkX2Jzd2FwKGVoZHIpOwkJCQlcDQo+PiAgIAlzd2l0Y2ggKHNpemVvZih2YWwpKSB7
CQkJCQkJXA0KPj4gLQljYXNlIDg6IF9fcmV0ID0gX19ORUVEX0JTV0FQID8gYnN3YXBfNjQodmFs
KSA6ICh2YWwpOyBicmVhazsJXA0KPj4gLQljYXNlIDQ6IF9fcmV0ID0gX19ORUVEX0JTV0FQID8g
YnN3YXBfMzIodmFsKSA6ICh2YWwpOyBicmVhazsJXA0KPj4gLQljYXNlIDI6IF9fcmV0ID0gX19O
RUVEX0JTV0FQID8gYnN3YXBfMTYodmFsKSA6ICh2YWwpOyBicmVhazsJXA0KPj4gKwljYXNlIDg6
IF9fcmV0ID0gX19uZWVkX2Jzd2FwID8gYnN3YXBfNjQodmFsKSA6ICh2YWwpOyBicmVhazsJXA0K
Pj4gKwljYXNlIDQ6IF9fcmV0ID0gX19uZWVkX2Jzd2FwID8gYnN3YXBfMzIodmFsKSA6ICh2YWwp
OyBicmVhazsJXA0KPj4gKwljYXNlIDI6IF9fcmV0ID0gX19uZWVkX2Jzd2FwID8gYnN3YXBfMTYo
dmFsKSA6ICh2YWwpOyBicmVhazsJXA0KPj4gICAJZGVmYXVsdDoJCQkJCQkJXA0KPj4gICAJCUJV
SUxEX0JVRygpOyBicmVhazsJCQkJCVwNCj4+ICAgCX0JCQkJCQkJCVwNCj4gDQo+IEZhciBsZXNz
IHBhaW5mdWxsIHRoYXQgSSBpbWFnaW5lZCBpdCB3b3VsZCBiZSwuLiBidXQgSSB0aGluayBJIHBy
ZWZlcg0KPiBwYXNzaW5nIGluIGVsZiwgYXMgb3Bwb3NlZCB0byBlbGYtPmVoZHIsIHdvdWxkIHRo
YXQgd29yaz8NCg0KVGhhdCdzIHdoYXQgSSB3YW50ZWQgdG8gZG8gaW4gdGhlIGJlZ2lubmluZywg
YnV0IHdlIGRvbid0IGhhdmUgaXQgaW4gDQpvcmNfZHVtcCgpDQoNCkNocmlzdG9waGU=
