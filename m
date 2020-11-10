Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 774A12AD52C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 12:30:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVlyf4P3ZzDqN1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 22:30:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=xiakaixu1987@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SNfNLhZ/; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVlkj5dwjzDqfZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 22:19:40 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id j5so6328648plk.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 03:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=X4dag7xcL4vnMx5NVKJB+5vVrgE6HapSQew213si/Dw=;
 b=SNfNLhZ/dpxXrMy4/FK9AWMcOQdw9k1kOpHCwRyMv2hM6sYX8QjWLwUCV9HLXiSs++
 GzibrEaqkpoMEgwqdu5Dq5S5Ii3qhaZxmsALEQm6+0GtcPf6H1n1DazRzzvyiQdPQ8dD
 /lpLwXQWAUXch6mzTUfFXNJLuDO1A+ej5zdvWteJ0tqmUsNjlZa9/i+9IxH/WTnTa8aN
 bbYO8NiBxEDs2CEsj9s+3s4IrYjWGWSaCh3mffIompyLQFiSr0PsclBbak+tP2WWFE7K
 M6iU8cKDzeZp70OyVeaJ0pu+hHm5pY+dnzjCF8o3FIWCvdHDgcva1P3WNa+94NdEqF9b
 NB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=X4dag7xcL4vnMx5NVKJB+5vVrgE6HapSQew213si/Dw=;
 b=ee5csRtI0ixS6+xOS2uRMPpT3EvzzhoY+pl3UYNpnYod90Pa6kbf+5yui2z/Hdq1rA
 XlMwC1dqGGcczQHZ2U47y0o6vfUEkbPHVJnpRFZ/vU9d01EBp2wtSn09Snj+b19ijn/r
 hAHcleVYRn6XTV85SFcLZyMoISUWXjZiVx8wOMTvjD7+m1fvoe1J2TtXCTFfEmJ4nOu5
 8k3uRjuUabThMLpXm6ZpTJwtqUF0XXPrG0hH0E4pqv6tretgWbNQefHkpG4ccFEKC838
 /nmMxTXsfgqCU5C8BnjNMOBfRhOjNxWGsKsIQWCNQI2sn6XLEBNF2hapUAi+o9LW5+bP
 dZ7w==
X-Gm-Message-State: AOAM530AWslN4DbS8iVnZ/b+Iw1ebw8PU4IyKTE0REbjzo9BDICNDgeX
 TePzNm0BEgXTbY6Z+xfgVA==
X-Google-Smtp-Source: ABdhPJyiAwT7goe3svaAUM2ZncwpSApH4A+jbOGzmSqdTK1fW3Iex6KPIHHdoE2c8DF2NZx0tD5CYQ==
X-Received: by 2002:a17:902:c154:b029:d6:efa5:4ce7 with SMTP id
 20-20020a170902c154b02900d6efa54ce7mr16096487plj.73.1605007176212; 
 Tue, 10 Nov 2020 03:19:36 -0800 (PST)
Received: from he-cluster.localdomain (67.216.221.250.16clouds.com.
 [67.216.221.250])
 by smtp.gmail.com with ESMTPSA id s145sm14224197pfs.187.2020.11.10.03.19.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Nov 2020 03:19:35 -0800 (PST)
From: xiakaixu1987@gmail.com
X-Google-Original-From: kaixuxia@tencent.com
To: fbarrat@linux.ibm.com, ajd@linux.ibm.com, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org
Subject: [PATCH] powerpc/powernv/sriov: fix unsigned int win compared to less
 than zero
Date: Tue, 10 Nov 2020 19:19:30 +0800
Message-Id: <1605007170-22171-1-git-send-email-kaixuxia@tencent.com>
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
Cc: Kaixu Xia <kaixuxia@tencent.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Kaixu Xia <kaixuxia@tencent.com>

Fix coccicheck warning:

./arch/powerpc/platforms/powernv/pci-sriov.c:443:7-10: WARNING: Unsigned expression compared with zero: win < 0
./arch/powerpc/platforms/powernv/pci-sriov.c:462:7-10: WARNING: Unsigned expression compared with zero: win < 0

Reported-by: Tosk Robot <tencent_os_robot@tencent.com>
Signed-off-by: Kaixu Xia <kaixuxia@tencent.com>
---
 arch/powerpc/platforms/powernv/pci-sriov.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
index c4434f20f42f..92fc861c528f 100644
--- a/arch/powerpc/platforms/powernv/pci-sriov.c
+++ b/arch/powerpc/platforms/powernv/pci-sriov.c
@@ -422,7 +422,7 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
 {
 	struct pnv_iov_data   *iov;
 	struct pnv_phb        *phb;
-	unsigned int           win;
+	int		       win;
 	struct resource       *res;
 	int                    i, j;
 	int64_t                rc;
-- 
2.20.0

