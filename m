Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6458987A71
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 14:48:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464lQR5rgmzDqPy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 22:47:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464lMr21pgzDqNk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2019 22:45:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 464lMr11jyz9sND; Fri,  9 Aug 2019 22:45:44 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 464lMq5djyz9sBF;
 Fri,  9 Aug 2019 22:45:43 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Claudio Carvalho <cclaudio@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v5 1/7] Documentation/powerpc: Ultravisor API
In-Reply-To: <20190808040555.2371-2-cclaudio@linux.ibm.com>
References: <20190808040555.2371-1-cclaudio@linux.ibm.com>
 <20190808040555.2371-2-cclaudio@linux.ibm.com>
Date: Fri, 09 Aug 2019 22:45:43 +1000
Message-ID: <87v9v6se14.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, Ryan Grimm <grimm@linux.ibm.com>,
 Ram Pai <linuxram@linux.ibm.com>, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Guerney Hunt <gdhh@linux.ibm.com>, Thiago Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Claudio Carvalho <cclaudio@linux.ibm.com> writes:
> From: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
>
> POWER9 processor includes support for Protected Execution Facility (PEF).

Which POWER9? Please be more precise.

It's public knowledge that some versions of Power9 don't have PEF (or
have it broken / fused off).

People are going to try and test this on various chip revisions that are
out in the wild, we need to make it clear where it's expected to work
and where it's not.

> Attached documentation provides an overview of PEF and defines the API
> for various interfaces that must be implemented in the Ultravisor
> firmware as well as in the KVM Hypervisor.
>
> Based on input from Mike Anderson, Thiago Bauermann, Claudio Carvalho,
> Ben Herrenschmidt, Guerney Hunt, Paul Mackerras.
>
> Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> Signed-off-by: Ram Pai <linuxram@linux.ibm.com>
> Signed-off-by: Guerney Hunt <gdhh@linux.ibm.com>
> Reviewed-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> Reviewed-by: Michael Anderson <andmike@linux.ibm.com>
> Reviewed-by: Thiago Bauermann <bauerman@linux.ibm.com>
> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> ---
>  Documentation/powerpc/ultravisor.rst | 1055 ++++++++++++++++++++++++++
>  1 file changed, 1055 insertions(+)
>  create mode 100644 Documentation/powerpc/ultravisor.rst
>
> diff --git a/Documentation/powerpc/ultravisor.rst b/Documentation/powerpc=
/ultravisor.rst
> new file mode 100644
> index 000000000000..8d5246585b66
> --- /dev/null
> +++ b/Documentation/powerpc/ultravisor.rst
> @@ -0,0 +1,1055 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +=EF=BB=BF.. _ultravisor:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +Protected Execution Facility
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +.. contents::
> +    :depth: 3
> +
> +.. sectnum::
> +    :depth: 3
> +
> +Protected Execution Facility
> +############################
> +
> +    Protected Execution Facility (PEF) is an architectural change for
> +    POWER 9 that enables Secure Virtual Machines (SVMs). When enabled,

Ditto here.

Also you don't mention which ISA version PEF is (will be) documented in.
Do we know? Or can we at least reference the RFC number so folks can
find it.

Otherwise this looks really good. I'll try and find time to proof read
it thoroughly.

cheers

