Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C170619EBD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 18:30:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3nh80xFKz3dsK
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Nov 2022 04:30:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pJ0USxOo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pJ0USxOo;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3nf84jwqz30JR
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Nov 2022 04:28:32 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4H1C06003854;
	Fri, 4 Nov 2022 17:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=+cgZ5aRHXs8ZYwDYviWjMej/pLSxtUZVnIdL4GreqrQ=;
 b=pJ0USxOofbiakFc5HmAD4Qh65eXnBc67zMkwhD96j0COmvZ6e9ir5o22m5t95pHcgQPp
 RBScDkSsgTPQtuTWQnMogInUK1nj+yQaf081rsWBXsyuISE/sGYIWw9WEHAtWfWR1L2e
 6G/OpX9GDq3FuKisdgCiA95Qtt8KYoPx8LDD7Z45kMNy4jDCfFYCf8U0X8k9qLSK/LEm
 /oPgYgrq62F+yyqelJ0+X/DkTohtrHDwvt06gvWgx0Pzjn1PDE3bpg+lsJhxJr938dqY
 ffkDLrLMu2kwESpXcHAAARoJU9osxMmQem5n3GDsAAN2oPdz5/2kQaDekg6iSM686Bgk bg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmyqw6xnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 17:28:14 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A4HLYUA013386;
	Fri, 4 Nov 2022 17:28:12 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma05fra.de.ibm.com with ESMTP id 3kjepeds82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 17:28:12 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A4HS9U361342068
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Nov 2022 17:28:09 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B1EE011C04C;
	Fri,  4 Nov 2022 17:28:09 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1270611C04A;
	Fri,  4 Nov 2022 17:28:09 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri,  4 Nov 2022 17:28:09 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ibmuc.com (unknown [9.43.196.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9148060126;
	Sat,  5 Nov 2022 04:28:05 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 0/6] VMAP_STACK support for book3s64
Date: Sat,  5 Nov 2022 04:27:31 +1100
Message-Id: <20221104172737.391978-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8xya95ZM08HjOMrCYO5451kTLxgVvEEb
X-Proofpoint-GUID: 8xya95ZM08HjOMrCYO5451kTLxgVvEEb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_11,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1011 spamscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040108
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
Cc: linux-hardening@vger.kernel.org, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series begins implementing VMAP_STACK support for book3s64 platforms,
building on the existing 32-bit work that Christophe Leroy has done.

Right now, it doesn't boot on my POWER9 machine - I'm sending this as is because
I'm about to go on holidays for a couple of weeks, and I'll pick it up once I'm
back.

The primary issue is the amount of arch code that has to run in real mode for
some reason or another - this includes OPAL, the cpu idle driver, KVM, and a
few other bits and pieces.

Right now, VMAP_STACK is only enabled if KVM_BOOK3S_64_HV=n - I'm working on
patches for KVM support but they're not quite ready yet.

If anyone has better suggestions for the extremely ugly approach to fixing
OPAL calls, suggest away!

Andrew Donnellan (6):
  powerpc/64s: Fix assembly to support larger values of THREAD_SIZE
  powerpc/64s: Helpers to switch between linear and vmapped stack
    pointers
  powerpc/powernv: Keep MSR in register across OPAL entry/return path
  powerpc/powernv: Convert pointers to physical addresses in OPAL call
    args
  powerpc/powernv/idle: Convert stack pointer to physical address
  powerpc/64s: Enable CONFIG_VMAP_STACK

 arch/powerpc/include/asm/asm-compat.h         |  2 +
 arch/powerpc/include/asm/book3s/64/stack.h    | 71 +++++++++++++++++++
 arch/powerpc/include/asm/opal.h               |  1 +
 arch/powerpc/include/asm/paca.h               |  4 ++
 arch/powerpc/include/asm/processor.h          |  6 ++
 arch/powerpc/kernel/asm-offsets.c             |  8 +++
 arch/powerpc/kernel/entry_64.S                | 11 ++-
 arch/powerpc/kernel/irq.c                     |  8 ++-
 arch/powerpc/kernel/misc_64.S                 |  4 +-
 arch/powerpc/kernel/process.c                 |  8 +++
 arch/powerpc/kernel/smp.c                     |  7 ++
 arch/powerpc/kvm/book3s_hv_builtin.c          |  2 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S       |  3 +-
 arch/powerpc/mm/book3s64/slb.c                | 11 ++-
 arch/powerpc/platforms/Kconfig.cputype        |  1 +
 arch/powerpc/platforms/powernv/eeh-powernv.c  | 20 +++---
 arch/powerpc/platforms/powernv/idle.c         | 47 +++++++++++-
 arch/powerpc/platforms/powernv/ocxl.c         |  3 +-
 arch/powerpc/platforms/powernv/opal-core.c    |  4 +-
 arch/powerpc/platforms/powernv/opal-dump.c    |  6 +-
 arch/powerpc/platforms/powernv/opal-elog.c    | 10 +--
 arch/powerpc/platforms/powernv/opal-fadump.c  | 12 ++--
 arch/powerpc/platforms/powernv/opal-flash.c   |  5 +-
 arch/powerpc/platforms/powernv/opal-hmi.c     |  3 +-
 arch/powerpc/platforms/powernv/opal-irqchip.c |  4 +-
 arch/powerpc/platforms/powernv/opal-lpc.c     |  8 +--
 arch/powerpc/platforms/powernv/opal-nvram.c   |  4 +-
 arch/powerpc/platforms/powernv/opal-power.c   |  4 +-
 .../powerpc/platforms/powernv/opal-powercap.c |  2 +-
 arch/powerpc/platforms/powernv/opal-prd.c     |  6 +-
 arch/powerpc/platforms/powernv/opal-psr.c     |  2 +-
 arch/powerpc/platforms/powernv/opal-rtc.c     |  2 +-
 arch/powerpc/platforms/powernv/opal-secvar.c  |  9 ++-
 arch/powerpc/platforms/powernv/opal-sensor.c  |  4 +-
 .../powerpc/platforms/powernv/opal-sysparam.c |  4 +-
 .../powerpc/platforms/powernv/opal-wrappers.S | 43 ++++++-----
 arch/powerpc/platforms/powernv/opal-xscom.c   |  2 +-
 arch/powerpc/platforms/powernv/opal.c         | 16 ++---
 arch/powerpc/platforms/powernv/pci-ioda.c     | 14 ++--
 arch/powerpc/platforms/powernv/pci.c          | 25 ++++---
 arch/powerpc/platforms/powernv/setup.c        |  2 +-
 arch/powerpc/platforms/powernv/smp.c          |  2 +-
 arch/powerpc/sysdev/xics/icp-opal.c           |  2 +-
 arch/powerpc/sysdev/xics/ics-opal.c           |  8 +--
 arch/powerpc/sysdev/xive/native.c             | 33 +++++----
 arch/powerpc/xmon/xmon.c                      |  4 ++
 drivers/char/ipmi/ipmi_powernv.c              |  6 +-
 drivers/char/powernv-op-panel.c               |  2 +-
 drivers/i2c/busses/i2c-opal.c                 |  2 +-
 drivers/leds/leds-powernv.c                   |  6 +-
 drivers/mtd/devices/powernv_flash.c           |  4 +-
 drivers/rtc/rtc-opal.c                        |  4 +-
 52 files changed, 347 insertions(+), 134 deletions(-)
 create mode 100644 arch/powerpc/include/asm/book3s/64/stack.h

-- 
2.38.1

