Return-Path: <linuxppc-dev+bounces-10807-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ADFB20A85
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 15:41:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0wl52qjzz3d95;
	Mon, 11 Aug 2025 23:41:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=220.181.50.185
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754900327;
	cv=none; b=YTYvAWeiEIgmaZUofmc5bxLNxyliRAF1RzIoSlRP/PYHAt/93AYsYGYhkqRqfupMLuHQs1XFyJwd4xDeeCW6hyVwcTsBX4QX51tmknCfeboqS5O53Nwob/TyL4o8CrQal9+/IOXDaxDqBw5khCF0jIUlS7f5f5uVl+gR5NeVGcDcReZkKxVgsXyexSdwPa7V4ry8hOXig9oaaZn/Pa+pNcN2IZu1RpjdcgLYeoYx95C9bnzIF4jaz3Xs+YD+HIm+ljxht7JBauPrLWetzxhb9APPNxWzMvak3Ji3pYRO+VFOkw85CFRkSBDR67B+3L4t/vYDiPUMB0X9LoWqeoS0yg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754900327; c=relaxed/relaxed;
	bh=U2FAsPury1kxDbqaADyKVxCxAGFOCFmlRs6VYhbFpaM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hy0M7//dmQrZe0UvOtn85apu6P4cUDnklnXqHYtwDoKh2JSNWjoq4z8u4RUHnKZTUXBSzk/9ocWucZNIo6kZh1PckEK+j8IDaHO3TgEcjZBVjTAi6VnFROA0kWtHG4uMIN1spxiyKO4ewU9LdrC9sjrqZJey1GxbcU1P9Vi9alSxqc+hoGLMZKjReGIN5DZ78ubLHC5qsr56xU4RsHvp+ewxTkyfSzgXb3n57KDM7xEjP8x8fR2c125jT5CpDoyrRdRw71y1hn5Esi09vWvCY9h+51JlPlpJlosq1DegAFC0AD/Xf2p3qwC1h7qt9NuPeYGGmuctrEgFu3nyWoD1oQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass (client-ip=220.181.50.185; helo=baidu.com; envelope-from=wangfushuai@baidu.com; receiver=lists.ozlabs.org) smtp.mailfrom=baidu.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baidu.com (client-ip=220.181.50.185; helo=baidu.com; envelope-from=wangfushuai@baidu.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2754 seconds by postgrey-1.37 at boromir; Mon, 11 Aug 2025 18:18:46 AEST
Received: from baidu.com (mx22.baidu.com [220.181.50.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0nbB0xz8z3chR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 18:18:42 +1000 (AEST)
From: Fushuai Wang <wangfushuai@baidu.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>
CC: <frederic@kernel.org>, <christophe.leroy@csgroup.eu>, Fushuai Wang
	<wangfushuai@baidu.com>
Subject: [PATCH] soc/fsl/qbman: Use for_each_online_cpu() instead of for_each_cpu()
Date: Mon, 11 Aug 2025 14:52:16 +0800
Message-ID: <20250811065216.3320-1-wangfushuai@baidu.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
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
Content-Type: text/plain
X-Originating-IP: [10.127.72.19]
X-ClientProxiedBy: bjkjy-exc8.internal.baidu.com (172.31.50.52) To
 bjhj-exc17.internal.baidu.com (172.31.4.15)
X-FEAS-Client-IP: 172.31.4.15
X-FE-Policy-ID: 52:10:53:SYSTEM
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Replace the opencoded for_each_cpu(cpu, cpu_online_mask) loop with the
more readable and equivalent for_each_online_cpu(cpu) macro.

Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
---
 drivers/soc/fsl/qbman/qman_test_stash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qbman/qman_test_stash.c b/drivers/soc/fsl/qbman/qman_test_stash.c
index f4d3c2146f4f..6f7597950aa3 100644
--- a/drivers/soc/fsl/qbman/qman_test_stash.c
+++ b/drivers/soc/fsl/qbman/qman_test_stash.c
@@ -103,7 +103,7 @@ static int on_all_cpus(int (*fn)(void))
 {
 	int cpu;
 
-	for_each_cpu(cpu, cpu_online_mask) {
+	for_each_online_cpu(cpu) {
 		struct bstrap bstrap = {
 			.fn = fn,
 			.started = ATOMIC_INIT(0)
-- 
2.36.1


