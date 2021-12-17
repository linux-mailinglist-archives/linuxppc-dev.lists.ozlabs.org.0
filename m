Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E93504788D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 11:29:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFlb55pXTz3dhL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 21:29:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::626;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::626])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFlY31xdFz2ynj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 21:27:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTvuZBdgF1bmvi7jyoOaXHXUj1h38PwbrFiPhPJw31kKP67692HnhmrmrbvRRDIRDYRkKZWShvraX4D+VJU0VaDJIltj9PAyxNInz/dISOjCMOis0XPts/rmy0/aNNSliDLgeCcN0Pwxwazt19GQuENv39vUiqouohJxGoSyqc3vS/TqJK6Lmclg8G9PMRFat/5F5XhQAz1Jy1KVCHDSYHQc/jcknF1mqTdPqYh1Sq58wT7izPeW9p9kIaTd97xPv5THV4Eb2FTlZP3kXnWCc8qkwaYpzx98zZ39gqR1qDYHkClSX+0xWjBBhz/3VlI8upJp9qntFG9AiZhw+bYouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTERt43G9m2uJJNAlF7KkdC0KdJNsGFgPorLCL37J3Y=;
 b=jOmnCa3g1FdInejB2w8xUAB/yzrhZm4hBX6Q9sIJuDLdGySG5O6kfteYdPK+tfCHyWJ4/BtJVyFPLG/3UoJ4zxXGvQNEXAfY7ivQVLYN7K6Mr0G4AzcYp0PeVYkMSQY5/gwTiMnLJ7Z4KdMJ/Og0ejlTCFIjR42iONl+pbGJLLAtUZoZMJl74p69CtH3WQLzbTg1vpNxAY3zSw8tSJ6NjUiIuI4rXj5oUPzmk5uk5P8l8Y6ETkzR7QHenMkaUy5Bimyk+m3v2HvOvkN+sTNPw68rLHVP3cRs6D7HXe3GlSLOJ9Xz95fvhXH3QgLSKRwhCqNoINrT6WlPZ9OGA7ySsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1650.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 10:27:23 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 10:27:23 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v6 03/14] mm: Add len and flags parameters to
 arch_get_mmap_end()
Thread-Topic: [PATCH v6 03/14] mm: Add len and flags parameters to
 arch_get_mmap_end()
