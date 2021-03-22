Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 292FD3437CC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 05:12:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3h0T14nPz309s
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 15:12:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=ds0qXO/U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=ds0qXO/U; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3h004ccpz2xfy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 15:11:44 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F3gzy5RYZz9sWP; Mon, 22 Mar 2021 15:11:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616386302;
 bh=TsNgmPc5HgYKht2yfqHiEWtT+HMFouFqzPy8FQOXUto=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ds0qXO/UslCThqaCJ+kgTKQvLbdPRSDLc2TIURV0AqSCl1FAqZkXiDMGdA7Mr/xbK
 WcrF5eO1BNDpSWpmqCEs0xwThjo3VHJaZo8iwlQpJCdXfaYux9M/I0cmDtlA3AXiM1
 AnYHQ3ksvcfmE1p+4LjhjrPWnsEH9i9WgKuRy/u4=
Date: Mon, 22 Mar 2021 14:16:13 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: Advice needed on SMP regression after cpu_core_mask change
Message-ID: <YFgL/TT6onMKA3c/@yekko.fritz.box>
References: <daa5d05f-dbd0-05ad-7395-5d5a3d364fc6@gmail.com>
 <4569097d-ce89-5a13-33a9-2a4ca10be7bd@kaod.org>
 <04bf6d12-a806-d417-3d95-b6d315c44b58@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SXRDY0Yte4J0sW1u"
Content-Disposition: inline
In-Reply-To: <04bf6d12-a806-d417-3d95-b6d315c44b58@gmail.com>
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
Cc: aneesh.kumar@in.ibm.com, Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Greg Kurz <groug@kaod.org>, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--SXRDY0Yte4J0sW1u
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 01:05:21PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 3/17/21 12:30 PM, C=E9dric Le Goater wrote:
> > On 3/17/21 2:00 PM, Daniel Henrique Barboza wrote:
> > > Hello,
> > >=20
> > > Patch 4bce545903fa ("powerpc/topology: Update topology_core_cpumask")=
 introduced
> > > a regression in both upstream and RHEL downstream kernels [1]. The as=
sumption made
> > > in the commit:
> > >=20
> > > "Further analysis shows that cpu_core_mask and cpu_cpu_mask for any C=
PU would be
> > > equal on Power"
> > >=20
> > > Doesn't seem to be true. After this commit, QEMU is now unable to set=
 single NUMA
