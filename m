Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBF8838D40
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 12:17:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=I4gL0Hhv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK4M44xhRz3cdV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 22:17:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=I4gL0Hhv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::600; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TK4LK0dgpz3bn6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 22:17:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dw5a33UdFjPdraFMBJZqp1QCRh5i0xx/AR0G4uuQeoLduMB39bcG5MBaCwKQV61lkde44yqVDB/PrnARRlL2Te+FcNK+20W/G48DCultwRmITMT0yJyDEl+xI1Sum2NLkmX6gohzd5K+ibZMSdY1aMYBly9Pms4hv4xboueGjMTq5RJDRcOcssfXB3mKQkGEbv1hyGizV4ZVQlulc6lQt8ttyC/LYf2j8BCc0ocrRDLsYlGbqUrwSfh4dmJNcbBR/rddXsug9fTtdNgtEhjdzBPCtEHj0o3ejj7/FSktVkW3CSx4R+vVWmFluM4EfW3Gu3KmnKSyXmKi5HjpPWVvhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6W4/cyL4Y2ZhdceMjL2+vg44zCKCt2UCT4qM2RGVGg=;
 b=JOp9YVLZyqy3WRfUokTkiOWvXjLdy4JvoFWKHBsem9oTxhpurUexZC60rPZfxlfQ3eqvj3aEh4pYQ1UxIDKm0MvD6MhRowWVMKWEWiur5bqX2GBNYkJSqzvtdG5Obt9Qjx7wvrQZ/50AIZ/kGWLhUspN6vhmbaDURZecaMfmGInm/LJgAUz0CaP6vdr55Yuu2FJABlwiWJZHntvSCLXQJ/RsoHO0BF8J+UKI8y/fOKMXK3JF9ifnpq4NSP+BlmlrhFTL240KmZ/D2vMPbLY1kQD/lhAZEvBHoF0FxVt3i3h77LhvKUeIzN1fJLuukeW2xhLolDX2VbomjiGE884Www==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6W4/cyL4Y2ZhdceMjL2+vg44zCKCt2UCT4qM2RGVGg=;
 b=I4gL0HhvSKe8m2hrC+ZFjaNJNDAlDYjQ0uOhMN5tTVJtSfgIN2WUNe6P1bOqsr9ISJUyvYpQV4SGLi9Ak/sQ8ULHzkLOY5Z9xwLighv85ABySns5oQFCzt1Yg8BxN3mGtQdDrc27M+85bsPn6w9P2PnQOV1zv8Gz7ygWpjJvtTpxIYOHrx06hEAp7ZgpPKDLCVMPxx96hZAozsMDyvwRAMreq1OfA24qdVGcOyTihHsa8GT7wfaRPhFBBN3xC/T19Vz3E5G3IWixCuMhPCzJil1BKpM9YS2L5Zzay7k7fO9mFIcuG4iasUAZdKMrgnretmqnByJ7b7uIHtyiVdYvPg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2066.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 11:16:53 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96%4]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 11:16:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Ryan Roberts <ryan.roberts@arm.com>, David Hildenbrand <david@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 01/11] arm/pgtable: define PFN_PTE_SHIFT on arm and
 arm64
Thread-Topic: [PATCH v1 01/11] arm/pgtable: define PFN_PTE_SHIFT on arm and
 arm64
Thread-Index: AQHaTWsgqyRS0TfRAU20Q9lz/3ZqNbDnNJ2AgAAD9YCAAAWZgIAAAlKA
Date: Tue, 23 Jan 2024 11:16:53 +0000
Message-ID: <ae3d826f-758f-4738-b72a-e99f098bb2b3@csgroup.eu>
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-2-david@redhat.com>
 <fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com>
 <46080ac1-7789-499b-b7f3-0231d7bd6de7@redhat.com>
 <6703b648-10ab-4fea-b7f1-75421319465b@arm.com>
