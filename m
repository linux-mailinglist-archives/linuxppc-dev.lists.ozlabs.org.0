Return-Path: <linuxppc-dev+bounces-818-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FA19664B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 16:57:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwLqB6Tfyz30Bp;
	Sat, 31 Aug 2024 00:57:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.84
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725028101;
	cv=none; b=ftEzSkJ28jkbuZSYPl5EZaxB8ot6HdYEWG+KzfJQk66uQkFlUWFfUd4vk8yFPW+fuf4o+eVXmv36U8icDQwIeQkLWZ2pxBIJRiu33FrDPJSV2VxiLnvhX6h3XC5XFbm1JDBLaA3rKs1kIg0NZeUYTACcARPgGBC0msEqEOwKo1NGL3m/1Kq+2OOJzvpeTKcLlZrJxvAjhH59uz+xUllc4rIDv4dUsDxNbWDDIpkx4aOVI7y+LK+38gz8IrKpEBqN3CRWPJj4uRCBnQXzATmJ+XP/6PmL8JcpkVmGqvJ0Ql2t7wfk0BZTug+SRGMcCQEFQbsynzhjpjKSpBUYlNwtbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725028101; c=relaxed/relaxed;
	bh=ruqW9VPyy+1mLQAyh1V0yLZihyccQ9bYsUtmbQxeGyk=;
	h=X-Greylist:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo; b=hAI2FEpBPgsdKbsgVqorTdvBhYNoOmPyfKROG4BFcGbt6SXDtHDa3yBDZl1SSllQO+Pbow9YzX5KW0EXJ2wBVQacrbReX4aLCaHrmEHeN+MqNR2JycoMA+GLPYnW7P0PtuiNTHfwah19RH70CHiAa07KjRK1NuOGYh0rXrjWyc1Xn7TO5/QYruUJCv9i3H8267AQXoIzq//hIChB0RzDx1CfNDrIM2HWgD5TwUXQiSX9SjsY/2qfKIdD/Qdsgiq7hFut6AXJszm60C2Ye57rPi0KMVmI+s7JA58ShaKveyWjjzifi0iBBD8RntAxQPxbS8AwLWw1NGbTmu+kumeXfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=make24@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=make24@iscas.ac.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 389 seconds by postgrey-1.37 at boromir; Sat, 31 Aug 2024 00:28:20 AEST
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwL9J4yV0z2yjV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2024 00:28:19 +1000 (AEST)
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-05 (Coremail) with SMTP id zQCowADHcEBu1dFmz5R+Cw--.3389S2;
	Fri, 30 Aug 2024 22:21:36 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: jochen@scram.de,
	andi.shyti@kernel.org,
	grant.likely@linaro.org,
	thierry.reding@gmail.com,
	rob.herring@calxeda.com
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] of/irq: handle irq_of_parse_and_map() errors
Date: Fri, 30 Aug 2024 22:21:27 +0800
Message-Id: <20240830142127.3446406-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADHcEBu1dFmz5R+Cw--.3389S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JrWfuF17Kr4DCr4kuFWktFb_yoWfArgEgw
	1kXa9xArWUGFnxXw15AFWfZry5KFy8WF1kAF1vvr9xC34DWw17JF1DZrn3JrsrXry3KFyq
	9w1qvF4S9wnrJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbfAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbQVy7UUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/

Zero and negative number is not a valid IRQ for in-kernel code and the
irq_of_parse_and_map() function returns zero on error.  So this check for
valid IRQs should only accept values > 0.

Cc: stable@vger.kernel.org
Fixes: f7578496a671 ("of/irq: Use irq_of_parse_and_map()")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 drivers/i2c/busses/i2c-cpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
index 4794ec066eb0..41e3c95c0ef7 100644
--- a/drivers/i2c/busses/i2c-cpm.c
+++ b/drivers/i2c/busses/i2c-cpm.c
@@ -435,7 +435,7 @@ static int cpm_i2c_setup(struct cpm_i2c *cpm)
 	init_waitqueue_head(&cpm->i2c_wait);
 
 	cpm->irq = irq_of_parse_and_map(ofdev->dev.of_node, 0);
-	if (!cpm->irq)
+	if (cpm->irq <= 0)
 		return -EINVAL;
 
 	/* Install interrupt handler. */
-- 
2.25.1


