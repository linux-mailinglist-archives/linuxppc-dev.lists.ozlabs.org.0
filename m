Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7985721E91
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 08:54:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZPTx2dz6z3f10
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 16:54:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ek0xfu0m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=jpn@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ek0xfu0m;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZPNL6vL7z3c3w
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jun 2023 16:49:22 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3555LOix011208;
	Mon, 5 Jun 2023 06:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=vJLOSGfUWZ3BsVpEpv2FAexHNz6syiU7MRlwC5abgYk=;
 b=Ek0xfu0moD43Rf1qZ7rjPOnQsmCBhHFAygdVmWdqjUu2rUyLf4XIFQGN38YywfAuqwWC
 m+xoJWxbTO1FYUbtkwiAgO4W8aiTrVqnNL5dKqWL8YczC7xiqDQu9Zwbs6DhdCDqyz5j
 O+k+o5OmlzLscQvmE6sXxJ4EexkROye2xFPbYnyqzVctgmJUwXDdE2yXMec430vHYC8p
 7FtHEN0x3Lw33Ne3CtocMvWuGpVqYSufXW46mQQSmQZsLb8A0BkLvvO7hgclw1yD4yD6
 Bu5BvXFBIRnKJZ0hT0x+nngNG0mIAsz4wUzo7/IuQBNugNOk3C6xD7eyubuu/6Wuwa5C hw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r19g49nks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 06:49:19 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3556kqLu006509;
	Mon, 5 Jun 2023 06:49:19 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r19g49nk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 06:49:19 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3553v26N031609;
	Mon, 5 Jun 2023 06:49:17 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3qyxg2h6bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 06:49:16 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3556nEcE590574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Jun 2023 06:49:14 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5026420040;
	Mon,  5 Jun 2023 06:49:14 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CCE92004B;
	Mon,  5 Jun 2023 06:49:13 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 Jun 2023 06:49:13 +0000 (GMT)
Received: from pwon.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6DEF76063C;
	Mon,  5 Jun 2023 16:49:08 +1000 (AEST)
From: Jordan Niethe <jpn@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v2 6/6] docs: powerpc: Document nested KVM on POWER
Date: Mon,  5 Jun 2023 16:48:48 +1000
Message-Id: <20230605064848.12319-7-jpn@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230605064848.12319-1-jpn@linux.vnet.ibm.com>
References: <20230605064848.12319-1-jpn@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LWZ_vJByTwvij6VqHairpAd0aRpaw2BP
X-Proofpoint-ORIG-GUID: PI4bea99iR-lGrRadoxqVXm7eJPYwgrG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-03_08,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 adultscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=581 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2306050058
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
Cc: Jordan Niethe <jpn@linux.vnet.ibm.com>, mikey@neuling.org, kautuk.consul.1980@gmail.com, kvm@vger.kernel.org, npiggin@gmail.com, kvm-ppc@vger.kernel.org, sbhat@linux.ibm.com, vaibhav@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Neuling <mikey@neuling.org>

Document support for nested KVM on POWER using the existing API as well
as the new PAPR API. This includes the new HCALL interface and how it
used by KVM.

Signed-off-by: Michael Neuling <mikey@neuling.org>
Signed-off-by: Jordan Niethe <jpn@linux.vnet.ibm.com>
---
v2:
  - Separated into individual patch
---
 Documentation/powerpc/index.rst      |   1 +
 Documentation/powerpc/kvm-nested.rst | 636 +++++++++++++++++++++++++++
 2 files changed, 637 insertions(+)
 create mode 100644 Documentation/powerpc/kvm-nested.rst

diff --git a/Documentation/powerpc/index.rst b/Documentation/powerpc/index.rst
index 85e80e30160b..5a15dc6389ab 100644
--- a/Documentation/powerpc/index.rst
+++ b/Documentation/powerpc/index.rst
@@ -25,6 +25,7 @@ powerpc
     isa-versions
     kaslr-booke32
     mpc52xx
+    kvm-nested
     papr_hcalls
     pci_iov_resource_on_powernv
     pmu-ebb
