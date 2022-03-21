Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3294E21B7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 09:06:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMRzC1xnCz3bPL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 19:06:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r0JrjUSu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMRwz5JVMz3036
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 19:04:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=r0JrjUSu; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KMRwx38VCz4xcq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 19:04:49 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KMRwx36bKz4xc5; Mon, 21 Mar 2022 19:04:49 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=r0JrjUSu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KMRwx06Mvz4xcq
 for <linuxppc-dev@ozlabs.org>; Mon, 21 Mar 2022 19:04:48 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22L6VKKP017288; 
 Mon, 21 Mar 2022 08:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=V4htBl7ISbH16WC+PY0LKc/YGTQvP/0y2CrlgmKEMVY=;
 b=r0JrjUSuz1Ftg88NIaXWYyvMAnCmQ0Xlm2dKhZtjj7xmeq0grtf/b22+ApG81yHywFT7
 9rxl1sfzPeDGwHRqerKmcyNGvRE7vsWeDPu10wgT9V1q3HUNIYYUVmA+rXf/x+yIoNLh
 uYFyfdZDe0fSwn3RjaOHb+WUQQPSSIHicRV8eB+s++/+4IzVIWqoVeHl3huIwwBw9TPc
 4jNB8fHlnZ4LiT0KSTHmmfy0L7T/Iegsu8tt0utxBgv+QnS175BxdGk9TPOGs5iBDcYK
 uKwpuLHz0zNe+4MDb0ygIzsUcDgNN2kvq6v7pt9ADSI1QT+Q9c8he7AEhyNr28jU418l bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3exf1upfdg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 08:04:36 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22L7jJ3Y001968;
 Mon, 21 Mar 2022 08:04:36 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3exf1upfd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 08:04:36 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22L7w7ZU029646;
 Mon, 21 Mar 2022 08:04:34 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3ew6ehubp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 08:04:34 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22L84WPO42205620
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 08:04:32 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30AC65204F;
 Mon, 21 Mar 2022 08:04:32 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.117.210])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B618E5204E;
 Mon, 21 Mar 2022 08:04:29 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [RFC v3 PATCH 2/5] powerpc/crash hp: introduce a new config option
 CRASH_HOTPLUG
Date: Mon, 21 Mar 2022 13:34:19 +0530
Message-Id: <20220321080422.56255-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
References: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IYWaM012jc-yYfjtqmZGbGJJFtD9Gnlj
X-Proofpoint-GUID: 9wc2Fif_iH-irD1KW1EkSQTEoxLFKAXf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_02,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203210049
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
Cc: mahesh@linux.vnet.ibm.com, eric.devolder@oracle.com,
 kexec@lists.infradead.org, bhe@redhat.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The option CRASH_HOTPLUG enables, in kernel update to kexec segments on
hotplug events.

All the updates needed on the capture kernel load path in the kernel for
both kexec_load and kexec_file_load system will be kept under this config.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b779603978e1..b816339ef8c7 100644
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
+	  hotplug events. On hotplug event (CPU/memory) the kexec segments
+	  of capture kernel becomes stale and need to be updated with latest
+	  CPU and memory regions. In this method the kernel performs minimal
+	  update to only relevant kexec segments on CPU hotplug event, instead
+	  of triggering full capture reload from userspace using udev rule.
+
 config PRESERVE_FA_DUMP
 	bool "Preserve Firmware-assisted dump"
 	depends on PPC64 && PPC_POWERNV && !FA_DUMP
-- 
2.35.1

