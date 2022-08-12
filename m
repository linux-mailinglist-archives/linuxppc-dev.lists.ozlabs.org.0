Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5914590BA2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 07:55:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3tFb44H5z3bl3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 15:55:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I2/tiLRG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com; envelope-from=yury.norov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I2/tiLRG;
	dkim-atps=neutral
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3tDy66mhz2xTj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 15:55:12 +1000 (AEST)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-10ea9ef5838so24046043fac.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 22:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=vyDd5sdlW/fZbgb+P03HOQJNhHBEtM6dR0OmvEFJUas=;
        b=I2/tiLRGP+vTpPDSKssy8o+Alz0OX7R/A3w9bOoDvAefBVZg2WUBaeodhnOr3hiGaA
         C04lqW+K8FeMIotWwAYLyg8E5ojZ3X7V58PA3OGDkS2s5HXA8CcsfN8h3sjas6rIUleU
         giqCAQ4zXY9ghm1tlpBs2gp+I3qBkz4zDQk4m/JU7vU9NM/7y7EGQcxs8Fq6rO21x9hU
         mzqdGWg0Ru1JpXeTBq7fi3JBhZxeStXalldJLDMlITlqGE441bSs3GGUX7TISbU9juQh
         tLVzG5erCe/QiDQMh/RfwLGgAqL5pl/2TO6UXqGZaMOthb9Dfl2EhnNVtaSEBi648iL9
         EEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=vyDd5sdlW/fZbgb+P03HOQJNhHBEtM6dR0OmvEFJUas=;
        b=AJNaMHzEui935+6Xm8CGPhQlvbpbnpNtNkyr8o5d1x1h7tjCIxizqlGLONhlsjwgas
         cVnFAKCVP+Ubxo104Y9YSLE/rObXHZz6gkYzi/+XnmJ7kSq7rl8jRVINkabC/c8mRXFf
         3hDP5D+i5xPdBLdJk88EfU/cBFFyv2rZKU0uJJyY8h5ZQ5jPVJZ5nYU3WcgJipwF0lB5
         s9DuChHA0vEuO1zN1ED+/3Z/dB0EcwMiL4u20ZAZkMJqygpc3B/49mAQD4C7gnwCyWrt
         7PpJCW0nJSKUGHQhzRqu1D/HjA0A72LdCtoLBr86booQl8oYnlwTCzLCb0bFQUyk7kBP
         eZhw==
X-Gm-Message-State: ACgBeo3UrIKH5qbP53313KRr9Hby0BEMH+QWmJTPRCdoa9BJwHtmqcK1
	oTxy+HhS2fWuMHWz+TZ6zrc=
X-Google-Smtp-Source: AA6agR5aGXyyJ3+GJIotsDJnqcx75qV+eYnnEhlGhhbARGSbHE48VYmsi9Yyo1+DSijFHW4fZANiZA==
X-Received: by 2002:a05:6870:220a:b0:113:fae9:18bf with SMTP id i10-20020a056870220a00b00113fae918bfmr4915811oaf.66.1660283708323;
        Thu, 11 Aug 2022 22:55:08 -0700 (PDT)
Received: from localhost ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id h5-20020a05683040c500b00616d25dc933sm214380otu.69.2022.08.11.22.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 22:55:08 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] lib: remove lib/nodemask.c
Date: Thu, 11 Aug 2022 22:55:05 -0700
Message-Id: <20220812055505.2502077-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Linus Torvalds <torvalds@linux-foundation.org>, Yury Norov <yury.norov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 36d4b36b69590 (lib/nodemask: inline next_node_in() and
node_random()) removed the lib/nodemask.c file, but the remove
didn't happen when the patch was applied.

Reported-by: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 lib/nodemask.c | 23 -----------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 lib/nodemask.c

diff --git a/lib/nodemask.c b/lib/nodemask.c
deleted file mode 100644
index b8a433d16b51..000000000000
--- a/lib/nodemask.c
+++ /dev/null
@@ -1,23 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/nodemask.h>
-#include <linux/module.h>
-#include <linux/random.h>
-
-EXPORT_SYMBOL(__next_node_in);
-
-#ifdef CONFIG_NUMA
-/*
- * Return the bit number of a random bit set in the nodemask.
- * (returns NUMA_NO_NODE if nodemask is empty)
- */
-int node_random(const nodemask_t *maskp)
-{
-	int w, bit = NUMA_NO_NODE;
-
-	w = nodes_weight(*maskp);
-	if (w)
-		bit = bitmap_ord_to_pos(maskp->bits,
-			get_random_int() % w, MAX_NUMNODES);
-	return bit;
-}
-#endif
-- 
2.34.1

