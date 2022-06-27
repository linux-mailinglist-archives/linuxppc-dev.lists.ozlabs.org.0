Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 264FE55B7D7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 07:52:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWcLs0b7sz3dsY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 15:52:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=et2DNAUH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.54; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=et2DNAUH;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120054.outbound.protection.outlook.com [40.107.12.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWcHs5mSfz3chR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 15:49:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTGOMYgpYCd3ocEH6bX6fKDJ8t8bael3o1C2Tw4wQIdHC/N4bKXKc8neKGxgpWeyVFPRxwFg6S5y4UaO/UmbmyTLNq14bIR1MCOJVC3ZUboKQ0bqWrehqQlaHU0cgMlVGTLQfZrpGc5Z2aC8H85G0QKjyJlsHA/G8MC09PXZc1Y69l9/XAil7JcE0LNFHS5Aodkhhej0IUPLvN+Lx8C1BVdgP/HwO74iAxZpsdZlmoLptKnOmbEpwEmYRSFALAMrpd9v6oUf1KF3ykn7a3s7eb6MrlvnxUo6cmJHbV6hJLGcbxlTRFenDksY8mP/KLxP9ra7e7gGauHm6mZuN+JxIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzViF6Zj0Gi8BIfTvy/f5Z04v7xuB7Vwhb+pxK4pdgo=;
 b=diLliANfrWxHZvvci429P02qtEIi92cdbtE4vLlI1bCm8Y98Bs9JovDoR3lKieG3UQRACVjXh03KtGpWfz1AMB3xZwm173/NwzJRCzrdUfORDlAGNGBx399CaSp9uY8FN1lteFb+BEExrR+0wGZU0u3+D0pBm1cYyH4tPYAtwF0dp3pvtrmn2uRSxnPXHLOdA9ZbPMYNzOLW+n/CGiWfGBUKI0QLRvyfoFi8iInCZbOrBju2G7neMvaMenfMS9H1icc5M2cOYewokB3XnOpqSu0Rcp9PjHTA/n5fnFS6abFarxilHQ+YByBCLnpLFPC67lC5/817I1rQu+UEd9F/vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzViF6Zj0Gi8BIfTvy/f5Z04v7xuB7Vwhb+pxK4pdgo=;
 b=et2DNAUHyGxtT6oPij/0LR3L3fOpkGhTFhu41GnD34Z61VE5+PhZK7MvjQXtG3uuw7cpkB3FQRkD9ydh3UbiL6hkDjMRgU6gS6K6bEHO5M98lQUFB4MvcIfKrT1GYcTAbBBQo4y7QuviO36CxJL8g9b4wUoOEtPZQNCEAtJwVvh+G3meZqFvWivuFHfvV5oYdmRyENAmlLTDPVWLw8mVB0Sgft04GeYwvF+rWRQ9j5yBkZHPHLxte93knnhieMwaeCj0+r2mySbBScTgW1cgQfsn5nDO+fSfoHKOqmypj9eNhVVzRvNKYZpxVWHofJG84TkjiQVG/PadBIhFQlAE2w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2736.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 05:49:27 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e10e:bd98:2143:4d44%3]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 05:49:27 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>
Subject: Re: [PATCH V5 01/26] mm/mmap: Build protect protection_map[] with
 __P000
Thread-Topic: [PATCH V5 01/26] mm/mmap: Build protect protection_map[] with
 __P000
Thread-Index: AQHYieKe/kyLMVH1i0qH5wsYfhUb4a1iv4wA
Date: Mon, 27 Jun 2022 05:49:26 +0000
Message-ID: <d273b5e5-ebb9-b279-b9f7-a595494afa53@csgroup.eu>
References: <20220627045833.1590055-1-anshuman.khandual@arm.com>
 <20220627045833.1590055-2-anshuman.khandual@arm.com>
