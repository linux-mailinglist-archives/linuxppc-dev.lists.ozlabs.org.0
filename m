Return-Path: <linuxppc-dev+bounces-14406-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE9EC77982
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 07:41:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCQbK1Zg6z2yFq;
	Fri, 21 Nov 2025 17:41:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763705492;
	cv=none; b=ZxJViWxaWVdeK4+ly9aACp5cAK92vkyLbBY8cJ/zKWS/U2BPEcVk4U7QRZToLBIxVQn6FLc2WQMFkkplxzdfEyRtNdgmMIYesye7pKlVUb5YdgZvLMVaO8eapRBPdOwOu8lgHJb+YfkirHmfVleZPz22xOJpUe7/BHH8raI33JhkgtEVRrWurSwFe3iFoSJQghTZxxDHnhd/pRlia5nWWfbS/qDcST6tXEYSXeldXCafpSqHosUQ8GJf4r5BDVIjoRcfz60+fTvJcAtB9CXsbVhbKs/bGSgJ1dkJ0yHxoxG6Awopvkbm6+B52YAe7GR9D0iIOWLKN86g8ypTJgKLBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763705492; c=relaxed/relaxed;
	bh=lhXmYSd6erwiZvnGvy2iwChEIsqDQNKFKNb+gkFQP2c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VXeOTRGjY2DhFBb6h4ADRsAWLwxM+110XaVanbnNAp6aftBZ+hNjpiwLSfe+3Gwb0x0EROmkUxJhGYGMNeRdHfUe0oYw8s8xwK1K/Isi4V50Qhl0nImKsfX8DMnW3LGzhhdLoDz6Jr1fwkXE5HyZ022rxnOxTEYG4Zhl2hkyEmhX1U85GfhHGzj18UBns/dU8n+3HW43WAELsOTT2O28wfogcpYMS3JFcwy2pvzzv0xVvu1UxsCGlaQ3SKrtcnw6dAMm7oRGKOc5H6d9QYOhp7VWle/hKIv+2GTylaTwu986upvh/T8A7OyjweN7rr1l97dImPgIZNUyDDnHdcb7SQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=NrsqQCe1; dkim-atps=neutral; spf=pass (client-ip=220.197.31.2; helo=m16.mail.163.com; envelope-from=13875017792@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=NrsqQCe1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.197.31.2; helo=m16.mail.163.com; envelope-from=13875017792@163.com; receiver=lists.ozlabs.org)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCPxC488hz2y5T
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 17:11:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=lh
	XmYSd6erwiZvnGvy2iwChEIsqDQNKFKNb+gkFQP2c=; b=NrsqQCe1XZ1ieb/F8c
	3VgUiRIRdyk4CsHhSFHDw7jfxSR8YYiLq8zSdNpHKxzT7QV0Utd0SCiCgjkBlYGz
	1EhRhhcrXFf3/nDLYduPEJ9XIkTMQVivBIYRrU3WIbwpLI6818ikHT7qDuV4Jf2C
	rsp3kysoxJp5jmYWVACYFW78U=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wCnD2dbAiBpMctlBw--.981S2;
	Fri, 21 Nov 2025 14:10:37 +0800 (CST)
From: Gongwei Li <13875017792@163.com>
To: christophe.leroy@csgroup.eu
Cc: wangfushuai@baidu.com,
	frederic@kernel.org,
	ligongwei@kylinos.cn,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] soc/qman: use kmalloc_array() instead of kmalloc()
Date: Fri, 21 Nov 2025 14:10:22 +0800
Message-Id: <20251121061022.114609-1-13875017792@163.com>
X-Mailer: git-send-email 2.25.1
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCnD2dbAiBpMctlBw--.981S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jr48ZF13tw4fArW8Gw43GFg_yoWfWFb_uF
	WUXrsruryDArZIqrnru39rZFyava18Ww4v9anFvrnxXw4UtwsxGa4DZr4rZFsxWr4Yvrya
	9wsxJryftFnFyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUny5lUUUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: rprtmlyvqrllizs6il2tof0z/1tbiXRsNumkgAekKiwAAsR
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Gongwei Li <ligongwei@kylinos.cn>

Replace kmalloc() with kmalloc_array() to prevent potential
overflow, as recommended in Documentation/process/deprecated.rst.

Signed-off-by: Gongwei Li <ligongwei@kylinos.cn>
---
 drivers/soc/fsl/qbman/qman_test_stash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qbman/qman_test_stash.c b/drivers/soc/fsl/qbman/qman_test_stash.c
index 6f7597950aa3..6009e8b32c44 100644
--- a/drivers/soc/fsl/qbman/qman_test_stash.c
+++ b/drivers/soc/fsl/qbman/qman_test_stash.c
@@ -219,7 +219,7 @@ static int allocate_frame_data(void)
 
 	pcfg = qman_get_qm_portal_config(qman_dma_portal);
 
-	__frame_ptr = kmalloc(4 * HP_NUM_WORDS, GFP_KERNEL);
+	__frame_ptr = kmalloc_array(4, HP_NUM_WORDS, GFP_KERNEL);
 	if (!__frame_ptr)
 		return -ENOMEM;
 
-- 
2.25.1


