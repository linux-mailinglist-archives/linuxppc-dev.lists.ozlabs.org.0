Return-Path: <linuxppc-dev+bounces-14374-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC2DC73441
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Nov 2025 10:44:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBtjq2pSJz2yvJ;
	Thu, 20 Nov 2025 20:44:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763631887;
	cv=none; b=GMHa2E81MxsmPFgJKerxR2ifTPEhwXMmTualJqEVFac/+g1BkdenGSwVOUh9uZxNahopj6ka82ksodk3f5mW4eQee3kyXsa+Av4/EoNlpsC7xpbv3ONs3vkYycqkI/GpCkvh8+dQxCtLvumo0bMyOM3ecT7U0KWsx5noKQYRAaWVFv4T9ZoSS5p/u0YxJx21oEw+Jo2WLRqxr/V5cNo1G/1zFBmpbfnGDqum9dFP0Ysp+5nlA3RbAAP0ZwDUzt+m+JdfJj0sma94EXTlAAg8o9iI8ULCNGMKmmnOAAlagxOHm6o7oKqLT3w18MYzPziHrUDv/Jz9jSRGN8bpR6erBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763631887; c=relaxed/relaxed;
	bh=Pe0kfqLYuUiSKnJnC39H+rf14BGwlqCsakBEKpmuLDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SXn5Cl2FUcVDETilnfZCQz0LLUa5haMHgBXsk2gac/baGWnLPZDVhHOiMzC0Ax2ITuP/r5OUb6JamGU3q3UNnwy5Ln1hyCzanO+E8mFxPfwuBPV6/7fUJHdczKyyHwsKw+27Hyl95MwbUfQQm65SSDsnL6CYnGmNv1XD56TFTPpmoQqrQN3ondY6FKu3yD4nlbbil7kL1mCLxT+xtRwN6fgDFarJfYsg2eFRRuo7yQ8qYhJJXmIp104zNACPaLVpGNmdg1604W7gUQTesweaOoM7LZ32qlcmlLhmfQqMnEZRixkrMNP8ed2/St6DfwJSZ4L6kK/dt7nsK/j0UFccag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q6DPoYwS; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q6DPoYwS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBtjp18Rnz2yr9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Nov 2025 20:44:45 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJLkuLX012474;
	Thu, 20 Nov 2025 09:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=Pe0kfqLYuUiSKnJnC39H+rf14BGw
	lqCsakBEKpmuLDA=; b=q6DPoYwSBtY7pu/WYm9rJjD03CyvyPQ8B/LJ4jYN3fkb
	qgGmKzgMbvDrlUmgyKRbZxp/8gDvC+aXlNzaFRUbsjYp1rZal10VqQqrrOq/SL8h
	YW0BH7XoWGpYyjkmYYd+4RpcCIhpOWiCdhqqfFN3WHd/IGEeS0CfCTIZGi6lY3qD
	u25miTetuMnxbAG6ZXoEm9yYXWkqvgF01q2CHV7yFzPy4ui6Yn1gCEwM032zW+63
	z3UTQMwuiJbEFVatr/GfEHEzKNKuq3jI6h+DIky0YiyBM2h29AYdZDi0ubFaWxxQ
	/4k4LC80tFR/yUnuBPSMTWUSymMiqYDnfCM0YIpAGw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgx49fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:44:34 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AK9Yb9M029132;
	Thu, 20 Nov 2025 09:44:34 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgx49fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:44:34 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AK63A47022386;
	Thu, 20 Nov 2025 09:44:33 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af4un5pr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:44:33 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AK9iTw840304972
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Nov 2025 09:44:29 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3280A20043;
	Thu, 20 Nov 2025 09:44:29 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA0E520040;
	Thu, 20 Nov 2025 09:44:26 +0000 (GMT)
