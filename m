Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 942BD4E21B1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 09:05:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMRxd3RDSz3bPD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 19:05:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IZAbEdQY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMRww0QqNz3036
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 19:04:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IZAbEdQY; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KMRww06WJz4xc5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 19:04:48 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KMRww03rSz4xcj; Mon, 21 Mar 2022 19:04:48 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IZAbEdQY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KMRwv5cK5z4xc5
 for <linuxppc-dev@ozlabs.org>; Mon, 21 Mar 2022 19:04:47 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22L81wMv023083; 
 Mon, 21 Mar 2022 08:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=uezyAFLpxVd4l1Mt6HYl/LjN66bGGnL3v2TUqTTs82o=;
 b=IZAbEdQYDqU+2acnoH2mdiYeeB8NMggBfwuHzH+gIIdmEesf025KycFgnBckYSXdeJrE
 1Sc5QnXIKWL8xtHgpTZslYYyT8+jNQUStwhbQnK9RC7qDx00Jn0YNcd4N9OnIfarLX1Y
 0lRuzmiri1mCruYMHhZOvpD52qEOwVKgSTE1CTbrDb8SqMKKPdvoPR8gtp+UISvs6kcj
 r3mq1ocsJj3VNYph2Ik8Akt1dgA3m8WFWUlxDIiaUsgURDbF7nrtak7WXBX9S4hZXhRN
 0P+mgQPTE57d90Q307D0WTh4Hj2I2Gi578/6NTn9Rp3Kd9dgpguwyK5QN996z5goACrM eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3exhpcm9tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 08:04:30 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22L7wWXj007780;
 Mon, 21 Mar 2022 08:04:30 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3exhpcm9t1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 08:04:30 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22L84SsV003971;
 Mon, 21 Mar 2022 08:04:28 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3ew6t8uacu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 08:04:28 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22L84Qsd27328908
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 08:04:26 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F8BB52050;
 Mon, 21 Mar 2022 08:04:26 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.117.210])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 876FC52051;
 Mon, 21 Mar 2022 08:04:23 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [RFC v3 PATCH 0/5] In kernel handling of CPU hotplug events for crash
 kernel
Date: Mon, 21 Mar 2022 13:34:17 +0530
Message-Id: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _Z3pxcgJMarP1p6Z04Hf-J_wSTB5E9WX
X-Proofpoint-GUID: bP1dy4mCDbK0MhZmiDLjWFC95U65GHhF
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_02,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203210049
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
by https://lkml.org/lkml/2022/3/3/674 patch series.


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

---
Changelog:

v1 -> v2:
  - Use generic hotplug handler introduced by https://lkml.org/lkml/2022/2/9/1406, a
    significant change from v1.

v2 -> v3
  - Move fdt_index and fdt_index_vaild variables to kimage_arch struct.
  - Rebase patche on top of https://lkml.org/lkml/2022/3/3/674 [v5]
  - Fixed warning reported by checpatch script
---

Sourabh Jain (5):
  powerpc/kexec: make update_cpus_node non-static
  powerpc/crash hp: introduce a new config option CRASH_HOTPLUG
  powrepc/crash hp: update kimage struct
  powerpc/crash hp: add crash hotplug support for kexec_file_load
  powerpc/crash hp: add crash hotplug support for kexec_load

 arch/powerpc/Kconfig              |  11 +++
 arch/powerpc/include/asm/kexec.h  |   3 +
 arch/powerpc/kexec/core_64.c      | 153 ++++++++++++++++++++++++++++++
 arch/powerpc/kexec/elf_64.c       |  40 ++++++++
 arch/powerpc/kexec/file_load_64.c |  87 -----------------
 5 files changed, 207 insertions(+), 87 deletions(-)

-- 
2.35.1

