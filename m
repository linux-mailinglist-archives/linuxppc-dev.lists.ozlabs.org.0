Return-Path: <linuxppc-dev+bounces-17841-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNSAABj+qmkIZQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17841-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 17:17:28 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D53224AF8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 17:17:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSBPg5Ltcz3cGg;
	Sat, 07 Mar 2026 03:17:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772813831;
	cv=none; b=luk1iNTV3Beyh5bKVC27858RZmqNBTyAnwGfb1u/IyAENHprxXX+Cs0HQvgGNpbXJk7ur3KraA+UWzV/E4C1/N1Ciuk0CzQNSKUktjSG3JqoxFi7rzljYksLXJpvy3mAaT6ffcDK5Ic30/n/HTU+k3rPZxEOnSAOmnhNCl+KJ3S6wMAUF/7c9+YGZ77j8TOwP/mmwumE2/T5Smk755Q+XzEhgvN1+8Sj/UaajP8j1uRDmj5P02cqd/77yB+kExkSherQcqfJuCm03wGdY/X5PTm42cRJuMGtU+JPLF9ZrL74S7e8GkIm6Oys6Lxp1eG5vYxPuO6tImUYjwH+rbxrmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772813831; c=relaxed/relaxed;
	bh=dvPuYr+wx2QMO9pA8MviOujpF5rIdngV8V2fQYNN3do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oB0ekwKjlXZp6Vu0obYZQXTYHPD8yg+Ag9RC7JMutlioQ3L0icU8AP5h3KfkL0wc0StCvS5UhBr67fCEolXj9pnCKJKgb0Vgqobw17IoMgMqPvTenMhyyyFPqsdu+7JVZirZe5VL8LG6NZoP/jn7nHYClDVHLe6SAJLuDK+AVgTgAwE0NXC8pAnWktpTbRg/s2/l5SOG9CLSyntauProS1ytIzWIMqnFmp5p5ST4FoZDfErijq7dTPhu1PRyx7+zhn+xLZ96CdlT9U+dR+qOIr8vfgSV8h4+Md27GqEfNivxr8IjYCdBkUK0vEb6H7PpnmPCFJMYT2heobN/tlNtmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=akviHM64; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=akviHM64;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fSBPf6K8mz3c9x
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Mar 2026 03:17:10 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FFW44969840;
	Fri, 6 Mar 2026 16:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=dvPuYr+wx2QMO9pA8
	MviOujpF5rIdngV8V2fQYNN3do=; b=akviHM64wlvtIFBB7e/2kpXh17aszxoRK
	0cozfpXqfqJNSVcQaM+nu8FM9eWvAvEMrqxGM5czzP+EIbCrNbAt5hoL8uqe8UX9
	msB85pTHWQqY2v/vYS3srMMQa/2EwgLF0RMQF4dKAhc10+kM6CIEnJk+hdHBq+M2
	V5dG9s+MK+lG1F1vQxnUlMvpPTiTJMoo7aTNZNDtHIP04BwV9fQW+6Tnh8eP1uTC
	0QWoqTGYd+qyXhvDDnq1YMj83NShemnWFkTTflcc1nk9ivcdSgMl5lemA1coKeiV
	pReDYVxpKfBBuSAo/UIOJk+4PgJIcMmzcdy7Z5hePBOAPXBni2xcQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ckskc8se2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 16:16:38 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 626CmEvi011312;
	Fri, 6 Mar 2026 16:16:37 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cqau2w48b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 16:16:37 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 626GGX7p56164638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 16:16:33 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72E152004D;
	Fri,  6 Mar 2026 16:16:33 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31E6420040;
	Fri,  6 Mar 2026 16:16:33 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri,  6 Mar 2026 16:16:33 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id 16A52E0782; Fri, 06 Mar 2026 17:16:33 +0100 (CET)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Pasha Tatashin <pasha.tatashin@soleen.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>
