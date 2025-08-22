Return-Path: <linuxppc-dev+bounces-11185-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DCCB3175E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 14:15:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7fKT346Mz3cb1;
	Fri, 22 Aug 2025 22:15:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f32"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755863840;
	cv=none; b=ezJuN8IEFqVYa4+R+d1xYVoc0fLYuvB0MLYJV+7v3xbsLMdR851bWby/DSrNP8T3RCBeZ3njpbRcdjJ1uumVqX42e0i9J5SZr+LU3FRbSEEXRDl3AXt6+5SnlARVa9VyJl4lmGLzFuelup/Xtby3d3BogZrS5eJ4bxNQp6D8YszYPTWuzVmCBYGi3Lv+oJVZa27YRDke03jSvMHK3MlSXwB8fKvvwpIJ9+Z7AJSqn7bExKD/ccg5fuvydHGAAswRamp0vsQ42+2OfH9yk7DnQiM1BaoScFT2xiMKm4tiTdShguuAW3q7lbl8cJkFXXM8GnCpI0qM5XzOsdOolZzBGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755863840; c=relaxed/relaxed;
	bh=LzBrn/7/9lhhbAnv0z8eoRpzaF4OzYHSx4GrDU+v3ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XoGQP9SqX5zTZniqkQzsKA6zPFaa7L1fHB5wtzKClyTyfBqjDZfEvlzdcuziSFypCKnK48o0rIK+2Ik87gsTTupJkI3vcg/OASI89dLURfh/ZLUmZAStSKQJqVLkPVyR7bBOrUFUOKWg8o2dnyggz2c/iCq3i3F4ypP4wa3b5CDASm1Jegw+b8+1wvIgKDDcKtwcW4fuwHtz0b0+OHgYRl2HU/RfZG82MpU0/aCauZks0BjdQRP0xtMK5G9YH0LdoPauRYTiM8U0YE4xOl8jaL+JNUA1Ig+IR2biz8HvQKFqOaPDPr79ZRKmLwIvx0MlKaGTzsUbkbOdvY89MqfQtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OQFcMgJU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f32; helo=mail-qv1-xf32.google.com; envelope-from=chelsyratnawat2001@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OQFcMgJU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f32; helo=mail-qv1-xf32.google.com; envelope-from=chelsyratnawat2001@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7dwH0DWJz2xxr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Aug 2025 21:57:17 +1000 (AEST)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-70d93f57924so14013756d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Aug 2025 04:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755863835; x=1756468635; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LzBrn/7/9lhhbAnv0z8eoRpzaF4OzYHSx4GrDU+v3ZA=;
        b=OQFcMgJUyKVXZCZ+c9AR4z1dqTXtrHt571VWbRL4zZh4Ffoct1AisHlm6Pvl3CnqE9
         /B2Fq0ea0cZ3d88kMIsVw16f6WdVfAf9mRqSNVpltq8iShiv9o0MQnCSQ/mughSn/jo/
         2qfwhCTClSxEqYdwbtiR/nzsCgh5A780WqmBmRG2aBKmHQC+yU46XNieYvynLHfLqKsz
         QtpJL7Z1/+ud2xjGrTU0HJ3/1AbTkberkcrVh16mlSHN1mHCZ3TVA+Qdz8t4fwe6RHWf
         K92rYo+/a3IHhy4UfEnfR9Ri2Q9eCisjqPYjENYhChYcH+I4f/h6j8VHPvtpmSNovaUT
         1dDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755863835; x=1756468635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzBrn/7/9lhhbAnv0z8eoRpzaF4OzYHSx4GrDU+v3ZA=;
        b=DO26lVqD+w3BIzPBmm0jHvum4ATXCRR7KbLAlJWnLOoWTCkU3gUnzcSikcBOL7/kgA
         GkI3/eXWulj1i3WwDOmwCyMh238hlywcNsYxiBkHV0oWanCg0wxBOt9bbvLAYxlpu4sr
         cF4avCXPKog5fU9V9E8EWyC3eMt+fuiKXdDzFqmZgrNiQrPuzUV+e/O+zKyvkmgnPQ7B
         y77kJPVRKYAEuj1od4QNaV8nf0YK/3FuY6P/oDuNhQZw97DxVyMdA9sIQdCN1jDDX4rs
         7ErlGLgHZr05mFMK64g3hxGsaJkp7zeUsukEZ1eoXA3sWf9f/KEMYsIuHYmIigMVEicj
         5hNg==
X-Gm-Message-State: AOJu0Yz/tSO0T0x9Q9uL1jNZIgOdLgw5/uAx1GwnQV9mV5md3EmWdEc5
	Chl90ZmfUBJEgWK0XCkV6X8sxFgj8z3qDTVh8NbIlIKo4TMOyL8mP71s
X-Gm-Gg: ASbGncvStVb6BQOZwwNAaRJJv6K3wBxXpWvRYb52qbtJyujBgvFrHyRUWHm1sGlaaVd
	IJ1whQDvnycWSXjtlgeup2o93lkgSJv15mbmvLGBqWJd38tLleq+khXDqNWaMIGX7HCs916Ex2s
	QqlhgvW7ogT4FKknHXUW1FS7yKcZCEwm9EC10dfVdcBzV/rZTVINuzCwqxuaDBcmA2RskJcVM2b
	Fnwwnqo68bDVH9HpGiqbtPZaddIa67lVIJtkk9+pthdNu9E3xRt3x02ZtsR5Ohl+GOC7+Q4FCp2
	cfTQBvQg3SqmdT6LhphRGdhB4b6DgeRfyKA3Q9QOSO57aazmuLZP9EmKVUXh4j6G5XqSF0osCYb
	PVgx9oygjaZ37ev9qrGzN5il6t6uRgiJ96SMrU9vNR8jmR8NkYuXOlzcCGc1AFiLu3uTf
X-Google-Smtp-Source: AGHT+IHpA+EcPiMdbiyZAHt46N7w0D5AA09gFv9HXPM3DfPUZ0lGlHDBzw2LfbEb+CwmZ2kH8Omcuw==
X-Received: by 2002:a05:6214:4687:b0:70d:7e5a:2284 with SMTP id 6a1803df08f44-70d99bcbf8fmr21800986d6.5.1755863834831;
        Fri, 22 Aug 2025 04:57:14 -0700 (PDT)
Received: from cr-x-redhat96-nsd-2.fyre.ibm.com ([129.41.87.0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70d8f8035cesm26294596d6.4.2025.08.22.04.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 04:57:14 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: ioana.ciornei@nxp.com
Cc: linuxppc-dev@lists.ozlabs.org,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH] bus: fsl-mc: Replace snprintf with sysfs_emit in sysfs show functions
Date: Fri, 22 Aug 2025 04:57:04 -0700
Message-ID: <20250822115704.1731999-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.3
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use sysfs_emit() instead of snprintf() when writing to sysfs buffers,
as recommended by the kernel documentation.

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index c1c0a4759c7e..13172a0cdb48 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -203,7 +203,7 @@ static ssize_t driver_override_show(struct device *dev,
 {
 	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", mc_dev->driver_override);
+	return sysfs_emit(buf, "%s\n", mc_dev->driver_override);
 }
 static DEVICE_ATTR_RW(driver_override);
 
-- 
2.47.3


