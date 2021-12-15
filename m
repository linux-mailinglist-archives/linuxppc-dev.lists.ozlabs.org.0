Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA8547531B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 07:47:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDQlQ5bP2z3cmN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 17:46:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::622;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::622])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDQjt5sDbz303F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 17:45:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6XPFFXkn4esYJms9++Ae3K35reubOxu5damKv86UG7G0+hmqns2UBPWkjjDik73I7WH9cIrbcrDd+3LMPMxb0WZLxRlvxqJ1CiY5jl6sbYaUMhfIsFq7pC2HByiJ4vFztykDkBrlPImtmEzrPxYcsOM3RdWU5hwkLE90B0qID1qV4LfeCzvyz1PSu5ozWAmNEfLfns84fvzvLCaHX+P/13V1KRecmJxUXLD6mzX5QNgEmGUkeZiVFT8DSsPXkLOswPO+wZKbLrcxkXqrwGJ+MikSxPQmU0bocayOb+ygPs86vLU/sbFpvH5aWpbchK0n80u8XRsmzjgx6TpKJuNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tfg0sMAM8fxxdC6eQ8XeK/4lMWH8vFXyGKrZdrW9Uug=;
 b=Y+4mfNngXHyo4WSOk8m9ZxUx8RX/+HfYW8mW1mtcOt3js28zfuyKZdQ6uDX4l0lrms51uAFVoopHtb+UDe14lv+DID5qxPG4AiymM2AC/k0VJRYbPpqv2UTV6gEaLiihJJuuVwC1A0B9EculCDsxM2wmCgmpa3DapwoIy2swz66NztEhm256L4g8f1pkR9mQIRNXQS9CuqbUfSEZkXVOec4O6iujFHSwA6Ak2aSsh6+sh6Ia2h0FdVwSydEDqFdsx8YIAnVcIXOuNpT1E+OSHwdL0xzbd+AQ08M3a0tst5eikKI3KQ2h/4zYocPCcCQ/GvRnID6KThDpbwr9jY7ZYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2147.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:11::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Wed, 15 Dec
 2021 06:45:12 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 06:45:12 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v5 03/11] mm: Add len and flags parameters to
 arch_get_mmap_end()
Thread-Topic: [PATCH v5 03/11] mm: Add len and flags parameters to
 arch_get_mmap_end()
