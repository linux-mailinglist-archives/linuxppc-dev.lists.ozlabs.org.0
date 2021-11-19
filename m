Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FD1457BEE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 07:04:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hx2zW4JzXz3ddM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 17:04:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256 header.s=s201512 header.b=r5eQrZPQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=foxmail.com (client-ip=203.205.221.205;
 helo=out203-205-221-205.mail.qq.com; envelope-from=jlu.hpw@foxmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=r5eQrZPQ; dkim-atps=neutral
X-Greylist: delayed 5591 seconds by postgrey-1.36 at boromir;
 Fri, 19 Nov 2021 22:18:11 AEDT
Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com
 [203.205.221.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwZ0M35Kmz2yb6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 22:18:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1637320671;
 bh=3708+Mfh+zJTCD8kMqzQyKwRz6cgzdVxOwONIux6TME=;
 h=From:To:Cc:Subject:Date;
 b=r5eQrZPQR8XlQViLS0EXXNhIs1xNld8MJFHrz4v0vSmD3idvMxXAFzRc7Te5+vBsQ
 Zv9aN1bcr0KHRUbZYH0iBxQqTjG9c02s/RKZlgg+C60L/ixeS7dJeLjdwNOathttu6
 4NFO6P0FSoLNnz+yX5nPBYfj8tjy/sY3CVY/Rhxc=
Received: from localhost.localdomain ([159.226.95.43])
 by newxmesmtplogicsvrsza9.qq.com (NewEsmtp) with SMTP
 id 3239B626; Fri, 19 Nov 2021 17:12:35 +0800
X-QQ-mid: xmsmtpt1637313155tl2drclly
Message-ID: <tencent_BA28CC6897B7C95A92EB8C580B5D18589105@qq.com>
X-QQ-XMAILINFO: MpO6L0LObisW1c6wsWy9l5h1QvWkiNyInZrGzZGx8VZ/M8UcrvZCTGzupqj/DR
 jmugwBZeT/jxEZIAkC45WrsX9T2TGL1rTU/rzjzBngiIe6Wsb5WKDLpK7vMMl58ealshK0jX2vkr
 /K8MQr/UcwP4VRmHr/+4Tk28r1hhSd9Zb4GRD+gg8rcRRvVF7Dre2aISejLZzxch/Vwq1N/w1Ok4
 yS6N2wMiL2q67EK4o403axJvAQ7j1UX3aqm0SvJuZ3eFPdVJ9ABPCHassru5XmCs4BhY7y/8rJ4j
 3ncniYJecH2QTC3M9taADco9ZbE9tEwloBYsFJfmvm/05CMGMQPO+MH1fGwhguFgyLZP0brV5U8G
 +flDF5VjJHlXYC3tuc99ZEdU/w7fFgA+0saRJaTVH3ToXmbPgmRr/Wj3QmXpuLjkDcLjGT8vh3VW
 bMJ6hS/3886vzgPH/lXswxGlWimHoBlMSogv5QFeBj6pEi/FkqqNP3J0GlNs8lZAx4eKAbvlFTdQ
 kMS0mrgTYRI6NpiWBbxX4u4EfWZei7MFBZe/sttLVXcZc8p8ItD8OO/FpZde+1yVhRMJYtJxhfIZ
 I4fOxsuu0Rxcl54fwKoD5jnsKIZBKtbRlEI8pezx6SJb7m+oa6Zjjzy7lUTFqLQ6VLnIuLAFBktG
 yQA4dWICUR+1IamPbrItaldTjmfu5/MQSDgIifvaoAumJceb2Uc4qYQbssdOl9XYU/LJJPKanpK8
 QT6G8VKYbXDWZOk67CbVJu2YFeQ/EMFIwxRldFAVumDcWdM6JgN9Te1odl4mIu9CKjprWvaCplJ6
 2eYiqOs3NW6X52Ohbs7/d74flBSnvtQfeO12rPUTxYUiUuPEdC/QOQhCSDdL+6PHbNn+c+2Re7B7
 5trULPrY6m
From: Peiwei Hu <jlu.hpw@foxmail.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 aneesh.kumar@linux.ibm.com, ardb@kernel.org, rafael.j.wysocki@intel.com,
 masahiroy@kernel.org, npiggin@gmail.com, andriy.shevchenko@linux.intel.com,
 adobriyan@gmail.com, clg@kaod.org
Subject: [PATCH] powerpc/prom_init: fix the improper check of prom_getprop
Date: Fri, 19 Nov 2021 17:12:18 +0800
X-OQ-MSGID: <20211119091218.2215024-1-jlu.hpw@foxmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 20 Nov 2021 17:01:52 +1100
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
Cc: trivial@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Peiwei Hu <jlu.hpw@foxmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

prom_getprop() can return PROM_ERROR. Binary operator can not identify it.

Signed-off-by: Peiwei Hu <jlu.hpw@foxmail.com>
---
 arch/powerpc/kernel/prom_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 18b04b08b983..f845065c860e 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2991,7 +2991,7 @@ static void __init fixup_device_tree_efika_add_phy(void)
 
 	/* Check if the phy-handle property exists - bail if it does */
 	rv = prom_getprop(node, "phy-handle", prop, sizeof(prop));
-	if (!rv)
+	if (rv <= 0)
 		return;
 
 	/*
-- 
2.25.1

