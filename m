Return-Path: <linuxppc-dev+bounces-5769-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C509AA24E0C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Feb 2025 13:47:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ym8XR1nF3z2xYr;
	Sun,  2 Feb 2025 23:47:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738500423;
	cv=none; b=TqNWNoeq0Y4hGeeA2DxtKOX5vtH/IEBAHOwNZtkHXtKqU6t4YlaGJnRRlyOUMDdLB47jq5wqGdK1VI97ga+SgkZSu6GgVWytpKDFvWd0tbEsPi12j+Ay8BYi6phTx99RBO6+QjGC3lZKf6LmUKCT7vyZH9p9m1p+ONWLckgwSu7CYxMOurrGHkxEqZEyH7BFo7Q6u/amLCUfqgvQZ34cdHo8QKYu0w0JK6EChiB6gkQ1uwA8L7Zg9S/3pjyCoGLFJk7lPoAmht8wUBTWqkUFd2DqU5jvFTGJ2lvZfXM2I23jCgHOLJlWknCPKcyIBJ0m3TYbHgLOCemvl3c5THgf5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738500423; c=relaxed/relaxed;
	bh=yecdrhK+8+1N1ClkDyJmbXx07y6OB/18+avYea6WDFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XuBwQ4gJumwykiEkZdJ4YVb4YrpXifyeqLsiToLn/Z0hhE6F8YFKKm0MQDCydGwh5BiqpirDLYuCDFmNK6ocwE1ksx1lCY15A4pzLWsdT5sSxW9k0so8OUROejLx1xvZ/uHSFSC7DbR8Y55DkQFK/ItsSpvbrJlAbTk3wp+jNIxF0aD4/vwwLdq1vruWVlqcQ5nxs3D9yihMT/LGB6ajdbgkDqgQhCYzvPMvMmS1pLMoqNV7lZK9AoIQIMcFAorNAvSBeiYUtH8pe6Gwv5L1UzqbL0FIBxKCtpoNXe7hP8NdJ6X81UrLCySGemyQTfuypn2W0bALpK3xEi3fnu5RQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NJXzLTaB; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=kirjanov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NJXzLTaB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=kirjanov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ym8XP6pR6z2xVq
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Feb 2025 23:47:01 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53f757134cdso3540991e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Feb 2025 04:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738500417; x=1739105217; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yecdrhK+8+1N1ClkDyJmbXx07y6OB/18+avYea6WDFM=;
        b=NJXzLTaB/bNQt/xLIgcrF+D2Q44ldmLJimN5lOSON8+Z9kqTypxvr4JoDsat9Bibdj
         jwO6j+quTKrf/UkeGQnpg+LW/oG0/OCdG6HIWhAl6SO95kCFtXxJoNh8L0CYmEtIuDuI
         pEvm4trYZdc9mxWovxspxdOb1EPZi3X7Tn0xbA9UjPDbM9CmrO20hA4eOjTqWSqaQu6V
         x6XJjsUnQ4Af6qGBu1QjrIDc3lAuM+TM5jBp7wM0CJ+e1alvd/8zeKyk7ijwFJxtgeso
         EFl0ivL3m5fIArm9y5bwFid894DcydBJ3U6nqX+CIwtitu+QObALLv+kjJ8liY17xljk
         aD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738500417; x=1739105217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yecdrhK+8+1N1ClkDyJmbXx07y6OB/18+avYea6WDFM=;
        b=u/jIdxXy4D6DObnh9erprQBbwPX7esenlRrC5mQl1IDKfH8/ZCgpSeM42UI5LsZhR1
         cEKnnmbJRKpP3ryiBXhPi+O15CcGrECeyK5nDd/FdkR3wYOe31EwHdsFdSq4VEn5HsqO
         JYMv1eFgenCWQRS/nqZ1XQnpjpI+hlVCAZw5859WCAnAEVnOzSZw0b6MKn7wE/YS5hoh
         ev2Xy/TC515taXlur/K/EXBCbpBYEq3XNGsWdwKe8qpnOKDYgea1cyM8uo5nXBboLPJc
         Qo68ztvw7XsMcLixJJvZ67IUAJzu6h1ZOT6/EDw7/dCGZ/du8E34WC+6nXY1QKPin6jg
         7RAQ==
X-Gm-Message-State: AOJu0YyX31gNeJNBJECEzxzvsfpYhNG+/ZPUvp5dQz/S+us7DrmLEfz0
	NkF/lAtfCd+exKyMEoZSN4GhQMjDkS6Xmyp+MVewddJSFLNLSY6JTKMH8H8MKt4lAw==
X-Gm-Gg: ASbGncuOrimxUvb0r4asSgoT5TTg1uWIP01xEfTbElfEp+sNZaKuNDwxnsQW5FYMvUF
	MtRHfMqflUhh75xmTLASehL62xdNDig5gQcgyT+vDTV8oqzWwIsCbynMR8CtjIGs//8onK6ZuT3
	L4rvNK9pRr6gqWJPVR/EBW5c2w1OTFJFUzqjGAy6MyMgO1Sr52mGKP9whS1wp9cVXG6Klu4k5B5
	wcTnB6ikq0uHGBAovue63HIvKiqMC9jhmBtsV5gr+oM9zqxiLWCKa12vqsPv+76tWmNF8WjPJxE
	qXasBAI8mmyyxiMSg6nb1zh/Dt5A
X-Google-Smtp-Source: AGHT+IGaASLIWg4Fh2cjs3Mk0TJBUC1y5zQa6mSOI2SjLxMbGaAyATPhXWjIsAb3WBdoTtBUW98sTw==
X-Received: by 2002:a05:6512:2316:b0:540:358d:d9b7 with SMTP id 2adb3069b0e04-543e4c3a32emr5430977e87.52.1738500416663;
        Sun, 02 Feb 2025 04:46:56 -0800 (PST)
Received: from hydra-ppc64.kdaintranet ([83.217.203.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a342854esm11463381fa.97.2025.02.02.04.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:46:55 -0800 (PST)
From: Denis Kirjanov <kirjanov@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	Denis Kirjanov <kirjanov@gmail.com>
Subject: [PATCH] powerpc/powermac: fix a loop in core99_usb_enable
Date: Sun,  2 Feb 2025 07:46:40 -0500
Message-ID: <20250202124641.2722-1-kirjanov@gmail.com>
X-Mailer: git-send-email 2.47.2
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Looks like we have a typo in the do-while loop
while checking the loop condition. Fix it with the boolean OR

Signed-off-by: Denis Kirjanov <kirjanov@gmail.com>
---
 arch/powerpc/platforms/powermac/feature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/platforms/powermac/feature.c
index d3bcfe590384..9d929fbfc46b 100644
--- a/arch/powerpc/platforms/powermac/feature.c
+++ b/arch/powerpc/platforms/powermac/feature.c
@@ -1174,7 +1174,7 @@ core99_usb_enable(struct device_node *node, long param, long value)
 				mdelay(1);
 				status0 = UN_IN(UNI_N_CLOCK_STOP_STATUS0);
 				status1 = UN_IN(UNI_N_CLOCK_STOP_STATUS1);
-			} while ((status0 & test0) | (status1 & test1));
+			} while ((status0 & test0) || (status1 & test1));
 			LOCK(flags);
 		}
 	} else {
-- 
2.47.2


