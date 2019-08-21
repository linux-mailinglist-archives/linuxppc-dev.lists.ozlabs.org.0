Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E117986F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 00:03:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DM9s1bzRzDqh3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 08:03:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DM7W6vdGzDqf0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 08:01:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46DM7W5twTz8tV9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 08:01:27 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46DM7W5bCDz9sBp; Thu, 22 Aug 2019 08:01:27 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cclaudio@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46DM7W1gK1z9s7T
 for <linuxppc-dev@ozlabs.org>; Thu, 22 Aug 2019 08:01:26 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7LLqXpK136276; Wed, 21 Aug 2019 18:01:21 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uhchskret-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Aug 2019 18:01:21 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7LM0tGJ019406;
 Wed, 21 Aug 2019 22:01:20 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 2ue9776ye8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Aug 2019 22:01:20 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7LM1JTK55116108
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 22:01:19 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54FB3AE11A;
 Wed, 21 Aug 2019 22:01:19 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D95FDAE111;
 Wed, 21 Aug 2019 22:01:15 +0000 (GMT)
Received: from [9.80.203.17] (unknown [9.80.203.17])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 21 Aug 2019 22:01:15 +0000 (GMT)
Subject: Re: [PATCH v5 1/7] Documentation/powerpc: Ultravisor API
To: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@ozlabs.org
References: <20190808040555.2371-1-cclaudio@linux.ibm.com>
 <20190808040555.2371-2-cclaudio@linux.ibm.com> <877e7i74ua.fsf@linux.ibm.com>
From: Claudio Carvalho <cclaudio@linux.ibm.com>
Message-ID: <05181809-7d70-fe9e-f2c3-2eaca450ae35@linux.ibm.com>
Date: Wed, 21 Aug 2019 19:01:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <877e7i74ua.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-21_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908210214
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
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 Ryan Grimm <grimm@linux.ibm.com>, Ram Pai <linuxram@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, Guerney Hunt <gdhh@linux.ibm.com>,
 Thiago Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 8/12/19 12:58 PM, Fabiano Rosas wrote:
