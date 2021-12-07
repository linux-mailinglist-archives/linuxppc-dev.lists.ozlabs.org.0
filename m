Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5C946B2A0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 06:51:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7Tv63LFYz3c53
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 16:51:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61f;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::61f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7Ttc4zm6z2xtQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Dec 2021 16:51:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JphyI43gMluyieGX6TcPUQDVtm0wY6U7Y2R2Ts/0etftXzxye/EixsubcL1D5xKCV68k/ssgnObMu5aJxv1m2eiElIVinG+Aiui+SQZlnDj87BqaLCTUw7vHH+h+0fyqRG1gNeHsjjEXc1Sd7r7HZbnNPVZKgZ19YsD8AMEREz+xQgptfzKNqH+dkbl4d+rtlyD8WdPZ5q0LcBwMvnd11v54pLq806HD0WOL0RAVn+zH1alYBITk+xkj2HJ683l2csliIJUwtz4z+mtbxjIjptgOGzbEaxjXrxGnd7AhSNPrpRe70A8LSg3pRh6gfOk3OLN0IPW0Lf2SMisdJhihiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XSFmaMVFu5c++RRHZyfbNjR4ePakxHfHWVGOkzQhsM=;
 b=oc/VoH3o99jzCH6ODstCDKdC+dBYGH8iggYU4K93mwvXuMNgd7r0R+rkeVU3f5cE62egxAqFBzRTbzp0zAGouWa1jaWA4gNjo4G+XrvPhG3yAWwV8jiPmtMt8G1+CMiRtisONngFsZGm40J+T6dtXgb0Qn9mBOrv0espcEjEnVzyRsMPVf2t7rMXYwzvbzBMt3MILO92xqsZWJgQvHqtHE+d5zhXl9rhIrYV5de0yiQP4zIk1X3HHp2FQqtUQyJddoWU19DfV3T7/+7klJPvVr7X2tcRb47RCV609yLZLEWV5Gwb1fKhpXjkwfspvbx8p8UMyXW9mzqNu3WRu+3vew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2134.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Tue, 7 Dec
 2021 05:50:42 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 05:50:41 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "mbizon@freebox.fr" <mbizon@freebox.fr>
Subject: Re: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or nobats
Thread-Topic: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or
 nobats
Thread-Index: AQHX597pFZD8fwjYfUOPVLOQ2QefI6wguJIAgABjAYCAAQBigIAARbGAgAA7TICAAYFwgIAAGRKAgAA7RACAAJxUgIAAHSSAgAAFZ4CAABeyAIAAQEYAgAAYLICAAOtDgA==
Date: Tue, 7 Dec 2021 05:50:41 +0000
Message-ID: <3f99df92-0c3e-70cc-623b-7ebd6eca1e55@csgroup.eu>
References: <f23763d551e65d4a225ba13c7898f83853c2aeaf.camel@freebox.fr>
 <68bf4c39-53ce-f88f-383f-5defb1a36b1c@csgroup.eu>
 <913068d2c368c80f89d6f9575d6b41e6fab48ae2.camel@freebox.fr>
 <c7b4ef55-1deb-41f6-58cc-f8dc4477e90c@csgroup.eu>
 <20211204141031.GA23757@sakura>
 <5f4d36a1-695d-38a7-9ff9-d5af97f1a7e0@csgroup.eu>
 <20211205164217.GA29658@sakura>
 <d39825e0-6b48-5ac1-662e-26186e730eaa@csgroup.eu>
 <20211205214408.GC29658@sakura>
 <cea77e1e-9972-33cf-3ef8-e0be5ff26b63@csgroup.eu>
 <b39cea045b4317a83b4605f2aeb8a88bcc44b1d7.camel@freebox.fr>
 <854e7a5f-2b1b-47de-51fb-6cd0f3c6ccd3@csgroup.eu>
 <b9a4afdc13d29100d562232b6376834782c02e92.camel@freebox.fr>
 <06827bee-8f58-daae-3098-64cb08e090de@csgroup.eu>
 <69b0ffeb98a641c74f3beccf9dfc752bef96c51b.camel@freebox.fr>
