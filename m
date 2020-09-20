Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B54F7271191
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 02:20:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bv7Wp1lqszDqkp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 10:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f;
 helo=mail-ej1-x62f.google.com; envelope-from=chunkeey@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OKh2MwB7; dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bv7V43C0rzDqhK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 10:19:06 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id p9so12940889ejf.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 17:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5yaT5gZZGJLhXLmT2L9V2Hy/ARWeh+FAUBV0QnUx2j0=;
 b=OKh2MwB7YAnunkLwi9mBwWSPlaCMF2V4O40fHFkSKo0sUpoEoGINQ3wJXUMz7HrHZn
 MqbfAV8Qmo3UMJyhdoJf8Dpgmb4ExMaPHDfE2z6U34vlVIz/FrvOxeltI5sNJqD8wAe/
 3jW7JZ6TX0eZSTcWgiTFST0mqiHGaBd+9RNhFIAq6VCUPeQtUrrN6WByeZeTzNuvLKKe
 jGI4WMSiltp/NV4QpFIkrTCKWr5umucs50HSpKa1shqznnYPVGN1l7wdNgVVEJZD9aT6
 neIyXUNaLrB048snOOWnskYXA0vHMMOGD/R6pkPP+lts67U97bC/h2ThNDoyZJiZFA/F
 uQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5yaT5gZZGJLhXLmT2L9V2Hy/ARWeh+FAUBV0QnUx2j0=;
 b=Xj1/19bl7EH3z0NbLV/uHBUPvBJUBQmECELTQizmssT7Ip80UM2NZNd6IPhF5IPU/r
 Bsag1CTzawvoyuENl1MGZmHyQmdxJSkrId1xpemdL7RnUnIO89U+oOhfXKArQEf3u5fL
 Tjc3oU3NS83B/n23b+MsvU/8rtWlfBJaq6xUxvgvfR3C1JIOoMfurLAc8wmKYA+z7btE
 pxbGK90KYlOWkThB+WRLV3JUR5uIDWjiY9//F6FfCVpYYGv7RPo2GSSSHHU4mKvVKRjl
 RI013WGlowj+KOQ86z4PtnYbkL+qBLD9h9c6x6d+kDHPUQK4IfgUtELnojzEPPvK7Ldr
 rZ4A==
X-Gm-Message-State: AOAM531BkjfZjgVtqWyNJMP2AHg+9y6PYrMIvmBDcLhe2l01lQxhDthl
 f3dnGchGi8Qcgc3633uq+/U4maSYYKn31w==
X-Google-Smtp-Source: ABdhPJzJrK3cKu/ge/dvWRohSexRPJbhGwDuFT805kDgJfQVKW04vd0cTvmAyqeJqlfMt493XlFP1w==
X-Received: by 2002:a17:906:e88:: with SMTP id
 p8mr45339836ejf.134.1600561142056; 
 Sat, 19 Sep 2020 17:19:02 -0700 (PDT)
Received: from debian64.daheim (p4fd09180.dip0.t-ipconnect.de.
 [79.208.145.128])
 by smtp.gmail.com with ESMTPSA id i3sm5570067edn.55.2020.09.19.17.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 17:19:01 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.94)
 (envelope-from <chunkeey@gmail.com>)
 id 1kJn49-000s3p-Dv; Sun, 20 Sep 2020 02:18:53 +0200
From: Christian Lamparter <chunkeey@gmail.com>
To: linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: usb: dwc2: add support for APM82181 SoCs
 USB OTG HS and FS
Date: Sun, 20 Sep 2020 02:18:49 +0200
Message-Id: <a43868b06566f5d959d8cfc4e763bede2885931a.1600560884.git.chunkeey@gmail.com>
X-Mailer: git-send-email 2.28.0
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
Cc: Minas Harutyunyan <hminas@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

adds the specific compatible string for the DWC2 IP found in the APM82181
SoCs. The APM82181's USB-OTG seems like it was taken from its direct
predecessor: the PPC460EX (canyonlands).

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index ffa157a0fce7..34ddb5c877a1 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -39,6 +39,7 @@ properties:
               - amlogic,meson-g12a-usb
           - const: snps,dwc2
       - const: amcc,dwc-otg
+      - const: apm,apm82181-dwc-otg
       - const: snps,dwc2
       - const: st,stm32f4x9-fsotg
       - const: st,stm32f4x9-hsotg
-- 
2.28.0

