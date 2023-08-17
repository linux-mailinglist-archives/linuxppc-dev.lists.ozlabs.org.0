Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A969177EF55
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 05:03:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Lu7Fi3lo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RR8vn2zbcz3cTQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 13:03:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Lu7Fi3lo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33; helo=mail-qv1-xf33.google.com; envelope-from=twoerner@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RR8r110Vgz2yVJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 13:00:01 +1000 (AEST)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-644e8aeb791so26240066d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 20:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692241199; x=1692845999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjoDDEyxVBWaQtzkWkdga/Zvs3GJHHOlEnHErr/kjWs=;
        b=Lu7Fi3loMtfHwYQlIndd8s4c97XWa+qSGHVzGWylM/WJo2xthm62+VioAKyDY0IGBH
         BaTwP2cfyzZu3k6lGSd6BpAHyxUXLmC3N6zdcZGghI5P+ZAB17kBhj2ua97IM244IMjx
         RYfrZ8PBBmWLoe5zs4A034vEx5iOI6Nv/4XupEqSuDiZ8BMNpfTC3h7HyxCcAN32IaHL
         VmVDNvGyI14LIfL3C9W4aL+asUMnyZcQ9TjzVKLFGaxAWsNlGGXSe2l8VGf9mTzf1+Yq
         ExR/xABGYpt+XvCS1mSMrbTD16yhPaomKGZs0LcnbUqrzZo4FczXs2BjwFxwzYxUU7S5
         gN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692241199; x=1692845999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WjoDDEyxVBWaQtzkWkdga/Zvs3GJHHOlEnHErr/kjWs=;
        b=VwhVDI9U/oZxmdu1grSO73oeEGhHWSI4EQLjwZptRrizZQB5sJySBo2BzahhNqct/W
         VIWkwNrTn1Q+zeXb84HLYUntpWNOMGDFY6tvvukS0HXS90ZrkGLrNKtE/SXO2Ay3e2DT
         CAWHhPInIXgS9oTg8e4ijF5wo4NMsjRTDgFYcpbct49wGxg0JCwgIqWml3usfbUd9UqJ
         7tLfTQwbWXRscMl5F8bf4S0m/tCudQCrVZoIlu9zslajVAriHf+NgzYMG39oTyfQnWS9
         Lrg0LWlUloeU4BnZ4TOA710d6ettL25hM0tWYrTyKmg/AmDdP/8j5eNUAx4DyIJ62MDM
         aAIw==
X-Gm-Message-State: AOJu0Yy0NeBJY2G3qaz/bmfSMt8KrPKoTGSYX1c2tQ9FPOcO9rNMOPob
	zjLEEfGoubrtlt7k8ucgRSQ=
X-Google-Smtp-Source: AGHT+IGhZ/HBbA0JLp662iG7DoeLVwbqfYr89wyB+wy0wQ06xPNcpBzGU9UCkaLwgQGQewTc8rniNA==
X-Received: by 2002:a0c:9719:0:b0:647:1feb:327a with SMTP id k25-20020a0c9719000000b006471feb327amr4177889qvd.59.1692241198643;
        Wed, 16 Aug 2023 19:59:58 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id c16-20020a0cf2d0000000b0063d0159e1f6sm5260184qvm.109.2023.08.16.19.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:59:58 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v2 3/4] arch/mips/configs/*_defconfig cleanup
Date: Wed, 16 Aug 2023 22:59:38 -0400
Message-ID: <20230817025942.3209-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.41.0.327.gaa9166bcc0ba
In-Reply-To: <20230817025942.3209-1-twoerner@gmail.com>
References: <20230817025942.3209-1-twoerner@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Drop CONFIG_IP_NF_TARGET_CLUSTERIP from any remaining mips defconfigs as it
was removed in commit 57f8e00d8a82 ("usb: 71 musb: Drop old unused am35x
glue layer").

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 arch/mips/configs/ip22_defconfig        | 1 -
 arch/mips/configs/malta_defconfig       | 1 -
 arch/mips/configs/malta_kvm_defconfig   | 1 -
 arch/mips/configs/maltaup_xpa_defconfig | 1 -
 arch/mips/configs/rm200_defconfig       | 1 -
 5 files changed, 5 deletions(-)

diff --git a/arch/mips/configs/ip22_defconfig b/arch/mips/configs/ip22_defconfig
index 44821f497261..dc49b09d492b 100644
--- a/arch/mips/configs/ip22_defconfig
+++ b/arch/mips/configs/ip22_defconfig
@@ -127,7 +127,6 @@ CONFIG_IP_NF_MATCH_TTL=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
diff --git a/arch/mips/configs/malta_defconfig b/arch/mips/configs/malta_defconfig
index 743209047792..ae1a7793e810 100644
--- a/arch/mips/configs/malta_defconfig
+++ b/arch/mips/configs/malta_defconfig
@@ -127,7 +127,6 @@ CONFIG_IP_NF_MATCH_TTL=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
diff --git a/arch/mips/configs/malta_kvm_defconfig b/arch/mips/configs/malta_kvm_defconfig
index dd2b9c181f32..c07e30f63d8b 100644
--- a/arch/mips/configs/malta_kvm_defconfig
+++ b/arch/mips/configs/malta_kvm_defconfig
@@ -131,7 +131,6 @@ CONFIG_IP_NF_MATCH_TTL=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
diff --git a/arch/mips/configs/maltaup_xpa_defconfig b/arch/mips/configs/maltaup_xpa_defconfig
index 97c2d7f530b3..0a5701020d3f 100644
--- a/arch/mips/configs/maltaup_xpa_defconfig
+++ b/arch/mips/configs/maltaup_xpa_defconfig
@@ -128,7 +128,6 @@ CONFIG_IP_NF_MATCH_TTL=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
diff --git a/arch/mips/configs/rm200_defconfig b/arch/mips/configs/rm200_defconfig
index e0e312dd968a..5c5e2186210c 100644
--- a/arch/mips/configs/rm200_defconfig
+++ b/arch/mips/configs/rm200_defconfig
@@ -90,7 +90,6 @@ CONFIG_IP_NF_MATCH_TTL=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
-- 
2.41.0.327.gaa9166bcc0ba

