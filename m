Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E0819398A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 08:23:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nxKs4pszzDqYj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 18:23:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nx3F00HmzDqQc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 18:10:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48nx3D0T2sz9BFp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 18:10:48 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48nx3C40NKz9sT3; Thu, 26 Mar 2020 18:10:47 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48nx3B65rhz9sSm
 for <linuxppc-dev@ozlabs.org>; Thu, 26 Mar 2020 18:10:46 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02Q73kwm169504
 for <linuxppc-dev@ozlabs.org>; Thu, 26 Mar 2020 03:10:44 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywdr86t27-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 26 Mar 2020 03:10:42 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <psampat@linux.ibm.com>;
 Thu, 26 Mar 2020 07:10:38 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 26 Mar 2020 07:10:35 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02Q7Ab2I60031076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Mar 2020 07:10:37 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DDF84C04E;
 Thu, 26 Mar 2020 07:10:37 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1346E4C04A;
 Thu, 26 Mar 2020 07:10:35 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.199.35.246])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Mar 2020 07:10:34 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, mpe@ellerman.id.au, 
 skiboot@lists.ozlabs.org, oohall@gmail.com, ego@linux.vnet.ibm.com,
 linuxram@us.ibm.com, psampat@linux.ibm.com, pratik.r.sampat@gmail.com
Subject: [PATCH v6 0/3] powerpc/powernv: Introduce interface for self-restore
 support
Date: Thu, 26 Mar 2020 12:40:31 +0530
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20032607-0012-0000-0000-000003984FA7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032607-0013-0000-0000-000021D54A23
Message-Id: <20200326071034.12838-1-psampat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-25_15:2020-03-24,
 2020-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003260043
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

v5: https://lkml.org/lkml/2020/3/17/944
Changelog
v5-->v6
1. Updated background, motivation and illuminated potential design
choices
2. Re-organization of patch-set
  a. Split introducing preference for optimization from 1/1 to patch 3/3
  b. Merge introducing self-save API and parsing the device-tree
  c. Introduce a supported mode called KERNEL_SAVE_RESTORE which
     outlines and makes kernel supported SPRs for save-restore more
     explicit

Background
==========

The power management framework on POWER systems include core idle
states that lose context. Deep idle states namely "winkle" on POWER8
and "stop4" and "stop5" on POWER9 can be entered by a CPU to save
different levels of power, as a consequence of which all the
hypervisor resources such as SPRs and SCOMs are lost.

For most SPRs, saving and restoration of content for SPRs and SCOMs
is handled by the hypervisor kernel prior to entering an post exit
from an idle state respectively. However, there is a small set of
critical SPRs and XSCOMs that are expected to contain sane values even
before the control is transferred to the hypervisor kernel at system
reset vector.

For this purpose, microcode firmware provides a mechanism to restore
values on certain SPRs. The communication mechanism between the
hypervisor kernel and the microcode is a standard interface called
sleep-winkle-engine (SLW) on Power8 and Stop-API on Power9 which is
abstracted by OPAL calls from the hypervisor kernel. The Stop-API
provides an interface known as the self-restore API, to which the SPR
number and a predefined value to be restored on wake-up from a deep
stop state is supplied.


Motivation to introduce a new Stop-API
======================================

The self-restore API expects not just the SPR number but also the
value with which the SPR is restored. This is good for those SPRs such
as HSPRG0 whose values do not change at runtime, since for them, the
kernel can invoke the self-restore API at boot time once the values of
these SPRs are determined.

However, there are use-cases where-in the value to be saved cannot be
known or cannot be updated in the layer it currently is.
The shortcomings and the new use-cases which cannot be served by the
existing self-restore API, serves as motivation for a new API:

Shortcoming1:
------------
In a special wakeup scenario, SPRs such as PSSCR, whose values can
change at runtime, are compelled to make the self-restore API call
every time before entering a deep-idle state rendering it to be
prohibitively expensive

Shortcoming2:
------------
The value of LPCR is dynamic based on if the CPU is entered a stop
state during cpu idle versus cpu hotplug.
Today, an additional self-restore call is made before entering
CPU-Hotplug to clear the PECE1 bit in stop-API so that if we are
woken up by a special wakeup on an offlined CPU, we go back to stop
with the the bit cleared.
There is a overhead of an extra call

New Use-case:
-------------
In the case where the hypervisor is running on an
ultravisor environment, the boot time is too late in the cycle to make
the self-restore API calls, as these cannot be invoked from an
non-secure context anymore

To address these shortcomings, the firmware provides another API known
as the self-save API. The self-save API only takes the SPR number as a
parameter and will ensure that on wakeup from a deep-stop state the
SPR is restored with the value that it contained prior to entering the
deep-stop.

Contrast between self-save and self-restore APIs
================================================

		  Before entering
                  deep idle     |---------------|
                  ------------> | HCODE A       |
                  |             |---------------|
   |---------|    |
   |   CPU   |----|
   |---------|    |
                  |             |---------------|
                  |------------>| HCODE B       |
                  On waking up  |---------------|
                from deep idle




When a self-restore API is invoked, the HCODE inserts instructions
into "HCODE B" region of the above figure to restore the content of
the SPR to the said value. The "HCODE B" region gets executed soon
after the CPU wakes up from a deep idle state, thus executing the
inserted instructions, thereby restoring the contents of the SPRs to
the required values.

