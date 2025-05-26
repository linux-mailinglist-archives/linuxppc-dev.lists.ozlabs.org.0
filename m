Return-Path: <linuxppc-dev+bounces-8937-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BBCAC3F61
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 May 2025 14:34:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5ZvY32Mrz2xTh;
	Mon, 26 May 2025 22:34:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748249650;
	cv=none; b=Eb/0RJVdmUWMiJbULXv8uWWTW8yn63f7oh5ONwvqsyirUtOiRjrEP8aDpjxMe+imuNeydOOnlBcbMq/ZQOfTO1p74IHKYY0iodmR1GNsH58E0HKIy1hpVklulXmjr92k/kUXBsoXxn2LZnwJmnC46NfJPnsyI7I++Sss9LAuY3My6hVMIpPS9wf35mPtXnykJuiFR7zXMXScbpObp7ey7tXShhtSRtsWHt1HI/ZGmQ7DIg62WJAkjNwYHSy1Tz4cGMm68/uN4IQ7wJ9agF4wJw9Z1Bhxb1n9QtH01vOf8Ujt95WYduw7RMP86X7aA1ziQMxM3JVaX/SbGNpF2VSDpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748249650; c=relaxed/relaxed;
	bh=9ifPqH6zbI8ViTf4QstJWVzTrvwBhrJhkxi4m69KFzg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WlSLEAXHDX7NQjnpp3IS6UuF3ttD7ypEhJcExRQhKhQVnfdreTOiDtiyXMYfaPEZBu1c+3qT0fop4DyhT5PZXGyHYR4cQyfKhh2zvmXfiHj5UkA4+4QJjpG+rjtJVVbCPCc7umb7SNHlmwc3nSH6d6P3lypoI+cq1/hEdVRcMwc4Zy04I8dsVyKwI72lqMuBs1+cWfjH2o3Qn7+Uu3u8TyoG971V9mgAaEBF8n1oFz2mkNveSkLwFE/6ZkSqYbrQ8LRVk04Kfe7kxt2+86yMl9HEQ/tXobPl9y0AnTt7RyHts9z/T8mzbWsZA+YllV3mYSj6R5AA2zovNmDrVmgcog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=BQT95dpo; dkim-atps=neutral; spf=pass (client-ip=117.135.210.4; helo=m16.mail.163.com; envelope-from=haoxiang_li2024@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=BQT95dpo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=117.135.210.4; helo=m16.mail.163.com; envelope-from=haoxiang_li2024@163.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 991 seconds by postgrey-1.37 at boromir; Mon, 26 May 2025 18:54:08 AEST
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5V1X3wlSz2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 May 2025 18:54:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=9i
	fPqH6zbI8ViTf4QstJWVzTrvwBhrJhkxi4m69KFzg=; b=BQT95dpoHbHEL6/F9z
	aSm83Tb3DjKE5hO0qnXLyBtu0pEWz1yCiFdK6nBqP8oVuvdeHpP/EZ0SKQR3dc8p
	KCN1vYq9zNL2zWz41Z0TwJwiqb/do583D06pwHSlUKp09DtZOWps0Pd+YTZDTtKg
	1AGJKCkictIcTBR6K/bj6ekdw=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wAXskEIKDRoXZkzEQ--.11424S4;
	Mon, 26 May 2025 16:36:25 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: ioana.ciornei@nxp.com,
	agraf@suse.de,
	German.Rivera@freescale.com,
	stuart.yoder@freescale.com,
	gregkh@linuxfoundation.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] bus: fsl-mc: Fix an API misuse in fsl_mc_device_add()
Date: Mon, 26 May 2025 16:36:22 +0800
Message-Id: <20250526083622.3671123-1-haoxiang_li2024@163.com>
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
X-CM-TRANSID:_____wAXskEIKDRoXZkzEQ--.11424S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr13Jw48tF47Xry7Aw1DKFg_yoW3KrX_Ar
	4Yqr47Xr4qyFnrtw43Ww1SyryI9F4qgr4fXrs7tFWfAryUZrs0qr4rXFZ5Zr15XaySkF9x
	AasrJryrJr48ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRRAR6UUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbBkBpZbmg0Jq05qAAAs7
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In fsl_mc_device_add(), use put_device() to give up the
device reference instead of kfree().

Fixes: bbf9d17d9875 ("staging: fsl-mc: Freescale Management Complex (fsl-mc) bus driver")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index a8be8cf246fb..dfd79ecf65b6 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -905,9 +905,7 @@ int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
 	return 0;
 
 error_cleanup_dev:
-	kfree(mc_dev->regions);
-	kfree(mc_bus);
-	kfree(mc_dev);
+	put_device(&mc_dev->dev);
 
 	return error;
 }
-- 
2.25.1


