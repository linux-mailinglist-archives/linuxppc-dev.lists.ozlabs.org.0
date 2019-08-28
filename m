Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F63B9FD0C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 10:29:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JJnR1MxvzDr2F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 18:29:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vaibhav@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JJlS6SzdzDqRf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 18:27:48 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7S8Njdh109748
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 04:27:45 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2unm7bmp8q-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 04:27:44 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Wed, 28 Aug 2019 09:27:43 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 28 Aug 2019 09:27:41 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7S8RdOs60162096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Aug 2019 08:27:39 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76C2311C04A;
 Wed, 28 Aug 2019 08:27:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EF3B11C054;
 Wed, 28 Aug 2019 08:27:36 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.109.195.193])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 28 Aug 2019 08:27:35 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [DOC][PATCH v2] powerpc: Provide initial documentation for PAPR hcalls
Date: Wed, 28 Aug 2019 13:57:29 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19082808-0016-0000-0000-000002A3CFAD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082808-0017-0000-0000-000033041EDE
Message-Id: <20190828082729.16695-1-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-28_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908280089
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
Cc: msuchanek@suse.de, Nicholas Piggin <npiggin@gmail.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This doc patch provides an initial description of the hcall op-codes
that are used by Linux kernel running as a guest (LPAR) on top of
PowerVM or any other sPAPR compliant hyper-visor (e.g qemu).

Apart from documenting the hcalls the doc-patch also provides a
rudimentary overview of how hcall ABI, how they are issued with the
Linux kernel and how information/control flows between the guest and
hypervisor.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Change-log:

v2:
* Added a section on Register conventions to be followed when invoking
  hcalls. [Nick]
* Updated section on HCALL ABI to clarify that byte ordering only
  matters to in/out values passed by a memory buffer. [Laurent]
* Updated a code comment in 'exceptions-64s.S' describing hypercall
  register conventions to point it to 'papr_hcalls.rst' [Nick]

v1:
Initial version of this doc-patch was posted and reviewed as part of
the patch-series "[PATCH v5 0/4] powerpc/papr_scm: Workaround for
failure of drc bind after kexec"
https://patchwork.ozlabs.org/patch/1136022/. Changes introduced on top
the original patch:

* Replaced the of term PHYP with Hypervisor to indicate both
PowerVM/Qemu [Laurent]
* Emphasized that In/Out arguments to hcalls are in Big-endian format
[Laurent]
* Fixed minor word repetition, spell issues and grammatical error
[Michal, Mpe]
* Replaced various variant of term 'hcall' with a single
variant. [Mpe]
* Changed the documentation format from txt to ReST. [Mpe]
* Changed the name of documentation file to papr_hcalls.rst. [Mpe]
* Updated the section describing privileged operation by hypervisor
to be more accurate [Mpe].
* Fixed up mention of register notation used for describing
hcalls. [Mpe]
* s/NVDimm/NVDIMM [Mpe]
* Added section on return values from hcall [Mpe]
* Described H_CONTINUE return-value for long running hcalls.
---
 Documentation/powerpc/papr_hcalls.rst | 248 ++++++++++++++++++++++++++
 arch/powerpc/kernel/exceptions-64s.S  |  19 +-
 2 files changed, 251 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/powerpc/papr_hcalls.rst

