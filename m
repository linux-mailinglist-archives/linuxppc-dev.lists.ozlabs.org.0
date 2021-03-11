Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63540336EA7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 10:17:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dx3HZ35ZNz3d6b
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 20:17:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QGLxfQTi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QGLxfQTi; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dx3H574rQz30Qn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 20:16:49 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12B94BJB079599; Thu, 11 Mar 2021 04:16:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=NTUxSj/ZvJD7UMviL6RQgq5D7zSxRgUaGUGx61pbYPU=;
 b=QGLxfQTiWPU2O95O6mSoU+nfwP6cdNVk59eONYnrKRZl8jvFYGRij8qzFP3FSgNY/ICd
 fhZXxrYm+TxXQC5Ttok7/AI9OMB/kFl+ZVys/slDmaLzTJ8Swy2ohDN/xhTQ+ewSWE0N
 UUv/AEwE0rG/pJCDNQsnR03BPKKLSKpHXDFNWFnCNYQrsxAuWSOx8MaT/t+rqJpRzNrk
 ed48rCB8pve3E5iH5/rg7ud3gXmbJERx5pWsugdTZv1u2uCmDDq0vhYI1pmqXurZcd5p
 dUYn46aT3cNX7M3k0Q0/5883qX+lC3Lxl7nqerHbLLNcN2Hm57+xtLZZprMO066nQx2u sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3774m3gskr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 04:16:05 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12B95OHI085293;
 Thu, 11 Mar 2021 04:16:04 -0500
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3774m3gsje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 04:16:04 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12B9EQSq005375;
 Thu, 11 Mar 2021 09:16:02 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 376agr0vje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 09:16:02 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12B9Fx1337224818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Mar 2021 09:15:59 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C0654205C;
 Thu, 11 Mar 2021 09:15:59 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6431942049;
 Thu, 11 Mar 2021 09:15:56 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.41.237])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Mar 2021 09:15:56 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v5] powerpc/uprobes: Validation for prefixed instruction
Date: Thu, 11 Mar 2021 14:45:38 +0530
Message-Id: <20210311091538.368590-1-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_04:2021-03-10,
 2021-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103110049
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, oleg@redhat.com,
 rostedt@goodmis.org, linux-kernel@vger.kernel.org, paulus@samba.org,
 sandipan@linux.ibm.com, naveen.n.rao@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As per ISA 3.1, prefixed instruction should not cross 64-byte
boundary. So don't allow Uprobe on such prefixed instruction.

There are two ways probed instruction is changed in mapped pages.
First, when Uprobe is activated, it searches for all the relevant
pages and replace instruction in them. In this case, if that probe
is on the 64-byte unaligned prefixed instruction, error out
directly. Second, when Uprobe is already active and user maps a
relevant page via mmap(), instruction is replaced via mmap() code
path. But because Uprobe is invalid, entire mmap() operation can
not be stopped. In this case just print an error and continue.

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Acked-by: Sandipan Das <sandipan@linux.ibm.com>
---
v4: https://lore.kernel.org/r/20210305115433.140769-1-ravi.bangoria@linux.ibm.com
v4->v5:
  - Replace SZ_ macros with numbers

 arch/powerpc/kernel/uprobes.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
index e8a63713e655..186f69b11e94 100644
--- a/arch/powerpc/kernel/uprobes.c
+++ b/arch/powerpc/kernel/uprobes.c
@@ -41,6 +41,13 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe,
 	if (addr & 0x03)
 		return -EINVAL;
 
+	if (cpu_has_feature(CPU_FTR_ARCH_31) &&
+	    ppc_inst_prefixed(auprobe->insn) &&
+	    (addr & 0x3f) == 60) {
+		pr_info_ratelimited("Cannot register a uprobe on 64 byte unaligned prefixed instruction\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
2.27.0

