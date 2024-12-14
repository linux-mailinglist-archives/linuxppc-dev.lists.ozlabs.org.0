Return-Path: <linuxppc-dev+bounces-4125-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D34C09F1C9F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2024 06:18:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y9Dxr31sTz2yT0;
	Sat, 14 Dec 2024 16:18:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734153504;
	cv=none; b=WOhjZ9NTwUOdsZhkrqMxaqz2CEiDyukWJVzqSsP+nZD6ptFR3IaGUAUD4S+N8foPtFL10UcuBWKtPExhzmqlfKyvHNCiQDF+9yfnepFsgFsOTRcjlvT4e6ZmeTGUBTmyTd1pzLk8tFqdmdtYnNkW7f6/2TWZy6kB8s8JHD35Uofc4AT3l7ZQNbY3g+Bd6HJqRBM05cYLYdCQ/G85DAGxPmGcaFz23GfxTdvFYEz/me6MjKZT2pCCsrXDaQdXenU6LYur0/ql6chtMGTyb35xIElYAJMaIB71XrXsyZlWOYF2yyAWm1axSf0xKx35r9eU6jAJE5xF9LEgvxZi0DH6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734153504; c=relaxed/relaxed;
	bh=mHawxuwfitmMw1e7/vz1I/5GaOZaZBl1wfppJLwjJWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jivvxYzdwBA3fo1dHAZwcw1UvhgnVosJ3o/mbC/1MdthpXjB8xIFsOk6EodyMpyMpXIoMKo0s43aOinQZeac8j1PwI0sANiGDSoQI8qYyuuqiKtKb3PkxmxSBuId3zWmc8kVzb9QjJaQ/kL3f67U3kd2reTSzaz3/aCgeQEr1LDRcZn5gKU6irqNMbCQ7Hz5fHZxP2dTWxlxofqx2h0jj8twQ5Pv+mMLPa5yQRyxivmj2yfB554PY/5gJ4g4LFPEiB5AP4Tqir/F6pnmISTvyrgNQ0J7LwsxnoF657/LQs28Wdcp5igc9pLCHFUewoCKEM+qTmrcbwFD9aywB7qcfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jjfy/0iM; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jjfy/0iM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y9Dxq0xd1z2yRc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2024 16:18:22 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BE4TMYM016150;
	Sat, 14 Dec 2024 05:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=mHawxuwfitmMw1e7/vz1I/5GaOZaZBl1wfppJLwjJ
	Wo=; b=Jjfy/0iMOFgRdNO17eH+ZNeieYnCstmZTTkkpSW4FnsCe8XwzfaKmd6NL
	jNWblJfioXoYGkzZCvNHgPiShzfg7WQyz6C/fd20Ovt5OXMfGkgtXkWBP3P4N9Qu
	62ZSXFq9gnfYAhJJkcJ3PrlCU4dT8lWuLQJ5SVZIF2wZ/Prwedz/WJZNb+bnkzoW
	Dn2lXzPCS8ppRwreUkHJeqU0bf43aXdpgoy9ewpno74zB3rpPkMxEzZjVaDQVCPY
	gGH8gZ2wSyBk2fkIN/qD8UZpu18ZuzByHgO73n666YXHXKAmfrHkqEmN322ITDwf
	dVRPmsgmVNvSC45aDrCBnlRvSWLsg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43h2ggg7xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 14 Dec 2024 05:18:13 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BE5IDA9007343;
	Sat, 14 Dec 2024 05:18:13 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43h2ggg7xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 14 Dec 2024 05:18:13 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BE3OYV8023062;
	Sat, 14 Dec 2024 05:18:12 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43d2wkgx01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 14 Dec 2024 05:18:12 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BE5I9DD25756246
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 14 Dec 2024 05:18:09 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E47C458055;
	Sat, 14 Dec 2024 05:18:08 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 211015804B;
	Sat, 14 Dec 2024 05:18:08 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com (unknown [9.61.86.69])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 14 Dec 2024 05:18:08 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, maddy@linux.ibm.com,
        hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH] powerpc/pseries/vas: Add close() callback in vas_vm_ops struct
