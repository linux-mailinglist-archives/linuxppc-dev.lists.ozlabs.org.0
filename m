Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 533EC3F164F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 11:34:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gr0341sFqz3dDH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 19:34:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=BM4IKNhC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::429;
 helo=mail-wr1-x429.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BM4IKNhC; dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gr01F5RZfz3cLk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 19:32:49 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id q11so8035883wrr.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 02:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FO+lf3R/yjc9KGpGIWIOuNRXRBvu2rIu+mbHK5sUlLs=;
 b=BM4IKNhCtQRKZxA0sZ4q1/jIzjHv+b7LZPW+AfBbbBQ0vP4MQlKD2NXPkieTMmquaD
 kcLfOqxYwR9WnKn/TcY4IhyUUtuBXi0laK22N8HqvBPCS/HGQ7ha4TNeQUThChMpwL2t
 xv7+CCGEd1IcRlV2AzP2hrh5omnShKYloHOw+uCVsvHLpiaOzNiTxgnzmQmb8z3272N1
 M0WyPaS4B2PuFpjGPoU8W9Q3qGiKCVeaBlrPjz5sUJPlZbJm0wzxyxYKeExKrUP/G5ki
 VliwdIAAhjkMCw0xOCmUp1eWu2bG1NPFs6Kf2Q6AmmdOaGl6+/kDVzap1r2qLSaMrTcQ
 tpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FO+lf3R/yjc9KGpGIWIOuNRXRBvu2rIu+mbHK5sUlLs=;
 b=VDwcKSdoQv/P2yFeymg+e7OStcCsd+PtQ61+d3jMa5+bTcpZrwGdHLIYwn9gGj+WaB
 PLc5Q4Way96yjzOXMyWCOMvUXAeYvc6yZ242yj8CJQIj+yiOLutHBdic9KWd2vJoENF9
 cnUztmC94t5Tm7PgbBzuPz45LIPj4BHFcHQMWbMxV+2QypRmEPf+rO7A1U7Of4gKQxed
 Zp7ny6TZgFNSUTFO0JDHS1iTuK0Jy56VaNNgZqpv6wFcaLeejaoqVsVXo3IVMk4urtS3
 v0k89UAMtwdXz7ZLtSugHwSrot3kfH4SpI9VXPkXnyTDFMbYnyR403jy7kzJMp5cxolN
 vYyw==
X-Gm-Message-State: AOAM531EQz5yKDJNpMmJGr5w2T3EecYmVwy5RPFrZ2CENTNFveOnAWgM
 +DekSoL3oqnrRHGPzdM/Fug=
X-Google-Smtp-Source: ABdhPJwu7l1e14z3CvBWCEbrYHKKMJmpt16r4+Dcm6OhP5DvDOyQWjLUEWmRVRqIBmTBER8QJHSQKQ==
X-Received: by 2002:a5d:4586:: with SMTP id p6mr2620112wrq.55.1629365566140;
 Thu, 19 Aug 2021 02:32:46 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt.
 [84.90.178.246])
 by smtp.gmail.com with ESMTPSA id h11sm8485061wmc.23.2021.08.19.02.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:32:45 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Neuling <mikey@neuling.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc: rectify selection to ARCH_ENABLE_SPLIT_PMD_PTLOCK
Date: Thu, 19 Aug 2021 11:32:26 +0200
Message-Id: <20210819093226.13955-3-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210819093226.13955-1-lukas.bulwahn@gmail.com>
References: <20210819093226.13955-1-lukas.bulwahn@gmail.com>
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 66f24fa766e3 ("mm: drop redundant ARCH_ENABLE_SPLIT_PMD_PTLOCK")
selects the non-existing config ARCH_ENABLE_PMD_SPLIT_PTLOCK in
./arch/powerpc/platforms/Kconfig.cputype, but clearly it intends to select
ARCH_ENABLE_SPLIT_PMD_PTLOCK here (notice the word swapping!), as this
commit does select that for all other architectures.

Rectify selection to ARCH_ENABLE_SPLIT_PMD_PTLOCK instead.

Fixes: 66f24fa766e3 ("mm: drop redundant ARCH_ENABLE_SPLIT_PMD_PTLOCK")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/powerpc/platforms/Kconfig.cputype | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 6794145603de..a208997ade88 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -98,7 +98,7 @@ config PPC_BOOK3S_64
 	select PPC_HAVE_PMU_SUPPORT
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
-	select ARCH_ENABLE_PMD_SPLIT_PTLOCK
+	select ARCH_ENABLE_SPLIT_PMD_PTLOCK
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_SUPPORTS_HUGETLBFS
 	select ARCH_SUPPORTS_NUMA_BALANCING
-- 
2.26.2