diff --git a/Documentation/powerpc/kvm-nested.rst b/Documentation/powerpc/kvm-nested.rst
new file mode 100644
index 000000000000..c0c2e29a59d3
--- /dev/null
+++ b/Documentation/powerpc/kvm-nested.rst
@@ -0,0 +1,636 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====================================
+Nested KVM on POWER
+====================================
+
+Introduction
+============
+
+This document explains how a guest operating system can act as a
+hypervisor and run nested guests through the use of hypercalls, if the
+hypervisor has implemented them. The terms L0, L1, and L2 are used to
+refer to different software entities. L0 is the hypervisor mode entity
+that would normally be called the "host" or "hypervisor". L1 is a
+guest virtual machine that is directly run under L0 and is initiated
+and controlled by L0. L2 is a guest virtual machine that is initiated
+and controlled by L1 acting as a hypervisor.
+
+Existing API
+============
+
+Linux/KVM has had support for Nesting as an L0 or L1 since 2018
+
+The L0 code was added::
+
+   commit 8e3f5fc1045dc49fd175b978c5457f5f51e7a2ce
+   Author: Paul Mackerras <paulus@ozlabs.org>
+   Date:   Mon Oct 8 16:31:03 2018 +1100
+   KVM: PPC: Book3S HV: Framework and hcall stubs for nested virtualization
+
+The L1 code was added::
+
+   commit 360cae313702cdd0b90f82c261a8302fecef030a
+   Author: Paul Mackerras <paulus@ozlabs.org>
+   Date:   Mon Oct 8 16:31:04 2018 +1100
+   KVM: PPC: Book3S HV: Nested guest entry via hypercall
+
+This API works primarily using a single hcall h_enter_nested(). This
+call made by the L1 to tell the L0 to start an L2 vCPU with the given
+state. The L0 then starts this L2 and runs until an L2 exit condition
+is reached. Once the L2 exits, the state of the L2 is given back to
+the L1 by the L0. The full L2 vCPU state is always transferred from
+and to L1 when the L2 is run. The L0 doesn't keep any state on the L2
+vCPU (except in the short sequence in the L0 on L1 -> L2 entry and L2
+-> L1 exit).
+
+The only state kept by the L0 is the partition table. The L1 registers
+it's partition table using the h_set_partition_table() hcall. All
+other state held by the L0 about the L2s is cached state (such as
+shadow page tables).
+
+The L1 may run any L2 or vCPU without first informing the L0. It
+simply starts the vCPU using h_enter_nested(). The creation of L2s and
+vCPUs is done implicitly whenever h_enter_nested() is called.
+
+In this document, we call this existing API the v1 API.
+
+New PAPR API
+===============
+
+The new PAPR API changes from the v1 API such that the creating L2 and
+associated vCPUs is explicit. In this document, we call this the v2
+API.
+
+h_enter_nested() is replaced with H_GUEST_VCPU_RUN().  Before this can
+be called the L1 must explicitly create the L2 using h_guest_create()
+and any associated vCPUs() created with h_guest_create_vCPU(). Getting
+and setting vCPU state can also be performed using h_guest_{g|s}et
+hcall.
+
+The basic execution flow is for an L1 to create an L2, run it, and
+delete it is:
+
+- L1 and L0 negotiate capabilities with H_GUEST_{G,S}ET_CAPABILITIES()
+  (normally at L1 boot time).
+
+- L1 requests the L0 create an L2 with H_GUEST_CREATE() and receives a token
+
+- L1 requests the L0 create an L2 vCPU with H_GUEST_CREATE_VCPU()
+
+- L1 and L0 communicate the vCPU state using the H_GUEST_{G,S}ET() hcall
+
+- L1 requests the L0 runs the vCPU running H_GUEST_VCPU_RUN() hcall
+
+- L1 deletes L2 with H_GUEST_DELETE()
+
+More details of the individual hcalls follows:
+
+HCALL Details
+=============
+
+This documentation is provided to give an overall understating of the
+API. It doesn't aim to provide all the details required to implement
+an L1 or L0. Latest version of PAPR can be referred to for more details.
+
+All these HCALLs are made by the L1 to the L0.
+
+H_GUEST_GET_CAPABILITIES()
+--------------------------
+
+This is called to get the capabilities of the L0 nested
+hypervisor. This includes capabilities such the CPU versions (eg
+POWER9, POWER10) that are supported as L2s::
+
+  H_GUEST_GET_CAPABILITIES(uint64 flags)
+
+  Parameters:
+    Input:
+      flags: Reserved
+    Output:
+      R3: Return code
+      R4: Hypervisor Supported Capabilities bitmap 1
+
+H_GUEST_SET_CAPABILITIES()
+--------------------------
+
+This is called to inform the L0 of the capabilities of the L1
+hypervisor. The set of flags passed here are the same as
+H_GUEST_GET_CAPABILITIES()
+
+Typically, GET will be called first and then SET will be called with a
+subset of the flags returned from GET. This process allows the L0 and
+L1 to negotiate an agreed set of capabilities::
+
+  H_GUEST_SET_CAPABILITIES(uint64 flags,
+                           uint64 capabilitiesBitmap1)
+  Parameters:
+    Input:
+      flags: Reserved
+      capabilitiesBitmap1: Only capabilities advertised through
+                           H_GUEST_GET_CAPABILITIES
+    Output:
+      R3: Return code
+      R4: If R3 = H_P2: The number of invalid bitmaps
+      R5: If R3 = H_P2: The index of first invalid bitmap
+
+H_GUEST_CREATE()
+----------------
+
+This is called to create an L2. A unique ID of the L2 created
+(similar to an LPID) is returned, which can be used on subsequent HCALLs to
+identify the L2::
+
+  H_GUEST_CREATE(uint64 flags,
+                 uint64 continueToken);
+  Parameters:
+    Input:
+      flags: Reserved
+      continueToken: Initial call set to -1. Subsequent calls,
+                     after H_Busy or H_LongBusyOrder has been
+                     returned, value that was returned in R4.
+    Output:
+      R3: Return code. Notable:
+        H_Not_Enough_Resources: Unable to create Guest VCPU due to not
+        enough Hypervisor memory. See H_GUEST_CREATE_GET_STATE(flags =
+        takeOwnershipOfVcpuState)
+      R4: If R3 = H_Busy or_H_LongBusyOrder -> continueToken
+
+H_GUEST_CREATE_VCPU()
+---------------------
+
+This is called to create a vCPU associated with an L2. The L2 id
+(returned from H_GUEST_CREATE()) should be passed it. Also passed in
+is a unique (for this L2) vCPUid. This vCPUid is allocated by the
+L1::
+
+  H_GUEST_CREATE_VCPU(uint64 flags,
+                      uint64 guestId,
+                      uint64 vcpuId);
+  Parameters:
+    Input:
+      flags: Reserved
+      guestId: ID obtained from H_GUEST_CREATE
+      vcpuId: ID of the vCPU to be created. This must be within the
+              range of 0 to 2047
+    Output:
+      R3: Return code. Notable:
+        H_Not_Enough_Resources: Unable to create Guest VCPU due to not
+        enough Hypervisor memory. See H_GUEST_CREATE_GET_STATE(flags =
+        takeOwnershipOfVcpuState)
+
+H_GUEST_GET_STATE()
+-------------------
+
+This is called to get state associated with an L2 (Guest-wide or vCPU specific).
+This info is passed via the Guest State Buffer (GSB), a standard format as
+explained later in this doc, necessary details below:
+
+This can set either L2 wide or vcpu specific information. Examples of
+L2 wide is the timebase offset or process scoped page table
+info. Examples of vCPU specific are GPRs or VSRs. A bit in the flags
+parameter specifies if this call is L2 wide or vCPU specific and the
+IDs in the GSB must match this.
+
+The L1 provides a pointer to the GSB as a parameter to this call. Also
+provided is the L2 and vCPU IDs associated with the state to set.
+
+The L1 writes only the IDs and sizes in the GSB.  L0 writes the
+associated values for each ID in the GSB::
+
+  H_GUEST_GET_STATE(uint64 flags,
+                           uint64 guestId,
+                           uint64 vcpuId,
+                           uint64 dataBuffer,
+                           uint64 dataBufferSizeInBytes);
+  Parameters:
+    Input:
+      flags:
+         Bit 0: getGuestWideState: Request state of the Guest instead
+           of an individual VCPU.
+         Bit 1: takeOwnershipOfVcpuState Indicate the L1 is taking
+           over ownership of the VCPU state and that the L0 can free
+           the storage holding the state. The VCPU state will need to
+           be returned to the Hypervisor via H_GUEST_SET_STATE prior
+           to H_GUEST_RUN_VCPU being called for this VCPU. The data
+           returned in the dataBuffer is in a Hypervisor internal
+           format.
+         Bits 2-63: Reserved
+      guestId: ID obtained from H_GUEST_CREATE
+      vcpuId: ID of the vCPU pass to H_GUEST_CREATE_VCPU
+      dataBuffer: A L1 real address of the GSB.
+        If takeOwnershipOfVcpuState, size must be at least the size
+        returned by ID=0x0001
+      dataBufferSizeInBytes: Size of dataBuffer
+    Output:
+      R3: Return code
+      R4: If R3 = H_Invalid_Element_Id: The array index of the bad
+            element ID.
+          If R3 = H_Invalid_Element_Size: The array index of the bad
+             element size.
+          If R3 = H_Invalid_Element_Value: The array index of the bad
+             element value.
+
+H_GUEST_SET_STATE()
+-------------------
+
+This is called to set L2 wide or vCPU specific L2 state. This info is
+passed via the Guest State Buffer (GSB), necessary details below:
+
+This can set either L2 wide or vcpu specific information. Examples of
+L2 wide is the timebase offset or process scoped page table
+info. Examples of vCPU specific are GPRs or VSRs. A bit in the flags
+parameter specifies if this call is L2 wide or vCPU specific and the
+IDs in the GSB must match this.
+
+The L1 provides a pointer to the GSB as a parameter to this call. Also
+provided is the L2 and vCPU IDs associated with the state to set.
+
+The L1 writes all values in the GSB and the L0 only reads the GSB for
+this call::
+
+  H_GUEST_SET_STATE(uint64 flags,
+                    uint64 guestId,
+                    uint64 vcpuId,
+                    uint64 dataBuffer,
+                    uint64 dataBufferSizeInBytes);
+  Parameters:
+    Input:
+      flags:
+         Bit 0: getGuestWideState: Request state of the Guest instead
+           of an individual VCPU.
+         Bit 1: returnOwnershipOfVcpuState Return Guest VCPU state. See
+           GET_STATE takeOwnershipOfVcpuState
+         Bits 2-63: Reserved
+      guestId: ID obtained from H_GUEST_CREATE
+      vcpuId: ID of the vCPU pass to H_GUEST_CREATE_VCPU
+      dataBuffer: A L1 real address of the GSB.
+        If takeOwnershipOfVcpuState, size must be at least the size
+        returned by ID=0x0001
+      dataBufferSizeInBytes: Size of dataBuffer
+    Output:
+      R3: Return code
+      R4: If R3 = H_Invalid_Element_Id: The array index of the bad
+            element ID.
+          If R3 = H_Invalid_Element_Size: The array index of the bad
+             element size.
+          If R3 = H_Invalid_Element_Value: The array index of the bad
+             element value.
+
+H_GUEST_RUN_VCPU()
+------------------
+
+This is called to run an L2 vCPU. The L2 and vCPU IDs are passed in as
+parameters. The vCPU run with the state set previously using
+H_GUEST_SET_STATE(). When the L2 exits, the L1 will resume from this
+hcall.
+
+This hcall also has associated input and output GSBs. Unlike
+H_GUEST_{S,G}ET_STATE(), these GSB pointers are not passed in as
+parameters to the hcall (This was done in the interest of
+performance). The locations of these GSBs must be preregistered using
+the H_GUEST_SET_STATE() call with ID 0x0c00 and 0x0c01 (see table
+below).
+
+The input GSB may contain only VCPU specific elements to be set. This
+GSB may also contain zero elements (ie 0 in the first 4 bytes of the
+GSB) if nothing needs to be set.
+
+On exit from the hcall, the output buffer is filled with elements
+determined by the L0. The reason for the exit is contained in GPR4 (ie
+NIP is put in GPR4).  The elements returned depend on the exit
+type. For example, if the exit reason is the L2 doing a hcall (GPR4 =
+0xc00), then GPR3-12 are provided in the output GSB as this is the
+state likely needed to service the hcall. If additional state is
+needed, H_GUEST_GET_STATE() may be called by the L1.
+
+To synthesize interrupts in the L2, when calling H_GUEST_RUN_VCPU()
+the L1 may set a flag (as a hcall parameter) and the L0 will
+synthesize the interrupt in the L2. Alternatively, the L1 may
+synthesize the interrupt itself using H_GUEST_SET_STATE() or the
+H_GUEST_RUN_VCPU() input GSB to set the state appropriately::
+
+  H_GUEST_RUN_VCPU(uint64 flags,
+                   uint64 guestId,
+                   uint64 vcpuId,
+                   uint64 dataBuffer,
+                   uint64 dataBufferSizeInBytes);
+  Parameters:
+    Input:
+      flags:
+         Bit 0: generateExternalInterrupt: Generate an external interrupt
+         Bit 1: generatePrivilegedDoorbell: Generate a Privileged Doorbell
+         Bit 2: sendToSystemReset”: Generate a System Reset Interrupt
+         Bits 3-63: Reserved
+      guestId: ID obtained from H_GUEST_CREATE
+      vcpuId: ID of the vCPU pass to H_GUEST_CREATE_VCPU
+    Output:
+      R3: Return code
+      R4: If R3 = H_Success: The reason L1 VCPU exited (ie. NIA)
+            0x000: The VCPU stopped running for an unspecified reason. An
+              example of this is the Hypervisor stopping a VCPU running
+              due to an outstanding interrupt for the Host Partition.
+            0x980: HDEC
+            0xC00: HCALL
+            0xE00: HDSI
+            0xE20: HISI
+            0xE40: HEA
+            0xF80: HV Fac Unavail
+          If R3 = H_Invalid_Element_Id, H_Invalid_Element_Size, or
+            H_Invalid_Element_Value: R4 is offset of the invalid element
+            in the input buffer.
+
+H_GUEST_DELETE()
+----------------
+
+This is called to delete an L2. All associated vCPUs are also
+deleted. No specific vCPU delete call is provided.
+
+A flag may be provided to delete all guests. This is used to reset the
+L0 in the case of kdump/kexec::
+
+  H_GUEST_DELETE(uint64 flags,
+                 uint64 guestId)
+  Parameters:
+    Input:
+      flags:
+         Bit 0: deleteAllGuests: deletes all guests
+         Bits 1-63: Reserved
+      guestId: ID obtained from H_GUEST_CREATE
+    Output:
+      R3: Return code
+
+Guest State Buffer
+==================
+
+The Guest State Buffer (GSB) is the main method of communicating state
+about the L2 between the L1 and L0 via H_GUEST_{G,S}ET() and
+H_GUEST_VCPU_RUN() calls.
+
+State may be associated with a whole L2 (eg timebase offset) or a
+specific L2 vCPU (eg. GPR state). Only L2 VCPU state maybe be set by
+H_GUEST_VCPU_RUN(). 
+
+All data in the GSB is big endian (as is standard in PAPR)
+
+The Guest state buffer has a header which gives the number of
+elements, followed by the GSB elements themselves.
+
+GSB header:
+
++----------+----------+-------------------------------------------+
+|  Offset  |  Size    |  Purpose                                  |
+|  Bytes   |  Bytes   |                                           |
++==========+==========+===========================================+
+|    0     |    4     |  Number of elements                       |
++----------+----------+-------------------------------------------+
+|    4     |          |  Guest state buffer elements              |
++----------+----------+-------------------------------------------+
+
+GSB element:
+
++----------+----------+-------------------------------------------+
+|  Offset  |  Size    |  Purpose                                  |
+|  Bytes   |  Bytes   |                                           |
++==========+==========+===========================================+
+|    0     |    2     |  ID                                       |
++----------+----------+-------------------------------------------+
+|    2     |    2     |  Size of Value                            |
++----------+----------+-------------------------------------------+
+|    4     | As above |  Value                                    |
++----------+----------+-------------------------------------------+
+
+The ID in the GSB element specifies what is to be set. This includes
+archtected state like GPRs, VSRs, SPRs, plus also some meta data about
+the partition like the timebase offset and partition scoped page
+table information.
+
++--------+-------+----+--------+----------------------------------+
+|   ID   | Size  | RW | Thread | Details                          |
+|        | Bytes |    | Guest  |                                  |
+|        |       |    | Scope  |                                  |
++========+=======+====+========+==================================+
+| 0x0000 |       | RW |   TG   | NOP element                      |
++--------+-------+----+--------+----------------------------------+
+| 0x0001 | 0x08  | R  |   G    | Size of L0 vCPU state. See:      |
+|        |       |    |        | H_GUEST_GET_STATE:               |
+|        |       |    |        | flags = takeOwnershipOfVcpuState |
++--------+-------+----+--------+----------------------------------+
+| 0x0002 | 0x08  | R  |   G    | Size Run vCPU out buffer         |
++--------+-------+----+--------+----------------------------------+
+| 0x0003 | 0x04  | RW |   G    | Logical PVR                      |
++--------+-------+----+--------+----------------------------------+
+| 0x0004 | 0x08  | RW |   G    | TB Offset (L1 relative)          |
++--------+-------+----+--------+----------------------------------+
+| 0x0005 | 0x18  | RW |   G    |Partition scoped page tbl info:   |
+|        |       |    |        |                                  |
+|        |       |    |        |- 0x00 Addr part scope table      |
+|        |       |    |        |- 0x08 Num addr bits              |
+|        |       |    |        |- 0x10 Size root dir              |
++--------+-------+----+--------+----------------------------------+
+| 0x0006 | 0x10  | RW |   G    |Process Table Information:        |
+|        |       |    |        |                                  |
+|        |       |    |        |- 0x0 Addr proc scope table       |
+|        |       |    |        |- 0x8 Table size.                 |
++--------+-------+----+--------+----------------------------------+
+| 0x0007-|       |    |        | Reserved                         |
+| 0x0BFF |       |    |        |                                  |
++--------+-------+----+--------+----------------------------------+
+| 0x0C00 | 0x10  | RW |   T    |Run vCPU Input Buffer:            |
+|        |       |    |        |                                  |
+|        |       |    |        |- 0x0 Addr of buffer              |
+|        |       |    |        |- 0x8 Buffer Size.                |
++--------+-------+----+--------+----------------------------------+
+| 0x0C01 | 0x10  | RW |   T    |Run vCPU Output Buffer:           |
+|        |       |    |        |                                  |
+|        |       |    |        |- 0x0 Addr of buffer              |
+|        |       |    |        |- 0x8 Buffer Size.                |
++--------+-------+----+--------+----------------------------------+
+| 0x0C02 | 0x08  | RW |   T    | vCPU VPA Address                 |
++--------+-------+----+--------+----------------------------------+
+| 0x0C03-|       |    |        | Reserved                         |
+| 0x0FFF |       |    |        |                                  |
++--------+-------+----+--------+----------------------------------+
+| 0x1000-| 0x08  | RW |   T    | GPR 0-31                         |
+| 0x101F |       |    |        |                                  |
++--------+-------+----+--------+----------------------------------+
+| 0x1020 |  0x08 | T  |   T    | HDEC expiry TB                   |
++--------+-------+----+--------+----------------------------------+
+| 0x1021 | 0x08  | RW |   T    | NIA                              |
++--------+-------+----+--------+----------------------------------+
+| 0x1022 | 0x08  | RW |   T    | MSR                              |
++--------+-------+----+--------+----------------------------------+
+| 0x1023 | 0x08  | RW |   T    | LR                               |
++--------+-------+----+--------+----------------------------------+
+| 0x1024 | 0x08  | RW |   T    | XER                              |
++--------+-------+----+--------+----------------------------------+
+| 0x1025 | 0x08  | RW |   T    | CTR                              |
++--------+-------+----+--------+----------------------------------+
+| 0x1026 | 0x08  | RW |   T    | CFAR                             |
++--------+-------+----+--------+----------------------------------+
+| 0x1027 | 0x08  | RW |   T    | SRR0                             |
++--------+-------+----+--------+----------------------------------+
+| 0x1028 | 0x08  | RW |   T    | SRR1                             |
++--------+-------+----+--------+----------------------------------+
+| 0x1029 | 0x08  | RW |   T    | DAR                              |
++--------+-------+----+--------+----------------------------------+
+| 0x102A | 0x08  | RW |   T    | DEC expiry TB                    |
++--------+-------+----+--------+----------------------------------+
+| 0x102B | 0x08  | RW |   T    | VTB                              |
++--------+-------+----+--------+----------------------------------+
+| 0x102C | 0x08  | RW |   T    | LPCR                             |
++--------+-------+----+--------+----------------------------------+
+| 0x102D | 0x08  | RW |   T    | HFSCR                            |
++--------+-------+----+--------+----------------------------------+
+| 0x102E | 0x08  | RW |   T    | FSCR                             |
++--------+-------+----+--------+----------------------------------+
+| 0x102F | 0x08  | RW |   T    | FPSCR                            |
++--------+-------+----+--------+----------------------------------+
+| 0x1030 | 0x08  | RW |   T    | DAWR0                            |
++--------+-------+----+--------+----------------------------------+
+| 0x1031 | 0x08  | RW |   T    | DAWR1                            |
++--------+-------+----+--------+----------------------------------+
+| 0x1032 | 0x08  | RW |   T    | CIABR                            |
++--------+-------+----+--------+----------------------------------+
+| 0x1033 | 0x08  | RW |   T    | PURR                             |
++--------+-------+----+--------+----------------------------------+
+| 0x1034 | 0x08  | RW |   T    | SPURR                            |
++--------+-------+----+--------+----------------------------------+
+| 0x1035 | 0x08  | RW |   T    | IC                               |
++--------+-------+----+--------+----------------------------------+
+| 0x1036-| 0x08  | RW |   T    | SPRG 0-3                         |
+| 0x1039 |       |    |        |                                  |
++--------+-------+----+--------+----------------------------------+
+| 0x103A | 0x08  | W  |   T    | PPR                              |
++--------+-------+----+--------+----------------------------------+
+| 0x103B | 0x08  | RW |   T    | MMCR 0-3                         |
+| 0x103E |       |    |        |                                  |
++--------+-------+----+--------+----------------------------------+
+| 0x103F | 0x08  | RW |   T    | MMCRA                            |
++--------+-------+----+--------+----------------------------------+
+| 0x1040 | 0x08  | RW |   T    | SIER                             |
++--------+-------+----+--------+----------------------------------+
+| 0x1041 | 0x08  | RW |   T    | SIER 2                           |
++--------+-------+----+--------+----------------------------------+
+| 0x1042 | 0x08  | RW |   T    | SIER 3                           |
++--------+-------+----+--------+----------------------------------+
+| 0x1043 | 0x08  | RW |   T    | BESCR                            |
++--------+-------+----+--------+----------------------------------+
+| 0x1044 | 0x08  | RW |   T    | EBBHR                            |
++--------+-------+----+--------+----------------------------------+
+| 0x1045 | 0x08  | RW |   T    | EBBRR                            |
++--------+-------+----+--------+----------------------------------+
+| 0x1046 | 0x08  | RW |   T    | AMR                              |
++--------+-------+----+--------+----------------------------------+
+| 0x1047 | 0x08  | RW |   T    | IAMR                             |
++--------+-------+----+--------+----------------------------------+
+| 0x1048 | 0x08  | RW |   T    | AMOR                             |
++--------+-------+----+--------+----------------------------------+
+| 0x1049 | 0x08  | RW |   T    | UAMOR                            |
++--------+-------+----+--------+----------------------------------+
+| 0x104A | 0x08  | RW |   T    | SDAR                             |
++--------+-------+----+--------+----------------------------------+
+| 0x104B | 0x08  | RW |   T    | SIAR                             |
++--------+-------+----+--------+----------------------------------+
+| 0x104C | 0x08  | RW |   T    | DSCR                             |
++--------+-------+----+--------+----------------------------------+
+| 0x104D | 0x08  | RW |   T    | TAR                              |
++--------+-------+----+--------+----------------------------------+
+| 0x104E | 0x08  | RW |   T    | DEXCR                            |
++--------+-------+----+--------+----------------------------------+
+| 0x104F | 0x08  | RW |   T    | HDEXCR                           |
++--------+-------+----+--------+----------------------------------+
+| 0x1050 | 0x08  | RW |   T    | HASHKEYR                         |
++--------+-------+----+--------+----------------------------------+
+| 0x1051 | 0x08  | RW |   T    | HASHPKEYR                        |
++--------+-------+----+--------+----------------------------------+
+| 0x1052 | 0x08  | RW |   T    | CTRL                             |
++--------+-------+----+--------+----------------------------------+
+| 0x1053-|       |    |        | Reserved                         |
+| 0x1FFF |       |    |        |                                  |
++--------+-------+----+--------+----------------------------------+
+| 0x2000 | 0x04  | RW |   T    | CR                               |
++--------+-------+----+--------+----------------------------------+
+| 0x2001 | 0x04  | RW |   T    | PIDR                             |
++--------+-------+----+--------+----------------------------------+
+| 0x2002 | 0x04  | RW |   T    | DSISR                            |
++--------+-------+----+--------+----------------------------------+
+| 0x2003 | 0x04  | RW |   T    | VSCR                             |
++--------+-------+----+--------+----------------------------------+
+| 0x2004 | 0x04  | RW |   T    | VRSAVE                           |
++--------+-------+----+--------+----------------------------------+
+| 0x2005 | 0x04  | RW |   T    | DAWRX0                           |
++--------+-------+----+--------+----------------------------------+
+| 0x2006 | 0x04  | RW |   T    | DAWRX1                           |
++--------+-------+----+--------+----------------------------------+
+| 0x2007-| 0x04  | RW |   T    | PMC 1-6                          |
+| 0x200c |       |    |        |                                  |
++--------+-------+----+--------+----------------------------------+
+| 0x200D | 0x04  | RW |   T    | WORT                             |
++--------+-------+----+--------+----------------------------------+
+| 0x200E | 0x04  | RW |   T    | PSPB                             |
++--------+-------+----+--------+----------------------------------+
+| 0x200F-|       |    |        | Reserved                         |
+| 0x2FFF |       |    |        |                                  |
++--------+-------+----+--------+----------------------------------+
+| 0x3000-| 0x10  | RW |   T    | VSR 0-63                         |
+| 0x303F |       |    |        |                                  |
++--------+-------+----+--------+----------------------------------+
+| 0x3040-|       |    |        | Reserved                         |
+| 0xEFFF |       |    |        |                                  |
++--------+-------+----+--------+----------------------------------+
+| 0xF000 | 0x08  | R  |   T    | HDAR                             |
++--------+-------+----+--------+----------------------------------+
+| 0xF001 | 0x04  | R  |   T    | HDSISR                           |
++--------+-------+----+--------+----------------------------------+
+| 0xF002 | 0x04  | R  |   T    | HEIR                             |
++--------+-------+----+--------+----------------------------------+
+| 0xF003 | 0x08  | R  |   T    | ASDR                             |
++--------+-------+----+--------+----------------------------------+
+
+
+Miscellaneous info
+==================
+
+State not in ptregs/hvregs
+--------------------------
+
+In the v1 API, some state is not in the ptregs/hvstate. This includes
+the vector register and some SPRs. For the L1 to set this state for
+the L2, the L1 loads up these hardware registers before the
+h_enter_nested() call and the L0 ensures they end up as the L2 state
+(by not touching them).
+
+The v2 API removes this and explicitly sets this state via the GSB.
+
+L1 Implementation details: Caching state
+----------------------------------------
+
+In the v1 API, all state is sent from the L1 to the L0 and vice versa
+on every h_enter_nested() hcall. If the L0 is not currently running
+any L2s, the L0 has no state information about them. The only
+exception to this is the location of the partition table, registered
+via h_set_partition_table().
+
+The v2 API changes this so that the L0 retains the L2 state even when
+it's vCPUs are no longer running. This means that the L1 only needs to
+communicate with the L0 about L2 state when it needs to modify the L2
+state, or when it's value is out of date. This provides an opportunity
+for performance optimisation.
+
+When a vCPU exits from a H_GUEST_RUN_VCPU() call, the L1 internally
+marks all L2 state as invalid. This means that if the L1 wants to know
+the L2 state (say via a kvm_get_one_reg() call), it needs call
+H_GUEST_GET_STATE() to get that state. Once it's read, it's marked as
+valid in L1 until the L2 is run again.
+
+Also, when an L1 modifies L2 vcpu state, it doesn't need to write it
+to the L0 until that L2 vcpu runs again. Hence when the L1 updates
+state (say via a kvm_set_one_reg() call), it writes to an internal L1
+copy and only flushes this copy to the L0 when the L2 runs again via
+the H_GUEST_VCPU_RUN() input buffer.
+
+This lazy updating of state by the L1 avoids unnecessary
+H_GUEST_{G|S}ET_STATE() calls.
+
+
-- 
2.31.1

