Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6B949F6D0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 11:05:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlY4N4pDvz3cCG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 21:05:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D4X6aJpm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JlY3Z5FK0z2ymg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 21:04:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=D4X6aJpm; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4JlY3Z4XnHz4xcY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 21:04:58 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4JlY3Z4VjNz4xcQ; Fri, 28 Jan 2022 21:04:58 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=D4X6aJpm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4JlY3Z29Dqz4xcF;
 Fri, 28 Jan 2022 21:04:57 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20S8Zo6o030036; 
 Fri, 28 Jan 2022 10:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=oq/hNNKUkT/5vXLb+ebiZ0DeZkpawldkuhDqT6tsElQ=;
 b=D4X6aJpm+KL4Q1nwufgYxUqc+5Pug8GPiRKPhBFuCNYy8WkDcE0aAD6d5DJm4H4U9wDX
 r2QJW19NY3B82UJJwdtkSY9SSfuwe8BTVALvmLVdYHZjq9iJI5+49Ibq1M1SavhpmMFl
 J/bjrSW2On3QgNBCtskRwv1ZTSQ7MvTTbsFXkFCtKSXrLY0FBVw6LpGP5yqiktcbvZGA
 zqY3uTtMMFFg5V8G70xwnrULxnNC4TJ1DycKhh75awYVfU7OGKScaDmTyZUfZaNakF6l
 6kA2VmIUTaxFG0vSGQgN3+lfXTmlTqagulkAMt2z08cUZRzoYo86yo3NdOlSvcNwCM/q UA== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dv5a9h9k3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 10:04:54 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20SA2dxE010192;
 Fri, 28 Jan 2022 10:04:52 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3dr96k5k65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 10:04:52 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20SA4ook19530236
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 10:04:50 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F8ABA405B;
 Fri, 28 Jan 2022 10:04:50 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2291A4064;
 Fri, 28 Jan 2022 10:04:47 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.62.128])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 28 Jan 2022 10:04:47 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: powerpc: Set crashkernel offset to mid of RMA region
Date: Fri, 28 Jan 2022 15:34:45 +0530
Message-Id: <20220128100445.251233-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: q7GlqOUz26qoLbkuQbb404YwKohqd8pm
X-Proofpoint-ORIG-GUID: q7GlqOUz26qoLbkuQbb404YwKohqd8pm
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_01,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201280062
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
Cc: mahesh@linux.vnet.ibm.com, hbathini@linux.ibm.com,
 Abdul haleem <abdhalee@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On large config LPARs (having 192 and more cores), Linux fails to boot
due to insufficient memory in the first memblock. It is due to the
memory reservation for the crash kernel which starts at 128MB offset of
the first memblock. This memory reservation for the crash kernel doesn't
leave enough space in the first memblock to accommodate other essential
system resources.

The crash kernel start address was set to 128MB offset by default to
ensure that the crash kernel get some memory below the RMA region which
is used to be of size 256MB. But given that the RMA region size can be
512MB or more, setting the crash kernel offset to mid of RMA size will
leave enough space for kernel to allocate memory for other system
resources.

Since the above crash kernel offset change is only applicable to the LPAR
platform, the LPAR feature detection is pushed before the crash kernel
reservation. The rest of LPAR specific initialization will still
be done during pseries_probe_fw_features as usual.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Reported-and-tested-by: Abdul haleem <abdhalee@linux.vnet.ibm.com>

---
 arch/powerpc/kernel/rtas.c |  4 ++++
 arch/powerpc/kexec/core.c  | 15 +++++++++++----
 2 files changed, 15 insertions(+), 4 deletions(-)

 ---
 Change in v3:
	Dropped 1st and 2nd patch from v2. 1st and 2nd patch from v2 patch
	series [1] try to discover 1T segment MMU feature support
	BEFORE boot CPU paca allocation ([1] describes why it is needed).
	MPE has posted a patch [2] that archives a similar objective by moving
	boot CPU paca allocation after mmu_early_init_devtree().

NOTE: This patch is dependent on the patch [2].

[1] https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20211018084434.217772-3-sourabhjain@linux.ibm.com/
[2] https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-January/239175.html
 ---

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 733e6ef36758..06df7464fb57 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1313,6 +1313,10 @@ int __init early_init_dt_scan_rtas(unsigned long node,
 	entryp = of_get_flat_dt_prop(node, "linux,rtas-entry", NULL);
 	sizep  = of_get_flat_dt_prop(node, "rtas-size", NULL);
 
+	/* need this feature to decide the crashkernel offset */
+	if (of_get_flat_dt_prop(node, "ibm,hypertas-functions", NULL))
+		powerpc_firmware_features |= FW_FEATURE_LPAR;
+
 	if (basep && entryp && sizep) {
 		rtas.base = *basep;
 		rtas.entry = *entryp;
diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index 8b68d9f91a03..abf5897ae88c 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -134,11 +134,18 @@ void __init reserve_crashkernel(void)
 	if (!crashk_res.start) {
 #ifdef CONFIG_PPC64
 		/*
-		 * On 64bit we split the RMO in half but cap it at half of
-		 * a small SLB (128MB) since the crash kernel needs to place
-		 * itself and some stacks to be in the first segment.
+		 * On the LPAR platform place the crash kernel to mid of
+		 * RMA size (512MB or more) to ensure the crash kernel
+		 * gets enough space to place itself and some stack to be
+		 * in the first segment. At the same time normal kernel
+		 * also get enough space to allocate memory for essential
+		 * system resource in the first segment. Keep the crash
+		 * kernel starts at 128MB offset on other platforms.
 		 */
-		crashk_res.start = min(0x8000000ULL, (ppc64_rma_size / 2));
+		if (firmware_has_feature(FW_FEATURE_LPAR))
+			crashk_res.start = ppc64_rma_size / 2;
+		else
+			crashk_res.start = min(0x8000000ULL, (ppc64_rma_size / 2));
 #else
 		crashk_res.start = KDUMP_KERNELBASE;
 #endif
-- 
2.34.1

