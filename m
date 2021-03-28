Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4142334C01D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 01:58:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7t2D25txz30Lh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 10:58:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bObaSHbQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f36;
 helo=mail-qv1-xf36.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bObaSHbQ; dkim-atps=neutral
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7t040dz0z30CR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 10:56:19 +1100 (AEDT)
Received: by mail-qv1-xf36.google.com with SMTP id 30so5683768qva.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 16:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qPii/xX6YhM4hcBO+zp3OVMgz+jDeBjNcGIvzkkQGYk=;
 b=bObaSHbQgF7HnhhFevByLeRAEjwh9Xgx/6poqOyVrhU9nI9SQbKZibaot0nVJHtdHK
 o79A8Sp+Gz79oGtGsF5SxsTYB9AMcZOuDAKRePAi8OQlhWEu8LqzdcK18F1hIKWGpwTt
 +hcuXkQ52IF+FdKd1u3A+2KvczRYSW2FxnhgIJbngK13+y5D665LByLLaOIYq5prJ2BB
 q0KPV1xmQES9uuwOigJWctcX+oM6I0mAu6NH+RzVkz/A8hrPHIr5VI27yaHxNHMRhJ9S
 ZkZNPLNBdVtA2r2vkh1TOiWiTBT+BsXGquBT60jgmW2VoagfFPx16zh5v8S/U1Z6V3eJ
 yCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qPii/xX6YhM4hcBO+zp3OVMgz+jDeBjNcGIvzkkQGYk=;
 b=mvAbhFo6QJSTUN7hWHf2KbLy8an5u1NkQoRNooyNIPIg4fpQZhoKqEMPvITkq78SdT
 dI63TVGgZeY9cc6Ygc5siwb5AxOrj31azfu2WFfdGk70QtbG7FySb8PGkkXKAm+yf5nU
 XDMhL0+FzlFeAo2ssD+JEd4DbJ9vxqQ3GwIdjyH5BNfOKPNDV3wwjixAUdqST3+y4GN1
 qa2LyuAhbYOCyIcYARvneuTfr14fFHtn858Sh0eKpSc/VSAGrDSLv3jQ6iXY9sPqBCH3
 ODyNTLC845RSbupDFQREipmn8wF2fmgB1LbgFA2w+3f/+YqUcFQWysQ+I36OWuaehIL1
 frNw==
X-Gm-Message-State: AOAM531uVCn4bP8IbNWMD/EfDjP6Rb9UxD0sgfDLKfE4ZmM9vGCpFCeg
 ojDJkMjr927Vy9vR4Hb4Ymk=
X-Google-Smtp-Source: ABdhPJyIwQh8O82d8qyrfIuUZz0SqJYcgUURzt27W+q5h1fBWMUvMvJGKHkKfG17NwqDAaW/0JNrSg==
X-Received: by 2002:a05:6214:d85:: with SMTP id
 e5mr22653184qve.36.1616975777547; 
 Sun, 28 Mar 2021 16:56:17 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:17 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 04/30] bcm-sba-raid.c: Few typos fixed
Date: Mon, 29 Mar 2021 05:23:00 +0530
Message-Id: <a421c27ea6dc2808edec25b18238941ab5aefcf4.1616971780.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <cover.1616971780.git.unixbhaskar@gmail.com>
References: <cover.1616971780.git.unixbhaskar@gmail.com>
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

s/Maibox/Mailbox/
s/alloced/allocated/
s/atleast/"at least"/
s/parallely/parallel/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/bcm-sba-raid.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/bcm-sba-raid.c b/drivers/dma/bcm-sba-raid.c
index 64239da02e74..fba1585eb7ad 100644
--- a/drivers/dma/bcm-sba-raid.c
+++ b/drivers/dma/bcm-sba-raid.c
@@ -25,7 +25,7 @@
  * number of hardware rings over one or more SBA hardware devices. By
  * design, the internal buffer size of SBA hardware device is limited
  * but all offload operations supported by SBA can be broken down into
- * multiple small size requests and executed parallely on multiple SBA
+ * multiple small size requests and executed parallel on multiple SBA
  * hardware devices for achieving high through-put.
  *
  * The Broadcom SBA RAID driver does not require any register programming
@@ -143,7 +143,7 @@ struct sba_device {
 	u32 max_xor_srcs;
 	u32 max_resp_pool_size;
 	u32 max_cmds_pool_size;
-	/* Maibox client and Mailbox channels */
+	/* Mailbox client and Mailbox channels */
 	struct mbox_client client;
 	struct mbox_chan *mchan;
 	struct device *mbox_dev;
@@ -328,7 +328,7 @@ static void sba_cleanup_nonpending_requests(struct sba_device *sba)

 	spin_lock_irqsave(&sba->reqs_lock, flags);

-	/* Freeup all alloced request */
+	/* Freeup all allocated request */
 	list_for_each_entry_safe(req, req1, &sba->reqs_alloc_list, node)
 		_sba_free_request(sba, req);

@@ -1633,7 +1633,7 @@ static int sba_probe(struct platform_device *pdev)
 	sba->dev = &pdev->dev;
 	platform_set_drvdata(pdev, sba);

-	/* Number of mailbox channels should be atleast 1 */
+	/* Number of mailbox channels should be at least 1 */
 	ret = of_count_phandle_with_args(pdev->dev.of_node,
 					 "mboxes", "#mbox-cells");
 	if (ret <= 0)
--
2.26.3

