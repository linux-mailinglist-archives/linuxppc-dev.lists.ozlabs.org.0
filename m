Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D77153C9F5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 14:26:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LF2DF47Hpz3c28
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 22:26:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=unf3/HwX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::616; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=unf3/HwX;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0616.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LF2CT6DZWz30Dp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jun 2022 22:25:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9wjVBU6bfgPpix+YS4AXXIW0PRwn1PdYSwXm+66aW+XoBBOM5FWZYhxTNxVys5tzP1GQsfXCp8cbTq2OidrrNggaOTK2P3zNfM70H/B8hQzTXr05VItgBm1+xY+0eaITSDFQFsaWKYSPMVLVSjSx6C+FAUnLrNE3vxJYdDGvDdBqfQJkRa+YrUyfutAwHfnvTAYY2CqHe+k1CLdDqDEd365Gj0f1eTsbNI02giYQqxIbYk7otLSJ0DRJmT3Faf2nlmNeCLNEbMqJUEOyi5TcWEXEwVaLDMWg8STmluuxLrSZKkAAgWeC3s4IkKJS9wY8Oae45MVD+Tp/0UvZPw6AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLQZdVFN120lpH4eCSi0be3tzhlU1Uw4HnIJ+jVMfCw=;
 b=H/dJC1FkhQuAxCFr9eboNJvfuTPebVYsGZF3d+NPrDOXONnSRqjWh7cSDeg+uFJGJfc4bebFSwT1ntsLDp23BkLBN523SlJlgbZasJmaBvPDg61AyxJc8xiBxnloPxdbBGbk/BsNaB7aQJyITIgvMa2Mk7bjly+2rze7+rNO4p0dYjvENZPCSsEGr5lGZ6uPVCniJDX5PPF6AqSuNwZz0bLR1WsXSr0KTLRC6ScyJtt8tjww73mLOhIJbu1yKADgojUwxMV2asJjP/SxbNQetPrf/I1V1WKXKl3XJ208jV5cHxnW7byTDjfuhIl3Gk4F7iyIChXnFbm7ObWfOr2mSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLQZdVFN120lpH4eCSi0be3tzhlU1Uw4HnIJ+jVMfCw=;
 b=unf3/HwXJj82QYbEtNc82Svcwot3zjtY6iWy9sZ7Q8k2eE+RMvBNY5jeEeOt/oD1wqcaS2M72eS61Nb3v+oR/GSmi38+ay6KjzmA1h5cW78YI7t0PWyWu794V/Avxw0rPWH71smxHHyxTJagXOuywA4//rZxlwjVeomJM06KxfOfX8LQPP4Ou80DheItV8Maj6Z/bs2WF1eXwNJk7ace1Yn4PIwF5IgXdTOy+QREVYZAfdI4/NRJr7P1v7npnZyMYRV7+jxko8B7lfxTBDE4pPuOy71YVbUKz7uqlCKigunrBVcRXp3gsh0ZRvFb2evmenR6FXzNCaAEx/OPA49CgQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2197.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 3 Jun
 2022 12:25:04 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%6]) with mapi id 15.20.5314.013; Fri, 3 Jun 2022
 12:25:04 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Anshuman Khandual <anshuman.khandual@arm.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>
Subject: Re: [PATCH 2/6] s390/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Thread-Topic: [PATCH 2/6] s390/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Thread-Index: AQHYdzLzDZQIBMBPsUWAT59L/XJdy609m4CA
Date: Fri, 3 Jun 2022 12:25:04 +0000
Message-ID: <a97cba97-73f0-e8c2-6445-1f314eb27d87@csgroup.eu>
References: <20220603101411.488970-1-anshuman.khandual@arm.com>
 <20220603101411.488970-3-anshuman.khandual@arm.com>
