Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 392864402C5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 21:02:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgsJC0T4pz3000
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 06:02:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::613;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::613])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgsHc16fpz2yfr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Oct 2021 06:02:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOYAARefIM/gsImTyYgnaL6kkQZZbP4+Wt+mUDkTH9sgFD1ZqD3hdgKh2yDi3tgYPHGKYU67jBaP4zD7HTXkLt4ibI9a/rPtLCPekSyufeTOrf/fBw+w3ICdYoLlpizHv6RU3pqb77ZdYAtEv+RfPa9lJmOrxu5LLmlnePJ8TmWo074FmMpfeymbfkqziqvtoKgFZctkSfflnCQdIyNvmJrzRa79lcX9WXvJhAtCjwbsDCClOOdE65H/sS52Hd9m98h4nCfnjeVoOLXqTFlmzQ9EAbAmLzzEuM1HYeoNvGfT7hd+/Ic83u+f44ndK53i+/ZhnlFQew6c7UWJX4wZeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Syvhq2zlUNd+pjxBkilSZYKgND34wkIVySvf0SgMYwo=;
 b=bkm3Oq0z/51PaUMjobN7GFPFqoGC95r2DZDQIWx03Qbt4U73SlXTZFafvDVPruAkeW+H7YN5QKTBafa92Xf44BFGBIFgkDmh8VD+aBn5y5wj1C+0HPRlKWDxXriROaNui5z8qljpNcXjrEc/ZiAA4riPM1ZR9xEaJB22wCpOUOxvA5zbA9JfJh2b2hEPTKf3i2akYYHxgJE/Z+/f1EYItWR92eQy47ooOKvkMNZaZ/ZaGSLH6Ce5kzmiiXo0tYPH2zlManQoXH+gAW7bkIxDODBYfyjXi42tXun5+pq1w7nbCBk0MvXd5OsW2fLwdgxqFcnxrmQra0KeqhmjH6Tplg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1748.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:12::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Fri, 29 Oct
 2021 19:01:56 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 19:01:56 +0000
From: LEROY Christophe <christophe.leroy@csgroup.eu>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Michael
 Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v1 1/1] soc: fsl: Replace kernel.h with the necessary
 inclusions
Thread-Topic: [PATCH v1 1/1] soc: fsl: Replace kernel.h with the necessary
 inclusions
Thread-Index: AQHXy0hKVHVtqfAQTU6r4My+Kf+AHKvqJFcAgAAz+YA=
Date: Fri, 29 Oct 2021 19:01:56 +0000
Message-ID: <c0524c86-fc7e-632a-8b2a-862695529115@csgroup.eu>
References: <20211027153354.81129-1-andriy.shevchenko@linux.intel.com>
 <YXwZihLk1njsBNT4@smile.fi.intel.com>
