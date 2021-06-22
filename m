Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 775943B03CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 14:08:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8QD40pHyz3btr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 22:08:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ov1a/CRD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ov1a/CRD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8QCW5cBwz2yxm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 22:08:23 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15MC5op4019554; Tue, 22 Jun 2021 08:08:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Sr+2o3TbBATfXlQfXphrTP8TzSTtTrQID0YrpDeSPvM=;
 b=ov1a/CRD9lzkTqJgdoXiJRAEbdPTU8WnmjPQbkPkMXXtG2pnSllEbYRFEIhE3x9G7ma+
 Vpa7wq7xlrsuIMjWDA+/UYwqh9OdRQBds2weuSRGp1BiKCZuSSdTPc280BzXYOnBLytv
 ojRnRpWzVrn6NWr13IJZuVlwAcdSXCXuOof2u5QkcYJm1b2cy9XbR3swpCHsvk3pDdys
 xh395BxrMXAh80nW/7CR30qoFJR+/aakqW7L++SBkQ0is/TfTHfTn627rkXT8zFUSmOE
 AwiOB342ss6cjrWR2GpK9H2M8LQ+18kPk3as6EtsFRnE5vzBJav7SnZQh6y30wIfdQsL uA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39bdxk2nty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 08:08:06 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15MC6MwB023347;
 Tue, 22 Jun 2021 08:08:05 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39bdxk2ntj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 08:08:05 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15MC2ZLC004205;
 Tue, 22 Jun 2021 12:08:04 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 399879n4wv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Jun 2021 12:08:04 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15MC83Ua30736848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Jun 2021 12:08:03 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2B3EAC064;
 Tue, 22 Jun 2021 12:08:03 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76495AC05F;
 Tue, 22 Jun 2021 12:08:01 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.58.66])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 22 Jun 2021 12:08:01 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: Re: [PATCH v4 7/7] powerpc/pseries: Add support for FORM2
 associativity
In-Reply-To: <e500697d-1866-538c-eaff-613e04a92c93@gmail.com>
References: <20210617165105.574178-1-aneesh.kumar@linux.ibm.com>
 <20210617165105.574178-8-aneesh.kumar@linux.ibm.com>
 <e500697d-1866-538c-eaff-613e04a92c93@gmail.com>
Date: Tue, 22 Jun 2021 17:37:55 +0530
Message-ID: <87mtrihzl0.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YhEMA8fyDEji18dAMGRmstzMh884M7KB
X-Proofpoint-GUID: Nd3GhaHh7vHQ19m31Gj1tCifw2J4VOhZ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-22_06:2021-06-21,
 2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxscore=0 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106220077
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, nvdimm@lists.linux.dev,
 dan.j.williams@intel.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> On 6/17/21 1:51 PM, Aneesh Kumar K.V wrote:
>> PAPR interface currently supports two different ways of communicating re=
source
>> grouping details to the OS. These are referred to as Form 0 and Form 1
>> associativity grouping. Form 0 is the older format and is now considered
>> deprecated. This patch adds another resource grouping named FORM2.
>>=20
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   Documentation/powerpc/associativity.rst   | 135 ++++++++++++++++++++
>>   arch/powerpc/include/asm/firmware.h       |   3 +-
>>   arch/powerpc/include/asm/prom.h           |   1 +
>>   arch/powerpc/kernel/prom_init.c           |   3 +-
>>   arch/powerpc/mm/numa.c                    | 149 +++++++++++++++++++++-
>>   arch/powerpc/platforms/pseries/firmware.c |   1 +
>>   6 files changed, 286 insertions(+), 6 deletions(-)
>>   create mode 100644 Documentation/powerpc/associativity.rst
>>=20
>> diff --git a/Documentation/powerpc/associativity.rst b/Documentation/pow=
erpc/associativity.rst
>> new file mode 100644
>> index 000000000000..93be604ac54d
>> --- /dev/null
>> +++ b/Documentation/powerpc/associativity.rst
>> @@ -0,0 +1,135 @@
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>> +NUMA resource associativity
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>> +
>> +Associativity represents the groupings of the various platform resource=
s into
>> +domains of substantially similar mean performance relative to resources=
 outside
