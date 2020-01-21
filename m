Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9230F1436C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 06:34:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481y0L5mmRzDqPk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 16:34:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=wenhu.pku@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iVnEndIv; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481xyT2x85zDqV4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 16:33:05 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id n96so800247pjc.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2020 21:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TBmFapcCP51v12ZDGyzoq6lMJzVpI9tiiDOrivNq+Hg=;
 b=iVnEndIvNGIyZOZ9RqjwdHY9uDVvwBw4JJKU2ax6fZjyC66osU5fz8+e3ZQYYU0NEE
 /sXWEs4x7EMZoOBdyeh4115F08CiB9HGKEa92/u2jNiSy2gSuSsDe6ydMLLcvpNeMBgb
 SaLnIsJJEGr1HmOxSviZU00da9gwohbe0woK8muvcOZwwHAdd2XEC8HgHYNxZZOCnO6g
 dKINdFN6JesG5erfBKiQXSXrTHYkyTfgPoJtILG6h2ITvJQT+hUhKP27578b+kXrBnY2
 8EwwPwfPI/gvoue/1h8csWrXhKnDy0hd/49wXWZ6JPcjmRCyRhuA41Fj7t9X8s8+XAUU
 /o9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TBmFapcCP51v12ZDGyzoq6lMJzVpI9tiiDOrivNq+Hg=;
 b=IAFLKZhkXFD2ZW9VGqGgmE8yG+4XZyNdxBt4u9ePE3YCcVqE8Hp4DHytnNCtunz4eS
 9BFiO/BCBnz9F5tK7nLFCuwDbVUfa7b81amxqpxz/Jn20j6xcibjdqLQU6j6/2JPUeKh
 YMdYrZPtBc53lwkRmLa1RgGgxuo72huBrwMbvAwmRvSPbG2Avu1sOvearuHqBcYH2JMB
 L1fqtaphAurCivMxTgpZ7r/yNxHwws7XXHus2U2TWaA3BTGRGWpbQcr67Qxjont+m80q
 p1rZsLkTL2g1bwrKLg4g4ooeNU3dE3178ciI9COvRgjYonTFGaX9AU7+uBLHBVuHB4IC
 GzkQ==
X-Gm-Message-State: APjAAAXM6FB21gNSWICnTrYkdkCKUJdMTIBN3C1U5u70slXujcfEzW/3
 BBZPvh1lTROfZwFz7Iu7os8=
X-Google-Smtp-Source: APXvYqwKroEhv0VaxPVuiMrNnT6axI9f0V6DunSlymxW6i94xrEU3F5J8TuYo3jxshWCQYteKZDAKQ==
X-Received: by 2002:a17:90a:c301:: with SMTP id
 g1mr3290728pjt.88.1579584782048; 
 Mon, 20 Jan 2020 21:33:02 -0800 (PST)
Received: from ubuntu.localdomain ([218.189.25.99])
 by smtp.gmail.com with ESMTPSA id b1sm31501216pfp.44.2020.01.20.21.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 21:33:01 -0800 (PST)
From: wangwenhu <wenhu.pku@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Richard Fontana <rfontana@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, wangwenhu <wenhu.pku@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/sysdev: fix compile errors
Date: Mon, 20 Jan 2020 21:31:13 -0800
Message-Id: <20200121053114.89676-1-wenhu.pku@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: lonehugo@hotmail.com, trivial@kernel.org, wenhu.wang@vivo.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: wangwenhu <wenhu.wang@vivo.com>

Include arch/powerpc/include/asm/io.h into fsl_85xx_cache_sram.c to
fix the implicit declaration compile errors when building Cache-Sram.

arch/powerpc/sysdev/fsl_85xx_cache_sram.c: In function ‘instantiate_cache_sram’:
arch/powerpc/sysdev/fsl_85xx_cache_sram.c:97:26: error: implicit declaration of function ‘ioremap_coherent’; did you mean ‘bitmap_complement’? [-Werror=implicit-function-declaration]
  cache_sram->base_virt = ioremap_coherent(cache_sram->base_phys,
                          ^~~~~~~~~~~~~~~~
                          bitmap_complement
arch/powerpc/sysdev/fsl_85xx_cache_sram.c:97:24: error: assignment makes pointer from integer without a cast [-Werror=int-conversion]
  cache_sram->base_virt = ioremap_coherent(cache_sram->base_phys,
                        ^
arch/powerpc/sysdev/fsl_85xx_cache_sram.c:123:2: error: implicit declaration of function ‘iounmap’; did you mean ‘roundup’? [-Werror=implicit-function-declaration]
  iounmap(cache_sram->base_virt);
  ^~~~~~~
  roundup
cc1: all warnings being treated as errors

Signed-off-by: wangwenhu <wenhu.wang@vivo.com>
---
 arch/powerpc/sysdev/fsl_85xx_cache_sram.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/sysdev/fsl_85xx_cache_sram.c b/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
index f6c665dac725..29b6868eff7d 100644
--- a/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
+++ b/arch/powerpc/sysdev/fsl_85xx_cache_sram.c
@@ -17,6 +17,7 @@
 #include <linux/of_platform.h>
 #include <asm/pgtable.h>
 #include <asm/fsl_85xx_cache_sram.h>
+#include <asm/io.h>
 
 #include "fsl_85xx_cache_ctlr.h"
 
-- 
2.17.1

