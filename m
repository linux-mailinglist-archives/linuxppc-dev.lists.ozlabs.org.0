Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA84983CE9B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 22:28:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=VGePd2WO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLYq266Fzz3vkN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 08:28:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=VGePd2WO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::601; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLYnv26wFz3dBd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 08:27:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvbLPz1ILa/aIxUNeLqy7c8Y3U/m8zJoULVMstdCoodLyUfBIb1tZORqFGqUEBiwpp4rJF4sqUzQxxlSj8GX9uRh3XPbQqaIAahlNrPY2kaKsla4BwU3g/Y80pomb4SXJruIV80ccEd09F0hldKP7Ieq29Q9l8Ey2rfLggwTWu0a4stl053r6HfbyNYB4BEcIl3HRgvkIKKMAcKdPB/NDOQ0xTnA2f2fQK5fuAki/ElFZv4xMfGbsZwIW/vw7fuMmQn4HKXn4h0PpLLnb/VAIZkDdhVCIyxq2d7KAZ8FIz4Hqi+3dsLnengyiRsQ+4P/xo23VGYINVeeKIVrLnraNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZ9TWODlJyT7cwyN9/D82cToDdKUlQm8XjcF2gDSsC0=;
 b=NDMb7d7xR1ANXPvTYLJuj1RgQPPBeFgJEcIchQtfzWC/qONtuWSaLsp6QALHwhQ4E09feTz/ML9yeRV9Hp/dIFsNf8pLfyeJSedZYYamkYvgYLojTL12kQZrMiRh0P/7NLnO67/1hUbBf+IUP6NLS0IY8QgfoT9ondrFjjzg59zR5PZEZHGCqsXJU4FpkPfZqsLlAVynuPtMIusIadm2XEms81XGD7j5Q8uMl2NfLA7AhV6CuhTEUxRzwSrkpypCOfiqZeEkMrju0bXDhTBjSbacAYmwYN7OVIEIj8Co/ynle0kG4/YCIEbU9eiSgw2yHLEnhdJepv77ivjgq6pBrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZ9TWODlJyT7cwyN9/D82cToDdKUlQm8XjcF2gDSsC0=;
 b=VGePd2WO9JDXwrVUXMn0AenEiVYMvrSaULNrQVsKxfNR3X1Eew4y2Rs6DRZJwOwM79kpHPwk2E2tJAgyCKqqj/9e445KUCEyR78gN1rw1JYYgJt7iKBmUjU2sC90kLfdPOqEvD6n6HfjA1loAWot9i78nc4h33Z6Zdhs3Rwb7Y6O6FZlXUR9w7ftxVoDqBGgJne53AiV2jM93OD2K86VJcibY8H3Atiovkzml9Gb7yOjQpgw7WMM5b7idTE26YegzgR7Lc0XnCEGz2MF6GTupKuj2O68u8S45nSX4tPQhr4Jz/UAR//QbVaD89rXpwVqnG1cG8tHO/LNzXe/jbnC1A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2308.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:35::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.26; Thu, 25 Jan
 2024 21:27:28 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96%4]) with mapi id 15.20.7228.027; Thu, 25 Jan 2024
 21:27:28 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: David Hildenbrand <david@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 10/15] powerpc/mm: use pte_next_pfn() in set_ptes()
Thread-Topic: [PATCH v2 10/15] powerpc/mm: use pte_next_pfn() in set_ptes()
Thread-Index: AQHaT8Vnobf5hh+EwEWWBMKpjyWCKbDrCwoA
Date: Thu, 25 Jan 2024 21:27:27 +0000
Message-ID: <78ef3d3f-9801-43a8-97da-03004198cf1a@csgroup.eu>
References: <20240125193227.444072-1-david@redhat.com>
 <20240125193227.444072-11-david@redhat.com>
