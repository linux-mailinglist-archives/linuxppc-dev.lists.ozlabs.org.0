Return-Path: <linuxppc-dev+bounces-7904-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A47D7A96C2A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 15:12:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhjLs3F8Xz304l;
	Tue, 22 Apr 2025 23:12:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745327525;
	cv=none; b=lZ5npBVVdi01DO8sdlShHeYJlIUzBHcvbwXfkYcTGyC85EVjdiXtM9cpZc1xnSx11zmwi0C3okORQw0B8rTVXVnTdGNIjzCJwq59eclzY5ofiaTWJv/Kx7QOuWoB+xHcuvlzPqbmEQT9IAISZyBJ228NJdp8UfatnWssNff8BOgug+VBBZitAkOVAtePbObxW8mTOZBSrXXKI9p0+mlg6zYXJnbPKJWg1TFsamtlKZj67IEyhs3HYSal7utUKfPrrqp5FdnATgbwJUcyEJoHinPNrDd+P18BULJbgPvYJbPFAslxyzGiWNfqkCf/WdCOLbpwE56fOWBniUDl77Tjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745327525; c=relaxed/relaxed;
	bh=c1kNy0GSmEw/Ydk/Xd3fQyJ1OHmyG0uIQNET5zhgJ18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cTViPxv4HbI/XZJXO6oXqbvIRCRt6wxOd32BRWEd6XZa4GkBYX1VGV1Sd9pRjAuDbhq/XGfzYaT+AE/1JTD+CpORRMKGNaq9pV+ujv3Em1S4h9VfLKOzBMxQE/7cjKV9xKYkEg0VDKFYJNyIRqIQgqyDgVLTWj0tIZwxsg6YzK3kpK5nwG59Jb5IsbP5QuXm7ZGXyjNvpM1B0Dme6GiGj8dDm/tPEL0GdvI2rU0frMXzhKBeJXXARUOlQel+x9JWTyTw6KkEUg4su90eyMNaTrJ+5XkBdFmNk5eRpjnm1/yct2ewXx1ne/Ia5Od+QpPrDsojMa2ZeS7sWnDxlBknwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PCHACAQy; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PCHACAQy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhjLr4PKSz3bsT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 23:12:04 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MC63uY026863;
	Tue, 22 Apr 2025 13:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=c1kNy0GSmEw/Ydk/X
	d3fQyJ1OHmyG0uIQNET5zhgJ18=; b=PCHACAQydOEZe6Dn8V/bQ7wsT9D5wp3aq
	WqLDT6saeSt7aeJT8dqLMayViXBs4SMvAHwjuSq4j/iaE/Xn7ftN5yOXvMGCfh2T
	Cn1CiB3RrGM+Gz+9+2JtN2gZ/ijmxteSNf25jMXt4i9UR5RK8+kemxCH9EQ19g2G
	44ImhVXHKz74mHNIsoRkqaqi4WC9RgRQKeSkDU1LUK18vC4TKcdvvrOvwoorSOgP
	2LZooS4u7wWuiSy/YPnvJYvMBN1PMVl9ylIyqQ9xPXlW79gxXPtiOJxr33jXvsDO
	1FoNdKCoTuICwEFQmPloCzzUU4TTZTBIZk2pfr8T+095GppQuBL+w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4669jrrp4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:11:50 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53MDA4Sg001876;
	Tue, 22 Apr 2025 13:11:50 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4669jrrp49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:11:49 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53MB6BoF002953;
	Tue, 22 Apr 2025 13:11:49 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 464q5njy3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:11:49 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53MDBloS59703722
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 13:11:47 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 295A82004F;
	Tue, 22 Apr 2025 13:11:47 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 584FD20040;
	Tue, 22 Apr 2025 13:11:41 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.58.77])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 22 Apr 2025 13:11:40 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, christophe.leroy@csgroup.eu
Cc: npiggin@gmail.com, naveen@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH 4/6] powerpc: fix sparse warnings
Date: Tue, 22 Apr 2025 18:40:38 +0530
Message-ID: <20250422131040.374427-5-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422131040.374427-1-maddy@linux.ibm.com>
References: <20250422131040.374427-1-maddy@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 2RaJtv_KGYNgy_eOs0qcwtnho8YK8FBt
X-Authority-Analysis: v=2.4 cv=f8RIBPyM c=1 sm=1 tr=0 ts=68079596 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=zO_7FImU_Rab3inkQ04A:9
X-Proofpoint-GUID: cN5hnu70KGGOdpCVJLTFmDuzKHyu6lVr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220098
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

structs are local to the source and does not need to
be in global scope, so make it static.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/kernel/btext.c              | 2 +-
 arch/powerpc/kernel/setup-common.c       | 2 +-
 arch/powerpc/platforms/powernv/opal.c    | 2 +-
 arch/powerpc/platforms/pseries/lparcfg.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
index 7f63f1cdc6c3..fc7f5a5b6d76 100644
--- a/arch/powerpc/kernel/btext.c
+++ b/arch/powerpc/kernel/btext.c
@@ -40,7 +40,7 @@ static int dispDeviceRect[4] __force_data;
 static unsigned char *dispDeviceBase __force_data;
 static unsigned char *logicalDisplayBase __force_data;
 
-unsigned long disp_BAT[2] __initdata = {0, 0};
+static unsigned long disp_BAT[2] __initdata = {0, 0};
 
 static int boot_text_mapped __force_data;
 
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 68d47c53876c..649e0cc31df7 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -350,7 +350,7 @@ static void c_stop(struct seq_file *m, void *v)
 {
 }
 
-const struct seq_operations cpuinfo_op = {
+static const struct seq_operations cpuinfo_op = {
 	.start	= c_start,
 	.next	= c_next,
 	.stop	= c_stop,
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 9ec265fcaff4..02af50a724bf 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -48,7 +48,7 @@ static LIST_HEAD(msg_list);
 /* /sys/firmware/opal */
 struct kobject *opal_kobj;
 
-struct opal {
+static struct opal {
 	u64 base;
 	u64 entry;
 	u64 size;
diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index cc22924f159f..830af843ef40 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -185,7 +185,7 @@ static long h_pic(unsigned long *pool_idle_time,
 	return rc;
 }
 
-unsigned long boot_pool_idle_time;
+static unsigned long boot_pool_idle_time;
 
 /*
  * parse_ppp_data
-- 
2.49.0