In-Reply-To: <20220627045833.1590055-2-anshuman.khandual@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c3f0c38-1df0-4295-6049-08da5800cbe6
x-ms-traffictypediagnostic: PAZP264MB2736:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  btFbTEBImh3HHI2RkaBdcPEwy145o2RCsGjRLJXvbIkVPC9KutmJUEOo86pncA93IDaZC95rYhHmO4QprIlBpjyxiEFISwCt3G3lJltKm8D5vBKIxEFJBJbTK2bJLnX2myl0CdPuOoHp0mn4F5hw7xtfA2r+sh+lUprqY56qkIiAqFOjgLsNnqkLSrnt9MUXkAwaDH3FIVzLPThe40nHzSXn4C+N/ea8SiqwEzuiNi/5CiFkXND374ZctnSeXtfIi5IQ4z08AfQQnoZLnizFURCVl4pSzYOILWSWkkPqo1A52CMkAlzPg5HI1Md6D6jEftpH2YMBZRxdU5/QRuJICkov/mqc/ag2dvOohWSE5lKxU2P7cL371WeSvtxPLQknonKRaYPa6+HfTagyYZKTAFwU4fotw9cR+LatiHXsHBt09SWkuv3ZonuoPnUN7IUiG300WdE9SimFFJzda49eOMj/YePD8dlTrBn5uZ6t9ZtzTToEd5tdio1oWbUKOdA9gyiGH/aETovT34meaHSBFAnTdoK1OUDPevy3QRqzEN8iZLc0PQ+sl3YC3aCqJ3hnGC+dqkpjow7uoQL7CymQ/y+xCN7RFfCGJ8vjLlh0V/pHWYa3XB/np9t1grjHKEtJxzDf+i+eoFLRQgqhkDMQC3yqZ2jFzLBg+mlfh3H1gpkRxEIUPVmK2W4kagkS5BYU85J8ClFV2jsyy3uPaf04VZ1l03bbAVDsHcdceRJODWoK2Q6/VKz4UPzbPDqJve6bV9wIF/ZIlTFXdSN9AEdktgIwhqcI4KE1qh2eTyzwJT84B5gsai0m3//AZ0ir6X+5RmDydb+nI4uL5iXauuVCEJpPDxhZalp6yyX/rjFjvmM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(366004)(39850400004)(136003)(8676002)(44832011)(4326008)(91956017)(83380400001)(6512007)(2616005)(5660300002)(66476007)(76116006)(66946007)(66556008)(66446008)(64756008)(6486002)(8936002)(478600001)(26005)(71200400001)(7416002)(36756003)(122000001)(186003)(2906002)(110136005)(6506007)(54906003)(38100700002)(41300700001)(86362001)(316002)(38070700005)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QmxRV3pDcDBHM0hKc0NPN2Y4Ty95dzY4NisvM2JUZTJSajhMb1FyYSsvbFJw?=
 =?utf-8?B?ZkFveGdEWnR6ZnR6NzZ3bHhIMStva1p3aXM3MDl4Z2kxczY0cVRHSGJtaUVL?=
 =?utf-8?B?eEl0ZXVkbm9lNWlIQWZRWDRPY1RrOTFmWXRZektrUnpsYW41S3BibmNpRnV0?=
 =?utf-8?B?U1IxTmJjMUU5TzVtVmdzUU5CWFFBM25KRzJBa1RyOU41MGRiTUJmU3U3SjNF?=
 =?utf-8?B?WFNMbS9OYk4xRUJPYjIyZ01RMThPUlhSTzV4ZXluQ2MyTVMrTjUvTDNnL3JR?=
 =?utf-8?B?d1czeEJDdUQ0YmFqNWFEelZ1WlVsUHhOUGxXQXRjY3ZndVNROUVpNUJZb25x?=
 =?utf-8?B?blY5VklDWC9ISWU5c1c3Q1dqckttVTA0cEQ2TWpVR1dPUHNUSnJWZXNjZXhx?=
 =?utf-8?B?cXhqdGJSZmZESkdVYjNOTHRvMExZSDhZMDh5NHQvYURsb3VTQVFYcnh2Tm1x?=
 =?utf-8?B?b2N6Q1ZoOWI3MkNhaW01QkV0SUlXVjJoS0NHTjdhYXFPcnh1S2VDYUlYSDk0?=
 =?utf-8?B?VEdYMnVDOCswYUs5V2k3ZkR4NjhFdWhVT2prQVdqL2NTRC9kQnhuK1hHbVZt?=
 =?utf-8?B?TTV1bmMyakorNVkra2xuN01TSnI2QnQ2SnRSQWx3c2hEY1ZHbHcxYjM3d1dx?=
 =?utf-8?B?cUNxRkFmb0RzVjV0Z2hiQXgvdmZkeWF5WVpYajl5RmEzdmpROTYyTEVJMzhE?=
 =?utf-8?B?Q0ZiVE1mblJIdjlHa3hQVmcxbkxvTzA5MEpubUdaMnZpeGhrZi9yc1FHN2xQ?=
 =?utf-8?B?dHVIa3AraS9UMUNsUEd3L05iOXlJclY3b2ZzSGhhakx5R2U0TWpNTUN4S1Z3?=
 =?utf-8?B?bkNZU0RMem50K3VXWkptL3N0ZlJSWmtnTzkvY2JQTVFwd2RrbTlJK2J4aU9Z?=
 =?utf-8?B?bHU2d25JVnh2eHVWQkNKNTd3bEozclBLWmVGR3B0UFY4dUErVklSeWRKYVFU?=
 =?utf-8?B?YzFSRmpMajhrUEo0QUpzalI5WjkrWGVOMlJPYnkzcDNGanA3UUhqN0YreThY?=
 =?utf-8?B?QW1yZG5nSUU3QldQTXRzUTUza2Z5Q20vclNueDJhNU0xaTBDbVRTeDFOWDhK?=
 =?utf-8?B?MENndHZUQW9uMHhobjNuZ3ZzMU02WlFwclo4emVQTXVrbjhCUkRuSVlKeUEv?=
 =?utf-8?B?dThYL25BVFYxU2RHQTNuVEp2bGJRMlRMNVFjMkJ5c1k1ZzF5OTBRY1hqblR4?=
 =?utf-8?B?R3NpbDRlbTBxMlMrQ0d6V3o5MHVSQTY0bGt3Nk9QUHRUS3NpZDlhcnpyMUFh?=
 =?utf-8?B?STJOWTNFMTdMNjNWaG52QzRtT1JDWlNLVlRMaHFCWVhiZWJKQ3BWV3Ewd0tZ?=
 =?utf-8?B?THNNSWhjaVcxM2xrVjh1Yk9mVjZYb2ZndnZhSHhEcnY1QlRMRlB1cWJ3a0o4?=
 =?utf-8?B?TmdZYzM1M1R1MW1qRXJOYk5SVTZkYzRESHRZMitEQ3BWUEdSR2gyREJjd3ZY?=
 =?utf-8?B?NzcxMjNHZ1JaL0lFYlJHZjl0dHNDbkdTQkNldVZxWWlVc2Y0Q0VBWmovZ1dL?=
 =?utf-8?B?cUoycUgwVE9EMVVFRHpPQ016dVB2Z05tM0dlVXA2NFlEZ3dvdGZtZ092MzhZ?=
 =?utf-8?B?V0VHWVB2T1pubVVUK0svWTVFM0VweTBSblRrVFVsNnk0Vk5VQW9WemFZUlNj?=
 =?utf-8?B?RStQNG54elFKWWN6RE8rWUlrQnQrRFRBNzRjRVVoVC9haDcrUVdvb1VVUENu?=
 =?utf-8?B?dHg1R0MvaWhNU2thWHpQeVNSb0JjazhQNTVnczdUQ0FjM29iM3RKbmtJZG9L?=
 =?utf-8?B?bXdxTTZYY0VyRlVkM3owTTFDS3p6MVRqRS9nZTVFMlFYbFdtYk04ai96dk5W?=
 =?utf-8?B?TkpBanEwcWRMai8wZnJubXBOVmR1SGF2dWI5S1AvTGEzMEhLamZMNWQ3SXdh?=
 =?utf-8?B?a2JlZW5TalNBb2hwbTBJcm9vdW1UWlovVXR4OEphZ25ZQ2FRM2FVdDlQMTlh?=
 =?utf-8?B?TWowblIrUjNaOEtocVhhY3N1Tm9yUzRHbXNkazVvTXRJalVPQ3pTdDl2TnRQ?=
 =?utf-8?B?M3FEM2lWRGV0Mkk4U29NUXM0ZzVIZlJZSk9SbEV4eE4wa0VVRVE5SnpEYXBr?=
 =?utf-8?B?OGdPd1o4SzIwL3YyRU13RDVvM0JJMExIS3ZzWmdhbXNWV2JoeTU1VXM4N2dn?=
 =?utf-8?B?T3BCeWhwbGhodzJxTWF4cDdCdnpmT0pTb1pVUHZNbTlXV0RrM0tHSDcyelU4?=
 =?utf-8?Q?nljYJ5DtLzOhTJq+/aqB1LQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E1175F41B5E1541B03535B8D6BA0363@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c3f0c38-1df0-4295-6049-08da5800cbe6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 05:49:26.9994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ncj2SRKeerI0gMI7iSlyGZVVWGBh/sOhsolP8bWLWwJmo7H5l8z2xhEUpFCTbBoNka5qVOwkJuxhGpIVWYLEiokwEHAKg5Wcbnl0kCTBU3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2736
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Christoph Hellwig <hch@lst.de>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "hch@infradead.org" <hch@infradead.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@list
 s.infradead.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzA2LzIwMjIgw6AgMDY6NTgsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6
