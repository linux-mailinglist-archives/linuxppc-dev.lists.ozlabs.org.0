Return-Path: <linuxppc-dev+bounces-3775-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF679E34C7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 09:02:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y393G5TvPz30V0;
	Wed,  4 Dec 2024 19:02:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733299322;
	cv=none; b=biKkST1E7Kgw9aX2imYKPT0FgPKYjfcqF3g2KzndX73OF2KrkSc/DUerUQEOKJkWtIfTWU8mk5YrU/5895eSM4To9mpAP6px4pctwwePuSJFrkK+ubRAjigoJ6cKVsHVX727M4rDdH5sxydSA17ZgEVTKsv3qAJ/UZixWHT+2tiXErnrz1dvB6b+ayGJBc77FsWFYhvd5L8H80hW+NfR0BXakD2TwkYxp8VB4EEwag0rd9c8eKyPtWXWThGvhir6BmJ2w+7YK2xbA+sW19KUMawCx7QQXDR9bG82oPZPw4tuQKhhjgKa6GnVXM3fQBIC/UEbINpdq0CHCgGl/I2doQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733299322; c=relaxed/relaxed;
	bh=e7QQpN88z5pQawPUGWpbcdX9nWBwHBcE9/+sjfCOZBo=;
	h=From:To:Cc:Subject:Date:Message-Id; b=oH2Ywo4DjU8Pl0BqlXHujqeWX/PNQpK9tzteR8QC4cbNmp01QhqVnmVqNPJtCcweLSKlPA7tlZ4QJqmyJkulaGAwv0tqPXuqhG28dytXQ+kvMMUC39jjF0UHAvTfKj4c6r6iOt/8sbQnXGt9i4Yf8TeVFeT3Mmp0Me7kuCIpIuwQiSZg0bRabVadKYPhW0uSQCPRf+fVhjM0208pOfhNAUnUMXoP/D+PZ8L6RLCnMv1g3aVWGEss4dKCQaUyUyAwfDHdVkgrupP+yxD2i3NBDjnbYeIRd/2ppUihvEI0LWzhXfJhFoMhfxWRVN7g+UUoEcYZy53dd8fu+OI4PHrFCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass (client-ip=111.22.67.139; helo=cmccmta3.chinamobile.com; envelope-from=zhujun2@cmss.chinamobile.com; receiver=lists.ozlabs.org) smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cmss.chinamobile.com (client-ip=111.22.67.139; helo=cmccmta3.chinamobile.com; envelope-from=zhujun2@cmss.chinamobile.com; receiver=lists.ozlabs.org)
Received: from cmccmta3.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y39394SMQz30Tr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 19:01:55 +1100 (AEDT)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee967500c700f6-d110e;
	Wed, 04 Dec 2024 16:01:52 +0800 (CST)
X-RM-TRANSID:2ee967500c700f6-d110e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee767500c6e1f3-5ee0f;
	Wed, 04 Dec 2024 16:01:51 +0800 (CST)
X-RM-TRANSID:2ee767500c6e1f3-5ee0f
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: shuah@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] selftests/powerpc: Fix typo in test-vphn.c
Date: Wed,  4 Dec 2024 00:01:49 -0800
Message-Id: <20241204080149.11759-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

The word 'accross' is wrong, so fix it.

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 tools/testing/selftests/powerpc/vphn/test-vphn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/vphn/test-vphn.c b/tools/testing/selftests/powerpc/vphn/test-vphn.c
index 81d3069ff..f348f5491 100644
--- a/tools/testing/selftests/powerpc/vphn/test-vphn.c
+++ b/tools/testing/selftests/powerpc/vphn/test-vphn.c
@@ -275,7 +275,7 @@ static struct test {
 		}
 	},
 	{
-		/* Parse a 32-bit value split accross two consecutives 64-bit
+		/* Parse a 32-bit value split across two consecutives 64-bit
 		 * input values.
 		 */
 		"vphn: 16-bit value followed by 2 x 32-bit values",
-- 
2.17.1




