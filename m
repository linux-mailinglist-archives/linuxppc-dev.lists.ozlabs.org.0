Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1AD742E48
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 22:29:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NlTUvodW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsVR03KCyz3bpK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 06:29:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NlTUvodW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com; envelope-from=schmitzmic@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsVQ45tJgz30BZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 06:28:10 +1000 (AEST)
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-34574014304so5283785ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 13:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688070487; x=1690662487;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aTJRzDXOSR9H2JlrTJUaNcRjpSn9DWoqSfnLZc/LR0o=;
        b=NlTUvodW84aqL21iUVO4bY8NuPUtbKuWhA45f1EG5yuoDNWoIWSjayG1QsgUIZdzYC
         9yK0PuJln7fqlIS1d9yJxM1WJ2OEVOZyCrqNRoFzhJrkqYDZEHt4NOKl9k3bhzjMzyAA
         qIyQqD8K/ubAEJ5IrV99g6R3CnBH4pU24hSxiwMeYsvzl8dtWsVxWEMjP7DqEwJOy0u1
         kHZv38rr428LR3NXnxJxp4AJ9ZDZQU1U4UyWUxY+VKpM2oGe5EtDhnkwE7kb6t4MypfV
         GHRyrW5F4EPI55MOsdcdQqx8LWLbdBtJNhk+XE22AaFEma5ZcHRtomayOhDhjsh2extr
         pq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688070487; x=1690662487;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aTJRzDXOSR9H2JlrTJUaNcRjpSn9DWoqSfnLZc/LR0o=;
        b=EfRMbHag1c18/PZwgT6Etw8vV8RlCzd9ZEt09f6bu0ndQ8UWnPqhHbwcTGv7jKg6Ok
         bSOUTAQU+FlAvjSZWyTFBoIn8mn0j4aSymNwAIapurKN3c1j4rNAyoryMRNBtc8Hndpt
         bcsYqhWgRye8Es9kvDVnX7CHbac49GVa2R726TyqiLSzcgCXgwEJyyB68dWe9woyageM
         FXUeKbHOKSfkji7E81aB1pGDXsWeJsKBBrKf7sGZhSw76h9b2g0uAOqXtm3g+cOS3Pdl
         JwMjC7nPVYySQ0oMBJ/5ndqzhP69x+Q65vSI4A/tH+xD0uX9p4W4al8ztdZq9muJ7qP0
         rd7A==
X-Gm-Message-State: ABy/qLYq6kZZhV8kfGaarVsFKj89xvwU4fFUToPWP+hQEWTXl9mdDLIv
	FW85ZcTigYc2sRAuHK4ucxM=
X-Google-Smtp-Source: APBJJlGxFqaleiAt4VRyihYyEXSqMQnsQq0RirugbdAW04lHi5su1uGksP/LhOrA+tS+Qd2mS3c3Lg==
X-Received: by 2002:a05:6e02:690:b0:345:ac3e:9406 with SMTP id o16-20020a056e02069000b00345ac3e9406mr329483ils.9.1688070487179;
        Thu, 29 Jun 2023 13:28:07 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:5ec:8707:9aa2:7574? ([2001:df0:0:200c:5ec:8707:9aa2:7574])
        by smtp.gmail.com with ESMTPSA id u4-20020a634544000000b0052c9d1533b6sm9280415pgk.56.2023.06.29.13.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 13:28:06 -0700 (PDT)
Message-ID: <a113cb83-9f82-fd39-f132-41ba4c259265@gmail.com>
Date: Fri, 30 Jun 2023 08:27:59 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [FSL P50x0] [PASEMI] The Access to partitions on disks with an
 Amiga partition table doesn't work anymore after the block updates 2023-06-23
Content-Language: en-US
To: Christian Zigotzky <chzigotzky@xenosoft.de>
References: <024ce4fa-cc6d-50a2-9aae-3701d0ebf668@xenosoft.de>
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <024ce4fa-cc6d-50a2-9aae-3701d0ebf668@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: axboe@kernel.dk, linux-m68k@vger.kernel.org, Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, Martin Steigerwald <martin@lichtvoll.de>, linux-block@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, "R.T.Dickinson" <rtd2@xtra.co.nz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christian,

[ added Martin Steigerwald in CC ]

thanks for your bug report (and of course, for testing the patch in the 
first instance)!

