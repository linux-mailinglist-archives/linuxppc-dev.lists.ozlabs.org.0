Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF6F15A90A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 13:23:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Hf1x0qhdzDqRC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 23:23:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.34.113; helo=3.mo7.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 2397 seconds by postgrey-1.36 at bilbo;
 Wed, 12 Feb 2020 23:21:23 AEDT
Received: from 3.mo7.mail-out.ovh.net (3.mo7.mail-out.ovh.net [46.105.34.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HdzR1sFWzDqN5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 23:21:19 +1100 (AEDT)
Received: from player697.ha.ovh.net (unknown [10.108.57.49])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 457E0152224
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 12:05:18 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id D70AAF4AA807;
 Wed, 12 Feb 2020 11:05:15 +0000 (UTC)
Date: Wed, 12 Feb 2020 12:05:08 +0100
From: Greg Kurz <groug@kaod.org>
To: dftxbs3e <dftxbs3e@free.fr>
Subject: Re: QEMU/KVM snapshot restore bug
Message-ID: <20200212120508.18be4f0c@bahia.lan>
In-Reply-To: <7544eb90-71a6-3709-c530-9c83beb943a7@free.fr>
References: <7544eb90-71a6-3709-c530-9c83beb943a7@free.fr>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T9huF3rT6uFj22Bw1jih7qj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Ovh-Tracer-Id: 15847604140800645579
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrieehgddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtsehgtderreertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieeljedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhg
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
Cc: linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/T9huF3rT6uFj22Bw1jih7qj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 11 Feb 2020 04:57:52 +0100
dftxbs3e <dftxbs3e@free.fr> wrote:

> Hello,
>=20
> I took a snapshot of a ppc64 (big endian) VM from a ppc64 (little endian)=
 host using `virsh snapshot-create-as --domain <name> --name <name>`
>=20

A big endian guest doing XIVE ?!? I'm pretty sure we didn't do much testing=
, if
any, on such a setup... What distro is used in the VM ?

> Then I restarted my system and tried restoring the snapshot:
>=20
> # virsh snapshot-revert --domain <name> --snapshotname <name>
> error: internal error: process exited while connecting to monitor: 2020-0=
2-11T03:18:08.110582Z qemu-system-ppc64: KVM_SET_DEVICE_ATTR failed: Group =
3 attr 0x0000000000001309: Device or resource busy
> 2020-02-11T03:18:08.110605Z qemu-system-ppc64: error while loading state =
for instance 0x0 of device 'spapr'
> 2020-02-11T03:18:08.112843Z qemu-system-ppc64: Error -1 while loading VM =
state
>=20

This indicates that QEMU failed to configure the source targeting
for the HW interrupt 0x1309, which is an MSI interrupt used by
a PCI device plugged in the default PHB. Especially, -EBUSY means

    -EBUSY:  No CPU available to serve interrupt

> And dmesg shows each time the restore command is executed:
>=20
> [  180.176606] WARNING: CPU: 16 PID: 5528 at arch/powerpc/kvm/book3s_xive=
.c:345 xive_try_pick_queue+0x40/0xb8 [kvm]

This warning means that we have vCPU without a configured event queue.

Since kvmppc_xive_select_target() is trying all vCPUs before bailing out
with -EBUSY, you might be seeing several WARNINGs (1 per vCPU) in dmesg,
correct ?

Anyway, this looks wrong since QEMU is supposed to have already configured
the event queues at this point... Not sure what's happening here...

> [  180.176608] Modules linked in: vhost_net vhost tap kvm_hv kvm xt_CHECK=
SUM xt_MASQUERADE nf_nat_tftp nf_conntrack_tftp tun bridge 8021q garp mrp s=
tp llc rfkill nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t_REJ=
ECT nf_reject_ipv6 ip6t_rpfilter ipt_REJECT nf_reject_ipv4 xt_conntrack ebt=
able_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip6table_=
security iptable_nat nf_nat iptable_mangle iptable_raw iptable_security nf_=
conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nfnetlink ebtable_filter ebt=
ables ip6table_filter ip6_tables iptable_filter sunrpc raid1 at24 regmap_i2=
c snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg joydev snd_hda_codec sn=
d_hda_core ofpart snd_hwdep crct10dif_vpmsum snd_seq ipmi_powernv powernv_f=
lash ipmi_devintf snd_seq_device mtd ipmi_msghandler rtc_opal snd_pcm opal_=
prd i2c_opal snd_timer snd soundcore lz4 lz4_compress zram ip_tables xfs li=
bcrc32c dm_crypt amdgpu ast drm_vram_helper mfd_core i2c_algo_bit gpu_sched=
 drm_kms_helper mpt3sas
> [  180.176652]  syscopyarea sysfillrect sysimgblt fb_sys_fops ttm drm vmx=
_crypto tg3 crc32c_vpmsum nvme raid_class scsi_transport_sas nvme_core drm_=
panel_orientation_quirks i2c_core fuse
> [  180.176663] CPU: 16 PID: 5528 Comm: qemu-system-ppc Not tainted 5.4.17=
-200.fc31.ppc64le #1
> [  180.176665] NIP:  c00800000a883c80 LR: c00800000a886db8 CTR: c00800000=
a88a9e0
> [  180.176667] REGS: c000000767a17890 TRAP: 0700   Not tainted  (5.4.17-2=
00.fc31.ppc64le)
> [  180.176668] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 4822=
4248  XER: 20040000
> [  180.176673] CFAR: c00800000a886db4 IRQMASK: 0=20
>                GPR00: c00800000a886db8 c000000767a17b20 c00800000a8aed00 =
c0002005468a4480=20
>                GPR04: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000001=20
>                GPR08: c0002007142b2400 c0002007142b2400 0000000000000000 =
c00800000a8910f0=20
>                GPR12: c00800000a88a488 c0000007fffed000 0000000000000000 =
0000000000000000=20
>                GPR16: 0000000149524180 00007ffff39bda78 00007ffff39bda30 =
000000000000025c=20
>                GPR20: 0000000000000000 0000000000000003 c0002006f13a0000 =
0000000000000000=20
>                GPR24: 0000000000001359 0000000000000000 c0000002f8c96c38 =
c0000002f8c80000=20
>                GPR28: 0000000000000000 c0002006f13a0000 c0002006f13a4038 =
c000000767a17be4=20
> [  180.176688] NIP [c00800000a883c80] xive_try_pick_queue+0x40/0xb8 [kvm]
> [  180.176693] LR [c00800000a886db8] kvmppc_xive_select_target+0x100/0x21=
0 [kvm]
> [  180.176694] Call Trace:
> [  180.176696] [c000000767a17b20] [c000000767a17b70] 0xc000000767a17b70 (=
unreliable)
> [  180.176701] [c000000767a17b70] [c00800000a88b420] kvmppc_xive_native_s=
et_attr+0xf98/0x1760 [kvm]
> [  180.176705] [c000000767a17cc0] [c00800000a86392c] kvm_device_ioctl+0xf=
4/0x180 [kvm]
> [  180.176710] [c000000767a17d10] [c0000000005380b0] do_vfs_ioctl+0xaa0/0=
xd90
> [  180.176712] [c000000767a17dd0] [c000000000538464] sys_ioctl+0xc4/0x110
> [  180.176716] [c000000767a17e20] [c00000000000b9d0] system_call+0x5c/0x68
> [  180.176717] Instruction dump:
> [  180.176719] 794ad182 0b0a0000 2c290000 41820080 89490010 2c0a0000 4182=
0074 78883664=20
> [  180.176723] 7d094214 e9480070 7d470074 78e7d182 <0b070000> 2c2a0000 41=
820054 81480078=20
> [  180.176727] ---[ end trace 056a6dd275e20684 ]---
>=20
> Let me know if I can provide more information

Yeah, QEMU command line, QEMU version, guest kernel version can help. Also,
what kind of workload is running inside the guest ? Is this easy to reprodu=
ce ?

Cheers,

--
Greg

>=20
> Thanks
>=20


--Sig_/T9huF3rT6uFj22Bw1jih7qj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAl5D2+QACgkQcdTV5YIv
c9YQeg/+J+X1kELtocJSsC2+uK3JFvCi5T7sSPw5MBKQ7H0m2oqvlANM+ZsinNLU
1Uqcq4GJMCNkgxnl4T9y6GlnrvrQlM1wWGhAwV8AEPRzTIcgvuwtMhg/0YJGtNfj
CX6MGb+Ggy/EQfzDdYi4UNB/KTnyyUhoiXsLTKnyctBNiBiKnQUmgEc83joD7DS9
PeTrQIunQq+bFGYhuqcRIQ/D9+0Ml+13/GzNpFzieG4lwd5Xao9sSojQqy6MrtDi
tf0KtJsas8AcExYYse2VsTiJ7CqVSjUtmA6swXOXHcDL6uhObkCmZtiaqNVz8dXa
kLzJynLOzGlhwUI/MJ17t2dc27PRBZ60/SbJicooBzk8INMptoUSbP4t/SbeaFC7
uqs1Ky86n4w5Mh2ZhdMxJ6VG8VmB5De25WPVNH19CfqH1wCHFZudFRQIf+V0eoL6
YMvZa+lIux+4X7s4/BGJ6O9QvkNfWrBkd04nVSZZZVopejGHuQTNuS2Kb/1Ym+Kf
wiNvZTXQIvFLE3AhFMOEPM7XDbKxoTV+pctv2fWEM679RjzIG5fMIYOCiLy7842O
zxES4xYkAQQT2K/9MCaSTHQ9i46Z9Ypxh2hlcCcjj+n4OtvkUuPCqKYHBddjBEZ6
7jouqVlFAl5vOS7fvSTRSSm+wxZGtWERqlyt+HwgveoL0/qkwZo=
=Jgum
-----END PGP SIGNATURE-----

--Sig_/T9huF3rT6uFj22Bw1jih7qj--
