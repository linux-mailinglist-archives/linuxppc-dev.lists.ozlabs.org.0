Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD722FA012
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 13:42:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKBHp4y6qzDqjX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 23:41:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sRVXlDU9; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKB7r5g36zDr2s
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jan 2021 23:35:03 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id r4so8567204pls.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jan 2021 04:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eMAVOrti3UsDAFHsJqrYnZ4sTH5HS/3MvB1ZZiaFE6o=;
 b=sRVXlDU9Ei9j1oCfxOSJzax1ZKeCrwAKJIsHn1dSStXCcfxPeYRmDm/e3N1QbhkhaV
 DR5TQhVW5M/QG6q5va+xPh06iArtLjLiNtN6C8ShClAmejWUbKKoQyuaMLS4pCTOIK5Q
 oL6DApu6BHiXw9pWLwwtnM3ttDnreF/VTz16ylNTmwZymjI545oI0K8j4MhsVmTaYfOt
 7fwwc9TB6+IeInzx/c2YnvFhheooBm0vGhZUVxMi65c6XxsuyNy14vKtftk2cN7/2Rqn
 P9f0Hb8NBbyv6WKhl+Raa+9U27IB8xQT/6P2O1iiFWMP3vWde0kASotL2YIjDEDQnU7d
 SVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eMAVOrti3UsDAFHsJqrYnZ4sTH5HS/3MvB1ZZiaFE6o=;
 b=MCMThCetaxQe0vxXVsw+n3mknClJQ5bXD6xEc7D5PXEyTmCG0nboXCb/L0yactjC6K
 nPZKg5q0MekP5MnqbGOC/o2kDYnN+ORCiplGvTTbchSq+Un1lelCjtXIRkFPVngDnCmI
 8+1J5MaJWqv+GavLquuSY50H3cp7gwHFFLR1Rh9NUrn1MC9parS/BVieHvjj9OGbc9N+
 WUa4epW6zeb1RV9ALBQC44r3Ue+ehzXpg2LhmR8dy2mJabLhouX6OaXV7iBdXqYLZCf2
 RNu69zIwOfXh7J4Ceo2MHmtRqeyDJ0u7lesHmSq3q27Nn5O2t6sk0xoHGRFFYinzv3LX
 Up/A==
X-Gm-Message-State: AOAM532JNPc6rEQj2KNp8jASB3wnuXJUZZ48DAroZRQ6HW4XhuzxFBz+
 hiAkgBXYuxWhKTxAU9MdlVn+ktWjX0A=
X-Google-Smtp-Source: ABdhPJxgrijBuwiyWroXmU+C7oEoEuvmat4TBl66+Fk9bISjftMbyEWXkmF+aBcbgiE4MuiIwRbrKg==
X-Received: by 2002:a17:903:22cc:b029:de:191c:1bdb with SMTP id
 y12-20020a17090322ccb02900de191c1bdbmr26736167plg.14.1610973299335; 
 Mon, 18 Jan 2021 04:34:59 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id 22sm16707315pjw.19.2021.01.18.04.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 04:34:58 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc: always enable queued spinlocks for 64s,
 disable for others
Date: Mon, 18 Jan 2021 22:34:51 +1000
Message-Id: <20210118123451.1452206-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Queued spinlocks have shown to have good performance and fairness
properties even on smaller (2 socket) POWER systems. This selects
them automatically for 64s. For other platforms they are de-selected,
the standard spinlock is far simpler and smaller code, and single
chips with a handful of cores is unlikely to show any improvement.

CONFIG_EXPERT still allows this to be changed, e.g., to help debug
performance or correctness issues.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v1, made the condition simpler as suggested by Christophe.
Verified this works as expected for a bunch of old configs
(e.g., updates old !EXPERT configs to PPC_QUEUED_SPINLOCKS=y if they
were previously =n).

Thanks,
Nick

 arch/powerpc/Kconfig | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 107bb4319e0e..eebb4a8c156c 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -505,18 +505,14 @@ config HOTPLUG_CPU
 	  Say N if you are unsure.
 
 config PPC_QUEUED_SPINLOCKS
-	bool "Queued spinlocks"
+	bool "Queued spinlocks" if EXPERT
 	depends on SMP
+	default PPC_BOOK3S_64
 	help
 	  Say Y here to use queued spinlocks which give better scalability and
 	  fairness on large SMP and NUMA systems without harming single threaded
 	  performance.
 
-	  This option is currently experimental, the code is more complex and
-	  less tested so it defaults to "N" for the moment.
-
-	  If unsure, say "N".
-
 config ARCH_CPU_PROBE_RELEASE
 	def_bool y
 	depends on HOTPLUG_CPU
-- 
2.23.0

