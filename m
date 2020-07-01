Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA2421066C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 10:39:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xZQW1x65zDqgB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 18:39:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IB4Hvt+x; dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xZGC31pCzDqTG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 18:32:01 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id q15so21472961wmj.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jul 2020 01:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NnszQP2mk8a9Zq/MXSfFAa0Z6TG4Q6FByatEINovmEo=;
 b=IB4Hvt+xLQjh7eH1K3vHpPewhv/QSAS3XGMBecXxTdYAVW9QcYdtLk7UOYl3azpF+V
 40hSmK4rPCC5A6cnflmbpHGZW3V/0bY+a4YVir+5IDSrVSz0gTPgXhTuJ+ZuX7nCBFYt
 QvZXvcX3DpZJjDjhKolpvBrQq5qxHGLxX0/ou2lvhY9BS6M7eYCcy4urFScvi3a6w7sq
 AwZaht8IhrjmVMzouZuq0LcKMcXykZc7BqujAbcJuvWhoLoWHx0PnuNi2eKWzLg18Y/z
 aiTRKWS5Pi02jjk4tNb957wqb5EPgtZLf18VxrMiszOnySekKm3h/UH+OWQAY4Blkq8p
 Ygzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NnszQP2mk8a9Zq/MXSfFAa0Z6TG4Q6FByatEINovmEo=;
 b=VNj9HzcvAF/lMAOTrsBUMg/gz4oIfJp8C7TShwW+uz1+D3ROZlrx77Eup5SCrfJ8R1
 4+c/1opYaP20yErZHExGqTHJbk90qoUwfFsNseMfLgCcxDFDZgCP3b4LSm2UkVjbigQI
 Zxsom9K7H6NP17Uire+CpQdP2QtdxHWktUHYma3tusVJtPSq5gIM3ePH9TY1PmMTgTV1
 P48YQb1sXLQq0gZRXwodmp3p+hdDVlvw4rI1J69uMvMYsT9JHEVVwryViXqcivWKBteE
 HAJVgIRekaFIVVPXoP2mj9lL2qX4qOEOFIfnWYVyyyQZfFEajERsMmdsjB/3Yx5i3owy
 qSCw==
X-Gm-Message-State: AOAM531QzMOWJ2yNG0944Pm4Z4KxceFVibWIFwzjb7mIOqsH9KShwmrT
 b/rAqYcufKpa+y10+YbzmtGaBA==
X-Google-Smtp-Source: ABdhPJy4sOV8stoOBzvTAvtFg8DBehh2mCfwoxjT94FkE4/HFkIXwq07UCxvviaLtD5CKsR0ap3+Rg==
X-Received: by 2002:a05:600c:204d:: with SMTP id
 p13mr25297772wmg.88.1593592318888; 
 Wed, 01 Jul 2020 01:31:58 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id 59sm6717816wrj.37.2020.07.01.01.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 01:31:58 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org
Subject: [PATCH v2 30/30] misc: cxl: flash: Remove unused pointer
Date: Wed,  1 Jul 2020 09:31:18 +0100
Message-Id: <20200701083118.45744-31-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200701083118.45744-1-lee.jones@linaro.org>
References: <20200701083118.45744-1-lee.jones@linaro.org>
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

