Return-Path: <linuxppc-dev+bounces-7385-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C3DA759D5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Mar 2025 13:35:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZQXHz5bPpz2xmk;
	Sun, 30 Mar 2025 22:35:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743320901;
	cv=none; b=hMCxubFh4xkPyviVPjQwqsM9jCDUMP8OCIge1rsdWlgJ0Qt6igoEKg+0+4iU5YzoYhx6a/p4r6bTinWI8Zc5K5J/zEaSQw1/R/s8EyekiJ2kp9hkX6ffVbWxmHfAIxOf2rUhN5Z9c80ktb5rWYZT2eyHSysp02ipu2Ll3U4HQsu5x6zPxkfKtWpZ4uQZU+Th6w1zvfNk5qXYLagKqkI+RK6iPC4W4JJsm6h/rgCYt6uAGzPmdY23sqd7jkYiDu+g75Tve0pLn+luml+PMLQbTZ8oV5tkZ1HNaRX0tTyK9VrO/HSr+bh4S/jyOkYtpwFiu3vXXodrsmxwzgW5VlkBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743320901; c=relaxed/relaxed;
	bh=ttcq4pZHt7Gr+FZ9vt0xqE+TrTQMgvp2ZXVHLpm2ltY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YTbkq3XKA0Hi6addP2XAFr/OiVaGl6xWSudM3+832vhXdC0zFx3bstVLwd21eMuwLUdmylXvf01dKbSuOuDyJu2L/7XXYKGY7PF2ARPU5v+oIDmltuQ70CxmU3Wwy4/uZEeGD7mj/VNjhaXNzaZ/JkcOd5LN81HOYQ3YJohs+6G2Ve/HXUrn5lu4BP6Qipay+uHQ9IMqAXNqpOshWErc2YNia9g7TqzWT3DmkGgFY024CntTEQtyZfgQ0qXIynOIYKf/9KwKPt/VhgINNJfmAvbvpIT+GjzrHg4Rcx1M5aPvPp0vpl2WAkmBlTv1EF1eq4C9Mfy++NjdZFURFjz6dA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QsWasIzX; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vineethr@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QsWasIzX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vineethr@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZQRFt30Phz2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Mar 2025 18:48:17 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U6tj0N008817;
	Sun, 30 Mar 2025 07:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=ttcq4pZHt7Gr+FZ9vt0xqE+TrTQM
	gvp2ZXVHLpm2ltY=; b=QsWasIzXkBNtaKT5ejogHShJEqtV8ukhPc40fAlSIAeL
	8DB7rj/oeM9Sf0d8SQ3cEqJwo9S+HUshMZSPobyrIWi73wL+k+4ek382PHekajxN
	dlZSQvcP6jENMYkyGDlZzSOFthOm+g9vUyz4Jw803n/zql+SIkhN2Bj+JBY3L/fM
	WzlwlsNVUgkdBMxejzhDwyJi6D6u/sJJFZrRtjvVc6wAAMdoE26n+FD+1PKpK+Al
	0gXTQyF6TUSIxP+Wj+DCAScW+dPFR4R1alQVGteHsqtgwpQST37NRUSbarwJJKqn
	pY5+b41wHofKW5C1bZZisYvLKs2OXOtBNV3D9Bm5Lw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45pr1p9fys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 30 Mar 2025 07:47:50 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52U7lo8F007840;
	Sun, 30 Mar 2025 07:47:50 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45pr1p9fyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 30 Mar 2025 07:47:50 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52U1rM19014555;
	Sun, 30 Mar 2025 07:47:49 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45pvpkrvb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 30 Mar 2025 07:47:49 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52U7ljgr18350498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 30 Mar 2025 07:47:45 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 43A3920049;
	Sun, 30 Mar 2025 07:47:45 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A01120040;
	Sun, 30 Mar 2025 07:47:40 +0000 (GMT)
Received: from li-fdfde5cc-27d0-11b2-a85c-e224154bf6d4.ibm.com.com (unknown [9.43.97.134])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 30 Mar 2025 07:47:40 +0000 (GMT)
From: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Eric Biggers <ebiggers@google.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Yosry Ahmed <yosry.ahmed@linux.dev>,
        Tamir Duberstein <tamird@gmail.com>,
        Srikar Dronamraju <srikar@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
        Madadi Vineeth Reddy <vineethr@linux.ibm.com>
