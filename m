Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 983E09EEFE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 17:33:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HtFF5hN1zDqM5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 01:33:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vaibhav@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Ht204c22zDqX9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 01:23:52 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7RFHRj4127244
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 11:23:49 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2un6b4tepf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 11:23:47 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Tue, 27 Aug 2019 16:23:45 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 27 Aug 2019 16:23:43 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7RFNgRh44958070
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2019 15:23:42 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 337934204D;
 Tue, 27 Aug 2019 15:23:42 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6709E42045;
 Tue, 27 Aug 2019 15:23:40 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.109.195.222])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 27 Aug 2019 15:23:40 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [DOC][PATCH] powerpc: Provide initial documentation for PAPR hcalls
Date: Tue, 27 Aug 2019 20:53:26 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19082715-0012-0000-0000-000003438357
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082715-0013-0000-0000-0000217DBCB9
Message-Id: <20190827152326.2784-1-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-27_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908270156
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
Cc: msuchanek@suse.de, Oliver O'Halloran <oohall@gmail.com>,
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
 Documentation/powerpc/papr_hcalls.rst | 200 ++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)
 create mode 100644 Documentation/powerpc/papr_hcalls.rst

diff --git a/Documentation/powerpc/papr_hcalls.rst b/Documentation/powerpc/papr_hcalls.rst
new file mode 100644
index 000000000000..7afc0310de29
--- /dev/null
+++ b/Documentation/powerpc/papr_hcalls.rst
@@ -0,0 +1,200 @@
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
+Hence a Hypercall (hcall) is essentially a request by the pSeries guest
+asking hypervisor to perform a privileged operation on behalf of the guest. The
+guest issues a with necessary input operands. The hypervisor after performing
+the privilege operation returns a status code and output operands back to the
+guest.
+
+HCALL ABI
+=========
+The ABI specification for a hcall between a pSeries guest and PAPR hypervisor
+is covered in section 14.5.3 of ref [2]_. Switch to the  Hypervisor context is
+done via the instruction **HVCS** that expects the Opcode for hcall is set in *r3*
+and any in-arguments for the hcall are provided in registers *r4-r12* in
+Big-endian byte order.
+
+Once control is returns back to the guest after hypervisor has serviced the
+'HVCS' instruction the return value of the hcall is available in *r3* and any
+out values are returned in registers *r4-r12*. Again like in-arguments, all the
+out value are in Big-endian byte order.
+
+Powerpc arch code provides convenient wrappers named **plpar_hcall_xxx** defined
+in a arch specific header [4]_ to issue hcalls from the linux kernel
+running as pseries guest.
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
-- 
2.21.0

