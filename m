Return-Path: <linuxppc-dev+bounces-8371-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D922FAAD5C7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 08:14:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZslMc6CKqz2yGx;
	Wed,  7 May 2025 16:14:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746598444;
	cv=none; b=dG+NUGrDp5SfxYLABLo0g69PEM7c4xrLksJNHp42JyGGfl0H6dpnqY+GwHK+azD1K45wcEgYOue39DiEhbxQfA4fCXjXRS2ISbnlpf+Ev9unQ/8LCwLd4m/xOmYiPELVcz8VVWi+Jxi3Vny93h/Pub/erkkD7DLqywpptGubt7tMDXmxbtOaqT4jTnwaJeYncNA9QHS3ntLTkSQgzNOg9CRzFQtfNjPJPVZzakewpAIM9hliCMrDn4PJS3omkcTwbelZG6s/yiowR397uKbzfnsavkPFdBPrAsUVGAUNziyfiSIp1wv1MU5RcLVPyIt/HpGgWf5tTUDZo4g6oJ8IMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746598444; c=relaxed/relaxed;
	bh=aXpODrZeRVF4tYCl+tRBpiJfR7nm6axZ+KX/nGGxGsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCqNOs2a3e9hAvAOnr41uT3dHOWmEsI97Vz98tkXpcLg7PPbiQFYGSjv3TWwNjGyjkJoFDI3dqoWgVFDwVhIewXJECX69+fF7vaNJY1cZcmz8qmdT3NxvVb6K7Uk9FV83Mgocdtq1pUwIVnJhPgoUzPeb3YwSAVEKYASmOnL5bZ/yBHmbyHVPV7RHuQpo31QmvvZGSVS1cln8/8V/b72y+OgcU6arx66EYS9w/A64bPB+Rb5ryIcBtQu00MCcaqb97UEqUbz7qWqJ4i3WDBmuTdRjSiSKOcT87NODYfBExq2Bj1SQ6exdKLKSd2Jschm1wSFThQ3qL7sdjk4Bo9QIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GboyCcBY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GboyCcBY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZslMX606Tz2y8W
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 16:14:00 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7398d65476eso524924b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 May 2025 23:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746598438; x=1747203238; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXpODrZeRVF4tYCl+tRBpiJfR7nm6axZ+KX/nGGxGsk=;
        b=GboyCcBYc8JfAsIy9aCMx+VBYyep/2Uc/LASxn52Dpao9/7QW9bpO5YJ9loPJ2NteT
         w4UaWVL6sDLXBn5sXBNvBCOq7G/MmLNyZ502XTzdpcNpX7OMhNEffFsn49rhaI579lft
         gAB6z/Wksa5GyOvW7jv/xD26SPkBlC3KNPd6bHiHLdVADD2VwsB6gGb0nQ63Y6hYQBzd
         hDTKvDqFMKYHn+C/RIrCIalGwn3U7PyNZQ8LAgPPLCQdWPADs1Bfpf2389vgtiybBpKB
         /jFkmFbwGM0u7RVV5rlU8XRuiTtn1Df30gnVmSAQmBD1wzFg7FwvJS+emIgE3w1540AK
         Aw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746598438; x=1747203238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXpODrZeRVF4tYCl+tRBpiJfR7nm6axZ+KX/nGGxGsk=;
        b=odTZ2Zf017I8K/GiRlvKHlBgM4OPx5oOayogjulKaU7ynv6dgi8WtP9icl63gUmNOX
         OTOxq17wvsvssgMjLwWSMcdRMbtZldoUNVQO13/lC3ik56WhWm59qU3NF9PtjB0iY35T
         3UIB2SxdvIEkU6rQ1if446pM4vSOEskyF7L1wAJiDeNPckNdQ+GOPGRLDUEvzPctzkH5
         Ag+Qh15oZ3q5WBOoMlyXT4OnuDAuHH9E7/6l+TkEjh7FbM8NlWpHiGDf/QuJDdXxZNCj
         Ef++M9Og22HcCgA68PUV6S//mrF23KAeweJm0zEq9PFchEhHcXc28iRmHPXPHVtO15cR
         5Nvg==
X-Forwarded-Encrypted: i=1; AJvYcCURYvt7W9t95W3Xqjr73JOO2DDnIfebQ4qFfgo6c9hzkFrvaeL/8uv/L/isTZozWo+CqmsO8gDebyYlWXE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzj7IhTjGsu4bqBvyGv+HkUs8FanexuWVQAUDsM8Hx/O/PCqPEj
	NyRcmPja+bjXj386divLWMbnq8LSwJB2ATJ7QjtognnipAJ4Rtdp
X-Gm-Gg: ASbGncsMm7IPclz4wV9+GTue8vA4BVXEi7QReJpLkjpnYYgm/AjtRTt5IVojznNf2JD
	2qlP81AC+3TR2c0UMBldGan4ok3gZZJEqI8MUzp50rZjRMu8k6KXk+6Jp+uiGdaj9nfEPj6sfVY
	RHWioAevVDoKN4bg4eMb8OMSbrgBHBv1eDoEevRlTpbnBwaDRtIzs+U4OC4nnZtN08qoxvH9pdQ
	3GEr5rKIY7LeCXYe61UdpkFUuO5CWJ3jBumoPpQgqllD94PMN9eVYuEgI6nG5WT92niB0fgH1Tq
	hl3jTkl9wUVNqDP+/75qW6KvSiCI4cMZu3PX5PlT