In-Reply-To: <20220603101411.488970-3-anshuman.khandual@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6ff8de1-6eeb-4d6a-68af-08da455c16af
x-ms-traffictypediagnostic: MRZP264MB2197:EE_
x-microsoft-antispam-prvs:  <MRZP264MB219799515342C7D68F857859EDA19@MRZP264MB2197.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hrQyn12i9F4j7Ul/Y7MAvieulMJ6+zY9zzEot9snBD6qFlhOeFp6qWU0YeJku0QUTMB4Uu6XDLzEdUTguKkrNB0y1aC0GvBH1IiAb3gMWcJh8Q3Afc1KWOiYwQO0aXuASPnkoFr2jKN7+vqMoixXqcYM7SEa3QYX2n913ullguj45ECZb8UzDbxwS6Q83JmEJGKynmfRHjDVFj9hKEQ30BKtmak6pCjk0qiopNmhzy2+7xmXHN75tX+kopPBjpnCi9ZpvpWeex2a4rfUUyaLNFBD2T2KJf4QRDNQSOrkXWEFJFt3vGugu14QUk9pS8zUzUU58dqh7cqGByUVBW7nG89Xu65e33xlL0/tK2BkCAhB+TiOyEbk9EQQfP6sarAlnuITqBN4LckkeBIsVkT4ubvK8uAejptqEpPyYdlyWUwGNI+RRKEq9EMmShOOnfZ2jKODLy/cqGKehswcHOVOIO/k1b4a0AAuLBB+cQPmD1aA7FMAs4qH73EeZ29a95DF8IaKtm+kJ/Nahc4M2x6UUeE+lUS4cd32p5Zvlf8PI3BAKGALZrXolZtm6758WeYyWfMj7LBLohF+1lLLekc716nepKTcwQX/PIvNjJRyqCCQGC1o9zU5e5XcgYnOOiXzckg1BC8C7rKQEyCb8Z5vOaBaq03DF3CfMVBMaSEnY6v7sbd751jOmlbtuhFnjvKh5MWJNEkHUEAroHaVIZYecs3fc0HpnJbm3wkEdOi9dYnxXh+oTi8aCOukLethPbG/anl5rNN5QIbJU3dZKIec8w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(76116006)(54906003)(64756008)(66446008)(91956017)(66556008)(4326008)(66476007)(66946007)(8676002)(31686004)(8936002)(110136005)(5660300002)(6486002)(71200400001)(44832011)(508600001)(2906002)(6506007)(6512007)(26005)(83380400001)(36756003)(86362001)(7416002)(31696002)(66574015)(186003)(38070700005)(316002)(122000001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Z1JTdFdQZDVTb0lkOUhTVysra3FWdng4dHREZ0xIdVQwUDIwem9rakwvdHVB?=
 =?utf-8?B?aHBVU3djYS9JcGFkeTFFUXRLVjdNSU16bG9yTXluN3RkN1Y3eG9hY2JyOHRv?=
 =?utf-8?B?VERRRGZ6VGFwc3BZMC9QQXRsWU9TQm9IK3ZRcUZGRUNDOHFnQWlVdjBNczhB?=
 =?utf-8?B?VTJ0VVJyMjdjbkczUmJQa3ZHYW9hSGxyT3hWTEpkM0g3Tm5PU3NuRDFFbUV2?=
 =?utf-8?B?UjRDa0RIelhEeTNlSUpyUzVhenBSaDJ2MUFRdlBxZGZQZ1YzczA0K2VJSmRh?=
 =?utf-8?B?dXBHNVBwV0NSOTk2UGpSMnVzcUROS3R2MHY5c0d4WW5HYTNvUXByT3A5L1lW?=
 =?utf-8?B?UTBIZlFsMU9tSDRzdERtK2QzMVhoemg5eSsyOGlJZEh0MWtoeDNieWhLRXg3?=
 =?utf-8?B?NHJJQzY4aFdZQVdKUDBUQUU2NkphWWw0elJvdVl2Z0tPUDJHZkQ5MnF4aUhN?=
 =?utf-8?B?OWpWb01pMVhnaU5tMHlkM0VkZjBxNXcrSmJMb3I2T1NBeUVSRXVNYThZR0xx?=
 =?utf-8?B?bmxmZG55QWYveXkvc014MEFRZGgyOGhlYlN1dGVabWpiY3hzT1o2d0l2bGUr?=
 =?utf-8?B?WFlmc1pwK09seVNtRWM3a3pjM1IrenNSMTNYSmVRM0FLekpULzhQelpXeVVX?=
 =?utf-8?B?VDdXcVdYS3lFWnJGaFBxblVxbUtsUjNmcE5BVU5uczNCQmM1NjNQTWpldTh6?=
 =?utf-8?B?c3VhVFl0cWg0QlRhY0c5V1BpM3JWaTNuWldWaGpnV254c1hkTFBtL2ErUnhl?=
 =?utf-8?B?dGgyT2FiaGhqbTlwU1ZTVElZS1dmMzlUSGJrM2F3bm5uVmtrQm1pMnFsTEtE?=
 =?utf-8?B?cTRHakdHM2tnQkxGNmoyNlRVQVhaL0FLYmRsQ0h5Unc4cjhsUER6QjlPeE5N?=
 =?utf-8?B?WU9qY3NyNmJWSGxTblQyUTFmS29HaHNUYXFZby9nbVFRNWtDY1ltamJNUWsv?=
 =?utf-8?B?N3h3T1c4SXNnODFhbkI1SVcwMUpLUnBDUmhBbURKQ1dDZFZ0SGkxVXdtaUxh?=
 =?utf-8?B?anAxcEcvZzNJQ2lDS3J1clpBZnJ4RFJhYmgwV2hyNjJiRnJYSnRiUjNCTXU1?=
 =?utf-8?B?azRnMGxraXdIVm9DSHFydE0wUWphTVpaNUthZ1NHRUdJOGQ4UWhLMmx1N1N5?=
 =?utf-8?B?RExVejYzNGhmU3ZVajRFK3hwWUpGeHdHdXlJd01ZalNQOXYwYlVwUmNCa0U5?=
 =?utf-8?B?SGZZMnR6UDVLSkIwT3BPRlJkUjJLQnBSbDNFOFRIcFdMZ1hYSzRwRzlOZDVT?=
 =?utf-8?B?NDRDd1FHOS9oSTN0MnVnMVphZ2NwclM5L0xLVVlCbzNNRGtWWHdqMUVYR21x?=
 =?utf-8?B?dGZVaGc4eEo2aXIyZUcwSDF0Qi9tS2xYU25SSzFPaU9FK2t6enJlV1hGMlF3?=
 =?utf-8?B?aVUza3pjRnZqUTgrUGUxeDhFeVBxbGdVYUpVUXY2cFdwZkRqWStQVWtFTk45?=
 =?utf-8?B?MC93ZmgrajYxb0l6eHlJbGNCeHdtdS82V0d4MDdaWWVWUUZFbklqbG1ZWVd5?=
 =?utf-8?B?MUVjZkJVZXBFOFlpSkdaZ1VhQW9jRlovOVN1eTJPYmFxeHlNc2ZUUkZIekUx?=
 =?utf-8?B?MmRISzRsZ0ZMZzVMdCsxcStocGFCUUxOZi9OYU56V1ZPRG5BZTVPaGwvRHVR?=
 =?utf-8?B?YTFNT3pOMWlmalFGMUtQaEw2NHZiZUdwbGJIYW5yRXJjT1RmZFRhb3FYK09i?=
 =?utf-8?B?dWM5TnhPVFFBdldYZVh6cWZ1eEtkelBxY3FFOTlEYVN6d0lqVlFIU0ZwWmFI?=
 =?utf-8?B?dDhNQTl2cG0rVm00RGVhSG5yTDBkNzNtRHFaTEpRTjAxeTNOejJHcGQ5ZVFM?=
 =?utf-8?B?TXhXZGhmZC9aVHF2NDFFcWNXWXFOSVZUckpjUzBsT21aOTRtRm1peTZyRXYx?=
 =?utf-8?B?Y3FDUStrSWlreTlVbGFOT1E4OFFuUXJCL1pRVGpKYkUxV2xIQ0pBeW9hRVpE?=
 =?utf-8?B?b2NQdzZDODlxdXZHNUZaWmVuc0RuTERWYXZBa1NSaXVVVjNScWtPaTBvTFRQ?=
 =?utf-8?B?ODdhenE5R09zV1dHTTkyb1JJYTdrUW04V2l2YmNGT3dhUGxOWTlobTJoMTVF?=
 =?utf-8?B?akZFamZVUGFNNU5DNXJkYVg3SS9iMWRucVN3elBTaS90OVNWTCtlcXpYcEFn?=
 =?utf-8?B?bmkzam9GRFNUQkVWOTZKQ2VqZXIrbkwrVkt0RHdHWE5GM09USmIwRXdpVDVC?=
 =?utf-8?B?MzhkYmowUzkxZ01ocGxKdTRQZUtMcWJJVGJFOEdxVTJVZUZTQmRyZUJZc3Ur?=
 =?utf-8?B?NE94K2ZSZFp3dHhsaW9DK3JIbzh6MjJLbVhpb3RkRU9kNDl3Tnd1Und3UGc4?=
 =?utf-8?B?T0pWNEMwcnRld0tPSGRvaC9HcFh1RVJENnYrc2xIVkUxOWFiWlRpTFVRVEIx?=
 =?utf-8?Q?2lsI6cTe0nYHl2MZQOjASTpIrWxOVHrPtoFXV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4523373F39ECB41B5273A661A8D0211@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ff8de1-6eeb-4d6a-68af-08da455c16af
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2022 12:25:04.5936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HC3lz/MSfGmZK+qLPb1F87h0Ds12E3uU89EImOkqyzsRiTqR9LgMX94uOOWj5Io4XDvUIPs1KT6xYRbpng0a/VV2rtFtVN5AHjzOzzWUu5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2197
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Jonas Bonn <jonas@southpole.se>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux
 -foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S.
 Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAzLzA2LzIwMjIgw6AgMTI6MTQsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6
DQo+IFRoaXMgZGVmaW5lcyBhbmQgZXhwb3J0cyBhIHBsYXRmb3JtIHNwZWNpZmljIGN1c3RvbSB2
bV9nZXRfcGFnZV9wcm90KCkgdmlhDQo+IHN1YnNjcmliaW5nIEFSQ0hfSEFTX1ZNX0dFVF9QQUdF
X1BST1QuIFN1YnNlcXVlbnRseSBhbGwgX19TWFhYIGFuZCBfX1BYWFgNCj4gbWFjcm9zIGNhbiBi
ZSBkcm9wcGVkIHdoaWNoIGFyZSBubyBsb25nZXIgbmVlZGVkLg0KPiANCj4gQ2M6IEhlaWtvIENh
cnN0ZW5zIDxoY2FAbGludXguaWJtLmNvbT4NCj4gQ2M6IFZhc2lseSBHb3JiaWsgPGdvckBsaW51
eC5pYm0uY29tPg0KPiBDYzogbGludXgtczM5MEB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gQWNrZWQtYnk6IFN2ZW4gU2NobmVsbGUgPHN2ZW5z
QGxpbnV4LmlibS5jb20+DQo+IEFja2VkLWJ5OiBBbGV4YW5kZXIgR29yZGVldiA8YWdvcmRlZXZA
bGludXguaWJtLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQW5zaHVtYW4gS2hhbmR1YWwgPGFuc2h1
bWFuLmtoYW5kdWFsQGFybS5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvczM5MC9LY29uZmlnICAgICAg
ICAgICAgICAgfCAgMSArDQo+ICAgYXJjaC9zMzkwL2luY2x1ZGUvYXNtL3BndGFibGUuaCB8IDE3
IC0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgYXJjaC9zMzkwL21tL21tYXAuYyAgICAgICAgICAgICB8
IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIDMgZmlsZXMgY2hhbmdl
ZCwgMzQgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9zMzkwL0tjb25maWcgYi9hcmNoL3MzOTAvS2NvbmZpZw0KPiBpbmRleCBiMTcyMzlhZTdi
ZDQuLmNkY2Y2NzhkZWFiMSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9zMzkwL0tjb25maWcNCj4gKysr
IGIvYXJjaC9zMzkwL0tjb25maWcNCj4gQEAgLTgxLDYgKzgxLDcgQEAgY29uZmlnIFMzOTANCj4g
ICAJc2VsZWN0IEFSQ0hfSEFTX1NZU0NBTExfV1JBUFBFUg0KPiAgIAlzZWxlY3QgQVJDSF9IQVNf
VUJTQU5fU0FOSVRJWkVfQUxMDQo+ICAgCXNlbGVjdCBBUkNIX0hBU19WRFNPX0RBVEENCj4gKwlz
ZWxlY3QgQVJDSF9IQVNfVk1fR0VUX1BBR0VfUFJPVA0KPiAgIAlzZWxlY3QgQVJDSF9IQVZFX05N
SV9TQUZFX0NNUFhDSEcNCj4gICAJc2VsZWN0IEFSQ0hfSU5MSU5FX1JFQURfTE9DSw0KPiAgIAlz
ZWxlY3QgQVJDSF9JTkxJTkVfUkVBRF9MT0NLX0JIDQo+IGRpZmYgLS1naXQgYS9hcmNoL3MzOTAv
aW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9zMzkwL2luY2x1ZGUvYXNtL3BndGFibGUuaA0K
PiBpbmRleCBhMzk3YjA3MmE1ODAuLmM2M2EwNWI1MzY4YSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9z
MzkwL2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiArKysgYi9hcmNoL3MzOTAvaW5jbHVkZS9hc20v
cGd0YWJsZS5oDQo+IEBAIC00MjQsMjMgKzQyNCw2IEBAIHN0YXRpYyBpbmxpbmUgaW50IGlzX21v
ZHVsZV9hZGRyKHZvaWQgKmFkZHIpDQo+ICAgICogaW1wbGllcyByZWFkIHBlcm1pc3Npb24uDQo+
ICAgICovDQo+ICAgICAgICAgICAgLyp4d3IqLw0KPiAtI2RlZmluZSBfX1AwMDAJUEFHRV9OT05F
DQo+IC0jZGVmaW5lIF9fUDAwMQlQQUdFX1JPDQo+IC0jZGVmaW5lIF9fUDAxMAlQQUdFX1JPDQo+
IC0jZGVmaW5lIF9fUDAxMQlQQUdFX1JPDQo+IC0jZGVmaW5lIF9fUDEwMAlQQUdFX1JYDQo+IC0j
ZGVmaW5lIF9fUDEwMQlQQUdFX1JYDQo+IC0jZGVmaW5lIF9fUDExMAlQQUdFX1JYDQo+IC0jZGVm
aW5lIF9fUDExMQlQQUdFX1JYDQo+IC0NCj4gLSNkZWZpbmUgX19TMDAwCVBBR0VfTk9ORQ0KPiAt
I2RlZmluZSBfX1MwMDEJUEFHRV9STw0KPiAtI2RlZmluZSBfX1MwMTAJUEFHRV9SVw0KPiAtI2Rl
ZmluZSBfX1MwMTEJUEFHRV9SVw0KPiAtI2RlZmluZSBfX1MxMDAJUEFHRV9SWA0KPiAtI2RlZmlu
ZSBfX1MxMDEJUEFHRV9SWA0KPiAtI2RlZmluZSBfX1MxMTAJUEFHRV9SV1gNCj4gLSNkZWZpbmUg
X19TMTExCVBBR0VfUldYDQo+ICAgDQo+ICAgLyoNCj4gICAgKiBTZWdtZW50IGVudHJ5IChsYXJn
ZSBwYWdlKSBwcm90ZWN0aW9uIGRlZmluaXRpb25zLg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9zMzkw
L21tL21tYXAuYyBiL2FyY2gvczM5MC9tbS9tbWFwLmMNCj4gaW5kZXggZDU0NWY1YzM5ZjdlLi4x
MWQ3NWI4ZDVlYzAgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvczM5MC9tbS9tbWFwLmMNCj4gKysrIGIv
YXJjaC9zMzkwL21tL21tYXAuYw0KPiBAQCAtMTg4LDMgKzE4OCwzNiBAQCB2b2lkIGFyY2hfcGlj
a19tbWFwX2xheW91dChzdHJ1Y3QgbW1fc3RydWN0ICptbSwgc3RydWN0IHJsaW1pdCAqcmxpbV9z
dGFjaykNCj4gICAJCW1tLT5nZXRfdW5tYXBwZWRfYXJlYSA9IGFyY2hfZ2V0X3VubWFwcGVkX2Fy
ZWFfdG9wZG93bjsNCj4gICAJfQ0KPiAgIH0NCj4gKw0KPiArcGdwcm90X3Qgdm1fZ2V0X3BhZ2Vf
cHJvdCh1bnNpZ25lZCBsb25nIHZtX2ZsYWdzKQ0KPiArew0KPiArCXN3aXRjaCAodm1fZmxhZ3Mg
JiAoVk1fUkVBRCB8IFZNX1dSSVRFIHwgVk1fRVhFQyB8IFZNX1NIQVJFRCkpIHsNCj4gKwljYXNl
IFZNX05PTkU6DQo+ICsJCXJldHVybiBQQUdFX05PTkU7DQo+ICsJY2FzZSBWTV9SRUFEOg0KPiAr
CWNhc2UgVk1fV1JJVEU6DQo+ICsJY2FzZSBWTV9XUklURSB8IFZNX1JFQUQ6DQo+ICsJCXJldHVy
biBQQUdFX1JPOw0KPiArCWNhc2UgVk1fRVhFQzoNCj4gKwljYXNlIFZNX0VYRUMgfCBWTV9SRUFE
Og0KPiArCWNhc2UgVk1fRVhFQyB8IFZNX1dSSVRFOg0KPiArCWNhc2UgVk1fRVhFQyB8IFZNX1dS
SVRFIHwgVk1fUkVBRDoNCj4gKwkJcmV0dXJuIFBBR0VfUlg7DQo+ICsJY2FzZSBWTV9TSEFSRUQ6
DQo+ICsJCXJldHVybiBQQUdFX05PTkU7DQo+ICsJY2FzZSBWTV9TSEFSRUQgfCBWTV9SRUFEOg0K
PiArCQlyZXR1cm4gUEFHRV9STzsNCj4gKwljYXNlIFZNX1NIQVJFRCB8IFZNX1dSSVRFOg0KPiAr
CWNhc2UgVk1fU0hBUkVEIHwgVk1fV1JJVEUgfCBWTV9SRUFEOg0KPiArCQlyZXR1cm4gUEFHRV9S
VzsNCj4gKwljYXNlIFZNX1NIQVJFRCB8IFZNX0VYRUM6DQo+ICsJY2FzZSBWTV9TSEFSRUQgfCBW
TV9FWEVDIHwgVk1fUkVBRDoNCj4gKwkJcmV0dXJuIFBBR0VfUlg7DQo+ICsJY2FzZSBWTV9TSEFS
RUQgfCBWTV9FWEVDIHwgVk1fV1JJVEU6DQo+ICsJY2FzZSBWTV9TSEFSRUQgfCBWTV9FWEVDIHwg
Vk1fV1JJVEUgfCBWTV9SRUFEOg0KPiArCQlyZXR1cm4gUEFHRV9SV1g7DQo+ICsJZGVmYXVsdDoN
Cj4gKwkJQlVJTERfQlVHKCk7DQo+ICsJfQ0KPiArfQ0KPiArRVhQT1JUX1NZTUJPTCh2bV9nZXRf
cGFnZV9wcm90KTsNCg0KV2Fzbid0IGl0IGRlbW9uc3RyYXRlZCBpbiBwcmV2aW91cyBkaXNjdXNz
aW9ucyB0aGF0IGEgc3dpdGNoL2Nhc2UgaXMgDQpzdWJvcHRpbWFsIGNvbXBhcmVkIHRvIGEgdGFi
bGUgY2VsbCByZWFkID8NCg0KSW4gb3JkZXIgdG8gZ2V0IHJpZCBvZiB0aGUgX1N4eHgvX1B4eHgg
bWFjcm9zLCBteSBwcmVmZXJlbmNlIHdvdWxkIGdvIHRvIA0KaGF2aW5nIGFyY2hpdGVjdHVyZXMg
cHJvdmlkZSB0aGVpciBvd24gcHJvdGVjdGlvbl9tYXBbXSB0YWJsZSwgYW5kIGtlZXAgDQp0aGUg
Z2VuZXJpYyB2bV9nZXRfcGFnZV9wcm90KCkgZm9yIHRoZSBhcmNoaXRlY3R1cmVzIHdvdWxkIGRv
bid0IG5lZWQgYSANCnNwZWNpZmljIHZlcnNpb24gb2YgaXQuDQoNClRoaXMgY29tbWVudCBhcHBs
aWVzIHRvIGFsbCBmb2xsb3dpbmcgcGF0Y2hlcyBhcyB3ZWxsLg==
