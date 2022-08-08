Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3572858C620
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 12:14:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1X9V0D4Xz3bsK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 20:14:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Z0wV/vDs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.70; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Z0wV/vDs;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120070.outbound.protection.outlook.com [40.107.12.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1X8l4mj2z2x9p
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 20:13:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEnO2AJh4rMptecj98VP9957NZiqsv4TALSp29M/V2XtuUYBawIiRfptMn2wvHJxbnaCLXoKIyYnhQRwM5sXHdlGbkqTwjru08FA5xbdU1BRZqYfwwZDfPSzdg6jWzDs9ut2NEwWJLRx0PrdkVe658lmVbq/0DZiu/JFvgkouGvpayyth3+hqEAHpS4rwVsdh7VKNGcCunb4yGrRUwpwnhpHRllnY3dK/IIMjZcnPtjdT9KNfeswVLHjoCcrAeWw/kpmI4SuE/durBBsUa2OazqxOWoowrYRAFsrkvwevRX47tacET6qiJJzpkXvn8QXHGaZVsLV7piUrpmCtHMv0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZFwtsdCOmWwUZ4AcLd9xwxLdQXeFtjCERNR7fBMzso=;
 b=KQeESlLS5snYXRtmal83KWnfBBxfhfVDSRvJYlxL8WYW6h3B/uwysPYFbw/ySsJZ+ZPe3j991FtKIiK8yc8b93b72zkRuXZUWQHLSDebs0cktD0FoGS+EfYuzUJ50rykdIi6WvtoauGpUOQH9wvhJD7Q6tanKZW9H2DZmL67xvE4iiYKBufnWCPP/zB03Upw1aNXDtPJBRofNs0/tIpIen7wGjwIObfSgsUQAv949KRz122R5mtmC9AmYNqjwJRTBCUIxvp40MH4KzwuUC2ZtrRT1VQDjqGIL/GeqxoTMw9Y/CCVsc1ICKg/MEbr4cARxLhPHVRPfCsJs5Ruipf/rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZFwtsdCOmWwUZ4AcLd9xwxLdQXeFtjCERNR7fBMzso=;
 b=Z0wV/vDsPI3fSx/+ZeNXNkxBYN50Gdac698u0QpUR6ax3pzH9RAdW10CRpxPjSM/EY99ZqN7byQNa2FsiuA/Xy2SFq29HGsxtGy9K40ICknO1/3iCwjFF0GT7TPf+DlOEVS4PMOdcs0pil6YbT/nFX8AKlZc1B17kxlxfm/xoWG234NND+rN65q58tHn0kggRQ+IecXj2/FzDo/mAyYEomtJZ0ri9IThOQRbLWU6ft3jj1eLlsCzubKLQhxlU89CrwWYTXBlpCIzKMxPEma+Ps79sMIRoLiZnNAnC6wRar6Q6GcjgSEIOUozeAbjJXaxOmdjxRaYbQ4HPPfzMlbWUQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1547.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 10:13:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 10:13:06 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 04/14] powerpc/32: Remove powerpc select specialisation
Thread-Topic: [PATCH v2 04/14] powerpc/32: Remove powerpc select
 specialisation
