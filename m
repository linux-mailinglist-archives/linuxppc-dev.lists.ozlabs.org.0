Return-Path: <linuxppc-dev+bounces-5796-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 737CAA26C33
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2025 07:40:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YnDJG6FGJz2yRF;
	Tue,  4 Feb 2025 17:40:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738651214;
	cv=none; b=b8cI3d9usKt5WfwLA4ascP369jLqxvvCUQf3dVdlGHJOoeQ3wke1A0WWu7pgpZgBaAn6w2QgXo9/gTkCqpp6mo0C8mK0pFr/DeUPh8XJr3C8D5BJjBb+j00kiaqdItETpm38Qb8KUhCLpQSrlEA9eMVlrEAGm480hmvp4hoiggNJMcxaixdQFIY8veFtbtXMDtLI06kVdUyBIw8Tm0dWHaz9aNGpaw3ea6Z86gvHt049wd8h7l0D+mYNLlEWLidr/6LJ3IYdXu5rCisDhwCIT+dWkFIQLXfYLeMG/budNOYDSYnetFQ/rZnIU3IysPgB7XZmt4w2/RU+ePEdu/6Nig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738651214; c=relaxed/relaxed;
	bh=ndHd7fqKZ836SjKywQTYbp5/lAneBePLzgwDlcjZuXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ci+xpWpmbB1w0OX+4mixxT7JtltWOuSMSe4J7dpUrTMXpdU9wTRcJ5gxtPGpYxKG1N12vqrhpEtf12zdNqvxNtIQMKhDwMUgpBm/hNU9CWM4eWdu9wmEV8MFGobGUmNE/5ov6KRe0c2KI8fbSx05gK8BW+qSsr1P5qVSyR72MNovEyI5unAlY2uP3P/AYRYolwxqs6tKKZBviOpfR+zeCpM1aW7j7zUdMvL7sw+tsnjUAr0PuqmYbX8D7xavDAxoNP3d3DjknYB/sudOfBTwG167vCuuAhMB1BvxDSwlt5zmbreo+/7zBM/I6gr6u78F6uji86g263QxQadw3QyRkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XcATzx6v; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XcATzx6v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YnDJF1B1Vz2yDx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2025 17:40:12 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5145mB0r018213;
	Tue, 4 Feb 2025 06:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=ndHd7fqKZ836SjKywQTYbp5/lAneBePLzgwDlcjZu
	XE=; b=XcATzx6vKRBFBGERYFBSuoZIFQm3KKqI+YukK1u3DNj8UUzqy5nkbrhBr
	cClif0BJr1+axakLlWgP2R8J1LpgM6d2X5SldP2wYd7/qJmI5dA4quC5MzhhfApn
	5Qd5NeeFBT4Jt5d6czCcYzB5H+JeIXx2UCT8g+IkGK5NgOn5Br8i67rVOgG/EsHQ
	kscK70zcp6BNWoX4WU1ezeECxl+ji5A3v9NJXkaCjvOlxpsjMcGV6BURZrvd1SUk
	vk+uA1frjPZtHiUnp4QvNR2KSZlUdPD5ixuUEW/itrJ3qwGt6uKL5FBIEDKOZ6qG
	aAsUDYbfb/AS47SBRol28MEvD8P/Q==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44k0mtbaj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 06:40:10 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5144NcI2006508;
	Tue, 4 Feb 2025 06:40:09 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hyeka2ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 06:40:09 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5146e3GV23003620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 06:40:03 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ADFB420082;
	Tue,  4 Feb 2025 06:40:03 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C2BE420043;
	Tue,  4 Feb 2025 06:40:01 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.13.87])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Feb 2025 06:40:01 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: maddy@linux.ibm.com
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, disgoel@linux.ibm.com,
        hbathini@linux.ibm.com, adubey@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        aboorvad@linux.ibm.com
Subject: [PATCH v2 1/3] powerpc/time: Export boot_tb and log initial timebase at boot
Date: Tue,  4 Feb 2025 12:09:46 +0530
Message-ID: <20250204063948.643852-1-kjain@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: rCFzP46PU-pD3XSiYJrfoXNuHNKzWaZZ
X-Proofpoint-GUID: rCFzP46PU-pD3XSiYJrfoXNuHNKzWaZZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502040051
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Aboorva Devarajan <aboorvad@linux.ibm.com>

- Export `boot_tb` for external use, this is useful in perf vpa-dtl
  interface, where `boot_tb` can be used to convert raw timebase
  values to it's relative boot timestamp.

- Log the initial timebase at `time_init` as it is a useful
  information which can be referred to as needed.

Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/include/asm/time.h | 1 +
 arch/powerpc/kernel/time.c      | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 9bdd8080299b..b6fc5df01d53 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -23,6 +23,7 @@ extern u64 decrementer_max;
 extern unsigned long tb_ticks_per_jiffy;
 extern unsigned long tb_ticks_per_usec;
 extern unsigned long tb_ticks_per_sec;
+extern u64 boot_tb;
 extern struct clock_event_device decrementer_clockevent;
 extern u64 decrementer_max;
 
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 0727332ad86f..6e8548f0e48f 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -137,7 +137,8 @@ EXPORT_SYMBOL_GPL(rtc_lock);
 
 static u64 tb_to_ns_scale __read_mostly;
 static unsigned tb_to_ns_shift __read_mostly;
-static u64 boot_tb __read_mostly;
+u64 boot_tb __read_mostly;
+EXPORT_SYMBOL_GPL(boot_tb);
 
 extern struct timezone sys_tz;
 static long timezone_offset;
@@ -943,6 +944,7 @@ void __init time_init(void)
 	tb_to_ns_shift = shift;
 	/* Save the current timebase to pretty up CONFIG_PRINTK_TIME */
 	boot_tb = get_tb();
+	pr_debug("%s: timebase at boot: %llu\n", __func__, (unsigned long long)boot_tb);
 
 	/* If platform provided a timezone (pmac), we correct the time */
 	if (timezone_offset) {
-- 
2.43.0


