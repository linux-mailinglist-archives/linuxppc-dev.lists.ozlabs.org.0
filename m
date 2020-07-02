Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 132EC211D8C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 09:54:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49y9N43JdmzDqcQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 17:54:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=n2X2tl2t; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49y9G52qMYzDqKl
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 17:49:01 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id cm21so2762350pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 00:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p3+TUO0b9VV9VdTNyuHlA2h8v8EGxg7Uc2Jzn7JHwh8=;
 b=n2X2tl2t1Z2jMbL8ftjNC8UfbtwIZAGcSuTp5qN1FvmOYuwgjX5KnJtALwmUyd5wHW
 HuWBDqPjKQ3jhWx7H0ve063UAbqIvU5T7BGPTxwObqeD3U77dQibTYtK7uFzOozjPGfj
 bqB8JF4dxa4GjyuRRMYu5EMlwn3xeK0QOSdBMDCvw8FDXDVxaVEpDX8z3F6bD427EoFk
 NGrFGc4CXku52XHrp65RvqF6vcc9sga6E2Jes0IIyw6uUSeZxHAJK37keYVe0X3ky8Ft
 4wfJ8U29IEzSKtDV/aWIswgU/itkss0JJydb1Xz5o6YooNXTyY/jjqd8bfdVUb1nuhum
 iHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p3+TUO0b9VV9VdTNyuHlA2h8v8EGxg7Uc2Jzn7JHwh8=;
 b=Y5gRxc+boITbJomSaQxm3+WnBZnxIDJ95lo91iW31VlFR8fmUCeR6Dh+diNubOB8qJ
 DsvKLGcJ0Mhn11Rk5eiGBqOvmTpn+Y0LRsQWGTvnNf7xcHKQSBHdlISy7ls7eSqhT1mJ
 ZFdFK2zIZK22sdAKx6pjkfCh0czr5vzMF6TEsrrJUq6+FrqCh4iLwWSOLVZt1d0x4VoL
 I+0DvlvYmEOuya6G499nKY22ERioq2oDz8oaQAgwXlF02zQ2x6yCaLTE5FTOlH2FjvSN
 z9SKV7mbYrqeXytBs5s80qfllMKwF1FWpBDSnM0RFJXeGAkJl4z1ABv9hSDuaby9g4q0
 6Fig==
X-Gm-Message-State: AOAM530IZiG5anYfWb0qVewAwZWCokD+h5Mktg2RzUQtWJUVuHzu/hcq
 7O8NImyGuXpfxntPUPiz3Y8=
X-Google-Smtp-Source: ABdhPJyrX8ZqLoSxDfScS/c0oudlkWwFEh6ZwhILTvmdjNw4QT7UUZQ1EYJPbV20RtW1fhoz7YmYKg==
X-Received: by 2002:a17:902:b205:: with SMTP id
 t5mr13521549plr.7.1593676139118; 
 Thu, 02 Jul 2020 00:48:59 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id 17sm6001953pfv.16.2020.07.02.00.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 00:48:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH 1/8] powerpc/powernv: must include hvcall.h to get PAPR defines
Date: Thu,  2 Jul 2020 17:48:32 +1000
Message-Id: <20200702074839.1057733-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200702074839.1057733-1-npiggin@gmail.com>
References: <20200702074839.1057733-1-npiggin@gmail.com>
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