diff --git a/Documentation/powerpc/papr_hcalls.rst b/Documentation/powerpc/papr_hcalls.rst
new file mode 100644
index 000000000000..4d270c7ae26d
--- /dev/null
+++ b/Documentation/powerpc/papr_hcalls.rst
@@ -0,0 +1,248 @@
+===========================
+Hypercall Op-codes (hcalls)
+===========================
+
+Overview
+=========
+
+Virtualization on 64-bit Power Book3S Platforms is based on the PAPR
+specification [1]_ which describes the run-time environment for a guest
+operating system and how it should interact with the hypervisor for
+privileged operations. Currently there are two PAPR compliant hypervisors:
+
+- **IBM PowerVM (PHYP)**: IBM's proprietary hypervisor that supports AIX,
+  IBM-i and  Linux as supported guests (termed as Logical Partitions
+  or LPARS). It supports the full PAPR specification.
+
+- **Qemu/KVM**: Supports PPC64 linux guests running on a PPC64 linux host.
+  Though it only implements a subset of PAPR specification called LoPAPR [2]_.
+
+On PPC64 arch a guest kernel running on top of a PAPR hypervisor is called
+a *pSeries guest*. A pseries guest runs in a supervisor mode (HV=0) and must
+issue hypercalls to the hypervisor whenever it needs to perform an action
+that is hypervisor priviledged [3]_ or for other services managed by the
+hypervisor.
+
+Hence a Hypercall (hcall) is essentially a request by the pseries guest
+asking hypervisor to perform a privileged operation on behalf of the guest. The
+guest issues a with necessary input operands. The hypervisor after performing
+the privilege operation returns a status code and output operands back to the
+guest.
+
+HCALL ABI
+=========
+The ABI specification for a hcall between a pseries guest and PAPR hypervisor
+is covered in section 14.5.3 of ref [2]_. Switch to the  Hypervisor context is
+done via the instruction **HVCS** that expects the Opcode for hcall is set in *r3*
+and any in-arguments for the hcall are provided in registers *r4-r12*. If values
+have to be passed through a memory buffer, the data stored in that buffer should be
+in Big-endian byte order.
+
+Once control is returns back to the guest after hypervisor has serviced the
+'HVCS' instruction the return value of the hcall is available in *r3* and any
+out values are returned in registers *r4-r12*. Again like in case of in-arguments,
+any out values stored in a memory buffer will be in Big-endian byte order.
+
+Powerpc arch code provides convenient wrappers named **plpar_hcall_xxx** defined
+in a arch specific header [4]_ to issue hcalls from the linux kernel
+running as pseries guest.
+
+Register Conventions
+====================
+
+Any hcall should follow same register convention as described in section 2.2.1.1
+of "64-Bit ELF V2 ABI Specification: Power Architecture"[5]_. Table below
+summarizes these conventions:
+
++----------+----------+-------------------------------------------+
+| Register |Volatile  |  Purpose                                  |
+| Range    |(Y/N)     |                                           |
++==========+==========+===========================================+
+|   r0     |    Y     |  Optional-usage                           |
++----------+----------+-------------------------------------------+
+|   r1     |    N     |  Stack Pointer                            |
++----------+----------+-------------------------------------------+
+|   r2     |    N     |  TOC                                      |
++----------+----------+-------------------------------------------+
+|   r3     |    Y     |  hcall opcode/return value                |
++----------+----------+-------------------------------------------+
+|  r4-r10  |    Y     |  in and out values                        |
++----------+----------+-------------------------------------------+
+|   r11    |    Y     |  Optional-usage/Environmental pointer     |
++----------+----------+-------------------------------------------+
+|   r12    |    Y     |  Optional-usage/Function entry address at |
+|          |          |  global entry point                       |
++----------+----------+-------------------------------------------+
+|   r13    |    N     |  Thread-Pointer                           |
++----------+----------+-------------------------------------------+
+|  r14-r31 |    N     |  Local Variables                          |
++----------+----------+-------------------------------------------+
+|    LR    |    Y     |  Link Register                            |
++----------+----------+-------------------------------------------+
+|   CTR    |    Y     |  Loop Counter                             |
++----------+----------+-------------------------------------------+
+|   XER    |    Y     |  Fixed-point exception register.          |
++----------+----------+-------------------------------------------+
+|  CR0-1   |    Y     |  Condition register fields.               |
++----------+----------+-------------------------------------------+
+|  CR2-4   |    N     |  Condition register fields.               |
++----------+----------+-------------------------------------------+
+|  CR5-7   |    Y     |  Condition register fields.               |
++----------+----------+-------------------------------------------+
+|  Others  |    N     |                                           |
++----------+----------+-------------------------------------------+
+
+DRC & DRC Indexes
+=================
+::
+
+     DR1                                  Guest
+     +--+        +------------+         +---------+
+     |  | <----> |            |         |  User   |
+     +--+  DRC1  |            |   DRC   |  Space  |
+                 |    PAPR    |  Index  +---------+
+     DR2         | Hypervisor |         |         |
+     +--+        |            | <-----> |  Kernel |
+     |  | <----> |            |  Hcall  |         |
+     +--+  DRC2  +------------+         +---------+
+
+PAPR hypervisor terms shared hardware resources like PCI devices, NVDIMMs etc
+available for use by LPARs as Dynamic Resource (DR). When a DR is allocated to
+an LPAR, PHYP creates a data-structure called Dynamic Resource Connector (DRC)
+to manage LPAR access. An LPAR refers to a DRC via an opaque 32-bit number
+called DRC-Index. The DRC-index value is provided to the LPAR via device-tree
+where its present as an attribute in the device tree node associated with the
+DR.
+
+HCALL Return-values
+===================
+
+After servicing the hcall, hypervisor sets the return-value in *r3* indicating
+success or failure of the hcall. In case of a failure an error code indicates
+the cause for error. These codes are defined and documented in arch specific
+header [4]_.
+
+In some cases a hcall can potentially take a long time and need to be issued
+multiple times in order to be completely serviced. These hcalls will usually
+accept an opaque value *continue-token* within there argument list and a
+return value of *H_CONTINUE* indicates that hypervisor hasn't still finished
+servicing the hcall yet.
+
+To make such hcalls the guest need to set *continue-token == 0* for the
+initial call and use the hypervisor returned value of *continue-token*
+for each subsequent hcall until hypervisor returns a non *H_CONTINUE*
+return value.
+
+HCALL Op-codes
+==============
+
+Below is a partial list of HCALLs that are supported by PHYP. For the
+corresponding opcode values please look into the arch specific header [4]_:
+
+**H_SCM_READ_METADATA**
+
+| Input: *drcIndex, offset, buffer-address, numBytesToRead*
+| Out: *numBytesRead*
+| Return Value: *H_Success, H_Parameter, H_P2, H_P3, H_Hardware*
+
+Given a DRC Index of an NVDIMM, read N-bytes from the the metadata area
+associated with it, at a specified offset and copy it to provided buffer.
+The metadata area stores configuration information such as label information,
+bad-blocks etc. The metadata area is located out-of-band of NVDIMM storage
+area hence a separate access semantics is provided.
+
+**H_SCM_WRITE_METADATA**
+
+| Input: *drcIndex, offset, data, numBytesToWrite*
+| Out: *None*
+| Return Value: *H_Success, H_Parameter, H_P2, H_P4, H_Hardware*
+
+Given a DRC Index of an NVDIMM, write N-bytes to the metadata area
+associated with it, at the specified offset and from the provided buffer.
+
+**H_SCM_BIND_MEM**
+
+| Input: *drcIndex, startingScmBlockIndex, numScmBlocksToBind,*
+| *targetLogicalMemoryAddress, continue-token*
+| Out: *continue-token, targetLogicalMemoryAddress, numScmBlocksToBound*
+| Return Value: *H_Success, H_Parameter, H_P2, H_P3, H_P4, H_Overlap,*
+| *H_Too_Big, H_P5, H_Busy*
+
+Given a DRC-Index of an NVDIMM, map a continuous SCM blocks range
+*(startingScmBlockIndex, startingScmBlockIndex+numScmBlocksToBind)* to the guest
+at *targetLogicalMemoryAddress* within guest physical address space. In
+case *targetLogicalMemoryAddress == 0xFFFFFFFF_FFFFFFFF* then hypervisor
+assigns a target address to the guest. The HCALL can fail if the Guest has
+an active PTE entry to the SCM block being bound.
+
+**H_SCM_UNBIND_MEM**
+| Input: drcIndex, startingScmLogicalMemoryAddress, numScmBlocksToUnbind
+| Out: numScmBlocksUnbound
+| Return Value: *H_Success, H_Parameter, H_P2, H_P3, H_In_Use, H_Overlap,*
+| *H_Busy, H_LongBusyOrder1mSec, H_LongBusyOrder10mSec*
+
+Given a DRC-Index of an NVDimm, unmap *numScmBlocksToUnbind* SCM blocks starting
+at *startingScmLogicalMemoryAddress* from guest physical address space. The
+HCALL can fail if the Guest has an active PTE entry to the SCM block being
+unbound.
+
+**H_SCM_QUERY_BLOCK_MEM_BINDING**
+
+| Input: *drcIndex, scmBlockIndex*
+| Out: *Guest-Physical-Address*
+| Return Value: *H_Success, H_Parameter, H_P2, H_NotFound*
+
+Given a DRC-Index and an SCM Block index return the guest physical address to
+which the SCM block is mapped to.
+
+**H_SCM_QUERY_LOGICAL_MEM_BINDING**
+
+| Input: *Guest-Physical-Address*
+| Out: *drcIndex, scmBlockIndex*
+| Return Value: *H_Success, H_Parameter, H_P2, H_NotFound*
+
+Given a guest physical address return which DRC Index and SCM block is mapped
+to that address.
+
+**H_SCM_UNBIND_ALL**
+
+| Input: *scmTargetScope, drcIndex*
+| Out: *None*
+| Return Value: *H_Success, H_Parameter, H_P2, H_P3, H_In_Use, H_Busy,*
+| *H_LongBusyOrder1mSec, H_LongBusyOrder10mSec*
+
+Depending on the Target scope unmap all SCM blocks belonging to all NVDIMMs
+or all SCM blocks belonging to a single NVDIMM identified by its drcIndex
+from the LPAR memory.
+
+**H_SCM_HEALTH**
+
+| Input: drcIndex
+| Out: *health-bitmap, health-bit-valid-bitmap*
+| Return Value: *H_Success, H_Parameter, H_Hardware*
+
+Given a DRC Index return the info on predictive failure and overall health of
+the NVDIMM. The asserted bits in the health-bitmap indicate a single predictive
+failure and health-bit-valid-bitmap indicate which bits in health-bitmap are
+valid.
+
+**H_SCM_PERFORMANCE_STATS**
+
+| Input: drcIndex, resultBuffer Addr
+| Out: None
+| Return Value:  *H_Success, H_Parameter, H_Unsupported, H_Hardware, H_Authority, H_Privilege*
+
+Given a DRC Index collect the performance statistics for NVDIMM and copy them
+to the resultBuffer.
+
+References
+==========
+.. [1] "Power Architecture Platform Reference"
+       https://en.wikipedia.org/wiki/Power_Architecture_Platform_Reference
+.. [2] "Linux on Power Architecture Platform Reference"
+       https://members.openpowerfoundation.org/document/dl/469
+.. [3] "Definitions and Notation" Book III-Section 14.5.3
+       https://openpowerfoundation.org/?resource_lib=power-isa-version-3-0
+.. [4] arch/powerpc/include/asm/hvcall.h
+.. [5] "64-Bit ELF V2 ABI Specification: Power Architecture"
+       https://openpowerfoundation.org/?resource_lib=64-bit-elf-v2-abi-specification-power-architecture
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 6ba3cc2ef8ab..efe5d8b13a2e 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1531,22 +1531,9 @@ EXC_COMMON(trap_0b_common, 0xb00, unknown_exception)
  *
  * Call convention:
  *
- * syscall register convention is in Documentation/powerpc/syscall64-abi.rst
- *
- * For hypercalls, the register convention is as follows:
- * r0 volatile
- * r1-2 nonvolatile
- * r3 volatile parameter and return value for status
- * r4-r10 volatile input and output value
- * r11 volatile hypercall number and output value
- * r12 volatile input and output value
- * r13-r31 nonvolatile
- * LR nonvolatile
- * CTR volatile
- * XER volatile
- * CR0-1 CR5-7 volatile
- * CR2-4 nonvolatile
- * Other registers nonvolatile
+ * syscall and hypercalls register conventions are documented in
+ * Documentation/powerpc/syscall64-abi.rst and
+ * Documentation/powerpc/papr_hcalls.rst respectively.
  *
  * The intersection of volatile registers that don't contain possible
  * inputs is: cr0, xer, ctr. We may use these as scratch regs upon entry
-- 
2.21.0

