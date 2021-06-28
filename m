Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD1D3B6638
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 17:54:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDBxk5GBhz30FK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 01:54:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tFOChWZx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tFOChWZx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDBx75DNzz2yXL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 01:54:03 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15SFY5xJ132218; Mon, 28 Jun 2021 11:53:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=WTCIaYlpGkouP1AtWpyqb71ChmwcXyNvId7YDPbuNaE=;
 b=tFOChWZxRrVibQs5e3ZgrQbBiG2e7BMd2BkN4pY5rFnBQeuAs1G8NYWXvB1rzxnaapOM
 2iDi6XtXWt9doX/gVjR1yvqytRnAH9UGeFZpz8RftGbEIj+i4NyFB45wwWTadTIBwtWH
 +fNLXVpZpmTvrv0D+I8nAr4tE/tHlQgnLurCpqk7dT5P+FyOXXo+u3FegOxXpRG/kM0I
 IG7fJcfiLHOExn4LQGAoaV02qu4uJuQYOwS/SmTHhiLXVT2uJ8/Dh3dhXS0b76Mb0y/5
 ECSTkvzblk8GNX3Olgmf3tTiSdOW1F/VHIQJU5WwYjWBdYSqyoLtgMV7nU4yxNpuE1wX FA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39fgw1h7mm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 11:53:47 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15SFab4K142356;
 Mon, 28 Jun 2021 11:53:47 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39fgw1h7kp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 11:53:47 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15SFrNtW009249;
 Mon, 28 Jun 2021 15:53:46 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 39duvanhy7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 15:53:45 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15SFqiin22282554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Jun 2021 15:52:44 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C8D292FFB;
 Mon, 28 Jun 2021 15:04:31 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B95E92F6A;
 Mon, 28 Jun 2021 15:04:27 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.75.58])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 28 Jun 2021 15:04:27 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v4 7/7] powerpc/pseries: Add support for FORM2
 associativity
In-Reply-To: <YNlpnOPu0ZLu/7nY@yekko>
References: <20210617165105.574178-1-aneesh.kumar@linux.ibm.com>
 <20210617165105.574178-8-aneesh.kumar@linux.ibm.com>
 <YNP3P+30/tNzYMRP@yekko> <87eecrllm5.fsf@linux.ibm.com>
 <YNlpnOPu0ZLu/7nY@yekko>
Date: Mon, 28 Jun 2021 20:34:25 +0530
Message-ID: <8735t2kp3a.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xDyanZzSV6T83EXlgkdYkw15_RsYOTW6
X-Proofpoint-ORIG-GUID: eseq1T9XUprwMnDQPkfaeK1u1EjCA8al
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_12:2021-06-25,
 2021-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106280105
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
 Daniel Henrique Barboza <danielhb413@gmail.com>, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Thu, Jun 24, 2021 at 01:50:34PM +0530, Aneesh Kumar K.V wrote:
>> David Gibson <david@gibson.dropbear.id.au> writes:
>>=20
>> > On Thu, Jun 17, 2021 at 10:21:05PM +0530, Aneesh Kumar K.V wrote:
>> >> PAPR interface currently supports two different ways of communicating=
 resource
>> >> grouping details to the OS. These are referred to as Form 0 and Form 1
>> >> associativity grouping. Form 0 is the older format and is now conside=
red
>> >> deprecated. This patch adds another resource grouping named FORM2.
>> >>=20
>> >> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> >> ---
>> >>  Documentation/powerpc/associativity.rst   | 135 ++++++++++++++++++++
>> >>  arch/powerpc/include/asm/firmware.h       |   3 +-
>> >>  arch/powerpc/include/asm/prom.h           |   1 +
>> >>  arch/powerpc/kernel/prom_init.c           |   3 +-
>> >>  arch/powerpc/mm/numa.c                    | 149 ++++++++++++++++++++=
+-
>> >>  arch/powerpc/platforms/pseries/firmware.c |   1 +
>> >>  6 files changed, 286 insertions(+), 6 deletions(-)
>> >>  create mode 100644 Documentation/powerpc/associativity.rst
>> >>=20
>> >> diff --git a/Documentation/powerpc/associativity.rst b/Documentation/=
powerpc/associativity.rst
>> >> new file mode 100644
>> >> index 000000000000..93be604ac54d
>> >> --- /dev/null
>> >> +++ b/Documentation/powerpc/associativity.rst
>> >> @@ -0,0 +1,135 @@
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
>> >> +PAPR interface currently supports different ways of communicating th=
ese resource
>> >> +grouping details to the OS. These are referred to as Form 0, Form 1 =
and Form2
>> >> +associativity grouping. Form 0 is the older format and is now consid=
ered deprecated.
>> >> +
>> >> +Hypervisor indicates the type/form of associativity used via "ibm,ar=
citecture-vec-5 property".
>> >> +Bit 0 of byte 5 in the "ibm,architecture-vec-5" property indicates u=
sage of Form 0 or Form 1.
>> >> +A value of 1 indicates the usage of Form 1 associativity. For Form 2=
 associativity
