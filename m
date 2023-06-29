Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F21157423D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 12:18:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsDtg6txdz3bpG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 20:18:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsDt714HGz2yyw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 20:18:05 +1000 (AEST)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1qEoiq-000SNC-7D; Thu, 29 Jun 2023 12:17:56 +0200
Received: from p57bd9486.dip0.t-ipconnect.de ([87.189.148.134] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1qEoip-001qhD-Vp; Thu, 29 Jun 2023 12:17:56 +0200
Message-ID: <f1a0f2252cc38721e222530dc4026ed3834e3eb8.camel@physik.fu-berlin.de>
Subject: Re: [FSL P50x0] [PASEMI] The Access to partitions on disks with an
 Amiga partition table doesn't work anymore after the block updates
 2023-06-23
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Christian Zigotzky <chzigotzky@xenosoft.de>, schmitzmic@gmail.com
Date: Thu, 29 Jun 2023 12:17:55 +0200
In-Reply-To: <024ce4fa-cc6d-50a2-9aae-3701d0ebf668@xenosoft.de>
References: <024ce4fa-cc6d-50a2-9aae-3701d0ebf668@xenosoft.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.134
X-ZEDAT-Hint: PO
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
Cc: axboe@kernel.dk, linux-m68k@vger.kernel.org, Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, linux-block@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, "R.T.Dickinson" <rtd2@xtra.co.nz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Christian!

On Thu, 2023-06-29 at 06:59 +0200, Christian Zigotzky wrote:
> The access=C2=A0 to partitions on disks with an Amiga partition table (vi=
a=20
> the Rigid Disk Block RDB) doesn't work anymore on my Cyrus+ board with a=
=20
> FSL P50x0 PowerPC SoC [1] and on my P.A. Semi Nemo board [2] after the=
=20
> block updates 2023-06-23 [3].
>=20
> parted -l
>=20
> Model: ATA ST2000DM001-9YN1 (scsi)
> Disk /dev/sda: 2000GB
> Sector size (logical/physical): 512B/4096B
> Partition Table: amiga
> Disk Flags:
>=20
> Number=C2=A0 Start=C2=A0=C2=A0 End=C2=A0=C2=A0=C2=A0=C2=A0 Size=C2=A0=C2=
=A0=C2=A0 File system=C2=A0 Name=C2=A0 Flags
>  =C2=A01=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1057kB=C2=A0 123MB=C2=A0=C2=A0 122=
MB=C2=A0=C2=A0 affs7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BDH0=C2=A0 h=
idden
>  =C2=A02=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 123MB=C2=A0=C2=A0 2274MB=C2=A0 215=
0MB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 DH0=C2=A0=C2=A0 boot
>  =C2=A03=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2274MB=C2=A0 691GB=C2=A0=C2=A0 689=
GB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 DH2
>  =C2=A04=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 691GB=C2=A0=C2=A0 1992GB=C2=A0 130=
1GB=C2=A0 ext4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dhx=C2=A0=C2=
=A0 boot

What version of AmigaOS is that?

> dmesg | grep -i sda
>=20
> [=C2=A0=C2=A0=C2=A0 4.208905] sd 0:0:0:0: [sda] 3907029168 512-byte logic=
al blocks:=20
> (2.00 TB/1.82 TiB)
> [=C2=A0=C2=A0=C2=A0 4.253995] sd 0:0:0:0: [sda] 4096-byte physical blocks
> [=C2=A0=C2=A0=C2=A0 4.254826] sd 0:0:0:0: [sda] Write Protect is off
> [=C2=A0=C2=A0=C2=A0 4.300069] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
> [=C2=A0=C2=A0=C2=A0 4.486476] sd 0:0:0:0: [sda] Write cache: enabled, rea=
d cache:=20
> enabled, doesn't support DPO or FUA
> [=C2=A0=C2=A0=C2=A0 4.580507] sd 0:0:0:0: [sda] Preferred minimum I/O siz=
e 4096 bytes
> [=C2=A0=C2=A0=C2=A0 4.712624] Dev sda: unable to read partition block 429=
4967295
> [=C2=A0=C2=A0=C2=A0 4.761532]=C2=A0 sda: RDSK (512) sda1 (DOS^G)(res 2 sp=
b 2) sda2=20
> (SFS^B)(res 2 spb 1) sda3 (SFS^B)(res 2 spb 2) sda4 ((res 2 spb 1)=20
> unable to read partition table
> [=C2=A0=C2=A0=C2=A0 4.761892] sda: partition table beyond EOD,
> [=C2=A0=C2=A0=C2=A0 4.861681] Dev sda: unable to read partition block 429=
4967295
> [=C2=A0=C2=A0=C2=A0 4.912094]=C2=A0 sda: RDSK (512) sda1 (DOS^G)(res 2 sp=
b 2) sda2=20
> (SFS^B)(res 2 spb 1) sda3 (SFS^B)(res 2 spb 2) sda4 ((res 2 spb 1)=20
> unable to read partition table
> [=C2=A0=C2=A0=C2=A0 4.963387] sda: partition table beyond EOD,
> [=C2=A0=C2=A0=C2=A0 5.014769] sd 0:0:0:0: [sda] Attached SCSI disk

Maybe the RDB is corrupted? Did you try on a freshly created RDB?

> I created a patch for reverting the commit. [4]

That can be done with just "git revert <commit hash>".

> The access works again with this patch:
>=20
> [=C2=A0=C2=A0=C2=A0 0.000000] Kernel command line: root=3D/dev/sda4
> [=C2=A0=C2=A0=C2=A0 3.987717] sd 0:0:0:0: [sda] 3907029168 512-byte logic=
al blocks:=20
> (2.00 TB/1.82 TiB)
> [=C2=A0=C2=A0=C2=A0 4.031349] sd 0:0:0:0: [sda] 4096-byte physical blocks
> [=C2=A0=C2=A0=C2=A0 4.123773] sd 0:0:0:0: [sda] Write Protect is off
> [=C2=A0=C2=A0=C2=A0 4.168682] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
> [=C2=A0=C2=A0=C2=A0 4.279304] sd 0:0:0:0: [sda] Write cache: enabled, rea=
d cache:=20
> enabled, doesn't support DPO or FUA
> [=C2=A0=C2=A0=C2=A0 4.463508] sd 0:0:0:0: [sda] Preferred minimum I/O siz=
e 4096 bytes
> [=C2=A0=C2=A0=C2=A0 4.519477]=C2=A0 sda: RDSK (512) sda1 (DOS^G)(res 2 sp=
b 2) sda2=20
> (SFS^B)(res 2 spb 1) sda3 (SFS^B)(res 2 spb 2) sda4 ((res 2 spb 1)
> [=C2=A0=C2=A0=C2=A0 4.720896] sda: p4 size 18446744071956107760 extends b=
eyond EOD,
> [=C2=A0=C2=A0=C2=A0 4.922550]=C2=A0 sda: RDSK (512) sda1 (DOS^G)(res 2 sp=
b 2) sda2=20
> (SFS^B)(res 2 spb 1) sda3 (SFS^B)(res 2 spb 2) sda4 ((res 2 spb 1)
> [=C2=A0=C2=A0=C2=A0 4.948655] sda: p4 size 18446744071956107760 extends b=
eyond EOD,=20
> truncated

Looks like the old code is complaining about your partition table as well.

> Could you please check your commit?

Please also make sure that your RDB is not corrupted.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
