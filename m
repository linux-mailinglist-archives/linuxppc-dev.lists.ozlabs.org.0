Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2283A7828
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 09:41:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G40cN0r98z3bv2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 17:41:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OADxj5IZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OADxj5IZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G40bs586nz306Z
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 17:40:41 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15F7Xi9c062527; Tue, 15 Jun 2021 03:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=g2xnnrDsjk4lamg9UXe7+zaawwdnq2hVSCTue7SdPNU=;
 b=OADxj5IZ+SZJXo15QwAsZmBSHRMKxP4bozgGiu57fXkL4BVwaZrAI3L1o/LFvB+c4s83
 rCYgdkfudFJ2C2P88GGbpGk9e3fW/h8SmbEuGeg6oORBGLfkBHyNTGU8m1UxiWv24O/F
 yE2nEuteIetLIdiC5yCWHLTOfJE7Rbul41JB57pQWFfr+VDY/i7/rt6T5PeE7Aa3LYTN
 h9dIp9W+mBFyXIZn0fzUPodxbWiQ17FAvbqWT7YR8I2cFSrhn9TZ+Fb9hf8BfObKuE99
 joDbDIMw7CuI3b2vYKedQrjIk4R6WVGCRAm8U2KTSAspcOUz7sgTet5/Y/vjX9nWFuah rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396nvmukrw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 03:40:34 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15F7XiKq062526;
 Tue, 15 Jun 2021 03:40:34 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396nvmukrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 03:40:33 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15F7VZZc008752;
 Tue, 15 Jun 2021 07:40:33 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 394mj9k9kc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 07:40:33 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15F7eVZY26280212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 07:40:31 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0FE4C6059;
 Tue, 15 Jun 2021 07:40:31 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 273CBC605A;
 Tue, 15 Jun 2021 07:40:30 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.54.82])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jun 2021 07:40:29 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC PATCH 7/8] powerpc/pseries: Add support for FORM2
 associativity
In-Reply-To: <YMhH7X9Tfq95gY6r@yekko>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-8-aneesh.kumar@linux.ibm.com>
 <YMgkMg0i/6L1SOPd@yekko> <87fsxjofw5.fsf@linux.ibm.com>
 <YMhH7X9Tfq95gY6r@yekko>
Date: Tue, 15 Jun 2021 13:10:27 +0530
Message-ID: <877divo9sk.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6o_Iu0eg1uGc6WqrHKTx1FOpRhSiBXRs
X-Proofpoint-GUID: jfspHZgb8DL_rPKON2HtXSiMDETBu-jR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_04:2021-06-14,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=970 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150045
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

> On Tue, Jun 15, 2021 at 10:58:42AM +0530, Aneesh Kumar K.V wrote:
>> David Gibson <david@gibson.dropbear.id.au> writes:
>>=20
>> > On Mon, Jun 14, 2021 at 10:10:02PM +0530, Aneesh Kumar K.V wrote:
>> >> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> >> ---
>> >>  Documentation/powerpc/associativity.rst   | 139 ++++++++++++++++++++
>> >>  arch/powerpc/include/asm/firmware.h       |   3 +-
>> >>  arch/powerpc/include/asm/prom.h           |   1 +
>> >>  arch/powerpc/kernel/prom_init.c           |   3 +-
>> >>  arch/powerpc/mm/numa.c                    | 149 ++++++++++++++++++++=
+-
>> >>  arch/powerpc/platforms/pseries/firmware.c |   1 +
>> >>  6 files changed, 290 insertions(+), 6 deletions(-)
>> >>  create mode 100644 Documentation/powerpc/associativity.rst
>> >>=20
>> >> diff --git a/Documentation/powerpc/associativity.rst b/Documentation/=
powerpc/associativity.rst
>> >> new file mode 100644
>> >> index 000000000000..58abedea81d7
>> >> --- /dev/null
>> >> +++ b/Documentation/powerpc/associativity.rst
>> >> @@ -0,0 +1,139 @@
>> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>> >> +NUMA resource associativity
>> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>> >> +
>> >> +Associativity represents the groupings of the various platform resou=
rces into
>> >> +domains of substantially similar mean performance relative to resour=
ces outside
>> >> +of that domain. Resources subsets of a given domain that exhibit bet=
ter
>> >> +performance relative to each other than relative to other resources =
subsets
>> >> +are represented as being members of a sub-grouping domain. This perf=
ormance
>> >> +characteristic is presented in terms of NUMA node distance within th=
e Linux kernel.
>> >> +From the platform view, these groups are also referred to as domains.
>> >> +
>> >> +PAPR interface currently supports two different ways of communicatin=
g these resource
>> >
>> > You describe form 2 below as well, which contradicts this.
>>=20
>> Fixed as below.
>>=20
>> PAPR interface currently supports different ways of communicating these =
resource
>> grouping details to the OS. These are referred to as Form 0, Form 1 and =
Form2
>> associativity grouping. Form 0 is the older format and is now considered=
 deprecated.