Cc: linux-s390@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        x86@kernel.org
Subject: [PATCH v2 1/4] mm/page_table_check: Pass mm_struct to pxx_user_accessible_page()
Date: Fri,  6 Mar 2026 17:16:30 +0100
Message-ID: <ca77f3489453c2fe01b25e50e53b778929e0dfc5.1772812343.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1772812343.git.agordeev@linux.ibm.com>
References: <cover.1772812343.git.agordeev@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: r_JJATWQBFsDHEsEyPI0oU--uaf6lVcd
X-Authority-Analysis: v=2.4 cv=b66/I9Gx c=1 sm=1 tr=0 ts=69aafde6 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=Z4Rwk6OoAAAA:8
 a=asBC7hBXzHMpFcoxCN0A:9 a=O8hF6Hzn-FEA:10 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1MyBTYWx0ZWRfX1HpUb4J1aFqu
 y6Mdi43ielkZWDJq6nCbK41319XElOsluMXFF10oInHkH/E/R3Dbe8dxItguMzp9Z/bMEhTEXOE
 vr3PwcgjrITFmANL1uRc5DJHiSSObHmmpwcBqskcFDroERwyESMdj2Xx66j01FElS/Ovgsju5So
 BFxH3jnkIgqsHjM7AalQR2xC2WlWlrP7TBypY4xIlghvMAmxVOnov6TDFkQ2/YhtTs/a1ljYdjr
 ShFDCFvJxxAQGc1T5ZyEXx3c4I/HDMLJvrnIxbWldoUTwxaurvhEOLINggXFKBBg4Pkc84+qPx1
 L2XzQYQ58sCiBLHAXQb4aMvCN8lXhcA3URuWRHOwGgXEhwSN5vAqPVizSlrpsh/8Ou7nJsL4yUv
 GcQcTmKbkhf9bzbk03t0aDz59kJ1ypqFq6ZedBhENg9DTZ4V3VIoxqfsi/iQuWV0jlwadad1zpa
 cy5ERl7+xt5fY9kLMRw==
X-Proofpoint-GUID: r_JJATWQBFsDHEsEyPI0oU--uaf6lVcd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060153
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 11D53224AF8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-17841-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[agordeev@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:pasha.tatashin@soleen.com,m:akpm@linux-foundation.org,m:gor@linux.ibm.com,m:hca@linux.ibm.com,m:linux-s390@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:x86@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	FROM_NEQ_ENVFROM(0.00)[agordeev@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Action: no action

From: Tobias Huschle <huschle@linux.ibm.com>

Unlike other architectures, s390 does not have means to
distinguish kernel vs user page table entries - neither
an entry itself, nor the address could be used for that.
It is only the mm_struct that indicates whether an entry
in question is mapped to a user space. So pass mm_struct
to pxx_user_accessible_page() callbacks.

[agordeev@linux.ibm.com: rephrased commit message, removed braces]

Reviewed-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 arch/arm64/include/asm/pgtable.h             |  6 +++---
 arch/powerpc/include/asm/book3s/32/pgtable.h |  2 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 10 +++++-----
 arch/powerpc/include/asm/nohash/pgtable.h    |  2 +-
 arch/powerpc/include/asm/pgtable.h           |  4 ++--
 arch/riscv/include/asm/pgtable.h             |  6 +++---
 arch/x86/include/asm/pgtable.h               |  6 +++---
 mm/page_table_check.c                        | 15 ++++++---------
 8 files changed, 24 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pg=
table.h
index b3e58735c49b..ccf0e0638767 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1263,17 +1263,17 @@ static inline int pmdp_set_access_flags(struct vm=
_area_struct *vma,
 #endif
=20
 #ifdef CONFIG_PAGE_TABLE_CHECK
-static inline bool pte_user_accessible_page(pte_t pte, unsigned long add=
r)
+static inline bool pte_user_accessible_page(struct mm_struct *mm, unsign=
ed long addr, pte_t pte)
 {
 	return pte_valid(pte) && (pte_user(pte) || pte_user_exec(pte));
 }
=20
-static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long add=
r)
+static inline bool pmd_user_accessible_page(struct mm_struct *mm, unsign=
ed long addr, pmd_t pmd)
 {
 	return pmd_valid(pmd) && !pmd_table(pmd) && (pmd_user(pmd) || pmd_user_=
exec(pmd));
 }
=20
-static inline bool pud_user_accessible_page(pud_t pud, unsigned long add=
r)
+static inline bool pud_user_accessible_page(struct mm_struct *mm, unsign=
ed long addr, pud_t pud)
 {
 	return pud_valid(pud) && !pud_table(pud) && (pud_user(pud) || pud_user_=
exec(pud));
 }
diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/=
include/asm/book3s/32/pgtable.h
index 001e28f9eabc..75195bb44d06 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -438,7 +438,7 @@ static inline bool pte_access_permitted(pte_t pte, bo=
ol write)
 	return true;
 }
=20
-static inline bool pte_user_accessible_page(pte_t pte, unsigned long add=
r)
+static inline bool pte_user_accessible_page(struct mm_struct *mm, unsign=
ed long addr, pte_t pte)
 {
 	return pte_present(pte) && !is_kernel_addr(addr);
 }
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/=
include/asm/book3s/64/pgtable.h
index 1a91762b455d..a56df313b585 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -549,7 +549,7 @@ static inline bool pte_access_permitted(pte_t pte, bo=
ol write)
 	return arch_pte_access_permitted(pte_val(pte), write, 0);
 }
