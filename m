Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9739A1F8349
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 14:51:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49kcsD6gXfzDqxF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jun 2020 22:50:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=baolu.lu@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49kc754HckzDqwW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jun 2020 22:17:50 +1000 (AEST)
IronPort-SDR: DemxRnWnwThW+7XYdkmlN6vjvD047THJyN5bbr2ny/1EVWpkC9hpwyOHu+3EKg+jsoPYZ6XY7r
 vmFmyIA6nQpA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2020 05:17:46 -0700
IronPort-SDR: cmEideF9pzT0f0E0con6LHBIY5q5ePSTGUrFZxG4gWznnqlSsBz3xAxfR/pt4cJ3+Dn124iPYj
 d3ktIIIMfGXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,507,1583222400"; d="scan'208";a="419806199"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.255.28.93])
 ([10.255.28.93])
 by orsmga004.jf.intel.com with ESMTP; 13 Jun 2020 05:17:40 -0700
Subject: Re: [PATCH v2 04/12] docs: x86: Add documentation for SVA (Shared
 Virtual Addressing)
To: Fenghua Yu <fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 H Peter Anvin <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan
 <ajd@linux.ibm.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Dave Hansen <dave.hansen@intel.com>,
 Tony Luck <tony.luck@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Jacob Jun Pan <jacob.jun.pan@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Yu-cheng Yu <yu-cheng.yu@intel.com>, Sohil Mehta <sohil.mehta@intel.com>,
 Ravi V Shankar <ravi.v.shankar@intel.com>
References: <1592008893-9388-1-git-send-email-fenghua.yu@intel.com>
 <1592008893-9388-5-git-send-email-fenghua.yu@intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <9d1bd13c-0e0d-bead-f9a8-9422996a33f8@linux.intel.com>
Date: Sat, 13 Jun 2020 20:17:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <1592008893-9388-5-git-send-email-fenghua.yu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 13 Jun 2020 22:49:02 +1000
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
Cc: x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>, iommu@lists.linux-foundation.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Fenghua,

