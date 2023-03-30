Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5B86CFB21
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 08:01:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnCV35CS8z3fYM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 17:01:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jYbyksnH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jYbyksnH;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnCG62Bnnz3f92
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 16:51:10 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32U5cM9Z015269;
	Thu, 30 Mar 2023 05:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=EYuqqypfBsTCiKMs3pBLwLBh09b3vknLiLEYORZ/vpk=;
 b=jYbyksnH+f9mb7Xz4uzY5oCLib24SN5nWDAIjlGWv1YCVlIFnLhf3sf7zOi1OX+9wcF4
 Ehrv0b/lR7WGznFB0GlVLpv6C9ivp0v4eQbN2QbZ5G5u+4vWf1c0+vdxbMdu8+V0LjDA
 qv0oFoTdl4bSqGSgYW7kgFoo+VpFq/MaRcM11LDvfRQPFO66myIBuTHp7j78Mozt9xLk
 p4L9He77QplsGgoYPZceJbuIP0cKEihrcp/DJktPp4EphogPBiPVZB/B6GhuzZmrIa8g
 8Fc4Z32mrw1XX6nakqhBxgXBN75+3P0JNg4zklfXuMllUnhutpVGgUyW/Ppk/6CFqD38 vw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmph94s9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 05:51:02 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32U5dDHs019672;
	Thu, 30 Mar 2023 05:51:01 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmph94s8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 05:51:01 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32U3IgeZ011237;
	Thu, 30 Mar 2023 05:50:58 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3phrk6mmce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 05:50:56 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32U5os0m33948376
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Mar 2023 05:50:54 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31BDC20040;
	Thu, 30 Mar 2023 05:50:54 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A610F2004D;
	Thu, 30 Mar 2023 05:50:53 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Mar 2023 05:50:53 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4AD9F6063F;
	Thu, 30 Mar 2023 16:50:48 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 05/12] powerpc/dexcr: Support userspace ROP protection
Date: Thu, 30 Mar 2023 16:50:33 +1100
Message-Id: <20230330055040.434133-6-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330055040.434133-1-bgray@linux.ibm.com>
References: <20230330055040.434133-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fngkn1m2UuBUhcXVnGCAQs0CyFijNn7P
X-Proofpoint-ORIG-GUID: WPALDh-YrHwd9soC9ZvTzWWUDR1JWOI8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_02,2023-03-30_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 lowpriorityscore=0 mlxlogscore=990 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303300043
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
Cc: npiggin@gmail.com, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ISA 3.1B hashst and hashchk instructions use a per-cpu SPR HASHKEYR
to hold a key used in the hash calculation. This key should be different
for each process to make it harder for a malicious process to recreate
valid hash values for a victim process.

Add support for storing a per-thread hash key, and setting/clearing
HASHKEYR appropriately.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v1:	* Guard HASHKEYR update behind change check
	* HASHKEYR reset moved earlier to patch 2
---
 arch/powerpc/include/asm/processor.h |  1 +
 arch/powerpc/kernel/process.c        | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index bad64d6a5d36..666d4e9804a8 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -264,6 +264,7 @@ struct thread_struct {
 	unsigned long   mmcr3;
 	unsigned long   sier2;
 	unsigned long   sier3;
+	unsigned long	hashkeyr;
 
 #endif
 };
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index a7f9f3f85e20..a966adb5447f 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1182,6 +1182,9 @@ static inline void save_sprs(struct thread_struct *t)
 		 */
 		t->tar = mfspr(SPRN_TAR);
 	}
+
+	if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE))
+		t->hashkeyr = mfspr(SPRN_HASHKEYR);
 #endif
 }
 
@@ -1260,6 +1263,10 @@ static inline void restore_sprs(struct thread_struct *old_thread,
 	if (cpu_has_feature(CPU_FTR_P9_TIDR) &&
 	    old_thread->tidr != new_thread->tidr)
 		mtspr(SPRN_TIDR, new_thread->tidr);
+
+	if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE) &&
+	    old_thread->hashkeyr != new_thread->hashkeyr)
+		mtspr(SPRN_HASHKEYR, new_thread->hashkeyr);
 #endif
 
 }
@@ -1844,6 +1851,10 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		childregs->ppr = DEFAULT_PPR;
 
 	p->thread.tidr = 0;
+#endif
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE))
+		p->thread.hashkeyr = current->thread.hashkeyr;
 #endif
 	/*
 	 * Run with the current AMR value of the kernel
@@ -1972,6 +1983,12 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 	current->thread.tm_tfiar = 0;
 	current->thread.load_tm = 0;
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE)) {
+		current->thread.hashkeyr = get_random_long();
+		mtspr(SPRN_HASHKEYR, current->thread.hashkeyr);
+	}
+#endif /* CONFIG_PPC_BOOK3S_64 */
 }
 EXPORT_SYMBOL(start_thread);
 
-- 
2.39.2