In-Reply-To: <6703b648-10ab-4fea-b7f1-75421319465b@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2066:EE_
x-ms-office365-filtering-correlation-id: d19e1d14-40cf-406b-6bce-08dc1c04cd6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  u41d1MyySMr2OQiXZyV0oXV8zrb+kh2+NttuCTEGXcriC2ozlBRrnaFFmKGHoSicVOaJ7fy3QK9/WIUiuXE6736Bcf0q06yJmpYqeFRFYTfoWzKLYhTZ2y/KxJrZRUh7bWBTJMhJY9zCVlqmd6QJUnvDBP+CsE13YkVpks0hXKOXWV8QLaH/5BFyqDxJx0yACNKOoBiclgxnpgvvHl6kdeiH4+KwvDH2AnfL11S7wyPC7LPozoZp/nuofQMX4mRoV3UiV/iFPVFM8CD3rqU7QRDRtKkstJMhWmAhZ5JpwhywXwrxVzXw3Sgdlc4p0I5uYAX8Nc+d7lPHTkBSgKoEHxx2BPzIpbxHcAuva4uZOyibRmLhNudT25NtoNpp+IzGAj9BcAzKF9nMbn6ntl9XsMSKQgnro4qKxUuFIm5tcUCjNAq9ZnuY80Zse8G30v1lgytOLoKycw2C4PG5eeeqVfyjLSwTmHDQwZ4Tm97FEowLii1Hwk/07vqVzj33fIo4AFGBCnkUMc5Gv+GRcDohx10rbd0WpZ9HOhszEDU6G+CBrln8vfu7CVeGV78VzLEUCbdu1IFzuqB9pGbtD4EFQtKx1W/X5uQX9raPKOd+jJ2CisiUjs2h0YGpwO24TGqA9Q+rO91FONYD2N8YixoPYk9umr0Cey9gx+tMu68RFEpop/EE/0saw4/NWUVBgLF3
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(376002)(136003)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(38070700009)(44832011)(4326008)(83380400001)(8936002)(8676002)(7416002)(38100700002)(122000001)(31696002)(86362001)(41300700001)(36756003)(2906002)(5660300002)(76116006)(66946007)(91956017)(66476007)(110136005)(66556008)(316002)(64756008)(54906003)(66446008)(2616005)(31686004)(6512007)(6506007)(53546011)(6486002)(478600001)(71200400001)(66574015)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eG43azMwVEpEM3NxN1l3Rk9hNlNxdnhZYm1UME5xVTlqL1A1aGxXWDNzWWs3?=
 =?utf-8?B?WVV4VXpVZGtXLzlCRDNyckZSTm9saXZaSnlUcEZPajR1MUpxY1RndURnYXhG?=
 =?utf-8?B?ZklmVzV2dGtVeURFUElsaUNsMDI0R2pKVWw5cmpoWXdPaDFIaTA1THNQSDY5?=
 =?utf-8?B?M1pWVXdPSVNiblQ3WEdxcEFramVycE5uUFA3OEFLWWh5VE9rK014elZOYldh?=
 =?utf-8?B?VU91WUFVUkIwbmt6OFd5M3JtSGtDYXJGSStYa0ZrRk9WV1dOSzUrZFRLUlNC?=
 =?utf-8?B?QVNyNzhaR0Y0WWtoUzVkM3d2bWYyOU1iYmtpa3ovUS9jKzFCRGVsa2NrdUM3?=
 =?utf-8?B?VnNXbmZ5ejhOUklaUWx2YkVjMUVSaExmNFBMbXI4d2sxM3dZVmdYUm53em5l?=
 =?utf-8?B?YmJtNzB0R3ZJR0VzL24rNUtiRDRNZThQK09xVmowTjZoZzBaVGVNY0VJdXNv?=
 =?utf-8?B?YVM1em91SXZRRStlNENZVXV6TFRJK1pwRzhPU1NMQitFWm5DWjFnR2VyczFU?=
 =?utf-8?B?RHRtUkVDWVo0ODJiMlJtd2hwS3k0Z0x1TUovaHJaSytnaHpQanJEVGhZQ0pT?=
 =?utf-8?B?ZkMzNWZ4cmpaa1MvallOdU4yVndlNDQ4WmJwQk9vcXQyNDNIbm5XZlV1aS80?=
 =?utf-8?B?bXd5aUJaeWhvR2ZNYUo5QmZ0VXp4UUNqR09VWEpEdkRXRHpVOHJFcHpPSGxW?=
 =?utf-8?B?SmxPbmRSaG5XWlhkK1JjZmxFWklPc09BeDRBdTNLSk9BaVBWRWhhS0IrdU1y?=
 =?utf-8?B?Nml6WnIyVDRtcGZvamc5QzIrOVlkNnhUODhaVFBCU3lqMlpoY01PVFZyQlV2?=
 =?utf-8?B?YVZwdGpNTUFrN0tXemVyOThjNlltSFc3bnZPdllkUFphY3k1Q05Baml2Z1Vo?=
 =?utf-8?B?OUNnbjRhN3l2Q1pvanpDNnVMd2Y5YVFMTGJZTEcrWHZFdndGR2p3Q1BQVmwx?=
 =?utf-8?B?eXpJRExWZFFuSStUQU1sSkNFcUkwc2ttN2R5N0NMSmlLZURGYUhjS0Q1QW9n?=
 =?utf-8?B?UWFLMGdSVGY5L3AyWW5SNUlkbmdHZjNHQ0tUQXl3TnA3SGdwOVNBOGkyTXFQ?=
 =?utf-8?B?QmhtQWM3d0VhSXNzTjAyRlgzV3V2S0V5cnZPdnJhUXhMYlREMnJTT0hzbDBH?=
 =?utf-8?B?MWs5cldndFdCSUFIWHF5NFo3ckFWdW1wdjFKM2lvbEVnM1NNcE40YlZrSGp3?=
 =?utf-8?B?QVNlQzhWTm16Ny9FVkM5UzQzeHhua0YzT1liNWJhU1J1bjVEc0ErVWsvV3Fu?=
 =?utf-8?B?UTNqZHZPUlg1TUVyWW14d0l3d2FOSVpDRnBIY1lCcnhFcThmMFJqZkRDQ0hQ?=
 =?utf-8?B?QUwrcVhvYlliUlRLOGx5L2R2Y1hOQzFRanhJY3V2TWMrV1ExZzB3QWo5aTNC?=
 =?utf-8?B?d1c1SzEwSm4vMFFyLzdDM205Skl4cklmckxIc1NWUjVtVk84K1h4dXN3UDVv?=
 =?utf-8?B?ZytVVW8xK2Vyc01jZmlqVjRsLzRhK3o0L2ZJeG0xYVBhcVRhQkcrSUtZNzh1?=
 =?utf-8?B?TDBIQVZ4bEZPVGdGT2ZCMXJPRXgvMHdDVERvY1oreUttY0dSRWRyRW5TTHFU?=
 =?utf-8?B?VWpLYzJ1Tmp2eGwrKzgxSGt0VzBNTGpwWlhrdWMvRlk5b3VxbXJveUVoN2w0?=
 =?utf-8?B?R3NzeUlxallGMUswWUlhT1hvM2xjK1JZdDFXQmVvZVBjZHpqdmhvYWJVUkFo?=
 =?utf-8?B?Y1l6dGozanJGbGg5RWtRSEVPZ2xxRlpqSEtPVFltcW5lWGxIR0Z4N0xVbkpR?=
 =?utf-8?B?OVNNTHAwVmk3cmFFdElHQ21pMnJIWEMyYzBVcSttNU1KTVNXNGpFNlZMM3M1?=
 =?utf-8?B?OGVPbVFiM3Nid0ZhT3ZRQ1lwSUZFdkNrc3lnakd6TlNYbnlGamZ3a08rRE5K?=
 =?utf-8?B?dm81eGxyMDg2K3ZsL0o1YTJwb3Y1U04zd3c2V1hsTUpzS1hKVFNLYmtQZlJo?=
 =?utf-8?B?Z3hDbnd5VG9UVk1aQXVFdzVXZDNkMC9wZjY2OXlMZHN5YU02YzF0QVZIalRD?=
 =?utf-8?B?YStEaWdFcTBvTHBTR3FVbmpHVnd5cGZkTnZLSTBsSEszczgyYk5mNy9tQ1J5?=
 =?utf-8?B?NEoxbzdkZ1hYYWtoRG1NY0FmQkRzL0NZWmF4azVCSmZXV2NmWk9xSTRjd3lt?=
 =?utf-8?B?UGcrN1doNW9URmpIeVRlbFljVnBnWG90SHRodUp3SWUvMWJQSFAyY1U2MEt0?=
 =?utf-8?B?WWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49BD98163C2F2044ABB514897981CBE3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d19e1d14-40cf-406b-6bce-08dc1c04cd6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 11:16:53.1127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c3leklxw2YVtsNr1Zi7yVMKgrXm7CjL9XY4nI3Gmdv1Yon2zJx8d0QEMfVCSqqVNYNY6bGT/Tu4LUrgunk6Lgs6H7V4t4OIfqY8K5+Cmu7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2066
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andre
 w Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIzLzAxLzIwMjQgw6AgMTI6MDgsIFJ5YW4gUm9iZXJ0cyBhIMOpY3JpdMKgOg0KPiBP