On 2020/6/13 8:41, Fenghua Yu wrote:
> From: Ashok Raj <ashok.raj@intel.com>
> 
> ENQCMD and Data Streaming Accelerator (DSA) and all of their associated
> features are a complicated stack with lots of interconnected pieces.
> This documentation provides a big picture overview for all of the
> features.
> 
> Signed-off-by: Ashok Raj <ashok.raj@intel.com>
> Co-developed-by: Fenghua Yu <fenghua.yu@intel.com>
> Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> ---
> v2:
> - Fix the doc format and add the doc in toctree (Thomas)
> - Modify the doc for better description (Thomas, Tony, Dave)
> 
>   Documentation/x86/index.rst |   1 +
>   Documentation/x86/sva.rst   | 287 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 288 insertions(+)
>   create mode 100644 Documentation/x86/sva.rst
> 
> diff --git a/Documentation/x86/index.rst b/Documentation/x86/index.rst
> index 265d9e9a093b..e5d5ff096685 100644
> --- a/Documentation/x86/index.rst
> +++ b/Documentation/x86/index.rst
> @@ -30,3 +30,4 @@ x86-specific Documentation
>      usb-legacy-support
>      i386/index
>      x86_64/index
> +   sva
> diff --git a/Documentation/x86/sva.rst b/Documentation/x86/sva.rst
> new file mode 100644
> index 000000000000..1e52208c7dda
> --- /dev/null
> +++ b/Documentation/x86/sva.rst
> @@ -0,0 +1,287 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===========================================
> +Shared Virtual Addressing (SVA) with ENQCMD
> +===========================================
> +
> +Background
> +==========
> +
> +Shared Virtual Addressing (SVA) allows the processor and device to use the
> +same virtual addresses avoiding the need for software to translate virtual
> +addresses to physical addresses. SVA is what PCIe calls Shared Virtual
> +Memory (SVM)
> +
> +In addition to the convenience of using application virtual addresses
> +by the device, it also doesn't require pinning pages for DMA.
> +PCIe Address Translation Services (ATS) along with Page Request Interface
> +(PRI) allow devices to function much the same way as the CPU handling
> +application page-faults. For more information please refer to PCIe
> +specification Chapter 10: ATS Specification.
> +
> +Use of SVA requires IOMMU support in the platform. IOMMU also is required
> +to support PCIe features ATS and PRI. ATS allows devices to cache
> +translations for the virtual address. IOMMU driver uses the mmu_notifier()
> +support to keep the device tlb cache and the CPU cache in sync. PRI allows
> +the device to request paging the virtual address before using if they are
> +not paged in the CPU page tables.
> +
> +
> +Shared Hardware Workqueues
> +==========================
> +
> +Unlike Single Root I/O Virtualization (SRIOV), Scalable IOV (SIOV) permits
> +the use of Shared Work Queues (SWQ) by both applications and Virtual
> +Machines (VM's). This allows better hardware utilization vs. hard
> +partitioning resources that could result in under utilization. In order to
> +allow the hardware to distinguish the context for which work is being
> +executed in the hardware by SWQ interface, SIOV uses Process Address Space
> +ID (PASID), which is a 20bit number defined by the PCIe SIG.
> +
> +PASID value is encoded in all transactions from the device. This allows the
> +IOMMU to track I/O on a per-PASID granularity in addition to using the PCIe
> +Resource Identifier (RID) which is the Bus/Device/Function.
> +
> +
> +ENQCMD
> +======
> +
> +ENQCMD is a new instruction on Intel platforms that atomically submits a
> +work descriptor to a device. The descriptor includes the operation to be
> +performed, virtual addresses of all parameters, virtual address of a completion
> +record, and the PASID (process address space ID) of the current process.
> +
> +ENQCMD works with non-posted semantics and carries a status back if the
> +command was accepted by hardware. This allows the submitter to know if the
> +submission needs to be retried or other device specific mechanisms to
> +implement implement fairness or ensure forward progress can be made.

Repeated "implement".

> +
> +ENQCMD is the glue that ensures applications can directly submit commands
> +to the hardware and also permit hardware to be aware of application context
> +to perform I/O operations via use of PASID.
> +
> +Process Address Space Tagging
> +=============================
> +
> +A new thread scoped MSR (IA32_PASID) provides the connection between
> +user processes and the rest of the hardware. When an application first
> +accesses an SVA capable device this MSR is initialized with a newly
> +allocated PASID. The driver for the device calls an IOMMU specific api
> +that sets up the routing for DMA and page-requests.
> +
> +For example, the Intel Data Streaming Accelerator (DSA) uses
> +intel_svm_bind_mm(), which will do the following.

The Intel SVM APIs have been deprecated. Drivers should use
iommu_sva_bind_device() instead. Please also update other places in
this document.

> +
> +- Allocate the PASID, and program the process page-table (cr3) in the PASID
> +  context entries.
> +- Register for mmu_notifier() to track any page-table invalidations to keep
> +  the device tlb in sync. For example, when a page-table entry is invalidated,
> +  IOMMU propagates the invalidation to device tlb. This will force any
> +  future access by the device to this virtual address to participate in
> +  ATS. If the IOMMU responds with proper response that a page is not
> +  present, the device would request the page to be paged in via the PCIe PRI
> +  protocol before performing I/O.
> +
> +This MSR is managed with the XSAVE feature set as "supervisor state" to
> +ensure the MSR is updated during context switch.
> +
> +PASID Management
> +================
> +
> +The kernel must allocate a PASID on behalf of each process and program it
> +into the new MSR to communicate the process identity to platform hardware.
> +ENQCMD uses the PASID stored in this MSR to tag requests from this process.
> +When a user submits a work descriptor to a device using the ENQCMD
> +instruction, the PASID field in the descriptor is auto-filled with the
> +value from MSR_IA32_PASID. Requests for DMA from the device are also tagged
> +with the same PASID. The platform IOMMU uses the PASID in the transaction to
> +perform address translation. The IOMMU api's setup the corresponding PASID
> +entry in IOMMU with the process address used by the CPU (for e.g cr3 in x86).
> +
> +The MSR must be configured on each logical CPU before any application
> +thread can interact with a device. Threads that belong to the same
> +process share the same page tables, thus the same MSR value.
> +
> +PASID is cleared when a process is created. The PASID allocation and MSR
> +programming may occur long after a process and its threads have been created.
> +One thread must call bind() to allocate the PASID for the process. If a
> +thread uses ENQCMD without the MSR first being populated, it will cause #GP.
> +The kernel will fix up the #GP by writing the process-wide PASID into the
> +thread that took the #GP. A single process PASID can be used simultaneously
> +with multiple devices since they all share the same address space.
> +
> +New threads could inherit the MSR value from the parent. But this would
> +involve additional state management for those threads which may never use
> +ENQCMD. Clearing the MSR at thread creation permits all threads to have a
> +consistent behavior; the PASID is only programmed when the thread calls
> +the bind() api (intel_svm_bind_mm()()), or when a thread calls ENQCMD for
> +the first time.
> +
> +PASID Lifecycle Management
> +==========================
> +
> +Only processes that access SVA capable devices need to have a PASID
> +allocated. This allocation happens when a process first opens an SVA
> +capable device (subsequent opens of the same, or other devices will
> +share the same PASID).
> +
> +Although the PASID is allocated to the process by opening a device,
> +it is not active in any of the threads of that process. Activation is
> +done lazily when a thread tries to submit a work descriptor to a device
> +using the ENQCMD.
> +
> +That first access will trigger a #GP fault because the IA32_PASID MSR
> +has not been initialized with the PASID value assigned to the process
> +when the device was opened. The Linux #GP handler notes that a PASID as
> +been allocated for the process, and so initializes the IA32_PASID MSR
> +and returns so that the ENQCMD instruction is re-executed.
> +
> +On fork(2) or exec(2) the PASID is removed from the process as it no
> +longer has the same address space that it had when the device was opened.
> +
> +On clone(2) the new task shares the same address space, so will be
> +able to use the PASID allocated to the process. The IA32_PASID is not
> +preemptively initialized as the kernel does not know whether this thread
> +is going to access the device.
> +
> +On exit(2) the PASID is freed. The device driver ensures that any pending
> +operations queued to the device are either completed or aborted before
> +allowing the PASID to be re-allocated.

reallocated

> +
> +Relationships
> +=============
> +
> + * Each process has many threads, but only one PASID
> + * Devices have a limited number (~10's to 1000's) of hardware
> +   workqueues and each portal maps down to a single workqueue.
> +   The device driver manages allocating hardware workqueues.
> + * A single mmap() maps a single hardware workqueue as a "portal"
> + * For each device with which a process interacts, there must be
> +   one or more mmap()'d portals.
> + * Many threads within a process can share a single portal to access
> +   a single device.
> + * Multiple processes can separately mmap() the same portal, in
> +   which case they still share one device hardware workqueue.
> + * The single process-wide PASID is used by all threads to interact
> +   with all devices.  There is not, for instance, a PASID for each
> +   thread or each thread<->device pair.
> +
> +FAQ
> +===
> +
> +* What is SVA/SVM?
> +
> +Shared Virtual Addressing (SVA) permits I/O hardware and the processor to
> +work in the same address space. In short, sharing the address space. Some
> +call it Shared Virtual Memory (SVM), but Linux community wanted to avoid
> +it with Posix Shared Memory and Secure Virtual Machines which were terms
> +already in circulation.
> +
> +* What is a PASID?
> +
> +A Process Address Space ID (PASID) is a PCIe-defined TLP Prefix. A PASID is
> +a 20 bit number allocated and managed by the OS. PASID is included in all
> +transactions between the platform and the device.
> +
> +* How are shared work queues different?
> +
> +Traditionally to allow user space applications interact with hardware,
> +there is a separate instance required per process. For example, consider
> +doorbells as a mechanism of informing hardware about work to process. Each
> +doorbell is required to be spaced 4k (or page-size) apart for process
> +isolation. This requires hardware to provision that space and reserve in
> +MMIO. This doesn't scale as the number of threads becomes quite large. The
> +hardware also manages the queue depth for Shared Work Queues (SWQ), and
> +consumers don't need to track queue depth. If there is no space to accept
> +a command, the device will return an error indicating retry. Also
> +submitting a command to an MMIO address that can't accept ENQCMD will
> +return retry in response. In the new DMWr PCIe terminology, devices need to
> +support DMWr completer capability. In addition it requires all switch ports
> +to support DMWr routing and must be enabled by the PCIe subsystem, much
> +like how PCIe Atomics() are managed for instance.
> +
> +SWQ allows hardware to provision just a single address in the device. When
> +used with ENQCMD to submit work, the device can distinguish the process
> +submitting the work since it will include the PASID assigned to that
> +process. This decreases the pressure of hardware requiring to support
> +hardware to scale to a large number of processes.
> +
> +* Is this the same as a user space device driver?
> +
> +Communicating with the device via the shared work queue is much simpler
> +than a full blown user space driver. The kernel driver does all the
> +initialization of the hardware. User space only needs to worry about
> +submitting work and processing completions.
> +
> +* Is this the same as SR-IOV?
> +
> +Single Root I/O Virtualization (SR-IOV) focuses on providing independent
> +hardware interfaces for virtualizing hardware. Hence its required to be
> +almost fully functional interface to software supporting the traditional
> +BAR's, space for interrupts via MSI-x, its own register layout.
> +Virtual Functions (VFs) are assisted by the Physical Function (PF)
> +driver.
> +
> +Scalable I/O Virtualization builds on the PASID concept to create device
> +instances for virtualization. SIOV requires host software to assist in
> +creating virtual devices, each virtual device is represented by a PASID
> +along with the BDF of the device.  This allows device hardware to optimize
> +device resource creation and can grow dynamically on demand. SR-IOV creation
> +and management is very static in nature. Consult references below for more
> +details.
> +
> +* Why not just create a virtual function for each app?
> +
> +Creating PCIe SRIOV type virtual functions (VF) are expensive. They create
> +duplicated hardware for PCI config space requirements, Interrupts such as
> +MSIx for instance. Resources such as interrupts have to be hard partitioned
> +between VF's at creation time, and cannot scale dynamically on demand. The
> +VF's are not completely independent from the Physical function (PF). Most
> +VF's require some communication and assistance from the PF driver. SIOV
> +creates a software defined device. Where all the configuration and control
> +aspects are mediated via the slow path. The work submission and completion
> +happen without any mediation.
> +
> +* Does this support virtualization?
> +
> +ENQCMD can be used from within a guest VM. In these cases the VMM helps
> +with setting up a translation table to translate from Guest PASID to Host
> +PASID. Please consult the ENQCMD instruction set reference for more
> +details.
> +
> +* Does memory need to be pinned?
> +
> +When devices support SVA, along with platform hardware such as IOMMU
> +supporting such devices, there is no need to pin memory for DMA purposes.
> +Devices that support SVA also support other PCIe features that remove the
> +pinning requirement for memory.
> +
> +Device TLB support - Device requests the IOMMU to lookup an address before
> +use via Address Translation Service (ATS) requests.  If the mapping exists
> +but there is no page allocated by the OS, IOMMU hardware returns that no
> +mapping exists.
> +
> +Device requests that virtual address to be mapped via Page Request
> +Interface (PRI). Once the OS has successfully completed  the mapping, it
> +returns the response back to the device. The device continues again to
> +request for a translation and continues.
> +
> +IOMMU works with the OS in managing consistency of page-tables with the
> +device. When removing pages, it interacts with the device to remove any
> +device-tlb that might have been cached before removing the mappings from
> +the OS.
> +
> +References
> +==========
> +
> +VT-D:
> +https://01.org/blogs/ashokraj/2018/recent-enhancements-intel-virtualization-technology-directed-i/o-intel-vt-d
> +
> +SIOV:
> +https://01.org/blogs/2019/assignable-interfaces-intel-scalable-i/o-virtualization-linux
> +
> +ENQCMD in ISE:
> +https://software.intel.com/sites/default/files/managed/c5/15/architecture-instruction-set-extensions-programming-reference.pdf
> +
> +DSA spec:
> +https://software.intel.com/sites/default/files/341204-intel-data-streaming-accelerator-spec.pdf
> 

Best regards,
baolu
