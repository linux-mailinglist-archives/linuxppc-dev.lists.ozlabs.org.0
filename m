Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D27F354E2D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 16:02:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP3lH50lsz3cBF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 00:02:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=XDNa0blq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.5; helo=mail-m965.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=XDNa0blq;
	dkim-atps=neutral
X-Greylist: delayed 1880 seconds by postgrey-1.36 at boromir; Fri, 17 Jun 2022 00:01:43 AEST
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP3kb0R1sz308V
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 00:01:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=lt4cZ
	XCiaVcjGvhuT4ufqgA61fK3nl/LsSYLL/GBPXI=; b=XDNa0blq5lRe7Gk3wyjyI
	Sefm5EB7e9LHXt3544UvMIyDR3cALbRtuhodZtrvlBk7DQQ/r+NRa3COXXrSr0zy
	WH3oYsio2xoCpPhOC9b9w2eU6exS3e78wtpCPETyk4wH7TNo7Q06opgzxRVaUNHP
	mgRwif0MnZ4KoyAMYw8O/g=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp10 (Coremail) with SMTP id NuRpCgCH51szMKtitIMkEw--.42762S2;
	Thu, 16 Jun 2022 21:29:25 +0800 (CST)
From: Liang He <windhl@126.com>
To: oss@buserror.net,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	christophe.leroy@csgroup.eu
Subject: [PATCH] arch: powerpc: platforms: 85xx: Fix refcount leak bug in ksi8560.c
Date: Thu, 16 Jun 2022 21:29:22 +0800
Message-Id: <20220616132922.3987053-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgCH51szMKtitIMkEw--.42762S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF4UXry8JryrKryfGFWDXFb_yoW3CrgEkw
	n3Aa1UCrs5Cr4ktF4qyr1rKr1jq3yrWFWUGr1Ig3W7JFy5ZanxGwsrXF4xu3W5Xr4IkrWa
	qFZrG3s8CasakjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRMa9-UUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGg0iF1-HZT6SiQAAs6
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

In ksi8560_setup_arch(), of_find_compatible_node() will return a
node pointer with refcount incremented. We should use of_node_put()
when it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/85xx/ksi8560.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/85xx/ksi8560.c b/arch/powerpc/platforms/85xx/ksi8560.c
index bdf9d42f8521..a22f02b0fc77 100644
--- a/arch/powerpc/platforms/85xx/ksi8560.c
+++ b/arch/powerpc/platforms/85xx/ksi8560.c
@@ -133,6 +133,8 @@ static void __init ksi8560_setup_arch(void)
 	else
 		printk(KERN_ERR "Can't find CPLD in device tree\n");
 
+	of_node_put(cpld);
+
 	if (ppc_md.progress)
 		ppc_md.progress("ksi8560_setup_arch()", 0);
 
-- 
2.25.1

