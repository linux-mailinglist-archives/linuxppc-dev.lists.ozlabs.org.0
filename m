Return-Path: <linuxppc-dev+bounces-3662-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C8E9DFA12
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 05:58:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y1s451pGhz2yTs;
	Mon,  2 Dec 2024 15:58:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::234"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733115493;
	cv=none; b=Nf24W4SD6uFOjX9wAFarG6AkMgMCgI3xD9qe3DaG+v/Bn0Oifl+8/W7CT77vwN+Om4vRqGAz0CPm1IgSrVAUZsfZKw2Giedl7DcDpaKEYqGH2ASP76bFfNkV55SFrHRgcpjcpsOuLh+ZnKmWGh5TV/NKrpXf05HKz9YP8aspaBKZz5FnU2OJ37NA9Ci/IyuAymSHNzNQX3+6V4q3EqXm4x14JbETgLGaUTXpUQ+9iLqLOJg999VhnNpzamYdkNR9eWukMuRRQ434P7/onvhtJmOhS7z5ewxQgbiUNcwDvnPAYoCqvDbpneNRpc2rEqt9Grv3qZ21nMp60sQQytxupA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733115493; c=relaxed/relaxed;
	bh=vDhO31tk1fZx5nO1D34ac67vgcEF+XlfAfCpGqdW5mI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PqAjZMfAcpsWFT1xWa3WoXyEQSltTkH6WQF5I/+CV+5ljR6e8VohXSZAFFRLAgvX07hBDVb/CluICYdo5z+AJzrk+uRX9hoyf0Lso4RNsTdeM01C4+aceh6mbg2ZWg58P1zpai/PKPib/i/H7X8cYQrM8Chmnb2OwpJKLc5yENWWTJ+xU3AmVrJcTVXc8HKf24lmixG2vbEwSCJONbG9Hh4ZH2m2Q5DYGHUOeH77wD0rl04ZwM/+HwPUGEPaxgNdISSx2wcGZFngMJfDYpsG6ZqUIKoTXVxsqjJg/UORYNebLs1mMNNyQ9cgfs8DtW0MVd4PXOEqFh4Z27/4IVAXZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=REvxV/QU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=wenst@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=REvxV/QU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=wenst@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1s425r2Nz2xy6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 15:58:08 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3ea60f074c3so2039751b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Dec 2024 20:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733115484; x=1733720284; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vDhO31tk1fZx5nO1D34ac67vgcEF+XlfAfCpGqdW5mI=;
        b=REvxV/QU+P9EE2BtWKqWc2vwfcVJQk9tYOTNxC5VB0M0uKM+0p6GeY3iYFTIjkOJTn
         S+iCDZjXPLLkhp+BLXMp59WTQyj/rqD6FJwHmi/g5OmM+Ce/kyxzCwUHhQiPlW7CN3fA
         4Sp37hTCsPyJqq5EZItgOjAfVb5a097LtP170=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733115484; x=1733720284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDhO31tk1fZx5nO1D34ac67vgcEF+XlfAfCpGqdW5mI=;
        b=QEhn5t9KW7M0WLYEEY7OMiOQs8NHR0YY7JVUgAqY0tu2+s/5/ImXm1sffeOfAYk6PL
         4aJHve0kwDeH7E8P8itnGxfV2nigDJy1bmEObfEt0neVbWD05THWYDlhR9+5+qZ7jEO2
         de/gn6TNlzwcHm/JSpOeBoV0yCb8docO3cdUVZdd8AGTFK3Zy5/ZY4gY5OO8M2UGcrMS
         NT84ipFoTH2D8mf9W4K3/3cwRAaKu3PjufAfJMvZGHirf28lm4xi6k1i4b2ua2f0yXM4
         spsiWLl8OSiiRFUFrJgwbGBRl5scCMvHSn4r/tsMKNSvsOD9aLeRAwXHYWgW0OtNo6uA
         7QIA==
