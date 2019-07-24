Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AF272F5E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 15:01:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45twTJ2K03zDqN0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 23:01:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45twQs3ktWzDqHh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 22:59:15 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8DEA8AD3A;
 Wed, 24 Jul 2019 12:59:11 +0000 (UTC)
Date: Wed, 24 Jul 2019 14:59:09 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Laurent Dufour <ldufour@linux.vnet.ibm.com>
Subject: Re: [DOC][PATCH v5 1/4] powerpc: Document some HCalls for Storage
 Class Memory
Message-ID: <20190724145909.4ca5b9a8@naga.suse.cz>
In-Reply-To: <a8277da0-ad26-d491-ed6b-61bf5ea18dbb@linux.vnet.ibm.com>
References: <20190723161357.26718-1-vaibhav@linux.ibm.com>
 <20190723161357.26718-2-vaibhav@linux.ibm.com>
 <a8277da0-ad26-d491-ed6b-61bf5ea18dbb@linux.vnet.ibm.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 24 Jul 2019 11:08:58 +0200
Laurent Dufour <ldufour@linux.vnet.ibm.com> wrote:

> Le 23/07/2019 =C3=A0 18:13, Vaibhav Jain a =C3=A9crit=C2=A0:
> > This doc patch provides an initial description of the HCall op-codes
> > that are used by Linux kernel running as a guest operating
> > system (LPAR) on top of PowerVM or any other sPAPR compliant
> > hyper-visor (e.g qemu).
> >=20
> > Apart from documenting the HCalls the doc-patch also provides a
> > rudimentary overview of how Hcalls are implemented inside the Linux
> > kernel and how information flows between kernel and PowerVM/KVM. =20
>=20
> Hi Vaibhav,
>=20
> That's a good idea to introduce such a documentation.
>=20
> > Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> > ---
> > Change-log:
> >=20
> > v5
> > * First patch in this patchset.
> > ---
> >   Documentation/powerpc/hcalls.txt | 140 +++++++++++++++++++++++++++++++
> >   1 file changed, 140 insertions(+)
> >   create mode 100644 Documentation/powerpc/hcalls.txt
> >=20
> > diff --git a/Documentation/powerpc/hcalls.txt b/Documentation/powerpc/h=
calls.txt
> > new file mode 100644
> > index 000000000000..cc9dd872cecd
> > --- /dev/null
> > +++ b/Documentation/powerpc/hcalls.txt
> > @@ -0,0 +1,140 @@
> > +Hyper-visor Call Op-codes (HCALLS)
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Overview
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Virtualization on PPC64 arch is based on the PAPR specification[1] whi=
ch
> > +describes run-time environment for a guest operating system and how it=
 should
> > +interact with the hyper-visor for privileged operations. Currently the=
re are two
> > +PAPR compliant hypervisors (PHYP):
> > +
> > +IBM PowerVM: IBM's proprietary hyper-visor that supports AIX, IBM-i an=
d Linux as
> > +	     supported guests (termed as Logical Partitions or LPARS).
> > +
> > +Qemu/KVM:    Supports PPC64 linux guests running on a PPC64 linux host.
> > +
> > +On PPC64 arch a virtualized guest kernel runs in a non-privileged mode=
 (HV=3D0).
> > +Hence to perform a privileged operations the guest issues a Hyper-visor
> > +Call (HCALL) with necessary input operands. PHYP after performing the =
privilege
> > +operation returns a status code and output operands back to the guest.
> > +
> > +HCALL ABI
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +The ABI specification for a HCall between guest os kernel and PHYP is
> > +described in [1]. The Opcode for Hcall is set in R3 and subsequent in-=
arguments
> > +for the Hcall are provided in registers R4-R12. On return from 'HVCS'
> > +instruction the status code of HCall is available in R3 an the output =
parameters
> > +are returned in registers R4-R12. =20
>=20
> Would it be good to mention that values passed through the memory must be=
=20
> stored in Big Endian format ?
>=20
> > +Powerpc arch code provides convenient wrappers named plpar_hcall_xxx d=
efined in
> > +header 'hvcall.h' to issue HCalls from the linux kernel running as gue=
st.
> > +
> > +
> > +DRC & DRC Indexes
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +		 PAPR		     Guest
> > +  DR1          Hypervisor             OS
> > +  +--+        +----------+         +---------+
> > +  |  |<------>|          |         |  User   |
> > +  +--+  DRC1  |          |   DRC   |  Space  |
> > +	      |          |  Index  +---------+
> > +  DR2         |          |         |         |
> > +  +--+        |          |<------->|  Kernel |
> > +  |  |<----- >|          |  HCall  |         |
> > +  +--+  DRC2  +----------+         +---------+
> > +
> > +PHYP terms shared hardware resources like PCI devices, NVDimms etc ava=
ilable for
> > +use by LPARs as Dynamic Resource (DR). When a DR is allocated to an LP=
AR, PHYP
> > +creates a data-structure called Dynamic Resource Connector (DRC) to ma=
nage LPAR
> > +access. An LPAR refers to a DRC via an opaque 32-bit number called DRC=
-Index.
> > +The DRC-index value is provided to the LPAR via device-tree where its =
present
> > +as an attribute in the device tree node associated with the DR. =20
>=20
> Should you use the term 'Hypervisor' instead of 'PHYP' which is not usual=
ly=20
> designing only the proprietary one ?
>=20
> Thanks,
> Laurent.
>=20
> > +
> > +HCALL Op-codes
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Below is a partial of of HCALLs that are supported by PHYP. For the
                        ^^ list?

