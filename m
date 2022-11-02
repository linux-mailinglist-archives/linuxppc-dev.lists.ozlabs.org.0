Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A5D6170D9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 23:49:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2hsf6yZbz3cP0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 09:49:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GWm/TErp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GWm/TErp;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2hnd12FRz2xb4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 09:46:12 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A2MAQSh006706;
	Wed, 2 Nov 2022 22:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=bieb/PIDvDQXM1EL3MGgXxLp9zt7PfB19qrMrd2640o=;
 b=GWm/TErproHeqOkAdV7UTTKIrKnfL+JezvT/ktngxNi1oAMeXhfJTQYyKLPmkt9eTYWN
 Y1Fu+7Q/yax1IDFSFvecVeHV/HtplAven3aRfYyjHsegxFbdLnWfyc/rWJsjHr88F9cl
 Kipy9RlRhsQIfyFmxE7gZBBDfLAZHbOyHpT/JUE+MuUMMNJjZcwOGSaqT9yskI8UVOqc
 8oeL1r8xfST4MkrojB3E7FEJSwXhvXB8Z2Flu5y9Gd1IU6RU+mdqVjqQh5v7qP2JrtM3
 PnA7++NmVdR96IpV8GhEDgG5O1sH/Pf1AXsaqIFKhoiRbyvzOAtNtEcOnklms3TvJ4Lt PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kkxvkvt5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 22:46:07 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A2Mjfwi007719;
	Wed, 2 Nov 2022 22:46:06 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kkxvkvt56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 22:46:06 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A2MZa8E007541;
	Wed, 2 Nov 2022 22:46:04 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma06ams.nl.ibm.com with ESMTP id 3kguehyppy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 22:46:04 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A2Mk25E61342082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Nov 2022 22:46:02 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72935A404D;
	Wed,  2 Nov 2022 22:46:02 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D23BA4053;
	Wed,  2 Nov 2022 22:46:02 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  2 Nov 2022 22:46:02 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E2F4B604BE;
	Thu,  3 Nov 2022 09:46:00 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/4] powerpc/64s: Sanitise user registers on interrupt in pseries
Date: Thu,  3 Nov 2022 09:45:28 +1100
Message-Id: <20221102224528.639894-4-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102224528.639894-1-rmclure@linux.ibm.com>
References: <20221102224528.639894-1-rmclure@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HNYHQHTU5GAzZwO_-DPj1UUaodLXpUtM
X-Proofpoint-GUID: ljTDvTOgYjMG1uP3RFqw6Bc8kQLNMUyY
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_15,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=528 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020149
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cause pseries platforms to default to zeroising all potentially user-defined
registers when entering the kernel by means of any interrupt source,
reducing user-influence of the kernel and the likelihood or producing
speculation gadgets. Interrupt sources include syscalls.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
Resubmitting patches as their own series after v6 partially merged:
Link: https://lore.kernel.org/all/166488988686.779920.13794870102696416283.b4-ty@ellerman.id.au/t/
Standalone series: new patch
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