> > > node SMP topologies such as:
> > >=20
> > > -smp 8,maxcpus=3D8,cores=3D2,threads=3D2,sockets=3D2
> > >=20
> > > lscpu will give the following output in this case:
> > >=20
> > > # lscpu
> > > Architecture:=A0=A0=A0=A0=A0=A0=A0 ppc64le
> > > Byte Order:=A0=A0=A0=A0=A0=A0=A0=A0=A0 Little Endian
> > > CPU(s):=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 8
> > > On-line CPU(s) list: 0-7
> > > Thread(s) per core:=A0 2
> > > Core(s) per socket:=A0 4
> > > Socket(s):=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1
> > > NUMA node(s):=A0=A0=A0=A0=A0=A0=A0 1
> > > Model:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2.2 (pvr 004e 1202)
> > > Model name:=A0=A0=A0=A0=A0=A0=A0=A0=A0 POWER9 (architected), altivec =
supported
> > > Hypervisor vendor:=A0=A0 KVM
> > > Virtualization type: para
> > > L1d cache:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 32K
> > > L1i cache:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 32K
> > > NUMA node0 CPU(s):=A0=A0 0-7
> > >=20
> > >=20
> > > This is happening because the macro cpu_cpu_mask(cpu) expands to
> > > cpumask_of_node(cpu_to_node(cpu)), which in turn expands to node_to_c=
pumask_map[node].
> > > node_to_cpumask_map is a NUMA array that maps CPUs to NUMA nodes (Ane=
esh is on CC to
> > > correct me if I'm wrong). We're now associating sockets to NUMA nodes=
 directly.
> > >=20
> > > If I add a second NUMA node then I can get the intended smp topology:
> > >=20
> > > -smp 8,maxcpus=3D8,cores=3D2,threads=3D2,sockets=3D2
> > > -numa node,memdev=3Dmem0,cpus=3D0-3,nodeid=3D0 \
> > > -numa node,memdev=3Dmem1,cpus=3D4-7,nodeid=3D1 \
> > >=20
> > > # lscpu
> > > Architecture:=A0=A0=A0=A0=A0=A0=A0 ppc64le
> > > Byte Order:=A0=A0=A0=A0=A0=A0=A0=A0=A0 Little Endian
> > > CPU(s):=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 8
> > > On-line CPU(s) list: 0-7
> > > Thread(s) per core:=A0 2
> > > Core(s) per socket:=A0 2
> > > Socket(s):=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2
> > > NUMA node(s):=A0=A0=A0=A0=A0=A0=A0 2
> > > Model:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2.2 (pvr 004e 1202)
> > > Model name:=A0=A0=A0=A0=A0=A0=A0=A0=A0 POWER9 (architected), altivec =
supported
> > > Hypervisor vendor:=A0=A0 KVM
> > > Virtualization type: para
> > > L1d cache:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 32K
> > > L1i cache:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 32K
> > > NUMA node0 CPU(s):=A0=A0 0-3
> > > NUMA node1 CPU(s):=A0=A0 4-7
> > >=20
> > >=20
> > > However, if I try a single socket with multiple NUMA nodes topology, =
which is the case
> > > of Power10, e.g.:
> > >=20
> > >=20
> > > -smp 8,maxcpus=3D8,cores=3D4,threads=3D2,sockets=3D1
> > > -numa node,memdev=3Dmem0,cpus=3D0-3,nodeid=3D0 \
> > > -numa node,memdev=3Dmem1,cpus=3D4-7,nodeid=3D1 \
> > >=20
> > >=20
> > > This is the result:
> > >=20
> > > # lscpu
> > > Architecture:=A0=A0=A0=A0=A0=A0=A0 ppc64le
> > > Byte Order:=A0=A0=A0=A0=A0=A0=A0=A0=A0 Little Endian
> > > CPU(s):=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 8
> > > On-line CPU(s) list: 0-7
> > > Thread(s) per core:=A0 2
> > > Core(s) per socket:=A0 2
> > > Socket(s):=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2
> > > NUMA node(s):=A0=A0=A0=A0=A0=A0=A0 2
> > > Model:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2.2 (pvr 004e 1202)
> > > Model name:=A0=A0=A0=A0=A0=A0=A0=A0=A0 POWER9 (architected), altivec =
supported
> > > Hypervisor vendor:=A0=A0 KVM
> > > Virtualization type: para
> > > L1d cache:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 32K
> > > L1i cache:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 32K
> > > NUMA node0 CPU(s):=A0=A0 0-3
> > > NUMA node1 CPU(s):=A0=A0 4-7
> > >=20
> > >=20
> > > This confirms my suspicions that, at this moment, we're making socket=
s =3D=3D NUMA nodes.
> >=20
> > Yes. I don't think we can do better on PAPR and the above examples
> > seem to confirm that the "sockets" definition is simply ignored.
> > > Cedric, the reason I'm CCing you is because this is related to ibm,ch=
ip-id. The commit
> > > after the one that caused the regression, 4ca234a9cbd7c3a65 ("powerpc=
/smp: Stop updating
> > > cpu_core_mask"), is erasing the code that calculated cpu_core_mask. c=
pu_core_mask, despite
> > > its shortcomings that caused its removal, was giving a precise SMP to=
pology. And it was
> > > using physical_package_id/'ibm,chip-id' for that.
> >=20
> > ibm,chip-id is a no-no on pSeries. I guess this is inherent to PAPR whi=
ch
> > is hiding a lot of the underlying HW and topology. May be we are trying
> > to reconcile two orthogonal views of machine virtualization ...
> >=20
> > > Checking in QEMU I can say that the ibm,chip-id calculation is the on=
ly place in the code
> > > that cares about cores per socket information. The kernel is now igno=
ring that, starting
> > > on 4bce545903fa, and now QEMU is unable to provide this info to the g=
uest.
> > >=20
> > > If we're not going to use ibm,chip-id any longer, which seems sensibl=
e given that PAPR does
> > > not declare it, we need another way of letting the guest know how muc=
h cores per socket
> > > we want.
> > The RTAS call "ibm,get-system-parameter" with token "Processor Module
> > Information" returns that kind of information :
> >=20
> >    2 byte binary number (N) of module types followed by N module specif=
iers of the form:
> >    2 byte binary number (M) of sockets of this module type
> >    2 byte binary number (L) of chips per this module type
> >    2 byte binary number (K) of cores per chip in this module type.
> >=20
> > See the values in these sysfs files :
> >=20
> >    cat /sys/devices/hv_24x7/interface/{sockets,chipspersocket,coresperc=
hip}
> >=20
> > But I am afraid these are host level information and not guest/LPAR.
>=20
>=20
> I believe there might be some sort of reasoning behind not having this on
> PAPR, but I'll say in advance that the virtual machine should act as the
> real hardware, as close as possible. This is the kind of hcall that could
> be used in this situation.

In the case of POWER, that's pretty much a lost battle.  The
virtualization features of the CPU don't really permit full hardware
virtualization - it has to be a paravirtualized environment.  Once
that's the case, the value of keeping secondary things the same
between the bare metal and paravirt environments isn't that compelling
any more.

> > I didn't find any LPAR level properties or hcalls in the PAPR document.
> > They need to be specified.
> >=20
> > or
> >=20
> > We can add extra properties like ibm,chip-id but making sure it's only
> > used under the KVM hypervisor. My understanding is that's something we
> > are trying to avoid.
>=20
> We can change PAPR to add ibm,chip-id. Problem is that ibm,chip-id today,=
 with
> the current kernel codebase, does not fix the issue because the code is
> ignoring it hehehe
>=20
>=20
> If we're going to change PAPR -  and I believe we should, there's a clear
> lack of proper support for SMP topologies - we're better make sure that w=
hatever
> attribute/hcall we add there fixes it in a robust way for the long term.
>=20
>=20
> Thanks,
>=20
>=20
> DHB
>=20
>=20
> >=20
> > C.
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SXRDY0Yte4J0sW1u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBYC/oACgkQbDjKyiDZ
s5JphA//Wr8JSoOpW1Q3Cy0QXPHMCC97YmEoB2+dUlRr3kB662eg5gOJhu7Z/axu
S2AiMZ0MUy4M5JGkLZE1OM6hXYto3e5k7TaRJ9xp5bEPLs/r6fRR96truRn9eR/0
U3vtW/85RS6naYT6tLM4UQn8byQ1hzEjbipr5L7fr9VQ9uMk6DPCQe6BudwtQDo8
VAQ8RcsNAkGHVB6BUYBf8+8BcCPBarcTPCcJ0rvJV+5YgJEp5UDjMS1RVwasYezz
Ww05JrEb4hzSJ2psQG/D2ON/VKoESjDO7jUuEjyCbDIxmptKu+DqO4k55MMUhoMB
n/q9enPESRTvEPKyPiZW6s9UptSVJNWIVnTjXwPU8lQH4MAScADHrKk22XwRQZRa
u+wbUE7S2K2u5KDTwJAYcfkk2zvp5q7EGT57giX1opbF99iwICdjq246nG2j7UfF
M8r2N5KzCSqBKUFIN6NTOXac6EU0cAlxFV75dPDmeWzfU2/ci594iL5WTl32Uxlx
XMkVm0oAtBrWEwsvmCTsbdAl7dQwqPK6Le7um4sZAm06EYq2xDyr8NK8e2WQ2t5I
i1qydFwC83Ya9zFz4yZjQJ0ujaWZYVS3rWtUzBgAFhTTgO6J36oL7ylcu5NS2MmP
yPn6PsgaopGqsHGDtJ5YW9L4LM615iriYmIa9jjh7KjCJnZTFp0=
=ir5e
-----END PGP SIGNATURE-----

--SXRDY0Yte4J0sW1u--
