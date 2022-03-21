Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 741DA4E21BA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 09:08:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMS1h3237z3c40
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 19:08:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p4PfTSaQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMRx23wRKz30JY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 19:04:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=p4PfTSaQ; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KMRx23lsDz4xPv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 19:04:54 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KMRx23jp7z4xc5; Mon, 21 Mar 2022 19:04:54 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=p4PfTSaQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KMRx21TkQz4xPv
 for <linuxppc-dev@ozlabs.org>; Mon, 21 Mar 2022 19:04:54 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22L7LrGt024535; 
 Mon, 21 Mar 2022 08:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WY4hd0YgyovDMPmsEdYMurX91NOaC2B2rys7jycpb0g=;
 b=p4PfTSaQcK8uPc5eK6kXZ2zLD0Plhp6p833kYL6A1jxnntLa+Ki0OGdaXkttrcKYJMPZ
 bPhhkATmv/rxJQEIsLJzu2t7SO242cXnf7P1uZche0dJXcdFJA1/Ss61p9Uehz/irRh/
 8/xsvOlnbD5fvHfKTEEIh9c8sa2odFv3HZd/li+rtE3wdKmnt7NbPxrpkehFWpYE4c2r
 yHqJzyzYcaqnza/lcXnNDyC7WUqJnBRVvKyn83l15U7j2Ej35xo9qPbbUXl9d+3knefQ
 JfwwR00EKdVcbM4D/isEDvm51urpGgbZhRjthGS08QSAOpx7wRF+YfD/eO3XIzd5FPvT cA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3exmwk95a0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 08:04:46 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22L81TVC002581;
 Mon, 21 Mar 2022 08:04:46 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3exmwk9594-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 08:04:45 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22L84Wtp026926;
 Mon, 21 Mar 2022 08:04:43 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3ew6t9avk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 08:04:43 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22L84f6H47186176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 08:04:41 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A9C35204F;
 Mon, 21 Mar 2022 08:04:41 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.117.210])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 944425204E;
 Mon, 21 Mar 2022 08:04:38 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [RFC v3 PATCH 5/5] powerpc/crash hp: add crash hotplug support for
 kexec_load
Date: Mon, 21 Mar 2022 13:34:22 +0530
Message-Id: <20220321080422.56255-6-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
References: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: feeDWoxgajiBMxL8LXKOdSNX2terRQJm
X-Proofpoint-GUID: DECnlzmfjErlhVst-Ys72Gavawwyn_O3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_02,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 adultscore=0 mlxlogscore=967 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
index a470fe6904e3..2c248dfb169b 100644
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
@@ -492,6 +494,23 @@ void arch_crash_hotplug_handler(struct kimage *image, unsigned int hp_action,
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
+			}
+		}
+	}
+
 	/* Must have valid FDT index */
 	if (!image->arch.fdt_index_valid) {
 		pr_err("crash hp: unable to locate FDT segment");
-- 
2.35.1

