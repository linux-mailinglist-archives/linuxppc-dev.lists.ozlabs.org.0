Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D381223F7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 06:42:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cRqx74NMzDqDd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 16:42:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cRmm1nFjzDqMy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 16:40:07 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBH5bQaT125877; Tue, 17 Dec 2019 00:39:56 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wvw5bxt9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 00:39:55 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBH5cVjJ129092;
 Tue, 17 Dec 2019 00:39:55 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wvw5bxt8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 00:39:55 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBH5YmDW007928;
 Tue, 17 Dec 2019 05:39:59 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 2wvqc61g7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2019 05:39:59 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBH5dr4J47710496
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Dec 2019 05:39:53 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7C072805E;
 Tue, 17 Dec 2019 05:39:53 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECCE728058;
 Tue, 17 Dec 2019 05:39:52 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 17 Dec 2019 05:39:52 +0000 (GMT)
Subject: [PATCH V3 00/13] powerpc/vas: Page fault handling for user space
 NX requests
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, hch@infradead.org, devicetree@vger.kernel.org,
 mikey@neuling.org, herbert@gondor.apana.org.au, npiggin@gmail.com,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Dec 2019 21:38:00 -0800
Message-ID: <1576561080.16318.6531.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-17_01:2019-12-16,2019-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=2
 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912170050
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
Cc: sukadev@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On power9, Virtual Accelerator Switchboard (VAS) allows user space or
kernel to communicate with Nest Accelerator (NX) directly using COPY/PASTE
instructions. NX provides verious functionalities such as compression,
encryption and etc. But only compression (842 and GZIP formats) is
supported in Linux kernel on power9.

842 compression driver (drivers/crypto/nx/nx-842-powernv.c)
is already included in Linux. Only GZIP support will be available from
user space.

Applications can issue GZIP compression / decompression requests to NX with
COPY/PASTE instructions. When NX is processing these requests, can hit
fault on the request buffer (not in memory). It issues an interrupt and
pastes fault CRB in fault FIFO. Expects kernel to handle this fault and
return credits for both send and fault windows after processing.

This patch series adds IRQ and fault window setup, and NX fault handling:
- Read IRQ# from "interrupts" property and configure IRQ per VAS instance.
- Set port# for each window to generate an interrupt when noticed fault.
- Set fault window and FIFO on which NX paste fault CRB.
- Setup IRQ thread fault handler per VAS instance.
- When receiving an interrupt, Read CRBs from fault FIFO and update
  coprocessor_status_block (CSB) in the corresponding CRB with translation
  failure (CSB_CC_TRANSLATION). After issuing NX requests, process polls
  on CSB address. When it sees translation error, can touch the request
  buffer to bring the page in to memory and reissue NX request.
- If copy_to_user fails on user space CSB address, OS sends SEGV signal.

Tested these patches with NX-GZIP support and will be posting this series
soon.

Patch 2: Define nx_fault_stamp on which NX writes fault status for the fault
         CRB
Patch 3: Read interrupts and port properties per VAS instance
Patch 4: Setup fault window per each VAS instance. This window is used for
         NX to paste fault CRB in FIFO.
Patches 5 & 6: Setup threaded IRQ per VAS and register NX with fault window
         ID and port number for each send window so that NX paste fault CRB
         in this window.
Patch 7: Reference to pid and mm so that pid is not used until window closed.
         Needed for multi thread application where child can open a window
         and can be used by parent later.
Patches 8 and 9: Process CRBs from fault FIFO and notify tasks by
         updating CSB or through signals.
Patches 10 and 11: Return credits for send and fault windows after handling
        faults.
Patch 13:Fix closing send window after all credits are returned. This issue
         happens only for user space requests. No page faults on kernel
         request buffer.

Changelog:
V2:
  - Use threaded IRQ instead of own kernel thread handler
  - Use pswid insted of user space CSB address to find valid CRB
  - Removed unused macros and other changes as suggested by Christoph Hellwig

V3:
  - Rebased to 5.5-rc2
  - Use struct pid * instead of pid_t for vas_window tgid
  - Code cleanup as suggested by Christoph Hellwig

Haren Myneni (13):
  powerpc/vas: Describe vas-port and interrupts properties
  powerpc/vas: Define nx_fault_stamp in coprocessor_request_block
  powerpc/vas: Read interrupts and vas-port device tree properties
  powerpc/vas: Setup fault window per VAS instance
  powerpc/vas: Setup thread IRQ handler per VAS instance
  powerpc/vas: Register NX with fault window ID and IRQ port value
  powerpc/vas: Take reference to PID and mm for user space windows
  powerpc/vas: Update CSB and notify process for fault CRBs
  powerpc/vas: Print CRB and FIFO values
  powerpc/vas: Do not use default credits for receive window
  powerpc/VAS: Return credits after handling fault
  powerpc/vas: Display process stuck message
  powerpc/vas: Free send window in VAS instance after credits returned

 .../devicetree/bindings/powerpc/ibm,vas.txt        |   5 +
 arch/powerpc/include/asm/icswx.h                   |  18 +-
 arch/powerpc/platforms/powernv/Makefile            |   2 +-
 arch/powerpc/platforms/powernv/vas-debug.c         |   2 +-
 arch/powerpc/platforms/powernv/vas-fault.c         | 328 +++++++++++++++++++++
 arch/powerpc/platforms/powernv/vas-window.c        | 182 +++++++++++-
 arch/powerpc/platforms/powernv/vas.c               |  79 ++++-
 arch/powerpc/platforms/powernv/vas.h               |  38 ++-
 scripts/pnmtologo                                  | Bin 0 -> 71976 bytes
 9 files changed, 628 insertions(+), 26 deletions(-)
 create mode 100644 arch/powerpc/platforms/powernv/vas-fault.c
 create mode 100755 scripts/pnmtologo

-- 
1.8.3.1