Thanks

Michal
> > +corresponding opcode values please look into the header
> > +'arch/powerpc/include/asm/hvcall.h' :
> > +
> > +* H_SCM_READ_METADATA:
> > +  Input: drcIndex, offset, buffer-address, numBytesToRead
> > +  Out: None
> > +  Description:
> > +  Given a DRC Index of an NVDimm, read N-bytes from the the meta data =
area
> > +  associated with it, at a specified offset and copy it to provided bu=
ffer.
> > +  The metadata area stores configuration information such as label inf=
ormation,
> > +  bad-blocks etc. The metadata area is located out-of-band of NVDimm s=
torage
> > +  area hence a separate access semantics is provided.
> > +
> > +* H_SCM_WRITE_METADATA:
> > +  Input: drcIndex, offset, data, numBytesToWrite
> > +  Out: None
> > +  Description:
> > +  Given a DRC Index of an NVDimm, write N-bytes from provided buffer a=
t the
> > +  given offset to the the meta data area associated with the NVDimm.
> > +
> > +
> > +* H_SCM_BIND_MEM:
> > +  Input: drcIndex, startingScmBlockIndex, numScmBlocksToBind, targetAd=
dress
> > +  Out: guestMappedAddress, numScmBlockBound
> > +  Description:
> > +  Given a DRC-Index of an NVDimm, maps the SCM (Storage Class Memory) =
blocks to
> > +  continuous logical addresses in guest physical address space. The HC=
ALL
> > +  arguments can be used to map partial range of SCM blocks instead of =
entire
> > +  NVDimm range to the LPAR.
> > +
> > +* H_SCM_UNBIND_MEM:
> > +  Input: drcIndex, startingScmLogicalMemoryAddress, numScmBlocksToUnbi=
nd
> > +  Out: numScmBlocksUnbound
> > +  Description:
> > +  Given a DRC-Index of an NVDimm, unmap one or more the SCM blocks fro=
m guest
> > +  physical address space. The HCALL can fail if the Guest has an activ=
e PTE
> > +  entry to the SCM block being unbinded.
> > +
> > +* H_SCM_QUERY_BLOCK_MEM_BINDING:
> > +  Input: drcIndex, scmBlockIndex
> > +  Out: Guest-Physical-Address
> > +  Description:
> > +  Given a DRC-Index and an SCM Block index return the guest physical a=
ddress to
> > +  which the SCM block is mapped to.
> > +
> > +* H_SCM_QUERY_LOGICAL_MEM_BINDING:
> > +  Input: Guest-Physical-Address
> > +  Out: drcIndex, scmBlockIndex
> > +  Description:
> > +  Given a guest physical address return which DRC Index and SCM block =
is mapped
> > +  to that address.
> > +
> > +* H_SCM_UNBIND_ALL:
> > +  Input: scmTargetScope, drcIndex
> > +  Out: None
> > +  Description:
> > +  Depending on the Target scope unmap all scm blocks belonging to all =
NVDimms
> > +  or all scm blocks belonging to a single NVDimm identified by its drc=
Index
> > +  from the LPAR memory.
> > +
> > +* H_SCM_HEALTH:
> > +  Input: drcIndex
> > +  Output: health-bitmap, health-bit-valid-bitmap
> > +  Description:
> > +  Given a DRC Index return the info on predictive failure and over all=
 health of
> > +  the NVDimm. The asserted bits in the health-bitmap indicate a single=
 predictive
> > +  failure and health-bit-valid-bitmap indicate which bits in health-bi=
tmap are
> > +  valid.
> > +
> > +
> > +* H_SCM_PERFORMANCE_STATS:
> > +  Input: drcIndex, resultBuffer Addr
> > +  Out: None
> > +  Description:
> > +  Given a DRC Index collect the performance statistics for NVDimm and =
copy them
> > +  to the resultBuffer.
> > +
> > +
> > +References
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +[1]: "Linux on Power Architecture Platform Reference"
> > +     https://members.openpowerfoundation.org/document/dl/469
> >  =20
>=20

