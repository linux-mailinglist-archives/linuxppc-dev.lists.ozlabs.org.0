Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EB461EB06
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 07:31:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5LwG1kNkz3dtl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 17:31:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S2BjCsgS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S2BjCsgS;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5LsB5VPCz2yR9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 17:28:30 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A75EK6Q016372;
	Mon, 7 Nov 2022 06:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=AIc9egKxX+s/698vz4t1HNeu4Z1a/UYslGQaNY/bNeg=;
 b=S2BjCsgSTSLCVfp2kWCkojE+rvPNBIM9clT1vuo5VaC1HzUSd1pquKchtjCrOnryqVJw
 Q9x+W0M46yPn4Mdpq/th4yd4Y8yiOJ83V1NR1NAUc9R8MPcz0EnxMkYbAsxaI9JZxW5t
 766Ulwtn4EJXVr3bwb54vHxHSX09FISMWFW39yuAyZ4QsCg38rC5FVOQBtrWc1fz0y6u
 e39mdKBmPEJ/ABsl+1ml7SH9LZAIa8yGMfMbAoka3jD1+qsklsVGsrZei/SoeI30xSv6
 cHDEOsVF9CyVKZctsufwTViZB7qZWGjy/u4vxcUSaEMKp8BpW1ZUbMjv3GyxRYd6jl6U cg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp14wr87e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 06:28:26 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A76LQvs032671;
	Mon, 7 Nov 2022 06:28:24 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06fra.de.ibm.com with ESMTP id 3kngq8hggk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 06:28:24 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A76SLhp66847024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Nov 2022 06:28:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9CB24203F;
	Mon,  7 Nov 2022 06:28:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 64B1242042;
	Mon,  7 Nov 2022 06:28:21 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  7 Nov 2022 06:28:21 +0000 (GMT)
Received: from civic.. (unknown [9.177.26.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2587860371;
	Mon,  7 Nov 2022 17:28:17 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/4] powerpc/64s: Sanitise user registers on interrupt in pseries
Date: Mon,  7 Nov 2022 14:32:02 +1100
Message-Id: <20221107033202.1375238-4-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221107033202.1375238-1-rmclure@linux.ibm.com>
References: <20221107033202.1375238-1-rmclure@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UswsbqsOYqW-X3p1mAST-DEUMLYhNpDl
X-Proofpoint-GUID: UswsbqsOYqW-X3p1mAST-DEUMLYhNpDl
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-06_16,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=552 mlxscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211070051
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
Cc: Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cause pseries platforms to default to zeroising all potentially user-defined
registers when entering the kernel by means of any interrupt source,
reducing user-influence of the kernel and the likelihood or producing
speculation gadgets.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
Resubmitting patches as their own series after v6 partially merged:
Link: https://lore.kernel.org/all/166488988686.779920.13794870102696416283.b4-ty@ellerman.id.au/t/
---
 arch/powerpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9d3d20c6f365..2eb328b25e49 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -532,7 +532,7 @@ config HOTPLUG_CPU
 config INTERRUPT_SANITIZE_REGISTERS
 	bool "Clear gprs on interrupt arrival"
 	depends on PPC64 && ARCH_HAS_SYSCALL_WRAPPER
-	default PPC_BOOK3E_64
+	default PPC_BOOK3E_64 || PPC_PSERIES
 	help
 	  Reduce the influence of user register state on interrupt handlers and
 	  syscalls through clearing user state from registers before handling
-- 
2.34.1

