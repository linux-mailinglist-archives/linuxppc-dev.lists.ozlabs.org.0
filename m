Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9740B8C2209
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 12:24:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A/vX2Xpq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VbQ461QXtz3g0h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 20:24:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A/vX2Xpq;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VbQ1w2zVxz3fQs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 20:23:00 +1000 (AEST)
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4VbQ1w367Jz4x2g
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 20:23:00 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4VbQ1w324nz4x2d; Fri, 10 May 2024 20:23:00 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A/vX2Xpq;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4VbQ1w0csXz4wc7;
	Fri, 10 May 2024 20:22:59 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44AAHl0o025342;
	Fri, 10 May 2024 10:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tgF7jkbWgjjwQGqBBlLb1n4QpiqWav6xTzljBAJwnBU=;
 b=A/vX2Xpql2GZdkARq42nDkybwHb/0V50USvhxH3C1CwnQ/4wzNDbs6xiehUTosVpT+//
 EeXAGk3O5t09j33suLv7wUokPxzlYYFDvatNDZSIyQzaqjiw/NF+JBnEKg5em8XGvD7r
 om2GuK3Us9+fLpWlo518Ss436rn2mTl6LFkkBMQGnqVXwdwoA9c4HmekjqaXyPzFj1Rb
 1k0ANQdDvc7MCtS2mVcOj0v9aJ7lnIZ494y06LPbB8H0+nwQH25JHWCLELAsKcFloMwU
 liKKmCXiR8jKC+W8q7blVNk8xxDQdPE9uH0IvO7fsPZ5ClvTNkvkbG/t4myfA6U0EUn2 yg== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y1hpmr0bv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 10:22:57 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44A776Qq009772;
	Fri, 10 May 2024 10:22:56 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xyshv0kh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 10:22:56 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44AAMpop45548020
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 May 2024 10:22:53 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 749722004F;
	Fri, 10 May 2024 10:22:51 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F0882004E;
	Fri, 10 May 2024 10:22:48 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.57.122])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 May 2024 10:22:48 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 2/2] powerpc/kexec_file: fix cpus node update to FDT
Date: Fri, 10 May 2024 15:52:35 +0530
Message-ID: <20240510102235.2269496-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240510102235.2269496-1-sourabhjain@linux.ibm.com>
References: <20240510102235.2269496-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: U2-whFZ2fYxCbo2MqBJsd6txNrLORO0v
X-Proofpoint-ORIG-GUID: U2-whFZ2fYxCbo2MqBJsd6txNrLORO0v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_07,2024-05-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405100074
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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While updating the cpus node, commit 40c753993e3a ("powerpc/kexec_file:
 Use current CPU info while setting up FDT") first deletes all subnodes
under the /cpus node. However, while adding sub-nodes back, it missed
adding cpus subnodes whose device_type != "cpu", such as l2-cache*,
l3-cache*, ibm,powerpc-cpu-features.

Fix this by only deleting cpus sub-nodes of device_type == "cpus" and
then adding all available nodes with device_type == "cpu".

Fixes: 40c753993e3a ("powerpc/kexec_file: Use current CPU info while setting up FDT")
Cc: Aditya Gupta <adityag@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---

* No changes in v2.

---

 arch/powerpc/kexec/core_64.c | 53 +++++++++++++++++++++++++-----------
 1 file changed, 37 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 85050be08a23..2e625c2cb6b9 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -456,9 +456,15 @@ static int add_node_props(void *fdt, int node_offset, const struct device_node *
  * @fdt:              Flattened device tree of the kernel.
  *
  * Returns 0 on success, negative errno on error.
+ *
+ * Note: expecting no subnodes under /cpus/<node> with device_type == "cpu".
+ * If this changes, update this function to include them.
  */
 int update_cpus_node(void *fdt)
 {
+	int prev_node_offset;
+	const char *device_type;
+	const struct fdt_property *prop;
 	struct device_node *cpus_node, *dn;
 	int cpus_offset, cpus_subnode_offset, ret = 0;
 
@@ -469,30 +475,44 @@ int update_cpus_node(void *fdt)
 		return cpus_offset;
 	}
 
-	if (cpus_offset > 0) {
-		ret = fdt_del_node(fdt, cpus_offset);
+	prev_node_offset = cpus_offset;
+	/* Delete sub-nodes of /cpus node with device_type == "cpu" */
+	for (cpus_subnode_offset = fdt_first_subnode(fdt, cpus_offset); cpus_subnode_offset >= 0;) {
+		/* Ignore nodes that do not have a device_type property or device_type != "cpu" */
+		prop = fdt_get_property(fdt, cpus_subnode_offset, "device_type", NULL);
+		if (!prop || strcmp(prop->data, "cpu")) {
+			prev_node_offset = cpus_subnode_offset;
+			goto next_node;
+		}
+
+		ret = fdt_del_node(fdt, cpus_subnode_offset);
 		if (ret < 0) {
-			pr_err("Error deleting /cpus node: %s\n", fdt_strerror(ret));
-			return -EINVAL;
+			pr_err("Failed to delete a cpus sub-node: %s\n", fdt_strerror(ret));
+			return ret;
 		}
+next_node:
+		if (prev_node_offset == cpus_offset)
+			cpus_subnode_offset = fdt_first_subnode(fdt, cpus_offset);
+		else
+			cpus_subnode_offset = fdt_next_subnode(fdt, prev_node_offset);
 	}
 
-	/* Add cpus node to fdt */
-	cpus_offset = fdt_add_subnode(fdt, fdt_path_offset(fdt, "/"), "cpus");
-	if (cpus_offset < 0) {
-		pr_err("Error creating /cpus node: %s\n", fdt_strerror(cpus_offset));
+	cpus_node = of_find_node_by_path("/cpus");
+	/* Fail here to avoid kexec/kdump kernel boot hung */
+	if (!cpus_node) {
+		pr_err("No /cpus node found\n");
 		return -EINVAL;
 	}
 
-	/* Add cpus node properties */
-	cpus_node = of_find_node_by_path("/cpus");
-	ret = add_node_props(fdt, cpus_offset, cpus_node);
-	of_node_put(cpus_node);
-	if (ret < 0)
-		return ret;
+	/* Add all /cpus sub-nodes of device_type == "cpu" to FDT */
+	for_each_child_of_node(cpus_node, dn) {
+		/* Ignore device nodes that do not have a device_type property
+		 * or device_type != "cpu".
+		 */
+		device_type = of_get_property(dn, "device_type", NULL);
+		if (!device_type || strcmp(device_type, "cpu"))
+			continue;
 
-	/* Loop through all subnodes of cpus and add them to fdt */
-	for_each_node_by_type(dn, "cpu") {
 		cpus_subnode_offset = fdt_add_subnode(fdt, cpus_offset, dn->full_name);
 		if (cpus_subnode_offset < 0) {
 			pr_err("Unable to add %s subnode: %s\n", dn->full_name,
@@ -506,6 +526,7 @@ int update_cpus_node(void *fdt)
 			goto out;
 	}
 out:
+	of_node_put(cpus_node);
 	of_node_put(dn);
 	return ret;
 }
-- 
2.44.0

