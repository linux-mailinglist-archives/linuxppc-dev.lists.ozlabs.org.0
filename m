Return-Path: <linuxppc-dev+bounces-13790-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA97DC35248
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 11:41:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1hhN1KXrz2yjp;
	Wed,  5 Nov 2025 21:41:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762339300;
	cv=none; b=OmUEdIeXraDyjZj4Y4i825ug9AaVWAMi1EcZMzlal73vl5sDfv9StM4rfjvUu1TpiwfwVoxercRLed2tfzJc9dArYSI/cZZIzalA25VTMRA7uD5iMAXDVXzR/68vS5VDSB1/134hmM5to6PAAk/bBJl76p+OnZLb79aEMuRraZCMeRbS+UoKTwngQDO1qZzL6tx59hQXrVF+0ANG0Qu+ccpsnT5VFzQOAsLGxWLZOswdDaACC5txVOnaeGEbp69bvrVV6tZb72xIWAyIBUXbSxObgYRyy4x240H7yPUNLyZvu7tqHcrvcZyDKamhKmkrXe8GRltJsNoDmNAvgnRpCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762339300; c=relaxed/relaxed;
	bh=TdF3lTh+r/l56RTaLhfxht1G+SEf8ND8yqvDTNPUdRM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DzjdXJyBOl6TngbbrlTnSpA7GLJyH4qLELX6TwEAHzIE/UX1bcOr8/npCPcsS+/iAN0Y3ZbRkanAmlC4dCrYlRsTRppdsXTCQ4+OniSv7reUtmN+ACILsCT1eKZ0QU4lR4ZurTznfQHVQxIOlYjiaFTYqKnhXTDpog9PY9MXLRu3sFGOWfquqJEGUCFv5pbihHjG77Gr2Els9RoZA8IF7Cudn8iJ7meGA16W4FVIMiLLvejaPRr/Zyn2zvrNR2WOxz7KkdaiqKwuOTiapChfplZJjjDifCJGUVoJ8CQo5tuQ0lfgdFC51g/YrdkIZ13XvGif2Zd+J51eqChbWiBOaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f3ZjPHkY; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f3ZjPHkY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1hhM1GKnz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 21:41:38 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A53amA8009906;
	Wed, 5 Nov 2025 10:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=TdF3lTh+r/l56RTaLhfxht1G+SEf
	8ND8yqvDTNPUdRM=; b=f3ZjPHkY50FHZhp07sCKWyKK/8TEq2SH5SimfBdbwlRF
	OHNj5wcuVV+MxKEzncygO0tsv71lIDHYvvXmkNFBDKAxqtlOjmkvVDB7sjeK4hld
	KPunp8T8/L+OhaDEm9KgD/xn8/oMorpsObRjOHdxAbHWKdw5K3c+z4ccsgqxlT9k
	Xsuafo9vXitPPEHGAljJMJnu0S0BaZKZYn8cpnUE+J3t9cPMqmTbmEQM0vLz7Oq2
	Oq+WSNVArQ9uomdrvv+agqtBjxvhy93mS/nXgt7athcz/ydySAfKH+XXq6rdhb8O
	QdsHXb2VuAMj/8aLwd6CoWFRkft98kT4a6CDb3eGtw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59xc0pny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 10:41:28 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A5AcN0w013581;
	Wed, 5 Nov 2025 10:41:27 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59xc0pnu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 10:41:27 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A58xt0v021483;
	Wed, 5 Nov 2025 10:41:26 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5xrjqc6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 10:41:26 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A5AfN3K42991958
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Nov 2025 10:41:23 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EEF2E2004D;
	Wed,  5 Nov 2025 10:41:22 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ACBDF20040;
	Wed,  5 Nov 2025 10:41:20 +0000 (GMT)
Received: from ltcd48-lp3.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Nov 2025 10:41:20 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: mahesh@linux.ibm.com, oohall@gmail.com, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: bhelgaas@google.com, tpearson@raptorengineering.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        vaibhav@linux.ibm.com, sbhat@linux.ibm.com, ganeshgr@linux.ibm.com
Subject: [PATCH 1/1] powerpc/eeh: fix recursive pci_lock_rescan_remove locking in EEH event handling
Date: Wed,  5 Nov 2025 00:40:52 -0600
Message-ID: <20251105064052.8122-1-nnmlinux@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfX85y0C+rgv+eN
 d2/QSXB9FkSkOzaRTsl0SFXCUXPz/gZOdIeJyH+ajuO/T6LK35tLHGNpBmP/W7svKKteVLGKgUU
 ROxgbvCvyZFqvSLx5sk7cENXZ0TbXRsnmvBd8LjzeLyg0BI5r6VyQwDU1kJgtwvEVFzNY1L9UV1
 8zPsxjUP2IQXTIcJPbm2LpfkulusaMthpHetjp8G32xiElS8MRAQXUNNbwg4NR61bQ7w8i4wcsP
 gcoLY890tG4G6R9rt2UoaDRNMhzAQj1n9CDpv5wtRzaqZEYuKZy3v+vEW6GFA8vF21SkQbU25t/
 Likw7uWR/5Xf77bZ3O5q/6ySZxf+RmvpyE/uyFN3716/Uaub0bNj897BYT69nRnCR+QOvhQjCz0
 dk3PmZc2bnpfl/jmEeY76EVi7y7icw==
