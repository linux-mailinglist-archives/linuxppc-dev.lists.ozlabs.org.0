Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1055020F6CC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 16:09:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49x5pW2NtHzDq7d
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 00:09:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=UCptlGP8; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49x5Wh4y3fzDqGX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 23:57:03 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id 22so18923348wmg.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 06:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NnszQP2mk8a9Zq/MXSfFAa0Z6TG4Q6FByatEINovmEo=;
 b=UCptlGP89mz89UrYfXQefNW8+e4ZQEEx97tpWiKPBMfS4wNL0irneBp0jrTF9ByhBp
 r3sH1OSHEMiwFz/5r7EkY9kOTSEF5j3ZoqwRqWJb8vbVNW1skrkKsOZTP5gEp9oREz8g
 AbeUF9AZHhUcmH/ZNDNbXyX/tcNDJePdqaFSBzXZh+af/Hh0ljo857xNngaLb/5M6uvM
 FDyUkltnD8NJFywjYlMdE/rEgEs1gwt7Lotc5q/rX00mU0keywb2yCIfDaovLph8enxA
 OTfjHeNk1H1rosvo8UqtJ7TZT8tY+d+i9r5YkK3hUsAjwQZILkkV5knsYgiZKcO7geQh
 9ulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NnszQP2mk8a9Zq/MXSfFAa0Z6TG4Q6FByatEINovmEo=;
 b=W/PWKrbfSC7oV2v6xbSofAOVpCZJPBZCYxDg7Z6GaiAlNeVa0+nHr7WH4PHgN2rz8T
 DqBM+w+B+QWT7v48gBvcWRw4Zi1ux2BwzxQCggu79F0FOCEBrTRNaPyZx0e9HeTbkFx1
 82w9a/9sPX8wMOHdI/hBQp90g5iLpPJeSVzEVdJMA4AdcLA0zpo9m5qyFsojwRnqionZ
 Xc0bMi34ut68REwb2ylEyQQTCl6EjoXguE0GhST0lPeSJyMPmVGMphC4QlTzzXWDwZKv
 9I9jwMh5XZnD7HSPE+KnmkZWEfbUQYYkY1sxDX9S6SIAckLKz0/3Mk1X24sJHkDewE6f
 rqMQ==
X-Gm-Message-State: AOAM531tMooQ8pgiJe53/aW94+lP7+h5Hs+NaufpltKTGVb0p/LJLY6h
 NhXLUlw//wSr0kDtjpwH6UPxb/acxew=
X-Google-Smtp-Source: ABdhPJxAVcr7BMBgpDdFrMsgoyDTsXOxDXBRszKa7Wa69xRKWCYbNprLZlHUJCgW8CUodbxVKwRxlA==
X-Received: by 2002:a1c:ed17:: with SMTP id l23mr21535111wmh.175.1593525106136; 
 Tue, 30 Jun 2020 06:51:46 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id t4sm3876746wmf.4.2020.06.30.06.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 06:51:45 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org
Subject: [PATCH 30/30] misc: cxl: flash: Remove unused pointer
Date: Tue, 30 Jun 2020 14:51:10 +0100
Message-Id: <20200630135110.2236389-31-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200630135110.2236389-1-lee.jones@linaro.org>
References: <20200630135110.2236389-1-lee.jones@linaro.org>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The DRC index pointer us updated on an OPCODE_ADD, but never
actually read.  Remove the used pointer and shift up OPCODE_ADD
to group with OPCODE_DELETE which also provides a noop.

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
 drivers/misc/cxl/flash.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/cxl/flash.c b/drivers/misc/cxl/flash.c
index cb9cca35a2263..24e3dfcc91a74 100644
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
@@ -206,15 +206,12 @@ static int update_devicetree(struct cxl *adapter, s32 scope)
 
 				switch (action) {
 				case OPCODE_DELETE:
+				case OPCODE_ADD:
 					/* nothing to do */
 					break;
 				case OPCODE_UPDATE:
 					update_node(phandle, scope);
 					break;
-				case OPCODE_ADD:
-					/* nothing to do, just move pointer */
-					drc_index = *data++;
-					break;
 				}
 			}
 		}
-- 
2.25.1