Thread-Index: AQHX8zCug9Al1NjshECzrepieAu4HQ==
Date: Fri, 17 Dec 2021 10:27:23 +0000
Message-ID: <f1014efff7d26279d8c687d759af9f709cd50453.1639736449.git.christophe.leroy@csgroup.eu>
References: <cover.1639736449.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639736449.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43e8fe8b-ef64-4b6d-90d0-08d9c147d08b
x-ms-traffictypediagnostic: MR1P264MB1650:EE_
x-microsoft-antispam-prvs: <MR1P264MB1650916C57DBA795A7B6A6B5ED789@MR1P264MB1650.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hHhF8a5ylLo81uJu1SGkUHg02TtBfQLZWcl8OiIZIcFgoXmR1PsX6Dqh36zwuC31OwPMoQYA0GKWyuXQvuVwt5zQlnkkc3nbz6BMScZ9aloIUnrXcxeBZYtyXbNM/J1bdGC2WPgT6VIPhm8JDaghMxqveV9ZragvxK0DBwVyo3z8S/pJNf3YUWW5c82NiHjge/dQQVZhD6SzHZ48CG5Qs9I7OpZYwYlNz7i9DhZ4DERj6E1HSCuFM6pQkmb+hi/XFlATLAhXVyIY+PC4QTSYRf+p09zwYuN6qB0D2TGloF3jQAv62bXIiZYCWC7QkLnFWxd6AYGGA42oPg/Lmhp3YySxaiPpukR6Jm3jS+lEliXCMBNVMJje3lg/8aa5lTvR3X3hrrC8ENdyvjOj/XSWKRWUfglP+6MGBSQpukeUdqs5SG+XVmU4rO2pbVzsUzzbG/oTvAgqnsCaqbGj2R3+apIYFZxneVMV621auIIxwOzYCO270VYL1HaRLESjwFbuZiEwnK8+v2ITcPGnmCMT7FkJ9XJ9SzQROlieu6L7Yafm11KYGu8xDIEd443PPcM1NZsfBh05boDq8lzG/SqTGAW0ad0MJBXHU2VPQbaGemqHWeWekoNoLIsLKKTnijJzfXakKXviDB4oxxcIDf6TjVEfG/guM/opFNhRC8FBI69lTDK5127+dY1lXDHVSGwCrj834zjKZkiFuPpAzJAJ9A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(2906002)(6486002)(6512007)(8676002)(83380400001)(122000001)(36756003)(6506007)(186003)(86362001)(26005)(38070700005)(44832011)(76116006)(66476007)(64756008)(66556008)(5660300002)(38100700002)(66446008)(2616005)(91956017)(66946007)(4326008)(508600001)(316002)(71200400001)(54906003)(7416002)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?8fcN8mk6axdmZDdOKiDuZODgR/g98aghYInV369OUCW/FvQz/obvVmZdfV?=
 =?iso-8859-1?Q?VBf41DY9c+TsaFHH71d5uNF2lHSr2Tq71VDsPdPazCzNLxazqC0EJe/KM1?=
 =?iso-8859-1?Q?jNtGtUjEqlLSC7xMeJXrvJILlAX1PWgV3OG+2L2IqZD8GDc1poGR7SvJ22?=
 =?iso-8859-1?Q?3VliBvZ24s0DoNaGNmV9zv5HITQQBWJ6afV+yJ6iEEH/4YLdmCMGhZ5Zw7?=
 =?iso-8859-1?Q?u30i1fJSUK/5VGuBSTPzr9hJ17dq3FR/f+I5LTpA800evhd00iwR+3E48g?=
 =?iso-8859-1?Q?6b+cS06/d1u+fJdfIi8zfFHWN0hD+J4mVH6qjcM2Xu9doKIZTMAjGOvGyZ?=
 =?iso-8859-1?Q?QmJDALeWtJxpH2se+0XlGok/GpsW65bSt0mZFxLkAFcS4bOoxkezBtJvzo?=
 =?iso-8859-1?Q?JO7JF2om0cIBEfps8k3QdqaaGUFGlFTAvvVJhxV/DX70pUYuky+Mt14X0H?=
 =?iso-8859-1?Q?/Tumy/rM7SwqerruSJwOlNBcNW078vUAkmWDjLdKVVLTMWfJtsIMOAmAC/?=
 =?iso-8859-1?Q?uquGP2xfhCtex6btQ6/pbT4e8E7DbwvwE51S/4tIyL/RFPqbzg5QjW2yJy?=
 =?iso-8859-1?Q?Uo8CD1kvEbSVT+c+CeUmye/tr/L3TRnDAogTiFIKYLrPgj1HBZ4RJ7mJPD?=
 =?iso-8859-1?Q?6JDmXZljFkg5IFncP4XOg2Jvt41xZ1CE2JaIoSRHX1uDHEPs9Eglqnuw7d?=
 =?iso-8859-1?Q?wi33u0V9rMEF0ZYh+na3WbxAXUH6UqC9b5N+/R701zGliT366Xr+hgLmYT?=
 =?iso-8859-1?Q?1SVSeJOWs585G2XYqEaFk0QTp48wSZz86j1GkytJBdVOW7E6ZnZMaVPh4S?=
 =?iso-8859-1?Q?sY621WW7ay6EUHHHv44DwrOvMfa0S3UzC4DnKrcddEI0iQN9dqJpbaJtxX?=
 =?iso-8859-1?Q?Q/Pyi1S6DvtZI4KT6cNLrquDbdTwAJSEyVLqiuGXUAZWHIJ6VLAZRirmoS?=
 =?iso-8859-1?Q?jHtZ4HdJRuqX98mXWnBvheNqdvDALnMQVPas/NLgJF1tXpS05gYt4MBSAF?=
 =?iso-8859-1?Q?+0pjxMqgBHWhIpwbTzmzI4TMbBFnaMnQeX6VWLH7A6LKpyhsmqm/7jbVBI?=
 =?iso-8859-1?Q?r2xbZYDggMPelBo1g80CgU8GQCuC6xqfZn6lLmKAzasnlxgdzevpFXH14w?=
 =?iso-8859-1?Q?KVRQGM346LxQczASi1QtqTs6I6yGcOenncPi7d890v4mDPSQ5qTl2EvAJM?=
 =?iso-8859-1?Q?t+zXb9ynLyxy+z9DYzTTyJT+1c+hWWcVrid85ACLzbK70N7Ba/qjxBH1zI?=
 =?iso-8859-1?Q?RwipW97UQPvWWlpyGe4b65DsYhdQRwpCat2jYFuCg94VMr2OfqtSkUBWga?=
 =?iso-8859-1?Q?aOUJj/aAbXLJtSiv/TX6SsB9mcf/wdt6P0Lxguab/Fohx+KgUZKUt+3JRd?=
 =?iso-8859-1?Q?irfXJSum7YOTvW/3je9cAVwvtUCZnxjNX7Y/8Qex3wlGay68DToBs37Kdr?=
 =?iso-8859-1?Q?M481MKBZJRIvRNyQEM3TmM/hIFhh+o0rk6Zbw7Ez54O76s3IKSctVhncWM?=
 =?iso-8859-1?Q?AdLqecbORVWgTwao01dqbMaML2MDPcrabeeYi2UYgBrwfMM21PgZ0vX9jE?=
 =?iso-8859-1?Q?anoAm3Tyv0Y2L8XGwXdIjUZAM2HurTkdd/dlDBtSfx0iPhPl+At/pp7rU/?=
 =?iso-8859-1?Q?PxTmzXZQWXRSCJM57ZTBkaDpBu+SiOkf9fE3liLO4/L2PhbUFldG6ZugOy?=
 =?iso-8859-1?Q?/ESD7R248qiuCtVj+gKS7hbPlFr+WYtqWJvkO6BMDuA8kMn7Z/4bJ3Bppw?=
 =?iso-8859-1?Q?8K3MwRjGMfduPGATRUCPeR7L4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e8fe8b-ef64-4b6d-90d0-08d9c147d08b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 10:27:23.4657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yP6HFKBal8VhpPEnUhj/awG9cBDIE2fU9tecV4VJCDcA0Z5Dh7JQO0cixc9tR4s3w9S4We61XQ3D0RqM/TTclyPTQ319XYOlfz/HWO+dTl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1650
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
Cc: "will@kernel.org" <will@kernel.org>, Steve Capper <steve.capper@arm.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Powerpc needs flags and len to make decision on arch_get_mmap_end().