Thread-Index: AQHX8X9OeEFvyNlKhUOga6+NHQS3mg==
Date: Wed, 15 Dec 2021 06:45:11 +0000
Message-ID: <38f7d0c0e67c8bed3b2f4326339a8ee18fb7daca.1639550392.git.christophe.leroy@csgroup.eu>
References: <cover.1639550392.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639550392.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98336235-f06f-41fa-6ffa-08d9bf96718c
x-ms-traffictypediagnostic: MR1P264MB2147:EE_
x-microsoft-antispam-prvs: <MR1P264MB21470DC5FE0D96C2095A1498ED769@MR1P264MB2147.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jbDjX/8XxNQscKX66rOK7W9/b+8JTjQUP8fJdKK2bgRUu7aj3Gu2WM1O2Z2Nj3EyCCSIw4z2vArFdjYf/ajeAnxEg0IGSRNSraPoxXZxNDC8tnuuwBvrpC4u7wYTrv6K5XuP8relaOQY0Cj7yv3xoSB3iO887Ik8u+adFjj70UDD/MfF7IB3xP7oLBmWZ/lg8jntQYU8/Zrz8tH7AqcPKVs4E7GxVP0BbUDMs4aRN6HoENl1BwHvnwVWvOGV2Y2L9x0hPi2meoU4Obl/4L+cSue13Lf3b1PkzVC0LxQJhOs9kNl2g6x3VzNxYdF1vI/ggiq8lUZwVWavSLL/H3l/o//X2JcQBOSU3O1TuPVWMCVOcIzHCOpP8R7quF+sHC/Fz13sXeTzpe7cPju/4WHzQJb9Ym1HNgJECllbUWB6z7At0p4n1L/8DDtGWbLFWTTshQcb2Xo7dgo56ZfN81YEH/RA8/pA9tifJkjTvTPdZWRx4uREBRQQslR3dwEcZjoIqTG0S5pguqIvSYsTW7ldJQjUFsUOqAtappi70wrdbpo+zDW3Sd7ZPTNL48k10QrMcTp9RRHIYGeLdy4GSJv2vTL4WVeoWSBdTXXXKnME9j5XVkgQkdmEQtrBK4wej0Ijau0+qi/Ct8sTzOMb22CUVjCCKH9DXqP5SwHAhcaPlLCJbxCjJP9JM/G9bm/fbmkgojTNKYbJDAvupdn0o26vZg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(36756003)(6486002)(2906002)(86362001)(5660300002)(508600001)(26005)(186003)(38100700002)(8936002)(44832011)(54906003)(316002)(66556008)(66446008)(66476007)(64756008)(6506007)(76116006)(91956017)(8676002)(66946007)(4326008)(2616005)(122000001)(83380400001)(6512007)(71200400001)(38070700005)(7416002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?GNTY9sBA5lGs4puKtE6ddAPQXN5pTys1pNbuxysICUQ6pxx6zb6QeI8KqC?=
 =?iso-8859-1?Q?G7Y6IVGflsR0MABOq/2JBSbiV/GfA+8xXP5CGarzROZKAz1cvEXYtUuZZi?=
 =?iso-8859-1?Q?OAzM21Etd4rmphnMsziyErl+TDI2qfThN8N8TJ7bWL+ctBSCE/4wIzz06m?=
 =?iso-8859-1?Q?LHAc7Lvko1RLQZDO5DsFb9fw/saICEvjqH7Rf857Mr1YbLt+h+yhQID5ch?=
 =?iso-8859-1?Q?s3sxUsgjqwVeIrUt0YjsK/tlIdZUsoenUJuUAhbH47vmb9FIU/o3PqpYlq?=
 =?iso-8859-1?Q?ggaycYFK+RdJ+tclHXj/L8MUQxsL7F/AXNrvrJd11/No3WZYPbcyZH4m7o?=
 =?iso-8859-1?Q?GFhTedkEYmPL9OtOOmUOnyW26mKE+GI+WYD981ciECzxmhHcMxRnyoJhmf?=
 =?iso-8859-1?Q?KgEwyCki6BNINE5GWrFEfBBomX8ZL5JyU3lksAqda9keCkkscIO2jgxnNG?=
 =?iso-8859-1?Q?1Im95z3lw85BFqA0zyw9kdsAF/5wgTHeAuL6Of0Es4q+YQJB3BHInYZi4I?=
 =?iso-8859-1?Q?ByjPiQsIT0zkv8+Un112aLg8k0MiBObeNrpo24QycYH/Vu44o7ECffa1R4?=
 =?iso-8859-1?Q?rgGihhaPNs8jw6Ov6UR/3YnXKunf/6q6VjlEs04NvfO8zkTDQK9yKZPvef?=
 =?iso-8859-1?Q?lQ1pCRMKnuu/3vuYdKl2hIRkAlAi3goOTjNNK4f+FBndLiTKxGKj/QxDnD?=
 =?iso-8859-1?Q?IlUDz/KJLXkG/H5zlJqx7G9c4uccVo2TxMLyhlZQeyCcf+ppItKDKaUnHP?=
 =?iso-8859-1?Q?Ek8eTVKsPBnyThlpLvuNWVG2uaIC9uHx0K9MMmJRNGKXTORazqo1p0qCiq?=
 =?iso-8859-1?Q?o3vTlJq4ME1zTY67p9j43p9+FQSb3mBO5QS+j6htrH6+Z+FooBL1CwlTR/?=
 =?iso-8859-1?Q?EXqJUWPUoUNLZ9pNOS2Et50JFw/Nsm7WQE1a8eLnuv+2/tPjMQqgZUvuiz?=
 =?iso-8859-1?Q?4cZHLkX8E1KfFXknWTEMnl2yWKfQlgLtRsflRiXaKS49gqk8zUblCXeQB7?=
 =?iso-8859-1?Q?PF2XwbfQGrLY68YFKTlB/EvmZoVbKsgELMIKda74KNhiU5/3Stc29K2im1?=
 =?iso-8859-1?Q?1oDMXr81cYid9L5pjlA+6SW0thXOwDO1R7Wro0+77mNdX7PbNl4ibEZhoj?=
 =?iso-8859-1?Q?207I6vpCO/FRL5k0tBjm6SgZpcc6emFP0W/mhU4bsdU2pO80xlU76eVpzl?=
 =?iso-8859-1?Q?NxufAvCOAzyA3yPAtR/2XfVGQUH9bXaVTeRJZYk31pqAATC5a3YA62EGAS?=
 =?iso-8859-1?Q?IXLVNN6g6ZI4sYkX7H+9NFVtDNJBH4D+PLklLTgL9eLLerXz9N2yi9HNV4?=
 =?iso-8859-1?Q?W4FxBobTAHWgkOM0a+hvUpFKp/pbuMq3rU417mvPevNvyB4ZK79OL7U4gF?=
 =?iso-8859-1?Q?GrClFjXShJwHPSfMAlaXx1NCpMg3waoE26cLyBd1YYCVV/U9T74MgCZtJf?=
 =?iso-8859-1?Q?gV2Z4gDsvl6KtHyW3AU8bH7O+sLJts+VWzMc2yv5+T3/YFcIKBAojEr1ly?=
 =?iso-8859-1?Q?jpoDfaxZ2fMHrXjHibQ931IF1tLJ8774qq4arDPf6ZyBgTHwuUn+k9V0ZY?=
 =?iso-8859-1?Q?sakYs2wNo6wtvHPVHnI0nZ46BW36iclFHIOyaLpVCZYK4WlQXqoSTE37nb?=
 =?iso-8859-1?Q?ANy16QrOcH+trx9G82puGdAFN+lMgLlOtox3uIBD6mu74ZsoOzvQC8f2Q0?=
 =?iso-8859-1?Q?DIs984b6GWrcgUaDFVb2M6VtaFh3+th3qkDzak2L0FkCPr1EsvM/IVqHmy?=
 =?iso-8859-1?Q?5FF9vh09vT1yDZ5qzVQ1hFjIM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 98336235-f06f-41fa-6ffa-08d9bf96718c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 06:45:11.7846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cy3fnxGmn7nkI312x1S6rHS+dFqzIX8V+PpHPkV4u2cLe5K1NvpIasM4L9cSbg+ao8aa7gzCPZEbgrd0v0NcP406VF/mMVrJOPQ3WgDCDzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2147
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
Cc: "will@kernel.org" <will@kernel.org>,
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
