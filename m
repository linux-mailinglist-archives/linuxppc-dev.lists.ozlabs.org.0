Return-Path: <linuxppc-dev+bounces-1509-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D15D697DCD9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2024 12:38:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X9m1g37fnz2xGs;
	Sat, 21 Sep 2024 20:38:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726915095;
	cv=none; b=ItohModYqjwnt7M+B6ZXQyEX7iPf1faE2706KPcdrdB82suM/uxzvpdFqS4mbFRpVM/ZtgkjZ7uZArgMiQ0e+WKtORjQwm+QVd504AWPvmBMWuXUPggC+qqpmGSWXKmoRj5qBZf1GEgdI6rOoZdfv9cuLRQGaWIUWPaqPmT/+2bMsPnPT27Ue+v8vCr9DmMpgwNDjlJbW2QbVPta7GgJLg80s5FuEZz6zmNp1RzsDesARgENUZ3gyhez1bKSSwdGF/IRL/f5Nk37iBvU3jsF7GAlCCVGsxyAmUmewgGSCQj9JIoWpKr5JmA1UtG9rLlVKHctL+AtDhDWo2Fj34Kvzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726915095; c=relaxed/relaxed;
	bh=+KWORPeSJNnYHKPUC/+D2RgrnP4L87qsmYvEGxnGsGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QtZOK6QQUf0D/BP1VZ7ranZ7EYPNtNL20hHBp1BKdpuvY/z3rhs6AICsTotRO4/bhP2xX2VQaUNcen8Bh1P0w/WhqgAmeDWGiUmE3pmyjY6bdcPf/knsaBObfy1Kstvf0NBZHYnf1SqvX+hhXZWOmevu3goc6V+9Ajldrwp5oHq+n+98x8M/zD23djE5XcMJy/teAB9dvC2ham6gLPIleQzZuI2ZJXJD38QWdOEat5OHWF2S9wB/0tFYlLAUQWdv57lVTIqR5ojDBe2YlLEKAbC8OJl3/GYOIvghEzD8yKlDRZDsZ4w6HvCBheF1m6hcSIC8aGvDcvSBCP4LFLeoug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Soq95gx9; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Soq95gx9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X9m1f4ppLz2xCp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2024 20:38:14 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48L3ZSoH020639;
	Sat, 21 Sep 2024 10:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:content-transfer-encoding
	:mime-version; s=pp1; bh=+KWORPeSJNnYHKPUC/+D2RgrnP4L87qsmYvEGxn
	GsGI=; b=Soq95gx9HXNUpxWjJQ/o9OrZ9fG1fJhnN3Erfe3u5zW0//OiKHboscC
	+gQmt2cijb0qt3c4WDrhvJ09hV2QgpdO7XnwY+nKHE50tZSWyEe1yGPAxlfou/l8
	Sos7n5Tbgp0SNMHuLxRkECBGvJXL4nq+ovi/6yBRg+y5nEgjhAF3odpC2pxjMMcb
	9kT/o/6KlPTSmd0r/XW59uFaOjlC6+uaYxSnzZL+qcT0YO10Ij6+tGzg6zjrXomU
	nXYm3Kkv1Dj8JIz9V0QsAEBKPrZpSAsbeKnxvWlPjcbV9fvf+ubUsOCTIWPyy4jX
	WkcgnIZnTb6wrzZ+YgVaR3TaUD7Wnqg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41sntvsa7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Sep 2024 10:37:59 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48LAbwDK030568;
	Sat, 21 Sep 2024 10:37:58 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41sntvsa7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Sep 2024 10:37:58 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48L6UbIE030625;
	Sat, 21 Sep 2024 10:37:57 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41npanv0b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Sep 2024 10:37:57 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48LAbtkD53543276
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 21 Sep 2024 10:37:55 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 466EF20043;
	Sat, 21 Sep 2024 10:37:55 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 436A420040;
	Sat, 21 Sep 2024 10:37:50 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.3.44])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 21 Sep 2024 10:37:49 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: akpm@linux-foundation.org