In-Reply-To: <20240125193227.444072-11-david@redhat.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2308:EE_
x-ms-office365-filtering-correlation-id: 3325251b-abd0-4bec-78e7-08dc1dec6e64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  iRwf7tk4ONwvErF0PTFK0qoxVWiUJ4aMm1LEbuEfiIM9fUi7wfr9FgepS7ARAyylRPePkc4MC3ZoJofoX9KdlhHHuUw5g1sYt9FFDZMPN1gZM6bMWfWz7upQ/5cs2etwqAz1wKhXftJV6YxPTLneHTvSScf2MTPD2HXpwk1ba+6BkQ24LqFklFyXr2QFEtpIqgf/nXXWLZsSLuulSSQ5NZj7DCDNC4TetjuB16vAET4Vp+KLuQzza3Sv05ESYXDLndyYTkz7/NZs56l98HsHorsYQoPuVVuViSC0YUTI7J0k86/zv6r5+ocZ6WHav5qcphqLRztLo4WPH9JP2o4qOn+MXoj/cTNY82iw17iBacsKUYLq6wXCadJGLdRcpJhKMpgS6EvXsEZJ+bJFJ9RbAOKT/TpgI4tPl9QzneSfdnkRaRMuAJw3lzpOOh6AJh5Mu/ywPciwioLjSpeVZ+sBgkBhPvhw9dnJsByvsmlO4qLGu8PNjDycK20PSKIm9mTop6C45ZdsNPai8FSsQ6sq+lytKQs5bGFhENJlCAH/1pn2+n5oxPrjDzFaQjbrqwj6mCEbgZ4ivR3p4XryanGgHmh4F/LrjumcOIuKKLjJ4bZ63BXY9WyhS3pBTxbUF8m3FXdlyBHq3iDzKKyZUVgGdSaz6z/f32DQ412zqX2iSMrD2xV2nOWeJo8ErVzS2plE
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(91956017)(31696002)(64756008)(86362001)(122000001)(6486002)(66946007)(478600001)(66446008)(71200400001)(76116006)(54906003)(66476007)(66556008)(316002)(110136005)(38100700002)(2616005)(6512007)(6506007)(26005)(8936002)(8676002)(4326008)(44832011)(83380400001)(7416002)(4744005)(41300700001)(2906002)(36756003)(31686004)(38070700009)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bXU2cVBDSjU4RTBPQ0Q0clFUeXFZeW80YlM0NEk3and4c2djbi9FZ0xLZDJ3?=
 =?utf-8?B?MW94VGkxeGE1WWg2ODN3d09CVEJVczRzY2Q3Z1JvdmNLekF2UXM0UkNLL2ZM?=
 =?utf-8?B?ck40Z045dHVxaWVSZk1NcDVWaUNDL1JmbFd6cjVTY2hlNmgzU2J4d0JsVDl4?=
 =?utf-8?B?OS9SdUZ2TURYT2FjTVZMNFdLZHZuNlhWN0pDL0pzaDBWV0NVWHBKajc4SlZu?=
 =?utf-8?B?U0M0dTM3REo3MHMvVmxGaTZDVzVHcXRGUXlwNTdQLzVrQkVrd29qMGZQbkJ5?=
 =?utf-8?B?ZGxrNHh1OURWWnF2K1I5NzN2enFwTjV2bDdtWmRhNmpCT0dSeVNVVm9QaThp?=
 =?utf-8?B?WXBGSVIrVzA2NEJnL2FYT21NRE94MkRNOXAxZGFkTk0zMTJRMHNFVFZXK3E0?=
 =?utf-8?B?ZVM0Q3FZN1dnTTZaa3JqYkpodTcwbnByR1ZPZWE2Sksyc2Y2dktkaE9lL3VM?=
 =?utf-8?B?VnVBTGFDVjFDY3dIdUxnL1lYTnMxbk54Tjc4d3NjT2hnYW0zQ05lc2o3enRl?=
 =?utf-8?B?M2ZSQWRnMHRnTW9HK29YTjVVSDBHU0MyNWd0VFlZZG5NTkpwTnJmRXVwT2hZ?=
 =?utf-8?B?ZVZ5cm90Y2VIeW8ySFV2TklyN3lxV3lkcTF6Y09zRWNzTmdZQmMzdW5NYXlB?=
 =?utf-8?B?b3FMdGJ4OEozZzV3N3grQ3hJVG9nek44RUpWYUUyTjREMFpIb2FJNUMvWXlr?=
 =?utf-8?B?MHRlamc1Q2Y0UFozZDUrSkRJTU1ydnFjZUhjUjNIcm9iTmNpMGtvNVRSSERU?=
 =?utf-8?B?RWhRZkptK1N5QllKZEJrQzhKbzV1YnFQeEUvamZycmlCZ1BnSlQyTHNZamJw?=
 =?utf-8?B?bnV1Mm5hNjZMVzdJaEp5L3BSb1NZbnpvMEswVW8xRzBrOXlWa1E2RzVscU5O?=
 =?utf-8?B?ekJXQlNTNFZFazVqSU5iQ0tQUEtxZ3pMVDErbGxZZUljQnpEai9aWHVCdUpE?=
 =?utf-8?B?d2E5cHMzTGRhMUp3eHhxMlFyV1pXU3ZuNEJMaCtqUjdZUEowV1lSMVVqSDlu?=
 =?utf-8?B?cmZ6QnVFZ2tEZCs3MEtha0RoMEF1MlFtT0pXUGkrZDkrS2p3SmdhVUtWZm1G?=
 =?utf-8?B?OGsyQm5jbjg3S2gzQnZ6ZUxoc09KamlTazYzMXphbW82TWs5WU5hcnhhbS8w?=
 =?utf-8?B?d1VXN0UwdnVxckRQT1FMMGJiOGpVOWFzNDkwaitITUg4V29jY0lraWNyZHZn?=
 =?utf-8?B?eS9zN3REOWd2WlpUczU2RFcrVHgxS3d0bGV0R0ZIbEF1VVZ3dVZabkp4bVVG?=
 =?utf-8?B?SnZxd040MmhtQUVaWWR2ejNiaDB5YjEwaHVqeWJ0MHJrTkl2czFuODZLSGZm?=
 =?utf-8?B?QzYrT0s0bmxVUWdhK3BNSFRKdS8wQ3F1blkzcHpUaTNraXB5a1BoWXUyNkh4?=
 =?utf-8?B?YWlTT3R5aXJDdzlrYnZsb1VCN2kzSlhaSzBZbjc2STMrYWxsekJyS3RXdjJK?=
 =?utf-8?B?M2luaUNMOXhYSkVkMEpyeGxpUHdVdmhhd3dBWEJ2dFFCNWtGYzEwUStCai9l?=
 =?utf-8?B?MDNGTmFvbWNKZEFKSStmYVVVWkNlenFxRk0wN3J6UjdzSGpUMkhzZVplZ01C?=
 =?utf-8?B?VDJodDZzbmVOVXlVQXJHN2V5T0p0dm1tdGlMRFZKT0QySGZLQUpHdnNVTXlT?=
 =?utf-8?B?MXFyTllNMUtOd1BzODlHbUJ0RnNhbDJXb1dXbmpxWEJkUlVtbWREamNUYnBD?=
 =?utf-8?B?NGFRa2FCY2p1alpvWmw1M0Fva21sYkR2NWdkMGVmNmdTK1JJSllDUEpPQllT?=
 =?utf-8?B?bEFXK1hyaVZMQVhDaXp6ZDJaTjF2YjhvUUFUalFaaUptV0FGWVFEM21UM092?=
 =?utf-8?B?RG1BR3ltZmlNUE83TFh1V3dGWnFBUVFlc1ZiL0ZBUUN4SWxHa1dXdHh0NzNh?=
 =?utf-8?B?cU4vM1hWT25SR28rY2tqT3A5Vmd0RE92cDR6TGxDZk9MZjV4aTVXNjNsaGlo?=
 =?utf-8?B?NDJORjZjOFNSTU14NG1rb2h1UXgwa0MzNjVJN0NmSHNZOEFxQXE3QzhJaW5D?=
 =?utf-8?B?SE9DZDdTUlVIK2xvcEhaSFhuS29XSUczVmpoTXA1YVo1TjBLWi9GcEdCRytk?=
 =?utf-8?B?WDRZclp0ODBMN0dvZExORStvOFpZOHpRU2FKeUZScXFkRW5lT0lZM0xyOFlQ?=
 =?utf-8?B?ZWw1cHFpVmRBVGkzaURWUCtMUG1IbDBzNTBTSE5OQzUxYkdFeHE2SCtVZjVz?=
 =?utf-8?B?VWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <45B979D28DFBA042A0F5328511AC4A62@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3325251b-abd0-4bec-78e7-08dc1dec6e64
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 21:27:28.0851
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DUxH6WrVVVMEhMSPMMhIpd0Sqae+6rFNwtB94VCJoN2297OuY9TnxbBAj8wNvL9vEcaYLSG8KzOsqQCDWQdKOx6gipBclbmhNNgmiAkuHV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2308
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N.
 Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S.
 Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzAxLzIwMjQgw6AgMjA6MzIsIERhdmlkIEhpbGRlbmJyYW5kIGEgw6ljcml0wqA6
