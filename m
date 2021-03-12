Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C09338EF7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 14:39:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dxn3L3DP0z3dLy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Mar 2021 00:39:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.48.137; helo=9.mo51.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 1808 seconds by postgrey-1.36 at boromir;
 Sat, 13 Mar 2021 00:38:51 AEDT
Received: from 9.mo51.mail-out.ovh.net (9.mo51.mail-out.ovh.net
 [46.105.48.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dxn2z5fV5z2xxt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Mar 2021 00:38:50 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.191])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 710BB264F1B;
 Fri, 12 Mar 2021 14:03:20 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 12 Mar
 2021 14:03:19 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00698af64ac-d8be-4f4e-8e01-4f76ff4de6e3,
 691A38DB5CB01A665C0D074ECDE31926393917AC) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Fri, 12 Mar 2021 14:03:17 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb@linux.ibm.com>
Subject: Re: [PATCH v2 1/8] powerpc/xive: Use cpu_to_node() instead of
 ibm,chip-id property
Message-ID: <20210312140317.1db4eac9@bahia.lan>
In-Reply-To: <0f27271d-cb4d-986c-95c6-3173b43f70e5@linux.ibm.com>
References: <20210303174857.1760393-1-clg@kaod.org>
 <20210303174857.1760393-2-clg@kaod.org>
 <20210308181359.789c143b@bahia.lan>
 <8dd98e22-1f10-e87b-3fe3-e786bc9a8d71@kaod.org>
 <3180b5c6-e61f-9c5f-3c80-f10e69dc5785@linux.ibm.com>
 <92edbc26-4cb5-6e2f-00ff-43a3dca43759@kaod.org>
 <20210312125527.61bc269c@yekko.fritz.box>
 <4effbb5e-6f08-03bf-cea0-60c986175668@kaod.org>
 <0f27271d-cb4d-986c-95c6-3173b43f70e5@linux.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 3f60a2cd-d1d7-4283-8a9d-50cc8fdcf588
X-Ovh-Tracer-Id: 7392658791295916393
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddvvddggeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevtdekteeijedvheefgfdutddtkeelleejudekjeelvefgffehkeetieefjedvfeenucffohhmrghinheprhgvughhrghtrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 David Gibson <dgibson@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 12 Mar 2021 09:18:39 -0300
Daniel Henrique Barboza <danielhb@linux.ibm.com> wrote:

>=20
>=20
> On 3/12/21 6:53 AM, C=C3=A9dric Le Goater wrote:
> > On 3/12/21 2:55 AM, David Gibson wrote:
> >> On Tue, 9 Mar 2021 18:26:35 +0100
> >> C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >>
> >>> On 3/9/21 6:08 PM, Daniel Henrique Barboza wrote:
> >>>>
> >>>>
> >>>> On 3/9/21 12:33 PM, C=C3=A9dric Le Goater wrote:
> >>>>> On 3/8/21 6:13 PM, Greg Kurz wrote:
> >>>>>> On Wed, 3 Mar 2021 18:48:50 +0100
> >>>>>> C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >>>>>>  =20
> >>>>>>> The 'chip_id' field of the XIVE CPU structure is used to choose a
> >>>>>>> target for a source located on the same chip when possible. This =
field
> >>>>>>> is assigned on the PowerNV platform using the "ibm,chip-id" prope=
rty
> >>>>>>> on pSeries under KVM when NUMA nodes are defined but it is undefi=
ned
> >>>>>>
> >>>>>> This sentence seems to have a syntax problem... like it is missing=
 an
