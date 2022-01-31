Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E59CB4A3E8A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 09:17:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnLXL66BFz305K
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 19:17:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62e;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnLWs2DdXz2xt0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 19:17:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZM3Jh05/2VqzB40drhgRdzdeHZ705RRTq5bmLemJLgD6BKLtzYFlGDyPRq9pAw/ht3vTsyOMYWWTkEWk9fjLTLErE++faXN87i0mSOWcGyOm7IFuFTQ6SPWDYSfcNKDOcme4L6P/Rlrcs7BGjMS4vkqrWG4YtbBpnYUCs10c+BGyU0YKubefxU8IfzqeULC7A+GDl/Tu5ipVVU/vvvhnr0r8dw4obbE8oQwN/R/qdH11XBocK6RjqmNjqJxzcZ2dN6gY/O6zfaNWtd/SLyMOv64vTfzMmTtNn6ZUi+IxS/Fypv5QVRxEd6FcMdECu4+MSdK/fZV8HXKiMsrFIe/UvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWQqgnxvqI3lL7g5C8plmPGDH7WaxydCkFOX8gKIU5o=;
 b=kPsgXnY6LYioT1PpgOz7PNZ/uVPcvJeRAuE+Y9lo3t9EBsJj8rmY3bCpgWou9q/T862xUQfOI4IcA5EFJWtOweKRxbA6uZDx3hHacGkgORblLBDCyAiI3q1pS7ZSKhhs37lwVaZtB2kghQQmyJ7ipQlXS3Rh5HT1sHcmvWZhk1pLO3f1n0CtFI9Swm9oQxGeVUZpPxZ15b4rUzVg1xeReWrLDpjz94/Kc69tryU2cffRsTTGXEYqRIEDH0f6sPE821qFlradh2kNT4G9KiQuna2J4QbAEnHneOVcRNxJD3KdB0dBzlzs0tFIFp83mLg6SNWEiIko6h+C4Cd5C7nApA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3842.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:24::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Mon, 31 Jan
 2022 08:16:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%6]) with mapi id 15.20.4930.020; Mon, 31 Jan 2022
 08:16:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/nohash: Remove pte_same()
