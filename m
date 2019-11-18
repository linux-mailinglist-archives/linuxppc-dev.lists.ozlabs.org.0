Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88316FFCB4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 02:07:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47GW5C5xmnzDq7k
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 12:07:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=popple.id.au
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alistair@popple.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47GW2s5bTqzDqZm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 12:05:09 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAI12dRx082103
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2019 20:05:03 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2way1yqt7e-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2019 20:05:03 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alistair@popple.id.au>;
 Mon, 18 Nov 2019 01:05:01 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 18 Nov 2019 01:04:59 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAI14vMM54132870
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Nov 2019 01:04:57 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98314A405B;
 Mon, 18 Nov 2019 01:04:57 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F13C0A405C;
 Mon, 18 Nov 2019 01:04:56 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 18 Nov 2019 01:04:56 +0000 (GMT)
Received: from townsend.localnet (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5DB84A01EA;
 Mon, 18 Nov 2019 12:04:52 +1100 (AEDT)
From: Alistair Popple <alistair@popple.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 01/11] powerpc/powernv/ioda: Fix ref count for devices
 with their own PE
Date: Mon, 18 Nov 2019 12:04:53 +1100
In-Reply-To: <e8cb8ac1-b54e-ce15-e1ea-6131b7386342@linux.ibm.com>
References: <20190909154600.19917-1-fbarrat@linux.ibm.com>
 <010252f2-7f94-4a8a-90ae-82ff49b622d6@ozlabs.ru>
 <e8cb8ac1-b54e-ce15-e1ea-6131b7386342@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-TM-AS-GCONF: 00
x-cbid: 19111801-0008-0000-0000-00000331A29F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111801-0009-0000-0000-00004A50BA62
Message-Id: <7553103.1BsQ81z3e0@townsend>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-17_05:2019-11-15,2019-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=620
 malwarescore=0 bulkscore=0 suspectscore=97 spamscore=0 adultscore=0
 clxscore=1034 mlxscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911180004
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 groug@kaod.org, clombard@linux.ibm.com, andrew.donnellan@au1.ibm.com,
 Frederic Barrat <fbarrat@linux.ibm.com>, Reza Arbab <arbab@linux.ibm.com>,
 alastair@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wednesday, 13 November 2019 4:38:21 AM AEDT Frederic Barrat wrote:
