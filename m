Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E74EC611703
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 18:07:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzS9z54g9z3chn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 03:07:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZXCtEZNo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZXCtEZNo;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzS87436hz3cK7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 03:05:59 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SFi76Q037322;
	Fri, 28 Oct 2022 16:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Ag61Q8Xg55sUv7jlbJD5dxol/V7IGyeMOcpLHVlRgKg=;
 b=ZXCtEZNoaDkxNsFS8wPL7gpTXbQ6DM9x+hpzZAMVQaSB62KgKQkhciwtTJrQf5d+hTQX
 7GIT2rZMaAtQ+HN360Vzeb+bmIidbeBO4BpYekBWw9uL3rtfLhLUiLYwSEMMB6Y0dgTS
 VIiKhUciRl0t0hR/q1DbYZwKhLapqIADnasUdQjnv03E9wSaU77LEjEnfR+5MdpoXzmV
 bq921REj5QBQxlXPBfiB/m4CypAGC1lYgkbyOZONcFxXXqNErlaXrvcbyvvz+ERtlDBX
 kAcJqixo/j8UgofGqbG5ym62LdFxr4mooOJNfyy2h0rm6MtkkY4aZrUv6YEw+gRzsUy3 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kghyw8q6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 16:05:49 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29SFlXf5010291;
	Fri, 28 Oct 2022 16:05:49 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kghyw8q59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 16:05:49 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29SFppHt004243;
	Fri, 28 Oct 2022 16:00:38 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma06fra.de.ibm.com with ESMTP id 3kfbg2ar0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 16:00:38 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29SG1BhP29295030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Oct 2022 16:01:11 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8614711C04A;
	Fri, 28 Oct 2022 16:00:36 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D25511C04C;
	Fri, 28 Oct 2022 16:00:36 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.94.157])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 28 Oct 2022 16:00:36 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: [PATCH 2/2] powerpc: Take in account addition CPU node when building kexec FDT
Date: Fri, 28 Oct 2022 18:00:34 +0200
Message-Id: <20221028160034.44400-3-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221028160034.44400-1-ldufour@linux.ibm.com>
References: <20221028160034.44400-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JPYw-6l1ZhIYxfCFG3f87yUQjTYgtouA
X-Proofpoint-ORIG-GUID: XDD6smsMZ-tfigq6HbcTJXcfw1qNR-gN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On a system with a large number of CPUs, the creation of the FDT for a
kexec kernel may fail because the allocated FDT is not large enough.

When this happens, such a message is displayed on the console:

Unable to add ibm,processor-vadd-size property: FDT_ERR_NOSPACE

The property's name may change depending when the buffer overwrite is
detected.

Obviously the created FDT is missing information, and it is expected that
system dump or kexec kernel failed to run properly.

When the FDT is allocated, the size of the FDT the kernel received at boot
time is used and an extra size can be applied. Currently, only memory added
after boot time is taken in account, not the CPU nodes.

The extra size should take in account these additional CPU nodes and
compute the required extra space. To achieve that, the size of a CPU node,
including its subnode is computed once and multiplied by the number of
additional CPU nodes.

The assumption is that the size of the CPU node is _same_ for all the node,
the only variable part should be the name "PowerPC,POWERxx@##" where "##"
may vary a bit.

Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/kexec/file_load_64.c | 59 ++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 349a781cea0b..1476922cd7c5 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -928,6 +928,46 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 	return ret;
 }
 
+/**
+ * get_cpu_node_size - Compute the size of a CPU node in the FDT.
+ *                     This should be done only once and the value is stored in
+ *                     a static variable.
+ * Returns the max size of a CPU node in the FDT.
+ */
+static unsigned int cpu_node_size(void)
+{
+	static unsigned int cpu_node_size;
+	struct device_node *dn;
+	struct property *pp;
+
+	/*
+	 * Don't compute it twice, we are assuming that the per CPU node size
+	 * doesn't change during the system's life.
+	 */
+	if (cpu_node_size)
+		return cpu_node_size;
+
+	dn = of_find_node_by_type(NULL, "cpu");
+	if (!dn) {
+		/* Unlikely to happen */
+		WARN_ON_ONCE(1);
+		return 0;
+	}
+
+	/*
+	 * We compute the sub node size for a CPU node, assuming it
+	 * will be the same for all.
+	 */
+	cpu_node_size += strlen(dn->name) + 5;
+	for_each_property_of_node(dn, pp) {
+		cpu_node_size += strlen(pp->name);
+		cpu_node_size += pp->length;
+	}
+
+	of_node_put(dn);
+	return cpu_node_size;
+}
+
 /**
  * kexec_extra_fdt_size_ppc64 - Return the estimated additional size needed to
  *                              setup FDT for kexec/kdump kernel.
@@ -937,7 +977,10 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
  */
 unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
 {
+	struct device_node *dn;
 	u64 usm_entries;
+	unsigned int cpu_nodes = 0;
+	unsigned int extra_size;
 
 	if (image->type != KEXEC_TYPE_CRASH)
 		return 0;
@@ -949,7 +992,21 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage *image)
 	 */
 	usm_entries = ((memblock_end_of_DRAM() / drmem_lmb_size()) +
 		       (2 * (resource_size(&crashk_res) / drmem_lmb_size())));
-	return (unsigned int)(usm_entries * sizeof(u64));
+
+	extra_size = (unsigned int)(usm_entries * sizeof(u64));
+
+	/*
+	 * Get the number of CPU nodes in the current DT. This allows to
+	 * reserve places for CPU nodes added since the boot time.
+	 */
+	for_each_node_by_type(dn, "cpu") {
+		cpu_nodes++;
+	}
+
+	if (cpu_nodes > boot_cpu_node_count)
+		extra_size += (cpu_nodes - boot_cpu_node_count) * cpu_node_size();
+
+	return extra_size;
 }
 
 /**
-- 
2.38.1

