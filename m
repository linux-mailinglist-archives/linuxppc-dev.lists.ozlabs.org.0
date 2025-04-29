Return-Path: <linuxppc-dev+bounces-8143-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B6EAA0CD1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 15:06:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zn0vF0yrQz30HB;
	Tue, 29 Apr 2025 23:06:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745931993;
	cv=none; b=U5Yuk9rtucleQ9gkee6K9jxjy+MtAfgDMhPbB2heWCMDxMlx6XXHqNWYqHuB7AsgGAD5mZ2/oFUoA2fBybvIRj0iv8QUR3VyKFQPzqtzNwQwq3OB/fwnypWR37EXZBr28WJcQeCX2U8kuqZlDcGny/pbW8r2Q1j+0Tdwbsqi6QiECHUU+ndgf+TXlj52daiVMx3572ekCDeJeU/qsU2FW4498S07UJNgSi01E6hiMw3xVS+2ar1v6aq3OYOjLg/YUJICzm0/t1B0+PKglp+oOyeXaBWCpvOKGVQz8w6dG9onhBWKNlRWkz1jdmIROcZ1+4uILRnZXWWfHhKd1/smQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745931993; c=relaxed/relaxed;
	bh=OdG+uJn35KXoaRT30bCvJ3pkgyy1tJjE5mSxhFyE3SA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BA7HC+cj9q7W9SbqUVoeoXT/EnLNDIQJ189gYOa2wN6pFtP8C7AekF5V/fdFslaMsBjU0A97yjFHK2PKE7dGCR2DdjDzJTbHuR0rf0cN4LDs31g25w4HszxLVYYVWET18dUDR26SgDbVlGuEYdFehfZmSc3g5W6Gr5+IpHxU811FZJrWy74Lud00Rnhf6g9LJfqzjUfwnzJX+aIEnXQY6cVP7K0lMesMPfpRvMC/kwa9wBPN6JhgdP8QMQlRy8KkvTbgg8lA531H+P5AZWMhePZhI2FyATGuctQjkREXxKOtuq/VCIDxJ4L8rBukMc9uxzpF14TLbk2JjtClqFYPcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mAGZYU34; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mAGZYU34;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zn0vB0cwQz2yYf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 23:06:29 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so6114063b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 06:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745931987; x=1746536787; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OdG+uJn35KXoaRT30bCvJ3pkgyy1tJjE5mSxhFyE3SA=;
        b=mAGZYU34MxWBaEYnyikFp3AI9mJ45Z2xOiyYPRfGhTuFY9b1ydoGpdBeaXItBfvRRz
         fMYfXVCHjafqAmc22DgyZ9seFb3qt8JJh/ItxUekjZA9+gZdZTFLCCxewxlLbhFPoWhe
         ziC/EmutYTb+IyBSoTUKCQYZto6q/ZMQZJ9RfCdHTzqHzMzMG8HdQDcU4hNVai6t7vPq
         sagJh4dmytYQvoAohXpmSE9JJhLE0iDWMaM1vaZZxQO2c3g7NyjUyt2G2zpkboOEQ2AV
         s1bTN66uN7EouyYkEIWt26DMx/4HXNjOUNQ9EKiwc5TudQM/p1C7xK8+53PQQBGXn/r1
         0wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745931987; x=1746536787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OdG+uJn35KXoaRT30bCvJ3pkgyy1tJjE5mSxhFyE3SA=;
        b=nonY6oALBkMWepGT1J+ETcV76xz4Dnc053/W9alveydMUeIk9DeJnEVVgT05ozbeqd
         Nmkg/8ZMrWa/Im6/3PIN6oLs2hkWZ2mdRKo+bO5VGYLTuDs9dL1N1SxTGXHw4GV86/eo
         5B8VX92BDXd0I6qfiDGl4YdtEvhFGhZ18pd7G8UMFg61dD7EjFCbNM8gpah04lr2mWV4
         9hTC++dawIoOsXiazO2oAGY/CkDsDwMafsVzQrb9WQz1gqVpu6Ua/R49JFz0OeQhw1CX
         I62vVfRaIswKDPXl3y/6kJoJ01Su2g9L9/jh3WadZQXqClKC3ElBNfIF4MpF6w5Iydk9
         rc0g==
X-Forwarded-Encrypted: i=1; AJvYcCWM8LUoIMiQKTQVDSts6QU/XoIKC6DX7Be2sNqxI90jQSVUd9oeJs4bgs97/fvKOFo41+K0jdIWRyK3CYU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxYFycJyhYXmzeoQuT/kkKYh39SD9l7tMs0nW8U8bod282SGpwH
	kmDysL40TbaxVNZvrzHCPAa+QO+s73ca50Zm3qZwamWoujEAasUw
X-Gm-Gg: ASbGncvivy7vPgauhIhpDIaKP1ysXTIkbznYfwsBSyjzrUQUuhnXAtMM98HPVOc7zqJ
	8D3yHNequz4pUXSHX/6lqfIXmP2BLxtq/ikOib1jzH0oExHHfwh/W4eKi06gcCucKR0XcT4NiD5
	ZPTBsqF3QtlXRiSw4aCG8WS4ngo1N/ZE1bCAnkTiymKRsbAbNZzkVZ8T/+EVvV6N+yQg6ZsS54Y
	2jSNy5MmOqqcaiJic3ObUylaBFmbSj+EPGSlMmdskNNeGdxS5tzfFTFiAN80yNqts5jL4YasCI6
	GMF6Q+jzz4O18d49LXane9zrykoXlxmzmvS3KVdv
X-Google-Smtp-Source: AGHT+IFIUzwIDRl2/BRfyDH0Pu0ArLIMrdubH5uB8lAwvoffJw6VvHnOOlhC9Yw9eusLbTZHOgA5Og==
X-Received: by 2002:a05:6a00:170a:b0:736:9f2e:1357 with SMTP id d2e1a72fcca58-74028a8da91mr4089362b3a.12.1745931986372;
        Tue, 29 Apr 2025 06:06:26 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e2593f46fsm9743268b3a.44.2025.04.29.06.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 06:06:25 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id F2926420A69B; Tue, 29 Apr 2025 20:06:20 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Richard Cochran <richardcochran@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Vamsi Attunuru <vattunuru@marvell.com>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	Alyssa Ross <hi@alyssa.is>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] Documentation: ioctl-number: Extend "Include File" column width