> Claudio Carvalho <cclaudio@linux.ibm.com> writes:
>
> Some small suggestions below:
>
>> +
>> +    * The privilege of a process is now determined by three MSR bits,
>> +      MSR(S, HV, PR). In each of the tables below the modes are listed
>> +      from least privilege to highest privilege. The higher privilege
>> +      modes can access all the resources of the lower privilege modes.
>> +
>> +      **Secure Mode MSR Settings**
>> +
>> +      +---+---+---+---------------+
>> +      | S | HV| PR|Privilege      |
>> +      +===+===+===+===============+
>> +      | 1 | 0 | 1 | Problem       |
>> +      +---+---+---+---------------+
>> +      | 1 | 0 | 0 | Privileged(OS)|
>> +      +---+---+---+---------------+
>> +      | 1 | 1 | 0 | Ultravisor    |
>> +      +---+---+---+---------------+
>> +      | 1 | 1 | 1 | Reserved      |
>> +      +---+---+---+---------------+
>> +
>> +      **Normal Mode MSR Settings**
>> +
>> +      +---+---+---+---------------+
>> +      | S | HV| PR|Privilege      |
>> +      +===+===+===+===============+
>> +      | 0 | 0 | 1 | Problem       |
>> +      +---+---+---+---------------+
>> +      | 0 | 0 | 0 | Privileged(OS)|
>> +      +---+---+---+---------------+
>> +      | 0 | 1 | 0 | Hypervisor    |
>> +      +---+---+---+---------------+
>> +      | 0 | 1 | 1 | Problem (HV)  |
>> +      +---+---+---+---------------+
> I find the use of '(HV)' in this last line a bit ambiguous. Since we are
> already using 'HV' to refer to MSR(HV). I'd suggest using '(Host)' or
> simply leaving it out.
>
>> +
>> +    * Memory is partitioned into secure and normal memory. Only processes
>> +      that are running in secure mode can access secure memory.
>> +
>> +    * The hardware does not allow anything that is not running secure to
>> +      access secure memory. This means that the Hypervisor cannot access
>> +      the memory of the SVM without using an ultracall (asking the
>> +      Ultravisor). The Ultravisor will only allow the hypervisor to see
>> +      the SVM memory encrypted.
>> +
>> +    * I/O systems are not allowed to directly address secure memory. This
>> +      limits the SVMs to virtual I/O only.
>> +
>> +    * The architecture allows the SVM to share pages of memory with the
>> +      hypervisor that are not protected with encryption. However, this
>> +      sharing must be initiated by the SVM.
>> +
>> +    * When a process is running in secure mode all hypercalls
>> +      (syscall lev=1) are reflected to the Ultravisor.
> Here 'reflected' refers to the Ultravisor. Later on, it is used as
> meaning the Ultravisor reflects hypercalls/interrupts to the
> Hypervisor. I suggest we use this term to mean the latter only.
>
>> +
>> +    * When a process is in secure mode all interrupts go to the
>> +      Ultravisor.
>> +
>> +    * The following resources have become Ultravisor privileged and
>> +      require an Ultravisor interface to manipulate:
>> +
>> +      * Processor configurations registers (SCOMs).
>> +
>> +      * Stop state information.
>> +
>> +      * The debug registers CIABR, DAWR, and DAWRX become Ultravisor
>> +        resources when SMFCTRL(D) is set. If SMFCTRL(D) is not set they do
> It looks like you could go without "become Ultravisor resources" since
> it is already mentioned in the parent item above (The following...).
>
>> +        not work in secure mode. When set, reading and writing requires
>> +        an Ultravisor call, otherwise that will cause a Hypervisor Emulation
>> +        Assistance interrupt.
>> +
>> +      * PTCR and partition table entries (partition table is in secure
>> +        memory). An attempt to write to PTCR will cause a Hypervisor
>> +        Emulation Assitance interrupt.
>> +
>> +      * LDBAR (LD Base Address Register) and IMC (In-Memory Collection)
>> +        non-architected registers. An attempt to write to them will cause a
>> +        Hypervisor Emulation Assistance interrupt.
>> +
>> +      * Paging for an SVM, sharing of memory with Hypervisor for an SVM.
>> +        (Including Virtual Processor Area (VPA) and virtual I/O).
>> +
>> +
>> +Software/Microcode
>> +==================
>> +
>> +    The software changes include:
>> +
>> +    * SVMs are created from normal VM using (open source) tooling supplied
>> +      by IBM.
>> +
>> +    * All SVMs start as normal VMs and utilize an ultracall, UV_ESM
>> +      (Enter Secure Mode), to make the transition.
>> +
>> +    * When the UV_ESM ultracall is made the Ultravisor copies the VM into
>> +      secure memory, decrypts the verification information, and checks the
>> +      integrity of the SVM. If the integrity check passes the Ultravisor
>> +      passes control in secure mode.
>> +
>> +    * For external interrupts the Ultravisor saves the state of the SVM,
>> +      and reflects the interrupt to the hypervisor for processing.
>> +      For hypercalls, the Ultravisor inserts neutral state into all
>> +      registers not needed for the hypercall then reflects the call to
>> +      the hypervisor for processing. The H_RANDOM hypercall is performed
>> +      by the Ultravisor and not reflected.
>> +
>> +    * The verification information includes the pass phrase for the
>> +      encrypted disk associated with the SVM. This pass phrase is given
>> +      to the SVM when requested.
> This is the second mention of 'verification information'. Could we
> perhaps move this up after "SMVs are created..."


>  and rephrase it in a way
> that introduces the concept?  What/where/in what state is the
> verification information?

Thanks for reviewing the patch Fabiano. I addressed all your suggestions in
the next version, except the one above because the "verification
information" concept is big and it is not related to the kernel.

Claudio.


