Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B99C13F1863
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 13:41:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gr2sf4jHRz3d9v
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 21:41:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qgdelYbb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::330;
 helo=mail-wm1-x330.google.com; envelope-from=lukas.bulwahn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qgdelYbb; dkim-atps=neutral
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gr2rG46Svz2yxF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 21:40:12 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso6606505wmb.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 04:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EtgvXhAGt19qhroUE6m6P7pb+TNdJ1fCcsUGPxSLauI=;
 b=qgdelYbbaIFqrbFwfaA5EXeG+i70bRf7BubylNOL2c8rnvz4kBrWAJX2G7Fnb1u2OQ
 lO9a6X6BJ1gV/GGO+OZU5bA/vpXb9fC3c0o7WhIKJrLDmSXJ8cjyLHcsqChCEx9BrIY4
 LiupfmrUAVFAfTpZyO/g4+tJUg9AmPU2f3gvxZU4vGjgDOq9SJbrQ+qkJAq0D2ryAzzC
 UtQR5u+oINJ0DfoyRdke5/USJTG8egMCz5D4Oa8U9H6n66YLjSPR5o6cc4kfkbVW8UP6
 3M+0DxeXQVYPHyykhXqn+w+Cf89SXMzTSWtmwkd0Y3yAQWtYn4F6cQusgXDLJoFYCO2/
 nlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EtgvXhAGt19qhroUE6m6P7pb+TNdJ1fCcsUGPxSLauI=;
 b=txwA7WkMKQYJF3731HaNYPkqRcII/WUXdAYRrHYWrQnGAGB2a0j6xw0UzUljh9BNK4
 3qLlfn6LtIdhx2aIUyUATE0b0d+iAvq8JNOiqcCwBPh8N+0gHX/kElHbJCCqJQDM5hs6
 sgHvmocOLXqpKW3BvnPNGveahMTBSrvfUV+/xn04TwEvTE7W0yhFZ0Xv9VOrHCAiu10w
 tr8+x3Pggl0xPXNJULSNqEgJ1/Od7Hkt5kua/EmCwD3UAZz42vzSXKGlTbNWxuJodRq/
 Xwfz2pm8U+pzbK/33hiAfTCUJ7MaTxEUTVUeakoojJdyIdTvsTSHc6yMzN+SvrRAsvlL
 4VTw==
X-Gm-Message-State: AOAM5309cGKGL26UtUCpdf+zEEkQmqMajfbvQBYaiXLX4n7h12JsBWAx
 oWZTZ8hQVI83EJgaSh2a1MY=
X-Google-Smtp-Source: ABdhPJysGEtO7h5HDEHbCC6sb2xHTov/gXqitGsEWyloYIsqxzFsQa4iMVyAfZ4X38bnwpxBw9mMMQ==
X-Received: by 2002:a05:600c:3554:: with SMTP id
 i20mr2089272wmq.70.1629373204136; 
 Thu, 19 Aug 2021 04:40:04 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt.
 [84.90.178.246])
 by smtp.gmail.com with ESMTPSA id b13sm2650891wrf.86.2021.08.19.04.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 04:40:03 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Paul Mackerras <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Neuling <mikey@neuling.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/2] Kconfig symbol fixes on powerpc
Date: Thu, 19 Aug 2021 13:39:52 +0200
Message-Id: <20210819113954.17515-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
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
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear powerpc maintainers,

The script ./scripts/checkkconfigsymbols.py warns on invalid references to
Kconfig symbols (often, minor typos, name confusions or outdated references).

This patch series addresses all issues reported by
./scripts/checkkconfigsymbols.py in ./drivers/usb/ for Kconfig and Makefile
files. Issues in the Kconfig and Makefile files indicate some shortcomings in
the overall build definitions, and often are true actionable issues to address.

These issues can be identified and filtered by:

  ./scripts/checkkconfigsymbols.py | grep -E "arch/powerpc/.*(Kconfig|Makefile)" -B 1 -A 1

After applying this patch series on linux-next (next-20210817), the command
above yields just two false positives (SHELL, r13) due to tool shortcomings.

As these two patches are fixes, please consider if they are suitable for
backporting to stable.

v1 -> v2:
  Followed Christophe Leroy's comment and drop the obsolete select.


Lukas

Lukas Bulwahn (2):
  powerpc: kvm: remove obsolete and unneeded select
  powerpc: rectify selection to ARCH_ENABLE_SPLIT_PMD_PTLOCK

 arch/powerpc/kvm/Kconfig               | 1 -
 arch/powerpc/platforms/Kconfig.cputype | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

-- 
2.26.2