Cc: Hari Bathini <hbathini@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        x86@kernel.org, Baoquan he <bhe@redhat.com>,
        Sachin P Bappalige <sachinpb@linux.vnet.ibm.com>
Subject: [PATCH linux-next v3] kexec/crash: no crash update when kexec in progress
Date: Sat, 21 Sep 2024 16:07:45 +0530
Message-ID: <20240921103745.560430-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.46.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wMAXGuOH2kq_dOGs8E5y7uv0SrYy_m_Z
X-Proofpoint-GUID: YKaJhgw807CeiwvpUPvZCy5Emqg2xOId
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-21_05,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409210078

The following errors are observed when kexec is done with SMT=off on
powerpc.

[  358.458385] Removing IBM Power 842 compression device
[  374.795734] kexec_core: Starting new kernel
[  374.795748] kexec: Waking offline cpu 1.
[  374.875695] crash hp: kexec_trylock() failed, elfcorehdr may be inaccurate
[  374.935833] kexec: Waking offline cpu 2.
[  375.015664] crash hp: kexec_trylock() failed, elfcorehdr may be inaccurate
snip..
[  375.515823] kexec: Waking offline cpu 6.
[  375.635667] crash hp: kexec_trylock() failed, elfcorehdr may be inaccurate
[  375.695836] kexec: Waking offline cpu 7.

To avoid kexec kernel boot failure on PowerPC, all the present CPUs that
are offline are brought online during kexec. For more information, refer
to commit e8e5c2155b00 ("powerpc/kexec: Fix orphaned offline CPUs across
kexec"). Bringing the CPUs online triggers the crash hotplug handler,
crash_handle_hotplug_event(), to update the kdump image. Since the
system is on the kexec kernel boot path and the kexec lock is held, the
crash_handle_hotplug_event() function fails to acquire the same lock to
update the kdump image, resulting in the error messages mentioned above.

To fix this, return from crash_handle_hotplug_event() without printing
the error message if kexec is in progress.

The same applies to the crash_check_hotplug_support() function. Return
0 if kexec is in progress because kernel is not in a position to update
the kdump image.

Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: kexec@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
Cc: x86@kernel.org
Acked-by: Baoquan he <bhe@redhat.com>
Reported-by: Sachin P Bappalige <sachinpb@linux.vnet.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
Changelog:

Since v1:
 - Keep the kexec_in_progress check within kexec_trylock() - Baoquan He
 - Include the reason why PowerPC brings offline CPUs online
   during the kexec kernel boot path - Baoquan He
 - Rebased on top of #next-20240910 to avoid conflict with the patch below
   https://lore.kernel.org/all/20240812041651.703156-1-sourabhjain@linux.ibm.com/T/#u

V2 RESEND: https://lore.kernel.org/all/20240911112111.108056-1-sourabhjain@linux.ibm.com/
 - Update linuxppc-dev mailing list address

Since v2:
 - Rebased it on top of #next-20240920

---
 kernel/crash_core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index c1048893f4b6..078fe5bc5a74 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -505,7 +505,8 @@ int crash_check_hotplug_support(void)
 	crash_hotplug_lock();
 	/* Obtain lock while reading crash information */
 	if (!kexec_trylock()) {
-		pr_info("kexec_trylock() failed, kdump image may be inaccurate\n");
+		if (!kexec_in_progress)
+			pr_info("kexec_trylock() failed, kdump image may be inaccurate\n");
 		crash_hotplug_unlock();
 		return 0;
 	}
@@ -547,7 +548,8 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
 	crash_hotplug_lock();
 	/* Obtain lock while changing crash information */
 	if (!kexec_trylock()) {
-		pr_info("kexec_trylock() failed, kdump image may be inaccurate\n");
+		if (!kexec_in_progress)
+			pr_info("kexec_trylock() failed, kdump image may be inaccurate\n");
 		crash_hotplug_unlock();
 		return;
 	}
-- 
2.46.0


