Return-Path: <linuxppc-dev+bounces-14648-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24783CA7D07
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 14:46:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNCMG4Rtvz2yFn;
	Sat, 06 Dec 2025 00:46:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764942362;
	cv=none; b=VSSvd2oo8Ez+WJUBkNc+mFgtjOKpwvSDQW8Nr6CHZqD9sZRiIra+sEwT9lLSe3y0x/pDG3rhBQBgsez5EH4F2BHeRgOw5KAzbLcQ7JKbDNBsU3iRH8+9sNudyNtEwOCTR56PLM3SoerCWNZSxsCk0qHOkZKUqhdH6y2s0kAJ6lC2OnN4zfjCpXzSq4UKGV9lw29fz3vQqCcefSkUzZVFxRrKy/klolyorDnz44ScLHdz8Vm75X83Y7SsWE5sVCnoXeEFXEh9u0EMaUchMY96Q26t2cmBVdKG0AfQ8ahTGH36OzJopZNlj+OTtGRyEiVevOkQxgiuuHHY2vURrHbxug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764942362; c=relaxed/relaxed;
	bh=zW9vSwfFQ2D5LF3bmqLnb0HWMxV6HDP4qdbmjmndgMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WmtrnPDHnXwgDKYTBfQKjhP2jTAxYOnkpTUb+KJM38bcXawg1fmmG1j0CMyjbeum6fmcVpYnmNG5J+ounCBHHNZg5033pm7W2CJ3pFwawfhpphLpBdLYFoTS+x391NqIE/YcdwMBwpackeBAFk3kzSHbyrOaxx53MU0dVtdvpoUyuAaDWLgJp77PJD747j8gJ6ltlYNxb/jsvIDY7dXyo8wWN6zePdGm5/P3hkAxO1+ASGHVmWeBwK0Kxh98ugT67bagIc/KVfkeTeaU/wyw1X4AqRwDw7hgPiiqRfg/9brB7a97e52W/XLfyVoCqtSzpaIv9z5mlFVbgAJMtsItjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nBx5kb/V; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nBx5kb/V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNCMF5GnSz2xPT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 00:46:01 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B5B8xrq005709;
	Fri, 5 Dec 2025 13:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=zW9vSwfFQ2D5LF3bm
	qLnb0HWMxV6HDP4qdbmjmndgMc=; b=nBx5kb/V8nDmGGe4A4hdFF9CzyEq7JG+5
	tmoipzM/zGpcV5tYYJXNxJXlYtxABow3sjR36qYKhSzCqR7tTF/jR/uCBIpedV3H
	J9ewlcD+H94VhgnGwnAf/a5DYp0v9pjjKy8NzfPRLYhLSgAftomoFPQXMpjChq0k
	sb2qUbE4J1lKW6cPIZj8yKa/He+48bRrEkG5OOnv68//ER9z2Wcuuhi3WFfYK0On
	t56ZnLcQeikL34gCWRkoLp3xNrTxK+hb4IZ2R2vnXVtPiKpDk141aBkc08+EBYVN
	ejGKdj83vCtIw5ZgvhjTKVKMuWJZVa7GZ0jZVHy5sEislciiR5KSQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqq8v57we-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 13:45:52 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B5DjpOZ028459;
	Fri, 5 Dec 2025 13:45:51 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqq8v57wb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 13:45:51 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B5DaWmE024120;
	Fri, 5 Dec 2025 13:45:50 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4arb5swmxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 13:45:50 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B5DjkMp60293398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Dec 2025 13:45:46 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 112DF20049;
	Fri,  5 Dec 2025 13:45:46 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A01862004D;
	Fri,  5 Dec 2025 13:45:43 +0000 (GMT)
Received: from ltcd48-lp3.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  5 Dec 2025 13:45:43 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: mahesh@linux.ibm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
        christophe.leroy@csgroup.eu, gregkh@linuxfoundation.org,
        oohall@gmail.com, npiggin@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        tyreld@linux.ibm.com, vaibhav@linux.ibm.com, sbhat@linux.ibm.com,
        ganeshgr@linux.ibm.com, sourabhjain@linux.ibm.com
Subject: [PATCH 2/4] powerpc/pseries: Add RTAS error injection buffer infrastructure
Date: Fri,  5 Dec 2025 03:45:08 -0600
Message-ID: <20251205094510.4671-3-nnmlinux@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251205094510.4671-1-nnmlinux@linux.ibm.com>
References: <20251205094510.4671-1-nnmlinux@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: CQ-PqF0qz3S83R9RwFT7O3wn5tTosToV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAwOCBTYWx0ZWRfXz+GOrvrsJlDF
 YhITCdRbyIyPItDeDoJBKaUgGSBei3zNW2GZB/f3pWC6CJZemrLn+kjJKnTVkA+1SU7JaRrFpuK
 s3b0B8+IDzEAg8T59KivO1mpmJ7bh/3u49SUg9WGAW+YYaeHytQmOZ1Ictmgsy2Tn98Tmcqcte1
 86fyYLS1aMa4L8WTisiGe81wMIQ4ymaR+6O/wCTCnVjfpVTJWiaGRmVK7ap0V+ljwL2xYfazZDn
 eFs4qLVQb3hukDtVBVNeIcpo7cqbFjewH1abVt1jKBQUUdSiPs2tsw5dJS1qHHiEufvVyoDqSNk
 xJJ1jHvoRJQlQspQvBxr3MgeEfVAX4KY5vo4hfbm9cDUdozJg1BxKlMpBII/D1p4i4Kekc8w8PD
 7pMuyStGUoCrzEb1AqZhitE2oYhrww==
