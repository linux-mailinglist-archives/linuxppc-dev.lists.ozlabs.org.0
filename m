Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C39413447
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 15:34:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDMpJ6VPpz3c7g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:34:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mkkBQ6y5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mkkBQ6y5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDMkT66n0z2yPK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 23:30:41 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18LCGWWk016764; 
 Tue, 21 Sep 2021 09:30:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eR5lArOLZ6S7ue87oPaBvuOnNfzC5xQBC0WtVO4gBPo=;
 b=mkkBQ6y5FYtRyyt+EscOMOIJdhvmGutGczduOqVM/gNvGhFIYOclw709ju5L51BtdaBe
 p6hmeHpAi/OyNfThWcmc3mDHABxkiDuqsSWvCR/iFEvemwPMpwTzdjHVDE3QWNGarywB
 XuDtT2C6kRWya09aA2JIOoL5LrrdLQqjncvHkOhZfyEE2BxdRpi+KcSHWHH1rjmg2AMl
 AmXjSnUfgp3+RKzGFETwcqDQ9QEUbrmLuXKr5H0U3NkQDeELeOzRp6ppEmHAmXynBlAv
 Fnutw6sZRDQO4/FDVWbkcmIK9UVywWdJQg5IjzI95NjuCYzLBvpaQc/+e8uEpy+1O4CV mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b7er7aw4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 09:30:22 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18LCHPoX019695;
 Tue, 21 Sep 2021 09:30:21 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b7er7aw3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 09:30:21 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18LDNGHO008104;
 Tue, 21 Sep 2021 13:30:20 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3b57r9njj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 13:30:19 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18LDUEQ543254086
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Sep 2021 13:30:14 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C758E4C05E;
 Tue, 21 Sep 2021 13:30:13 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B27B4C064;
 Tue, 21 Sep 2021 13:30:09 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.43.117.91])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Sep 2021 13:30:08 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: naveen.n.rao@linux.ibm.com, christophe.leroy@csgroup.eu,
 mpe@ellerman.id.au, ast@kernel.org, daniel@iogearbox.net
Subject: [PATCH v3 4/8] powerpc/ppc-opcode: introduce PPC_RAW_BRANCH() macro
Date: Tue, 21 Sep 2021 18:59:39 +0530
Message-Id: <20210921132943.489732-5-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210921132943.489732-1-hbathini@linux.ibm.com>
References: <20210921132943.489732-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: swR83y8Z_OGi58Fx0F_R1zxYaF55cw0B
X-Proofpoint-ORIG-GUID: PTe16xlwsBe7eMVkeaa0vQHsL4OlfmIL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-21_01,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109210082
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
Cc: songliubraving@fb.com, netdev@vger.kernel.org, john.fastabend@gmail.com,
 andrii@kernel.org, kpsingh@kernel.org, paulus@samba.org, yhs@fb.com,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kafai@fb.com,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Define and use PPC_RAW_BRANCH() macro instead of open coding it. This
macro is used while adding BPF_PROBE_MEM support.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---

Changes in v3:
* Added Reviewed-by tag from Chris.


 arch/powerpc/include/asm/ppc-opcode.h | 2 ++
 arch/powerpc/net/bpf_jit.h            | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index baea657bc868..f50213e2a3e0 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -566,6 +566,8 @@
 #define PPC_RAW_MTSPR(spr, d)		(0x7c0003a6 | ___PPC_RS(d) | __PPC_SPR(spr))
 #define PPC_RAW_EIEIO()			(0x7c0006ac)
 
+#define PPC_RAW_BRANCH(addr)		(PPC_INST_BRANCH | ((addr) & 0x03fffffc))
+
 /* Deal with instructions that older assemblers aren't aware of */
 #define	PPC_BCCTR_FLUSH		stringify_in_c(.long PPC_INST_BCCTR_FLUSH)
 #define	PPC_CP_ABORT		stringify_in_c(.long PPC_RAW_CP_ABORT)
diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 411c63d945c7..0c8f885b8f48 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -24,8 +24,8 @@
 #define EMIT(instr)		PLANT_INSTR(image, ctx->idx, instr)
 
 /* Long jump; (unconditional 'branch') */
-#define PPC_JMP(dest)		EMIT(PPC_INST_BRANCH |			      \
-				     (((dest) - (ctx->idx * 4)) & 0x03fffffc))
+#define PPC_JMP(dest)		EMIT(PPC_RAW_BRANCH((dest) - (ctx->idx * 4)))
+
 /* blr; (unconditional 'branch' with link) to absolute address */
 #define PPC_BL_ABS(dest)	EMIT(PPC_INST_BL |			      \
 				     (((dest) - (unsigned long)(image + ctx->idx)) & 0x03fffffc))
-- 
2.31.1