>=20
> Le 27/09/2019 =C3=A0 08:54, Alexey Kardashevskiy a =C3=A9crit :
> >=20
> >=20
> > On 27/09/2019 03:15, Frederic Barrat wrote:
> >>
> >>
> >> Le 26/09/2019 =C3=A0 18:44, Andrew Donnellan a =C3=A9crit :
> >>> On 9/9/19 5:45 pm, Frederic Barrat wrote:
> >>>> Taking a reference on the pci_dev structure was required with initial
> >>>> commit 184cd4a3b962 ("powerpc/powernv: PCI support for p7IOC under
> >>>> OPAL v2"), where we were storing the pci_dev in the pci_dn structure.
> >>>>
> >>>> However, the pci_dev was later removed from the pci_dn structure, but
> >>>> the reference was kept. See commit 902bdc57451c ("powerpc/powernv/id=
oa:
> >>>> Remove unnecessary pcidev from pci_dn").
> >>>>
> >>>> The pnv_ioda_pe structure life cycle is the same as the pci_dev
> >>>> structure, the PE is freed when the device is released. So we don't
> >>>> need a reference for the pci_dev stored in the PE, otherwise the
> >>>> pci_dev will never be released. Which is not really a surprise as the
> >>>> comment (removed here as no longer needed) was stating as much.
> >>>>
> >>>> Fixes: 902bdc57451c ("powerpc/powernv/idoa: Remove unnecessary pcide=
v=20
from pci_dn")
> >>>> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> >>>> ---
> >>>>    arch/powerpc/platforms/powernv/pci-ioda.c | 11 +----------
> >>>>    1 file changed, 1 insertion(+), 10 deletions(-)
> >>>>
> >>>> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerp=
c/
platforms/powernv/pci-ioda.c
> >>>> index d8080558d020..92767f006f20 100644
> >>>> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> >>>> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> >>>> @@ -1062,14 +1062,6 @@ static struct pnv_ioda_pe=20
*pnv_ioda_setup_dev_PE(struct pci_dev *dev)
> >>>>            return NULL;
> >>>>        }
> >>>> -    /* NOTE: We get only one ref to the pci_dev for the pdn, not fo=
r=20
the
> >>>> -     * pointer in the PE data structure, both should be destroyed a=
t=20
the
> >>>> -     * same time. However, this needs to be looked at more closely=
=20
again
> >>>> -     * once we actually start removing things (Hotplug, SR-IOV, ...)
> >>>> -     *
> >>>> -     * At some point we want to remove the PDN completely anyways
> >>>> -     */
> >>>> -    pci_dev_get(dev);
> >>>>        pdn->pe_number =3D pe->pe_number;
> >>>>        pe->flags =3D PNV_IODA_PE_DEV;
> >>>>        pe->pdev =3D dev;
> >>>> @@ -1084,7 +1076,6 @@ static struct pnv_ioda_pe=20
*pnv_ioda_setup_dev_PE(struct pci_dev *dev)
> >>>>            pnv_ioda_free_pe(pe);
> >>>>            pdn->pe_number =3D IODA_INVALID_PE;
> >>>>            pe->pdev =3D NULL;
> >>>> -        pci_dev_put(dev);
> >>>>            return NULL;
> >>>>        }
> >>>> @@ -1228,7 +1219,7 @@ static struct pnv_ioda_pe=20
*pnv_ioda_setup_npu_PE(struct pci_dev *npu_pdev)
> >>>>                 */
> >>>>                dev_info(&npu_pdev->dev,
> >>>>                    "Associating to existing PE %x\n", pe_num);
> >>>> -            pci_dev_get(npu_pdev);
> >>>> +            pci_dev_get(npu_pdev); // still needed after 902bdc5745=
1c=20
?
> >>>
> >>> Did you mean to leave that comment in?
> >>
> >> Yes, I assumed the series wouldn't get in on the first try and a nvlin=
k-
minded developer would weigh in :)
> >=20
> > I am looking at it and I am still not so sure what exactly guarantees t=
hat=20
lifetime(@dev) =3D=3D lifetime(@pe). For example,
> > sriov_disable() removes VFs first, and only then releases PEs so there =
is a=20
window when we may have a stale pdev. Not sure.
>=20
>=20
> Indeed, for SRIOV, PE life-cycle is handled differently. And hopefully=20
> correctly, but I don=E2=80=99t think this patch alters it.
>=20
> I was discussing with Greg about it, as he had to look in that area in=20
> the past. My understanding is that this patch is ok as it follows the=20
> initial comment in pnv_ioda_setup_dev_PE() that we don=E2=80=99t need to =
get a=20
> reference for the PE, it makes sense and I could trace the origin of the=
=20
> pci_dev_get() and it seemed like it should have been removed in a=20
> previous patch (902bdc57451c).
>=20
> However, one question is whether this patch breaks nvlink and if nvlink=20
> assumes the devices won=E2=80=99t go away because we explicitly take a re=
ference=20
> forever. In npu_dma.c, there are 2 functions which allow to find the GPU=
=20
> associated to a npu device, and vice-versa. Both functions return a=20
> pointer to a struct pci_dev, but they don=E2=80=99t take a reference on t=
he=20
> device being returned. So that seems dangerous. I=E2=80=99m probably miss=
ing=20
> something.
>=20
> Alexey, Alistair: what, if anything, guarantees, that the npu or gpu=20
> devices stay valid. Is it because we simply don=E2=80=99t provide any mea=
ns to=20
> get rid of them ? Otherwise, don=E2=80=99t we need the callers of=20
> pnv_pci_get_gpu_dev() and pnv_pci_get_npu_dev() to worry about reference=
=20
> counting ? I=E2=80=99ve started looking into it and the changes are scary=
, which=20
> explains Greg=E2=80=99s related commit 02c5f5394918b.

To be honest the reference counting looks like it has evolved into somethin=
g=20
quite suspect and I don't think you're missing anything. In practice though=
 we=20
likely haven't hit any issues because the original callers didn't store=20
references to the pdev which would make the window quite small (although th=
e=20
pass through work may have changed that). And as you say there simply wasn'=
t=20
any means to get rid of them anyway (EEH, hotplug, etc. has never been=20
implemented or supported for GPUs and all sorts of terrible things happen i=
f=20
you try).

The best solution would likely be to review the reference counting and to=20
teach callers of get_*_dev() to call pci_put_dev(), etc.

=2D Alistair

>    Fred
>=20
>=20
>=20
> >=20
> >>
> >>    Fred
> >>
> >>
> >>>>                npu_pdn =3D pci_get_pdn(npu_pdev);
> >>>>                rid =3D npu_pdev->bus->number << 8 | npu_pdn->devfn;
> >>>>                npu_pdn->pe_number =3D pe_num;
> >>>>
> >>>
> >>
> >=20
>=20
>=20




