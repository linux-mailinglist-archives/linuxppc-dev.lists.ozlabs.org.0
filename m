Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDD630D376
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 07:42:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVsYX2QnBzDyvG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 17:42:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RWu1Zkso; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVsTZ2CKPzDrcG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 17:38:57 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1136WkUC027687; Wed, 3 Feb 2021 01:38:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=bRF2jf1r3CqGNtnH8nHfcQgsNuwdlYtPMf4+fHAYJmQ=;
 b=RWu1ZksoHSV2YnlWsq/AdNLS5f81rB/LwLJS1wq5KbCgViEU/ZKYsPVo/NMomPeu3zXg
 AseCUHm2ZstbUS7B1Txmig+uxoNPIRA3kp1WBM1jz9lFCDGy+CsZ2TxPhq+4rjNFOx4H
 elN17ySHKJUHTv6udnO/gL6dGEPTbHhJJjkulPVgyqZEoBORGzozruu2usFRM78fEHIr
 m1uY/1Obl5zZmRxWU4o8nNZ4/2HLR1MiGOw2pIQnUmzB/ob1LwV11QQYcwZtFHIile+x
 ZcXsob8bCQqcmROfC/+dmJRC3iJEbvdCV8fMQYc8tu1ESLjL3Kb07fLvsA29D/hEzhnO tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36fnyq1055-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 01:38:53 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1136Wi6v027528;
 Wed, 3 Feb 2021 01:38:52 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36fnyq1044-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 01:38:52 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1136WrHG021501;
 Wed, 3 Feb 2021 06:38:50 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 36evvf17hu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Feb 2021 06:38:50 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1136ccwW33096054
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Feb 2021 06:38:38 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D9E352052;
 Wed,  3 Feb 2021 06:38:47 +0000 (GMT)
Received: from fir03.in.ibm.com (unknown [9.121.59.65])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id DAA4752054;
 Wed,  3 Feb 2021 06:38:45 +0000 (GMT)
From: Sandipan Das <sandipan@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 3/3] powerpc: sstep: Fix darn emulation
Date: Wed,  3 Feb 2021 12:08:41 +0530
Message-Id: <20210203063841.431063-3-sandipan@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203063841.431063-1-sandipan@linux.ibm.com>
References: <20210203063841.431063-1-sandipan@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-03_01:2021-02-02,
 2021-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102030035
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
Cc: ravi.bangoria@linux.ibm.com, ananth@linux.ibm.com, jniethe5@gmail.com,
 paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 8813ff49607e ("powerpc/sstep: Check instruction
validity against ISA version before emulation") introduced
a proper way to skip unknown instructions. This makes sure
that the same is used for the darn instruction when the
range selection bits have a reserved value.

Fixes: a23987ef267a ("powerpc: sstep: Add support for darn instruction")
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
 arch/powerpc/lib/sstep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 230d1ae77ef5..9ea6822f4c55 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1916,7 +1916,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 				goto compute_done;
 			}
 
-			return -1;
+			goto unknown_opcode;
 #ifdef __powerpc64__
 		case 777:	/* modsd */
 			if (!cpu_has_feature(CPU_FTR_ARCH_300))
-- 
2.25.1

