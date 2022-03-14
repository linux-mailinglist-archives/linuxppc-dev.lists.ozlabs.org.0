Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E34D8FD8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 23:49:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHWtb66Pkz308J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 09:49:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZnRmu1ep;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHWs63JCNz2yph
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 09:47:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZnRmu1ep; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KHWs31djJz4xv5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 09:47:51 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KHWs31ZbPz4xLQ; Tue, 15 Mar 2022 09:47:51 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZnRmu1ep; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KHWs25ZYLz4xv5
 for <linuxppc-dev@ozlabs.org>; Tue, 15 Mar 2022 09:47:50 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ELmdw1026538; 
 Mon, 14 Mar 2022 22:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=mdeFqiZJxp8nnT1wUse2AREmCCsmqFQjUvbIBYaGn1I=;
 b=ZnRmu1epIPDpQIGcDWBMAjdeJOAV4ISSeEk1KgrzDcvGKgPLQ8jePTBJfIR9/Acv8VFi
 V5sjsxpVeJTLYXZAegUVE+xCywLEgsJygaRwgiqrRpnYO0XhLV2dPDoKGSi2Luj5RGoQ
 njOjo8dd8p16pWv9tv3UurpLNJswjYbUcUCv/tEmc5bZwweJL6jQLEZ31DECyuOv2qfQ
 tYgn+Mb2GESsnMCuMtIx738SVqp4lHDXZtaBp/hOpu6XBSmsl0ImTWUHKKbnf8ybTXHB
 6J6g9QUw/PWU1gcqAX+y80orV60QbnrftRD1aAJbuozA4//Ym6ItK/KnuxrLomGLo6/c TA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3etdxv0rvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 22:47:37 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22EMhxsP023035;
 Mon, 14 Mar 2022 22:47:37 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3etdxv0rv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 22:47:37 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EMcWam030547;
 Mon, 14 Mar 2022 22:47:35 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3erk58mcrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 22:47:35 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22EMlXOH42467836
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 22:47:33 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDC7F4217A;
 Mon, 14 Mar 2022 22:47:32 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E2B84228B;
 Mon, 14 Mar 2022 22:47:30 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.126.2])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 22:47:29 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [RFC v2 PATCH 0/5] In kernel handling of CPU hotplug events for crash
 kernel
Date: Tue, 15 Mar 2022 04:17:23 +0530
Message-Id: <20220314224728.79990-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: swnZhnzT4rYRHeP3WmjmX8SU1sCBwvde
X-Proofpoint-ORIG-GUID: nWw1an--4X9scvqjaAvIJCvD3Bjkwx60
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1011 malwarescore=0 impostorscore=0 spamscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

This patch series implements the crash hotplug handler on PowerPC introduced
by https://lkml.org/lkml/2022/2/9/1406 patch series.


The Problem:
============
Post hotplug/DLPAR events the capture kernel holds stale information about the
system. Dump collection with stale capture kernel might end up in dump capture
failure or an inaccurate dump collection.


Existing solution:
==================
The existing solution to keep the capture kernel up-to-date is observe the
hotplug event via udev rule and trigger a full capture kernel reload post
hotplug event. 

Shortcomings:
------------------------------------------------
- Leaves a window where kernel crash might not lead to successful dump
  collection.
- Reloading all kexec components for each hotplug is inefficient. Since only
  one or two kexec components need to be updated due to hotplug event reloading
  all kexec component is redundant.
- udev rules are prone to races if hotplug events are frequent.

More about issues with an existing solution is posted here:
 - https://lkml.org/lkml/2020/12/14/532
 - https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-February/240254.html

Proposed Solution:
==================
Instead of reloading all kexec segments on hotplug event, this patch series
focuses on updating only the relevant kexec segment. Once the kexec
segments are loaded in the kernel reserved area then an arch-specific hotplug handler
will update the relevant kexec segment based on hotplug event type.

As mentioned above this patch series implemented a PowerPC crash hotplug
handler for the CPU. The crash hotplug handler memory is in our TODO list.


A couple of minor changes are required to realize the benefit of the patch
series:

- disalble the udev rule:

  comment out the below line in kdump udev rule file:
  RHEL: /usr/lib/udev/rules.d/98-kexec.rules
  # SUBSYSTEM=="cpu", ACTION=="online", GOTO="kdump_reload_cpu"

- kexec tool needs to be updated with patch for kexec_load system call
  to work (not needed if -s option is used during kexec panic load):

