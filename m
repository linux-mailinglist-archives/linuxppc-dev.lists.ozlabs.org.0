Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA7B447DD9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 11:22:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HnnHQ1pGkz2yyv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 21:22:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=iU6K6Z4r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de;
 envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=iU6K6Z4r; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HnnGp3Wpdz2yN4
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Nov 2021 21:22:10 +1100 (AEDT)
Received: from zn.tnic (p200300ec2f33110088892b77bd117736.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f33:1100:8889:2b77:bd11:7736])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 812BA1EC0516;
 Mon,  8 Nov 2021 11:12:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1636366353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MtoYV6wcauTVXH7eaqnJ0pldyJt64VOMJeAtyl78lTg=;
 b=iU6K6Z4rVlI5o9g0BTMN1oCvLmPd3voWnEwencwhFp81DjoTTp+IkVIke5y228nA1IgPZn
 iUR8IZ6d+I2yi1s9tf1s73SJRusU34fPtsYRQ/wBvhdN8pgXMBxRz26RgX7zMVAwaTYkdL
 aZ5xCMWpzsp1lDu2srWFO+yel2dCyeI=
From: Borislav Petkov <bp@alien8.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v0 32/42] macintosh/adb: Check notifier registration return
 value
Date: Mon,  8 Nov 2021 11:11:47 +0100
Message-Id: <20211108101157.15189-33-bp@alien8.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211108101157.15189-1-bp@alien8.de>
References: <20211108101157.15189-1-bp@alien8.de>
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Borislav Petkov <bp@suse.de>

Avoid homegrown notifier registration checks.

No functional changes.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: linuxppc-dev@lists.ozlabs.org
---
 drivers/macintosh/adbhid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/macintosh/adbhid.c b/drivers/macintosh/adbhid.c
index 994ba5cb3678..c8cbf8588186 100644
--- a/drivers/macintosh/adbhid.c
+++ b/drivers/macintosh/adbhid.c
@@ -1262,8 +1262,8 @@ static int __init adbhid_init(void)
 
 	adbhid_probe();
 
-	blocking_notifier_chain_register(&adb_client_list,
-			&adbhid_adb_notifier);
+	if (blocking_notifier_chain_register(&adb_client_list, &adbhid_adb_notifier))
+		pr_warn("ADB message notifier already registered\n");
 
 	return 0;
 }
-- 
2.29.2

