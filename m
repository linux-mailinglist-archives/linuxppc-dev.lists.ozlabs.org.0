Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B8C4149A7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 14:51:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDypG4Vtqz306n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 22:51:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=Yv+TYoT/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=Yv+TYoT/; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDsLM1QXRz2yHS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 18:44:58 +1000 (AEST)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 370FA4025C
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 08:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632300292;
 bh=z8fZpvZ//AsliWlBk6ZI/8MtJW2aVmSD5QrohcqQ3Yg=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=Yv+TYoT/vfF6FFIa9Wd6PsSFGharJyKvrM22BnVqpFtZ9zqZVglPMuY9zEE3tvDcI
 5z9hMpu0i+cB8nfDUotXlba9kgOtX1tPEdcw067fJy2W2QQoMH56I1o7N4lfHVqb7Y
 TiRF+55OT1Ju4EDdiGeaa8S4vdLtJdgFuxI1v7a7Qm4+ZIANAcGuQxYCFeYsrEtcgO
 p2vilOLY/BjLJB3F1MKhgsxkbxryq6EzAgGzwWdhutEunhJp4AHL2cf9CDzmE8VWe4
 02vb531iodh4Yay2b5fFfHPRsgxV+9ryC0A9XfKbwJgK3f8Ip0uoDZRAaLXJTXHC4c
 27WxRQm/v2tEQ==
Received: by mail-wr1-f72.google.com with SMTP id
 s13-20020a5d69cd000000b00159d49442cbso1464173wrw.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 01:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z8fZpvZ//AsliWlBk6ZI/8MtJW2aVmSD5QrohcqQ3Yg=;
 b=NNiVaHaRooZeqCD9OL7nbS9Abq3rWwyxR0j+v6r/WD9aBoQUzOvToJz/f59S9fNThm
 PmECNI7qUCv/zKTPpNtrpZufJy4eBtzMxvNKDL0ZviqL4DO3rv+S6Uws9hMVN5/YVN99
 cOvscGWh4s50ka3Fy2/cb5S53MLGyYTkGSXWZo0r3x+s77+aS+ZlrvwSM7zrp/Nnrf8x
 49E506Jlg/snDRzdZy3PwDrKO4EMIStMHilhPf6BiPD0vuCwy0A00gHzdEX7qwvsJTIi
 jhsPgkG98n5MZyYiSP8bNQAOQ+odEDXikkH69e1pFvAgITlwW3c4QXb0iXFPMmAH/VCU
 zgsw==
X-Gm-Message-State: AOAM531r37sxuckAtspaKHa0DPcDMda+DLre6fVG6wVIXUWNEWwcqKLC
 s/eLsQtixxdDLVJwWtmxz5LQDHAfezuY5WYlY4SSfFbR9wGHI8KSl+3duk0Rdo2gGSxEgcSDEP6
 msyWPB5BC4kLuPm0A04O9wKch6bEaLyg3Gvs0fuCczOk=
X-Received: by 2002:adf:8b19:: with SMTP id n25mr43049486wra.216.1632300291867; 
 Wed, 22 Sep 2021 01:44:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOzt5CWBoWaHmRLpJDmTWsqixtsWYMLhwi8nFJSalUAu/s/IlJpD6Al6BX4ejH9Ir7BxkZGA==
X-Received: by 2002:adf:8b19:: with SMTP id n25mr43049468wra.216.1632300291674; 
 Wed, 22 Sep 2021 01:44:51 -0700 (PDT)
Received: from localhost.localdomain
 (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id o7sm1851490wro.45.2021.09.22.01.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 01:44:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [RESEND PATCH 2/2] powerpc/powermac: constify device_node in
 of_irq_parse_oldworld()
Date: Wed, 22 Sep 2021 10:44:15 +0200
Message-Id: <20210922084415.18269-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210922084415.18269-1-krzysztof.kozlowski@canonical.com>
References: <20210922084415.18269-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
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

The of_irq_parse_oldworld() does not modify passed device_node so make
it a pointer to const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/powerpc/platforms/powermac/pic.c | 2 +-
 include/linux/of_irq.h                | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

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
index aaf219bd0354..6074fdf51f0c 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -20,12 +20,12 @@ typedef int (*of_irq_init_cb_t)(struct device_node *, struct device_node *);
 #if defined(CONFIG_PPC32) && defined(CONFIG_PPC_PMAC)
 extern unsigned int of_irq_workarounds;
 extern struct device_node *of_irq_dflt_pic;
-extern int of_irq_parse_oldworld(struct device_node *device, int index,
+extern int of_irq_parse_oldworld(const struct device_node *device, int index,
 			       struct of_phandle_args *out_irq);
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

