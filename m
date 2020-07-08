Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 750D721883F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 14:59:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1zt14SR7zDqQ6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 22:59:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bqCkYlhY; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1zq65115zDqHp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 22:57:22 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id k6so48902031wrn.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jul 2020 05:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TTuqyVT9cnuWmuZkR2avkoolSz/GKaORVGbqfOTz7Tw=;
 b=bqCkYlhYnCpQAHR1jCpg4zDsmvF7/yYY+dW4Ry8hSQ0ol6hlgM9RxlvgkLto7NQu5s
 SXp/EDHEhxl+WtlnQE+xeWiBsEgbG0avYbPfKcs3fKh90TWTpl3657DTRoFlcHS0lmrv
 7ERcbYLCIBCB+dlVGHCMZm8/s+8PcLN6rNLnhsJGomxu6akKrsW1Gs3MzNUg8R2DM8Uw
 P4YHkaMvjJqDKUr8l0a0yYdnA22JvmDESt/jJJtoE/+ULkUzyKAzorUCP8nUCaZtRmWV
 8JGxbZEPcoL+95Lp48vw6qXXBAJdLR8xqZGilGjfZ5k6ZeZQ5cnVFZ5cITwpJahCk7JF
 HJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TTuqyVT9cnuWmuZkR2avkoolSz/GKaORVGbqfOTz7Tw=;
 b=PVsy0avwlAA/vlXV90WxnA9m2QiVcxuVUatsph+RoQtUpizyCfJxzkO0ZLRFNLSuvB
 0ajGZlN6qSsQMDRI3JfUEB9DMFLH964/mJpk9TMSoj7nkkr0ytBQ16nFf38jd1a4ry8F
 0G42FEqcavBLrz4w3Hw+zg3Saeujs3575T+8uZHoUSG9rbpvuw6G0+fC/8fpTGzlPMyj
 xGGyJWfKPyYBwJd+DgAkr+htwyUED/UnwERysz+WYppPsSDITWpww91nag6JkUHavi0s
 PuJgscJx9G4IlEOrP+Sw2IbRcbMA30omNQyM5/lJccWVkvXEJTVWhvJ3/tJLkqVlETNF
 RsgA==
X-Gm-Message-State: AOAM530TyvfgHICbW1ybWlMzWa3TpGzT0/VgMYJHAh9QG9K0SGKKblQg
 UnHKOA+ejZICmQGa/HkOwWArGQ==
X-Google-Smtp-Source: ABdhPJxIHdPTQ+3Fj8EaoAnC4n0L/dO6qJOdSZK1Vn9FBMjAc28ucuEaecvFE3uBbNM6QZPL88lZuw==
X-Received: by 2002:adf:f8cb:: with SMTP id f11mr61733966wrq.358.1594213037108; 
 Wed, 08 Jul 2020 05:57:17 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id v9sm6993885wri.3.2020.07.08.05.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 05:57:16 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org
Subject: [PATCH 3/3] misc: cxl: flash: Remove unused variable 'drc_index'
Date: Wed,  8 Jul 2020 13:57:11 +0100
Message-Id: <20200708125711.3443569-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200708125711.3443569-1-lee.jones@linaro.org>
References: <20200708125711.3443569-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
 Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Keeping the pointer increment though.

Fixes the following W=1 kernel build warning:

 drivers/misc/cxl/flash.c: In function ‘update_devicetree’:
 drivers/misc/cxl/flash.c:178:16: warning: variable ‘drc_index’ set but not used [-Wunused-but-set-variable]
 178 | __be32 *data, drc_index, phandle;
 | ^~~~~~~~~

Cc: Frederic Barrat <fbarrat@linux.ibm.com>
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/misc/cxl/flash.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/cxl/flash.c b/drivers/misc/cxl/flash.c
index cb9cca35a2263..774d582ddd70b 100644
--- a/drivers/misc/cxl/flash.c
+++ b/drivers/misc/cxl/flash.c
@@ -175,7 +175,7 @@ static int update_devicetree(struct cxl *adapter, s32 scope)
 	struct update_nodes_workarea *unwa;
 	u32 action, node_count;
 	int token, rc, i;
-	__be32 *data, drc_index, phandle;
+	__be32 *data, phandle;
 	char *buf;
 
 	token = rtas_token("ibm,update-nodes");
@@ -213,7 +213,7 @@ static int update_devicetree(struct cxl *adapter, s32 scope)
 					break;
 				case OPCODE_ADD:
 					/* nothing to do, just move pointer */
-					drc_index = *data++;
+					*data++;
 					break;
 				}
 			}
-- 
2.25.1

