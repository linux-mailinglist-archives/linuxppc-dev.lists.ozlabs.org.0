Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 087121B5FE2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 17:50:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497MGP6kSZzDqqD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 01:50:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497LPm18hWzDqCb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 01:12:11 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03NF3SG9146790
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 11:12:08 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gmv24c2p-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 11:12:08 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Thu, 23 Apr 2020 16:11:41 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 23 Apr 2020 16:11:39 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03NF9Xe964422080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Apr 2020 15:09:33 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55E33AE051;
 Thu, 23 Apr 2020 15:09:33 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5CD7AE056;
 Thu, 23 Apr 2020 15:09:31 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.73.158])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 23 Apr 2020 15:09:31 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/3] powerpc: Properly return error code from
 do_patch_instruction()
Date: Thu, 23 Apr 2020 20:39:02 +0530
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20042315-0012-0000-0000-000003A9EEFF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042315-0013-0000-0000-000021E743D0
Message-Id: <b1dbbb34a389a6f59eb6c99102d94c0070ddaf98.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_10:2020-04-23,
 2020-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=1 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=646
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004230117
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
Cc: Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With STRICT_KERNEL_RWX, we are currently ignoring return value from
__patch_instruction() in do_patch_instruction(), resulting in the error
not being propagated back. Fix the same.

Fixes: 37bc3e5fd764f ("powerpc/lib/code-patching: Use alternate map for patch_instruction()")
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/lib/code-patching.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 3345f039a876..5c713a6c0bd8 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -138,7 +138,7 @@ static inline int unmap_patch_area(unsigned long addr)
 
 static int do_patch_instruction(unsigned int *addr, unsigned int instr)
 {
-	int err;
+	int err, rc = 0;
 	unsigned int *patch_addr = NULL;
 	unsigned long flags;
 	unsigned long text_poke_addr;
@@ -163,7 +163,7 @@ static int do_patch_instruction(unsigned int *addr, unsigned int instr)
 	patch_addr = (unsigned int *)(text_poke_addr) +
 			((kaddr & ~PAGE_MASK) / sizeof(unsigned int));
 
-	__patch_instruction(addr, instr, patch_addr);
+	rc = __patch_instruction(addr, instr, patch_addr);
 
 	err = unmap_patch_area(text_poke_addr);
 	if (err)
@@ -172,7 +172,7 @@ static int do_patch_instruction(unsigned int *addr, unsigned int instr)
 out:
 	local_irq_restore(flags);
 
-	return err;
+	return rc ? rc : err;
 }
 #else /* !CONFIG_STRICT_KERNEL_RWX */
 
-- 
2.25.1

