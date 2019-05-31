Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96668314FA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 20:54:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ftsg3XpRzDqfc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2019 04:54:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pGTETKfe"; 
 dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FtrR41jszDqZN
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2019 04:53:24 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id w33so15935904edb.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2019 11:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=piCJ6jEF6MBc4EJPMFsudzP7NRZDnr1GSlVWfPmBoUQ=;
 b=pGTETKfe1tTLLxY/NozLw5pRvA556SpSsWvFQ/zFFBI68rKKDwsQl2SCdYv+30I17T
 4d1GZKf5SUaDUAi+D48E3fBGZjv5XACgWmfCtfq3iZF50PJoGmkaxwxqy6YTeOy4wmLw
 roa21TEQ12TNacClYrWZtAS+15Qi5OYX+pPK8yMm6XDZCo68CfbQCrs49GVjQ8O9ufdX
 EPFJbArhE81aIUqwAuj0ZyOBWgO3ClwISo7P77bGK3R+blXcZuxdIWp//mPioP7SQ8rP
 0qKOpTzJnIQZPrtZOyW9haCplftEH1/a7vRbz9Lmad3fOP8PFP4zBgF19XpG8tVxF3IH
 kzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=piCJ6jEF6MBc4EJPMFsudzP7NRZDnr1GSlVWfPmBoUQ=;
 b=IwjTPnI8YGCjvN0ZYT0VGvd+dO65lXV7N30Frx6ngBIFfgNnXmBNYghLi30XKG+TLk
 29q7bFr5fyAmeqaFwZdkmNSysyHAQwnPuERk28Oqg0LATtZIIQ8ZXdYErrmIYLbSVL+r
 vk9b8YitUxlDhoYBLFMzHqmJ0Som4ATXm6DgXzfZWPArGfsMC0mxqO6VFktJfS3h6XDB
 VSj3Yahq91//62bEqb8ysJSIhdqaMTUXmuxV+utuYmpt/8wmo2/jSvNIC66cWrL4/uOy
 CXgsNgfRIvu5jHF9zoLIoOVhKJo0USFP97FLN/y2FhHHya5nfuHRyuJqxquZ57eLXoXY
 9oVg==
X-Gm-Message-State: APjAAAU2YBWTdKSf4jm38CNfftSLPXb/aHIix4HIpIG3DPHMlpI8qyss
 jH1o6pf+EoT79rQc6/ZhZkA=
X-Google-Smtp-Source: APXvYqx535alRqStLg3CPU1+Fg/qXZIQbrvAUQDh4QWyvu8dpjY3mMQzRz94s9OTk3JQBudJj9leNQ==
X-Received: by 2002:a05:6402:1819:: with SMTP id
 g25mr3576488edy.56.1559328799792; 
 Fri, 31 May 2019 11:53:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b15::2])
 by smtp.gmail.com with ESMTPSA id j3sm1789080edh.82.2019.05.31.11.53.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 May 2019 11:53:19 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH] scsi: ibmvscsi: Don't use rc uninitialized in ibmvscsi_do_work
Date: Fri, 31 May 2019 11:53:06 -0700
Message-Id: <20190531185306.41290-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0.rc2
MIME-Version: 1.0
X-Patchwork-Bot: notify
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
Cc: clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

clang warns:

drivers/scsi/ibmvscsi/ibmvscsi.c:2126:7: warning: variable 'rc' is used
uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
        case IBMVSCSI_HOST_ACTION_NONE:
             ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/scsi/ibmvscsi/ibmvscsi.c:2151:6: note: uninitialized use occurs
here
        if (rc) {
            ^~

Initialize rc to zero so that the atomic_set and dev_err statement don't
trigger for the cases that just break.

Fixes: 035a3c4046b5 ("scsi: ibmvscsi: redo driver work thread to use enum action states")
Link: https://github.com/ClangBuiltLinux/linux/issues/502
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/scsi/ibmvscsi/ibmvscsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvscsi.c b/drivers/scsi/ibmvscsi/ibmvscsi.c
index 727c31dc11a0..6714d8043e62 100644
--- a/drivers/scsi/ibmvscsi/ibmvscsi.c
+++ b/drivers/scsi/ibmvscsi/ibmvscsi.c
@@ -2118,7 +2118,7 @@ static unsigned long ibmvscsi_get_desired_dma(struct vio_dev *vdev)
 static void ibmvscsi_do_work(struct ibmvscsi_host_data *hostdata)
 {
 	unsigned long flags;
-	int rc;
+	int rc = 0;
 	char *action = "reset";
 
 	spin_lock_irqsave(hostdata->host->host_lock, flags);
-- 
2.22.0.rc2

