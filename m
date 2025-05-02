Return-Path: <linuxppc-dev+bounces-8255-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 056D9AA7076
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 13:12:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZppDR5LPlz30T3;
	Fri,  2 May 2025 21:12:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746184359;
	cv=none; b=Oqj0OooVwQtmHaOahF0QiIxSMYzunzUse3g04KPVXQ0dnOJHb9T7MDDNZPYDuv4XkeqE11Q0lA3C7oy35rMNVlLdkqqfNYPhkEgIKojtrcFR/abNyt7VfO6jKM/XPCzv2+IRxMBsZsV9OMWfgP8o0cSX4gnoOBN2b0xo+tLMxW02VBuDB0O/a7vvz8uh05x7idh7GOh6AHX1HSSl4sBGpu2wAf3PPieWLcSrA+pMQoDpya9SYT7QrM4qchoxGOwzA3KgR6rhuP4bspTNqRVEEpusWGNUiX3wlRyldNI3MicEoIbM6iSJdyyUO3rYBrCaHQpr8Gp3X/HfWiMb4k3nfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746184359; c=relaxed/relaxed;
	bh=XLx6kh8gqc/W7oj/RK1RaFTmdMauBPRTQG17yYFaDQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OqhJLZkKleHZeqjG2MZNfEK/7mcX8JqbdakT0Jzu0oKPFVGTNzq249msCQrKzsLhIyOo4qfWvVTavl/RWgD6rbDQB+yNIv/uwf1YJpr8eZEvsORKsowaWomDGFJvPUDnO2R4hcK1azDLtEyG9H1PlzXZfeDUu9q+/sBzei0VYuS/+3TavRKjJ5mEgco5hDY4PZmMeUI8bN8cYJF13ChU7PHSzIeZeNWPDCHVHB4m1Im1Cw7StSJPBJSHFoZGpFNWkoiV5+jZcUTZz0PKuBqg8QncdJsA6Lbz1G2LWP7nZbbn/bRoDoHYA3y93fMFCqz647CsgO96thTuvS/V7DNC0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kLnba+JA; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kLnba+JA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZppDQ1wB8z2yyd
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 21:12:37 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542AesVt026297;
	Fri, 2 May 2025 11:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=XLx6kh8gqc/W7oj/R
	K1RaFTmdMauBPRTQG17yYFaDQY=; b=kLnba+JAB7eUsjPPxa+SwzBM4Tz72YnFF
	ATJHMb0cjHfKYo4L0bO9c6PiMBVumGTcqLHHaGaXHXEARQ42fdRGM/LPZ7t69W/u
	ocvVI919TKtWxYxy08JgleR651FKh8EBqYA9oyKHkLFtLcLasvo5OtyYG3r1FpT2
	0hzi5SwldnKPlulbG9a0GFuWFME9JDu0uq5aJDERK0WuBXw22/SLwvsmA+qdUWzl
	g9IMvBQ81Tz3nIXo3MRcbp/2JaGWn4G7r0NkCMTtjcBwv3VpYo8rc/FxzGDcw3GQ
	xQ2PWCK+F8aHD9Dr/SNRq9VDosaDa2Y8xVOeQSe1m4PmTijpr4EhA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46cvgs835v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 11:12:15 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 542BCEvu016112;
	Fri, 2 May 2025 11:12:15 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469a70sp8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 11:12:15 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 542BCBlL60293444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 11:12:11 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 189D220040;
	Fri,  2 May 2025 11:12:11 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1176F20049;
	Fri,  2 May 2025 11:12:07 +0000 (GMT)
Received: from li-80eaad4c-2afd-11b2-a85c-af8123d033e3.ibm.com (unknown [9.124.221.183])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 May 2025 11:12:06 +0000 (GMT)
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: luogengkun@huaweicloud.com, dianders@chromium.org,
        joel.granados@kernel.org, song@kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org, "Nysal Jan K.A." <nysal@linux.ibm.com>
Subject: [PATCH] watchdog: Fix the SOFTLOCKUP_DETECTOR=n case
Date: Fri,  2 May 2025 16:41:20 +0530
Message-ID: <20250502111120.282690-1-nysal@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430205503.4a316f48@canb.auug.org.au>
References: <20250430205503.4a316f48@canb.auug.org.au>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA4NyBTYWx0ZWRfX/adalclWWXp+ ks9pJMxtIel3CmGGrp3GcWIVCtESxeDMNnyzfKl8wefmgznMSZ8/jszoqaTMiXEGEpQvobA/DrA EtwDozbWLOf2Nx0O61fQ6bQPvUBsIIo7NgsSPjI86oP8Pz7NGwpjXsnGbAEFaozWYxWxWK/Olt1
 q4ntQoqKWhg29VoCgluuvzXg6o4qqhmn2UbB5m+FFW7eQFPmMkaJ3jCgS2NPPBLwD1W+mOhDt9C M1UqG6hxpntME+ka7Kjc/vyxQujglQoFLEZilbuYw3Jr0qJZJEjYRNq+UEMgmsFD8Wsb7ED4aar T6e40QrrGrkqcFgcI8vhDqpGcrgr66YBzhfG+YVnEDyOhDKx42Tvg/TwkeB+RxdpwzWCxjqxbZw
 JxtHHxoRjOPJobtx0Qyv7ubjIUI1aV7LZnkuLHyBE77NXRyoOZ3bOt8aBCFBVAgrjD11VMhD
X-Authority-Analysis: v=2.4 cv=Asru3P9P c=1 sm=1 tr=0 ts=6814a88f cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=sOSd7Ic9yzPgF-7c_ocA:9
X-Proofpoint-GUID: EAvv4iEC7eFg2QV0Ow-ErRfgoKkl4Chq
X-Proofpoint-ORIG-GUID: EAvv4iEC7eFg2QV0Ow-ErRfgoKkl4Chq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1011 lowpriorityscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020087
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Update watchdog_thresh when SOFTLOCKUP_DETECTOR=n.
Additionally fix a build failure in this case as well.

Fixes: 0bff3dababb07 ("watchdog: fix watchdog may detect false positive of softlockup")
Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Closes: https://lore.kernel.org/all/339e2b3e-c7ee-418f-a84c-9c6360dc570b@linux.ibm.com
Signed-off-by: Nysal Jan K.A. <nysal@linux.ibm.com>
---
The "Fixes:" SHA1 points to the commit in mm-nonmm-unstable and will need updating

 kernel/watchdog.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 80d1a1dae27..2d283e92be5 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -923,10 +923,12 @@ static __init void lockup_detector_setup(void)
 }
 
 #else /* CONFIG_SOFTLOCKUP_DETECTOR */
-static void __lockup_detector_reconfigure(void)
+static void __lockup_detector_reconfigure(bool thresh_changed)
 {
 	cpus_read_lock();
 	watchdog_hardlockup_stop();
+	if (thresh_changed)
+		watchdog_thresh = READ_ONCE(watchdog_thresh_next);
 	lockup_detector_update_enable();
 	watchdog_hardlockup_start();
 	cpus_read_unlock();
-- 
2.47.0


