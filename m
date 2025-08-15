Return-Path: <linuxppc-dev+bounces-11043-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0626DB27B1F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Aug 2025 10:35:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3Fm23RkSz3cYd;
	Fri, 15 Aug 2025 18:34:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755246898;
	cv=none; b=nYm/uuhVke03uvU5d5sP4WT2wSJ7RWSs/euXCkhOz5kBxi8A78RC/Y5qgWM1DuivovREP5+8zp21ANj66i1+LEbsTt/ROxliAnnLvgCxmmubmE2KzDfTmRpfYz4ErfnXdZ7ar8B0cu2PHrlgjnr6s6WALOZecphpfNvayFRc0IpKnD6lVzvgk4j5pZlOZ/G9kBZMMb7mHFQ/330E7DmFRVV92SxSbSittM/V9A/409bgMxHeMdW9kXrVyz6eQMHo4uaq8CN2KaNYymw64Tk1vMIhaKDC8W6ZiHCM+B8t3QIctKVtSjlszDkrMoaJ9hgbC4w6XY/yHtAGlOV3uLeuow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755246898; c=relaxed/relaxed;
	bh=KjAtI+w4MdbEbtH9dGM/fuZgcKZdDqLRJltQIO7aalU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eKrtS85+6PtjytVKUmkN8fNDRhJFeeOJc31c9Pfn5knREUB97O113XXJgqlDF4tQQb8EORgYmME4eyETxOGiqciHQBsNBlWDwzKtd55MsUGUmkbh2x11pWdye53OJHtXiMjCltAHp34WsfMHVm8uPsxv1PJy5bI4n2m9RCmfszFS8O7DH6xA+4y9HjlKzFDftaMsox0FYT+6euvdhK7YC1CZMQKmW5eD39ly9IkrG4IjkWYA9wkeKYZtyDRPaNEkTYn6UY2Sp8HrnNUiBu0y0pixd9S8g2Vgg4iCKZw7E4+nGsVY4IhFFZjkphjL447PzZl5C9fH+BaczhHINMVqWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F+kdDKxg; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F+kdDKxg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3Fm12lPZz3cYN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 18:34:56 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F4DuC7010174;
	Fri, 15 Aug 2025 08:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=KjAtI+w4MdbEbtH9d
	GM/fuZgcKZdDqLRJltQIO7aalU=; b=F+kdDKxg5LRFlREe492hNjIoprljBbZHY
	CHKF9O+YuWBdTPYuyj+hDvkDRJaP28/9yGFCj8VMj53H1GvarDdZxKFKdm8fwWvn
	Z31umbWIRPh7JZjp8f4vjbE7VxmBrXhv1OVlJ7LcCnzNFnICbErzvpa1vjzXwJnR
	sh/4GJ8smRF45VsZ945y3xPniFGOMnj3l99lB3TGu99nF0UBPYDzbN0M3esA6C9Q
	6ni513QNbhTQnf6gjz94RUnGLvzbnvfXWYUGIfGq4Bv3WjlgLKSUD7Hmux8etAYl
	gHsjGAeP7bn2Jqjp9kBH2R/wHHElMq22jbNxIdyN9MnTv8Hs+yoGg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dwudpm1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:34:51 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57F8VHlc010869;
	Fri, 15 Aug 2025 08:34:51 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dwudpm1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:34:51 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57F5u6XA010832;
	Fri, 15 Aug 2025 08:34:50 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 48egnv0b5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Aug 2025 08:34:50 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57F8YkNi10944804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Aug 2025 08:34:47 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D624820043;
	Fri, 15 Aug 2025 08:34:46 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D95220040;
	Fri, 15 Aug 2025 08:34:40 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.240.145])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Aug 2025 08:34:39 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        maddy@linux.ibm.com, irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        aboorvad@linux.ibm.com, sshegde@linux.ibm.com, atrajeev@linux.ibm.com,
        kjain@linux.ibm.com, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, venkat88@linux.ibm.com
