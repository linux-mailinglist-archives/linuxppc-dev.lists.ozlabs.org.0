Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA88D639FB1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 03:49:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL90l4Q8Kz3f3g
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 13:49:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lcER5PCn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lcER5PCn;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL8wh51P2z30JR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 13:45:55 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS1jwpV026327;
	Mon, 28 Nov 2022 02:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=iwfM4PqC5xuma4R+LSGOIpPZGvbAwQgR6S4771UnWTI=;
 b=lcER5PCnXD3gRIjgofak4YhPnvMOjVV1paRtvxqZ/qKxnNgyxGEO7gc3/g4szpjG9iUO
 uUkaqZ/9ZiXC1maQmxI4ChbY9Qag+7sftqQCX81cp77cdtwtboO0h705TfA644CTefvV
 qEYAaA2csbe3zy/dE82cIYK/4t62RikxzTOF5PttCbK/nwHtv+7aYLOUcDHFoqp0UG2z
 dpcbfrnzYhTZ8oTv6fwkJbK8JDK6o2vsrtJHlZ7n793+DNrh74eY4g5q7B1fnUBSlvCt
 6ACNLQ9hkbJa0ztxvanSLKTBOi08kXGwn5nT8FfOAPnQk8ix+7gAz32o3tP+3ILf4EcF tw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vnnumyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 02:45:47 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AS2a97u032559;
	Mon, 28 Nov 2022 02:45:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3m3a2hsurk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 02:45:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AS2jhkq6554252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 02:45:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2AA94A405F;
	Mon, 28 Nov 2022 02:45:43 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7CA7A4054;
	Mon, 28 Nov 2022 02:45:42 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 28 Nov 2022 02:45:42 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 45A3860306;
	Mon, 28 Nov 2022 13:45:39 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 01/13] powerpc/book3s: Add missing <linux/sched.h> include
Date: Mon, 28 Nov 2022 13:44:46 +1100
Message-Id: <20221128024458.46121-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128024458.46121-1-bgray@linux.ibm.com>
References: <20221128024458.46121-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZtQhJXBZ7LclClGhMdRk3WlCpSywNXWe
X-Proofpoint-GUID: ZtQhJXBZ7LclClGhMdRk3WlCpSywNXWe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_02,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280018
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
Cc: ajd@linux.ibm.com, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, cmr@bluescreens.de, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The functions here use struct thread_struct fields, so need to import
the full definition from <linux/sched.h>. The <asm/current.h> header
that defines current only forward declares struct thread_struct.

Failing to include this <linux/sched.h> header leads to a compilation
error when a translation unit does not also include <linux/sched.h>
indirectly.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
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
2.38.1

