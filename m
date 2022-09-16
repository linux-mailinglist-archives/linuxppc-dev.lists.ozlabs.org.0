Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C08F55BABDD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 12:59:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTWLG3tq2z3chZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 20:59:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kh2c965C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=disgoel@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kh2c965C;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTWJ94NKrz3bqj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 20:58:01 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28GAgLen025066;
	Fri, 16 Sep 2022 10:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tYv+WREnp1z57kNdSocB7X3APMfB3NmZHyjCPvszAzE=;
 b=kh2c965C39Onh95zRnSUWga7Q/iCVUZQT7acf8X9zo04I7YbpbNKa45XK1liMXntVxAZ
 CJLfchTMeovXv02HCIjZBAS0igloHrJw1y0/gM5QItzYk7V1QU5tQ9HEiOkzPjD/Fald
 1FL8k0V6CjRh9YkuA0UexUBJ6goAnjs58MKR9hR9JM/qS6EUI3sCSEetvlzumK4PtTjQ
 YpgDjGv1gYlB7h9EEnqe86dqliaGb0FRl4vG007dfepANQgUOq+X1dSdqrcf8wcYujd6
 0rk7Kitkm1p7XsjY0hSwJkvNLR8p9Nw45NOXGeISNVY8KlpJmK6DhB8tLUTLkrsO1VM8 Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmqm9gdyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 10:57:57 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28GAhA1R027239;
	Fri, 16 Sep 2022 10:57:57 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmqm9gdx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 10:57:56 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28GArY52003225;
	Fri, 16 Sep 2022 10:57:54 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06fra.de.ibm.com with ESMTP id 3jm91f0n4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 10:57:54 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28GAvpem36831612
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 10:57:51 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 58FA8A4057;
	Fri, 16 Sep 2022 10:57:51 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFF93A404D;
	Fri, 16 Sep 2022 10:57:47 +0000 (GMT)
Received: from disgoel-ibm-com.ibm.com (unknown [9.43.57.26])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 10:57:47 +0000 (GMT)
From: Disha Goel <disgoel@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 2/2] powerpc/kvm: Remove unused references for MMCR3/SIER2/SIER3 registers
Date: Fri, 16 Sep 2022 16:27:36 +0530
Message-Id: <20220916105736.268153-3-disgoel@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220916105736.268153-1-disgoel@linux.vnet.ibm.com>
References: <20220916105736.268153-1-disgoel@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5gLzFQv6Ef0YE872Tt8lUPlvwS-prcuB
X-Proofpoint-ORIG-GUID: Y8j6uPJU7aPfoichP-dpWapgAcFr2cke
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_05,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=736 mlxscore=0 impostorscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160077
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

From: Kajol Jain" <kjain@linux.ibm.com>

Commit 57dc0eed73ca ("KVM: PPC: Book3S HV P9: Implement PMU save/restore
in C") removed the PMU save/restore functions from assembly code and
implemented these functions in C, for power9 and later platforms.

After the code refactoring, Performance Monitoring Unit (PMU) registers
became part of "p9_host_os_sprs" structure and now this structure is
used to save/restore pmu host registers, for power9 and later platfroms.
But we still have old unused registers references. Patch removes unused
host_mmcr references for Monitor Mode Control Register 3 (MMCR3)/
Sampled Instruction Event Register 2 (SIER2)/ SIER3 registers from
"struct kvmppc_host_state".

Fixes: 57dc0eed73ca ("KVM: PPC: Book3S HV P9: Implement PMU save/restore in C")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/include/asm/kvm_book3s_asm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.31.1