Received: from ltcd48-lp3.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 20 Nov 2025 09:44:26 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: mahesh@linux.ibm.com, oohall@gmail.com, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: bhelgaas@google.com, tpearson@raptorengineering.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        vaibhav@linux.ibm.com, sbhat@linux.ibm.com, ganeshgr@linux.ibm.com
Subject: [PATCH v1 1/1] powerpc/eeh: fix recursive pci_lock_rescan_remove locking in EEH event handling
Date: Wed, 19 Nov 2025 23:44:18 -0600
Message-ID: <20251120054418.3363-1-nnmlinux@linux.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HQXbn1hrniH07CMEwDqNaHVZJZ8CUIQ7
X-Authority-Analysis: v=2.4 cv=YqwChoYX c=1 sm=1 tr=0 ts=691ee302 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=qYjJlFfMWxv6U0P3q3EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: jRRUK8i8MFBQxapvgVztVNFQzbv18noj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXxl/XOJfWxun4
 ZqMfkUBSjvwNK9TWmsvlWoxHHZIfYT1VxTSN81lzJpq0preK/03q3MXLSdl3CGCzN/3jC12+Olf
 Tv92zd//pBPakzcgA7x1vbc18KMptISXh3+IKFuZNq5h0A8AtcXFe/+wYk9vQbB4iNtoOn20mWf
 9UgF0YQT+g+9OcqB/Yfba11eyGOrYPAdoBzaI/xdr0TG39dhIeLGLMz4vCsSB/4gWq0lwtuc2qn
 AexyE//qaOYtfSHa8lhXdNzJiK+349bcUJ6QaFSKTG/J2Vi6DUqswWSGFXX45JkXcuB77myLyXT
 zPoKReel8ZSAM6ZtL50OO6HtqEw/NH8Dd+NQQE4U55ssHwFUIyfkBoUSzGji3pzgDPPjlgLk8+x
 C9SR5lZBgA+pSN3VpuKRbSdoNDuGFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
