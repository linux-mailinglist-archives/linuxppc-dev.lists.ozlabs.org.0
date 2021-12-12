Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AF7471E86
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 00:03:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0Ym2fQ8z30J9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 10:03:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=B8GmE4lx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=foxmail.com (client-ip=203.205.221.233;
 helo=out203-205-221-233.mail.qq.com; envelope-from=xkernel.wang@foxmail.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 3641 seconds by postgrey-1.36 at boromir;
 Mon, 13 Dec 2021 00:51:00 AEDT
Received: from out203-205-221-233.mail.qq.com (out203-205-221-233.mail.qq.com
 [203.205.221.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JBmJ43LXJz2ym7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 00:50:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1639317019;
 bh=k1stlU6EVWu2wzaYWiETbC6tqZhu0+niTrh2/gq6ttY=;
 h=From:To:Cc:Subject:Date;
 b=B8GmE4lxa6scU+3wvl7JTY9v1hcl3QQXYvl000rr4TC75iqV5yi2/n5Bc0zwJwAHp
 eHhpn07R490Ay3xL92wEB7U2zaXjhhvyDhxLQpBig2WE2mCX3BLDA2EFxOJdEuiS2q
 cOpgRe2soP4LJzM72mZtB0cAPeVR8/Lumzwzh2t0=
Received: from localhost.localdomain ([43.227.136.188])
 by newxmesmtplogicsvrsza9.qq.com (NewEsmtp) with SMTP
 id B229C805; Sun, 12 Dec 2021 19:44:34 +0800
X-QQ-mid: xmsmtpt1639309474ta5ne42z8
Message-ID: <tencent_765F05E486793F9790A388C2289C5429F705@qq.com>
X-QQ-XMAILINFO: OBvbJS/7aDyUMRq+jMxLd++o3zaqu1/4WeWHFvGjy7uzkKcvfrnxHSKSY2l1KX
 +HYyYNiCbPMseu11dn10t6KB7fkjhQxZZqkFJd90c4bu26Mz3NdzGPklf6e6UchZ5H27Z3jlzHFK
 eAEO9hx8UUrfK2GYIldP6nccwUUjhSpz4aESTteiDZtp04q9U5LwodZRP1hgVdHgWJv0D4gRwhNO
 ArycaQRM9JJwIQc8adZC6FtOquT80lY8XUgY27ZwfmshhDVDVLM2wB+8o90l/P+5hOEXlKIywqF9
 T/z/4dSmlvRvoN4F+HxW14MFEFa/Hna/4l6xZYJVfm4n1fHhuBVtGwWnwNFgnkXHvWYOI41w4/Ar
 m4WSVzXiKcaYaaXNsVrJ0/CJjrKA9e0I2AMv0kTnpEJ9zP9gQyhtFH3acOAOKxBH9GHv5tQ8WV6w
 0heI0sVDDhQ5gvMgJjXnPQMl3MA6TVIWSFJe6cnVlwuDnsHvxt2B8jQrroWNXTLgzpuvVJpfQpTb
 DVVL9OCGu82yK3+kC18t6pyVgn372npmVFDggv5bAZUohwO/Ez9HnH5bMysKOM3xUvxrz+H9kRAF
 C9FJJJKARqYeSbanbLQjMCqube2Z7aBg4bxrUD/1/twl5efuS9OfYo6ZWiD/Nmizs0N24w6EyBeD
 Mz8Y0eCcPPQzyGqnyoOyzgDNpEbytNud6eiCU7EOyM54YZVAJcVhDDmHvUqzkUF0kXmbmXaPMENA
 igQYAL+Dmz0Q23W4L41sUV4FKTaFyTtccUN+SLcAlvcBBRy2K39Ytg5XGuxBEhZe1ndPPXlgJbB7
 jpqwxCs974q9zmVXcJJJSFJ1zZ/+ByjJzz+x7bPqUgHbCSIc7wrr3p9y0jFjOuCan7ANr8d1woz9
 2lbsx5OpKx9MJDyL2fJQw=
From: xkernel <xkernel.wang@foxmail.com>
To: agust@denx.de
Subject: [PATCH] powerpc: mpc52xx_gpt: fix a potential memory leak
Date: Sun, 12 Dec 2021 19:43:39 +0800
X-OQ-MSGID: <20211212114339.1693-1-xkernel.wang@foxmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 13 Dec 2021 09:47:48 +1100
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
Cc: xkernel <xkernel.wang@foxmail.com>, linux-kernel@vger.kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When some internal memory errors happend in of_iomap(), we should free
gpt to prevent memory leak.

Signed-off-by: xkernel <xkernel.wang@foxmail.com>
---
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index f862b48..c506cfd 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -722,8 +722,10 @@ static int mpc52xx_gpt_probe(struct platform_device *ofdev)
 	gpt->dev = &ofdev->dev;
 	gpt->ipb_freq = mpc5xxx_get_bus_frequency(ofdev->dev.of_node);
 	gpt->regs = of_iomap(ofdev->dev.of_node, 0);
-	if (!gpt->regs)
+	if (!gpt->regs) {
+		devm_kfree(&ofdev->dev, gpt);
 		return -ENOMEM;
+	}
 
 	dev_set_drvdata(&ofdev->dev, gpt);
 
-- 
