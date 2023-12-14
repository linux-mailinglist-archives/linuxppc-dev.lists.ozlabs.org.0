Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D1381278D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 07:03:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B6a81kWj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrMH13C17z3vqL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 17:03:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B6a81kWj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrM7570M5z3cQ7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 16:56:49 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BE3EvTV002599;
	Thu, 14 Dec 2023 05:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=GJ3DflkJ71hJbiYLI+SB612UjG8o6wDZ5KCvtzBQhUc=;
 b=B6a81kWjN5IecOw/SCFaYRokHggMCvDh2R18+8k1noPOmBVDG2hlJts1nZfkxIOjEH+K
 uTL8b2xOoWNsuGlKETpeCgUmFCusL0W23vwi1soPWLPBP5avz/rGG4awaPM2KA11EgQY
 7d9QDBtmyLdqVE3I8ajgtEMQ7V+mtEERdp2feLP/vSlT+qiPVoqn8xKeiM5B0M8gh+nS
 iZh3nWiuiTre/1ZJ6sTQyCyYYgwo2sxSu91hPeSBSekgYtieCJJgrPxc4PiSeFUuZTMn
 3nL3uPM1uJgX1jPghwVdJlXKY9JzhqbCLkHU+Ww2cZoALgOqONvWRd+UWx2A6jmewAH9 +g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uyp5cq85g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 05:56:40 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BE5prqX011260;
	Thu, 14 Dec 2023 05:56:40 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uyp5cq82p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 05:56:39 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BE31fxX008585;
	Thu, 14 Dec 2023 05:56:25 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uw2jtpnfu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 05:56:25 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BE5uO0p8061652
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Dec 2023 05:56:24 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC7552004B;
	Thu, 14 Dec 2023 05:56:23 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D77E20040;
	Thu, 14 Dec 2023 05:56:23 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Dec 2023 05:56:23 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7EC8A60556;
	Thu, 14 Dec 2023 16:56:19 +1100 (AEDT)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: glider@google.com, elver@google.com, dvyukov@google.com,
        akpm@linux-foundation.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 06/13] powerpc/pseries/nvram: Unpoison buffer populated by rtas_call
Date: Thu, 14 Dec 2023 05:55:32 +0000
Message-Id: <20231214055539.9420-7-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231214055539.9420-1-nicholas@linux.ibm.com>
References: <20231214055539.9420-1-nicholas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6Qm5TuhCW2ZCW6IWoQUq-GlcW7W_bWov
X-Proofpoint-GUID: 2p1ymeKpjzD86ICS6ki9AjTIJuqVnLjL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-14_02,2023-12-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=762 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312140035
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: iii@linux.ibm.com, linux-kernel@vger.kernel.org, Nicholas Miehlbradt <nicholas@linux.ibm.com>, linux-mm@kvack.org, kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

rtas_call provides a buffer where the return data should be placed. Rtas
initializes the buffer which is not visible to KMSAN so unpoison it
manually.

Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/nvram.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/nvram.c b/arch/powerpc/platforms/pseries/nvram.c
index 8130c37962c0..21a27d459347 100644
--- a/arch/powerpc/platforms/pseries/nvram.c
+++ b/arch/powerpc/platforms/pseries/nvram.c
@@ -14,6 +14,7 @@
 #include <linux/ctype.h>
 #include <linux/uaccess.h>
 #include <linux/of.h>
+#include <linux/kmsan-checks.h>
 #include <asm/nvram.h>
 #include <asm/rtas.h>
 #include <asm/machdep.h>
@@ -41,6 +42,7 @@ static ssize_t pSeries_nvram_read(char *buf, size_t count, loff_t *index)
 	int done;
 	unsigned long flags;
 	char *p = buf;
+	size_t l;
 
 
 	if (nvram_size == 0 || nvram_fetch == RTAS_UNKNOWN_SERVICE)
@@ -53,6 +55,7 @@ static ssize_t pSeries_nvram_read(char *buf, size_t count, loff_t *index)
 	if (i + count > nvram_size)
 		count = nvram_size - i;
 
+	l = count;
 	spin_lock_irqsave(&nvram_lock, flags);
 
 	for (; count != 0; count -= len) {
@@ -73,6 +76,7 @@ static ssize_t pSeries_nvram_read(char *buf, size_t count, loff_t *index)
 	}
 
 	spin_unlock_irqrestore(&nvram_lock, flags);
+	kmsan_unpoison_memory(buf, l);
 	
 	*index = i;
 	return p - buf;
-- 
2.40.1

