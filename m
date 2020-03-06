Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FE617C6CE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 21:09:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YzHF42FRzDrNt
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 07:09:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YzDt6fNnzDr7l
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 07:07:42 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026K3Hi5142292; Fri, 6 Mar 2020 15:07:27 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfknenmnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 15:07:26 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 026K3Pok142624;
 Fri, 6 Mar 2020 15:07:25 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfknenmmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 15:07:25 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 026K2lhN009551;
 Fri, 6 Mar 2020 20:07:24 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 2yffk7ucpx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 20:07:24 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 026K7M2W58065200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Mar 2020 20:07:22 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7B9A6A047;
 Fri,  6 Mar 2020 20:07:22 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1774A6A04D;
 Fri,  6 Mar 2020 20:07:22 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  6 Mar 2020 20:07:21 +0000 (GMT)
Subject: [PATCH V7 00/14] powerpc/vas: Page fault handling for user space
 NX requests
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 06 Mar 2020 12:07:19 -0800
Message-ID: <1583525239.9256.5.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_07:2020-03-06,
 2020-03-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxlogscore=873 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=3 clxscore=1015 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003060121
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
Cc: mikey@neuling.org, herbert@gondor.apana.org.au, npiggin@gmail.com,
 hch@infradead.org, oohall@gmail.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On power9, Virtual Accelerator Switchboard (VAS) allows user space or
kernel to communicate with Nest Accelerator (NX) directly using COPY/PASTE
instructions. NX provides various functionalities such as compression,
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
- Alloc IRQ and trigger port address, and configure IRQ per VAS instance.
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

Patches 1 & 2: Define alloc IRQ and get port address per chip which are needed
               to alloc IRQ per VAS instance.
Patch 3: Define nx_fault_stamp on which NX writes fault status for the fault
         CRB
Patch 4: Alloc and setup IRQ and trigger port address for each VAS instance
Patch 5: Setup fault window per each VAS instance. This window is used for
         NX to paste fault CRB in FIFO.
Patches 6 & 7: Setup threaded IRQ per VAS and register NX with fault window
         ID and port number for each send window so that NX paste fault CRB
         in this window.
Patch 8: Reference to pid and mm so that pid is not used until window closed.
         Needed for multi thread application where child can open a window
         and can be used by parent later.
Patches 9 and 10: Process CRBs from fault FIFO and notify tasks by
         updating CSB or through signals.
Patches 11 and 12: Return credits for send and fault windows after handling
        faults.
Patch 14:Fix closing send window after all credits are returned. This issue
         happens only for user space requests. No page faults on kernel
         request buffer.

Changelog:
V2:
  - Use threaded IRQ instead of own kernel thread handler
  - Use pswid instead of user space CSB address to find valid CRB
  - Removed unused macros and other changes as suggested by Christoph Hellwig

V3:
  - Rebased to 5.5-rc2
  - Use struct pid * instead of pid_t for vas_window tgid
  - Code cleanup as suggested by Christoph Hellwig

V4:
  - Define xive alloc and get IRQ info based on chip ID and use these
    functions for IRQ setup per VAS instance. It eliminates skiboot
    dependency as suggested by Oliver.

V5:
  - Do not update CSB if the process is exiting (patch9)

V6:
  - Add interrupt handler instead of default one and return IRQ_HANDLED
    if the fault handling thread is already in progress. (Patch6)
  - Use platform send window ID and CCW[0] bit to find valid CRB in
    fault FIFO (Patch6).
  - Return fault address to user space in BE and other changes as
    suggested by Michael Neuling. (patch9)
  - Rebased to 5.6-rc4

V7:
  - Fix sparse warnings (patches 6,9 and 10) 

Haren Myneni (14):
  powerpc/xive: Define xive_native_alloc_irq_on_chip()
  powerpc/xive: Define xive_native_alloc_get_irq_info()
  powerpc/vas: Define nx_fault_stamp in coprocessor_request_block
  powerpc/vas: Alloc and setup IRQ and trigger port address
  powerpc/vas: Setup fault window per VAS instance
  powerpc/vas: Setup thread IRQ handler per VAS instance
  powerpc/vas: Register NX with fault window ID and IRQ port value
  powerpc/vas: Take reference to PID and mm for user space windows
  powerpc/vas: Update CSB and notify process for fault CRBs
  powerpc/vas: Print CRB and FIFO values
  powerpc/vas: Do not use default credits for receive window
  powerpc/vas: Return credits after handling fault
  powerpc/vas: Display process stuck message
  powerpc/vas: Free send window in VAS instance after credits returned

 arch/powerpc/include/asm/icswx.h            |  18 +-
 arch/powerpc/include/asm/xive.h             |  11 +-
 arch/powerpc/platforms/powernv/Makefile     |   2 +-
 arch/powerpc/platforms/powernv/ocxl.c       |  20 +-
 arch/powerpc/platforms/powernv/vas-debug.c  |   2 +-
 arch/powerpc/platforms/powernv/vas-fault.c  | 331 ++++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/vas-window.c | 185 ++++++++++++++--
 arch/powerpc/platforms/powernv/vas.c        | 101 ++++++++-
 arch/powerpc/platforms/powernv/vas.h        |  51 ++++-
 arch/powerpc/sysdev/xive/native.c           |  29 ++-
 10 files changed, 703 insertions(+), 47 deletions(-)
 create mode 100644 arch/powerpc/platforms/powernv/vas-fault.c

-- 
1.8.3.1



