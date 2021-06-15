Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1931D3A770D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 08:26:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3yyC5M88z309y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 16:26:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=WDGUpkTJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=WDGUpkTJ; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3yxh5t36z2yyF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 16:26:00 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G3yxf3YHlz9sW8; Tue, 15 Jun 2021 16:25:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623738358;
 bh=xybwEPKiDDc+asBICl17FaIK0GOikWmt8AH4+c9wDMQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WDGUpkTJ5BrKA+UfiGFaJV6dtprCCQGqSIDnsqk7loELdxn1YWbOp2ZA3grh6F9si
 1r9j72RoLbXd4BymAgGetfUhYGqAfNrF+mbAH5jb+lNVf/MJKaxaApkHZuER0ZbfN/
 SdhpSKLmP1cU6KbaB/iQp3D3zK9laFFJB/VEC+PQ=
Date: Tue, 15 Jun 2021 16:25:49 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 7/8] powerpc/pseries: Add support for FORM2
 associativity
Message-ID: <YMhH7X9Tfq95gY6r@yekko>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-8-aneesh.kumar@linux.ibm.com>
 <YMgkMg0i/6L1SOPd@yekko> <87fsxjofw5.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XjEUOfxhB873w9AA"
Content-Disposition: inline
In-Reply-To: <87fsxjofw5.fsf@linux.ibm.com>
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


--XjEUOfxhB873w9AA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 15, 2021 at 10:58:42AM +0530, Aneesh Kumar K.V wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Mon, Jun 14, 2021 at 10:10:02PM +0530, Aneesh Kumar K.V wrote:
> >> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> >> ---
> >>  Documentation/powerpc/associativity.rst   | 139 ++++++++++++++++++++
> >>  arch/powerpc/include/asm/firmware.h       |   3 +-
> >>  arch/powerpc/include/asm/prom.h           |   1 +
> >>  arch/powerpc/kernel/prom_init.c           |   3 +-
> >>  arch/powerpc/mm/numa.c                    | 149 +++++++++++++++++++++-
> >>  arch/powerpc/platforms/pseries/firmware.c |   1 +
> >>  6 files changed, 290 insertions(+), 6 deletions(-)
> >>  create mode 100644 Documentation/powerpc/associativity.rst
> >>=20
> >> diff --git a/Documentation/powerpc/associativity.rst b/Documentation/p=
owerpc/associativity.rst
> >> new file mode 100644
> >> index 000000000000..58abedea81d7
> >> --- /dev/null
> >> +++ b/Documentation/powerpc/associativity.rst
> >> @@ -0,0 +1,139 @@
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
> >> +PAPR interface currently supports two different ways of communicating=
 these resource
> >
> > You describe form 2 below as well, which contradicts this.
>=20
> Fixed as below.
>=20
> PAPR interface currently supports different ways of communicating these r=
esource
> grouping details to the OS. These are referred to as Form 0, Form 1 and F=
orm2
> associativity grouping. Form 0 is the older format and is now considered =
deprecated.
>=20
> Hypervisor indicates the type/form of associativity used via "ibm,arcitec=
ture-vec-5 property".
> Bit 0 of byte 5 in the "ibm,architecture-vec-5" property indicates usage =
of Form 0 or Form 1.
> A value of 1 indicates the usage of Form 1 associativity. For Form 2 asso=
ciativity
> bit 2 of byte 5 in the "ibm,architecture-vec-5" property is used.

LGTM.

> >> +grouping details to the OS. These are referred to as Form 0 and Form =
1 associativity grouping.
> >> +Form 0 is the older format and is now considered deprecated.
> >> +
> >> +Hypervisor indicates the type/form of associativity used via "ibm,arc=
itecture-vec-5 property".
> >> +Bit 0 of byte 5 in the "ibm,architecture-vec-5" property indicates us=
age of Form 0 or Form 1.
> >> +A value of 1 indicates the usage of Form 1 associativity.
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
n resource groups/domains.=20
> >> +
> >> +The =E2=80=9Cibm,associativity=E2=80=9D property contains one or more=
 lists of numbers (domainID)
