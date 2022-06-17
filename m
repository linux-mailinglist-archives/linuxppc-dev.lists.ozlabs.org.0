Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AFB54F7BD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 14:42:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPdw92bQJz3cB7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 22:42:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=JQrviY/h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.4; helo=mail-m964.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=JQrviY/h;
	dkim-atps=neutral
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPdvX66HZz3bkh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 22:41:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=gq1uv
	r1aBLtCddK9PhILvNreXkKlYFH70qW1RYLIJOI=; b=JQrviY/hXr75pi8Y+qUqG
	6V7UMGh+pxGhfK/HcUMeeW/7Dn5R5yxnqUdMvWEp/V0s4Sfh1hTjJTFzY9d3w+eD
	p41heEKzselCbBN6kCy7N9RomOiTmwbx3uj6rKiQEooiDV2wzc91gJXw2AXdxRwR
	Xq3nQWdoH8LJqeV+G6rd/8=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp9 (Coremail) with SMTP id NeRpCgDn9LlPdqxiAcbnEw--.39061S2;
	Fri, 17 Jun 2022 20:40:48 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	christophe.leroy@csgroup.eu
Subject: [PATCH] powerpc: maple: Fix refcount leak bug in time.c
Date: Fri, 17 Jun 2022 20:40:45 +0800
Message-Id: <20220617124045.4048757-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NeRpCgDn9LlPdqxiAcbnEw--.39061S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1kKw45XFWfWFW8GrWUtwb_yoW3uwcEk3
	Z7Aa1DXr4xGr4vyF4q9w4fGw12ywnrGF4DKr18X3WxJ3y5Xw13G39rZrW2k340v3yUtFWr
	GayDGF9Fy3WS9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRt73vUUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3BIjF1pEDvZlvgAAsH
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
Cc: linuxppc-dev@lists.ozlabs.org, windhl@126.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In maple_get_boot_time(), of_find_compatible_node() will return
a node pointer with refcount incremented. We should use of_node_put()
in fail path or when it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/maple/time.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/maple/time.c b/arch/powerpc/platforms/maple/time.c
index 823e219ef8ee..91606411d2e0 100644
--- a/arch/powerpc/platforms/maple/time.c
+++ b/arch/powerpc/platforms/maple/time.c
@@ -153,6 +153,7 @@ time64_t __init maple_get_boot_time(void)
 		       maple_rtc_addr);
 	}
  bail:
+	of_node_put(rtcs);
 	if (maple_rtc_addr == 0) {
 		maple_rtc_addr = RTC_PORT(0); /* legacy address */
 		printk(KERN_INFO "Maple: No device node for RTC, assuming "
-- 
2.25.1