Date: Fri, 13 Dec 2024 21:17:58 -0800
Message-ID: <20241214051758.997759-1-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: e6JuvxRLNBpv_cKQF0rQ3FDQEM2EfNlO
X-Proofpoint-ORIG-GUID: K7X4gCgbo9S07hoKi_WL-xP7A9D7ANze
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=894 adultscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412140039
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEXHASH_WORD,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The mapping VMA address is saved in VAS window struct when the
paste address is mapped. This VMA address is used during migration
to unmap the paste address if the window is active. The paste
address mapping will be removed when the window is closed or with
the munmap(). But the VMA address in the VAS window is not updated
with munmap() which is causing invalid access during migration.

The KASAN report shows:
[16386.254991] BUG: KASAN: slab-use-after-free in reconfig_close_windows+0x1a0/0x4e8
[16386.255043] Read of size 8 at addr c00000014a819670 by task drmgr/696928

[16386.255096] CPU: 29 UID: 0 PID: 696928 Comm: drmgr Kdump: loaded Tainted: G    B              6.11.0-rc5-nxgzip #2
[16386.255128] Tainted: [B]=BAD_PAGE
[16386.255148] Hardware name: IBM,9080-HEX Power11 (architected) 0x820200 0xf000007 of:IBM,FW1110.00 (NH1110_016) hv:phyp pSeries
[16386.255181] Call Trace:
[16386.255202] [c00000016b297660] [c0000000018ad0ac] dump_stack_lvl+0x84/0xe8 (unreliable)
[16386.255246] [c00000016b297690] [c0000000006e8a90] print_report+0x19c/0x764
[16386.255285] [c00000016b297760] [c0000000006e9490] kasan_report+0x128/0x1f8
[16386.255309] [c00000016b297880] [c0000000006eb5c8] __asan_load8+0xac/0xe0
[16386.255326] [c00000016b2978a0] [c00000000013f898] reconfig_close_windows+0x1a0/0x4e8
[16386.255343] [c00000016b297990] [c000000000140e58] vas_migration_handler+0x3a4/0x3fc
[16386.255368] [c00000016b297a90] [c000000000128848] pseries_migrate_partition+0x4c/0x4c4
...

[16386.256136] Allocated by task 696554 on cpu 31 at 16377.277618s:
[16386.256149]  kasan_save_stack+0x34/0x68
[16386.256163]  kasan_save_track+0x34/0x80
[16386.256175]  kasan_save_alloc_info+0x58/0x74
[16386.256196]  __kasan_slab_alloc+0xb8/0xdc
[16386.256209]  kmem_cache_alloc_noprof+0x200/0x3d0
[16386.256225]  vm_area_alloc+0x44/0x150
[16386.256245]  mmap_region+0x214/0x10c4
[16386.256265]  do_mmap+0x5fc/0x750
[16386.256277]  vm_mmap_pgoff+0x14c/0x24c
[16386.256292]  ksys_mmap_pgoff+0x20c/0x348
[16386.256303]  sys_mmap+0xd0/0x160
...

[16386.256350] Freed by task 0 on cpu 31 at 16386.204848s:
[16386.256363]  kasan_save_stack+0x34/0x68
[16386.256374]  kasan_save_track+0x34/0x80
[16386.256384]  kasan_save_free_info+0x64/0x10c
[16386.256396]  __kasan_slab_free+0x120/0x204
[16386.256415]  kmem_cache_free+0x128/0x450
[16386.256428]  vm_area_free_rcu_cb+0xa8/0xd8
[16386.256441]  rcu_do_batch+0x2c8/0xcf0
[16386.256458]  rcu_core+0x378/0x3c4
[16386.256473]  handle_softirqs+0x20c/0x60c
[16386.256495]  do_softirq_own_stack+0x6c/0x88
[16386.256509]  do_softirq_own_stack+0x58/0x88
[16386.256521]  __irq_exit_rcu+0x1a4/0x20c
[16386.256533]  irq_exit+0x20/0x38
[16386.256544]  interrupt_async_exit_prepare.constprop.0+0x18/0x2c
...

