Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E40B64D8FDB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 23:50:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHWw765Lwz3bmY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 09:50:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DdmG9MjS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHWs63R9Qz306h
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 09:47:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DdmG9MjS; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KHWs500R9z4xvY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 09:47:53 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KHWs473xvz4xvb; Tue, 15 Mar 2022 09:47:52 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DdmG9MjS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KHWs44335z4xvY
 for <linuxppc-dev@ozlabs.org>; Tue, 15 Mar 2022 09:47:52 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EM01DZ012501; 
 Mon, 14 Mar 2022 22:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=V4htBl7ISbH16WC+PY0LKc/YGTQvP/0y2CrlgmKEMVY=;
 b=DdmG9MjS3bXWHmWQvyumDk9uqNaf5Ylu7iOxEvNQ0dEZ2Ht58PSwyCf5IFoHD/8/2fCv
 gAmxeX6Mhsxv7eq+y2d2gOtjW6woaFngaS5lmoQZEy7VfojorFv9mVR5zHOAtJnfbLqq
 CxgtPlhI9/yfM7XAYTwqkk4NAbuvwyiXFjtZhXArj2ffDjHCAwfZYbJWVYZ5o3RY5Ka2
 LFDxbJnKbcSZW/AGUPPScFGSKuCdBS5zFas0CeezsDrOgqabl2B1qL3gen6TfVLyKq8f
 YpK/DMpN2KHpXkz0rIYkU3CL2riwDCBLXQo9uhelmNm4L3y5A7Vyl1Nof9fQNj9mx6Bp lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ete450n8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 22:47:43 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22EMlhrf007962;
 Mon, 14 Mar 2022 22:47:43 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ete450n8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 22:47:43 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EMlfDD028476;
 Mon, 14 Mar 2022 22:47:41 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3erjshmdbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 22:47:41 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22EMldpT51118376
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 22:47:39 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E00B1421FA;
 Mon, 14 Mar 2022 22:47:38 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A977420B9;
 Mon, 14 Mar 2022 22:47:36 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.126.2])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 22:47:36 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [RFC v2 PATCH 2/5] powerpc/crash hp: introduce a new config option
 CRASH_HOTPLUG
Date: Tue, 15 Mar 2022 04:17:25 +0530
Message-Id: <20220314224728.79990-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314224728.79990-1-sourabhjain@linux.ibm.com>
References: <20220314224728.79990-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WQ3cE57LluyuA-fMrNNxuu7aJSMoZIyo
X-Proofpoint-ORIG-GUID: gsVSURXw1F5U70X0Mdp-z3iCW-Pfevr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203140128
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