In-Reply-To: <YXwZihLk1njsBNT4@smile.fi.intel.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none; linux.intel.com; dmarc=none action=none header.from=csgroup.eu; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a321dadf-7247-43fc-6525-08d99b0e9429
x-ms-traffictypediagnostic: MR1P264MB1748:
x-microsoft-antispam-prvs: <MR1P264MB1748E9E0CC6C871219B98D5AED879@MR1P264MB1748.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XaKq+21r2EMQSF1Fx+diTZGgJi6cj/o71a9usY95nxLfifqcbGTiar7FCK2bIylpS34QuS3wB5HNVqWVw2EtADuetfX56OKRzWvtdtc0wuM1lFNnOrs9n7aWpJEYoylG4YMmb6gQYSU4o77R8+26QRNvV57xM2j+fwrPwgjrDMSmZmaLf7Btv34r5aciEBFExopKcwjW+TncOTtWU5WXU1c21d9IePfjk3hWNA5g5I+IIImBgRJNuIrBNDZNpOLZVddk5yqQZaTAoyHy4BS27PqIvHLmsLZF15DUFlDQ/azZwkNm7p/xVSE/DK5X9l25E36hNtYfD334Da61e1/lJOnnaY8Sj1B10g201htKfKoCAfZnjorwJDhqXNaPZze1Cah+ufwC5e6xcdRSa+rYolj7h1jng23zyOenmiXfZ1oNI0PsDDWQQY70s9jNuBaT+el99UgKKPuvp6eImxD1k66PT2bxngfNO31xSjDLemPkXNkzC5nAtNtxpzftbTrbc7EmLeHTcMtVxJO8lV4nKWsKgNPh2CH3a34p0yuVuAcNmzO69XamTCkxcILsSCSDPb/aCFt1L/K10ObMc4FZYdp89KP1XrRe1+R5iVoNuHHpsxpiW0PLdjKs3zThawv3GcgGHAS9SNxMvFqKFsedoT7/YnRAnTvMPoZ7jxr4gaF2QThNmrBQGGY2MOgaq2hbqrRstbzcKyOTABJuS6+tqH3niRu36knwO2xNIgrjWh5LxwfogLWT56T6/tt4gquzydtbM7SF/i1O+4kXIKfPir4d/QS9MNHcNteds/62EagyaiCktHm60257+UZ7QCjqxwok5uDvGExaLm9kz8qsG3U0GuU1YzXCFweDHivazGk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(6512007)(26005)(966005)(66446008)(6486002)(38100700002)(508600001)(71200400001)(186003)(8936002)(5660300002)(110136005)(4744005)(66556008)(76116006)(8676002)(86362001)(31686004)(38070700005)(2906002)(66476007)(4326008)(66946007)(2616005)(6506007)(316002)(83380400001)(36756003)(91956017)(64756008)(122000001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEhIeWx5b0RtbFZyaFVTaVBhTXlvdWlPYnlMUTlwR0FCNk1wUnllV25NU2Zn?=
 =?utf-8?B?R1k3S2pWYUE4OVAvdmxWcHVMenNIcnJpN0Z3M0FDSDVYeENTMzZZMFg5RlJC?=
 =?utf-8?B?QlBWeFcwUGE0OUVPRVRYSU9VMVNJQWZrSWF5ZEFLSjdPaVJZbjhJWUhZUHA1?=
 =?utf-8?B?UW1xUzdCWm1OTXJRcXRCay8xaHJicXAyeVBPMExCUjFMZ0ZnZTE0aVZpQlUr?=
 =?utf-8?B?UzVhUnNtQXpHTWhpTzQ4c3hQcWFLQzZ1OWRiSUUrUUlWdlNPRDhuWXdRZllG?=
 =?utf-8?B?V0FDSHVuWWNhdGVzeDZ0bXdDeGFyUHo0YTNTOGN1WEFSZ2o3VmtqYm5xV2R2?=
 =?utf-8?B?VkU2TlBnM3dRZ2t6RGVDL1Urd2RReWxFeU5zOG96eFkvN1ZzQXgvYy84MDdG?=
 =?utf-8?B?azJwNFhWYk5Vb0dmbzNmS0NTaDZaU2pYN0NCbzhNd0xHUFNVNEF5WXJSQWxD?=
 =?utf-8?B?OFoxOE1sUFlsYWNwS2lWSTR0R29EeTdMWmY2TVJ1TGNCSnAxSllZa1ZrN1ZU?=
 =?utf-8?B?SktrWnNheVZJbXlBeC9PTzNQK0UyTXhzUkRCUlRNbTZIV3dKN2ZjdDRodVpR?=
 =?utf-8?B?K0VwRS9udzJmS3VzZ01QNnZieENhZXUvRERIMlFMcmloQUE3Sm80NUp2UExk?=
 =?utf-8?B?a3Y4aUxyUjdiVFRJOVZNeC9NOHVBN3lwNytaOStyaUFGZ2Z4My9uazJodWFp?=
 =?utf-8?B?MklBUWVlanhUOFJHbXNxaHYxakdtaStTaExZUjVndXdqSHJ5TlhKRkdJbVhR?=
 =?utf-8?B?TmpiV200VUZYUmRLaCtxZi9wakw3Nmp0ZERQZlQvOG9mMVlLOU1hK2UvQTh0?=
 =?utf-8?B?MjZQZEhrelBIbzR3SnN5U3VDa09ITmg5Yk04WTRMVUFmVEFSRWlDM0I2bll5?=
 =?utf-8?B?WW00eGQ0UVIvVjhhdTJLdnh5RUhZbHlYWHFuZXppTVU1SDZ6aE1lREZPYTFx?=
 =?utf-8?B?R3hwVnd5NjhZMUNQQStPR2NMRVN2R0Nvb005Vnd5eW14c0hoRWcyUlFmYXox?=
 =?utf-8?B?SmR2RVgxTWZJOVFLOFZ3M1YwZmgzRzVHZGkzeElYdmJpMkczREpZeTNKMHJj?=
 =?utf-8?B?K3J1RmlWUUFEdHZNOVNhVWx4cEhiNk5MQzdGOXBaYXc2NnI5REQrUWlRYzIy?=
 =?utf-8?B?TkdieTRKb0dyMCtFbDZCaEhJTE9pUEgwZzVKMGp0bFRRM054bXZheUZiYXNZ?=
 =?utf-8?B?eFZxMjFOVERGSEo2bzZvUWFSY2k2U3IvR0N1Q3NncHdpeERNeWMwUUhjVUFu?=
 =?utf-8?B?eEdrZVFtaUxZY2s0UUh6U1lOYkZyRFhhTlBHKy9VRExQTTBSV0I1VmhlWnVx?=
 =?utf-8?B?dXZSMXk2RlNBZHNvTEFLT2V0d2dRTWlFbEFYZktPemUvQ2FxcWRuYXphOGNR?=
 =?utf-8?B?Q1RoMThKZ3ZGZjNLcy8wK01JTEdMZko2NVBiSElPYlRtRW1iWmwxdVhZQnc1?=
 =?utf-8?B?YUFFaUNhVElPOU5VWnNhbkVkcG5RNHdrbDNwS3QzMW95cjNsbHU5RFFkSDNq?=
 =?utf-8?B?RVIxbllTY3JrMi9HanExdGZPOGVKRExVUzNXMmRWNllISXlNVmNaeXJPMWFJ?=
 =?utf-8?B?SjFIc3VVQ2prM2pjdFIyNi9nTm5uR2lPd091Sko0MEx5aUdwcG1xc2tzOHpj?=
 =?utf-8?B?bCtWcUJ3MHViVVN4QnhxaGR3dzd3d2FYaEtQVnVvbDBJSTlLQ3B1RXdCUjhk?=
 =?utf-8?B?VzUrU1NxTWFrUytEWGRJSDB4bG5oeVloWWRsSjN5dFRRWTNtUWpGY0s1a3NR?=
 =?utf-8?B?NXQ0OG9UOFo1aVJxQzh2bHBMaDJ2cXI1QzAvRlBEUjV4cGMxMzVvOWxFUGdE?=
 =?utf-8?B?WnB3ZzJhVzFVS1dNSmlDMnlNNXF0UHFYbnlXS1d4QWdSYWsvbGQ1ZzEwNER1?=
 =?utf-8?B?WHV5VHYvNUgwNmZKa3ZSZFBLV3ZzeVRPdTZQd1lUWnhocWFNeFozWDNHcFho?=
 =?utf-8?B?VDNvckZxdTdXOVJibDVMTTFWd1hWcTZLTWFhZjJTQkxIYy9ZSTkzdmxROW42?=
 =?utf-8?B?MWNhdU1wdEVmRHc2N0ducVV0VndVVFNlUFgvem9xaWVBeVpMMVF5MmtZMUls?=
 =?utf-8?B?YUREUmJtS1NFMFAvWWJzcFJIbjNPSHZmRXBkd3FKSENqbW5wcHljU3kybC9G?=
 =?utf-8?B?ck9CNnBraDdZd2w4ZHJ0NHVSSXd1S0lob2l1RkNPQVVvcHJJQTRtaGlqYlcv?=
 =?utf-8?B?K08yRGtSRFRRTUtjWFdtcG5zQW9sWkVNRlg2YUUvL0pycXBDWExtYjNQdWZ3?=
 =?utf-8?Q?9WPVAM3wVcMjfR+DDLPE9VwPOEArOD14D8zwY/h10U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7AF11AE745C384F8158DBD6798363D8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a321dadf-7247-43fc-6525-08d99b0e9429
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 19:01:56.5959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /wfKjeoEIwnjbKvkIWOw/l8e/GfMJF8shlFXtsbwOyci3ckAV2OL5+ShPkZO/0jIzccphcWWGFnCcwYcxJIV27vfK03FJ6xeK/ZAzy1sY44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1748
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
Cc: Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzEwLzIwMjEgw6AgMTc6NTUsIEFuZHkgU2hldmNoZW5rbyBhIMOpY3JpdMKgOg0K
PiBPbiBXZWQsIE9jdCAyNywgMjAyMSBhdCAwNjozMzo1NFBNICswMzAwLCBBbmR5IFNoZXZjaGVu
a28gd3JvdGU6DQo+PiBXaGVuIGtlcm5lbC5oIGlzIHVzZWQgaW4gdGhlIGhlYWRlcnMgaXQgYWRk
cyBhIGxvdCBpbnRvIGRlcGVuZGVuY3kgaGVsbCwNCj4+IGVzcGVjaWFsbHkgd2hlbiB0aGVyZSBh
cmUgY2lyY3VsYXIgZGVwZW5kZW5jaWVzIGFyZSBpbnZvbHZlZC4NCj4+DQo+PiBSZXBsYWNlIGtl
cm5lbC5oIGluY2x1c2lvbiB3aXRoIHRoZSBsaXN0IG9mIHdoYXQgaXMgcmVhbGx5IGJlaW5nIHVz
ZWQuDQo+IA0KPiBTZWVtcyBub2JvZHkgZnJvbSBQUEMgdG9vayB0aGlzIHBhdGNoLg0KPiBBbnkg
aWRlYSB3aG8gY2FuIHRha2UgaXQ/DQo+IA0KDQpZb3UgaGF2ZSB0byBjaGVjayBpbiBNQUlOVEFJ
TkVSUyBmaWxlIGluIHRoZSByb290IGRpcmVjdG9yeSBvZiBrZXJuZWwgDQpzb3VyY2VzOiBodHRw
czovL2dpdGh1Yi5jb20vbGludXhwcGMvbGludXgvYmxvYi9tYXN0ZXIvTUFJTlRBSU5FUlMNCg0K
VGhhdCdzIE1pY2hhZWwgd2hvIHRha2VzIHRoZW0uIEJ1dCB5b3UgaGF2ZSB0byBhbGxvdyBoaW0g
ZW5vdWdoIHRpbWUgZm9yIGl0Lg0KDQpDaHJpc3RvcGhl