X-Google-Smtp-Source: AGHT+IHvYq4zE5F5pX0HMf8jcEP2DL4ugFEt7cgMJy0myTgrFpX8kGDtZ1zjLCdUWLmzA7vVFW8C9Q==
X-Received: by 2002:a05:6a00:830b:b0:732:5875:eb95 with SMTP id d2e1a72fcca58-7409b678938mr3592082b3a.4.1746598437894;
        Tue, 06 May 2025 23:13:57 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fcd067b62sm5703088a12.51.2025.05.06.23.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 23:13:55 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id E800642A3182; Wed, 07 May 2025 13:13:51 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Richard Cochran <richardcochran@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Subject: [PATCH 2/3] Documentation: ioctl-number: Extend "Include File" column width
Date: Wed,  7 May 2025 13:13:02 +0700
Message-ID: <20250507061302.25219-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507061302.25219-2-bagasdotme@gmail.com>
References: <20250507061302.25219-2-bagasdotme@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=51127; i=bagasdotme@gmail.com; h=from:subject; bh=lcnTrBW7rQyWCY1mHPFKaMQCr3ac9uA6IrLv9pbwC/U=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlSP9hd/n1/kPYtzla89u+cv/1Fhkw9qzRbpzCcLu5Zv DPhlu7tjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEzk4wZGhgOHNrpVzN9quu5S +JlSjb1HnnvPniVybYVR9pT7m9typkoyMty/vHvBzyeh3mvO9377HLl71UrOkA+ylV/7D2Tpc8p fKmAGAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_SBL_A autolearn=disabled version=4.0.1
	OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Extend width of "Include File" column to fit full path to
