Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 643791B59C4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 12:58:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497Dn33lQWzDqKH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 20:58:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497Dhr6xqKzDqt3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 20:54:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 497Dhr6Ntjz8t44
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 20:54:52 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 497Dhr5pBXz9sSt; Thu, 23 Apr 2020 20:54:52 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 497Dhr1X2lz9sSd
 for <linuxppc-dev@ozlabs.org>; Thu, 23 Apr 2020 20:54:51 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03NAXHSx048977
 for <linuxppc-dev@ozlabs.org>; Thu, 23 Apr 2020 06:54:49 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30jsput4dr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 23 Apr 2020 06:54:48 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <psampat@linux.ibm.com>;
 Thu, 23 Apr 2020 11:54:10 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 23 Apr 2020 11:54:06 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 03NAsgs665667426
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Apr 2020 10:54:42 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CD094204B;
 Thu, 23 Apr 2020 10:54:42 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E466A42041;
 Thu, 23 Apr 2020 10:54:39 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.79.176.162])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 23 Apr 2020 10:54:39 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, mpe@ellerman.id.au, 
 skiboot@lists.ozlabs.org, oohall@gmail.com, ego@linux.vnet.ibm.com,
 linuxram@us.ibm.com, pratik.r.sampat@gmail.com, psampat@linux.ibm.com
Subject: [PATCH v8 0/3] Support for Self Save API in OPAL
Date: Thu, 23 Apr 2020 16:24:35 +0530
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20042310-0008-0000-0000-00000375F5D5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042310-0009-0000-0000-00004A97C294
Message-Id: <20200423105438.29034-1-psampat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-23_07:2020-04-22,
 2020-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=4 malwarescore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=4 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004230082
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

v7: https://lists.ozlabs.org/pipermail/skiboot/2020-April/016763.html
Changelog
v6 --> v7
1. Simplified approach. Instead of advertising support bitmask for
   each SPR, advertising support only for the presence of the new
   self-save API Complete design specification is detailed below
   in the cover-leter.
2. Patch re-organization, move introducing self-save [2] after STOP
   API versioning [3].

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
In a special wakeup scenario when a CPU is woken up in stop4/5 and
after the task is done, the HCODE puts it back to stop. The value of
PSSCR is passed to the HCODE via the self-restore API. The kernel
currently provides the value of the deepest stop state due to being
conservative. Thus if a core that was in stop4 was woken up due to
special wakeup, the HCODE will now put it back to stop5 thus increasing
the subsequent wakeup latency to ~200us.

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
Only expose one of self-save or self-restore for all the SPRs. Prefer
Self-save

Pros:
   - Simplifies the design heavily, since the Kernel can unambiguously
   make one API call for all the SPRs on discovering the presence of
   the API type.

Cons:
    - Breaks backward compatibility if OPAL always chooses to expose
      only the self-save API as the older kernels assume the existence
      of self-restore.

    - The set of SPRs supported by self-save and self-restore are not
      identical. Eg: HID0 is not supported by self-save API. PSSCR
      support via self-restore is not robust during special-wakeup.

    - As discussed above, self-save and self-restore are
      complementary. Thus OPAL apriory choosing one over the other for
      all SPRs takes away the flexibility from the kernel.


Design-Choice 2:
----------------
Expose two arrays of SPRs: One set of SPRs that are supported by
self-save. Another set of SPRs supported by self-restore. These two
sets do not intersect. Further, if an SPR is supported by both
self-save and self-restore APIs, expose it only via self-save.

Pros:
     - For an SPR the choice for the kernel is unambiguous.

Cons:
    - Breaks backward compatibility if OPAL always chooses to expose
      the legacy SPRs only via the self-save API as the older kernels
      assume the existence of self-restore.

    - By making the decision early on, we take away the flexibility
       from the kernel to use an API of its choice for an SPR.


Design-Choice 3
---------------
Expose two arrays of SPRs. One set of SPRs that are supported by
self-save API. Another set of SPRs supported by self-restore API. Let
the kernel choose which API to invoke. Even if it wants to always
prefer self-save over self-restore, let that be kernel's choice.

Pros:
     - Keeps the design flexible to allow the kernel to take a
       decision based on its functional and performance requirements.
       Thus, the kernel for instance can make a choice to invoke
       self-restore API (when available) for SPRs whose values do not
       evolve at runtime, and invoke the self-save API (when
       available)
       for SPRs whose values will change during runtime.

     - Design is backward compatible with older kernels.

Cons:
     - The Kernel code will have additional complexity for parsing two
     lists of SPRs and making a choice w.r.t invocation of a specific
     stop-api.

Design-Choice 4
===============
Expose only the availability of the self-save feature not the subsequent
SPR list. The kernel will have to make a hard choice of preference,
although can still have fallback available.
This makes the design although less flexible for the kernel however
keeps it simple while still adhering to correctness and backward
compatibility.

Patches Organization
====================
Design choice 4 has been chosen as an implementation to demonstrate in
this patch series.

Patch 1:
Commit adds support calling into the self save firmware API.
Also adds abstraction for making platform agnostic calls.

Patch 2:
Commit adds API to determine the version of the STOP API. This helps
to identify support for self save in the firmware

Patch 3:
commit adds wrappers for the self save api for which an opal call can
be made. The commit also advertises the self-save feature if the STOP
API versions are consistent with the firmware.


Pratik Rajesh Sampat (1):
  Self save API integration

Prem Shanker Jha (2):
  Self Save: Introducing Support for SPR Self Save
  API to verify the STOP API and image compatibility

 doc/opal-api/opal-slw-self-save-reg-181.rst |  51 ++
 doc/opal-api/opal-slw-set-reg-100.rst       |   5 +
 doc/power-management.rst                    |  48 +
 hw/slw.c                                    | 106 +++
 include/opal-api.h                          |   3 +-
 include/p9_stop_api.H                       | 122 ++-
 include/skiboot.h                           |   3 +
 libpore/p9_cpu_reg_restore_instruction.H    |  11 +-
 libpore/p9_hcd_memmap_base.H                |   7 +
 libpore/p9_stop_api.C                       | 964 +++++++++++---------
 libpore/p9_stop_api.H                       | 141 ++-
 libpore/p9_stop_data_struct.H               |   4 +-
 libpore/p9_stop_util.H                      |  27 +-
 13 files changed, 1060 insertions(+), 432 deletions(-)
 create mode 100644 doc/opal-api/opal-slw-self-save-reg-181.rst

-- 
2.25.1

