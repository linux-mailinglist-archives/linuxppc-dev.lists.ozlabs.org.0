Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4170415AF5C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 19:02:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HnXT5JgNzDqS9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 05:02:01 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HnVD5x0JzDqCV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 05:00:02 +1100 (AEDT)
Received: from [IPv6:2a01:e0a:2a2:1590:3130:d4af:7a6d:562c] (unknown
 [IPv6:2a01:e0a:2a2:1590:3130:d4af:7a6d:562c])
 by smtp3-g21.free.fr (Postfix) with ESMTP id 88DD713F838;
 Wed, 12 Feb 2020 18:59:52 +0100 (CET)
To: Greg Kurz <groug@kaod.org>
References: <7544eb90-71a6-3709-c530-9c83beb943a7@free.fr>
 <20200212120508.18be4f0c@bahia.lan>
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
Subject: Re: QEMU/KVM snapshot restore bug
Message-ID: <5b164716-a9a7-753a-7a8b-bc433f979c51@free.fr>
Date: Wed, 12 Feb 2020 18:59:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200212120508.18be4f0c@bahia.lan>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lpSH2L4kOIrwdNim6pfPuqzMSq5StAj4q"
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
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lpSH2L4kOIrwdNim6pfPuqzMSq5StAj4q
Content-Type: multipart/mixed; boundary="CTHBRlj5rNrUpGMhtLl22HTWXOwPyWxeS";
 protected-headers="v1"
From: dftxbs3e <dftxbs3e@free.fr>
To: Greg Kurz <groug@kaod.org>
Cc: linuxppc-dev@lists.ozlabs.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
Message-ID: <5b164716-a9a7-753a-7a8b-bc433f979c51@free.fr>
Subject: Re: QEMU/KVM snapshot restore bug
References: <7544eb90-71a6-3709-c530-9c83beb943a7@free.fr>
 <20200212120508.18be4f0c@bahia.lan>
In-Reply-To: <20200212120508.18be4f0c@bahia.lan>

--CTHBRlj5rNrUpGMhtLl22HTWXOwPyWxeS
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hello,
> A big endian guest doing XIVE ?!? I'm pretty sure we didn't do much tes=
ting, if
> any, on such a setup... What distro is used in the VM ?
A live Void Linux ISO ;
https://repo.voidlinux-ppc.org/live/current/void-live-ppc64-20190901.iso
> This indicates that QEMU failed to configure the source targeting
> for the HW interrupt 0x1309, which is an MSI interrupt used by
> a PCI device plugged in the default PHB. Especially, -EBUSY means
>
>     -EBUSY:  No CPU available to serve interrupt
>
Okay.
> This warning means that we have vCPU without a configured event queue.
>
> Since kvmppc_xive_select_target() is trying all vCPUs before bailing ou=
t
> with -EBUSY, you might be seeing several WARNINGs (1 per vCPU) in dmesg=
,
> correct ?
>
> Anyway, this looks wrong since QEMU is supposed to have already configu=
red
> the event queues at this point... Not sure what's happening here...
>
Indeed. VM core count + 1 such messages in dmesg.
> Yeah, QEMU command line, QEMU version, guest kernel version can help. A=
lso,
> what kind of workload is running inside the guest ? Is this easy to rep=
roduce ?

/usr/bin/qemu-system-ppc64 -name guest=3Dvoidlinux-ppc64,debug-threads=3D=
on
-S -object
secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qemu/domain-1=
3-voidlinux-ppc64/master-key.aes
-machine pseries-4.1,accel=3Dkvm,usb=3Doff,dump-guest-core=3Doff -m 8192
-overcommit mem-lock=3Doff -smp 8,sockets=3D8,cores=3D1,threads=3D1 -uuid=