biAyMy8wMS8yMDI0IDEwOjQ4LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToNCj4+IE9uIDIzLjAx
LjI0IDExOjM0LCBSeWFuIFJvYmVydHMgd3JvdGU6DQo+Pj4gT24gMjIvMDEvMjAyNCAxOTo0MSwg
RGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6DQo+Pj4+IFdlIHdhbnQgdG8gbWFrZSB1c2Ugb2YgcHRl
X25leHRfcGZuKCkgb3V0c2lkZSBvZiBzZXRfcHRlcygpLiBMZXQncw0KPj4+PiBzaW1wbGl5IGRl
ZmluZSBQRk5fUFRFX1NISUZULCByZXF1aXJlZCBieSBwdGVfbmV4dF9wZm4oKS4NCj4+Pj4NCj4+
Pj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+DQo+
Pj4+IC0tLQ0KPj4+PiAgwqAgYXJjaC9hcm0vaW5jbHVkZS9hc20vcGd0YWJsZS5owqDCoCB8IDIg
KysNCj4+Pj4gIMKgIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgMiArKw0KPj4+
PiAgwqAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4+Pj4NCj4+Pj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL3BndGFibGUuaA0KPj4+PiBpbmRleCBkNjU3Yjg0YjZiZjcwLi5iZTkxZTM3NmRmNzllIDEw
MDY0NA0KPj4+PiAtLS0gYS9hcmNoL2FybS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgNCj4+Pj4gKysr
IGIvYXJjaC9hcm0vaW5jbHVkZS9hc20vcGd0YWJsZS5oDQo+Pj4+IEBAIC0yMDksNiArMjA5LDgg
QEAgc3RhdGljIGlubGluZSB2b2lkIF9fc3luY19pY2FjaGVfZGNhY2hlKHB0ZV90IHB0ZXZhbCkN
Cj4+Pj4gIMKgIGV4dGVybiB2b2lkIF9fc3luY19pY2FjaGVfZGNhY2hlKHB0ZV90IHB0ZXZhbCk7
DQo+Pj4+ICDCoCAjZW5kaWYNCj4+Pj4gIMKgICsjZGVmaW5lIFBGTl9QVEVfU0hJRlTCoMKgwqDC
oMKgwqDCoCBQQUdFX1NISUZUDQo+Pj4+ICsNCj4+Pj4gIMKgIHZvaWQgc2V0X3B0ZXMoc3RydWN0
IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwNCj4+Pj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBwdGVfdCAqcHRlcCwgcHRlX3QgcHRldmFsLCB1bnNpZ25lZCBpbnQg
bnIpOw0KPj4+PiAgwqAgI2RlZmluZSBzZXRfcHRlcyBzZXRfcHRlcw0KPj4+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL2FybTY0L2luY2x1ZGUv
YXNtL3BndGFibGUuaA0KPj4+PiBpbmRleCA3OWNlNzBmYmI3NTFjLi5kNGIzYmQ5NmUzMzA0IDEw
MDY0NA0KPj4+PiAtLS0gYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPj4+PiAr
KysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPj4+PiBAQCAtMzQxLDYgKzM0
MSw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX3N5bmNfY2FjaGVfYW5kX3RhZ3MocHRlX3QgcHRl
LA0KPj4+PiB1bnNpZ25lZCBpbnQgbnJfcGFnZXMpDQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAg
bXRlX3N5bmNfdGFncyhwdGUsIG5yX3BhZ2VzKTsNCj4+Pj4gIMKgIH0NCj4+Pj4gIMKgICsjZGVm
aW5lIFBGTl9QVEVfU0hJRlTCoMKgwqDCoMKgwqDCoCBQQUdFX1NISUZUDQo+Pj4NCj4+PiBJIHRo
aW5rIHRoaXMgaXMgYnVnZ3kuIEFuZCBzbyBpcyB0aGUgYXJtNjQgaW1wbGVtZW50YXRpb24gb2Yg
c2V0X3B0ZXMoKS4gSXQNCj4+PiB3b3JrcyBmaW5lIGZvciA0OC1iaXQgb3V0cHV0IGFkZHJlc3Ms
IGJ1dCBmb3IgNTItYml0IE9BcywgdGhlIGhpZ2ggYml0cyBhcmUgbm90DQo+Pj4ga2VwdCBjb250
aWdvdXNseSwgc28gaWYgeW91IGhhcHBlbiB0byBiZSBzZXR0aW5nIGEgbWFwcGluZyBmb3Igd2hp
Y2ggdGhlDQo+Pj4gcGh5c2ljYWwgbWVtb3J5IGJsb2NrIHN0cmFkZGxlcyBiaXQgNDgsIHRoaXMg
d29uJ3Qgd29yay4NCj4+DQo+PiBSaWdodCwgYXMgc29vbiBhcyB0aGUgUFRFIGJpdHMgYXJlIG5v
dCBjb250aWd1b3VzLCB0aGlzIHN0b3BzIHdvcmtpbmcsIGp1c3QgbGlrZQ0KPj4gc2V0X3B0ZXMo
KSB3b3VsZCwgd2hpY2ggSSB1c2VkIGFzIG9yaWVudGF0aW9uLg0KPj4NCj4+Pg0KPj4+IFRvZGF5
LCBvbmx5IHRoZSA2NEsgYmFzZSBwYWdlIGNvbmZpZyBjYW4gc3VwcG9ydCA1MiBiaXRzLCBhbmQg
Zm9yIHRoaXMsDQo+Pj4gT0FbNTE6NDhdIGFyZSBzdG9yZWQgaW4gUFRFWzE1OjEyXS4gQnV0IDUy
IGJpdHMgZm9yIDRLIGFuZCAxNksgYmFzZSBwYWdlcyBpcw0KPj4+IGNvbWluZyAoaG9wZWZ1bGx5
IHY2LjkpIGFuZCBpbiB0aGlzIGNhc2UgT0FbNTE6NTBdIGFyZSBzdG9yZWQgaW4gUFRFWzk6OF0u
DQo+Pj4gRm9ydHVuYXRlbHkgd2UgYWxyZWFkeSBoYXZlIGhlbHBlcnMgaW4gYXJtNjQgdG8gYWJz
dHJhY3QgdGhpcy4NCj4+Pg0KPj4+IFNvIEkgdGhpbmsgYXJtNjQgd2lsbCB3YW50IHRvIGRlZmlu
ZSBpdHMgb3duIHB0ZV9uZXh0X3BmbigpOg0KPj4+DQo+Pj4gI2RlZmluZSBwdGVfbmV4dF9wZm4g
cHRlX25leHRfcGZuDQo+Pj4gc3RhdGljIGlubGluZSBwdGVfdCBwdGVfbmV4dF9wZm4ocHRlX3Qg
cHRlKQ0KPj4+IHsNCj4+PiAgwqDCoMKgwqByZXR1cm4gcGZuX3B0ZShwdGVfcGZuKHB0ZSkgKyAx
LCBwdGVfcGdwcm90KHB0ZSkpOw0KPj4+IH0NCj4+Pg0KPj4+IEknbGwgZG8gYSBzZXBhcmF0ZSBw
YXRjaCB0byBmaXggdGhlIGFscmVhZHkgYnJva2VuIGFybTY0IHNldF9wdGVzKCkNCj4+PiBpbXBs
ZW1lbnRhdGlvbi4NCj4+DQo+PiBNYWtlIHNlbnNlLg0KPj4NCj4+Pg0KPj4+IEknbSBub3Qgc3Vy
ZSBpZiB0aGlzIHR5cGUgb2YgcHJvYmxlbSBtaWdodCBhbHNvIGFwcGx5IHRvIG90aGVyIGFyY2hl
cz8NCj4+DQo+PiBJIHNhdyBzaW1pbGFyIGhhbmRsaW5nIGluIHRoZSBQUEMgaW1wbGVtZW50YXRp
b24gb2Ygc2V0X3B0ZXMsIGJ1dCB3YXMgbm90IGFibGUNCj4+IHRvIGNvbnZpbmNlIG1lIHRoYXQg
aXQgaXMgYWN0dWFsbHkgcmVxdWlyZWQgdGhlcmUuDQo+Pg0KPj4gcHRlX3BmbiBvbiBwcGMgZG9l
czoNCj4+DQo+PiBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgcHRlX3BmbihwdGVfdCBwdGUp
DQo+PiB7DQo+PiAgwqDCoMKgwqByZXR1cm4gKHB0ZV92YWwocHRlKSAmIFBURV9SUE5fTUFTSykg
Pj4gUFRFX1JQTl9TSElGVDsNCj4+IH0NCj4+DQo+PiBCdXQgdGhhdCBtZWFucyB0aGF0IHRoZSBQ
Rk5zICphcmUqIGNvbnRpZ3VvdXMuDQo+IA0KPiBhbGwgdGhlIHBwYyBwZm5fcHRlKCkgaW1wbGVt
ZW50YXRpb25zIGFsc28gb25seSBzaGlmdCB0aGUgcGZuLCBzbyBJIHRoaW5rIHBwYyBpcw0KPiBz
YWZlIHRvIGp1c3QgZGVmaW5lIFBGTl9QVEVfU0hJRlQuIEFsdGhvdWdoIDIgb2YgdGhlIDMgaW1w
bGVtZW50YXRpb25zIHNoaWZ0IGJ5DQo+IFBURV9SUE5fU0hJRlQgYW5kIHRoZSBvdGhlciBzaGlm
dHMgYnkgUEFHRV9TSVpFLCBzbyB5b3UgbWlnaHQgd2FudCB0byBkZWZpbmUNCj4gUEZOX1BURV9T
SElGVCBzZXBhcmF0ZWx5IGZvciBhbGwgMyBjb25maWdzPw0KDQpXZSBoYXZlIFBURV9SUE5fU0hJ
RlQgZGVmaW5lZCBmb3IgYWxsIDQgaW1wbGVtZW50YXRpb25zLCBmb3Igc29tZSBvZiANCnRoZW0g
eW91IGFyZSByaWdodCBpdCBpcyBkZWZpbmVkIGFzIFBBR0VfU0hJRlQsIGJ1dCBJIHNlZSBubyBy
ZWFzb24gdG8gDQpkZWZpbmUgUEZOX1BURV9TSElGVCBzZXBhcmF0ZWx5Lg0KDQo+IA0KPj4gSWYg
aGlnaCBiaXRzIGFyZSB1c2VkIGZvcg0KPj4gc29tZXRoaW5nIGVsc2UsIHRoZW4gd2UgbWlnaHQg
cHJvZHVjZSBhIGdhcmJhZ2UgUFRFIG9uIG92ZXJmbG93LCBidXQgdGhhdA0KPj4gc2hvdWxkbid0
IHJlYWxseSBtYXR0ZXIgSSBjb25jbHVkZWQgZm9yIGZvbGlvX3B0ZV9iYXRjaCgpIHB1cnBvc2Vz
LCB3ZSdkIG5vdA0KPj4gZGV0ZWN0ICJiZWxvbmdzIHRvIHRoaXMgZm9saW8gYmF0Y2giIGVpdGhl
ciB3YXkuDQo+IA0KPiBFeGFjdGx5Lg0KPiANCj4+DQo+PiBNYXliZSBpdCdzIGxpa2VseSBjbGVh
bmVyIHRvIGFsc28gaGF2ZSBhIGN1c3RvbSBwdGVfbmV4dF9wZm4oKSBvbiBwcGMsIEkganVzdA0K
Pj4gaG9wZSB0aGF0IHdlIGRvbid0IGxvc2UgYW55IG90aGVyIGFyYml0cmFyeSBQVEUgYml0cyBi
eSBkb2luZyB0aGUgcHRlX3BncHJvdCgpLg0KPiANCj4gSSBkb24ndCBzZWUgdGhlIG5lZWQgZm9y
IHBwYyB0byBpbXBsZW1lbnQgcHRlX25leHRfcGZuKCkuDQoNCkFncmVlZC4NCg0KPiANCj4gcHRl
X3BncHJvdCgpIGlzIG5vdCBhICJwcm9wZXIiIGFyY2ggaW50ZXJmYWNlIChpdHMgb25seSByZXF1
aXJlZCBieSB0aGUgY29yZS1tbQ0KPiBpZiB0aGUgYXJjaCBpbXBsZW1lbnRzIGEgY2VydGFpbiBL
Y29uZmlnIElJUkMpLiBGb3IgYXJtNjQsIGFsbCBiaXRzIHRoYXQgYXJlIG5vdA0KPiBwZm4gYXJl
IHBncHJvdCwgc28gdGhlcmUgYXJlIG5vIGJpdHMgbG9zdC4NCj4gDQo+Pg0KPj4NCj4+IEkgZ3Vl
c3MgcHRlX3BmbigpIGltcGxlbWVudGF0aW9ucyBzaG91bGQgdGVsbCB1cyBpZiBhbnl0aGluZyBz
cGVjaWFsIG5lZWRzIHRvDQo+PiBoYXBwZW4uDQo+Pg0KPiANCg==