Subject: [PATCH 01/14] powerpc/time: Expose boot_tb via accessor
Date: Fri, 15 Aug 2025 14:03:54 +0530
Message-Id: <20250815083407.27953-2-atrajeev@linux.ibm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250815083407.27953-1-atrajeev@linux.ibm.com>
References: <20250815083407.27953-1-atrajeev@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIyNCBTYWx0ZWRfXxpGfBEVnldVv
 ZZiHoDsXuhL1hoj6RAb6W+gR+v8Ef/UELJ6f22uqpXcCMo8PKDv4apD9B/3MzFWW3NNxhRfr5XS
 jkr8F9rm9Fk31ksA2QxbxNj5tlCtvhhhmU/JUmpg+wKYy2mvmztnmCfuCoNh3i2Q961OIVNfdV+
 j2ufYPibaM3/0otD7bUxzDQMABiVjjLlO8BAc8Bm7kvmayKentQRTq3b+39/GwU2cGo0+3gR1XB
 F1st/937raLlk8Id+bTBU5Nj9Z5BEzJHQdWULBe/8GcVHKU6P56eau3q/uxwqp3H0pWdeyptPlv
 Ei5+D3SJu2VEyMJX2oxd2/yvF3VeVOXGO4KKmvTenJf4iHS1x5SJ08GUxKR1cykKm447z/pOfPp
 ZyqHt9Yq
X-Authority-Analysis: v=2.4 cv=d/31yQjE c=1 sm=1 tr=0 ts=689ef12c cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=cbn_3OFnJLNrDsZptFIA:9
X-Proofpoint-GUID: ZE1n8gch3M1mksOu52Dm0U5QSkXPY0jm
X-Proofpoint-ORIG-GUID: UJQGR8pLVHBPZo5cmk7cJWWOtGW0Yrf_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508120224
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Aboorva Devarajan <aboorvad@linux.ibm.com>

- Define accessor function get_boot_tb() to safely return boot_tb.
- Tag boot_tb as __ro_after_init (only initialized once and never updated).
- Add a debug log to output the boot timebase during initialization.

Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
---
 arch/powerpc/include/asm/time.h | 2 ++
 arch/powerpc/kernel/time.c      | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index f8885586efaf..31bb6be4d355 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -29,6 +29,8 @@ extern u64 decrementer_max;
 
 extern void generic_calibrate_decr(void);
 
+extern u64 get_boot_tb(void);
+
 /* Some sane defaults: 125 MHz timebase, 1GHz processor */
 extern unsigned long ppc_proc_freq;
 #define DEFAULT_PROC_FREQ	(DEFAULT_TB_FREQ * 8)
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 8224381c1dba..f5106b90e517 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -137,7 +137,7 @@ EXPORT_SYMBOL_GPL(rtc_lock);
 
 static u64 tb_to_ns_scale __read_mostly;
 static unsigned tb_to_ns_shift __read_mostly;
-static u64 boot_tb __read_mostly;
+static u64 boot_tb __ro_after_init;
 
 extern struct timezone sys_tz;
 static long timezone_offset;
@@ -639,6 +639,10 @@ notrace unsigned long long sched_clock(void)
 	return mulhdu(get_tb() - boot_tb, tb_to_ns_scale) << tb_to_ns_shift;
 }
 
+u64 get_boot_tb(void)
+{
+	return boot_tb;
+}
 
 #ifdef CONFIG_PPC_PSERIES
 
@@ -975,6 +979,7 @@ void __init time_init(void)
 	tb_to_ns_shift = shift;
 	/* Save the current timebase to pretty up CONFIG_PRINTK_TIME */
 	boot_tb = get_tb();
+	pr_debug("%s: timebase at boot: %llu\n", __func__, (unsigned long long)boot_tb);
 
 	/* If platform provided a timezone (pmac), we correct the time */
 	if (timezone_offset) {
-- 
2.47.1