>>=20
>> Hypervisor indicates the type/form of associativity used via "ibm,arcite=
cture-vec-5 property".
>> Bit 0 of byte 5 in the "ibm,architecture-vec-5" property indicates usage=
 of Form 0 or Form 1.
>> A value of 1 indicates the usage of Form 1 associativity. For Form 2 ass=
ociativity
>> bit 2 of byte 5 in the "ibm,architecture-vec-5" property is used.
>
> LGTM.
>
>> >> +grouping details to the OS. These are referred to as Form 0 and Form=
 1 associativity grouping.
>> >> +Form 0 is the older format and is now considered deprecated.
>> >> +
>> >> +Hypervisor indicates the type/form of associativity used via "ibm,ar=
citecture-vec-5 property".
>> >> +Bit 0 of byte 5 in the "ibm,architecture-vec-5" property indicates u=
sage of Form 0 or Form 1.
>> >> +A value of 1 indicates the usage of Form 1 associativity.
>> >> +
>> >> +Form 0
>> >> +-----
>> >> +Form 0 associativity supports only two NUMA distance (LOCAL and REMO=
TE).
>> >> +
>> >> +Form 1
>> >> +-----
>> >> +With Form 1 a combination of ibm,associativity-reference-points and =
ibm,associativity
>> >> +device tree properties are used to determine the NUMA distance betwe=
en resource groups/domains.=20
>> >> +
>> >> +The =E2=80=9Cibm,associativity=E2=80=9D property contains one or mor=
e lists of numbers (domainID)
>> >> +representing the resource=E2=80=99s platform grouping domains.
>> >> +
>> >> +The =E2=80=9Cibm,associativity-reference-points=E2=80=9D property co=
ntains one or more list of numbers
>> >> +(domain index) that represents the 1 based ordinal in the associativ=
ity lists of the most
>> >> +significant boundary, with subsequent entries indicating progressive=
ly less significant boundaries.
>> >> +
>> >> +Linux kernel uses the domain id of the most significant boundary (ak=
a primary domain)
>> >
>> > I thought we used the *least* significant boundary (the smallest
>> > grouping, not the largest).  That is, the last index, not the first.
>> >
>> > Actually... come to think of it, I'm not even sure how to interpret
>> > "most significant".  Does that mean a change in grouping at that "most
>> > significant" level results in the largest perfomance difference?
>>=20
>> PAPR defines "most significant" as below
>>=20
>> When the =E2=80=9Cibm,architecture-vec-5=E2=80=9D property byte 5 bit 0 =
has the value of one, the =E2=80=9Cibm,associativ-
>> ity-reference-points=E2=80=9D property indicates boundaries between asso=
ciativity domains presented by the
>> =E2=80=9Cibm,associativity=E2=80=9D property containing =E2=80=9Cnear=E2=
=80=9D and =E2=80=9Cfar=E2=80=9D resources. The
>> first such boundary in the list represents the 1 based ordinal in the
>> associativity lists of the most significant boundary, with subsequent
>> entries indicating progressively less significant boundaries
>
> No... that's not a definition.  Like your draft PAPR uses the term
> while entirely failing to define it.  From what I can tell about how
> it is used the "most significant" boundary corresponds to what Linux
> simply thinks of as the node id.  But intuitively, I'd think of that
> as the "least significant" boundary, since that's basically the
> smallest granularity at which we care about NUMA distances.
>
>
>> I would interpret it as the boundary where we start defining NUMA
>> nodes.
>
> That isn't any clearer to me.

