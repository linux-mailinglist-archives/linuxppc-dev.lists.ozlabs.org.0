Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3DC6C4263
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 06:51:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhHdh0r5Jz3f6k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 16:51:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sNvnBGdE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sNvnBGdE;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhHXh5PtQz3c8x
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 16:46:44 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32M1wtIc000970
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=b2LsZlHVE+vma50K3IOm9eitQrqBlMfQ4G49ERy5Bu4=;
 b=sNvnBGdEZMcDRxhV3cjorLUy1/XirX6vaI2SLqvXeduoloIWVl8hNwGuBOgFbVUZLQlh
 Y3KDXP3uErrG1dmdfL91RZ0YpGrRJoP9HsPleechcEzDQo7xfHsLy0dUNxFZurTmTPkN
 TmE0HOQ35E6Pybqm4YejP84Ur1nH++mX2E+Mg/tQyWrXp0qLiHO49Toh/w5yAiJEjLvu
 NnveobcGKkFHfI4vY/y5cTQ6LS3z4xFiLzHyDDIopF+f7dh1qLgxxK+j7Gw2lbge5tvW
 pXKNnXWUTYoUd5C8NnXP7XaIWV/gybP2KqLrncJIolq0/N+gimq0C/S9xpGss5SlOmK0 UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pfjje3ang-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:40 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32M5jTqH004595
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:40 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pfjje3an2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Mar 2023 05:46:40 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32M0BpVN015137;
	Wed, 22 Mar 2023 05:46:38 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3pd4jfdftj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Mar 2023 05:46:38 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32M5kZsR58458412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Mar 2023 05:46:35 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A9BCB2004B;
	Wed, 22 Mar 2023 05:46:35 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A23720043;
	Wed, 22 Mar 2023 05:46:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 Mar 2023 05:46:35 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 816A160463;
	Wed, 22 Mar 2023 16:46:32 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/9] powerpc/book3s: Add missing <linux/sched.h> include
Date: Wed, 22 Mar 2023 16:46:04 +1100
Message-Id: <20230322054612.1340573-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322054612.1340573-1-bgray@linux.ibm.com>
References: <20230322054612.1340573-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SXXlMSHN-GB5CwBFbxHGdJATjUG-ZRH8
X-Proofpoint-ORIG-GUID: I-SK2irAaO4uhql_3p6GLJoeLxqRIdc4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220039
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The functions here use struct thread_struct fields, so need to import
the full definition from <linux/sched.h>. The <asm/current.h> header
that defines current only forward declares struct thread_struct.

Failing to include this <linux/sched.h> header leads to a compilation
error when a translation unit does not also include <linux/sched.h>
indirectly.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

---

v1:	* Add npiggin reviewed-by
---
 arch/powerpc/include/asm/book3s/64/kup.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 54cf46808157..84c09e546115 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -194,6 +194,7 @@
 #else /* !__ASSEMBLY__ */
 
 #include <linux/jump_label.h>
+#include <linux/sched.h>
 
 DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
 
-- 
2.39.2