So add them as parameters to arch_get_mmap_end().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Steve Capper <steve.capper@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/processor.h | 4 ++--
 mm/mmap.c                          | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/pr=
ocessor.h
index 6f41b65f9962..88c696350ace 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -91,8 +91,8 @@
 #endif /* CONFIG_COMPAT */
=20
 #ifndef CONFIG_ARM64_FORCE_52BIT
-#define arch_get_mmap_end(addr) ((addr > DEFAULT_MAP_WINDOW) ? TASK_SIZE :=
\
-				DEFAULT_MAP_WINDOW)
+#define arch_get_mmap_end(addr, len, flags) ((addr > DEFAULT_MAP_WINDOW) ?=
 TASK_SIZE :\
+									   DEFAULT_MAP_WINDOW)
=20
 #define arch_get_mmap_base(addr, base) ((addr > DEFAULT_MAP_WINDOW) ? \
 					base + TASK_SIZE - DEFAULT_MAP_WINDOW :\
diff --git a/mm/mmap.c b/mm/mmap.c
index 7ac6a07ff382..ad48f7af7511 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2113,7 +2113,7 @@ unsigned long vm_unmapped_area(struct vm_unmapped_are=
a_info *info)
 }
=20
 #ifndef arch_get_mmap_end
-#define arch_get_mmap_end(addr)	(TASK_SIZE)
+#define arch_get_mmap_end(addr, len, flags)	(TASK_SIZE)
 #endif
=20
 #ifndef arch_get_mmap_base
@@ -2139,7 +2139,7 @@ generic_get_unmapped_area(struct file *filp, unsigned=
 long addr,
 	struct mm_struct *mm =3D current->mm;
 	struct vm_area_struct *vma, *prev;
 	struct vm_unmapped_area_info info;
-	const unsigned long mmap_end =3D arch_get_mmap_end(addr);
+	const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, flags);
=20
 	if (len > mmap_end - mmap_min_addr)
 		return -ENOMEM;
@@ -2187,7 +2187,7 @@ generic_get_unmapped_area_topdown(struct file *filp, =
unsigned long addr,
 	struct vm_area_struct *vma, *prev;
 	struct mm_struct *mm =3D current->mm;
 	struct vm_unmapped_area_info info;
-	const unsigned long mmap_end =3D arch_get_mmap_end(addr);
+	const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, flags);
=20
 	/* requested length too big for entire address space */
 	if (len > mmap_end - mmap_min_addr)
--=20
2.33.1
