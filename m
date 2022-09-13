Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 267DD5B68D9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 09:43:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRb7W75NPz3f2J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 17:43:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fJ1ImUft;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=disgoel@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fJ1ImUft;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRb3y2bmCz308w
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 17:40:46 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28D7NiXQ019511;
	Tue, 13 Sep 2022 07:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eEeyUffwwehPCsnjNeHUci7b84IhV5vDTgZe4OJYtNQ=;
 b=fJ1ImUftu39ugf+8QbV1mUaq9Z8QderErotRCUPqW3UrpM6JmD+GSBIy9QJ4z2/GLU+A
 JRg5nSyjQqTi9HhzbvZ/p1/rsniTwbY6RtBYOgv5VXZnnxatsA6FUJrqiDakwzAGnD2E
 7o02JxuptDH57cGjqVn6K1m/rjnxMW/pJOUH0WWKhG1JugtUQdGqOtbkwF4ps7kA3gBW
 T43NJ4O/Kz6dYM0n0KPZXJ5YIQFgpyeFGpcrrgMh9kpv+Rb0isJDu8gceoEpJKVYxDGh
 jJwuAdBooDEsZcxOTVh3RXej2bsv7Ur9xjh959jZsShbclZFowmd8vk62kOVwxZcvr6w 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjnefgegd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 07:40:42 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28D7aD2d009612;
	Tue, 13 Sep 2022 07:40:41 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjnefgef7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 07:40:41 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28D7aeOk028737;
	Tue, 13 Sep 2022 07:40:39 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04fra.de.ibm.com with ESMTP id 3jgj78tht0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 07:40:38 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28D7eZ2l31719910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Sep 2022 07:40:35 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCEBFAE045;
	Tue, 13 Sep 2022 07:40:35 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D872AE04D;
	Tue, 13 Sep 2022 07:40:34 +0000 (GMT)
Received: from disgoel-ibm-com.in.ibm.com (unknown [9.199.154.114])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 13 Sep 2022 07:40:34 +0000 (GMT)
From: Disha Goel <disgoel@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 4/4] powerpc/kvm: Remove unused references for MMCR3/SIER2/SIER3 registers
Date: Tue, 13 Sep 2022 13:10:25 +0530
Message-Id: <20220913074025.132160-5-disgoel@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220913074025.132160-1-disgoel@linux.vnet.ibm.com>
References: <20220913074025.132160-1-disgoel@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IPyQRK1ZVvD-b6AfBWUls9Wh49LnC7T6
X-Proofpoint-GUID: iA06lr6byQzivYhG7nNQSOu3GRvk_1C7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_02,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=794
 impostorscore=0 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130033
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, npiggin@gmail.com, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Kajol Jain <kjain@linux.ibm.com>

Commit 57dc0eed73ca ("KVM: PPC: Book3S HV P9: Implement PMU save/restore
in C") removed the PMU save/restore functions from assembly code and
implemented these functions in C, for power9 and later platforms.

After the code refactoring, Performance Monitoring Unit (PMU) registers
became part of "p9_host_os_sprs" structure, and now this structure is
used to save/restore pmu host registers for power9 and later platfroms.
But we still have old unused registers references, patch removes unused
HSTATE/host_mmcr references for Monitor Mode Control Register 3 (MMCR3)/
Sampled Instruction Event Register 2 (SIER2)/ SIER3 registers from
"struct kvmppc_host_state".

Fixes: 57dc0eed73ca ("KVM: PPC: Book3S HV P9: Implement PMU save/restore in C")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/include/asm/kvm_book3s_asm.h | 2 +-
 arch/powerpc/kernel/asm-offsets.c         | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_asm.h b/arch/powerpc/include/asm/kvm_book3s_asm.h
index c8882d9b86c2..a36797938620 100644
--- a/arch/powerpc/include/asm/kvm_book3s_asm.h
+++ b/arch/powerpc/include/asm/kvm_book3s_asm.h
@@ -105,7 +105,7 @@ struct kvmppc_host_state {
 	void __iomem *xive_tima_virt;
 	u32 saved_xirr;
 	u64 dabr;
-	u64 host_mmcr[10];	/* MMCR 0,1,A, SIAR, SDAR, MMCR2, SIER, MMCR3, SIER2/3 */
+	u64 host_mmcr[7];	/* MMCR 0,1,A, SIAR, SDAR, MMCR2, SIER */
 	u32 host_pmc[8];
 	u64 host_purr;
 	u64 host_spurr;
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 90235288cc1a..95744e7c056d 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -583,9 +583,6 @@ int main(void)
 	HSTATE_FIELD(HSTATE_SDAR, host_mmcr[4]);
 	HSTATE_FIELD(HSTATE_MMCR2, host_mmcr[5]);
 	HSTATE_FIELD(HSTATE_SIER, host_mmcr[6]);
-	HSTATE_FIELD(HSTATE_MMCR3, host_mmcr[7]);
-	HSTATE_FIELD(HSTATE_SIER2, host_mmcr[8]);
-	HSTATE_FIELD(HSTATE_SIER3, host_mmcr[9]);
 	HSTATE_FIELD(HSTATE_PMC1, host_pmc[0]);
 	HSTATE_FIELD(HSTATE_PMC2, host_pmc[1]);
 	HSTATE_FIELD(HSTATE_PMC3, host_pmc[2]);
-- 
2.31.1

