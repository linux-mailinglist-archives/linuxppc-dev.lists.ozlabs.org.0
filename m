Return-Path: <linuxppc-dev+bounces-10238-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1931FB0344A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jul 2025 03:58:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bgQSQ1svtz3bnq;
	Mon, 14 Jul 2025 11:57:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752458262;
	cv=none; b=gJ28pHj3wvxMXC64f/Pctzxfg0Hq9Ci3tDMtPNncf++GDxhhhkhvKwPQhcMkQiGnlu28I8mXdvA/QkBgoTRe9HuknY+/7uLDneAjQxHKrtujLeZQR8b+V5K+d6s4xMIPHaw6nmUpYya7nUbK5FwRHLR4YHhOOGpjw04ZFAsIA5bw40gH5svkVIJuuN1jvn6tMMMI2psiDzrbJY8bEDJEdq340p9sFYKRBY6oxkQtdGk96+hos9gl7Tm3jyQq5GrAogh6MAYziLdFjpYfTCR8bN6ZQGiCewxGqjj7EFsdBAhsFYbHoUTEUXasNJ9r1ujuUxV70GjMBqFOIKxKMP2M0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752458262; c=relaxed/relaxed;
	bh=3/dOIAQe3z0lBW/qp1f4FMrR2pjSoGcb0NV7dviKMtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKilwBIwZ/L6F4X9Bg2o9eoZrm/5scfntQZaB7XOW5/nRB2V7iKCACMg6GEC/gPObzbZUtzIStjx7srgOw165sa6XOy+EoglfRM4MIxCpvj16020MonPMFd3z0in07H0E3P/6CMUI4Du3XKd9AaXt/RPz2nIWJbXmnYax5JNdyKbvNNzYTvtsFzS1AXzyNwJyqYsIXXYslzaR76jN8wjJO52SMU7u2DOwEtR+LO5rd9y5J/wcB9o0DbBEpgd+QGzHBLprdu2eR8JTPKXm5iA6jfVx4CnPxZsAoyXdtf/ZuojXT16+fp0xzxq+0LoPyILPWCmycHqxHjYDYuasTjmFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nteHgPjo; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nteHgPjo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bgQSL2bZCz3blv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jul 2025 11:57:38 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so663731366b.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 18:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752458255; x=1753063055; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/dOIAQe3z0lBW/qp1f4FMrR2pjSoGcb0NV7dviKMtc=;
        b=nteHgPjoRn9dAKxGv2Mpkp8oz6sLQ+nyxi2RQ81kLzP3sZyjnLJCXPTZaYOOPSrlg/
         H1pukuR3WCdS4Bw54D07C4LEUvbMbYnf9JRFKl5fRfO/jJKOCh/UlAQvPaLJXPbuJEm6
         Zd/PyomvNGOG0ZgYnCSR0BQ8vpU9MVCab/t19K7gMq6QhzMVMcq9Ug5jGTDpWy+XjOmF
         FJoV0loEXxRjkEzRvwLf1BUpYPiPduEFaj5/L7cyeXDyT0JwQjR7cofwL8680PT9Skw3
         k2WhiWCi7V8kLJ0ZiN1MtQYoMEDb6QsyCXEtmqv5okgrZZNGJByNc0KYHtDTrkOQ6y9F
         0NQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752458255; x=1753063055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/dOIAQe3z0lBW/qp1f4FMrR2pjSoGcb0NV7dviKMtc=;
        b=oSZ8jd3m6or4YPr/QKwcxgh4eFOWczY/kqprArEs6edD+AQkVTOoNr9JZNFyWbctd4
         VZf+TmaXChyM6vxa103ZwOFdvUFPUH2jPzHPvjHDjBaYsx9Af3DAg0lUIL4wH5fQc8kX
         Qn7adtcgWaBQtkN1sL6HTEpsIIAjyq+S3cLzB/9w+qKqFdeKgwdD8xC3f3+Z6n7MS57c
         D8az1PMndMpLib8iAwhOxZgOAlU0yh3ir9Qq8F6uS1bLKLCxhF39VEebTeaH20LBaBoe
         CiCz8k8WKEHclp3zvMN/CHVOU8wYrIi4e8sM4laKMDh9DUSF8uLSb/xcjY8MUBybH7N1
         fFlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA6y5XIAXqGlGdGA9OqbHCZnGCBIs+uBDJhQxuRn3vWE+3RBZVF89xxA6rVVaPi7VFSKprh/Rlo4j0Z6M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxomPp8VasyplIlNNpDFG6IfEgXx6p6KszH/wszc2pKOG9Jbz4o
	h2VI1HmFpvankQyOuOHpyepF6ss/ydQ7l2NVMEnI2JWL3ec1N0ih6RUB