> >> +representing the resource=E2=80=99s platform grouping domains.
> >> +
> >> +The =E2=80=9Cibm,associativity-reference-points=E2=80=9D property con=
tains one or more list of numbers
> >> +(domain index) that represents the 1 based ordinal in the associativi=
ty lists of the most
> >> +significant boundary, with subsequent entries indicating progressivel=
y less significant boundaries.
> >> +
> >> +Linux kernel uses the domain id of the most significant boundary (aka=
 primary domain)
> >
> > I thought we used the *least* significant boundary (the smallest
> > grouping, not the largest).  That is, the last index, not the first.
> >
> > Actually... come to think of it, I'm not even sure how to interpret
> > "most significant".  Does that mean a change in grouping at that "most
> > significant" level results in the largest perfomance difference?
>=20
> PAPR defines "most significant" as below
>=20
> When the =E2=80=9Cibm,architecture-vec-5=E2=80=9D property byte 5 bit 0 h=
as the value of one, the =E2=80=9Cibm,associativ-
> ity-reference-points=E2=80=9D property indicates boundaries between assoc=
iativity domains presented by the
> =E2=80=9Cibm,associativity=E2=80=9D property containing =E2=80=9Cnear=E2=
=80=9D and =E2=80=9Cfar=E2=80=9D resources. The
> first such boundary in the list represents the 1 based ordinal in the
> associativity lists of the most significant boundary, with subsequent
> entries indicating progressively less significant boundaries

No... that's not a definition.  Like your draft PAPR uses the term
while entirely failing to define it.  From what I can tell about how
it is used the "most significant" boundary corresponds to what Linux
simply thinks of as the node id.  But intuitively, I'd think of that
as the "least significant" boundary, since that's basically the
smallest granularity at which we care about NUMA distances.


> I would interpret it as the boundary where we start defining NUMA
> nodes.

That isn't any clearer to me.

> >> +as the NUMA node id. Linux kernel computes NUMA distance between two =
domains by
> >> +recursively comparing if they belong to the same higher-level domains=
=2E For mismatch
> >> +at every higher level of the resource group, the kernel doubles the N=
UMA distance between
> >> +the comparing domains.
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
> >> +same domain index representing resource groups of different
> >> performance/latency characteristics.
> >
> > The meaning of "domain index" is not clear to me here.
>=20
> Sorry for the confusion there. domain index is the index where domainID
> is appearing. W.r.t "ibm,associativity"  we have

Ok, I think I eventually deduced that.  We should start out clearly
defining both domainID and index here.

Also.. I think we need to find more distinct terms, because "index" is
being used for both where the ID appears in an associativity array,
and also when an ID appears in the Form2 "lookup-index-table" and the
two usages are totally unconnected.

> The =E2=80=9Cibm,associativity=E2=80=9D property contains one or more lis=
ts of numbers (domainID)
> representing the resource=E2=80=99s platform grouping domains. If we can =
look at
> an example property.
>=20
> { 4, 6, 7, 0, 0}
> { 4, 6, 7, 0, 40}
>=20
> With Form 1 both NUMA node 0 and 40 will appear at the same distance.
> They both are at domain index 4. With Form 2 we can represent them with
> different NUMA distance values.

Ok.  Note that PAPR was never clear about what space domain IDs need
to be unique within: do they need to be (a) globally unique (not true
in practice), (b) unique at their index level or (c) unique only
within their "parent" node at the previous index level.

We should take the opportunity with Form2 to make that clearer.

My understanding is that with Form2 it should be entirely feasible to
built a dt have associativity arrays that are always of length 1.  Is
that correct?

> >> +
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
> > You haven't really introduced the term "domainID".  Is "domainID
> > index" the same as "domain index" above?  It's not clear to me.
>=20
> The earlier part of the documented said=20
>=20
> The =E2=80=9Cibm,associativity=E2=80=9D property contains one or more lis=
ts of numbers (domainID)
> representing the resource=E2=80=99s platform grouping domains.
>=20
> I will update domain index to domainID index.=20
>=20
> >
> > The distinction between "domain index" and "primary domain id" is also
> > not clear to me.
>=20
> primary domain id is the domainID appearing in the primary domainID
> index. Linux kenrel also use that as the NUMA node number.

nit s/kenrel/kernel/

> Primary domainID index is defined by ibm,associativity-reference-points
> and we consider that as the most significant resource group boundary.
>=20
> ibm,associativity-reference-points can be looked at as
> { primary domainID index, secondary domainID index, tertiary domainID ind=
ex.. }

