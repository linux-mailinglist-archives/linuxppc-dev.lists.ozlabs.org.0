Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E28A1E3776
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 06:38:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WylB6G54zDqRv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 14:38:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RhgQiHKj; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Wyj66tGBzDqQy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 14:36:57 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id y18so11272765pfl.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 21:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lOpmpojWwwDKmdgvBgyDR/91akL7lsEVaaRXHGRRif0=;
 b=RhgQiHKjSFxt0e4hdk9XFdFmwXlaqqy/oTAekflZtHFdhEKO64qFc1mpKDXZr69CPy
 jdKKGgMYF3/PwLMQqZRA0p7MJV/Go6tkta/h4swizRoRpVhai4LlQKtDfpzOQXol3xcY
 3TW/CBGWUO1G35QH1UIuJXs9WTI3G+E29PktRQFzMSdgmMsbx+ViIkPx4XIoQKnwHjtI
 iuFirKyvXOkp6bKvGs8xYK3w/Dn4sctZ1lOJtxsH8Aa2nP03Bsx7PgwJODEguoGDFtQe
 EV7yB1UHGazYqjCw0y7SPUOzeb1Rx+s20xn4YP/gkyyGkm4H/LKnhLTIPlstwN50FD9J
 kU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lOpmpojWwwDKmdgvBgyDR/91akL7lsEVaaRXHGRRif0=;
 b=WH6KFUvQYqSRcHlFkRd66abJmU8Bi99xUrjZxXkGmPQYJAUeGxbLGXGzlnKAHDjb72
 Lo6htnyIXuUFKSFWgSH7UqTK75+eDkhzhb85xGs7whGYVuXGl7JBcuEVMopidlTr+CHQ
 tPCYsEFHb7YUlz+jFvXSeRGPTSPMv+h4hhKEHT/RhNS5OxJ8WQS/nFTgQqt4Msuob4CN
 01DYD2qpU7PkJCy6v1mzDJGBXQ2XjNXZPJvijBLGgy1bx4rezTOvuMcGT7H9tjPTkMlo
 gZRfTBt5uwFfNdB0i918lkqPQXtCCo5gdDL1/a7OLSExrTacWcuhCvvtenXH5S+hGqIM
 JcvQ==
X-Gm-Message-State: AOAM530LseZ+LXJU0u58/8RIiEAeRaQj3p5dT1k4lvYbux8DyUjQtDpk
 c86L6SIo3kigOQnixF/eoQI=
X-Google-Smtp-Source: ABdhPJxaG/pR1wu1n7WufrFJ+x4wcg8X7uq9rcDJKu3YRWfpwt3nhECM4aeG8mrZfzsEkO9ezvPt1w==
X-Received: by 2002:aa7:9302:: with SMTP id 2mr2035203pfj.164.1590554214171;
 Tue, 26 May 2020 21:36:54 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id e13sm893604pfm.103.2020.05.26.21.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 21:36:53 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: hch@lst.de
Subject: [PATCH] media: omap3isp: Shuffle cacheflush.h and include mm.h
Date: Tue, 26 May 2020 21:34:27 -0700
Message-Id: <20200527043426.3242439-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200515143646.3857579-7-hch@lst.de>
References: <20200515143646.3857579-7-hch@lst.de>
MIME-Version: 1.0
X-Patchwork-Bot: notify
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, zippel@linux-m68k.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-xtensa@linux-xtensa.org, arnd@arndb.de, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Nathan Chancellor <natechancellor@gmail.com>,
 linux-arm-kernel@lists.infradead.org, monstr@monstr.eu,
 linux-kernel@vger.kernel.org, jeyu@kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After mm.h was removed from the asm-generic version of cacheflush.h,
s390 allyesconfig shows several warnings of the following nature:

In file included from ./arch/s390/include/generated/asm/cacheflush.h:1,
                 from drivers/media/platform/omap3isp/isp.c:42:
./include/asm-generic/cacheflush.h:16:42: warning: 'struct mm_struct'
declared inside parameter list will not be visible outside of this
definition or declaration

cacheflush.h does not include mm.h nor does it include any forward
declaration of these structures hence the warning. To avoid this,
include mm.h explicitly in this file and shuffle cacheflush.h below it.

Fixes: 19c0054597a0 ("asm-generic: don't include <linux/mm.h> in cacheflush.h")
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

I am aware the fixes tag is kind of irrelevant because that SHA will
change in the next linux-next revision and this will probably get folded
into the original patch anyways but still.

The other solution would be to add forward declarations of these structs
to the top of cacheflush.h, I just chose to do what Christoph did in the
original patch. I am happy to do that instead if you all feel that is
better.

 drivers/media/platform/omap3isp/isp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
index a4ee6b86663e..54106a768e54 100644
--- a/drivers/media/platform/omap3isp/isp.c
+++ b/drivers/media/platform/omap3isp/isp.c
@@ -39,8 +39,6 @@
  *	Troy Laramy <t-laramy@ti.com>
  */
 
-#include <asm/cacheflush.h>
-
 #include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/delay.h>
@@ -49,6 +47,7 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/syscon.h>
+#include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/omap-iommu.h>
 #include <linux/platform_device.h>
@@ -58,6 +57,8 @@
 #include <linux/sched.h>
 #include <linux/vmalloc.h>
 
+#include <asm/cacheflush.h>
+
 #ifdef CONFIG_ARM_DMA_USE_IOMMU
 #include <asm/dma-iommu.h>
 #endif
-- 
2.27.0.rc0

