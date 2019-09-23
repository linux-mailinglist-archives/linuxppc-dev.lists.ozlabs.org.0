Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB2DBAD63
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 07:04:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cC0d1802zDqP3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Sep 2019 15:04:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cBwy6K09zDqLR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 15:01:06 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8N4uqML041630
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 01:01:04 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v6q40gm83-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2019 01:01:03 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Mon, 23 Sep 2019 06:01:02 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 23 Sep 2019 06:01:01 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8N510a424182876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Sep 2019 05:01:00 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B4444C046;
 Mon, 23 Sep 2019 05:01:00 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CD7E4C040;
 Mon, 23 Sep 2019 05:00:59 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 Sep 2019 05:00:59 +0000 (GMT)
Received: from osmium (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8DB1BA01A4;
 Mon, 23 Sep 2019 15:00:56 +1000 (AEST)
Date: Mon, 23 Sep 2019 15:00:50 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH v5 05/12] powerpc/eeh: EEH for pSeries hot plug
References: <cover.1565930772.git.sbobroff@linux.ibm.com>
 <72ae8ae9c54097158894a52de23690448de38ea9.1565930772.git.sbobroff@linux.ibm.com>
 <871rwcqbd3.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
In-Reply-To: <871rwcqbd3.fsf@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19092305-0016-0000-0000-000002AF6AB4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092305-0017-0000-0000-000033102519
Message-Id: <20190923050049.GA24028@osmium>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-22_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909230046
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org, oohall@gmail.com,
 tyreld@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2019 at 03:28:40PM -0500, Nathan Lynch wrote:
