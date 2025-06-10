Return-Path: <linuxppc-dev+bounces-9245-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7FCAD36A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 14:39:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGpJ20pXHz3blv;
	Tue, 10 Jun 2025 22:38:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749559138;
	cv=none; b=ldFD2cBdSxAc0VkkwDrf4HXL2kJTvflkYC4KES5Uv2ta+8Uiz2JozwVDC2Gr2Xkq2N33VZPeLqrEH8cpPjZbBNZucx0TXLNXENOxf52wbwpr020QOK5WWNe0llJUmHG8ZACi0TpFfD1gkxBSSBwP5rmn3Ip9JFllGgpgQ9uQp2JqHMTgfNcwfY3Ip2hzyzccaCT8aW3e1waa6t4c8i8NLy8mBbXVoDzC8n7bkbi6chsNPqENvoB+kj2/Cgh3E7zk580lWSCuq+SUaNMUcgTqQGikPPuhmCwwk0ay7ovnfo5oCeaTvR6htjJSUACnuRNC3ViC8cyrufeE2lqwB7lInw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749559138; c=relaxed/relaxed;
	bh=RqgCDDArZ572FHUpAzhS/HBREsxxOZb3IuEva34YUxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DDBN15nYIJWUg2eb/cXRgqPRFkE7Hkou5MpzSF7vOnQZ6UvcMfrsH9lqlt0+Uz6jbX/rjahDZzB8cuNSlsOWvqtHp+MnB3iUaKvbsj4BSmqc5qj700B7KvIIssVcfYmrp1mlkAGLVxHaZbFENk5M4NhmdFHJwcz4fN2OuS9RyM9tGAnDcj0TRcRP938M5ox5qcmaODgd6CArthrPqBnYzB56bpxtlZkyCSNQiofHKL2AzlSCuBE1sHAWtb+8yXzCVWqw0ULN1m626ReYpVF2RtOR4NxkQ/NM+oX4rQQdzUZQjKzeFEtIviz8m4JeQxlC+Ew8nSKboyAZZ0ZerB/Ssw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Xe9+a4S8; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Xe9+a4S8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGpJ10R6cz3bV6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 22:38:56 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a53ee6fcd5so1694443f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 05:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559134; x=1750163934; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqgCDDArZ572FHUpAzhS/HBREsxxOZb3IuEva34YUxA=;
        b=Xe9+a4S8S7rETuGJrxFQOX9tWnUnoKtb5hbUiclfUNypaWWbHLIb3P0rGhUc8PGw6i
         AMzCMttbWmvqjr2fcOTFlwWLr2sVGrrQoeR8f3xrHqGze3m6JIxXJWK8Jnpfc1kayFK/
         oBfbor0aeoplouHKCFIbMJlIuHy22+bMlrTaBLVj/Qg9lRDLU5WBdLDrpWTu5Nd5GlOp
         11jsjXxjLB74nJ7y2FeaqAeVZaQwutyh01pA3zcyN9lXfaPWVQ9LKMIWCo0JSBEWmXIG
         OYrbyOisGrJttTbiFftYMtv56BIJFCQarjnm3khAc9zgmy+SlVdGHw7rAEuC8OEMbyi5
         DT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559134; x=1750163934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqgCDDArZ572FHUpAzhS/HBREsxxOZb3IuEva34YUxA=;
        b=rPTQL1hjuaRTSs8rve6t8ZBCeI4VKvPJRDVLLFCHb7Bde4bTjOUrfJULtqUg7mCaQ8
         4SoB9Adi8sS64lNTqwpViS9Z/7ICKIDnTxgUQEFPUgztb88t8cuZxkKNV1p+JQ0TzZlg
         1bTn+9fyCo9ZFbTPQC3SImzNKA4AJKqcZZFfJfCcsPyNlaqHdWqs0otlcekT6QW0/P4e
         7I5v+1pOWCWL0HOVW3ehqrincYsRsQgFFSOYI9cz/N2A0oe5sGH7AxogjMTUlpgXbVYU
         d23BtCzD8XidTtyBXUyZ4UniXmwu5V1Tpy5yAHCyIA5qjQoFEA8pSSww1R7DsQN85uT5
         fP9A==
X-Gm-Message-State: AOJu0Yyq4T14RkHBJGOo2cl4F3TGo/Zqn4emYMytRDfwn8bC8WbLqV/X
	3H8nG4um/5QpW2QOtJv4XPxT+0x7qLRY690NollUY3RFDHFvBRuv0SxBhVmMQUugB9M=
