Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 597EB41708C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 12:59:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HG8D83lnlz3bmk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 20:59:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=dhLOQ8V7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=dhLOQ8V7; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HG8Bh731kz2ypL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 20:57:47 +1000 (AEST)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AFEB9402E0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 10:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632481061;
 bh=JVVwsOf7X0M/+qlOsF+1zUq32C7aF6kWbgyKr7RQdek=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=dhLOQ8V7F4wVe75i3PP2WCguFKDr6BjyNVv5ua9EHpsxQ1BlMFCYvRQd3O85uqBUA
 cnb6WqfLCe680LwJR2RFNeUhI1PFNGxQmKWiz3E07Rv4vYMqaNQbmS1BAE3dIKXFJR
 HbRUnLeDviteJ/Ce4NuJh6i9mGan0LOi+wn57RWVfgufBC8sRisGFCqAwn17/FrOyr
 YAv2pXqMWjqJQiXad8KOtHc9l+msV98PkaY9c2bTmS3WvA5iqOZe8bt/6CGdYjt6kr
 eAGxBuEA2tLvsMI216Cn8tt/q0svwZG5o0CDApg8AxRXb46Ps3sk//WrQHcoScIA2G
 CJMF7J18rY6CA==
Received: by mail-wr1-f69.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso7728840wrg.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 03:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JVVwsOf7X0M/+qlOsF+1zUq32C7aF6kWbgyKr7RQdek=;
 b=VsrkLp4fQNX3ZKkJ+mYPQtrseemOJs20XcrgdstP8NYrM90kC4WYiGuvBXJ636bOJr
 +qQF+3tHfowhr+h3p44c5eiLTU9gNTTKq5ooAockDkNmySZ10T6NHvG56sE8ijZdReYC
 EisqsVWcCOFgOGpz7bIu3mEMCLWUw3OIJN5O9pDPjt7r70/qV6a8U06/5TW11FHN4yum
 8rAmQFZvfGCseKZIofVGQZ4l+s+Xv33+HiYN+30sN3iTypMoJ1BbUmqOAL5xxKVuzswb
 9uYnm0IKtojn1zO2QLEOr9NiI17jWx5AW9WVeOFqpxp1p/Cp0EoU/cAkhvA2wMPY6uFy
 olFw==
X-Gm-Message-State: AOAM532caHvw/FYKe5GNn+X9x5mNb+s/B6RdrGGl6Z6fkrOZkgbag7LQ
 svmULI9fdKI7MsbhLczQN78ENLFw3SUYpUAAI7X1R75l7fRzsnkRsQK+rsVPWFmNYd72dDCO3Bz
 ggu3u2HgRz0X4gqfGOIsJV2Ky8GVBtF0Z7TfqiGvnxSQ=
X-Received: by 2002:a05:6000:1a85:: with SMTP id
 f5mr10982712wry.25.1632481061422; 
 Fri, 24 Sep 2021 03:57:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLYvzxMc9tP9qdmx2NxdiK+8VdwTUT+JMDAWIj2fLS9fniGFXTFwHyxW2JGc/QJ7sNrnQG5A==
X-Received: by 2002:a05:6000:1a85:: with SMTP id
 f5mr10982699wry.25.1632481061305; 
 Fri, 24 Sep 2021 03:57:41 -0700 (PDT)
Received: from localhost.localdomain
 (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id x17sm8188836wrc.51.2021.09.24.03.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 03:57:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 2/2] powerpc/powermac: constify device_node in
 of_irq_parse_oldworld()
Date: Fri, 24 Sep 2021 12:56:53 +0200
Message-Id: <20210924105653.46963-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210924105653.46963-1-krzysztof.kozlowski@canonical.com>
References: <20210924105653.46963-1-krzysztof.kozlowski@canonical.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The of_irq_parse_oldworld() does not modify passed device_node so make
it a pointer to const for safety.  Drop the extern while modifying the
line.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. Drop extern.
---
 arch/powerpc/platforms/powermac/pic.c | 2 +-
 include/linux/of_irq.h                | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
index 4921bccf0376..af5ca1f41bb1 100644
--- a/arch/powerpc/platforms/powermac/pic.c
+++ b/arch/powerpc/platforms/powermac/pic.c
@@ -384,7 +384,7 @@ static void __init pmac_pic_probe_oldstyle(void)
 #endif
 }
 
-int of_irq_parse_oldworld(struct device_node *device, int index,
+int of_irq_parse_oldworld(const struct device_node *device, int index,
 			struct of_phandle_args *out_irq)
 {
 	const u32 *ints = NULL;
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index aaf219bd0354..83fccd0c9bba 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -20,12 +20,12 @@ typedef int (*of_irq_init_cb_t)(struct device_node *, struct device_node *);
 #if defined(CONFIG_PPC32) && defined(CONFIG_PPC_PMAC)
 extern unsigned int of_irq_workarounds;
 extern struct device_node *of_irq_dflt_pic;
-extern int of_irq_parse_oldworld(struct device_node *device, int index,
-			       struct of_phandle_args *out_irq);
+int of_irq_parse_oldworld(const struct device_node *device, int index,
+			  struct of_phandle_args *out_irq);
 #else /* CONFIG_PPC32 && CONFIG_PPC_PMAC */
 #define of_irq_workarounds (0)
 #define of_irq_dflt_pic (NULL)
-static inline int of_irq_parse_oldworld(struct device_node *device, int index,
+static inline int of_irq_parse_oldworld(const struct device_node *device, int index,
 				      struct of_phandle_args *out_irq)
 {
 	return -EINVAL;
-- 
2.30.2

