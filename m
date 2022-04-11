Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2992F4FB651
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 10:48:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcMvb1KH5z3bdK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 18:48:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T03cal3E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcMq04lcnz3bWf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 18:44:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=T03cal3E; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KcMq04V5mz4xR9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 18:44:28 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KcMq04PX1z4xXK; Mon, 11 Apr 2022 18:44:28 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=T03cal3E; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KcMq01s31z4xR9
 for <linuxppc-dev@ozlabs.org>; Mon, 11 Apr 2022 18:44:28 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23B8NQvZ005374; 
 Mon, 11 Apr 2022 08:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=azeUCfJH/3TwKXk3ZijKisYlDUVldmqFgXf+J+qTisU=;
 b=T03cal3EUfhdvihNEZcw8dhvBqyHV3Ari01aJw4/simONgx0gKTKulTaa+XfuY3o56mo
 1W+p0ya0rqPzFaeRI+1RMtik/59g1ezZFskHKA2OE1cyTEdsVdCy3A/m9xlcMiSJTmUl
 FkUtW+n8j073i0kwZYe4n2Rmo20C3MhZMNh6AFq/Js4CfkVaxHs8OzgiSMMp8QR51sdO
 zQ+LF7tuEMMhHsI1oBmbE6xwiSkchNc5RXEgofDI6mzrDEn8qahZRxcSPNuyZLIWDLE8
 T1pExsRLl0D0xFn83tmEGFiN9fR4W0qcwTIs+5csqFckzHiCPQ8GUjMOiiao86S07ko+ ww== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fcgserbdp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 08:44:20 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23B8e3oG029899;
 Mon, 11 Apr 2022 08:44:20 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fcgserbcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 08:44:20 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23B8ha60030909;
 Mon, 11 Apr 2022 08:44:18 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3fb1dj2rnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 08:44:17 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23B8iFxs40042890
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 08:44:15 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF7475204E;
 Mon, 11 Apr 2022 08:44:14 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.41.3])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 96FE952050;
 Mon, 11 Apr 2022 08:44:12 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [RFC v4 PATCH 5/5] powerpc/crash hp: add crash hotplug support for
 kexec_load
Date: Mon, 11 Apr 2022 14:13:57 +0530
Message-Id: <20220411084357.157308-6-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411084357.157308-1-sourabhjain@linux.ibm.com>
References: <20220411084357.157308-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7k_nnS1s36DH0HsQ98Evh8avVeDL1HtY
X-Proofpoint-GUID: 4SREhPDy6V4ygzNqDLgQ8eYVoW54yYes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-11_03,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=737 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204110047
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

The kernel changes needed for crash hotplug support for kexec_load system
calls are similar to kexec_file_load (which has already been implemented
in earlier patches) except for finding the index of the FDT segment in the
kexec segment array. Since the kexec segment array is prepared by the
kexec tool in the userspace, the kernel is not aware of at which index FDT
segment is present.

Now to enable crash hotplug support for the kexec_load case, the crash
hotplug handler is updated to identify the index at which the FDT segment
is present in the kexec segment array by comparing the first 32 bits of
every kexec segment with the FDT magic number.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/kexec/core_64.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 62f77cc86407..e3f224f8eb3a 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -480,7 +480,9 @@ int update_cpus_node(void *fdt)
 void arch_crash_hotplug_handler(struct kimage *image, unsigned int hp_action,
 				unsigned long a, unsigned long b)
 {
-	void *fdt;
+	void *fdt, *ptr;
+	unsigned int n;
+	unsigned long mem, memsz;
 
 	/* No action needed for CPU hot-unplug */
 	if (hp_action == KEXEC_CRASH_HP_REMOVE_CPU)
@@ -492,6 +494,24 @@ void arch_crash_hotplug_handler(struct kimage *image, unsigned int hp_action,
 		return;
 	}
 
+	/* Sine kexec segments for kexec_load system call is prepred by
+	 * kexec tool in userspace we need loop through all the segments
+	 * to find out segment index corresponds FDT segment. In case of
+	 * kexec_file_load it is discovered during the load itself.
+	 */
+	if (!image->arch.fdt_index_valid) {
+		for (n = 0; n < image->nr_segments; n++) {
+			mem = image->segment[n].mem;
+			memsz = image->segment[n].memsz;
+			ptr = __va(mem);
+			if (ptr && fdt_magic(ptr) == FDT_MAGIC) {
+				image->arch.fdt_index = n;
+				image->arch.fdt_index_valid = true;
+				break;
+			}
+		}
+	}
+
 	/* Must have valid FDT index */
 	if (!image->arch.fdt_index_valid) {
 		pr_err("crash hp: unable to locate FDT segment");
-- 
2.35.1

