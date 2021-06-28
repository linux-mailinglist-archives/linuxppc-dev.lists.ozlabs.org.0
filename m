Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE053B59B5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 09:25:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GCzfp3D2kz30H3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 17:25:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=MVQDTK4d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=MVQDTK4d; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GCzfJ4gVxz2yY3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 17:25:28 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GCzfH0SlKz9sW8; Mon, 28 Jun 2021 17:25:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1624865127;
 bh=U780rUA5QTEObu342YEEzLewoSbWfBGGFMxMfgsmiA4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MVQDTK4dWL+1Dg0j8vVB7PS47mnl7Gazp+ZGHUaBCu46+K6D7atzCBqeoQkQIEdJA
 FB/H4JfyOpfTG/jo3uz3ncGAr9ru1gYDwO4BsQJcvQ619D6hM2QWlSl74nKXzQ9Zj3
 XmYPEi5uCrSs4WR/Fa85UkMPTElR1uILZOW5AkUM=
Date: Mon, 28 Jun 2021 16:18:04 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v4 7/7] powerpc/pseries: Add support for FORM2
 associativity
Message-ID: <YNlpnOPu0ZLu/7nY@yekko>
References: <20210617165105.574178-1-aneesh.kumar@linux.ibm.com>
 <20210617165105.574178-8-aneesh.kumar@linux.ibm.com>
 <YNP3P+30/tNzYMRP@yekko> <87eecrllm5.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6TuSINLcILvbHPZM"
Content-Disposition: inline
In-Reply-To: <87eecrllm5.fsf@linux.ibm.com>
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


--6TuSINLcILvbHPZM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 24, 2021 at 01:50:34PM +0530, Aneesh Kumar K.V wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Thu, Jun 17, 2021 at 10:21:05PM +0530, Aneesh Kumar K.V wrote:
> >> PAPR interface currently supports two different ways of communicating =
resource
> >> grouping details to the OS. These are referred to as Form 0 and Form 1
> >> associativity grouping. Form 0 is the older format and is now consider=
ed
> >> deprecated. This patch adds another resource grouping named FORM2.
> >>=20
> >> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> >> ---
> >>  Documentation/powerpc/associativity.rst   | 135 ++++++++++++++++++++
> >>  arch/powerpc/include/asm/firmware.h       |   3 +-
> >>  arch/powerpc/include/asm/prom.h           |   1 +
> >>  arch/powerpc/kernel/prom_init.c           |   3 +-
> >>  arch/powerpc/mm/numa.c                    | 149 +++++++++++++++++++++-
> >>  arch/powerpc/platforms/pseries/firmware.c |   1 +
> >>  6 files changed, 286 insertions(+), 6 deletions(-)
> >>  create mode 100644 Documentation/powerpc/associativity.rst
> >>=20
> >> diff --git a/Documentation/powerpc/associativity.rst b/Documentation/p=
owerpc/associativity.rst
> >> new file mode 100644
> >> index 000000000000..93be604ac54d
> >> --- /dev/null
> >> +++ b/Documentation/powerpc/associativity.rst
> >> @@ -0,0 +1,135 @@
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >> +NUMA resource associativity
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> >> +
> >> +Associativity represents the groupings of the various platform resour=
ces into
> >> +domains of substantially similar mean performance relative to resourc=
es outside
> >> +of that domain. Resources subsets of a given domain that exhibit bett=
er
> >> +performance relative to each other than relative to other resources s=
ubsets
> >> +are represented as being members of a sub-grouping domain. This perfo=
rmance
> >> +characteristic is presented in terms of NUMA node distance within the=
 Linux kernel.
> >> +From the platform view, these groups are also referred to as domains.
> >> +
> >> +PAPR interface currently supports different ways of communicating the=
se resource
> >> +grouping details to the OS. These are referred to as Form 0, Form 1 a=
nd Form2
> >> +associativity grouping. Form 0 is the older format and is now conside=
red deprecated.
> >> +
> >> +Hypervisor indicates the type/form of associativity used via "ibm,arc=
itecture-vec-5 property".
> >> +Bit 0 of byte 5 in the "ibm,architecture-vec-5" property indicates us=
age of Form 0 or Form 1.
> >> +A value of 1 indicates the usage of Form 1 associativity. For Form 2 =
associativity
> >> +bit 2 of byte 5 in the "ibm,architecture-vec-5" property is used.
> >> +
> >> +Form 0
> >> +-----
> >> +Form 0 associativity supports only two NUMA distance (LOCAL and REMOT=
E).
> >> +
> >> +Form 1
> >> +-----
> >> +With Form 1 a combination of ibm,associativity-reference-points and i=
bm,associativity
> >> +device tree properties are used to determine the NUMA distance betwee=
n resource groups/domains.
> >> +
> >> +The =E2=80=9Cibm,associativity=E2=80=9D property contains one or more=
 lists of numbers (domainID)
