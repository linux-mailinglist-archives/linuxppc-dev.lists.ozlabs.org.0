Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF02414DB8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 18:05:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF3781rH6z306R
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 02:05:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=Pk6PUVDN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=Pk6PUVDN; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF36S3FvXz2yJ7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 02:05:19 +1000 (AEST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D4AC7402E0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 16:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632326715;
 bh=JVVwsOf7X0M/+qlOsF+1zUq32C7aF6kWbgyKr7RQdek=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=Pk6PUVDNYIW3TphQ61fWnYBCQdnmCwWr+yizNe6qXLA51ViwxnVgWlvWQzywnb59q
 rpPRIZL81puwHV7eWn+Ifqx2ew0/OpHPR19O34lmSLbWD+5MhhCr7VxtqOEYf1LPt2
 QQts6q8cz2V/ocLsrSXehebe8YDqVk/z2vuVlpiI30xTVdVVnUfiKgY0hpMDYAWgl7
 /Fkxi5HZZc1GCoBSFrlOACwsCSMwR5Yk23ULuMCFzNGLIjblbc0obdnMEQQTNB9ASx
 9lRJ8H9IggaDZfF3+1Sl6S/1Lc0KR4Oib2tWEK6S5UtTaDeJEXN72tsk3ecQhwo8ui
 seEiJfVECAabg==
Received: by mail-ed1-f70.google.com with SMTP id
 e7-20020a50d4c7000000b003d871ecccd8so3569544edj.18
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 09:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JVVwsOf7X0M/+qlOsF+1zUq32C7aF6kWbgyKr7RQdek=;
 b=FoAE0DWXbLq1xwmkcDXAAV4UsMglMBOmoncxNJ3RXWZ/MI7GP0Dns6X0YFRU1OEk32
 VGQlBZ0IKWROqH0XwvvPsCLWcA2RwlKmcPIBeQkNMLg+88pv7m9tDsd0y7mU+360dNjK
 y1SYfOlPJFBWRN0r3zc6r0EwXyKo/HVBFiF6BN+Kz7Da74xFEudIFqNTFkl5/cAmHF95
 8rrZ3Oq7yt7h+85EDW2B717PyPkTQ2IevibfI55P7yKunUhO/tganaN71oNgHfFXj5nx
 i8nsd7wGurel+UEQyZvZCfXfXL4vk7ZN4uONjL6aSL3sT4ScKcO4fi8lN1TRksBLIKFO
 oC7A==
X-Gm-Message-State: AOAM53316NKpSvM02HUoIGBMDTpA3cvNKX41oz2MCEj3oUwbRHX4e/NN
 p78b9oztCw9iMunl5J6EhGoQZE452ewBgkLqlGPvSGkmv4tUZSN0fHCzeJkWIlQLMQ7z7DyoHsu
 BS27cckN15hwXdKiMdwTAc3SHcD6vQrQhA4pUE8GdKVw=
X-Received: by 2002:a17:907:10c8:: with SMTP id
 rv8mr369811ejb.280.1632326715363; 
 Wed, 22 Sep 2021 09:05:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwENuY/NrUiy6lL1ValNhLm4wX0hmrOfHOT0PzYAZC0DN+SkCollEpDyJxJAmQWua1juS10tw==
X-Received: by 2002:a17:907:10c8:: with SMTP id
 rv8mr369772ejb.280.1632326715181; 
 Wed, 22 Sep 2021 09:05:15 -0700 (PDT)
Received: from localhost.localdomain
 (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id l7sm1511135edb.26.2021.09.22.09.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 09:05:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] powerpc/powermac: constify device_node in
 of_irq_parse_oldworld()
Date: Wed, 22 Sep 2021 18:04:36 +0200
Message-Id: <20210922160436.130931-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210922160436.130931-1-krzysztof.kozlowski@canonical.com>
References: <20210922160436.130931-1-krzysztof.kozlowski@canonical.com>
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

