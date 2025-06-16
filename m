Return-Path: <linuxppc-dev+bounces-9389-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BB9ADA596
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jun 2025 03:34:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bLCGN5fc2z307K;
	Mon, 16 Jun 2025 11:34:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::112a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750032028;
	cv=none; b=BfNmMvEnb2yxQtBSdAF8jYDlTJiOguri/s5bsBnqpJugd/EM/l9U5rf/c5DEanokYkWKaiR9J7gp77UH8wrpjGBdo50Y6VOJuMeCpaLQhpeijB/hsY+A3sbkXyYME8dCIAwbwrUqD6QdoNSgSrhxAqLNdox5NHRw6WgCJLjRLRb7dKs5K6TDC6icxFl70t8T5BVWWqsMdy2Soh1+dTIOBdFl78bVpL2MSV6yg8kpleF9asJKfD/1YcusY7NmWVMbnI6fPB6p+2mu4nrSlGFP6NWf5U3wYjLLxZDdH0yCIqybfq15NDvzIgEqCcTAIQriDj41Nitbbd4kYrslQSqNbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750032028; c=relaxed/relaxed;
	bh=UbpHHR1YWrZ21Q/PNqsadbXIdVEUSMTqTza6iEwDmdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nmWUiEq1g1f/p+B5n0/iuISlKK/CGgYSXNTL9vz9OH48kQGCFv2TOQjDx1Qzba+nd05NiOPVELcoinBzVHpIwgivtKeqZZbfn7+71MfnkEifA0zhFCLkuuPeDmbM/GVCt5AgG69Jh9f9D6IPkFR+gWBo3UFBnRfAE2WB9S8IyH0BqDhMSeGycpx0gJPQGvDb4agkn/AdaCE9nKcRUMopNIfiM6yRRzdWyx+i+fpTIP9A1ssaHJnFUCpYY3qlh7ftrYJepFHyil/BTVwITpt4JVHBh23/Llg1NHM0UMPGlgY5mAvSCoZXS/PJTSRRyWjgVC7Lte9VNDtJbSzywO+TZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f4Qx99jp; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=alexguo1023@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f4Qx99jp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=alexguo1023@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bL9B23LmJz2xHv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jun 2025 10:00:24 +1000 (AEST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-70b4e497d96so34791677b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Jun 2025 17:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750032021; x=1750636821; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UbpHHR1YWrZ21Q/PNqsadbXIdVEUSMTqTza6iEwDmdQ=;
        b=f4Qx99jpWv2lwc7xO+wuYREuU+2Ej3iY0Ma2PkFQcIUw1hoTt1fka8G4X4Pn2+rJHs
         2dc9iEa3WTB11taysNT4HamlOVo2JuhvWEh8fEVvHqa4rsuJLXKesoaQmYjMgUSyOCaq
         5zM9dCh3dcW3aF33k9xh+wEzK43b/RExxHLXp3HbwGsGOtlsh9tWQzQQoOeByVHgDYeM
         sMFzuUeRs8DLCj0iT1GTtEkJ/hGa9Wiqbfsro2ZB4GGS5nxKY7EsCwaTDR3nwVNspn+o
         m5F1QNtLHEOck4P3YJmofkDQn09bHMmqTWeWIeR6y2Eb8D1Pk1imc8+VvlQgBjLcxyPL
         2oxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750032021; x=1750636821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbpHHR1YWrZ21Q/PNqsadbXIdVEUSMTqTza6iEwDmdQ=;
        b=r4PFbMVnECsgS+lFqgMGyj8bqPNpFSeAWJlMhQrVL7myNKZlzcj9qKGyLKXieaHZGA
         7hRQAa656MByB516nEMlD2gxtJXLtbNIAy8GBAyME2XNORlRs9tZqg8BhBT7niesGebz
         5eZsonZgqLoWFU1DAecfXeNvfn3j4HeIUAmJo5TZlF37MpFmp+hOmvRLyNFRUpY/Ptv6
         pZmSI3x/KOkitJZ9Sa0gTeQu8gEm9gr710hA3QLBNmzoqQMD8zW0Nzqe1VuCEe6saU4u
         +LrGVwFpckxqLXAnbyBC72/ds+lkfP5/3vHmTNWM5D3Xnvq0hYzeURpIqdunV1PW9qck
         JdOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV24O5346YUbtJg7eWpt3HUZ41RYbkUWS1bd3ozSsOkmw4USi4Ghtz0r2yRCXf9KfJ6xOm7Shw/NbVp7H0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzv9EXAoCR4qhxfnhmGAQghoVeBtT4xAAT62QSqxcKIYrdFLFzb
	Z7gpD3d7ZFynLgToBmKubTB1NLbLKKpSOEn05Wb6MFb79dA9QN/QT2tf
X-Gm-Gg: ASbGncu0MO4vcqDWyZD5ZDuOrjENidmVNmbFgyyILost939eVFhdvFJ6UC2fAcD/n3y
	E76NIv4+Rs2RKRNeyZeWUS2EBrNvtl7uOgVQcY6HgoixOU8jNcasD+zKBJhkhJ2SgaA3siKMt8a
	omRzegbRfQvJwJPFsmOzi1zrc4OsT/QoliBNwruUcw1G31AijEuSmurPfSBycYzrXQKv3bEiWoN
	vyVKRzXXgtkiQ7rRv7deUEHG4K3fH0wjR1r+eUAQXTfZsUhPimFsnvIBJ79MhkdEUQEh1/jLJCh
	+oP/4nuie8kCv6mY7WhEbn/Ck6tif5HagV30XCrKVy3LZ6vfWKsttt6qRVzVUOCaXw304npLC7t
	B
X-Google-Smtp-Source: AGHT+IGDXYrPWN+Wr3Z2QDg1C5fs0fvZipdzhoh1Vk3lSCmP/M8jbzJp56ovokdH9P91PUty8NLiOw==
X-Received: by 2002:a05:690c:906:b0:70e:29d2:fb7b with SMTP id 00721157ae682-71175498c04mr101981967b3.33.1750032021178;
        Sun, 15 Jun 2025 17:00:21 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71186a916absm4304957b3.17.2025.06.15.17.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 17:00:20 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: andi.shyti@kernel.org
Cc: alexguo1023@gmail.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	linux-i2c@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: powermac: Fix out-of-bounds bug in i2c_powermac_smbus_xfer
Date: Sun, 15 Jun 2025 20:00:18 -0400
Message-Id: <20250616000018.545636-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The data->block[0] variable comes from user. Without proper check,
the variable may be very large to cause an out-of-bounds bug.

Fix this bug by checking the value of data->block[0] first.

Similar commit:
1. commit 39244cc7548 ("i2c: ismt: Fix an out-of-bounds bug in
ismt_access()")
2. commit 92fbb6d1296 ("i2c: xgene-slimpro: Fix out-of-bounds
bug in xgene_slimpro_i2c_xfer()")

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/i2c/busses/i2c-powermac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index f99a2cc721a8..3a061b67716a 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -78,10 +78,14 @@ static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
 	 * anywhere near a pmac i2c bus anyway ...
 	 */
         case I2C_SMBUS_BLOCK_DATA:
+		if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
+			return -EINVAL;
 		buf = data->block;
 		len = data->block[0] + 1;
 		break;
 	case I2C_SMBUS_I2C_BLOCK_DATA:
+		if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
+			return -EINVAL;
 		buf = &data->block[1];
 		len = data->block[0];
 		break;
-- 
2.34.1


