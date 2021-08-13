Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 573B53EB2AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 10:32:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmGy01zG3z3bW8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 18:32:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lBhiqAOy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lBhiqAOy; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmGwn51bcz3cM1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 18:31:05 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17D84jEN125659; Fri, 13 Aug 2021 04:31:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XvBlIv7Vb6X2WXxHL6xO46raW9E0vQuCM5TywFU+AV8=;
 b=lBhiqAOyftmtihkLmsReGQrBVk9/POBel1+FFE3qgR8Qzswpip24y376kzycfO5FccIO
 3OdN2YqM6xpPF3/grE7n3Hugp6zGcV4wTKdylsZ1E+k6y3SBc1VttmjCpgFKWZjBxL3V
 arYUbN4UFA0iPLuJGV9+ngKLXkRYVw0N77jSQIKoN3kux2vMRTKN1X0Bqs57S43UUKvv
 u/URDaqkF2DcLc5Zr/rJMwkM6VpKvrxQA1Mhrtx4ZMaUEzG3d0LElOWBNMi4NwS6z2Zk
 ++DppLOrNy6xJVlm58wjLX9Hmug8JnUmZPzoAKWaDPIflumEIo6sCwMcnhq3dtV6UxaF Dg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3achs806g7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Aug 2021 04:31:00 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17D8Sxoi015026;
 Fri, 13 Aug 2021 08:30:58 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 3abaq4e182-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Aug 2021 08:30:58 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17D8Rd5327984352
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Aug 2021 08:27:39 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB12211C082;
 Fri, 13 Aug 2021 08:30:46 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4757E11C06E;
 Fri, 13 Aug 2021 08:30:44 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.43.137])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 13 Aug 2021 08:30:43 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/perf: Return regs->nip as instruction pointer
 value when SIAR is 0
Date: Fri, 13 Aug 2021 14:00:37 +0530
Message-Id: <20210813083037.431299-2-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210813083037.431299-1-kjain@linux.ibm.com>
References: <20210813083037.431299-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ilU-4avW-Lz1e3iql2heiMnyU77XzFr-
X-Proofpoint-ORIG-GUID: ilU-4avW-Lz1e3iql2heiMnyU77XzFr-
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-13_01:2021-08-12,
 2021-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 bulkscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108130048
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com,
 rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Incase of random sampling, there can be scenarios where SIAR is not
latching sample address and results in 0 value. Since current code
directly returning the siar value, we could see multiple instruction
pointer values as 0 in perf report.
Patch resolves this issue by adding a ternary condition to return
regs->nip incase SIAR is 0.

Fixes: 75382aa72f06 ("powerpc/perf: Move code to select SIAR or pt_regs
into perf_read_regs")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/core-book3s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 1b464aad29c4..aeecaaf6810f 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2260,7 +2260,7 @@ unsigned long perf_instruction_pointer(struct pt_regs *regs)
 		else
 			return regs->nip;
 	} else if (use_siar && siar_valid(regs))
-		return siar + perf_ip_adjust(regs);
+		return siar ? siar + perf_ip_adjust(regs) : regs->nip;
 	else if (use_siar)
 		return 0;		// no valid instruction pointer
 	else
-- 
2.26.2

