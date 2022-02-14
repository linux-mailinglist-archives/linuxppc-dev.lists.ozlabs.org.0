Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F43D4B4CA6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 11:51:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jy1Ht3l7gz3f5j
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 21:51:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=coBkViJH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=coBkViJH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jy15k0X12z3cMd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 21:43:05 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21EACXiA019451; 
 Mon, 14 Feb 2022 10:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MVQHIIBpzH6OZ8xpkM6q+31SYym7l8sm9Kl7rsQBP7U=;
 b=coBkViJHQqQHXJC8GVFAl9dLV/GTXEah+6npMCHbCg96E3U8g9QNTZzwKZJpE8FlZQMM
 4TW3A6yVpVWphtTNU9CG3im5TrDYhd+HI7pgsDYjRgG6FyGoALzGCmuii6+tzbZrysVf
 JyAy5c5PDs0j6GnyUmlnTWUFwxrrLOCtdfULgbbWlaBjKYucjiwE7Y62VSbvDJs5W5l7
 JYhqzSOIFgi+VposOIozepA9x6CT7SXSgeFZGyT7mMgbxWEhDhwc+ECi55g1YD4ZshEl
 WPMkMsUd+viQsD0MjXjkQtK/dNa/xU3u8P6AqHiSqrIsf1A4SB2DPOdpmU5WX8EBIfFK vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e79fvnjae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:48 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21E9tmCO020614;
 Mon, 14 Feb 2022 10:42:48 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e79fvnj9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:48 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21EAXU9h012170;
 Mon, 14 Feb 2022 10:42:45 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64h9m0xn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:45 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21EAgg7M44237208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 10:42:42 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F33AAE04D;
 Mon, 14 Feb 2022 10:42:42 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03476AE05A;
 Mon, 14 Feb 2022 10:42:40 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.124.167])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Feb 2022 10:42:39 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH powerpc/next 13/17] powerpc/bpf: Cleanup bpf_jit.h
Date: Mon, 14 Feb 2022 16:11:47 +0530
Message-Id: <58f5b66b2f8546bbbee620f62103a8e97a63eb7c.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KeL6gA27nvDW6lUMnFk9fih_eR2R2L_p
X-Proofpoint-ORIG-GUID: RZifukq6SG65Aqu1bNHMqyII-4_zsAfP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_02,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 mlxlogscore=962
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140058
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Yauheni Kaliuta <yauheni.kaliuta@redhat.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

- PPC_EX32() is only used by ppc32 JIT. Move it to bpf_jit_comp32.c
- PPC_LI64() is only valid in ppc64. #ifdef it
- PPC_FUNC_ADDR() is not used anymore. Remove it.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/net/bpf_jit.h        | 10 +---------
 arch/powerpc/net/bpf_jit_comp32.c |  2 ++
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 0832235a274983..d9bdc9df2e48ed 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -59,10 +59,7 @@
 				EMIT(PPC_RAW_ORI(d, d, IMM_L(i)));	      \
 		} } while(0)
 
-#ifdef CONFIG_PPC32
-#define PPC_EX32(r, i)		EMIT(PPC_RAW_LI((r), (i) < 0 ? -1 : 0))
-#endif
-
+#ifdef CONFIG_PPC64
 #define PPC_LI64(d, i)		do {					      \
 		if ((long)(i) >= -2147483648 &&				      \
 				(long)(i) < 2147483648)			      \
@@ -85,11 +82,6 @@
 				EMIT(PPC_RAW_ORI(d, d, (uintptr_t)(i) &       \
 							0xffff));             \
 		} } while (0)
-
-#ifdef CONFIG_PPC64
-#define PPC_FUNC_ADDR(d,i) do { PPC_LI64(d, i); } while(0)
-#else
-#define PPC_FUNC_ADDR(d,i) do { PPC_LI32(d, i); } while(0)
 #endif
 
 /*
diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index cf66b25ed7c865..063e3a1be9270d 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -36,6 +36,8 @@
 /* BPF register usage */
 #define TMP_REG	(MAX_BPF_JIT_REG + 0)
 
+#define PPC_EX32(r, i)		EMIT(PPC_RAW_LI((r), (i) < 0 ? -1 : 0))
+
 /* BPF to ppc register mappings */
 const int b2p[MAX_BPF_JIT_REG + 1] = {
 	/* function return value */
-- 
2.35.1

