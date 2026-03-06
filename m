Return-Path: <linuxppc-dev+bounces-17840-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Jv3LRD+qmkIZQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17840-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 17:17:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8711224AF0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 17:17:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSBPc5sZwz3cBG;
	Sat, 07 Mar 2026 03:17:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772813828;
	cv=none; b=f8nTaolnGVetQuz6zPTO43W1NJd23fCwH6/nfG4XPU1OM7vd/v5oo6pxqVpKPq2uaQ2KsUU3hd9NRZMpktKnGEcLtDRLxwUgyzIsayE46jTVaTZ/YzruPRVRyzdXVKGzYrqu9ofKRxStaCP+qyJ7T1Nz5VRjbuCtWs86wwQw7Yg7E5SfDlrglRE7t4ZyUUp6fqzoZ6tdfFQ2vc4FF4dJ/a1mPxTDaapYpogr6cw94xp5IJ8fHP7xGnjTW5h7ndLlIYspZGBEp37y1HKlDYoBUZbG/k/Ya5TLkC0lfqu0wGM7dWNCK0hQRDhzlIp5SinxJkcCTZzcoCQD8DwgDeyAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772813828; c=relaxed/relaxed;
	bh=nWjwnS5nyC5gSG8UutEgk3IzL8z2OXssI39FR/MoAKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fpNrNLIXgMYJjB5XprrnbFK/UOU1HeganTp3oRbd3q7x6Xyze1BunsB2yBYdOIvPd5qu3YzLOp6jO9yqAMfDVPz64OKeR/lkMNp9JbKynRKAKUmWUNE1UgL4c2bUZ3w4AmjboULlw4tMLaviB3RPWgEplowadHFjEzKj88UOY1DgBSqvVXkpeED5SCExWMJRyizgfOi1mFh7PrpqsGza9PJ2g8CWumiASYjd8MPBpW0Lh3SZiq9LuTeVVTXEIgWqjh3gSJDjSbUi/b06k0NDUEUtLlq9xZOk60qztFwZdaYzwxIOARnnjYe8UoYYsGzfQCpC/2kgmAcLA269eSxqxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ilx5jLDC; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ilx5jLDC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fSBPb5b6xz3cDg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Mar 2026 03:17:07 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626A04G92073025;
	Fri, 6 Mar 2026 16:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=nWjwnS5nyC5gSG8Uu
	tEgk3IzL8z2OXssI39FR/MoAKU=; b=Ilx5jLDC1l9AqYmdmB5yFeL8EnRQXgsIn
	5lzxzkg3o3X2YVn7WIzypkTzlSjq/wH0DCcRQe74Fx7jI7AiYqpHepy4PHkvDunB
	Zm//emKobTl4zKkI7BOz7CUtYA/7uzMkeZrqwWNlxnATkgy8xngyLzG0rEQMQ2h8
	MfIj7ZBqvC2zsCPZge7RFv23+UoPOTmMBnX30+61ZYXatrzw+3w2fDD8jamxJbTU
	3VTxa7qFRmVhrfv641ngYyzpw9Cw98EE+GCpf84HZ2G2FU0zpiUBdUoQPL7dc82y
	1EBaCAFszJaONQpSBuYok99o5tzymyNpxU1hpf/h9kF205fzfrYqw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ckssn0w15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 16:16:38 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 626DvTMv010309;
	Fri, 6 Mar 2026 16:16:37 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cmc6kgfvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Mar 2026 16:16:37 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 626GGXZC46661980
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 16:16:33 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FAC220043;
	Fri,  6 Mar 2026 16:16:33 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3563E20040;
	Fri,  6 Mar 2026 16:16:33 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri,  6 Mar 2026 16:16:33 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id 1C691E078D; Fri, 06 Mar 2026 17:16:33 +0100 (CET)
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
Subject: [PATCH v2 3/4] s390/pgtable: Add s390 support for page table check
Date: Fri,  6 Mar 2026 17:16:32 +0100
Message-ID: <4db8a681205bd555298d62441cdcfca43317a35a.1772812343.git.agordeev@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1MyBTYWx0ZWRfX1d2OIZjG6Vaz
 g0Rv9SduxkYPt7UUmGsEi1jwwNqDXHXKWAZGxZwxHmNqqqYLPUwab+S4aJvlG2CKSxcbh5OBhLz
 kiofMXqIeqVEVQJ+Hiy7wqIEOIq2JyeKt37Ad1Hdb4pbSqra0YyKugiohqSEp4PpkmLnTnclhK5
 Fy6oxpW0YBLgf1YaEzeyyzFveRMXSzVxPS+NgwjL/c4MTRKYz7OyIJS9HshwUrm6qGBQYMyn+tZ
 ct6sLcM76BP621M8V21IvQeGx+fcRcQSGUbugeRemvsSFJwScSatz7ZcefPxExOW16mM3bnnp2h
 THJTA/4G5MSnUj66ITsQZ+ev8RkThjEixMqeTlz41In2SOBYPRy504DYFbtkoChg61o8oyDXtDI
 ARxy13S1GBGxouq1FLwk8szju2l51Oakp3Ilma0QuSGZXfqA82O9mm/NzUw7eHUUGwkXzA7bQp1
 Bw0Uyh5MG0mmsRnp6Ww==