X-Spam-Status: No, score=0.4 required=3.0 tests=DATE_IN_PAST_03_06,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The recent commit 1010b4c012b0 ("powerpc/eeh: Make EEH driver device
hotplug safe") restructured the EEH driver to improve synchronization
with the PCI hotplug layer.

However, it inadvertently moved pci_lock_rescan_remove() outside its
intended scope in eeh_handle_normal_event(), leading to broken PCI
error reporting and improper EEH event triggering. Specifically,
eeh_handle_normal_event() acquired pci_lock_rescan_remove() before
calling eeh_pe_bus_get(), but eeh_pe_bus_get() itself attempts to
acquire the same lock internally, causing nested locking and disrupting
normal EEH event handling paths.

This patch adds a boolean parameter do_lock to _eeh_pe_bus_get(),
with two public wrappers:
    eeh_pe_bus_get() with locking enabled.
    eeh_pe_bus_get_nolock() that skips locking.

Callers that already hold pci_lock_rescan_remove() now use
eeh_pe_bus_get_nolock() to avoid recursive lock acquisition.

Additionally, pci_lock_rescan_remove() calls are restored to the correct
position—after eeh_pe_bus_get() and immediately before iterating affected
PEs and devices. This ensures EEH-triggered PCI removes occur under proper
bus rescan locking without recursive lock contention.

The eeh_pe_loc_get() function has been split into two functions:
    eeh_pe_loc_get(struct eeh_pe *pe) which retrieves the loc for given PE.
    eeh_pe_loc_get_bus(struct pci_bus *bus) which retrieves the location
    code for given bus.

This resolves lockdep warnings such as:
<snip>
[   84.964298] [    T928] ============================================
[   84.964304] [    T928] WARNING: possible recursive locking detected
[   84.964311] [    T928] 6.18.0-rc3 #51 Not tainted
[   84.964315] [    T928] --------------------------------------------
[   84.964320] [    T928] eehd/928 is trying to acquire lock:
[   84.964324] [    T928] c000000003b29d58 (pci_rescan_remove_lock){+.+.}-{3:3}, at: pci_lock_rescan_remove+0x28/0x40
[   84.964342] [    T928]
                       but task is already holding lock:
[   84.964347] [    T928] c000000003b29d58 (pci_rescan_remove_lock){+.+.}-{3:3}, at: pci_lock_rescan_remove+0x28/0x40
[   84.964357] [    T928]
                       other info that might help us debug this:
[   84.964363] [    T928]  Possible unsafe locking scenario:

[   84.964367] [    T928]        CPU0
[   84.964370] [    T928]        ----
[   84.964373] [    T928]   lock(pci_rescan_remove_lock);
[   84.964378] [    T928]   lock(pci_rescan_remove_lock);
[   84.964383] [    T928]
                       *** DEADLOCK ***

[   84.964388] [    T928]  May be due to missing lock nesting notation

[   84.964393] [    T928] 1 lock held by eehd/928:
[   84.964397] [    T928]  #0: c000000003b29d58 (pci_rescan_remove_lock){+.+.}-{3:3}, at: pci_lock_rescan_remove+0x28/0x40
[   84.964408] [    T928]
                       stack backtrace:
[   84.964414] [    T928] CPU: 2 UID: 0 PID: 928 Comm: eehd Not tainted 6.18.0-rc3 #51 VOLUNTARY
[   84.964417] [    T928] Hardware name: IBM,9080-HEX POWER10 (architected) 0x800200 0xf000006 of:IBM,FW1060.00 (NH1060_022) hv:phyp pSeries
[   84.964419] [    T928] Call Trace:
[   84.964420] [    T928] [c0000011a7157990] [c000000001705de4] dump_stack_lvl+0xc8/0x130 (unreliable)
[   84.964424] [    T928] [c0000011a71579d0] [c0000000002f66e0] print_deadlock_bug+0x430/0x440
[   84.964428] [    T928] [c0000011a7157a70] [c0000000002fd0c0] __lock_acquire+0x1530/0x2d80
[   84.964431] [    T928] [c0000011a7157ba0] [c0000000002fea54] lock_acquire+0x144/0x410
[   84.964433] [    T928] [c0000011a7157cb0] [c0000011a7157cb0] __mutex_lock+0xf4/0x1050
[   84.964436] [    T928] [c0000011a7157e00] [c000000000de21d8] pci_lock_rescan_remove+0x28/0x40
[   84.964439] [    T928] [c0000011a7157e20] [c00000000004ed98] eeh_pe_bus_get+0x48/0xc0
[   84.964442] [    T928] [c0000011a7157e50] [c000000000050434] eeh_handle_normal_event+0x64/0xa60
[   84.964446] [    T928] [c0000011a7157f30] [c000000000051de8] eeh_event_handler+0xf8/0x190
[   84.964450] [    T928] [c0000011a7157f90] [c0000000002747ac] kthread+0x16c/0x180
[   84.964453] [    T928] [c0000011a7157fe0] [c00000000000ded8] start_kernel_thread+0x14/0x18
</snip>

Fixes: 1010b4c012b0 ("powerpc/eeh: Make EEH driver device hotplug safe")
Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>

Changelog:
V1:
  * Split eeh_pe_loc_get() into two functions — eeh_pe_loc_get() and
  * eeh_pe_loc_get_bus() to separate PE-to-bus lookup from PCI bus location
  * code retrieval, per code review suggestions.
---
 arch/powerpc/include/asm/eeh.h   |  2 +
 arch/powerpc/kernel/eeh_driver.c | 11 ++---
 arch/powerpc/kernel/eeh_pe.c     | 74 ++++++++++++++++++++++++++++++--
 3 files changed, 78 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 5e34611de9ef..b7ebb4ac2c71 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -289,6 +289,8 @@ void eeh_pe_dev_traverse(struct eeh_pe *root,
 void eeh_pe_restore_bars(struct eeh_pe *pe);
 const char *eeh_pe_loc_get(struct eeh_pe *pe);
 struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe);
+const char *eeh_pe_loc_get_bus(struct pci_bus *bus);
+struct pci_bus *eeh_pe_bus_get_nolock(struct eeh_pe *pe);
 
 void eeh_show_enabled(void);
 int __init eeh_init(struct eeh_ops *ops);
diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index ef78ff77cf8f..028f69158532 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -846,7 +846,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 
 	pci_lock_rescan_remove();
 
-	bus = eeh_pe_bus_get(pe);
+	bus = eeh_pe_bus_get_nolock(pe);
 	if (!bus) {
 		pr_err("%s: Cannot find PCI bus for PHB#%x-PE#%x\n",
 			__func__, pe->phb->global_number, pe->addr);
@@ -886,14 +886,15 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 	/* Log the event */
 	if (pe->type & EEH_PE_PHB) {
 		pr_err("EEH: Recovering PHB#%x, location: %s\n",
-			pe->phb->global_number, eeh_pe_loc_get(pe));
+			pe->phb->global_number, eeh_pe_loc_get_bus(bus));
 	} else {
 		struct eeh_pe *phb_pe = eeh_phb_pe_get(pe->phb);
 
 		pr_err("EEH: Recovering PHB#%x-PE#%x\n",
 		       pe->phb->global_number, pe->addr);
 		pr_err("EEH: PE location: %s, PHB location: %s\n",
-		       eeh_pe_loc_get(pe), eeh_pe_loc_get(phb_pe));
+		       eeh_pe_loc_get_bus(bus),
+		       eeh_pe_loc_get_bus(eeh_pe_bus_get_nolock(phb_pe)));
 	}
 
 #ifdef CONFIG_STACKTRACE
@@ -1098,7 +1099,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		eeh_pe_state_clear(pe, EEH_PE_PRI_BUS, true);
 		eeh_pe_dev_mode_mark(pe, EEH_DEV_REMOVED);
 
-		bus = eeh_pe_bus_get(pe);
+		bus = eeh_pe_bus_get_nolock(pe);
 		if (bus)
 			pci_hp_remove_devices(bus);
 		else
@@ -1222,7 +1223,7 @@ void eeh_handle_special_event(void)
 				    (phb_pe->state & EEH_PE_RECOVERING))
 					continue;
 
