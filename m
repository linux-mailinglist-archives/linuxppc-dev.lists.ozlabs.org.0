Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B68B1DD6CD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 07:52:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46wBrk3YX0zDqRf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Oct 2019 16:52:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46wBq06pmWzDqNC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2019 16:51:24 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9J5HluX129866; Sat, 19 Oct 2019 01:51:17 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vqm5v43rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Oct 2019 01:51:16 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9J5JP9t030374;
 Sat, 19 Oct 2019 05:51:15 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma05wdc.us.ibm.com with ESMTP id 2vqt46gwv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Oct 2019 05:51:15 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9J5pFsr25362910
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Oct 2019 05:51:15 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE239124053;
 Sat, 19 Oct 2019 05:51:14 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FEE3124052;
 Sat, 19 Oct 2019 05:51:14 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 19 Oct 2019 05:51:14 +0000 (GMT)
Subject: [RFC PATCH 00/13] powerpc/vas: Page fault handling for user space
 NX requests
From: Haren Myneni <haren@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 18 Oct 2019 22:50:59 -0700
Message-ID: <1571464259.24387.25.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-19_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=975 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910190051
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


Applications can send compression / decompression requests to NX with
COPY/PASTE instructions. When NX is processing these requests, can hit
fault on the request buffer (not in memory). It issues an interrupt and
pastes fault CRB in fault FIFO. Expects kernel to handle this fault and
return credits for both send and fault windows after processing.

This patch series adds IRQ and fault window setup, and NX fault handling:
- Read IRQ# from "interrupts" property and configure IRQ per VAS instance.
- Set port# for each window to generate an interrupt when noticed fault.
- Set fault window and FIFO on which NX pastes fault CRB.
- Setup fault handler (as kernel thread) per VAS instance.
- When receiving an interrupt, Read CRBs from fault FIFO and update
  coprocessor_status_block (CSB) in the corresponding CRB with translation
  failure (CSB_CC_TRANSLATION). After issuing NX requests, process polls
  on CSB address. When it sees translation error, can touch the request
  buffer to bring the page in to memory and reissue NX request.
- When NX sees fault on CSB address, OS sends signal to process which
  can reissue the request after processing it.
 
Tested these patches with NX-GZIP support and will be posting this series
soon.

Patch1: Revert 452d23c0f6bd97f2 - Using vas_win_id() and vas_win_paste_addr()
Patch2: Define nx_fault_stamp on which NX writes fault status for the fault
        CRB
Patch3: IRQ and port setup
Patches 4 and 5: Setup fault window and fault handler per each VAS instance.
	fault window is used for NX to paste fault CRB in FIFO. A kernel
	thread is created to handle faults on each VAS.
Patches 6,7,8 and 9: Read and process CRBs from fault FIFO and notify tasks
	by updating CSB or through signals.
Patches 10 and 11: Return credits for send and fault windows after handling
	faults.
Patch13: Fix closing send window after all credits are returned. This issue
	happens only for user space requests. No page faults on kernel
	request buffer.


Haren Myneni (13):
  Revert "powerpc/powernv: remove the unused vas_win_paste_addr and
    vas_win_id functions"
  powerpc/vas: Define nx_fault_stamp in coprocessor_request_block
  powerpc/vas: Setup IRQ mapping and register port for each window
  powerpc/vas: Setup fault window per VAS instance
  powerpc/vas: Setup fault handler per VAS instance
  powerpc/vas: Read and process fault CRBs
  powerpc/vas: Update CSB and notify process for fault CRBs
  powerpc/vas: Print CRB and FIFO values
  powerpc/vas: Add and use tgid in vas_window to close the window
  powerpc/vas: Do not use default credits for receive window
  powerpc/vas: Return credits after handling fault
  powerpc/vas: Display process stuck message
  powerpc/vas: Free send window after credits returned

 .../devicetree/bindings/powerpc/ibm,vas.txt        |   5 +
 arch/powerpc/include/asm/icswx.h                   |  32 +-
 arch/powerpc/include/asm/vas.h                     |  10 +
 arch/powerpc/platforms/powernv/Makefile            |   2 +-
 arch/powerpc/platforms/powernv/vas-fault.c         | 420 +++++++++++++++++++++
 arch/powerpc/platforms/powernv/vas-window.c        | 149 +++++++-
 arch/powerpc/platforms/powernv/vas.c               |  84 ++++-
 arch/powerpc/platforms/powernv/vas.h               |  51 ++-
 8 files changed, 736 insertions(+), 17 deletions(-)
 create mode 100644 arch/powerpc/platforms/powernv/vas-fault.c

-- 
1.8.3.1



