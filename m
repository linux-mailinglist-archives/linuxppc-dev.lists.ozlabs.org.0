Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D9353424F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 19:40:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7dcp1Js9z3bvd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 03:40:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60a;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::60a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7dcK2mZbz2yJF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 03:39:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWzgjgprANaAjPwTGWbLxfeSG/Kv4YrBt33aU7Dk1jSJonJJuhk4NtPVSMTq0tRNLzOl1WeDFTnyrLnJmVdAAq5XA/x6jPDu6c2661N0j6+Or10i7zzenh0CiTw4NcsJAppMzgSNdEEId15iSS9DJU+Ej/LDyBJC8In2hZrdzA+TR/f6peBqESohhOWYGIPGk2lDwVj44QO71OZaHhMcpb38jDkj/Oq8Cf0nmYS4ybotdvLc1qjsm88z4DWu+USygCfeYfXMW0SUVf8/lP6hS7phLLwPc50CSnp1Skp/6x2YjodBFpv3uWMpEtV+V9bCXVVrDuYYzE7VfOeRXKm2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=km/dVeqapOg7KIoRHkbyUlr75InbtugElkCTwtJWTi8=;
 b=BCfiYAyTP7Y/czT1ga1zKAOE2xSGxbXPRWEdxenrkJvQDvOkLBx/UDuPDw4EkoCIFBFhuvEazIxouLnw5pSKGsNXWKPFCBlH90TcRnEhPxGqISX64SyDnlp4nAXf/0We/8Sq4/mRciWYX8tPKfwWYOIux6zz5WQ/nSmi3D2BCoW0DM7sMv7t/0+Xbp9XO3ELpXzLry8E7UoWVRh7MpP2KnnuFoLuQ9MWMJJmqgVYG6Ong4c3+IccdNqoVuBdt1iWniM8CYdFcDgTr3AysJXuX6bDwDdW350IdlDyBeEbzjs4uhPAW6bLHt/Ipwe59HN/MLRotzFcCjtjE58d1VGpJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3021.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 25 May
 2022 17:39:24 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 17:39:24 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH v2 0/7] objtool: Enable and implement --mcount option
 on powerpc
Thread-Topic: [RFC PATCH v2 0/7] objtool: Enable and implement --mcount option
 on powerpc
Thread-Index: AQHYb3C6vgEmcLWl90eZLKe3IHFJVq0vYXAAgAB8bIA=
Date: Wed, 25 May 2022 17:39:24 +0000
Message-ID: <ea64b232-e002-9317-dca1-c5933fb94e03@csgroup.eu>
References: <cover.1653398233.git.christophe.leroy@csgroup.eu>
 <ac4e3ceb-7de8-2c3f-4689-1730d811bf3d@linux.vnet.ibm.com>