papr-physical-attestation.h in later commit.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 .../userspace-api/ioctl/ioctl-number.rst      | 512 +++++++++---------
 1 file changed, 256 insertions(+), 256 deletions(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index b613235ca18767..3864c8416627e0 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -66,343 +66,343 @@ This table lists ioctls visible from user land for Linux/x86.  It contains
 most drivers up to 2.6.31, but I know I am missing some.  There has been
 no attempt to list non-X86 architectures or ioctls from drivers/staging/.
 
-====  =====  ======================================================= ================================================================
-Code  Seq#    Include File                                           Comments
+====  =====  ========================================================= ================================================================
+Code  Seq#    Include File                                             Comments
       (hex)
-====  =====  ======================================================= ================================================================
-0x00  00-1F  linux/fs.h                                              conflict!
-0x00  00-1F  scsi/scsi_ioctl.h                                       conflict!
-0x00  00-1F  linux/fb.h                                              conflict!
-0x00  00-1F  linux/wavefront.h                                       conflict!
+====  =====  ========================================================= ================================================================
+0x00  00-1F  linux/fs.h                                                conflict!
+0x00  00-1F  scsi/scsi_ioctl.h                                         conflict!
+0x00  00-1F  linux/fb.h                                                conflict!
+0x00  00-1F  linux/wavefront.h                                         conflict!
 0x02  all    linux/fd.h
 0x03  all    linux/hdreg.h
-0x04  D2-DC  linux/umsdos_fs.h                                       Dead since 2.6.11, but don't reuse these.
+0x04  D2-DC  linux/umsdos_fs.h                                         Dead since 2.6.11, but don't reuse these.
 0x06  all    linux/lp.h
 0x07  9F-D0  linux/vmw_vmci_defs.h, uapi/linux/vm_sockets.h
 0x09  all    linux/raid/md_u.h
 0x10  00-0F  drivers/char/s390/vmcp.h
 0x10  10-1F  arch/s390/include/uapi/sclp_ctl.h
 0x10  20-2F  arch/s390/include/uapi/asm/hypfs.h
-0x12  all    linux/fs.h                                              BLK* ioctls
+0x12  all    linux/fs.h                                                BLK* ioctls
              linux/blkpg.h
              linux/blkzoned.h
              linux/blk-crypto.h
-0x15  all    linux/fs.h                                              FS_IOC_* ioctls
-0x1b  all                                                            InfiniBand Subsystem
-                                                                     <http://infiniband.sourceforge.net/>
+0x15  all    linux/fs.h                                                FS_IOC_* ioctls
+0x1b  all                                                              InfiniBand Subsystem
+                                                                       <http://infiniband.sourceforge.net/>
 0x20  all    drivers/cdrom/cm206.h
 0x22  all    scsi/sg.h
-0x3E  00-0F  linux/counter.h                                         <mailto:linux-iio@vger.kernel.org>
+0x3E  00-0F  linux/counter.h                                           <mailto:linux-iio@vger.kernel.org>
 '!'   00-1F  uapi/linux/seccomp.h
-'#'   00-3F                                                          IEEE 1394 Subsystem
-                                                                     Block for the entire subsystem
+'#'   00-3F                                                            IEEE 1394 Subsystem
+                                                                       Block for the entire subsystem
 '$'   00-0F  linux/perf_counter.h, linux/perf_event.h
-'%'   00-0F  include/uapi/linux/stm.h                                System Trace Module subsystem
-                                                                     <mailto:alexander.shishkin@linux.intel.com>
+'%'   00-0F  include/uapi/linux/stm.h                                  System Trace Module subsystem
+                                                                       <mailto:alexander.shishkin@linux.intel.com>
 '&'   00-07  drivers/firewire/nosy-user.h
-'*'   00-1F  uapi/linux/user_events.h                                User Events Subsystem
-                                                                     <mailto:linux-trace-kernel@vger.kernel.org>
-'1'   00-1F  linux/timepps.h                                         PPS kit from Ulrich Windl
-                                                                     <ftp://ftp.de.kernel.org/pub/linux/daemons/ntp/PPS/>
+'*'   00-1F  uapi/linux/user_events.h                                  User Events Subsystem
+                                                                       <mailto:linux-trace-kernel@vger.kernel.org>
+'1'   00-1F  linux/timepps.h                                           PPS kit from Ulrich Windl
+                                                                       <ftp://ftp.de.kernel.org/pub/linux/daemons/ntp/PPS/>
 '2'   01-04  linux/i2o.h
-'3'   00-0F  drivers/s390/char/raw3270.h                             conflict!
-'3'   00-1F  linux/suspend_ioctls.h,                                 conflict!
+'3'   00-0F  drivers/s390/char/raw3270.h                               conflict!
+'3'   00-1F  linux/suspend_ioctls.h,                                   conflict!
              kernel/power/user.c
-'8'   all                                                            SNP8023 advanced NIC card
-                                                                     <mailto:mcr@solidum.com>
+'8'   all                                                              SNP8023 advanced NIC card
+                                                                       <mailto:mcr@solidum.com>
 ';'   64-7F  linux/vfio.h
 ';'   80-FF  linux/iommufd.h
-'='   00-3f  uapi/linux/ptp_clock.h                                  <mailto:richardcochran@gmail.com>
-'@'   00-0F  linux/radeonfb.h                                        conflict!
-'@'   00-0F  drivers/video/aty/aty128fb.c                            conflict!
-'A'   00-1F  linux/apm_bios.h                                        conflict!
-'A'   00-0F  linux/agpgart.h,                                        conflict!
+'='   00-3f  uapi/linux/ptp_clock.h                                    <mailto:richardcochran@gmail.com>
+'@'   00-0F  linux/radeonfb.h                                          conflict!
+'@'   00-0F  drivers/video/aty/aty128fb.c                              conflict!
+'A'   00-1F  linux/apm_bios.h                                          conflict!
+'A'   00-0F  linux/agpgart.h,                                          conflict!
              drivers/char/agp/compat_ioctl.h
-'A'   00-7F  sound/asound.h                                          conflict!
-'B'   00-1F  linux/cciss_ioctl.h                                     conflict!
-'B'   00-0F  include/linux/pmu.h                                     conflict!
-'B'   C0-FF  advanced bbus                                           <mailto:maassen@uni-freiburg.de>
-'B'   00-0F  xen/xenbus_dev.h                                        conflict!
-'C'   all    linux/soundcard.h                                       conflict!
-'C'   01-2F  linux/capi.h                                            conflict!
-'C'   F0-FF  drivers/net/wan/cosa.h                                  conflict!
+'A'   00-7F  sound/asound.h                                            conflict!
+'B'   00-1F  linux/cciss_ioctl.h                                       conflict!
+'B'   00-0F  include/linux/pmu.h                                       conflict!
+'B'   C0-FF  advanced bbus                                             <mailto:maassen@uni-freiburg.de>
+'B'   00-0F  xen/xenbus_dev.h                                          conflict!
+'C'   all    linux/soundcard.h                                         conflict!
+'C'   01-2F  linux/capi.h                                              conflict!
+'C'   F0-FF  drivers/net/wan/cosa.h                                    conflict!
 'D'   all    arch/s390/include/asm/dasd.h
-'D'   40-5F  drivers/scsi/dpt/dtpi_ioctl.h                           Dead since 2022
+'D'   40-5F  drivers/scsi/dpt/dtpi_ioctl.h                             Dead since 2022
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
+'E'   all    linux/input.h                                             conflict!
+'E'   00-0F  xen/evtchn.h                                              conflict!
+'F'   all    linux/fb.h                                                conflict!
+'F'   01-02  drivers/scsi/pmcraid.h                                    conflict!
+'F'   20     drivers/video/fsl-diu-fb.h                                conflict!
+'F'   20     linux/ivtvfb.h                                            conflict!
+'F'   20     linux/matroxfb.h                                          conflict!
+'F'   20     drivers/video/aty/atyfb_base.c                            conflict!
+'F'   00-0F  video/da8xx-fb.h                                          conflict!
+'F'   80-8F  linux/arcfb.h                                             conflict!
+'F'   DD     video/sstfb.h                                             conflict!
+'G'   00-3F  drivers/misc/sgi-gru/grulib.h                             conflict!
+'G'   00-0F  xen/gntalloc.h, xen/gntdev.h                              conflict!
+'H'   00-7F  linux/hiddev.h                                            conflict!
+'H'   00-0F  linux/hidraw.h                                            conflict!
+'H'   01     linux/mei.h                                               conflict!
+'H'   02     linux/mei.h                                               conflict!
+'H'   03     linux/mei.h                                               conflict!
+'H'   00-0F  sound/asound.h                                            conflict!
+'H'   20-40  sound/asound_fm.h                                         conflict!
+'H'   80-8F  sound/sfnt_info.h                                         conflict!
+'H'   10-8F  sound/emu10k1.h                                           conflict!
+'H'   10-1F  sound/sb16_csp.h                                          conflict!
+'H'   10-1F  sound/hda_hwdep.h                                         conflict!
+'H'   40-4F  sound/hdspm.h                                             conflict!
+'H'   40-4F  sound/hdsp.h                                              conflict!
 'H'   90     sound/usb/usx2y/usb_stream.h
-'H'   00-0F  uapi/misc/habanalabs.h                                  conflict!
+'H'   00-0F  uapi/misc/habanalabs.h                                    conflict!
 'H'   A0     uapi/linux/usb/cdc-wdm.h
-'H'   C0-F0  net/bluetooth/hci.h                                     conflict!
-'H'   C0-DF  net/bluetooth/hidp/hidp.h                               conflict!
-'H'   C0-DF  net/bluetooth/cmtp/cmtp.h                               conflict!
-'H'   C0-DF  net/bluetooth/bnep/bnep.h                               conflict!
-'H'   F1     linux/hid-roccat.h                                      <mailto:erazor_de@users.sourceforge.net>
+'H'   C0-F0  net/bluetooth/hci.h                                       conflict!
+'H'   C0-DF  net/bluetooth/hidp/hidp.h                                 conflict!
+'H'   C0-DF  net/bluetooth/cmtp/cmtp.h                                 conflict!
+'H'   C0-DF  net/bluetooth/bnep/bnep.h                                 conflict!
+'H'   F1     linux/hid-roccat.h                                        <mailto:erazor_de@users.sourceforge.net>
 'H'   F8-FA  sound/firewire.h
-'I'   all    linux/isdn.h                                            conflict!
-'I'   00-0F  drivers/isdn/divert/isdn_divert.h                       conflict!
-'I'   40-4F  linux/mISDNif.h                                         conflict!
+'I'   all    linux/isdn.h                                              conflict!
+'I'   00-0F  drivers/isdn/divert/isdn_divert.h                         conflict!
+'I'   40-4F  linux/mISDNif.h                                           conflict!
 'K'   all    linux/kd.h
-'L'   00-1F  linux/loop.h                                            conflict!
-'L'   10-1F  drivers/scsi/mpt3sas/mpt3sas_ctl.h                      conflict!
-'L'   E0-FF  linux/ppdd.h                                            encrypted disk device driver
-                                                                     <http://linux01.gwdg.de/~alatham/ppdd.html>
-'M'   all    linux/soundcard.h                                       conflict!
-'M'   01-16  mtd/mtd-abi.h                                           conflict!
+'L'   00-1F  linux/loop.h                                              conflict!
+'L'   10-1F  drivers/scsi/mpt3sas/mpt3sas_ctl.h                        conflict!
+'L'   E0-FF  linux/ppdd.h                                              encrypted disk device driver
+                                                                       <http://linux01.gwdg.de/~alatham/ppdd.html>
+'M'   all    linux/soundcard.h                                         conflict!
+'M'   01-16  mtd/mtd-abi.h                                             conflict!
       and    drivers/mtd/mtdchar.c
 'M'   01-03  drivers/scsi/megaraid/megaraid_sas.h
-'M'   00-0F  drivers/video/fsl-diu-fb.h                              conflict!
+'M'   00-0F  drivers/video/fsl-diu-fb.h                                conflict!
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
+'N'   80-8F  uapi/linux/ntsync.h                                       NT synchronization primitives
+                                                                       <mailto:wine-devel@winehq.org>
+'O'   00-06  mtd/ubi-user.h                                            UBI
+'P'   all    linux/soundcard.h                                         conflict!
+'P'   60-6F  sound/sscape_ioctl.h                                      conflict!
+'P'   00-0F  drivers/usb/class/usblp.c                                 conflict!
+'P'   01-09  drivers/misc/pci_endpoint_test.c                          conflict!
+'P'   00-0F  xen/privcmd.h                                             conflict!
+'P'   00-05  linux/tps6594_pfsm.h                                      conflict!
 'Q'   all    linux/soundcard.h
-'R'   00-1F  linux/random.h                                          conflict!
-'R'   01     linux/rfkill.h                                          conflict!
+'R'   00-1F  linux/random.h                                            conflict!
+'R'   01     linux/rfkill.h                                            conflict!
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
+'S'   all    linux/cdrom.h                                             conflict!
+'S'   80-81  scsi/scsi_ioctl.h                                         conflict!
+'S'   82-FF  scsi/scsi.h                                               conflict!
+'S'   00-7F  sound/asequencer.h                                        conflict!
+'T'   all    linux/soundcard.h                                         conflict!
+'T'   00-AF  sound/asound.h                                            conflict!
+'T'   all    arch/x86/include/asm/ioctls.h                             conflict!
+'T'   C0-DF  linux/if_tun.h                                            conflict!
+'U'   all    sound/asound.h                                            conflict!
+'U'   00-CF  linux/uinput.h                                            conflict!
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
+'V'   all    linux/vt.h                                                conflict!
+'V'   all    linux/videodev2.h                                         conflict!
+'V'   C0     linux/ivtvfb.h                                            conflict!
+'V'   C0     linux/ivtv.h                                              conflict!
+'V'   C0     media/si4713.h                                            conflict!
+'W'   00-1F  linux/watchdog.h                                          conflict!
+'W'   00-1F  linux/wanrouter.h                                         conflict! (pre 3.9)
+'W'   00-3F  sound/asound.h                                            conflict!
 'W'   40-5F  drivers/pci/switch/switchtec.c
 'W'   60-61  linux/watch_queue.h
-'X'   all    fs/xfs/xfs_fs.h,                                        conflict!
+'X'   all    fs/xfs/xfs_fs.h,                                          conflict!
              fs/xfs/linux-2.6/xfs_ioctl32.h,
              include/linux/falloc.h,
              linux/fs.h,
-'X'   all    fs/ocfs2/ocfs_fs.h                                      conflict!
-'X'   01     linux/pktcdvd.h                                         conflict!
+'X'   all    fs/ocfs2/ocfs_fs.h                                        conflict!
+'X'   01     linux/pktcdvd.h                                           conflict!
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
+'['   00-3F  linux/usb/tmc.h                                           USB Test and Measurement Devices
+                                                                       <mailto:gregkh@linuxfoundation.org>
+'a'   all    linux/atm*.h, linux/sonet.h                               ATM on linux
+                                                                       <http://lrcwww.epfl.ch/>
+'a'   00-0F  drivers/crypto/qat/qat_common/adf_cfg_common.h            conflict! qat driver
+'b'   00-FF                                                            conflict! bit3 vme host bridge
+                                                                       <mailto:natalia@nikhefk.nikhef.nl>
+'b'   00-0F  linux/dma-buf.h                                           conflict!
+'c'   00-7F  linux/comstats.h                                          conflict!
+'c'   00-7F  linux/coda.h                                              conflict!
+'c'   00-1F  linux/chio.h                                              conflict!
+'c'   80-9F  arch/s390/include/asm/chsc.h                              conflict!
 'c'   A0-AF  arch/x86/include/asm/msr.h conflict!
-'d'   00-FF  linux/char/drm/drm.h                                    conflict!
-'d'   02-40  pcmcia/ds.h                                             conflict!
+'d'   00-FF  linux/char/drm/drm.h                                      conflict!
+'d'   02-40  pcmcia/ds.h                                               conflict!
 'd'   F0-FF  linux/digi1.h
-'e'   all    linux/digi1.h                                           conflict!
-'f'   00-1F  linux/ext2_fs.h                                         conflict!
-'f'   00-1F  linux/ext3_fs.h                                         conflict!
-'f'   00-0F  fs/jfs/jfs_dinode.h                                     conflict!
-'f'   00-0F  fs/ext4/ext4.h                                          conflict!
-'f'   00-0F  linux/fs.h                                              conflict!
-'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                     conflict!
+'e'   all    linux/digi1.h                                             conflict!
+'f'   00-1F  linux/ext2_fs.h                                           conflict!
+'f'   00-1F  linux/ext3_fs.h                                           conflict!
+'f'   00-0F  fs/jfs/jfs_dinode.h                                       conflict!
+'f'   00-0F  fs/ext4/ext4.h                                            conflict!
+'f'   00-0F  linux/fs.h                                                conflict!
+'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                       conflict!
 'f'   13-27  linux/fscrypt.h
 'f'   81-8F  linux/fsverity.h
 'g'   00-0F  linux/usb/gadgetfs.h
 'g'   20-2F  linux/usb/g_printer.h
-'h'   00-7F                                                          conflict! Charon filesystem
-                                                                     <mailto:zapman@interlan.net>
-'h'   00-1F  linux/hpet.h                                            conflict!
+'h'   00-7F                                                            conflict! Charon filesystem
+                                                                       <mailto:zapman@interlan.net>
+'h'   00-1F  linux/hpet.h                                              conflict!
 'h'   80-8F  fs/hfsplus/ioctl.c
-'i'   00-3F  linux/i2o-dev.h                                         conflict!
-'i'   0B-1F  linux/ipmi.h                                            conflict!
+'i'   00-3F  linux/i2o-dev.h                                           conflict!
+'i'   0B-1F  linux/ipmi.h                                              conflict!
 'i'   80-8F  linux/i8k.h
-'i'   90-9F  `linux/iio/*.h`                                         IIO
+'i'   90-9F  `linux/iio/*.h`                                           IIO
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
+'k'   00-0F  linux/spi/spidev.h                                        conflict!
+'k'   00-05  video/kyro.h                                              conflict!
+'k'   10-17  linux/hsi/hsi_char.h                                      HSI character device
+'l'   00-3F  linux/tcfs_fs.h                                           transparent cryptographic file system
+                                                                       <http://web.archive.org/web/%2A/http://mikonos.dia.unisa.it/tcfs>
+'l'   40-7F  linux/udf_fs_i.h                                          in development:
+                                                                       <https://github.com/pali/udftools>
+'m'   00-09  linux/mmtimer.h                                           conflict!
+'m'   all    linux/mtio.h                                              conflict!
+'m'   all    linux/soundcard.h                                         conflict!
+'m'   all    linux/synclink.h                                          conflict!
+'m'   00-19  drivers/message/fusion/mptctl.h                           conflict!
+'m'   00     drivers/scsi/megaraid/megaraid_ioctl.h                    conflict!
 'n'   00-7F  linux/ncp_fs.h and fs/ncpfs/ioctl.c
-'n'   80-8F  uapi/linux/nilfs2_api.h                                 NILFS2
-'n'   E0-FF  linux/matroxfb.h                                        matroxfb
-'o'   00-1F  fs/ocfs2/ocfs2_fs.h                                     OCFS2
-'o'   00-03  mtd/ubi-user.h                                          conflict! (OCFS2 and UBI overlaps)
-'o'   40-41  mtd/ubi-user.h                                          UBI
-'o'   01-A1  `linux/dvb/*.h`                                         DVB
-'p'   00-0F  linux/phantom.h                                         conflict! (OpenHaptics needs this)
-'p'   00-1F  linux/rtc.h                                             conflict!
+'n'   80-8F  uapi/linux/nilfs2_api.h                                   NILFS2
+'n'   E0-FF  linux/matroxfb.h                                          matroxfb
+'o'   00-1F  fs/ocfs2/ocfs2_fs.h                                       OCFS2
+'o'   00-03  mtd/ubi-user.h                                            conflict! (OCFS2 and UBI overlaps)
+'o'   40-41  mtd/ubi-user.h                                            UBI
+'o'   01-A1  `linux/dvb/*.h`                                           DVB
+'p'   00-0F  linux/phantom.h                                           conflict! (OpenHaptics needs this)
+'p'   00-1F  linux/rtc.h                                               conflict!
 'p'   40-7F  linux/nvram.h
-'p'   80-9F  linux/ppdev.h                                           user-space parport
-                                                                     <mailto:tim@cyberelk.net>
-'p'   A1-A5  linux/pps.h                                             LinuxPPS
-'p'   B1-B3  linux/pps_gen.h                                         LinuxPPS
-                                                                     <mailto:giometti@linux.it>
+'p'   80-9F  linux/ppdev.h                                             user-space parport
+                                                                       <mailto:tim@cyberelk.net>
+'p'   A1-A5  linux/pps.h                                               LinuxPPS
+'p'   B1-B3  linux/pps_gen.h                                           LinuxPPS
+                                                                       <mailto:giometti@linux.it>
 'q'   00-1F  linux/serio.h
-'q'   80-FF  linux/telephony.h                                       Internet PhoneJACK, Internet LineJACK
-             linux/ixjuser.h                                         <http://web.archive.org/web/%2A/http://www.quicknet.net>
+'q'   80-FF  linux/telephony.h                                         Internet PhoneJACK, Internet LineJACK
+             linux/ixjuser.h                                           <http://web.archive.org/web/%2A/http://www.quicknet.net>
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
+'t'   90-91  linux/toshiba.h                                           toshiba and toshiba_acpi SMM
+'u'   00-1F  linux/smb_fs.h                                            gone
+'u'   00-2F  linux/ublk_cmd.h                                          conflict!
+'u'   20-3F  linux/uvcvideo.h                                          USB video class host driver
+'u'   40-4f  linux/udmabuf.h                                           userspace dma-buf misc device
+'v'   00-1F  linux/ext2_fs.h                                           conflict!
+'v'   00-1F  linux/fs.h                                                conflict!
+'v'   00-0F  linux/sonypi.h                                            conflict!
+'v'   00-0F  media/v4l2-subdev.h                                       conflict!
+'v'   20-27  arch/powerpc/include/uapi/asm/vas-api.h                   VAS API
+'v'   C0-FF  linux/meye.h                                              conflict!
+'w'   all                                                              CERN SCI driver
+'y'   00-1F                                                            packet based user level communications
+                                                                       <mailto:zapman@interlan.net>
+'z'   00-3F                                                            CAN bus card conflict!
+                                                                       <mailto:hdstich@connectu.ulm.circular.de>
+'z'   40-7F                                                            CAN bus card conflict!
+                                                                       <mailto:oe@port.de>
+'z'   10-4F  drivers/s390/crypto/zcrypt_api.h                          conflict!
 '|'   00-7F  linux/media.h
-'|'   80-9F  samples/                                                Any sample and example drivers
+'|'   80-9F  samples/                                                  Any sample and example drivers
 0x80  00-1F  linux/fb.h
 0x81  00-1F  linux/vduse.h
 0x89  00-06  arch/x86/include/asm/sockios.h
 0x89  0B-DF  linux/sockios.h
-0x89  E0-EF  linux/sockios.h                                         SIOCPROTOPRIVATE range
-0x89  F0-FF  linux/sockios.h                                         SIOCDEVPRIVATE range
+0x89  E0-EF  linux/sockios.h                                           SIOCPROTOPRIVATE range
+0x89  F0-FF  linux/sockios.h                                           SIOCDEVPRIVATE range
 0x8A  00-1F  linux/eventpoll.h
 0x8B  all    linux/wireless.h
-0x8C  00-3F                                                          WiNRADiO driver
-                                                                     <http://www.winradio.com.au/>
+0x8C  00-3F                                                            WiNRADiO driver
+                                                                       <http://www.winradio.com.au/>
 0x90  00     drivers/cdrom/sbpcd.h
 0x92  00-0F  drivers/usb/mon/mon_bin.c
 0x93  60-7F  linux/auto_fs.h
-0x94  all    fs/btrfs/ioctl.h                                        Btrfs filesystem
-             and linux/fs.h                                          some lifted to vfs/generic
-0x97  00-7F  fs/ceph/ioctl.h                                         Ceph file system
-0x99  00-0F                                                          537-Addinboard driver
-                                                                     <mailto:buk@buks.ipn.de>
+0x94  all    fs/btrfs/ioctl.h                                          Btrfs filesystem
+             and linux/fs.h                                            some lifted to vfs/generic
+0x97  00-7F  fs/ceph/ioctl.h                                           Ceph file system
+0x99  00-0F                                                            537-Addinboard driver
+                                                                       <mailto:buk@buks.ipn.de>
 0x9A  00-0F  include/uapi/fwctl/fwctl.h
-0xA0  all    linux/sdp/sdp.h                                         Industrial Device Project
-                                                                     <mailto:kenji@bitgate.com>
-0xA1  0      linux/vtpm_proxy.h                                      TPM Emulator Proxy Driver
-0xA2  all    uapi/linux/acrn.h                                       ACRN hypervisor
-0xA3  80-8F                                                          Port ACL  in development:
-                                                                     <mailto:tlewis@mindspring.com>
+0xA0  all    linux/sdp/sdp.h                                           Industrial Device Project
+                                                                       <mailto:kenji@bitgate.com>
+0xA1  0      linux/vtpm_proxy.h                                        TPM Emulator Proxy Driver
+0xA2  all    uapi/linux/acrn.h                                         ACRN hypervisor
+0xA3  80-8F                                                            Port ACL  in development:
+                                                                       <mailto:tlewis@mindspring.com>
 0xA3  90-9F  linux/dtlk.h
-0xA4  00-1F  uapi/linux/tee.h                                        Generic TEE subsystem
-0xA4  00-1F  uapi/asm/sgx.h                                          <mailto:linux-sgx@vger.kernel.org>
-0xA5  01-05  linux/surface_aggregator/cdev.h                         Microsoft Surface Platform System Aggregator
-                                                                     <mailto:luzmaximilian@gmail.com>
-0xA5  20-2F  linux/surface_aggregator/dtx.h                          Microsoft Surface DTX driver
-                                                                     <mailto:luzmaximilian@gmail.com>
+0xA4  00-1F  uapi/linux/tee.h                                          Generic TEE subsystem
+0xA4  00-1F  uapi/asm/sgx.h                                            <mailto:linux-sgx@vger.kernel.org>
+0xA5  01-05  linux/surface_aggregator/cdev.h                           Microsoft Surface Platform System Aggregator
+                                                                       <mailto:luzmaximilian@gmail.com>
+0xA5  20-2F  linux/surface_aggregator/dtx.h                            Microsoft Surface DTX driver
+                                                                       <mailto:luzmaximilian@gmail.com>
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
-                                                                     <mailto:linuxppc-dev@lists.ozlabs.org>
-0xB2  01-02  arch/powerpc/include/uapi/asm/papr-sysparm.h            powerpc/pseries system parameter API
-                                                                     <mailto:linuxppc-dev@lists.ozlabs.org>
-0xB2  03-05  arch/powerpc/include/uapi/asm/papr-indices.h            powerpc/pseries indices API
-                                                                     <mailto:linuxppc-dev@lists.ozlabs.org>
-0xB2  06-07  arch/powerpc/include/uapi/asm/papr-platform-dump.h      powerpc/pseries Platform Dump API
-                                                                     <mailto:linuxppc-dev@lists.ozlabs.org>
-0xB2  08     powerpc/include/uapi/asm/papr-physical-attestation.h    powerpc/pseries Physical Attestation API
-                                                                     <mailto:linuxppc-dev@lists.ozlabs.org>
+0xAD  00                                                               Netfilter device in development:
+                                                                       <mailto:rusty@rustcorp.com.au>
+0xAE  00-1F  linux/kvm.h                                               Kernel-based Virtual Machine
+                                                                       <mailto:kvm@vger.kernel.org>
+0xAE  40-FF  linux/kvm.h                                               Kernel-based Virtual Machine
+                                                                       <mailto:kvm@vger.kernel.org>
+0xAE  20-3F  linux/nitro_enclaves.h                                    Nitro Enclaves
+0xAF  00-1F  linux/fsl_hypervisor.h                                    Freescale hypervisor
+0xB0  all                                                              RATIO devices in development:
+                                                                       <mailto:vgo@ratio.de>
+0xB1  00-1F                                                            PPPoX
+                                                                       <mailto:mostrows@styx.uwaterloo.ca>
+0xB2  00     arch/powerpc/include/uapi/asm/papr-vpd.h                  powerpc/pseries VPD API
+                                                                       <mailto:linuxppc-dev@lists.ozlabs.org>
+0xB2  01-02  arch/powerpc/include/uapi/asm/papr-sysparm.h              powerpc/pseries system parameter API
+                                                                       <mailto:linuxppc-dev@lists.ozlabs.org>
+0xB2  03-05  arch/powerpc/include/uapi/asm/papr-indices.h              powerpc/pseries indices API
+                                                                       <mailto:linuxppc-dev@lists.ozlabs.org>
+0xB2  06-07  arch/powerpc/include/uapi/asm/papr-platform-dump.h        powerpc/pseries Platform Dump API
+                                                                       <mailto:linuxppc-dev@lists.ozlabs.org>
+0xB2  08     powerpc/include/uapi/asm/papr-physical-attestation.h      powerpc/pseries Physical Attestation API
+                                                                       <mailto:linuxppc-dev@lists.ozlabs.org>
 0xB3  00     linux/mmc/ioctl.h
-0xB4  00-0F  linux/gpio.h                                            <mailto:linux-gpio@vger.kernel.org>
-0xB5  00-0F  uapi/linux/rpmsg.h                                      <mailto:linux-remoteproc@vger.kernel.org>
+0xB4  00-0F  linux/gpio.h                                              <mailto:linux-gpio@vger.kernel.org>
+0xB5  00-0F  uapi/linux/rpmsg.h                                        <mailto:linux-remoteproc@vger.kernel.org>
 0xB6  all    linux/fpga-dfl.h
-0xB7  all    uapi/linux/remoteproc_cdev.h                            <mailto:linux-remoteproc@vger.kernel.org>
-0xB7  all    uapi/linux/nsfs.h                                       <mailto:Andrei Vagin <avagin@openvz.org>>
-0xB8  01-02  uapi/misc/mrvl_cn10k_dpi.h                              Marvell CN10K DPI driver
-0xB8  all    uapi/linux/mshv.h                                       Microsoft Hyper-V /dev/mshv driver
-                                                                     <mailto:linux-hyperv@vger.kernel.org>
+0xB7  all    uapi/linux/remoteproc_cdev.h                              <mailto:linux-remoteproc@vger.kernel.org>
+0xB7  all    uapi/linux/nsfs.h                                         <mailto:Andrei Vagin <avagin@openvz.org>>
+0xB8  01-02  uapi/misc/mrvl_cn10k_dpi.h                                Marvell CN10K DPI driver
+0xB8  all    uapi/linux/mshv.h                                         Microsoft Hyper-V /dev/mshv driver
+                                                                       <mailto:linux-hyperv@vger.kernel.org>
 0xC0  00-0F  linux/usb/iowarrior.h
-0xCA  00-0F  uapi/misc/cxl.h                                         Dead since 6.15
+0xCA  00-0F  uapi/misc/cxl.h                                           Dead since 6.15
 0xCA  10-2F  uapi/misc/ocxl.h
-0xCA  80-BF  uapi/scsi/cxlflash_ioctl.h                              Dead since 6.15
-0xCB  00-1F                                                          CBM serial IEC bus in development:
-                                                                     <mailto:michael.klein@puffin.lb.shuttle.de>
-0xCC  00-0F  drivers/misc/ibmvmc.h                                   pseries VMC driver
-0xCD  01     linux/reiserfs_fs.h                                     Dead since 6.13
-0xCE  01-02  uapi/linux/cxl_mem.h                                    Compute Express Link Memory Devices
+0xCA  80-BF  uapi/scsi/cxlflash_ioctl.h                                Dead since 6.15
+0xCB  00-1F                                                            CBM serial IEC bus in development:
+                                                                       <mailto:michael.klein@puffin.lb.shuttle.de>
+0xCC  00-0F  drivers/misc/ibmvmc.h                                     pseries VMC driver
+0xCD  01     linux/reiserfs_fs.h                                       Dead since 6.13
+0xCE  01-02  uapi/linux/cxl_mem.h                                      Compute Express Link Memory Devices
 0xCF  02     fs/smb/client/cifs_ioctl.h
 0xDB  00-0F  drivers/char/mwave/mwavepub.h
-0xDD  00-3F                                                          ZFCP device driver see drivers/s390/scsi/
-                                                                     <mailto:aherrman@de.ibm.com>
+0xDD  00-3F                                                            ZFCP device driver see drivers/s390/scsi/
+                                                                       <mailto:aherrman@de.ibm.com>
 0xE5  00-3F  linux/fuse.h
-0xEC  00-01  drivers/platform/chrome/cros_ec_dev.h                   ChromeOS EC driver
-0xEE  00-09  uapi/linux/pfrut.h                                      Platform Firmware Runtime Update and Telemetry
-0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                     sisfb (in development)
-                                                                     <mailto:thomas@winischhofer.net>
-0xF6  all                                                            LTTng Linux Trace Toolkit Next Generation
-                                                                     <mailto:mathieu.desnoyers@efficios.com>
-0xF8  all    arch/x86/include/uapi/asm/amd_hsmp.h                    AMD HSMP EPYC system management interface driver
-                                                                     <mailto:nchatrad@amd.com>
+0xEC  00-01  drivers/platform/chrome/cros_ec_dev.h                     ChromeOS EC driver
+0xEE  00-09  uapi/linux/pfrut.h                                        Platform Firmware Runtime Update and Telemetry
+0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                       sisfb (in development)
+                                                                       <mailto:thomas@winischhofer.net>
+0xF6  all                                                              LTTng Linux Trace Toolkit Next Generation
+                                                                       <mailto:mathieu.desnoyers@efficios.com>
+0xF8  all    arch/x86/include/uapi/asm/amd_hsmp.h                      AMD HSMP EPYC system management interface driver
+                                                                       <mailto:nchatrad@amd.com>
 0xFD  all    linux/dm-ioctl.h
 0xFE  all    linux/isst_if.h
-====  =====  ======================================================= ================================================================
+====  =====  ========================================================= ================================================================
-- 
An old man doll... just what I always wanted! - Clara