>> +of that domain. Resources subsets of a given domain that exhibit better
>> +performance relative to each other than relative to other resources sub=
sets
>> +are represented as being members of a sub-grouping domain. This perform=
ance
>> +characteristic is presented in terms of NUMA node distance within the L=
inux kernel.
>> +From the platform view, these groups are also referred to as domains.
>> +
>> +PAPR interface currently supports different ways of communicating these=
 resource
>> +grouping details to the OS. These are referred to as Form 0, Form 1 and=
 Form2
>> +associativity grouping. Form 0 is the older format and is now considere=
d deprecated.
>> +
>> +Hypervisor indicates the type/form of associativity used via "ibm,arcit=
ecture-vec-5 property".
>> +Bit 0 of byte 5 in the "ibm,architecture-vec-5" property indicates usag=
e of Form 0 or Form 1.
>> +A value of 1 indicates the usage of Form 1 associativity. For Form 2 as=
sociativity
>> +bit 2 of byte 5 in the "ibm,architecture-vec-5" property is used.
>> +
>> +Form 0
>> +-----
>> +Form 0 associativity supports only two NUMA distance (LOCAL and REMOTE).
>> +
>> +Form 1
>> +-----
>> +With Form 1 a combination of ibm,associativity-reference-points and ibm=
,associativity
>> +device tree properties are used to determine the NUMA distance between =
resource groups/domains.
>> +
>> +The =E2=80=9Cibm,associativity=E2=80=9D property contains one or more l=
ists of numbers (domainID)
>> +representing the resource=E2=80=99s platform grouping domains.
>> +
>> +The =E2=80=9Cibm,associativity-reference-points=E2=80=9D property conta=
ins one or more list of numbers
>> +(domainID index) that represents the 1 based ordinal in the associativi=
ty lists.
>> +The list of domainID index represnets increasing hierachy of resource g=
rouping.
>> +
>> +ex:
>> +{ primary domainID index, secondary domainID index, tertiary domainID i=
ndex.. }
>> +
>> +Linux kernel uses the domainID at the primary domainID index as the NUM=
A node id.
>> +Linux kernel computes NUMA distance between two domains by recursively =
comparing
>> +if they belong to the same higher-level domains. For mismatch at every =
higher
>> +level of the resource group, the kernel doubles the NUMA distance betwe=
en the
>> +comparing domains.
>> +
>> +Form 2
>> +-------
>> +Form 2 associativity format adds separate device tree properties repres=
enting NUMA node distance
>> +thereby making the node distance computation flexible. Form 2 also allo=
ws flexible primary
>> +domain numbering. With numa distance computation now detached from the =
index value of
>> +"ibm,associativity" property, Form 2 allows a large number of primary d=
omain ids at the
>> +same domainID index representing resource groups of different performan=
ce/latency characteristics.
>> +
>> +Hypervisor indicates the usage of FORM2 associativity using bit 2 of by=
te 5 in the
>> +"ibm,architecture-vec-5" property.
>> +
>> +"ibm,numa-lookup-index-table" property contains one or more list number=
s representing
>> +the domainIDs present in the system. The offset of the domainID in this=
 property is considered
>> +the domainID index.
>> +
>> +prop-encoded-array: The number N of the domainIDs encoded as with encod=
e-int, followed by
>> +N domainID encoded as with encode-int
>> +
>> +For ex:
>> +ibm,numa-lookup-index-table =3D  {4, 0, 8, 250, 252}, domainID index fo=
r domainID 8 is 1.
>> +
>> +"ibm,numa-distance-table" property contains one or more list of numbers=
 representing the NUMA
>> +distance between resource groups/domains present in the system.
>> +
>> +prop-encoded-array: The number N of the distance values encoded as with=
 encode-int, followed by
