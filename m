Return-Path: <linuxppc-dev+bounces-9720-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 133B9AE788E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 09:31:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRtmq0ygfz2xbX;
	Wed, 25 Jun 2025 17:31:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750836715;
	cv=none; b=EFW2TgkRauwq43SSK1d2VIEGqKV8KQdW8eIZnG7hY+Lc8yJDPUZqY+hElONt86sQAzpQl5StbftLwrv8oErvaOmKP4mJc7wKdmywjYnaBdFkoie+vDsMEYIHcAuebA11DidR9h2IqlXXF5oXCBGghABNldaeokAE50H7pMK4BNbZPbKlcLfUdosNw77JqdehohmdKFhWzuXg1yLUPyS3NbVD0hWRe0R87yqYAA3czij9LjzzBwnJVdeLtYIcBDi68VhLITKJ/8U4xjtJf7PwygKQBt6Bi/5NQlTxKaRD0ckwhgleZbsJzNMdhLTegbecze5rxjgC8oefwofC5PBvbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750836715; c=relaxed/relaxed;
	bh=KTExvezmyrjLwuMrG2EpbzYH4/i3a/AxfBsx419ijTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KZMmrhlK4Ss7SYQmJ8tZ4h4HI4RujEKq2nTQDfxLXEKzeO9GWWE8KIOI7xw/WKyVK6QRlhVq0qptgbRxo+sZ/031GummkJEefQv8PhFSBryJJGWRVq0oqMBzFT9WzwaN1GSQe7M686IYNXdHY+FMFU0PHvuwsImf7wCb/9iWf7sk/axMUc3N6RrRvhz8P2bUK/EgbHTor0SxyK77JWeOiet0oqps5KAaZPl74uhbmOEg1x3g7TF6cVITShtF6c5BZCKkpla0chJswRamMyQxakw9B34XjxeuWLQ5Onp35mbrwNWHfszQS1JcyKNvJzbABQcZIbFsTMU42DefQzEQvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VktehCTG; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VktehCTG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRtmn6JRFz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 17:31:53 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1KH3s014893;
	Wed, 25 Jun 2025 07:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=KTExvezmyrjLwuMrG
	2EpbzYH4/i3a/AxfBsx419ijTU=; b=VktehCTG/F5v4EI2Mg4Bq25oW6QPAVlDE
	3jaP6s9qozgScWAYl0u3cNM2pov8LTQ7hoOM6/XMaAFeoaEeDjjFzq5SLwzw3Koy
	EhTe37HxmeMo+ClDjo0M4owvPRozPI7efgQtVjXRTN50PVwQeyjIDLzGWEoBF8bT
	wvWyKAUyKyBctM+nxDccL36esIhTWKg7sigbrjWU272C1zJi2Rc5PcilU1koFBP+
	NLf5OahJekdXzHyNykc40usJTdCcaTnrPNZhPdKnhMeiFCsocsMcyvtGI8rwPd5I
	HvpBa+Ye4tuLU1DvGyUAc33tWiYvinPvwNYt9LIG8kjIJjcluJASA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dmf35e3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 07:31:39 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55P4uDSh015028;
	Wed, 25 Jun 2025 07:31:38 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 47e72trbjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 07:31:38 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55P7VbOd19595784
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 07:31:37 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 517FA58912;
	Wed, 25 Jun 2025 06:39:24 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA92058907;
	Wed, 25 Jun 2025 06:39:19 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.18.35])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 06:39:19 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, pasha.tatashin@soleen.com,
        akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-mm@kvack.org, sweettea-kernel@dorminy.me,
        christophe.leroy@csgroup.eu, mingo@kernel.org
Subject: [PATCH v15 10/13] powerpc: mm: Add pud_pfn() stub
Date: Wed, 25 Jun 2025 16:37:50 +1000
Message-ID: <20250625063753.77511-11-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625063753.77511-1-ajd@linux.ibm.com>
References: <20250625063753.77511-1-ajd@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=M5FNKzws c=1 sm=1 tr=0 ts=685ba5dc cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=7ipKWUHlAAAA:8 a=3n-1MRHmzzeYtLK0-mgA:9 a=gpc5p9EgBqZVLdJeV_V1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA1MyBTYWx0ZWRfX9D81NOvPqLgK HN7zOOeUE4aCUmZuT9JMZU9/tq0eX3ANMGeGlS1QqJsDpX0AVL+N8j7sqCiR2CMwmFCfbijPB/O K35l38b7U+zqadJLwhM9xFjQI0ej2n8ukixxH7vh0VxLGhTUZBJQJHfdlPO6r6/3SCnHH3B6JY3
 kVDKqLmmIdI6rzfIrdieFm/1DsA2Ie851/g3TtXZ4s+vgrmIP7Cdz0IdbKJEP4aLsWMr61phYPM iI0/SBXi7iIElwD/k7kyPOaAnOiTaLrUXqvoX6Ipi/ps/yBjEvJbp1nboEKBwW6C19iOK2FkQKy KiGzeYK1F9tGETr6DpIQS1HiwG8bJQayeFL2STOrLbw1Nx8i8e9wY2lI4T5GwM0VK7E2bilM41v
 vbxl9a4ETDw/FWESiqvvVqur53DtGnaEsIyJJ6EY+ha1rk6oy/8ClKU12V+3lh3wzscinbq3
X-Proofpoint-GUID: L8iYEZiAifJZIo-x0G4zMm2PVAPXPEQY
X-Proofpoint-ORIG-GUID: L8iYEZiAifJZIo-x0G4zMm2PVAPXPEQY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 mlxscore=0 mlxlogscore=948 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250053
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Rohan McLure <rmclure@linux.ibm.com>

The page table check feature requires that pud_pfn() be defined
on each consuming architecture.

On powerpc, only book3s64 platforms allow for hugepages at this upper
level, and thus only book3s64 currently defines pud_pfn().

The page table check code that calls pud_pfn() is gated by a call to
pud_user_accessible_page(), which will always return false on any platform
other than book3s64.

Add a stub implementation of pud_pfn() for all platforms other than
book3s64. As it will never actually be used and should always be compiled
out, raise a BUILD_BUG() error.

[ajd@linux.ibm.com: clarify commit message]
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
v15: clarify commit message
---
 arch/powerpc/include/asm/pgtable.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 93d77ad5a92f..0f73a9ade0ed 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -214,6 +214,15 @@ static inline bool arch_supports_memmap_on_memory(unsigned long vmemmap_size)
 
 #endif /* CONFIG_PPC64 */
 
+#ifndef pud_pfn
+#define pud_pfn pud_pfn
+static inline int pud_pfn(pud_t pud)
+{
+	BUILD_BUG();
+	return 0;
+}
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_PGTABLE_H */
-- 
2.49.0