X-Forwarded-Encrypted: i=1; AJvYcCVGiVLbMJk/EW/YthxEYo7hsBdVMH08duH0hRpsXdh3oYekUrABPZZfpo8EtWnI8GT5dXTM8QHXSI2qKjw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw1I+h4aYV7Qzujpf+JvIjxB3ahEzZ/a/b8VMkRVRcRi4VEIWTC
	k4UFOOvi+D2Cr2/rIPsZJJpMneef8hzgqtnED+K9T3ymG8jyGgzFPDnNcxNLdw==
X-Gm-Gg: ASbGncuWSVhh/BEiBpGJky4Nav88iSfjm52Y0YvDI3m031OmJWW+qJiowAHcLAjTqU3
	7pUP7InyFZNPjpYa9Vo4tvQPjw6LIBeohaRTewtcWEXX0KpqQXX7IYCkFSsDfX/3O9LHne52mlp
	w/iPv2naMKuXgdC+/I41kQ6HAGl6dMTdn4T/XKa/xM9f5ptLLetNxQn7dK5LhHZLFjzbI3nlkGc
	JRd/eseNFST96yyv1/EQBvGyJwE7n4bGu3nB1jNjZvPaKa4ZV5B5hQAnE4H+fDDmIKp
X-Google-Smtp-Source: AGHT+IFb+ZRLH+3t3GZ+Wqs0KteaVy0F6ImlvlAlGAnh/Pchain6QOhSaXFDzaByBXFgCM7QNb8V/Q==
X-Received: by 2002:a05:6808:2018:b0:3e6:3860:596b with SMTP id 5614622812f47-3ea6db6410dmr21148963b6e.8.1733115484363;
        Sun, 01 Dec 2024 20:58:04 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:94c8:21f5:4a03:8964])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5be4sm6970599a12.3.2024.12.01.20.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 20:58:03 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	stable@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: fsl: cpm_qe: Limit matching to nodes with "fsl,qe"
Date: Mon,  2 Dec 2024 12:57:55 +0800
Message-ID: <20241202045757.39244-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Otherwise the binding matches against random nodes with "simple-bus"
giving out all kinds of invalid warnings:

    $ make CHECK_DTBS=y mediatek/mt8188-evb.dtb
      SYNC    include/config/auto.conf.cmd
      UPD     include/config/kernel.release
      SCHEMA  Documentation/devicetree/bindings/processed-schema.json
      DTC [C] arch/arm64/boot/dts/mediatek/mt8188-evb.dtb
    arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: compatible:0: 'fsl,qe' was expected
	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
    arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: compatible: ['simple-bus'] is too short
	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
    arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-controller@c000000:compatible:0: 'fsl,qe-ic' was expected
	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
    arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-controller@c000000:reg: [[0, 201326592, 0, 262144], [0, 201588736, 0, 2097152]] is too long
	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
    arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-controller@c000000:#interrupt-cells:0:0: 1 was expected
	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
    arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-controller@c000000: '#redistributor-regions', 'ppi-partitions' do not match any of the regexes: 'pinctrl-[0-9]+'
	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
    arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: 'reg' is a required property
	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
    arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: 'bus-frequency' is a required property
	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#

Fixes: ecbfc6ff94a2 ("dt-bindings: soc: fsl: cpm_qe: convert to yaml format")
Cc: Frank Li <Frank.Li@nxp.com>
Cc: <stable@vger.kernel.org> # v6.11+
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml        | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
index 89cdf5e1d0a8..9e07a2c4d05b 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
@@ -21,6 +21,14 @@ description: |
   The description below applies to the qe of MPC8360 and
   more nodes and properties would be extended in the future.
 
+select:
+  properties:
+    compatible:
+      contains:
+        const: fsl,qe
+  required:
+    - compatible
+
 properties:
   compatible:
     items:
-- 
2.47.0.338.g60cca15819-goog


