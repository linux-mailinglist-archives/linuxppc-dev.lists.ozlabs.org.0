Return-Path: <linuxppc-dev+bounces-4559-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 878489FF42B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jan 2025 14:43:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YNWJ86cb4z2yZN;
	Thu,  2 Jan 2025 00:43:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735739000;
	cv=none; b=MJHFTzdLnl7DMuRzElHTcU+uWlKkBOPQnQTpqfEPwmnRCHx31db5fWmcKvfhpkt5LhfmuhtUGTB73cDz5cwiklxhhPOuzH4huoBnTyAxBRWJeFw9oMdaajX6RpC29JV/jP6aOPN5oblm/DZWYiQX6CMEnN0vTF5PYZmu9uCuRICILNetViBTqF60EK+kmO7RL64CWTv6FAkJ4afFfoBSp7SmKkg3H3SmHVUBb4TXUGfXmcHtfk55wiQWSVoA22rULVo9iiGgmf9bhtT8i8jXSluRdVp1gQJRjVuL9rUTJAx6qWxjhpRJRNnEB9sv6HFhxa2Dpk3Fzk9HDb8akYiukg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735739000; c=relaxed/relaxed;
	bh=QTwMZK9tHEpKvxpxWhkz6l/fnL4hG+lOVbN/NZDYj3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SPyyMjU/9pzofAhcTPd6pxWyUj/TOdB2WG+UrzShnYmdwRw7AMnKfut69q9Mc5ZzxoWy7hjwE776BztUbWC6Dz1bm+6j9SSZnDM7LAoRqww8rRqP39xig8BX3HbanyG/Z/L39Kvv9C1m9iOlW/cspDI6PiMFy5VoCvDtdIwJdcETpV2TNpdvSY+BRB7xzkqwF2JdnLVdlkLKSRLrIa8bRflyrDP190H68YWLotMMC2dmxFu59iA5Yki00hZUCPiqIAtwVggB0FBxy81lVr58bvg+R/YkF32Qqp57rB9eav9NSt1eZTCKK+i6zfeYkVa2bhnvqbK/B0CxY2y+zzhrzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YpQN0mUm; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YpQN0mUm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YNWJ73XLCz2xfW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jan 2025 00:43:18 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 501Cu9X3031231;
	Wed, 1 Jan 2025 13:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=QTwMZK9tHEpKvxpxWhkz6l/fnL4hG+lOVbN/NZDYj
	3k=; b=YpQN0mUmRUZrk/3uksKB72UD8VkvuJbVZYiZy2cYSpFhkjjhfFq+zI0rR
	z8TeYrHLTmRBXd2jBYaUba01PB3o8+QJsxCeMJUaKjhjdYsrkpNLr5xG7rfmQnUr
	rTLs52oDizQTfgRe2kQLwPIVv2ZeEqm9vJH/wBTvHRY4Ld2Q57y2Ul8Fix321w7Y
	H5MdoYqhdp+P2YGEhGesxJTfR07IuS454AA2i2qDDvS5R7zWoynOEhXSy816/jfr
	sH9cP44tn/CgLQ538SJrzNavX9r3xP7hWn7uxgotpXIIWSmXul/VsXrn5Aad773x
	ljr1OhvJVzdeKYZ37CoUnKSCIe/ZA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43vtea9tx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jan 2025 13:43:05 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 501Dh4iH020895;
	Wed, 1 Jan 2025 13:43:04 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43vtea9tx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jan 2025 13:43:04 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 501D0fkB016708;
	Wed, 1 Jan 2025 13:43:03 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43tw5ke99p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jan 2025 13:43:03 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 501Dh0p719595700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jan 2025 13:43:00 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 05BB920043;
	Wed,  1 Jan 2025 13:43:00 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57D5B20040;
	Wed,  1 Jan 2025 13:42:57 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com.com (unknown [9.124.223.211])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jan 2025 13:42:57 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, maddy@linux.ibm.com
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arch/powerpc: Remove unused function icp_native_cause_ipi_rm()
Date: Wed,  1 Jan 2025 19:12:49 +0530
Message-ID: <20250101134251.436679-1-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZVXNgfh1WAdo0JFgsGJp-hragwmBQsqb
X-Proofpoint-GUID: nmTzXpG7tc0u8_MrbTvSXgHz2E8vs8EE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=509 clxscore=1015
 spamscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501010117
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove icp_native_cause_ipi_rm() as it has no callers since
commit 53af3ba2e819("KVM: PPC: Book3S HV: Allow guest exit path to have
MMU on")

Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
 arch/powerpc/include/asm/xics.h       |  1 -
 arch/powerpc/sysdev/xics/icp-native.c | 21 ---------------------
 2 files changed, 22 deletions(-)

diff --git a/arch/powerpc/include/asm/xics.h b/arch/powerpc/include/asm/xics.h
index 89090485bec1..60ef312dab05 100644
--- a/arch/powerpc/include/asm/xics.h
+++ b/arch/powerpc/include/asm/xics.h
@@ -31,7 +31,6 @@
 #ifdef CONFIG_PPC_ICP_NATIVE
 extern int icp_native_init(void);
 extern void icp_native_flush_interrupt(void);
-extern void icp_native_cause_ipi_rm(int cpu);
 #else
 static inline int icp_native_init(void) { return -ENODEV; }
 #endif
diff --git a/arch/powerpc/sysdev/xics/icp-native.c b/arch/powerpc/sysdev/xics/icp-native.c
index 700b67476a7d..4e89158a577c 100644
--- a/arch/powerpc/sysdev/xics/icp-native.c
+++ b/arch/powerpc/sysdev/xics/icp-native.c
@@ -145,27 +145,6 @@ static void icp_native_cause_ipi(int cpu)
 	icp_native_set_qirr(cpu, IPI_PRIORITY);
 }
 
-#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-void icp_native_cause_ipi_rm(int cpu)
-{
-	/*
-	 * Currently not used to send IPIs to another CPU
-	 * on the same core. Only caller is KVM real mode.
-	 * Need the physical address of the XICS to be
-	 * previously saved in kvm_hstate in the paca.
-	 */
-	void __iomem *xics_phys;
-
-	/*
-	 * Just like the cause_ipi functions, it is required to
-	 * include a full barrier before causing the IPI.
-	 */
-	xics_phys = paca_ptrs[cpu]->kvm_hstate.xics_phys;
-	mb();
-	__raw_rm_writeb(IPI_PRIORITY, xics_phys + XICS_MFRR);
-}
-#endif
-
 /*
  * Called when an interrupt is received on an off-line CPU to
  * clear the interrupt, so that the CPU can go back to nap mode.
-- 
2.47.0


