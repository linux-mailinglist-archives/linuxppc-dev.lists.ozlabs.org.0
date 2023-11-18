Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5705A7F01E7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 19:07:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mIgNg/Hf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXhYd1xN7z3dLQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Nov 2023 05:07:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mIgNg/Hf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=hkallweit1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXhWk2KnWz3cCS
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Nov 2023 05:05:21 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c501bd6ff1so38029651fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 10:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700330709; x=1700935509; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mu6uKqetedFX6br/8gaH2MKtwUbnJweRqllZD/aw3RQ=;
        b=mIgNg/Hft/t/9cj3+48B+qtUu6YzaPON2r/1EzBGVVFERvlULQgHLAbakp3Wyz+jmA
         JMZyO7fTgd3mL0+DSdE7AV1VLOur6ONsbIdOGQEfH4Ned4EPx55STGfqnVZKeD9KQJjF
         C0sgXpu0jmk1opuhZDfMMRqdJ0zLkajthdjj48fYH6IIgqqFwYiEQrVDq0Df4FXM59Mi
         ggdCIFYMm9iYUj0ZPH+sBrAV4WqDfooFU2zc/tN8YR5XnUXKOa46LtP8dPElxfisN9ag
         guG90MLOlhBTGpTPCOj2DBZWyga4uONiEsc/GPGOpvJ/+dHzGuLGKBnO4Gwvu53Sx7xa
         Lkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700330709; x=1700935509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mu6uKqetedFX6br/8gaH2MKtwUbnJweRqllZD/aw3RQ=;
        b=JtNjvP8uVCAv8G3/GMUcoGlKHNR/YHy5K4/2JSvsRw88lhaS9JnV/oRQlEU7HcPmGY
         Du6vxOCL13Sck3VNbmVLMsnWIxfWb65ycxelfDNCoAf/h+n2EPymM+KWx9sQWFyLb2ru
         a7qORl45mw1MKyNXMCIfbRhRkzeLLtzaLPAxBfKSaBbX2MXOg+m9bmM+ZloOdU3gbkgC
         v59FXbdugSUOuX6d+91U2bneiqCeVdPb7haNVseCrt9k1K6CHJ73SIvK7/Mx58MHRviA
         QE4h4+sjyV1FZdc+tvRxxKNx8Wc7qE2jM9+fi6p5Wj6QRysHbmv+zXfgB29ZG25I+ZSc
         gg9A==
X-Gm-Message-State: AOJu0YyVoi7fZZV/dWDp3Ytn4qApSvjatZNUzql7F84v2ldiCpleHs4k
	M/t+y8DsfJD+P59/ivNAeD8=
X-Google-Smtp-Source: AGHT+IHyeiAuLwBQ6RhMnfmUjm6ZpWN6lhi+Qcl6w/VI4MWj6Kf1RrN8easfjONwVJiPd/NUafO3dQ==
X-Received: by 2002:a2e:9c84:0:b0:2c5:1ea4:4e99 with SMTP id x4-20020a2e9c84000000b002c51ea44e99mr2049253lji.48.1700330708944;
        Sat, 18 Nov 2023 10:05:08 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id m20-20020a1709062b9400b009f2c769b4ebsm2079456ejg.151.2023.11.18.10.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 10:05:08 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/10] Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Date: Sat, 18 Nov 2023 19:04:54 +0100
Message-ID: <20231118180504.1785-1-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
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
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
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

 drivers/i2c/busses/i2c-ali1535.c                  |    2 +-
 drivers/i2c/busses/i2c-ali1563.c                  |    2 +-
 drivers/i2c/busses/i2c-ali15x3.c                  |    2 +-
 drivers/i2c/busses/i2c-amd756.c                   |    2 +-
 drivers/i2c/busses/i2c-amd8111.c                  |    2 +-
 drivers/i2c/busses/i2c-elektor.c                  |    2 +-
 drivers/i2c/busses/i2c-gpio.c                     |    2 +-
 drivers/i2c/busses/i2c-ibm_iic.c                  |    2 +-
 drivers/i2c/busses/i2c-iop3xx.c                   |    2 +-
 drivers/i2c/busses/i2c-isch.c                     |    2 +-
 drivers/i2c/busses/i2c-kempld.c                   |    4 ++--
 drivers/i2c/busses/i2c-mlxcpld.c                  |    2 +-
 drivers/i2c/busses/i2c-nforce2.c                  |    2 +-
 drivers/i2c/busses/i2c-pasemi-pci.c               |    2 +-
 drivers/i2c/busses/i2c-piix4.c                    |    2 +-
 drivers/i2c/busses/i2c-scmi.c                     |    2 +-
 drivers/i2c/busses/i2c-sh7760.c                   |    2 +-
 drivers/i2c/busses/i2c-sibyte.c                   |    4 ++--
 drivers/i2c/busses/i2c-sis5595.c                  |    2 +-
 drivers/i2c/busses/i2c-sis630.c                   |    2 +-
 drivers/i2c/busses/i2c-sis96x.c                   |    2 +-
 drivers/i2c/busses/i2c-via.c                      |    2 +-
 drivers/i2c/busses/i2c-viapro.c                   |    2 +-
 drivers/i2c/busses/scx200_acb.c                   |    2 +-
 drivers/i2c/i2c-stub.c                            |    2 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c |    2 +-
 drivers/staging/greybus/i2c.c                     |    2 +-
 27 files changed, 29 insertions(+), 29 deletions(-)