> >> +representing the resource=E2=80=99s platform grouping domains.
> >> +
> >> +The =E2=80=9Cibm,associativity-reference-points=E2=80=9D property con=
tains one or more list of numbers
> >> +(domainID index) that represents the 1 based ordinal in the associati=
vity lists.
> >> +The list of domainID index represnets increasing hierachy of
> >> resource grouping.
> >
> > Typo "represnets".  Also s/hierachy/hierarchy/
> >
> >> +
> >> +ex:
> >> +{ primary domainID index, secondary domainID index, tertiary domainID=
 index.. }
> >
> >> +Linux kernel uses the domainID at the primary domainID index as the N=
UMA node id.
> >> +Linux kernel computes NUMA distance between two domains by recursivel=
y comparing
> >> +if they belong to the same higher-level domains. For mismatch at ever=
y higher
> >> +level of the resource group, the kernel doubles the NUMA distance bet=
ween the
> >> +comparing domains.
> >
> > The Form1 description is still kinda confusing, but I don't really
> > care.  Form1 *is* confusing, it's Form2 that I hope will be clearer.
> >
> >> +
> >> +Form 2
> >> +-------
> >> +Form 2 associativity format adds separate device tree properties repr=
esenting NUMA node distance
> >> +thereby making the node distance computation flexible. Form 2 also al=
lows flexible primary
> >> +domain numbering. With numa distance computation now detached from th=
e index value of
> >> +"ibm,associativity" property, Form 2 allows a large number of primary=
 domain ids at the
> >> +same domainID index representing resource groups of different perform=
ance/latency characteristics.
> >
> > So, see you've removed the special handling of secondary IDs for pmem
> > - big improvement, thanks.  IIUC, in this revised version, for Form2
> > there's really no reason for ibm,associativity-reference-points to
> > have >1 entry.  Is that right?
> >
> > In Form2 everything revolves around the primary domain ID - so much
> > that I suggest we come up with a short name for it.  How about just
> > "node id" since that's how Linux uses it.
>=20
> We don't really refer primary domain ID in rest of FORM2 details. We
> do refer the entries as domainID.

Right, which is unnecessarily confusing, because primary domain ID is
going to be the only one that matters in practice.

> Is renaming domainID to NUMA
> node id better?
>=20
> >
> >> +Hypervisor indicates the usage of FORM2 associativity using bit 2 of =
byte 5 in the
> >> +"ibm,architecture-vec-5" property.
> >> +
> >> +"ibm,numa-lookup-index-table" property contains one or more list numb=
ers representing
> >> +the domainIDs present in the system. The offset of the domainID in th=
is property is considered
> >> +the domainID index.
> >
> > The lookup-index-table is all about compactifying the representation
> > of the distance matrix.  Because node ids are sparse, the matrix of
> > distances is also effectively sparse.  You don't want to have a huge
> > matrix in the DT with mostly meaningless entries, so you use the
> > lookup table to compact the node ids.
> >
> > It's a bit confusing though, because you now have two representations
> > of exactly the same information the "full" node id (=3D=3D primary
> > domainID) and the "short" node id (=3D=3DdomainID lookup table offset).
> >
> > I can see three ways to clarify this:
> >
> >   A) Give the short node id an explicit name rather than difficult to
> >      parse "domainID index" or "domainID offset" which gets easily
> >      muddled with other uses of index and offset.  Use that name
> >      throughout.
>=20
> I dopped the domainID index and started referring to that as domain
> distance offset.

Better, since it's not ambiguous.  Still kinda long and awkward.

> >   B) Eliminate the short ID entirely, and use an explicit sparse
> >      matrix representation for the distance table e.g. a list of
> >      (nodeA, nodeB, distance) tuples
> >
> >      That does have the disadvantage that it's not structurally
> >      guaranteed that you have entries for every pair of "active" node
> >      ids.
>=20
> Other hypervisor would want to have a large possible domainID value and
> mostly want to publish the full topology details during boot. Using the
> above format makes a 16 node config have large "ibm,numa-distance-table"
> property.

It'd be about 3kiB, yes?  That's fairly large, but not ludicrously
large, so does that matter?

> >   C) Eliminate the "long ID" entirely.  In the Form2 world, is there
> >      actually any point allowing sparse node ids?  In this case you'd
> >      have the node id read from associativity and use that directly to
> >      index the distance table
>=20
> Yes, other hypervisor would like to partition the domain ID space for
> different resources.

Is that really a hard requirement on the dt format though?  The
hypervisor could always have its own internal lookup table between
long and short forms.

