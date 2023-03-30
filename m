Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E56ED6CF99F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 05:37:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pn8Hf4d1Fz3f92
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 14:37:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=kUUGNyoV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.12.27; helo=m126.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=kUUGNyoV;
	dkim-atps=neutral
Received: from m126.mail.126.com (m126.mail.126.com [220.181.12.27])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pn8Gn4krnz3cNN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 14:36:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=s21aC
	aR/iG7KOxB9MLIxai4Lo1eXp0ZqiDXvYipXjKI=; b=kUUGNyoVDe4KcMBIMyahH
	wc7F90oaiLQyJURZ3xXbjNyBhLBJZVaVP6OaQm06pRf3+AucfVBymIQw3FMGT3Ar
	DpAoCPyMbcrJb2QJbFmN4zdOCcp9eaKeETW5SzvF5TwAdfixNIiv82+y+YBCn7BB
	WX496YNPs4QImoZO8C134U=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by zwqz-smtp-mta-g1-1 (Coremail) with SMTP id _____wB3FrGfAyVkkhcRAw--.18338S2;
	Thu, 30 Mar 2023 11:36:00 +0800 (CST)
From: Liang He <windhl@126.com>
To: benh@kernel.crashing.org,
	u.kleine-koenig@pengutronix.de,
	mpe@ellerman.id.au,
	benjamin.mugnier@foss.st.com,
	cminyard@mvista.com,
	khalasa@piap.pl,
	linuxppc-dev@lists.ozlabs.org,
	windhl@126.com
Subject: [PATCH] macintosh/windfarm_smu_sat: Add missing of_node_put()
Date: Thu, 30 Mar 2023 11:35:58 +0800
Message-Id: <20230330033558.2562778-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wB3FrGfAyVkkhcRAw--.18338S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrW3Cw15Jw1UWr13CFyxGrg_yoW3JrXEkw
	1xXasruws8JrWFvwsrKF4fXrWkAFW5uas5uFsY9r4fZa4UZ342qr1DZrn5Za4xZF42yFW7
	Cr1DJryUurs29jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRpRR_UUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizgNCF18RQtjoTAAAso
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We call of_node_get() in wf_sat_probe() after sat is created,
so we need the of_node_put() before *kfree(sat)*.

Fixes: ac171c46667c ("[PATCH] powerpc: Thermal control for dual core G5s")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/macintosh/windfarm_smu_sat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/macintosh/windfarm_smu_sat.c b/drivers/macintosh/windfarm_smu_sat.c
index ebc4256a9e4a..089f2743a070 100644
--- a/drivers/macintosh/windfarm_smu_sat.c
+++ b/drivers/macintosh/windfarm_smu_sat.c
@@ -171,6 +171,7 @@ static void wf_sat_release(struct kref *ref)
 
 	if (sat->nr >= 0)
 		sats[sat->nr] = NULL;
+	of_node_put(sat->node);
 	kfree(sat);
 }
 
-- 
2.25.1

