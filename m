Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A96323894
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 09:26:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dlpt90N8mz3ccT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 19:26:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V/HcNleK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=V/HcNleK; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dlprp0qF3z30Km
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 19:25:29 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11O83vqJ029314; Wed, 24 Feb 2021 03:25:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jztkIdHOsOw4DVPaprgcAmTTsLqT3hiEKAAKB5wYfm4=;
 b=V/HcNleKYgJxndRHL80+JeL719vuxdEyy4o8pobqIWcFgRnrPnRMQKiT/Ojj7QLZXRTs
 n+cXnD5tsNzK9sBRBZ3RQc+9myi5WLyXFUio4vdc1Y94RuPjBAyExiuvyMr8Y072qXZS
 F0CvWgUNkP+iuUJP/BkyTs5N0FjBuRK5bZBXKXrUJ3wxZArHotx2Ftn5y2vGk1PZefvh
 pql1VkFrRAvLQqbMO6dhan0FtrzZX3mV4bAyIagm6RMyNofM7oipXngqKi4x7N9rSAgD
 FAmusJz3i9yHd1xyvbT/wS6RLjtm0jC/nTw5iCPpj12ECMsHlRTdsJmYyCRK4UvXMbQw CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36vwmq7grv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 03:25:24 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 11O8MW0T117328;
 Wed, 24 Feb 2021 03:25:24 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36vwmq7gqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 03:25:24 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11O8MgML031000;
 Wed, 24 Feb 2021 08:25:19 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 36tt28bc4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 08:25:19 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11O8PGDJ46858728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Feb 2021 08:25:16 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90BECA4060;
 Wed, 24 Feb 2021 08:25:16 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F311AA4062;
 Wed, 24 Feb 2021 08:25:14 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.40.232])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 24 Feb 2021 08:25:14 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 1/3] powerpc/book3s64/radix: Add H_RPT_INVALIDATE pgsize
 encodings to mmu_psize_def
Date: Wed, 24 Feb 2021 13:55:08 +0530
Message-Id: <20210224082510.3962423-2-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210224082510.3962423-1-bharata@linux.ibm.com>
References: <20210224082510.3962423-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_02:2021-02-23,
 2021-02-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102240062
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
Cc: farosas@linux.ibm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 Bharata B Rao <bharata@linux.ibm.com>, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a field to mmu_psize_def to store the page size encodings
of H_RPT_INVALIDATE hcall. Initialize this while scanning the radix
AP encodings. This will be used when invalidating with required
page size encoding in the hcall.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/mmu.h | 1 +
 arch/powerpc/mm/book3s64/radix_pgtable.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index eace8c3f7b0a..c02f42d1031e 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -19,6 +19,7 @@ struct mmu_psize_def {
 	int		penc[MMU_PAGE_COUNT];	/* HPTE encoding */
 	unsigned int	tlbiel;	/* tlbiel supported for that page size */
 	unsigned long	avpnm;	/* bits to mask out in AVPN in the HPTE */
+	unsigned long   h_rpt_pgsize; /* H_RPT_INVALIDATE page size encoding */
 	union {
 		unsigned long	sllp;	/* SLB L||LP (exact mask to use in slbmte) */
 		unsigned long ap;	/* Ap encoding used by PowerISA 3.0 */
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 98f0b243c1ab..1b749899016b 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -486,6 +486,7 @@ static int __init radix_dt_scan_page_sizes(unsigned long node,
 		def = &mmu_psize_defs[idx];
 		def->shift = shift;
 		def->ap  = ap;
+		def->h_rpt_pgsize = psize_to_rpti_pgsize(idx);
 	}
 
 	/* needed ? */
@@ -560,9 +561,13 @@ void __init radix__early_init_devtree(void)
 		 */
 		mmu_psize_defs[MMU_PAGE_4K].shift = 12;
 		mmu_psize_defs[MMU_PAGE_4K].ap = 0x0;
+		mmu_psize_defs[MMU_PAGE_4K].h_rpt_pgsize =
+			psize_to_rpti_pgsize(MMU_PAGE_4K);
 
 		mmu_psize_defs[MMU_PAGE_64K].shift = 16;
 		mmu_psize_defs[MMU_PAGE_64K].ap = 0x5;
+		mmu_psize_defs[MMU_PAGE_64K].h_rpt_pgsize =
+			psize_to_rpti_pgsize(MMU_PAGE_64K);
 	}
 
 	/*
-- 
2.26.2

