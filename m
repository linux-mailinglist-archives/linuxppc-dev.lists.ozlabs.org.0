Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F863A767A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 07:29:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3xhR2JDwz3bnW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 15:29:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pRWND1/N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pRWND1/N; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3xgt1Hjbz3021
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 15:28:57 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15F53Wlp106363; Tue, 15 Jun 2021 01:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=hbVf0eHfnzXG5RvFt8GK6IzvYPOb3InBUhJuXppnNJY=;
 b=pRWND1/N5SPyi0ZAICu3iOIP/6HT8ov46rOY1i+RRWBQJKxUN2hmdZcS1YdqAzf9qNnG
 rgjwBbjjW8Wl2Tt6wMyiOhvkkPncWQdsS5A3h0NEfW8Rg/BIx+eGehyFCXaVmgFOhX2S
 3oBEDPYkOUHjdtB2Sljvi2P8egZajXVdwLSBEnVmAsvGwLLgHT7NN28W2NT7PDs37y26
 3AQO6SrqKCpDhAuhfKrXmko7hcy/v3mztc1sEiUmyaownFemxEKQrqNtzaPIGzNxbiKw
 N3f8yvW8BbkukAZNDzNHmnGm+Qagpl67FLQSGfBOg+8ZTDZLin3LMQs7Pl2dIaVQiEU0 Fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396hq1dyxa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 01:28:48 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15F5Gsj7018458;
 Tue, 15 Jun 2021 01:28:48 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396hq1dywx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 01:28:48 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15F5RQIE019255;
 Tue, 15 Jun 2021 05:28:47 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 394mj956jw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 05:28:47 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15F5Skpp9044536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 05:28:46 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B205FB206A;
 Tue, 15 Jun 2021 05:28:46 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AF36B2064;
 Tue, 15 Jun 2021 05:28:45 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.54.82])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jun 2021 05:28:44 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC PATCH 7/8] powerpc/pseries: Add support for FORM2
 associativity
In-Reply-To: <YMgkMg0i/6L1SOPd@yekko>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-8-aneesh.kumar@linux.ibm.com>
 <YMgkMg0i/6L1SOPd@yekko>
Date: Tue, 15 Jun 2021 10:58:42 +0530
Message-ID: <87fsxjofw5.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7RAfK_eLK1IavwcUDfWsE3_xCuqN2EyM
X-Proofpoint-ORIG-GUID: D05-RJzggHkFt2J8_Xy7shfvdokkEsR2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_03:2021-06-14,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=738 malwarescore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150029
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Mon, Jun 14, 2021 at 10:10:02PM +0530, Aneesh Kumar K.V wrote:
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  Documentation/powerpc/associativity.rst   | 139 ++++++++++++++++++++
>>  arch/powerpc/include/asm/firmware.h       |   3 +-
>>  arch/powerpc/include/asm/prom.h           |   1 +
>>  arch/powerpc/kernel/prom_init.c           |   3 +-
>>  arch/powerpc/mm/numa.c                    | 149 +++++++++++++++++++++-
>>  arch/powerpc/platforms/pseries/firmware.c |   1 +
>>  6 files changed, 290 insertions(+), 6 deletions(-)
>>  create mode 100644 Documentation/powerpc/associativity.rst
>>=20
>> diff --git a/Documentation/powerpc/associativity.rst b/Documentation/pow=
erpc/associativity.rst
>> new file mode 100644
>> index 000000000000..58abedea81d7
>> --- /dev/null
>> +++ b/Documentation/powerpc/associativity.rst
>> @@ -0,0 +1,139 @@
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
>> +PAPR interface currently supports two different ways of communicating t=
hese resource
>
> You describe form 2 below as well, which contradicts this.

Fixed as below.

PAPR interface currently supports different ways of communicating these res=
ource
grouping details to the OS. These are referred to as Form 0, Form 1 and For=
m2
associativity grouping. Form 0 is the older format and is now considered de=
precated.

Hypervisor indicates the type/form of associativity used via "ibm,arcitectu=
re-vec-5 property".
Bit 0 of byte 5 in the "ibm,architecture-vec-5" property indicates usage of=
 Form 0 or Form 1.
A value of 1 indicates the usage of Form 1 associativity. For Form 2 associ=
ativity
bit 2 of byte 5 in the "ibm,architecture-vec-5" property is used.