On 29/06/23 16:59, Christian Zigotzky wrote:
> Hello,
>
> The access  to partitions on disks with an Amiga partition table (via 
> the Rigid Disk Block RDB) doesn't work anymore on my Cyrus+ board with 
> a FSL P50x0 PowerPC SoC [1] and on my P.A. Semi Nemo board [2] after 
> the block updates 2023-06-23 [3].
>
> parted -l
>
> Model: ATA ST2000DM001-9YN1 (scsi)
> Disk /dev/sda: 2000GB
> Sector size (logical/physical): 512B/4096B
> Partition Table: amiga
> Disk Flags:
>
> Number  Start   End     Size    File system  Name  Flags
>  1      1057kB  123MB   122MB   affs7        BDH0  hidden
>  2      123MB   2274MB  2150MB               DH0   boot
>  3      2274MB  691GB   689GB                DH2
>  4      691GB   1992GB  1301GB  ext4         dhx   boot
>
> dmesg | grep -i sda
>
> [    4.208905] sd 0:0:0:0: [sda] 3907029168 512-byte logical blocks: 
> (2.00 TB/1.82 TiB)
> [    4.253995] sd 0:0:0:0: [sda] 4096-byte physical blocks
> [    4.254826] sd 0:0:0:0: [sda] Write Protect is off
> [    4.300069] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
> [    4.486476] sd 0:0:0:0: [sda] Write cache: enabled, read cache: 
> enabled, doesn't support DPO or FUA
> [    4.580507] sd 0:0:0:0: [sda] Preferred minimum I/O size 4096 bytes
> [    4.712624] Dev sda: unable to read partition block 4294967295
> [    4.761532]  sda: RDSK (512) sda1 (DOS^G)(res 2 spb 2) sda2 
> (SFS^B)(res 2 spb 1) sda3 (SFS^B)(res 2 spb 2) sda4 ((res 2 spb 1) 
> unable to read partition table
> [    4.761892] sda: partition table beyond EOD,
> [    4.861681] Dev sda: unable to read partition block 4294967295
> [    4.912094]  sda: RDSK (512) sda1 (DOS^G)(res 2 spb 2) sda2 
> (SFS^B)(res 2 spb 1) sda3 (SFS^B)(res 2 spb 2) sda4 ((res 2 spb 1) 
> unable to read partition table
> [    4.963387] sda: partition table beyond EOD,

Haven't see this one in any of my tests. I wonder whether your 
partitioning software used that value of 4294967295 (32 bit unsigned int 
max.) as marker for the end of the partition list, instead of NULL? It's 
clearly beyond the end of your disk, so cannot be a legitimate partition 
block address. (The parted dump above (showing only four partitions) 
appears to support that notion.)

Could you please create a dump of the RDB (first 4 MB of the disk ought 
to be enough) and send that?

> [ 5.014769] sd 0:0:0:0: [sda] Attached SCSI disk
>
> I created a patch for reverting the commit. [4]
>
> The access works again with this patch:
>
> [    0.000000] Kernel command line: root=/dev/sda4
> [    3.987717] sd 0:0:0:0: [sda] 3907029168 512-byte logical blocks: 
> (2.00 TB/1.82 TiB)
> [    4.031349] sd 0:0:0:0: [sda] 4096-byte physical blocks
> [    4.123773] sd 0:0:0:0: [sda] Write Protect is off
> [    4.168682] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
> [    4.279304] sd 0:0:0:0: [sda] Write cache: enabled, read cache: 
> enabled, doesn't support DPO or FUA
> [    4.463508] sd 0:0:0:0: [sda] Preferred minimum I/O size 4096 bytes
> [    4.519477]  sda: RDSK (512) sda1 (DOS^G)(res 2 spb 2) sda2 
> (SFS^B)(res 2 spb 1) sda3 (SFS^B)(res 2 spb 2) sda4 ((res 2 spb 1)
> [    4.720896] sda: p4 size 18446744071956107760 extends beyond EOD,

That's the 32 bit overflow that the patch series was meant to correct. 
Parsing the partition table ends before looking at the next partition 
block in the list, so we never hit the bug you've seen above.

By reverting my patch, you just reintroduce the old bug, which could 
result in mis-parsing the partition table in a way that is not detected 
by inane values of partition sizes as above, and as far as I recall this 
bug was reported because it did cause data corruption. Do I have that 
correct, Martin? Do you still have a copy of the problematic RDB from 
the old bug report around?

> [ 4.922550]  sda: RDSK (512) sda1 (DOS^G)(res 2 spb 2) sda2 
> (SFS^B)(res 2 spb 1) sda3 (SFS^B)(res 2 spb 2) sda4 ((res 2 spb 1)
> [    4.948655] sda: p4 size 18446744071956107760 extends beyond EOD, 
> truncated
> [    4.998956] sd 0:0:0:0: [sda] Attached SCSI disk
> [    8.394695] EXT4-fs (sda4): mounted filesystem 
> 93cb7dd2-ce1b-4bf5-ba47-818cf8e8c9f4 ro with ordered data mode. Quota 
> mode: none.
> [   18.578020] EXT4-fs (sda4): re-mounted 
> 93cb7dd2-ce1b-4bf5-ba47-818cf8e8c9f4 ro. Quota mode: none.
> [   23.159524] EXT4-fs (sda4): re-mounted 
> 93cb7dd2-ce1b-4bf5-ba47-818cf8e8c9f4 r/w. Quota mode: none.
>
> Could you please check your commit?
The patch series has undergone the usual thirteen versions in review, 
but the reviewers as well as myself may well have missed this point of 
detail...

Could you please check this (whitespace-damaged) patch?

     block/partitions - Amiga partition overflow fix bugfix

     Making 'blk' sector_t (i.e. 64 bit if LBD support is active)
     fails the 'blk>0' test in the partition block loop if a
     value of (signed int) -1 is used to mark the end of the
     partition block list.

     Explicitly cast 'blk' to signed int to catch this.

     Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>

diff --git a/block/partitions/amiga.c b/block/partitions/amiga.c
index ed222b9c901b..506921095412 100644
--- a/block/partitions/amiga.c
+++ b/block/partitions/amiga.c
@@ -90,7 +90,7 @@ int amiga_partition(struct parsed_partitions *state)
         }
         blk = be32_to_cpu(rdb->rdb_PartitionList);
         put_dev_sector(sect);
-       for (part = 1; blk>0 && part<=16; part++, put_dev_sector(sect)) {
+       for (part = 1; (s32) blk>0 && part<=16; part++, 
put_dev_sector(sect)) {
                 /* Read in terms partition table understands */
                 if (check_mul_overflow(blk, (sector_t) blksize, &blk)) {
                         pr_err("Dev %s: overflow calculating partition 
block %llu! Skipping partitions %u and beyond\n",

Cheers,

     Michael

>
> Thanks,
> Christian
>
> [1] http://wiki.amiga.org/index.php?title=X5000
> [2] https://en.wikipedia.org/wiki/AmigaOne_X1000
> [3] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a0433f8cae3ac51f59b4b1863032822aaa2d8164
> [4] revert_amiga.c.patch:
>
> --- a/block/partitions/amiga.c    2023-06-29 04:29:22.947100347 +0200
> +++ b/block/partitions/amiga.c    2023-06-26 01:29:58.000000000 +0200
> @@ -11,18 +11,10 @@
>  #define pr_fmt(fmt) fmt
>
>  #include <linux/types.h>
> -#include <linux/mm_types.h>
> -#include <linux/overflow.h>
>  #include <linux/affs_hardblocks.h>
>
>  #include "check.h"
>
> -/* magic offsets in partition DosEnvVec */
> -#define NR_HD    3
> -#define NR_SECT    5
> -#define LO_CYL    9
> -#define HI_CYL    10
> -
>  static __inline__ u32
>  checksum_block(__be32 *m, int size)
>  {
> @@ -39,12 +31,8 @@ int amiga_partition(struct parsed_partit
>      unsigned char *data;
>      struct RigidDiskBlock *rdb;
>      struct PartitionBlock *pb;
> -    u64 start_sect, nr_sects;
> -    sector_t blk, end_sect;
> -    u32 cylblk;        /* rdb_CylBlocks = nr_heads*sect_per_track */
> -    u32 nr_hd, nr_sect, lo_cyl, hi_cyl;
> -    int part, res = 0;
> -    unsigned int blksize = 1;    /* Multiplier for disk block size */
> +    int start_sect, nr_sects, blk, part, res = 0;
> +    int blksize = 1;    /* Multiplier for disk block size */
>      int slot = 1;
>
>      for (blk = 0; ; blk++, put_dev_sector(sect)) {
> @@ -52,7 +40,7 @@ int amiga_partition(struct parsed_partit
>              goto rdb_done;
>          data = read_part_sector(state, blk, &sect);
>          if (!data) {
> -            pr_err("Dev %s: unable to read RDB block %llu\n",
> +            pr_err("Dev %s: unable to read RDB block %d\n",
>                     state->disk->disk_name, blk);
>              res = -1;
>              goto rdb_done;
> @@ -69,12 +57,12 @@ int amiga_partition(struct parsed_partit
>          *(__be32 *)(data+0xdc) = 0;
>          if (checksum_block((__be32 *)data,
>                  be32_to_cpu(rdb->rdb_SummedLongs) & 0x7F)==0) {
> -            pr_err("Trashed word at 0xd0 in block %llu ignored in 
> checksum calculation\n",
> +            pr_err("Trashed word at 0xd0 in block %d ignored in 
> checksum calculation\n",
>                     blk);
>              break;
>          }
>
> -        pr_err("Dev %s: RDB in block %llu has bad checksum\n",
> +        pr_err("Dev %s: RDB in block %d has bad checksum\n",
>                 state->disk->disk_name, blk);
>      }
>
> @@ -91,15 +79,10 @@ int amiga_partition(struct parsed_partit
>      blk = be32_to_cpu(rdb->rdb_PartitionList);
>      put_dev_sector(sect);
>      for (part = 1; blk>0 && part<=16; part++, put_dev_sector(sect)) {
> -        /* Read in terms partition table understands */
> -        if (check_mul_overflow(blk, (sector_t) blksize, &blk)) {
> -            pr_err("Dev %s: overflow calculating partition block 
> %llu! Skipping partitions %u and beyond\n",
> -                state->disk->disk_name, blk, part);
> -            break;
> -        }
> +        blk *= blksize;    /* Read in terms partition table 
> understands */
>          data = read_part_sector(state, blk, &sect);
>          if (!data) {
> -            pr_err("Dev %s: unable to read partition block %llu\n",
> +            pr_err("Dev %s: unable to read partition block %d\n",
>                     state->disk->disk_name, blk);
>              res = -1;
>              goto rdb_done;
> @@ -111,70 +94,19 @@ int amiga_partition(struct parsed_partit
>          if (checksum_block((__be32 *)pb, 
> be32_to_cpu(pb->pb_SummedLongs) & 0x7F) != 0 )
>              continue;
>
> -        /* RDB gives us more than enough rope to hang ourselves with,
> -         * many times over (2^128 bytes if all fields max out).
> -         * Some careful checks are in order, so check for potential
> -         * overflows.
> -         * We are multiplying four 32 bit numbers to one sector_t!
> -         */
> -
> -        nr_hd   = be32_to_cpu(pb->pb_Environment[NR_HD]);
> -        nr_sect = be32_to_cpu(pb->pb_Environment[NR_SECT]);
> -
> -        /* CylBlocks is total number of blocks per cylinder */
> -        if (check_mul_overflow(nr_hd, nr_sect, &cylblk)) {
> -            pr_err("Dev %s: heads*sects %u overflows u32, skipping 
> partition!\n",
> -                state->disk->disk_name, cylblk);
> -            continue;
> -        }
> -
> -        /* check for consistency with RDB defined CylBlocks */
> -        if (cylblk > be32_to_cpu(rdb->rdb_CylBlocks)) {
> -            pr_warn("Dev %s: cylblk %u > rdb_CylBlocks %u!\n",
> -                state->disk->disk_name, cylblk,
> -                be32_to_cpu(rdb->rdb_CylBlocks));
> -        }
> -
> -        /* RDB allows for variable logical block size -
> -         * normalize to 512 byte blocks and check result.
> -         */
> -
> -        if (check_mul_overflow(cylblk, blksize, &cylblk)) {
> -            pr_err("Dev %s: partition %u bytes per cyl. overflows 
> u32, skipping partition!\n",
> -                state->disk->disk_name, part);
> -            continue;
> -        }
> -
> -        /* Calculate partition start and end. Limit of 32 bit on cylblk
> -         * guarantees no overflow occurs if LBD support is enabled.
> -         */
> -
> -        lo_cyl = be32_to_cpu(pb->pb_Environment[LO_CYL]);
> -        start_sect = ((u64) lo_cyl * cylblk);
> -
> -        hi_cyl = be32_to_cpu(pb->pb_Environment[HI_CYL]);
> -        nr_sects = (((u64) hi_cyl - lo_cyl + 1) * cylblk);
> +        /* Tell Kernel about it */
>
> +        nr_sects = (be32_to_cpu(pb->pb_Environment[10]) + 1 -
> +                be32_to_cpu(pb->pb_Environment[9])) *
> +               be32_to_cpu(pb->pb_Environment[3]) *
> +               be32_to_cpu(pb->pb_Environment[5]) *
> +               blksize;
>          if (!nr_sects)
>              continue;
> -
> -        /* Warn user if partition end overflows u32 (AmigaDOS limit) */
> -
> -        if ((start_sect + nr_sects) > UINT_MAX) {
> -            pr_warn("Dev %s: partition %u (%llu-%llu) needs 64 bit 
> device support!\n",
> -                state->disk->disk_name, part,
> -                start_sect, start_sect + nr_sects);
> -        }
> -
> -        if (check_add_overflow(start_sect, nr_sects, &end_sect)) {
> -            pr_err("Dev %s: partition %u (%llu-%llu) needs LBD device 
> support, skipping partition!\n",
> -                state->disk->disk_name, part,
> -                start_sect, end_sect);
> -            continue;
> -        }
> -
> -        /* Tell Kernel about it */
> -
> +        start_sect = be32_to_cpu(pb->pb_Environment[9]) *
> +                 be32_to_cpu(pb->pb_Environment[3]) *
> +                 be32_to_cpu(pb->pb_Environment[5]) *
> +                 blksize;
>          put_partition(state,slot++,start_sect,nr_sects);
>          {
>              /* Be even more informative to aid mounting */
>
>
>
