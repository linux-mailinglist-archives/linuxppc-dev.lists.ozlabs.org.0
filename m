Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5C985D65E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 12:02:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=XYc+SGek;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TftfN3p1Nz3vYc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 22:02:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=XYc+SGek;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::700; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tfp722Kvtz3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 18:38:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0HWueNXSvinZgZ6KPRNtraBkLlCJ5UMQVYYnxqL89EOM0Bk+vlePeDmIwQPMedg7YyzlgjKtitov8q23Q125aUTz27ZVGtVpaFFEF+6uJHNPZUD9N8bCIM8tmCZJlJEU0Ih5VIyDv0R4OpzxZERq3j8vb4JI91UUi29+XHAdxn0weGPZACq0zCktUZkMZCzU8hwUrfYVqkg4QW3sZ0RScBWg16w0xKJN/rhnvDaW4jgszZBSW/1rsU8dMa2HxAnHDVFUWayKn2dJquMoELTMIWl+SPWTLEEfqyjbFpwdSo712qEzrWmcZ21IiWc2NffN8LPHeBVtHSgjN/cidX+pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXZLuJtNgTm52IXo2S8naIieT83ZW1InPsP2+L/39lY=;
 b=ZQAW/FqBWABgMsS4pxIYtl67jg0DLJu+A2hRy2jFilApmvVcExnsyEgM5toCGajS3Eu2GRFeoE2WenciRkVkqFb3PD7Ftmr2vjUancEl+d0KiQS6t1gfvOsgEe4MWRSvOhteEuT7k1zqvAOli5s+AWx4Y32aZZV3BXz02NMEmU0/zRmdxOz+XCXXvmplpYLSdYtM1t6uJ2KyE6psEePuCn6GT4XVdw3LjszY4TSc34XEPjbC5kX0ZuV7pyo3fyS0L+tWi6abGwW6ZEVN3tWP96idtH6I+brazF5OldWm2iiIVBFitAbEED0RK4ad3yxC7xRtcrZ2aophIxjFLhiphg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXZLuJtNgTm52IXo2S8naIieT83ZW1InPsP2+L/39lY=;
 b=XYc+SGekOEFzziIvcH4RvN4vt62U/MqVp1rDN0m07StgyDOzjIWRgru4RqPTczeEESPAZ3OV77omZVCp/Sqoq32N+Npw5NXa8oNPGR2QJk6EPjHKcNJPMD3g+5KTfVfJa+PQ2CXKIdtUsTXOdqXSZ0EtrSlT7QGYzcmSCNg+BVgFqsZiWLkKktwTFSq477lIe3mQp9FD/9V8+O9ynOSSPZvI8w9buSpja262bsBxwgFCdRvLKCK/yF0V902DUhjOp+U/Vejp7R8oyH7n5ZPm57/ffXe3PdyMrNKgDxRkrqm6wDUhUqjLGj+dVY7qm7QO0sxBJPOphjGpD3+aJCTuIg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3660.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:162::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Wed, 21 Feb
 2024 07:38:32 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589%7]) with mapi id 15.20.7292.036; Wed, 21 Feb 2024
 07:38:32 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Christoph Hellwig <hch@infradead.org>, Maxwell Bland <mbland@motorola.com>
Subject: Re: [PATCH 1/4] mm/vmalloc: allow arch-specific vmalloc_node
 overrides
Thread-Topic: [PATCH 1/4] mm/vmalloc: allow arch-specific vmalloc_node
 overrides
Thread-Index: AQHaZDwS6FkPILIvP0qdTgNTWVgWnbEUSTcAgAAgP4A=
Date: Wed, 21 Feb 2024 07:38:32 +0000
Message-ID: <e508c3e0-8644-40f1-aee2-90625237b01c@csgroup.eu>
References: <20240220203256.31153-1-mbland@motorola.com>
 <20240220203256.31153-2-mbland@motorola.com> <ZdWNalbmABYDuFHE@infradead.org>
