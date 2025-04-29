Return-Path: <linuxppc-dev+bounces-8166-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC0DAA1CB9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 23:14:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnCkQ3n4Hz2ySW;
	Wed, 30 Apr 2025 07:14:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745961278;
	cv=none; b=m2y/swijUfPlCHuVFDP2pX1ASWeOBJzntLkwGm1AR5XEmtpKaNSt7bvq7GtmdR1BiNhoFXBxImJm9a+8e9fS9vamH4U92d6onJZOu1Jp8HKUJc8+5nndScGX0qfxajMXHEe+rAl2PWruIfft0E6Gn3hIkVIkj2hQebW4p0m64iU1XedhaCG7HuRpGLyx2vrcCv7N3v5AMmuWvhtOJTHjN97tGoOTAQuM57VAmEzaVuvxRfFYoHtf0DDKb1ZrlBQw6QkzNCcI2nNsdZj1p3URNZKc5M+wzp1gS36H5KnpHuV1E/ST41tK2quh8v7q+U+OAiFPs5475tlH9Uyw482kIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745961278; c=relaxed/relaxed;
	bh=o4kfW0CZtaxODQ2nyZUMar4KmvI/zq8Gtr2YS+w8zD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y5CTiSMA6o1P+VxM3pcNmqbHfgfmG0Perqqn7Q/nKolknOsqed2AJ88SMrPWCMrsu1Gnc1KVRANl57kxtt4kNtb/rnfBzs/kGsQFAAWlRW45rpkQ1EDAxerkOyZVHWGliBig3jdfE+/vl9M3q3/EliqzKWW1SASRN6Jbmws6z6XPbW3H1SFCmWpBlCR16eza9OoxfZNshVVJ8boSDylkAGMZLN7rjRvBRwZIrrB8VJtisvG9U+2CAhXxGvV+djTX3lH32QsU0kYIgX7X7pJ0XGismEtb+WBkh1EPYr/hPvT3UzNPllVV81yVrFyg5IBhkdAVciCmOSIkAo6b3TsoXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yf4vC5e4; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yf4vC5e4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZnCkP0lm8z2ySN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 07:14:36 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TJCDAd009393;
	Tue, 29 Apr 2025 21:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=o4kfW0CZtaxODQ2nyZUMar4KmvI/zq8Gtr2YS+w8z
	D4=; b=Yf4vC5e4OU7syeBf9phF57SSPmh09CHy3e1LdKPwOo7ZVx3MSYTMs0zsj
	IEk2Xu1NE0sphp4cN+Br9MUo/docHWhUy3TDF6t8ryBEj5OZQmhC4DikGCiaQkxT
	AoYenEX+52mVPgTlO7hhT5OiLC8pU3Nve+qPvbgpiyyovOI+zg+5GcqYFr/LoUCs
	r+SDgGj79tAU3s9RMvUE6gB8n9cmhKAiQEprTRVw8Y6F1/w6k10iD2vZlUaeKKRB
	CwX6tlRtUy0SwGfwErAIYaMQLQHgHaO3vO+otsVmH6AJN87JrLmpMkn7bJfDHz0h
	3tkGxHfw3H2Z75KGOIbbBEVQ4U51g==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46aw7t2ucd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 21:14:27 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53THLUi8000666;
	Tue, 29 Apr 2025 21:14:26 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469atpd53e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 21:14:26 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53TLENKW30016036
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 21:14:24 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D723758062;
	Tue, 29 Apr 2025 21:14:23 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E086158054;
	Tue, 29 Apr 2025 21:14:22 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.186.27])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 29 Apr 2025 21:14:22 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, sfr@canb.auug.org.au, tyreld@linux.ibm.com,
        linux-next@vger.kernel.org, hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH] powerpc/pseries: Include linux/types.h in papr-platform-dump.h
Date: Tue, 29 Apr 2025 14:14:18 -0700
Message-ID: <20250429211419.1081354-1-haren@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDE1NiBTYWx0ZWRfXxrnvX5Q2NAUr 8c/nu6b5t0J3e9CkVxeArCgh1I0IJmIRdtBBWfitR3bt8m/80ygw0NrW+34t0HLX8CqeSue71M9 1yMkr8rsD9s2RUj5FKhzNKbhCIEJrPRSLEEVttU5jemYHtEkd0QHTNbZ+bnNI1ep0XPT2F4xXIB
 hX+yhSdMbfSpORp3fBMgP5jrx7ztFkaAH8cgG7Loov1yY2rfjsLuzTvnsjYkpYkY9w+L65CXMrk ErXc3ENJut9xiVe+Ld4/+N0uUALUhfwg8gcJarTHtfVEdId9dWUV0qSUuvED0twubcIfkRFba9B DW2LYoGkYFM1Zq/FQxYVIwH03QhYTZbQu9vDd6idqCfXYfFvv6l9jKpTXi8HRWWk3vsR3j6TuUP
 UZyarLESHH5m7B4MGA36czCxYieB4TsSMqPLiXHjjl51tOoAvT9IWy8nM0VXGgaYoOCZXUJ8
X-Proofpoint-GUID: SruYYSz7Yl3R9JfTCELRAW1fr3l2bz8P
X-Authority-Analysis: v=2.4 cv=MJRgmNZl c=1 sm=1 tr=0 ts=68114133 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=VnNF1IyMAAAA:8 a=IJ5uNYSzlZeX1pgoDwQA:9 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-ORIG-GUID: SruYYSz7Yl3R9JfTCELRAW1fr3l2bz8P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxlogscore=950
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290156
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fix the following build warning:
usr/include/asm/papr-platform-dump.h:12: found __[us]{8,16,32,64} type without #include <linux/types.h>

Fixes: 8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character driver for dump retrieval")
Closes: https://lore.kernel.org/linux-next/20250429185735.034ba678@canb.auug.org.au/

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/uapi/asm/papr-platform-dump.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/uapi/asm/papr-platform-dump.h b/arch/powerpc/include/uapi/asm/papr-platform-dump.h
index a1d89c290dab..8a1c060e89a9 100644
--- a/arch/powerpc/include/uapi/asm/papr-platform-dump.h
+++ b/arch/powerpc/include/uapi/asm/papr-platform-dump.h
@@ -2,6 +2,7 @@
 #ifndef _UAPI_PAPR_PLATFORM_DUMP_H_
 #define _UAPI_PAPR_PLATFORM_DUMP_H_
 
+#include <linux/types.h>
 #include <asm/ioctl.h>
 #include <asm/papr-miscdev.h>
 
-- 
2.43.5


