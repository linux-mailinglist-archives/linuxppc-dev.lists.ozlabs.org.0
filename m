Return-Path: <linuxppc-dev+bounces-5095-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7FFA0A9AC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jan 2025 14:39:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWGhP3J8Gz30CD;
	Mon, 13 Jan 2025 00:39:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736689157;
	cv=none; b=WsaftH2HAmhjtdyMEAth0tGK7ZerQVrn0bGU2U2A1SpfeaR5NNe3SdIk777/WF41WyfFbpFfQlXYBTILZgjq3wDS/lzY/Z/viRfgKJfctUBWCbkRdceV72oGadmVDGPWo1DuF7k3aYILbKleQigxP07Tc9jZC+ChdzHKyjE/yPHeWkGLZGoKRJ5XgmEwiGlX7mwLEKYDHYsXpTnBC9V7iqmLUo73rmIK6BU9jja+ngJ5awtV7YqtCPrLB6kBF6nUdCcE5he/gEE5xQudktJZOW3vNzc6p1bMvmcVUfnqSw88CnSs7Zt2/RQmtTUM83Wc18Er4EZf8rIQ2Eo574cV9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736689157; c=relaxed/relaxed;
	bh=W7Ty18ut1e9jMhl/AkSFuE2MdVzmvveKnbQmIojHQTU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gZ14G0waaQqTgQQkS0bOvuDPfu5jipxp+poLpBo2JujA4pI2tB5hUZtAPdOGwb1caQVCTcXPFIiokk/wT5hX05oFyu/JvY/N3OAKLrCDdwf4CSAvP/Xp3KZboRFzYMIftmYo4SkFFV96+U1B7SZlkLdyLwoDBUaD7ZS7cDH04xcO0XUjTrPjuuFPY9YFbVuivGWjoRFe7gZVeDNwl11AYMhbzQTAH40gBJh5gAd4G7OSynzVk6tFTRJ+xz3/FYFENDRKiaf6Hr2YRbX6N2O+6yJKSS6DLkQ47Y15rMpRpBczq/ftPJPu36dLulX/GOFF5KnJkXVxLa6cp/YnCtqfTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m6uf+WmW; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m6uf+WmW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWGhN0lWWz305n
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 00:39:13 +1100 (AEDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4361f09be37so4509855e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 05:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736689150; x=1737293950; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W7Ty18ut1e9jMhl/AkSFuE2MdVzmvveKnbQmIojHQTU=;
        b=m6uf+WmWsmSiuiGDbPCwcv00OYuqNNQol67v36uRZjsdohKr/e2kvPE72Emnx9Tc35
         Z2OrxHx8/9lMWJ41wLvov8BVujSPTinfRwLZzGmnOLyVmBW0B1T3Snn0Dsxus6VELQOg
         NUVqZtVLOHYhUJcSv4Tvg4GJ1AlGECP0XYqi/BzHqkKAP9d/nog99IKIGwOX7oZ9RxDo
         uNzF4G9YI9q9ra1gVmFfk5ELRKzf7MT/rH7i4RDnSPjlVBgo0txySoRHnMuOyzVrlMP6
         J2+p72sulq1LwH7IdTOsFF8MmBXvA5OPaVm3TTBOftlKUmnM3UzXUom6mgIIGWSTlaLg
         3kDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736689150; x=1737293950;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W7Ty18ut1e9jMhl/AkSFuE2MdVzmvveKnbQmIojHQTU=;
        b=p1L5vi8wh9ewgUmjjXKQxtja2ofYnVdJQvLQ3Aoe08u1mgJ56XCJxcVRKPLsybwTXY
         Bueoiy96eoKRqKsLA70FCmkTUc8e4XIjI/w1G3z7qtVyOF0o6C9Dv1b8wkpVP0oOOJy+
         rsQiiZiaEf04kGgF8kUloh/GUFVBGYX2NXyQ0oEIiz/1ghLMnAMZW8gVBWC9z+LbPprC
         B5i1krBIwkW7zg/cwLLyHQzScx6DZOnelKh8sTr6d+3kaX1ID1wd0GmsbNjJOC0rFPj2
         WEyTfqjrXJWsEgR36WD93SgiZ92SpdvVG96P+nkwWWZBkPi2hqczSgjlUfIkpHFX8LD+
         hW1g==
X-Forwarded-Encrypted: i=1; AJvYcCWImmBZssTC9HRWluGaLLq3gBzacSfudv7NU5b71wLIdO0UPKsNRIVftJTMTsO0Ya+TNyZ3kpMWKO7iovU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwjjLAPit17C6isqv1Kc+kamIYfe4OixCV+MsnNWoc7wceQ0o+N
	EmX/JUZxDc3hEC6j2C8yTDgdjsPV+yw1zn3ZsompES+cmer7xlfwtTsg8Hrmkl4=
X-Gm-Gg: ASbGnctY4C7SAMmY2YjIjVqisgFrQfxzwhirwxEmcoXsPXPyfe7gsa2n7ivbuJyqPRK
	djt1GD9BSC5XCXtNP+Gay1nKkJA9Oc1en1u7/GBrIytPdYal/YFsv83szzkyce8KZoFVxmjnFsI
	44QhQLEqMT5Oyjrq2D2yk0vD6pQzoMtXOKD2cqU/8ymqxwxFZuCSp6xaFdOMZS4ZXnvtfeKffiP
	ela03gY3f+3CSbS05URQrgmdX1ywH3tP+L9BxRb2ScXqMMPHwmE4M20ULizVruCxiRGuVZN
X-Google-Smtp-Source: AGHT+IHhfop11bEN74u0ET9V0abdMLDcSBys+gSbyZcc1Oyi50RffMGbjeAYxlnbPrRkwqyrU0ID3Q==
X-Received: by 2002:a05:600c:a09:b0:434:f1d5:144a with SMTP id 5b1f17b1804b1-436e2557087mr63456395e9.0.1736689150005;
        Sun, 12 Jan 2025 05:39:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c006sm9581924f8f.46.2025.01.12.05.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 05:39:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/2] PCI: Simplify few things
