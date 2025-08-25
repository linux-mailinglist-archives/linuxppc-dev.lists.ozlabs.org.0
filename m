Return-Path: <linuxppc-dev+bounces-11264-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0A4B3479B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 18:37:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9bzf5lvxz3cj1;
	Tue, 26 Aug 2025 02:37:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756139822;
	cv=none; b=mxjBHx0CoAj0mPH7raXmSNJ4tljZKiB6G0Ii+C5KYEpcutJYlFL039mceLzqQxb3x8VcdqVixBB23h2AVUXCX0kmLrM8K7kCs8hys2u/PnK2/R6FfNLlEFt03i9te0L+vePQH+oMkL/X6D8+wJP/HwRos801bVgSVcCp9xL+qcqUXMCfhXD91jpCopWZCsJKiSRTwIo0kEZ61n5Tggd9ohCPDP9h2HodLZiY0o4p6J4moM7aT4vXqbaVPuzexzYfs4Arw3Go67hAdNltew2E37Kny0ikrmLDMN/fFobb9r70tM4PgPbuI3I8XmYcdDEw2SzCQt1MKPxeBzRG9c1qWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756139822; c=relaxed/relaxed;
	bh=nhJX7lYH6Ks2ZFGlgrdRtJtSoWafm0FdMUF8vZDPYT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TxzMi9rKFdMUiEId4VorDDrAl1qsgXFMGRnyNXx019iLVxlqbSzaiFnS+/sWGySS4nsGLUibKwr10MVY61V+6J00/XtBTqaMcayYRGjIcVwKJtcnRHRJYQBbHOKt8JjllnCmRBkzNnqMMZW6lbZn6SX18nGWgGgJGrjj/nTbT2fKiHPSam237lUcjqeUDoC4O10kBl6eiJvM5CM+uCxIRFQOSmiBanJpU92sFQDL0qyo0dvHzQYWgsyBUt+yx5YUHdlyn2kZbNwK8RfPkYYpphDuYEp48zV+UiHhYE4My7AL3CtTdGAV48Hx50MKXOXf1NfwKrk5s8w4UnkgL0RY0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LeEXDmq6; dkim-atps=neutral; spf=none (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LeEXDmq6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 62 seconds by postgrey-1.37 at boromir; Tue, 26 Aug 2025 02:37:01 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9bzd5G1kz3cg1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 02:37:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756139822; x=1787675822;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4BgR1C08p0drss5NDxXSek6A+9jO5AXL54CNKL2STq4=;
  b=LeEXDmq6E7aYff9LotiNtD2ICVXmSAWBb9L1oLfkFflp+Zi4JL/y+jq7
   hfUjRgXUlXVx+FJX2oHkA78JVQuVsTrqlqY6vbNQlnQtaf1FaetckeIjx
   u9/0i9KNTOqOth2KRWj6BJ5lSHJ9yabWkTPbyYZ0pck4khOpjsZYBkbpx
   c6jzJLZCqMsmKXLddDU0W2kinllryTykaJOXQ9KOf5bdhJ3OZz2Hhlp7K
   JNdxd3kxoYdjMhKYv3T1rLZBlZS4I+N3q8N9OLFsCs6M03diYUH1X2iLh
   FLa5tuC28w2MCbhSYOW5cNANOXAcGWn/h7IPMuYexKnm3mMHTB4bsGxTV
   g==;
X-CSE-ConnectionGUID: kzGTiaz1StOJfQDbcaZm3A==
X-CSE-MsgGUID: aICrqPI+Roug5on4Sc7pmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58288815"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="58288815"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 09:35:56 -0700
X-CSE-ConnectionGUID: RQaCu0IOQPuihHdwgc5pQg==
X-CSE-MsgGUID: snlOI4+aRY2/4OBMeyrQuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="168588221"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 25 Aug 2025 09:35:48 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id DD7AF96; Mon, 25 Aug 2025 18:35:46 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Helge Deller <deller@gmx.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Fourier <fourier.thomas@gmail.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-block@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Ian Molton <spyro@f2s.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Denis Efremov <efremov@linux.com>,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 2/3] floppy: Replace custom SZ_64K constant
Date: Mon, 25 Aug 2025 18:32:56 +0200
Message-ID: <20250825163545.39303-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
References: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

There are only two headers using the K_64 custom constant. Moreover,
its usage tangles a code because the constant is defined in the C
file, while users are in the headers. Replace it with well defined
SZ_64K from sizes.h.

Acked-by: Helge Deller <deller@gmx.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/parisc/include/asm/floppy.h | 5 +++--
 arch/x86/include/asm/floppy.h    | 3 ++-
 drivers/block/floppy.c           | 2 --
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/parisc/include/asm/floppy.h b/arch/parisc/include/asm/floppy.h
index df20dbef3ada..f15b69fea901 100644
--- a/arch/parisc/include/asm/floppy.h
+++ b/arch/parisc/include/asm/floppy.h
@@ -8,9 +8,9 @@
 #ifndef __ASM_PARISC_FLOPPY_H
 #define __ASM_PARISC_FLOPPY_H
 
+#include <linux/sizes.h>
 #include <linux/vmalloc.h>
 
-
 /*
  * The DMA channel used by the floppy controller cannot access data at
  * addresses >= 16MB
@@ -20,7 +20,8 @@
  * floppy accesses go through the track buffer.
  */
 #define _CROSS_64KB(a,s,vdma) \
-(!(vdma) && ((unsigned long)(a)/K_64 != ((unsigned long)(a) + (s) - 1) / K_64))
+	(!(vdma) && \
+	 ((unsigned long)(a) / SZ_64K != ((unsigned long)(a) + (s) - 1) / SZ_64K))
 
 #define SW fd_routine[use_virtual_dma&1]
 #define CSW fd_routine[can_use_virtual_dma & 1]
diff --git a/arch/x86/include/asm/floppy.h b/arch/x86/include/asm/floppy.h
index e76cb74bbed2..e7a244051c62 100644
--- a/arch/x86/include/asm/floppy.h
+++ b/arch/x86/include/asm/floppy.h
@@ -10,6 +10,7 @@
 #ifndef _ASM_X86_FLOPPY_H
 #define _ASM_X86_FLOPPY_H
 
+#include <linux/sizes.h>
 #include <linux/vmalloc.h>
 
 /*
@@ -22,7 +23,7 @@
  */
 #define _CROSS_64KB(a, s, vdma)						\
 	(!(vdma) &&							\
-	 ((unsigned long)(a)/K_64 != ((unsigned long)(a) + (s) - 1) / K_64))
+	 ((unsigned long)(a) / SZ_64K != ((unsigned long)(a) + (s) - 1) / SZ_64K))
 
 #define SW fd_routine[use_virtual_dma & 1]
 #define CSW fd_routine[can_use_virtual_dma & 1]
diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index 24be0c2c4075..d769a223fcc8 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -233,8 +233,6 @@ static unsigned short virtual_dma_port = 0x3f0;
 irqreturn_t floppy_interrupt(int irq, void *dev_id);
 static int set_dor(int fdc, char mask, char data);
 
-#define K_64	0x10000		/* 64KB */
-
 /* the following is the mask of allowed drives. By default units 2 and
  * 3 of both floppy controllers are disabled, because switching on the
  * motor of these drives causes system hangs on some PCI computers. drive
-- 
2.50.1


