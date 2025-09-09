Return-Path: <linuxppc-dev+bounces-11933-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7C5B4A72F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 11:15:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLdTN4XwNz3ccS;
	Tue,  9 Sep 2025 19:15:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757409336;
	cv=none; b=lIyz17DsBitZ+meWBLlECbOCriBelR0INBOgEVEaCRT+r4R/41o+TacYZ7YsvKsy08T7H5w4+9/G5tNbmaSkGLFEP7bohQftv9KSR3cIUuH7JlQqdYH7BoOjz1HrwkPkFwVyIom9Pcg1m4MDTjWhIsZTmZNssaH0OfMc2YfVVCSNhVbGDGcL4ie4FcJ/KwDPIoekOpEg9ETFsmliI2ND01dKzFB7vOG3L1mKDYh3ENVQS6D8AmEwbpk53RYR764av1cTZWQFMNkwQRfyCLn6A+gkyp5ST0BsjLVOoIsq0goL0v03bt4oIyO4u6Dhj7q/7BbiM/00/odzMO1E3vuFCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757409336; c=relaxed/relaxed;
	bh=N8EealqgrpCzZz7qOCOIQ+4P/4Y4XtWwcjzoer4drJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UlfeZMIGX7TYlK966DpVNAq9BSyYKzGquDDW6cglSrg4zVL+eJ0BfxiH0EJfmmdDIQbSta4ZlGCKobheqHCfVvG2GqCdL07xyuerHavtzdCTbgbfbJdy4dQfJRiqhGdvk3yBGw2XWuiVJboVCa4czx1pFgs0pOZvZIIrxAZHiRLjE2KjGFmMKFbJQS82NrJ86bDgNcdqHybkqRzfTdWoH0sdfqGJO7w2E6VWORumfdPeip+/4Yx04JJl+Q8dObzYORg6NDi0pXj3P20PsVAmkgUWwe5AbCVFaUROf3qtNV2+R7mISHHny7zJTHEk3mLaR2b2Zrx9TZZZxUiPqM4x4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jXkJo6zY; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jXkJo6zY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLdTM5Xpwz3cZt
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 19:15:35 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896MAwd024164;
	Tue, 9 Sep 2025 09:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=N8EealqgrpCzZz7qO
	COIQ+4P/4Y4XtWwcjzoer4drJU=; b=jXkJo6zY/xPfZ7kUBjK+/42+5GgfOCDBs
	YbiJsn72dYagjfrullVNcHKr7lWiThgeuhEdLTN3H5tE/9tLeSrDtlaBXAdt32go
	sz+fGgE++l79hGO10WAHUhnQg9wOZEG9S5ZifVcNc6hlsl8NQ1BOFNEJxkeD4hmv
	9r2AdOR6tj8HRwv6hqIaaGf0dsG/XRxMyzlEQgIVFsm0Lm0mgyJaMaToh8fJN/HN
	QouvFVjVgOQBP05zCcoxKFReRAmUxYm9d7Qtiy57sR9zCEX0Lty9aODgzbegArT4
	Sk80u3PLqQZVU7QBmCvrYIjtwMOW1bZS1rlN3uWpkUmgVF4JIfFdg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcspgy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 09:15:24 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5896nDeV010666;
	Tue, 9 Sep 2025 09:15:23 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4910smt9qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 09:15:23 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5899FMQ731785654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Sep 2025 09:15:22 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D15958043;
	Tue,  9 Sep 2025 09:15:22 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B13EE5805E;
	Tue,  9 Sep 2025 09:15:16 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.2.198])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Sep 2025 09:15:16 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
        nicholas@linux.ibm.com, christophe.leroy@csgroup.eu,
        alexghiti@rivosinc.com, Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH v17 10/12] powerpc: mm: Implement *_user_accessible_page() for ptes
Date: Tue,  9 Sep 2025 19:13:33 +1000
Message-ID: <20250909091335.183439-11-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909091335.183439-1-ajd@linux.ibm.com>
References: <20250909091335.183439-1-ajd@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxMCBTYWx0ZWRfX2FBiHo7uUFP7
 5z0hL8pcUkziaGtBtP8TW2gXO9LmWpZpxofnp7QPVpI0a24zlAYmnDchlSKfSw7owvrhJR2cD9y
 GbK6NBo6L23LNZ81GpdqascUBOiLf/NJf7p8CsoSuwh67cQuh6FmpJePaMNDTnaLhZdG24JXp5z
 oXP7Ku7mh60Y8/zZuJGfuX+nOOX2xbYTmSlj8o7TVwFfNwUnNY3jeWxGTSjUD00amn/LR7XwDQE
 Ck3Nlp2LiAyOKtZzjV6644Yj+irpUyrBTaCstYJwGlqBRSzjV9ZiGyxxzzuPpE12k8ByUrQtGyC
 HhhJfmVzA3dNbNvYVHxjfzByCEH/PepH/vqbKwdYf4R8A8t52LsHotVNY6Dg4AWyVQ7mR3AIi+/
 ccsTaTim