In-Reply-To: <ZdWNalbmABYDuFHE@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3660:EE_
x-ms-office365-filtering-correlation-id: 0ad90097-84ff-4286-924b-08dc32b01ad2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /ye+NiC8jyBUKD38/Q5eOx6zLGvyGGkiJNjR7VDR2ZVxFydv5FebhevuJCUBTHfgZ8XjblfnGOa7I6+9CrT5/0S7XqYi0GdXF5BRGgjPUXxg0KpLLfDjmrRaxZO3ystievjwyF3wkCrxjevjA8SM5lY4V1IMbQlKxWJoT9owF5LBDXPuQ4B+47GtqYoX6HdGS2SqFEBThQ8KGKrUpKpJf2DTeAqGaj0pzTLjVbkKRmNgkaF2wi+lAeZq+bU5Csn0+YGc5J7j30rfQYbyhGu2/DsXQYMl9twDp/5mT/41TzYMKqINaF4oIdz3pi7MbEtJxRgVZNL7VsivR7s4LYV0pPVqv//+h6Y6zjnUwXxONLc1p2rSel4UtCtBnA+9RvZWZUVKZjDQo+2gT9f6Ib5ztPfhAVg4oUb6Xr9+9cmdx+eguV6ckIJdyDfcIXfU/H10GdN9p3JuU+tRPOd2fkPzp2cIYdR2t9a/Re6P7Jx/VimI0HQnqsuXFtsVuwNAxhYkThPQxSIEDGNIOpKmatoSMUPpb8CjVyZ9dmFamS6vixPBrwZmyXSGKqW+4sZQdUzNGLbPLtoVfJi8612XSuPawBiE90AfkQfiKewcWWwwgT1n1fQkjm3EEnxdYs8hqqO5
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NU9pRFE2d1pab0hMa0c0b0dqeU1vNFQwbGgyY2w0ekFFYUVONHNzNmw1TWlM?=
 =?utf-8?B?MDB3WDlZR0pqUEdueWlvN1BBY1Z2bjhTeGpIQlM2c0pmV1AwekJ0V1BBRkFv?=
 =?utf-8?B?ZjdaSDlNVHoycHVYTFBFYi9lZmxhSE1hRjVjVFJSdHdGZ2RXL1U5L3FxS2FU?=
 =?utf-8?B?WUpOM1VNUGF5VmhYRUovK1REeTBpSis0MS9vOEdTWG0rendBcUNBeDRiYVhN?=
 =?utf-8?B?Sld5Q3Iva2g1M2tIVmpQYitVcFQvSHJiYVp1OE1iU1Bja2ZrbkRLNXpESlJj?=
 =?utf-8?B?REdxMXJEaUpIRzRDN1hpazBxbDFiTUt6Z1BqYm9yRmVoQzFLN1B3QWo4dUJy?=
 =?utf-8?B?SksvaWdyTXJpY3lKeldmZUZoNnNXUGIwQ0VsZlBnZ0Y5VEViNDhjMDllN2x5?=
 =?utf-8?B?YXR2SmZQcXFDbUFYSWRjUUF6aS9yOTZSK2tBWWdhV0NpbHV2Uit6YlVsS1NH?=
 =?utf-8?B?bld2VVdWdms0YWFUSDlsUE1GL1QrTmUvaTNTR3puN1J4SmdENnIvRnRib05B?=
 =?utf-8?B?eEtCRUZGTE9FUnJKblFsYjF4czFKZE1OR0JXd2t4N2xyQ0hpOUFsR0k4ZWpO?=
 =?utf-8?B?NzlhYngyL3cyWTdVdlpqdUI2bkZNUklwTy9tdmd3VTJvYUpIWXN3TStQV00z?=
 =?utf-8?B?TDFMT2xabjloVlhUbFRUTzlDRlcwUHhJamJpRjBuUFlNVkVUVTlOQTR4VmR2?=
 =?utf-8?B?R0prM0x4U3o2VVNpM2x3aTBSSEsxd1pwbGpjSGozQmJjYkg1akRTakhFM3JQ?=
 =?utf-8?B?KzhFeDFjREExM2l6dlBOQ1ByUHhqQmJaQVRqY1JCL2pnNVhlWjlKV2VIMXZ5?=
 =?utf-8?B?a3lrS2xuNlFERGJDUm1XREQ2cGpWekFtUHhhSXI1MDh3d08xeWZHSHE1ZXgw?=
 =?utf-8?B?eUM5RkNKNExPblBiOFllaklzZlg1RUZqSmZ1UjRwY1RvMVA3dm9Benh0MGhE?=
 =?utf-8?B?NVpIY3ZDVXBmVzdMNzBFU3BRai9TWnd1RXJFTEFkNmpYNGFnRlJPc2FMY3cx?=
 =?utf-8?B?a2w5SmVuKzV5Z3NURGNXekJvZ1dEdTVPdFpaTnVJd0txRU5ISkJLYy9aVmZI?=
 =?utf-8?B?M0VqK2RaRXhZYXk0aU9kVGJCWWtuUnhrMTl3VlBQVndWQmpkbXRUNjZoYW1k?=
 =?utf-8?B?VWxFc3Q2Z0hoTDRndzBTeFQ4eklzbmdkdjk0U25PUC84cU1HTDFrZVFLMWEz?=
 =?utf-8?B?UVhiZHd6OEZYaldmMTZkd1lCK21IZDVTMEVkTFloV2RkSENFZmViR1dDUVdY?=
 =?utf-8?B?TGJUaFlJRWllSjdsc1NUUFM1VnNvcHhDQXlWako5aFFiVElRRmk1cTJ1M1h6?=
 =?utf-8?B?VDJCb04xQlhGOFRUVWh3M1VZeFhZdVFtNytIeXVFMEp3bERMbFlPSmorTFlm?=
 =?utf-8?B?NHFKaHJ3aTFiVlh2QVBPTHVCV240Qjg5c0w4cTVWZ2lEQWxpdW81TU1HZGZR?=
 =?utf-8?B?Sk5oUmNsYXA1dWs3ZEcwdytmekpJSE55NThDc2xGUVBsYTRiWWlWUWVORHNS?=
 =?utf-8?B?ajJCdS9aY2xoaXFPMGFBU2NMOUNTWUc0NGdueDBqSFRXcFN6bkZ4ZHNabUVZ?=
 =?utf-8?B?MFBaQzRyaU5QZHdpTHdMdEtYL09kOFhUcGFoZ1VHM3pYNHg0RVBOZW1seVZB?=
 =?utf-8?B?Zk16V090WkptVFJJMFJiWk1oRndGWVNOM1hIMjQ5Vm9xakliaUI4OEV4TnE0?=
 =?utf-8?B?RHUyZWlDMzErRnlhNzVvQVIxU3R1eFlQN2Q4YndTNW9rR05BdUh6cVhNek8w?=
 =?utf-8?B?c0lSR0xHWURNcnRTYm1CVHdjQTFid1BSa3NvYXBEbUlwVFVISCsyUGJRZHpL?=
 =?utf-8?B?anp2SjRQYXpvZSthL1NUaUFYTXFaTkNIOGhPT1RjeDJCbG9Rd2hlTWpuRWxt?=
 =?utf-8?B?MEZuUHk2KzNQV25LZGpKdVdDdGYxcDRNUHFVZE9sYVNwNXo4YW9acVFSMzNV?=
 =?utf-8?B?SW5hemdycU9mUWZTVytsYXgxSk41MVhQeXlvM0VKdTNKeTMvM3I5QjJIaFli?=
 =?utf-8?B?ZGxDUUM4QWxkMURPRXdxWmNTUzZ6Yjh5eElKcXZHc0dQRjZVWEhFTDVIeVh6?=
 =?utf-8?B?NnR6ME5ZREpJbHVHbnFUZ05oSDF5QUVCUUtEaDBJUGFnTHBEMmRJUzJFNWhZ?=
 =?utf-8?Q?P8FL5k9l3JMP9mcURlctrXEg1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6302266E3F2ADF4B9219C990578BC0A5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad90097-84ff-4286-924b-08dc32b01ad2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2024 07:38:32.5128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OCAT1sYyjWBizOWOz5o72xlfzVAm6cj/PsVud6+IRWc20HYzILTVwNr9S3EI1MtezxNC60gA5/79pJoFCdQZNmK2R1x5SV2Z6yR7gejkfSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3660
