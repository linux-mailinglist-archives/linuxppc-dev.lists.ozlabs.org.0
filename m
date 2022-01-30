Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DF54A35B7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 11:30:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmnWv4WYhz3bbm
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 21:30:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::624;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::624])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmnWS47shz2xWd
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 21:29:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUmNKuxL6bmNxJlwV74TlrwJHe23a1oqxuQtEg4o0esTSOGz5xbFtE1ExMMW+w1dVMSPz5+O9Oh7P0IQApIh2r8kqYCYWACl1txmigUF5yBfhYxeMo8sIGfzLcDK7uBdaXFef1gYCWvUE6czg1vqcLSRO7ZrIUOMKIiwAAf2Fyc32aPbv/SRCyP5xwaUU59QkChOHY0vTkn4paH269r0sPUtPFHCZ2a9Cyzdv4QhnzndaykVvV2EAkBPFGkWtQCzy71GTs3R4CW/27iavujRWlgG0avsEHDOipu0WVFg1Y4KTvxmpuqTjj1Z5eLXv1dR8w33yHJdVIwmKkFuQ4Ad2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQiR5WniVdcPVVeZv8tiwL9SfMWm8FRiPyDqkKClio8=;
 b=h8EKxeJe4O9W0dyihKFhvThTUl+rpnzFvkCRPJs7PtEjoeo4SLIDFATEFSBNC5q5RyTZ1cchX4xZvbXmBTMIz5oYUWT68oTV4L1qAJAo9y0kF3hgFNdwsB2KfdvX0JgcEHfyrk2qtbkjGT464DozLpfJi5J/03EvI+MHayskXVSBtD5IwpOfEmGwApwWu9eNP2kAwFVG12IBEWqSNEtHMtila6iko4eu5DFpae0F4jG7cIRpaqJ3xNH4BGMfWnK5SbeCr4Qs7XQzbuW5ENl2RHTdJMEQleEhiDwjwm0rbZKAKDE3YPC/bmNL3fHNHfoVhAP3VcmfsQ4PpGjxgm9ioQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2886.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Sun, 30 Jan
 2022 10:29:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%6]) with mapi id 15.20.4930.020; Sun, 30 Jan 2022
 10:29:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/32s: Make pte_update() non atomic on 603 core