>
>> +grouping details to the OS. These are referred to as Form 0 and Form 1 =
associativity grouping.
>> +Form 0 is the older format and is now considered deprecated.
>> +
>> +Hypervisor indicates the type/form of associativity used via "ibm,arcit=
ecture-vec-5 property".
>> +Bit 0 of byte 5 in the "ibm,architecture-vec-5" property indicates usag=
e of Form 0 or Form 1.
>> +A value of 1 indicates the usage of Form 1 associativity.
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
resource groups/domains.=20
>> +
>> +The =E2=80=9Cibm,associativity=E2=80=9D property contains one or more l=
ists of numbers (domainID)
>> +representing the resource=E2=80=99s platform grouping domains.
>> +
>> +The =E2=80=9Cibm,associativity-reference-points=E2=80=9D property conta=
ins one or more list of numbers
>> +(domain index) that represents the 1 based ordinal in the associativity=
 lists of the most
>> +significant boundary, with subsequent entries indicating progressively =
less significant boundaries.
>> +
>> +Linux kernel uses the domain id of the most significant boundary (aka p=
rimary domain)
>
> I thought we used the *least* significant boundary (the smallest
> grouping, not the largest).  That is, the last index, not the first.
>
> Actually... come to think of it, I'm not even sure how to interpret
> "most significant".  Does that mean a change in grouping at that "most
> significant" level results in the largest perfomance difference?

PAPR defines "most significant" as below

When the =E2=80=9Cibm,architecture-vec-5=E2=80=9D property byte 5 bit 0 has=
 the value of one, the =E2=80=9Cibm,associativ-
ity-reference-points=E2=80=9D property indicates boundaries between associa=
tivity domains presented by the
=E2=80=9Cibm,associativity=E2=80=9D property containing =E2=80=9Cnear=E2=80=
=9D and =E2=80=9Cfar=E2=80=9D resources. The
first such boundary in the list represents the 1 based ordinal in the
associativity lists of the most significant boundary, with subsequent
entries indicating progressively less significant boundaries

I would interpret it as the boundary where we start defining NUMA nodes.

>
>> +as the NUMA node id. Linux kernel computes NUMA distance between two do=
mains by
>> +recursively comparing if they belong to the same higher-level domains. =
For mismatch
>> +at every higher level of the resource group, the kernel doubles the NUM=
A distance between
>> +the comparing domains.
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
>> +same domain index representing resource groups of different
>> performance/latency characteristics.
>
> The meaning of "domain index" is not clear to me here.

Sorry for the confusion there. domain index is the index where domainID
is appearing. W.r.t "ibm,associativity"  we have=20

The =E2=80=9Cibm,associativity=E2=80=9D property contains one or more lists=
 of numbers (domainID)
representing the resource=E2=80=99s platform grouping domains. If we can lo=
ok at
an example property.

{ 4, 6, 7, 0, 0}
{ 4, 6, 7, 0, 40}

With Form 1 both NUMA node 0 and 40 will appear at the same distance.
They both are at domain index 4. With Form 2 we can represent them with
different NUMA distance values.=20


>
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
>
> You haven't really introduced the term "domainID".  Is "domainID
> index" the same as "domain index" above?  It's not clear to me.

The earlier part of the documented said=20

The =E2=80=9Cibm,associativity=E2=80=9D property contains one or more lists=
 of numbers (domainID)
representing the resource=E2=80=99s platform grouping domains.

I will update domain index to domainID index.=20

>
> The distinction between "domain index" and "primary domain id" is also
> not clear to me.

primary domain id is the domainID appearing in the primary domainID
index. Linux kenrel also use that as the NUMA node number.
Primary domainID index is defined by ibm,associativity-reference-points
and we consider that as the most significant resource group boundary.

ibm,associativity-reference-points can be looked at as
{ primary domainID index, secondary domainID index, tertiary domainID index=
.. }


>
>> +prop-encoded-array: The number N of the domainIDs encoded as with encod=
e-int, followed by
>> +N domainID encoded as with encode-int
>> +
>> +For ex:
>> +ibm,numa-lookup-index-table =3D  {4, 0, 8, 250, 252}, domainID index fo=
r domainID 8 is 1.
>
> Above you say "Form 2 allows a large number of primary domain ids at
> the same domain index", but this encoding doesn't appear to permit
> that.

I didn't follow that question.

