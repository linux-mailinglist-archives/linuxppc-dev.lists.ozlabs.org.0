Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2004BD85E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 09:51:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2GH83Xdwz3bd4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 19:51:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ffzI8mxW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2GBV6G1Jz3cPF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 19:46:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ffzI8mxW; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4K2GBW2jvLz4xv3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 19:46:59 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4K2GBW2h1Kz4xv5; Mon, 21 Feb 2022 19:46:59 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ffzI8mxW; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4K2GBW0Dqbz4xv3
 for <linuxppc-dev@ozlabs.org>; Mon, 21 Feb 2022 19:46:58 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21L7h8WX004885; 
 Mon, 21 Feb 2022 08:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zmhvUUF0xEAeDVKPonL1eLtWZpJ6YNXr7LsSJLNJA2c=;
 b=ffzI8mxWKmR4Cw1+fJ2IFokekL1Ayc1DodXv5OWTXwDIIMaVPZvAXa6xVyU7vYwE/vaT
 Ids+gKSnhkJ1FubTxFZ235+T72JzykJCGVDocvO2LL+UwsQUYGzyfr8gRoifPCaqmaeL
 86ebF/UYshc9JqLVoldHMuCyc4moKJscDcTSGxuXsAyMhy0G701tFjT1JMyXyhXT8MOr
 zK0Yn8S6G9gN37PaReSxx48yPy/xyC95InpObXV1EB/ekupbgrnIBjAq6lQFWk2lGMPr
 +SMNF6o2AWiblxyRtf9o2FPf4FB7Ew+052N6qloEHzZI/4W8J/SY7u3vxhiLtggPkEze gA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ebxrhrsfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 08:46:54 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21L8grnn018762;
 Mon, 21 Feb 2022 08:46:52 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3ear68r431-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 08:46:52 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21L8kn4I45023504
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 08:46:49 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB0F142041;
 Mon, 21 Feb 2022 08:46:49 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 412FD42045;
 Mon, 21 Feb 2022 08:46:47 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.10.186])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Feb 2022 08:46:46 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [RFC PATCH 5/5] powerpc/kdump: export kexec crash FDT details via
 sysfs
Date: Mon, 21 Feb 2022 14:16:24 +0530
Message-Id: <20220221084624.85792-6-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220221084624.85792-1-sourabhjain@linux.ibm.com>
References: <20220221084624.85792-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1ECyFUB7LHbMsnqNnh-mXvDH4HytYLA-
X-Proofpoint-GUID: 1ECyFUB7LHbMsnqNnh-mXvDH4HytYLA-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-21_03,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202210052
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
Cc: mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org,
 hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Export kexec crash FDT address and size to /sys/kernel/kexec_crash_fdt
and /sys/kernel/kexec_crash_fdt_size files to enabled kexec tool to
utilize pre-allocated space kdump FDT.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/kexec/core_64.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 57afceee53a6..9bc9973ab3d3 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -677,6 +677,23 @@ static u32 get_kexec_crash_fdt_size(void)
 	return 1024*1024;
 }
 
+static ssize_t kexec_crash_fdt_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%lx\n", __pa(kexec_crash_fdt));
+}
+static struct kobj_attribute kexec_crash_fdt_attr = __ATTR_RO(kexec_crash_fdt);
+
+static ssize_t kexec_crash_fdt_size_show(struct kobject *kobj,
+					 struct kobj_attribute *attr,
+					 char *buf)
+{
+	return sprintf(buf, "%d\n", kexec_crash_fdt_size);
+}
+static struct kobj_attribute kexec_crash_fdt_size_attr = \
+			__ATTR_RO(kexec_crash_fdt_size);
+
+
 /* Setup the memory hole for kdump fdt in reserved region below RMA.
  */
 static int __init setup_kexec_crash_fdt(void)
@@ -707,6 +724,16 @@ static int __init setup_kexec_crash_fdt(void)
 	kexec_crash_fdt = __va(kbuf.mem);
 	kexec_crash_fdt_size = kbuf.memsz;
 
+	if (sysfs_create_file(kernel_kobj, &kexec_crash_fdt_attr.attr)) {
+		pr_err("unable to create kdump_fdt sysfs file\n.");
+		return -1;
+	}
+
+	if (sysfs_create_file(kernel_kobj, &kexec_crash_fdt_size_attr.attr)) {
+		pr_err("unable to cerate kexec_crash_fdt_size sysfs file.\n");
+		return -1;
+	}
+
 out:
 	return ret;
 }
-- 
2.34.1

