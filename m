Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5559272B2B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 11:10:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tqMB5KFhzDqMv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 19:10:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ldufour@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tqKP42gbzDqKZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 19:09:09 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6O97VgV111640
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 05:09:06 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2txjdr5brp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 05:09:05 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ldufour@linux.vnet.ibm.com>;
 Wed, 24 Jul 2019 10:09:03 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 24 Jul 2019 10:09:00 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6O98wrR61538446
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jul 2019 09:08:58 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C546CAE053;
 Wed, 24 Jul 2019 09:08:58 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73C18AE04D;
 Wed, 24 Jul 2019 09:08:58 +0000 (GMT)
Received: from pomme.lab.toulouse-stg.fr.ibm.com (unknown [9.101.4.33])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 24 Jul 2019 09:08:58 +0000 (GMT)
Subject: Re: [DOC][PATCH v5 1/4] powerpc: Document some HCalls for Storage
 Class Memory
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20190723161357.26718-1-vaibhav@linux.ibm.com>
 <20190723161357.26718-2-vaibhav@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.vnet.ibm.com>
Date: Wed, 24 Jul 2019 11:08:58 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190723161357.26718-2-vaibhav@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19072409-4275-0000-0000-000003500EEC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072409-4276-0000-0000-000038603675
Message-Id: <a8277da0-ad26-d491-ed6b-61bf5ea18dbb@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-24_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907240103
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
Cc: Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 23/07/2019 à 18:13, Vaibhav Jain a écrit :
> This doc patch provides an initial description of the HCall op-codes
> that are used by Linux kernel running as a guest operating
> system (LPAR) on top of PowerVM or any other sPAPR compliant
> hyper-visor (e.g qemu).
> 
> Apart from documenting the HCalls the doc-patch also provides a
> rudimentary overview of how Hcalls are implemented inside the Linux
> kernel and how information flows between kernel and PowerVM/KVM.

Hi Vaibhav,

That's a good idea to introduce such a documentation.

> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Change-log:
> 
> v5
> * First patch in this patchset.
> ---
>   Documentation/powerpc/hcalls.txt | 140 +++++++++++++++++++++++++++++++
>   1 file changed, 140 insertions(+)
>   create mode 100644 Documentation/powerpc/hcalls.txt
> 
> diff --git a/Documentation/powerpc/hcalls.txt b/Documentation/powerpc/hcalls.txt
> new file mode 100644
> index 000000000000..cc9dd872cecd
> --- /dev/null
> +++ b/Documentation/powerpc/hcalls.txt
> @@ -0,0 +1,140 @@
> +Hyper-visor Call Op-codes (HCALLS)
> +====================================
> +
> +Overview
> +=========
> +
> +Virtualization on PPC64 arch is based on the PAPR specification[1] which
> +describes run-time environment for a guest operating system and how it should
> +interact with the hyper-visor for privileged operations. Currently there are two
> +PAPR compliant hypervisors (PHYP):
> +
> +IBM PowerVM: IBM's proprietary hyper-visor that supports AIX, IBM-i and Linux as
> +	     supported guests (termed as Logical Partitions or LPARS).
> +
> +Qemu/KVM:    Supports PPC64 linux guests running on a PPC64 linux host.
> +
> +On PPC64 arch a virtualized guest kernel runs in a non-privileged mode (HV=0).
> +Hence to perform a privileged operations the guest issues a Hyper-visor
> +Call (HCALL) with necessary input operands. PHYP after performing the privilege
> +operation returns a status code and output operands back to the guest.
> +
> +HCALL ABI
> +=========
> +The ABI specification for a HCall between guest os kernel and PHYP is
> +described in [1]. The Opcode for Hcall is set in R3 and subsequent in-arguments
> +for the Hcall are provided in registers R4-R12. On return from 'HVCS'
> +instruction the status code of HCall is available in R3 an the output parameters
> +are returned in registers R4-R12.

Would it be good to mention that values passed through the memory must be 
stored in Big Endian format ?

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
> +	      |          |  Index  +---------+
> +  DR2         |          |         |         |
> +  +--+        |          |<------->|  Kernel |
> +  |  |<----- >|          |  HCall  |         |
> +  +--+  DRC2  +----------+         +---------+
> +
> +PHYP terms shared hardware resources like PCI devices, NVDimms etc available for
> +use by LPARs as Dynamic Resource (DR). When a DR is allocated to an LPAR, PHYP
> +creates a data-structure called Dynamic Resource Connector (DRC) to manage LPAR
> +access. An LPAR refers to a DRC via an opaque 32-bit number called DRC-Index.
> +The DRC-index value is provided to the LPAR via device-tree where its present
> +as an attribute in the device tree node associated with the DR.

Should you use the term 'Hypervisor' instead of 'PHYP' which is not usually 
designing only the proprietary one ?

Thanks,
Laurent.

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
> +
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
> +
> +* H_SCM_UNBIND_MEM:
> +  Input: drcIndex, startingScmLogicalMemoryAddress, numScmBlocksToUnbind
> +  Out: numScmBlocksUnbound
> +  Description:
> +  Given a DRC-Index of an NVDimm, unmap one or more the SCM blocks from guest
> +  physical address space. The HCALL can fail if the Guest has an active PTE
> +  entry to the SCM block being unbinded.
> +
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
> +  or all scm blocks belonging to a single NVDimm identified by its drcIndex
> +  from the LPAR memory.
> +
> +* H_SCM_HEALTH:
> +  Input: drcIndex
> +  Output: health-bitmap, health-bit-valid-bitmap
> +  Description:
> +  Given a DRC Index return the info on predictive failure and over all health of
> +  the NVDimm. The asserted bits in the health-bitmap indicate a single predictive
> +  failure and health-bit-valid-bitmap indicate which bits in health-bitmap are
> +  valid.
> +
> +
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
> 

