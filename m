Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ECB3D515A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 04:43:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY43f3bmzz3dCB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 12:43:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=WMGAC2b1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=WMGAC2b1; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY41z1PM1z30Cv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 12:41:42 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GY41s540Gz9srZ; Mon, 26 Jul 2021 12:41:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1627267297;
 bh=FpJj6iENpBXz2eQtGoO7CqVC2JufzAvdW+Be2KjYFOI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WMGAC2b1XHyv2aPaWBPhK2vdhTE+AwnVOSaWVr37HrnWP17aAvo8HtBiB2R+M8FR2
 g4m0wQKMcpMFVhPu8l3ys45wcQOBHYOfzA2I6Sl3xZkKQFPOF24mJDdJ60Xk6M86KC
 u9+kWznDVv4LsSXYkMo63fy90/bibqQOTWF8GAG0=
Date: Mon, 26 Jul 2021 12:41:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v5 6/6] powerpc/pseries: Add support for FORM2
 associativity
Message-ID: <YP4g2JIms5PjojBj@yekko>
References: <20210628151117.545935-1-aneesh.kumar@linux.ibm.com>
 <20210628151117.545935-7-aneesh.kumar@linux.ibm.com>
 <YPjX5BxRKj6SFyCW@yekko> <87tukmu7hp.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xYWHQKgD/xzSO8r1"
Content-Disposition: inline
In-Reply-To: <87tukmu7hp.fsf@linux.ibm.com>
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


--xYWHQKgD/xzSO8r1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 22, 2021 at 01:04:42PM +0530, Aneesh Kumar K.V wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>=20
> > On Mon, Jun 28, 2021 at 08:41:17PM +0530, Aneesh Kumar K.V wrote:
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
> >>  Documentation/powerpc/associativity.rst   | 103 ++++++++++++++
> >>  arch/powerpc/include/asm/firmware.h       |   3 +-
> >>  arch/powerpc/include/asm/prom.h           |   1 +
> >>  arch/powerpc/kernel/prom_init.c           |   3 +-
> >>  arch/powerpc/mm/numa.c                    | 157 ++++++++++++++++++----
> >>  arch/powerpc/platforms/pseries/firmware.c |   1 +
> >>  6 files changed, 242 insertions(+), 26 deletions(-)
> >>  create mode 100644 Documentation/powerpc/associativity.rst
> >>=20
> >> diff --git a/Documentation/powerpc/associativity.rst b/Documentation/p=
owerpc/associativity.rst
> >> new file mode 100644
> >> index 000000000000..31cc7da2c7a6
> >> --- /dev/null
> >> +++ b/Documentation/powerpc/associativity.rst
> >> @@ -0,0 +1,103 @@
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
> >
> > Pretty hard to decipher, but that's typical for PAPR.
> >
> >> +PAPR interface currently supports different ways of communicating the=
se resource
> >> +grouping details to the OS. These are referred to as Form 0, Form 1 a=
nd Form2
> >> +associativity grouping. Form 0 is the older format and is now conside=
red deprecated.
> >
> > Nit: s/older/oldest/ since there are now >2 forms.
>=20
> updated.
>=20
> >
> >> +Hypervisor indicates the type/form of associativity used via "ibm,arc=
hitecture-vec-5 property".
> >> +Bit 0 of byte 5 in the "ibm,architecture-vec-5" property indicates us=
age of Form 0 or Form 1.
> >> +A value of 1 indicates the usage of Form 1 associativity. For Form 2 =
associativity
> >> +bit 2 of byte 5 in the "ibm,architecture-vec-5" property is used.
> >> +
> >> +Form 0
> >> +-----
> >> +Form 0 associativity supports only two NUMA distances (LOCAL and REMO=
TE).
> >> +
> >> +Form 1
> >> +-----
> >> +With Form 1 a combination of ibm,associativity-reference-points, and =
ibm,associativity
> >> +device tree properties are used to determine the NUMA distance betwee=
n resource groups/domains.
> >> +
> >> +The =E2=80=9Cibm,associativity=E2=80=9D property contains a list of o=
ne or more numbers (domainID)
> >> +representing the resource=E2=80=99s platform grouping domains.
> >> +
> >> +The =E2=80=9Cibm,associativity-reference-points=E2=80=9D property con=
tains a list of one or more numbers
> >> +(domainID index) that represents the 1 based ordinal in the associati=
vity lists.
> >> +The list of domainID indexes represents an increasing hierarchy of re=
source grouping.
> >> +
> >> +ex:
> >> +{ primary domainID index, secondary domainID index, tertiary domainID=
 index.. }
