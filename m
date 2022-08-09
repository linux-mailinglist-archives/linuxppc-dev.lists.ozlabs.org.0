Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D5D58D344
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 07:37:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M21zF1ly8z3bmG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 15:36:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=TZSJOvMA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.84; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=TZSJOvMA;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120084.outbound.protection.outlook.com [40.107.12.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M21yQ5mK9z2xjt
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Aug 2022 15:36:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPlzLxnIVGQiuhY2GXwaszC7P0G9DupNc3lyyx2jhl92SwoqO3UfO/5RKPJ+Olqney/CpFORE5nhMw6DXPlOmIANcGJTqlIe3jC+XTItYtWkQOu2nled9TA0pXztL1GsUzx7BhoXYTjCtDOpynKnyd5s1ZvxjnIWaIKtQC3Z64yb27u8LmHK3/rXoZlfIsUCSy/RuX/do4TZ4FWjrWwB+lgEqy+01gR9M5zfhvVeXgAMLMqvq+CpsZrnNtUKid2tS9yEYpBJYee9qyLojZpDopiD0FaCCx/MH9RRsCp4qRe23b4IH3JvBI6QCgbNseienRDF4rQrKxoz6ekfgJFgXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmR4G/CkRH11OSLkwMcElNMnZ0EptKzw40eigACtVWs=;
 b=JPd7JoaVRdJqrO8bHlLRObGaKmqR1TWnNEchZYvNGvpUs6WmCqREH79XS7/53TCbCpYdBVkpgPMDwmo6Un6aU9MOx1j56aDpAWySZ+RNtj+o3danJxVOSo0EC1ZynE6GOObLyQAW1l5R7uxX2nDP63Y7TkuX+N54qc1TVwBSmxRkUXp1FxLsay3vmRUZfXQ3WPDBHa9olfv0tm7S4fW3qA8xy2YlpD88inLQL02LjgUrDW/KzQozaWHVscZP0IAqvo10En9D7hG6Bzk4M3KK4HDjv0oVU3PNdyNFITzFNI9/+CeaOHGRKJp/mXTmbNLXZ1NQPRCMT1R0MYCZqlSVZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmR4G/CkRH11OSLkwMcElNMnZ0EptKzw40eigACtVWs=;
 b=TZSJOvMA0PpVIX4q3NZ6MeXVfZqlNsHkPzWNW42ZIPCmtGkCoKIit4BfYTL1kBr9yRR8eWh2TBqckHci1eLfod7zyfGVbfoQ+xHepaKRDgf6NMkPYVzUixfZ36NPX32BmNJwrPdGqpbqMYNl8DS+lV4Gpl5MD4+rPJ+VuESljGBN/W+ywxODMtlqILWl1juY0VnNfMw++RY280in/+E6ET/8in76wVe0jnYS0DarVVFkrHjTXApmeBl9+5vFZ88roU6SvOoJeVhsS80pjdW1ZG/ahTkF8l7n9rGNdAdoBSxBMHHX0XJVcVvQB47CYzpuFZJHqRmAgac/fyQiI6JyZA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3869.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:258::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 05:35:54 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5504.021; Tue, 9 Aug 2022
 05:35:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Russell Currey <ruscur@russell.cc>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 1/2] powerpc/mm: Move vm_get_page_prot() out of
 book3s64 code
Thread-Topic: [PATCH v2 1/2] powerpc/mm: Move vm_get_page_prot() out of
 book3s64 code
Thread-Index: AQHYqycXx9GGaCplTkelFJdWUjfH+K2lETQAgACt1wCAAE5tAA==
Date: Tue, 9 Aug 2022 05:35:53 +0000
Message-ID: <ad044111-c84e-14ee-7f9f-3605dc34efa4@csgroup.eu>
References: <20220808130109.30738-1-ruscur@russell.cc>
 <95e380d0-f681-4c6f-d70b-2b5fdf911fa8@csgroup.eu>
 <4dcd228ceb2693c6159465fa6dbccf9d0682b19c.camel@russell.cc>
