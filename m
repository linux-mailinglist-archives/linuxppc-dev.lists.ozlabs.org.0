Return-Path: <linuxppc-dev+bounces-1639-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A53B39883FC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 14:15:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFTtX6KgBz30T8;
	Fri, 27 Sep 2024 22:15:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727418519;
	cv=none; b=dJBgaHRdRYidltHvXp/fMH8ON+Vp76dUE0/wErTElP7drbT/PYX9GFxT8J4KpqEYDgUgBvYUXp5IYi7Amr3JorH+OBrnuR7Rq9rTD9MsFbl8E60WikXZM1f72nfOVpzWlJ1Hu5NCbCIqW6M6mBNH2Cd+2iznXrxlBvQ0Z9kJcDWa7yIcixGsLouqfxLZgsGRWnE9LdJvXbof/JcE7FhTaTRpqxbLWChedjA3XIXDSkM7MdlGnptE4e7hSyvDcEqSQ6qN0zFF4YN8S1KKRJdlk/eArSk/IteSu4AuCGly35e77ddyC3qEkLB12fs0J53O7ltPedprSBypLP/HUKNiCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727418519; c=relaxed/relaxed;
	bh=307VRQ+RT4hvYmgaRPoNH4/mXs8JSe2PjrikH/+E4Hc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YsuzGGzajVaSQ6sYaT7a6qtUQUhcteFQ+X5XZqMqqEFL0MwCC1UPj+EKnljvWRGbSwD9HgD+4gCZRrLonUtUoVknAUrA3IpqweNmofLwoPu1FSLRchAAh1N7i2EX8zA9Tl6u4aZGPBR90lbTKPZ2ea/Tcqzij+qsPEGtBAfovmYb9d8ItopWn8gTaJdkqOqht9VbYeKdUbrxakjrQSetHdpU0t7RyLNX2ULX4EMOPu1Q0jacEhHbXQ0q9jzz6oolxSIrdET3Ucraum768XYGtyVXIJ/EECWd+ZDCR3qQw7z1CTIOY9fNssYYL1d4Zz6HTVj/xYtIwNVYsXQa1lC82g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass (client-ip=111.22.67.151; helo=cmccmta2.chinamobile.com; envelope-from=zhangjiao2@cmss.chinamobile.com; receiver=lists.ozlabs.org) smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cmss.chinamobile.com (client-ip=111.22.67.151; helo=cmccmta2.chinamobile.com; envelope-from=zhangjiao2@cmss.chinamobile.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 181 seconds by postgrey-1.37 at boromir; Fri, 27 Sep 2024 16:28:37 AEST
Received: from cmccmta2.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFLBs5rWZz304s
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 16:28:37 +1000 (AEST)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee666f64fd8248-6cb0c;
	Fri, 27 Sep 2024 14:25:30 +0800 (CST)
X-RM-TRANSID:2ee666f64fd8248-6cb0c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee866f64fda322-3205d;
	Fri, 27 Sep 2024 14:25:30 +0800 (CST)
X-RM-TRANSID:2ee866f64fda322-3205d
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: shuah@kernel.org
Cc: mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH] selftests/powerpc: Rm the unnecessary remove function.
Date: Fri, 27 Sep 2024 12:31:25 +0800
Message-Id: <20240927043125.8199-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

Path is not initialized before use,
remove the unnecessary remove function.

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
 tools/testing/selftests/powerpc/mm/tlbie_test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/mm/tlbie_test.c b/tools/testing/selftests/powerpc/mm/tlbie_test.c
index 48344a74b212..fd1456d16a7d 100644
--- a/tools/testing/selftests/powerpc/mm/tlbie_test.c
+++ b/tools/testing/selftests/powerpc/mm/tlbie_test.c
@@ -314,7 +314,6 @@ static inline void end_verification_log(unsigned int tid, unsigned nr_anamolies)
 	fclose(f);
 
 	if (nr_anamolies == 0) {
-		remove(path);
 		return;
 	}
 
-- 
2.33.0