X-Authority-Analysis: v=2.4 cv=SKNCVPvH c=1 sm=1 tr=0 ts=68bff02c cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=7ipKWUHlAAAA:8 a=a65a1E2n8xkc5m_RgcEA:9
 a=gpc5p9EgBqZVLdJeV_V1:22
X-Proofpoint-GUID: TM3YhvqpwbcLDevaIpBzNiayhoybwUdn
X-Proofpoint-ORIG-GUID: TM3YhvqpwbcLDevaIpBzNiayhoybwUdn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Rohan McLure <rmclure@linux.ibm.com>

Page table checking depends on architectures providing an
implementation of p{te,md,ud}_user_accessible_page. With
refactorisations made on powerpc/mm, the pte_access_permitted() and
similar methods verify whether a userland page is accessible with the
required permissions.

Since page table checking is the only user of
p{te,md,ud}_user_accessible_page(), implement these for all platforms,
using some of the same preliminary checks taken by pte_access_permitted()
on that platform.

Since commit 8e9bd41e4ce1 ("powerpc/nohash: Replace pte_user() by pte_read()")
pte_user() is no longer required to be present on all platforms as it
may be equivalent to or implied by pte_read(). Hence implementations of
pte_user_accessible_page() are specialised.

[ajd@linux.ibm.com: rebase and fix commit message]
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h |  5 +++++
 arch/powerpc/include/asm/book3s/64/pgtable.h | 17 +++++++++++++++++
 arch/powerpc/include/asm/nohash/pgtable.h    |  5 +++++
 arch/powerpc/include/asm/pgtable.h           |  8 ++++++++
 4 files changed, 35 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 92d21c6faf1e..b225967f85ea 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -437,6 +437,11 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
 	return true;
 }
 
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
+{
+	return pte_present(pte) && !is_kernel_addr(addr);
+}
+
 /* Conversion functions: convert a page and protection to a page entry,
  * and a page entry and page directory to the page they refer to.
  *
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index c19800365315..48f3a41317dd 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -539,6 +539,11 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
 	return arch_pte_access_permitted(pte_val(pte), write, 0);
 }
 
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
+{
+	return pte_present(pte) && pte_user(pte);
+}
+
 /*
  * Conversion functions: convert a page and protection to a page entry,
  * and a page entry and page directory to the page they refer to.
@@ -1381,5 +1386,17 @@ static inline bool is_pte_rw_upgrade(unsigned long old_val, unsigned long new_va
 	return false;
 }
 
+#define pmd_user_accessible_page pmd_user_accessible_page
+static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long addr)
+{
+	return pmd_leaf(pmd) && pte_user_accessible_page(pmd_pte(pmd), addr);
+}
+
+#define pud_user_accessible_page pud_user_accessible_page
+static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
+{
+	return pud_leaf(pud) && pte_user_accessible_page(pud_pte(pud), addr);
+}
+
 #endif /* __ASSEMBLY__ */
 #endif /* _ASM_POWERPC_BOOK3S_64_PGTABLE_H_ */
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 7d6b9e5b286e..a8bc4f24beb1 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -243,6 +243,11 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
 	return true;
 }
 
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
+{
+	return pte_present(pte) && !is_kernel_addr(addr);
+}
+
 /* Conversion functions: convert a page and protection to a page entry,
  * and a page entry and page directory to the page they refer to.
  *
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index d8f944a5a037..fa43f663e615 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -202,6 +202,14 @@ static inline bool arch_supports_memmap_on_memory(unsigned long vmemmap_size)
 
 #endif /* CONFIG_PPC64 */
 
+#ifndef pmd_user_accessible_page
+#define pmd_user_accessible_page(pmd, addr)	false
+#endif
+
+#ifndef pud_user_accessible_page
+#define pud_user_accessible_page(pud, addr)	false
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_PGTABLE_H */
-- 
2.51.0


