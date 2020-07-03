Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BD321353B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 09:41:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yn2S0F9dzDr8s
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 17:41:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LPJ9kOrR; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ymw82mFGzDqXr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 17:35:36 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id 207so13457991pfu.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jul 2020 00:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p3+TUO0b9VV9VdTNyuHlA2h8v8EGxg7Uc2Jzn7JHwh8=;
 b=LPJ9kOrR/DVOvIvwHOyv2EvxvH2mWm1cTxw9pMagbdFf9Yf/o5YqVhwLZxlm4zMzB0
 BupvO34NgK3WU5FusVXN3LG1KZEmguQH+5WTUWXoEsEr0RjWXGLP0Ixc8TEqeeT6lVZN
 WsPOzbDKE4F33Gwek0i4ekNv+nVM6tYRDmjW4ojHXc4ANZghx4n39tGew1CqNAPQKTMw
 YLAag0hi/6/ZIqQRe4jaFochEOd0Hjq4hDBYBwaui6RvinZrC2mtHhJfIZ/yrLu1gwor
 mCQwkmxixNVC8IyJn8QQbryDYT5OUMEzfJcaRC7zrD+8ntI7y8IhZGKDc/ADG9oGWhN1
 1vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p3+TUO0b9VV9VdTNyuHlA2h8v8EGxg7Uc2Jzn7JHwh8=;
 b=Z032xwelt3GVrdzxqYxYiJqVXrexe0qqsu+Kr8d9+Sw1Hc2wLfZTgthoTvGNS8W5cw
 0bN0yNhtxu5j7sNw+aPyq2fIJ5lEJelMnJCYgDS2muvD0914Nfkd4Sl7tXGgGUNRa5fr
 y3KO/NGpcitdGqJCnFneWI9qvgF1Ox/bTX/l70i/9UC1fMo1F2gMfqIACAuZztzNL+V8
 Gr39FGdAPwiUWVMU4qXDIi5jC2OTfVDxI5kp8hr9mVkSA+TDo4yM3JjelbGPVCe0AfU1
 njs+/7+e4HvU9ePeAcXqx5abdxuwuKc1q4e6GuQ3nlpZZajiOim5P/iP0Byip5EOg5+I
 SSKA==
X-Gm-Message-State: AOAM532Tm7RRt+pVQ95GNpFG2NExRYNfEL07iuyM4wG6uLbJi1qhIefZ
 gZ5kGzBzlbXJm/VgaMUr7i4=
X-Google-Smtp-Source: ABdhPJxSb50XzIXPJCZ5aFL/fPOkGNSVYnLGWYBsj4lJ5hpdQfsLdm3sGDjF2UwCTSWxhcuQ8/5rHw==
X-Received: by 2002:a63:b06:: with SMTP id 6mr27000920pgl.116.1593761733846;
 Fri, 03 Jul 2020 00:35:33 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id y7sm10218499pgk.93.2020.07.03.00.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 00:35:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH v2 1/6] powerpc/powernv: must include hvcall.h to get PAPR
 defines
Date: Fri,  3 Jul 2020 17:35:11 +1000
Message-Id: <20200703073516.1354108-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200703073516.1354108-1-npiggin@gmail.com>
References: <20200703073516.1354108-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 kvm-ppc@vger.kernel.org, Waiman Long <longman@redhat.com>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

An include goes away in future patches which breaks compilation
without this.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda-tce.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda-tce.c b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
index f923359d8afc..8eba6ece7808 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda-tce.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda-tce.c
@@ -15,6 +15,7 @@
 
 #include <asm/iommu.h>
 #include <asm/tce.h>
+#include <asm/hvcall.h> /* share error returns with PAPR */
 #include "pci.h"
 
 unsigned long pnv_ioda_parse_tce_sizes(struct pnv_phb *phb)
-- 
2.23.0