> >> +
> >> +Linux kernel uses the domainID at the primary domainID index as the N=
UMA node id.
> >> +Linux kernel computes NUMA distance between two domains by recursivel=
y comparing
> >> +if they belong to the same higher-level domains. For mismatch at ever=
y higher
> >> +level of the resource group, the kernel doubles the NUMA distance bet=
ween the
> >> +comparing domains.
> >> +
> >> +Form 2
> >> +-------
> >> +Form 2 associativity format adds separate device tree properties repr=
esenting NUMA node distance
> >> +thereby making the node distance computation flexible. Form 2 also al=
lows flexible primary
> >> +domain numbering. With numa distance computation now detached from th=
e index value in
> >> +"ibm,associativity-reference-points" property, Form 2 allows a large =
number of primary domain
> >> +ids at the same domainID index representing resource groups of differ=
ent performance/latency
> >> +characteristics.
> >> +
> >> +Hypervisor indicates the usage of FORM2 associativity using bit 2 of =
byte 5 in the
> >> +"ibm,architecture-vec-5" property.
> >> +
> >> +"ibm,numa-lookup-index-table" property contains a list of one or more=
 numbers representing
> >> +the domainIDs present in the system. The offset of the domainID in th=
is property is
> >> +used as an index while computing numa distance information via "ibm,n=
uma-distance-table".
> >> +
> >> +prop-encoded-array: The number N of the domainIDs encoded as with enc=
ode-int, followed by
> >> +N domainID encoded as with encode-int
> >> +
> >> +For ex:
> >> +"ibm,numa-lookup-index-table" =3D  {4, 0, 8, 250, 252}. The offset of=
 domainID 8 (2) is used when
> >> +computing the distance of domain 8 from other domains present in the =
system. For the rest of
> >> +this document, this offset will be referred to as domain distance off=
set.
> >> +
> >> +"ibm,numa-distance-table" property contains a list of one or more num=
bers representing the NUMA
> >> +distance between resource groups/domains present in the system.
> >> +
> >> +prop-encoded-array: The number N of the distance values encoded as wi=
th encode-int, followed by
> >> +N distance values encoded as with encode-bytes. The max distance valu=
e we could encode is 255.
> >> +The number N must be equal to the square of m where m is the number o=
f domainIDs in the
> >> +numa-lookup-index-table.
> >> +
> >> +For ex:
> >> +ibm,numa-lookup-index-table =3D  {3, 0, 8, 40}
> >> +ibm,numa-distance-table     =3D  {9, 10, 20, 80, 20, 10, 160, 80, 160=
, 10}
> >
> > This representation doesn't make it clear that the 9 is a u32, but the
> > rest are u8s.
>=20
> How do you suggest we specify that? I could do 9:u32 10:u8 etc. But
> considering the details are explained in the paragraph above, is that
> needed?

Yes, I think it is needed.  The examples are, honestly, a lot easier
to read and follow than the PAPR-ese text, so people are much more
likely to be looking at those than parsing the minutiae of the text.

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
> >> +A possible "ibm,associativity" property for resources in node 0, 8 an=
d 40
> >> +
> >> +{ 3, 6, 7, 0 }
> >> +{ 3, 6, 9, 8 }
> >> +{ 3, 6, 7, 40}
> >> +
> >> +With "ibm,associativity-reference-points"  { 0x3 }
> >
> > You haven't actually described how ibm,associativity-reference-points
> > operates in Form2.
>=20
> Nothing change w.r.t the definition of associativity-reference-points
> w.r.t FORM2. It still will continue to show the increasing hierarchy of
> resource groups.