> +    PEF adds a new higher privileged mode, called Ultravisor mode, to
> +    POWER architecture. Along with the new mode there is new firmware
> +    called the Protected Execution Ultravisor (or Ultravisor for short).
> +    Ultravisor mode is the highest privileged mode in POWER architecture.
> +
> +	+------------------+
> +	| Privilege States |
> +	+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +	|  Problem         |
> +	+------------------+
> +	|  Supervisor      |
> +	+------------------+
> +	|  Hypervisor      |
> +	+------------------+
> +	|  Ultravisor      |
> +	+------------------+
> +
> +    PEF protects SVMs from the hypervisor, privileged users, and other
> +    VMs in the system. SVMs are protected while at rest and can only be
> +    executed by an authorized machine. All virtual machines utilize
> +    hypervisor services. The Ultravisor filters calls between the SVMs
> +    and the hypervisor to assure that information does not accidentally
> +    leak. All hypercalls except H_RANDOM are reflected to the hypervisor.
> +    H_RANDOM is not reflected to prevent the hypervisor from influencing
> +    random values in the SVM.
> +
> +    To support this there is a refactoring of the ownership of resources
> +    in the CPU. Some of the resources which were previously hypervisor
> +    privileged are now ultravisor privileged.
> +
> +Hardware
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +    The hardware changes include the following:
> +
> +    * There is a new bit in the MSR that determines whether the current
> +      process is running in secure mode, MSR(S) bit 41. MSR(S)=3D1, proc=
ess
> +      is in secure mode, MSR(s)=3D0 process is in normal mode.
> +
> +    * The MSR(S) bit can only be set by the Ultravisor.
> +
> +    * HRFID cannot be used to set the MSR(S) bit. If the hypervisor needs
> +      to return to a SVM it must use an ultracall. It can determine if
> +      the VM it is returning to is secure.
> +
> +    * There is a new Ultravisor privileged register, SMFCTRL, which has =
an
> +      enable/disable bit SMFCTRL(E).
> +
> +    * The privilege of a process is now determined by three MSR bits,
> +      MSR(S, HV, PR). In each of the tables below the modes are listed
> +      from least privilege to highest privilege. The higher privilege
> +      modes can access all the resources of the lower privilege modes.
> +
> +      **Secure Mode MSR Settings**
> +
> +      +---+---+---+---------------+
> +      | S | HV| PR|Privilege      |
> +      +=3D=3D=3D+=3D=3D=3D+=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+
> +      | 1 | 0 | 1 | Problem       |
> +      +---+---+---+---------------+
> +      | 1 | 0 | 0 | Privileged(OS)|
> +      +---+---+---+---------------+
> +      | 1 | 1 | 0 | Ultravisor    |
> +      +---+---+---+---------------+
> +      | 1 | 1 | 1 | Reserved      |
> +      +---+---+---+---------------+
> +
> +      **Normal Mode MSR Settings**
> +
> +      +---+---+---+---------------+
> +      | S | HV| PR|Privilege      |
> +      +=3D=3D=3D+=3D=3D=3D+=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+
> +      | 0 | 0 | 1 | Problem       |
> +      +---+---+---+---------------+
> +      | 0 | 0 | 0 | Privileged(OS)|
> +      +---+---+---+---------------+
> +      | 0 | 1 | 0 | Hypervisor    |
> +      +---+---+---+---------------+
> +      | 0 | 1 | 1 | Problem (HV)  |
> +      +---+---+---+---------------+
> +
> +    * Memory is partitioned into secure and normal memory. Only processes
> +      that are running in secure mode can access secure memory.
> +
> +    * The hardware does not allow anything that is not running secure to
> +      access secure memory. This means that the Hypervisor cannot access
> +      the memory of the SVM without using an ultracall (asking the
> +      Ultravisor). The Ultravisor will only allow the hypervisor to see
> +      the SVM memory encrypted.
> +
> +    * I/O systems are not allowed to directly address secure memory. This
> +      limits the SVMs to virtual I/O only.
> +
> +    * The architecture allows the SVM to share pages of memory with the
> +      hypervisor that are not protected with encryption. However, this
> +      sharing must be initiated by the SVM.
> +
> +    * When a process is running in secure mode all hypercalls
> +      (syscall lev=3D1) are reflected to the Ultravisor.
> +
> +    * When a process is in secure mode all interrupts go to the
> +      Ultravisor.
> +
> +    * The following resources have become Ultravisor privileged and
> +      require an Ultravisor interface to manipulate:
> +
> +      * Processor configurations registers (SCOMs).
> +
> +      * Stop state information.
> +
> +      * The debug registers CIABR, DAWR, and DAWRX become Ultravisor
> +        resources when SMFCTRL(D) is set. If SMFCTRL(D) is not set they =
do
> +        not work in secure mode. When set, reading and writing requires
> +        an Ultravisor call, otherwise that will cause a Hypervisor Emula=
tion
> +        Assistance interrupt.
> +
> +      * PTCR and partition table entries (partition table is in secure
> +        memory). An attempt to write to PTCR will cause a Hypervisor
> +        Emulation Assitance interrupt.
> +
> +      * LDBAR (LD Base Address Register) and IMC (In-Memory Collection)
> +        non-architected registers. An attempt to write to them will caus=
e a
> +        Hypervisor Emulation Assistance interrupt.
> +
> +      * Paging for an SVM, sharing of memory with Hypervisor for an SVM.
> +        (Including Virtual Processor Area (VPA) and virtual I/O).
> +
> +
> +Software/Microcode
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +    The software changes include:
> +
> +    * SVMs are created from normal VM using (open source) tooling suppli=
ed
> +      by IBM.
> +
> +    * All SVMs start as normal VMs and utilize an ultracall, UV_ESM
> +      (Enter Secure Mode), to make the transition.
> +
> +    * When the UV_ESM ultracall is made the Ultravisor copies the VM into
> +      secure memory, decrypts the verification information, and checks t=
he
> +      integrity of the SVM. If the integrity check passes the Ultravisor
> +      passes control in secure mode.
> +
> +    * For external interrupts the Ultravisor saves the state of the SVM,
> +      and reflects the interrupt to the hypervisor for processing.
> +      For hypercalls, the Ultravisor inserts neutral state into all
> +      registers not needed for the hypercall then reflects the call to
> +      the hypervisor for processing. The H_RANDOM hypercall is performed
> +      by the Ultravisor and not reflected.
> +
> +    * The verification information includes the pass phrase for the
> +      encrypted disk associated with the SVM. This pass phrase is given
> +      to the SVM when requested.
> +
> +    * The Ultravisor is not involved in protecting the encrypted disk of
> +      the SVM while at rest.
> +
> +    * For virtual I/O to work bounce buffering must be done.
> +
> +    * The Ultravisor uses AES (IAPM) for protection of SVM memory. IAPM
> +      is a mode of AES that provides integrity and secrecy concurrently.
> +
> +    * The movement of data between normal and secure pages is coordinated
> +      with the Ultravisor by a new HMM plug-in in the Hypervisor.
> +
> +    The Ultravisor offers new services to the hypervisor and SVMs. These
> +    are accessed through ultracalls.
> +
> +Terminology
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +    * Hypercalls: special system calls used to request services from
> +      Hypervisor.
> +
> +    * Normal memory: Memory that is accessible to Hypervisor.
> +
> +    * Normal page: Page backed by normal memory and available to
> +      Hypervisor.
> +
> +    * Shared page: A page backed by normal memory and available to both
> +      the Hypervisor/QEMU and the SVM (i.e page has mappings in SVM and
> +      Hypervisor/QEMU).
> +
> +    * Secure memory: Memory that is accessible only to Ultravisor and
> +      SVMs.
> +
> +    * Secure page: Page backed by secure memory and only available to
> +      Ultravisor and SVM.
> +
> +    * SVM: Secure Virtual Machine.
> +
> +    * Ultracalls: special system calls used to request services from
> +      Ultravisor.
> +
> +
> +Ultravisor calls API
> +####################
> +
> +    This section describes Ultravisor calls (ultracalls) needed to
> +    support Secure Virtual Machines (SVM)s and Paravirtalized KVM. The
> +    ultracalls allow the SVMs and Hypervisor to request services from the
> +    Ultravisor such as accessing a register or memory region that can on=
ly
> +    be accessed when running in Ultravisor-privileged mode.
> +
> +    The specific service needed from an ultracall is specified in regist=
er
> +    R3 (the first parameter to the ultracall). Other parameters to the
> +    ultracall, if any, are specified in registers R4 through R12.
> +
> +    Return value of all ultracalls is in register R3. Other output values
> +    from the ultracall, if any, are returned in registers R4 through R12.
> +    The only exception to this register usage is the ``UV_RETURN``
> +    ultracall described below.
> +
> +    Each ultracall returns specific error codes, applicable in the conte=
xt
> +    of the ultracall. However, like with the PowerPC Architecture Platfo=
rm
> +    Reference (PAPR), if no specific error code is defined for a
> +    particular situation, then the ultracall will fallback to an erroneo=
us
> +    parameter-position based code. i.e U_PARAMETER, U_P2, U_P3 etc
> +    depending on the ultracall parameter that may have caused the error.
> +
> +    Some ultracalls involve transferring a page of data between Ultravis=
or
> +    and Hypervisor.  Secure pages that are transferred from secure memory
> +    to normal memory may be encrypted using dynamically generated keys.
> +    When the secure pages are transferred back to secure memory, they may
> +    be decrypted using the same dynamically generated keys. Generation a=
nd
> +    management of these keys will be covered in a separate document.
> +
> +    For now this only covers ultracalls currently implemented and being
> +    used by Hypervisor and SVMs but others can be added here when it
> +    makes sense.
> +
> +    The full specification for all hypercalls/ultracalls will eventually
> +    be made available in the public/OpenPower version of the PAPR
> +    specification.
> +
> +    **Note**
> +
> +    If PEF is not enabled, the ultracalls will be redirected to the
> +    Hypervisor which must handle/fail the calls.
> +
> +Ultracalls used by Hypervisor
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +    This section describes the virtual memory management ultracalls used
> +    by the Hypervisor to manage SVMs.
> +
> +UV_PAGE_OUT
> +-----------
> +
> +    Encrypt and move the contents of a page from secure memory to normal
> +    memory.
> +
> +Syntax
> +~~~~~~
> +
> +.. code-block:: c
> +
> +	uint64_t ultracall(const uint64_t UV_PAGE_OUT,
> +		uint16_t lpid,		/* LPAR ID */
> +		uint64_t dest_ra,	/* real address of destination page */
> +		uint64_t src_gpa,	/* source guest-physical-address */
> +		uint8_t  flags,		/* flags */
> +		uint64_t order)		/* page size order */
> +
> +Return values
> +~~~~~~~~~~~~~
> +
> +    One of the following values:
> +
> +	* U_SUCCESS	on success.
> +	* U_PARAMETER	if ``lpid`` is invalid.
> +	* U_P2 		if ``dest_ra`` is invalid.
> +	* U_P3		if the ``src_gpa`` address is invalid.
> +	* U_P4		if any bit in the ``flags`` is unrecognized
> +	* U_P5		if the ``order`` parameter is unsupported.
> +	* U_FUNCTION	if functionality is not supported.
> +	* U_BUSY	if page cannot be currently paged-out.
> +
> +Description
> +~~~~~~~~~~~
> +
> +    Encrypt the contents of a secure-page and make it available to
> +    Hypervisor in a normal page.
> +
> +    By default, the source page is unmapped from the SVM's partition-
> +    scoped page table. But the Hypervisor can provide a hint to the
> +    Ultravisor to retain the page mapping by setting the ``UV_SNAPSHOT``
> +    flag in ``flags`` parameter.
> +
> +    If the source page is already a shared page the call returns
> +    U_SUCCESS, without doing anything.
> +
> +Use cases
> +~~~~~~~~~
> +
> +    #. QEMU attempts to access an address belonging to the SVM but the
> +       page frame for that address is not mapped into QEMU's address
> +       space. In this case, the Hypervisor will allocate a page frame,
> +       map it into QEMU's address space and issue the ``UV_PAGE_OUT``
> +       call to retrieve the encrypted contents of the page.
> +
> +    #. When Ultravisor runs low on secure memory and it needs to page-out
> +       an LRU page. In this case, Ultravisor will issue the
> +       ``H_SVM_PAGE_OUT`` hypercall to the Hypervisor. The Hypervisor wi=
ll
> +       then allocate a normal page and issue the ``UV_PAGE_OUT`` ultraca=
ll
> +       and the Ultravisor will encrypt and move the contents of the secu=
re
> +       page into the normal page.
> +
> +
> +UV_PAGE_IN
> +----------
> +
> +    Move the contents of a page from normal memory to secure memory.
> +
> +Syntax
> +~~~~~~
> +
> +.. code-block:: c
> +
> +	uint64_t ultracall(const uint64_t UV_PAGE_IN,
> +		uint16_t lpid,		/* the LPAR ID */
> +		uint64_t src_ra,	/* source real address of page */
> +		uint64_t dest_gpa,	/* destination guest physical address */
> +		uint64_t flags,		/* flags */
> +		uint64_t order)		/* page size order */
> +
> +Return values
> +~~~~~~~~~~~~~
> +
> +    One of the following values:
> +
> +	* U_SUCCESS	on success.
> +	* U_BUSY	if page cannot be currently paged-in.
> +	* U_FUNCTION	if functionality is not supported
> +	* U_PARAMETER	if ``lpid`` is invalid.
> +	* U_P2 		if ``src_ra`` is invalid.
> +	* U_P3		if the ``dest_gpa`` address is invalid.
> +	* U_P4		if any bit in the ``flags`` is unrecognized
> +	* U_P5		if the ``order`` parameter is unsupported.
> +
> +Description
> +~~~~~~~~~~~
> +
> +    Move the contents of the page identified by ``src_ra`` from normal
> +    memory to secure memory and map it to the guest physical address
> +    ``dest_gpa``.
> +
> +    If `dest_gpa` refers to a shared address, map the page into the
> +    partition-scoped page-table of the SVM.  If `dest_gpa` is not shared,
> +    copy the contents of the page into the corresponding secure page.
> +    Depending on the context, decrypt the page before being copied.
> +
> +    The caller provides the attributes of the page through the ``flags``
> +    parameter. Valid values for ``flags`` are:
> +
> +	* CACHE_INHIBITED
> +	* CACHE_ENABLED
> +	* WRITE_PROTECTION
> +
> +    The Hypervisor must pin the page in memory before making
> +    ``UV_PAGE_IN`` ultracall.
> +
> +Use cases
> +~~~~~~~~~
> +
> +    #. When a normal VM switches to secure mode, all its pages residing
> +       in normal memory, are moved into secure memory.
> +
> +    #. When an SVM requests to share a page with Hypervisor the Hypervis=
or
> +       allocates a page and informs the Ultravisor.
> +
> +    #. When an SVM accesses a secure page that has been paged-out,
> +       Ultravisor invokes the Hypervisor to locate the page. After
> +       locating the page, the Hypervisor uses UV_PAGE_IN to make the
> +       page available to Ultravisor.
> +
> +    #. When Hypervisor accesses SVM data, the Hypervisor requests the
> +       Ultravisor to transfer the corresponding page into a insecure pag=
e,
> +       which the Hypervisor can access. The data in the normal page will
> +       be encrypted though.
> +
> +UV_PAGE_INVAL
> +-------------
> +
> +    Invalidate the Ultravisor mapping of a page.
> +
> +Syntax
> +~~~~~~
> +
> +.. code-block:: c
> +
> +	uint64_t ultracall(const uint64_t UV_PAGE_INVAL,
> +		uint16_t lpid,		/* the LPAR ID */
> +		uint64_t guest_pa,	/* destination guest-physical-address */
> +		uint64_t order)		/* page size order */
> +
> +Return values
> +~~~~~~~~~~~~~
> +
> +    One of the following values:
> +
> +	* U_SUCCESS	on success.
> +	* U_PARAMETER	if ``lpid`` is invalid.
> +	* U_P2 		if ``guest_pa`` is invalid (or corresponds to a secure
> +                        page mapping).
> +	* U_P3		if the ``order`` is invalid.
> +	* U_FUNCTION	if functionality is not supported.
> +	* U_BUSY	if page cannot be currently invalidated.
> +
> +Description
> +~~~~~~~~~~~
> +
> +    This ultracall informs Ultravisor that the page mapping in Hypervisor
> +    corresponding to the given guest physical address has been invalidat=
ed
> +    and that the Ultravisor should not access the page. If the specified
> +    ``guest_pa`` corresponds to a secure page, Ultravisor will ignore the
> +    attempt to invalidate the page and return U_P2.
> +
> +Use cases
> +~~~~~~~~~
> +
> +    #. When a shared page is unmapped from the QEMU's page table, possib=
ly
> +       because it is paged-out to disk, Ultravisor needs to know that the
> +       page should not be accessed from its side too.
> +
> +
> +UV_WRITE_PATE
> +-------------
> +
> +    Validate and write the partition table entry (PATE) for a given
> +    partition.
> +
> +Syntax
> +~~~~~~
> +
> +.. code-block:: c
> +
> +	uint64_t ultracall(const uint64_t UV_WRITE_PATE,
> +		uint32_t lpid,		/* the LPAR ID */
> +		uint64_t dw0		/* the first double word to write */
> +		uint64_t dw1)		/* the second double word to write */
> +
> +Return values
> +~~~~~~~~~~~~~
> +
> +    One of the following values:
> +
> +	* U_SUCCESS	on success.
> +	* U_BUSY	if PATE cannot be currently written to.
> +	* U_FUNCTION	if functionality is not supported.
> +	* U_PARAMETER	if ``lpid`` is invalid.
> +	* U_P2 		if ``dw0`` is invalid.
> +	* U_P3		if the ``dw1`` address is invalid.
> +	* U_PERMISSION	if the Hypervisor is attempting to change the PATE
> +			of a secure virtual machine or if called from a
> +			context other than Hypervisor.
> +
> +Description
> +~~~~~~~~~~~
> +
> +    Validate and write a LPID and its partition-table-entry for the given
> +    LPID.  If the LPID is already allocated and initialized, this call
> +    results in changing the partition table entry.
> +
> +Use cases
> +~~~~~~~~~
> +
> +    #. The Partition table resides in Secure memory and its entries,
> +       called PATE (Partition Table Entries), point to the partition-
> +       scoped page tables for the Hypervisor as well as each of the
> +       virtual machines (both secure and normal). The Hypervisor
> +       operates in partition 0 and its partition-scoped page tables
> +       reside in normal memory.
> +
> +    #. This ultracall allows the Hypervisor to register the partition-
> +       scoped and process-scoped page table entries for the Hypervisor
> +       and other partitions (virtual machines) with the Ultravisor.
> +
> +    #. If the value of the PATE for an existing partition (VM) changes,
> +       the TLB cache for the partition is flushed.
> +
> +    #. The Hypervisor is responsible for allocating LPID. The LPID and
> +       its PATE entry are registered together.  The Hypervisor manages
> +       the PATE entries for a normal VM and can change the PATE entry
> +       anytime. Ultravisor manages the PATE entries for an SVM and
> +       Hypervisor is not allowed to modify them.
> +
> +UV_RETURN
> +---------
> +
> +    Return control from the Hypervisor back to the Ultravisor after
> +    processing an hypercall or interrupt that was forwarded (aka
> +    *reflected*) to the Hypervisor.
> +
> +Syntax
> +~~~~~~
> +
> +.. code-block:: c
> +
> +	uint64_t ultracall(const uint64_t UV_RETURN)
> +
> +Return values
> +~~~~~~~~~~~~~
> +
> +     This call never returns to Hypervisor on success.  It returns
> +     U_INVALID if ultracall is not made from a Hypervisor context.
> +
> +Description
> +~~~~~~~~~~~
> +
> +    When an SVM makes an hypercall or incurs some other exception, the
> +    Ultravisor usually forwards (aka *reflects*) the exceptions to the
> +    Hypervisor.  After processing the exception, Hypervisor uses the
> +    ``UV_RETURN`` ultracall to return control back to the SVM.
> +
> +    The expected register state on entry to this ultracall is:
> +
> +    * Non-volatile registers are restored to their original values.
> +    * If returning from an hypercall, register R0 contains the return
> +      value (**unlike other ultracalls**) and, registers R4 through R12
> +      contain any output values of the hypercall.
> +    * R3 contains the ultracall number, i.e UV_RETURN.
> +    * If returning with a synthesized interrupt, R2 contains the
> +      synthesized interrupt number.
> +
> +Use cases
> +~~~~~~~~~
> +
> +    #. Ultravisor relies on the Hypervisor to provide several services to
> +       the SVM such as processing hypercall and other exceptions. After
> +       processing the exception, Hypervisor uses UV_RETURN to return
> +       control back to the Ultravisor.
> +
> +    #. Hypervisor has to use this ultracall to return control to the SVM.
> +
> +
> +UV_REGISTER_MEM_SLOT
> +--------------------
> +
> +    Register an SVM address-range with specified properties.
> +
> +Syntax
> +~~~~~~
> +
> +.. code-block:: c
> +
> +	uint64_t ultracall(const uint64_t UV_REGISTER_MEM_SLOT,
> +		uint64_t lpid,		/* LPAR ID of the SVM */
> +		uint64_t start_gpa,	/* start guest physical address */
> +		uint64_t size,		/* size of address range in bytes */
> +		uint64_t flags		/* reserved for future expansion */
> +		uint16_t slotid)	/* slot identifier */
> +
> +Return values
> +~~~~~~~~~~~~~
> +
> +    One of the following values:
> +
> +	* U_SUCCESS	on success.
> +	* U_PARAMETER	if ``lpid`` is invalid.
> +	* U_P2 		if ``start_gpa`` is invalid.
> +	* U_P3		if ``size`` is invalid.
> +	* U_P4		if any bit in the ``flags`` is unrecognized.
> +	* U_P5		if the ``slotid`` parameter is unsupported.
> +	* U_PERMISSION	if called from context other than Hypervisor.
> +	* U_FUNCTION	if functionality is not supported.
> +
> +
> +Description
> +~~~~~~~~~~~
> +
> +    Register a memory range for an SVM.  The memory range starts at the
> +    guest physical address ``start_gpa`` and is ``size`` bytes long.
> +
> +Use cases
> +~~~~~~~~~
> +
> +
> +    #. When a virtual machine goes secure, all the memory slots managed =
by
> +       the Hypervisor move into secure memory. The Hypervisor iterates
> +       through each of memory slots, and registers the slot with
> +       Ultravisor.  Hypervisor may discard some slots such as those used
> +       for firmware (SLOF).
> +
> +    #. When new memory is hot-plugged, a new memory slot gets registered.
> +
> +
> +UV_UNREGISTER_MEM_SLOT
> +----------------------
> +
> +    Unregister an SVM address-range that was previously registered using
> +    UV_REGISTER_MEM_SLOT.
> +
> +Syntax
> +~~~~~~
> +
> +.. code-block:: c
> +
> +	uint64_t ultracall(const uint64_t UV_UNREGISTER_MEM_SLOT,
> +		uint64_t lpid,		/* LPAR ID of the SVM */
> +		uint64_t slotid)	/* reservation slotid */
> +
> +Return values
> +~~~~~~~~~~~~~
> +
> +    One of the following values:
> +
> +	* U_SUCCESS	on success.
> +	* U_FUNCTION	if functionality is not supported.
> +	* U_PARAMETER	if ``lpid`` is invalid.
> +	* U_P2 		if ``slotid`` is invalid.
> +	* U_PERMISSION	if called from context other than Hypervisor.
> +
> +Description
> +~~~~~~~~~~~
> +
> +    Release the memory slot identified by ``slotid`` and free any
> +    resources allocated towards the reservation.
> +
> +Use cases
> +~~~~~~~~~
> +
> +    #. Memory hot-remove.
> +
> +
> +UV_SVM_TERMINATE
> +----------------
> +
> +    Terminate an SVM and release its resources.
> +
> +Syntax
> +~~~~~~
> +
> +.. code-block:: c
> +
> +	uint64_t ultracall(const uint64_t UV_SVM_TERMINATE,
> +		uint64_t lpid,		/* LPAR ID of the SVM */)
> +
> +Return values
> +~~~~~~~~~~~~~
> +
> +    One of the following values:
> +
> +	* U_SUCCESS	on success.
> +	* U_FUNCTION	if functionality is not supported.
> +	* U_PARAMETER	if ``lpid`` is invalid.
> +	* U_INVALID	if VM is not secure.
> +	* U_PERMISSION  if not called from a Hypervisor context.
> +
> +Description
> +~~~~~~~~~~~
> +
> +    Terminate an SVM and release all its resources.
> +
> +Use cases
> +~~~~~~~~~
> +
> +    #. Called by Hypervisor when terminating an SVM.
> +
> +
> +Ultracalls used by SVM
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +UV_SHARE_PAGE
> +-------------
> +
> +    Share a set of guest physical pages with the Hypervisor.
> +
> +Syntax
> +~~~~~~
> +
> +.. code-block:: c
> +
> +	uint64_t ultracall(const uint64_t UV_SHARE_PAGE,
> +		uint64_t gfn,	/* guest page frame number */
> +		uint64_t num)	/* number of pages of size PAGE_SIZE */
> +
> +Return values
> +~~~~~~~~~~~~~
> +
> +    One of the following values:
> +
> +	* U_SUCCESS	on success.
> +	* U_FUNCTION	if functionality is not supported.
> +	* U_INVALID	if the VM is not secure.
> +	* U_PARAMETER	if ``gfn`` is invalid.
> +	* U_P2 		if ``num`` is invalid.
> +
> +Description
> +~~~~~~~~~~~
> +
> +    Share the ``num`` pages starting at guest physical frame number ``gf=
n``
> +    with the Hypervisor. Assume page size is PAGE_SIZE bytes. Zero the
> +    pages before returning.
> +
> +    If the address is already backed by a secure page, unmap the page and
> +    back it with an insecure page, with the help of the Hypervisor. If it
> +    is not backed by any page yet, mark the PTE as insecure and back it
> +    with an insecure page when the address is accessed. If it is already
> +    backed by an insecure page, zero the page and return.
> +
> +Use cases
> +~~~~~~~~~
> +
> +    #. The Hypervisor cannot access the SVM pages since they are backed =
by
> +       secure pages. Hence an SVM must explicitly request Ultravisor for
> +       pages it can share with Hypervisor.
> +
> +    #. Shared pages are needed to support virtio and Virtual Processor A=
rea
> +       (VPA) in SVMs.
> +
> +
> +UV_UNSHARE_PAGE
> +---------------
> +
> +    Restore a shared SVM page to its initial state.
> +
> +Syntax
> +~~~~~~
> +
> +.. code-block:: c
> +
> +	uint64_t ultracall(const uint64_t UV_UNSHARE_PAGE,
> +		uint64_t gfn,	/* guest page frame number */
> +		uint73 num)	/* number of pages of size PAGE_SIZE*/
> +
> +Return values
> +~~~~~~~~~~~~~
> +
> +    One of the following values:
> +
> +	* U_SUCCESS	on success.
> +	* U_FUNCTION	if functionality is not supported.
> +	* U_INVALID	if VM is not secure.
> +	* U_PARAMETER	if ``gfn`` is invalid.
> +	* U_P2 		if ``num`` is invalid.
> +
> +Description
> +~~~~~~~~~~~
> +
> +    Stop sharing ``num`` pages starting at ``gfn`` with the Hypervisor.
> +    Assume that the page size is PAGE_SIZE. Zero the pages before
> +    returning.
> +
> +    If the address is already backed by an insecure page, unmap the page
> +    and back it with a secure page. Inform the Hypervisor to release
> +    reference to its shared page. If the address is not backed by a page
> +    yet, mark the PTE as secure and back it with a secure page when that
> +    address is accessed. If it is already backed by an secure page zero
> +    the page and return.
> +
> +Use cases
> +~~~~~~~~~
> +
> +    #. The SVM may decide to unshare a page from the Hypervisor.
> +
> +
> +UV_UNSHARE_ALL_PAGES
> +--------------------
> +
> +    Unshare all pages the SVM has shared with Hypervisor.
> +
> +Syntax
> +~~~~~~
> +
> +.. code-block:: c
> +
> +	uint64_t ultracall(const uint64_t UV_UNSHARE_ALL_PAGES)
> +
> +Return values
> +~~~~~~~~~~~~~
> +
> +    One of the following values:
> +
> +	* U_SUCCESS	on success.
> +	* U_FUNCTION	if functionality is not supported.
> +	* U_INVAL	if VM is not secure.
> +
> +Description
> +~~~~~~~~~~~
> +
> +    Unshare all shared pages from the Hypervisor. All unshared pages are
> +    zeroed on return. Only pages explicitly shared by the SVM with the
> +    Hypervisor (using UV_SHARE_PAGE ultracall) are unshared. Ultravisor
> +    may internally share some pages with the Hypervisor without explicit
> +    request from the SVM.  These pages will not be unshared by this
> +    ultracall.
> +
> +Use cases
> +~~~~~~~~~
> +
> +    #. This call is needed when ``kexec`` is used to boot a different
> +       kernel. It may also be needed during SVM reset.
> +
> +UV_ESM
> +------
> +
> +    Secure the virtual machine (*enter secure mode*).
> +
> +Syntax
> +~~~~~~
> +
> +.. code-block:: c
> +
> +	uint64_t ultracall(const uint64_t UV_ESM,
> +		uint64_t esm_blob_addr,	/* location of the ESM blob */
> +		unint64_t fdt)		/* Flattened device tree */
> +
> +Return values
> +~~~~~~~~~~~~~
> +
> +    One of the following values:
> +
> +	* U_SUCCESS	on success (including if VM is already secure).
> +	* U_FUNCTION	if functionality is not supported.
> +	* U_INVALID	if VM is not secure.
> +	* U_PARAMETER	if ``esm_blob_addr`` is invalid.
> +	* U_P2 		if ``fdt`` is invalid.
> +	* U_PERMISSION	if any integrity checks fail.
> +	* U_RETRY	insufficient memory to create SVM.
> +	* U_NO_KEY	symmetric key unavailable.
> +
> +Description
> +~~~~~~~~~~~
> +
> +    Secure the virtual machine. On successful completion, return
> +    control to the virtual machine at the address specified in the
> +    ESM blob.
> +
> +Use cases
> +~~~~~~~~~
> +
> +    #. A normal virtual machine can choose to switch to a secure mode.
> +
> +Hypervisor Calls API
> +####################
> +
> +    This document describes the Hypervisor calls (hypercalls) that are
> +    needed to support the Ultravisor. Hypercalls are services provided by
> +    the Hypervisor to virtual machines and Ultravisor.
> +
> +    Register usage for these hypercalls is identical to that of the other
> +    hypercalls defined in the Power Architecture Platform Reference (PAP=
R)
> +    document.  i.e on input, register R3 identifies the specific service
> +    that is being requested and registers R4 through R11 contain
> +    additional parameters to the hypercall, if any. On output, register
> +    R3 contains the return value and registers R4 through R9 contain any
> +    other output values from the hypercall.
> +
> +    This document only covers hypercalls currently implemented/planned
> +    for Ultravisor usage but others can be added here when it makes sens=
e.
> +
> +    The full specification for all hypercalls/ultracalls will eventually
> +    be made available in the public/OpenPower version of the PAPR
> +    specification.
> +
> +Hypervisor calls to support Ultravisor
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +    Following are the set of hypercalls needed to support Ultravisor.
> +
> +H_SVM_INIT_START
> +----------------
> +
> +    Begin the process of converting a normal virtual machine into an SVM.
> +
> +Syntax
> +~~~~~~
> +
> +.. code-block:: c
> +
> +	uint64_t hypercall(const uint64_t H_SVM_INIT_START)
> +
> +Return values
> +~~~~~~~~~~~~~
> +
> +    One of the following values:
> +
> +	* H_SUCCESS	 on success.
> +
> +Description
> +~~~~~~~~~~~
> +
> +    Initiate the process of securing a virtual machine. This involves
> +    coordinating with the Ultravisor, using ultracalls, to allocate
> +    resources in the Ultravisor for the new SVM, transferring the VM's
> +    pages from normal to secure memory etc. When the process is
> +    completed, Ultravisor issues the H_SVM_INIT_DONE hypercall.
> +
> +Use cases
> +~~~~~~~~~
> +
> +     #. Ultravisor uses this hypercall to inform Hypervisor that a VM
> +        has initiated the process of switching to secure mode.
> +
> +
> +H_SVM_INIT_DONE
> +---------------
> +
> +    Complete the process of securing an SVM.
> +
> +Syntax
> +~~~~~~
> +
> +.. code-block:: c
> +
> +	uint64_t hypercall(const uint64_t H_SVM_INIT_DONE)
> +
> +Return values
> +~~~~~~~~~~~~~
> +
> +    One of the following values:
> +
> +	* H_SUCCESS 		on success.
> +	* H_UNSUPPORTED		if called from the wrong context (e.g.
> +				from an SVM or before an H_SVM_INIT_START
> +				hypercall).
> +
> +Description
> +~~~~~~~~~~~
> +
> +    Complete the process of securing a virtual machine. This call must
> +    be made after a prior call to ``H_SVM_INIT_START`` hypercall.
> +
> +Use cases
> +~~~~~~~~~
> +
> +    On successfully securing a virtual machine, the Ultravisor informs
> +    Hypervisor about it. Hypervisor can use this call to finish setting
> +    up its internal state for this virtual machine.
> +
> +
> +H_SVM_PAGE_IN
> +-------------
> +
> +    Move the contents of a page from normal memory to secure memory.
> +
> +Syntax
> +~~~~~~
> +
> +.. code-block:: c
> +
> +	uint64_t hypercall(const uint64_t H_SVM_PAGE_IN,
> +		uint64_t guest_pa,	/* guest-physical-address */
> +		uint64_t flags,		/* flags */
> +		uint64_t order)		/* page size order */
> +
> +Return values
> +~~~~~~~~~~~~~
> +
> +    One of the following values:
> +
> +	* H_SUCCESS	on success.
> +	* H_PARAMETER	if ``guest_pa`` is invalid.
> +	* H_P2		if ``flags`` is invalid.
> +	* H_P3		if ``order`` of page is invalid.
> +
> +Description
> +~~~~~~~~~~~
> +
> +    Retrieve the content of the page, belonging to the VM at the specifi=
ed
> +    guest physical address.
> +
> +    Only valid value(s) in ``flags`` are:
> +
> +        * H_PAGE_IN_SHARED which indicates that the page is to be shared
> +	  with the Ultravisor.
> +
> +	* H_PAGE_IN_NONSHARED indicates that the UV is not anymore
> +          interested in the page. Applicable if the page is a shared pag=
e.
> +
> +    The ``order`` parameter must correspond to the configured page size.
> +
> +Use cases
> +~~~~~~~~~
> +
> +    #. When a normal VM becomes a secure VM (using the UV_ESM ultracall),
> +       the Ultravisor uses this hypercall to move contents of each page =
of
> +       the VM from normal memory to secure memory.
> +
> +    #. Ultravisor uses this hypercall to ask Hypervisor to provide a page
> +       in normal memory that can be shared between the SVM and Hyperviso=
r.
> +
> +    #. Ultravisor uses this hypercall to page-in a paged-out page. This
> +       can happen when the SVM touches a paged-out page.
> +
> +    #. If SVM wants to disable sharing of pages with Hypervisor, it can
> +       inform Ultravisor to do so. Ultravisor will then use this hyperca=
ll
> +       and inform Hypervisor that it has released access to the normal
> +       page.
> +
> +H_SVM_PAGE_OUT
> +---------------
> +
> +    Move the contents of the page to normal memory.
> +
> +Syntax
> +~~~~~~
> +
> +.. code-block:: c
> +
> +	uint64_t hypercall(const uint64_t H_SVM_PAGE_OUT,
> +		uint64_t guest_pa,	/* guest-physical-address */
> +		uint64_t flags,		/* flags (currently none) */
> +		uint64_t order)		/* page size order */
> +
> +Return values
> +~~~~~~~~~~~~~
> +
> +    One of the following values:
> +
> +	* H_SUCCESS	on success.
> +	* H_PARAMETER	if ``guest_pa`` is invalid.
> +	* H_P2		if ``flags`` is invalid.
> +	* H_P3		if ``order`` is invalid.
> +
> +Description
> +~~~~~~~~~~~
> +
> +    Move the contents of the page identified by ``guest_pa`` to normal
> +    memory.
> +
> +    Currently ``flags`` is unused and must be set to 0. The ``order``
> +    parameter must correspond to the configured page size.
> +
> +Use cases
> +~~~~~~~~~
> +
> +    #. If Ultravisor is running low on secure pages, it can move the
> +       contents of some secure pages, into normal pages using this
> +       hypercall. The content will be encrypted.
> +
> +References
> +##########
> +
> +.. [1] `Supporting Protected Computing on IBM Power Architecture <https:=
//developer.ibm.com/articles/l-support-protected-computing/>`_
> --=20
> 2.20.1