[16386.256717] Last potentially related work creation:
[16386.256729]  kasan_save_stack+0x34/0x68
[16386.256741]  __kasan_record_aux_stack+0xcc/0x12c
[16386.256753]  __call_rcu_common.constprop.0+0x94/0xd04
[16386.256766]  vm_area_free+0x28/0x3c
[16386.256778]  remove_vma+0xf4/0x114
[16386.256797]  do_vmi_align_munmap.constprop.0+0x684/0x870
[16386.256811]  __vm_munmap+0xe0/0x1f8
[16386.256821]  sys_munmap+0x54/0x6c
[16386.256830]  system_call_exception+0x1a0/0x4a0
[16386.256841]  system_call_vectored_common+0x15c/0x2ec

[16386.256868] The buggy address belongs to the object at c00000014a819670
                which belongs to the cache vm_area_struct of size 168
[16386.256887] The buggy address is located 0 bytes inside of
                freed 168-byte region [c00000014a819670, c00000014a819718)

[16386.256915] The buggy address belongs to the physical page:
[16386.256928] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x14a81
[16386.256950] memcg:c0000000ba430001
[16386.256961] anon flags: 0x43ffff800000000(node=4|zone=0|lastcpupid=0x7ffff)
[16386.256975] page_type: 0xfdffffff(slab)
[16386.256990] raw: 043ffff800000000 c00000000501c080 0000000000000000 5deadbee00000001
[16386.257003] raw: 0000000000000000 00000000011a011a 00000001fdffffff c0000000ba430001
[16386.257018] page dumped because: kasan: bad access detected

This patch adds close() callback in vas_vm_ops vm_operations_struct
which will be executed during munmap() before freeing VMA. The VMA
address in the VAS window is set to NULL after holding the window
mmap_mutex.

Fixes: 37e6764895ef ("powerpc/pseries/vas: Add VAS migration handler")
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/book3s/vas-api.c | 36 +++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index f381b177ea06..0b6365d85d11 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -464,7 +464,43 @@ static vm_fault_t vas_mmap_fault(struct vm_fault *vmf)
 	return VM_FAULT_SIGBUS;
 }
 
+/*
+ * During mmap() paste address, mapping VMA is saved in VAS window
+ * struct which is used to unmap during migration if the window is
+ * still open. But the user space can remove this mapping with
+ * munmap() before closing the window and the VMA address will
+ * be invalid. Set VAS window VMA to NULL in this function which
+ * is called before VMA free.
+ */
+static void vas_mmap_close(struct vm_area_struct *vma)
+{
+	struct file *fp = vma->vm_file;
+	struct coproc_instance *cp_inst = fp->private_data;
+	struct vas_window *txwin;
+
+	/* Should not happen */
+	if (!cp_inst || !cp_inst->txwin) {
+		pr_err("No attached VAS window for the paste address mmap\n");
+		return;
+	}
+
+	txwin = cp_inst->txwin;
+	/*
+	 * task_ref.vma is set in coproc_mmap() during mmap paste
+	 * address. So it has to be the same VMA that is getting freed.
+	 */
+	if (WARN_ON(txwin->task_ref.vma != vma)) {
+		pr_err("Invalid paste address mmaping\n");
+		return;
+	}
+
+	mutex_lock(&txwin->task_ref.mmap_mutex);
+	txwin->task_ref.vma = NULL;
+	mutex_unlock(&txwin->task_ref.mmap_mutex);
+}
+
 static const struct vm_operations_struct vas_vm_ops = {
+	.close = vas_mmap_close,
 	.fault = vas_mmap_fault,
 };
 
-- 
2.43.5