>> >> +bit 2 of byte 5 in the "ibm,architecture-vec-5" property is used.
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
en resource groups/domains.
>> >> +
>> >> +The =E2=80=9Cibm,associativity=E2=80=9D property contains one or mor=
e lists of numbers (domainID)
>> >> +representing the resource=E2=80=99s platform grouping domains.
>> >> +
>> >> +The =E2=80=9Cibm,associativity-reference-points=E2=80=9D property co=
ntains one or more list of numbers
>> >> +(domainID index) that represents the 1 based ordinal in the associat=
ivity lists.
>> >> +The list of domainID index represnets increasing hierachy of
>> >> resource grouping.
>> >
>> > Typo "represnets".  Also s/hierachy/hierarchy/
>> >
>> >> +
>> >> +ex:
>> >> +{ primary domainID index, secondary domainID index, tertiary domainI=
D index.. }
>> >
>> >> +Linux kernel uses the domainID at the primary domainID index as the =
NUMA node id.
>> >> +Linux kernel computes NUMA distance between two domains by recursive=
ly comparing
>> >> +if they belong to the same higher-level domains. For mismatch at eve=
ry higher
>> >> +level of the resource group, the kernel doubles the NUMA distance be=
tween the
>> >> +comparing domains.
>> >
>> > The Form1 description is still kinda confusing, but I don't really
>> > care.  Form1 *is* confusing, it's Form2 that I hope will be clearer.
>> >
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
>> >> +same domainID index representing resource groups of different perfor=
mance/latency characteristics.
>> >
>> > So, see you've removed the special handling of secondary IDs for pmem
>> > - big improvement, thanks.  IIUC, in this revised version, for Form2
>> > there's really no reason for ibm,associativity-reference-points to
>> > have >1 entry.  Is that right?
>> >
>> > In Form2 everything revolves around the primary domain ID - so much
>> > that I suggest we come up with a short name for it.  How about just
>> > "node id" since that's how Linux uses it.
>>=20
>> We don't really refer primary domain ID in rest of FORM2 details. We
>> do refer the entries as domainID.
>
> Right, which is unnecessarily confusing, because primary domain ID is
> going to be the only one that matters in practice.
>
>> Is renaming domainID to NUMA
>> node id better?
>>=20
>> >
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
>> > The lookup-index-table is all about compactifying the representation
>> > of the distance matrix.  Because node ids are sparse, the matrix of
>> > distances is also effectively sparse.  You don't want to have a huge
>> > matrix in the DT with mostly meaningless entries, so you use the
>> > lookup table to compact the node ids.
>> >
>> > It's a bit confusing though, because you now have two representations
>> > of exactly the same information the "full" node id (=3D=3D primary
>> > domainID) and the "short" node id (=3D=3DdomainID lookup table offset).
>> >
>> > I can see three ways to clarify this:
>> >
>> >   A) Give the short node id an explicit name rather than difficult to
>> >      parse "domainID index" or "domainID offset" which gets easily
>> >      muddled with other uses of index and offset.  Use that name
>> >      throughout.
>>=20
>> I dopped the domainID index and started referring to that as domain
>> distance offset.
>
> Better, since it's not ambiguous.  Still kinda long and awkward.
>
>> >   B) Eliminate the short ID entirely, and use an explicit sparse
>> >      matrix representation for the distance table e.g. a list of
>> >      (nodeA, nodeB, distance) tuples
>> >
>> >      That does have the disadvantage that it's not structurally
>> >      guaranteed that you have entries for every pair of "active" node
>> >      ids.
>>=20
>> Other hypervisor would want to have a large possible domainID value and
>> mostly want to publish the full topology details during boot. Using the
>> above format makes a 16 node config have large "ibm,numa-distance-table"
>> property.
>
> It'd be about 3kiB, yes?  That's fairly large, but not ludicrously
> large, so does that matter?

There is also the possibility that the 16 max node limit will get
updated in the future to a higher value.

>
>> >   C) Eliminate the "long ID" entirely.  In the Form2 world, is there
>> >      actually any point allowing sparse node ids?  In this case you'd
>> >      have the node id read from associativity and use that directly to
>> >      index the distance table
>>=20
>> Yes, other hypervisor would like to partition the domain ID space for
>> different resources.
>
> Is that really a hard requirement on the dt format though?  The
> hypervisor could always have its own internal lookup table between
> long and short forms.

There is also the desire to keep new details closer to what values the
hypervisor already use for domainIDs with FORM1. From PAPR spec
point of view, it is desirable to avoid adding another level of
indirection at the hypervisor level.

