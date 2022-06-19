Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F10C55082B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 05:53:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQf5N2L4jz3cB3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jun 2022 13:53:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I6IwHlaJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I6IwHlaJ;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQf4j3SNYz3bbQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jun 2022 13:52:52 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id y6so7027500plg.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 20:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SRxgMBh3LSx0X9ElKOeiQdXyG/+f/q7PqwVZVLdt1m0=;
        b=I6IwHlaJ092r96q7USBHlHlm2vIu7/Jr2LrIZEasm2TYLKSTXqrm/0O+dFOZGYO7mc
         BJokeBGKOR3LCtfc7gp1HKkFGMPHHpngWwcZZdZiM05KBYKE3Hv6Fqh7S/tl7EIRx2Ds
         XXr++LMoRW7FcNXRQIw4yicUE+4NAEnRTBXlmzm0gslkKFQGaMt245ebmEuW9Occ7A0H
         A4DChitU6yG7zBbbYnEaQMBwAi7QhIcnQRuyB+Cc6HA/KfU2oGW9vWd20u+gM+PxhC/R
         AyS77OTZgIG5yJNog+4R+e0T4K3Vvlkv2tNRsTKFDO0Ibv2SBAs13pQ/UOxi7vhggQTQ
         TmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=SRxgMBh3LSx0X9ElKOeiQdXyG/+f/q7PqwVZVLdt1m0=;
        b=AvPt4020wC285YSBXyUjs6spyYbJUQsZMoOmF73V9V49pjB1yV6QxTC1w+0ngZeOC+
         IxUAbp9EcyCfnNIhGEaV9Yfp5CUEmaCg1MYKyD+4EKL0wdTENP3Ne1tcHQ7kb68ptXVs
         IWs5Q97vLvd8mFTo0z5b+ZLUUdj79M/kTE1YJpS55diuJLrKOnJodolY/AjDqxPatBBr
         kNTfvZybJCXoeJXy9V6GOFDZNLgBzrLPHosHFzFuGDmkZiazgUAJf57gTeeVxWCj2H/Y
         mCfdByHTJFnHNAjiaHf2zW8MzmgV9a3gcPwZKBcA+R9B4Sw1Ks2eBUfgzae9/zaTsin/
         551A==
X-Gm-Message-State: AJIora/IiVrvvjODys1uXODansUv0mv9EzsRdztSq8gwRyZV7Zg2P6dS
	7Vb6u1xBZvko3qUDxcLme+M=
X-Google-Smtp-Source: AGRyM1vBaXk4a3Ta4H1IaR/y5S8r1+FFtUvL86KgPWpSb4+k6+CE+LKFJRmxLwojDmh2TcKg8Tgj3A==
X-Received: by 2002:a17:90a:4503:b0:1ea:4718:829f with SMTP id u3-20020a17090a450300b001ea4718829fmr19037191pjg.103.1655610769450;
        Sat, 18 Jun 2022 20:52:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id jd11-20020a170903260b00b0016a0d350b78sm2803112plb.58.2022.06.18.20.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jun 2022 20:52:48 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/prom_init: Add memset as valid external symbol if CONFIG_KASAN=y
Date: Sat, 18 Jun 2022 20:52:46 -0700
Message-Id: <20220619035246.2633538-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-kernel@vger.kernel.org, ul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If CONFIG_KASAN=y, powerpc:allmodconfig fails to build with the following
error.

Error: External symbol 'memset' referenced from prom_init.c

The problem was introduced with commit 41b7a347bf14 ("powerpc: Book3S
64-bit outline-only KASAN support"). So far, with CONFIG_KASAN=y, only
__memset was accepted as valid external symbol in prom_init_check.sh.
Add memset as well to fix the problem.

Fixes: 41b7a347bf14 ("powerpc: Book3S 64-bit outline-only KASAN support")
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Daniel Axtens <dja@axtens.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/powerpc/kernel/prom_init_check.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/prom_init_check.sh b/arch/powerpc/kernel/prom_init_check.sh
index b183ab9c5107..787142b5dd26 100644
--- a/arch/powerpc/kernel/prom_init_check.sh
+++ b/arch/powerpc/kernel/prom_init_check.sh
@@ -16,7 +16,7 @@
 grep "^CONFIG_KASAN=y$" .config >/dev/null
 if [ $? -eq 0 ]
 then
-	MEM_FUNCS="__memcpy __memset"
+	MEM_FUNCS="__memcpy __memset memset"
 else
 	MEM_FUNCS="memcpy memset"
 fi
-- 
2.35.1