Subject: [PATCH] powerpc/defconfigs: Set HZ=1000 on ppc64 and powernv defconfigs
Date: Sun, 30 Mar 2025 13:17:34 +0530
Message-ID: <20250330074734.16679-1-vineethr@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6K6noxtlI7DKdwX5XZATnrIciW5ht5UF
X-Proofpoint-ORIG-GUID: ArbiTZTrsMQ4WUKzruDXvUT0xHYD1Hsm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300051
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit 030bdc3fd080 ("powerpc/defconfigs: Set HZ=100 on pseries and ppc64
defconfigs") lowered CONFIG_HZ from 250 to 100, citing reduced need for a
higher tick rate due to high-resolution timers and concerns about timer
interrupt overhead and cascading effects in the timer wheel.

However, improvements have been made to the timer wheel algorithm since
then, particularly in eliminating cascading effects at the cost of minor
timekeeping inaccuracies. More details are available here
https://lwn.net/Articles/646950/. This removes the original concern about
cascading, and the reliance on high-resolution timers is not applicable
to the scheduler, which still depends on periodic ticks set by CONFIG_HZ.

With the introduction of the EEVDF scheduler, users can specify custom
slices for workloads. The default base_slice is 3ms, but with CONFIG_HZ=100
(10ms tick interval), base_slice is ineffective. Workloads like stress-ng
that do not voluntarily yield the CPU run for ~10ms before switching out.
Additionally, setting a custom slice below 3ms (e.g., 2ms) should lower
task latency, but this effect is lost due to the coarse 10ms tick.

By increasing CONFIG_HZ to 1000 (1ms tick), base_slice is properly honored,
and user-defined slices work as expected. Benchmark results support this
change:

Latency improvements in schbench with EEVDF under stress-ng-induced noise:

Scheduler       CONFIG_HZ  Custom Slice  99th Percentile Latency (µs)
--------------------------------------------------------------------
EEVDF           1000       No            0.30x
EEVDF           1000       2 ms          0.29x
EEVDF (default) 100        No            1.00x

Switching to HZ=1000 reduces the 99th percentile latency in schbench by
~70%. This improvement occurs because, with HZ=1000, stress-ng tasks run
for ~3ms before yielding, compared to ~10ms with HZ=100. As a result,
schbench gets CPU time sooner, reducing its latency.

Daytrader Performance:

Daytrader results show minor variation within standard deviation,
indicating no significant regression.

Workload (Users/Instances)  Throughput 1000HZ vs 100HZ (Std Dev%)
--------------------------------------------------------------------------
30 u, 1 i                   +3.01% (1.62%)
60 u, 1 i                   +1.46% (2.69%)
90 u, 1 i                   –1.33% (3.09%)
30 u, 2 i                   -1.20% (1.71%)
30 u, 3 i                   –0.07% (1.33%)

Avg. Response Time: No Change (=)

pgbench select queries:

Metric                         1000HZ vs 100HZ (Std Dev%)
------------------------------------------------------------------
Average TPS Change             +2.16% (1.27%)
Average Latency Change         –2.21% (1.21%)

Average TPS: Higher the better
Average Latency: Lower the better

pgbench shows both throughput and latency improvements beyond standard
deviation.

Given these results and the improvements in timer wheel implementation,
increasing CONFIG_HZ to 1000 ensures that powerpc benefits from EEVDF’s
base_slice and allows fine-tuned scheduling for latency-sensitive
workloads.

Signed-off-by: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
---
 arch/powerpc/configs/powernv_defconfig | 2 +-
 arch/powerpc/configs/ppc64_defconfig   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index 6b6d7467fecf..8abf17d26b3a 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -46,7 +46,7 @@ CONFIG_CPU_FREQ_GOV_POWERSAVE=y
 CONFIG_CPU_FREQ_GOV_USERSPACE=y
 CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
 CONFIG_CPU_IDLE=y
-CONFIG_HZ_100=y
+CONFIG_HZ_1000=y
 CONFIG_BINFMT_MISC=m
 CONFIG_PPC_TRANSACTIONAL_MEM=y
 CONFIG_PPC_UV=y
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 5fa154185efa..45d437e4c62e 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -57,7 +57,7 @@ CONFIG_CPU_FREQ_GOV_POWERSAVE=y
 CONFIG_CPU_FREQ_GOV_USERSPACE=y
 CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
 CONFIG_CPU_FREQ_PMAC64=y
-CONFIG_HZ_100=y
+CONFIG_HZ_1000=y
 CONFIG_PPC_TRANSACTIONAL_MEM=y
 CONFIG_KEXEC=y
 CONFIG_KEXEC_FILE=y
-- 
2.47.0