>
>> >> +prop-encoded-array: The number N of the domainIDs encoded as with en=
code-int, followed by
>> >> +N domainID encoded as with encode-int
>> >> +
>> >> +For ex:
>> >> +ibm,numa-lookup-index-table =3D  {4, 0, 8, 250, 252}, domainID index
>> >> for domainID 8 is 1.
>> >
>> > As noted "domainID index" is confusing here, because it's different
>> > from the "domainID index" values in reference-points.
>> >
>> >> +
>> >> +"ibm,numa-distance-table" property contains one or more list of numb=
ers representing the NUMA
>> >> +distance between resource groups/domains present in the system.
>> >> +
>> >> +prop-encoded-array: The number N of the distance values encoded as w=
ith encode-int, followed by
>> >> +N distance values encoded as with encode-bytes. The max distance val=
ue we could encode is 255.
>> >
>> > The N here always has to be the square of the N in the
>> > lookup-index-table, yes?  In which case do we actually need to include
>> > it?
>>=20
>> most of PAPR device tree property follows the pattern  {N,....
>> Nelements}. This follows the same pattern.
>
> Many do, yes, but in many of those cases reading the N is actually
> useful.  It's impossible to interpret this table if you don't already
> know the number of nodes and if the length of the distance doesn't
> match that, there's no reasonable fallback interpretation.
>
>> >> +For ex:
>> >> +ibm,numa-lookup-index-table =3D  {3, 0, 8, 40}
>> >> +ibm,numa-distance-table     =3D  {9, 10, 20, 80, 20, 10, 160, 80, 16=
0, 10}
>> >> +
>> >> +  | 0    8   40
>> >> +--|------------
>> >> +  |
>> >> +0 | 10   20  80
>> >> +  |
>> >> +8 | 20   10  160
>> >> +  |
>> >> +40| 80   160  10
>> >> +
>> >> +
>> >> +"ibm,associativity" property for resources in node 0, 8 and 40
>> >> +
>> >> +{ 3, 6, 7, 0 }
>> >> +{ 3, 6, 9, 8 }
>> >> +{ 3, 6, 7, 40}
>> >> +
>> >> +With "ibm,associativity-reference-points"  { 0x3 }
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
>> >
>> > In what circumstances would you envisage a hot-add creating a new NUMA
>> > node, as opposed to adding resources to an existing (possibly empty)
>> > node?  Do you need any provision for removing NUMA nodes again?
>>=20
>> Both Qemu and PowerVM don't intend to use this at this point. Both will
>> provide the full possible NUMA node details during boot. But I was not
>> sure whether we really need to restrict the possibility of a new
>> resource being added. This can be true in case of new memory devices
>> that gets hotplugged in the latency of the device is such that we never
>> expressed that in the distance table during boot.=20
>
> Hm, ok.  Can we just leave it out of the spec for now and add it in
> when/if a hypervisor needs it?

Sure. I will drop the DLPAR specific changes.

>
>> >> +"ibm,numa-lookup-index" property contains a number representing the =
domainID index to be used
>> >> +when building the NUMA distance of the numa node to which this resou=
rce belongs. This can
>> >> +be looked at as the index at which this new domainID would have appe=
ared in
>> >> +"ibm,numa-lookup-index-table" if the domain was present during boot.=
 The domainID
>> >
>> > Again, confusing use of "index" where it's used both for offsets in
>> > ibm,associativity properties and for offsets in ibm,numa-lookup-index-=
table
>>=20
>> I guess we can drop the ibm,numa-lookuup-index and state that the
>> number of distance element in "ibm,numa-distance" suggest the index at
>> which this NUMA node should appear for compuring the distance details.=20
>
> I don't really follow what you're saying there.
>
>> >> +of the new resource can be obtained from the existing "ibm,associati=
vity" property. This
>> >> +can be used to build distance information of a newly onlined NUMA no=
de via DLPAR operation.
>> >> +The value is 1 based array index value.
>> >> +
>> >> +prop-encoded-array: An integer encoded as with encode-int specifying=
 the domainID index
>> >> +
>> >> +"ibm,numa-distance" property contains one or more list of numbers pr=
esenting the NUMA distance
>> >> +from this resource domain to other resources.
>> >> +
>> >> +prop-encoded-array: The number N of the distance values encoded as w=
ith encode-int, followed by
>> >> +N distance values encoded as with encode-bytes. The max distance val=
ue we could encode is 255.
>> >
>> > Again, does N have to equal 2 * (existing number of nodes + 1)?  If so
>> > you should say so, if not you should specify how incomplete
>> > information is interpreted.
>> >
>> >> +For ex:
>> >> +ibm,associativity     =3D { 4, 5, 10, 50}
>> >> +ibm,numa-lookup-index =3D { 4 }
>> >> +ibm,numa-distance   =3D  {8, 160, 255, 80, 10, 160, 255, 80, 10}
>> >> +
>> >> +resulting in a new toplogy as below.
>> >> +  | 0    8   40   50
>> >> +--|------------------
>> >> +  |
>> >> +0 | 10   20  80   160
>> >> +  |
>> >> +8 | 20   10  160  255
>> >> +  |
>> >> +40| 80   160  10  80
>> >> +  |
>> >> +50| 160  255  80  10
>> >> +
>>=20
>> Here is the relevant updated part of the doc.
>>=20
>> Form 2 associativity format adds separate device tree properties represe=
nting NUMA node distance
>> thereby making the node distance computation flexible. Form 2 also allow=
s flexible primary
>> domain numbering. With numa distance computation now detached from the i=
ndex value in
>> "ibm,associativity-reference-points" property, Form 2 allows a large num=
ber of primary domain
>> ids at the same domainID index representing resource groups of different=
 performance/latency
