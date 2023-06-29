Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF8D741F78
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 07:05:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=I6UqEue6;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=SQYiCnb9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qs5xv54LVz3bhp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 15:05:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=I6UqEue6;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=SQYiCnb9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 348 seconds by postgrey-1.37 at boromir; Thu, 29 Jun 2023 15:05:04 AEST
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qs5ww5G29z2ynD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 15:05:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1688014741; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=amzY21NZg26lsUWxpbbWvcushQKuhl/kgsVcFgxI4zokpj8zRQdlbOGInlqIXzPr8e
    OYDP8la/cwS2K6yUzboPpRcl5xNUty1Z3e+1WtH5C6Tt3SBm4xOVVe3GbfKJdmXS1bMy
    6y1WgKRgQt8d6YMdbF59hQ7UEWYaT1OqQq90SYjbZp2Yz1m4GczNE0GiVm6RMhA7q3sj
    izEPYTA3smNAaEEyHJp+rzP3OTQ3XaLLvjcIyL211LTcNPlxCyzeh5tCSH/eHGzfCJ67
    i8nYcmIQOFT9WJMvy09iX9wK+ztf2rejvke4XgGLMlH+PJHROmNoturFVN7lV7Hz/SCE
    smlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1688014741;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:From:Cc:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=+7c6Cd18dRPSY9T1tbPIe2oEVQE8kMzaSrsxr6FZTcE=;
    b=gMyuYyjJRgqbILooH4iTf3REIhTASx7Kj6R7/a+aEgSRUjSSPF05XHvuhnSXfdpSce
    nK98ncwKzhxXVZ6Exh+Q09elevGGq0GhIpjr3Ni8O0hRRC56IOhEXR5ujU63lv2aDjnU
    l4NheTaWLgRMqvqHYPu9Kmdy8bljzFNWhZwKRu2YAdYHOXoJ+mnLg8Z707Ple7GBhILl
    IhHLk4UntaqUjKeZkLusaXpKvwARuQHiyG7xB/BQuMBeXS3jjGHSWCRtEm6si6x3Iwam
    KPGZaXj2bM635NKEJPhu3Meg9b3ex4eMPrjcxqU3KRA2Mb0cYwRw+R6P0nPoTUYcUVvh
    Wd6w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1688014741;
    s=strato-dkim-0002; d=xenosoft.de;
    h=Subject:From:Cc:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=+7c6Cd18dRPSY9T1tbPIe2oEVQE8kMzaSrsxr6FZTcE=;
    b=I6UqEue6rqNL0FdQFFgQ4KU9k5DzcK4IY9lxJ7Lf+GFz2GihU0I2HYk05TpOdrTCgJ
    w0KssJBeQb405PqvnjZuwwhhDx1O+3Yj9NCGrOjyUZ1Wn52xsMnnhDDcE17sJnfQG70v
    LmY5g58GzQM+QTEBDHiGT2OaUbav23/RhmtqBxjr7w6z70I25t+PwNnyeBqG2P18bspm
    4uVJkE8mE4eDIEATrtOKtRNNc3sUokFjKJ4NbLDEI6pEvRPpFhkIqFCK5UY4MULTCNkY
    Gf5JnJul9NHECOenpfZ7gQL8qS9ndSLc91TgCiHh66SSORMzA5pD4Ughg+ft2C5C5lpz
    6kCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1688014741;
    s=strato-dkim-0003; d=xenosoft.de;
    h=Subject:From:Cc:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=+7c6Cd18dRPSY9T1tbPIe2oEVQE8kMzaSrsxr6FZTcE=;
    b=SQYiCnb92CJ1SziwXDusRlAzzm2Xh0CEhZM3Hvjo1h1EtZfNRJOkA5/GX7cm310n5w
    KCbJGIu9IyLLzT/5A6Bw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwiA6YFcQgU5MFYhNcGi40kecMvJRQ=="
