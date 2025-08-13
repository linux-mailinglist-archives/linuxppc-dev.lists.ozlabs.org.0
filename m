Return-Path: <linuxppc-dev+bounces-10922-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A590B24177
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 08:28:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1z2Y4XFbz3bkT;
	Wed, 13 Aug 2025 16:28:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755066485;
	cv=none; b=huZ8t/4Mue6Iu6Mr2PJYIheyO2f/lcKeouY+qhn1ttGaZuaPBSPInHKDnLR4m+jgUJRxtJ/JPJEb5RyhLPVFtsuY7NVpj4bHZJWxFkFGDA0yLCQu+fj1BjJKMoNN+LnQmJDgzVwh4i7P1Jq/VUMEOiKCqE3gKRhGqq2WNKBQyEvuFwAGhs7vC5lrEiHUq6E5Aa2RY52WeyuyzxGDK0RD3v4soamp1M7om8g/NXrK2PuLK3AO1hZdMswRjZ/huofW19fJPZaHCLF5X3z/x/j7kmU2GKUAL0BtXkmPxPki1G9u1eCET3g4Oc/4R7dqhIeN6xRcvXre5mrKeS4K9tgZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755066485; c=relaxed/relaxed;
	bh=BsQJsGaxcqmvsVIG5QO45P6Jy0ZaCP+miqd9jeaLu1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m/cN8W4gL69XX3+tHAWxi35paQlYzRppFduLyIAs5FOkI/8VZ5+hHJQcpuA6IL5nfhLWJ9UIz6XGPajW7H2nxV5Ls4Dmf6rTEUAqk9ab1avQZv/5EtJ429cMpy0wAjfNWy8zLGbGptbfct2k+MHVa6sZxmRiDwgPEzhixM42OhxhAV5NtCmcXTIOMV2iSN5eNrYm2M+e/HKGQT4OBbzYGttel3vUKTGy+skfM2reao3WJXafcoh4NUjNMERJXObpxzLhdh6PSNr7uYloKljag7ZQbegBxllIxxsxBhu4pi2VIWNBFupo5HFIKAn8sw1RsZiS4N5EP8kZ0OQd8++gog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CID4lWrm; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CID4lWrm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1z2X6NRNz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 16:28:04 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CNQEj0008385;
	Wed, 13 Aug 2025 06:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=BsQJsGaxcqmvsVIG5
	QO45P6Jy0ZaCP+miqd9jeaLu1A=; b=CID4lWrm0wGGcKXYczdkZ6A4WoNsFRUG2
	P7ZoHlfkVjMcE514h7Z7Xu73WM8jMyH71BJ6IoUbQd6jwYnEO+So6NNTOsphvBPr
	8XvBgb14JZ6rpy+3Zq/hLnmkAF2qzyGtfJGoHVlukPkmcg3HrSI43emfQV4W9dUv
	e5NeznnQ5e54qunUAQCN6rdPEjWx/6rBl/KkeAsrB3ekeqDRQ13sdNcn1qExVlSq
	UaZpwlEFMa60hkXpdT5GphW8kv5RCg5eUtWbLuqttz2Q7DBzH8sbQE+swrfWA6n+
	OzaX/ZEt7NPpB4cDFtpkvKmLNe7NUApjPIUIzlyT5MMNR+gs6FPGA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48duruavc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 06:27:54 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57D1gaat026377;
	Wed, 13 Aug 2025 06:27:53 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48eh21659n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 06:27:53 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57D6RqUD30999048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Aug 2025 06:27:52 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E67315805B;
	Wed, 13 Aug 2025 06:27:51 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D440E58067;
	Wed, 13 Aug 2025 06:27:45 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com.com (unknown [9.36.10.70])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 13 Aug 2025 06:27:45 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, x86@kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        pasha.tatashin@soleen.com, sweettea-kernel@dorminy.me,
        nicholas@linux.ibm.com, christophe.leroy@csgroup.eu,
        Rohan McLure <rmclure@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH v16 10/13] powerpc: mm: Add pud_pfn() stub
Date: Wed, 13 Aug 2025 16:26:11 +1000
Message-ID: <20250813062614.51759-11-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813062614.51759-1-ajd@linux.ibm.com>
References: <20250813062614.51759-1-ajd@linux.ibm.com>
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
X-Proofpoint-GUID: 6p78tIu4d1GxeDYW0_yoMYEY7Uv1CVko
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIyNCBTYWx0ZWRfX7SEwZJR9uMEo
 twnLAjMn1uDuQyNZFvA5mghsluXsrnnNXzdlUz6WtiuS1mzji4hMRYhDtFXzKdsF1+dii5tv0OK
 BXF3GJhRE4Y31srrKALkZx8xNOBm23JXu/foFaUhocmzOkUk8WWqGvVm77BftHaXkfhZ32Na2EN
 yNGLCWhCqEBpUzlnE3kSKahcHr+OemUixZd+rxh6kXeHWoIEKfLtMNfa7vMpjD5zkrgTYDKoJBa
 /G+mhmgKee31fJSwJtZqqRwu5G2dUHERaHLdGVfNOddfx64sKo8ruZRfrSDufbwcUmwYso2UXCF
 5tAN90eLLoWhejCdoXT2qTEnPXyeG2HHqlMFJumDS3tekxkh1Jb/YEkrLSN0IgLCfZuQz8iC6+F
 mV3/I3lB
X-Authority-Analysis: v=2.4 cv=QtNe3Uyd c=1 sm=1 tr=0 ts=689c306a cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=7ipKWUHlAAAA:8 a=qzKveJzcHEAUI94IIBQA:9
 a=gpc5p9EgBqZVLdJeV_V1:22
X-Proofpoint-ORIG-GUID: 6p78tIu4d1GxeDYW0_yoMYEY7Uv1CVko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508120224
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Rohan McLure <rmclure@linux.ibm.com>

The page table check feature requires that pud_pfn() be defined
on each consuming architecture. Since only 64-bit, Book3S platforms
allow for hugepages at this upper level, and since the calling code is
gated by a call to pud_user_accessible_page(), which will return zero,
include this stub as a BUILD_BUG().

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>
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
2.50.1


