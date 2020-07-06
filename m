Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E49842151CF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 06:40:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0XtS0rgCzDqgS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 14:40:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=r0qcJkYV; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0XnY3HDDzDqcm
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 14:36:01 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id a6so39327068wrm.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jul 2020 21:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p3+TUO0b9VV9VdTNyuHlA2h8v8EGxg7Uc2Jzn7JHwh8=;
 b=r0qcJkYVBFZ2S/jjHBZPVsifAxriF1l6iC8Ws0UsFZny73sUoKEE9CqbKDZno2z2QG
 lg6fKKT35QjJ1DLpp/JSMynDpogNIz+CCh26h60gza9Fn1XW1CPzO+duWz9PPxscS0Eb
 vw4OkSGUhtsi9uUYSZAVD0Fm71aRBdhL8TFksRO07dbOCZi7jwsZyHvumnn9UThLXS9F
 dhx26XZ2iJKpywfeIYj1DPc5gbdIv/pGsjQv1hoszdSJ84ULU/6Xa6kzr6ZEJR5nC2WH
 o0n7Cdw948tbLx+ElRVsC7tDSY3LK4R/8XPNEvq0RVIBeixVmu5oTXl8wkLrUOXbpkxi
 /JLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p3+TUO0b9VV9VdTNyuHlA2h8v8EGxg7Uc2Jzn7JHwh8=;
 b=HWUwLHPv7d6bKu3LgW2FRNnps+ibYPoKtq8pwGcvmFqJU7xgRccavpBMXKgfIQJ1Yt
 rpFwJyJPqu+YDaAm8EdNtGp8dRRnCaAMSmLCZiNBzNItezrZxOa7LKCbIK/Gcss8cPLX
 NnUFIgDalav/PvsLVi624lcQH31rjwstwSMipG0ST6tbhF1B3dyp6Z79QCN5gBoQsbTe
 7ZWEZFN/MOYIdHUcFTeSiYaT/3WJzszhddTdlX9SSz2yJ+j1rYzY4B4h/DwVNFOIaHg3
 OpYRQdUHFUUNJo/t1V2b+g88QwlxIT3gnzrVGoE6UQXSqPwZeGGjAdD8IXo8ChNwpB+v
 +gCA==
X-Gm-Message-State: AOAM532HJPdbe6moLBS6yUc4oxKopdaGoCW1hY2gyYy0D/rJkExUhciy
 73ySq3SsdU1ydajpiD6X4z1K55su
X-Google-Smtp-Source: ABdhPJy47TWafr98nA5kPAewPrXPzWqc1AM5FjP4Ab0wPcRF+By6mw6/WW3J5fbQja0fcsMN77GF+w==
X-Received: by 2002:adf:df10:: with SMTP id y16mr47302000wrl.225.1594010158173; 
 Sun, 05 Jul 2020 21:35:58 -0700 (PDT)
Received: from bobo.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id r10sm22202309wrm.17.2020.07.05.21.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 21:35:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/6] powerpc/powernv: must include hvcall.h to get PAPR
 defines
Date: Mon,  6 Jul 2020 14:35:35 +1000
Message-Id: <20200706043540.1563616-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200706043540.1563616-1-npiggin@gmail.com>
References: <20200706043540.1563616-1-npiggin@gmail.com>
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
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, kvm-ppc@vger.kernel.org,
 Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>
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