I guess, except that really none of them matter except the primary any
more.

>=20
> >
> >> +"ibm,lookup-index-table" helps in having a compact representation of =
distance matrix.
> >> +Since domainID can be sparse, the matrix of distances can also be eff=
ectively sparse.
> >> +With "ibm,lookup-index-table" we can achieve a compact representation=
 of
> >> +distance information.
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
> >> index 5d9ea059594f..c483df6c9393 100644
> >> --- a/arch/powerpc/kernel/prom_init.c
> >> +++ b/arch/powerpc/kernel/prom_init.c
> >> @@ -1069,7 +1069,8 @@ static const struct ibm_arch_vec ibm_architectur=
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
> >> index c6293037a103..c68846fc9550 100644
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
> >> +static int numa_id_index_table[MAX_NUMNODES] =3D { [0 ... MAX_NUMNODE=
S - 1] =3D NUMA_NO_NODE };
> >> =20
> >>  /*
> >>   * Allocate node_to_cpumask_map based on number of available nodes
> >> @@ -166,6 +171,44 @@ static void unmap_cpu_from_node(unsigned long cpu)
> >>  }
> >>  #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
> >> =20
> >> +/*
> >> + * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
> >> + * info is found.
> >> + */
> >> +static int associativity_to_nid(const __be32 *associativity)
> >> +{
> >> +	int nid =3D NUMA_NO_NODE;
> >> +
> >> +	if (!numa_enabled)
> >> +		goto out;
> >> +
> >> +	if (of_read_number(associativity, 1) >=3D primary_domain_index)
> >> +		nid =3D of_read_number(&associativity[primary_domain_index], 1);
> >> +
> >> +	/* POWER4 LPAR uses 0xffff as invalid node */
> >> +	if (nid =3D=3D 0xffff || nid >=3D nr_node_ids)
> >> +		nid =3D NUMA_NO_NODE;
> >> +out:
> >> +	return nid;
> >> +}
> >> +
> >> +static int __cpu_form2_relative_distance(__be32 *cpu1_assoc, __be32 *=
cpu2_assoc)
> >> +{
> >> +	int dist;
> >> +	int node1, node2;
> >> +
> >> +	node1 =3D associativity_to_nid(cpu1_assoc);
> >> +	node2 =3D associativity_to_nid(cpu2_assoc);
> >> +
> >> +	dist =3D numa_distance_table[node1][node2];
> >> +	if (dist <=3D LOCAL_DISTANCE)
> >> +		return 0;
> >> +	else if (dist <=3D REMOTE_DISTANCE)
> >> +		return 1;
> >> +	else
> >> +		return 2;
> >
> > Squashing the full range of distances into just 0, 1 or 2 seems odd.
> > But then, this whole cpu_distance() thing being distinct from
> > node_distance() seems odd.
> >
> >> +}
> >> +
> >>  static int __cpu_form1_relative_distance(__be32 *cpu1_assoc, __be32 *=
cpu2_assoc)
> >>  {
> >>  	int dist =3D 0;
> >> @@ -186,8 +229,9 @@ int cpu_relative_distance(__be32 *cpu1_assoc, __be=
32 *cpu2_assoc)
> >>  {
> >>  	/* We should not get called with FORM0 */
> >>  	VM_WARN_ON(affinity_form =3D=3D FORM0_AFFINITY);
> >> -
> >> -	return __cpu_form1_relative_distance(cpu1_assoc, cpu2_assoc);
> >> +	if (affinity_form =3D=3D FORM1_AFFINITY)
> >> +		return __cpu_form1_relative_distance(cpu1_assoc, cpu2_assoc);
> >> +	return __cpu_form2_relative_distance(cpu1_assoc, cpu2_assoc);
> >>  }
> >> =20
> >>  /* must hold reference to node during call */
> >> @@ -201,7 +245,9 @@ int __node_distance(int a, int b)
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
> >
> > Hmm.. couldn't we simplify this whole __node_distance function, if we
> > just update numa_distance_table[][] appropriately for Form0 and Form1
> > as well?
>=20
> IIUC what you are suggesting is to look at the possibility of using
> numa_distance_table[a][b] even for FORM1_AFFINITY? I can do that as part
> of separate patch?

Ok, that's reasonable.

> >
> >> @@ -216,27 +262,6 @@ int __node_distance(int a, int b)
> >>  }
> >>  EXPORT_SYMBOL(__node_distance);
> >> =20
> >> -/*
> >> - * Returns nid in the range [0..nr_node_ids], or -1 if no useful NUMA
> >> - * info is found.
> >> - */
> >> -static int associativity_to_nid(const __be32 *associativity)
> >> -{
> >> -	int nid =3D NUMA_NO_NODE;
> >> -
> >> -	if (!numa_enabled)
> >> -		goto out;
> >> -
> >> -	if (of_read_number(associativity, 1) >=3D primary_domain_index)
> >> -		nid =3D of_read_number(&associativity[primary_domain_index], 1);
> >> -
> >> -	/* POWER4 LPAR uses 0xffff as invalid node */
> >> -	if (nid =3D=3D 0xffff || nid >=3D nr_node_ids)
> >> -		nid =3D NUMA_NO_NODE;
> >> -out:
> >> -	return nid;
> >> -}
> >> -
> >>  /* Returns the nid associated with the given device tree node,
> >>   * or -1 if not found.
> >>   */
> >> @@ -305,12 +330,84 @@ static void initialize_form1_numa_distance(struc=
t device_node *node)
> >>   */
> >>  void update_numa_distance(struct device_node *node)
> >>  {
> >> +	int nid;
> >> +
> >>  	if (affinity_form =3D=3D FORM0_AFFINITY)
> >>  		return;
> >>  	else if (affinity_form =3D=3D FORM1_AFFINITY) {
> >>  		initialize_form1_numa_distance(node);
> >>  		return;
> >>  	}
> >> +
> >> +	/* FORM2 affinity  */
> >> +	nid =3D of_node_to_nid_single(node);
> >> +	if (nid =3D=3D NUMA_NO_NODE)
> >> +		return;
> >> +
> >> +	/*
> >> +	 * With FORM2 we expect NUMA distance of all possible NUMA
> >> +	 * nodes to be provided during boot.
> >> +	 */
> >> +	WARN(numa_distance_table[nid][nid] =3D=3D -1,
> >> +	     "NUMA distance details for node %d not provided\n", nid);
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
> >> +	int i, j;
> >> +	const __u8 *numa_dist_table;
> >> +	const __be32 *numa_lookup_index;
> >> +	int numa_dist_table_length;
> >> +	int max_numa_index, distance_index;
> >> +
> >> +	numa_lookup_index =3D of_get_property(root, "ibm,numa-lookup-index-t=
able", NULL);
> >> +	max_numa_index =3D of_read_number(&numa_lookup_index[0], 1);
> >> +
> >> +	/* first element of the array is the size and is encode-int */
> >> +	numa_dist_table =3D of_get_property(root, "ibm,numa-distance-table",=
 NULL);
> >> +	numa_dist_table_length =3D of_read_number((const __be32 *)&numa_dist=
_table[0], 1);
> >> +	/* Skip the size which is encoded int */
> >> +	numa_dist_table +=3D sizeof(__be32);
> >> +
> >> +	pr_debug("numa_dist_table_len =3D %d, numa_dist_indexes_len =3D %d\n=
",
> >> +		 numa_dist_table_length, max_numa_index);
> >> +
> >> +	for (i =3D 0; i < max_numa_index; i++)
> >> +		/* +1 skip the max_numa_index in the property */
> >> +		numa_id_index_table[i] =3D of_read_number(&numa_lookup_index[i + 1]=
, 1);
> >> +
> >> +
> >> +	if (numa_dist_table_length !=3D max_numa_index * max_numa_index) {
> >> +
> >> +		WARN(1, "Wrong NUMA distance information\n");
> >> +		/* consider everybody else just remote. */
> >> +		for (i =3D 0;  i < max_numa_index; i++) {
> >> +			for (j =3D 0; j < max_numa_index; j++) {
> >> +				int nodeA =3D numa_id_index_table[i];
> >> +				int nodeB =3D numa_id_index_table[j];
> >> +
> >> +				if (nodeA =3D=3D nodeB)
> >> +					numa_distance_table[nodeA][nodeB] =3D LOCAL_DISTANCE;
> >> +				else
> >> +					numa_distance_table[nodeA][nodeB] =3D REMOTE_DISTANCE;
> >> +			}
> >> +		}
> >> +	}
> >> +
> >> +	distance_index =3D 0;
> >> +	for (i =3D 0;  i < max_numa_index; i++) {
> >> +		for (j =3D 0; j < max_numa_index; j++) {
> >> +			int nodeA =3D numa_id_index_table[i];
> >> +			int nodeB =3D numa_id_index_table[j];
> >> +
> >> +			numa_distance_table[nodeA][nodeB] =3D numa_dist_table[distance_ind=
ex++];
> >> +			pr_debug("dist[%d][%d]=3D%d ", nodeA, nodeB, numa_distance_table[n=
odeA][nodeB]);
> >> +		}
> >> +	}
> >>  }
> >> =20
> >>  static int __init find_primary_domain_index(void)
> >> @@ -323,6 +420,9 @@ static int __init find_primary_domain_index(void)
> >>  	 */
> >>  	if (firmware_has_feature(FW_FEATURE_OPAL)) {
> >>  		affinity_form =3D FORM1_AFFINITY;
> >> +	} else if (firmware_has_feature(FW_FEATURE_FORM2_AFFINITY)) {
> >> +		dbg("Using form 2 affinity\n");
> >> +		affinity_form =3D FORM2_AFFINITY;
> >>  	} else if (firmware_has_feature(FW_FEATURE_FORM1_AFFINITY)) {
> >>  		dbg("Using form 1 affinity\n");
> >>  		affinity_form =3D FORM1_AFFINITY;
> >> @@ -367,8 +467,17 @@ static int __init find_primary_domain_index(void)
> >> =20
> >>  		index =3D of_read_number(&distance_ref_points[1], 1);
> >>  	} else {
> >> +		/*
> >> +		 * Both FORM1 and FORM2 affinity find the primary domain details
> >> +		 * at the same offset.
> >> +		 */
> >>  		index =3D of_read_number(distance_ref_points, 1);
> >>  	}
> >> +	/*
> >> +	 * If it is FORM2 also initialize the distance table here.
> >> +	 */
> >> +	if (affinity_form =3D=3D FORM2_AFFINITY)
> >> +		initialize_form2_numa_distance_lookup_table(root);
> >
> > Ew.  Calling a function called "find_primary_domain_index" to also
> > initialize the main distance table is needlessly counterintuitive.
> > Move this call to parse_numa_properties().
>=20
> The reason I ended up doing it here is because 'root' is already fetched
> here. But I agree it is confusing. I will move fetching of root inside
> initialize_form2_numa_distance_lookup_table() and move the function
> outside primary_index lookup.

Ok.  This is not a hot path anyway, so looking up root twice isn't
really a big deal anyway.

>=20
> modified   arch/powerpc/mm/numa.c
> @@ -355,14 +355,22 @@ void update_numa_distance(struct device_node *node)
>   * ibm,numa-lookup-index-table=3D {N, domainid1, domainid2, ..... domain=
idN}
>   * ibm,numa-distance-table =3D { N, 1, 2, 4, 5, 1, 6, .... N elements}
>   */
> -static void initialize_form2_numa_distance_lookup_table(struct device_no=
de *root)
> +static void initialize_form2_numa_distance_lookup_table()
>  {
>  	int i, j;
> +	struct device_node *root;
>  	const __u8 *numa_dist_table;
>  	const __be32 *numa_lookup_index;
>  	int numa_dist_table_length;
>  	int max_numa_index, distance_index;
> =20
> +	if (firmware_has_feature(FW_FEATURE_OPAL))
> +		root =3D of_find_node_by_path("/ibm,opal");
> +	else
> +		root =3D of_find_node_by_path("/rtas");
> +	if (!root)
> +		root =3D of_find_node_by_path("/");
> +
>  	numa_lookup_index =3D of_get_property(root, "ibm,numa-lookup-index-tabl=
e", NULL);
>  	max_numa_index =3D of_read_number(&numa_lookup_index[0], 1);
> =20
> @@ -407,6 +415,7 @@ static void initialize_form2_numa_distance_lookup_tab=
le(struct device_node *root
>  			pr_debug("dist[%d][%d]=3D%d ", nodeA, nodeB, numa_distance_table[node=
A][nodeB]);
>  		}
>  	}
> +	of_node_put(root);
>  }
> =20
>  static int __init find_primary_domain_index(void)
> @@ -472,12 +481,6 @@ static int __init find_primary_domain_index(void)
>  		 */
>  		index =3D of_read_number(distance_ref_points, 1);
>  	}
> -	/*
> -	 * If it is FORM2 also initialize the distance table here.
> -	 */
> -	if (affinity_form =3D=3D FORM2_AFFINITY)
> -		initialize_form2_numa_distance_lookup_table(root);
> -
>  	/*
>  	 * Warn and cap if the hardware supports more than
>  	 * MAX_DISTANCE_REF_POINTS domains.
> @@ -916,6 +919,12 @@ static int __init parse_numa_properties(void)
> =20
>  	dbg("NUMA associativity depth for CPU/Memory: %d\n", primary_domain_ind=
ex);
> =20
> +	/*
> +	 * If it is FORM2 also initialize the distance table here.
> +	 */
> +	if (affinity_form =3D=3D FORM2_AFFINITY)
> +		initialize_form2_numa_distance_lookup_table();
> +
>  	/*
>  	 * Even though we connect cpus to numa domains later in SMP
>  	 * init, we need to know the node ids now. This is because
>=20
> -aneesh
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--xYWHQKgD/xzSO8r1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD+INgACgkQbDjKyiDZ
s5LF5xAAhBVQs/7aH3xM9hvXSSjY3Ydb2AlXzwfz/u0MJANo2pW4ACRuN8KHUnJn
t3/uzps59/W7+Osg34x/r7Etv6+w7nZFUblS6M37KcnnH6mjNIMaXh8vZjJPc6VS
6OMhjoERE5yoHO352L9UQJr2Gl43RskOqrPpm4/OntA1pBhM+LKSr8spWyl7ZpPl
Hx/7Gmer/buOk8mI0vcgBxqauy01UY63ouZLKTCBfEuzLyBlT8fHELxDk82dtv5e
lCiGgql9/rxts9uobsfH/NbjLIC/hGXnSQ/U3tOc1w4LAshhbIvj2g6oUScbdPCM
Sb8XVQHmoqJYoE9TSDLLt0oCI3Snn9p00vUhdhe2MsdlzIXz7tvPXiHyT2SLtdHV
TFuNgFy04O9n+misiCh7Ei04KB9Ro2LWw9MztyUKqpGLnyjqMt4FoI8tZVwwEGnH
A78OgU82WfzoEs8JMNXGb8FgFXVMIdS66lD1JRJ5fFzwPn9XxhQNjd/s/SCnLkCq
q2colWTkUIh7wxMGOxs5dqodjKLxQHgbATTkOZRd4rMADVnwu84Do7iCXu/1qv2p
qsTa36E4zgB4QW/lK+fdiVdF0Pa8MGmTACisjFiUDpEefTyNY47j87D4rI1oUA7Z
jD2b89416alDCSpondwSoKf9jBVEcF9c6N8hXkkFiM2E5HKsb44=
=bwKC
-----END PGP SIGNATURE-----

--xYWHQKgD/xzSO8r1--
