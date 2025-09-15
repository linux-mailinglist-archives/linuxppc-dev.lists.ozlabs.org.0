Return-Path: <linuxppc-dev+bounces-12207-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A782EB57647
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 12:30:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQLrp55ntz3dRQ;
	Mon, 15 Sep 2025 20:30:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757932218;
	cv=none; b=gzOY3i1KC/zCNFwxYNda2b5yWRHHXm9e42Q/gDaLe7jwwA7arTsw4L3lRlfssSpgJmPNve90RGuvYInNrgrsaGptYkbLuef9CXGu5s6uRKmW2N1MJLHiRm0fpLDjsiM5KXMujuoOH8BpqzBmkA3euJVxJH8zqX7jOf59frXIqGgLno9uF9/8w7Qm1hjFC14bVpYpeLrlWjzCRJuK+uAIFzLxhLi/YHdjYYD5ARKV6BNov3SCter2oysPg5XKNb3KjyZq7q61Le0JeyZGgS98cW2uUAifNek8TNLvHXXa1FcsIsYwK22BVo7Jy+oJ1Wsi9/daBVtSSqvO2bukIsw3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757932218; c=relaxed/relaxed;
	bh=9pUHNULlmkLRqKtdbIbTPC4WrxXBd1DhJ4v015qNlr4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XXoQUZPeARLYXNbMCwM4iXeQRqYj/6tnDiwrzBYUk6dkPAxACzlW2EwUWdawZsrD90tmkG6lusnqGd8VRGGtMFQqqwYq4vv/jMZbVkDeF5v0omAvQXyQZPMH9HjNTlV8zgRqdDqw/tl/gqQVZc+ShKX/AqMvIYO8h1u7OHUm2FX6XJluh3bnuyMxw+t9BKWU+wYaN9UsxG02IAeGCBYob02JL7Q6/ilQ4eBK280LCLBv1Lb9GNqFA2GcDscphx0Ao9LeA/1aZz4IepcaeEhqovYiDqcMSJ7IH3T123P73zILltb6YoBx2WCmoWSnr+AXhkY1axlmGeapjr7RU5KQ9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HfVTGlWD; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HfVTGlWD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQLrn6c3hz3dRD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Sep 2025 20:30:17 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F7XWi1011685;
	Mon, 15 Sep 2025 10:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=9pUHNULlmkLRqKtdb
	IbTPC4WrxXBd1DhJ4v015qNlr4=; b=HfVTGlWD6tW/igwjsl3RlASARcW+VzKuU
	U6MJOhPKIYpPrxCe+UtCUa65sjYW3lO6Vnz8YYRW9DdcXdp6OqNzGanhoMyG7/av
	nSLGjs7CZ6N2MNg0QE8xcf1EiBIilD6rGshLootWk8hISqjTJW0wTov51icwRmPe
	ZbQlDK+BsmZ+AuGbM762mzzj0gAxR/oOqVyvTqksKF78JVxN+GLgZxiHZXIpCMoh
	jHHbjXgkG3Ptx2ouuKiCK5PNYX+03uFAstIjTWv+Kg2OSeQP4nvGC+7Rn+J8/08Y
	7QeQGRYuXIjNRq8PZg42uDucy375k7B+u8ysZ2RduNSxkUwOqfRjw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 494y1x1g96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:30:10 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58FAQWNS026270;
	Mon, 15 Sep 2025 10:30:10 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 494y1x1g93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:30:10 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58F7lKiF027315;
	Mon, 15 Sep 2025 10:30:09 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495memwupx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 10:30:09 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58FAU5H652953378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 10:30:05 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AC8920040;
	Mon, 15 Sep 2025 10:30:05 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2CBD72004B;
	Mon, 15 Sep 2025 10:29:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.244.131])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Sep 2025 10:29:58 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org,
        linux-perf-users@vger.kernel.org, aboorvad@linux.ibm.com,
        sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com,
        venkat88@linux.ibm.com, Tejas.Manhas1@ibm.com
