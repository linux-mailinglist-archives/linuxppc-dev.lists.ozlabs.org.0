Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 821C05BBEC1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Sep 2022 17:51:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MVsjw6YMTz30MT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 01:51:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=o/hWThR2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=cgel.zte@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=o/hWThR2;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MVsjG0lMxz2xfv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 01:50:55 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id q15-20020a17090a304f00b002002ac83485so3957064pjl.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Sep 2022 08:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=mNfp5OB9PgpE6gOM/tLQO+tMnUt2woXTi/1qzQgZjqI=;
        b=o/hWThR2HqeFCreSB3PIFFnapFTDwWnWc91ZutCAAk+gtCpMmOTi5QdpiX+zO9ZNiC
         5HUlalWwi8xhMK9IA/RuPI1Lj/pW/t/KsfaycqGzP6gLoZbvfe/nietbr1WsXjb9XdxN
         qaiNF92USik+0y4fB0ZsPWAL9d177bXz/e7JXN2GnG+4xnawJAQnrIvn+aO1IxCZCwGh
         SRDDpCtCw1kXYi4Gljmo5eMchnHuf2zShP/2VGZVybx3Btv24moqz8oKTbW283gn6i8V
         gjAMcrcFCmReG5J7ok7rJZ2uxpEUAdHRF80DuZ/O7dIVkdbv8lBYFJ8LzKtBBCSWmSN+
         3wWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=mNfp5OB9PgpE6gOM/tLQO+tMnUt2woXTi/1qzQgZjqI=;
        b=s5nhZsmjZNnGQzWZl0QYL7wG+rUZnGuvBAwY78Vh/pEI9e2aXKnhUczJUUv5Khr4Bq
         Z8G3DqYEzYGnIsEz/JcDcf7cKKCJfEX1Ygt1hElFnw/4/a+0z+MhTSn7sgnc9Lf9JEP7
         22XsFJsUroLk2YyegKIBjT/jUU7PuFdcm+4tVBwzahwlEFN3nJIxVXhxCjpjEbI+JYKm
         IbSlo368VnbFL967lbg9KO9NO7jZfB/eqo3XcqxnIEuaFiCSfXnyDbDkXFXgfWevSkNh
         Db8rX3wQRinG3/b/mtoJweJbcneAZ9kPCWZbDejW1X2qej2elW5AI5VMGDR49SQYG17I
         Llbw==
X-Gm-Message-State: ACrzQf1bCRB380Fkbzt2iPGYS+0SYci0Xgr+1ytPzo4eESNz7PEASnzw
	cWRHDFt+CG9azcxQT1peQXI=
X-Google-Smtp-Source: AMsMyM7FsT3kB0EuN9jmAnhl/pNGkyxnlSwUmH4GO5+jLI93IDBd9SumeMN4SWcCcRdNq6hY4cxHpA==
X-Received: by 2002:a17:902:d4c6:b0:177:ff9b:35d0 with SMTP id o6-20020a170902d4c600b00177ff9b35d0mr8973323plg.69.1663516253932;
        Sun, 18 Sep 2022 08:50:53 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id a17-20020a170902b59100b00176a2d23d1asm18631856pls.56.2022.09.18.08.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Sep 2022 08:50:53 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: xu.panda@zte.com.cn
To: benh@kernel.crashing.org
Subject: [PATCH linux-next] macintosh/windfarm: fix comparing pointer to 0
Date: Sun, 18 Sep 2022 15:50:43 +0000
Message-Id: <20220918155043.210309-1-xu.panda@zte.com.cn>
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
Cc: Zeal Robot <zealci@zte.com.cn>, linuxppc-dev@lists.ozlabs.org, Xu Panda <xu.panda@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Xu Panda <xu.panda@zte.com.cn>

Comparing pointer whith NULL instead of comparing pointer to 0.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
---
 drivers/macintosh/windfarm_pm121.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/macintosh/windfarm_pm121.c b/drivers/macintosh/windfarm_pm121.c
index 36312f163aac..82dcd35f439a 100644
--- a/drivers/macintosh/windfarm_pm121.c
+++ b/drivers/macintosh/windfarm_pm121.c
@@ -651,7 +651,7 @@ static void pm121_create_cpu_fans(void)

        /* First, locate the PID params in SMU SBD */
        hdr = smu_get_sdb_partition(SMU_SDB_CPUPIDDATA_ID, NULL);
-       if (hdr == 0) {
+       if (hdr == NULL) {
                printk(KERN_WARNING "pm121: CPU PID fan config not found.\n");
                goto fail;
        }
@@ -970,7 +970,7 @@ static int pm121_init_pm(void)
        const struct smu_sdbp_header *hdr;

        hdr = smu_get_sdb_partition(SMU_SDB_SENSORTREE_ID, NULL);
-       if (hdr != 0) {
+       if (hdr != NULL) {
                struct smu_sdbp_sensortree *st =
                        (struct smu_sdbp_sensortree *)&hdr[1];
                pm121_mach_model = st->model_id;
-- 
2.15.2

