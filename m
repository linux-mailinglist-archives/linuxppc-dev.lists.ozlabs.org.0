Return-Path: <linuxppc-dev+bounces-14205-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9FDC624B4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Nov 2025 05:19:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d8vds3VBBz2y7c;
	Mon, 17 Nov 2025 15:19:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763353169;
	cv=none; b=CqFVfow5K/DfhH48TSu4TwruXSXmvZZi5B44DqOANXsoHDLYCXq7wPrRaDmZn6BEKw1AXKmaOGpeM98pBAp0zV/CzRWkHgUEfWAY3a8qFaEE4QknZbxCMtXCqS0zaEOicOhcPJVd7msuWplKFiMM4P5G/3miSTPm46tyxtuw/MO89YsSQ0YNw3DDqC+q5FU6V5ajWphOHDZpirFTVcRZqI2d1NxxuUc8iKshMxef/eDVjkum++w7O2xvRKDCsTtGqvlgeFLkx5buLESTvihbqLqhvu61kRmeD/ZWsTjeIQ/RPiNwFB09uyTuYQQVN1y++6R5UKti9Pt9ns9W/pjQOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763353169; c=relaxed/relaxed;
	bh=HW3Y17n8xrzXoOgd0tT8A3IjkDHvKZ3zGs8YDsCfwSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ri2WZ7R42AQJ9TbapLLD48OjqKEqcq+T/iDFESQRpj7SK4uPXxh6B4d15SKeRHVS0nIoY3X9NQaR4HvHJkh9fkM3wHRO2cX15oCFEQ5BdGAshLNBSMf8BF0BFB31fncTFv+1tcKBctQ/mcEaDrDKHKy9Il/EvvMTyp8OEpPu4VivR1BPVli277vD9pSVVbnG1Uu19AdsQqA3nJMKzu/OJisUXACY0UPD2zXsOrjDeSHc0mQuLqhecS8eCzxHMzQ2B3PpbJdaqNH2oLtrb8Aym9PIc/5WW0rSo8vqqv+EI5EvBDBGj3pPu5qJcAip6eZJt2phoou7KpL33rtW+KR+VQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fw8BmoVs; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fw8BmoVs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d8vdr3vyQz2xQr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Nov 2025 15:19:28 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AGAurTb029413;
	Mon, 17 Nov 2025 04:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=HW3Y17n8xrzXoOgd0tT8A3IjkDHvKZ3zGs8YDsCfw
	SU=; b=Fw8BmoVstqdZq5BRKAPPzUpyALppI6qpQ/WqFE9Ka4DlkIDlJ5rc+C1dp
	U912P1vKJR/6pmuaRUSEj7eXNBXjFqQm2bp7m8TXCx4E/yULJ50E9SLldjc/xbjH
	53zUar9+8vi+XCcJMbHhnPKVN5zok3CHTeh4/6DzhkWEIq312bWakW2OuceGGLmG
	+vZW3mg+DpX5d/+Y/sEvkOlzBQNS9qlcQRtFdI9/DViQuZOLa978G9H81mSZipD8
	7ho1HHNd+EI2is/Ht83BihWBIFbRnRM8+S98JXMUA3DShU1seVHFyVZZVBBq+RKh
	s1EDP/9M2W3jQvmBQK/Cl/InadfZg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjtma03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 04:19:21 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AH4JLQC010092;
	Mon, 17 Nov 2025 04:19:21 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjtma02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 04:19:21 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AH2iZUU005231;
	Mon, 17 Nov 2025 04:19:20 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af5bjuutx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Nov 2025 04:19:20 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AH4JG3Z54657282
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Nov 2025 04:19:16 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2BB0220043;
	Mon, 17 Nov 2025 04:19:16 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB02320040;
	Mon, 17 Nov 2025 04:19:12 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Nov 2025 04:19:12 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Aditya Gupta <adityag@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Dave Young <dyoung@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>,
        Jiri Bohac <jbohac@suse.cz>, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Pingfan Liu <piliu@redhat.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>,
        Vivek Goyal <vgoyal@redhat.com>, linuxppc-dev@lists.ozlabs.org,
        kexec@lists.infradead.org
Subject: [PATCH v5] crash: export crashkernel CMA reservation to userspace
Date: Mon, 17 Nov 2025 09:49:05 +0530
Message-ID: <20251117041905.1277801-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 66hVaA_E_T6q8ssKCxWv8uR2r5R9Vj_v
X-Proofpoint-ORIG-GUID: sFVsJRAWf6npMVHJODht4YSmaO0rYjrk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX4axYIo7rQLgH
 IfoevzRI0QKZfXQtaVXdgGW6JXVIczmwpcsQPBkDVcUsTa2o4Bgn0+QIBvGx1Tbu7dOKetFkX4Y
 qlLwnIygY+EWd52TGgwe5QFBYbtutKU9n1DdQeKTP23O/X3k2Md4yuvnnbjqkSnOX8BSxI+uzAT
 iW80bsKYabX0QRGLNEhV56fo1fYZXyHzcz74yZzWFN1xxHxlszJEu5MxBFbpOgTHKYNHHAKGAtI
 10YsjfukG1Mbw+rfr95vZ0MoKu5FzwsJl2uOWw2ZeyqUcYY3MxSZrqxoGJKPpGjizjdz0Z0FnjD
 TDTeksdJf4GE/b4/Nj8a5a7qSCg8qE+MINKsqjUm9Ypj0P5xhZ4FfQtIuFe7EGQf6FrxZHPnTGg
 qcPryrscKF7bf/ECzmDq/+6FU4TKVQ==