How about calling it least significant boundary then?=20

The =E2=80=9Cibm,associativity-reference-points=E2=80=9D property contains =
one or more list of numbers
(domainID index) that represents the 1 based ordinal in the associativity l=
ists of the
least significant boundary, with subsequent entries indicating progressivel=
y higher
significant boundaries.

ex:
{ primary domainID index, secondary domainID index, tertiary domainID index=
.. }

Linux kernel uses the domainID of the least significant boundary (aka prima=
ry domain)
as the NUMA node id. Linux kernel computes NUMA distance between two domain=
s by
recursively comparing if they belong to the same higher-level domains. For =
mismatch
at every higher level of the resource group, the kernel doubles the NUMA di=
stance between
the comparing domains.

>
>> >> +as the NUMA node id. Linux kernel computes NUMA distance between two=
 domains by
>> >> +recursively comparing if they belong to the same higher-level domain=
s. For mismatch
>> >> +at every higher level of the resource group, the kernel doubles the =
NUMA distance between
>> >> +the comparing domains.
>> >> +
>> >> +Form 2
>> >> +-------
>> >> +Form 2 associativity format adds separate device tree properties rep=
resenting NUMA node distance
>> >> +thereby making the node distance computation flexible. Form 2 also a=
llows flexible primary
>> >> +domain numbering. With numa distance computation now detached from t=
he index value of
>> >> +"ibm,associativity" property, Form 2 allows a large number of primar=
y domain ids at the
>> >> +same domain index representing resource groups of different
>> >> performance/latency characteristics.
>> >
>> > The meaning of "domain index" is not clear to me here.
>>=20
>> Sorry for the confusion there. domain index is the index where domainID
>> is appearing. W.r.t "ibm,associativity"  we have
>
> Ok, I think I eventually deduced that.  We should start out clearly
> defining both domainID and index here.
>
> Also.. I think we need to find more distinct terms, because "index" is
> being used for both where the ID appears in an associativity array,
> and also when an ID appears in the Form2 "lookup-index-table" and the
> two usages are totally unconnected.
>
>> The =E2=80=9Cibm,associativity=E2=80=9D property contains one or more li=
sts of numbers (domainID)
>> representing the resource=E2=80=99s platform grouping domains. If we can=
 look at
>> an example property.
>>=20
>> { 4, 6, 7, 0, 0}
>> { 4, 6, 7, 0, 40}
>>=20
>> With Form 1 both NUMA node 0 and 40 will appear at the same distance.
>> They both are at domain index 4. With Form 2 we can represent them with
>> different NUMA distance values.
>
> Ok.  Note that PAPR was never clear about what space domain IDs need
> to be unique within: do they need to be (a) globally unique (not true
> in practice), (b) unique at their index level or (c) unique only
> within their "parent" node at the previous index level.
>
> We should take the opportunity with Form2 to make that clearer.
>
> My understanding is that with Form2 it should be entirely feasible to
> built a dt have associativity arrays that are always of length 1.  Is
> that correct?

Correct, unless you have persistent memory device attached in which case
you need two entries.

>
>> >> +
>> >> +Hypervisor indicates the usage of FORM2 associativity using bit 2 of=
 byte 5 in the
