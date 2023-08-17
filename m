Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F24577EF57
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 05:04:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nQWr89uC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RR8wj6lf1z3dG1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 13:04:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nQWr89uC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com; envelope-from=twoerner@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RR8r32ZhYz2yVJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 13:00:03 +1000 (AEST)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-40fc670197aso2366181cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 20:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692241200; x=1692846000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2GSnqeNoyAE/+SX3es1Oteof6ti0abAFPSQqsiZHHw=;
        b=nQWr89uC0Ngba1SRckU+echVMfhTwA2qk0vDCbhHdOtjAAGdM19nRWPqLBgCr0Duo7
         7rYD5dLldDIFpMazz5Tf135A0CAVP0imv6JyHkX52mUGYyUonKAhaM4xzJbZ4jbfWqpT
         jRkxUOVXjlnyM/G6pQOhk39ERd8wIastgkFTomKSXU8WGZfyXUXiBDbO60AmhQzjBzKP
         rEx+5tscbvHykIJgWX6AvvRShos4qB521nSQYyv2j8U1JPO3qJaP03/AX76O/sqeWF2V
         HT6ELMnIUQFFdssAO8g4/d7WQEhfQTgKwmxtr12KhKA4izqI3id8RZR/e7rVLQH7svHa
         uAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692241200; x=1692846000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2GSnqeNoyAE/+SX3es1Oteof6ti0abAFPSQqsiZHHw=;
        b=HMzPxaSVafEbv03DrNV4AToYzBjQNllYFJXBMsykeZPVXmjBG+tBgd3CQEMm0HhALv
         Kb0sL6bWfse7Q7DA9E8FukwBdFLJOP6cotxZZumvQ03TtsnxqMMrUJbDciJHy6mo/SrH
         vqKUEFgkIjHKv2o8+H8OClTpQRUOZyXSaP30m+yLPOI56+qWOf2aCXouMt1gZDgqrk8r
         PVty8QulYTB3oA/5xCk1QnC0yfhj4LgABpIv9j0dJGGpcuKWFmmekoMVXIebKU/O1jHs
         rqtngduJPWab8XXULuUg9MMtvOCOFwm6GUv+SffhXFzHM7ofhmSHXnN4VHx/WkewH80h
         vhWQ==
X-Gm-Message-State: AOJu0YwxZnE+x/3w5Pv8nVcD3s9lNK1dG1sIVK0bzWREPwCOaNj9oPjQ
	qys+2/qwvK+vbACtIaUzMKo=
X-Google-Smtp-Source: AGHT+IFng0wFZtCSDDiVOY49UxdEFehiYLDUvGYu2W+npgCx1ZI6h5QEe6nSX/rWT8xkkK8CoCgLBA==
X-Received: by 2002:ad4:5d6d:0:b0:63f:9130:4e9c with SMTP id fn13-20020ad45d6d000000b0063f91304e9cmr1855432qvb.26.1692241200467;
        Wed, 16 Aug 2023 20:00:00 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id c16-20020a0cf2d0000000b0063d0159e1f6sm5260184qvm.109.2023.08.16.19.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:59:59 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 4/4] arch/powerpc/configs/*_defconfig cleanup
Date: Wed, 16 Aug 2023 22:59:39 -0400
Message-ID: <20230817025942.3209-5-twoerner@gmail.com>
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

Drop CONFIG_IP_NF_TARGET_CLUSTERIP as it was removed in commit 57f8e00d8a82
("usb: 71 musb: Drop old unused am35x glue layer").

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 arch/powerpc/configs/ppc6xx_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 1034aeabdd6c..eaf3273372a9 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -183,7 +183,6 @@ CONFIG_IP_NF_MATCH_TTL=m
 CONFIG_IP_NF_FILTER=m
 CONFIG_IP_NF_TARGET_REJECT=m
 CONFIG_IP_NF_MANGLE=m
-CONFIG_IP_NF_TARGET_CLUSTERIP=m
 CONFIG_IP_NF_TARGET_ECN=m
 CONFIG_IP_NF_TARGET_TTL=m
 CONFIG_IP_NF_RAW=m
-- 
2.41.0.327.gaa9166bcc0ba