X-Proofpoint-GUID: 2gntqN8m7KHg36OWCFms_gZsFDeoJpna
X-Authority-Analysis: v=2.4 cv=OdCVzxTY c=1 sm=1 tr=0 ts=690b29d8 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=qYjJlFfMWxv6U0P3q3EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 99TOQhbxkkhg3U9cUEyjvNTSD0ooVgkc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010021
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
---
 arch/powerpc/include/asm/eeh.h   |  1 +
 arch/powerpc/kernel/eeh_driver.c | 39 +++++++++++++++++++---
 arch/powerpc/kernel/eeh_pe.c     | 56 +++++++++++++++++++++++++++++---
 3 files changed, 87 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 5e34611de9ef..1cc3ae81b905 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -289,6 +289,7 @@ void eeh_pe_dev_traverse(struct eeh_pe *root,
 void eeh_pe_restore_bars(struct eeh_pe *pe);
 const char *eeh_pe_loc_get(struct eeh_pe *pe);
 struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe);
+struct pci_bus *eeh_pe_bus_get_nolock(struct eeh_pe *pe);
 
 void eeh_show_enabled(void);
 int __init eeh_init(struct eeh_ops *ops);
diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index ef78ff77cf8f..492fae5e3823 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -812,6 +812,35 @@ static void eeh_clear_slot_attention(struct pci_dev *pdev)
 	ops->set_attention_status(slot->hotplug, 0);
 }
 
+static const char *eeh_pe_get_loc(struct eeh_pe *pe)
+{
+	struct pci_bus *bus = eeh_pe_bus_get_nolock(pe);
+	struct device_node *dn;
+	const char *location = NULL;
+
+	while (bus) {
+		dn = pci_bus_to_OF_node(bus);
+		if (!dn) {
+			bus = bus->parent;
+			continue;
+		}
+
+		if (pci_is_root_bus(bus))
+			location = of_get_property(dn, "ibm,io-base-loc-code",
+						   NULL);
+		else
+			location = of_get_property(dn, "ibm,slot-location-code",
+						   NULL);
+
+		if (location)
+			return location;
+
+		bus = bus->parent;
+	}
+
+	return "N/A";
+}
+
 /**
  * eeh_handle_normal_event - Handle EEH events on a specific PE
  * @pe: EEH PE - which should not be used after we return, as it may
@@ -846,7 +875,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 
 	pci_lock_rescan_remove();
 
-	bus = eeh_pe_bus_get(pe);
+	bus = eeh_pe_bus_get_nolock(pe);
 	if (!bus) {
 		pr_err("%s: Cannot find PCI bus for PHB#%x-PE#%x\n",
 			__func__, pe->phb->global_number, pe->addr);
@@ -886,14 +915,14 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 	/* Log the event */
 	if (pe->type & EEH_PE_PHB) {
 		pr_err("EEH: Recovering PHB#%x, location: %s\n",
-			pe->phb->global_number, eeh_pe_loc_get(pe));
+			pe->phb->global_number, eeh_pe_get_loc(pe));
 	} else {
 		struct eeh_pe *phb_pe = eeh_phb_pe_get(pe->phb);
 
 		pr_err("EEH: Recovering PHB#%x-PE#%x\n",
 		       pe->phb->global_number, pe->addr);
 		pr_err("EEH: PE location: %s, PHB location: %s\n",
-		       eeh_pe_loc_get(pe), eeh_pe_loc_get(phb_pe));
+		       eeh_pe_get_loc(pe), eeh_pe_get_loc(phb_pe));
 	}
 
 #ifdef CONFIG_STACKTRACE
@@ -1098,7 +1127,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		eeh_pe_state_clear(pe, EEH_PE_PRI_BUS, true);
 		eeh_pe_dev_mode_mark(pe, EEH_DEV_REMOVED);
 
-		bus = eeh_pe_bus_get(pe);
+		bus = eeh_pe_bus_get_nolock(pe);
 		if (bus)
 			pci_hp_remove_devices(bus);
 		else
@@ -1222,7 +1251,7 @@ void eeh_handle_special_event(void)
 				    (phb_pe->state & EEH_PE_RECOVERING))
 					continue;
 
-				bus = eeh_pe_bus_get(phb_pe);
+				bus = eeh_pe_bus_get_nolock(phb_pe);
 				if (!bus) {
 					pr_err("%s: Cannot find PCI bus for "
 					       "PHB#%x-PE#%x\n",
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index e740101fadf3..f809ada15e56 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -838,8 +838,9 @@ const char *eeh_pe_loc_get(struct eeh_pe *pe)
 }
 
 /**
- * eeh_pe_bus_get - Retrieve PCI bus according to the given PE
+ * _eeh_pe_bus_get - Retrieve PCI bus according to the given PE
  * @pe: EEH PE
+ * @do_lock: Is the caller already held the pci_lock_rescan_remove?
  *
  * Retrieve the PCI bus according to the given PE. Basically,
  * there're 3 types of PEs: PHB/Bus/Device. For PHB PE, the
@@ -847,7 +848,7 @@ const char *eeh_pe_loc_get(struct eeh_pe *pe)
  * returned for BUS PE. However, we don't have associated PCI
  * bus for DEVICE PE.
  */
-struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe)
+static struct pci_bus *_eeh_pe_bus_get(struct eeh_pe *pe, bool do_lock)
 {
 	struct eeh_dev *edev;
 	struct pci_dev *pdev;
@@ -862,11 +863,58 @@ struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe)
 
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
2.51.0