> >> +prop-encoded-array: The number N of the domainIDs encoded as with enc=
ode-int, followed by
> >> +N domainID encoded as with encode-int
> >> +
> >> +For ex:
> >> +ibm,numa-lookup-index-table =3D  {4, 0, 8, 250, 252}, domainID index
> >> for domainID 8 is 1.
> >
> > As noted "domainID index" is confusing here, because it's different
> > from the "domainID index" values in reference-points.
> >
> >> +
> >> +"ibm,numa-distance-table" property contains one or more list of numbe=
rs representing the NUMA
> >> +distance between resource groups/domains present in the system.
> >> +
> >> +prop-encoded-array: The number N of the distance values encoded as wi=
th encode-int, followed by
> >> +N distance values encoded as with encode-bytes. The max distance valu=
e we could encode is 255.
> >
> > The N here always has to be the square of the N in the
> > lookup-index-table, yes?  In which case do we actually need to include
> > it?
>=20
> most of PAPR device tree property follows the pattern  {N,....
> Nelements}. This follows the same pattern.

Many do, yes, but in many of those cases reading the N is actually
useful.  It's impossible to interpret this table if you don't already
know the number of nodes and if the length of the distance doesn't
match that, there's no reasonable fallback interpretation.

> >> +For ex:
> >> +ibm,numa-lookup-index-table =3D  {3, 0, 8, 40}
> >> +ibm,numa-distance-table     =3D  {9, 10, 20, 80, 20, 10, 160, 80, 160=
, 10}
> >> +
> >> +  | 0    8   40
> >> +--|------------
> >> +  |
> >> +0 | 10   20  80
> >> +  |
> >> +8 | 20   10  160
> >> +  |
> >> +40| 80   160  10
> >> +
> >> +
> >> +"ibm,associativity" property for resources in node 0, 8 and 40
> >> +
> >> +{ 3, 6, 7, 0 }
> >> +{ 3, 6, 9, 8 }
> >> +{ 3, 6, 7, 40}
> >> +
> >> +With "ibm,associativity-reference-points"  { 0x3 }
> >> +
> >> +Each resource (drcIndex) now also supports additional optional device=
 tree properties.
> >> +These properties are marked optional because the platform can choose =
not to export
> >> +them and provide the system topology details using the earlier define=
d device tree
> >> +properties alone. The optional device tree properties are used when a=
dding new resources
> >> +(DLPAR) and when the platform didn't provide the topology details of =
the domain which
> >> +contains the newly added resource during boot.
> >
> > In what circumstances would you envisage a hot-add creating a new NUMA
> > node, as opposed to adding resources to an existing (possibly empty)
> > node?  Do you need any provision for removing NUMA nodes again?
>=20
> Both Qemu and PowerVM don't intend to use this at this point. Both will
> provide the full possible NUMA node details during boot. But I was not
> sure whether we really need to restrict the possibility of a new
> resource being added. This can be true in case of new memory devices
> that gets hotplugged in the latency of the device is such that we never
> expressed that in the distance table during boot.=20

Hm, ok.  Can we just leave it out of the spec for now and add it in
when/if a hypervisor needs it?

> >> +"ibm,numa-lookup-index" property contains a number representing the d=
omainID index to be used
> >> +when building the NUMA distance of the numa node to which this resour=
ce belongs. This can
> >> +be looked at as the index at which this new domainID would have appea=
red in
> >> +"ibm,numa-lookup-index-table" if the domain was present during boot. =
The domainID
> >
> > Again, confusing use of "index" where it's used both for offsets in
> > ibm,associativity properties and for offsets in ibm,numa-lookup-index-t=
able
>=20
> I guess we can drop the ibm,numa-lookuup-index and state that the
> number of distance element in "ibm,numa-distance" suggest the index at
> which this NUMA node should appear for compuring the distance details.=20

I don't really follow what you're saying there.

> >> +of the new resource can be obtained from the existing "ibm,associativ=
ity" property. This
> >> +can be used to build distance information of a newly onlined NUMA nod=
e via DLPAR operation.
> >> +The value is 1 based array index value.
> >> +
> >> +prop-encoded-array: An integer encoded as with encode-int specifying =
the domainID index
> >> +
> >> +"ibm,numa-distance" property contains one or more list of numbers pre=
senting the NUMA distance
> >> +from this resource domain to other resources.
> >> +
> >> +prop-encoded-array: The number N of the distance values encoded as wi=
th encode-int, followed by
> >> +N distance values encoded as with encode-bytes. The max distance valu=
e we could encode is 255.
> >
> > Again, does N have to equal 2 * (existing number of nodes + 1)?  If so
> > you should say so, if not you should specify how incomplete
> > information is interpreted.
> >
> >> +For ex:
> >> +ibm,associativity     =3D { 4, 5, 10, 50}
> >> +ibm,numa-lookup-index =3D { 4 }
> >> +ibm,numa-distance   =3D  {8, 160, 255, 80, 10, 160, 255, 80, 10}
> >> +
> >> +resulting in a new toplogy as below.
> >> +  | 0    8   40   50
> >> +--|------------------
> >> +  |
> >> +0 | 10   20  80   160
> >> +  |
> >> +8 | 20   10  160  255
> >> +  |
> >> +40| 80   160  10  80
> >> +  |
> >> +50| 160  255  80  10
> >> +
>=20
> Here is the relevant updated part of the doc.
>=20
> Form 2 associativity format adds separate device tree properties represen=
ting NUMA node distance
> thereby making the node distance computation flexible. Form 2 also allows=
 flexible primary