Date: Sun, 12 Jan 2025 14:39:01 +0100
Message-Id: <20250112-syscon-phandle-args-pci-v1-0-fcb6ebcc0afc@linaro.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPXFg2cC/x2MQQqAMAzAviI9W3AVEf2KeJC1akHmWEEU2d8dH
 kNIXjBJKgZj9UKSS03PUMDVFfh9CZugcmGghrrGOUJ7zJ8BY5F8CC5pM4xekYe+a/uBiJmh1DH
 Jqvd/nuacP7HF0+1pAAAA
X-Change-ID: 20250112-syscon-phandle-args-pci-d97537922ddd
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
 Roy Zang <roy.zang@nxp.com>
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=666;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=x+i17n32J9BE3xJWGZWzaweD1AZbhL+oqQjbrPfkdJw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8X3fpKo9Fo2SJTRBmFQDvDSbyoSOE5+H61jh
 WVIyJ+vkH2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PF9wAKCRDBN2bmhouD
 1wnKD/4gxTfv+tXPYb5SNsiZrYl54aARJsvzHavNU/1Oep+K0WSyRw+jj2XwM3C+OYsw4RhApPR
 2OoXL0k+JjPCwoDdX5E3hGTdIpJR3TrixOEteHnc3xs2lxeeHh3nt9iRGa2ZjMlE+5p12BDy8K4
 hnhqOE8qIT5+j7vsJwTJt/7nQqwgCvBRY9JvlaKfc1TRRIY7Y4dOzvSSKhjA/KQrO18YaybJ3qq
 Bnace1Td91tf1hDQwMy6d/pmermVgtYHqtY84HNY7Rcqyul7VtiTmoXXPSqruEIKxupAoJie3T8
 hHv1Lj0AeEV3geNQ8/CviDs5+fHAt9ybjCdLevrdhunHcEic2U9dlpx0+Dn1rthZJj3oeXMdMno
 iWT6sI7VL+wUD7SrQBWQlst3HfwCKkQqj03Leh90PKuvyIeRaqgp+ZokavbtdyO4Mpd0gMgrL7Y
 gNBtIAMICO559+r6VpoXytH7OdIJKJ0Z7Ohn+sKk7PBh8kHMkC3+JTjNtSWQhyDNOcmh7Tu42DV
 2njcZXMQksL97QcbGfAcgi8U+WsG3HeITLzJVuNq8e8YHOuyjLNHhmeJ/axSTjMc0n5uiT61P4p
 6Il0Pk1UozPnyoc+VNNbPIYwGwkJ3S//dY8kkyV+srFvKF8rARseRo4CqNKvnnfVky4ozzDmdXA
 lSYkUsupahUkEmQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Few code simplifications without functional impact.  Not tested on
hardware.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      PCI: dwc: dra7xx: Use syscon_regmap_lookup_by_phandle_args
      PCI: dwc: layerscape: Use syscon_regmap_lookup_by_phandle_args

 drivers/pci/controller/dwc/pci-dra7xx.c     | 27 ++++++---------------------
 drivers/pci/controller/dwc/pci-layerscape.c | 10 ++++------
 2 files changed, 10 insertions(+), 27 deletions(-)
---
base-commit: 2ddfbff29a2d45551e8c3e4f0c6b7c4618de24b7
change-id: 20250112-syscon-phandle-args-pci-d97537922ddd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