Received: from [IPV6:2a02:8109:8980:4474:e043:b28b:9d80:cfa4]
    by smtp.strato.de (RZmta 49.6.0 AUTH)
    with ESMTPSA id N28a51z5T4x0krw
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 29 Jun 2023 06:59:00 +0200 (CEST)
Message-ID: <024ce4fa-cc6d-50a2-9aae-3701d0ebf668@xenosoft.de>
Date: Thu, 29 Jun 2023 06:59:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Content-Language: de-DE
To: schmitzmic@gmail.com
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [FSL P50x0] [PASEMI] The Access to partitions on disks with an Amiga
 partition table doesn't work anymore after the block updates 2023-06-23
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
Cc: axboe@kernel.dk, linux-m68k@vger.kernel.org, Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, linux-block@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, "R.T.Dickinson" <rtd2@xtra.co.nz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

The access  to partitions on disks with an Amiga partition table (via 
the Rigid Disk Block RDB) doesn't work anymore on my Cyrus+ board with a 
FSL P50x0 PowerPC SoC [1] and on my P.A. Semi Nemo board [2] after the 
block updates 2023-06-23 [3].

parted -l

Model: ATA ST2000DM001-9YN1 (scsi)
Disk /dev/sda: 2000GB
Sector size (logical/physical): 512B/4096B
Partition Table: amiga
Disk Flags:

Number  Start   End     Size    File system  Name  Flags
  1      1057kB  123MB   122MB   affs7        BDH0  hidden
  2      123MB   2274MB  2150MB               DH0   boot
  3      2274MB  691GB   689GB                DH2
  4      691GB   1992GB  1301GB  ext4         dhx   boot

dmesg | grep -i sda

