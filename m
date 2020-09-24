Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1579627660B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 03:51:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxdLV4G8kzDqc3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 11:51:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Yk9jK9Aw; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxdJc4pkNzDqV9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 11:49:31 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id f1so743135plo.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 18:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1lvjIDTva8N1ySD869ceE8O3gGD9oPrrGenAk18ANi8=;
 b=Yk9jK9AwYpJViRYq1CAPbdTwrdZtbF3SAXYADXnA7ZJAPnB2l4Zf26EmMrUD92jYIW
 D1hsIhLQT28BFuyLqRZAb0XO7R4caLMmnATNoKN/oSuMAX0I8EYZ/rIy1W/FScA8PcL9
 3NEISNydX2GtW7elc/evPlPoIrACU69TXPkKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1lvjIDTva8N1ySD869ceE8O3gGD9oPrrGenAk18ANi8=;
 b=bDQTCXIbWCeMRrA+6dkKjZsiG7JrYHe0Xf3NmGiPwB8iTOPbDZlhtE7BnWX1wJ4a+b
 /faKXHia+NjdC5qagDKzhKac/JrHWRS8UgrN0tUNDPTUYwWblB1SRiG6vxiCSi8wIZmd
 q+Kpmb7sBzKR5lOzDskPaG+Zg2C0gQ1jZ3ykVM7QIPy9LbvaO58B78BdcL2F1Xy6Ip95
 qMtad5ajGexCwTYnwqrxGt4+nWKAnNTjJCsBES7Te1V84PR5Td9P1GuG7tB1ivzVs+Lx
 ymYGwveFwK8sTkgquGE2oKgk4R6LcTEJfi938CG2DUFoqFW621Hn6xMuL334F8+6K9CG
 Lg0A==
X-Gm-Message-State: AOAM5326jd6MV2ZMomBgbOaEVa1N1JODaDTXz3mftjEQfb1D2G4BUqXp
 Wpiamq7OcnwjofBQdzjI5q73IZLNOQ0FmQ==
X-Google-Smtp-Source: ABdhPJxusLwNDahaEeHsFieZqZKAFks0KNsijrgcZhivJO0XTxIweg4DCiu/Oqvh9pXtoJQ8xdmYLA==
X-Received: by 2002:a17:90a:d152:: with SMTP id
 t18mr1773111pjw.27.1600912167196; 
 Wed, 23 Sep 2020 18:49:27 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-b45d-1a4b-2a15-d1fa.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:b45d:1a4b:2a15:d1fa])
 by smtp.gmail.com with ESMTPSA id i9sm835030pfq.53.2020.09.23.18.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 18:49:26 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: PPC_SECURE_BOOT should not require PowerNV
Date: Thu, 24 Sep 2020 11:49:22 +1000
Message-Id: <20200924014922.172914-1-dja@axtens.net>
X-Mailer: git-send-email 2.25.1
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
Cc: Nayna Jain <nayna@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In commit 61f879d97ce4 ("powerpc/pseries: Detect secure and trusted
boot state of the system.") we taught the kernel how to understand the
secure-boot parameters used by a pseries guest.

However, CONFIG_PPC_SECURE_BOOT still requires PowerNV. I didn't
catch this because pseries_le_defconfig includes support for
PowerNV and so everything still worked. Indeed, most configs will.
Nonetheless, technically PPC_SECURE_BOOT doesn't require PowerNV
any more.

The secure variables support (PPC_SECVAR_SYSFS) doesn't do anything
on pSeries yet, but I don't think it's worth adding a new condition -
at some stage we'll want to add a backend for pSeries anyway.

Fixes: 61f879d97ce4 ("powerpc/pseries: Detect secure and trusted boot state of the system.")
Cc: Nayna Jain <nayna@linux.ibm.com>
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 4b33477dafb8..f645fa934853 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -983,7 +983,7 @@ config PPC_MEM_KEYS
 config PPC_SECURE_BOOT
 	prompt "Enable secure boot support"
 	bool
-	depends on PPC_POWERNV
+	depends on PPC_POWERNV || PPC_PSERIES
 	depends on IMA_ARCH_POLICY
 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT
 	help
-- 
2.25.1