>> characteristics.
>>=20
>> Hypervisor indicates the usage of FORM2 associativity using bit 2 of byt=
e 5 in the
>> "ibm,architecture-vec-5" property.
>>=20
>> "ibm,numa-lookup-index-table" property contains one or more list numbers=
 representing
>
> s/one or more list numbers/a list of one or more numbers/

That was picked from PAPR reference. I updated the properties mentioned
in this file to be "a list of one or more numbers"

>
>> the domainIDs present in the system. The offset of the domainID in this =
property is
>> used as an index while computing numa distance information via "ibm,numa=
-distance-table".
>>=20
>> prop-encoded-array: The number N of the domainIDs encoded as with encode=
-int, followed by
>> N domainID encoded as with encode-int
>>=20
>> For ex:
>> "ibm,numa-lookup-index-table" =3D  {4, 0, 8, 250, 252}. Offset of domain=
ID 8 (2) is used when
>> computing the distance of domain 8 from other domains present in the sys=
tem. For rest of
>> this document this offset will be referred to as domain distance offset.
>>=20
>> "ibm,numa-distance-table" property contains one or more list of numbers =
representing the NUMA
>> distance between resource groups/domains present in the system.
>>=20
>> prop-encoded-array: The number N of the distance values encoded as with =
encode-int, followed by
>> N distance values encoded as with encode-bytes. The max distance value w=
e could encode is 255.
>
> If you insist on retaining the N here, at least explicitly state that
> it must be equal to m^2, where m is the number of nodes in numa-lookup-in=
dex-table.

updated

>
>> For ex:
>> ibm,numa-lookup-index-table =3D  {3, 0, 8, 40}
>> ibm,numa-distance-table     =3D  {9, 10, 20, 80, 20, 10, 160, 80, 160, 1=
0}
>>=20
>>   | 0    8   40
>> --|------------
>>   |
>> 0 | 10   20  80
>>   |
>> 8 | 20   10  160
>>   |
>> 40| 80   160  10
>>=20
>> A possible "ibm,associativity" property for resources in node 0, 8 and 40
>>=20
>> { 3, 6, 7, 0 }
>> { 3, 6, 9, 8 }
>> { 3, 6, 7, 40}
>>=20
>> With "ibm,associativity-reference-points"  { 0x3 }
>>=20
>> "ibm,lookup-index-table" helps in having a compact representation of dis=
tance matrix.
>> Since domainID can be sparse, the matrix of distances can also be effect=
ively sparse.
>> With "ibm,lookup-index-table" we are able to achieve a compact represent=
ation of
>> distance information.
>>=20
>> Each resource (drcIndex) now also supports additional optional device tr=
ee properties.
>> These properties are marked optional because the platform can choose not=
 to export
>> them and provide the system topology details using the earlier defined d=
evice tree
>> properties alone. The optional device tree properties are used when addi=
ng new resources
>> (DLPAR) and when the platform didn't provide the topology details of the=
 domain which
>> contains the newly added resource during boot.
>>=20
>> "ibm,numa-distance" property contains one or more list of numbers presen=
ting the NUMA distance
>> from this resource domain to other resources.
>>=20
>> prop-encoded-array: The number N of the distance values encoded as with =
encode-int, followed by
>> N distance values encoded as with encode-bytes. The max distance value w=
e could encode is 255.
>
>> If the system currently has 3 domains and a DLPAR operation is adding on=
e additional
>> domain, "ibm,numa-distance" property should have 2 * (3 + 1) =3D 8 eleme=
nts as shown below.
>> In other words the domain distance offset value for the newly added doma=
in is number of
>> distance value elements in the "ibm,numa-distance" property divided by 2.
>
> You need to spell out the distinction between the two halves of the
> property - which one adds a row to numa-distance-table, and which one
> adds a column.

updated.

