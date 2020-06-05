Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B48E1EFB04
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 16:24:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dlJK74XdzDqyh
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 00:24:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=Ra7efnOL; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dl9c183RzDqyf
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 00:18:11 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id w20so5183991pga.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Jun 2020 07:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=USN5B+36EcRDvKeTHs/GkNSI7LnmTqCKEsfrMETXyQE=;
 b=Ra7efnOLfD0+wUXmYY7DVNDt/rW9NMuVsI1UU+XztgDo+6gMX4GEbUE9hx8dDLpDXy
 8FNlNVgPK/hVwbNyMs969KelxavrGUQAWwp2rsdgzRGrXDxKgUUFRZBuxDp08B2uXDCM
 ZdFejcna1GLfF1h8KoK+qNFR8Uu5Wiwbjlwms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=USN5B+36EcRDvKeTHs/GkNSI7LnmTqCKEsfrMETXyQE=;
 b=QcKQwQa6D3rk2UQU9Uw+G1Etg+rWJsORbZHhuBF8IvomTX6J6rhk6ad4X4Bw0X9DkW
 uWQMNH7O2Jz+4frkw/D6QfD4gNpkb+f/6r6XZYBmiY9DI/wMP0oojmFylvVydkLgtkfI
 LV2X81P2EoI5osC6/MxATI/tvdlO6ccyMSyYgcI/B6t3eTb9221qt1t8/PdbMeB13q5X
 QbJEL+O+qTDn3lU/Taza7E5WKhuENz5KSJHCnNb2z8kGWVWPB4uk2XgVPyx/FybojCJo
 zdaHJzseN1LZWqjc/JbLFVYyvqMBHkdbPvfgmFELeiRjGGFkoeQAN3tTJ87w2opfz8wh
 YyQQ==
X-Gm-Message-State: AOAM532pNS5zUPWSKKloRqoglHZPN/FMWIbSX5JoTsFvkzWadOcFq9ws
 tOX0dUW8MtD2f6Qe29Z+OgHTMw==
X-Google-Smtp-Source: ABdhPJw+cA2osm5Y+j4AMSvnB/mesuJpia/pW9F2HIgjysQk3y1ignos3bJQFnCz+S/rIB2VMgBX9g==
X-Received: by 2002:a63:1f42:: with SMTP id q2mr9422739pgm.357.1591366688871; 
 Fri, 05 Jun 2020 07:18:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l25sm6707192pgn.19.2020.06.05.07.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 07:18:07 -0700 (PDT)
Date: Fri, 5 Jun 2020 07:18:06 -0700
From: Kees Cook <keescook@chromium.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/mm: Fix typo in IS_ENABLED()
Message-ID: <202006050717.A2F9809E@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Joe Perches <joe@perches.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Joe Perches <joe@perches.com>

IS_ENABLED() matches names exactly, so the missing "CONFIG_" prefix
means this code would never be built.

Also fixes a missing newline in pr_warn().

Signed-off-by: Joe Perches <joe@perches.com>
Link: https://lore.kernel.org/lkml/b08611018fdb6d88757c6008a5c02fa0e07b32fb.camel@perches.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 8ed2411c3f39..cf2e1b06e5d4 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -660,11 +660,10 @@ static void __init htab_init_page_sizes(void)
 		 * Pick a size for the linear mapping. Currently, we only
 		 * support 16M, 1M and 4K which is the default
 		 */
-		if (IS_ENABLED(STRICT_KERNEL_RWX) &&
+		if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) &&
 		    (unsigned long)_stext % 0x1000000) {
 			if (mmu_psize_defs[MMU_PAGE_16M].shift)
-				pr_warn("Kernel not 16M aligned, "
-					"disabling 16M linear map alignment");
+				pr_warn("Kernel not 16M aligned, disabling 16M linear map alignment\n");
 			aligned = false;
 		}
 
-- 
2.25.1


-- 
Kees Cook