> domain numbering. With numa distance computation now detached from the in=
dex value in
> "ibm,associativity-reference-points" property, Form 2 allows a large numb=
er of primary domain
> ids at the same domainID index representing resource groups of different =
performance/latency
> characteristics.
>=20
> Hypervisor indicates the usage of FORM2 associativity using bit 2 of byte=
 5 in the
> "ibm,architecture-vec-5" property.
>=20
> "ibm,numa-lookup-index-table" property contains one or more list numbers =
representing

s/one or more list numbers/a list of one or more numbers/

> the domainIDs present in the system. The offset of the domainID in this p=
roperty is
> used as an index while computing numa distance information via "ibm,numa-=
distance-table".
>=20
> prop-encoded-array: The number N of the domainIDs encoded as with encode-=
int, followed by
> N domainID encoded as with encode-int
>=20
> For ex:
> "ibm,numa-lookup-index-table" =3D  {4, 0, 8, 250, 252}. Offset of domainI=
D 8 (2) is used when
> computing the distance of domain 8 from other domains present in the syst=
em. For rest of
> this document this offset will be referred to as domain distance offset.
>=20
> "ibm,numa-distance-table" property contains one or more list of numbers r=
epresenting the NUMA
> distance between resource groups/domains present in the system.
>=20
> prop-encoded-array: The number N of the distance values encoded as with e=
ncode-int, followed by
> N distance values encoded as with encode-bytes. The max distance value we=
 could encode is 255.

If you insist on retaining the N here, at least explicitly state that
it must be equal to m^2, where m is the number of nodes in numa-lookup-inde=
x-table.

> For ex:
> ibm,numa-lookup-index-table =3D  {3, 0, 8, 40}
> ibm,numa-distance-table     =3D  {9, 10, 20, 80, 20, 10, 160, 80, 160, 10}
>=20
>   | 0    8   40
> --|------------
>   |
> 0 | 10   20  80
>   |
> 8 | 20   10  160
>   |
> 40| 80   160  10
>=20
> A possible "ibm,associativity" property for resources in node 0, 8 and 40
>=20
> { 3, 6, 7, 0 }
> { 3, 6, 9, 8 }
> { 3, 6, 7, 40}
>=20
> With "ibm,associativity-reference-points"  { 0x3 }
>=20
> "ibm,lookup-index-table" helps in having a compact representation of dist=
ance matrix.
> Since domainID can be sparse, the matrix of distances can also be effecti=
vely sparse.
> With "ibm,lookup-index-table" we are able to achieve a compact representa=
tion of
> distance information.
>=20
> Each resource (drcIndex) now also supports additional optional device tre=
e properties.
> These properties are marked optional because the platform can choose not =
to export
> them and provide the system topology details using the earlier defined de=
vice tree
> properties alone. The optional device tree properties are used when addin=
g new resources
> (DLPAR) and when the platform didn't provide the topology details of the =
domain which
> contains the newly added resource during boot.
>=20
> "ibm,numa-distance" property contains one or more list of numbers present=
ing the NUMA distance
> from this resource domain to other resources.
>=20
> prop-encoded-array: The number N of the distance values encoded as with e=
ncode-int, followed by
> N distance values encoded as with encode-bytes. The max distance value we=
 could encode is 255.

> If the system currently has 3 domains and a DLPAR operation is adding one=
 additional
> domain, "ibm,numa-distance" property should have 2 * (3 + 1) =3D 8 elemen=
ts as shown below.
> In other words the domain distance offset value for the newly added domai=
n is number of
> distance value elements in the "ibm,numa-distance" property divided by 2.

You need to spell out the distinction between the two halves of the
property - which one adds a row to numa-distance-table, and which one
adds a column.