-				bus = eeh_pe_bus_get(phb_pe);
+				bus = eeh_pe_bus_get_nolock(phb_pe);
 				if (!bus) {
 					pr_err("%s: Cannot find PCI bus for "
 					       "PHB#%x-PE#%x\n",
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index e740101fadf3..040e8f69a4aa 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -812,6 +812,24 @@ void eeh_pe_restore_bars(struct eeh_pe *pe)
 const char *eeh_pe_loc_get(struct eeh_pe *pe)
 {
 	struct pci_bus *bus = eeh_pe_bus_get(pe);
+	return eeh_pe_loc_get_bus(bus);
+}
+
+/**
+ * eeh_pe_loc_get_bus - Retrieve location code binding to the given PCI bus
+ * @bus: PCI bus
+ *
+ * Retrieve the location code associated with the given PCI bus. If the bus
+ * is a root bus, the location code is fetched from the PHB device tree node
+ * or root port. Otherwise, the location code is obtained from the device
+ * tree node of the upstream bridge of the bus. The function walks up the
+ * bus hierarchy if necessary, checking each node for the appropriate
+ * location code property ("ibm,io-base-loc-code" for root buses,
+ * "ibm,slot-location-code" for others). If no location code is found,
+ * returns "N/A".
+ */
+const char *eeh_pe_loc_get_bus(struct pci_bus *bus)
+{
 	struct device_node *dn;
 	const char *loc = NULL;
 
@@ -838,8 +856,9 @@ const char *eeh_pe_loc_get(struct eeh_pe *pe)
 }
 
 /**
- * eeh_pe_bus_get - Retrieve PCI bus according to the given PE
+ * _eeh_pe_bus_get - Retrieve PCI bus according to the given PE
  * @pe: EEH PE
+ * @do_lock: Is the caller already held the pci_lock_rescan_remove?
  *
  * Retrieve the PCI bus according to the given PE. Basically,
  * there're 3 types of PEs: PHB/Bus/Device. For PHB PE, the
@@ -847,7 +866,7 @@ const char *eeh_pe_loc_get(struct eeh_pe *pe)
  * returned for BUS PE. However, we don't have associated PCI
  * bus for DEVICE PE.
  */
-struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe)
+static struct pci_bus *_eeh_pe_bus_get(struct eeh_pe *pe, bool do_lock)
 {
 	struct eeh_dev *edev;
 	struct pci_dev *pdev;
@@ -862,11 +881,58 @@ struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe)
 
 	/* Retrieve the parent PCI bus of first (top) PCI device */
 	edev = list_first_entry_or_null(&pe->edevs, struct eeh_dev, entry);
-	pci_lock_rescan_remove();
+	if (do_lock)
+		pci_lock_rescan_remove();
 	pdev = eeh_dev_to_pci_dev(edev);
 	if (pdev)
 		bus = pdev->bus;
-	pci_unlock_rescan_remove();
+	if (do_lock)
+		pci_unlock_rescan_remove();
 
 	return bus;
 }
+
+/**
+ * eeh_pe_bus_get - Retrieve PCI bus associated with the given EEH PE, locking
+ * if needed
+ * @pe: Pointer to the EEH PE
+ *
+ * This function is a wrapper around _eeh_pe_bus_get(), which retrieves the PCI
+ * bus associated with the provided EEH PE structure. It acquires the PCI
+ * rescans lock to ensure safe access to shared data during the retrieval
+ * process. This function should be used when the caller requires the PCI bus
+ * while holding the rescan/remove lock, typically during operations that modify
+ * or inspect PCIe device state in a safe manner.
+ *
+ * RETURNS:
+ * A pointer to the PCI bus associated with the EEH PE, or NULL if none found.
+ */
+
+struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe)
+{
+	return _eeh_pe_bus_get(pe, true);
+}
+
+/**
+ * eeh_pe_bus_get_nolock - Retrieve PCI bus associated with the given EEH PE
+ * without locking
+ * @pe: Pointer to the EEH PE
+ *
+ * This function is a variant of _eeh_pe_bus_get() that retrieves the PCI bus
+ * associated with the specified EEH PE without acquiring the
+ * pci_lock_rescan_remove lock. It should only be used when the caller can
+ * guarantee safe access to PE structures without the need for that lock,
+ * typically in contexts where the lock is already held locking is otherwise
+ * managed.
+ *
+ * RETURNS:
+ * pointer to the PCI bus associated with the EEH PE, or NULL if none is found.
+ *
+ * NOTE:
+ * Use this function carefully to avoid race conditions and data corruption.
+ */
+
+struct pci_bus *eeh_pe_bus_get_nolock(struct eeh_pe *pe)
+{
+	return _eeh_pe_bus_get(pe, false);
+}
-- 
2.51.1