Thread-Topic: [PATCH] powerpc/32s: Make pte_update() non atomic on 603 core
Thread-Index: AQHYFcRGBttrVlXBwkaPm4X9nqdB0g==
Date: Sun, 30 Jan 2022 10:29:34 +0000
Message-ID: <cc89d3c11fc9c742d0df3454a657a3a00be24046.1643538554.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 978734e3-67f8-4610-bb79-08d9e3db68cc
x-ms-traffictypediagnostic: PR0P264MB2886:EE_
x-microsoft-antispam-prvs: <PR0P264MB288621B4CCC3B433596CE10EED249@PR0P264MB2886.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5OGSLt0aqFW4OoGt1pBlsMTIBsr9bsP55J0liMo7ImYjKV1mngMGxC3yvWBGMiBp994I3B+wlXPiFKW+cFEDVbHHMoFhOb+SS9N0ZIrpcCMj4RNyp8Zc5xrZdKUDSsrhOhlvalVrY+9fy0VbsEBmN89E9sGnF5IV3uVjFr4567qmDy4gO0IiPW3NZxsH3epw3suFBxHRZDsKeZsRaa8YSieJPUb6DHSyML+6OXtVw/V5/KwSWe1dPtaWJfRVVVpvGtoGRnARpeuFhXSVinYZyP7jKLr5UVcArmz8LKcxsZ0NZjNlWS96pviPxrtdm8UD3+BwZeOr5sdZzvA24KZsyXNuTehjPfcQEAZ8VJ1qhbKh2iVdX/fj7xH1p60ZIbGlcZFb74y9BOoK2yPkOf7ccOnHbbkvnRTBcA9MFQiPMXAdn5TeliEkYXBJG9zIFKKwRnW2ZTqPGhDte0ucChjuwz6GR9YVpkv59ao1Eg1AvXCW6sEeQ5Itd9qz8AJDwYfRpoLrYMlwBIrnNTwHv4rv7GSkeCohLT+R8durlcJ+J8JQQPJ4v/dhR0HNbdEAZsQ5FVcMLOULotqo3e/tYb31Szr+YYZF5wLiTvdVY3n7yrW9mXICv+lp7twOQpF7UNjvQ0aIOfLfk3JN8Qjwn52o6ZGtHHXf2aiBy4+9osTmhlKAPmsw0AL/l95BFwZjGCkHPGfbxQKmF/CAW7oSSAaJ1A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(122000001)(6506007)(6512007)(508600001)(86362001)(2616005)(8936002)(186003)(36756003)(54906003)(83380400001)(316002)(71200400001)(91956017)(110136005)(26005)(6486002)(44832011)(38070700005)(2906002)(5660300002)(66946007)(66556008)(66476007)(66446008)(64756008)(76116006)(4326008)(8676002)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?NAk4yLwoXtxgrat35h5RZ2IVQbIXBRU6KAyCeGFneMHCBEYMf7zQS9ygdJ?=
 =?iso-8859-1?Q?2b41XDrTU1jcxy/S5ZdZRxY45Bvnj6d/cc6MYGKbN4rCpqovOXLtHP0MEf?=
 =?iso-8859-1?Q?MtExj1MGZdBGTW8QCfFbBMYF64WRNr/6LXetW/p/7hpUB+Yr+kBygFLUsE?=
 =?iso-8859-1?Q?jQAnTw/+CZYC/15ryX4nSYK+Ojp1YEfuqKTmUoO5gUtxFS8AWKFOkDhjvf?=
 =?iso-8859-1?Q?BW+lIT/ik81bv6NhpqZ4B64QfHyA4Ep+hJ+K9kCNKPk1+2o2d9AKOva5w4?=
 =?iso-8859-1?Q?9R/g83fwUvhPdrkQVQAxAdvJeRXdV/4cGAd9dNZVfdtfGQcicEO8buWiml?=
 =?iso-8859-1?Q?j4t9YRc+Otl9LKekdkDqWr7h0ixRO+tgdj87e8xJITP6eV+NhGl8PZfOCa?=
 =?iso-8859-1?Q?wqjFS0RJuozP0oWLJQXePjhmLMksJ+Epj4wLG3U/Gml14TmlYffne5N3yi?=
 =?iso-8859-1?Q?0ks1MsZ7Aw2DV03i/Ry++bjJ3drefoAu8nMaYMD8WQNdFiW2o7G9rFTrAT?=
 =?iso-8859-1?Q?mPgrdqryscTF5yNIdEJqr065PM+2QmuFN9qmG30K2GCmvIqyn/SIOPsByr?=
 =?iso-8859-1?Q?mWig5qUSfV5yd1kuRsNzOHD1OCo2PfmBvFr/jqPfpRQINJtExTIkUJ39Yo?=
 =?iso-8859-1?Q?l1Y2u94JPbJ4q6k/yur1z14c6nJ/Bpsbt78mf415SuAYy1ndgDFJ+qLN1b?=
 =?iso-8859-1?Q?Mqj6FUga0kKtbEvFsYplXtTlJOq0o9txOPtCp0Z/NocZBEX83SdcQ7c2hS?=
 =?iso-8859-1?Q?vOfxrOKldjWlEEhk/DS1qYXrVvrKq7qqbtqpIm96kwiUj8WLZej9pHHOqD?=
 =?iso-8859-1?Q?FImljh9TyWIX1/OHXzrMpEO7sHo48Hd9xjclJ7zBhETpvIWa5w4QP7cTN6?=
 =?iso-8859-1?Q?EalvBbp49Oz36V37c2ukWoXe1/TIZaIOOVEgnxfQOrzvlHMDMyNVWnHS73?=
 =?iso-8859-1?Q?2f8DJBZTr9IGuhw9kl3RH5b/Pjx3d/NdRqonX2jcfBTpBVjFQ+N+eKHHdA?=
 =?iso-8859-1?Q?WZH50pCazFHZOGydSa/01a4WeMbdS7TB56sP5Pa4MHDY8rvQdcKcYejieH?=
 =?iso-8859-1?Q?IWXWadHutocuP1SnHOPvqxMOzK7ajzKblE9vr3KHz3aykUbn6PKavtZtpR?=
 =?iso-8859-1?Q?iwE5y7XkPZvARiCqiXhRdxJ2FwQ7lAi8wNm7ft3exZ0rR3F4TyHXxcF/tz?=
 =?iso-8859-1?Q?ggGwqMuwBvJD1wy/hnOISfsBAPtevpgQpiagd088qONofiZ/PAoKL50i2c?=
 =?iso-8859-1?Q?XbJ094Wgr7P9ag6EtQpeyhjowwRsXq4avgf6w09fkssZElztoSgNl8GNcv?=
 =?iso-8859-1?Q?n6xKszbuNKekCdgNQqxDmbNyyffQ+cixvMhn33BASKCd+I+PMCqSk6SNjV?=
 =?iso-8859-1?Q?kJyll35TTk0XdT/NJzYsXIR+AN9Ns+TtlNQrPqR+aIgW7DoAPBxO8QxATJ?=
 =?iso-8859-1?Q?XsQytK4m+lKTC0LC0SeFLAh3ALdyt7pqQ87VFy9Fmu4BLGP5GAbPDtjYcl?=
 =?iso-8859-1?Q?yXXIN8stcn5XW/+2OnCZVi6c7wlGz43WkK2kHwloOtKasuhHKm8H0HfEqJ?=
 =?iso-8859-1?Q?0KhT8WcGqvcRkaH76pGmeA2uKykIRpf8Y1MGdmqCNRTic7lO9IV/o4KTxq?=
 =?iso-8859-1?Q?CfdnAQJvliBvgw6lEUVGmgZM6LLUUYg/3swWcMjbzNQ49WWKoiUGI1BH/D?=
 =?iso-8859-1?Q?Oc1qz6FQFr2hpKngtBwpjyIMhms16n6uFPmIR4PW3Ve24NptOFtO8xGzQC?=
 =?iso-8859-1?Q?slvqHlYp/eIUSki3u14txWgCY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 978734e3-67f8-4610-bb79-08d9e3db68cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2022 10:29:34.4432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SxE5IiNeHwtiCbMdJ5on3q9MyEyHKz7ZYUi4UB1hCl7T2wRNKfI5jZ2tEbek6LuF14sILBj2f103eFL8OjXnS0ELcOMiLk1HFb9jWnY8iVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2886
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 603 core, TLB miss handler don't do any change to the
page tables so pte_update() doesn't need to be atomic.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h | 37 ++++++++++++--------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/in=
clude/asm/book3s/32/pgtable.h
index f8b94f78403f..772e00dc4ef1 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -298,28 +298,35 @@ static inline pte_basic_t pte_update(struct mm_struct=
 *mm, unsigned long addr, p
 				     unsigned long clr, unsigned long set, int huge)
 {
 	pte_basic_t old;
-	unsigned long tmp;
=20
-	__asm__ __volatile__(
+	if (mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
+		unsigned long tmp;
+
+		asm volatile(
 #ifndef CONFIG_PTE_64BIT
-"1:	lwarx	%0, 0, %3\n"
-"	andc	%1, %0, %4\n"
+	"1:	lwarx	%0, 0, %3\n"
+	"	andc	%1, %0, %4\n"
 #else
-"1:	lwarx	%L0, 0, %3\n"
-"	lwz	%0, -4(%3)\n"
-"	andc	%1, %L0, %4\n"
+	"1:	lwarx	%L0, 0, %3\n"
+	"	lwz	%0, -4(%3)\n"
+	"	andc	%1, %L0, %4\n"
 #endif
-"	or	%1, %1, %5\n"
-"	stwcx.	%1, 0, %3\n"
-"	bne-	1b"
-	: "=3D&r" (old), "=3D&r" (tmp), "=3Dm" (*p)
+	"	or	%1, %1, %5\n"
+	"	stwcx.	%1, 0, %3\n"
+	"	bne-	1b"
+		: "=3D&r" (old), "=3D&r" (tmp), "=3Dm" (*p)
 #ifndef CONFIG_PTE_64BIT
-	: "r" (p),
+		: "r" (p),
 #else
-	: "b" ((unsigned long)(p) + 4),
+		: "b" ((unsigned long)(p) + 4),
 #endif
-	  "r" (clr), "r" (set), "m" (*p)
-	: "cc" );
+		  "r" (clr), "r" (set), "m" (*p)
+		: "cc" );
+	} else {
+		old =3D pte_val(*p);
+
+		*p =3D __pte((old & ~(pte_basic_t)clr) | set);
+	}
=20
 	return old;
 }
--=20
2.33.1
