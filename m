Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F138F944297
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 07:16:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=mPVLDIK0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZHHS6VTCz3dDy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 15:16:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=mPVLDIK0;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZHG921d1z3dDT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 15:14:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722489297;
	bh=9ekLAqcHMmW2qzcPBYo8F7ssePw8pSFREMlSsQxjCns=;
	h=Date:From:To:Cc:Subject:From;
	b=mPVLDIK0/knKc7ZzmaKymdAd2cboi5nXmomkTZTo9bJwVgDyvHQIcZimJ0PTyv87V
	 9jAgpgXjxqJv1sGDjKvoVm2M3PX8k/BAewdySI1SGNhKbFAzHkhJ9jYPvhOx/IHeSs
	 7kqnHBRriNzt2O0hV7Fzw2cCnglwRZCcOJQlr4C4msGzY/2N429CiZvTP3pxWCyfsh
	 Jo6f1+mBNTM/qlu9WvnzF/jTOHxFEe54Q5U266x4csBI2paTmnpfepa8if616G4iZt
	 QrY1UG0NiS3ca0Fl07IIYDrDQ/q/FpR6GuIzF4TFniFZNfz2QDF0Kmk1Bef3Agl6pC
	 I7IYUAdGO2bFg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZHG860WCz4wbR;
	Thu,  1 Aug 2024 15:14:56 +1000 (AEST)
Date: Thu, 1 Aug 2024 15:14:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoph Hellwig <hch@lst.de>
Subject: linux-next: runtime warning after merge of the dma-mapping tree
Message-ID: <20240801151455.01f08778@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OXXotUFWdVvvUXMOe8InhfD";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/OXXotUFWdVvvUXMOe8InhfD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the dma-mapping tree, today's linux-next qemu boot test
(powerpc_pseries_le_defconfig boot) produced this warning:

ipr: IBM Power RAID SCSI Device Driver version: 2.6.4 (March 14, 2017)
ibmvscsi 71000003: SRP_VERSION: 16.a
ibmvscsi 71000003: Maximum ID: 64 Maximum LUN: 32 Maximum Channel: 3
scsi host0: IBM POWER Virtual SCSI Adapter 1.5.9
ibmvscsi 71000003: partner initialization complete
ibmvscsi 71000003: host srp version: 16.a, host partition qemu (0), OS 2, m=
ax io 2097152
ibmvscsi 71000003: sent SRP login
ibmvscsi 71000003: SRP_LOGIN succeeded
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at include/linux/dma-mapping.h:564 scsi_init_limits+=
0x12c/0x134
Modules linked in:
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-rc1-02654-gb095b78c=
3a3d #1
Hardware name: IBM pSeries (emulated by qemu) POWER8 (architected) 0x4d0200=
 0xf000004 of:SLOF,HEAD pSeries