X-Authority-Analysis: v=2.4 cv=SvOdKfO0 c=1 sm=1 tr=0 ts=691aa249 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=Z4Rwk6OoAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8
 a=JfrnYn6hAAAA:8 a=Tu7GEDxD-VmU2YT8bLkA:9 a=HkZW87K1Qel5hWWM3VKY:22
 a=IC2XNlieTeVoXbcui8wp:22 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add a sysfs entry /sys/kernel/kexec/crash_cma_ranges to expose all
CMA crashkernel ranges.

This allows userspace tools configuring kdump to determine how much
memory is reserved for crashkernel. If CMA is used, tools can warn
users when attempting to capture user pages with CMA reservation.

The new sysfs hold the CMA ranges in below format:

cat /sys/kernel/kexec/crash_cma_ranges
100000000-10c7fffff

There are already four kexec and kdump sysfs entries under /sys/kernel.
Adding more entries there would clutter the directory. To avoid this,
the new crash_cma_ranges sysfs entry is placed in a new kexec node under
/sys/kernel/.

The reason for not including Crash CMA Ranges in /proc/iomem is to avoid
conflicts. It has been observed that contiguous memory ranges are sometimes
shown as two separate System RAM entries in /proc/iomem. If a CMA range
overlaps two System RAM ranges, adding crashk_res to /proc/iomem can create
a conflict. Reference [1] describes one such instance on the PowerPC
architecture.

Link: https://lore.kernel.org/all/20251016142831.144515-1-sourabhjain@linux.ibm.com/ [1]

Cc: Aditya Gupta <adityag@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Jiri Bohac <jbohac@suse.cz>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Cc: Pingfan Liu <piliu@redhat.com>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: kexec@lists.infradead.org
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---

Changelog:

v4 -> v5:
 https://lore.kernel.org/all/20251114152550.ac2dd5e23542f09c62defec7@linux-foundation.org/
 - Splitted patch from the above patch series.
 - Code to create kexec node under /sys/kernel is added, eariler it was
   done in [02/05] of the above patch series.

Note:
This patch is dependent on the below patch:
https://lore.kernel.org/all/20251117035153.1199665-1-sourabhjain@linux.ibm.com/

---
 .../ABI/testing/sysfs-kernel-kexec-kdump      | 10 ++++
 kernel/kexec_core.c                           | 50 +++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
index 96b24565b68e..320ec75a4903 100644
--- a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
+++ b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
@@ -41,3 +41,13 @@ Description:	read only
 		is used by the user space utility kexec to support updating the
 		in-kernel kdump image during hotplug operations.
 User:		Kexec tools
+
+What:		/sys/kernel/kexec/crash_cma_ranges
+Date:		Nov 2025
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		Provides information about the memory ranges reserved from
+		the Contiguous Memory Allocator (CMA) area that are allocated
+		to the crash (kdump) kernel. It lists the start and end physical
+		addresses of CMA regions assigned for crashkernel use.
+User:		kdump service
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index fa00b239c5d9..51b1e0985eac 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -41,6 +41,7 @@
 #include <linux/objtool.h>
 #include <linux/kmsg_dump.h>
 #include <linux/dma-map-ops.h>
+#include <linux/sysfs.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -1229,3 +1230,52 @@ int kernel_kexec(void)
 	kexec_unlock();
 	return error;
 }
+
+#ifdef CONFIG_CRASH_RESERVE
+static ssize_t crash_cma_ranges_show(struct kobject *kobj,
+				     struct kobj_attribute *attr, char *buf)
+{
+
+	ssize_t len = 0;
+	int i;
+
+	for (i = 0; i < crashk_cma_cnt; ++i) {
+		len += sysfs_emit_at(buf, len, "%08llx-%08llx\n",
+				     crashk_cma_ranges[i].start,
+				     crashk_cma_ranges[i].end);
+	}
+	return len;
+}
+static struct kobj_attribute crash_cma_ranges_attr = __ATTR_RO(crash_cma_ranges);
+
+static struct attribute *kexec_attrs[] = {
+	&crash_cma_ranges_attr.attr,
+	NULL
+};
+
+static struct kobject *kexec_kobj;
+ATTRIBUTE_GROUPS(kexec);
+
+static int __init init_kexec_sysctl(void)
+{
+	int error;
+
+	kexec_kobj = kobject_create_and_add("kexec", kernel_kobj);
+	if (!kexec_kobj) {
+		pr_err("failed to create kexec kobject\n");
+		return -ENOMEM;
+	}
+
+	error = sysfs_create_groups(kexec_kobj, kexec_groups);
+	if (error)
+		goto kset_exit;
+
+	return 0;
+
+kset_exit:
+	kobject_put(kexec_kobj);
+	return error;
+}
+
+subsys_initcall(init_kexec_sysctl);
+#endif /* CONFIG_CRASH_RESERVE */
-- 
2.51.1