>> >> +"ibm,architecture-vec-5" property.
>> >> +
>> >> +"ibm,numa-lookup-index-table" property contains one or more list num=
bers representing
>> >> +the domainIDs present in the system. The offset of the domainID in t=
his property is considered
>> >> +the domainID index.
>> >
>> > You haven't really introduced the term "domainID".  Is "domainID
>> > index" the same as "domain index" above?  It's not clear to me.
>>=20
>> The earlier part of the documented said=20
>>=20
>> The =E2=80=9Cibm,associativity=E2=80=9D property contains one or more li=
sts of numbers (domainID)
>> representing the resource=E2=80=99s platform grouping domains.
>>=20
>> I will update domain index to domainID index.=20
>>=20
>> >
>> > The distinction between "domain index" and "primary domain id" is also
>> > not clear to me.
>>=20
>> primary domain id is the domainID appearing in the primary domainID
>> index. Linux kenrel also use that as the NUMA node number.
>
> nit s/kenrel/kernel/
>
>> Primary domainID index is defined by ibm,associativity-reference-points
>> and we consider that as the most significant resource group boundary.
>>=20
>> ibm,associativity-reference-points can be looked at as
>> { primary domainID index, secondary domainID index, tertiary domainID in=
dex.. }
>
> Ok, explicitly stating that in the doc would help a lot.
>
>> >
>> >> +prop-encoded-array: The number N of the domainIDs encoded as with en=
code-int, followed by
>> >> +N domainID encoded as with encode-int
>> >> +
>> >> +For ex:
>> >> +ibm,numa-lookup-index-table =3D  {4, 0, 8, 250, 252}, domainID index=
 for domainID 8 is 1.
>> >
>> > Above you say "Form 2 allows a large number of primary domain ids at
>> > the same domain index", but this encoding doesn't appear to permit
>> > that.
>>=20
>> I didn't follow that question.
>
> Ah, that's because I was thinking of index here as the index within
> the lookup-index-table, not the index within the associativity
> arrays.
>
>> >
>> >> +"ibm,numa-distance-table" property contains one or more list of numb=
ers representing the NUMA
>> >> +distance between resource groups/domains present in the system.
>> >> +
>> >> +prop-encoded-array: The number N of the distance values encoded as w=
ith encode-int, followed by
>> >> +N distance values encoded as with encode-bytes. The max distance val=
ue we could encode is 255.
>> >> +
>> >> +For ex:
>> >> +ibm,numa-lookup-index-table =3D  {3, 0, 8, 40}
>> >> +ibm,numa-distance-table     =3D  {9, 1, 2, 8, 2, 1, 16, 8, 16, 1}
>> >> +
>> >> +  | 0    8   40
>> >> +--|------------
>> >> +  |
>> >> +0 | 10   20  80
>> >> +  |
>> >> +8 | 20   10  160
>> >> +  |
>> >> +40| 80   160  10
>> >
>> > What's the reason for multiplying the values by 10 in the expanded
>> > table version?
>>=20
>> That was me missing a document update. Since we used 8 bits to encode
>> distance at some point we were looking at a SCALE factor. But later
>> realized other architectures also restrict distance to 8 bits. I will
>> update ibm,numa-distance-table in the document.
>
> Ok.
>
>> >> +
>> >> +With Form2 "ibm,associativity" for resources is listed as below:
>> >> +
>> >> +"ibm,associativity" property for resources in node 0, 8 and 40
>> >> +{ 4, 6, 7, 0, 0}
>> >> +{ 4, 6, 9, 8, 8}
>> >> +{ 4, 6, 7, 0, 40}
>> >> +
>> >> +With "ibm,associativity-reference-points"  { 0x4, 0x3, 0x2 }
>> >> +
>> >> +With Form2 the primary domainID and secondary domainID are used to i=
dentify the NUMA nodes
>> >
>> > What the heck is the secondary domainID
>>=20
>> domainID appearing the secondary domainID index.
>
> I understand that from the clarifications you've made about, but
> second domainID index wasn't any more defined in the original draft.
>
>> ibm,associativity-reference-points gives an indication of different
>> hierachy of resource grouping as below.
>>=20
>> ibm,associativity-reference-points can be looked at as
>> { primary domainID index, secondary domainID index, tertiary domainID in=
dex.. }
>>=20
>> >
>> >> +the kernel should use when using persistent memory devices. Persiste=
nt memory devices
>> >> +can also be used as regular memory using DAX KMEM driver and primary=
 domainID indicates
>> >> +the numa node number OS should use when using these devices as regul=
ar memory. Secondary
>> >> +domainID is the numa node number that should be used when using this=
 device as
