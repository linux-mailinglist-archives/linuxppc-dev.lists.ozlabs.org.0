Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4160072A246
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 20:31:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qd8n60DdFz3fkQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 04:31:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.182; helo=mail-il1-f182.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qd8mc0JdPz3bsS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 04:31:27 +1000 (AEST)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-33e53672aa6so8860325ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 11:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686335485; x=1688927485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZBgb9qh78ul22lTen3bNkTv5w8c6tZwoVzvuQBQLYYo=;
        b=Fc3ep2E2wJJHAg32iMICRXUdLR67IjtmoF9HQ05A5IcAmol6qzvTuwVVpiFKq2yYRN
         sQoiaq1xcBGD8ecxb85St02XULUC3AWvZaJkceJZgG1aHPnnCkGbfumL9rpjZ3u8EbZ2
         6r07T415TwTOsVfDvMzPHnuVTq/es/ie/F/EidcnCmJn1GeEDumSrDJhU94tMgl4FN23
         i1HKkHjIqJkLyfFnVSJHU+3tudxQ2mbVc3XiVOI9TN6CSZ7b+CiCy/xqCUGn9cK8l/Wh
         hsIQRqdSuJwephXJU8DAbc7tI+IZkbJf86Xt1Vs2E4uQ87gCdq2BJnRFW9fiwbvqYGna
         q30Q==
X-Gm-Message-State: AC+VfDzyBhRN6fTyuuf66e33Kpr0+ZoANNNWPJcRvbbULycqEPufo+1B
	Hi6eLIpcDeQyOloCdgxNL8gUPAFJ1w==
X-Google-Smtp-Source: ACHHUZ5gDT89Oq0favPV6ld1NepU+kJNtymKnlHA5cFHax9M1Emu/pO9ymPRbgYmioX0BY9euQDJHw==
X-Received: by 2002:a92:cb49:0:b0:328:39a6:ed13 with SMTP id f9-20020a92cb49000000b0032839a6ed13mr2302251ilq.4.1686335485541;
        Fri, 09 Jun 2023 11:31:25 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id h1-20020a0566380f8100b00411baa5ec5asm1073244jal.154.2023.06.09.11.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 11:31:24 -0700 (PDT)
Received: (nullmailer pid 1765745 invoked by uid 1000);
	Fri, 09 Jun 2023 18:31:23 -0000
From: Rob Herring <robh@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] cpufreq: pmac32: Use of_property_read_reg() to parse "reg"
Date: Fri,  9 Jun 2023 12:31:11 -0600
Message-Id: <20230609183111.1765507-1-robh@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the recently added of_property_read_reg() helper to get the
untranslated "reg" address value.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/cpufreq/pmac32-cpufreq.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/pmac32-cpufreq.c b/drivers/cpufreq/pmac32-cpufreq.c
index ec75e79659ac..f53635ba16c1 100644
--- a/drivers/cpufreq/pmac32-cpufreq.c
+++ b/drivers/cpufreq/pmac32-cpufreq.c
@@ -378,10 +378,9 @@ static int pmac_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
 static u32 read_gpio(struct device_node *np)
 {
-	const u32 *reg = of_get_property(np, "reg", NULL);
-	u32 offset;
+	u64 offset;
 
-	if (reg == NULL)
+	if (of_property_read_reg(np, 0, &offset, NULL) < 0)
 		return 0;
 	/* That works for all keylargos but shall be fixed properly
 	 * some day... The problem is that it seems we can't rely
-- 
2.39.2