X-Gm-Gg: ASbGnctURSHIJ4d9Y3FyIUNpdibU31pE00UJPDRjtvNmJPwu0WSNJ993iKOWNjUeA2H
	3TAmsEXgh8AkSPmkdhHYiTJPutlumF6H4x30jNapas8JmJBodRsxnUozYFk6dfwG6VktSM6LPIB
	j3LioBye4Xs5LTG1Z0R6j9RhlIVveqIK5AOP4u0wJWnt7E/M5SCTgCJzERHakwUHHm49K0K9+R2
	rbzUIKhu/+l1eL7mpbieNzCu1drcUKP96J2NRCwdjNmqBi50sSa6ReZfn2ZT3oAMwjDszMXwE8o
	PyFX7gfrr7tHeCM/am6ZgD+UMqWJG2KRbRrtr1w08we/r0cRXX8lysA9uSsT9p4Z5oMq5BgmUNc
	DdmThkN4UftJOULMnWf9vhkX4sHAxCiIB
X-Google-Smtp-Source: AGHT+IGHVsBEjxFBTi/AJgHAbugFKq/uqhDkEURytWdGiKNOT0ccR9m10tFmGJJVBXiPjIim11KkZg==
X-Received: by 2002:a17:907:1c9f:b0:ad9:85d3:e141 with SMTP id a640c23a62f3a-ae6fcb30bb6mr1197549466b.53.1752458254820;
        Sun, 13 Jul 2025 18:57:34 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e91a0bsm731636966b.7.2025.07.13.18.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 18:57:32 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 7EF50420A819; Mon, 14 Jul 2025 08:57:26 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Richard Cochran <richardcochran@gmail.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nathan Lynch <nathanl@linux.ibm.com>
Subject: [PATCH v2 2/3] Documentation: ioctl-number: Extend "Include File" column width
Date: Mon, 14 Jul 2025 08:57:09 +0700
Message-ID: <20250714015711.14525-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714015711.14525-1-bagasdotme@gmail.com>
References: <20250714015711.14525-1-bagasdotme@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=51537; i=bagasdotme@gmail.com; h=from:subject; bh=eWi4z/dDdWsn0DUyZYI0FNKJzLb7pgESiWHsung+LjE=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBklSTlnK3p3nTfIE7d7yj3hV//SBNZ5jE/OT+7UOVnc5 HDc8+irjlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEzkXDbD/6pDO64IzJrXLFX0 z6pc4Os5pRUp8yf6hW5OsmXKvqEa85Dhf/Xpwoj/sZztF1QO72LvKb+7RH8jf4jMpLlTzkWlmeh e5wMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_SBL_A autolearn=disabled version=4.0.1
	OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Extend width of "Include File" column to fit full path to
papr-physical-attestation.h in later commit.

Reviewed-by: Haren Myneni <haren@linux.ibm.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 .../userspace-api/ioctl/ioctl-number.rst      | 516 +++++++++---------
 1 file changed, 258 insertions(+), 258 deletions(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index a4782e566392c7..a7f729eb0c3694 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -65,345 +65,345 @@ Following this convention is good because:
 This table lists ioctls visible from userland, excluding ones from
 drivers/staging/.
 
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
-0xF9  00-0F  uapi/misc/amd-apml.h		                     AMD side band system management interface driver
-                                                                     <mailto:naveenkrishna.chatradhi@amd.com>
+0xEC  00-01  drivers/platform/chrome/cros_ec_dev.h                     ChromeOS EC driver
+0xEE  00-09  uapi/linux/pfrut.h                                        Platform Firmware Runtime Update and Telemetry
+0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                       sisfb (in development)
+                                                                       <mailto:thomas@winischhofer.net>
+0xF6  all                                                              LTTng Linux Trace Toolkit Next Generation
+                                                                       <mailto:mathieu.desnoyers@efficios.com>
+0xF8  all    arch/x86/include/uapi/asm/amd_hsmp.h                      AMD HSMP EPYC system management interface driver
+                                                                       <mailto:nchatrad@amd.com>
+0xF9  00-0F  uapi/misc/amd-apml.h                                      AMD side band system management interface driver
+                                                                       <mailto:naveenkrishna.chatradhi@amd.com>
 0xFD  all    linux/dm-ioctl.h
 0xFE  all    linux/isst_if.h
-====  =====  ======================================================= ================================================================
+====  =====  ========================================================= ================================================================
-- 
An old man doll... just what I always wanted! - Clara