> >>>>>> 'and' before 'on pSeries'.
> >>>>>
> >>>>> ah yes, or simply a comma.
> >>>>>  =20
> >>>>>>> under PowerVM. The XIVE source structure has a similar field
> >>>>>>> 'src_chip' which is only assigned on the PowerNV platform.
> >>>>>>>
> >>>>>>> cpu_to_node() returns a compatible value on all platforms, 0 bein=
g the
> >>>>>>> default node. It will also give us the opportunity to set the aff=
inity
> >>>>>>> of a source on pSeries when we can localize them.
> >>>>>>>  =20
> >>>>>>
> >>>>>> IIUC this relies on the fact that the NUMA node id is =3D=3D to ch=
ip id
> >>>>>> on PowerNV, i.e. xc->chip_id which is passed to OPAL remain stable
> >>>>>> with this change.
> >>>>>
> >>>>> Linux sets the NUMA node in numa_setup_cpu(). On pseries, the hcall
> >>>>> H_HOME_NODE_ASSOCIATIVITY returns the node id if I am correct (Dani=
el
> >>>>> in Cc:)
> >>>   [...]
> >>>>>
> >>>>> On PowerNV, Linux uses "ibm,associativity" property of the CPU to f=
ind
> >>>>> the node id. This value is built from the chip id in OPAL, so the
> >>>>> value returned by cpu_to_node(cpu) and the value of the "ibm,chip-i=
d"
> >>>>> property are unlikely to be different.
> >>>>>
> >>>>> cpu_to_node(cpu) is used in many places to allocate the structures
> >>>>> locally to the owning node. XIVE is not an exception (see below in =
the
> >>>>> same patch), it is better to be consistent and get the same informa=
tion
> >>>>> (node id) using the same routine.
> >>>>>
> >>>>>
> >>>>> In Linux, "ibm,chip-id" is only used in low level PowerNV drivers :
> >>>>> LPC, XSCOM, RNG, VAS, NX. XIVE should be in that list also but skib=
oot
> >>>>> unifies the controllers of the system to only expose one the OS. Th=
is
> >>>>> is problematic and should be changed but it's another topic.
> >>>>>
> >>>>>  =20
> >>>>>> On the other hand, you have the pSeries case under PowerVM that
> >>>>>> doesn't xc->chip_id, which isn't passed to any hcall AFAICT.
> >>>>>
> >>>>> yes "ibm,chip-id" is an OPAL concept unfortunately and it has no me=
aning
> >>>>> under PAPR. xc->chip_id on pseries (PowerVM) will contains an inval=
id
> >>>>> chip id.
> >>>>>
> >>>>> QEMU/KVM exposes "ibm,chip-id" but it's not used. (its value is not
> >>>>> always correct btw)
> >>>>
> >>>>
> >>>> If you have a way to reliably reproduce this, let me know and I'll f=
ix it
> >>>> up in QEMU.
> >>>
> >>> with :
> >>>
> >>>     -smp 4,cores=3D1,maxcpus=3D8 -object memory-backend-ram,id=3Dram-=
node0,size=3D2G -numa node,nodeid=3D0,cpus=3D0-1,cpus=3D4-5,memdev=3Dram-no=
de0 -object memory-backend-ram,id=3Dram-node1,size=3D2G -numa node,nodeid=
=3D1,cpus=3D2-3,cpus=3D6-7,memdev=3Dram-node1
> >>>
> >>> # dmesg | grep numa
> >>> [    0.013106] numa: Node 0 CPUs: 0-1
> >>> [    0.013136] numa: Node 1 CPUs: 2-3
> >>>
> >>> # dtc -I fs /proc/device-tree/cpus/ -f | grep ibm,chip-id
> >>> 		ibm,chip-id =3D <0x01>;
> >>> 		ibm,chip-id =3D <0x02>;
> >>> 		ibm,chip-id =3D <0x00>;
> >>> 		ibm,chip-id =3D <0x03>;
> >>>
> >>> with :
> >>>
> >>>    -smp 4,cores=3D4,maxcpus=3D8,threads=3D1 -object memory-backend-ra=
m,id=3Dram-node0,size=3D2G -numa node,nodeid=3D0,cpus=3D0-1,cpus=3D4-5,memd=
ev=3Dram-node0 -object memory-backend-ram,id=3Dram-node1,size=3D2G -numa no=
de,nodeid=3D1,cpus=3D2-3,cpus=3D6-7,memdev=3Dram-node1
> >>>
> >>> # dmesg | grep numa
> >>> [    0.013106] numa: Node 0 CPUs: 0-1
> >>> [    0.013136] numa: Node 1 CPUs: 2-3
> >>>
> >>> # dtc -I fs /proc/device-tree/cpus/ -f | grep ibm,chip-id
> >>> 		ibm,chip-id =3D <0x00>;
> >>> 		ibm,chip-id =3D <0x00>;
> >>> 		ibm,chip-id =3D <0x00>;
> >>> 		ibm,chip-id =3D <0x00>;
> >>>
> >>> I think we should simply remove "ibm,chip-id" since it's not used and
> >>> not in the PAPR spec.
> >>
> >> As I mentioned to Daniel on our call this morning, oddly it *does*
> >> appear to be used in the RHEL kernel, even though that's 4.18 based.
> >> This patch seems to have caused a minor regression; not in the
> >> identification of NUMA nodes, but in the number of sockets shown be
> >> lscpu, etc.  See https://bugzilla.redhat.com/show_bug.cgi?id=3D1934421
> >> for more information.
> >=20
> > Yes. The property "ibm,chip-id" is wrongly calculated in QEMU. If we
> > remove it, we get with 4.18.0-295.el8.ppc64le or 5.12.0-rc2 :
> >=20
> >     [root@localhost ~]# lscpu
> >     Architecture:        ppc64le
> >     Byte Order:          Little Endian
> >     CPU(s):              128
> >     On-line CPU(s) list: 0-127
> >     Thread(s) per core:  4
> >     Core(s) per socket:  16
> >     Socket(s):           2
> >     NUMA node(s):        2
> >     Model:               2.2 (pvr 004e 1202)
> >     Model name:          POWER9 (architected), altivec supported
> >     Hypervisor vendor:   KVM
> >     Virtualization type: para
> >     L1d cache:           32K
> >     L1i cache:           32K
> >     NUMA node0 CPU(s):   0-63
> >     NUMA node1 CPU(s):   64-127
> >=20
> >     [root@localhost ~]# grep . /sys/devices/system/cpu/*/topology/physi=
cal_package_id
> >     /sys/devices/system/cpu/cpu0/topology/physical_package_id:-1
> >     /sys/devices/system/cpu/cpu100/topology/physical_package_id:-1
> >     /sys/devices/system/cpu/cpu101/topology/physical_package_id:-1
> >     /sys/devices/system/cpu/cpu102/topology/physical_package_id:-1
> >     /sys/devices/system/cpu/cpu103/topology/physical_package_id:-1
> >     ....
> >=20
> > "ibm,chip-id" is still being used on some occasion on pSeries machines.
> > This is wrong :/ The problem is :
> >=20
> >    #define topology_physical_package_id(cpu)      (cpu_to_chip_id(cpu))
> >=20
> > We should be using cpu_to_node().
>=20
>=20
> IIUC the "real fix" then is this change you mentioned above, together with
> this xive patch as well, to stop using ibm,chip-id for good in the pserie
>   kernel. With these changes QEMU can remove 'ibm,chip-id' from the pseri=
es
> machine without impact. Is this correct?
>=20
> If that's the case, then I believe it's ok to go forward with the QEMU si=
de
> change (just for 6.0.0 and newer machines). Or should I wait for the kern=
el
> changes to be merged upstream first?
>=20

I'd say the latter since this is a breaking change and people will want
to identify the upstream commits they have to backport to their kernel
in order to support the disappearance of "ibm,chip-id".

Cheers,

--
Greg

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
> >>
> >> Since the value was used by some PAPR kernels - even if they shouldn't
> >> have - I think we should only remove this for newer machine types.  We
> >> also need to check what we're not supplying that the guest kernel is
> >> showing a different number of sockets than specified on the qemu
> >> command line.
> >>
> >>>
> >>> Thanks,
> >>>
> >>> C.
> >>>
> >>>  =20
> >>>
> >>>   [...]
> >>>   [...]
> >>>   [...]
> >>>   [...]
> >>>   [...]
> >>>   [...]
> >>>   [...]
> >>>   [...]
> >>>   [...]
> >>>
> >>
> >>
> >=20

