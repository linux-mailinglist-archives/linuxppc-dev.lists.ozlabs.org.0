Return-Path: <linuxppc-dev+bounces-2944-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1409BFB20
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 02:03:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkP2T3GCSz2yn4;
	Thu,  7 Nov 2024 12:03:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730941393;
	cv=none; b=kALgovrJUeMS3dR6VnzL6WLJFKsWkFeCSpBMrcwhIVdCgec4riJeND7jJYc7DpMh8vhbxBPR/AX5zB0hP+0yozUyeQsFZyEAxKLkhi4Idj02X2SSBxvsDw4RQ086f4bZgZ+8ra6wqvvjOWPE4TgadyZ6LJEYHxYHPQsOLG32rhJns2paVdOoJkSUqeU5kFfNyvdqbpeO1AwuwQr0aR9z1zNmlCJR7XYAeq2nb2jexo2qySsjUSgezoT9PGh6oeFhQYAGOxbZAL+nG5FLnaqXWvmKmhKRNqA3bKOGYQCpffkKjXWNuXptLz2eon5CPbf+SWIuc2BiVjpMZ8WbRXnIXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730941393; c=relaxed/relaxed;
	bh=v0DVufawgn8EOdvVe8gSpxcdjOljGbR43bLm6y9/QKo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BQPO8zoAVglHVG+Ibvl8WOsLSENc3OBdS2HkETV3nzD6MkbCpFjnUMMXDFaeI1nxCIdUaylIFG1l9/qTJ+6edgKHd45aF1bEFBgT9XZxKr5CJIlijrUMRqKoZbjTy3GRtRYJNSgRXTiLlcrmp8L2Y4/ComdmNeJIL+BfM5zAeAqCotgUBjP3wvB+l45Kd+b/z1JHnuujwAWsfiV856DjzdZ6Y35d+ZuwsCMfmC25T0awc1ZF1m9FZtKTTbcQLeVLRadBba7w8afqCL6J9l6fEcOHIBZbRRVfVDy1ehbotqMFSAa1C7QBwt5ZjtJEg7J4r/gPJxh9qMb51FowG0P8Dw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=skdvBXcl; dkim-atps=neutral; spf=pass (client-ip=115.124.30.101; helo=out30-101.freemail.mail.aliyun.com; envelope-from=yang.lee@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=skdvBXcl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.101; helo=out30-101.freemail.mail.aliyun.com; envelope-from=yang.lee@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkP2Q33yvz2yDj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 12:03:09 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1730941382; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=v0DVufawgn8EOdvVe8gSpxcdjOljGbR43bLm6y9/QKo=;
	b=skdvBXclfBdtU0Pdhb3uCqihdbkf+kDV39Nf3ahd5jK45eFm6L5SXnJeAJtF4FitpGpcBO8AkeW6RTJD7hI7i1tL12/8F3j6uwGClA7n37Nmu40pZBedUwprJCUqr7cXcifGS8WkdCpM5xlSHLHvxIecZV9CEzrLlHsgHxTnGQ8=
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0WItWykL_1730941380 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 07 Nov 2024 09:03:01 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen@kernel.org,
	maddy@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] powerpc/machdep: Remove duplicated include in svm.c
Date: Thu,  7 Nov 2024 09:02:59 +0800
Message-Id: <20241107010259.46308-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The header files linux/mem_encrypt.h is included twice in svm.c,
so one inclusion of each can be removed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11750
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/powerpc/platforms/pseries/svm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index c5d0f92c7969..384c9dc1899a 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -10,7 +10,6 @@
 #include <linux/memblock.h>
 #include <linux/mem_encrypt.h>
 #include <linux/cc_platform.h>
-#include <linux/mem_encrypt.h>
 #include <asm/machdep.h>
 #include <asm/svm.h>
 #include <asm/swiotlb.h>
-- 
2.32.0.3.g01195cf9f


