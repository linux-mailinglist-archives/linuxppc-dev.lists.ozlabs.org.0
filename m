Return-Path: <linuxppc-dev+bounces-6100-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1DDA31120
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 17:21:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsmsM4Zlqz3bV2;
	Wed, 12 Feb 2025 03:21:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739290871;
	cv=none; b=XtbqIgKKwxkUeGZ0/XP9luhq23FhZcb5K1aW91A3U4cRB3fABfziW8ov20YWgeXWx0RCVcIeHdhizFsrp/iPaCHcXPyk5XBKx2o+prRSh5QgOlExiVKjvIuSHEOytshWkvP7eyoc+XvYzkE8hlejuVy7blCVNlFv6nEwds+tG+FHZTvi2pRIe0lGQt+dfJphYj8TuEGI0kjh7Duo4RlzJr39bRw6HHpOjuO4UMORv7XTEuTcTHU08fctT4CU3u+jBl1FCa6rxPdOyjKpQYXDyfe0dTLKxg0k1nhlHifdMFKBJW2QLqMSZ9pkb8ejRR74lyzwktzn5+5tHdUTsOht8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739290871; c=relaxed/relaxed;
	bh=ffIR0nXMZH6XS4FogUN7D1+nD9FgsSCtHY6Wug5dudM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PPDf7A3fP0D32GHJFCRf1ce8cOgCcM65PQ1V/DKCXa6ordyMqKvfgg3v9eeuIukfdRCzWuImtjgUBO+6OFuwGDQOFGcnFgBDaxH9bFmsAlnTDT07/Ry3roNGjNRgGedLLdoryysjTTjzjg7BEcuUnGf0BFs0AMO9Tarwb7x3VOMKXvZVQys6R9pDC/gdbZn1ztSeB2jHJL7SB3l+9rPffKDWL/qudeCzfxW3Shc9dQmhaEHkRJ03qcMnQtXpot4uMIdShN8TG+flBd/VNlef7kvpGGwwOYB2cgY6pL/oARKMHuzPIo1Rgfble1s55qD8BAYUCTOkX/UU75M0knhkIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k6sdZAhg; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k6sdZAhg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsmsL5sd2z30WY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 03:21:10 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BFmC7A026918;
	Tue, 11 Feb 2025 16:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=ffIR0nXMZH6XS4FogUN7D1+nD9FgsSCtHY6Wug5du
	dM=; b=k6sdZAhgsy7u/Rm8H7CeecfJqPA/UVjDe73vAMkx7wz3BvZHxKFKS8l3D
	c43nhElfvrykSJnxbmLH6+9BA2dWmGcvh1y52aWAOVT6zNUpbscVOtEI+nQROc5Z
	Qro8L7WJGoRQq8ctyHkOmj4msTsKbua/GlfzUZn3Npdf8SuIxSmgmd00BRjRJSJZ
	Nnc///iripFdi4MfiJql2F7mGSQaalVAVhs/wnexXAnRHqBGA7C2pMTuXdzb7Dtr
	/3oZ+w1SYfzdY3gji5wbyJPqK0gc7YP8UsM2HqdnK0R+3M9lAIUVDFmO/xwUy/iY
	FBPwuC2zg7AC6keDkMzJ3nh5ui5gA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44r0c9awwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 16:20:58 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51BGKBP4000656;
	Tue, 11 Feb 2025 16:20:57 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44r0c9awwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 16:20:57 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51BDm30D016749;
	Tue, 11 Feb 2025 16:20:56 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44pk3k4220-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 16:20:56 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51BGKtrR18023004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 16:20:55 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F11A85805C;
	Tue, 11 Feb 2025 16:20:54 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCD1658051;
	Tue, 11 Feb 2025 16:20:54 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.61.47.87])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Feb 2025 16:20:54 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, hbathini@linux.ibm.com,
        eajames@linux.ibm.com
Subject: [PATCH v2] powerpc/crash: Fix non-smp kexec preparation
Date: Tue, 11 Feb 2025 10:20:54 -0600
Message-ID: <20250211162054.857762-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9OV8BGRedGjG9WCF-6cE4pFuGAW7LSXs
X-Proofpoint-GUID: WYhLalt1dmxfFcCxoSOY4-vFfpIHWkr1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=644
 spamscore=0 mlxscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110106
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

In non-smp configurations, crash_kexec_prepare is never called in
the crash shutdown path. One result of this is that the crashing_cpu
variable is never set, preventing crash_save_cpu from storing the
NT_PRSTATUS elf note in the core dump.

Fixes: c7255058b543 ("powerpc/crash: save cpu register data in crash_smp_send_stop()")
Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v1:
 - Use if (IS_ENABLED(CONFIG_SMP)) instead of #ifdef CONFIG_SMP

 arch/powerpc/kexec/crash.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index 9ac3266e49652..a325c1c02f96d 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -359,7 +359,10 @@ void default_machine_crash_shutdown(struct pt_regs *regs)
 	if (TRAP(regs) == INTERRUPT_SYSTEM_RESET)
 		is_via_system_reset = 1;
 
-	crash_smp_send_stop();
+	if (IS_ENABLED(CONFIG_SMP))
+		crash_smp_send_stop();
+	else
+		crash_kexec_prepare();
 
 	crash_save_cpu(regs, crashing_cpu);
 
-- 
2.43.5