[    4.208905] sd 0:0:0:0: [sda] 3907029168 512-byte logical blocks: 
(2.00 TB/1.82 TiB)
[    4.253995] sd 0:0:0:0: [sda] 4096-byte physical blocks
[    4.254826] sd 0:0:0:0: [sda] Write Protect is off
[    4.300069] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    4.486476] sd 0:0:0:0: [sda] Write cache: enabled, read cache: 
enabled, doesn't support DPO or FUA
[    4.580507] sd 0:0:0:0: [sda] Preferred minimum I/O size 4096 bytes
[    4.712624] Dev sda: unable to read partition block 4294967295
[    4.761532]  sda: RDSK (512) sda1 (DOS^G)(res 2 spb 2) sda2 
(SFS^B)(res 2 spb 1) sda3 (SFS^B)(res 2 spb 2) sda4 ((res 2 spb 1) 
unable to read partition table
[    4.761892] sda: partition table beyond EOD,
[    4.861681] Dev sda: unable to read partition block 4294967295
[    4.912094]  sda: RDSK (512) sda1 (DOS^G)(res 2 spb 2) sda2 
(SFS^B)(res 2 spb 1) sda3 (SFS^B)(res 2 spb 2) sda4 ((res 2 spb 1) 
unable to read partition table
[    4.963387] sda: partition table beyond EOD,
[    5.014769] sd 0:0:0:0: [sda] Attached SCSI disk

I created a patch for reverting the commit. [4]

The access works again with this patch:

[    0.000000] Kernel command line: root=/dev/sda4
[    3.987717] sd 0:0:0:0: [sda] 3907029168 512-byte logical blocks: 
(2.00 TB/1.82 TiB)
[    4.031349] sd 0:0:0:0: [sda] 4096-byte physical blocks
[    4.123773] sd 0:0:0:0: [sda] Write Protect is off
[    4.168682] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    4.279304] sd 0:0:0:0: [sda] Write cache: enabled, read cache: 
enabled, doesn't support DPO or FUA
[    4.463508] sd 0:0:0:0: [sda] Preferred minimum I/O size 4096 bytes
[    4.519477]  sda: RDSK (512) sda1 (DOS^G)(res 2 spb 2) sda2 
(SFS^B)(res 2 spb 1) sda3 (SFS^B)(res 2 spb 2) sda4 ((res 2 spb 1)
[    4.720896] sda: p4 size 18446744071956107760 extends beyond EOD,
[    4.922550]  sda: RDSK (512) sda1 (DOS^G)(res 2 spb 2) sda2 
(SFS^B)(res 2 spb 1) sda3 (SFS^B)(res 2 spb 2) sda4 ((res 2 spb 1)
[    4.948655] sda: p4 size 18446744071956107760 extends beyond EOD, 
truncated
[    4.998956] sd 0:0:0:0: [sda] Attached SCSI disk
[    8.394695] EXT4-fs (sda4): mounted filesystem 
93cb7dd2-ce1b-4bf5-ba47-818cf8e8c9f4 ro with ordered data mode. Quota 
mode: none.
[   18.578020] EXT4-fs (sda4): re-mounted 
93cb7dd2-ce1b-4bf5-ba47-818cf8e8c9f4 ro. Quota mode: none.
[   23.159524] EXT4-fs (sda4): re-mounted 
93cb7dd2-ce1b-4bf5-ba47-818cf8e8c9f4 r/w. Quota mode: none.

Could you please check your commit?

Thanks,
Christian

[1] http://wiki.amiga.org/index.php?title=X5000
[2] https://en.wikipedia.org/wiki/AmigaOne_X1000
[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a0433f8cae3ac51f59b4b1863032822aaa2d8164
[4] revert_amiga.c.patch:

--- a/block/partitions/amiga.c    2023-06-29 04:29:22.947100347 +0200
+++ b/block/partitions/amiga.c    2023-06-26 01:29:58.000000000 +0200
@@ -11,18 +11,10 @@
  #define pr_fmt(fmt) fmt

  #include <linux/types.h>
-#include <linux/mm_types.h>
-#include <linux/overflow.h>
  #include <linux/affs_hardblocks.h>

  #include "check.h"

-/* magic offsets in partition DosEnvVec */
-#define NR_HD    3
-#define NR_SECT    5
-#define LO_CYL    9
-#define HI_CYL    10
-
  static __inline__ u32
  checksum_block(__be32 *m, int size)
  {
@@ -39,12 +31,8 @@ int amiga_partition(struct parsed_partit
      unsigned char *data;
      struct RigidDiskBlock *rdb;
      struct PartitionBlock *pb;
-    u64 start_sect, nr_sects;
-    sector_t blk, end_sect;
-    u32 cylblk;        /* rdb_CylBlocks = nr_heads*sect_per_track */
-    u32 nr_hd, nr_sect, lo_cyl, hi_cyl;
-    int part, res = 0;
-    unsigned int blksize = 1;    /* Multiplier for disk block size */
+    int start_sect, nr_sects, blk, part, res = 0;
+    int blksize = 1;    /* Multiplier for disk block size */
      int slot = 1;

      for (blk = 0; ; blk++, put_dev_sector(sect)) {
@@ -52,7 +40,7 @@ int amiga_partition(struct parsed_partit
              goto rdb_done;
          data = read_part_sector(state, blk, &sect);
          if (!data) {
-            pr_err("Dev %s: unable to read RDB block %llu\n",
+            pr_err("Dev %s: unable to read RDB block %d\n",
                     state->disk->disk_name, blk);
              res = -1;
              goto rdb_done;
@@ -69,12 +57,12 @@ int amiga_partition(struct parsed_partit
          *(__be32 *)(data+0xdc) = 0;
          if (checksum_block((__be32 *)data,
                  be32_to_cpu(rdb->rdb_SummedLongs) & 0x7F)==0) {
-            pr_err("Trashed word at 0xd0 in block %llu ignored in 
checksum calculation\n",
+            pr_err("Trashed word at 0xd0 in block %d ignored in 
checksum calculation\n",
                     blk);
              break;
          }

-        pr_err("Dev %s: RDB in block %llu has bad checksum\n",
+        pr_err("Dev %s: RDB in block %d has bad checksum\n",
                 state->disk->disk_name, blk);
      }

@@ -91,15 +79,10 @@ int amiga_partition(struct parsed_partit
      blk = be32_to_cpu(rdb->rdb_PartitionList);
      put_dev_sector(sect);
      for (part = 1; blk>0 && part<=16; part++, put_dev_sector(sect)) {
-        /* Read in terms partition table understands */
-        if (check_mul_overflow(blk, (sector_t) blksize, &blk)) {
-            pr_err("Dev %s: overflow calculating partition block %llu! 
Skipping partitions %u and beyond\n",
-                state->disk->disk_name, blk, part);
-            break;
-        }
+        blk *= blksize;    /* Read in terms partition table understands */
          data = read_part_sector(state, blk, &sect);
          if (!data) {
-            pr_err("Dev %s: unable to read partition block %llu\n",
+            pr_err("Dev %s: unable to read partition block %d\n",
                     state->disk->disk_name, blk);
              res = -1;
              goto rdb_done;
@@ -111,70 +94,19 @@ int amiga_partition(struct parsed_partit
          if (checksum_block((__be32 *)pb, 
be32_to_cpu(pb->pb_SummedLongs) & 0x7F) != 0 )
              continue;

-        /* RDB gives us more than enough rope to hang ourselves with,
-         * many times over (2^128 bytes if all fields max out).
-         * Some careful checks are in order, so check for potential
-         * overflows.
-         * We are multiplying four 32 bit numbers to one sector_t!
-         */
-
-        nr_hd   = be32_to_cpu(pb->pb_Environment[NR_HD]);
-        nr_sect = be32_to_cpu(pb->pb_Environment[NR_SECT]);
-
-        /* CylBlocks is total number of blocks per cylinder */
-        if (check_mul_overflow(nr_hd, nr_sect, &cylblk)) {
-            pr_err("Dev %s: heads*sects %u overflows u32, skipping 
partition!\n",
-                state->disk->disk_name, cylblk);
-            continue;
-        }
-
-        /* check for consistency with RDB defined CylBlocks */
-        if (cylblk > be32_to_cpu(rdb->rdb_CylBlocks)) {
-            pr_warn("Dev %s: cylblk %u > rdb_CylBlocks %u!\n",
-                state->disk->disk_name, cylblk,
-                be32_to_cpu(rdb->rdb_CylBlocks));
-        }
-
-        /* RDB allows for variable logical block size -
-         * normalize to 512 byte blocks and check result.
-         */
-
-        if (check_mul_overflow(cylblk, blksize, &cylblk)) {
-            pr_err("Dev %s: partition %u bytes per cyl. overflows u32, 
skipping partition!\n",
-                state->disk->disk_name, part);
-            continue;
-        }
-
-        /* Calculate partition start and end. Limit of 32 bit on cylblk
-         * guarantees no overflow occurs if LBD support is enabled.
-         */
-
-        lo_cyl = be32_to_cpu(pb->pb_Environment[LO_CYL]);
-        start_sect = ((u64) lo_cyl * cylblk);
-
-        hi_cyl = be32_to_cpu(pb->pb_Environment[HI_CYL]);
-        nr_sects = (((u64) hi_cyl - lo_cyl + 1) * cylblk);
+        /* Tell Kernel about it */

+        nr_sects = (be32_to_cpu(pb->pb_Environment[10]) + 1 -
+                be32_to_cpu(pb->pb_Environment[9])) *
+               be32_to_cpu(pb->pb_Environment[3]) *
+               be32_to_cpu(pb->pb_Environment[5]) *
+               blksize;
          if (!nr_sects)
              continue;
-
-        /* Warn user if partition end overflows u32 (AmigaDOS limit) */
-
-        if ((start_sect + nr_sects) > UINT_MAX) {
-            pr_warn("Dev %s: partition %u (%llu-%llu) needs 64 bit 
device support!\n",
-                state->disk->disk_name, part,
-                start_sect, start_sect + nr_sects);
-        }
-
-        if (check_add_overflow(start_sect, nr_sects, &end_sect)) {
-            pr_err("Dev %s: partition %u (%llu-%llu) needs LBD device 
support, skipping partition!\n",
-                state->disk->disk_name, part,
-                start_sect, end_sect);
-            continue;
-        }
-
-        /* Tell Kernel about it */
-
+        start_sect = be32_to_cpu(pb->pb_Environment[9]) *
+                 be32_to_cpu(pb->pb_Environment[3]) *
+                 be32_to_cpu(pb->pb_Environment[5]) *
+                 blksize;
          put_partition(state,slot++,start_sect,nr_sects);
          {
              /* Be even more informative to aid mounting */