Subject: [PATCH V3 1/7] powerpc/time: Expose boot_tb via accessor
Date: Mon, 15 Sep 2025 15:59:41 +0530
Message-Id: <20250915102947.26681-2-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250915102947.26681-1-atrajeev@linux.ibm.com>
References: <20250915102947.26681-1-atrajeev@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxMCBTYWx0ZWRfX3mCo3PUg1eXU
 /2LD1c+R/1Sn781FWv+e4TuOQGqX4hUaEL1vsPQqTDhtZPTNEEW7hU9/1FhhyPPZ5twF8RI9iMm
 QZWa9l6SL2dbqFg6hTr7RZppLaK8TasETytrrA+I4ljoEwXhYGEjXsmFM/cQk94H12OO7BEjnZw
 pYpAguzOXlRnk4ewa8Zi0HK8dzx0Nqaf973PYW/XxtwqF0M5c6mSPlxxTBIKwzKb2znSskC+gzf
 uvmsbjJnkdNymGym/pb/fKIuQk+iqh8D+pR1uKX+x3J4c/Rrhz/76zAyTgCcw0/rYZFyC6MqalN
 n+yNVJ4ZryBlYsCSgVuqJ0PYYSArwhY77PoPtNFb1NS12uptEJFPERAl6czKoJU6qeb4NdOn43v
 bv+9cgvR
X-Proofpoint-ORIG-GUID: hWm8zsoA5b9mRlgo2Oz85I4mqTt_tZB7
X-Authority-Analysis: v=2.4 cv=euPfzppX c=1 sm=1 tr=0 ts=68c7eab2 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=cbn_3OFnJLNrDsZptFIA:9
X-Proofpoint-GUID: 3DsGAo9W4nWqu6YauAT-VPmQJZUO5oYE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Aboorva Devarajan <aboorvad@linux.ibm.com>

- Define accessor function get_boot_tb() to safely return boot_tb value,
  this is only needed when running in SPLPAR environments, so the
  accessor is built conditionally under CONFIG_PPC_SPLPAR.

- Tag boot_tb as __ro_after_init since it is written once at initialized
  and never updated afterwards.

Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
---
Changelog:
As suggested by Maddy, wrap boot_tb under
CONFIG_PPC_SPLPAR

 arch/powerpc/include/asm/time.h | 4 ++++
 arch/powerpc/kernel/time.c      | 8 +++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index f8885586efaf..7991ab1d4cb8 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -29,6 +29,10 @@ extern u64 decrementer_max;
 
 extern void generic_calibrate_decr(void);
 
+#ifdef CONFIG_PPC_SPLPAR
+extern u64 get_boot_tb(void);
+#endif
+
 /* Some sane defaults: 125 MHz timebase, 1GHz processor */
 extern unsigned long ppc_proc_freq;
 #define DEFAULT_PROC_FREQ	(DEFAULT_TB_FREQ * 8)
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 8224381c1dba..4bbeb8644d3d 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -137,7 +137,7 @@ EXPORT_SYMBOL_GPL(rtc_lock);
 
 static u64 tb_to_ns_scale __read_mostly;
 static unsigned tb_to_ns_shift __read_mostly;
-static u64 boot_tb __read_mostly;
+static u64 boot_tb __ro_after_init;
 
 extern struct timezone sys_tz;
 static long timezone_offset;
@@ -639,6 +639,12 @@ notrace unsigned long long sched_clock(void)
 	return mulhdu(get_tb() - boot_tb, tb_to_ns_scale) << tb_to_ns_shift;
 }
 
+#ifdef CONFIG_PPC_SPLPAR
+u64 get_boot_tb(void)
+{
+	return boot_tb;
+}
+#endif
 
 #ifdef CONFIG_PPC_PSERIES
 
-- 
2.47.1


