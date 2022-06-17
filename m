Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7E954F6B3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 13:29:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPcJH4gMpz3cDt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 21:29:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=Vr3o8xii;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.114; helo=m15114.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=Vr3o8xii;
	dkim-atps=neutral
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPcHh1cfGz3bfH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 21:28:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=O/gfj
	iM+/dFXgLyDX8wONUfp/rIAwYsakkpB/GaAurk=; b=Vr3o8xiieKrrrlgnddW/w
	s9lxmQXAdM8azHPs8X4zP73tsYyzzomAKFUaoodb8Koskz0K52ppxEOXFj7WjG3s
	gj/Bmh67ql+61IR+ujsnV7CXfostj9RwIDUyOm4NdpUn7UlVV80Y1PAnLYLzxZV2
	PVenFWunVvRjV+M2z4PweA=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp7 (Coremail) with SMTP id DsmowACn5_bsZKximyZLDg--.20485S2;
	Fri, 17 Jun 2022 19:26:38 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	christophe.leroy@csgroup.eu,
	wangkefeng.wang@huawei.com,
	gpiccoli@igalia.com,
	aneesh.kumar@linux.ibm.com,
	dmitry.osipenko@collabora.com
Subject: [PATCH] powerpc: kernel: Change the order of of_node_put()
Date: Fri, 17 Jun 2022 19:26:36 +0800
Message-Id: <20220617112636.4041671-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowACn5_bsZKximyZLDg--.20485S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GF48Jw1UWw1UAFWUur1fXrb_yoWxKrX_t3
	yxX3ZI9r4vyrsa9rsrAF4fXr1Dtw4kXr1Fk3Wv9w47t3Z8Xw4UAr98Z3WkJr9xuryUt39F
	934Dtws8tF40vjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRM-eo7UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3A4jF1pEDvX86gAAsV
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

In add_pcspkr(), it is better to call of_node_put() after the
'if(!np)' check.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/kernel/setup-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index eb0077b302e2..761817d1f4db 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -563,9 +563,9 @@ static __init int add_pcspkr(void)
 	int ret;
 
 	np = of_find_compatible_node(NULL, NULL, "pnpPNP,100");
-	of_node_put(np);
 	if (!np)
 		return -ENODEV;
+	of_node_put(np);
 
 	pd = platform_device_alloc("pcspkr", -1);
 	if (!pd)
-- 
2.25.1

