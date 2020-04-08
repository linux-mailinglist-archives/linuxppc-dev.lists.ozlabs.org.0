Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 267871A1E96
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 12:12:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y0SW07lfzDqs8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 20:12:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=aishwaryarj100@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pwnDjzJ9; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y0HR6CqXzDqG8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 20:04:16 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id k5so3120288pga.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Apr 2020 03:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=0l2SgjQoUm9XZQWLHdahmUXmkeQjGbkw3tE+oZhCKVs=;
 b=pwnDjzJ9s4ltda4yGC5klCTFEE8QaNhAa/u7j3EP+/yIokVkfPKvEzGidqZ9FVAKJZ
 HCfIv8ygTMfIX1eUGAECmcdGhwDz+r6jpWNbjh08mlXTvBMIBCFmooPeEcgzlYrnSojo
 VGiqfDybdbRtQ3fYcE2WFZF74PH3CUDRyFbCn4Qx/kGBx6UgXuEBHa5GFQLXo8elHT5U
 u3ukDKJaUxtC/Avln35AQS0d/jskn9xPWtLLGorG5qEFYr3V0Oaow6gJZyUoiMV6GJ2T
 xHhQLdcxTLc5aPGa5yIfo+Ao3kuOnMp8dfTuMO0bi0y/zeV3wmR/+5GcfxXYSpK92v0j
 cwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0l2SgjQoUm9XZQWLHdahmUXmkeQjGbkw3tE+oZhCKVs=;
 b=We6mnO0RkBPKsdi5Cl+MB/IALR892eYYL+xEnFjwKKdG2YldOBrPEUapI5iQYc1Ug7
 ypu8L5qQ//Ru4T/hYjMT0W9Xi5DYv9viXZT549ov1nexqWk8jJDUN4Bas7d/dp11U+T1
 YX2ENN4FrCNvxtKvi41IN3C4pvBVpfWFxMBRLmrNH2n9yk6HiPjyGfjfziVUxsd5Nejt
 O0FVNRYRk8Wu8MIc22xxTl+eC/CJuOYnG3VWD06snw0S/4ZJfKDtjbyx9WKVn5SwuYAk
 T1DCQyscjrUo3UlE/3BzaY7TrRvTAF3rAX6rJgL2N6SQ475yiMSNEaQLo9fh6v1swI99
 UFyw==
X-Gm-Message-State: AGi0PuabVHFlieGww037e92EZbmPnODvfmMpnfpxD1eod+Nv17OTJHTD
 DWMt4GTfzLfQmgc5ZCqzGcQ=
X-Google-Smtp-Source: APiQypJ2rtu2lzZorHDGO2Y9Nj8eRhkIqFK3//sK3EfN2KbEyI5rBMrG/z5wgIY4NOsELjd1ZatGLg==
X-Received: by 2002:aa7:93cd:: with SMTP id y13mr6736602pff.213.1586340253160; 
 Wed, 08 Apr 2020 03:04:13 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4072:610d:c995:d0f2:9d90:2f2e:7df9])
 by smtp.gmail.com with ESMTPSA id i124sm16140306pfg.14.2020.04.08.03.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 03:04:12 -0700 (PDT)
From: Aishwarya R <aishwaryarj100@gmail.com>
To: 
Subject: [PATCH] i2c: powermac: Simplify reading the "reg" and "i2c-address"
 property
Date: Wed,  8 Apr 2020 15:33:53 +0530
Message-Id: <20200408100354.17782-1-aishwaryarj100@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 08 Apr 2020 20:10:19 +1000
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
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 aishwaryarj100@gmail.com, linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use of_property_read_u32 to read the "reg" and "i2c-address" property
instead of using of_get_property to check the return values.

Signed-off-by: Aishwarya R <aishwaryarj100@gmail.com>
---
 drivers/i2c/busses/i2c-powermac.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index d565714c1f13..81506c2dab65 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -207,18 +207,18 @@ static u32 i2c_powermac_get_addr(struct i2c_adapter *adap,
 					   struct pmac_i2c_bus *bus,
 					   struct device_node *node)
 {
-	const __be32 *prop;
-	int len;
+	u32 prop;
+	int ret;
 
 	/* First check for valid "reg" */
-	prop = of_get_property(node, "reg", &len);
-	if (prop && (len >= sizeof(int)))
-		return (be32_to_cpup(prop) & 0xff) >> 1;
+	ret = of_property_read_u32(node, "reg", &prop);
+	if (ret == 0)
+		return (prop & 0xff) >> 1;
 
 	/* Then check old-style "i2c-address" */
-	prop = of_get_property(node, "i2c-address", &len);
-	if (prop && (len >= sizeof(int)))
-		return (be32_to_cpup(prop) & 0xff) >> 1;
+	ret = of_property_read_u32(node, "i2c-address", &prop);
+	if (ret == 0)
+		return (prop & 0xff) >> 1;
 
 	/* Now handle some devices with missing "reg" properties */
 	if (of_node_name_eq(node, "cereal"))
-- 
2.17.1

