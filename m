Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C07C4FB647
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 10:45:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcMrJ1DH0z3bqr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 18:45:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=INBQXsSU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcMpt6VhNz2xX6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 18:44:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=INBQXsSU; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KcMpt6Q1Zz4xQp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 18:44:22 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KcMpt6Ly4z4xR9; Mon, 11 Apr 2022 18:44:22 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=INBQXsSU; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KcMpt3QMrz4xQp
 for <linuxppc-dev@ozlabs.org>; Mon, 11 Apr 2022 18:44:22 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23B7MxS6025467; 
 Mon, 11 Apr 2022 08:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8X4FhOVFAU6Am/8neaStMcqOAMPYxII8AIcVYYPUMn0=;
 b=INBQXsSUNIyhqEInVCImK0ANymNcd9WvjowQTdPEcsxUvV9SCee6lLtQ3OguRbuTlxrR
 LUjP+BskBKU1CZ2FDXzily8UwvJxCcJ2VLOFQEr24zuFMyazSBWF+o7Erj9EQo1Anabs
 /gu2Vf5WNCxxsktNpZCJkNRNHec5psKb78h0ydXNA0Dl6tu1bpvf5xd7l+TDFBa0Fx4h
 LtWfjpZ/rrolBoyAaOq6TG+M+XjuzSWwOgPbdq6y3IKxzNvFhc59YCoGVKiniMzdIXZp
 YuvHfT/xrXWwW0XhqIIdiQ61vQIg8MfSnik7We0rtFkcQChTo+bXW6J4DIRHjkgUTqB7 dA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fcfvwsgr2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 08:44:12 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23B8RZql000876;
 Mon, 11 Apr 2022 08:44:11 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fcfvwsgqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 08:44:11 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23B8hmKk023296;
 Mon, 11 Apr 2022 08:44:09 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3fb1s8j5jb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 08:44:09 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23B8i6xC34996526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 08:44:06 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73F5352065;
 Mon, 11 Apr 2022 08:44:06 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.41.3])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1565D5204E;
 Mon, 11 Apr 2022 08:44:03 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [RFC v4 PATCH 2/5] powerpc/crash hp: introduce a new config option
 CRASH_HOTPLUG
Date: Mon, 11 Apr 2022 14:13:54 +0530
Message-Id: <20220411084357.157308-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411084357.157308-1-sourabhjain@linux.ibm.com>
References: <20220411084357.157308-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tnTfltXpvujpRjjRrftGIhuB7DCWyRJj
X-Proofpoint-GUID: Szu43bg33qaADzJw08PCVo6o-1GOUlfz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-11_03,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204110045
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
Cc: eric.devolder@oracle.com, bhe@redhat.com, mahesh@linux.vnet.ibm.com,
 kexec@lists.infradead.org, ldufour@linux.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The option CRASH_HOTPLUG enables, in kernel update to kexec segments on
hotplug events.

All the updates needed on the capture kernel load path in the kernel for
both kexec_load and kexec_file_load system will be kept under this config.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>
---
 arch/powerpc/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b779603978e1..777db33f75b5 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -623,6 +623,17 @@ config FA_DUMP
 	  If unsure, say "y". Only special kernels like petitboot may
 	  need to say "N" here.
 
+config CRASH_HOTPLUG
+	bool "kernel updates of crash kexec segments"
+	depends on CRASH_DUMP && (HOTPLUG_CPU) && KEXEC_FILE
+	help
+	  An efficient way to keep the capture kernel up-to-date with CPU
+	  hotplug events. On CPU hotplug event the kexec segments of capture
+	  kernel becomes stale and need to be updated with latest CPU data.
+	  In this method the kernel performs minimal update to only relevant
+	  kexec segments on CPU hotplug event, instead of triggering full
+	  capture kernel reload from userspace using udev rule.
+
 config PRESERVE_FA_DUMP
 	bool "Preserve Firmware-assisted dump"
 	depends on PPC64 && PPC_POWERNV && !FA_DUMP
-- 
2.35.1

