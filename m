Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7BE2C38D6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 06:46:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgqdL3jr9zDqVj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 16:46:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ddBcw0zR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgq012dXzzDqVs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 16:17:37 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AP52oNS017833; Wed, 25 Nov 2020 00:17:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1pYBOxxH1zVVh4DobkxSlM96fpbAoR+s2jRgEJ+6yqA=;
 b=ddBcw0zRbWg9inUeZNnC89LmoSpTxq4VV5/UC2Hrq68itwbIOnXdycoWEnGLOToMo7KU
 B/cY63Vo5X+hMaCtloLI8NhNxUAWm5Ux/R0lSLUdvhsZgBQnvt5KviwrL1y2M2gGiOfr
 mEFffgTsNUyKwKCJUlQEp7AcXNIrDr3J3sYb9iZLli34s1vJFztSU7TgrwK/q0/OAapV
 PwqkUNlFaFmGU2pyLyJxl6Dk8Re9qTwHYUJC7ImpYgGEUygQKdvWuAO+a9Q0DOlAKDya
 bNEbMkxBDx1RTcJzc9+EjEGnT0L9nBH/sWriLJNQ/0DLJwIRCOq3JFJUfyt+9iC3HFFW gQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 350uq3kks4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 00:17:32 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AP5DXcl002660;
 Wed, 25 Nov 2020 05:17:31 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01dal.us.ibm.com with ESMTP id 34xth9cbd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 05:17:31 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AP5HU4q37814770
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 05:17:30 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30298124055;
 Wed, 25 Nov 2020 05:17:30 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 697AE124052;
 Wed, 25 Nov 2020 05:17:27 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.77.195.3])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 05:17:27 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v6 15/22] powerpc/book3s64/kuap: Restrict access to userspace
 based on userspace AMR
Date: Wed, 25 Nov 2020 10:46:27 +0530
Message-Id: <20201125051634.509286-16-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_02:2020-11-25,
 2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011250030
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Sandipan Das <sandipan@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If an application has configured address protection such that read/write is
denied using pkey even the kernel should receive a FAULT on accessing the same.

This patch use user AMR value stored in pt_regs.amr to achieve the same.

Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/kup.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 47270596215b..4a3d0d601745 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -312,14 +312,20 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 static __always_inline void allow_user_access(void __user *to, const void __user *from,
 					      unsigned long size, unsigned long dir)
 {
+	unsigned long thread_amr = 0;
+
 	// This is written so we can resolve to a single case at build time
 	BUILD_BUG_ON(!__builtin_constant_p(dir));
+
+	if (mmu_has_feature(MMU_FTR_PKEY))
+		thread_amr = current_thread_amr();
+
 	if (dir == KUAP_READ)
-		set_kuap(AMR_KUAP_BLOCK_WRITE);
+		set_kuap(thread_amr | AMR_KUAP_BLOCK_WRITE);
 	else if (dir == KUAP_WRITE)
-		set_kuap(AMR_KUAP_BLOCK_READ);
+		set_kuap(thread_amr | AMR_KUAP_BLOCK_READ);
 	else if (dir == KUAP_READ_WRITE)
-		set_kuap(0);
+		set_kuap(thread_amr);
 	else
 		BUILD_BUG();
 }
-- 
2.28.0