Ok, explicitly stating that in the doc would help a lot.

> >
> >> +prop-encoded-array: The number N of the domainIDs encoded as with enc=
ode-int, followed by
> >> +N domainID encoded as with encode-int
> >> +
> >> +For ex:
> >> +ibm,numa-lookup-index-table =3D  {4, 0, 8, 250, 252}, domainID index =
for domainID 8 is 1.
> >
> > Above you say "Form 2 allows a large number of primary domain ids at
> > the same domain index", but this encoding doesn't appear to permit
> > that.
>=20
> I didn't follow that question.

Ah, that's because I was thinking of index here as the index within
the lookup-index-table, not the index within the associativity
arrays.

> >
> >> +"ibm,numa-distance-table" property contains one or more list of numbe=
rs representing the NUMA
> >> +distance between resource groups/domains present in the system.
> >> +
> >> +prop-encoded-array: The number N of the distance values encoded as wi=
th encode-int, followed by
> >> +N distance values encoded as with encode-bytes. The max distance valu=
e we could encode is 255.
> >> +
> >> +For ex:
> >> +ibm,numa-lookup-index-table =3D  {3, 0, 8, 40}
> >> +ibm,numa-distance-table     =3D  {9, 1, 2, 8, 2, 1, 16, 8, 16, 1}
> >> +
> >> +  | 0    8   40
> >> +--|------------
> >> +  |
> >> +0 | 10   20  80
> >> +  |
> >> +8 | 20   10  160
> >> +  |
> >> +40| 80   160  10
> >
> > What's the reason for multiplying the values by 10 in the expanded
> > table version?
>=20
> That was me missing a document update. Since we used 8 bits to encode
> distance at some point we were looking at a SCALE factor. But later
> realized other architectures also restrict distance to 8 bits. I will
> update ibm,numa-distance-table in the document.

Ok.

> >> +
> >> +With Form2 "ibm,associativity" for resources is listed as below:
> >> +
> >> +"ibm,associativity" property for resources in node 0, 8 and 40
> >> +{ 4, 6, 7, 0, 0}
> >> +{ 4, 6, 9, 8, 8}
> >> +{ 4, 6, 7, 0, 40}
> >> +
> >> +With "ibm,associativity-reference-points"  { 0x4, 0x3, 0x2 }
> >> +
> >> +With Form2 the primary domainID and secondary domainID are used to id=
entify the NUMA nodes
> >
> > What the heck is the secondary domainID
>=20
> domainID appearing the secondary domainID index.

I understand that from the clarifications you've made about, but
second domainID index wasn't any more defined in the original draft.

> ibm,associativity-reference-points gives an indication of different
> hierachy of resource grouping as below.
>=20
> ibm,associativity-reference-points can be looked at as
> { primary domainID index, secondary domainID index, tertiary domainID ind=
ex.. }
>=20
> >
> >> +the kernel should use when using persistent memory devices. Persisten=
t memory devices
> >> +can also be used as regular memory using DAX KMEM driver and primary =
domainID indicates
> >> +the numa node number OS should use when using these devices as regula=
r memory. Secondary
> >> +domainID is the numa node number that should be used when using this =
device as
> >> +persistent memory. In the later case, we are interested in the locali=
ty of the
> >> +device to an established numa node. In the above example, if the last=
 row represents a
> >> +persistent memory device/resource, NUMA node number 40 will be used w=
hen using the device
> >> +as regular memory and NUMA node number 0 will be the device numa node=
 when using it as
> >> +a persistent memory device.
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
> >> +
> >> +"ibm,numa-lookup-index" property contains a number representing the d=
omainID index to be used
> >> +when building the NUMA distance of the numa node to which this resour=
ce belongs. The domain id
> >> +of the new resource can be obtained from the existing "ibm,associativ=
ity" property. This
> >> +can be used to build distance information of a newly onlined NUMA nod=
e via DLPAR operation.
> >> +The value is 1 based array index value.
> >
> > Am I correct in thinking that if we have an entirely form2 world, we'd
> > only need this and the ibm,associativity properties could be dropped?
>=20
> Not really. ibm,numa-lookup-index-table was added to have a concise
> representation of numa distance via ibm,numa-distance-table.=20
>=20
> For ex: With domainID 0, 4, 5 we could do a 5x5 matrix to represent the
> numa distance. Instead ibm,numa-lookup-index-table allows us to present
> the same in a 3x3 matrix  distance[index0][index1] is the  distance
> between NUMA node 0 and 4 and distance[index0][index2] is the distance
> between NUMA node 0 and 5

