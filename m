Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5DB504E11
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 10:59:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KhgpW5whGz3bVH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 18:58:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ASbWLxm5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=hbh25y@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ASbWLxm5; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Khgnp2nRnz2xD4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 18:58:20 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id u2so17768842pgq.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 01:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4bgQnFmcjl9+IwN+gQlxLVi8ouAKrKmz8WNF5PV3MyU=;
 b=ASbWLxm5SrXl6FJEnCnY7ypSb9qbPSfASDR0vvPiA9At237Dcenk6TB/pzgGPPOcl8
 GnJBP7IjWVS+x1pu5WJTda8BBdKW2qsgL/oJZJ5EdHNO6a5mCg5y2JhkIV9yD4tOJkQS
 A7xUWcNqrT6XrUT2XvapYZdsP8Mx/Sgp4SfVOZQd6iw/LM0PABTV8QxIWbU723o9QCow
 7WfP7O1uqRH4DBQtHnfm93EITaBucDW0vo5ZsMaMmzJnUjTlM1HTNPGMllj85ZWQ8AN2
 70IbsHguG8RlUgW3ngGirYEDXmpD2h52lGy7s5bXx03itOEws56sz8nSEmaPSSAK216q
 wg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4bgQnFmcjl9+IwN+gQlxLVi8ouAKrKmz8WNF5PV3MyU=;
 b=AMRqPpe7b2NBWKfojlVBYyaagFzPZx55Dra9EkEuqVeZr+bbl/EJYSb+AMNB7eRBLT
 DXhhEPQMDsDpsO/IfXZXGDREaHEX7+c25ekWFzX1fRWEHIGMU/1qoMJJdgwuFr8fvZwg
 kdB6MBlEPRLkQvxkY7GhL+MF3cgjF3I2OcXShihsfSAQwNyu2Xemp7u/HHMVZ+fgzaC0
 m3rMDwHAPyKBplQ5PqL97jY8JmipaHVtQDwC+OGUiwV6xQxbCipdzi6mxhSkeYL1CDhJ
 HHmHtQNYMVrI2V6xdOpKNjF+fObKlonTkOF3XPUDPAIZ7w/ipF2IxIZa5sUx5AIIknxk
 RJhA==
X-Gm-Message-State: AOAM530ozcj6Nq0ICBxg3QEQXRz4Sp6QOQz4hlz0LD8WmcjrzFSLGYDW
 +TBWnoGQSRI9cUBu+TtDAcU=
X-Google-Smtp-Source: ABdhPJyByd0/9Szc/ZHoK0EFbvgxrGROm82aX2DRv5sN8jN6OTmTBcOt/v1wrdF5DDX9RY3E4fscfw==
X-Received: by 2002:a05:6a00:2181:b0:4f6:f1b1:1ba7 with SMTP id
 h1-20020a056a00218100b004f6f1b11ba7mr11227274pfi.73.1650272295573; 
 Mon, 18 Apr 2022 01:58:15 -0700 (PDT)
Received: from localhost.localdomain ([103.84.139.165])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a63350f000000b003992202f95fsm12209697pga.38.2022.04.18.01.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 01:58:15 -0700 (PDT)
From: Hangyu Hua <hbh25y@gmail.com>
To: fbarrat@linux.ibm.com, ajd@linux.ibm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, mpe@ellerman.id.au, alastair@d-silva.org
Subject: [PATCH] misc: ocxl: fix possible double free in ocxl_file_register_afu
Date: Mon, 18 Apr 2022 16:57:58 +0800
Message-Id: <20220418085758.38145-1-hbh25y@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Hangyu Hua <hbh25y@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

info_release() will be called in device_unregister() when info->dev's
reference count is 0. So there is no need to call ocxl_afu_put() and
kfree() again.

Fix this by adding free_minor() and return to err_unregister error path.

Fixes: 75ca758adbaf ("ocxl: Create a clear delineation between ocxl backend & frontend")
Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---
 drivers/misc/ocxl/file.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
index d881f5e40ad9..6777c419a8da 100644
--- a/drivers/misc/ocxl/file.c
+++ b/drivers/misc/ocxl/file.c
@@ -556,7 +556,9 @@ int ocxl_file_register_afu(struct ocxl_afu *afu)
 
 err_unregister:
 	ocxl_sysfs_unregister_afu(info); // safe to call even if register failed
+	free_minor(info);
 	device_unregister(&info->dev);
+	return rc;
 err_put:
 	ocxl_afu_put(afu);
 	free_minor(info);
-- 
2.25.1

