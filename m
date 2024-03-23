Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F423887B0F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Mar 2024 00:13:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=C7fqEIj/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V2FP00fMyz3bn8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Mar 2024 10:13:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=C7fqEIj/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Too many DNS lookups) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=lidong.zhong@suse.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1tBJ6TZDz3bv3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 19:47:49 +1100 (AEDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2d4a8bddc21so38752571fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 01:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711183664; x=1711788464; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gicMv3HOiEEZQMWq3K1W6UJgMPL6I0xNRjjgvC/+TB8=;
        b=C7fqEIj/7ZS9mrMu/3n50gNV5cryF5KiXP4dwYTlLMZciWkVSNp9+Oidg2u+FFJ/rK
         3ipl6VrhKM2r72yBW+kk9jH3NfR0ucatVZn6gciQxmgwc41DPIMD71KQNqbr9w+trZ5p
         zvbfkWPZTVhbYlj71gCpVvSrTJ64IhBiVEXYpxOkZnLWCW4/iwxlJdwJx8fUl3Nt7p/w
         w+9CiCDNTIulGBhPalONRdaQG3gZ/ZSfgcZJ8iCl0Sxq6a8ai4332JKMZfcvDDg+ulix
         p3xFsbzmHZfTMVoY7zfis7VMkmWvRzwnVIvCB8xaH6zzLDvWwyH6K78+yw2aWUA/fVMX
         GU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711183664; x=1711788464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gicMv3HOiEEZQMWq3K1W6UJgMPL6I0xNRjjgvC/+TB8=;
        b=e6pmmy/P9putkKhkdGnDeAbNZo7avSua1ndMDWb40R3cXhwahMFSmDAegfZXaY5YfH
         /bp6HPxlmS3lAPHZ6PYhoSmmbVULCw5Y6+msTREeBLlgvu0xxR3o+ePDH5tM3D9kFTkQ
         9vITEuXRswlGN7WShIHBJPTlyuZc9oBI3aua3hLEMHjc8kgc3hQDMbGC8gGYDqHp0UUk
         yFolnOTqeYb50auTjXeOuROBUCBuu//mRyR1Nv0+V1AuAwu0faNM7q/jPwmF38oyTk5G
         bOCjOmdD9HwwSxxRH7rl4+tjn2vWHsCiGcCpVSkhwx5Xca8JX6hFqtWrBvG6GA1G94RV
         S5cg==
X-Gm-Message-State: AOJu0Yy8AVHCiZSGbncE73ztuRueWwEnIM6oENgnbeBB9tu984o9BTfG
	r7ucd0njGLBH2GptV8OTax8XcGBCe+xkUOwe3S2KFixpmC9KRLP6tLjwte5Tmal1ITVLKPD87+T
	lxc0=
X-Google-Smtp-Source: AGHT+IFp50X5Q/YlQFmTyOAkz1sddiKVCxIGSaRdXnYn77CFtz2J/Tt8+ePYEqFkOgRKF0s6wWzkbw==
X-Received: by 2002:a05:651c:825:b0:2d6:c001:d8b with SMTP id r37-20020a05651c082500b002d6c0010d8bmr1066150ljb.5.1711183662504;
        Sat, 23 Mar 2024 01:47:42 -0700 (PDT)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id m10-20020a170902bb8a00b001dee0e175c1sm1095980pls.118.2024.03.23.01.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 01:47:42 -0700 (PDT)
From: Lidong Zhong <lidong.zhong@suse.com>
To: linuxppc-dev@lists.ozlabs.org,
	mpe@ellerman.id.au
Subject: [PATCH] powerpc/pseries: remove returning ENODEV when uevent is triggered
Date: Sat, 23 Mar 2024 16:47:37 +0800
Message-Id: <20240323084737.12986-1-lidong.zhong@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 24 Mar 2024 10:12:45 +1100
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
Cc: lidong.zhong@suse.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We have noticed the following nuisance messages during boot

[    7.120610][ T1060] vio vio: uevent: failed to send synthetic uevent
[    7.122281][ T1060] vio 4000: uevent: failed to send synthetic uevent
[    7.122304][ T1060] vio 4001: uevent: failed to send synthetic uevent
[    7.122324][ T1060] vio 4002: uevent: failed to send synthetic uevent
[    7.122345][ T1060] vio 4004: uevent: failed to send synthetic uevent

It's caused by either vio_register_device_node() failed to set dev->of_node or
the missing "compatible" property. Try return as much information as possible
instead of a failure. The above annoying errors can also be removed
after the patch applied.

Signed-off-by: Lidong Zhong <lidong.zhong@suse.com>
---
 arch/powerpc/platforms/pseries/vio.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
index 90ff85c879bf..62961715ca24 100644
--- a/arch/powerpc/platforms/pseries/vio.c
+++ b/arch/powerpc/platforms/pseries/vio.c
@@ -1593,12 +1593,13 @@ static int vio_hotplug(const struct device *dev, struct kobj_uevent_env *env)
 
 	dn = dev->of_node;
 	if (!dn)
-		return -ENODEV;
+		goto out;
 	cp = of_get_property(dn, "compatible", NULL);
 	if (!cp)
-		return -ENODEV;
-
-	add_uevent_var(env, "MODALIAS=vio:T%sS%s", vio_dev->type, cp);
+		add_uevent_var(env, "MODALIAS=vio:T%s", vio_dev->type);
+    else
+		add_uevent_var(env, "MODALIAS=vio:T%sS%s", vio_dev->type, cp);
+out:
 	return 0;
 }
 
-- 
2.35.3

