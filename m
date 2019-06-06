Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A871375F6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 16:03:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KS713KxGzDq7k
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 00:03:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="BawoU+DL"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KS1v3MKpzDqGC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 23:58:58 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id x47so2687595qtk.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2019 06:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=uYUP0WvJ8OVS3p9Pt4OYtUrTIoCYyxeTlVr1HS9+PVI=;
 b=BawoU+DL761/Zz0pvNB6yfVLELjpaY9MrjtJ0ekcgITb2LHMm4DTA2HU38p+oKSvXR
 rSFXzn+w3C05cINtZPNzeEV1ew7Vq1ZglQak8DyZPuzo4AIMlWRpyes9S/pMbCpTNnVH
 xcxNXEPpDaDBd4QRoOowoLwwOQom/8GW7sCbWMScLXCYaSJXhHnjMqbkOFNFKWPO9fV2
 ilP3PSW4ionpHoc4SD3idfYN04JrvqI3PopNdU6+fSYe39X5yumAU1/J+S0yGA7Ez72F
 nGieJwobbaK1j6EcqQM9I0V4OAk98A7kFe9C5ixNzgKwiP/R1c4dALSlCUKOJraptUrz
 0+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uYUP0WvJ8OVS3p9Pt4OYtUrTIoCYyxeTlVr1HS9+PVI=;
 b=s+8rjLcvvpCPC1VBcUmN10Yc7tyCZSoLqR5HFoynTiijdiImZgAMnvI/AL04GGTZW0
 TyBa9XLLvgbueXkWK2N6S5FV4KAb+kypo3MstPysiA3ueccYOwZYvwF2Rzt/gGP1gWw2
 T72FAOBqC648M13XlT4uwjcoRPfvbEgUirtoM4ubb97HRBLPf1kANPxgwRkoitIIHWJu
 5XTqgMKf8048o8O3nFa2bM1lB19qtJy/4b0V89+fU5/3W425D4/rLLFIRaZTHwx3Xbz6
 jm/ItJsiKw014LK4shFV13VbMUPXB4g9dOOJIfPF9Y8cCUPwqPC5V/gLVl8M0WoxUzZK
 +i5A==
X-Gm-Message-State: APjAAAXq6Z3HiDnCGC6S+kKPB3OdJFCv/PIKbSwCJ5BMPCVRnH1EUC3f
 4QLdykAd5pf2DOx0exrgs2PrvQ==
X-Google-Smtp-Source: APXvYqyk9fFSY8mn2x/l3b8QgjpGyHo8ZJJqsmgAk74ri7d+TLveq7JP/0BgDvBCA7rhpkjJLK6EGg==
X-Received: by 2002:a0c:acba:: with SMTP id m55mr39733792qvc.52.1559829536685; 
 Thu, 06 Jun 2019 06:58:56 -0700 (PDT)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id d38sm1369241qtb.95.2019.06.06.06.58.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 06:58:55 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/cacheflush: fix variable set but not used
Date: Thu,  6 Jun 2019 09:58:13 -0400
Message-Id: <1559829493-28457-1-git-send-email-cai@lca.pw>
X-Mailer: git-send-email 1.8.3.1
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
Cc: linux-kernel@vger.kernel.org, Qian Cai <cai@lca.pw>, paulus@samba.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The powerpc's flush_cache_vmap() is defined as a macro and never use
both of its arguments, so it will generate a compilation warning,

lib/ioremap.c: In function 'ioremap_page_range':
lib/ioremap.c:203:16: warning: variable 'start' set but not used
[-Wunused-but-set-variable]

Fix it by making it an inline function.

Signed-off-by: Qian Cai <cai@lca.pw>
---
 arch/powerpc/include/asm/cacheflush.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/include/asm/cacheflush.h
index 74d60cfe8ce5..fd318f7c3eed 100644
--- a/arch/powerpc/include/asm/cacheflush.h
+++ b/arch/powerpc/include/asm/cacheflush.h
@@ -29,9 +29,12 @@
  * not expect this type of fault. flush_cache_vmap is not exactly the right
  * place to put this, but it seems to work well enough.
  */
-#define flush_cache_vmap(start, end)		do { asm volatile("ptesync" ::: "memory"); } while (0)
+static inline void flush_cache_vmap(unsigned long start, unsigned long end)
+{
+	asm volatile("ptesync" ::: "memory");
+}
 #else
-#define flush_cache_vmap(start, end)		do { } while (0)
+static inline void flush_cache_vmap(unsigned long start, unsigned long end) { }
 #endif
 
 #define ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE 1
-- 
1.8.3.1