Thread-Index: AQHYn+98bSpVPz9Tc02L89W9nXTToK2k3wgA
Date: Mon, 8 Aug 2022 10:13:06 +0000
Message-ID: <75bc5f96-f070-683b-85f5-8b05f040400a@csgroup.eu>
References: <20220725062621.118988-1-rmclure@linux.ibm.com>
In-Reply-To: <20220725062621.118988-1-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d70d0713-b8a4-481a-8618-08da7926966f
x-ms-traffictypediagnostic: PR0P264MB1547:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  dp1hUqWSYQdzEtyM7AW+q9HOhTPh+qk+rVFgVjqUed16yXcQNhnAzrjpEwDzQEvthI2OmsYCLFZY0z3RhdOAvwM98QvSzeBeLF7usA7UyS5NM/GSAZcOGaALAwiOi8nWevy1Ja1iX9P61rFDTaGY+9u/4LbZGSYufqhUOn39LIKHxGghRDFHDeqijp+Pn7XoHM4qXNLCG8EBK+UJmoHoskh8Qd1W+UEz0KEJggi+A3WPojVHnme1O8mixWt+foZoMyTIgQ0EDR0JGkLbI47zv8rj0CFUBGwM8kbFwGtmV7eeGwVn0t5s3MhI7uRZ//xREwsCOmhzRAKQuhClRYt8h5rFQIVZWJyFr1sTFQHWDFBVsvdYYtwdkVSU/WJptEo2NrECke2lXInl/7XbmSsiD4pCDyFzAi2ED+z0ZvYK0TV1ekxyB4jxX3GR17xYPyJybH/n9JDxm3j1I6xdBwbeE1EeGopNwmGDX+FmhCoTdbQ7xcsFdoi2U2RqMVgmKoOc/XFJRyQeIKrP95FDuAH0KXzw55uvMJsTIiUXZW+ztqgcWE4kSJ9R8P+7hopuolUr8EQ5cUJhGYUvVCcEpX4JszbViIUHn1HOuF3Q4iB6RI40IbfQDHVTtwMw/xyxnZeZP7oAksVMzc/h1x5Nai8trN1xEc1SV8Aee2AT1yyrBE0OCF6cB+Wd+ERsaAb04lu6OSeHeOuIH06o1DOMgn3Khx7Mqi+YrgpCYbGE4H8WbVyW79wBk2aiZGReEuc6EXuAxw0OSXoiu6DzZhpaAfvTrFLMB7lFXzkx0hSZIzSiM8lcpo+Lym5/Dg8LBXxTJOBu2bZvgkO9rvzwN60UhOZGby2EhnH2ShTSrDCy66tqiq4U4dYdttHRXkx3h303tKDkCG4My03SP5YjO89ZlPqkhw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(396003)(136003)(39850400004)(366004)(5660300002)(4326008)(44832011)(478600001)(6486002)(2616005)(8936002)(966005)(8676002)(26005)(66446008)(41300700001)(6512007)(76116006)(66476007)(66556008)(86362001)(66946007)(31696002)(6506007)(71200400001)(91956017)(2906002)(64756008)(110136005)(122000001)(38100700002)(38070700005)(66574015)(36756003)(186003)(31686004)(54906003)(316002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bCs4Wkc0T2w4WVgyelFqaUtqcGxLZkdoWWFIaHVlZjhEQTBzaW9NVEpWUVRQ?=
 =?utf-8?B?cURHMnNiR29DMmFZQ0hEckpVUjN0UGxORVBhejFRYzEyRGRDTUpMNytNNWVj?=
 =?utf-8?B?dmxLczF6RlhWTWFncE9xb0ordXJMNkhIMFNZbTdTY014YjI2UGN1K3g4aGl1?=
 =?utf-8?B?bVdYNS9QN3FPS0dyajlGUm02bThaOFRoVzNBUEVTN2lSQUdoS0xvbWF1eU9n?=
 =?utf-8?B?TVpvUHhwUFBmVWRVdHM4d0dUMHp2WE5aQXQydnJHeUxvLzF3NGY3Y0ZOV2RN?=
 =?utf-8?B?UFF0T1FTV2hZdUQ5UUpUckdjYVIxSXovWHg0SDc3ekM4OU8vYUM2NmkxUTc3?=
 =?utf-8?B?ejlFQThRZ0ZKcFBUMmUwdjErOVQ4Sm9MbnBTZ2hyRWdOMVpOc2VLaEk3UjNZ?=
 =?utf-8?B?TkVsbmIyQTl4QkNCWm5vbDlyemkvUHlaamQzY2RWR3lKR0ZadmFYcEhHdnFx?=
 =?utf-8?B?QVhXenlsOVF5WWFRNGNXM0ZLT1UxQlpuMEtRdUtlc20rbEs1a1U3WnNoVTNh?=
 =?utf-8?B?ZzkyNGZFNGdkVS93NWhVd1g2VEE4R2RkVGpCQ2c3MFFTN3ZpWG5MekFNeFRH?=
 =?utf-8?B?ZEttQ1JCUWRJTzN5UWV1SnU5alhWQmdObERGc3h4YWtrTzVMYm5VeUN5MGtx?=
 =?utf-8?B?QTZwVTVJdzJ3V1VHUmxNcFVvNmlpTUQ2VDA1VTBvMTdZc3hiTWw3WUI4VVhS?=
 =?utf-8?B?U2VCWFFUYmQ2THU3RkxVNzFMcC81b2l5MmVrN1NSWjhmZG8yQUMyeXRjQUla?=
 =?utf-8?B?dW1GUmxoZlduR0Q1WkdJS2ttWnZ6Vm5IS2h6KzlzRDN6SHFoTi9zQXNWL2E0?=
 =?utf-8?B?YXNBem9kemY1Rmx6VitaeU8yZFBqRUlVRjZ3V1RHMEtKMXpDK3NxeFJtLzFu?=
 =?utf-8?B?Z1k1WTFKVlQ2TENhek0yN3ZQeC9hQUVKNGtadWhwTjJORXhBVUJTU0tTV0l5?=
 =?utf-8?B?WmlOTWEySXVPUnBqdFlHb0djcWJwa0w2K24yT3oxNG5CZ3c1aUM1M2t2d1ZC?=
 =?utf-8?B?bDgxK3RNRGEyeW83dUM5eXRkbEZCRDVhOUVqY0N4MmZVU3IvUmZ2VkhIdmFX?=
 =?utf-8?B?SEV0MC9HR0VYdmkrcnBNWk9qNkcyUzdZRUVUY2xxaGJmcjZzNjgycmZEYnZE?=
 =?utf-8?B?Y1VnVkNyQUlDMlFoNTRxMUdlNERiN0lkNU9TT05KQTZ0NFVPM0t5eXNaVklx?=
 =?utf-8?B?YVBaUGdHZHpLdXgyeFRTS09ORllnQ1lVOW5JQlFTQjBIdU5WQXMvbXhIVUhh?=
 =?utf-8?B?c29MV0dEN1kyZldSQmFqbVNRNDVRbXBLYlQ3ZnBQRlZsSXpxNXprYlZtZUdC?=
 =?utf-8?B?Zy81RCtEaDdvRW13dEJyMzZTNWxNNkdBYTF3WXNZOGdiYjdZMTA4b3J1UnpI?=
 =?utf-8?B?eFhvQkIvM2Vnamt5MWNyMHVTWDRpMVlla3JsbmZxbkxCcC8weXoxQkNrNHRZ?=
 =?utf-8?B?RERBUENHVEYyclZOb25RbEpjQ0ZpKzFta0UzSmRaWERiL21oUWdBMzhHT0RP?=
 =?utf-8?B?RXJNMjFIUnJTbWdSazliTFVyaFNTelJ5cHM0WXc4M0s3TzZFL2gvSmVRQ1Q5?=
 =?utf-8?B?RTcyVXlmdHJJam9sUmV2UUZGU1VnSWxKVngyU0ZZeUVTT1pNWEJiSzB0TlZP?=
 =?utf-8?B?WVg2ME04b01XMktDNGRCMDZDQVNoYWxNQWxwT3BUcEpFRFBrcG04OTRzV0tE?=
 =?utf-8?B?SXA4WldVZWN0Q3NHYmE2NXExUmNaci9KY3U4RXM0a05hZTlmUTA3c2o3U3VK?=
 =?utf-8?B?ei9zcE1hTExDOEJ1a21zd2QrdTZsZHIzWXVPMWVyK2orbXNhaHJKQmg0ZzA4?=
 =?utf-8?B?U2M1aGhVajlLSW9XVlRyUDlxN2VmZDg2WW9UaHczNy92STFBWE1DK1hxZ0xv?=
 =?utf-8?B?MHEzeGRWcFBlR3FXUjAzLytRUkF0aXRhR2tKWHB1TExaaThWakRtdzBGUnB0?=
 =?utf-8?B?N2NNcGhCV1JUYVZ2cDJKcTI1Qmlmc3RIMGUzUzBJb0lES3lKcHNid1VVYmpT?=
 =?utf-8?B?Zk9qYzNGckxKekduYnZSMy9CV2J6SzNsRVJUN3p1bUlUUDVyTjlHTGlva2R5?=
 =?utf-8?B?eWZtK3ZEK3hZNldJT3hzL2kwbzdBV2dWV3NIT2paNEMyWTlDaU9CbVlXTm5n?=
 =?utf-8?B?bm4rZ3Vna0RtdVhBTmlHTlNZNTBLNXJzSjM5MzJLUUQwbTdiSGRGMFdPTEVj?=
 =?utf-8?Q?Dl9DoEPS3vOWNg1J3c4SPAM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BDD41CFD17D13544934468123482325F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d70d0713-b8a4-481a-8618-08da7926966f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 10:13:06.5799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zXmPDI2pgmSYY99FixsMim5C5ugK1HoURNsREyddkbIb3nMinCkvNiDrKw1AecLe6mj1KTErDKY4G3Ncly98SYMwiElBfQbl8UJZnxw/u0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1547
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
Cc: "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzA3LzIwMjIgw6AgMDg6MjYsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBT
eXNjYWxsICM4MiBoYXMgYmVlbiBpbXBsZW1lbnRlZCBmb3IgMzItYml0IHBsYXRmb3JtcyBpbiBh
IHVuaXF1ZSB3YXkgb24NCj4gcG93ZXJwYyBzeXN0ZW1zLiBUaGlzIGhhY2sgd2lsbCBpbiBlZmZl
Y3QgZ3Vlc3Mgd2hldGhlciB0aGUgY2FsbGVyIGlzDQo+IGV4cGVjdGluZyBuZXcgc2VsZWN0IHNl
bWFudGljcyBvciBvbGQgc2VsZWN0IHNlbWFudGljcy4gSXQgZG9lcyBzbyB2aWEgYQ0KPiBndWVz
cywgYmFzZWQgb2ZmIHRoZSBmaXJzdCBwYXJhbWV0ZXIuIEluIG5ldyBzZWxlY3QsIHRoaXMgcGFy
YW1ldGVyDQo+IHJlcHJlc2VudHMgdGhlIGxlbmd0aCBvZiBhIHVzZXItbWVtb3J5IGFycmF5IG9m
IGZpbGUgZGVzY3JpcHRvcnMsIGFuZCBpbg0KPiBvbGQgc2VsZWN0IHRoaXMgaXMgYSBwb2ludGVy
IHRvIGFuIGFyZ3VtZW50cyBzdHJ1Y3R1cmUuDQo+IA0KPiBUaGUgaGV1cmlzdGljIHNpbXBseSBp
bnRlcnByZXRzIHN1ZmZpY2llbnRseSBsYXJnZSB2YWx1ZXMgb2YgaXRzIGZpcnN0DQo+IHBhcmFt
ZXRlciBhcyBiZWluZyBhIGNhbGwgdG8gb2xkIHNlbGVjdC4gVGhlIGZvbGxvd2luZyBpcyBhIGRp
c2N1c3Npb24NCj4gb24gaG93IHRoaXMgc3lzY2FsbCBzaG91bGQgYmUgaGFuZGxlZC4NCj4gDQo+
IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMTM3MzdkZTUtMGViNy1lODgxLTlh
ZjAtMTYzYjBkMjlhMWEwQGNzZ3JvdXAuZXUvDQo+IA0KPiBBcyBkaXNjdXNzZWQgaW4gdGhpcyB0
aHJlYWQsIHRoZSBleGlzdGVuY2Ugb2Ygc3VjaCBhIGhhY2sgc3VnZ2VzdHMgdGhhdCBmb3INCj4g
d2hhdGV2ZXIgcG93ZXJwYyBiaW5hcmllcyBtYXkgcHJlZGF0ZSBnbGliYywgaXQgaXMgbW9zdCBs
aWtlbHkgdGhhdCB0aGV5DQo+IHdvdWxkIGhhdmUgdGFrZW4gdXNlIG9mIHRoZSBvbGQgc2VsZWN0
IHNlbWFudGljcy4geDg2IGFuZCBhcm02NCBib3RoDQo+IGltcGxlbWVudCB0aGlzIHN5c2NhbGwg
d2l0aCBvbGRzZWxlY3Qgc2VtYW50aWNzLg0KPiANCj4gUmVtb3ZlIHRoZSBwb3dlcnBjIGltcGxl
bWVudGF0aW9uLCBhbmQgdXBkYXRlIHN5c2NhbGwudGJsIHRvIHJlZmVyIHRvIGVtaXQNCj4gYSBy
ZWZlcmVuY2UgdG8gc3lzX29sZF9zZWxlY3QgZm9yIDMyLWJpdCBiaW5hcmllcywgaW4ga2VlcGlu
ZyB3aXRoIGhvdw0KPiBvdGhlciBhcmNoaXRlY3R1cmVzIHN1cHBvcnQgc3lzY2FsbCAjODIuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1cmVAbGludXguaWJtLmNvbT4N
Cg0KTW92ZSB0aGlzIGJlZm9yZSBwYXRjaCAxLCBpdCB3aWxsIHJlbW92ZSBvbmUgY2hhbmdlIGlu
IHBhdGNoIDEuDQoNCg0KPiAtLS0NCj4gVjEgLT4gVjI6IFJlbW92ZSBhcmNoLXNwZWNpZmljIHNl
bGVjdCBoYW5kbGVyDQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvc3lzY2FsbHMuYyAg
ICAgICAgICAgICAgIHwgMTggLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2tl
cm5lbC9zeXNjYWxscy9zeXNjYWxsLnRibCAgICAgfCAgMiArLQ0KPiAgIC4uLi9hcmNoL3Bvd2Vy
cGMvZW50cnkvc3lzY2FsbHMvc3lzY2FsbC50YmwgIHwgIDIgKy0NCj4gICAzIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9wb3dlcnBjL2tlcm5lbC9zeXNjYWxscy5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9zeXNj
YWxscy5jDQo+IGluZGV4IDlmMzM5YmNiNDMzZC4uMGFmYmNiZDUwNDMzIDEwMDY0NA0KPiAtLS0g
YS9hcmNoL3Bvd2VycGMva2VybmVsL3N5c2NhbGxzLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tl
cm5lbC9zeXNjYWxscy5jDQo+IEBAIC03NCwyNCArNzQsNiBAQCBTWVNDQUxMX0RFRklORTYobW1h
cCwgdW5zaWduZWQgbG9uZywgYWRkciwgc2l6ZV90LCBsZW4sDQo+ICAgCXJldHVybiBkb19tbWFw
MihhZGRyLCBsZW4sIHByb3QsIGZsYWdzLCBmZCwgb2Zmc2V0LCBQQUdFX1NISUZUKTsNCj4gICB9
DQo+ICAgDQo+IC0jaWZkZWYgQ09ORklHX1BQQzMyDQo+IC0vKg0KPiAtICogRHVlIHRvIHNvbWUg
ZXhlY3V0YWJsZXMgY2FsbGluZyB0aGUgd3Jvbmcgc2VsZWN0IHdlIHNvbWV0aW1lcw0KPiAtICog
Z2V0IHdyb25nIGFyZ3MuICBUaGlzIGRldGVybWluZXMgaG93IHRoZSBhcmdzIGFyZSBiZWluZyBw
YXNzZWQNCj4gLSAqIChhIHNpbmdsZSBwdHIgdG8gdGhlbSBhbGwgYXJncyBwYXNzZWQpIHRoZW4g
Y2FsbHMNCj4gLSAqIHN5c19zZWxlY3QoKSB3aXRoIHRoZSBhcHByb3ByaWF0ZSBhcmdzLiAtLSBD
b3J0DQo+IC0gKi8NCj4gLVNZU0NBTExfREVGSU5FNShwcGNfc2VsZWN0LCBpbnQsIG4sIGZkX3Nl
dCBfX3VzZXIgKiwgaW5wLA0KPiAtCQlmZF9zZXQgX191c2VyICosIG91dHAsIGZkX3NldCBfX3Vz
ZXIgKiwgZXhwLA0KPiAtCQlzdHJ1Y3QgX19rZXJuZWxfb2xkX3RpbWV2YWwgX191c2VyICosIHR2
cCkNCj4gLXsNCj4gLQlpZiAoKHVuc2lnbmVkIGxvbmcpbiA+PSA0MDk2KQ0KPiAtCQlyZXR1cm4g
c3lzX29sZF9zZWxlY3QoKHZvaWQgX191c2VyICopbik7DQo+IC0NCj4gLQlyZXR1cm4gc3lzX3Nl
bGVjdChuLCBpbnAsIG91dHAsIGV4cCwgdHZwKTsNCj4gLX0NCj4gLSNlbmRpZg0KPiAtDQo+ICAg
I2lmZGVmIENPTkZJR19QUEM2NA0KPiAgIHN0YXRpYyBpbmxpbmUgbG9uZyBkb19wcGM2NF9wZXJz
b25hbGl0eSh1bnNpZ25lZCBsb25nIHBlcnNvbmFsaXR5KQ0KPiAgIHsNCj4gZGlmZiAtLWdpdCBh
L2FyY2gvcG93ZXJwYy9rZXJuZWwvc3lzY2FsbHMvc3lzY2FsbC50YmwgYi9hcmNoL3Bvd2VycGMv
a2VybmVsL3N5c2NhbGxzL3N5c2NhbGwudGJsDQo+IGluZGV4IDU5ZDkyNTlkZmJiNS4uYzZjZmNk
ZjUyYzU3IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL3N5c2NhbGxzL3N5c2Nh
bGwudGJsDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvc3lzY2FsbHMvc3lzY2FsbC50YmwN
Cj4gQEAgLTExMCw3ICsxMTAsNyBAQA0KPiAgIDc5CWNvbW1vbglzZXR0aW1lb2ZkYXkJCQlzeXNf
c2V0dGltZW9mZGF5CQljb21wYXRfc3lzX3NldHRpbWVvZmRheQ0KPiAgIDgwCWNvbW1vbglnZXRn
cm91cHMJCQlzeXNfZ2V0Z3JvdXBzDQo+ICAgODEJY29tbW9uCXNldGdyb3VwcwkJCXN5c19zZXRn
cm91cHMNCj4gLTgyCTMyCXNlbGVjdAkJCQlzeXNfcHBjX3NlbGVjdAkJCXN5c19uaV9zeXNjYWxs
DQo+ICs4MgkzMglzZWxlY3QJCQkJc3lzX29sZF9zZWxlY3QJCQlzeXNfbmlfc3lzY2FsbA0KPiAg
IDgyCTY0CXNlbGVjdAkJCQlzeXNfbmlfc3lzY2FsbA0KPiAgIDgyCXNwdQlzZWxlY3QJCQkJc3lz
X25pX3N5c2NhbGwNCj4gICA4Mwljb21tb24Jc3ltbGluawkJCQlzeXNfc3ltbGluaw0KPiBkaWZm
IC0tZ2l0IGEvdG9vbHMvcGVyZi9hcmNoL3Bvd2VycGMvZW50cnkvc3lzY2FsbHMvc3lzY2FsbC50
YmwgYi90b29scy9wZXJmL2FyY2gvcG93ZXJwYy9lbnRyeS9zeXNjYWxscy9zeXNjYWxsLnRibA0K
PiBpbmRleCA0MzcwNjZmNWM0YjIuLmI0Yzk3MGM5YzZiMSAxMDA2NDQNCj4gLS0tIGEvdG9vbHMv
cGVyZi9hcmNoL3Bvd2VycGMvZW50cnkvc3lzY2FsbHMvc3lzY2FsbC50YmwNCj4gKysrIGIvdG9v
bHMvcGVyZi9hcmNoL3Bvd2VycGMvZW50cnkvc3lzY2FsbHMvc3lzY2FsbC50YmwNCj4gQEAgLTEx
MCw3ICsxMTAsNyBAQA0KPiAgIDc5CWNvbW1vbglzZXR0aW1lb2ZkYXkJCQlzeXNfc2V0dGltZW9m
ZGF5CQljb21wYXRfc3lzX3NldHRpbWVvZmRheQ0KPiAgIDgwCWNvbW1vbglnZXRncm91cHMJCQlz
eXNfZ2V0Z3JvdXBzDQo+ICAgODEJY29tbW9uCXNldGdyb3VwcwkJCXN5c19zZXRncm91cHMNCj4g
LTgyCTMyCXNlbGVjdAkJCQlzeXNfcHBjX3NlbGVjdAkJCXN5c19uaV9zeXNjYWxsDQo+ICs4Mgkz
MglzZWxlY3QJCQkJc3lzX29sZF9zZWxlY3QJCQlzeXNfbmlfc3lzY2FsbA0KPiAgIDgyCTY0CXNl
bGVjdAkJCQlzeXNfbmlfc3lzY2FsbA0KPiAgIDgyCXNwdQlzZWxlY3QJCQkJc3lzX25pX3N5c2Nh
bGwNCj4gICA4Mwljb21tb24Jc3ltbGluawkJCQlzeXNfc3ltbGluaw==