When a self-save API is invoked, the HCODE inserts instructions into
the "HCODE A" region of the above figure to save the content of the
SPR into some location in memory. It also inserts instructions into
the "HCODE B" region to restore the content of the SPR to the
corresponding value saved in the memory by the instructions in "HCODE
A" region.

Thus, in contrast with self-restore, the self-save API *does not* need
a value to be passed to it, since it ensures that the value of SPR
before entering deep stop is saved, and subsequently the same value is
restored.

Self-save and self-restore are complementary features since,
self-restore can help in restoring a different value in the SPR on
wakeup from a deep-idle state than what it had before entering the
deep idle state. This was used in POWER8 for HSPRG0 to distinguish a
wakeup from Winkle vs Fastsleep.

Limitations of self-save
========================
Ideally all SPRs should be available for self-save, but HID0 is very
tricky to implement in microcode due to various endianess quirks.
Couple of implementation schemes were buggy and hence HID0 was left
out to be self-restore only.

The fallout of this limitation is as follows:

* In Non PEF environment, no issue. Linux will use self-restore for
  HID0 as it does today and no functional impact.

* In PEF environment, the HID0 restore value is decided by OPAL during
  boot and it is setup for LE hypervisor with radix MMU. This is the
  default and current working configuration of a PEF environment.
  However if there is a change, then HV Linux will try to change the
  HID0 value to something different than what OPAL decided, at which
  time deep-stop states will be disabled under this new PEF
  environment.

A simple and workable design is achieved by scoping the power
management deep-stop state support only to a known default PEF
environment. Any deviation will affect *only* deep stop-state support
(stop4,5) in that environment and not have any functional impediment
to the environment itself.

In future, if there is a need to support changing of HID0 to various
values under PEF environment and support deep-stop states, it can be
worked out via an ultravisor call or improve the microcode design to
include HID0 in self-save.  These future scheme would be an extension
and does not break or make the current implementation scheme
redundant.

Design Choices
==============

Presenting the design choices in front of us:

Design-Choice 1:
----------------
A simple implementation is to just replace self-restore calls with
self-save as it is direct super-set.

Pros:
A simple design, quick to implement


Cons:
* Breaks backward compatibility. Self-restore has historically been
  supported in the firmware and an old firmware running on an new
  kernel will be incompatible and deep stop states will be cut.
* Furthermore, critical SPRs which need to be restored
  before 0x100 vector like HID0 are not supported by self-save.

Design-Choice 2:
----------------
Advertise both self-restore and self-save from OPAL including the set
of registers that each support. The kernel can then choose which API
to go with.
For the sake of simplicity, in case both modes are supported for an
SPR by default self-save would be called for it.

Pros:
* Backwards compatible

Cons:
Overhead in parsing device tree with the SPR list

Possible optimization with Approach2:
-------------------------------------
There are SPRs whose values don't tend to change over time and invoking
self-save on them, where the values are gotten each time may turn out to
be inefficient. In that case calling a self-restore where passing the
value makes more sense as, if the value is same, the memory location
is not updated.
SPRs that dont change are as follows:
SPRN_HSPRG0,
SPRN_LPCR,
SPRN_PTCR,
SPRN_HMEER,
SPRN_HID0,

The values of PSSCR and MSR change at runtime and hence, the kernel
cannot determine during boot time what their values will be before
entering a particular deep-stop state.

Therefore, a preference based interface is introduced for choosing
between self-save or self-restore between for each SPR.
The per-SPR preference is only a refinement of
approach 2 purely for performance reasons. It can be dropped if the
complexity is not deemed worth the returns.

Patches Organization
====================
Design Choice 2 has been chosen as an implementation to demonstrate in
the patch series.

Patch1:
Devises an interface which lists all the interested SPRs, along with
highlighting the support of mode.
It is an isomorphic patch to replicate the functionality of the older
self-restore firmware for the new interface

Patch2:
Introduces the self-save API and leverages upon the struct interface to
add another supported mode in the mix of saving and restoring. It also
enforces that in case both modes are supported self-save is chosen over
self-restore

The commit also parses the device-tree and populate support for
self-save and self-restore in the supported mask

Patch3:
Introduce an optimization to allow preference to choose between one more
over the one when both both modes are supported. This optimization can
allow for better performance for the SPRs that don't change in value and
hence self-restore is a better alternative, and in cases when it is
known for values to change self-save is more convenient.

Pratik Rajesh Sampat (3):
  powerpc/powernv: Introduce interface for self-restore support
  powerpc/powernv: Introduce support and parsing for self-save API
  powerpc/powernv: Preference optimization for SPRs with constant values

 .../bindings/powerpc/opal/power-mgt.txt       |  18 +
 arch/powerpc/include/asm/opal-api.h           |   3 +-
 arch/powerpc/include/asm/opal.h               |   1 +
 arch/powerpc/platforms/powernv/idle.c         | 385 +++++++++++++++---
 arch/powerpc/platforms/powernv/opal-call.c    |   1 +
 5 files changed, 351 insertions(+), 57 deletions(-)

-- 
2.17.1