X-Mailman-Approved-At: Wed, 21 Feb 2024 21:59:20 +1100
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>, "david@redhat.com" <david@redhat.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "ast@kernel.org" <ast@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "ryabinin.a.a@gmail.com" <ryabinin.a.a@gmail.com>, "glider@google.com" <glider@google.com>, "sdf@google.com" <sdf@google.com>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "wuqiang.matt@bytedance.com" <wuqiang.matt@bytedance.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "vincenzo.frascino@arm.com" <vincenzo.frascino@arm.com>, "will@kernel.org" <will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>, "michael.christie@oracle.com" <michael.christie@oracle.com>, "quic_nprakash@quicinc.com" <quic_nprakash@quicinc.com>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-s390@
 vger.kernel.org" <linux-s390@vger.kernel.org>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "mst@redhat.com" <mst@redhat.com>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "andrii@kernel.org" <andrii@kernel.org>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "urezki@gmail.com" <urezki@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "samitolvanen@google.com" <samitolvanen@google.com>, "zlim.lnx@gmail.com" <zlim.lnx@gmail.com>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "dennis@kernel.org" <dennis@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "cl@linux.com" <cl@linux.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "arnd@arndb.de" <arnd@arndb.de>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "kpsin
 gh@kernel.org" <kpsingh@kernel.org>, "meted@linux.ibm.com" <meted@linux.ibm.com>, "quic_pkondeti@quicinc.com" <quic_pkondeti@quicinc.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "surenb@google.com" <surenb@google.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "dvyukov@google.com" <dvyukov@google.com>, "andreyknvl@gmail.com" <andreyknvl@gmail.com>, "haoluo@google.com" <haoluo@google.com>, "brauner@kernel.org" <brauner@kernel.org>, "mjguzik@gmail.com" <mjguzik@gmail.com>, "lstoakes@gmail.com" <lstoakes@gmail.com>, "song@kernel.org" <song@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "muchun.song@linux.dev" <muchun.song@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "awheeler@motorola.com" <awheeler@motorola.com>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "svens@linux.ibm.com" <svens@li
 nux.ibm.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "tj@kernel.org" <tj@kernel.org>, "guoren@kernel.org" <guoren@kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "rick.p.edgecombe@intel.com" <rick.p.edgecombe@intel.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIxLzAyLzIwMjQgw6AgMDY6NDMsIENocmlzdG9waCBIZWxsd2lnIGEgw6ljcml0wqA6
