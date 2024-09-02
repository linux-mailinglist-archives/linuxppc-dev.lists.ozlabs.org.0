Return-Path: <linuxppc-dev+bounces-864-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F24ED9682EB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 11:17:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wy37N4xcPz2xX4;
	Mon,  2 Sep 2024 19:17:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725265886;
	cv=none; b=VolACBtBiyZ4H/8Moy4ZFTdJKOtz/CvKUODATMdnpYJdkEUwH+vlUL1tY4wLsxZVCzIVoBndWlUQWF14iJbtQh1PdenqNA+WhE998PHhaEpWM0EO6DljL2ETN8aqG4zPAWfVwuisnlIsTmxzJsOsu0p8ejTH5EoN5xKbC6NUuH3oVYYzSSJMMsN6SaMLznCr9ffSfsO/qz8/l9TJVtDFUjE3BGn8k1uRVWR9xuG7Jnm/as3AMYji6LTm16b3nqWlL/HWPBgMxmszQ2GxfRibANScuvdD0MbsSXGr670X9zEJ3phLL0e91zhpezSdwDOLA/VlWDwfdw6JJhEjAIrSug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725265886; c=relaxed/relaxed;
	bh=KbzJJMR5KU9X4bJ73VMqZ9QSm+HNQa4dSpds+VSRgmI=;
	h=X-Greylist:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:
	 X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding; b=ZOmNo8qDiKlzZFo1kwP07EGM9weFOEUNNvGQ4YQWs8Q8YCVl21ePuCvEWNNNrhu1vOB4V+uElc+fnosuVZpNjp5xPCkPYhuIZzIRaEC56BE/CAPLXvmCind1ZP0IvyGs2jlWbNIxRiTkv8XTCE6AVSRFcS/rJViGQJtojqpB+T2lGncBnYZMlEJgjjKDHSITFLt44xda92QSDlfLY4uo+2cWOC3S1T48C2mPnpHtpQFWcGPFYlormsmYV1H+9I1P2BYnlFrK5tdrAhMZWffCxireh9TzWLtN5NNrrPOLvhr1sCZVHWPNYyS/zWUL3WptUYenu2CdTkZbLMwEDY1Cfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass (client-ip=111.22.67.139; helo=cmccmta3.chinamobile.com; envelope-from=liujing@cmss.chinamobile.com; receiver=lists.ozlabs.org) smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cmss.chinamobile.com (client-ip=111.22.67.139; helo=cmccmta3.chinamobile.com; envelope-from=liujing@cmss.chinamobile.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 182 seconds by postgrey-1.37 at boromir; Mon, 02 Sep 2024 18:31:25 AEST
Received: from cmccmta3.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wy2652m85z2xb9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 18:31:25 +1000 (AEST)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee966d57723b76-d7b7a;
	Mon, 02 Sep 2024 16:28:19 +0800 (CST)
X-RM-TRANSID:2ee966d57723b76-d7b7a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain.localdomain (unknown[10.54.5.255])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee866d577213ed-915e4;
	Mon, 02 Sep 2024 16:28:18 +0800 (CST)
X-RM-TRANSID:2ee866d577213ed-915e4
From: Liu Jing <liujing@cmss.chinamobile.com>
To: rafael@kernel.org
Cc: viresh.kumar@linaro.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen@kernel.org,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Liu Jing <liujing@cmss.chinamobile.com>
Subject: [PATCH] cpufreq: Fix the cacography in powernv-cpufreq.c
Date: Mon,  2 Sep 2024 16:28:16 +0800
Message-Id: <20240902082816.2599-1-liujing@cmss.chinamobile.com>
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

The word 'swtich' is wrong, so fix it.

Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
---
 drivers/cpufreq/powernv-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index fddbd1ea1635..64fa92623a51 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -692,7 +692,7 @@ static void gpstate_timer_handler(struct timer_list *t)
 	}
 
 	/*
-	 * If PMCR was last updated was using fast_swtich then
+	 * If PMCR was last updated was using fast_switch then
 	 * We may have wrong in gpstate->last_lpstate_idx
 	 * value. Hence, read from PMCR to get correct data.
 	 */
-- 
2.33.0




