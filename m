Return-Path: <linuxppc-dev+bounces-12703-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FB9BC33BB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 08 Oct 2025 05:30:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chJRW1rCLz302b;
	Wed,  8 Oct 2025 14:30:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759894215;
	cv=none; b=Zc2GQlN3e7aWXhAwN1y0eGlUADEOE+9kzUZQBXjlKJMu7SkSC6dIDNkgkAEFBD1Gn2Y/HnwfD7qdi5g+4HP7z1ZX9xw+cTVQmAP50/30gtFUyWWaASSP0YJzBy+x06DYRQ8GYOwOmVE+fuOOlxkiMg4VNzE5s25j34LAWyfiySLwEOL5xDDiUjhTptc9nnJzjudjNUf9jIftfoeqL9KtqqxVcLeT5uZkMfzPM1mJZ27sB1yaV+uxVKD/sRqdmhLlHybq4z8LbtbBSNxyPFHBGEQh+lXTX6Yuj9Ly4ORVT5pN6O2ryr6RzodOcuc5D3twWR60I7YzgIWymAIrO0D3xA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759894215; c=relaxed/relaxed;
	bh=Om0NL7//InBmESosYfphQ7JLYhhD5XkBBCJnWeJfXOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VzvW67HEH+G2mlHDcK1T8FEthYUZAKiqSxM6T6nMBF3InoY9F9z0O61i9mPizf4+BQxumcYBnYxbbnqvR1j2AVGXlDYdB85ogdY0I/QbwVAOgzaA6637sActCgsm7A5kfxUZvrYbZV9QZB6K3IvS1IsRHFvgjFa/euDM9JUepOBJSzRvPoCgn1V3pt5eTa2OkPpmCWP/js9V5m7KwOdOi/T4btN/uhIE9MsnOxYxlmHDSYjKsUghhN8AMh6O4zZg45GgcpfvcsxmwoOhV6Yn+zrixgu7KwN0ces4OrDX2pNMfUqTxZyvMPXR4AajC2azw1I7IhNAHknYp0udRNr8rA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bSs5wHnM; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bSs5wHnM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chJRT1zKDz2yr2
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Oct 2025 14:30:12 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597KHqfl008366;
	Wed, 8 Oct 2025 03:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=Om0NL7//InBmESosYfphQ7JLYhhD5XkBBCJnWeJfX
	Ok=; b=bSs5wHnMpALaAqNofLM8N4S6CflwE6xnCemS0wTHeY6jhZTPtuvmODF/p
	45NWT5r0tzpoXsygA6RhLHsy3am1/3qhbDv+T70nx/L6f1OsTGzke7tH4pHaZVac
	hew3hsAgZU3//Og9u6qc9h7GpPih0ZXAfC110p7A1ZzQhEUx3mTiQeoooegWxyvE
	In8Sez83C00D5AEiSmBN78dY+XGgvd4d37cH+yhIClz5RRNK7sIah5NpA4rvzR3J
	vaNTeYpdwkufGs1IQt0uKsnind8zwxNRgzct557o/vZKOsu7VWh1bTgzHAQPM3ah
	cr2lEgb5sckSEIseA+tCRiV9ADXyg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49jua9anma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 03:30:03 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5980Y5dV028041;
	Wed, 8 Oct 2025 03:30:02 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49kewn6j90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 03:30:02 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5983Tw0C49021244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Oct 2025 03:29:58 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02E4D20043;
	Wed,  8 Oct 2025 03:29:58 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E78620040;
	Wed,  8 Oct 2025 03:29:56 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.124.214.113])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Oct 2025 03:29:56 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Hari Bathini <hbathini@linux.ibm.com>
Subject: powerpc/fadump: skip parameter area allocation when fadump is disabled
Date: Wed,  8 Oct 2025 08:59:34 +0530
Message-ID: <20251008032934.262683-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
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
X-Proofpoint-GUID: 9w_PSCZETtssCEvlr7T4P_90RzuHUcDi
X-Proofpoint-ORIG-GUID: 9w_PSCZETtssCEvlr7T4P_90RzuHUcDi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMiBTYWx0ZWRfX26uKUdzFLPtu
 dBHAcMncfEYIS/RprQD2f9O7bY+ah5ohYqpD+8mCYHVssKx6XP+dA3I93yc7M4hyNRrMIq1oh0K
 J4//0Cc5d9ycRIvbuogNH1KfR8yirgAAFerCqk03zVxiPzd0rbusIrEPBxh26SC586ammx5kGvS
 bp3sYbSBG0wJVmB17hVv4DdsFKOVRK7+c1yQi4HAPM4ROcumUhdLvwwe1zCswUrYM7s/A/1xE1S
 ohJn3ED1nzzTkV2Pw9Pohdw8RHNlyH7FrP+VCh4GzP+iY4qnj4gjO8h2VJKXV+7ybiv3baRvJ0p
 XFuIYVW9Yu+22x08LULQ2rZu4GsdAtCAddCHTbfrEh4UencVU0y0vIKn34aGmNB4ACWnJByPdAD
 IICHcw+deQSq0Rwx0ggfWrnew4pkfA==
X-Authority-Analysis: v=2.4 cv=QdBrf8bv c=1 sm=1 tr=0 ts=68e5dabb cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=x6icFKpwvdMA:10 a=VnNF1IyMAAAA:8 a=9nKOnQK5S1XWHvG7nt4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fadump allocates memory to pass additional kernel command-line argument
to the fadump kernel. However, this allocation is not needed when fadump
is disabled. So avoid allocating memory for the additional parameter
area in such cases.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Fixes: f4892c68ecc1 ("powerpc/fadump: allocate memory for additional parameters early")
Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---

Changelog:

v1 -> v2
 - Added fixes and reviewed-by tag

---
 arch/powerpc/kernel/fadump.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 5782e743fd27..4ebc333dd786 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1747,6 +1747,9 @@ void __init fadump_setup_param_area(void)
 {
 	phys_addr_t range_start, range_end;
 
+	if (!fw_dump.fadump_enabled)
+		return;
+
 	if (!fw_dump.param_area_supported || fw_dump.dump_active)
 		return;
 
-- 
2.51.0


