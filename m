Return-Path: <linuxppc-dev+bounces-6339-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C268A3B1CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2025 07:49:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YyRp00spvz30DL;
	Wed, 19 Feb 2025 17:49:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739947768;
	cv=none; b=c9GeVj2YOmy5u7gaCqjUignby/hesFRh79ARg94OCfzgOohYBj4HHSpeRR+kGkHTYXxePeMLgSeXBJjKxXUMU9/XxAJdqWagTqKp3mDl+F+1eaDiPSJJisrXKrm1IJJh07HfOMB45m0Wt/GOebWdfkjNOFlm/c+3o28bATiQxAFG6duUOpcq7ToKve/i7HbSaTaj9wt0nMjBx+MlfEI8vvOIpDra5jmwCf7ZmtUUwISHdNO801XvKtb6Zkkln+zaaLtSg6AIRZWhM+UB2lVBgawg9GX8T3HAKyejuDvTMaJIcEEruhHQPwgbSmKnkctI/LFyMZSAFv+ptcY7Nc92/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739947768; c=relaxed/relaxed;
	bh=5Td/1EBVEkgD1oa1Ju/ZgrZ3KbHXNrdWKjxKieYz830=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oJqJGED3L3JyVdRjw5gDZkespVGaHuBrHPMqTNco6gzqEjUuRdujBHtnZaEt3gtwjSZLeYPQl83R8BWNYqYgG32suZrafcY4eh3YrOplMEu2m3b0pcrCCkAKWsxRJvuAu2rn5CiFtus4sPH1CXkW20PjWQ7+DSXZDOu/ere+zdRFYVRL0T+ogZaxfqwptqnXqOhJh2GJ18Cdx41MK7Oo1A7TFePyME7CrSsXoNYt4aPji1Wnt1zauN0uxWxnbSE3YPd5fn8GVE3bagcw21oQ6FAL1UW7nZ9zbOA9azZ0446rO6f8XxD325a5IloV9TOIS30yEY2ysvStjvIFIyVunw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fBnW6z16; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fBnW6z16;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YyRnz2MdXz2yvn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 17:49:27 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J6gvDZ024457;
	Wed, 19 Feb 2025 06:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=5Td/1EBVEkgD1oa1Ju/ZgrZ3KbHXNrdWKjxKieYz8
	30=; b=fBnW6z16fRCvNb5vI9ApM/mHHLjarfGEpr17e+jABWyHkSbVgEGZjrQlv
	lA6t0nAWsF1EhVIoxtbWmAg3oa2F9NIuh2zTQECE61QAvg8oshH8PRi6M/uPLyKp
	ecFXyXf9UApBYP7ETVWIUpiKYTfP6W6A+UiB4kyYu3g8+ITFI9OoZhsnUG28jd3C
	FBZBemwLBzSHFMg/Vp7cP6kcf6UBDkJgJ6aCCjZLyt9wyEfw6DAwUdFYsJL5RKwQ
	MkYXhAsr7du6/5yjl1/q0HJkesjnrMTHRaJaux049l2iQj2XjFocG+3ftat1Okfz
	z+5ehb51masl896R3kh5bqq5GoWnQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44w6508wb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 06:49:10 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51J6jJRc031675;
	Wed, 19 Feb 2025 06:49:09 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44w6508wb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 06:49:09 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51J2qdRc027077;
	Wed, 19 Feb 2025 06:49:09 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44w0252mk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 06:49:09 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51J6n76Y46268910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Feb 2025 06:49:07 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7319E20043;
	Wed, 19 Feb 2025 06:49:07 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BAC920040;
	Wed, 19 Feb 2025 06:49:07 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Feb 2025 06:49:07 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5A6F26033C;
	Wed, 19 Feb 2025 17:49:03 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: fbarrat@linux.ibm.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        mchehab+huawei@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] cxl: Fix cross-reference in documentation and add deprecation warning
Date: Wed, 19 Feb 2025 17:48:07 +1100
Message-ID: <20250219064807.175107-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
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
X-Proofpoint-ORIG-GUID: tKFk8PXlKl9yYgUusz0jIcGvdHrDIO3i
X-Proofpoint-GUID: NBVEZ2Lae_W2v6McCmKondep1aMQe1KH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_02,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=558 spamscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190049
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

commit 5731d41af924 ("cxl: Deprecate driver") labelled the cxl driver as
deprecated and moved the ABI documentation to the obsolete/ subdirectory,
but didn't update cxl.rst, causing a warning once ff7ff6eb4f809 ("docs:
media: Allow creating cross-references for RC ABI") was merged.

Fix the cross-reference, and also add a deprecation warning.

Fixes: 5731d41af924 ("cxl: Deprecate driver")
Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

---

Maddy: can we take this by powerpc-fixes?
---
 Documentation/arch/powerpc/cxl.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/powerpc/cxl.rst b/Documentation/arch/powerpc/cxl.rst
index d2d77057610e..778adda740d2 100644
--- a/Documentation/arch/powerpc/cxl.rst
+++ b/Documentation/arch/powerpc/cxl.rst
@@ -18,6 +18,7 @@ Introduction
     both access system memory directly and with the same effective
     addresses.
 
+    **This driver is deprecated and will be removed in a future release.**
 
 Hardware overview
 =================
@@ -453,7 +454,7 @@ Sysfs Class
 
     A cxl sysfs class is added under /sys/class/cxl to facilitate
     enumeration and tuning of the accelerators. Its layout is
-    described in Documentation/ABI/testing/sysfs-class-cxl
+    described in Documentation/ABI/obsolete/sysfs-class-cxl
 
 
 Udev rules
-- 
2.48.1