X-Gm-Gg: ASbGncuaX6kcaM+Uhn9uJgRzOavMFAEf3s3kkFTO0na3/SCS/edfc1i1htaNllBbOt9
	dgGc1CR+6vM+Ti7zvyq0Zd6tVwyrWyeDaN0FtzTGOC5R6x4d0rgkVR6P1vnsCKQ00QTakBIfigk
	jICI8k06bFRRdS2k71ghs9cPSQ9aUnBT7WawJZbH/oooQCgS1hetBXYbbijTAiWPGEquv9o0DWQ
	wfw2hdNFcZuxRFmIZ8V70JFMaXWfhsMi/bL3XOvOxJOWOhftMuHEOHxQLz7wmtprBwyqXAJGPqu
	Slwl0b3nUDJ1Mv544JhPPrPIfliST9DgXIiZYoTdwHaBfUbVqMun
X-Google-Smtp-Source: AGHT+IHlB1y0ZjbgeXpz76d2couim3mNJe1/2Uc3w3RVGOP5uqdDS0LfEGFNGp3xL5kvkO0RqpYjEA==
X-Received: by 2002:a05:6000:2408:b0:3a4:ef30:a4c8 with SMTP id ffacd0b85a97d-3a5319ba543mr14280976f8f.10.1749559134071;
        Tue, 10 Jun 2025 05:38:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229de7csm12374676f8f.14.2025.06.10.05.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:38:51 +0200
Subject: [PATCH 2/2] soc: renesas: pwc-rzv2m: use new GPIO line value
 setter callbacks
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-soc-v1-2-1a0c36c9deed@linaro.org>
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
To: Qiang Zhao <qiang.zhao@nxp.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=w/R5FPd0nERo4YQWYIn9uu2U38SBTYgN/a3aiLLK2Ck=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCdbhUtX31m+OVwib9APVcYmsABA0x2/6gKsR
 TJYlbULcYuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnWwAKCRARpy6gFHHX
 cgTtD/4kqsZtwhCB7vQ7MmMqpUwLdHHDM6gFISObV14Szp9iMSMPUAyuo0Z78c9gILfz4rL1An8
 Neap+Q/me8JIAApLU4droApbvrB0ktvlH7jGqcjAmn/VEinrHo0ykIA/j1Qgaibsuk+1JlxuBSj
 5iNN3lDlp47ccDM+4EUZ9dK2rty+L1cDfepGeIn0tMSgR6lr6c75u6aoApy9C3H/pAY+ArmWwqw
 eStPNXUmtMGQ7ljd1E0SzkuD8fawtnS6fxAArCS3tUGWvE7ZwFhbC27Yw914vQ2qs3peHTjeFp7
 gMoJx9pLB1GGYC6kGjCcB+tLtkp8Eqe+eXt+IR/HO5EBfyZvrYzb1+GmTcn1i4I4T5XrXkSMOqR
 IrBgs8MJkCFVXP+ayhvNg6r66aicYjl/YNQx20/x44kiOFq5f5uYYafWo4IOvJebQ+SM7xmqj/n
 zeGsPxUFwnlMiVZnrIOfcqxrduv7SCGzKDo1cbgsv3Qo0lL3tpy+YTUhjSLKa+oE+FAd8A7ImkM
 2MsGkCOaAwB7dQpOjoRGsYPDgidCskOeBaFplQqCCuhH04Q17iEzNkhqo/QMnAeLW3vINUrHGKf
 kjzMUw+07BnrOkdsmPPCVGOiBRD2lzYCAhrZZ+U1VYdWMMNqENHqs2JwXT7sJ36zZAWQQA6Cv4n
 Qout1IT46h7Aujw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/renesas/pwc-rzv2m.c b/drivers/soc/renesas/pwc-rzv2m.c
index 452cee8d68bee7d04e7acbee6bd90dab457c77c3..4dbcb3d4a90ccd2796e26d6250aa246b32b09285 100644
--- a/drivers/soc/renesas/pwc-rzv2m.c
+++ b/drivers/soc/renesas/pwc-rzv2m.c
@@ -24,8 +24,8 @@ struct rzv2m_pwc_priv {
 	DECLARE_BITMAP(ch_en_bits, 2);
 };
 
-static void rzv2m_pwc_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			       int value)
+static int rzv2m_pwc_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			      int value)
 {
 	struct rzv2m_pwc_priv *priv = gpiochip_get_data(chip);
 	u32 reg;
@@ -38,6 +38,8 @@ static void rzv2m_pwc_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	writel(reg, priv->base + PWC_GPIO);
 
 	assign_bit(offset, priv->ch_en_bits, value);
+
+	return 0;
 }
 
 static int rzv2m_pwc_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -62,7 +64,7 @@ static const struct gpio_chip rzv2m_pwc_gc = {
 	.label = "gpio_rzv2m_pwc",
 	.owner = THIS_MODULE,
 	.get = rzv2m_pwc_gpio_get,
-	.set = rzv2m_pwc_gpio_set,
+	.set_rv = rzv2m_pwc_gpio_set,
 	.direction_output = rzv2m_pwc_gpio_direction_output,
 	.can_sleep = false,
 	.ngpio = 2,

-- 
2.48.1


