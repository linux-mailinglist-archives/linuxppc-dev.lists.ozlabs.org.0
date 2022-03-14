Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EB84D8FE4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 23:52:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHWxp4f71z3c2h
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 09:51:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E00V2l4X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHWsD4y5Yz30Dk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 09:48:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=E00V2l4X; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KHWsD4mdjz4xvG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 09:48:00 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KHWsD4jX8z4xvY; Tue, 15 Mar 2022 09:48:00 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=E00V2l4X; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KHWsD2MgZz4xvG
 for <linuxppc-dev@ozlabs.org>; Tue, 15 Mar 2022 09:48:00 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EMMKoO018402; 
 Mon, 14 Mar 2022 22:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=M7WAOYWMnihYSOc2yFDx0GU14fIYDgEiZvbMlcaADoM=;
 b=E00V2l4XJEUW5hg7pfoLASFDDMtgpL9urK2DD7SHVQ1Jx+HowCJOZsb2sN3g8f73luuE
 JeJzRPjjXjmbpyVn9EJVlGAtmM6aJ3/j8U/HaqghrA87p95gz6qC5x32x6puUFEaRr/m
 snYK1lXcondFGlRSM1aO0lbBsM4AeHl4mJyiJozU4ocUaNbAdyHTCuxMYi+sf4R2+Igy
 J7O8CCYuFTAvXlU1Q0drFW1HevKU3qPLy3tsP5r67YzB3c+pJPgcBxg59/oHjjBja2qH
 wwZPrj1uRk8P1Snq9cpHTSl2LXLBaQkEnPJrK0z71sg4CB2zwJMrq0Vin3kQRWZGP+J5 Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eteej8aum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 22:47:53 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22EMisvk022161;
 Mon, 14 Mar 2022 22:47:52 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eteej8au5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 22:47:52 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EMcrbg023911;
 Mon, 14 Mar 2022 22:47:50 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3et95wrf5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 22:47:50 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22EMlmI051511568
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 22:47:48 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A728420E4;
 Mon, 14 Mar 2022 22:47:48 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 663624217A;
 Mon, 14 Mar 2022 22:47:45 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.126.2])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 22:47:45 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [RFC v2 PATCH 5/5] powerpc/crash hp: add crash hotplug support for
 kexec_load
Date: Tue, 15 Mar 2022 04:17:28 +0530
Message-Id: <20220314224728.79990-6-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314224728.79990-1-sourabhjain@linux.ibm.com>
References: <20220314224728.79990-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: P8BPzWEotLSQf3DzFXdsUiVGAh58I-bx
X-Proofpoint-GUID: t_sILsCNQUQw9dcDo1nLKoyapSRtA0q6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=949 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203140128
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

The kernel changes needed to add support for crash hotplug support for
kexec_load system calls are similar to kexec_file_load (which has already
been implemented in earlier patches). Since kexec segment array is
prepared by kexec tool in the userspace, the kernel does aware of which
index FDT segment is present.

The only change was done to enabled crash hotplug support for kexec_load is
updated the crash hotplug handler to identify the FDT segment from kexec
segment array.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/kexec/core_64.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index a4defb84720f..bb449f6e380f 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -480,7 +480,9 @@ int update_cpus_node(void *fdt)
 void arch_crash_hotplug_handler(struct kimage *image,
         unsigned int hp_action, unsigned long a, unsigned long b)
 {
-        void *fdt;
+        void *fdt, *ptr;
+        unsigned int n;
+        unsigned long mem, memsz;
 
 	/* No action needed for CPU hot-unplug */
 	if (hp_action == KEXEC_CRASH_HP_REMOVE_CPU)
@@ -492,6 +494,23 @@ void arch_crash_hotplug_handler(struct kimage *image,
 		return;
 	}
 
+	/* Sine kexec segments for kexec_load system call is prepred by
+	 * kexec tool in userspace we need loop through all the segments
+	 * to find out segment index corresponds FDT segment. In case of
+	 * kexec_file_load it is discovered during the load itself.
+	 */
+        if (!image->fdt_index_valid) {
+                for (n = 0; n < image->nr_segments; n++) {
+                        mem = image->segment[n].mem;
+                        memsz = image->segment[n].memsz;
+                        ptr = __va(mem);
+                        if (ptr && fdt_magic(ptr) == FDT_MAGIC) {
+                                image->fdt_index = n;
+                                image->fdt_index_valid = true;
+                        }
+                }
+        }
+
         /* Must have valid FDT index */
         if (!image->fdt_index_valid) {
                 pr_err("crash hp: unable to locate FDT segment");
-- 
2.35.1