=20
-static inline bool pte_user_accessible_page(pte_t pte, unsigned long add=
r)
+static inline bool pte_user_accessible_page(struct mm_struct *mm, unsign=
ed long addr, pte_t pte)
 {
 	return pte_present(pte) && pte_user(pte);
 }
@@ -925,9 +925,9 @@ static inline bool pud_access_permitted(pud_t pud, bo=
ol write)
 }
=20
 #define pud_user_accessible_page pud_user_accessible_page
-static inline bool pud_user_accessible_page(pud_t pud, unsigned long add=
r)
+static inline bool pud_user_accessible_page(struct mm_struct *mm, unsign=
ed long addr, pud_t pud)
 {
-	return pud_leaf(pud) && pte_user_accessible_page(pud_pte(pud), addr);
+	return pud_leaf(pud) && pte_user_accessible_page(mm, addr, pud_pte(pud)=
);
 }
=20
 #define __p4d_raw(x)	((p4d_t) { __pgd_raw(x) })
@@ -1096,9 +1096,9 @@ static inline bool pmd_access_permitted(pmd_t pmd, =
bool write)
 }
=20
 #define pmd_user_accessible_page pmd_user_accessible_page
-static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long add=
r)
+static inline bool pmd_user_accessible_page(struct mm_struct *mm, unsign=
ed long addr, pmd_t pmd)
 {
-	return pmd_leaf(pmd) && pte_user_accessible_page(pmd_pte(pmd), addr);
+	return pmd_leaf(pmd) && pte_user_accessible_page(mm, addr, pmd_pte(pmd)=
);
 }
=20
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/inc=
lude/asm/nohash/pgtable.h
index e6da5eaccff6..0665d0abe89f 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -249,7 +249,7 @@ static inline bool pte_access_permitted(pte_t pte, bo=
ol write)
 	return true;
 }
=20
-static inline bool pte_user_accessible_page(pte_t pte, unsigned long add=
r)
+static inline bool pte_user_accessible_page(struct mm_struct *mm, unsign=
ed long addr, pte_t pte)
 {
 	return pte_present(pte) && !is_kernel_addr(addr);
 }
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/as=
m/pgtable.h
index dcd3a88caaf6..29ed509cd235 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -205,11 +205,11 @@ static inline bool arch_supports_memmap_on_memory(u=
nsigned long vmemmap_size)
 #endif /* CONFIG_PPC64 */
=20
 #ifndef pmd_user_accessible_page
-#define pmd_user_accessible_page(pmd, addr)	false
+#define pmd_user_accessible_page(mm, addr, pmd)	false
 #endif
=20
 #ifndef pud_user_accessible_page
-#define pud_user_accessible_page(pud, addr)	false
+#define pud_user_accessible_page(mm, addr, pud)	false
 #endif
=20
 #endif /* __ASSEMBLER__ */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pg=
table.h
index 08d1ca047104..affe46cf3bc5 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -984,17 +984,17 @@ static inline void set_pud_at(struct mm_struct *mm,=
 unsigned long addr,
 }
=20
 #ifdef CONFIG_PAGE_TABLE_CHECK
-static inline bool pte_user_accessible_page(pte_t pte, unsigned long add=
r)
+static inline bool pte_user_accessible_page(struct mm_struct *mm, unsign=
ed long addr, pte_t pte)
 {
 	return pte_present(pte) && pte_user(pte);
 }
=20
-static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long add=
r)
+static inline bool pmd_user_accessible_page(struct mm_struct *mm, unsign=
ed long addr, pmd_t pmd)
 {
 	return pmd_leaf(pmd) && pmd_user(pmd);
 }
=20
-static inline bool pud_user_accessible_page(pud_t pud, unsigned long add=
r)
+static inline bool pud_user_accessible_page(struct mm_struct *mm, unsign=
ed long addr, pud_t pud)
 {
 	return pud_leaf(pud) && pud_user(pud);
 }
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtabl=
e.h
index 1662c5a8f445..f9353d5c7464 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1680,17 +1680,17 @@ static inline bool arch_has_hw_nonleaf_pmd_young(=
void)
 #endif
=20
 #ifdef CONFIG_PAGE_TABLE_CHECK
