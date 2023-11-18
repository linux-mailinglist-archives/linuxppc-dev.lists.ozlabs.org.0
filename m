Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7D47F01E6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 19:06:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MScRFB3b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXhXh25WNz3cVL
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Nov 2023 05:06:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MScRFB3b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=hkallweit1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXhWk2ybpz3cJN
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Nov 2023 05:05:20 +1100 (AEDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9d10f94f70bso399772466b.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 10:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700330712; x=1700935512; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvMhLdgxzmvHjkFyHLWsZZ7IOFCpPNkXdifeaawKQLI=;
        b=MScRFB3biw2yf7Q+5QrxiK1UWa4LMcgC5q8ylMG9AA+y3F78arilOerCZxi+fDwk+X
         fyOtxM42Sfrf31zO1ybhTZTUsbkWhW3X0EwUkUX2JQAs0U9Un/IoIMp8LtLgOAvQ/5M7
         XIl1sWvejOPzvf8NOuacivP6Z0b0/5jBBxtJ4FIHhL9VMuS61FEYUHRqDKERWkD4Ro0f
         L/orTPG7jlPfC49P3TvMQaEWfIJ+ZCvmcXcvy4QalpyliBDT+TAkLp6qjqJeImYbKBEM
         fMVhzFPQIQLHI2nqJhPSCamYjvtOppstwpsFnVZMTXLHybbK3PAE+0ZUB0Q/90KLC2cJ
         jijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700330712; x=1700935512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvMhLdgxzmvHjkFyHLWsZZ7IOFCpPNkXdifeaawKQLI=;
        b=D6g/EeFvLcsg9A1UGy8VhLLje+J5qdNXNMBonR5hk5u68TFlEV2BXUFyDk0V743vk1
         dDH6UfF2pbtH5ELnrp62uhYjHCde921smu61FSgXpySeF+V29S5ePlppGB5y0Io6ZmzQ
         rprBP/sRiVuJAxk4jRcu9HFuS1r7JkvsPqfPQsFCQHr2tDH58PS6dQRwKaVtNiktNk+8
         OeRAuv5y+v8XbDb9LFlXXyn3NMKxWzinkCOSJLFWcORjNuQRxX/eNV5Z0oQciW1MTMso
         ACZG2z5fZO4NyL2gu/W7e8JbKOCrd7KpW1veVwW5X+S0X8okSNWNVXeiRyY5++jikTyq
         DXBg==
X-Gm-Message-State: AOJu0Yxs4QGJKrzlfSSa817HrNyc9MzkodgNz1TxkYs6TMqRI8RLnhsV
	nCenawmxj3Gc1OKdX0cXJx8=
X-Google-Smtp-Source: AGHT+IGmY36vyE2njGaUXhkxvF2ffP5gHcb+uEcsV4u6HxS9Gv0SaqYqLLEs3KVtE4jvzvFYDygO7Q==
X-Received: by 2002:a17:907:84d3:b0:9e3:ef19:7205 with SMTP id oh19-20020a17090784d300b009e3ef197205mr1849277ejc.3.1700330712142;
        Sat, 18 Nov 2023 10:05:12 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id m20-20020a1709062b9400b009f2c769b4ebsm2079456ejg.151.2023.11.18.10.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 10:05:11 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 03/10] drivers/i2c/busses/i2c-pasemi-pci.c: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Sat, 18 Nov 2023 19:04:57 +0100
Message-ID: <20231118180504.1785-4-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231118180504.1785-1-hkallweit1@gmail.com>
References: <20231118180504.1785-1-hkallweit1@gmail.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After removal of the legacy eeprom driver the only remaining I2C
client device driver supporting I2C_CLASS_SPD is jc42. Because this
driver also supports I2C_CLASS_HWMON, adapters don't have to
declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
It's one step towards getting rid of I2C_CLASS_SPD mid-term.

Series was created supported by Coccinelle and its splitpatch.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/i2c/busses/i2c-pasemi-pci.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-pci.c b/drivers/i2c/busses/i2c-pasemi-pci.c
index cfc89e04e..77f90c743 100644
--- a/drivers/i2c/busses/i2c-pasemi-pci.c
+++ b/drivers/i2c/busses/i2c-pasemi-pci.c
@@ -56,7 +56,7 @@ static int pasemi_smb_pci_probe(struct pci_dev *dev,
 	if (!smbus->ioaddr)
 		return -EBUSY;
 
-	smbus->adapter.class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	smbus->adapter.class = I2C_CLASS_HWMON;
 	error = pasemi_i2c_common_probe(smbus);
 	if (error)
 		return error;