DQo+IExldCdzIHVzZSBvdXIgaGFuZHkgbmV3IGhlbHBlci4gTm90ZSB0aGF0IHRoZSBpbXBsZW1l
bnRhdGlvbiBpcyBzbGlnaHRseQ0KPiBkaWZmZXJlbnQsIGJ1dCBzaG91bGRuJ3QgcmVhbGx5IG1h
a2UgYSBkaWZmZXJlbmNlIGluIHByYWN0aWNlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRGF2aWQg
SGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+DQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhl
IExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQoNCj4gLS0tDQo+ICAgYXJjaC9w
b3dlcnBjL21tL3BndGFibGUuYyB8IDUgKy0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBj
L21tL3BndGFibGUuYyBiL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMNCj4gaW5kZXggYTA0YWU0
NDQ5YTAyNS4uNTQ5YTQ0MGVkN2Y2NSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL3Bn
dGFibGUuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5jDQo+IEBAIC0yMjAsMTAg
KzIyMCw3IEBAIHZvaWQgc2V0X3B0ZXMoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxv
bmcgYWRkciwgcHRlX3QgKnB0ZXAsDQo+ICAgCQkJYnJlYWs7DQo+ICAgCQlwdGVwKys7DQo+ICAg
CQlhZGRyICs9IFBBR0VfU0laRTsNCj4gLQkJLyoNCj4gLQkJICogaW5jcmVtZW50IHRoZSBwZm4u
DQo+IC0JCSAqLw0KPiAtCQlwdGUgPSBwZm5fcHRlKHB0ZV9wZm4ocHRlKSArIDEsIHB0ZV9wZ3By
b3QoKHB0ZSkpKTsNCj4gKwkJcHRlID0gcHRlX25leHRfcGZuKHB0ZSk7DQo+ICAgCX0NCj4gICB9
DQo+ICAgDQo=