-static inline bool pte_user_accessible_page(pte_t pte, unsigned long add=
r)
+static inline bool pte_user_accessible_page(struct mm_struct *mm, unsign=
ed long addr, pte_t pte)
 {
 	return (pte_val(pte) & _PAGE_PRESENT) && (pte_val(pte) & _PAGE_USER);
 }
=20
-static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long add=
r)
+static inline bool pmd_user_accessible_page(struct mm_struct *mm, unsign=
ed long addr, pmd_t pmd)
 {
 	return pmd_leaf(pmd) && (pmd_val(pmd) & _PAGE_PRESENT) && (pmd_val(pmd)=
 & _PAGE_USER);
 }
=20
-static inline bool pud_user_accessible_page(pud_t pud, unsigned long add=
r)
+static inline bool pud_user_accessible_page(struct mm_struct *mm, unsign=
ed long addr, pud_t pud)
 {
 	return pud_leaf(pud) && (pud_val(pud) & _PAGE_PRESENT) && (pud_val(pud)=
 & _PAGE_USER);
 }
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 2708c2b3ac1f..53a8997ec043 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -151,9 +151,8 @@ void __page_table_check_pte_clear(struct mm_struct *m=
m, unsigned long addr,
 	if (&init_mm =3D=3D mm)
 		return;
=20
-	if (pte_user_accessible_page(pte, addr)) {
+	if (pte_user_accessible_page(mm, addr, pte))
 		page_table_check_clear(pte_pfn(pte), PAGE_SIZE >> PAGE_SHIFT);
-	}
 }
 EXPORT_SYMBOL(__page_table_check_pte_clear);
=20
@@ -163,9 +162,8 @@ void __page_table_check_pmd_clear(struct mm_struct *m=
m, unsigned long addr,
 	if (&init_mm =3D=3D mm)
 		return;
=20
-	if (pmd_user_accessible_page(pmd, addr)) {
+	if (pmd_user_accessible_page(mm, addr, pmd))
 		page_table_check_clear(pmd_pfn(pmd), PMD_SIZE >> PAGE_SHIFT);
-	}
 }
 EXPORT_SYMBOL(__page_table_check_pmd_clear);
=20
@@ -175,9 +173,8 @@ void __page_table_check_pud_clear(struct mm_struct *m=
m, unsigned long addr,
 	if (&init_mm =3D=3D mm)
 		return;
=20
-	if (pud_user_accessible_page(pud, addr)) {
+	if (pud_user_accessible_page(mm, addr, pud))
 		page_table_check_clear(pud_pfn(pud), PUD_SIZE >> PAGE_SHIFT);
-	}
 }
 EXPORT_SYMBOL(__page_table_check_pud_clear);
=20
@@ -211,7 +208,7 @@ void __page_table_check_ptes_set(struct mm_struct *mm=
, unsigned long addr,
=20
 	for (i =3D 0; i < nr; i++)
 		__page_table_check_pte_clear(mm, addr + PAGE_SIZE * i, ptep_get(ptep +=
 i));
-	if (pte_user_accessible_page(pte, addr))
+	if (pte_user_accessible_page(mm, addr, pte))
 		page_table_check_set(pte_pfn(pte), nr, pte_write(pte));
 }
 EXPORT_SYMBOL(__page_table_check_ptes_set);
@@ -241,7 +238,7 @@ void __page_table_check_pmds_set(struct mm_struct *mm=
, unsigned long addr,
=20
 	for (i =3D 0; i < nr; i++)
 		__page_table_check_pmd_clear(mm, addr + PMD_SIZE * i, *(pmdp + i));
-	if (pmd_user_accessible_page(pmd, addr))
+	if (pmd_user_accessible_page(mm, addr, pmd))
 		page_table_check_set(pmd_pfn(pmd), stride * nr, pmd_write(pmd));
 }
 EXPORT_SYMBOL(__page_table_check_pmds_set);
@@ -257,7 +254,7 @@ void __page_table_check_puds_set(struct mm_struct *mm=
, unsigned long addr,
=20
 	for (i =3D 0; i < nr; i++)
 		__page_table_check_pud_clear(mm, addr + PUD_SIZE * i, *(pudp + i));
-	if (pud_user_accessible_page(pud, addr))
+	if (pud_user_accessible_page(mm, addr, pud))
 		page_table_check_set(pud_pfn(pud), stride * nr, pud_write(pud));
 }
 EXPORT_SYMBOL(__page_table_check_puds_set);
--=20
2.51.0


