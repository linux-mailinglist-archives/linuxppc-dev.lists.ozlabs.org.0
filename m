Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4054B59F535
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 10:27:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCK370zKDz3c7L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 18:27:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Q3GPPLyi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com; envelope-from=hbh25y@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Q3GPPLyi;
	dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCK2T6zW3z2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 18:26:55 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id g8so11151177plq.11
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 01:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=pVHDk8dc6T3BiOa+xYG3swZFhJjca5Kjxb1hfTc+TEc=;
        b=Q3GPPLyiwudZ2b2XZVmbavLluOlWBfjAouSoJ4Cte3KY5okWZrlxhWnPCAl1u/tSlQ
         L+DggB6EdMBpYOIE+bK6F1ojgDZ1KUeVLaxoRAdTgvwa+3XImVVQOffZ+QIEVG3tF0Ih
         TyI3ivOxrfVvfTM2PZcm7GHkKagDsUoa8irSToBbHNDnWrGyKv+tYJEdDAxFWHY731gR
         g9OGKQR5cGZSdnVK/yPpTY/nZ8j7OK6GdBV05RJwHunDpmMZIAp9inzskJSpR+4iJ4t/
         4I2xcGWFPqSlvENVXLXh44CJllvjvxdSl+okfAmiJTl/Wt8dusV2EAeDr71/EuLgUc6b
         o98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=pVHDk8dc6T3BiOa+xYG3swZFhJjca5Kjxb1hfTc+TEc=;
        b=bNWsA/hoo9XEya64rZa9bbF09ZPwj+W6Lh8C0ieEMl3H4e9B60vEof3uMWL/ovBd5P
         w09axrM57B/FkGAMPqLd3MHvLdTqE6hj/a03zxJNgF0oYkkS3XC+D0vOuUnVbhEBe/0L
         Kkl4aZQGWMaA3rM0ok6CKq+ML5Z7xthMff6/gVAwIwBOdITVeQREq7P+mheE4Rw+Eesn
         hIxSK00xoBvAyO9FS27DKTvOPaURvE1D7tWeBjYYQXcUl9hkvQpzjleNgHDJ7raKs4FS
         vYomvu132z7N/teFML8pk1tu0wLKho3LfG9Rc7YSziJ6v0l1U9z+t3CP4oBYkI5DYUtf
         GRgw==
X-Gm-Message-State: ACgBeo3dF35tSg9lhuYwYUqmKTHMhf3VyZBCRNsD1Al4GhUgNoc0IAH1
	5ow2K0RSpLr58i5OfcEFDbw=
X-Google-Smtp-Source: AA6agR4YO6ClsUu0eyqsC+HCg7B+A/ucv/i2Jl2W/FK+PGq6TxbzzhpbSEG/XuJQx8wy7PkB4kBSmQ==
X-Received: by 2002:a17:902:ecd2:b0:16e:d87f:d19e with SMTP id a18-20020a170902ecd200b0016ed87fd19emr27986829plh.75.1661329612214;
        Wed, 24 Aug 2022 01:26:52 -0700 (PDT)
Received: from localhost.localdomain ([129.227.150.140])
        by smtp.gmail.com with ESMTPSA id y3-20020aa793c3000000b00536562f4c03sm8515027pff.146.2022.08.24.01.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 01:26:51 -0700 (PDT)
From: Hangyu Hua <hbh25y@gmail.com>
To: fbarrat@linux.ibm.com,
	ajd@linux.ibm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	alastair@d-silva.org,
	mpe@ellerman.id.au
Subject: [PATCH] misc: ocxl: fix possible refcount leak in afu_ioctl()
Date: Wed, 24 Aug 2022 16:26:00 +0800
Message-Id: <20220824082600.36159-1-hbh25y@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Hangyu Hua <hbh25y@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

eventfd_ctx_put need to be called to put the refcount that gotten by
eventfd_ctx_fdget when ocxl_irq_set_handler fails.

Fixes: 060146614643 ("ocxl: move event_fd handling to frontend")
Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---
 drivers/misc/ocxl/file.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
index 6777c419a8da..d46dba2df5a1 100644
--- a/drivers/misc/ocxl/file.c
+++ b/drivers/misc/ocxl/file.c
@@ -257,6 +257,8 @@ static long afu_ioctl(struct file *file, unsigned int cmd,
 		if (IS_ERR(ev_ctx))
 			return PTR_ERR(ev_ctx);
 		rc = ocxl_irq_set_handler(ctx, irq_id, irq_handler, irq_free, ev_ctx);
+		if (rc)
+			eventfd_ctx_put(ev_ctx);
 		break;
 
 	case OCXL_IOCTL_GET_METADATA:
-- 
2.25.1