DQo+IE9uIFR1ZSwgRmViIDIwLCAyMDI0IGF0IDAyOjMyOjUzUE0gLTA2MDAsIE1heHdlbGwgQmxh
bmQgd3JvdGU6DQo+PiBQcmVzZW50IG5vbi11bmlmb3JtIHVzZSBvZiBfX3ZtYWxsb2Nfbm9kZSBh
bmQgX192bWFsbG9jX25vZGVfcmFuZ2UgbWFrZXMNCj4+IGVuZm9yY2luZyBhcHByb3ByaWF0ZSBj
b2RlIGFuZCBkYXRhIHNlcGVyYXRpb24gdW50ZW5hYmxlIG9uIGNlcnRhaW4NCj4+IG1pY3JvYXJj
aGl0ZWN0dXJlcywgYXMgVk1BTExPQ19TVEFSVCBhbmQgVk1BTExPQ19FTkQgYXJlIG1vbm9saXRo
aWMNCj4+IHdoaWxlIHRoZSB1c2Ugb2YgdGhlIHZtYWxsb2MgaW50ZXJmYWNlIGlzIG5vbi1tb25v
bGl0aGljOiBpbiBwYXJ0aWN1bGFyLA0KPj4gYXBwcm9wcmlhdGUgcmFuZG9tbmVzcyBpbiBBU0xS
IG1ha2VzIGl0IHN1Y2ggdGhhdCBjb2RlIHJlZ2lvbnMgbXVzdCBmYWxsDQo+PiBpbiBzb21lIHJl
Z2lvbiBiZXR3ZWVuIFZNQUxMT0NfU1RBUlQgYW5kIFZNQUxMT0NfZW5kLCBidXQgdGhpcw0KPj4g
bmVjZXNzaXRhdGVzIHRoYXQgY29kZSBwYWdlcyBhcmUgaW50ZXJtaW5nbGVkIHdpdGggZGF0YSBw
YWdlcywgbWVhbmluZw0KPj4gY29kZS1zcGVjaWZpYyBwcm90ZWN0aW9ucywgc3VjaCBhcyBhcm02
NCdzIFBYTlRhYmxlLCBjYW5ub3QgYmUNCj4+IHBlcmZvcm1hbnRseSBydW50aW1lIGVuZm9yY2Vk
Lg0KPiANCj4gVGhhdCdzIG5vdCBhY3R1YWxseSB0cnVlLiAgV2UgaGF2ZSBNT0RVTEVfU1RBUlQv
RU5EIHRvIHNlcGFyYXRlIHRoZW0sDQo+IHdoaWNoIGlzIHVzZWQgYnkgbWlwcyBvbmx5IGZvciBu
b3cuDQoNCldlIGhhdmUgTU9EVUxFU19WQUREUiBhbmQgTU9EVUxFU19FTkQgdGhhdCBhcmUgdXNl
ZCBieSBhcm0sIGFybTY0LCANCmxvb25nYXJjZywgcG93ZXJwYywgcmlzY3YsIHMzOTAsIHNwYXJj
LCB4ODZfNjQNCg0KaXNfdm1hbGxvY19vcl9tb2R1bGVfYWRkcigpIGlzIHVzaW5nIE1PRFVMRVNf
VkFERFIgc28gSSBndWVzcyB0aGlzIA0KZnVuY3Rpb24gZmFpbHMgb24gbWlwcyA/DQoNCj4gDQo+
Pg0KPj4gVGhlIHNvbHV0aW9uIHRvIHRoaXMgcHJvYmxlbSBhbGxvd3MgYXJjaGl0ZWN0dXJlcyB0
byBvdmVycmlkZSB0aGUNCj4+IHZtYWxsb2Mgd3JhcHBlciBmdW5jdGlvbnMgYnkgZW5mb3JjaW5n
IHRoYXQgdGhlIHJlc3Qgb2YgdGhlIGtlcm5lbCBkb2VzDQo+PiBub3QgcmVpbXBsZW1lbnQgX192
bWFsbG9jX25vZGUgYnkgdXNpbmcgX192bWFsbG9jX25vZGVfcmFuZ2Ugd2l0aCB0aGUNCj4+IHNh
bWUgcGFyYW1ldGVycyBhcyBfX3ZtYWxsb2Nfbm9kZSBvciBwcm92aWRlcyBhIF9fd2VhayB0YWcg
dG8gdGhvc2UNCj4+IGZ1bmN0aW9ucyB1c2luZyBfX3ZtYWxsb2Nfbm9kZV9yYW5nZSB3aXRoIHBh
cmFtZXRlcnMgcmVwZWF0aW5nIHRob3NlIG9mDQo+PiBfX3ZtYWxsb2Nfbm9kZS4NCj4gDQo+IEkn
bSByZWFsbHkgbm90IHRvbyBoYXBweSBhYm91dCBvdmVycmlkaW5nIHRoZSBmdW5jdGlvbnMuICBF
c3BlY2lhbGx5DQo+IGFzIHRoZSBzZXBhcmF0aW9uIGlzIGEgZ2VuZXJhbGx5IGdvb2QgaWRlYSBh
bmQgaXQgd291bGQgYmUgZ29vZCB0bw0KPiBtb3ZlIGV2ZXJ5b25lIChvciBhdCBsZWFzdCBhbGwg
bW9kZXJuIGFyY2hpdGVjdHVyZXMpIG92ZXIgdG8gYSBzY2hlbWUNCj4gbGlrZSB0aGlzLg0K