DQo+IEJ1aWxkIHByb3RlY3QgZ2VuZXJpYyBwcm90ZWN0aW9uX21hcFtdIGFycmF5IHdpdGggX19Q
MDAwLCBzbyB0aGF0IGl0IGNhbiBiZQ0KPiBtb3ZlZCBpbnNpZGUgYWxsIHRoZSBwbGF0Zm9ybXMg
b25lIGFmdGVyIHRoZSBvdGhlci4gT3RoZXJ3aXNlIHRoZXJlIHdpbGwgYmUNCj4gYnVpbGQgZmFp
bHVyZXMgZHVyaW5nIHRoaXMgcHJvY2Vzcy4gQ09ORklHX0FSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BS
T1QgY2Fubm90DQo+IGJlIHVzZWQgZm9yIHRoaXMgcHVycG9zZSBhcyBvbmx5IGNlcnRhaW4gcGxh
dGZvcm1zIGVuYWJsZSB0aGlzIGNvbmZpZyBub3cuDQo+IA0KPiBDYzogQW5kcmV3IE1vcnRvbiA8
YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4NCj4gQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZw0KPiBD
YzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBSZXZpZXdlZC1ieTogQ2hyaXN0b3Bo
IEhlbGx3aWcgPGhjaEBsc3QuZGU+DQo+IFN1Z2dlc3RlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPiBTaWduZWQtb2ZmLWJ5OiBBbnNodW1hbiBL
aGFuZHVhbCA8YW5zaHVtYW4ua2hhbmR1YWxAYXJtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlz
dG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCg0KPiAtLS0NCj4gICBp
bmNsdWRlL2xpbnV4L21tLmggfCAyICsrDQo+ICAgbW0vbW1hcC5jICAgICAgICAgIHwgMiArKw0K
PiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9tbS5oIGIvaW5jbHVkZS9saW51eC9tbS5oDQo+IGluZGV4IGJjOGYzMjZi
ZTBjZS4uNDdiZmUwMzhkNDZlIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21tLmgNCj4g
KysrIGIvaW5jbHVkZS9saW51eC9tbS5oDQo+IEBAIC00MjQsNyArNDI0LDkgQEAgZXh0ZXJuIHVu
c2lnbmVkIGludCBrb2Jqc2l6ZShjb25zdCB2b2lkICpvYmpwKTsNCj4gICAgKiBtYXBwaW5nIGZy
b20gdGhlIGN1cnJlbnRseSBhY3RpdmUgdm1fZmxhZ3MgcHJvdGVjdGlvbiBiaXRzICh0aGUNCj4g
ICAgKiBsb3cgZm91ciBiaXRzKSB0byBhIHBhZ2UgcHJvdGVjdGlvbiBtYXNrLi4NCj4gICAgKi8N
Cj4gKyNpZmRlZiBfX1AwMDANCj4gICBleHRlcm4gcGdwcm90X3QgcHJvdGVjdGlvbl9tYXBbMTZd
Ow0KPiArI2VuZGlmDQo+ICAgDQo+ICAgLyoNCj4gICAgKiBUaGUgZGVmYXVsdCBmYXVsdCBmbGFn
cyB0aGF0IHNob3VsZCBiZSB1c2VkIGJ5IG1vc3Qgb2YgdGhlDQo+IGRpZmYgLS1naXQgYS9tbS9t
bWFwLmMgYi9tbS9tbWFwLmMNCj4gaW5kZXggNjFlNjEzNWM1NGVmLi5iMDFmMDI4MGJkYTIgMTAw
NjQ0DQo+IC0tLSBhL21tL21tYXAuYw0KPiArKysgYi9tbS9tbWFwLmMNCj4gQEAgLTEwMSw2ICsx
MDEsNyBAQCBzdGF0aWMgdm9pZCB1bm1hcF9yZWdpb24oc3RydWN0IG1tX3N0cnVjdCAqbW0sDQo+
ICAgICoJCQkJCQkJCXc6IChubykgbm8NCj4gICAgKgkJCQkJCQkJeDogKHllcykgeWVzDQo+ICAg
ICovDQo+ICsjaWZkZWYgX19QMDAwDQo+ICAgcGdwcm90X3QgcHJvdGVjdGlvbl9tYXBbMTZdIF9f
cm9fYWZ0ZXJfaW5pdCA9IHsNCj4gICAJW1ZNX05PTkVdCQkJCQk9IF9fUDAwMCwNCj4gICAJW1ZN
X1JFQURdCQkJCQk9IF9fUDAwMSwNCj4gQEAgLTExOSw2ICsxMjAsNyBAQCBwZ3Byb3RfdCBwcm90
ZWN0aW9uX21hcFsxNl0gX19yb19hZnRlcl9pbml0ID0gew0KPiAgIAlbVk1fU0hBUkVEIHwgVk1f
RVhFQyB8IFZNX1dSSVRFXQkJPSBfX1MxMTAsDQo+ICAgCVtWTV9TSEFSRUQgfCBWTV9FWEVDIHwg
Vk1fV1JJVEUgfCBWTV9SRUFEXQk9IF9fUzExMQ0KPiAgIH07DQo+ICsjZW5kaWYNCj4gICANCj4g
ICAjaWZuZGVmIENPTkZJR19BUkNIX0hBU19WTV9HRVRfUEFHRV9QUk9UDQo+ICAgcGdwcm90X3Qg
dm1fZ2V0X3BhZ2VfcHJvdCh1bnNpZ25lZCBsb25nIHZtX2ZsYWdzKQ==
