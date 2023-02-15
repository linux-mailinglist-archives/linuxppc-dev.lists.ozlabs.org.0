Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5D2697747
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 08:18:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGqF01v2Dz3f3L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 18:18:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=eNpCf8XJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:fe0e::627; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=eNpCf8XJ;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0627.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::627])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGqCN00SBz3cjB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 18:17:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAR03r0eFcbzG4kJaty/wYtik6ORSM/teW+XLThe9Vzoo02rpwYihDxwnf3XnAMbReKg2Lt8VmH2dNS7nTc+aNi5LVbZ1bK3ez4CeEPBwmCejZFWqxYxbajG3oUH8FSgQCmgh98yKe0jBwWITZyzO6otS9rkbhpXO/BZj2p5IWLWd6yjSlmON1E18kGcBDvpZXVt/l0WgBz+QTI3AcWHGqQsujWqnwypYoiSZQi9MJG4K7/B0e+wKE1KRZmvaVDDmAy8TT5NqPPSX2whEHjYRT3niotedeI5M39Svkhc7nzOEfBUjgO7k9uy6aSIpoFJqAayrUoRsdP0/ZDV9SkknQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuYlGYTcYBhoPINcq90dnwd8xWowGhkca6Qx0gNsu3s=;
 b=bUpcXYjm7IrnyMk4Mn3RqueJOOGf6RlXYOVH9vfBRwAYUqKVdKxIA32D43wDoOk7ax5632icAShQ11EW37OTGqUKzEsPjsSOo1ku2t5LyQQ3dVDnQalzXVma7n2e06ChNoaQtQo74nHYDFflksoizx96/+o+z9Y26+/Y4fyxmAl4PSv2kVYp97XmggwoSi9iVN9TJeRcljtmnwxaZu+4Edjrop1sUoUcAl0f+p0fcROkOjwF2bAOJ5xlXk8UE6w0yUW2blNtX/BzhU7/GlSmxslm/t01Qm8vv0DCkDMj10vpVyT1niC0oKQX7f80zK9HQrJKwkqq8O1fd/XQamqYaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuYlGYTcYBhoPINcq90dnwd8xWowGhkca6Qx0gNsu3s=;
 b=eNpCf8XJupnbHGHyOnZnyDdO4FDSaN9PmQX2BEiUWhwg9Kos9SmWAi08VyQ6VPpjAkzlxC1oupPAQUBCQLnDCovlwg7cB85mAp2JgKZp9NcuUbokfo9zL7N7zD1ORTBegCaIwoO23aYC5gREb6XsYbPDEdCA9Tph+KeFiBbr4mdrHu6SzK1tOnyKG120j2yLRWzhU/1LpAUb362bxivuavaQzY+GxJgDB91URhT8L325AAxDVRV521sX/wRu6OHnxmCp2CovV6tVt5mwpN+/b1T1VK0NKk7/3ax2+VWV0N7AseN06r1wPA8iTYZt0IePGnFXTEjtLVY8dE0y81kiyA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3433.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:148::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 07:17:00 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%5]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 07:17:00 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v7 4/7] powerpc: mm: Implement p{m,u,4}d_leaf on all
 platforms
Thread-Topic: [PATCH v7 4/7] powerpc: mm: Implement p{m,u,4}d_leaf on all
 platforms
Thread-Index: AQHZQOHMNQlNogyNxkaCmm3EsqRDra7PmTiA
Date: Wed, 15 Feb 2023 07:16:59 +0000
Message-ID: <438c73ac-104b-0e49-6247-82eb3b265b5e@csgroup.eu>
References: <20230215020155.1969194-1-rmclure@linux.ibm.com>
 <20230215020155.1969194-5-rmclure@linux.ibm.com>
In-Reply-To: <20230215020155.1969194-5-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3433:EE_
x-ms-office365-filtering-correlation-id: 1806224d-4ea2-4dd1-9927-08db0f24a129
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  edv4ldGFejFHPRQl0q6Y4eFAI431NdTqf0gjXFfJzQFiMMpV8/aXx3e+rMs7f1RehJrZf45Hm/sIFzcA5+BsdrKQTHdWUro6IbWkGlxXiayxO/DHZSmOBeRxFWaqk8nYAaAg/744Pd//s9+H7Xt9R6NmJ7pWJQ5zXgo31QLs5kz2vIVgw3oeFYP6sccw7X2z3VWpCCZ2589Ra2nNeTog0CPoyyMJ55L5Wbq9dxZ/3lcmv+umATbasO/L55DF1VmfcVtrBmwd4jQaIDZZkDPZLLNcmD20g7OBJW9I41czZkm2JvmshcB3sT2C5M/1mN5Zjw1WoVmlPXSO8ZsORsjGncUsi9Fa2xudxFOVsCsEJESFwlYoV4SSKwUL2LAcT6f54wPZIiEqgt6dCuegcrjr6yfY4FD7+V3+L7lC16QSa4zPw6+om6bbmHpTLDCztRV4tf0FkJFNBtQG8tQ8diD0f0e55VTARdKtWGgiyQIt6/1cwuZkXlyXTmsNvsRktAtElO+qREhbMJqbYb6UTGsDtW/gHYGUpISwwnXEe74dXrw4BAAyUD8tIo0dhLRyrLzcV7owU701IOhecIF6GJpYD/1LpI6vvl3Jb3yEX4AT23qbYaFcUmydS2t7nzT+EbfPCAcshP+LAe5r0JKCPSfRxDUNOUu82MM6tV6p4B0SwHvZE3Am56rfy7lpAHfHJFxyZ/eX5ZSYwHPHaV0mGLodY67Vo0urkt67lBHcfmO9hV1dzQ9WgpkArOUqbmY/NcSBsd+anwwvm9p7Ucg2CHEIyw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199018)(5660300002)(2616005)(36756003)(478600001)(66446008)(86362001)(64756008)(66476007)(66556008)(316002)(4326008)(110136005)(66946007)(91956017)(6486002)(76116006)(71200400001)(8676002)(31696002)(26005)(8936002)(6512007)(38070700005)(186003)(6506007)(41300700001)(2906002)(122000001)(38100700002)(31686004)(83380400001)(66574015)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Y2drNHRjcngyNmZSb1gxeEljbldSMHl5dlIwQlNINmluYmxBSjR1dXhEaEZr?=
 =?utf-8?B?bDIrK2loc3JEQzRsdmxEL1puMk5lZHNZelhCa2dzVXVxTUhjZms3UjBlM1Vi?=
 =?utf-8?B?Wm45aVdZNGo1R2Q5VHhDRDlaNlZUdXNJK04rZFlPR3hYYUZHbEVvVE1wRUJX?=
 =?utf-8?B?VVRIV1hRN281SDdwOURQWjRDZ1JSeVhmVmxrWndRMHdiaHZoMFdPWit6N1Ja?=
 =?utf-8?B?aHpFTE1XZFI4UE42bmZ6a1lmNU1sNjBKd29DbFc5emEyZ3NYcWV6QitVNUxs?=
 =?utf-8?B?NzZQY2dOTWlMSXRDdnhqaDVnSTJFd0p3RHBIRVN0UmZYZzRSTmhkZlZjdFRT?=
 =?utf-8?B?YWlwSStJOWlZQkxYRjYwSEZCMHUrWkdmNXJ2blVuNi9ycE1kZkpuMXlBNHdJ?=
 =?utf-8?B?bGVNU2Z5SE9YSkpDdE4wTjZObDEwSXVrb0JqVjltb3JJQVNSa2c2TmxCQ2R4?=
 =?utf-8?B?Y3FhcEZXTFR0WEgxU2NzdVd2YWJhWXZCREVScG9qRmlWR1BSdHBRTTBhU0ZU?=
 =?utf-8?B?QTlHZUtiNDhsTEVlaElnMGxOa09uS2lWSGZPaWdSWWFmWm16TmZyTW1LSUQx?=
 =?utf-8?B?bi96OU0xOWQ1NWNQWFZwT1FtNUNZM3JRYlpnaHNWLzUrRGlJdHA3eUp2M1M1?=
 =?utf-8?B?SURqbnIvRndheWpIUmN3T3FYMUhnMWt0YThrcGhORUtvYkN3Q0pjV1hHWUc1?=
 =?utf-8?B?S0kwSklMNXRueUVFY051OCtJUWxlbHNNc29VdW1pNWRsdUk2WDJDUnZHYkJB?=
 =?utf-8?B?Zy8zcVErVnZzWmJQTFErMHZYelQxcnRWcUNEYjQ5c0o5T1c2L1lUMTYzR3FO?=
 =?utf-8?B?ZVZGK1BkeGRaUHhkbm5qM1BuK2lSYTdZNkxCb2pyc2NScTQ5eDlSMmNXOXJm?=
 =?utf-8?B?TzhqS3F4MDFoR1FJVjNxS3hrQnVDUlJmMnlSZ1M3U09Zb1dxQStFM3ZWUTZt?=
 =?utf-8?B?UHNneWpaUzdjZnNhWmxPWmt5TTZtUWVGRytxUGVSbjRpa3grb0hlZE9aUkJt?=
 =?utf-8?B?N0FIUGNPQ29uVXdyTlk4TlhDV2tiMVVENENTdmt2UEwwZ3YzSThGUmNPOUl1?=
 =?utf-8?B?THR2VW8xek43ZTI0UTI0TWRJdHBaOHUvR0NVRDlSSE9IVjJ1MEpxT054L0lL?=
 =?utf-8?B?WGVOYnJsRTFBaExhamJvQ0NXbnNPQ0dxNzIwaWx2UUw1VlNRNDlTdEhDeHJV?=
 =?utf-8?B?YkZSclBwbG5ZQlpkd2dSbmhqZWkvMEYwb0V0WjFNSHJ5dklEVGVRTXhob0ww?=
 =?utf-8?B?eUNkdDlwRDRzaE9iL0s3SGd5eVZSNm14Sk1mZ2g4VGI0WmtGTUpDSmVwZXkr?=
 =?utf-8?B?d1dMQW5YN2VieVhQWFRQamJmMDlBWll3SklZNFRpVzVaRDZLeHlPMzlDa0ZN?=
 =?utf-8?B?VXZwejZKRFNRbStyaWNpazZNVllpQlRFZGVLai83Y1F6eUZDbTEwZjZYQ0ZC?=
 =?utf-8?B?bU5hSS9Rb3JpQ28xTTNmcXE4bExibERwVTBZTHIwdUpkaXhKMXFQWTNKRTRN?=
 =?utf-8?B?b3ZGRVBrRzNLMTk5MXFMelNubC9FQVRsbmUyamxBc0N5MVNSY2tSRWRGQlNr?=
 =?utf-8?B?cGdJS0ZNNUZRVHN3VVROdVVMZURjekhXaWxrNUFrRFJENHJBbXlNa3NWY3NS?=
 =?utf-8?B?SGgxaWFQblhkdmEyZ2pzU3dGcnhTRVpkTzdudjVYT09QYlZScUhmUlQ0TDRo?=
 =?utf-8?B?U0NsS1c1ZHNoZHczU3V3cTlncUt5THEzdGxRT0lMNitpVnZobWx4RyszTkZE?=
 =?utf-8?B?SHNTZUFKMWxHWjlXWjkwVEdqcUUrbUJ3eDRCMnJEZTBQbURnMDJhZHBiaGNy?=
 =?utf-8?B?ZFAyYzBDTURGaVhCN1F6UWl1U0VRWnpzSEh4NTg1UkNnU0o3bTZVS0JRMVJJ?=
 =?utf-8?B?NGpYUktIL3FFcHZudWM2YWx5T05YRjRhOFZNK0Z2SFZiaU1lQ3UxRGxvclV0?=
 =?utf-8?B?akdFSlAxRTE4R0VKZFRxQ2U3dExIcnFFOE1Qb1ErcDV5bklqZ1JpcE5uSDMw?=
 =?utf-8?B?NU1TTWx6a1FkSmRxVzdzWTlwR3krQUs1SFE4VzdCbjNUR0tYT29BdnFJVzRB?=
 =?utf-8?B?ZG02dGlwTDFvOXl0MXJZYVdtMFRoMzZiaUZQa1ZzMU56eE1UQWlpTU5iVlVY?=
 =?utf-8?B?amF1VzFsa0dONXJoRjlaTEJJL0VCT1NIOVQzYkpXb2xkNllBZTZNSmY5dGh6?=
 =?utf-8?B?R1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D4D3D59DFFBE14694F55EBE86E46043@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1806224d-4ea2-4dd1-9927-08db0f24a129
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2023 07:16:59.9685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FetuBJOodYZKlbmcsSLpX+w7tq3DLXgdeHGhJIzkREJce6XltxGrd+v3nDGbX0G7B7EpvpFrmr6JaXTc7yvuOPBks0RCqo8cvu/PpRM9pqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3433
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE1LzAyLzIwMjMgw6AgMDM6MDEsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBU
aGUgY2hlY2sgdGhhdCBhIGhpZ2hlci1sZXZlbCBlbnRyeSBpbiBtdWx0aS1sZXZlbCBwYWdlcyBj
b250YWlucyBhIHBhZ2UNCj4gdHJhbnNsYXRpb24gZW50cnkgKHB0ZSkgaXMgcGVyZm9ybWVkIGJ5
IHB7bSx1LDR9ZF9sZWFmIHN0dWJzLCB3aGljaCBtYXkNCj4gYmUgc3BlY2lhbGlzZWQgZm9yIGVh
Y2ggY2hvaWNlIG9mIG1tdS4gSW4gYSBwcmlvciBjb21taXQsIHdlIHJlcGxhY2UNCj4gdXNlcyB0
byB0aGUgY2F0Y2gtYWxsIHN0dWJzLCBwe20sdSw0fWRfaXNfbGVhZiB3aXRoIHB7bSx1LDR9ZF9s
ZWFmLg0KPiANCj4gUmVwbGFjZSB0aGUgY2F0Y2gtYWxsIHN0dWIgZGVmaW5pdGlvbnMgZm9yIHB7
bSx1LDR9ZF9pc19sZWFmIHdpdGgNCj4gZGVmaW5pdGlvbnMgZm9yIHB7bSx1LDR9ZF9sZWFmLiBB
IGZ1dHVyZSBwYXRjaCB3aWxsIGFzc3VtZSB0aGF0DQo+IHB7bSx1LDR9ZF9sZWFmIGlzIGRlZmlu
ZWQgb24gYWxsIHBsYXRmb3Jtcy4NCj4gDQo+IEluIHBhcnRpY3VsYXIsIGltcGxlbWVudCBwdWRf
bGVhZiBmb3IgQm9vazNFLTY0LCBwbWRfbGVhZiBmb3IgYWxsIEJvb2szRQ0KPiBhbmQgQm9vazNT
LTY0IHBsYXRmb3Jtcywgd2l0aCBhIGNhdGNoLWFsbCBkZWZpbml0aW9uIGZvciBwNGRfbGVhZi4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvaGFuIE1jTHVyZSA8cm1jbHVyZUBsaW51eC5pYm0uY29t
Pg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dy
b3VwLmV1Pg0KDQo+IC0tLQ0KPiB2NTogU3BsaXQgcGF0Y2ggdGhhdCByZXBsYWNlcyBwe20sdSw0
fWRfaXNfbGVhZiBpbnRvIHR3byBwYXRjaGVzLCBmaXJzdA0KPiByZXBsYWNpbmcgY2FsbHNpdGVz
IGFuZCBhZnRlcndhcmQgcHJvdmlkaW5nIGdlbmVyaWMgZGVmaW5pdGlvbi4NCj4gUmVtb3ZlIGlm
bmRlZi1kZWZpbmVzIGltcGxlbWVudGluZyBwe20sdX1kX2xlYWYgaW4gZmF2b3VyIG9mDQo+IGlt
cGxlbWVudGluZyBzdHVicyBpbiBoZWFkZXJzIGJlbG9uZ2luZyB0byB0aGUgcGFydGljdWxhciBw
bGF0Zm9ybXMNCj4gbmVlZGluZyB0aGVtLg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vYm9vazNzLzMyL3BndGFibGUuaCB8ICA1ICsrKysrDQo+ICAgYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmggfCAxMCArKysrLS0tLS0NCj4gICBhcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vbm9oYXNoLzY0L3BndGFibGUuaCB8ICA2ICsrKysrKw0KPiAgIGFy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvcGd0YWJsZS5oICAgIHwgIDYgKysrKysrDQo+
ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaCAgICAgICAgICAgfCAyMiArKy0t
LS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDUgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwg
MjYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL2Jvb2szcy8zMi9wZ3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNz
LzMyL3BndGFibGUuaA0KPiBpbmRleCA3NTgyM2YzOWUwNDIuLmEwOTBjYjEzYTRhMCAxMDA2NDQN
Cj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy8zMi9wZ3RhYmxlLmgNCj4g
KysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy8zMi9wZ3RhYmxlLmgNCj4gQEAg
LTI0Miw2ICsyNDIsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIHBtZF9jbGVhcihwbWRfdCAqcG1k
cCkNCj4gICAJKnBtZHAgPSBfX3BtZCgwKTsNCj4gICB9DQo+ICAgDQo+ICsjZGVmaW5lIHBtZF9s
ZWFmIHBtZF9sZWFmDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcG1kX2xlYWYocG1kX3QgcG1kKQ0K
PiArew0KPiArCXJldHVybiBmYWxzZTsNCj4gK30NCj4gICANCj4gICAvKg0KPiAgICAqIFdoZW4g
Zmx1c2hpbmcgdGhlIHRsYiBlbnRyeSBmb3IgYSBwYWdlLCB3ZSBhbHNvIG5lZWQgdG8gZmx1c2gg
dGhlIGhhc2gNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3Mv
NjQvcGd0YWJsZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxl
LmgNCj4gaW5kZXggN2UwZDU0NmY0YjNjLi41ODlkMmRiZTM4NzMgMTAwNjQ0DQo+IC0tLSBhL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oDQo+ICsrKyBiL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oDQo+IEBAIC0xMzU5LDE2ICsx
MzU5LDE0IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19wdGVfcndfdXBncmFkZSh1bnNpZ25lZCBs
b25nIG9sZF92YWwsIHVuc2lnbmVkIGxvbmcgbmV3X3ZhDQo+ICAgLyoNCj4gICAgKiBMaWtlIHBt
ZF9odWdlKCkgYW5kIHBtZF9sYXJnZSgpLCBidXQgd29ya3MgcmVnYXJkbGVzcyBvZiBjb25maWcg
b3B0aW9ucw0KPiAgICAqLw0KPiAtI2RlZmluZSBwbWRfaXNfbGVhZiBwbWRfaXNfbGVhZg0KPiAt
I2RlZmluZSBwbWRfbGVhZiBwbWRfaXNfbGVhZg0KPiAtc3RhdGljIGlubGluZSBib29sIHBtZF9p
c19sZWFmKHBtZF90IHBtZCkNCj4gKyNkZWZpbmUgcG1kX2xlYWYgcG1kX2xlYWYNCj4gK3N0YXRp
YyBpbmxpbmUgYm9vbCBwbWRfbGVhZihwbWRfdCBwbWQpDQo+ICAgew0KPiAgIAlyZXR1cm4gISEo
cG1kX3JhdyhwbWQpICYgY3B1X3RvX2JlNjQoX1BBR0VfUFRFKSk7DQo+ICAgfQ0KPiAgIA0KPiAt
I2RlZmluZSBwdWRfaXNfbGVhZiBwdWRfaXNfbGVhZg0KPiAtI2RlZmluZSBwdWRfbGVhZiBwdWRf
aXNfbGVhZg0KPiAtc3RhdGljIGlubGluZSBib29sIHB1ZF9pc19sZWFmKHB1ZF90IHB1ZCkNCj4g
KyNkZWZpbmUgcHVkX2xlYWYgcHVkX2xlYWYNCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBwdWRfbGVh
ZihwdWRfdCBwdWQpDQo+ICAgew0KPiAgIAlyZXR1cm4gISEocHVkX3JhdyhwdWQpICYgY3B1X3Rv
X2JlNjQoX1BBR0VfUFRFKSk7DQo+ICAgfQ0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL25vaGFzaC82NC9wZ3RhYmxlLmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
bm9oYXNoLzY0L3BndGFibGUuaA0KPiBpbmRleCA4NzllOWE2ZTVhODcuLmQzOTFhNDVlMGYxMSAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC82NC9wZ3RhYmxl
LmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC82NC9wZ3RhYmxlLmgN
Cj4gQEAgLTE0MSw2ICsxNDEsMTIgQEAgc3RhdGljIGlubGluZSB2b2lkIHB1ZF9jbGVhcihwdWRf
dCAqcHVkcCkNCj4gICAJKnB1ZHAgPSBfX3B1ZCgwKTsNCj4gICB9DQo+ICAgDQo+ICsjZGVmaW5l
IHB1ZF9sZWFmIHB1ZF9sZWFmDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgcHVkX2xlYWYocHVkX3Qg
cHVkKQ0KPiArew0KPiArCXJldHVybiBmYWxzZTsNCj4gK30NCj4gKw0KPiAgICNkZWZpbmUgcHVk
X25vbmUocHVkKQkJKCFwdWRfdmFsKHB1ZCkpDQo+ICAgI2RlZmluZQlwdWRfYmFkKHB1ZCkJCSgh
aXNfa2VybmVsX2FkZHIocHVkX3ZhbChwdWQpKSBcDQo+ICAgCQkJCSB8fCAocHVkX3ZhbChwdWQp
ICYgUFVEX0JBRF9CSVRTKSkNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9ub2hhc2gvcGd0YWJsZS5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC9wZ3Rh
YmxlLmgNCj4gaW5kZXggZjM2ZGQyZTJkNTkxLi40M2I1MGZkOGQyMzYgMTAwNjQ0DQo+IC0tLSBh
L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvcGd0YWJsZS5oDQo+ICsrKyBiL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvcGd0YWJsZS5oDQo+IEBAIC02MCw2ICs2MCwxMiBA
QCBzdGF0aWMgaW5saW5lIGJvb2wgcHRlX2h3X3ZhbGlkKHB0ZV90IHB0ZSkNCj4gICAJcmV0dXJu
IHB0ZV92YWwocHRlKSAmIF9QQUdFX1BSRVNFTlQ7DQo+ICAgfQ0KPiAgIA0KPiArI2RlZmluZSBw
bWRfbGVhZiBwbWRfbGVhZg0KPiArc3RhdGljIGlubGluZSBib29sIHBtZF9sZWFmKHBtZF90IHBt
ZCkNCj4gK3sNCj4gKwlyZXR1cm4gZmFsc2U7DQo+ICt9DQo+ICsNCj4gICAvKg0KPiAgICAqIERv
bid0IGp1c3QgY2hlY2sgZm9yIGFueSBub24gemVybyBiaXRzIGluIF9fUEFHRV9VU0VSLCBzaW5j
ZSBmb3IgYm9vazNlDQo+ICAgICogYW5kIFBURV82NEJJVCwgUEFHRV9LRVJORUxfWCBjb250YWlu
cyBfUEFHRV9CQVBfU1Igd2hpY2ggaXMgYWxzbyBpbg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmgNCj4gaW5kZXggMTdkMzAzNTlkMWY0Li4yODQ0MDg4MjlmYTMgMTAwNjQ0DQo+IC0tLSBh
L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiBAQCAtMTI4LDI5ICsxMjgsMTEgQEAgc3RhdGljIGlu
bGluZSB2b2lkIHB0ZV9mcmFnX3NldChtbV9jb250ZXh0X3QgKmN0eCwgdm9pZCAqcCkNCj4gICB9
DQo+ICAgI2VuZGlmDQo+ICAgDQo+IC0jaWZuZGVmIHBtZF9pc19sZWFmDQo+IC0jZGVmaW5lIHBt
ZF9pc19sZWFmIHBtZF9pc19sZWFmDQo+IC1zdGF0aWMgaW5saW5lIGJvb2wgcG1kX2lzX2xlYWYo
cG1kX3QgcG1kKQ0KPiArI2RlZmluZSBwNGRfbGVhZiBwNGRfbGVhZg0KPiArc3RhdGljIGlubGlu
ZSBib29sIHA0ZF9sZWFmKHA0ZF90IHA0ZCkNCj4gICB7DQo+ICAgCXJldHVybiBmYWxzZTsNCj4g
ICB9DQo+IC0jZW5kaWYNCj4gLQ0KPiAtI2lmbmRlZiBwdWRfaXNfbGVhZg0KPiAtI2RlZmluZSBw
dWRfaXNfbGVhZiBwdWRfaXNfbGVhZg0KPiAtc3RhdGljIGlubGluZSBib29sIHB1ZF9pc19sZWFm
KHB1ZF90IHB1ZCkNCj4gLXsNCj4gLQlyZXR1cm4gZmFsc2U7DQo+IC19DQo+IC0jZW5kaWYNCj4g
LQ0KPiAtI2lmbmRlZiBwNGRfaXNfbGVhZg0KPiAtI2RlZmluZSBwNGRfaXNfbGVhZiBwNGRfaXNf
bGVhZg0KPiAtc3RhdGljIGlubGluZSBib29sIHA0ZF9pc19sZWFmKHA0ZF90IHA0ZCkNCj4gLXsN
Cj4gLQlyZXR1cm4gZmFsc2U7DQo+IC19DQo+IC0jZW5kaWYNCj4gICANCj4gICAjZGVmaW5lIHBt
ZF9wZ3RhYmxlIHBtZF9wZ3RhYmxlDQo+ICAgc3RhdGljIGlubGluZSBwZ3RhYmxlX3QgcG1kX3Bn
dGFibGUocG1kX3QgcG1kKQ0K