In-Reply-To: <69b0ffeb98a641c74f3beccf9dfc752bef96c51b.camel@freebox.fr>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da01f46c-d698-491c-0c32-08d9b945811e
x-ms-traffictypediagnostic: MRZP264MB2134:EE_
x-microsoft-antispam-prvs: <MRZP264MB21347CE53BFADD24B23EC6F6ED6E9@MRZP264MB2134.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FZVqVeYI0Qhwcx5UWcqWQqHQ6A6rmaLl9kFMe4EIy2939CxgFe15uG5akjuhliC6Wv0aZHlZAFaRjTbdDjrtPblpP8n3YnQx/ZCqRuPGAwY/tQbc1KB/+U4Sc+hOHcZOthuevOdEBjLGak6CE0uRrMBCj7gztuf1d/DcG9cInaoUCCpxzKEwA+wNRBLrrdSBKq09DTPCa7Pia1wUfVb/LilZcIBYtdeHnq+OVFPB8AX/oE+dv3pxOlPiirRbCY/v5Glt1a5/+P7qRgthL/l6eYOYsNt7l+21fruyY1u9nan1SZRb3wYEyVAC4nJYyboQH7cFWdV0TaWaWEPCMl5bHe8Sll9+GeyZQ2vdxBmi72rOjF1HVP7Gx9yRSOH2T3l3DgZIM44U2M4dopF3KVTA2J8UdIexjXmmdRPOplGzspzxmxDOQ8Y+glioFHjWJezIB2m6Onum3w6//eqzwoKTCNyjnAe8GwY/stmsPJ8OWap18JkiRuMjygOXOSVB2fsHGYKVykBFTuFg0n5cVr1wM443r0kltCO5nesRv4RBPM28Yi9Y2K/qk3GDMNBPpausxmUwouSefe8/TV3g3a6ck+1q4jGaUbZAx6CwGOjcqgwIBHhRnh6WFtNC1o9GHNieGAva+b+WDbrO9PHuwQmP5hpERngkDF/RPuQRiESUTAm9ayLNc0oTGFwjSW123l6I+HjC1aiRT4QvfoJtN+PH45t1Xw81mz9ArHbp+po2ZrYpY0scXonHRsi1TwDkWYrXI68aMTLNDpFXjMJauRi9nVf7d51X9oA9QW/ilD4EM/TWSI8Ly6aFVus9TGepAs+52cGTFm7k79U9xSjsNrklJhBqHzzNuEf8s+tjt4mJmvI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(66446008)(2906002)(38100700002)(31686004)(26005)(4326008)(66476007)(64756008)(508600001)(86362001)(66556008)(6916009)(76116006)(91956017)(8676002)(66946007)(122000001)(44832011)(71200400001)(2616005)(38070700005)(6486002)(186003)(316002)(66574015)(6512007)(6506007)(31696002)(966005)(4744005)(83380400001)(8936002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGgyR3RGbFczUU1mdTVmZWpndGI0WnNFWnVvODVCVS9LZVR1QlJncUZ3UzMy?=
 =?utf-8?B?M0YyMEY3UWJCVGpWVTFvdE4zWWUyWDlRcDJPV3A2WmtGTXJDL25peUIzUlRL?=
 =?utf-8?B?bWJSdWF3bFNvS2NHYU9oZjZXZXQva3pIS0NVY2QxZGV2NlRyVUMvU0FZNnla?=
 =?utf-8?B?R1JXc3hlQ1gwOW9hZkVxenlielVvNUtQOVJIYVRYY0o0RmFSOU1Oek1sVWNl?=
 =?utf-8?B?TjJ0c0orMmRrNnNWR3lneDF1bHpWYzJ0aHFXbjk5cnU1NGp4WWZLKzd4bzg1?=
 =?utf-8?B?eVZCMHB0ZXVRTUZ0VThCZXBKanN4MnQwTHN2OFFtc2dSUmRzZXlySlIycW1H?=
 =?utf-8?B?NWMrNE0xZis3bll5c3NTYnJEUVowTkZNcFdFYXl5dWdSMFUyYjdDWndSL00x?=
 =?utf-8?B?cVhwd0xqeDZWdllTek1OL1JUcFZrcnRCL0hCT1RDWnRYTzJ0aUQ2WlNscnU3?=
 =?utf-8?B?Szl4NzRVaGp5VU05MDdURUN2N1ZsamVOM2NYNVRDTHY5d2d1WUxnWGdnWTB4?=
 =?utf-8?B?NFNPWE15Rkg1K20yQm5Fc25VQXJhY1U4Wjd0a2JKcWl2Q1RsYjNBTlhZUGlx?=
 =?utf-8?B?S0FnZG1rRkdtTUhpSnUwVGhTTFFHYXBkUitYM2RKeXZkeEFPbVlvRXk5L0Ru?=
 =?utf-8?B?UXBQNk81amEzQTBzRVdsUTJxUFhMbVJOazNZUjNFQ2k1QVRROEpsSzF3Uzlv?=
 =?utf-8?B?ZEZoUHNhZWpLVFp1aHpGa0RkNG5kUmVLUmZOZFRMTEZkWjY0TUlPanRjUm1h?=
 =?utf-8?B?cXUzZFE3NDZLcGtzZGsxS0V5TDhoWkhYOTlPc2FxMS9yRkErYmVQcFFzZDZ5?=
 =?utf-8?B?aWovVkJuUythT0F6L09WTDh2VmRJeHZ5SSs0cmI4cXdGd1k1dTIrQTlNcldV?=
 =?utf-8?B?cEFleWZCTi9WakM2Q0gzRktscCtlQ0FYL3JJK1RSY0lYblVVNDRrQ1pLV01k?=
 =?utf-8?B?SWloaTVzVnB4cC9MMGxQT1p2ZUx6QXlwa3FQSW5xMzk5UnQveGp0T1FyT2lG?=
 =?utf-8?B?Uzk1MmUxeDBOdDZBZzVxcXVaMlJHOWJEUFkwMjVDTGg5bU1INE02a1d1a3lC?=
 =?utf-8?B?NVVoNldnbklxdW9uS2NVNEpQNnpLU0dwOWo5c3BTcFIvZ09sUmYvcGx3M21P?=
 =?utf-8?B?b0Jod2l6T2pqc3JSNlR3bTBWYlZmaGgzaG9YbG5YK0R1bldaWm15OGNkUDRk?=
 =?utf-8?B?WXpITzJXOXBSQ2hNNWxKSGs0SURiSUdqd1ZENFYrRkNrRFIydWhBVzRIL3Rn?=
 =?utf-8?B?eXNEcU5BV3cvM2dnU0tJeVBORkdOQW9Vb05uVG0rLzNiN2lUS0pUMmYwQjhr?=
 =?utf-8?B?Qk5KUkxOU3liOVNsdktKQlR2aVhNeUtZajdtWEFUbDkvT1FhNmMrd0NQS1BF?=
 =?utf-8?B?b1J4QkV5VExsc1Q2dWg2bVNGclJnTVhGeTJ3NWFzdFhwZnlETWtBeWdlT3Bv?=
 =?utf-8?B?VldLMHBxK0dTUXJhM2xpVTFibnF4K3N6R2RIOG53OTZFTUl2WC95bTlCMXdC?=
 =?utf-8?B?VGtTdDV4YW5MVWFySlhWTk1YemhnNTJackp4U3ZjOUtXbGZnZVpJRjJZZUJi?=
 =?utf-8?B?bXZTckRhTTRhVk4wS2ZQTnFRSHpjN1c3Q1FyWlk2eDNvNFgwSEhwM08yV3JP?=
 =?utf-8?B?NlhkWVFPK2VOeWpyNzJqaWRqdXhmQjJXN0ZLck9EcGdjZ25FeGZPNnpabWMz?=
 =?utf-8?B?dFQwUG5FWVhTSVNnQS9aeGFFRnd6K2dsc0RWNTVPc2g3d3pmS2NubGpvODBC?=
 =?utf-8?B?Y05rMU1qZTE4Mk5heG4xNWNLVWFKeS9OV2QrTXk1RVFuTWxGNW9lYTc4SW91?=
 =?utf-8?B?WTdmL3A1VjBhWHYxbE9NRDZHMHA4TnJ2UGpKdjMvQ2pzTVpLYTdrRXNBUHBu?=
 =?utf-8?B?bC9ZZHJhY2l6OGVqcSttdUVSNkNyUHhDemxkSER6L2hBUU0zNnlNTURwR1R0?=
 =?utf-8?B?dlVFeWU1Q0FxZTIrdndUZUwzNVE0Z0NhdU1NTGJPNVNoWUJVK0tkQXVjRG1E?=
 =?utf-8?B?b1V2SUFzeWlrK1Zadk9UVktxK3VDeUd1Z2QvcTF6T0JFOTNpTnQwY25RWUR5?=
 =?utf-8?B?UWhVcmpPWjcvaGZMRWdmNUNqWk53YWp5NHJIRm0wajExc2kwYU5DMzdscTZS?=
 =?utf-8?B?dlRnQTFCc0lsSGFQS3FEbllTazBLVmFwY2NBUGRFYTlnWWZSZW8xM0hBVHcz?=
 =?utf-8?B?ZFVQb09jbG1SQ0J0TTJ6M2xSOTlvV3BWR3VLTVpKK0oxcHl4enE5ZlVpT1Zu?=
 =?utf-8?Q?lyPbAZ2JjxkeDoKUAbxD1bs3RFp6EQnxO0bEgtlfZQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C500D21BDC49C040984D4B260F5E50AC@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: da01f46c-d698-491c-0c32-08d9b945811e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 05:50:41.8393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2+LiSzLkM2hHki5uOFoX4tFUMj5T2b00VVRXomeu4EVoY7eGIWqm4sc/XDt9QzSJDD/LC8I72EShlsajBU5N6fDDua2xeiNV1yL/4ZKo5hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2134
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzEyLzIwMjEgw6AgMTY6NDgsIE1heGltZSBCaXpvbiBhIMOpY3JpdMKgOg0KPiAN
Cj4gT24gTW9uLCAyMDIxLTEyLTA2IGF0IDE0OjIyICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdy
b3RlOg0KPiANCj4+IEZpeGVkIGJvdGggaW4gdjIuDQo+IA0KPiBXb3JrcyBmaW5lLCBtYW55IHRo
YW5rcw0KPiANCg0KR3JlYXQuDQoNCkNvdWxkIHlvdSB0aGVuIHJlcGx5IHRvIHRoZSBwYXRjaCB3
aXRoIHRoZSBmb2xsb3dpbmcgbGluZSA/DQoNClJlcG9ydGVkLWJ5OiBNYXhpbWUgQml6b24gPG1i
aXpvbkBmcmVlYm94LmZyPg0KDQpUaGF0IHdheSBpdCB3aWxsIGJlIHRha2VuIGludG8gYWNjb3Vu
dCBpbiBwYXRjaHdvcmsgYXQgDQpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qv
bGludXhwcGMtZGV2L2xpc3QvP3N1Ym1pdHRlcj03OTA4Ng0KDQpUaGFua3MNCkNocmlzdG9waGU=