>
>> >> diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/inclu=
de/asm/firmware.h
>> >> index 60b631161360..97a3bd9ffeb9 100644
>> >> --- a/arch/powerpc/include/asm/firmware.h
>> >> +++ b/arch/powerpc/include/asm/firmware.h
>> >> @@ -53,6 +53,7 @@
>> >>  #define FW_FEATURE_ULTRAVISOR	ASM_CONST(0x0000004000000000)
>> >>  #define FW_FEATURE_STUFF_TCE	ASM_CONST(0x0000008000000000)
>> >>  #define FW_FEATURE_RPT_INVALIDATE ASM_CONST(0x0000010000000000)
>> >> +#define FW_FEATURE_FORM2_AFFINITY ASM_CONST(0x0000020000000000)
>> >>=20=20
>> >>  #ifndef __ASSEMBLY__
>> >>=20=20
>> >> @@ -73,7 +74,7 @@ enum {
>> >>  		FW_FEATURE_HPT_RESIZE | FW_FEATURE_DRMEM_V2 |
>> >>  		FW_FEATURE_DRC_INFO | FW_FEATURE_BLOCK_REMOVE |
>> >>  		FW_FEATURE_PAPR_SCM | FW_FEATURE_ULTRAVISOR |
>> >> -		FW_FEATURE_RPT_INVALIDATE,
>> >> +		FW_FEATURE_RPT_INVALIDATE | FW_FEATURE_FORM2_AFFINITY,
>> >>  	FW_FEATURE_PSERIES_ALWAYS =3D 0,
>> >>  	FW_FEATURE_POWERNV_POSSIBLE =3D FW_FEATURE_OPAL | FW_FEATURE_ULTRAV=
ISOR,
>> >>  	FW_FEATURE_POWERNV_ALWAYS =3D 0,
>> >> diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/a=
sm/prom.h
>> >> index df9fec9d232c..5c80152e8f18 100644
>> >> --- a/arch/powerpc/include/asm/prom.h
>> >> +++ b/arch/powerpc/include/asm/prom.h
>> >> @@ -149,6 +149,7 @@ extern int of_read_drc_info_cell(struct property =
**prop,
>> >>  #define OV5_XCMO		0x0440	/* Page Coalescing */
>> >>  #define OV5_FORM1_AFFINITY	0x0580	/* FORM1 NUMA affinity */
>> >>  #define OV5_PRRN		0x0540	/* Platform Resource Reassignment */
>> >> +#define OV5_FORM2_AFFINITY	0x0520	/* Form2 NUMA affinity */
>> >>  #define OV5_HP_EVT		0x0604	/* Hot Plug Event support */
>> >>  #define OV5_RESIZE_HPT		0x0601	/* Hash Page Table resizing */
>> >>  #define OV5_PFO_HW_RNG		0x1180	/* PFO Random Number Generator */
>> >> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/pr=
om_init.c
>> >> index 64b9593038a7..496fdac54c29 100644
>> >> --- a/arch/powerpc/kernel/prom_init.c
>> >> +++ b/arch/powerpc/kernel/prom_init.c
>> >> @@ -1070,7 +1070,8 @@ static const struct ibm_arch_vec ibm_architectu=
re_vec_template __initconst =3D {
>> >>  #else
>> >>  		0,
>> >>  #endif
>> >> -		.associativity =3D OV5_FEAT(OV5_FORM1_AFFINITY) | OV5_FEAT(OV5_PRR=
N),
>> >> +		.associativity =3D OV5_FEAT(OV5_FORM1_AFFINITY) | OV5_FEAT(OV5_PRR=
N) |
>> >> +		OV5_FEAT(OV5_FORM2_AFFINITY),
>> >>  		.bin_opts =3D OV5_FEAT(OV5_RESIZE_HPT) | OV5_FEAT(OV5_HP_EVT),
>> >>  		.micro_checkpoint =3D 0,
>> >>  		.reserved0 =3D 0,
>> >> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>> >> index d32729f235b8..5a7d94960fb7 100644
>> >> --- a/arch/powerpc/mm/numa.c
>> >> +++ b/arch/powerpc/mm/numa.c
>> >> @@ -56,12 +56,17 @@ static int n_mem_addr_cells, n_mem_size_cells;
>> >>=20=20
>> >>  #define FORM0_AFFINITY 0
>> >>  #define FORM1_AFFINITY 1
>> >> +#define FORM2_AFFINITY 2
>> >>  static int affinity_form;
>> >>=20=20
>> >>  #define MAX_DISTANCE_REF_POINTS 4
>> >>  static int max_associativity_domain_index;
>> >>  static const __be32 *distance_ref_points;
>> >>  static int distance_lookup_table[MAX_NUMNODES][MAX_DISTANCE_REF_POIN=
TS];
>> >> +static int numa_distance_table[MAX_NUMNODES][MAX_NUMNODES] =3D {
>> >> +	[0 ... MAX_NUMNODES - 1] =3D { [0 ... MAX_NUMNODES - 1] =3D -1 }
>> >> +};
>> >> +static int numa_id_index_table[MAX_NUMNODES];
>> >>=20=20
>> >>  /*
>> >>   * Allocate node_to_cpumask_map based on number of available nodes
>> >> @@ -166,6 +171,27 @@ static void unmap_cpu_from_node(unsigned long cp=
u)
>> >>  }
>> >>  #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
>> >>=20=20
>> >> +/*
>> >> + * With FORM2 if we are not using logical domain ids, we will find
>> >> + * both primary and seconday domains with same value. Hence always
>> >> + * start comparison from secondary domains
>> >
>> >
>> > IIUC, in this new draft, secondary domains are no longer a meaningful
>> > thing in Form2, so this comment and code seem outdated.
>>=20
>> This needed fixup. With FORM2 our associativity array can be just one
>> element. I fixed up as below.
>>=20
>> static int __cpu_form2_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
>> {
>> 	int node1, node2;
>> 	int dist =3D 0;
>>=20
>> 	node1 =3D associativity_to_nid(cpu1_assoc);
>> 	node2 =3D associativity_to_nid(cpu2_assoc);
>>=20
>> 	dist =3D numa_distance_table[node1][node2];
>> 	if (dist =3D=3D LOCAL_DISTANCE)
>> 		return 0;
>> 	else if (dist =3D=3D REMOTE_DISTANCE)
>> 		return 1;
>> 	else
>> 		return 2;
>> }
>>=20
>> also renamed cpu_distance to cpu_relative_distance.
>>=20
>>=20
>> >> + */
>> >> +static int __cpu_form2_distance(__be32 *cpu1_assoc, __be32 *cpu2_ass=
oc)
>> >> +{
>> >> +	int dist =3D 0;
>> >> +
>> >> +	int i, index;
>> >> +
>> >> +	for (i =3D 1; i < max_associativity_domain_index; i++) {
>> >> +		index =3D be32_to_cpu(distance_ref_points[i]);
>> >> +		if (cpu1_assoc[index] =3D=3D cpu2_assoc[index])
>> >> +			break;
>> >> +		dist++;
>> >> +	}
>> >> +
>> >> +	return dist;
>> >> +}
>> >> +
>> >>  static int __cpu_form1_distance(__be32 *cpu1_assoc, __be32 *cpu2_ass=
oc)
>> >>  {
>> >>  	int dist =3D 0;
>> >> @@ -178,7 +204,6 @@ static int __cpu_form1_distance(__be32 *cpu1_asso=
c, __be32 *cpu2_assoc)
>> >>  			break;
>> >>  		dist++;
>> >>  	}
>> >> -
>> >>  	return dist;
>> >>  }
>> >>=20=20
>> >> @@ -186,8 +211,9 @@ int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2=
_assoc)
>> >>  {
>> >>  	/* We should not get called with FORM0 */
>> >>  	VM_WARN_ON(affinity_form =3D=3D FORM0_AFFINITY);
>> >> -
>> >> -	return __cpu_form1_distance(cpu1_assoc, cpu2_assoc);
>> >> +	if (affinity_form =3D=3D FORM1_AFFINITY)
>> >> +		return __cpu_form1_distance(cpu1_assoc, cpu2_assoc);
>> >> +	return __cpu_form2_distance(cpu1_assoc, cpu2_assoc);
>> >>  }
>> >>=20=20
>> >>  /* must hold reference to node during call */
>> >> @@ -201,7 +227,9 @@ int __node_distance(int a, int b)
>> >>  	int i;
>> >>  	int distance =3D LOCAL_DISTANCE;
>> >>=20=20
>> >> -	if (affinity_form =3D=3D FORM0_AFFINITY)
>> >> +	if (affinity_form =3D=3D FORM2_AFFINITY)
>> >> +		return numa_distance_table[a][b];
>> >> +	else if (affinity_form =3D=3D FORM0_AFFINITY)
>> >>  		return ((a =3D=3D b) ? LOCAL_DISTANCE : REMOTE_DISTANCE);
>> >>=20=20
>> >>  	for (i =3D 0; i < max_associativity_domain_index; i++) {
>> >> @@ -303,15 +331,116 @@ static void initialize_form1_numa_distance(str=
uct device_node *node)
>> >>=20=20
>> >>  /*
>> >>   * Used to update distance information w.r.t newly added node.
>> >> + * ibm,numa-lookup-index -> 4
>> >> + * ibm,numa-distance -> {5, 20, 40, 60, 80, 10 }
>> >>   */
>> >>  void update_numa_distance(struct device_node *node)
>> >>  {
>> >> +	int i, nid, other_nid, other_nid_index =3D 0;
>> >> +	const __be32 *numa_indexp;
>> >> +	const __u8  *numa_distancep;
>> >> +	int numa_index, max_numa_index, numa_distance;
>> >> +
>> >>  	if (affinity_form =3D=3D FORM0_AFFINITY)
>> >>  		return;
>> >>  	else if (affinity_form =3D=3D FORM1_AFFINITY) {
>> >>  		initialize_form1_numa_distance(node);
>> >>  		return;
>> >>  	}
>> >> +	/* FORM2 affinity  */
>> >> +
>> >> +	nid =3D of_node_to_nid_single(node);
>> >> +	if (nid =3D=3D NUMA_NO_NODE)
>> >> +		return;
>> >> +
>> >> +	/* Already initialized */
>> >> +	if (numa_distance_table[nid][nid] !=3D -1)
>> >
>> > IIUC, this should exactly correspond to the case where the new
>> > resource lies in an existing NUMA node, yes?
>>=20
>> yes.
>>=20
>> >
>> >> +		return;
>> >> +	/*
>> >> +	 * update node distance if not already populated.
>> >> +	 */
>> >> +	numa_distancep =3D of_get_property(node, "ibm,numa-distance", NULL);
>> >> +	if (!numa_distancep)
>> >> +		return;
>> >> +
>> >> +	numa_indexp =3D of_get_property(node, "ibm,numa-lookup-index", NULL=
);
>> >> +	if (!numa_indexp)
>> >> +		return;
>> >> +
>> >> +	numa_index =3D of_read_number(numa_indexp, 1);
>> >> +	/*
>> >> +	 * update the numa_id_index_table. Device tree look at index table =
as
>> >> +	 * 1 based array indexing.
>> >> +	 */
>> >> +	numa_id_index_table[numa_index - 1] =3D nid;
>> >> +
>> >> +	max_numa_index =3D of_read_number((const __be32 *)numa_distancep, 1=
);
>> >> +	VM_WARN_ON(max_numa_index !=3D 2 * numa_index);
>> >
>> > You WARN_ON(), but you don't actually bail out to avoid indexing past
>> > the end of the property below.
>> >
>> > AFAICT none of this really works unless numa_index =3D=3D (previous nu=
mber
>> > of numa nodes + 1), which makes all the use of these different
>> > variables kind of confusing.  If you had a variable that you just set
>> > equal to the new number of numa nodes (previous number plus the one
>> > being added), then I think you can replace all numa_index and
>> > max_numa_index references with that and it will be clearer.
>>=20
>> I rewrote that as below.
>>=20
>> 	numa_distancep =3D of_get_property(node, "ibm,numa-distance", NULL);
>> 	if (!numa_distancep)
>> 		return;
>>=20
>> 	max_dist_element =3D of_read_number((const __be32 *)numa_distancep, 1);
>>=20
>> 	numa_id_index =3D max_dist_element >> 1;
>
> You already know the existing number of NUMA nodes, so it seems
> clearer to me to alidate the new property against that, rather than
> trying to parse it out of the new property.
>
>> 	/*
>> 	 * update the numa_id_index_table. Device tree look at index table as
>> 	 * 1 based array indexing.
>> 	 */
>> 	if (numa_id_index_table[numa_id_index - 1] !=3D -1) {
>> 		WARN(1, "Wrong NUMA distance information\n");
>> 		return;
>> 	}
>
> I believe
> 	if (WARN_ON(...))
> 		return;
>
> is idiomatic.
>
>> 	numa_id_index_table[numa_id_index - 1] =3D nid;
>>=20
>> 	/* Skip the size which is encoded int */
>> 	numa_distancep +=3D sizeof(__be32);
>
> Is numa_distancep a u32 pointer, or a char pointer?  If it's a u32
> pointer then adding sizeof(__be32) rather than 1 is incorrect here.
>

const __u8  *numa_distancep;

>> 	/*
>> 	 * First fill the distance information from other node to this node.
>> 	 */
>> 	distance_index =3D 0;
>> 	for (i =3D 0; i < numa_id_index; i++) {
>> 		numa_distance =3D numa_distancep[distance_index++];
>
> .. but if it's a char pointer then this looks wrong.

We are reading the 8 bit distance value here.

>
>> 		other_nid =3D numa_id_index_table[i];
>> 		if (other_nid =3D=3D NUMA_NO_NODE)
>> 			continue;
>> 		numa_distance_table[other_nid][nid] =3D numa_distance;
>> 	}
>>=20
>> 	for (i =3D 0; i < numa_id_index; i++) {
>> 		numa_distance =3D numa_distancep[distance_index++];
>
> I'd just compute the offset from i here, rather than having another
> variable to track.
>
>> 		other_nid =3D numa_id_index_table[i];
>> 		if (other_nid =3D=3D NUMA_NO_NODE)
>> 			continue;
>> 		numa_distance_table[nid][other_nid] =3D numa_distance;
>> 	}
>> }
>>=20
>>=20
>> >
>> >
>> >> +	/* Skip the size which is encoded int */
>> >> +	numa_distancep +=3D sizeof(__be32);
>> >> +
>> >> +	/*
>> >> +	 * First fill the distance information from other node to this node.
>> >> +	 */
>> >> +	other_nid_index =3D 0;
>> >> +	for (i =3D 0; i < numa_index; i++) {
>> >> +		numa_distance =3D numa_distancep[i];
>> >> +		other_nid =3D numa_id_index_table[other_nid_index++];
>> >> +		numa_distance_table[other_nid][nid] =3D numa_distance;
>> >> +	}
>> >> +
>> >> +	other_nid_index =3D 0;
>> >> +	for (; i < max_numa_index; i++) {
>> >
>> > Again, splitting this loop and carrying i over seems a confusing way
>> > to code this.  It's basically two loops of N, one writing a row of the
>> > distance matrix, one writing a column (other_nid will even go through
>> > the same values in each loop).
>>=20
>> Fixed
>>=20
>> >
>> >> +		numa_distance =3D numa_distancep[i];
>> >> +		other_nid =3D numa_id_index_table[other_nid_index++];
>> >> +		numa_distance_table[nid][other_nid] =3D numa_distance;
>> >> +	}
>> >> +}
>> >> +
>> >> +/*
>> >> + * ibm,numa-lookup-index-table=3D {N, domainid1, domainid2, ..... do=
mainidN}
>> >> + * ibm,numa-distance-table =3D { N, 1, 2, 4, 5, 1, 6, .... N element=
s}
>> >> + */
>> >> +static void initialize_form2_numa_distance_lookup_table(struct devic=
e_node *root)
>> >> +{
>> >> +	const __u8 *numa_dist_table;
>> >> +	const __be32 *numa_lookup_index;
>> >> +	int numa_dist_table_length;
>> >> +	int max_numa_index, distance_index;
>> >> +	int i, curr_row =3D 0, curr_column =3D 0;
>> >> +
>> >> +	numa_lookup_index =3D of_get_property(root, "ibm,numa-lookup-index-=
table", NULL);
>> >> +	max_numa_index =3D of_read_number(&numa_lookup_index[0], 1);
>> >
>> > max_numa_index here has a different meaning to max_numa_index in the
>> > previous function, which is pointlessly confusing.
>> >
>> >> +	/* first element of the array is the size and is encode-int */
>> >> +	numa_dist_table =3D of_get_property(root, "ibm,numa-distance-table"=
, NULL);
>> >> +	numa_dist_table_length =3D of_read_number((const __be32 *)&numa_dis=
t_table[0], 1);
>> >> +	/* Skip the size which is encoded int */
>> >> +	numa_dist_table +=3D sizeof(__be32);
>> >> +
>> >> +	pr_debug("numa_dist_table_len =3D %d, numa_dist_indexes_len =3D %d =
\n",
>> >> +		 numa_dist_table_length, max_numa_index);
>> >> +
>> >> +	for (i =3D 0; i < max_numa_index; i++)
>> >> +		/* +1 skip the max_numa_index in the property */
>> >> +		numa_id_index_table[i] =3D of_read_number(&numa_lookup_index[i + 1=
], 1);
>> >> +
>> >> +
>> >> +	VM_WARN_ON(numa_dist_table_length !=3D max_numa_index * max_numa_in=
dex);
>> >
>> > Again, you don't actually bail out in this case.  And if it has to
>> > have this value, what's the point of encoding it into the property.
>> >
>> >> +	for (distance_index =3D 0; distance_index < numa_dist_table_length;=
 distance_index++) {
>> >> +		int nodeA =3D numa_id_index_table[curr_row];
>> >> +		int nodeB =3D numa_id_index_table[curr_column++];
>> >
>> > You've already (sort of) verified that the distance table has size
>> > N^2, in which case you can just to a simple two dimensional loop
>> > rather than having to do ugly calculations of row and column.
>>=20
>> Fixed all the above and updated as below.
>> 	if (numa_dist_table_length !=3D max_numa_index * max_numa_index) {
>> 		WARN(1, "Wrong NUMA distnce information\n");
>                                     ^^^^^^^
>

updated.

>> 		/* consider everybody else just remote. */
>>=20
>> 		for (i =3D 0;  i < max_numa_index; i++) {
>> 			for (j =3D 0; j < max_numa_index; j++) {
>> 				int nodeA =3D numa_id_index_table[i];
>> 				int nodeB =3D numa_id_index_table[j];
>>=20
>> 				if (nodeA =3D=3D nodeB)
>> 					numa_distance_table[nodeA][nodeB] =3D LOCAL_DISTANCE;
>> 				else
>> 					numa_distance_table[nodeA][nodeB] =3D REMOTE_DISTANCE;
>> 			}
>> 		}
>> 	}
>>=20
>> 	distance_index =3D 0;
>> 	for (i =3D 0;  i < max_numa_index; i++) {
>> 		for (j =3D 0; j < max_numa_index; j++) {
>> 			int nodeA =3D numa_id_index_table[i];
>> 			int nodeB =3D numa_id_index_table[j];
>>=20
>> 			numa_distance_table[nodeA][nodeB] =3D numa_dist_table[distance_index+=
+];
>>=20
>> 			pr_debug("dist[%d][%d]=3D%d ", nodeA, nodeB, numa_distance_table[node=
A][nodeB]);
>> 		}
>> 	}
>> }
>>=20
>>=20
>> -aneesh
>>=20
>
> --=20
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson
