Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC65B24E866
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Aug 2020 17:42:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BYjM221tbzDqQq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Aug 2020 01:42:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636;
 helo=mail-ej1-x636.google.com; envelope-from=chunkeey@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dd1KfyOD; dkim-atps=neutral
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BYjKB6Y0kzDqlR
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Aug 2020 01:41:02 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id g19so6057770ejc.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Aug 2020 08:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=apKIgyBBu2/J9e0hh6C3aEh4+s6ARZOZAgMSwcEU1Rs=;
 b=dd1KfyODS3VpoosAdWHvTWjcEpsHgEzsKA62Rw1vEH7wqZHtwSf8aHvCgnZC7MpRb1
 W/ZAAnZjl6RAskoC0Na0JDHr783w/aP7PabhLEMrrWjcgqhM/7rv4zjurP3P+WPhy/wF
 1yA4Pjdkmluc3xjZAnw5VXMeGz0jUkWjt0Bb6pD1S2bn9zD2ECRRdn66BQ2pP0NrHQJ+
 BAfiZy/RkFJkHC3SD3ofpUfNyaCKNSHi0MMuNnJXg4D5TsQM/n3LlvXUXnAr/Vb1MBF0
 iPDeh0KsBPfde73SO/HZ/IH0GVekoHGLvVrMU8qfuSfCMHSRQtUz70qY1zq694NC9sn0
 fjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=apKIgyBBu2/J9e0hh6C3aEh4+s6ARZOZAgMSwcEU1Rs=;
 b=d6Mz2E+nX46+s+YQLxM78YdaUH6LCrGn4gBTZrefqsP/ntV92X4q3eihfvoh3vZSIy
 7+bO8Axq36rccwKRPA0Qxt2R18ZJwHqKz5vGuIMqLxVL19dmvqkgV1XWR2a8GhTJhNyk
 HfNuDuDC56Moh/NVLrvUTFj1qNUzsd5mTXk/oh7xzCVclca2RMN7OIPyh0BVJt0k9fmR
 z+IoKaqibXYaFWEga2WmT605fbrlRMGG+fErRXl6wSRzz7yGfFRtBNkFNH24M0ISm6fT
 vHU379tuwM4PaUe3/zIb7tmavQ2Y2tmyKlnDEaYzF9I86/1nkcYwKQidRQmDf8A+/R2E
 Okqw==
X-Gm-Message-State: AOAM531E+2FO6jp7uJFbyedMJ/rP/1WSZ5csKJk6SIxevgSY/+bh5nB9
 Etr42ESKiJYOsDlhPWEoaC0=
X-Google-Smtp-Source: ABdhPJw8zCprYze8ibULfS/C1LjwJtP57POSVU+wCUVsDFhqAF21k7BwhWDgpgnuLlWAtn7bbdF96A==
X-Received: by 2002:a17:906:4c97:: with SMTP id
 q23mr8043909eju.11.1598110857505; 
 Sat, 22 Aug 2020 08:40:57 -0700 (PDT)
Received: from debian64.daheim (p4fd09171.dip0.t-ipconnect.de.
 [79.208.145.113])
 by smtp.gmail.com with ESMTPSA id m4sm3699387ejn.31.2020.08.22.08.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 08:40:56 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.94)
 (envelope-from <chunkeey@gmail.com>)
 id 1k9VdO-0004BP-1h; Sat, 22 Aug 2020 17:40:46 +0200
From: Christian Lamparter <chunkeey@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] dt-bindings: vendor-prefixes: Add Cisco Meraki vendor
 prefix
Date: Sat, 22 Aug 2020 17:40:45 +0200
Message-Id: <20200822154045.16036-1-chunkeey@gmail.com>
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
Cc: f.fainelli@gmail.com, Arnd Bergmann <arnd@arndb.de>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Linus Walleij <linus.walleij@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Meraki was founded in 2006. The start-up quickly rose to prominence
by being based in part on the MIT Roofnet Project.
In December 2012, Cisco Systems, Inc. bought Meraki.
The "Meraki" branding is still around to this day.

Web site of the company: https://meraki.cisco.com/

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---

v1 -> v2:
	Split from Meraki MR32 upstreaming attempt. (Florian Fainelli)
	(This patch will be needed for the MR24 upstreaming series as well)
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2baee2c817c1..febe7f00b1f0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -643,6 +643,8 @@ patternProperties:
     description: MEMSIC Inc.
   "^menlo,.*":
     description: Menlo Systems GmbH
+  "^meraki,.*":
+    description: Cisco Meraki, LLC
   "^merrii,.*":
     description: Merrii Technology Co., Ltd.
   "^micrel,.*":
-- 
2.28.0