Thread-Topic: [PATCH] powerpc/nohash: Remove pte_same()
Thread-Index: AQHYFnrkkg2ktYQR+kCVvQTrvN3q6w==
Date: Mon, 31 Jan 2022 08:16:48 +0000
Message-ID: <83c97bd58a3596ef1b0ff28b1e41fd492d005520.1643616989.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c2a4cc3-e9e3-4e13-305b-08d9e492072e
x-ms-traffictypediagnostic: MR1P264MB3842:EE_
x-microsoft-antispam-prvs: <MR1P264MB38426233D99831739A2532D1ED259@MR1P264MB3842.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m0xjmebowYlF7eS/OkpyZwdnPIQwik0o9U0g2ujhK3cuKPw9nCLAlMA4IYfGbmrZocLOZAAsZV4mzewvT7Nf04KhDrAz5fYqKe/2Evq3YUhYqEjYrrX03/6zbn05zRL23DZ32cTNM/cJneHWSqAbJAMQCYVLVq9ayj0k/0Vp0FDS/gS6dX9VXcqV13RJPZqho9VmxcCWS+WFXSys8QgGqo+hJyrE4cOuy3wFe27r5RRWbP6vXvHPuxj+riGbbFhjoOHqxWDmyaVwusdo8l06hv+GL8/zhdVE+lmEfwSZKFf8bb18opn9y56Rc7OT3/rVl5uR5A4BZYKtm7cNsXqGTr2YzQ48lwxr5DTTX3/YvhYxKboxfxF0hOyNcUf08ppD+E0fQhsaceBydH5X6FIRqocRLOOWDAWzd2THWCJnZmV5rmprPsw/7veL7tRzWZQ+CrC8oNxcQ4RpQrkaWAMIb9OSIlVpabpeE86tw1ckLbK5xPziEAyn+JgYWO06y/TjXWDCGPgJdCjMrMKUlvghaxgCNEQ6Eui0mrC+WF6L97gCkAFVcVMjhW4H0jNdAtYVkC2Jo35SZu91bMCyFCIT088BsQTrYlWE/autcfzr8lttJGw3Sf4AhoHOR5x7lMXwrbJOdz0yygcaljptK0AUdrq/RiqCGwI0Y9sYJTC87RAs6HC027pCg/rnfAlOR2LQ+5CQ4cebA1StomxgYpvZ5Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(110136005)(44832011)(6512007)(54906003)(316002)(5660300002)(508600001)(186003)(86362001)(26005)(2616005)(2906002)(83380400001)(6486002)(4326008)(36756003)(38070700005)(64756008)(66556008)(66476007)(66446008)(76116006)(8936002)(8676002)(66946007)(71200400001)(91956017)(6506007)(122000001)(38100700002)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?6V73n1sq5BNCirj9LEDxKHvPT7wLCC7VQxGwCs1atXo9ajyhtahgnnuK61?=
 =?iso-8859-1?Q?L/lPezMe76IRCYk8pA/lpJRAfnGKPbjOznZQhciktBEq9aIt2nrqGhnyYp?=
 =?iso-8859-1?Q?otfeSKV1NkDNPiNDmZFpeIStefLxAy0jcMhbiyk8pZDS1sQozOb0CivdDC?=
 =?iso-8859-1?Q?kT25llW6KP5U+GI2dY8fJgYwEuqpoUlIJ8c+HFU77sCD7EhqDbMIhTIg/F?=
 =?iso-8859-1?Q?aQ/DnFWeHhBlI5uMYNGv+uiCG/B2b+VOpahOSiSuqJu1L0uds/5MOsyinY?=
 =?iso-8859-1?Q?S9LArVXqPF+KyteP1ab8iZcB4pzh6Qw70i60JKpbfqBe33ldlQ4S+d9QO+?=
 =?iso-8859-1?Q?6eCu2NsLtbFOmDJEdPmeXhSRH20k9k14Dwkog+dwAHYtpqlg1jvHAgLnkx?=
 =?iso-8859-1?Q?7It+6KoPf+0GY6itWFzr0UVFNgEXWoSwXP3QIHM/wu/FlJBM4ty+N7Y2W8?=
 =?iso-8859-1?Q?UhN2jMg+ecWKUR3b7KQOs0kapzloWUWAwY4L4j6BDAee39LNXyzwU/+Dxb?=
 =?iso-8859-1?Q?3xSmiXJt11iWLou5qdDiZz00OrGA0f1DfL/aNAt/K4TdqE2FTugow3ZVb5?=
 =?iso-8859-1?Q?bNL4DC7kuil+xRBYre5kdbRpqZsgE3Jc59AeFEBzCLEQLRwLIrTjodBEwn?=
 =?iso-8859-1?Q?3GEthqyfkrKS2yoXuAFDSg2pJRubYNWIq/7dw1Tpg0/DbYKcRaRnoHKLeV?=
 =?iso-8859-1?Q?Cu27MBN4CiO0FY2wz3B4cQN5aWKd+f1bpBeG3AvBtuS4zos+V3N3TJl4+d?=
 =?iso-8859-1?Q?w0PbUCawotcQGui0EqRJSK2K9Zfg4E8ofXryIUhPnd1Y/OG2x9SCKS1/5o?=
 =?iso-8859-1?Q?nTD7gZ5tSe/wy1kz6xVqZSEH7GqhQLg8sNyETOBPUt7lvAJM4vdmn85s4Z?=
 =?iso-8859-1?Q?YJo7MdNjPH1JEJ7tMjCBzsGPFmOTCO3Jl4Jw2R9zj72dBrF2gXO66LL+x+?=
 =?iso-8859-1?Q?5QvubPpxk7/QF0x93wt2+CgU8ie587+5BMLW/nxwOST/xtOYFijem7jmi5?=
 =?iso-8859-1?Q?lfBpQPCTIHUn4aIkSKDui0QeY40w3Q/4QH0J/yL5KyWi1pkel8Mkkut68Q?=
 =?iso-8859-1?Q?c5xnmvy+InY5HLSy/bzO5K6PuinJpgraeu1jfQnaLra31mWJrFpTQQFyES?=
 =?iso-8859-1?Q?NnYJOr4IzhTO6mdxGPtxXgLL7n6VPzq6pShoh9e2BhhxSqkbYPryXfa8IQ?=
 =?iso-8859-1?Q?rB9MpZicbnap728splR1eefxKxYHRydSISGkTpbeUgsQk74nFlfM6wEhhP?=
 =?iso-8859-1?Q?a5oY1Pr8S6tcGVKJEF6+VXjBrWoYH22OCrkFwIuA5Ojc/IVUOx8irhjYJE?=
 =?iso-8859-1?Q?6n/3bGNzBZtzWtSJydhp2Bhit/1DrtXuk16yYmTYAnyJdlI8m52nCNzac0?=
 =?iso-8859-1?Q?Dw85zI2B4tnUIt6M0VxMg1cdXT+/YijUeuNSKyO3jbgPHan+e487OGNdJ3?=
 =?iso-8859-1?Q?qx7ODylxUt9oLlxJyUSPAlpEKFYBEjn0Jd8pvpoVkbH9tXeVujjFPQwQro?=
 =?iso-8859-1?Q?lTUBlVAEIVxHaImDXnYzHmW2oVmv6161PR3QEcbtbWF9MMHsh74V9W6TL1?=
 =?iso-8859-1?Q?i0ZQ06dvm9VeVYHVkOvvL/YFRrzIGXa05QVunJ4ulGSny3nOLcCYYDYlfW?=
 =?iso-8859-1?Q?ExwWXo/yto8ZCyc21bwSTtRjFzuGkyG9nUC5W530jwnKS3/KdvtbLwE//r?=
 =?iso-8859-1?Q?aq8rTf/S0VGMofHkc9boMAFtuOzDh6qWPA9vP7eDURmSMC/Nq9ytb14O7R?=
 =?iso-8859-1?Q?OgD89jP+TuRNsEQ/LrDVPseHI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2a4cc3-e9e3-4e13-305b-08d9e492072e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 08:16:48.5836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gQOWEuB6oH13R10vZS5zM1wKdoyEsFMGpSLdUCP4Gg03Xmct53jyg/rv5pAqou/vYH+zBq099JRANDjqvGH9vtIZG8LZb4gh7QLIeTbofig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3842
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

