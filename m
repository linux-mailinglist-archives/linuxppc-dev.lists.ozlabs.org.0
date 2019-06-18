Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB8749861
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 06:34:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SZxM00zrzDqSd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 14:34:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ravi.bangoria@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SZnR2NbMzDqVq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 14:27:55 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5I4RofC088309
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 00:27:52 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t6r0j9phg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 00:27:52 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Tue, 18 Jun 2019 05:27:49 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 18 Jun 2019 05:27:46 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5I4RjFr10682474
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jun 2019 04:27:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D55C11C058;
 Tue, 18 Jun 2019 04:27:45 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5226A11C04A;
 Tue, 18 Jun 2019 04:27:42 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.63.86])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 18 Jun 2019 04:27:42 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 2/5] Powerpc/hw-breakpoint: Refactor hw_breakpoint_arch_parse()
Date: Tue, 18 Jun 2019 09:57:29 +0530
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618042732.5582-1-ravi.bangoria@linux.ibm.com>
References: <20190618042732.5582-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061804-0028-0000-0000-0000037B2FD1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061804-0029-0000-0000-0000243B3757
Message-Id: <20190618042732.5582-3-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906180035
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mikey@neuling.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, paulus@samba.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move feature availability check at the start of the function.
Rearrange comment to it's associated code. Use hw->address and
hw->len in the 512 bytes boundary check(to write if statement
in a single line). Add spacing between code blocks.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/kernel/hw_breakpoint.c | 34 +++++++++++++++--------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 1908e4fcc132..36bcf705df65 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -133,10 +133,13 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
 			     const struct perf_event_attr *attr,
 			     struct arch_hw_breakpoint *hw)
 {
-	int ret = -EINVAL, length_max;
+	int length_max;
+
+	if (!ppc_breakpoint_available())
+		return -ENODEV;
 
 	if (!bp)
-		return ret;
+		return -EINVAL;
 
 	hw->type = HW_BRK_TYPE_TRANSLATE;
 	if (attr->bp_type & HW_BREAKPOINT_R)
@@ -145,34 +148,33 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
 		hw->type |= HW_BRK_TYPE_WRITE;
 	if (hw->type == HW_BRK_TYPE_TRANSLATE)
 		/* must set alteast read or write */
-		return ret;
+		return -EINVAL;
+
 	if (!attr->exclude_user)
 		hw->type |= HW_BRK_TYPE_USER;
 	if (!attr->exclude_kernel)
 		hw->type |= HW_BRK_TYPE_KERNEL;
 	if (!attr->exclude_hv)
 		hw->type |= HW_BRK_TYPE_HYP;
+
 	hw->address = attr->bp_addr;
 	hw->len = attr->bp_len;
 
-	/*
-	 * Since breakpoint length can be a maximum of HW_BREAKPOINT_LEN(8)
-	 * and breakpoint addresses are aligned to nearest double-word
-	 * HW_BREAKPOINT_ALIGN by rounding off to the lower address, the
-	 * 'symbolsize' should satisfy the check below.
-	 */
-	if (!ppc_breakpoint_available())
-		return -ENODEV;
 	length_max = 8; /* DABR */
 	if (dawr_enabled()) {
 		length_max = 512 ; /* 64 doublewords */
-		/* DAWR region can't cross 512 boundary */
-		if ((attr->bp_addr >> 9) !=
-		    ((attr->bp_addr + attr->bp_len - 1) >> 9))
+		/* DAWR region can't cross 512 bytes boundary */
+		if ((hw->address >> 9) != ((hw->address + hw->len - 1) >> 9))
 			return -EINVAL;
 	}
-	if (hw->len >
-	    (length_max - (hw->address & HW_BREAKPOINT_ALIGN)))
+
+	/*
+	 * Since breakpoint length can be a maximum of length_max and
+	 * breakpoint addresses are aligned to nearest double-word
+	 * HW_BREAKPOINT_ALIGN by rounding off to the lower address,
+	 * the 'symbolsize' should satisfy the check below.
+	 */
+	if (hw->len > (length_max - (hw->address & HW_BREAKPOINT_ALIGN)))
 		return -EINVAL;
 	return 0;
 }
-- 
2.20.1

