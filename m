Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 370BF3F3E72
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Aug 2021 09:52:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gsndn1BC9z3cLY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Aug 2021 17:52:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=A29wjJma;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=A29wjJma; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gsnd21nggz2yxP
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Aug 2021 17:51:32 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 m24-20020a17090a7f98b0290178b1a81700so10057213pjl.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Aug 2021 00:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=swoxKUxBx5afVLnEB5LhIDPkkheQprnH5K11Nt9R4rs=;
 b=A29wjJmazwrwxGZxMq+h34s9h8NzAPtZ5DxKcdKlMgNObBxVDvNDynzqlcY71e41mj
 U4426P8/21pDEkSEQl5Vye5goYrgP8qo83lOcPnb8Mluvdkf2mU/RrS+84b6r0rkTA7n
 NWDx2rvLg8JBxbks9wmwuHN3s+p3Igzuid9d8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=swoxKUxBx5afVLnEB5LhIDPkkheQprnH5K11Nt9R4rs=;
 b=azX8pb3uY6P4I9droDI3ucl3fHA1qhPI2zDgfciCj0y7aqsQdUqP1mwpFekOkBc1de
 agjLYZKsdkt245v/ki+MiIm/fhsizgFAhGsuuQ/oKCCljsGqS7lG+WWxDKr68IcRgYe2
 +xSQlJ4U5FBwPntNAJRjDA35zt+4QQ3PQIlw4II8v3sOW1TBb84a1y5WSCBUZfSDbTgM
 WDxCvXYUyH0hnN8Qyj7sJwSyHI7Lut5ndFL+dEGADcMXt0ag6QxHb7XMW5n8dV2mnP8s
 +M1uztGfbP2KEg7kKR1GFyX9mMNMHUawzyoZWtSH9t7PV+13sj+PhHnQox3QB2mUFHvt
 v8Jw==
X-Gm-Message-State: AOAM5308eZG9d67MDb8F8qVAwlcTKfLbMPrOdu23meoL5rhpykjAXM//
 UUy4/7X0Kd5hzGB0stH5hxPvTw==
X-Google-Smtp-Source: ABdhPJxCvC5U8Hsd1nche8TY3/3w65Fwg7CcKKRcABytGvVOTqdPGhB5VrMGcJgmSP25a1YwSAnEXg==
X-Received: by 2002:a17:90a:9205:: with SMTP id
 m5mr13759811pjo.172.1629618687826; 
 Sun, 22 Aug 2021 00:51:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id x4sm784551pjq.20.2021.08.22.00.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 00:51:27 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH for-next 02/25] powerpc: Split memset() to avoid multi-field
 overflow
Date: Sun, 22 Aug 2021 00:50:59 -0700
Message-Id: <20210822075122.864511-3-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210822075122.864511-1-keescook@chromium.org>
References: <20210822075122.864511-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383; h=from:subject;
 bh=fQWaTRNAnHwzjDX7zkAYJFkFU9dO7FLED20FxzY84uw=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhIgH0nC39QXqUTtg73y7LwI1M2THJ6kxy1tIRNS78
 0fFAH3qJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYSIB9AAKCRCJcvTf3G3AJnv2D/
 wObLbEonTkdJhW6C+/WSz4E6oGnBggzSnLMUS882u8jeYadM5HfcUGcFJ1IZoQ6kX6jFoodlo/qVnf
 lv6ENdcXT7oa5GLQDJd4zp1Un3jz2a3qKkKwRJJSPIvUcVqp9VUZniIeP+gfhhYaPISc6W1RDet5PU
 ROdHz5TDjq6eCQV5GY1zKOsKcoUcvC0OVslx6dQsCCfN8mKnM3iHXqaPAB7G5IuV403ICtdQhZvuJH
 FJuzCsKGcftKt80P0Zoel7L966sN/WwnqiHtjEj5Q4Ha+cpB4OZbMjB+2+M/jH0QC3oVuUo3AU3yj0
 ok95VgvvkcJN0Htt9NFvC5AlZBlnB5QI8JUP8jSvS4z1ZL/G4JQLsEr1riP0klpc4IOAfStks3pI70
 FKMswg8epOans0r7tNzpu4yUEjM53slyrCrPKvmlCkCQH6PZ9HpL5UeSdjvmKMkopb4mcKpOJKZpPV
 2y8VLpuG0jg5g4hX+/itWAXGLAwnR7BX1ZxzgZ28P0SF6/C4DDHWrrDeF9XVdF9bcQkO4TLjui7wbi
 nL4Fc4wq+gL4gtVmXqAAe18gdYsilyD4H0XXHcga+xLL80dr04yJe/zWFZWwb7pCdm/o3CVYxCoA4Y
 oQBZ3nMgYoV4HF+OrXkF4vTxkiD1vjqS4oYPHI5RM0UIBNPZH+F7nsJ6feWg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Francis Laniel <laniel_francis@privacyrequired.com>,
 Kees Cook <keescook@chromium.org>, linux-mm@kvack.org,
 Wang Wensheng <wangwensheng4@huawei.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Qinglang Miao <miaoqinglang@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 Daniel Micay <danielmicay@gmail.com>, linux-hardening@vger.kernel.org,
 clang-built-linux@googlegroups.com, David Gow <davidgow@google.com>,
 linuxppc-dev@lists.ozlabs.org, Bart Van Assche <bvanassche@acm.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Instead of writing across a field boundary with memset(), move the call
to just the array, and an explicit zeroing of the prior field.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Qinglang Miao <miaoqinglang@huawei.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Hulk Robot <hulkci@huawei.com>
Cc: Wang Wensheng <wangwensheng4@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/lkml/87czqsnmw9.fsf@mpe.ellerman.id.au
---
 drivers/macintosh/smu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/macintosh/smu.c b/drivers/macintosh/smu.c
index 94fb63a7b357..3e2b25ea58a3 100644
--- a/drivers/macintosh/smu.c
+++ b/drivers/macintosh/smu.c
@@ -848,7 +848,8 @@ int smu_queue_i2c(struct smu_i2c_cmd *cmd)
 	cmd->read = cmd->info.devaddr & 0x01;
 	switch(cmd->info.type) {
 	case SMU_I2C_TRANSFER_SIMPLE:
-		memset(&cmd->info.sublen, 0, 4);
+		cmd->info.sublen = 0;
+		memset(cmd->info.subaddr, 0, sizeof(cmd->info.subaddr));
 		break;
 	case SMU_I2C_TRANSFER_COMBINED:
 		cmd->info.devaddr &= 0xfe;
-- 
2.30.2

