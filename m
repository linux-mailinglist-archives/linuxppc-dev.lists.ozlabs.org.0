Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E75C7A7B2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 14:08:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yb1j1dV7zDqVC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 22:08:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yZzC5F0RzDqMb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 22:06:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45yZzC2k5Sz9s3Z;
 Tue, 30 Jul 2019 22:06:31 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [DOC][PATCH v5 1/4] powerpc: Document some HCalls for Storage
 Class Memory
In-Reply-To: <20190723161357.26718-2-vaibhav@linux.ibm.com>
References: <20190723161357.26718-1-vaibhav@linux.ibm.com>
 <20190723161357.26718-2-vaibhav@linux.ibm.com>
Date: Tue, 30 Jul 2019 22:06:30 +1000
Message-ID: <87blxbzpyx.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Vaibhav,

Thanks for writing this documentation.

Vaibhav Jain <vaibhav@linux.ibm.com> writes:
> This doc patch provides an initial description of the HCall op-codes
> that are used by Linux kernel running as a guest operating
> system (LPAR) on top of PowerVM or any other sPAPR compliant
> hyper-visor (e.g qemu).
>
> Apart from documenting the HCalls the doc-patch also provides a
> rudimentary overview of how Hcalls are implemented inside the Linux

I prefer "hcall" rather than "HCall", "Hcall" or "HCALL".

> kernel and how information flows between kernel and PowerVM/KVM.
>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Change-log:
>
> v5
> * First patch in this patchset.
> ---
>  Documentation/powerpc/hcalls.txt | 140 +++++++++++++++++++++++++++++++
>  1 file changed, 140 insertions(+)
>  create mode 100644 Documentation/powerpc/hcalls.txt

During this merge window all the existing documentation in there has
been converted to rst format. I suspect Jon will be annoyed at us if we
immediately start adding new plain text docs.

So we need to make this an rst file and do at least a minimal job of
making it valid ReST.

A while back I worked out how to actually build the rst docs, I'll try
and find my notes on that.

> diff --git a/Documentation/powerpc/hcalls.txt b/Documentation/powerpc/hcalls.txt
> new file mode 100644
> index 000000000000..cc9dd872cecd
> --- /dev/null
> +++ b/Documentation/powerpc/hcalls.txt

Can we call it papr_hcalls please.

> @@ -0,0 +1,140 @@
> +Hyper-visor Call Op-codes (HCALLS)
> +====================================

I'm not sure if "hyper-visor" is correct, but regardless that's not what
we commonly use, so please just spell it "hypervisor". And similarly for
"opcode".

> +Overview
> +=========
> +
> +Virtualization on PPC64 arch is based on the PAPR specification[1] which

We should probably say on "64-bit Power Book3S platforms".

Also the link you provide is to the "LoPAPR" specification. Which is not
quite the same as "PAPR", which used to be released via power.org, or
"PAPR+" which is the IBM internal version.


> +describes run-time environment for a guest operating system and how it should
> +interact with the hyper-visor for privileged operations. Currently there are two
> +PAPR compliant hypervisors (PHYP):

"PHYP" is only used as a another name for PowerVM (or part of PowerVM),
not as a generic term for a PAPR hypervisor.

I also don't think it's accurate to say Qemu/KVM is a "PAPR compliant"
hypervisor, it just implements (some of) the relevant parts of LoPAPR to
support Linux guests.

> +IBM PowerVM: IBM's proprietary hyper-visor that supports AIX, IBM-i and Linux as
> +	     supported guests (termed as Logical Partitions or LPARS).
> +
> +Qemu/KVM:    Supports PPC64 linux guests running on a PPC64 linux host.

And actually other hosts via Qemu TCG but that's a bit of a tangent.

> +On PPC64 arch a virtualized guest kernel runs in a non-privileged mode (HV=0).

"virtualized guest" is redundant, just "guest" is sufficient IMHO.

I know what you're trying to say there, but it actually contradicts the
language that's used in the ISA.

If you look at Chapter 1 of Book III it defines these terms:

  * hypervisor privileged
    A term used to describe an instruction or facility that is available
    only when the thread is in hypervisor state.
  * privileged state and supervisor mode
    Used interchangeably to refer to a state in which privileged
    facilities are available.
  * problem state and user mode
    Used interchangeably to refer to a state in which privileged
    facilities are not available.

So you might want to write it more like:

When running under a PAPR hypervisor the guest kernel runs in
supervisor mode (HV=0), and must issue hypercalls to the hypervisor
whenever it needs to perform an action that is hypervisor privileged or
for other services managed by the hypervisor.

> +Hence to perform a privileged operations the guest issues a Hyper-visor
> +Call (HCALL) with necessary input operands. PHYP after performing the privilege
> +operation returns a status code and output operands back to the guest.
> +
> +HCALL ABI
> +=========
> +The ABI specification for a HCall between guest os kernel and PHYP is
                                                   ^
                                                   "OS", but probably just
                                                   "guest kernel" is fine.

> +described in [1]. The Opcode for Hcall is set in R3 and subsequent in-arguments

Where in [1] ?

It's more common to spell the GPRs with lower case 'r', eg. 'r3'.

> +for the Hcall are provided in registers R4-R12. On return from      'HVCS'
                                                                 ^the  'HVSC'

> +instruction the status code of HCall is available in R3 an the output parameters
                   ^             ^                         ^
                   return value  the                       and