> Hello Sam,
>=20
> Sam Bobroff <sbobroff@linux.ibm.com> writes:
> > On PowerNV and pSeries, devices currently acquire EEH support from
> > several different places: Boot-time devices from eeh_probe_devices()
> > and eeh_addr_cache_build(), Virtual Function devices from the pcibios
> > bus add device hooks and hot plugged devices from pci_hp_add_devices()
> > (with other platforms using other methods as well).  Unfortunately,
> > pSeries machines currently discover hot plugged devices using
> > pci_rescan_bus(), not pci_hp_add_devices(), and so those devices do
> > not receive EEH support.
> >
> > Rather than adding another case for pci_rescan_bus(), this change
> > widens the scope of the pcibios bus add device hooks so that they can
> > handle all devices. As a side effect this also supports devices
> > discovered after manually rescanning via /sys/bus/pci/rescan.
> >
> > Note that on PowerNV, this change allows the EEH subsystem to become
> > enabled after boot as long as it has not been forced off, which was
> > not previously possible (it was already possible on pSeries).
>=20
> With this change, I get a crash (use after free by the looks of it) when
> I remove and then add a pci device in qemu:
>=20
> $ qemu-system-ppc64 -M pseries -append 'debug console=3Dhvc0' \
>   -nographic -vga none -m 1G,slots=3D32,maxmem=3D1024G -smp 2 \
>   -kernel vmlinux -initrd ~/b/br/ppc64le-initramfs/images/rootfs.cpio \
>   -nic model=3De1000
>=20
> ...
>=20
> # echo 1 > /sys/devices/pci0000:00/0000:00:00.0/remove ; \
>   echo 1 > /sys/devices/pci0000:00/pci_bus/0000:00/rescan
>=20
> pci 0000:00:00.0: Removing from iommu group 0
> pci 0000:00:00.0: [8086:100e] type 00 class 0x020000
> pci 0000:00:00.0: reg 0x10: [mem 0x200080000000-0x20008001ffff]
> pci 0000:00:00.0: reg 0x14: [io  0x10040-0x1007f]
> pci 0000:00:00.0: reg 0x30: [mem 0x200080040000-0x20008007ffff pref]
> pci 0000:00:00.0: Adding to iommu group 0
> pci 0000:00:00.0: BAR 6: assigned [mem 0x200080000000-0x20008003ffff pref]
> pci 0000:00:00.0: BAR 0: assigned [mem 0x200080040000-0x20008005ffff]
> pci 0000:00:00.0: BAR 1: assigned [io  0x10000-0x1003f]
> e1000 0000:00:00.0 eth0: (PCI:33MHz:32-bit) 52:54:00:12:34:56
> e1000 0000:00:00.0 eth0: Intel(R) PRO/1000 Network Connection
> pci 0000:00:00.0: Removing from iommu group 0
> pci 0000:00:00.0: [8086:100e] type 00 class 0x020000
> pci 0000:00:00.0: reg 0x10: [mem 0x200080040000-0x20008005ffff]
> pci 0000:00:00.0: reg 0x14: [io  0x10000-0x1003f]
> pci 0000:00:00.0: reg 0x30: [mem 0x200080040000-0x20008007ffff pref]
> pci 0000:00:00.0: BAR 6: assigned [mem 0x200080000000-0x20008003ffff pref]
> pci 0000:00:00.0: BAR 0: assigned [mem 0x200080040000-0x20008005ffff]
> pci 0000:00:00.0: BAR 1: assigned [io  0x10000-0x1003f]
> BUG: Unable to handle kernel data access at 0x6b6b6b6b6b6b6bfb
> Faulting instruction address: 0xc000000000597270
> Oops: Kernel access of bad area, sig: 11 [#1]
> LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSeries
> Modules linked in:
> CPU: 0 PID: 2464 Comm: pci-probe-vs-cp Not tainted 5.3.0-rc2-00092-gf381d=
5711f09 #76
> NIP:  c000000000597270 LR: c000000000599470 CTR: c0000000002030b0
> REGS: c00000003ee4f650 TRAP: 0380   Not tainted  (5.3.0-rc2-00092-gf381d5=
711f09)
> MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24002442  XER: 00000000
> CFAR: c00000000059946c IRQMASK: 0=20
> GPR00: c000000000599470 c00000003ee4f8e0 c000000003317a00 6b6b6b6b6b6b6b6=
b=20
> GPR04: c000000001d0fa38 0000000000000000 0000000000000000 221a64979a66f87=
0=20
> GPR08: c00000000347b398 0000000000000000 c00000000336e070 fffffffffffffff=
f=20
> GPR12: 0000000000002000 c000000004060000 0000000000000000 000000000000000=
0=20
> GPR16: 00000000100a78d8 00007fffe9fdff96 00000000100a7898 000000000000000=
0=20
> GPR20: 0000000000000000 00000000100e0ff0 0000000000000000 00000000100e0fe=
8=20
> GPR24: 0000000000000000 000001002ae50260 c000000001d0fa38 6b6b6b6b6b6b6b6=
b=20
> GPR28: fffffffffffffff2 c000000001d0fa38 0000000000000000 c000000003118c1=
8=20
> NIP [c000000000597270] kernfs_find_ns+0x50/0x3d0
> LR [c000000000599470] kernfs_remove_by_name_ns+0x60/0xe0
> Call Trace:
> [c00000003ee4f8e0] [c00000000020950c] lockdep_hardirqs_on+0x10c/0x210 (un=
reliable)
> [c00000003ee4f970] [c000000000599470] kernfs_remove_by_name_ns+0x60/0xe0
> [c00000003ee4fa00] [c00000000059ca08] sysfs_remove_file_ns+0x28/0x40
> [c00000003ee4fa20] [c000000000cbd70c] device_remove_file+0x2c/0x40
> [c00000003ee4fa40] [c000000000051480] eeh_sysfs_remove_device+0x50/0xf0
> [c00000003ee4fa80] [c00000000004a594] eeh_add_device_late.part.7+0x84/0x2=
20
> [c00000003ee4fb00] [c0000000000e94f0] pseries_pcibios_bus_add_device+0x60=
/0xb0
> [c00000003ee4fb70] [c00000000006fc40] pcibios_bus_add_device+0x40/0x60
> [c00000003ee4fb90] [c000000000bc5220] pci_bus_add_device+0x30/0x100
> [c00000003ee4fc00] [c000000000bc5344] pci_bus_add_devices+0x54/0xb0
> [c00000003ee4fc40] [c000000000bca058] pci_rescan_bus+0x48/0x70
> [c00000003ee4fc70] [c000000000bd9adc] dev_bus_rescan_store+0xcc/0x100
> [c00000003ee4fcb0] [c000000000cbc9d8] dev_attr_store+0x38/0x60
> [c00000003ee4fcd0] [c00000000059c460] sysfs_kf_write+0x70/0xb0
> [c00000003ee4fd10] [c00000000059aa98] kernfs_fop_write+0xf8/0x280
> [c00000003ee4fd60] [c0000000004b3e5c] __vfs_write+0x3c/0x70
> [c00000003ee4fd80] [c0000000004b81f0] vfs_write+0xd0/0x220
> [c00000003ee4fdd0] [c0000000004b85ac] ksys_write+0x7c/0x140
> [c00000003ee4fe20] [c00000000000bc6c] system_call+0x5c/0x70
>=20
> FWIW during boot the EEH core reports:
>=20
>   EEH: No capable adapters found: recovery disabled.
>=20
> > diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> > index ca8b0c58a6a7..87edac6f2fd9 100644
> > --- a/arch/powerpc/kernel/eeh.c
> > +++ b/arch/powerpc/kernel/eeh.c
> > @@ -1272,7 +1272,7 @@ void eeh_add_device_late(struct pci_dev *dev)
> >  	struct pci_dn *pdn;
> >  	struct eeh_dev *edev;
> > =20
> > -	if (!dev || !eeh_enabled())
> > +	if (!dev)
> >  		return;
> > =20
> >  	pr_debug("EEH: Adding device %s\n", pci_name(dev));
>=20
> Reverting this hunk works around (fixes?) it.

Hi Nathan,

Thanks, this does look like a bug to me. I couldn't replicate your crash
(even with CONFIG_SLUB_DEBUG_ON) but I think I do see a bug there.

Does the below patch also fix it for you?

Cheers,
Sam.

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 0a91dee51245..f8aa65cb2931 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1207,10 +1207,11 @@ void eeh_add_device_late(struct pci_dev *dev)
        if (eeh_has_flag(EEH_PROBE_MODE_DEV))
                eeh_ops->probe(pdn, NULL);

-       edev->pdev =3D dev;
-       dev->dev.archdata.edev =3D edev;
-
-       eeh_addr_cache_insert_dev(dev);
+       if (eeh_enabled()) {
+               edev->pdev =3D dev;
+               dev->dev.archdata.edev =3D edev;
+               eeh_addr_cache_insert_dev(dev);
+       }
 }

 /**

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl2IURYACgkQMX8w6AQl
/iJINQf+OzLBOJvyxA8Mqo1w/dF2OMeIsRIkyHZs5qgK/zokaH7DCPqd+r0SgJX8
JjyaG3fPOK0vsHoT7Tu3D8ZBjNJXB9E/6Uel5q25/w+KArh35FAwlMtaZhuSyTPR
axdTAZQ9TyxO+4y4Df7+HSRjrGPecVZjnLbD01bllEchct5G7vV9CfSgBRVLpeXc
5hVN7FIV42gQFWQQAqaY/rs5g8uM4GrP/dmh6rZ24K+WLDZMev35XoWaJ+Yw5yys
Xl5rz4BiPnOFLcF6vmDRHJcUMpWgbzK67ISqLw3Lf+y8qTw2mD+lb9NeJFDpv01C
dzJ9KixowJNR0IwnAFMwbl+gGWxzwQ==
=ccvl
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--