X-Proofpoint-ORIG-GUID: 83ygpnALoePex-sniqGXgjL2kS8s86yy
X-Proofpoint-GUID: 83ygpnALoePex-sniqGXgjL2kS8s86yy
X-Authority-Analysis: v=2.4 cv=AobjHe9P c=1 sm=1 tr=0 ts=69aafde6 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=lBuVlAIgDHgG38O_heoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060153
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: C8711224AF0
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
	TAGGED_FROM(0.00)[bounces-17840-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[agordeev@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:pasha.tatashin@soleen.com,m:akpm@linux-foundation.org,m:gor@linux.ibm.com,m:hca@linux.ibm.com,m:linux-s390@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:x86@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,linux.ibm.com:mid];
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

Add page table check hooks into routines that modify user page
tables.

Unlike other architectures s390 does not have means to distinguish
between kernel and user page table entries. Rely on the fact the
page table check infrastructure itself operates on non-init_mm
memory spaces only.

Use the provided mm_struct to verify that the memory space is not
init_mm (aka not the kernel memory space) indeed. That check is
supposed to be succeeded already (on some code paths even twice).

If the passed memory space by contrast is init_mm that would be an
unexpected semantical change in generic code, so do VM_BUG_ON() in
such case.

Unset _SEGMENT_ENTRY_READ bit to indicate that pmdp_invalidate()
was applied against a huge PMD and is going to be updated by
set_pmd_at() shortly. The hook pmd_user_accessible_page() should
skip such entries until that, otherwise the page table accounting
falls apart and BUG_ON() gets hit as result.

The invalidated huge PMD entry should not be confused with a PROT_NONE
entry as reported by pmd_protnone(), though the entry characteristics
exactly match: _SEGMENT_ENTRY_LARGE is set while _SEGMENT_ENTRY_READ is
unset. Since pmd_protnone() implementation depends on NUMA_BALANCING
configuration option, it should not be used in pmd_user_accessible_page()
check, which is expected to be CONFIG_NUMA_BALANCING-agnostic.

Nevertheless, an invalidated huge PMD is technically still pmd_protnone()
entry and it should not break other code paths once _SEGMENT_ENTRY_READ
is unset. As of now, all pmd_protnone() checks are done under page table
locks or exercise GUP-fast and HMM code paths, which are expected to be
safe against concurrent page table updates.

Alternative approach would be using the last remaining unused PMD entry
bit 0x800 to indicate that pmdp_invalidate() was called on a PMD. That
would allow avoiding collisions with pmd_protnone() handling code paths,
but saving the bit is more preferable way to go.

Reviewed-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
Co-developed-by: Alexander Gordeev <agordeev@linux.ibm.com>
Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 arch/s390/Kconfig               |  1 +
 arch/s390/include/asm/pgtable.h | 54 ++++++++++++++++++++++++++++++---
 2 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index edc927d9e85a..7bda45d30455 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -154,6 +154,7 @@ config S390
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && CC_IS_CLANG
 	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
 	select ARCH_SUPPORTS_NUMA_BALANCING
+	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
 	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgta=
ble.h
index 04ec9fee6498..67f5df20a57e 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -16,8 +16,10 @@
 #include <linux/mm_types.h>
 #include <linux/cpufeature.h>
 #include <linux/page-flags.h>
+#include <linux/page_table_check.h>
 #include <linux/radix-tree.h>
 #include <linux/atomic.h>
+#include <linux/mmap_lock.h>
 #include <asm/ctlreg.h>
 #include <asm/bug.h>
 #include <asm/page.h>
@@ -1190,6 +1192,7 @@ static inline pte_t ptep_get_and_clear(struct mm_st=
ruct *mm,
 	/* At this point the reference through the mapping is still present */
 	if (mm_is_protected(mm) && pte_present(res))
 		WARN_ON_ONCE(uv_convert_from_secure_pte(res));
+	page_table_check_pte_clear(mm, addr, res);
 	return res;
 }
=20
@@ -1208,6 +1211,7 @@ static inline pte_t ptep_clear_flush(struct vm_area=
_struct *vma,
 	/* At this point the reference through the mapping is still present */
 	if (mm_is_protected(vma->vm_mm) && pte_present(res))
 		WARN_ON_ONCE(uv_convert_from_secure_pte(res));
+	page_table_check_pte_clear(vma->vm_mm, addr, res);
 	return res;
 }
=20
@@ -1231,6 +1235,9 @@ static inline pte_t ptep_get_and_clear_full(struct =
mm_struct *mm,
 	} else {
 		res =3D ptep_xchg_lazy(mm, addr, ptep, __pte(_PAGE_INVALID));
 	}
+
+	page_table_check_pte_clear(mm, addr, res);
+
 	/* Nothing to do */
 	if (!mm_is_protected(mm) || !pte_present(res))
 		return res;
@@ -1327,6 +1334,7 @@ static inline void set_ptes(struct mm_struct *mm, u=
nsigned long addr,
 {
 	if (pte_present(entry))
 		entry =3D clear_pte_bit(entry, __pgprot(_PAGE_UNUSED));
+	page_table_check_ptes_set(mm, addr, ptep, entry, nr);
 	for (;;) {
 		set_pte(ptep, entry);
 		if (--nr =3D=3D 0)
@@ -1703,6 +1711,7 @@ static inline int pmdp_clear_flush_young(struct vm_=
area_struct *vma,
 static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 			      pmd_t *pmdp, pmd_t entry)
 {
+	page_table_check_pmd_set(mm, addr, pmdp, entry);
 	set_pmd(pmdp, entry);
 }
=20
@@ -1717,7 +1726,11 @@ static inline pmd_t pmd_mkhuge(pmd_t pmd)
 static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 					    unsigned long addr, pmd_t *pmdp)
 {
-	return pmdp_xchg_direct(mm, addr, pmdp, __pmd(_SEGMENT_ENTRY_EMPTY));
+	pmd_t pmd;
+
+	pmd =3D pmdp_xchg_direct(mm, addr, pmdp, __pmd(_SEGMENT_ENTRY_EMPTY));
+	page_table_check_pmd_clear(mm, addr, pmd);
+	return pmd;
 }
=20
 #define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR_FULL
@@ -1725,12 +1738,17 @@ static inline pmd_t pmdp_huge_get_and_clear_full(=
struct vm_area_struct *vma,
 						 unsigned long addr,
 						 pmd_t *pmdp, int full)
 {
+	pmd_t pmd;
+
 	if (full) {
-		pmd_t pmd =3D *pmdp;
+		pmd =3D *pmdp;
 		set_pmd(pmdp, __pmd(_SEGMENT_ENTRY_EMPTY));
+		page_table_check_pmd_clear(vma->vm_mm, addr, pmd);
 		return pmd;
 	}
-	return pmdp_xchg_lazy(vma->vm_mm, addr, pmdp, __pmd(_SEGMENT_ENTRY_EMPT=
Y));
+	pmd =3D pmdp_xchg_lazy(vma->vm_mm, addr, pmdp, __pmd(_SEGMENT_ENTRY_EMP=
TY));
+	page_table_check_pmd_clear(vma->vm_mm, addr, pmd);
+	return pmd;
 }
=20
 #define __HAVE_ARCH_PMDP_HUGE_CLEAR_FLUSH
@@ -1748,7 +1766,12 @@ static inline pmd_t pmdp_invalidate(struct vm_area=
_struct *vma,
=20
 	VM_WARN_ON_ONCE(!pmd_present(pmd));
 	pmd =3D set_pmd_bit(pmd, __pgprot(_SEGMENT_ENTRY_INVALID));
-	return pmdp_xchg_direct(vma->vm_mm, addr, pmdp, pmd);
+#ifdef CONFIG_PAGE_TABLE_CHECK
+	pmd =3D clear_pmd_bit(pmd, __pgprot(_SEGMENT_ENTRY_READ));
+#endif
+	page_table_check_pmd_set(vma->vm_mm, addr, pmdp, pmd);
+	pmd =3D pmdp_xchg_direct(vma->vm_mm, addr, pmdp, pmd);
+	return pmd;
 }
=20
 #define __HAVE_ARCH_PMDP_SET_WRPROTECT
@@ -1783,6 +1806,29 @@ static inline int has_transparent_hugepage(void)
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
=20
+#ifdef CONFIG_PAGE_TABLE_CHECK
+static inline bool pte_user_accessible_page(struct mm_struct *mm, unsign=
ed long addr, pte_t pte)
+{
+	VM_BUG_ON(mm =3D=3D &init_mm);
+
+	return pte_present(pte);
+}
+
+static inline bool pmd_user_accessible_page(struct mm_struct *mm, unsign=
ed long addr, pmd_t pmd)
+{
+	VM_BUG_ON(mm =3D=3D &init_mm);
+
+	return pmd_leaf(pmd) && (pmd_val(pmd) & _SEGMENT_ENTRY_READ);
+}
+
+static inline bool pud_user_accessible_page(struct mm_struct *mm, unsign=
ed long addr, pud_t pud)
+{
+	VM_BUG_ON(mm =3D=3D &init_mm);
+
+	return pud_leaf(pud);
+}
+#endif
+
 /*
  * 64 bit swap entry format:
  * A page-table entry has some bits we have to treat in a special way.
--=20
2.51.0


