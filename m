Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F583116562
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 04:24:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WT7w2ltDzDqLd
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 14:24:28 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WT3p42FTzDqJQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2019 14:20:48 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB93COJ3026553; Sun, 8 Dec 2019 22:20:25 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wrte588jg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Dec 2019 22:20:25 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xB93CwxW027647;
 Sun, 8 Dec 2019 22:20:24 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wrte588ja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Dec 2019 22:20:24 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB93GLVZ009672;
 Mon, 9 Dec 2019 03:20:23 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 2wr3q631jw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Dec 2019 03:20:23 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB93KMKF66584954
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Dec 2019 03:20:22 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29BE46A051;
 Mon,  9 Dec 2019 03:20:22 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 900B36A04D;
 Mon,  9 Dec 2019 03:20:21 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  9 Dec 2019 03:20:21 +0000 (GMT)
Subject: [PATCH V2 00/13] powerpc/vas: Page fault handling for user space
 NX requests
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, hch@infradead.org, mikey@neuling.org,
 npiggin@gmail.com, herbert@gondor.apana.org.au,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 08 Dec 2019 19:18:42 -0800
Message-ID: <1575861522.16318.9.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-08_07:2019-12-05,2019-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2 mlxscore=0
 malwarescore=0 clxscore=1011 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912090028
X-Mailman-Approved-At: Mon, 09 Dec 2019 14:23:07 +1100
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


Applications will send compression / decompression requests to NX with
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
 arch/powerpc/platforms/powernv/vas-fault.c         | 337 +++++++++++++++++++++
 arch/powerpc/platforms/powernv/vas-window.c        | 173 ++++++++++-
 arch/powerpc/platforms/powernv/vas.c               |  77 ++++-
 arch/powerpc/platforms/powernv/vas.h               |  38 ++-
 8 files changed, 627 insertions(+), 25 deletions(-)
 create mode 100644 arch/powerpc/platforms/powernv/vas-fault.c

-- 
1.8.3.1



