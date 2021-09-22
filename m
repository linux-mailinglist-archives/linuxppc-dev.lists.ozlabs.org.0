Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DF74149AC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 14:51:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDyq114Myz3bjN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 22:51:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=CXkHPD76;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=CXkHPD76; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDsLM1TcFz2yPx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 18:44:57 +1000 (AEST)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 75C433F226
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 08:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632300291;
 bh=uiMxeL0gXr2dTqfDCAVU08QHmTYD3WPNowiXOrxuH3E=;
 h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=CXkHPD764IYmuAL2vO4sv/f7MV8ZmfEaRpKD9SZFid0nmfO16vrFxeTJvEF/U3MHn
 t1IdXNCDmFk7oQX0NREXTwXGmKccQUg/qVoW8rHim1mrVosTxfPmLyOrqvbiISK1y4
 EGtLUF7o5oxd5QkwIAy1R1IRmfFyul2BKR7qRpP9/Sz/P//6G9gKS+IIg6MbgDw3Pm
 k8FupMp7JZ/17DWL8c6kN75XXKrFaQEH9l52mZqMDQhUcm7w0fVCFyVLgX+JymGx69
 /S4sfjug/DIazjK6beKGG8YflHkhgK1+V3DyXn68APY/mNU1zLye3am/aWTvyrURKT
 dJUPPVJR7HwvQ==
Received: by mail-wr1-f69.google.com with SMTP id
 r7-20020a5d6947000000b0015e0f68a63bso1438344wrw.22
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 01:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uiMxeL0gXr2dTqfDCAVU08QHmTYD3WPNowiXOrxuH3E=;
 b=Ky/wy891BMh8GxOnKXaLd27HIyDLQXbtfGbDOfscIcerby59H2fkqvAgP+ROKVc6HS
 Es6/oElpAeBsRla2VzwtmYpUeDSR54QkVrZ7ivD6+03ZjnnQl3gg3x+YUI2uKKDEY9kl
 r5hjQvvokbCcxU0GfKU1REwasvQbhQat7o29G7MiRIy9+tfqRzNkRUN2EwaE3rbYgTd4
 EZKAxFE1Qt79xOmmNa0KN129VB1B3N6g+/JNvB3LvAmGXa0utotnEdcMMKKyWgTNzpN5
 CmfiDKWKky0IDxPJqKUH1or43krokZQPEN9h/q4CU3YMTvNuYFJvq/eAFEH8QthZuZx3
 87KQ==
X-Gm-Message-State: AOAM533qaD9gzuKQUEuHNTQvVTpbUPJvAXw3LxN7BFA8Z7eOcJp52uFP
 dgzefvYxj5J/w5vFHDE76AjyVb/za7lUZXCQHSeqLdXdCcbnKCxnoqUlJ9/kbxIsEOoiox5BJXh
 4hacJWAQe5A4j9mKphkf+4xLxdcG1J4pC2zQinQIXlwI=
X-Received: by 2002:a05:600c:35d0:: with SMTP id
 r16mr9039080wmq.26.1632300290701; 
 Wed, 22 Sep 2021 01:44:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyC680U0RwyaOjK1SOsZp30UKUvzdNakgqk61+QjWsbjiDhpXDKy1rZwHZZ9P4p0zlY3hcaFA==
X-Received: by 2002:a05:600c:35d0:: with SMTP id
 r16mr9039063wmq.26.1632300290511; 
 Wed, 22 Sep 2021 01:44:50 -0700 (PDT)
Received: from localhost.localdomain
 (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id o7sm1851490wro.45.2021.09.22.01.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 01:44:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [RESEND PATCH 1/2] powerpc/powermac: add missing
 g5_phy_disable_cpu1() declaration
Date: Wed, 22 Sep 2021 10:44:14 +0200
Message-Id: <20210922084415.18269-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Sep 2021 22:50:26 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

g5_phy_disable_cpu1() is used outside of platforms/powermac/feature.c,
so it should have a declaration to fix W=1 warning:

  arch/powerpc/platforms/powermac/feature.c:1533:6:
    error: no previous prototype for ‘g5_phy_disable_cpu1’ [-Werror=missing-prototypes]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/powerpc/include/asm/pmac_feature.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/include/asm/pmac_feature.h b/arch/powerpc/include/asm/pmac_feature.h
index e08e829261b6..7703e5bf1203 100644
--- a/arch/powerpc/include/asm/pmac_feature.h
+++ b/arch/powerpc/include/asm/pmac_feature.h
@@ -143,6 +143,10 @@
  */
 struct device_node;
 
+#ifdef CONFIG_PPC64
+void g5_phy_disable_cpu1(void);
+#endif /* CONFIG_PPC64 */
+
 static inline long pmac_call_feature(int selector, struct device_node* node,
 					long param, long value)
 {
-- 
2.30.2