---
diff --git a/kexec/arch/ppc64/kexec-elf-ppc64.c b/kexec/arch/ppc64/kexec-elf-ppc64.c
index 695b8b0..1dc6490 100644
--- a/kexec/arch/ppc64/kexec-elf-ppc64.c
+++ b/kexec/arch/ppc64/kexec-elf-ppc64.c
@@ -45,6 +45,29 @@ uint64_t initrd_base, initrd_size;
 unsigned char reuse_initrd = 0;
 const char *ramdisk;
 
+#define MAX_CORE 256
+#define PER_CORE_NODE_SIZE 1500
+
+/**
+ * get_crash_fdt_mem_sz() - calcuate mem size for crash kernel FDT
+ * @fdt: pointer to crash kernel FDT
+ *
+ * Calculate the buffer space needed to add more CPU nodes in FDT after
+ * capture kenrel load due to hot add events.
+ *
+ * Some assumption are made to calculate the additional buffer size needed
+ * to accommodate future hot add CPUs to the crash FDT. The maximum core count
+ * in the system would not go beyond MAX_CORE and memory needed to store per core
+ * date in FDT is PER_CORE_NODE_SIZE.
+ *
+ * Certainly MAX_CORE count can be replaced with possible core count and
+ * PER_CORE_NODE_SIZE to some standard value instead of randomly observed
+ * core size value on Power9 LPAR.
+ */
+static unsigned int get_crash_fdt_mem_sz(void *fdt) {
+	return fdt_totalsize(fdt) + (PER_CORE_NODE_SIZE * MAX_CORE);
+}
+
 int elf_ppc64_probe(const char *buf, off_t len)
 {
 	struct mem_ehdr ehdr;
@@ -179,6 +202,7 @@ int elf_ppc64_load(int argc, char **argv, const char *buf, off_t len,
 	uint64_t max_addr, hole_addr;
 	char *seg_buf = NULL;
 	off_t seg_size = 0;
+	unsigned int mem_sz = 0;
 	struct mem_phdr *phdr;
 	size_t size;
 #ifdef NEED_RESERVE_DTB
@@ -329,7 +353,13 @@ int elf_ppc64_load(int argc, char **argv, const char *buf, off_t len,
 	if (result < 0)
 		return result;
 
-	my_dt_offset = add_buffer(info, seg_buf, seg_size, seg_size,
+	if (info->kexec_flags & KEXEC_ON_CRASH) {
+		mem_sz = get_crash_fdt_mem_sz((void *)seg_buf);
+		fdt_set_totalsize(seg_buf, mem_sz);
+		info->fdt_index = info->nr_segments;
+	}
+
+	my_dt_offset = add_buffer(info, seg_buf, seg_size, mem_sz,
 				0, 0, max_addr, -1);
 
 #ifdef NEED_RESERVE_DTB
diff --git a/kexec/kexec.c b/kexec/kexec.c
index f63b36b..846b1a8 100644
--- a/kexec/kexec.c
+++ b/kexec/kexec.c
@@ -672,6 +672,9 @@ static void update_purgatory(struct kexec_info *info)
 		if (info->segment[i].mem == (void *)info->rhdr.rel_addr) {
 			continue;
 		}
+		if (info->fdt_index == i)
+			continue;
+
 		sha256_update(&ctx, info->segment[i].buf,
 			      info->segment[i].bufsz);
 		nullsz = info->segment[i].memsz - info->segment[i].bufsz;
diff --git a/kexec/kexec.h b/kexec/kexec.h
index 595dd68..0906a1b 100644
--- a/kexec/kexec.h
+++ b/kexec/kexec.h
@@ -169,6 +169,7 @@ struct kexec_info {
 	int command_line_len;
 
 	int skip_checks;
+       // Given that we might need to update mutliple kexec segments
+       // then having array to keep indexes of all hotplug kexec segments
+       // will be helpful.
+	unsigned int fdt_index;
 };
 
 struct arch_map_entry {
---


Sourabh Jain (5):
  powerpc/kexec: make update_cpus_node non-static
  powerpc/crash hp: introduce a new config option CRASH_HOTPLUG
  powrepc/crash hp: update kimage struct
  powerpc/crash hp: add crash hotplug support for kexec_file_load
  powerpc/crash hp: add crash hotplug support for kexec_load

 arch/powerpc/Kconfig              |  11 +++
 arch/powerpc/include/asm/kexec.h  |   1 +
 arch/powerpc/kexec/core_64.c      | 153 ++++++++++++++++++++++++++++++
 arch/powerpc/kexec/elf_64.c       |  39 ++++++++
 arch/powerpc/kexec/file_load_64.c |  87 -----------------
 include/linux/kexec.h             |   2 +
 6 files changed, 206 insertions(+), 87 deletions(-)

-- 
2.35.1

