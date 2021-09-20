Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3F04119DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 18:34:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCqs10Mshz2yQD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 02:34:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k5kCz6Q6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=srs0=azhu=ok=linux.ibm.com=mahesh@ozlabs.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=k5kCz6Q6; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCqrF1bNvz2xZm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 02:33:48 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4HCqr326sBz9sPf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 02:33:39 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4HCqr31rfZz9sRN; Tue, 21 Sep 2021 02:33:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=k5kCz6Q6; dkim-atps=neutral
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4HCqr25tJfz9sPf
 for <linuxppc-dev@ozlabs.org>; Tue, 21 Sep 2021 02:33:38 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18KFID5G005931
 for <linuxppc-dev@ozlabs.org>; Mon, 20 Sep 2021 12:33:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=zQ5zC6i/SOrComl+jYn9q71n5ugxu/J6NeWDkyqIyJQ=;
 b=k5kCz6Q664RTU/S7eADOUOhqD+ern+QYJaauJVpDWuPf9VkjP5V/4hm2CelI+gyw5sWT
 NchXCgZZ5uZOwH115liWR3AFR6/l+c/EawaKfqU/6qaSHCCdmvRvSzA5MPuVK8qrHhIZ
 QUR3lmoX1hOYYtDAh+8F2fNDa6OMMOKGozbh6nXo/a97jeDzD3unii0nNkw/H/2x/wgI
 ElTlMOU8YjpZwb6g5/NtOg+oFtM/GMVZifp59fOZHrE2Q50q/4C/w5D3j89itafKLk4i
 qruAlGGrBn8hQW/j36RvHAwknC9Rqeso2xQoJFzVXowgPJ9sSNkrgTabr9klhLHrVBBG Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b5w4dpwqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 20 Sep 2021 12:33:34 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18KGA2gg031478
 for <linuxppc-dev@ozlabs.org>; Mon, 20 Sep 2021 12:33:33 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b5w4dpwq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 12:33:33 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18KGD8Fo021583;
 Mon, 20 Sep 2021 16:33:31 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3b57r8k2h6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 16:33:31 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18KGXS8B14942568
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Sep 2021 16:33:28 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC69FA406D;
 Mon, 20 Sep 2021 16:33:28 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8B5AA4054;
 Mon, 20 Sep 2021 16:33:27 +0000 (GMT)
Received: from [192.168.0.63] (unknown [9.43.72.77])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Sep 2021 16:33:27 +0000 (GMT)
Subject: [PATCH] pseries/eeh: fix the kdump kernel crash during
 eeh_pseries_init
From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Mon, 20 Sep 2021 22:03:26 +0530
Message-ID: <163215558252.413351.8600189949820258982.stgit@jupiter>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ouwnuRB-UTTgmsirfRi9MujWFivvn3aF
X-Proofpoint-ORIG-GUID: h6ixYVjuvstand0_2oce1QqT2vs-xc8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_07,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 malwarescore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109200102
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
Cc: Wen Xiong <wenxiong@linux.vnet.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On pseries lpar when an empty slot is assigned to partition OR on single
lpar mode, kdump kernel crashes during issuing PHB reset. In the kdump
scenario, we traverse all PHBs and issue reset using the pe_config_addr of
first child device present under each PHB. However the code assumes that
none of the PHB slot can be empty and uses list_first_entry() to get first
child device under PHB. Since list_first_entry() expect list to be not
empty, it returns invalid pci_dn entry and ends up accessing NULL phb
pointer under pci_dn->phb causing kdump kernel crash.

This patch fixes the below kdump kernel crash by skipping the empty slot:

[    0.003655] audit: initializing netlink subsys (disabled)
[    0.003765] thermal_sys: Registered thermal governor 'fair_share'
[    0.003767] thermal_sys: Registered thermal governor 'step_wise'
[    0.003783] cpuidle: using governor menu
[    0.003977] pstore: Registered nvram as persistent store backend
[    0.004590] Issue PHB reset ...
[    0.004794] audit: type=2000 audit(1631267818.000:1): state=initialized audit_enabled=0 res=1
[    2.233957] BUG: Kernel NULL pointer dereference on read at 0x00000268
[    2.233966] Faulting instruction address: 0xc000000008101fb0
[    2.233972] Oops: Kernel access of bad area, sig: 7 [#1]
[    2.233977] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
[    2.233984] Modules linked in:
[    2.233989] CPU: 7 PID: 1 Comm: swapper/7 Not tainted 5.14.0 #1
[    2.233996] NIP:  c000000008101fb0 LR: c000000009284ccc CTR: c000000008029d70
[    2.234003] REGS: c00000001161b840 TRAP: 0300   Not tainted  (5.14.0)
[    2.234008] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 28000224  XER: 20040002
[    2.234022] CFAR: c000000008101f0c DAR: 0000000000000268 DSISR: 00080000 IRQMASK: 0
[    2.234022] GPR00: c000000009284ccc c00000001161bae0 c000000009c6d800 000000000000004d
[    2.234022] GPR04: 0000000000000004 0000000000000002 c00000001161bb4c 0000000000000000
[    2.234022] GPR08: 0000000000000000 0000000000000000 0000000000000001 c000000008e59a80
[    2.234022] GPR12: c000000008029d70 c000000009ff0400 c00000000801285c 0000000000000000
[    2.234022] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    2.234022] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    2.234022] GPR24: c00000000926338c c000000009248860 c0000000092f1048 c000000011079c00
[    2.234022] GPR28: c000000009785af8 c000000009d4b920 0000000000000000 0000000000000000
[    2.234091] NIP [c000000008101fb0] pseries_eeh_get_pe_config_addr+0x100/0x1b0
[    2.234100] LR [c000000009284ccc] __machine_initcall_pseries_eeh_pseries_init+0x2cc/0x350
[    2.234108] Call Trace:
[    2.234111] [c00000001161bae0] [c00000001161bb80] 0xc00000001161bb80 (unreliable)
[    2.234120] [c00000001161bb80] [c000000009284ccc] __machine_initcall_pseries_eeh_pseries_init+0x2cc/0x350
[    2.234128] [c00000001161bc00] [c000000008012210] do_one_initcall+0x60/0x2d0
[    2.234136] [c00000001161bcd0] [c000000009264990] kernel_init_freeable+0x350/0x3f8
[    2.234145] [c00000001161bda0] [c000000008012890] kernel_init+0x3c/0x17c
[    2.234151] [c00000001161be10] [c00000000800cdd4] ret_from_kernel_thread+0x5c/0x64
[    2.234159] Instruction dump:
[    2.234163] eba1ffe8 ebc1fff0 ebe1fff8 4e800020 7c0802a6 7ce33b78 39400001 7fe7fb78
[    2.234174] 38a00002 38800004 38c1006c f80100b0 <e91e0268> 79090020 79080022 4bf48edd
[    2.234187] ---[ end trace bee3ba4dca6761d3 ]---
[    2.235907]
[    3.235914] Kernel panic - not syncing: Fatal exception

Fixes: 5a090f7c363fd ("powerpc/pseries: PCIE PHB reset")
Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/eeh_pseries.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index bc15200852b7c..8780e7d33a0f5 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -867,6 +867,10 @@ static int __init eeh_pseries_init(void)
 	if (is_kdump_kernel() || reset_devices) {
 		pr_info("Issue PHB reset ...\n");
 		list_for_each_entry(phb, &hose_list, list_node) {
+			/* Skip the empty slot */
+			if (list_empty(&PCI_DN(phb->dn)->child_list))
+				continue;
+
 			pdn = list_first_entry(&PCI_DN(phb->dn)->child_list, struct pci_dn, list);
 			config_addr = pseries_eeh_get_pe_config_addr(pdn);
 