>
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
>> +ibm,numa-distance-table     =3D  {9, 1, 2, 8, 2, 1, 16, 8, 16, 1}
>> +
>> +  | 0    8   40
>> +--|------------
>> +  |
>> +0 | 10   20  80
>> +  |
>> +8 | 20   10  160
>> +  |
>> +40| 80   160  10
>
> What's the reason for multiplying the values by 10 in the expanded
> table version?

That was me missing a document update. Since we used 8 bits to encode
distance at some point we were looking at a SCALE factor. But later
realized other architectures also restrict distance to 8 bits. I will
update ibm,numa-distance-table in the document.

>
>> +
>> +With Form2 "ibm,associativity" for resources is listed as below:
>> +
>> +"ibm,associativity" property for resources in node 0, 8 and 40
>> +{ 4, 6, 7, 0, 0}
>> +{ 4, 6, 9, 8, 8}
>> +{ 4, 6, 7, 0, 40}
>> +
>> +With "ibm,associativity-reference-points"  { 0x4, 0x3, 0x2 }
>> +
>> +With Form2 the primary domainID and secondary domainID are used to iden=
tify the NUMA nodes
>
> What the heck is the secondary domainID

domainID appearing the secondary domainID index.
ibm,associativity-reference-points gives an indication of different
hierachy of resource grouping as below.

ibm,associativity-reference-points can be looked at as
{ primary domainID index, secondary domainID index, tertiary domainID index=
.. }

>
>> +the kernel should use when using persistent memory devices. Persistent =
memory devices
>> +can also be used as regular memory using DAX KMEM driver and primary do=
mainID indicates
>> +the numa node number OS should use when using these devices as regular =
memory. Secondary
>> +domainID is the numa node number that should be used when using this de=
vice as
>> +persistent memory. In the later case, we are interested in the locality=
 of the
>> +device to an established numa node. In the above example, if the last r=
ow represents a
>> +persistent memory device/resource, NUMA node number 40 will be used whe=
n using the device
>> +as regular memory and NUMA node number 0 will be the device numa node w=
hen using it as
>> +a persistent memory device.
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
 belongs. The domain id
>> +of the new resource can be obtained from the existing "ibm,associativit=
y" property. This
>> +can be used to build distance information of a newly onlined NUMA node =
via DLPAR operation.
>> +The value is 1 based array index value.
>
> Am I correct in thinking that if we have an entirely form2 world, we'd
> only need this and the ibm,associativity properties could be dropped?

Not really. ibm,numa-lookup-index-table was added to have a concise
representation of numa distance via ibm,numa-distance-table.=20

For ex: With domainID 0, 4, 5 we could do a 5x5 matrix to represent the
numa distance. Instead ibm,numa-lookup-index-table allows us to present
the same in a 3x3 matrix  distance[index0][index1] is the  distance
between NUMA node 0 and 4 and distance[index0][index2] is the distance
between NUMA node 0 and 5


>
>> +
>> +prop-encoded-array: An integer encoded as with encode-int specifying th=
e domainID index
>> +
>> +"ibm,numa-distance" property contains one or more list of numbers prese=
nting the NUMA distance
>> +from this resource domain to other resources.
>
> IIUC this is about extending the global distance table with
> information for a new node.  Is that correct?

correct.

>
> The global distance table allows for the possibility of asymmetric
> distances between nodes, but this does not.  Is that intentional?

This also does, For example with 3 nodes currently present and 4 node
getting added ibm,numa-distance have 8 elements enabling us to have
distance[Node0][Node50] being different from distance[Node50][Node0]
as shown below.

>
>> +prop-encoded-array: The number N of the distance values encoded as with=
 encode-int, followed by
>> +N distance values encoded as with encode-bytes. The max distance value =
we could encode is 255.
>> +
>> +For ex:
>> +ibm,associativity     =3D { 4, 5, 6, 7, 50}
>> +ibm,numa-lookup-index =3D { 4 }
>> +ibm,numa-distance   =3D  {8, 16, 32, 8, 1, 16, 32, 8, 1}
>> +
>> +resulting in a new toplogy as below.
>> +  | 0    8   40   50
>> +--|------------------
>> +  |
>> +0 | 10   20  80   160
>> +  |
>> +8 | 20   10  160  320
>> +  |
>> +40| 80   160  10  80
>> +  |
>> +50| 160  320  80  10