In-Reply-To: <4dcd228ceb2693c6159465fa6dbccf9d0682b19c.camel@russell.cc>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fef5fd41-68f0-4942-5b61-08da79c90700
x-ms-traffictypediagnostic: PR0P264MB3869:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  XIMXbchao3YF+M75V5BhaGkcFvMHNPFZs6wy1v6PLxgxCWYLl7BFd2gMNd4TD5ZnZqBVNZXnRjyxqSM99YkWQ+zoxRoQqJlXX/gO5hfwOQJySLmRrbhGxcg0kpS70MiezBaUV0DklS5vZhhGt9EAp01NazmUkXmJ/DhWzkbwiBtq4JbXb8fqp7+pzrXuuc1OxfMkgd4P13IavccpRXqF/7ijoz9wmcw17WXvxLXMAlvYaRZAQvJTBv5cXetdI/vnz7g7MlGyc8Id1WhpuZoRVAogQli2HGMSKQQbaMbHmRrQICJFi0F7TYmTP+AbWAwuC/AO6vRNxoiC+MWfDgmTNI+HpB+YPAmqhOxaghZoRdj1KkATOvfOQMcHIj7KaX4oBME98ag/YlWSs5B6IislOut+a9jnnb6uUGACyhJEnJzOa/cb5WWxD7uetRYRoxZig2FWAZ7LRX3bJTfpd2/s5Qibn344IaCsQDwoSgfGq72QC7ll0q/0fp1zWNIOM5boqjegCUzmrn2WGGLEXgn7WU0sSrlgtRh0Gfp0WFSz2OXBFNbHAK++tQAt6vGYlJXKYtJubFR/A5VcDzjNPupK/7KTtLXW6Amtvoc1kiM8j/j62wpkyG1msR6GoU2PBmmBPrVliQEC7nL5aJX9o43HjP2sUb5zEByOmfI4J2BgZFXYFYI4hiA45LplY+cn9FpDPFg+9boX5ZlgGwUpgi+u00MosiOyDHsJH5Xi6IqbyhsHjfb+0B+U9V+79kG3bojGgMlbO2cDGEB1N+Qg4moDLvJeLtGJZwxD2yao2kdYnhI21uPt/sYDI3ch3831Sl16JE39eMKWYSZEfAX80brIXmID/xL5ZNk4Lft+6N2xXPBxrwTOl81St4hRWWtzRoQC
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(39850400004)(366004)(136003)(376002)(346002)(396003)(316002)(41300700001)(38100700002)(36756003)(54906003)(110136005)(26005)(31686004)(6506007)(122000001)(2906002)(6512007)(5660300002)(86362001)(38070700005)(4326008)(8936002)(66946007)(8676002)(31696002)(66476007)(64756008)(66556008)(2616005)(66446008)(91956017)(76116006)(4744005)(6486002)(71200400001)(478600001)(186003)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OXoxbnlxWlJPNnRhS3k3ZkczTTFWUkxzckxzVmRmUDAxN3RrTjdQTjZja0h4?=
 =?utf-8?B?aVZaanNEYVlwRDkyamxsTWNrVGVSeldIRnpkbWF5eElaUEVSbFBLdzFQcHVa?=
 =?utf-8?B?UGRJU1ZtQTFVNlU4aGVUVWFYUXcwTXJQeldROUZPdy9SVTZGOE94cEhidms3?=
 =?utf-8?B?TkpadDkxTUd2Sy91YjBCOHBia3JOeHlaRkVidnpuRFJZMjBaRnhYMm81ODlk?=
 =?utf-8?B?bElqaGNodkxWamFJWGtydDFWVmdRRGR2Z1dMczFVL0VzckQrdjFEbHlIVlVD?=
 =?utf-8?B?UElmblZodUZkOHJ1cU9EZUo5OG5ta3J4c2FGUzdSNENjQjN1S2Q5akhSb2s5?=
 =?utf-8?B?VGJNb21ZblVoeDl0TG9Pdkp2QUdrUnlGSEx2THBjQ2lhL0ZNVXVFd2lsSFN5?=
 =?utf-8?B?cUg2UmM3TjJEelBKS05qZzk5cXVWQnNOUS9vUHNEZ2t1WkNUcnhaTHBrNEhN?=
 =?utf-8?B?VzBIa09KbkdiTGQxYWYzRjFjSHVVNG45MU5xTjR5S1JaTGxWU0tBQjg2aDYy?=
 =?utf-8?B?SmZ0YjhKT2hhU0JDM3ppd2pMcVB1ZFkya253WTJwVXpXM1c1eVVVNE8yTXlW?=
 =?utf-8?B?aGZxc05lRnpmTzJrOXlSYkpHY29ZV1ZJeXVDMDBNMHBhOEQxaEFmbWEwLy9F?=
 =?utf-8?B?QzRHeFR3NFV3QWlIMVFtTmdpakcvblVyUDEwekdQejNPZ1RLeHdBWXNFRkZT?=
 =?utf-8?B?TFZMQUR5Z0tLd2gyeXZ2Z0lZNDFEa3FDL2ZqMmx5RHg5andOOG11NVg4d1Jt?=
 =?utf-8?B?bytTNmx5WitIVTcydm9oNWFSd2FGYzNJTk5HbWV6a1gzb1JTZTI3ams2MTVS?=
 =?utf-8?B?THlDcldrYnY0TS9ZaTJudlV1WHdtclVvR2Z0TFFidWh1MU9FVS9NZXNoWG4z?=
 =?utf-8?B?ZS9nYkZtRVlaaFRZZFhwRmk0Wlc5WTc1RkdlcW16cUl6TFRDeVN3YUNpMEth?=
 =?utf-8?B?dHlwZHllKzNBeTBGKy9qcEZjUS8veVhydzB5OTdKYnEybFZOY2pBcFkvRkgx?=
 =?utf-8?B?Mjk5YnFLUU5BZG5QMHJDNjVUSjZSZ2JDRHZrUDhBdEJOZmlreXJiaUNBcUJp?=
 =?utf-8?B?U3RSM3lrNGhZTU01aU1CK20rVXFXQU5JVFpxUk91YWszSTdPRzRlRjNVV2ZY?=
 =?utf-8?B?WWZMU0pRT2MwdXAzam96aDhJaHJVbzZ5OXdZRUw4OTJJa0FLamF4dm92VlhR?=
 =?utf-8?B?cExUay8vY3lic0tmWm1kOFJEcUNNdlk5YnMvN0pMSU1xV1ZzMldPRkNWZFd5?=
 =?utf-8?B?bVlaOG8zank5WTQ4YTVncko5Qk9ieGpaYmxUcWFvcUZmQXdyOTRhZmkzZXor?=
 =?utf-8?B?WHBqZWxyV0wyd21zS0kxQU4yUWQzNmIyWmhUdE50VGNoT3MxdzN2TktHZTZa?=
 =?utf-8?B?QmtzYURTNy9VTTNhUUs4VWY4ZFU2TG1JQVN5YkkvOG1RRkgwRVpZbjIyQ080?=
 =?utf-8?B?U0tGSUczZHozcm9HcU9DYnRpNUprOFFFMEltUjVZTXQyaCtxa0M0dlJvZG5w?=
 =?utf-8?B?M1JZaVk4ZDlTWjZ5TFRCalY3bHI1d1lzdmJQZHgyVHdMLzhPNHByNWxSSEVP?=
 =?utf-8?B?UGM4QkdkU3RQY1hjTVh4NEJIYjhIaUVlRWZnQnpvMU44WHlLR2ErYVZPYkEy?=
 =?utf-8?B?K0lUTnE2bHdkblZCaXU0SHRTUHg2aFZ5SHZlejhqdmZJb3ltcndKVlJ6VVdl?=
 =?utf-8?B?T2xEWC82U3BkTXJvMVpZYitBaWdnekdGbXFENFhQSDhoN2wyRlZtSW5aU0lT?=
 =?utf-8?B?VDVTb3V5OE83MFhJYTkrMVhqT2RtaXo3SWg0TUI3Q1lhdkF3eVBTNEpMdlM3?=
 =?utf-8?B?RC9tZ0Flc1JmdjZEVmNiZG9oQTJwWWtWbnRSYUJRd1FXOWhrOEZ4L1pWMEMv?=
 =?utf-8?B?VGQybkJRd3pibUh4cXRjODQ3V2hVZURVbkp2dTkzbW93RUw3Y2NXazl6YXNx?=
 =?utf-8?B?SEppMWtEUi9IMFNPcllSa3IvRVFNQ1FFTE1RaWd4aEVPemNHWHp5eVk1ZmND?=
 =?utf-8?B?Ujd2cUZCM2xDQmdZWVNLWTc3U29KMHZGWTFGSGFQdnV6YUlnNEpacy9DWEp6?=
 =?utf-8?B?MnJ4d1ozZ3N4ZjhFaGlIRGxLYUFjV2E4MDZCV29EQS9lUDArMzJWYTJnUlQ5?=
 =?utf-8?B?R0o1TTZCeXFjMUVoa2t5disrKzFMNG9QRU56ekdYMW9QSHlZK203RG9KWnBk?=
 =?utf-8?Q?ds8zpCGFd47JMcZcr//dxl8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13997CCE61E9B4458EDFD66C674B82CF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fef5fd41-68f0-4942-5b61-08da79c90700
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 05:35:53.8572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SNogEb1gnVK84+o8COgSpvj3yuROogTArOeTXGFg5qYFVAYxZeE6iOtw4y3A+9k2HicDXlqMxrfQuoy+lJU5yWlO3TM2x3qq/I5zGrSsqWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3869
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
Cc: "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "anshuman.khandual@arm.com" <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzA4LzIwMjIgw6AgMDI6NTUsIFJ1c3NlbGwgQ3VycmV5IGEgw6ljcml0wqA6DQo+
IE9uIE1vbiwgMjAyMi0wOC0wOCBhdCAxNDozMiArMDAwMCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90
ZToNCj4+DQo+Pg0KPj4gTGUgMDgvMDgvMjAyMiDDoCAxNTowMSwgUnVzc2VsbCBDdXJyZXkgYSDD
qWNyaXTCoDoNCj4+PiBwcm90ZWN0aW9uX21hcCBpcyBhYm91dCB0byBiZSBfX3JvX2FmdGVyX2lu
aXQgaW5zdGVhZCBvZiBjb25zdCwgc28NCj4+PiBtb3ZlDQo+Pj4gdGhlIG9ubHkgbm9uLWxvY2Fs
IGZ1bmN0aW9uIHRoYXQgY29uc3VtZXMgaXQgdG8gdGhlIHNhbWUgZmlsZSBzbyBpdA0KPj4+IGNh
bg0KPj4+IGF0IGxlYXN0IGJlIHN0YXRpYy4NCj4+DQo+PiBXaGF0J3MgdGhlIGFkdmFudGFnZSBv
ZiBkb2luZyB0aGF0ID8gV2h5IGRvZXMgaXQgbmVlZCB0byBiZSBzdGF0aWPCoCA/DQo+Pg0KPj4g
Q2hyaXN0b3BoZQ0KPiANCj4gSXQgZG9lc24ndCBuZWVkIHRvIGJlLCBJIGRpZG4ndCBsaWtlIGhh
dmluZyBpdCBleHBvc2VkIHVubmVjZXNzYXJpbHkuDQo+IEFuZWVzaCdzIHN1Z2dlc3Rpb24gbGV0
cyBpdCBzdGF5IGNvbnN0IHNvIEkgY2FuIGRyb3AgdGhpcyBwYXRjaCBhbnl3YXkuDQoNClllcyBJ
IHRoaW5rIEFuZWVzaCdzIGFwcHJvYWNoIGlzIGJldHRlciBhcyBpdCBrZWVwcyBib29rM3MvNjQg
c3BlY2lmaWMgDQpzdHVmZiBpbiBkZWRpY2F0ZWQgZmlsZS4NCkFsc28gYXMgSSBwcm9iYWJseSBz
YXcgZnJvbSB0aGUgcm9ib3RzLCBpbmNsdWRpbmcgYXNtL3BrZXlzLmggaW4gYSBub24gDQpib28z
czY0IGZpbGUgd2FzIGEgcHJvYmxlbSwgZHVlIHRvIHRoZSBmb2xsb3dpbmcgaW4gdGhhdCBmaWxl
Og0KDQoJI2lmZGVmIENPTkZJR19QUENfQk9PSzNTXzY0DQoJI2luY2x1ZGUgPGFzbS9ib29rM3Mv
NjQvcGtleXMuaD4NCgkjZWxzZQ0KCSNlcnJvciAiTm90IHN1cHBvcnRlZCINCgkjZW5kaWYNCg0K
Q2hyaXN0b3BoZQ==
