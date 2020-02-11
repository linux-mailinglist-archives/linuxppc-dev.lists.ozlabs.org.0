Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 638D115891F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 05:14:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GqDW161NzDqC3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 15:14:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=free.fr
 (client-ip=2a01:e0c:1:1599::12; helo=smtp3-g21.free.fr;
 envelope-from=dftxbs3e@free.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=free.fr
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GpsB2XkSzDqGW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 14:57:58 +1100 (AEDT)
Received: from [IPv6:2a01:e0a:2a2:1590:3130:d4af:7a6d:562c] (unknown
 [IPv6:2a01:e0a:2a2:1590:3130:d4af:7a6d:562c])
 by smtp3-g21.free.fr (Postfix) with ESMTP id E31EB13F846
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 04:57:52 +0100 (CET)
To: linuxppc-dev@lists.ozlabs.org
From: dftxbs3e <dftxbs3e@free.fr>
Autocrypt: addr=dftxbs3e@free.fr; keydata=
 mDMEW0o6qRYJKwYBBAHaRw8BAQdAbzmHTymig5H3K1qe5lc6O1Xfij3iBbOBd6I3KJyEZSO0
 G2RmdHhiczNlIDxkZnR4YnMzZUBmcmVlLmZyPoiWBBMWCAA+FiEEKM08rOoS3GtxJLfLtx4S
 8Z+hqHsFAltKOqkCGwMFCQlmAYAFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQtx4S8Z+h
 qHvjGAD+JgSjdZXX2K4hhsT9I2fbXbUfXm/QdIrZuYPsyv2PoP0A/RP5UIDWs5nhVq43AiF0
 TAm8nDyGol5naZ29BP85QAEKuDgEW0o6qRIKKwYBBAGXVQEFAQEHQB6eBz8MftqVte4x2lyG
 so13JoTSbSZ3iGlX6brVhkw+AwEIB4h+BBgWCAAmFiEEKM08rOoS3GtxJLfLtx4S8Z+hqHsF
 AltKOqkCGwwFCQlmAYAACgkQtx4S8Z+hqHuyPQD9FS4KPlZWunp51NWYGBAkqLM0pnhfGsNm
 gaW5YDQmWmgBALmWjkK7/SmreApokoV3TDKs4ACAKm1fEQuddUvKYogG
Subject: QEMU/KVM snapshot restore bug
Message-ID: <7544eb90-71a6-3709-c530-9c83beb943a7@free.fr>
Date: Tue, 11 Feb 2020 04:57:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="z9EEU70xtk5sGfdhyN5KFJiDM2cVRbTcE"
X-Mailman-Approved-At: Tue, 11 Feb 2020 15:13:01 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--z9EEU70xtk5sGfdhyN5KFJiDM2cVRbTcE
Content-Type: multipart/mixed; boundary="6TmxDB2JUcAy1tt3mCRasuGFEUMDqivGw";
 protected-headers="v1"
From: dftxbs3e <dftxbs3e@free.fr>
To: linuxppc-dev@lists.ozlabs.org
Message-ID: <7544eb90-71a6-3709-c530-9c83beb943a7@free.fr>
Subject: QEMU/KVM snapshot restore bug

--6TmxDB2JUcAy1tt3mCRasuGFEUMDqivGw
Content-Type: multipart/alternative;
 boundary="------------2952CCD2A75C0BEA4D61AAB8"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2952CCD2A75C0BEA4D61AAB8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

I took a snapshot of a ppc64 (big endian) VM from a ppc64 (little endian)=
 host using `virsh snapshot-create-as --domain <name> --name <name>`

Then I restarted my system and tried restoring the snapshot:

# virsh snapshot-revert --domain <name> --snapshotname <name>
error: internal error: process exited while connecting to monitor: 2020-0=
2-11T03:18:08.110582Z qemu-system-ppc64: KVM_SET_DEVICE_ATTR failed: Grou=
p 3 attr 0x0000000000001309: Device or resource busy
2020-02-11T03:18:08.110605Z qemu-system-ppc64: error while loading state =
for instance 0x0 of device 'spapr'
2020-02-11T03:18:08.112843Z qemu-system-ppc64: Error -1 while loading VM =
state

And dmesg shows each time the restore command is executed:

[  180.176606] WARNING: CPU: 16 PID: 5528 at arch/powerpc/kvm/book3s_xive=
=2Ec:345 xive_try_pick_queue+0x40/0xb8 [kvm]
[  180.176608] Modules linked in: vhost_net vhost tap kvm_hv kvm xt_CHECK=
SUM xt_MASQUERADE nf_nat_tftp nf_conntrack_tftp tun bridge 8021q garp mrp=
 stp llc rfkill nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t=
_REJECT nf_reject_ipv6 ip6t_rpfilter ipt_REJECT nf_reject_ipv4 xt_conntra=
ck ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw i=
p6table_security iptable_nat nf_nat iptable_mangle iptable_raw iptable_se=
curity nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nfnetlink ebtabl=
e_filter ebtables ip6table_filter ip6_tables iptable_filter sunrpc raid1 =
at24 regmap_i2c snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg joydev =
snd_hda_codec snd_hda_core ofpart snd_hwdep crct10dif_vpmsum snd_seq ipmi=
_powernv powernv_flash ipmi_devintf snd_seq_device mtd ipmi_msghandler rt=
c_opal snd_pcm opal_prd i2c_opal snd_timer snd soundcore lz4 lz4_compress=
 zram ip_tables xfs libcrc32c dm_crypt amdgpu ast drm_vram_helper mfd_cor=
e i2c_algo_bit gpu_sched drm_kms_helper mpt3sas
[  180.176652]  syscopyarea sysfillrect sysimgblt fb_sys_fops ttm drm vmx=
_crypto tg3 crc32c_vpmsum nvme raid_class scsi_transport_sas nvme_core dr=
m_panel_orientation_quirks i2c_core fuse
[  180.176663] CPU: 16 PID: 5528 Comm: qemu-system-ppc Not tainted 5.4.17=
-200.fc31.ppc64le #1
[  180.176665] NIP:  c00800000a883c80 LR: c00800000a886db8 CTR: c00800000=
a88a9e0
[  180.176667] REGS: c000000767a17890 TRAP: 0700   Not tainted  (5.4.17-2=
00.fc31.ppc64le)
[  180.176668] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 4822=
4248  XER: 20040000
[  180.176673] CFAR: c00800000a886db4 IRQMASK: 0=20
               GPR00: c00800000a886db8 c000000767a17b20 c00800000a8aed00 =
c0002005468a4480=20
               GPR04: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000001=20
               GPR08: c0002007142b2400 c0002007142b2400 0000000000000000 =
c00800000a8910f0=20
               GPR12: c00800000a88a488 c0000007fffed000 0000000000000000 =
0000000000000000=20
               GPR16: 0000000149524180 00007ffff39bda78 00007ffff39bda30 =
000000000000025c=20
               GPR20: 0000000000000000 0000000000000003 c0002006f13a0000 =
0000000000000000=20
               GPR24: 0000000000001359 0000000000000000 c0000002f8c96c38 =
c0000002f8c80000=20
               GPR28: 0000000000000000 c0002006f13a0000 c0002006f13a4038 =
c000000767a17be4=20
[  180.176688] NIP [c00800000a883c80] xive_try_pick_queue+0x40/0xb8 [kvm]=

[  180.176693] LR [c00800000a886db8] kvmppc_xive_select_target+0x100/0x21=
0 [kvm]
[  180.176694] Call Trace:
[  180.176696] [c000000767a17b20] [c000000767a17b70] 0xc000000767a17b70 (=
unreliable)
[  180.176701] [c000000767a17b70] [c00800000a88b420] kvmppc_xive_native_s=
et_attr+0xf98/0x1760 [kvm]
[  180.176705] [c000000767a17cc0] [c00800000a86392c] kvm_device_ioctl+0xf=
4/0x180 [kvm]
[  180.176710] [c000000767a17d10] [c0000000005380b0] do_vfs_ioctl+0xaa0/0=
xd90
[  180.176712] [c000000767a17dd0] [c000000000538464] sys_ioctl+0xc4/0x110=

[  180.176716] [c000000767a17e20] [c00000000000b9d0] system_call+0x5c/0x6=
8
[  180.176717] Instruction dump:
[  180.176719] 794ad182 0b0a0000 2c290000 41820080 89490010 2c0a0000 4182=
0074 78883664=20
[  180.176723] 7d094214 e9480070 7d470074 78e7d182 <0b070000> 2c2a0000 41=
820054 81480078=20
[  180.176727] ---[ end trace 056a6dd275e20684 ]---

Let me know if I can provide more information

Thanks


--------------2952CCD2A75C0BEA4D61AAB8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <pre>Hello,</pre>
    <pre>I took a snapshot of a ppc64 (big endian) VM from a ppc64 (littl=
e endian) host using `virsh snapshot-create-as --domain &lt;name&gt; --na=
me &lt;name&gt;`</pre>
    <pre>Then I restarted my system and tried restoring the snapshot:
</pre>
    <pre># virsh snapshot-revert --domain &lt;name&gt; --snapshotname &lt=
;name&gt;
error: internal error: process exited while connecting to monitor: 2020-0=
2-11T03:18:08.110582Z qemu-system-ppc64: KVM_SET_DEVICE_ATTR failed: Grou=
p 3 attr 0x0000000000001309: Device or resource busy
2020-02-11T03:18:08.110605Z qemu-system-ppc64: error while loading state =
for instance 0x0 of device 'spapr'
2020-02-11T03:18:08.112843Z qemu-system-ppc64: Error -1 while loading VM =
state</pre>
    <pre>And dmesg shows each time the restore command is executed:</pre>=

    <pre>[  180.176606] WARNING: CPU: 16 PID: 5528 at arch/powerpc/kvm/bo=
ok3s_xive.c:345 xive_try_pick_queue+0x40/0xb8 [kvm]
[  180.176608] Modules linked in: vhost_net vhost tap kvm_hv kvm xt_CHECK=
SUM xt_MASQUERADE nf_nat_tftp nf_conntrack_tftp tun bridge 8021q garp mrp=
 stp llc rfkill nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t=
_REJECT nf_reject_ipv6 ip6t_rpfilter ipt_REJECT nf_reject_ipv4 xt_conntra=
ck ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw i=
p6table_security iptable_nat nf_nat iptable_mangle iptable_raw iptable_se=
curity nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nfnetlink ebtabl=
e_filter ebtables ip6table_filter ip6_tables iptable_filter sunrpc raid1 =
at24 regmap_i2c snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg joydev =
snd_hda_codec snd_hda_core ofpart snd_hwdep crct10dif_vpmsum snd_seq ipmi=
_powernv powernv_flash ipmi_devintf snd_seq_device mtd ipmi_msghandler rt=
c_opal snd_pcm opal_prd i2c_opal snd_timer snd soundcore lz4 lz4_compress=
 zram ip_tables xfs libcrc32c dm_crypt amdgpu ast drm_vram_helper mfd_cor=
e i2c_algo_bit gpu_sched drm_kms_helper mpt3sas
[  180.176652]  syscopyarea sysfillrect sysimgblt fb_sys_fops ttm drm vmx=
_crypto tg3 crc32c_vpmsum nvme raid_class scsi_transport_sas nvme_core dr=
m_panel_orientation_quirks i2c_core fuse
[  180.176663] CPU: 16 PID: 5528 Comm: qemu-system-ppc Not tainted 5.4.17=
-200.fc31.ppc64le #1
[  180.176665] NIP:  c00800000a883c80 LR: c00800000a886db8 CTR: c00800000=
a88a9e0
[  180.176667] REGS: c000000767a17890 TRAP: 0700   Not tainted  (5.4.17-2=
00.fc31.ppc64le)
[  180.176668] MSR:  9000000000029033 &lt;SF,HV,EE,ME,IR,DR,RI,LE&gt;  CR=
: 48224248  XER: 20040000
[  180.176673] CFAR: c00800000a886db4 IRQMASK: 0=20
               GPR00: c00800000a886db8 c000000767a17b20 c00800000a8aed00 =
c0002005468a4480=20
               GPR04: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000001=20
               GPR08: c0002007142b2400 c0002007142b2400 0000000000000000 =
c00800000a8910f0=20
               GPR12: c00800000a88a488 c0000007fffed000 0000000000000000 =
0000000000000000=20
               GPR16: 0000000149524180 00007ffff39bda78 00007ffff39bda30 =
000000000000025c=20
               GPR20: 0000000000000000 0000000000000003 c0002006f13a0000 =
0000000000000000=20
               GPR24: 0000000000001359 0000000000000000 c0000002f8c96c38 =
c0000002f8c80000=20
               GPR28: 0000000000000000 c0002006f13a0000 c0002006f13a4038 =
c000000767a17be4=20
[  180.176688] NIP [c00800000a883c80] xive_try_pick_queue+0x40/0xb8 [kvm]=

[  180.176693] LR [c00800000a886db8] kvmppc_xive_select_target+0x100/0x21=
0 [kvm]
[  180.176694] Call Trace:
[  180.176696] [c000000767a17b20] [c000000767a17b70] 0xc000000767a17b70 (=
unreliable)
[  180.176701] [c000000767a17b70] [c00800000a88b420] kvmppc_xive_native_s=
et_attr+0xf98/0x1760 [kvm]
[  180.176705] [c000000767a17cc0] [c00800000a86392c] kvm_device_ioctl+0xf=
4/0x180 [kvm]
[  180.176710] [c000000767a17d10] [c0000000005380b0] do_vfs_ioctl+0xaa0/0=
xd90
[  180.176712] [c000000767a17dd0] [c000000000538464] sys_ioctl+0xc4/0x110=

[  180.176716] [c000000767a17e20] [c00000000000b9d0] system_call+0x5c/0x6=
8
[  180.176717] Instruction dump:
[  180.176719] 794ad182 0b0a0000 2c290000 41820080 89490010 2c0a0000 4182=
0074 78883664=20
[  180.176723] 7d094214 e9480070 7d470074 78e7d182 &lt;0b070000&gt; 2c2a0=
000 41820054 81480078=20
[  180.176727] ---[ end trace 056a6dd275e20684 ]---

Let me know if I can provide more information

Thanks
</pre>
  </body>
</html>

--------------2952CCD2A75C0BEA4D61AAB8--

--6TmxDB2JUcAy1tt3mCRasuGFEUMDqivGw--

--z9EEU70xtk5sGfdhyN5KFJiDM2cVRbTcE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQQozTys6hLca3Ekt8u3HhLxn6GoewUCXkImQAAKCRC3HhLxn6Go
e6hvAQDBgM8cIpMBBx1MKDtTQYptGp4RJqD1iior1QgnjdjC4gEAtfFBqcFwLsD2
VNXfEBF8XktvGOtAC37ZuVEprYaSTwk=
=ocGM
-----END PGP SIGNATURE-----

--z9EEU70xtk5sGfdhyN5KFJiDM2cVRbTcE--