>> +
>> +    * The Ultravisor is not involved in protecting the encrypted disk of
>> +      the SVM while at rest.
>> +
>> +    * For virtual I/O to work bounce buffering must be done.
>> +
>> +    * The Ultravisor uses AES (IAPM) for protection of SVM memory. IAPM
>> +      is a mode of AES that provides integrity and secrecy concurrently.
>> +
>> +    * The movement of data between normal and secure pages is coordinated
>> +      with the Ultravisor by a new HMM plug-in in the Hypervisor.
>> +
>> +    The Ultravisor offers new services to the hypervisor and SVMs. These
>> +    are accessed through ultracalls.
>> +
>> +Terminology
>> +===========
>> +
>> +    * Hypercalls: special system calls used to request services from
>> +      Hypervisor.
>> +
>> +    * Normal memory: Memory that is accessible to Hypervisor.
>> +
>> +    * Normal page: Page backed by normal memory and available to
>> +      Hypervisor.
>> +
>> +    * Shared page: A page backed by normal memory and available to both
>> +      the Hypervisor/QEMU and the SVM (i.e page has mappings in SVM and
>> +      Hypervisor/QEMU).
>> +
>> +    * Secure memory: Memory that is accessible only to Ultravisor and
>> +      SVMs.
>> +
>> +    * Secure page: Page backed by secure memory and only available to
>> +      Ultravisor and SVM.
>> +
>> +    * SVM: Secure Virtual Machine.
>> +
>> +    * Ultracalls: special system calls used to request services from
>> +      Ultravisor.
>> +
>> +
>> +Ultravisor calls API
>> +####################
>> +
>> +    This section describes Ultravisor calls (ultracalls) needed to
>> +    support Secure Virtual Machines (SVM)s and Paravirtalized KVM. The
> Paravirtualized
>
>> +    ultracalls allow the SVMs and Hypervisor to request services from the
>> +    Ultravisor such as accessing a register or memory region that can only
>> +    be accessed when running in Ultravisor-privileged mode.
>> +
>> +    The specific service needed from an ultracall is specified in register
>> +    R3 (the first parameter to the ultracall). Other parameters to the
>> +    ultracall, if any, are specified in registers R4 through R12.
>> +
>> +    Return value of all ultracalls is in register R3. Other output values
>> +    from the ultracall, if any, are returned in registers R4 through R12.
>> +    The only exception to this register usage is the ``UV_RETURN``
>> +    ultracall described below.
>> +
>> +    Each ultracall returns specific error codes, applicable in the context
>> +    of the ultracall. However, like with the PowerPC Architecture Platform
>> +    Reference (PAPR), if no specific error code is defined for a
>> +    particular situation, then the ultracall will fallback to an erroneous
>> +    parameter-position based code. i.e U_PARAMETER, U_P2, U_P3 etc
>> +    depending on the ultracall parameter that may have caused the error.
>> +
>> +    Some ultracalls involve transferring a page of data between Ultravisor
>> +    and Hypervisor.  Secure pages that are transferred from secure memory
>> +    to normal memory may be encrypted using dynamically generated keys.
>> +    When the secure pages are transferred back to secure memory, they may
>> +    be decrypted using the same dynamically generated keys. Generation and
>> +    management of these keys will be covered in a separate document.
>> +
>> +    For now this only covers ultracalls currently implemented and being
>> +    used by Hypervisor and SVMs but others can be added here when it
>> +    makes sense.
>> +
>> +    The full specification for all hypercalls/ultracalls will eventually
>> +    be made available in the public/OpenPower version of the PAPR
>> +    specification.
>> +
>> +    **Note**
>> +
>> +    If PEF is not enabled, the ultracalls will be redirected to the
>> +    Hypervisor which must handle/fail the calls.
>> +
>> +Ultracalls used by Hypervisor
>> +=============================
>> +
>> +    This section describes the virtual memory management ultracalls used
>> +    by the Hypervisor to manage SVMs.
>> +
>> +UV_PAGE_OUT
>> +-----------
>> +
>> +    Encrypt and move the contents of a page from secure memory to normal
>> +    memory.
>> +
>> +Syntax
>> +~~~~~~
>> +
>> +.. code-block:: c
>> +
>> +	uint64_t ultracall(const uint64_t UV_PAGE_OUT,
>> +		uint16_t lpid,		/* LPAR ID */
>> +		uint64_t dest_ra,	/* real address of destination page */
>> +		uint64_t src_gpa,	/* source guest-physical-address */
>> +		uint8_t  flags,		/* flags */
>> +		uint64_t order)		/* page size order */
>> +
>> +Return values
>> +~~~~~~~~~~~~~
>> +
>> +    One of the following values:
>> +
>> +	* U_SUCCESS	on success.
>> +	* U_PARAMETER	if ``lpid`` is invalid.
>> +	* U_P2 		if ``dest_ra`` is invalid.
>> +	* U_P3		if the ``src_gpa`` address is invalid.
>> +	* U_P4		if any bit in the ``flags`` is unrecognized
>> +	* U_P5		if the ``order`` parameter is unsupported.
>> +	* U_FUNCTION	if functionality is not supported.
>> +	* U_BUSY	if page cannot be currently paged-out.
>> +
>> +Description
>> +~~~~~~~~~~~
>> +
>> +    Encrypt the contents of a secure-page and make it available to
>> +    Hypervisor in a normal page.
>> +
>> +    By default, the source page is unmapped from the SVM's partition-
>> +    scoped page table. But the Hypervisor can provide a hint to the
>> +    Ultravisor to retain the page mapping by setting the ``UV_SNAPSHOT``
>> +    flag in ``flags`` parameter.
>> +
>> +    If the source page is already a shared page the call returns
>> +    U_SUCCESS, without doing anything.
>> +
>> +Use cases
>> +~~~~~~~~~
>> +
>> +    #. QEMU attempts to access an address belonging to the SVM but the
>> +       page frame for that address is not mapped into QEMU's address
>> +       space. In this case, the Hypervisor will allocate a page frame,
>> +       map it into QEMU's address space and issue the ``UV_PAGE_OUT``
>> +       call to retrieve the encrypted contents of the page.
>> +
>> +    #. When Ultravisor runs low on secure memory and it needs to page-out
>> +       an LRU page. In this case, Ultravisor will issue the
>> +       ``H_SVM_PAGE_OUT`` hypercall to the Hypervisor. The Hypervisor will
>> +       then allocate a normal page and issue the ``UV_PAGE_OUT`` ultracall
>> +       and the Ultravisor will encrypt and move the contents of the secure
>> +       page into the normal page.
>> +
>> +
>> +UV_PAGE_IN
>> +----------
>> +
>> +    Move the contents of a page from normal memory to secure memory.
>> +
>> +Syntax
>> +~~~~~~
>> +
>> +.. code-block:: c
>> +
>> +	uint64_t ultracall(const uint64_t UV_PAGE_IN,
>> +		uint16_t lpid,		/* the LPAR ID */
>> +		uint64_t src_ra,	/* source real address of page */
>> +		uint64_t dest_gpa,	/* destination guest physical address */
>> +		uint64_t flags,		/* flags */
>> +		uint64_t order)		/* page size order */
>> +
>> +Return values
>> +~~~~~~~~~~~~~
>> +
>> +    One of the following values:
>> +
>> +	* U_SUCCESS	on success.
>> +	* U_BUSY	if page cannot be currently paged-in.
>> +	* U_FUNCTION	if functionality is not supported
>> +	* U_PARAMETER	if ``lpid`` is invalid.
>> +	* U_P2 		if ``src_ra`` is invalid.
>> +	* U_P3		if the ``dest_gpa`` address is invalid.
>> +	* U_P4		if any bit in the ``flags`` is unrecognized
>> +	* U_P5		if the ``order`` parameter is unsupported.
>> +
>> +Description
>> +~~~~~~~~~~~
>> +
>> +    Move the contents of the page identified by ``src_ra`` from normal
>> +    memory to secure memory and map it to the guest physical address
>> +    ``dest_gpa``.
>> +
>> +    If `dest_gpa` refers to a shared address, map the page into the
>> +    partition-scoped page-table of the SVM.  If `dest_gpa` is not shared,
>> +    copy the contents of the page into the corresponding secure page.
>> +    Depending on the context, decrypt the page before being copied.
>> +
>> +    The caller provides the attributes of the page through the ``flags``
>> +    parameter. Valid values for ``flags`` are:
>> +
>> +	* CACHE_INHIBITED
>> +	* CACHE_ENABLED
>> +	* WRITE_PROTECTION
>> +
>> +    The Hypervisor must pin the page in memory before making
>> +    ``UV_PAGE_IN`` ultracall.
>> +
>> +Use cases
>> +~~~~~~~~~
>> +
>> +    #. When a normal VM switches to secure mode, all its pages residing
>> +       in normal memory, are moved into secure memory.
>> +
>> +    #. When an SVM requests to share a page with Hypervisor the Hypervisor
>> +       allocates a page and informs the Ultravisor.
>> +
>> +    #. When an SVM accesses a secure page that has been paged-out,
>> +       Ultravisor invokes the Hypervisor to locate the page. After
>> +       locating the page, the Hypervisor uses UV_PAGE_IN to make the
>> +       page available to Ultravisor.
>> +
>> +    #. When Hypervisor accesses SVM data, the Hypervisor requests the
>> +       Ultravisor to transfer the corresponding page into a insecure page,
>> +       which the Hypervisor can access. The data in the normal page will
>> +       be encrypted though.
> This looks like it should be under UV_PAGE_OUT instead.
>
