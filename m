Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 211BF3F6F55
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 08:19:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvbRN75hwz2yPT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 16:19:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=nAWtbhlD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nAWtbhlD; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvbQf2YLPz2xff
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 16:18:49 +1000 (AEST)
Received: by mail-qt1-x836.google.com with SMTP id t9so10887562qtp.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 23:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RH75lEDDDtdHGfWOp59zoFXd45mrorIx2kgTRLpTbwg=;
 b=nAWtbhlDL430J8B/4kvp6bShpNDqABPji9ShP0MSsnf2wbEeYbQm0b9oUmHiuJrflY
 WRXf5+AIR3HPESJliYuDLkcCXsGB0Oy5ZvLRl+dHxR74uq41vbJawQta7/PVvhUyozGg
 eCdC89A0G47F0lytna7M9271XA6BzdlpGZds0wGY0Slehz9FlnPGRbMa4lU9OJIKDNsL
 1tC8gZLd/s6HxbLSbpLoGZ/Kqq+CbZJAEAXQJn6hZj+p6EyKJVxTVRKQVbxJ19aXlshI
 qd1iOrWmyBl+a2TwikYOf2iRM+EdSG4sCq1xukfYmb3j3dvBkNaQ7yzx+lupWkjThZr/
 6aSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RH75lEDDDtdHGfWOp59zoFXd45mrorIx2kgTRLpTbwg=;
 b=PefmT8BU0qHEOf/HTFyhXd2F7RH8P+S+IpJvQoghGi/Qo1hIwWyZeclOtDMlScOlTn
 gm6cJw/1/aDpMgtQcwB9SXumNu94bA/1/BMNQ0AJJPtUmKjZ77cOz64689Aih+eJoSsI
 As65i2JfpUql8QburzVIh1ocIP7QgEC70paL7b41XCsI6Jnr2W0wjZbdEJurpHkN76si
 FTNUu7R1YQ2hhqt8Fy0ISuQoU4fkhyxBxG83WyHWVK53KebHublIR7sDzdh8lNcnm+GO
 uC6ZAxo58Gc9wx1e6MEinSdvwI4groyVDr/fWqAMC3F7oIqr8uG86tFhEIeJQBkVZppl
 AC+g==
X-Gm-Message-State: AOAM530Omn+UQHDthLM8LNvS0Dye09hXx1vAqZvVyvA/+dn93VLBXRzX
 5lJdap8P4DtDjYbest51yeU=
X-Google-Smtp-Source: ABdhPJwmzEBWa+zihl+e6mx3w/fX3IuWaWfFvusi0wr+NcVEl+S9m9UKjOKLNiP63XIdPDzTf1L2/g==
X-Received: by 2002:ac8:4e96:: with SMTP id 22mr31192996qtp.242.1629872326050; 
 Tue, 24 Aug 2021 23:18:46 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id k9sm9532555qtj.12.2021.08.24.23.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 23:18:45 -0700 (PDT)
From: CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <deng.changcheng@zte.com.cn>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH linux-next] drivers:smu: fix warning comparing pointer to 0
Date: Tue, 24 Aug 2021 23:18:38 -0700
Message-Id: <20210825061838.69746-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Jing Yangyang <jing.yangyang@zte.com.cn>,
 Wang Wensheng <wangwensheng4@huawei.com>, linux-kernel@vger.kernel.org,
 Qinglang Miao <miaoqinglang@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 Zeal Robot <zealci@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Jing Yangyang <jing.yangyang@zte.com.cn>

Fix the following coccicheck warning:
./drivers/macintosh/smu.c:1089: 11-12:
 WARNING comparing pointer to 0, suggest !E
./drivers/macintosh/smu.c:1256:11-12:
WARNING comparing pointer to 0

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
---
 drivers/macintosh/smu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/macintosh/smu.c b/drivers/macintosh/smu.c
index 94fb63a..6cd0fef 100644
--- a/drivers/macintosh/smu.c
+++ b/drivers/macintosh/smu.c
@@ -1086,7 +1086,7 @@ static int smu_open(struct inode *inode, struct file *file)
 	unsigned long flags;
 
 	pp = kzalloc(sizeof(struct smu_private), GFP_KERNEL);
-	if (pp == 0)
+	if (!pp)
 		return -ENOMEM;
 	spin_lock_init(&pp->lock);
 	pp->mode = smu_file_commands;
@@ -1253,7 +1253,7 @@ static __poll_t smu_fpoll(struct file *file, poll_table *wait)
 	__poll_t mask = 0;
 	unsigned long flags;
 
-	if (pp == 0)
+	if (!pp)
 		return 0;
 
 	if (pp->mode == smu_file_commands) {
@@ -1276,7 +1276,7 @@ static int smu_release(struct inode *inode, struct file *file)
 	unsigned long flags;
 	unsigned int busy;
 
-	if (pp == 0)
+	if (!pp)
 		return 0;
 
 	file->private_data = NULL;
-- 
1.8.3.1


