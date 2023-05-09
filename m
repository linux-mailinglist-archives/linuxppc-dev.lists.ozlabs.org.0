Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7182B6FBD21
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 04:25:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFhpK1tVFz3fLR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 12:25:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=GKa8IMSB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFhnS5FBHz3c7t
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 12:24:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=GKa8IMSB;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QFhnR6cpNz4x41;
	Tue,  9 May 2023 12:24:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1683599084;
	bh=XhJyn/QGya6zPRpx77RTtWDca8HAOkckotvqWP8fSgU=;
	h=Date:From:To:Cc:Subject:From;
	b=GKa8IMSBEDu7kcHiBymRdPe2EW7ISS+gNFPdxne9VBXI8RJSpdLYanjK+tV6Q31Po
	 AEQU3mqYAfju680W/qzvu6uyy8rHNcDp17/uocPwVzR8P4LYn0iiIidAXcHyxDao5h
	 TxkzBTOtPQGBio2ErsRYv2sWbf5SNIs/kUSVIaKsqINH5TO7W5hT6oKdFC34u6VzsG
	 twYhG6qp9fgQ4lndRFjXEyuRalSjv7x+k0GoDMNk/5cu2IL1kF5oQiXXs8oJ63/Fd+
	 BtZ/THQkuWK+dLyG5zzLQwho8ybi0M4AxoJhWK2gDzBbpItGq9Ak5HyGOvp2UxwMQ0
	 27tzBKWuztVgw==
Date: Tue, 9 May 2023 12:24:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: boot warning
Message-ID: <20230509122440.418068cb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Un/b79OKYagg=EG0T9SViUQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Martin K.
 Petersen" <martin.petersen@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/Un/b79OKYagg=EG0T9SViUQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's qemu test boot (powerpc pseries_le_defconfig) produced this
warning:

[    2.048588][    T1] ipr: IBM Power RAID SCSI Device Driver version: 2.6.=
4 (March 14, 2017)
[    2.051560][    T1] ------------[ cut here ]------------
[    2.052297][    T1] WARNING: CPU: 0 PID: 1 at kernel/workqueue.c:5925 wo=
rkqueue_sysfs_register+0x20/0x1f0
[    2.053294][    T1] Modules linked in:
[    2.053678][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.4.0-rc1-=
01511-g91b79de175e1 #1
[    2.053899][    T1] Hardware name: IBM pSeries (emulated by qemu) POWER8=
 (raw) 0x4d0200 0xf000004 of:SLOF,HEAD pSeries
[    2.054099][    T1] NIP:  c000000000181d40 LR: c000000000182164 CTR: c00=
00000001b71e0
[    2.054171][    T1] REGS: c0000000047632c0 TRAP: 0700   Not tainted  (6.=
4.0-rc1-01511-g91b79de175e1)
[    2.054279][    T1] MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  C=
R: 48000284  XER: 00000000
[    2.054608][    T1] CFAR: c000000000182160 IRQMASK: 0=20
[    2.054608][    T1] GPR00: c000000000182164 c000000004763560 c0000000015=
58c00 c000000004d18600=20
[    2.054608][    T1] GPR04: 0000000000000000 0000000000000000 c0000000028=
eccd8 0000000000000000=20
[    2.054608][    T1] GPR08: 0000000000000000 0000000000080000 00000000000=
00000 0000000048000288=20
[    2.054608][    T1] GPR12: 0000000000000000 c000000002ad0000 c0000000000=
13788 0000000000000000=20
[    2.054608][    T1] GPR16: 0000000000000000 0000000000000000 00000000000=
00000 0000000000000000=20
[    2.054608][    T1] GPR20: 0000000000000000 0000000000000000 00000000000=
00000 0000000000000000=20
[    2.054608][    T1] GPR24: 0000000000000000 c000000004d186b8 c000000004d=
18610 c000000004d18620=20
[    2.054608][    T1] GPR28: 0000000000000000 c00000000299b310 00000000000=
00000 c000000004d18600=20
[    2.055488][    T1] NIP [c000000000181d40] workqueue_sysfs_register+0x20=
/0x1f0
[    2.055564][    T1] LR [c000000000182164] alloc_workqueue+0x254/0x584
[    2.055858][    T1] Call Trace:
[    2.055989][    T1] [c000000004763560] [c0000000047635f0] 0xc00000000476=
35f0 (unreliable)
[    2.056509][    T1] [c0000000047635f0] [c0000000001823a8] alloc_workqueu=
e+0x498/0x584
[    2.056605][    T1] [c0000000047636a0] [c000000000ba016c] scsi_host_allo=
c+0x2fc/0x500
[    2.056678][    T1] [c000000004763730] [c000000000bdf7ec] ibmvscsi_probe=
+0x6c/0xaf8
[    2.056746][    T1] [c000000004763820] [c000000000105d4c] vio_bus_probe+=
0x9c/0x4a0
[    2.056816][    T1] [c0000000047638e0] [c000000000b1c274] really_probe+0=
x104/0x410
[    2.056885][    T1] [c000000004763970] [c000000000b1c630] __driver_probe=
_device+0xb0/0x1e0
[    2.056956][    T1] [c0000000047639f0] [c000000000b1c7b4] driver_probe_d=
evice+0x54/0x130
[    2.057025][    T1] [c000000004763a30] [c000000000b1cac8] __driver_attac=
h+0xd8/0x200
[    2.057092][    T1] [c000000004763a70] [c000000000b18cd4] bus_for_each_d=
ev+0xb4/0x140
[    2.057158][    T1] [c000000004763ad0] [c000000000b1b824] driver_attach+=
0x34/0x50
[    2.057226][    T1] [c000000004763af0] [c000000000b1ac1c] bus_add_driver=
+0x13c/0x2d0
[    2.057292][    T1] [c000000004763b80] [c000000000b1e3c4] driver_registe=
r+0xa4/0x1b0
[    2.057360][    T1] [c000000004763bf0] [c000000000108054] __vio_register=
_driver+0x74/0x9c
[    2.057428][    T1] [c000000004763c10] [c000000002063690] ibmvscsi_modul=
e_init+0x98/0xd4
[    2.057500][    T1] [c000000004763c40] [c0000000000131a0] do_one_initcal=
l+0x80/0x320
[    2.057583][    T1] [c000000004763d20] [c0000000020049b4] kernel_init_fr=
eeable+0x304/0x3ac
[    2.057657][    T1] [c000000004763df0] [c0000000000137b0] kernel_init+0x=
30/0x1a0
[    2.057723][    T1] [c000000004763e50] [c00000000000debc] ret_from_kerne=
l_user_thread+0x14/0x1c
[    2.057807][    T1] --- interrupt: 0 at 0x0
[    2.057858][    T1] NIP:  0000000000000000 LR: 0000000000000000 CTR: 000=
0000000000000
[    2.057909][    T1] REGS: c000000004763e80 TRAP: 0000   Not tainted  (6.=
4.0-rc1-01511-g91b79de175e1)
[    2.057964][    T1] MSR:  0000000000000000 <>  CR: 00000000  XER: 000000=
00
[    2.058031][    T1] CFAR: 0000000000000000 IRQMASK: 0=20
[    2.058031][    T1] GPR00: 0000000000000000 0000000000000000 00000000000=
00000 0000000000000000=20
[    2.058031][    T1] GPR04: 0000000000000000 0000000000000000 00000000000=
00000 0000000000000000=20
[    2.058031][    T1] GPR08: 0000000000000000 0000000000000000 00000000000=
00000 0000000000000000=20
[    2.058031][    T1] GPR12: 0000000000000000 0000000000000000 00000000000=
00000 0000000000000000=20
[    2.058031][    T1] GPR16: 0000000000000000 0000000000000000 00000000000=
00000 0000000000000000=20
[    2.058031][    T1] GPR20: 0000000000000000 0000000000000000 00000000000=
00000 0000000000000000=20
[    2.058031][    T1] GPR24: 0000000000000000 0000000000000000 00000000000=
00000 0000000000000000=20
[    2.058031][    T1] GPR28: 0000000000000000 0000000000000000 00000000000=
00000 0000000000000000=20
[    2.058682][    T1] NIP [0000000000000000] 0x0
[    2.058728][    T1] LR [0000000000000000] 0x0
[    2.058782][    T1] --- interrupt: 0
[    2.058965][    T1] Code: 60000000 60000000 60000000 60420000 3c4c013d 3=
8426ee0 7c0802a6 60000000 fb61ffd8 f821ff71 81230100 55290318 <0b090000> 3d=
22fff0 7c0802a6 fb810070=20
[    2.059420][    T1] ---[ end trace 0000000000000000 ]---
[    2.065968][   T46] scsi_tmf_0 (46) used greatest stack depth: 15200 byt=
es left
[    2.067252][    T1] scsi host0: failed to create tmf workq
[    2.092458][   T45] scsi_eh_0 (45) used greatest stack depth: 14240 byte=
s left
[    2.092852][    T1] ibmvscsi 71000003: couldn't allocate host data
[    2.093005][    T1] ibmvscsi: probe of 71000003 failed with error -1


I have no idea what has caused this.

--=20
Cheers,
Stephen Rothwell

--Sig_/Un/b79OKYagg=EG0T9SViUQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmRZrukACgkQAVBC80lX
0Gynhgf9HinZ+eJk/ufVJJKnf7G2eRFxiA1aiWfJIiz9SZtqHkBZmXBmf/yZgKb2
AwkrbqYNWjSLSCXmQ12J32FU5GS7usub4sJUyAzidGJm71jnL+Ljm7SCVBhfdLJD
o32BN14ItlHxrJDg1hZBQrPuDi+Ef3GidBlxBkF9nzauVVKlgsqhNgBwacWt5wHn
YTcmQ8NSX7jkF3DvCzvo+xyXp3M5uJb/sPEH7uC8aRmHCUcrtQbgI+RE/iNuJ8pU
TjrFmqocMF++C+IKUsUp4evGcPWe/Zve3DFUguIgXgCgb1tFMJ164L/Wt+RDcX2P
FiZthWNatn6gB/w1FPAdkjN3zb4peQ==
=HfaU
-----END PGP SIGNATURE-----

--Sig_/Un/b79OKYagg=EG0T9SViUQ--
