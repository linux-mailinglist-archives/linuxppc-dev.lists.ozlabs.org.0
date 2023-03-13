Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A73B6B80C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 19:33:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb4z134MWz3cB4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 05:33:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0EqNGbMl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0EqNGbMl;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb4vC21Hpz3brQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 05:29:43 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9669461468;
	Mon, 13 Mar 2023 18:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8753C433EF;
	Mon, 13 Mar 2023 18:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678732181;
	bh=KGCzZ+imnvEdkljNiLcYF+bxrlXNtuGGw3dcz4zdHvo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=0EqNGbMlKRwDuQj2dv0OxR31F1eYi9XirJZNBzLWeQT0SJ0Tyj0MKz5pKs+mZRJL6
	 7PzwqYLKmtqYNSlx7l7k9SAXBmifeT86dP89Uc4zHFLEFEmYy7uqMCbm7BRtuBkXxk
	 DJVr/GVlGmC5Yf0GFy2QmfbwsvE9ZrJXOT4tlcHM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 15/36] powerpc/fsl: move to use bus_get_dev_root()
Date: Mon, 13 Mar 2023 19:28:57 +0100
Message-Id: <20230313182918.1312597-15-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313182918.1312597-1-gregkh@linuxfoundation.org>
References: <20230313182918.1312597-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2249; i=gregkh@linuxfoundation.org; h=from:subject; bh=KGCzZ+imnvEdkljNiLcYF+bxrlXNtuGGw3dcz4zdHvo=; b=owGbwMvMwCRo6H6F97bub03G02pJDCn82RXRPonuPMsPTv2Q7DfVuXbJ92m3+Qucvn7XsV38a 9bU45e8OmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAi9Z8ZZrO+cE3qCChKUzi2 /fKlb7ckbGazRjLMM3HMyHx1alexjd3s80oJZTt7JW8xAwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
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
Cc: rafael@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Direct access to the struct bus_type dev_root pointer is going away soon
so replace that with a call to bus_get_dev_root() instead, which is what
it is there for.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Note, this is a patch that is a prepatory cleanup as part of a larger
series of patches that is working on resolving some old driver core
design mistakes.  It will build and apply cleanly on top of 6.3-rc2 on
its own, but I'd prefer if I could take it through my driver-core tree
so that the driver core changes can be taken through there for 6.4-rc1.

 arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c b/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
index c2baa283e624..147b5d8bb904 100644
--- a/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
+++ b/arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c
@@ -116,6 +116,7 @@ static struct device_attribute mpic_attributes = __ATTR(timer_wakeup, 0644,
 
 static int __init fsl_wakeup_sys_init(void)
 {
+	struct device *dev_root;
 	int ret;
 
 	fsl_wakeup = kzalloc(sizeof(struct fsl_mpic_timer_wakeup), GFP_KERNEL);
@@ -124,16 +125,26 @@ static int __init fsl_wakeup_sys_init(void)
 
 	INIT_WORK(&fsl_wakeup->free_work, fsl_free_resource);
 
-	ret = device_create_file(mpic_subsys.dev_root, &mpic_attributes);
-	if (ret)
-		kfree(fsl_wakeup);
+	dev_root = bus_get_dev_root(&mpic_subsys);
+	if (dev_root) {
+		ret = device_create_file(dev_root, &mpic_attributes);
+		put_device(dev_root);
+		if (ret)
+			kfree(fsl_wakeup);
+	}
 
 	return ret;
 }
 
 static void __exit fsl_wakeup_sys_exit(void)
 {
-	device_remove_file(mpic_subsys.dev_root, &mpic_attributes);
+	struct device *dev_root;
+
+	dev_root = bus_get_dev_root(&mpic_subsys);
+	if (dev_root) {
+		device_remove_file(dev_root, &mpic_attributes);
+		put_device(dev_root);
+	}
 
 	mutex_lock(&sysfs_lock);
 
-- 
2.39.2