> >> diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/includ=
e/asm/firmware.h
> >> index 60b631161360..97a3bd9ffeb9 100644
> >> --- a/arch/powerpc/include/asm/firmware.h
> >> +++ b/arch/powerpc/include/asm/firmware.h
> >> @@ -53,6 +53,7 @@
> >>  #define FW_FEATURE_ULTRAVISOR	ASM_CONST(0x0000004000000000)
> >>  #define FW_FEATURE_STUFF_TCE	ASM_CONST(0x0000008000000000)
> >>  #define FW_FEATURE_RPT_INVALIDATE ASM_CONST(0x0000010000000000)
> >> +#define FW_FEATURE_FORM2_AFFINITY ASM_CONST(0x0000020000000000)
> >> =20
> >>  #ifndef __ASSEMBLY__
> >> =20
> >> @@ -73,7 +74,7 @@ enum {
> >>  		FW_FEATURE_HPT_RESIZE | FW_FEATURE_DRMEM_V2 |
> >>  		FW_FEATURE_DRC_INFO | FW_FEATURE_BLOCK_REMOVE |
> >>  		FW_FEATURE_PAPR_SCM | FW_FEATURE_ULTRAVISOR |
> >> -		FW_FEATURE_RPT_INVALIDATE,
> >> +		FW_FEATURE_RPT_INVALIDATE | FW_FEATURE_FORM2_AFFINITY,
> >>  	FW_FEATURE_PSERIES_ALWAYS =3D 0,
> >>  	FW_FEATURE_POWERNV_POSSIBLE =3D FW_FEATURE_OPAL | FW_FEATURE_ULTRAVI=
SOR,
> >>  	FW_FEATURE_POWERNV_ALWAYS =3D 0,
> >> diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/as=
m/prom.h
> >> index df9fec9d232c..5c80152e8f18 100644
> >> --- a/arch/powerpc/include/asm/prom.h
> >> +++ b/arch/powerpc/include/asm/prom.h
> >> @@ -149,6 +149,7 @@ extern int of_read_drc_info_cell(struct property *=
*prop,
> >>  #define OV5_XCMO		0x0440	/* Page Coalescing */
> >>  #define OV5_FORM1_AFFINITY	0x0580	/* FORM1 NUMA affinity */
> >>  #define OV5_PRRN		0x0540	/* Platform Resource Reassignment */
> >> +#define OV5_FORM2_AFFINITY	0x0520	/* Form2 NUMA affinity */
> >>  #define OV5_HP_EVT		0x0604	/* Hot Plug Event support */
> >>  #define OV5_RESIZE_HPT		0x0601	/* Hash Page Table resizing */
> >>  #define OV5_PFO_HW_RNG		0x1180	/* PFO Random Number Generator */
> >> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/pro=
m_init.c
> >> index 64b9593038a7..496fdac54c29 100644
> >> --- a/arch/powerpc/kernel/prom_init.c
> >> +++ b/arch/powerpc/kernel/prom_init.c
> >> @@ -1070,7 +1070,8 @@ static const struct ibm_arch_vec ibm_architectur=
e_vec_template __initconst =3D {
> >>  #else
> >>  		0,
> >>  #endif
> >> -		.associativity =3D OV5_FEAT(OV5_FORM1_AFFINITY) | OV5_FEAT(OV5_PRRN=
),
> >> +		.associativity =3D OV5_FEAT(OV5_FORM1_AFFINITY) | OV5_FEAT(OV5_PRRN=
) |
> >> +		OV5_FEAT(OV5_FORM2_AFFINITY),
> >>  		.bin_opts =3D OV5_FEAT(OV5_RESIZE_HPT) | OV5_FEAT(OV5_HP_EVT),
> >>  		.micro_checkpoint =3D 0,
> >>  		.reserved0 =3D 0,
> >> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> >> index d32729f235b8..5a7d94960fb7 100644
> >> --- a/arch/powerpc/mm/numa.c
> >> +++ b/arch/powerpc/mm/numa.c
> >> @@ -56,12 +56,17 @@ static int n_mem_addr_cells, n_mem_size_cells;
> >> =20
> >>  #define FORM0_AFFINITY 0
> >>  #define FORM1_AFFINITY 1
> >> +#define FORM2_AFFINITY 2
> >>  static int affinity_form;
> >> =20
> >>  #define MAX_DISTANCE_REF_POINTS 4
> >>  static int max_associativity_domain_index;
> >>  static const __be32 *distance_ref_points;
> >>  static int distance_lookup_table[MAX_NUMNODES][MAX_DISTANCE_REF_POINT=
S];
> >> +static int numa_distance_table[MAX_NUMNODES][MAX_NUMNODES] =3D {
> >> +	[0 ... MAX_NUMNODES - 1] =3D { [0 ... MAX_NUMNODES - 1] =3D -1 }
> >> +};
> >> +static int numa_id_index_table[MAX_NUMNODES];
> >> =20
> >>  /*
> >>   * Allocate node_to_cpumask_map based on number of available nodes
> >> @@ -166,6 +171,27 @@ static void unmap_cpu_from_node(unsigned long cpu)
> >>  }
> >>  #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
> >> =20
> >> +/*
> >> + * With FORM2 if we are not using logical domain ids, we will find
> >> + * both primary and seconday domains with same value. Hence always
> >> + * start comparison from secondary domains
> >
> >
> > IIUC, in this new draft, secondary domains are no longer a meaningful
> > thing in Form2, so this comment and code seem outdated.
>=20
> This needed fixup. With FORM2 our associativity array can be just one
> element. I fixed up as below.
>=20
> static int __cpu_form2_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
> {
> 	int node1, node2;
> 	int dist =3D 0;
>=20
> 	node1 =3D associativity_to_nid(cpu1_assoc);
> 	node2 =3D associativity_to_nid(cpu2_assoc);
>=20
> 	dist =3D numa_distance_table[node1][node2];
> 	if (dist =3D=3D LOCAL_DISTANCE)
> 		return 0;
> 	else if (dist =3D=3D REMOTE_DISTANCE)
> 		return 1;
> 	else
> 		return 2;
> }
>=20
> also renamed cpu_distance to cpu_relative_distance.
>=20
>=20
> >> + */
> >> +static int __cpu_form2_distance(__be32 *cpu1_assoc, __be32 *cpu2_asso=
c)
> >> +{
> >> +	int dist =3D 0;
> >> +
> >> +	int i, index;
> >> +
> >> +	for (i =3D 1; i < max_associativity_domain_index; i++) {
> >> +		index =3D be32_to_cpu(distance_ref_points[i]);
> >> +		if (cpu1_assoc[index] =3D=3D cpu2_assoc[index])
> >> +			break;
> >> +		dist++;
> >> +	}
> >> +
> >> +	return dist;
> >> +}
> >> +
> >>  static int __cpu_form1_distance(__be32 *cpu1_assoc, __be32 *cpu2_asso=
c)
> >>  {
> >>  	int dist =3D 0;
> >> @@ -178,7 +204,6 @@ static int __cpu_form1_distance(__be32 *cpu1_assoc=
, __be32 *cpu2_assoc)
> >>  			break;
> >>  		dist++;
> >>  	}
> >> -
> >>  	return dist;
> >>  }
> >> =20
> >> @@ -186,8 +211,9 @@ int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_=
assoc)
> >>  {
> >>  	/* We should not get called with FORM0 */
> >>  	VM_WARN_ON(affinity_form =3D=3D FORM0_AFFINITY);
> >> -
> >> -	return __cpu_form1_distance(cpu1_assoc, cpu2_assoc);
> >> +	if (affinity_form =3D=3D FORM1_AFFINITY)
> >> +		return __cpu_form1_distance(cpu1_assoc, cpu2_assoc);
> >> +	return __cpu_form2_distance(cpu1_assoc, cpu2_assoc);
> >>  }
> >> =20
> >>  /* must hold reference to node during call */
> >> @@ -201,7 +227,9 @@ int __node_distance(int a, int b)
> >>  	int i;
> >>  	int distance =3D LOCAL_DISTANCE;
> >> =20
> >> -	if (affinity_form =3D=3D FORM0_AFFINITY)
> >> +	if (affinity_form =3D=3D FORM2_AFFINITY)
> >> +		return numa_distance_table[a][b];
> >> +	else if (affinity_form =3D=3D FORM0_AFFINITY)
> >>  		return ((a =3D=3D b) ? LOCAL_DISTANCE : REMOTE_DISTANCE);
> >> =20
> >>  	for (i =3D 0; i < max_associativity_domain_index; i++) {
> >> @@ -303,15 +331,116 @@ static void initialize_form1_numa_distance(stru=
ct device_node *node)
> >> =20
> >>  /*
> >>   * Used to update distance information w.r.t newly added node.
> >> + * ibm,numa-lookup-index -> 4
> >> + * ibm,numa-distance -> {5, 20, 40, 60, 80, 10 }
> >>   */
> >>  void update_numa_distance(struct device_node *node)
> >>  {
> >> +	int i, nid, other_nid, other_nid_index =3D 0;
> >> +	const __be32 *numa_indexp;
> >> +	const __u8  *numa_distancep;
> >> +	int numa_index, max_numa_index, numa_distance;
> >> +
> >>  	if (affinity_form =3D=3D FORM0_AFFINITY)
> >>  		return;
> >>  	else if (affinity_form =3D=3D FORM1_AFFINITY) {
> >>  		initialize_form1_numa_distance(node);
> >>  		return;
> >>  	}
> >> +	/* FORM2 affinity  */
> >> +
> >> +	nid =3D of_node_to_nid_single(node);
> >> +	if (nid =3D=3D NUMA_NO_NODE)
> >> +		return;
> >> +
> >> +	/* Already initialized */
> >> +	if (numa_distance_table[nid][nid] !=3D -1)
> >
> > IIUC, this should exactly correspond to the case where the new
> > resource lies in an existing NUMA node, yes?
>=20
> yes.
>=20
> >
> >> +		return;
> >> +	/*
> >> +	 * update node distance if not already populated.
> >> +	 */
> >> +	numa_distancep =3D of_get_property(node, "ibm,numa-distance", NULL);
> >> +	if (!numa_distancep)
> >> +		return;
> >> +
> >> +	numa_indexp =3D of_get_property(node, "ibm,numa-lookup-index", NULL);
> >> +	if (!numa_indexp)
> >> +		return;
> >> +
> >> +	numa_index =3D of_read_number(numa_indexp, 1);
> >> +	/*
> >> +	 * update the numa_id_index_table. Device tree look at index table as
> >> +	 * 1 based array indexing.
> >> +	 */
> >> +	numa_id_index_table[numa_index - 1] =3D nid;
> >> +
> >> +	max_numa_index =3D of_read_number((const __be32 *)numa_distancep, 1);
> >> +	VM_WARN_ON(max_numa_index !=3D 2 * numa_index);
> >
> > You WARN_ON(), but you don't actually bail out to avoid indexing past
> > the end of the property below.
> >
> > AFAICT none of this really works unless numa_index =3D=3D (previous num=
ber
> > of numa nodes + 1), which makes all the use of these different
> > variables kind of confusing.  If you had a variable that you just set
> > equal to the new number of numa nodes (previous number plus the one
> > being added), then I think you can replace all numa_index and
> > max_numa_index references with that and it will be clearer.
>=20
> I rewrote that as below.
>=20
> 	numa_distancep =3D of_get_property(node, "ibm,numa-distance", NULL);
> 	if (!numa_distancep)
> 		return;
>=20
> 	max_dist_element =3D of_read_number((const __be32 *)numa_distancep, 1);
>=20
> 	numa_id_index =3D max_dist_element >> 1;

You already know the existing number of NUMA nodes, so it seems
clearer to me to alidate the new property against that, rather than
trying to parse it out of the new property.

> 	/*
> 	 * update the numa_id_index_table. Device tree look at index table as
> 	 * 1 based array indexing.
> 	 */
> 	if (numa_id_index_table[numa_id_index - 1] !=3D -1) {
> 		WARN(1, "Wrong NUMA distance information\n");
> 		return;
> 	}

I believe
	if (WARN_ON(...))
		return;

is idiomatic.

> 	numa_id_index_table[numa_id_index - 1] =3D nid;
>=20
> 	/* Skip the size which is encoded int */
> 	numa_distancep +=3D sizeof(__be32);

Is numa_distancep a u32 pointer, or a char pointer?  If it's a u32
pointer then adding sizeof(__be32) rather than 1 is incorrect here.

> 	/*
> 	 * First fill the distance information from other node to this node.
> 	 */
> 	distance_index =3D 0;
> 	for (i =3D 0; i < numa_id_index; i++) {
> 		numa_distance =3D numa_distancep[distance_index++];

=2E. but if it's a char pointer then this looks wrong.

> 		other_nid =3D numa_id_index_table[i];
> 		if (other_nid =3D=3D NUMA_NO_NODE)
> 			continue;
> 		numa_distance_table[other_nid][nid] =3D numa_distance;
> 	}
>=20
> 	for (i =3D 0; i < numa_id_index; i++) {
> 		numa_distance =3D numa_distancep[distance_index++];

I'd just compute the offset from i here, rather than having another
variable to track.

> 		other_nid =3D numa_id_index_table[i];
> 		if (other_nid =3D=3D NUMA_NO_NODE)
> 			continue;
> 		numa_distance_table[nid][other_nid] =3D numa_distance;
> 	}
> }
>=20
>=20
> >
> >
> >> +	/* Skip the size which is encoded int */
> >> +	numa_distancep +=3D sizeof(__be32);
> >> +
> >> +	/*
> >> +	 * First fill the distance information from other node to this node.
> >> +	 */
> >> +	other_nid_index =3D 0;
> >> +	for (i =3D 0; i < numa_index; i++) {
> >> +		numa_distance =3D numa_distancep[i];
> >> +		other_nid =3D numa_id_index_table[other_nid_index++];
> >> +		numa_distance_table[other_nid][nid] =3D numa_distance;
> >> +	}
> >> +
> >> +	other_nid_index =3D 0;
> >> +	for (; i < max_numa_index; i++) {
> >
> > Again, splitting this loop and carrying i over seems a confusing way
> > to code this.  It's basically two loops of N, one writing a row of the
> > distance matrix, one writing a column (other_nid will even go through
> > the same values in each loop).
>=20
> Fixed
>=20
> >
> >> +		numa_distance =3D numa_distancep[i];
> >> +		other_nid =3D numa_id_index_table[other_nid_index++];
> >> +		numa_distance_table[nid][other_nid] =3D numa_distance;
> >> +	}
> >> +}
> >> +
> >> +/*
> >> + * ibm,numa-lookup-index-table=3D {N, domainid1, domainid2, ..... dom=
ainidN}
> >> + * ibm,numa-distance-table =3D { N, 1, 2, 4, 5, 1, 6, .... N elements}
> >> + */
> >> +static void initialize_form2_numa_distance_lookup_table(struct device=
_node *root)
> >> +{
> >> +	const __u8 *numa_dist_table;
> >> +	const __be32 *numa_lookup_index;
> >> +	int numa_dist_table_length;
> >> +	int max_numa_index, distance_index;
> >> +	int i, curr_row =3D 0, curr_column =3D 0;
> >> +
> >> +	numa_lookup_index =3D of_get_property(root, "ibm,numa-lookup-index-t=
able", NULL);
> >> +	max_numa_index =3D of_read_number(&numa_lookup_index[0], 1);
> >
> > max_numa_index here has a different meaning to max_numa_index in the
> > previous function, which is pointlessly confusing.
> >
> >> +	/* first element of the array is the size and is encode-int */
> >> +	numa_dist_table =3D of_get_property(root, "ibm,numa-distance-table",=
 NULL);
> >> +	numa_dist_table_length =3D of_read_number((const __be32 *)&numa_dist=
_table[0], 1);
> >> +	/* Skip the size which is encoded int */
> >> +	numa_dist_table +=3D sizeof(__be32);
> >> +
> >> +	pr_debug("numa_dist_table_len =3D %d, numa_dist_indexes_len =3D %d \=
n",
> >> +		 numa_dist_table_length, max_numa_index);
> >> +
> >> +	for (i =3D 0; i < max_numa_index; i++)
> >> +		/* +1 skip the max_numa_index in the property */
> >> +		numa_id_index_table[i] =3D of_read_number(&numa_lookup_index[i + 1]=
, 1);
> >> +
> >> +
> >> +	VM_WARN_ON(numa_dist_table_length !=3D max_numa_index * max_numa_ind=
ex);
> >
> > Again, you don't actually bail out in this case.  And if it has to
> > have this value, what's the point of encoding it into the property.
> >
> >> +	for (distance_index =3D 0; distance_index < numa_dist_table_length; =
distance_index++) {
> >> +		int nodeA =3D numa_id_index_table[curr_row];
> >> +		int nodeB =3D numa_id_index_table[curr_column++];
> >
> > You've already (sort of) verified that the distance table has size
> > N^2, in which case you can just to a simple two dimensional loop
> > rather than having to do ugly calculations of row and column.
>=20
> Fixed all the above and updated as below.
> 	if (numa_dist_table_length !=3D max_numa_index * max_numa_index) {
> 		WARN(1, "Wrong NUMA distnce information\n");
                                    ^^^^^^^

> 		/* consider everybody else just remote. */
>=20
> 		for (i =3D 0;  i < max_numa_index; i++) {
> 			for (j =3D 0; j < max_numa_index; j++) {
> 				int nodeA =3D numa_id_index_table[i];
> 				int nodeB =3D numa_id_index_table[j];
>=20
> 				if (nodeA =3D=3D nodeB)
> 					numa_distance_table[nodeA][nodeB] =3D LOCAL_DISTANCE;
> 				else
> 					numa_distance_table[nodeA][nodeB] =3D REMOTE_DISTANCE;
> 			}
> 		}
> 	}
>=20
> 	distance_index =3D 0;
> 	for (i =3D 0;  i < max_numa_index; i++) {
> 		for (j =3D 0; j < max_numa_index; j++) {
> 			int nodeA =3D numa_id_index_table[i];
> 			int nodeB =3D numa_id_index_table[j];
>=20
> 			numa_distance_table[nodeA][nodeB] =3D numa_dist_table[distance_index++=
];
>=20
> 			pr_debug("dist[%d][%d]=3D%d ", nodeA, nodeB, numa_distance_table[nodeA=
][nodeB]);
> 		}
> 	}
> }
>=20
>=20
> -aneesh
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--6TuSINLcILvbHPZM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDZaZoACgkQbDjKyiDZ
s5Leew//fdU0sQo80YSaVl2iOPYKzAvXU8cylBtBbbXTNOUPSdqyXDtcN7PqcwSG
9YBvj+KoZaQwjG51BbyBLrKC51hgwrVdyqjFMB5bGbF9r1Y7RFzwcpghDquPFDgs
1rHdjBvV8c4ekjFl57DWs6JuchEv3m8f5Xl/On7ENZuagUowSpoa7YP1lIErEKPu
NLBfCTff0z2aWxLnhcuOfwTEB478v8AggRuRyBD45VqTFXcPqv9Rj2epTuSQiBQe
SYMz9SOEfEf0zEA/wddjZO7VRx0D6N3gTa7UkM8RDr9uScJSDjSK46X0ztk0xMx7
v22K82OxjmhnMSYLdF9OnFd6FjaLb2g2Ji0wdaptqv9KMrPQkHbt/VNCUiumCB/V
4Mu2eSDgClA415fjQZUOKnkQ3+TngEXUB9WA7Asn9WWU1AXE1F7SzrL1POg+H4La
wIExbgYY/rADaL5E5OM4hQvnUwiGe2pQdhjQmUjyl4ruPQ8gpO5yy4io1AZLWeRR
d+RN2h02YZELNucEM7PJ9bK2rbTQr7VEV0923b5kXeAi/k0tpZBtbzbVSt4UL1t+
JeYvT/OaJRXMCB8qHl2D1So2G3Ab7frQVDVBzwEpXRgD4rquI5iaOHnoKkIdi30Z
qkJIOBBq08uDMUXoP3j9ctd4/Uptl35OYCGTdzjFkHuZn7Utnho=
=cMos
-----END PGP SIGNATURE-----

--6TuSINLcILvbHPZM--