X-Authority-Analysis: v=2.4 cv=Scz6t/Ru c=1 sm=1 tr=0 ts=6932e210 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=wGYcmt_NxZN9edKSF48A:9
X-Proofpoint-GUID: -Pml54njcR_e1BWp5AlaayyP0uGCVYKv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511290008
X-Spam-Status: No, score=0.4 required=3.0 tests=DATE_IN_PAST_03_06,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Adds global infrastructure required by the injection engine:
 - a 1KB aligned RTAS working buffer in rtas.c
 - a spinlock to serialize buffer access
 - UAPI definitions for error-injection tokens (added to eeh.h)

Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h     | 21 +++++++++++++++++++++
 arch/powerpc/include/uapi/asm/eeh.h | 18 ++++++++++++++++++
 arch/powerpc/kernel/rtas.c          | 12 ++++++++++++
 3 files changed, 51 insertions(+)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index d046bbd5017d..82512f822c7a 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -519,6 +519,27 @@ int rtas_get_error_log_max(void);
 extern spinlock_t rtas_data_buf_lock;
 extern char rtas_data_buf[RTAS_DATA_BUF_SIZE];
 
+/*
+ * RTAS Error Injection Buffer (PAPR-compliant)
+ * ============================================
+ *
+ * 1KB aligned, zero-initialized buffer for ibm,errinjct RTAS work area.
+ * Protected by rtas_errinjct_buf_lock for concurrent access safety.
+ *
+ * PAPR Requirement: ibm,errinjct requires a caller-allocated buffer passed
+ * via physical address. Buffer must accommodate largest error type layouts:
+ * - IOA bus error (64-bit): 8x32-bit words (32 bytes)
+ * - All other types: <=4x32-bit words (16 bytes)
+ *
+ * Usage:
+ * prepare_errinjct_buffer() -> spin_lock() -> rtas_call() -> spin_unlock()
+ *
+ * Alignment: SZ_1K ensures PAPR firmware requirements and cache-line safety.
+ */
+#define RTAS_ERRINJCT_BUF_SIZE 1024
+extern spinlock_t rtas_errinjct_buf_lock;
+extern char rtas_errinjct_buf[RTAS_ERRINJCT_BUF_SIZE];
+
 /* RMO buffer reserved for user-space RTAS use */
 extern unsigned long rtas_rmo_buf;
 
diff --git a/arch/powerpc/include/uapi/asm/eeh.h b/arch/powerpc/include/uapi/asm/eeh.h
index 3b5c47ff3fc4..86645cab2827 100644
--- a/arch/powerpc/include/uapi/asm/eeh.h
+++ b/arch/powerpc/include/uapi/asm/eeh.h
@@ -41,4 +41,22 @@
 #define EEH_ERR_FUNC_DMA_WR_TARGET	19
 #define EEH_ERR_FUNC_MAX		19
 
+/* RTAS PCI Error Injection Token Types */
+#define RTAS_ERR_TYPE_FATAL                     0x1
+#define RTAS_ERR_TYPE_RECOVERED_RANDOM_EVENT    0x2
+#define RTAS_ERR_TYPE_RECOVERED_SPECIAL_EVENT   0x3
+#define RTAS_ERR_TYPE_CORRUPTED_PAGE            0x4
+#define RTAS_ERR_TYPE_CORRUPTED_SLB             0x5
+#define RTAS_ERR_TYPE_TRANSLATOR_FAILURE        0x6
+#define RTAS_ERR_TYPE_IOA_BUS_ERROR             0x7
+#define RTAS_ERR_TYPE_PLATFORM_SPECIFIC         0x8
+#define RTAS_ERR_TYPE_CORRUPTED_DCACHE_START    0x9
+#define RTAS_ERR_TYPE_CORRUPTED_DCACHE_END      0xA
+#define RTAS_ERR_TYPE_CORRUPTED_ICACHE_START    0xB
+#define RTAS_ERR_TYPE_CORRUPTED_ICACHE_END      0xC
+#define RTAS_ERR_TYPE_CORRUPTED_TLB_START       0xD
+#define RTAS_ERR_TYPE_CORRUPTED_TLB_END         0xE
+#define RTAS_ERR_TYPE_IOA_BUS_ERROR_64          0xF
+#define RTAS_ERR_TYPE_UPSTREAM_IO_ERROR         0x10
+
 #endif /* _ASM_POWERPC_EEH_H */
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 04c8438aadda..ae1cd7964bae 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -769,6 +769,18 @@ EXPORT_SYMBOL_GPL(rtas_data_buf);
 
 unsigned long rtas_rmo_buf;
 
+/*
+ * RTAS Error Injection Buffer - Global Definitions
+ * Global 1KB buffer and spinlock for ibm,errinjct RTAS service.
+ * Exported for pseries EEH error injection usage.
+ */
+
+DEFINE_SPINLOCK(rtas_errinjct_buf_lock);
+EXPORT_SYMBOL_GPL(rtas_errinjct_buf_lock);
+
+char rtas_errinjct_buf[1024] __aligned(SZ_1K);
+EXPORT_SYMBOL_GPL(rtas_errinjct_buf);
+
 /*
  * If non-NULL, this gets called when the kernel terminates.
  * This is done like this so rtas_flash can be a module.
-- 
2.51.1