Right, I get the purpose of it, and I realized I misphrashed my
question.  My point is that in a Form2 world, the *only* thing the
associativity array is used for is to deduce its position in
lookup-index-table.  Once you have have that for each resource, you
have everything you need, yes?

>=20
>=20
> >
> >> +
> >> +prop-encoded-array: An integer encoded as with encode-int specifying =
the domainID index
> >> +
> >> +"ibm,numa-distance" property contains one or more list of numbers pre=
senting the NUMA distance
> >> +from this resource domain to other resources.
> >
> > IIUC this is about extending the global distance table with
> > information for a new node.  Is that correct?
>=20
> correct.
>=20
> >
> > The global distance table allows for the possibility of asymmetric
> > distances between nodes, but this does not.  Is that intentional?
>=20
> This also does, For example with 3 nodes currently present and 4 node
> getting added ibm,numa-distance have 8 elements enabling us to have
> distance[Node0][Node50] being different from distance[Node50][Node0]
> as shown below.

Ok that's not clear from the above.  Rather than "one or more lists of
numbers" I think you want to explicitly give two options.  Either one
list, which gives symmetric distances, or two which gives distances
to, then distance from.

>=20
> >
> >> +prop-encoded-array: The number N of the distance values encoded as wi=
th encode-int, followed by
> >> +N distance values encoded as with encode-bytes. The max distance valu=
e we could encode is 255.
> >> +
> >> +For ex:
> >> +ibm,associativity     =3D { 4, 5, 6, 7, 50}
> >> +ibm,numa-lookup-index =3D { 4 }
> >> +ibm,numa-distance   =3D  {8, 16, 32, 8, 1, 16, 32, 8, 1}
> >> +
> >> +resulting in a new toplogy as below.
> >> +  | 0    8   40   50
> >> +--|------------------
> >> +  |
> >> +0 | 10   20  80   160
> >> +  |
> >> +8 | 20   10  160  320
> >> +  |
> >> +40| 80   160  10  80
> >> +  |
> >> +50| 160  320  80  10
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--XjEUOfxhB873w9AA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIR+oACgkQbDjKyiDZ
s5KeFRAAp0MUZwMWE/KXtC06tpaxzQZo+Bk7bgzQE0FKtq+EFytBEM4X0kdN3KgD
HimRHceDe9LB7e4IS37WyX0DVYp4Crqpk//+DEVteIdvfrmMI8WehGxsgZ2PTUaw
zWiwyPvaZ5Hza4YHC5lMVKtD1pyiFJaOWrHjRH35fneBhztyr1Cf99Uuhl2UgWt+
hCy6ddJU0Hy/dO3xAcvqt+Tllt4LUNXhaukSqTOfgCrbQsrq4a8xpQ2peTYtOLUP
tsMcNRjwFQV29fXO7rs7YIT459nqVQhq6pcPOz849bQc26FOOw1Y+mZryrEpXaLc
K6hVW3sFdKotun/rkzUAVf/F5OJks92wGycYb5+Y/zvtwL3gnPs21uSqcgrraYQU
pspgtNH5KjbmRUvPX4sWKqDhrj35nzUkuRABAS3mx4RWRG2IKRbvc1o5QUG/Nv5m
evLZl7NGwVl6SM+xd6wBX3rKrVnSVcyNghEKUMoJ0yX5mw/GeTDue/VHnnqNb1YX
yQ6ZQ5qiSYnOgljJW9fUXqgt3dTHiDCQfUUyzuJr1r3YD7O+g62Ds8GP1X8vibK+
GrxD9eGwkSZr21fpN9qNSv7MlgoB9KIcvzJzJKrq6TmaMniUFWZW103YgLzga921
Vs9gM+ePVlGEjJsTdUvpkDs7grGHPKv5iFkZ5aSe45sE1GTkAkk=
=cBae
-----END PGP SIGNATURE-----

--XjEUOfxhB873w9AA--
