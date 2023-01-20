Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 767C4675134
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 10:33:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyvS82Ynvz3fKL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 20:33:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b2+Icdv7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b2+Icdv7;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyvRC4jpqz30DC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 20:32:23 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30K98YJB023307
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 09:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=YuGRUUS41Um+SEGW8JTG0dcT2NQiE/lmok6xax6t99w=;
 b=b2+Icdv7wjpzct1bLoUt/NQmTA/cOpwZqTMBTPWkwe2Ah6fPtJxW99WARAE/XNE+BdwV
 NIL2+N+iYq/yJe4sb3v7dhnkfmhNCOxSSRJidORTzpdts0169h8+wt2/p7MTqPrVRgcY
 EM1WPg/tCEdRY5J/ovdM3nvuzWdVCxp/3Pw9vdH2AFqHipKsbAUtXMH7FvCPZNv8VpeH
 +hqVbDxQ1r0UfphWG5a+4aEJCz3U9SMvvZJ96lUla15CjjNmZBe4lkhJZMFyyO4dz37r
 ZoXGADWKAHOB4Fvz1Ke6r/ptSS7Wf3EhS22y+3YswDe3d7jtECq/lbK60tROU+5H3yXC Lg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7kvx5ktt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 09:32:20 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30JNhZmk013172
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 09:32:18 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3n3knfdpbs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 09:32:18 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30K9WGrY44106004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 09:32:16 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2BA320043;
	Fri, 20 Jan 2023 09:32:15 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9DF2D20040;
	Fri, 20 Jan 2023 09:32:15 +0000 (GMT)
Received: from borneo.ibmuc.com (unknown [9.171.85.114])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Jan 2023 09:32:15 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powernv/ioda: Skip unallocated resources when mapping to PE
Date: Fri, 20 Jan 2023 10:32:15 +0100
Message-Id: <20230120093215.19496-1-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Sc45EdssZc7_ClzgkmL9c80OD3WqR3Jo
X-Proofpoint-GUID: Sc45EdssZc7_ClzgkmL9c80OD3WqR3Jo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_06,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 phishscore=0 spamscore=0 mlxlogscore=603 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301200090
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
Cc: andrew@aj.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pnv_ioda_setup_pe_res() calls opal to map a resource with a PE. However,
the code assumes the resource is allocated and it uses the resource
address to find out the segment(s) which need to be mapped to the
PE. In the unlikely case where the resource hasn't been allocated, the
computation for the segment number is garbage, which can lead to
invalid memory access and potentially a kernel crash, such as:

[ ] pci_bus 0002:02: Configuring PE for bus
[ ] pci 0002:02     : [PE# fc] Secondary bus 0x0000000000000002..0x0000000000000002 associated with PE#fc
[ ] BUG: Kernel NULL pointer dereference on write at 0x00000000
[ ] Faulting instruction address: 0xc00000000005eac4
[ ] Oops: Kernel access of bad area, sig: 7 [#1]
[ ] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
[ ] Modules linked in:
[ ] CPU: 12 PID: 1 Comm: swapper/20 Not tainted 5.10.50-openpower1 #2
[ ] NIP:  c00000000005eac4 LR: c00000000005ea44 CTR: 0000000030061b9c
[ ] REGS: c000200007383650 TRAP: 0300   Not tainted  (5.10.50-openpower1)
[ ] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 44000224  XER: 20040000
[ ] CFAR: c00000000005eaa0 DAR: 0000000000000000 DSISR: 02080000 IRQMASK: 0
[ ] GPR00: c00000000005dd98 c0002000073838e0 c00000000185de00 c000200fff018960
[ ] GPR04: 00000000000000fc 0000000000000003 0000000000000000 0000000000000000
[ ] GPR08: 0000000000000000 0000000000000000 0000000000000000 9000000000001033
[ ] GPR12: 0000000031cb0000 c000000ffffe6a80 c000000000010a58 0000000000000000
[ ] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[ ] GPR20: 0000000000000000 0000000000000000 0000000000000000 c00000000711e200
[ ] GPR24: 0000000000000100 c000200009501120 c00020000cee2800 00000000000003ff
[ ] GPR28: c000200fff018960 0000000000000000 c000200ffcb7fd00 0000000000000000
[ ] NIP [c00000000005eac4] pnv_ioda_setup_pe_res+0x94/0x1a0
[ ] LR [c00000000005ea44] pnv_ioda_setup_pe_res+0x14/0x1a0
[ ] Call Trace:
[ ] [c0002000073838e0] [c00000000005eb98] pnv_ioda_setup_pe_res+0x168/0x1a0 (unreliable)
[ ] [c000200007383970] [c00000000005dd98] pnv_pci_ioda_dma_dev_setup+0x43c/0x970
[ ] [c000200007383a60] [c000000000032cdc] pcibios_bus_add_device+0x78/0x18c
[ ] [c000200007383aa0] [c00000000028f2bc] pci_bus_add_device+0x28/0xbc
[ ] [c000200007383b10] [c00000000028f3a0] pci_bus_add_devices+0x50/0x7c
[ ] [c000200007383b50] [c00000000028f3c4] pci_bus_add_devices+0x74/0x7c
[ ] [c000200007383b90] [c00000000028f3c4] pci_bus_add_devices+0x74/0x7c
[ ] [c000200007383bd0] [c00000000069ad0c] pcibios_init+0xf0/0x104
[ ] [c000200007383c50] [c0000000000106d8] do_one_initcall+0x84/0x1c4
[ ] [c000200007383d20] [c0000000006910b8] kernel_init_freeable+0x264/0x268
[ ] [c000200007383dc0] [c000000000010a68] kernel_init+0x18/0x138
[ ] [c000200007383e20] [c00000000000cbfc] ret_from_kernel_thread+0x5c/0x80
[ ] Instruction dump:
[ ] 7f89e840 409d000c 7fbbf840 409c000c 38210090 4848f448 809c002c e95e0120
[ ] 7ba91764 38a00003 57a7043e 38c00000 <7c8a492e> 5484043e e87e0018 4bff23bd

Hitting the problem is not that easy. It was seen with a (semi-bogus)
PCI device with a class code of 0. The generic PCI framework doesn't
allocate resources in such a case.

The patch is simply skipping resources which are still flagged with
IORESOURCE_UNSET.

We don't have the problem with 64-bit mem resources, as the address of
the resource is checked to be within the range of the 64-bit mmio
window. See pnv_ioda_reserve_dev_m64_pe() and pnv_pci_is_m64().

Reported-by: Andrew Jeffery <andrew@aj.id.au>
Fixes: 23e79425fe7c ("powerpc/powernv: Simplify pnv_ioda_setup_pe_seg()")
Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 5c144c05cbfd..4f6e20a35aa1 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2325,7 +2325,8 @@ static void pnv_ioda_setup_pe_res(struct pnv_ioda_pe *pe,
 	int index;
 	int64_t rc;
 
-	if (!res || !res->flags || res->start > res->end)
+	if (!res || !res->flags || res->start > res->end ||
+	    res->flags & IORESOURCE_UNSET)
 		return;
 
 	if (res->flags & IORESOURCE_IO) {
-- 
2.39.0