In-Reply-To: <ac4e3ceb-7de8-2c3f-4689-1730d811bf3d@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5cf7d04-969c-4701-b3f8-08da3e758218
x-ms-traffictypediagnostic: PAZP264MB3021:EE_
x-microsoft-antispam-prvs: <PAZP264MB3021F9471131D87676C68994EDD69@PAZP264MB3021.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V+3d1ptqhZC8WgWNgp3J6TusO7fcA5gM1RCRWkcHhqaWHiSIEYLaPrw259pmAZgLVQQh5BIo1PaC/Ep+ClhxdEtLiC2lxHkx3yCrd98muesqJJeBXUV+442yOvrAQmAmq189PRtdxKV9DUimEPtpNTrm3d4P5Yn/C9/OHeAO7lhVsS2oLcBBKAkArFVJmr+yMZCs3kqtc8mePx+DqP5puc/Rr8GSApP/bWHqZiGk5/LqemKr6I4rWI3aVbpKlu/9ESloEr5DjVCVCYzu1zFzn4UNbA6DwFnhFjPJljfpa6NW044VJxtLreQFgEWqDcogtYBe0ggsBZAebQe8MAD9Kw75MhfDVT+Vjb3wwx+5murORrvkTsg6DR7c0hOUoniQvY+BHFdVv2wA+Eu4K7DfSviJNH3zUFO58AiaowD+URQ/9OLVacZn96/IiZLfzVlf2HnI4k5i3ytJLRK7kAUqvnX0fFlQPFIeY6u8BckxTNn/bid43yf5GEKhRhN+SYxugsAMg4U2WhuhN1QyyWLaF27ShWaWHcSJ66B+OCal5I6QeciBGvhfEhSDcnIi68oGFf9lS4gzr+y0HL+jMLrDm2JKN8NvwG0YkRzcn8386ZPyjdlCHTCsHTTGN94U/oIRtg7eT7mhcQlhXgYlc3p5Ee8VnBPorY6nWvZcWufxE3NHKgRe5ePmQQmbaxDpu8WHrzmcMDYNIHljvg91Bzcgmxmu0AhTfkEDlAQJjWYHwIbuM/NNdDRWKXXLcOmmz87E/FjoXZV6aCoxmAYye4Veug==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(122000001)(36756003)(86362001)(31686004)(2616005)(186003)(7416002)(54906003)(53546011)(5660300002)(44832011)(38070700005)(6916009)(38100700002)(91956017)(64756008)(8676002)(76116006)(66556008)(66946007)(66446008)(316002)(8936002)(4326008)(66476007)(2906002)(31696002)(71200400001)(83380400001)(6512007)(508600001)(26005)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bk1HRmJraXkzdTcraXhDSlNHMGxEZWlmMHpGRkdWYStqUXVRRHZQbkRRZk9J?=
 =?utf-8?B?bkJtL2hsVVlsaWNqTFdldWNLMXpwVzZxZksza1NRWU1sNTVYSExOYysvbklV?=
 =?utf-8?B?bUl1QUNydVdRZnNmeEJzVklMS0RWd1VOd01qL1VYMzhoaUdHa3hTa2RoWm1I?=
 =?utf-8?B?Vkg2TjJyOWVCR2d2MTQ3S1VmNzhuL214dExNaHpsU1hiLzZjSHFUUENmNExv?=
 =?utf-8?B?bTM1dm9pMzJNK0xoaXc0TlVaVkVNSEZXT3AyTFRjNC9UcUduNnFFZjJxMlp5?=
 =?utf-8?B?cDdkOHFsMGhvN0VzdHlFSmFYdTdzTDB4UVFxQk4xRXFrRjA4L1R5VUtmbnND?=
 =?utf-8?B?V0pScjdlYnBwZEJTTjFDZ2pyMTFBT24xTVhSRHJWUnlPWHA4SzhtaHVkd3NZ?=
 =?utf-8?B?S3FrY2xUeEFxQjJ4ejYvdFpMWXlGeWk5OXdTOSthNlFtdEVVV1RLbzFUZjM5?=
 =?utf-8?B?YTZoNmd1TEFIT25sWlJuSFJETlk3TFJaV1R5Q2xlNzdoUDk3QnlEckxxTTNO?=
 =?utf-8?B?QjJXTWc3ejdCNmJEazc3UW1XaU9HUzYwUkl5TzJxcmREV3JCODk4bWFtUVRl?=
 =?utf-8?B?RnNOR2hLUWxrL0loOUlVdkxrdSszeG1YdzlDTlZVWW1lQmlnM0dzeWFiY3NV?=
 =?utf-8?B?Wlp6WGNTclkxcEtrZUVyZWdNVjhyUVYxRnk2aGtQSDJ3dzhxdFZJZzZBdkU5?=
 =?utf-8?B?alBWVU9VYW53T0tsdThiaStuSDBCUVhaY1Z2QVpiOS84VkRET01La0p3THR4?=
 =?utf-8?B?RmJyRGlZaDJsVisvcmc1cUlxSGt5NVF3NzIzOUlaTW5MandKR2VxTkw3ZWdx?=
 =?utf-8?B?NStnSHU4SDBrUmRlZjU4SkF1Snl4YWk1anJ6ZkdCZ0lDbnNlMHNjb3FVbita?=
 =?utf-8?B?b0ZCUlV4dk81TmMrL2YzaDBPMGcvREEzdk1uN1pDRzQrTmlxeDZGT3haUW5L?=
 =?utf-8?B?eTFQNjRkTTRsajhLNHg4cUtpdURRZUtQWXpLNnlyYmpkc3J0M281YytWOUlI?=
 =?utf-8?B?N1F1VmpGanhxc1VyUGhTSW8xNlF3Z1pLYTRxcWlsbVNTd1ZKbHBvZDBZYmJM?=
 =?utf-8?B?Q1Z1MWhzazlpZytEaHc0M0NrOWlDWlNKbThZWmhPeUxpQWFOQTlUQ01LVG5G?=
 =?utf-8?B?ZXVvZGNzeVNPNkhTVkxsQW5QdElzL2JvTlVlNzUvNS9nUUswQ3VzT2IzVmdW?=
 =?utf-8?B?Sk9ReEpnTnJnZTdNa3JqNXpQNHAxU2FrVU1zdC9aeEFYOGN5c0lFVWVNbWxX?=
 =?utf-8?B?ZnFwbWtURWxjRnJRbjQyZUFUMGhkMm55S1Nrbng5YXllUXFtSUNoSDJIalNo?=
 =?utf-8?B?d1Vpby9zbWYvUlRhSThpMUtTblY2dDdHMklBWStDNDNtV1YrOGZodk9qcE90?=
 =?utf-8?B?R2p6S2gweDRLenZPTVRUY2pBdXhzeFhEaERsTEpBaUtVV1UyRFEyU25PWHZw?=
 =?utf-8?B?WFBZUmdFaUxRaHhDVC9udE9FdnFtZlR5RlZoODg3L1NGRXYrR3l1K3Yrc2Mz?=
 =?utf-8?B?WGNMMmpGRmNJOEU3RTgyUlVBaVY4aEFYNXFEZ25VeHo2VktuRVZXZ2o3WFRT?=
 =?utf-8?B?VW5KSkxMb1NsdXd1eW85Z2paSWJ5WFRCSmduU2w2SWFobWhkRVg0ZndURlpE?=
 =?utf-8?B?dlgvS2pObDBvTHJ4ZXNFVFVVblFzZFNYQXBuUXFyendDS2Vpc3VmMnJwRWIz?=
 =?utf-8?B?Nk1WQk56V2xtcHZQMUNtbkFzZ1FwRUIvOFYxb0NUVGwrOXBlR2xuZ1oyait2?=
 =?utf-8?B?RjZway9ibFhGNjJURFBONVlHVG5SVG1xS2p4V3I3ZUpiTjJZVVN3d3dDL2NE?=
 =?utf-8?B?M3VoRXNYVkxQWU8rYWVGNUpzNVFJSi9YV3BZbXdoZVoxTVBUQmEyZ202N2Zz?=
 =?utf-8?B?MFY5S3ViWWwxYzMxbUMwZnNHa0xielBLMkJza0tLSzhONmhqN1dOdk9DOHo4?=
 =?utf-8?B?MTR2aVNrVzZaSm00V09VemNkam9rN3ZLclhEa0FNbkQ5TzkrZ1VjOTBTaVVR?=
 =?utf-8?B?czhqQTZEaFdJV3VxekFEVVlOMHpRTlpESEVPMmFqNTFIZ0ZkUGViaXVkaEJ6?=
 =?utf-8?B?c0FRSjc4ampFVnlSZmRobFl0OW04OVQ0VlA2djhVMGhtZFpNV1pDZEFpSGRG?=
 =?utf-8?B?eWppaEVKUWtkaUs5TjQyUjFoQndqZ29jbjJUSWhCQ3RsTkljbUFyTGZXcGRD?=
 =?utf-8?B?bGVoRDU2djhiZGFXamdqdVd1QmlGcGdjYTNoYThCNGpudmtlZXAzOUN4aWlB?=
 =?utf-8?B?V244cUsyalkwazZXNGpqVFVKbnN2RzFidUY0YlhibzNDZHQ1eURSNlFnN2ZB?=
 =?utf-8?B?Y05uS3hYVE9zOUJDVFQ1TkFGdjFUbEk3OTd2a21zVktQVmFJVEM2TVllNnZX?=
 =?utf-8?Q?54StoQQqfZ/bIPBRn2omaMdtrQd7JeItRElBi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <601DFE0E458B0F45B2E7BAE785BCE9C5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e5cf7d04-969c-4701-b3f8-08da3e758218
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2022 17:39:24.0786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GOu5ES5Wog/6Y9fEKgaHkOXZwzaNZpKsnyJ3S0OvsOhfShnDMw9KtNMqUIt3VhkJDx9f8rybY+PM8scsYzqKZ9gIr/V3ug0svlTCio8kg9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3021
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 Paul Mackerras <paulus@samba.org>, Sathvika Vasireddy <sv@linux.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 "mbenes@suse.cz" <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgU2F0aHZpa2EsDQoNCkxlIDI1LzA1LzIwMjIgw6AgMTI6MTQsIFNhdGh2aWthIFZhc2lyZWRk
eSBhIMOpY3JpdMKgOg0KPiBIaSBDaHJpc3RvcGhlLA0KPiANCj4gT24gMjQvMDUvMjIgMTg6NDcs
IENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+PiBUaGlzIGRyYWZ0IHNlcmllcyBhZGRzIFBQQzMy
IHN1cHBvcnQgdG8gU2F0aHZpa2EncyBzZXJpZXMuDQo+PiBWZXJpZmllZCBvbiBwbWFjMzIgb24g
UUVNVS4NCj4+DQo+PiBJdCBzaG91bGQgaW4gcHJpbmNpcGxlIGFsc28gd29yayBmb3IgUFBDNjQg
QkUgYnV0IGZvciB0aGUgdGltZSBiZWluZw0KPj4gc29tZXRoaW5nIGdvZXMgd3JvbmcuIEluIHRo
ZSBiZWdpbm5pbmcgSSBoYWQgYSBzZWdmYXV0IGhlbmNlIHRoZSBmaXJzdA0KPj4gcGF0Y2guIEJ1
dCBJIHN0aWxsIGdldCBubyBtY291bnQgc2VjdGlvbiBpbiB0aGUgZmlsZXMuDQo+IFNpbmNlIFBQ
QzY0IEJFIHVzZXMgb2xkZXIgZWxmdjEgQUJJLCBpdCBwcmVwZW5kcyBhIGRvdCB0byBzeW1ib2xz
Lg0KPiBBbmQgc28sIHRoZSByZWxvY2F0aW9uIHJlY29yZHMgaW4gY2FzZSBvZiBQUEM2NEJFIHBv
aW50IHRvICIuX21jb3VudCIsDQo+IHJhdGhlciB0aGFuIGp1c3QgIl9tY291bnQiLiBXZSBzaG91
bGQgYmUgbG9va2luZyBmb3IgIi5fbWNvdW50IiB0byBiZQ0KPiBhYmxlIHRvIGdlbmVyYXRlIG1j
b3VudF9sb2Mgc2VjdGlvbiBpbiB0aGUgZmlsZXMuDQo+IA0KPiBMaWtlOg0KPiANCj4gZGlmZiAt
LWdpdCBhL3Rvb2xzL29ianRvb2wvY2hlY2suYyBiL3Rvb2xzL29ianRvb2wvY2hlY2suYw0KPiBp
bmRleCA3MGJlNWE3MmU4MzguLjdkYTViZjhjNzIzNiAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvb2Jq
dG9vbC9jaGVjay5jDQo+ICsrKyBiL3Rvb2xzL29ianRvb2wvY2hlY2suYw0KPiBAQCAtMjE4NSw3
ICsyMTg1LDcgQEAgc3RhdGljIGludCBjbGFzc2lmeV9zeW1ib2xzKHN0cnVjdCBvYmp0b29sX2Zp
bGUgDQo+ICpmaWxlKQ0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoYXJjaF9pc19yZXRwb2xpbmUoZnVuYykpDQo+ICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmdW5jLT5yZXRw
b2xpbmVfdGh1bmsgPSB0cnVlOw0KPiANCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmICgoIXN0cmNtcChmdW5jLT5uYW1lLCAiX19mZW50cnlfXyIpKSB8
fCANCj4gKCFzdHJjbXAoZnVuYy0+bmFtZSwgIl9tY291bnQiKSkpDQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoKCFzdHJjbXAoZnVuYy0+bmFtZSwg
Il9fZmVudHJ5X18iKSkgfHwgDQo+ICghc3RyY21wKGZ1bmMtPm5hbWUsICJfbWNvdW50IikpIHx8
ICghc3RyY21wKGZ1bmMtPm5hbWUsICIuX21jb3VudCIpKSkNCj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZ1bmMtPmZlbnRy
eSA9IHRydWU7DQo+IA0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoaXNfcHJvZmlsaW5nX2Z1bmMoZnVuYy0+bmFtZSkpDQo+IA0KPiANCj4gV2l0
aCB0aGlzIGNoYW5nZSwgSSBjb3VsZCBzZWUgX19tY291bnRfbG9jIHNlY3Rpb24gYmVpbmcNCj4g
Z2VuZXJhdGVkIGluIGluZGl2aWR1YWwgcHBjNjRiZSBvYmplY3QgZmlsZXMuDQo+IA0KDQpPciBz
aG91bGQgd2UgaW1wbGVtZW50IGFuIGVxdWl2YWxlbnQgb2YgYXJjaF9mdHJhY2VfbWF0Y2hfYWRq
dXN0KCkgaW4gDQpvYmp0b29sID8NCg0KQ2hyaXN0b3BoZQ==
