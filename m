Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2DF477FD2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 23:06:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFR5y0pvBz3dtY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 09:06:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ckHJoSiq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2b;
 helo=mail-qv1-xf2b.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ckHJoSiq; dkim-atps=neutral
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFQzY3HCKz304V
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 09:00:57 +1100 (AEDT)
Received: by mail-qv1-xf2b.google.com with SMTP id m17so600209qvx.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 14:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cF9xJJ2aRpPk1BscWDeTgrg2WrIfs79hMkvusGNbWYA=;
 b=ckHJoSiqXI9Z6KI2sdHkdR6Ww8BBSTmaNDtmCtnD8TZtLTAg7eeYmoMcb0GGuwxaNW
 5bWBS4HgfbN7a9gE7rr1JtegnWXF6buoTzYNka7/VqAYaX6+XC/gHGF9dRdFdXcKyXuV
 0WT63QdY3Mi/+D8atfYH8RxC6t2WTOxLmL3BEAUkX08Q1OHXSXRMamngg0OlEeV6XYDO
 29IhTFtzAYeAdLckNjxVuITFOa5auL/Ig+XoescrdKrhTCUjeCEVg6SEjwNaUbdYe1cw
 QP2JR66nat3orn2auM7KFqQb20Z4h30WcgZOHc1Zpg52jwMZPOsru+GtcFipF7B4i8n7
 cpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cF9xJJ2aRpPk1BscWDeTgrg2WrIfs79hMkvusGNbWYA=;
 b=G5AcqOClSuJ7bqIOnaU6QTCwUUBVeFZB73a2wMIs75uo07/8WT5IyWF8Vo8EAwxXsx
 NslnmTABf6dl5xTvrPUuwpxEWu/QUgppzRiQ5AawZXO1JbU7mpb5GG8wrTH0A1IifsHP
 pSVJAk7a5mmY8cXWrRrwsL53vBG2E0qaKvZc+fgDbk0VUcLZ8kB7GwyaRdoFYN3R7AIQ
 bDHAIfTjPzUFSorlrt7G18hfmvMvCEhhaoy6biW8Wp+2C4zFrR6Xubo1q3froHPlmGD0
 nUh7aZAxVzWFlxNF30VVUBqNf1HWgeM2qINNG6rMH/hxqLrGGzm+WYeJjQwV0sbtwVkB
 9Hpg==
X-Gm-Message-State: AOAM530zsxEZSbT4VYC9YWhtOE1k2jEe7RPhIDqNdzpPCvWPKDAM0b27
 R/gbY46/VpDKwABcFY5RJSioiteI13o=
X-Google-Smtp-Source: ABdhPJyjEqWQUwFxH91+bq2s2hEZMeFhSXx1JPGbl0QTeI9A5L3m6eJerZBW17e5Uak+iPwhG6dD5Q==
X-Received: by 2002:a05:6214:e47:: with SMTP id
 o7mr18126974qvc.61.1639692055090; 
 Thu, 16 Dec 2021 14:00:55 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:dce6:135:603d:e519])
 by smtp.gmail.com with ESMTPSA id y21sm5478483qtw.10.2021.12.16.14.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:00:54 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 08/20] powerpc/chrp: Add __init attribute to eligible
 functions
Date: Thu, 16 Dec 2021 17:00:23 -0500
Message-Id: <20211216220035.605465-9-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216220035.605465-1-nick.child@ibm.com>
References: <20211216220035.605465-1-nick.child@ibm.com>
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The function `Enable_SRAM` defined in 'arch/powerpc/platforms/chrp' is
deserving of an `__init` macro attribute. This function is only called by
other initialization functions and therefore should inherit the attribute.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/platforms/chrp/pegasos_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/chrp/pegasos_eth.c b/arch/powerpc/platforms/chrp/pegasos_eth.c
index 485cf5ef73d4..5c4f1a9ca154 100644
--- a/arch/powerpc/platforms/chrp/pegasos_eth.c
+++ b/arch/powerpc/platforms/chrp/pegasos_eth.c
@@ -113,7 +113,7 @@ static struct platform_device *mv643xx_eth_pd_devs[] __initdata = {
 
 static void __iomem *mv643xx_reg_base;
 
-static int Enable_SRAM(void)
+static int __init Enable_SRAM(void)
 {
 	u32 ALong;
 
-- 
2.25.1