Date: Tue, 29 Apr 2025 20:05:25 +0700
Message-ID: <20250429130524.33587-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=53533; i=bagasdotme@gmail.com; h=from:subject; bh=RpHm/Im5/OUXHCitazIu/rCYqmt3r2Xz2D0CA0FD7Z8=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkCZ/d5bdl1Ia346C3biVWik5WDz7q+2sS0W8Jk8pFVu fIidTMVO0pZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjCRGQYMPxn9qiz034UxapzV CQ+/tVly36Gp047dsGbUdeq6erZ9WwIjw5Sshq86Jw1/KFpv+KnVdrNrWdWcVQExzJOe8WsYWgi Z8gEA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_SBL_A autolearn=disabled version=4.0.1
	OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Stephen Rothwell reports htmldocs warning when merging powerpc tree for
linux-next:

Documentation/userspace-api/ioctl/ioctl-number.rst:369: ERROR: Malformed table.
Text in column margin in table line 301.

====  =====  ======================================================= ================================================================
Code  Seq#    Include File                                           Comments
      (hex)
====  =====  ======================================================= ================================================================
	.
	.
	.
0xB2  03-05 arch/powerpc/include/uapi/asm/papr-indices.h             powerpc/pseries indices API
                                                                     <mailto:linuxppc-dev>
0xB2  06-07 arch/powerpc/include/uapi/asm/papr-platform-dump.h       powerpc/pseries Platform Dump API
                                                                     <mailto:linuxppc-dev>
0xB2  08  arch/powerpc/include/uapi/asm/papr-physical-attestation.h  powerpc/pseries Physical Attestation API
                                                                     <mailto:linuxppc-dev>
	.
	.
	.
====  =====  ======================================================= ================================================================ [docutils]

That's because arch/powerpc/include/uapi/asm/papr-physical-attestation.h
now occupies the widest "Include File" column entry in ioctl number
table. In addition, the other papr-*.h entries in the same column aren't
sufficiently padded to align to the rest of column. As such, the table
is skipped in resulting htmldocs output.

Fix the warning by extending "Include File" column so that the
widest entry can fit, and by aligning the other papr-*.h entries. While
at it, also fix mailto: links to linuxppc-dev mailing list.

