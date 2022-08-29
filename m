Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2165A441A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 09:46:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGMvF1cMvz3c6f
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 17:46:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mJW7zBQk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mJW7zBQk;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGMtX53THz2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 17:45:40 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27T6x0SR024968;
	Mon, 29 Aug 2022 07:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=3VpCha95x2STe2fr12KWkH9iLCsGIQ6+EVvr+ndljUU=;
 b=mJW7zBQkNdZBeG5CYPSSBaaIVNhFsjv/D655xOQClnieldcQDvcsWGqa8Hn0vJ1c4h12
 F9SAQDl9A7k96mjvi53OCFgcCLBo7oyiQgR7hSF/onjSMscKQGUuTaeSjB/V/xJNnDdK
 UiIwsyPm+9VM9PJ8+glCLpzq2yT60KmzePNioeXADU/JJbrQ54Es1FmWoiaoH0sj+eRf
 aQBgfxqJwoJOSc6eDmH/eoPh41lVgQBwupLEwDtXFuyVvCWU/aZf6j/Fe8FTlVDsYAGc
 YTxnISjOeOnOz2k0yAYCrRZI7XJ4M4H94tGOHBCxsw9Lbf6wI4btbXcwEOrfKEG5Uvb9 PQ== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j8rnr96mc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 07:45:35 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27T7aJsZ023728;
	Mon, 29 Aug 2022 07:45:32 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04fra.de.ibm.com with ESMTP id 3j7aw99euq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 07:45:32 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27T7jTRh29819368
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Aug 2022 07:45:29 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 256D6AE04D;
	Mon, 29 Aug 2022 07:45:29 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B816AE056;
	Mon, 29 Aug 2022 07:45:27 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com.domain.name (unknown [9.43.39.209])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 29 Aug 2022 07:45:26 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/pseries/mce: Avoid instrumentation in realmode
Date: Mon, 29 Aug 2022 13:15:22 +0530
Message-Id: <20220829074522.443439-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Mv4dUpynuP8hpCz_gzPs8TQC3gC1O0d4
X-Proofpoint-ORIG-GUID: Mv4dUpynuP8hpCz_gzPs8TQC3gC1O0d4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_03,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxlogscore=329 bulkscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208290037
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com, sachinp@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of machine check error handling is done in realmode,
As of now instrumentation is not possible for any code that
runs in realmode.
When MCE is injected on KASAN enabled kernel, crash is
observed, Hence force inline or mark no instrumentation
for functions which can run in realmode to avoid KASAN
instrumentation.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 arch/powerpc/include/asm/interrupt.h | 2 +-
 arch/powerpc/include/asm/rtas.h      | 4 ++--
 arch/powerpc/kernel/rtas.c           | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 8069dbc4b8d1..090895051712 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -92,7 +92,7 @@ static inline bool is_implicit_soft_masked(struct pt_regs *regs)
 	return search_kernel_soft_mask_table(regs->nip);
 }
 
-static inline void srr_regs_clobbered(void)
+static __always_inline void srr_regs_clobbered(void)
 {
 	local_paca->srr_valid = 0;
 	local_paca->hsrr_valid = 0;
diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 00531af17ce0..52d29d664fdf 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -201,13 +201,13 @@ inline uint32_t rtas_ext_event_company_id(struct rtas_ext_event_log_v6 *ext_log)
 #define PSERIES_ELOG_SECT_ID_MCE		(('M' << 8) | 'C')
 
 static
-inline uint16_t pseries_errorlog_id(struct pseries_errorlog *sect)
+__always_inline uint16_t pseries_errorlog_id(struct pseries_errorlog *sect)
 {
 	return be16_to_cpu(sect->id);
 }
 
 static
-inline uint16_t pseries_errorlog_length(struct pseries_errorlog *sect)
+__always_inline uint16_t pseries_errorlog_length(struct pseries_errorlog *sect)
 {
 	return be16_to_cpu(sect->length);
 }
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 693133972294..f9d78245c0e8 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -48,7 +48,7 @@
 /* This is here deliberately so it's only used in this file */
 void enter_rtas(unsigned long);
 
-static inline void do_enter_rtas(unsigned long args)
+static __always_inline void do_enter_rtas(unsigned long args)
 {
 	unsigned long msr;
 
@@ -435,7 +435,7 @@ static char *__fetch_rtas_last_error(char *altbuf)
 #endif
 
 
-static void
+noinstr static void
 va_rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret,
 		      va_list list)
 {
-- 
2.37.1