>> +N distance values encoded as with encode-bytes. The max distance value =
we could encode is 255.
>> +
>> +For ex:
>> +ibm,numa-lookup-index-table =3D  {3, 0, 8, 40}
>> +ibm,numa-distance-table     =3D  {9, 10, 20, 80, 20, 10, 160, 80, 160, =
10}
>> +
>> +  | 0    8   40
>> +--|------------
>> +  |
>> +0 | 10   20  80
>> +  |
>> +8 | 20   10  160
>> +  |
>> +40| 80   160  10
>> +
>> +
>> +"ibm,associativity" property for resources in node 0, 8 and 40
>> +
>> +{ 3, 6, 7, 0 }
>> +{ 3, 6, 9, 8 }
>> +{ 3, 6, 7, 40}
>> +
>> +With "ibm,associativity-reference-points"  { 0x3 }
>
> With this configuration, would the following ibm,associativity arrays
> also be valid?
>
>
> { 3, 0, 0, 0 }
> { 3, 0, 0, 8 }
> { 3, 0, 0, 40}
>

Yes

> If yes, then we need a way to tell that the associativity domains assignm=
ent
> are optional, and FORM2 relies solely on finding out the domainID of the
> resource (0, 8 and 40) to retrieve the domainID index, and with this
> index all performance metrics can be retrieved from the numa-* properties
> (numa-distance-table, numa-bandwidth-table ...).
>

Where do you suggest we clarify that? I agree that it is not explicitly
mentioned. But we describe the details of how we find the numa distance
with example in the document.

> Retrieving the resource domainID is done by using ibm,associativity-refer=
ence-points.
>
> This will allow the platform to implement FORM2 such as:
>
> { 1, 0 }
> { 1, 8 }
> { 1, 40 }
>=20=20=20
> - ref-points: { 0x1 }
>
> If the platform chooses to do so.
>

That is correct.

>
>> +
>> +Each resource (drcIndex) now also supports additional optional device t=
ree properties.
>> +These properties are marked optional because the platform can choose no=
t to export
>> +them and provide the system topology details using the earlier defined =
device tree
>> +properties alone. The optional device tree properties are used when add=
ing new resources
>> +(DLPAR) and when the platform didn't provide the topology details of th=
e domain which
>> +contains the newly added resource during boot.
>> +
>> +"ibm,numa-lookup-index" property contains a number representing the dom=
ainID index to be used
>> +when building the NUMA distance of the numa node to which this resource=
 belongs. This can
>> +be looked at as the index at which this new domainID would have appeare=
d in
>> +"ibm,numa-lookup-index-table" if the domain was present during boot. Th=
e domainID
>> +of the new resource can be obtained from the existing "ibm,associativit=
y" property. This
>> +can be used to build distance information of a newly onlined NUMA node =
via DLPAR operation.
>> +The value is 1 based array index value.
>> +
>> +prop-encoded-array: An integer encoded as with encode-int specifying th=
e domainID index
>> +
>> +"ibm,numa-distance" property contains one or more list of numbers prese=
nting the NUMA distance
>> +from this resource domain to other resources.
>> +
>> +prop-encoded-array: The number N of the distance values encoded as with=
 encode-int, followed by
>> +N distance values encoded as with encode-bytes. The max distance value =
we could encode is 255.
>> +
>> +For ex:
>> +ibm,associativity     =3D { 4, 5, 10, 50}
>> +ibm,numa-lookup-index =3D { 4 }
>> +ibm,numa-distance   =3D  {8, 160, 255, 80, 10, 160, 255, 80, 10}
>> +
>> +resulting in a new toplogy as below.
>> +  | 0    8   40   50
>> +--|------------------
>> +  |
>> +0 | 10   20  80   160
>> +  |
>> +8 | 20   10  160  255
>> +  |
>> +40| 80   160  10  80
>> +  |
>> +50| 160  255  80  10
>> +
>
> I see there is no mention of the special PAPR SCM handling. I saw in
> one of the your replies of v1:
>
> "Another option is to make sure that numa-distance-value is populated
> such that PMEMB distance indicates it is closer to node0 when compared
> to node1. ie, node_distance[40][0] < node_distance[40][1]. One could
> possibly infer the grouping based on the distance value and not deepend
> on ibm,associativity for that purpose."
>
>
> Is that was we're supposed to do with PAPR SCM? I'm not sure how that
> affects NVDIMM support in QEMU with FORM2.
>
>

yes that is what we are doing with this version of the patchset (v4)
version. We can drop the nvdimm specific changes from Qemu.

-aneesh
