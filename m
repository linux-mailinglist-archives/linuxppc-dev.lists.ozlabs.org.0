Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 535E5338844
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 10:08:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dxg322Stjz3cWs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 20:08:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VOGOGyF+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=syl.loop@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VOGOGyF+; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dxg2d0wKdz30Qm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 20:08:07 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id x21so99383pfa.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 01:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xVdnIbcoJeRY7zG01KJHr0aWovTe0PwWaJyS9+ofD9Y=;
 b=VOGOGyF+0BHCuPwwQN51gS1oELJE6My2QJYnQ6NkUo5VsP6K1xLbni67bVg2Z3qIgM
 fg39/NfyiAOtcx6U5iO23sByQGpNOdpWGU7N3VtTLiA9hhsoQ/jRAlIUeJ1L2Acbdw1A
 8BDA22NhpFGZ/evW14CSpGZ/SKPlGpu3poIx1Jc4XC0lV/EEbG3p9GCsrX2Fla9lFDxp
 32R7PplkFrriXTO3IJNA6LDx58YGV9rsOKVOQ1CXyu3SYbUESriBOgHL4wrSQpK0VZ3E
 UCTRRH+LZM9wmObHHiUywRN+Dc/aPwrFmUlGyh7fH6BwKMjo6S7lrZdJeqIEOxzOfGKz
 oQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xVdnIbcoJeRY7zG01KJHr0aWovTe0PwWaJyS9+ofD9Y=;
 b=ofG1F5QLcyRhrvxWk5eXENlOo9gl7rZuZbpS+RXwYVVaojnrXAxjRnYe51wrv94dGt
 QtJiqgzosxchLz4dgYyC7dbOHuGXzFFrPB78zoJcuCgDi6WwfBvg7WrQLe/fM9hs+WoF
 9QcoysgahgVesGhU8kvR+NbS73NDr1QGxwLKRn7I+0oKq+nyZucNK7dHTpddJ4dPL1mF
 sA5d7vSIAjKupkUh4OC5EMVGrw8JyoYdj3rU1GhimCQtUnOzMbCj7M36j8DQ/0euOQRD
 5de5htdNuem2LWY53cm9S9dUBlP0gPSVGn00eOOtw4einKEc9uhXgy3MYqPfY967IfuK
 hADA==
X-Gm-Message-State: AOAM531ogejRTld0rEGNnc5xkiEiv55FiY+XuHY1iWKYKtMREd0jmbaO
 HSpsoQ3YJIlEQxzfPvNfg4k=
X-Google-Smtp-Source: ABdhPJzOC7z7g1osI9KxiZBgm0jSUf5wVfoDot8fzFMT5TbgA0eQmW1mwxNtLwHemEF3EljlOq55NQ==
X-Received: by 2002:aa7:8b48:0:b029:1ec:a315:bdbd with SMTP id
 i8-20020aa78b480000b02901eca315bdbdmr11620104pfd.51.1615540084871; 
 Fri, 12 Mar 2021 01:08:04 -0800 (PST)
Received: from localhost.localdomain ([114.85.216.137])
 by smtp.gmail.com with ESMTPSA id e1sm1662907pjm.12.2021.03.12.01.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 01:08:04 -0800 (PST)
From: Youlin Song <syl.loop@gmail.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 christophe.leroy@csgroup.eu, aneesh.kumar@linux.ibm.com
Subject: [PATCH] powerpc: memblock alloc fixes
Date: Fri, 12 Mar 2021 17:07:47 +0800
Message-Id: <20210312090747.3381-1-syl.loop@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Youlin Song <syl.loop@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If the memory starts at 64MB physical address,the memblock
will not be allocated.Because it was in the range of 0~64M
(according to TLB) to alloc when the system was started,
but the memblock calculates whether it is in this space
based on the actual physical address(offset 64M).

Signed-off-by: Youlin Song <syl.loop@gmail.com>
---
 arch/powerpc/kernel/prom.c         | 2 ++
 arch/powerpc/mm/nohash/fsl_booke.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 9a4797d1d40d..addc05c6f8ff 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -785,6 +785,8 @@ void __init early_init_devtree(void *params)
 
 	DBG("Phys. mem: %llx\n", (unsigned long long)memblock_phys_mem_size());
 
+	memblock_set_bottom_up(true);
+
 	/* We may need to relocate the flat tree, do it now.
 	 * FIXME .. and the initrd too? */
 	move_device_tree();
diff --git a/arch/powerpc/mm/nohash/fsl_booke.c b/arch/powerpc/mm/nohash/fsl_booke.c
index 03dacbe940e5..f6f36e78ec41 100644
--- a/arch/powerpc/mm/nohash/fsl_booke.c
+++ b/arch/powerpc/mm/nohash/fsl_booke.c
@@ -264,7 +264,7 @@ void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 	phys_addr_t limit = first_memblock_base + first_memblock_size;
 
 	/* 64M mapped initially according to head_fsl_booke.S */
-	memblock_set_current_limit(min_t(u64, limit, 0x04000000));
+	memblock_set_current_limit(min_t(u64, limit, first_memblock_base + 0x04000000));
 }
 
 #ifdef CONFIG_RELOCATABLE
-- 
2.25.1

