Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BE127599B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 16:14:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxKt36FnDzDqTK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 00:14:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=nico.vince@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HZVWbUV2; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxKmW5gvgzDqMT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 00:09:15 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id x14so127480wrl.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 07:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:reply-to;
 bh=kX0s0lKlAt9I/75DsRW7IUB5bjbInHnolZHA2f2gDHI=;
 b=HZVWbUV2P0j6RwqjQA552nOxje3SrTurgtTLuJKJhxzx5mNDRS+Z1qReK87LFMVc31
 2gOSM70duzrMZciNrrAytMgylL2LKopW7vfTBoxhM9zgSA1m5kOl4iuQOVSbwOGsWrxT
 LS4w0CLimDyXY0UwZe6BPBBVHs2dQjqSHssRd6LgE4oatomry/jA/LBMaXrhtfU8oqnG
 ZEaNe/UR5EuMbp3EuygJeRrEKYo6WApoW0ftmWPa5bB13+vuQfmuyJ1ohPNmRwhe6Bkn
 CFCTbgar26VgN+UAlQpxUaPqEB7JKmEalUkchwQ6R79JGA3BRJC419MFP6I0WESYvFsG
 4hAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kX0s0lKlAt9I/75DsRW7IUB5bjbInHnolZHA2f2gDHI=;
 b=S7gFG/6q9vZPgUqOpzeAvX7/CLh3TbVsoJYEmv301ImLWUFqVhJaWHDGxzyrkcz3Wf
 45i8xDziQM2tSON4aLO5c0oAl8dNZDPM8ERXKpMGsywB85Ug6i7byMxaPm/AQtqayWzW
 RjVbRWulXoC4HKH5HjQ+14YM86aJy2QuLw9Mjx5Xijf6HN7hC60jJ27Oyi3ld7K/dr+M
 g4tKUcA3boxcGxxybUxSjP/EFiBSQjkf6+TbIIuT+HdeCD3zuJwYYxfn2Qg1+wMtvm/5
 ayG95Kc2OrLKaajXUbftv4qa7zhb6/9fyt6OCdQNzJFJKSnH0odj4bHT83ppBAD4xWVx
 2LlA==
X-Gm-Message-State: AOAM531plbAp8Xc8anU3/JPN1uhdzxxJjw0mFa/9owLc8TSSTear7A4X
 NjRlqSYEwGf8CJNW4HliLUc=
X-Google-Smtp-Source: ABdhPJw+eMAES9Q6S42z8UePGJWtXHEdBuXf6CuSnXwa1gbzcKjD4IWT+yRgsb7sEbkYKLbbQY5LrA==
X-Received: by 2002:a5d:40c4:: with SMTP id b4mr1066794wrq.151.1600870150184; 
 Wed, 23 Sep 2020 07:09:10 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:287:860:29d1:d0a8:b1c3:1cbf])
 by smtp.gmail.com with ESMTPSA id
 m13sm30088369wrr.74.2020.09.23.07.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 07:09:09 -0700 (PDT)
From: nico.vince@gmail.com
X-Google-Original-From: nicolas.vincent@vossloh.com
To: jochen@scram.de
Subject: [PATCH v2] i2c: cpm: Fix i2c_ram structure
Date: Wed, 23 Sep 2020 16:08:40 +0200
Message-Id: <20200923140840.8700-1-nicolas.vincent@vossloh.com>
X-Mailer: git-send-email 2.17.1
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
Reply-To: nicolas.vincent@vossloh.com
Cc: Nicolas VINCENT <nicolas.vincent@vossloh.com>,
 linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicolas VINCENT <nicolas.vincent@vossloh.com>

the i2c_ram structure is missing the sdmatmp field mentionned in
datasheet for MPC8272 at paragraph 36.5. With this field missing, the
hardware would write past the allocated memory done through
cpm_muram_alloc for the i2c_ram structure and land in memory allocated
for the buffers descriptors corrupting the cbd_bufaddr field. Since this
field is only set during setup(), the first i2c transaction would work
and the following would send data read from an arbitrary memory
location.

Signed-off-by: Nicolas VINCENT <nicolas.vincent@vossloh.com>
---
 drivers/i2c/busses/i2c-cpm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
index 1213e1932ccb..24d584a1c9a7 100644
--- a/drivers/i2c/busses/i2c-cpm.c
+++ b/drivers/i2c/busses/i2c-cpm.c
@@ -65,6 +65,9 @@ struct i2c_ram {
 	char    res1[4];	/* Reserved */
 	ushort  rpbase;		/* Relocation pointer */
 	char    res2[2];	/* Reserved */
+	/* The following elements are only for CPM2 */
+	char    res3[4];	/* Reserved */
+	uint    sdmatmp;	/* Internal */
 };
 
 #define I2COM_START	0x80
-- 
2.17.1

