Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7CE6B471A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 15:48:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PY87c5lTfz3f4f
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Mar 2023 01:48:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.46; helo=mail-ot1-f46.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PY85w1WXYz3f3n
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Mar 2023 01:47:16 +1100 (AEDT)
Received: by mail-ot1-f46.google.com with SMTP id r23-20020a05683001d700b00690eb18529fso3052577ota.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 06:47:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=erVHxEOkHulgXr4ymdjMTqBXd4BHusuBykzBB4r+uDs=;
        b=6klCYbTQMl5cb7yWYi1LRPB7MftgCbxiLTrui09+5uSAlg3G6psOqbuQV34I7Y556A
         bgztwNy9rLtejqMjP5kQ+9OmYGxa5OFcHsnuk1CeQ8WNhPYhoMVK111tSav36Lv0rcY9
         +T33cDUN/kov97UXiOmJhdcn0BaiHYcEJmDToKn+NlPfdjp4HrzwA/g9HSVADf6Jd05X
         yE/r3letcpEHDcLHcRA71JUvpEl89oY6pcrPzO+RvgmH2keO5ask4MqzeOdFtD9rrhno
         /nVvz2gDQr/5BuLXrbYFRJIwMFwTiEfOXEAyTNTWTw0QfhJqXiJLfmK0s79mfcmBGbUd
         qBhQ==
X-Gm-Message-State: AO0yUKXJF3vwkSy575tPm2Zwz79j0OoI8g2X103yWpIpc42gkJRp3IOT
	mXTtyl7OfTnqKdqmsJU9lCH9I1GguQ==
X-Google-Smtp-Source: AK7set8hJS2ezY4Sj6II5USm8t5lAU/pknQcOqjT5++f2l5DIb1/fgDXqQGDmXQaSJB3gBb5nRHPoQ==
X-Received: by 2002:a05:6830:43a1:b0:690:e7d0:7918 with SMTP id s33-20020a05683043a100b00690e7d07918mr16287581otv.8.1678459633357;
        Fri, 10 Mar 2023 06:47:13 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q19-20020a05683022d300b0068bd20cf07dsm114512otc.48.2023.03.10.06.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:47:12 -0800 (PST)
Received: (nullmailer pid 1541845 invoked by uid 1000);
	Fri, 10 Mar 2023 14:47:03 -0000
From: Rob Herring <robh@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] cpufreq: pmac32: Use of_property_read_bool() for boolean properties
Date: Fri, 10 Mar 2023 08:47:03 -0600
Message-Id: <20230310144703.1541819-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties.
Convert reading boolean properties to to of_property_read_bool().

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/cpufreq/pmac32-cpufreq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/pmac32-cpufreq.c b/drivers/cpufreq/pmac32-cpufreq.c
index 4b8ee2014da6..7ec6d1bb4592 100644
--- a/drivers/cpufreq/pmac32-cpufreq.c
+++ b/drivers/cpufreq/pmac32-cpufreq.c
@@ -546,7 +546,7 @@ static int pmac_cpufreq_init_7447A(struct device_node *cpunode)
 {
 	struct device_node *volt_gpio_np;
 
-	if (of_get_property(cpunode, "dynamic-power-step", NULL) == NULL)
+	if (!of_property_read_bool(cpunode, "dynamic-power-step"))
 		return 1;
 
 	volt_gpio_np = of_find_node_by_name(NULL, "cpu-vcore-select");
@@ -576,7 +576,7 @@ static int pmac_cpufreq_init_750FX(struct device_node *cpunode)
 	u32 pvr;
 	const u32 *value;
 
-	if (of_get_property(cpunode, "dynamic-power-step", NULL) == NULL)
+	if (!of_property_read_bool(cpunode, "dynamic-power-step"))
 		return 1;
 
 	hi_freq = cur_freq;
@@ -632,7 +632,7 @@ static int __init pmac_cpufreq_setup(void)
 
 	/*  Check for 7447A based MacRISC3 */
 	if (of_machine_is_compatible("MacRISC3") &&
-	    of_get_property(cpunode, "dynamic-power-step", NULL) &&
+	    of_property_read_bool(cpunode, "dynamic-power-step") &&
 	    PVR_VER(mfspr(SPRN_PVR)) == 0x8003) {
 		pmac_cpufreq_init_7447A(cpunode);
 
-- 
2.39.2