Fixes: 43d869ac25f1 ("powerpc/pseries: Define papr_indices_io_block for papr-indices ioctls")
Fixes: 8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character driver for dump retrieval")
Fixes: 86900ab620a4 ("powerpc/pseries: Add a char driver for physical-attestation RTAS")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20250429181707.7848912b@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 .../userspace-api/ioctl/ioctl-number.rst      | 512 +++++++++---------
 1 file changed, 256 insertions(+), 256 deletions(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 017a23aeadc329..b725186670a1d8 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -66,343 +66,343 @@ This table lists ioctls visible from user land for Linux/x86.  It contains
 most drivers up to 2.6.31, but I know I am missing some.  There has been
 no attempt to list non-X86 architectures or ioctls from drivers/staging/.
 
-====  =====  ======================================================= ================================================================
-Code  Seq#    Include File                                           Comments
+====  =====  =========================================================  ================================================================
+Code  Seq#    Include File                                              Comments
       (hex)
-====  =====  ======================================================= ================================================================
-0x00  00-1F  linux/fs.h                                              conflict!
-0x00  00-1F  scsi/scsi_ioctl.h                                       conflict!
-0x00  00-1F  linux/fb.h                                              conflict!
-0x00  00-1F  linux/wavefront.h                                       conflict!
+====  =====  =========================================================  ================================================================
+0x00  00-1F  linux/fs.h                                                 conflict!
+0x00  00-1F  scsi/scsi_ioctl.h                                          conflict!
+0x00  00-1F  linux/fb.h                                                 conflict!
+0x00  00-1F  linux/wavefront.h                                          conflict!
 0x02  all    linux/fd.h
 0x03  all    linux/hdreg.h
-0x04  D2-DC  linux/umsdos_fs.h                                       Dead since 2.6.11, but don't reuse these.
+0x04  D2-DC  linux/umsdos_fs.h                                          Dead since 2.6.11, but don't reuse these.
 0x06  all    linux/lp.h
 0x07  9F-D0  linux/vmw_vmci_defs.h, uapi/linux/vm_sockets.h
 0x09  all    linux/raid/md_u.h
 0x10  00-0F  drivers/char/s390/vmcp.h
 0x10  10-1F  arch/s390/include/uapi/sclp_ctl.h
 0x10  20-2F  arch/s390/include/uapi/asm/hypfs.h
-0x12  all    linux/fs.h                                              BLK* ioctls
+0x12  all    linux/fs.h                                                 BLK* ioctls
              linux/blkpg.h
              linux/blkzoned.h
              linux/blk-crypto.h
-0x15  all    linux/fs.h                                              FS_IOC_* ioctls
-0x1b  all                                                            InfiniBand Subsystem
-                                                                     <http://infiniband.sourceforge.net/>
+0x15  all    linux/fs.h                                                 FS_IOC_* ioctls
+0x1b  all                                                               InfiniBand Subsystem
+                                                                        <http://infiniband.sourceforge.net/>
 0x20  all    drivers/cdrom/cm206.h
 0x22  all    scsi/sg.h
-0x3E  00-0F  linux/counter.h                                         <mailto:linux-iio@vger.kernel.org>
+0x3E  00-0F  linux/counter.h                                            <mailto:linux-iio@vger.kernel.org>
 '!'   00-1F  uapi/linux/seccomp.h
-'#'   00-3F                                                          IEEE 1394 Subsystem
-                                                                     Block for the entire subsystem
+'#'   00-3F                                                             IEEE 1394 Subsystem
+                                                                        Block for the entire subsystem
 '$'   00-0F  linux/perf_counter.h, linux/perf_event.h
-'%'   00-0F  include/uapi/linux/stm.h                                System Trace Module subsystem
-                                                                     <mailto:alexander.shishkin@linux.intel.com>
+'%'   00-0F  include/uapi/linux/stm.h                                   System Trace Module subsystem
+                                                                        <mailto:alexander.shishkin@linux.intel.com>
 '&'   00-07  drivers/firewire/nosy-user.h
-'*'   00-1F  uapi/linux/user_events.h                                User Events Subsystem
-                                                                     <mailto:linux-trace-kernel@vger.kernel.org>
-'1'   00-1F  linux/timepps.h                                         PPS kit from Ulrich Windl
-                                                                     <ftp://ftp.de.kernel.org/pub/linux/daemons/ntp/PPS/>
+'*'   00-1F  uapi/linux/user_events.h                                   User Events Subsystem
+                                                                        <mailto:linux-trace-kernel@vger.kernel.org>
+'1'   00-1F  linux/timepps.h                                            PPS kit from Ulrich Windl
+                                                                        <ftp://ftp.de.kernel.org/pub/linux/daemons/ntp/PPS/>
 '2'   01-04  linux/i2o.h
-'3'   00-0F  drivers/s390/char/raw3270.h                             conflict!
-'3'   00-1F  linux/suspend_ioctls.h,                                 conflict!
+'3'   00-0F  drivers/s390/char/raw3270.h                                conflict!
+'3'   00-1F  linux/suspend_ioctls.h,                                    conflict!
              kernel/power/user.c
-'8'   all                                                            SNP8023 advanced NIC card
-                                                                     <mailto:mcr@solidum.com>
+'8'   all                                                               SNP8023 advanced NIC card
+                                                                        <mailto:mcr@solidum.com>
 ';'   64-7F  linux/vfio.h
 ';'   80-FF  linux/iommufd.h
-'='   00-3f  uapi/linux/ptp_clock.h                                  <mailto:richardcochran@gmail.com>
-'@'   00-0F  linux/radeonfb.h                                        conflict!
-'@'   00-0F  drivers/video/aty/aty128fb.c                            conflict!
-'A'   00-1F  linux/apm_bios.h                                        conflict!
-'A'   00-0F  linux/agpgart.h,                                        conflict!
+'='   00-3f  uapi/linux/ptp_clock.h                                     <mailto:richardcochran@gmail.com>
+'@'   00-0F  linux/radeonfb.h                                           conflict!
+'@'   00-0F  drivers/video/aty/aty128fb.c                               conflict!
+'A'   00-1F  linux/apm_bios.h                                           conflict!
+'A'   00-0F  linux/agpgart.h,                                           conflict!
              drivers/char/agp/compat_ioctl.h
-'A'   00-7F  sound/asound.h                                          conflict!
-'B'   00-1F  linux/cciss_ioctl.h                                     conflict!
-'B'   00-0F  include/linux/pmu.h                                     conflict!
-'B'   C0-FF  advanced bbus                                           <mailto:maassen@uni-freiburg.de>
-'B'   00-0F  xen/xenbus_dev.h                                        conflict!
-'C'   all    linux/soundcard.h                                       conflict!
-'C'   01-2F  linux/capi.h                                            conflict!
-'C'   F0-FF  drivers/net/wan/cosa.h                                  conflict!
+'A'   00-7F  sound/asound.h                                             conflict!
+'B'   00-1F  linux/cciss_ioctl.h                                        conflict!
+'B'   00-0F  include/linux/pmu.h                                        conflict!
+'B'   C0-FF  advanced bbus                                              <mailto:maassen@uni-freiburg.de>
+'B'   00-0F  xen/xenbus_dev.h                                           conflict!
+'C'   all    linux/soundcard.h                                          conflict!
+'C'   01-2F  linux/capi.h                                               conflict!
+'C'   F0-FF  drivers/net/wan/cosa.h                                     conflict!
 'D'   all    arch/s390/include/asm/dasd.h
-'D'   40-5F  drivers/scsi/dpt/dtpi_ioctl.h                           Dead since 2022
+'D'   40-5F  drivers/scsi/dpt/dtpi_ioctl.h                              Dead since 2022
 'D'   05     drivers/scsi/pmcraid.h
-'E'   all    linux/input.h                                           conflict!
-'E'   00-0F  xen/evtchn.h                                            conflict!
-'F'   all    linux/fb.h                                              conflict!
-'F'   01-02  drivers/scsi/pmcraid.h                                  conflict!
-'F'   20     drivers/video/fsl-diu-fb.h                              conflict!
-'F'   20     linux/ivtvfb.h                                          conflict!
-'F'   20     linux/matroxfb.h                                        conflict!
-'F'   20     drivers/video/aty/atyfb_base.c                          conflict!
-'F'   00-0F  video/da8xx-fb.h                                        conflict!
-'F'   80-8F  linux/arcfb.h                                           conflict!
-'F'   DD     video/sstfb.h                                           conflict!
-'G'   00-3F  drivers/misc/sgi-gru/grulib.h                           conflict!
-'G'   00-0F  xen/gntalloc.h, xen/gntdev.h                            conflict!
-'H'   00-7F  linux/hiddev.h                                          conflict!
-'H'   00-0F  linux/hidraw.h                                          conflict!
-'H'   01     linux/mei.h                                             conflict!
-'H'   02     linux/mei.h                                             conflict!
-'H'   03     linux/mei.h                                             conflict!
-'H'   00-0F  sound/asound.h                                          conflict!
-'H'   20-40  sound/asound_fm.h                                       conflict!
-'H'   80-8F  sound/sfnt_info.h                                       conflict!
-'H'   10-8F  sound/emu10k1.h                                         conflict!
-'H'   10-1F  sound/sb16_csp.h                                        conflict!
-'H'   10-1F  sound/hda_hwdep.h                                       conflict!
-'H'   40-4F  sound/hdspm.h                                           conflict!
-'H'   40-4F  sound/hdsp.h                                            conflict!
+'E'   all    linux/input.h                                              conflict!
+'E'   00-0F  xen/evtchn.h                                               conflict!
+'F'   all    linux/fb.h                                                 conflict!
+'F'   01-02  drivers/scsi/pmcraid.h                                     conflict!
+'F'   20     drivers/video/fsl-diu-fb.h                                 conflict!
+'F'   20     linux/ivtvfb.h                                             conflict!
+'F'   20     linux/matroxfb.h                                           conflict!
+'F'   20     drivers/video/aty/atyfb_base.c                             conflict!
+'F'   00-0F  video/da8xx-fb.h                                           conflict!
+'F'   80-8F  linux/arcfb.h                                              conflict!
+'F'   DD     video/sstfb.h                                              conflict!
+'G'   00-3F  drivers/misc/sgi-gru/grulib.h                              conflict!
+'G'   00-0F  xen/gntalloc.h, xen/gntdev.h                               conflict!
+'H'   00-7F  linux/hiddev.h                                             conflict!
+'H'   00-0F  linux/hidraw.h                                             conflict!
+'H'   01     linux/mei.h                                                conflict!
+'H'   02     linux/mei.h                                                conflict!
+'H'   03     linux/mei.h                                                conflict!
+'H'   00-0F  sound/asound.h                                             conflict!
+'H'   20-40  sound/asound_fm.h                                          conflict!
+'H'   80-8F  sound/sfnt_info.h                                          conflict!
+'H'   10-8F  sound/emu10k1.h                                            conflict!
+'H'   10-1F  sound/sb16_csp.h                                           conflict!
+'H'   10-1F  sound/hda_hwdep.h                                          conflict!
+'H'   40-4F  sound/hdspm.h                                              conflict!
+'H'   40-4F  sound/hdsp.h                                               conflict!
 'H'   90     sound/usb/usx2y/usb_stream.h
-'H'   00-0F  uapi/misc/habanalabs.h                                  conflict!
+'H'   00-0F  uapi/misc/habanalabs.h                                     conflict!
 'H'   A0     uapi/linux/usb/cdc-wdm.h
-'H'   C0-F0  net/bluetooth/hci.h                                     conflict!
-'H'   C0-DF  net/bluetooth/hidp/hidp.h                               conflict!
-'H'   C0-DF  net/bluetooth/cmtp/cmtp.h                               conflict!
-'H'   C0-DF  net/bluetooth/bnep/bnep.h                               conflict!
-'H'   F1     linux/hid-roccat.h                                      <mailto:erazor_de@users.sourceforge.net>
+'H'   C0-F0  net/bluetooth/hci.h                                        conflict!
+'H'   C0-DF  net/bluetooth/hidp/hidp.h                                  conflict!
+'H'   C0-DF  net/bluetooth/cmtp/cmtp.h                                  conflict!
+'H'   C0-DF  net/bluetooth/bnep/bnep.h                                  conflict!
+'H'   F1     linux/hid-roccat.h                                         <mailto:erazor_de@users.sourceforge.net>
 'H'   F8-FA  sound/firewire.h
-'I'   all    linux/isdn.h                                            conflict!
-'I'   00-0F  drivers/isdn/divert/isdn_divert.h                       conflict!
-'I'   40-4F  linux/mISDNif.h                                         conflict!
+'I'   all    linux/isdn.h                                               conflict!
+'I'   00-0F  drivers/isdn/divert/isdn_divert.h                          conflict!
+'I'   40-4F  linux/mISDNif.h                                            conflict!
 'K'   all    linux/kd.h
-'L'   00-1F  linux/loop.h                                            conflict!
-'L'   10-1F  drivers/scsi/mpt3sas/mpt3sas_ctl.h                      conflict!
-'L'   E0-FF  linux/ppdd.h                                            encrypted disk device driver
-                                                                     <http://linux01.gwdg.de/~alatham/ppdd.html>
-'M'   all    linux/soundcard.h                                       conflict!
-'M'   01-16  mtd/mtd-abi.h                                           conflict!
+'L'   00-1F  linux/loop.h                                               conflict!
+'L'   10-1F  drivers/scsi/mpt3sas/mpt3sas_ctl.h                         conflict!
+'L'   E0-FF  linux/ppdd.h                                               encrypted disk device driver
+                                                                        <http://linux01.gwdg.de/~alatham/ppdd.html>
+'M'   all    linux/soundcard.h                                          conflict!
+'M'   01-16  mtd/mtd-abi.h                                              conflict!
       and    drivers/mtd/mtdchar.c
 'M'   01-03  drivers/scsi/megaraid/megaraid_sas.h
-'M'   00-0F  drivers/video/fsl-diu-fb.h                              conflict!
+'M'   00-0F  drivers/video/fsl-diu-fb.h                                 conflict!
 'N'   00-1F  drivers/usb/scanner.h
 'N'   40-7F  drivers/block/nvme.c
-'N'   80-8F  uapi/linux/ntsync.h                                     NT synchronization primitives
-                                                                     <mailto:wine-devel@winehq.org>
-'O'   00-06  mtd/ubi-user.h                                          UBI
-'P'   all    linux/soundcard.h                                       conflict!
-'P'   60-6F  sound/sscape_ioctl.h                                    conflict!
-'P'   00-0F  drivers/usb/class/usblp.c                               conflict!
-'P'   01-09  drivers/misc/pci_endpoint_test.c                        conflict!
-'P'   00-0F  xen/privcmd.h                                           conflict!
-'P'   00-05  linux/tps6594_pfsm.h                                    conflict!
+'N'   80-8F  uapi/linux/ntsync.h                                        NT synchronization primitives
+                                                                        <mailto:wine-devel@winehq.org>
+'O'   00-06  mtd/ubi-user.h                                             UBI
+'P'   all    linux/soundcard.h                                          conflict!
+'P'   60-6F  sound/sscape_ioctl.h                                       conflict!
+'P'   00-0F  drivers/usb/class/usblp.c                                  conflict!
+'P'   01-09  drivers/misc/pci_endpoint_test.c                           conflict!
+'P'   00-0F  xen/privcmd.h                                              conflict!
+'P'   00-05  linux/tps6594_pfsm.h                                       conflict!
 'Q'   all    linux/soundcard.h
-'R'   00-1F  linux/random.h                                          conflict!
-'R'   01     linux/rfkill.h                                          conflict!
+'R'   00-1F  linux/random.h                                             conflict!
+'R'   01     linux/rfkill.h                                             conflict!
 'R'   20-2F  linux/trace_mmap.h
 'R'   C0-DF  net/bluetooth/rfcomm.h
 'R'   E0     uapi/linux/fsl_mc.h
-'S'   all    linux/cdrom.h                                           conflict!
-'S'   80-81  scsi/scsi_ioctl.h                                       conflict!
-'S'   82-FF  scsi/scsi.h                                             conflict!
-'S'   00-7F  sound/asequencer.h                                      conflict!
-'T'   all    linux/soundcard.h                                       conflict!
-'T'   00-AF  sound/asound.h                                          conflict!
-'T'   all    arch/x86/include/asm/ioctls.h                           conflict!
-'T'   C0-DF  linux/if_tun.h                                          conflict!
-'U'   all    sound/asound.h                                          conflict!
-'U'   00-CF  linux/uinput.h                                          conflict!
+'S'   all    linux/cdrom.h                                              conflict!
+'S'   80-81  scsi/scsi_ioctl.h                                          conflict!
+'S'   82-FF  scsi/scsi.h                                                conflict!
+'S'   00-7F  sound/asequencer.h                                         conflict!
+'T'   all    linux/soundcard.h                                          conflict!
+'T'   00-AF  sound/asound.h                                             conflict!
+'T'   all    arch/x86/include/asm/ioctls.h                              conflict!
+'T'   C0-DF  linux/if_tun.h                                             conflict!
+'U'   all    sound/asound.h                                             conflict!
+'U'   00-CF  linux/uinput.h                                             conflict!
 'U'   00-EF  linux/usbdevice_fs.h
 'U'   C0-CF  drivers/bluetooth/hci_uart.h
-'V'   all    linux/vt.h                                              conflict!
-'V'   all    linux/videodev2.h                                       conflict!
-'V'   C0     linux/ivtvfb.h                                          conflict!
-'V'   C0     linux/ivtv.h                                            conflict!
-'V'   C0     media/si4713.h                                          conflict!
-'W'   00-1F  linux/watchdog.h                                        conflict!
-'W'   00-1F  linux/wanrouter.h                                       conflict! (pre 3.9)
-'W'   00-3F  sound/asound.h                                          conflict!
+'V'   all    linux/vt.h                                                 conflict!
+'V'   all    linux/videodev2.h                                          conflict!
+'V'   C0     linux/ivtvfb.h                                             conflict!
+'V'   C0     linux/ivtv.h                                               conflict!
+'V'   C0     media/si4713.h                                             conflict!
+'W'   00-1F  linux/watchdog.h                                           conflict!
+'W'   00-1F  linux/wanrouter.h                                          conflict! (pre 3.9)
+'W'   00-3F  sound/asound.h                                             conflict!
 'W'   40-5F  drivers/pci/switch/switchtec.c
 'W'   60-61  linux/watch_queue.h
-'X'   all    fs/xfs/xfs_fs.h,                                        conflict!
+'X'   all    fs/xfs/xfs_fs.h,                                           conflict!
              fs/xfs/linux-2.6/xfs_ioctl32.h,
              include/linux/falloc.h,
              linux/fs.h,
-'X'   all    fs/ocfs2/ocfs_fs.h                                      conflict!
-'X'   01     linux/pktcdvd.h                                         conflict!
+'X'   all    fs/ocfs2/ocfs_fs.h                                         conflict!
+'X'   01     linux/pktcdvd.h                                            conflict!
 'Z'   14-15  drivers/message/fusion/mptctl.h
-'['   00-3F  linux/usb/tmc.h                                         USB Test and Measurement Devices
-                                                                     <mailto:gregkh@linuxfoundation.org>
-'a'   all    linux/atm*.h, linux/sonet.h                             ATM on linux
-                                                                     <http://lrcwww.epfl.ch/>
-'a'   00-0F  drivers/crypto/qat/qat_common/adf_cfg_common.h          conflict! qat driver
-'b'   00-FF                                                          conflict! bit3 vme host bridge
-                                                                     <mailto:natalia@nikhefk.nikhef.nl>
-'b'   00-0F  linux/dma-buf.h                                         conflict!
-'c'   00-7F  linux/comstats.h                                        conflict!
-'c'   00-7F  linux/coda.h                                            conflict!
-'c'   00-1F  linux/chio.h                                            conflict!
-'c'   80-9F  arch/s390/include/asm/chsc.h                            conflict!
+'['   00-3F  linux/usb/tmc.h                                            USB Test and Measurement Devices
+                                                                        <mailto:gregkh@linuxfoundation.org>
+'a'   all    linux/atm*.h, linux/sonet.h                                ATM on linux
+                                                                        <http://lrcwww.epfl.ch/>
+'a'   00-0F  drivers/crypto/qat/qat_common/adf_cfg_common.h             conflict! qat driver
+'b'   00-FF                                                             conflict! bit3 vme host bridge
+                                                                        <mailto:natalia@nikhefk.nikhef.nl>
+'b'   00-0F  linux/dma-buf.h                                            conflict!
+'c'   00-7F  linux/comstats.h                                           conflict!
+'c'   00-7F  linux/coda.h                                               conflict!
+'c'   00-1F  linux/chio.h                                               conflict!
+'c'   80-9F  arch/s390/include/asm/chsc.h                               conflict!
 'c'   A0-AF  arch/x86/include/asm/msr.h conflict!
-'d'   00-FF  linux/char/drm/drm.h                                    conflict!
-'d'   02-40  pcmcia/ds.h                                             conflict!
+'d'   00-FF  linux/char/drm/drm.h                                       conflict!
+'d'   02-40  pcmcia/ds.h                                                conflict!
 'd'   F0-FF  linux/digi1.h
-'e'   all    linux/digi1.h                                           conflict!
-'f'   00-1F  linux/ext2_fs.h                                         conflict!
-'f'   00-1F  linux/ext3_fs.h                                         conflict!
-'f'   00-0F  fs/jfs/jfs_dinode.h                                     conflict!
-'f'   00-0F  fs/ext4/ext4.h                                          conflict!
-'f'   00-0F  linux/fs.h                                              conflict!
-'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                     conflict!
+'e'   all    linux/digi1.h                                              conflict!
+'f'   00-1F  linux/ext2_fs.h                                            conflict!
+'f'   00-1F  linux/ext3_fs.h                                            conflict!
+'f'   00-0F  fs/jfs/jfs_dinode.h                                        conflict!
+'f'   00-0F  fs/ext4/ext4.h                                             conflict!
+'f'   00-0F  linux/fs.h                                                 conflict!
+'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                        conflict!
 'f'   13-27  linux/fscrypt.h
 'f'   81-8F  linux/fsverity.h
 'g'   00-0F  linux/usb/gadgetfs.h
 'g'   20-2F  linux/usb/g_printer.h
-'h'   00-7F                                                          conflict! Charon filesystem
-                                                                     <mailto:zapman@interlan.net>
-'h'   00-1F  linux/hpet.h                                            conflict!
+'h'   00-7F                                                             conflict! Charon filesystem
+                                                                        <mailto:zapman@interlan.net>
+'h'   00-1F  linux/hpet.h                                               conflict!
 'h'   80-8F  fs/hfsplus/ioctl.c
-'i'   00-3F  linux/i2o-dev.h                                         conflict!
-'i'   0B-1F  linux/ipmi.h                                            conflict!
+'i'   00-3F  linux/i2o-dev.h                                            conflict!
+'i'   0B-1F  linux/ipmi.h                                               conflict!
 'i'   80-8F  linux/i8k.h
-'i'   90-9F  `linux/iio/*.h`                                         IIO
+'i'   90-9F  `linux/iio/*.h`                                            IIO
 'j'   00-3F  linux/joystick.h
-'k'   00-0F  linux/spi/spidev.h                                      conflict!
-'k'   00-05  video/kyro.h                                            conflict!
-'k'   10-17  linux/hsi/hsi_char.h                                    HSI character device
-'l'   00-3F  linux/tcfs_fs.h                                         transparent cryptographic file system
-                                                                     <http://web.archive.org/web/%2A/http://mikonos.dia.unisa.it/tcfs>
-'l'   40-7F  linux/udf_fs_i.h                                        in development:
-                                                                     <https://github.com/pali/udftools>
-'m'   00-09  linux/mmtimer.h                                         conflict!
-'m'   all    linux/mtio.h                                            conflict!
-'m'   all    linux/soundcard.h                                       conflict!
-'m'   all    linux/synclink.h                                        conflict!
-'m'   00-19  drivers/message/fusion/mptctl.h                         conflict!
-'m'   00     drivers/scsi/megaraid/megaraid_ioctl.h                  conflict!
+'k'   00-0F  linux/spi/spidev.h                                         conflict!
+'k'   00-05  video/kyro.h                                               conflict!
+'k'   10-17  linux/hsi/hsi_char.h                                       HSI character device
+'l'   00-3F  linux/tcfs_fs.h                                            transparent cryptographic file system
+                                                                        <http://web.archive.org/web/%2A/http://mikonos.dia.unisa.it/tcfs>
+'l'   40-7F  linux/udf_fs_i.h                                           in development:
+                                                                        <https://github.com/pali/udftools>
+'m'   00-09  linux/mmtimer.h                                            conflict!
+'m'   all    linux/mtio.h                                               conflict!
+'m'   all    linux/soundcard.h                                          conflict!
+'m'   all    linux/synclink.h                                           conflict!
+'m'   00-19  drivers/message/fusion/mptctl.h                            conflict!
+'m'   00     drivers/scsi/megaraid/megaraid_ioctl.h                     conflict!
 'n'   00-7F  linux/ncp_fs.h and fs/ncpfs/ioctl.c
-'n'   80-8F  uapi/linux/nilfs2_api.h                                 NILFS2
-'n'   E0-FF  linux/matroxfb.h                                        matroxfb
-'o'   00-1F  fs/ocfs2/ocfs2_fs.h                                     OCFS2
-'o'   00-03  mtd/ubi-user.h                                          conflict! (OCFS2 and UBI overlaps)
-'o'   40-41  mtd/ubi-user.h                                          UBI
-'o'   01-A1  `linux/dvb/*.h`                                         DVB
-'p'   00-0F  linux/phantom.h                                         conflict! (OpenHaptics needs this)
-'p'   00-1F  linux/rtc.h                                             conflict!
+'n'   80-8F  uapi/linux/nilfs2_api.h                                    NILFS2
+'n'   E0-FF  linux/matroxfb.h                                           matroxfb
+'o'   00-1F  fs/ocfs2/ocfs2_fs.h                                        OCFS2
+'o'   00-03  mtd/ubi-user.h                                             conflict! (OCFS2 and UBI overlaps)
+'o'   40-41  mtd/ubi-user.h                                             UBI
+'o'   01-A1  `linux/dvb/*.h`                                            DVB
+'p'   00-0F  linux/phantom.h                                            conflict! (OpenHaptics needs this)
+'p'   00-1F  linux/rtc.h                                                conflict!
 'p'   40-7F  linux/nvram.h
-'p'   80-9F  linux/ppdev.h                                           user-space parport
-                                                                     <mailto:tim@cyberelk.net>
-'p'   A1-A5  linux/pps.h                                             LinuxPPS
-'p'   B1-B3  linux/pps_gen.h                                         LinuxPPS
-                                                                     <mailto:giometti@linux.it>
+'p'   80-9F  linux/ppdev.h                                              user-space parport
+                                                                        <mailto:tim@cyberelk.net>
+'p'   A1-A5  linux/pps.h                                                LinuxPPS
+'p'   B1-B3  linux/pps_gen.h                                            LinuxPPS
+                                                                        <mailto:giometti@linux.it>
 'q'   00-1F  linux/serio.h
-'q'   80-FF  linux/telephony.h                                       Internet PhoneJACK, Internet LineJACK
-             linux/ixjuser.h                                         <http://web.archive.org/web/%2A/http://www.quicknet.net>
+'q'   80-FF  linux/telephony.h                                          Internet PhoneJACK, Internet LineJACK
+             linux/ixjuser.h                                            <http://web.archive.org/web/%2A/http://www.quicknet.net>
 'r'   00-1F  linux/msdos_fs.h and fs/fat/dir.c
 's'   all    linux/cdk.h
 't'   00-7F  linux/ppp-ioctl.h
 't'   80-8F  linux/isdn_ppp.h
-'t'   90-91  linux/toshiba.h                                         toshiba and toshiba_acpi SMM
-'u'   00-1F  linux/smb_fs.h                                          gone
-'u'   00-2F  linux/ublk_cmd.h                                        conflict!
-'u'   20-3F  linux/uvcvideo.h                                        USB video class host driver
-'u'   40-4f  linux/udmabuf.h                                         userspace dma-buf misc device
-'v'   00-1F  linux/ext2_fs.h                                         conflict!
-'v'   00-1F  linux/fs.h                                              conflict!
-'v'   00-0F  linux/sonypi.h                                          conflict!
-'v'   00-0F  media/v4l2-subdev.h                                     conflict!
-'v'   20-27  arch/powerpc/include/uapi/asm/vas-api.h		     VAS API
-'v'   C0-FF  linux/meye.h                                            conflict!
-'w'   all                                                            CERN SCI driver
-'y'   00-1F                                                          packet based user level communications
-                                                                     <mailto:zapman@interlan.net>
-'z'   00-3F                                                          CAN bus card conflict!
-                                                                     <mailto:hdstich@connectu.ulm.circular.de>
-'z'   40-7F                                                          CAN bus card conflict!
-                                                                     <mailto:oe@port.de>
-'z'   10-4F  drivers/s390/crypto/zcrypt_api.h                        conflict!
+'t'   90-91  linux/toshiba.h                                            toshiba and toshiba_acpi SMM
+'u'   00-1F  linux/smb_fs.h                                             gone
+'u'   00-2F  linux/ublk_cmd.h                                           conflict!
+'u'   20-3F  linux/uvcvideo.h                                           USB video class host driver
+'u'   40-4f  linux/udmabuf.h                                            userspace dma-buf misc device
+'v'   00-1F  linux/ext2_fs.h                                            conflict!
+'v'   00-1F  linux/fs.h                                                 conflict!
+'v'   00-0F  linux/sonypi.h                                             conflict!
+'v'   00-0F  media/v4l2-subdev.h                                        conflict!
+'v'   20-27  arch/powerpc/include/uapi/asm/vas-api.h		        VAS API
+'v'   C0-FF  linux/meye.h                                               conflict!
+'w'   all                                                               CERN SCI driver
+'y'   00-1F                                                             packet based user level communications
+                                                                        <mailto:zapman@interlan.net>
+'z'   00-3F                                                             CAN bus card conflict!
+                                                                        <mailto:hdstich@connectu.ulm.circular.de>
+'z'   40-7F                                                             CAN bus card conflict!
+                                                                        <mailto:oe@port.de>
+'z'   10-4F  drivers/s390/crypto/zcrypt_api.h                           conflict!
 '|'   00-7F  linux/media.h
-'|'   80-9F  samples/                                                Any sample and example drivers
+'|'   80-9F  samples/                                                   Any sample and example drivers
 0x80  00-1F  linux/fb.h
 0x81  00-1F  linux/vduse.h
 0x89  00-06  arch/x86/include/asm/sockios.h
 0x89  0B-DF  linux/sockios.h
-0x89  E0-EF  linux/sockios.h                                         SIOCPROTOPRIVATE range
-0x89  F0-FF  linux/sockios.h                                         SIOCDEVPRIVATE range
+0x89  E0-EF  linux/sockios.h                                            SIOCPROTOPRIVATE range
+0x89  F0-FF  linux/sockios.h                                            SIOCDEVPRIVATE range
 0x8A  00-1F  linux/eventpoll.h
 0x8B  all    linux/wireless.h
-0x8C  00-3F                                                          WiNRADiO driver
-                                                                     <http://www.winradio.com.au/>
+0x8C  00-3F                                                             WiNRADiO driver
+                                                                        <http://www.winradio.com.au/>
 0x90  00     drivers/cdrom/sbpcd.h
 0x92  00-0F  drivers/usb/mon/mon_bin.c
 0x93  60-7F  linux/auto_fs.h
-0x94  all    fs/btrfs/ioctl.h                                        Btrfs filesystem
-             and linux/fs.h                                          some lifted to vfs/generic
-0x97  00-7F  fs/ceph/ioctl.h                                         Ceph file system
-0x99  00-0F                                                          537-Addinboard driver
-                                                                     <mailto:buk@buks.ipn.de>
+0x94  all    fs/btrfs/ioctl.h                                           Btrfs filesystem
+             and linux/fs.h                                             some lifted to vfs/generic
+0x97  00-7F  fs/ceph/ioctl.h                                            Ceph file system
+0x99  00-0F                                                             537-Addinboard driver
+                                                                        <mailto:buk@buks.ipn.de>
 0x9A  00-0F  include/uapi/fwctl/fwctl.h
-0xA0  all    linux/sdp/sdp.h                                         Industrial Device Project
-                                                                     <mailto:kenji@bitgate.com>
-0xA1  0      linux/vtpm_proxy.h                                      TPM Emulator Proxy Driver
-0xA2  all    uapi/linux/acrn.h                                       ACRN hypervisor
-0xA3  80-8F                                                          Port ACL  in development:
-                                                                     <mailto:tlewis@mindspring.com>
+0xA0  all    linux/sdp/sdp.h                                            Industrial Device Project
+                                                                        <mailto:kenji@bitgate.com>
+0xA1  0      linux/vtpm_proxy.h                                         TPM Emulator Proxy Driver
+0xA2  all    uapi/linux/acrn.h                                          ACRN hypervisor
+0xA3  80-8F                                                             Port ACL  in development:
+                                                                        <mailto:tlewis@mindspring.com>
 0xA3  90-9F  linux/dtlk.h
-0xA4  00-1F  uapi/linux/tee.h                                        Generic TEE subsystem
-0xA4  00-1F  uapi/asm/sgx.h                                          <mailto:linux-sgx@vger.kernel.org>
-0xA5  01-05  linux/surface_aggregator/cdev.h                         Microsoft Surface Platform System Aggregator
-                                                                     <mailto:luzmaximilian@gmail.com>
-0xA5  20-2F  linux/surface_aggregator/dtx.h                          Microsoft Surface DTX driver
-                                                                     <mailto:luzmaximilian@gmail.com>
+0xA4  00-1F  uapi/linux/tee.h                                           Generic TEE subsystem
+0xA4  00-1F  uapi/asm/sgx.h                                             <mailto:linux-sgx@vger.kernel.org>
+0xA5  01-05  linux/surface_aggregator/cdev.h                            Microsoft Surface Platform System Aggregator
+                                                                        <mailto:luzmaximilian@gmail.com>
+0xA5  20-2F  linux/surface_aggregator/dtx.h                             Microsoft Surface DTX driver
+                                                                        <mailto:luzmaximilian@gmail.com>
 0xAA  00-3F  linux/uapi/linux/userfaultfd.h
 0xAB  00-1F  linux/nbd.h
 0xAC  00-1F  linux/raw.h
-0xAD  00                                                             Netfilter device in development:
-                                                                     <mailto:rusty@rustcorp.com.au>
-0xAE  00-1F  linux/kvm.h                                             Kernel-based Virtual Machine
-                                                                     <mailto:kvm@vger.kernel.org>
-0xAE  40-FF  linux/kvm.h                                             Kernel-based Virtual Machine
-                                                                     <mailto:kvm@vger.kernel.org>
-0xAE  20-3F  linux/nitro_enclaves.h                                  Nitro Enclaves
-0xAF  00-1F  linux/fsl_hypervisor.h                                  Freescale hypervisor
-0xB0  all                                                            RATIO devices in development:
-                                                                     <mailto:vgo@ratio.de>
-0xB1  00-1F                                                          PPPoX
-                                                                     <mailto:mostrows@styx.uwaterloo.ca>
-0xB2  00     arch/powerpc/include/uapi/asm/papr-vpd.h                powerpc/pseries VPD API
-                                                                     <mailto:linuxppc-dev>
-0xB2  01-02  arch/powerpc/include/uapi/asm/papr-sysparm.h            powerpc/pseries system parameter API
-                                                                     <mailto:linuxppc-dev>
-0xB2  03-05 arch/powerpc/include/uapi/asm/papr-indices.h             powerpc/pseries indices API
-                                                                     <mailto:linuxppc-dev>
-0xB2  06-07 arch/powerpc/include/uapi/asm/papr-platform-dump.h       powerpc/pseries Platform Dump API
-                                                                     <mailto:linuxppc-dev>
-0xB2  08  arch/powerpc/include/uapi/asm/papr-physical-attestation.h  powerpc/pseries Physical Attestation API
-                                                                     <mailto:linuxppc-dev>
+0xAD  00                                                                Netfilter device in development:
+                                                                        <mailto:rusty@rustcorp.com.au>
+0xAE  00-1F  linux/kvm.h                                                Kernel-based Virtual Machine
+                                                                        <mailto:kvm@vger.kernel.org>
+0xAE  40-FF  linux/kvm.h                                                Kernel-based Virtual Machine
+                                                                        <mailto:kvm@vger.kernel.org>
+0xAE  20-3F  linux/nitro_enclaves.h                                     Nitro Enclaves
+0xAF  00-1F  linux/fsl_hypervisor.h                                     Freescale hypervisor
+0xB0  all                                                               RATIO devices in development:
+                                                                        <mailto:vgo@ratio.de>
+0xB1  00-1F                                                             PPPoX
+                                                                        <mailto:mostrows@styx.uwaterloo.ca>
+0xB2  00     arch/powerpc/include/uapi/asm/papr-vpd.h                   powerpc/pseries VPD API
+                                                                        <mailto:linuxppc-dev@lists.ozlabs.org>
+0xB2  01-02  arch/powerpc/include/uapi/asm/papr-sysparm.h               powerpc/pseries system parameter API
+                                                                        <mailto:linuxppc-dev@lists.ozlabs.org>
+0xB2  03-05  arch/powerpc/include/uapi/asm/papr-indices.h               powerpc/pseries indices API
+                                                                        <mailto:linuxppc-dev@lists.ozlabs.org>
+0xB2  06-07  arch/powerpc/include/uapi/asm/papr-platform-dump.h         powerpc/pseries Platform Dump API
+                                                                        <mailto:linuxppc-dev@lists.ozlabs.org>
+0xB2  08     arch/powerpc/include/uapi/asm/papr-physical-attestation.h  powerpc/pseries Physical Attestation API
+                                                                        <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB3  00     linux/mmc/ioctl.h
-0xB4  00-0F  linux/gpio.h                                            <mailto:linux-gpio@vger.kernel.org>
-0xB5  00-0F  uapi/linux/rpmsg.h                                      <mailto:linux-remoteproc@vger.kernel.org>
+0xB4  00-0F  linux/gpio.h                                               <mailto:linux-gpio@vger.kernel.org>
+0xB5  00-0F  uapi/linux/rpmsg.h                                         <mailto:linux-remoteproc@vger.kernel.org>
 0xB6  all    linux/fpga-dfl.h
-0xB7  all    uapi/linux/remoteproc_cdev.h                            <mailto:linux-remoteproc@vger.kernel.org>
-0xB7  all    uapi/linux/nsfs.h                                       <mailto:Andrei Vagin <avagin@openvz.org>>
-0xB8  01-02  uapi/misc/mrvl_cn10k_dpi.h                              Marvell CN10K DPI driver
-0xB8  all    uapi/linux/mshv.h                                       Microsoft Hyper-V /dev/mshv driver
-                                                                     <mailto:linux-hyperv@vger.kernel.org>
+0xB7  all    uapi/linux/remoteproc_cdev.h                               <mailto:linux-remoteproc@vger.kernel.org>
+0xB7  all    uapi/linux/nsfs.h                                          <mailto:Andrei Vagin <avagin@openvz.org>>
+0xB8  01-02  uapi/misc/mrvl_cn10k_dpi.h                                 Marvell CN10K DPI driver
+0xB8  all    uapi/linux/mshv.h                                          Microsoft Hyper-V /dev/mshv driver
+                                                                        <mailto:linux-hyperv@vger.kernel.org>
 0xC0  00-0F  linux/usb/iowarrior.h
-0xCA  00-0F  uapi/misc/cxl.h                                         Dead since 6.15
+0xCA  00-0F  uapi/misc/cxl.h                                            Dead since 6.15
 0xCA  10-2F  uapi/misc/ocxl.h
-0xCA  80-BF  uapi/scsi/cxlflash_ioctl.h                              Dead since 6.15
-0xCB  00-1F                                                          CBM serial IEC bus in development:
-                                                                     <mailto:michael.klein@puffin.lb.shuttle.de>
-0xCC  00-0F  drivers/misc/ibmvmc.h                                   pseries VMC driver
-0xCD  01     linux/reiserfs_fs.h                                     Dead since 6.13
-0xCE  01-02  uapi/linux/cxl_mem.h                                    Compute Express Link Memory Devices
+0xCA  80-BF  uapi/scsi/cxlflash_ioctl.h                                 Dead since 6.15
+0xCB  00-1F                                                             CBM serial IEC bus in development:
+                                                                        <mailto:michael.klein@puffin.lb.shuttle.de>
+0xCC  00-0F  drivers/misc/ibmvmc.h                                      pseries VMC driver
+0xCD  01     linux/reiserfs_fs.h                                        Dead since 6.13
+0xCE  01-02  uapi/linux/cxl_mem.h                                       Compute Express Link Memory Devices
 0xCF  02     fs/smb/client/cifs_ioctl.h
 0xDB  00-0F  drivers/char/mwave/mwavepub.h
-0xDD  00-3F                                                          ZFCP device driver see drivers/s390/scsi/
-                                                                     <mailto:aherrman@de.ibm.com>
+0xDD  00-3F                                                             ZFCP device driver see drivers/s390/scsi/
+                                                                        <mailto:aherrman@de.ibm.com>
 0xE5  00-3F  linux/fuse.h
-0xEC  00-01  drivers/platform/chrome/cros_ec_dev.h                   ChromeOS EC driver
-0xEE  00-09  uapi/linux/pfrut.h                                      Platform Firmware Runtime Update and Telemetry
-0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                     sisfb (in development)
-                                                                     <mailto:thomas@winischhofer.net>
-0xF6  all                                                            LTTng Linux Trace Toolkit Next Generation
-                                                                     <mailto:mathieu.desnoyers@efficios.com>
-0xF8  all    arch/x86/include/uapi/asm/amd_hsmp.h                    AMD HSMP EPYC system management interface driver
-                                                                     <mailto:nchatrad@amd.com>
+0xEC  00-01  drivers/platform/chrome/cros_ec_dev.h                      ChromeOS EC driver
+0xEE  00-09  uapi/linux/pfrut.h                                         Platform Firmware Runtime Update and Telemetry
+0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                        sisfb (in development)
+                                                                        <mailto:thomas@winischhofer.net>
+0xF6  all                                                               LTTng Linux Trace Toolkit Next Generation
+                                                                        <mailto:mathieu.desnoyers@efficios.com>
+0xF8  all    arch/x86/include/uapi/asm/amd_hsmp.h                       AMD HSMP EPYC system management interface driver
+                                                                        <mailto:nchatrad@amd.com>
 0xFD  all    linux/dm-ioctl.h
 0xFE  all    linux/isst_if.h
-====  =====  ======================================================= ================================================================
+====  =====  =========================================================  ================================================================

base-commit: 86900ab620a42396a749b506d4a187820fc3fabe
-- 
An old man doll... just what I always wanted! - Clara