arch/powerpc/include/asm/nohash/{32/64}/pgtable.h has

	#define __HAVE_ARCH_PTE_SAME
	#define pte_same(A,B)      ((pte_val(A) ^ pte_val(B)) =3D=3D 0)

include/linux/pgtable.h has

	#ifndef __HAVE_ARCH_PTE_SAME
	static inline int pte_same(pte_t pte_a, pte_t pte_b)
	{
		return pte_val(pte_a) =3D=3D pte_val(pte_b);
	}
	#endif

Remove the powerpc version which is similar to the generic one.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/pgtable.h | 3 ---
 arch/powerpc/include/asm/nohash/64/pgtable.h | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/in=
clude/asm/nohash/32/pgtable.h
index d959c2a73fbf..a0525765c7bb 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -338,9 +338,6 @@ static inline int pte_young(pte_t pte)
 	return pte_val(pte) & _PAGE_ACCESSED;
 }
=20
-#define __HAVE_ARCH_PTE_SAME
-#define pte_same(A,B)	((pte_val(A) ^ pte_val(B)) =3D=3D 0)
-
 /*
  * Note that on Book E processors, the pmd contains the kernel virtual
  * (lowmem) address of the pte page.  The physical address is less useful
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/in=
clude/asm/nohash/64/pgtable.h
index 2816d158280a..a441056b3eba 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -281,9 +281,6 @@ static inline void __ptep_set_access_flags(struct vm_ar=
ea_struct *vma,
 	flush_tlb_page(vma, address);
 }
=20
-#define __HAVE_ARCH_PTE_SAME
-#define pte_same(A,B)	((pte_val(A) ^ pte_val(B)) =3D=3D 0)
-
 #define pte_ERROR(e) \
 	pr_err("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, pte_val(e))
 #define pmd_ERROR(e) \
--=20
2.33.1
