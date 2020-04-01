Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BCB19B781
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 23:22:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48szgS5lkSzDqvx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 08:22:44 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48szdB38bDzDqSD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 08:20:46 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031L2oKF001031; Wed, 1 Apr 2020 17:20:29 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3022r0rau8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 17:20:29 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 031L3UWm004108;
 Wed, 1 Apr 2020 17:20:28 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3022r0rata-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 17:20:28 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 031LDK0T007137;
 Wed, 1 Apr 2020 21:20:26 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 301x77mwa9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 21:20:26 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 031LKPDt41615756
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 21:20:25 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86484B2065;
 Wed,  1 Apr 2020 21:20:25 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62E2EB206B;
 Wed,  1 Apr 2020 21:20:24 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 21:20:24 +0000 (GMT)
Subject: [PATCH v9 00/13] powerpc/vas: Page fault handling for user space
 NX requests
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Apr 2020 14:19:38 -0700
Message-ID: <1585775978.10664.438.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_04:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=799 impostorscore=0
 suspectscore=2 adultscore=0 clxscore=1011 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010174
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
Cc: mikey@neuling.org, herbert@gondor.apana.org.au, frederic.barrat@fr.ibm.com,
 srikar@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, hch@infradead.org,
 oohall@gmail.com, clg@kaod.org, sukadev@linux.vnet.ibm.com,
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

Tested these patches with NX-GZIP enable patches and posted them as separate
patch series.

Patch 1: Define alloc IRQ per chip which is needed to alloc IRQ per VAS
	   instance.
Patch 2: Define nx_fault_stamp on which NX writes fault status for the fault
         CRB
Patch 3: Alloc and setup IRQ and trigger port address for each VAS instance
Patches 4 & 5: Setup fault window and register NX per each VAS instance. This
	 window is used for NX to paste fault CRB in FIFO.
Patch 6: Reference to pid and mm so that pid is not used until window closed.
	 Needed for multi thread application where child can open a window
	 and can be used by parent it later.
Patch 7: Setup threaded IRQ handler per VAS
Patch 8: Process CRBs from fault FIFO and notify tasks by updating CSB or
	 through signals.
Patches 9 & 11: Return credits for send and fault windows after handling
        faults.
Patches 10 & 13: Dump FIFO / CRB data and messages for error conditions
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
  - Do not update CSB if the process is exiting (patch8)

V6:
  - Add interrupt handler instead of default one and return IRQ_HANDLED
    if the fault handling thread is already in progress. (Patch7)
  - Use platform send window ID and CCW[0] bit to find valid CRB in
    fault FIFO (Patch7).
  - Return fault address to user space in BE and other changes as
    suggested by Michael Neuling. (patch8)
  - Rebased to 5.6-rc4

V7:
  - Fixed sparse warnings (patches 4, 9 and 10)

V8:
  - Moved mm_context_remove_copro() before mmdrop() (patch6)
  - Moved barrier before csb.flags store and add WARN_ON_ONCE() checks (patch8)

V9:
  - Rebased to 5.6
  - Changes based on Cedric's comments
	- Removed "Define xive_native_alloc_get_irq_info()" patch and used
	  irq_get_handler_data() (patch3)
  - Changes based on comments from Nicholas Piggin
	- Moved "Taking PID reference" patch before setting VAS fault handler
	  patch
	- Removed mutex_lock/unlock (patch7)
	- Other cleanup changes


Haren Myneni (13):
  powerpc/xive: Define xive_native_alloc_irq_on_chip()
  powerpc/vas: Define nx_fault_stamp in coprocessor_request_block
  powerpc/vas: Alloc and setup IRQ and trigger port address
  powerpc/vas: Setup fault window per VAS instance
  powerpc/vas: Register NX with fault window ID and IRQ port value
  powerpc/vas: Take reference to PID and mm for user space windows
  powerpc/vas: Setup thread IRQ handler per VAS instance
  powerpc/vas: Update CSB and notify process for fault CRBs
  powerpc/vas: Return credits after handling fault
  powerpc/vas: Print CRB and FIFO values
  powerpc/vas: Do not use default credits for receive window
  powerpc/vas: Display process stuck message
  powerpc/vas: Free send window in VAS instance after credits returned

 arch/powerpc/include/asm/icswx.h            |  20 +-
 arch/powerpc/include/asm/xive.h             |   9 +-
 arch/powerpc/platforms/powernv/Makefile     |   2 +-
 arch/powerpc/platforms/powernv/vas-debug.c  |   2 +-
 arch/powerpc/platforms/powernv/vas-fault.c  | 382 ++++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/vas-window.c | 204 ++++++++++++++-
 arch/powerpc/platforms/powernv/vas.c        |  85 ++++++-
 arch/powerpc/platforms/powernv/vas.h        |  57 ++++-
 arch/powerpc/sysdev/xive/native.c           |   6 +-
 9 files changed, 737 insertions(+), 30 deletions(-)
 create mode 100644 arch/powerpc/platforms/powernv/vas-fault.c

-- 
1.8.3.1