5dd7af48-f00d-43c1-86ed-df5e0f7b4f1c -no-user-config -nodefaults
-chardev socket,id=3Dcharmonitor,fd=3D41,server,nowait -mon
chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol -rtc base=3Dutc -no-shu=
tdown
-boot strict=3Don -device qemu-xhci,p2=3D15,p3=3D15,id=3Dusb,bus=3Dpci.0,=
addr=3D0x2
-device virtio-scsi-pci,id=3Dscsi0,bus=3Dpci.0,addr=3D0x3 -device
virtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpci.0,addr=3D0x4 -drive
file=3D/var/lib/libvirt/images/voidlinux-ppc64.qcow2,format=3Dqcow2,if=3D=
none,id=3Ddrive-virtio-disk0
-device
virtio-blk-pci,scsi=3Doff,bus=3Dpci.0,addr=3D0x5,drive=3Ddrive-virtio-dis=
k0,id=3Dvirtio-disk0,bootindex=3D1
-drive
file=3D/home/jdoe/Downloads/void-live-ppc64-20190901.iso,format=3Draw,if=3D=
none,id=3Ddrive-scsi0-0-0-0,readonly=3Don
-device
scsi-cd,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,device_id=3Ddrive-s=
csi0-0-0-0,drive=3Ddrive-scsi0-0-0-0,id=3Dscsi0-0-0-0,bootindex=3D2
-netdev tap,fd=3D43,id=3Dhostnet0,vhost=3Don,vhostfd=3D44 -device
virtio-net-pci,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:ae:d7:62,bus=3D=
pci.0,addr=3D0x1
-chardev pty,id=3Dcharserial0 -device
spapr-vty,chardev=3Dcharserial0,id=3Dserial0,reg=3D0x30000000 -chardev
socket,id=3Dcharchannel0,fd=3D45,server,nowait -device
virtserialport,bus=3Dvirtio-serial0.0,nr=3D1,chardev=3Dcharchannel0,id=3D=
channel0,name=3Dorg.qemu.guest_agent.0
-device usb-tablet,id=3Dinput0,bus=3Dusb.0,port=3D1 -device
usb-kbd,id=3Dinput1,bus=3Dusb.0,port=3D2 -vnc 127.0.0.1:2 -device
VGA,id=3Dvideo0,vgamem_mb=3D16,bus=3Dpci.0,addr=3D0x8 -device
virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x6 -object
rng-random,id=3Dobjrng0,filename=3D/dev/urandom -device
virtio-rng-pci,rng=3Dobjrng0,id=3Drng0,bus=3Dpci.0,addr=3D0x7 -loadvm
guix-gentoo -sandbox
on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourcecontrol=3D=
deny
-msg timestamp=3Don

I am using virt-manager, which is why the command line is so long.

And ;

$ qemu-system-ppc64 --version
QEMU emulator version 4.1.1 (qemu-4.1.1-1.fc31)
Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers

Workload at snapshot time, the VM was idle, I was compiling software
using a Gentoo ppc64 big endian chroot inside the Void Linux ppc64 big
endian headless live system.

And yes it is easy to reproduce, download that Void Linux ppc64 big
endian ISO, using virt-manager, create a ppc64 vm with a disk, set the
VM to 8192MB of RAM and 8 cores (less RAM and cores might work,
untested) and it should reproduce the issue. It seems that a 1 core,
512MB of RAM VM suffers from no issue with snapshotting.

Thanks!



--CTHBRlj5rNrUpGMhtLl22HTWXOwPyWxeS--

--lpSH2L4kOIrwdNim6pfPuqzMSq5StAj4q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQQozTys6hLca3Ekt8u3HhLxn6GoewUCXkQ9GAAKCRC3HhLxn6Go
eyh7AP9igsWriLcM9HFb+dHe8AlumZffh9q7bmTr+gL5XEr+2AD/Q3CGOrbyabNG
j5AVaWcwo8PD1U5HRfmWudJkBxOKGgk=
=2q88
-----END PGP SIGNATURE-----

--lpSH2L4kOIrwdNim6pfPuqzMSq5StAj4q--
