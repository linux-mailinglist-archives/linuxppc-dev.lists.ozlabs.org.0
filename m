Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 801227438B1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 11:51:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsrDZ3JDvz3c1q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 19:51:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=lichtvoll.de (client-ip=2001:67c:14c:12f::11:100; helo=mail.lichtvoll.de; envelope-from=martin@lichtvoll.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 311 seconds by postgrey-1.37 at boromir; Fri, 30 Jun 2023 18:40:48 AEST
Received: from mail.lichtvoll.de (lichtvoll.de [IPv6:2001:67c:14c:12f::11:100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QspgN1fGRz3bYj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 18:40:48 +1000 (AEST)
Received: from 127.0.0.1 (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mail.lichtvoll.de (Postfix) with ESMTPSA id 85B3972727C;
	Fri, 30 Jun 2023 10:35:17 +0200 (CEST)
Authentication-Results: mail.lichtvoll.de;
	auth=pass smtp.auth=martin smtp.mailfrom=martin@lichtvoll.de
From: Martin Steigerwald <martin@lichtvoll.de>
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Michael Schmitz <schmitzmic@gmail.com>
Subject:  Re: [FSL P50x0] [PASEMI] The Access to partitions on disks with an Amiga
 partition table doesn't work anymore after the block updates 2023-06-23
Date: Fri, 30 Jun 2023 10:35:16 +0200
Message-ID: <5866778.MhkbZ0Pkbq@lichtvoll.de>
In-Reply-To: <a113cb83-9f82-fd39-f132-41ba4c259265@gmail.com>
References:  <024ce4fa-cc6d-50a2-9aae-3701d0ebf668@xenosoft.de>
 <a113cb83-9f82-fd39-f132-41ba4c259265@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 30 Jun 2023 19:48:38 +1000
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

Hi Michael, hi Christian.

Michael Schmitz - 29.06.23, 22:27:59 CEST:
[=E2=80=A6]
> On 29/06/23 16:59, Christian Zigotzky wrote:
> > Hello,
> >=20
> > The access  to partitions on disks with an Amiga partition table
> > (via the Rigid Disk Block RDB) doesn't work anymore on my Cyrus+=20
> > board with a FSL P50x0 PowerPC SoC [1] and on my P.A. Semi Nemo=20
> > board [2] after the block updates 2023-06-23 [3].
> >=20
> > parted -l
[=E2=80=A6]
> > dmesg | grep -i sda
> >=20
> > [    4.208905] sd 0:0:0:0: [sda] 3907029168 512-byte logical blocks:
> > (2.00 TB/1.82 TiB)

That is roughly the size of the disk that triggered my bug report from=20
2012.

Jun 19 21:19:09 merkaba kernel: [ 7891.821315] ata8.00: 3907029168=20
sectors, multi 0: LBA48 NCQ (depth 31/32)

Bug 43511 - Partitions: Amiga RDB partition on 2 TB disk way too big,=20
while OK in AmigaOS 4.1

https://bugzilla.kernel.org/show_bug.cgi?id=3D43511

> > [    4.963387] sda: partition table beyond EOD,
>=20
> Haven't see this one in any of my tests. I wonder whether your
> partitioning software used that value of 4294967295 (32 bit unsigned
> int max.) as marker for the end of the partition list, instead of
> NULL? It's clearly beyond the end of your disk, so cannot be a
> legitimate partition block address. (The parted dump above (showing
> only four partitions) appears to support that notion.)

I don't know about "-1" for end of partition list. However, on reviewing=20
my bug report I think I used Media Toolbox myself to create the=20
partition table. However I am not completely sure about that. It has=20
been a long time. I used Media Toolbox on AmigaOS 4.1 to extract the=20
binary copy of the RDB, but I do not recall what I used to partition it.=20
I bet it was Media Toolbox as well, likely on some development version=20
of AmigaOS 4. I was member of the AmigaOS 4 team back then. The disk is=20
repartitioned as GPT and I do not even know at the moment where it is.=20
So that is all I can say.

I could ask someone from the AmigaOS 4 team, however I am not a member=20
of it anymore. And in any case, whether Media Toolbox or another tool=20
writes a "-1" to end partition list or not, I'd not treat a signed value=20
"-1" as valid partition size. We could also ask Joanne again, however=20
she was not involved in AmigaOS 4 development and does not know about=20
Media Toolbox. She created the "hdwrench.library" for AmigaOS 3.5/3.9=20
HDToolBox. So maybe it is just good to assume "-1" as end of partition=20
table, at least after confirming from the binary of the affected RDB that=20
the "-1" is indeed at the end of the partition block list. Maybe also in=20
the RDB from my bug report there is this "-1" again=E2=80=A6 however, the d=
isk=20
worked okay in Linux after testing with Joanne's initial patch from

https://bugzilla.kernel.org/show_bug.cgi?id=3D43511#c7

Subject: Re: Partitions: Amiga RDB partition on 2 TB disk way too big,=20
while OK in AmigaOS 4.1

https://lore.kernel.org/linux-m68k/
201206192146.09327.Martin@lichtvoll.de/


This comment from an AmigaOS developer is only about the maximum sizes=20
and does not detail a "-1" as partition size =E2=80=93 however I did not as=
k=20
about it back then:

https://lore.kernel.org/linux-m68k/
201206182239.26647.Martin@lichtvoll.de/

> > [ 5.014769] sd 0:0:0:0: [sda] Attached SCSI disk
> >=20
> > I created a patch for reverting the commit. [4]
> >=20
> > The access works again with this patch:
[=E2=80=A6]
> > bytes [    4.519477]  sda: RDSK (512) sda1 (DOS^G)(res 2 spb 2)
> > sda2 (SFS^B)(res 2 spb 1) sda3 (SFS^B)(res 2 spb 2) sda4 ((res 2
> > spb 1) [    4.720896] sda: p4 size 18446744071956107760 extends
> > beyond EOD,
>
> That's the 32 bit overflow that the patch series was meant to correct.
> Parsing the partition table ends before looking at the next partition
> block in the list, so we never hit the bug you've seen above.
>=20
> By reverting my patch, you just reintroduce the old bug, which could
> result in mis-parsing the partition table in a way that is not
> detected by inane values of partition sizes as above, and as far as I
> recall this bug was reported because it did cause data corruption. Do
> I have that correct, Martin? Do you still have a copy of the
> problematic RDB from the old bug report around?

It is in the first attachment of the bug report I mentioned above. The=20
bug the patch fixed.

In the bug report I wrote:

"I had a BTRFS filesystem that had some checksum errors. Maybe thats=20
somehow related to this issue and AmigaOS and/or Linux overwrote=20
something it shouldn=C2=B4t have touched."

(Meanwhile I bet it is safe to assume that in case the checksum error=20
was from overwriting something it was not AmigaOS 4.)

This is no proof, but as I re-read my bug report: It is clearly an=20
overflow issue worsened by Linux back then truncating the too high=20
partition sizes larger than the disk to the disk size instead of bailing=20
out. So the partition I created for the Linux LVM in front of the Amiga=20
partitions overflowed into the Amiga partitions. Had I used that place=20
inside the PV for any LV and written to it=E2=80=A6 I bet it would have bee=
n=20
goodbye to the Amiga data.

> > Could you please check your commit?
>=20
> The patch series has undergone the usual thirteen versions in review,
> but the reviewers as well as myself may well have missed this point of
> detail...

I think the patch series has been very well reviewed, but I would not=20
have spotted such an issue as I am not really an RDB expert and even=20
then, with all the big endian conversions and what not inside of there=E2=
=80=A6=20
In my understanding the RDB format is not really as Rigid as the name=20
implies. It is quite flexible, especially when compared to what had been=20
used on PC back then and sometimes even now. So there is a chance for a=20
RDB partitioning that triggers an oversight in the patch series.

> Could you please check this (whitespace-damaged) patch?
>=20
>      block/partitions - Amiga partition overflow fix bugfix
>=20
>      Making 'blk' sector_t (i.e. 64 bit if LBD support is active)
>      fails the 'blk>0' test in the partition block loop if a
>      value of (signed int) -1 is used to mark the end of the
>      partition block list.
>=20
>      Explicitly cast 'blk' to signed int to catch this.
>=20
>      Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>=20
> diff --git a/block/partitions/amiga.c b/block/partitions/amiga.c
> index ed222b9c901b..506921095412 100644
> --- a/block/partitions/amiga.c
> +++ b/block/partitions/amiga.c
> @@ -90,7 +90,7 @@ int amiga_partition(struct parsed_partitions *state)
> }
>          blk =3D be32_to_cpu(rdb->rdb_PartitionList);
>          put_dev_sector(sect);
> -       for (part =3D 1; blk>0 && part<=3D16; part++,=20
> put_dev_sector(sect)) {=20
> +       for (part =3D 1; (s32) blk>0 && part<=3D16; part++,
> put_dev_sector(sect)) {

Makes sense to me.

Best,
=2D-=20
Martin