NIP:  c000000000c350c0 LR: c000000000c34fd4 CTR: 0000000000000000
REGS: c00000000498f0c0 TRAP: 0700   Not tainted  (6.11.0-rc1-02654-gb095b78=
c3a3d)
MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 24002240  XER: 00000=
000
CFAR: c000000000c35068 IRQMASK: 0=20
GPR00: 0000000000000005 c00000000498f360 c00000000165af00 c00000000498f3f0=
=20
GPR04: 0000000000000000 0000000000000000 c00000000498f498 0000000000000003=
=20
GPR08: 0000000000000080 0000000000000000 00000000ffffffff 0000000000002000=
=20
GPR12: 0000000000000000 c000000002b60000 c00000000001110c 0000000000000000=
=20
GPR16: 0000000000000000 0000000000000000 0000000000000000 c0000000065e1900=
=20
GPR20: c000000006445c00 c000000001501e48 c000000006445c48 0000000000000000=
=20
GPR24: c00000000498f5b0 0000000000000000 c000000002b40330 c000000006c06c28=
=20
GPR28: 0000000000000000 c000000006c06c00 c000000006445c48 c0000000065e1000=
=20
NIP [c000000000c350c0] scsi_init_limits+0x12c/0x134
LR [c000000000c34fd4] scsi_init_limits+0x40/0x134
Call Trace:
[c00000000498f360] [c00000000498f390] 0xc00000000498f390 (unreliable)
[c00000000498f390] [c000000000c3ae94] scsi_alloc_sdev+0x204/0x3c4
[c00000000498f4d0] [c000000000c3b2a0] scsi_probe_and_add_lun+0x24c/0x354
[c00000000498f590] [c000000000c3c32c] __scsi_scan_target+0x160/0x294
[c00000000498f5f0] [c000000000c3c694] scsi_scan_channel+0xa0/0xec
[c00000000498f640] [c000000000c3c818] scsi_scan_host_selected+0x138/0x198
[c00000000498f690] [c000000000c3cc2c] scsi_scan_host+0x2c0/0x324
[c00000000498f730] [c000000000c6e128] ibmvscsi_probe+0x738/0xb74
[c00000000498f830] [c000000000108ee4] vio_bus_probe+0x9c/0x438
[c00000000498f8d0] [c000000000ba7dec] really_probe+0x104/0x3d4
[c00000000498f960] [c000000000ba8170] __driver_probe_device+0xb4/0x1d0
[c00000000498f9e0] [c000000000ba83dc] driver_probe_device+0x54/0x124
[c00000000498fa20] [c000000000ba86e8] __driver_attach+0xdc/0x204
[c00000000498fa60] [c000000000ba4b34] bus_for_each_dev+0xb4/0x138
[c00000000498fac0] [c000000000ba739c] driver_attach+0x34/0x48
[c00000000498fae0] [c000000000ba676c] bus_add_driver+0x140/0x2f0
[c00000000498fb70] [c000000000ba9d98] driver_register+0x8c/0x1c4
[c00000000498fbe0] [c00000000010a528] __vio_register_driver+0x74/0x98
[c00000000498fc00] [c000000002088e6c] ibmvscsi_module_init+0x8c/0x110
[c00000000498fc30] [c000000000010d98] do_one_initcall+0x80/0x2f8
[c00000000498fd00] [c000000002005c8c] kernel_init_freeable+0x32c/0x520
[c00000000498fde0] [c000000000011138] kernel_init+0x34/0x26c
[c00000000498fe50] [c00000000000debc] ret_from_kernel_user_thread+0x14/0x1c
--- interrupt: 0 at 0x0
Code: ebe1fff8 7c0803a6 4e800020 60420000 81490000 614a4000 91490000 4bffff=
b0 38e00000 3900ffff 60e7ffff 4bffff50 <0fe00000> 4bffffc0 3c4c00a2 38425e3=
8=20
---[ end trace 0000000000000000 ]---
scsi 0:0:2:0: CD-ROM            QEMU     QEMU CD-ROM      2.5+ PQ: 0 ANSI: 5
sr 0:0:2:0: Power-on or device reset occurred
sr 0:0:2:0: [sr0] scsi3-mmc drive: 16x/50x cd/rw xa/form2 cdda tray

Exposed by commit

  4d871c2db2fa ("dma-mapping: don't return errors from dma_set_seg_boundary=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/OXXotUFWdVvvUXMOe8InhfD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmarGc8ACgkQAVBC80lX
0Gx+zgf+Jl0ZK6G0Pk6jLKXN4wNwiKFwC+IZWTXeGFj/URjmmSLUjqrUeYLavugS
UwHrNFXocolKYTjIPg3aXGZNKmKY0o01WJ2T5KvZXfmgN0xqv2Al8YnQUCsC97EB
q/roKhHxMyS2mmyYUzfX7YuB6PMoCFyK1QKtPPqbnRRb3DsvszdVWtQhLvaJPKhi
s+ERdXVbArn0ncVJujo/Ry5mNQPY7+8Oc9nJvk9kowMuM04Kj48DxTEWzcGc0aji
M6E5nrTQhqfJLzZFrdCdl3efs0UNyY8LygAA6lVpsV1AVcdLjXSrXjghgU/LG6tc
tiUyA3R7YtN6YuZma9/lwsb+0jlKBQ==
=aQSS
-----END PGP SIGNATURE-----

--Sig_/OXXotUFWdVvvUXMOe8InhfD--