> +are returned in registers R4-R12.
> +
> +Powerpc arch code provides convenient wrappers named plpar_hcall_xxx defined in
> +header 'hvcall.h' to issue HCalls from the linux kernel running as guest.
> +
> +
> +DRC & DRC Indexes
> +=================
> +
> +		 PAPR		     Guest
> +  DR1          Hypervisor             OS
> +  +--+        +----------+         +---------+
> +  |  |<------>|          |         |  User   |
> +  +--+  DRC1  |          |   DRC   |  Space  |
> +              |          |  Index  +---------+
> +  DR2         |          |         |         |
> +  +--+        |          |<------->|  Kernel |
> +  |  |<----- >|          |  HCall  |         |
> +  +--+  DRC2  +----------+         +---------+
> +
> +PHYP terms shared hardware resources like PCI devices, NVDimms etc available for

DIMM is an acronym too, so it should be either nvdimm or NVDIMM IMHO.

> +use by LPARs as Dynamic Resource (DR). When a DR is allocated to an LPAR, PHYP
> +creates a data-structure called Dynamic Resource Connector (DRC) to manage LPAR
> +access. An LPAR refers to a DRC via an opaque 32-bit number called DRC-Index.
> +The DRC-index value is provided to the LPAR via device-tree where its present
> +as an attribute in the device tree node associated with the DR.
> +
> +HCALL Op-codes
> +==============
> +
> +Below is a partial of of HCALLs that are supported by PHYP. For the
> +corresponding opcode values please look into the header
> +'arch/powerpc/include/asm/hvcall.h' :
> +
> +* H_SCM_READ_METADATA:
> +  Input: drcIndex, offset, buffer-address, numBytesToRead
> +  Out: None
> +  Description:
> +  Given a DRC Index of an NVDimm, read N-bytes from the the meta data area
> +  associated with it, at a specified offset and copy it to provided buffer.
> +  The metadata area stores configuration information such as label information,
> +  bad-blocks etc. The metadata area is located out-of-band of NVDimm storage
> +  area hence a separate access semantics is provided.

Can you also document the possible return values? (If they are defined).

> +* H_SCM_WRITE_METADATA:
> +  Input: drcIndex, offset, data, numBytesToWrite
> +  Out: None
> +  Description:
> +  Given a DRC Index of an NVDimm, write N-bytes from provided buffer at the
> +  given offset to the the meta data area associated with the NVDimm.
> +
> +
> +* H_SCM_BIND_MEM:
> +  Input: drcIndex, startingScmBlockIndex, numScmBlocksToBind, targetAddress
> +  Out: guestMappedAddress, numScmBlockBound
> +  Description:
> +  Given a DRC-Index of an NVDimm, maps the SCM (Storage Class Memory) blocks to
> +  continuous logical addresses in guest physical address space. The HCALL
> +  arguments can be used to map partial range of SCM blocks instead of entire
> +  NVDimm range to the LPAR.

What address space do targetAddress and guestMappedAddress exist in?

What are these blocks and how do we find out about them? ie. how do I
know what a valid block index is.

> +* H_SCM_UNBIND_MEM:
> +  Input: drcIndex, startingScmLogicalMemoryAddress, numScmBlocksToUnbind

Similar question for startingScmLogicalMemoryAddress.

> +  Out: numScmBlocksUnbound
> +  Description:
> +  Given a DRC-Index of an NVDimm, unmap one or more the SCM blocks from guest
                                                      ^
                                                      of
> +  physical address space. The HCALL can fail if the Guest has an active PTE
> +  entry to the SCM block being unbinded.
                                  unbound

> +* H_SCM_QUERY_BLOCK_MEM_BINDING:
> +  Input: drcIndex, scmBlockIndex
> +  Out: Guest-Physical-Address
> +  Description:
> +  Given a DRC-Index and an SCM Block index return the guest physical address to
> +  which the SCM block is mapped to.
> +
> +* H_SCM_QUERY_LOGICAL_MEM_BINDING:
> +  Input: Guest-Physical-Address
> +  Out: drcIndex, scmBlockIndex
> +  Description:
> +  Given a guest physical address return which DRC Index and SCM block is mapped
> +  to that address.
> +
> +* H_SCM_UNBIND_ALL:
> +  Input: scmTargetScope, drcIndex
> +  Out: None
> +  Description:
> +  Depending on the Target scope unmap all scm blocks belonging to all NVDimms
                                             ^
                                             SCM for consistency.
> +  or all scm blocks belonging to a single NVDimm identified by its drcIndex
> +  from the LPAR memory.
> +
> +* H_SCM_HEALTH:
> +  Input: drcIndex
> +  Output: health-bitmap, health-bit-valid-bitmap
> +  Description:
> +  Given a DRC Index return the info on predictive failure and over all health of
                                                                 overall
> +  the NVDimm. The asserted bits in the health-bitmap indicate a single predictive
> +  failure and health-bit-valid-bitmap indicate which bits in health-bitmap are
> +  valid.

Presumably using bit endian bit ordering?


> +* H_SCM_PERFORMANCE_STATS:
> +  Input: drcIndex, resultBuffer Addr
> +  Out: None
> +  Description:
> +  Given a DRC Index collect the performance statistics for NVDimm and copy them
> +  to the resultBuffer.
> +
> +
> +References
> +==========
> +[1]: "Linux on Power Architecture Platform Reference"
> +     https://members.openpowerfoundation.org/document/dl/469


cheers
