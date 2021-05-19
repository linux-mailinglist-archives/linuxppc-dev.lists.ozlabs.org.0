Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF28388BF7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 12:48:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlV3G184Vz3bw4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 20:48:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LTVi58QD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LTVi58QD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlV2J0dmfz2yXx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 20:47:51 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14JAYma5100300; Wed, 19 May 2021 06:47:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=mMnj1RQOM8E4H/EZznLOa7KieYPntgSbpmiVlC2yupE=;
 b=LTVi58QD2gwSgN86ZF+lHsgiMO3rgG/lMJQHrBOpD0dw6g66h/wiwyrlPjTXulm51Ht5
 jHyEZsNNr3vPx4/v9unEzZaIR7FXA1gMKSZBe9rz36quIWTIvYS0MjmXLWFi/TlvBsb4
 nt+CyKlKVoGlX5nIjh5p0vPTD8G3AT5AWXpqXseyu/OCd9K+0bNZiZYI0ZwSrndXiiFX
 tHKnuQo11I8muRtuHS6rMIITNxQQPwW8vJCH2Gy+V2qH2yHFUogtXIXNbKK3c3aYzAHV
 dTZZSNhukSvGNgsv1UIq5YwyyIpcBpJGfc0Ppd1Fs6lf92wBSZ7t7tkultOC4PcaYkKA SA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38n0c09md3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 06:47:42 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14JAYpZN100863;
 Wed, 19 May 2021 06:47:42 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38n0c09mcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 06:47:42 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14JATT1H030378;
 Wed, 19 May 2021 10:47:40 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 38j5x894dp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 May 2021 10:47:40 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 14JAlAvu28639558
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 10:47:10 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BF0EA4051;
 Wed, 19 May 2021 10:47:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06B65A404D;
 Wed, 19 May 2021 10:47:36 +0000 (GMT)
Received: from naverao1-tp.in.ibm.com (unknown [9.85.72.228])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 May 2021 10:47:35 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jordan Niethe <jniethe5@gmail.com>
Subject: [PATCH 1/5] powerpc/kprobes: Fix validation of prefixed instructions
 across page boundary
Date: Wed, 19 May 2021 16:17:17 +0530
Message-Id: <0df9a032a05576a2fa8e97d1b769af2ff0eafbd6.1621416666.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1621416666.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1621416666.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MgoHm0ts3erciDYio2PRu6IsVX1LXyQH
X-Proofpoint-ORIG-GUID: EGKMBMudMYuBBdv-_o6gD5n1DVG90Rr9
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-19_04:2021-05-19,
 2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105190072
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When checking if the probed instruction is the suffix of a prefixed
instruction, we access the instruction at the previous word. If the
probed instruction is the very first word of a module, we can end up
trying to access an invalid page. Fix this by skipping the check for all
instructions at the beginning of a page. Prefixed instructions cannot
cross a 64-byte boundary and as such, preventing probing on such
instructions is not worthwhile.

Cc: stable@vger.kernel.org # v5.8+
Fixes: b4657f7650babc ("powerpc/kprobes: Don't allow breakpoints on suffixes")
Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/kprobes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 01ab2163659e4b..f611d9eb3562d7 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -108,7 +108,6 @@ int arch_prepare_kprobe(struct kprobe *p)
 	int ret = 0;
 	struct kprobe *prev;
 	struct ppc_inst insn = ppc_inst_read((struct ppc_inst *)p->addr);
-	struct ppc_inst prefix = ppc_inst_read((struct ppc_inst *)(p->addr - 1));
 
 	if ((unsigned long)p->addr & 0x03) {
 		printk("Attempt to register kprobe at an unaligned address\n");
@@ -116,7 +115,8 @@ int arch_prepare_kprobe(struct kprobe *p)
 	} else if (IS_MTMSRD(insn) || IS_RFID(insn) || IS_RFI(insn)) {
 		printk("Cannot register a kprobe on rfi/rfid or mtmsr[d]\n");
 		ret = -EINVAL;
-	} else if (ppc_inst_prefixed(prefix)) {
+	} else if ((unsigned long)p->addr & ~PAGE_MASK &&
+			ppc_inst_prefixed(ppc_inst_read((struct ppc_inst *)(p->addr - 1)))) {
 		printk("Cannot register a kprobe on the second word of prefixed instruction\n");
 		ret = -EINVAL;
 	}
-- 
2.30.2