>> >> +persistent memory. In the later case, we are interested in the local=
ity of the
>> >> +device to an established numa node. In the above example, if the las=
t row represents a
>> >> +persistent memory device/resource, NUMA node number 40 will be used =
when using the device
>> >> +as regular memory and NUMA node number 0 will be the device numa nod=
e when using it as
>> >> +a persistent memory device.
>> >> +
>> >> +Each resource (drcIndex) now also supports additional optional devic=
e tree properties.
>> >> +These properties are marked optional because the platform can choose=
 not to export
>> >> +them and provide the system topology details using the earlier defin=
ed device tree
>> >> +properties alone. The optional device tree properties are used when =
adding new resources
>> >> +(DLPAR) and when the platform didn't provide the topology details of=
 the domain which
>> >> +contains the newly added resource during boot.
>> >> +
>> >> +"ibm,numa-lookup-index" property contains a number representing the =
domainID index to be used
>> >> +when building the NUMA distance of the numa node to which this resou=
rce belongs. The domain id
>> >> +of the new resource can be obtained from the existing "ibm,associati=
vity" property. This
>> >> +can be used to build distance information of a newly onlined NUMA no=
de via DLPAR operation.
>> >> +The value is 1 based array index value.
>> >
>> > Am I correct in thinking that if we have an entirely form2 world, we'd
>> > only need this and the ibm,associativity properties could be dropped?
>>=20
>> Not really. ibm,numa-lookup-index-table was added to have a concise
>> representation of numa distance via ibm,numa-distance-table.=20
>>=20
>> For ex: With domainID 0, 4, 5 we could do a 5x5 matrix to represent the
>> numa distance. Instead ibm,numa-lookup-index-table allows us to present
>> the same in a 3x3 matrix  distance[index0][index1] is the  distance
>> between NUMA node 0 and 4 and distance[index0][index2] is the distance
>> between NUMA node 0 and 5
>
> Right, I get the purpose of it, and I realized I misphrashed my
> question.  My point is that in a Form2 world, the *only* thing the
> associativity array is used for is to deduce its position in
> lookup-index-table.  Once you have have that for each resource, you
> have everything you need, yes?


ibm,associativity is used find the domainID/NUMA node id of the
resource.

ibm,lookup-index-table is used compute the distance information between
NUMA nodes using ibm,numa-distance-table.


>
>>=20
>>=20
>> >
>> >> +
>> >> +prop-encoded-array: An integer encoded as with encode-int specifying=
 the domainID index
>> >> +
>> >> +"ibm,numa-distance" property contains one or more list of numbers pr=
esenting the NUMA distance
>> >> +from this resource domain to other resources.
>> >
>> > IIUC this is about extending the global distance table with
>> > information for a new node.  Is that correct?
>>=20
>> correct.
>>=20
>> >
>> > The global distance table allows for the possibility of asymmetric
>> > distances between nodes, but this does not.  Is that intentional?
>>=20
>> This also does, For example with 3 nodes currently present and 4 node
>> getting added ibm,numa-distance have 8 elements enabling us to have
>> distance[Node0][Node50] being different from distance[Node50][Node0]
>> as shown below.
>
> Ok that's not clear from the above.  Rather than "one or more lists of
> numbers" I think you want to explicitly give two options.  Either one
> list, which gives symmetric distances, or two which gives distances
> to, then distance from.
>
>>=20
>> >
>> >> +prop-encoded-array: The number N of the distance values encoded as w=
ith encode-int, followed by
>> >> +N distance values encoded as with encode-bytes. The max distance val=
ue we could encode is 255.
>> >> +
>> >> +For ex:
>> >> +ibm,associativity     =3D { 4, 5, 6, 7, 50}
>> >> +ibm,numa-lookup-index =3D { 4 }
>> >> +ibm,numa-distance   =3D  {8, 16, 32, 8, 1, 16, 32, 8, 1}
>> >> +
>> >> +resulting in a new toplogy as below.
>> >> +  | 0    8   40   50
>> >> +--|------------------
>> >> +  |
>> >> +0 | 10   20  80   160
>> >> +  |
>> >> +8 | 20   10  160  320
>> >> +  |
>> >> +40| 80   160  10  80
>> >> +  |
>> >> +50| 160  320  80  10
>>=20
>

-aneesh
