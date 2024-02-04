Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8A6849310
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 05:51:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2023 header.b=L/nerkr4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TSv9c1psFz3cCS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 15:51:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2023 header.b=L/nerkr4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TSWsh4vgxz3bTP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 01:21:44 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d958e0d73dso17941905ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Feb 2024 06:21:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707056502; x=1707661302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:dkim-signature:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eRP9nwVzfqXzZs06/31XhntREIV2z9OIdaJ2cgZOe4M=;
        b=AEgrn6UBzWBqrEKycsJZj5w/K+HhZ8C42MlQ2QW31J99CGf1btzmzeT9O3Kq1B4riQ
         siyPrF9PBc1DSRV6W3mlYc4H86CqCGZhPM8ESMbEiAUT7tf4Rp9XKFs1yxbZiGpV4bdq
         iRNbwE0gHNQ9Pit9CAcceSIeTc9w5TiIL6jqm6fcNsXdMrh2Wg/JWfNk35PIXbCPUeKU
         GhC3sA3ZgxJAeE2bk5vH33hOHZLkZrUJdg6iLwzRGQg/+Km0/bPQeFq7kJ2lfTEmnDhe
         ItPZPwbbxtGG/5C9prfXpd8m8BSHJp6ki94KL5W90A5xg5wZzKwWPzdikbymNVbI+P+Q
         UOdQ==
X-Gm-Message-State: AOJu0YzE/1uV53FsT+Ef0tT2S3R8kZ1fwNacAZvgLXyLL9I2K7ppjWtw
	q3wqnUZl5nUO9k/8nui5cssHuiEUnhFnYWFitcJgZ4//H+1jNNZl
X-Google-Smtp-Source: AGHT+IHlKunJ13MKnUeSB4T2IJo7rwM3+OMf+NJ+cU53g50LtoXKkChxV5/eB7Iw0AsOKY8YcjIPwA==
X-Received: by 2002:a17:902:ecc6:b0:1d8:cfc9:a323 with SMTP id a6-20020a170902ecc600b001d8cfc9a323mr4992402plh.34.1707056501987;
        Sun, 04 Feb 2024 06:21:41 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWW4FczAcBkmGlHAJ+dvfK68fXImfRdnKSkBOQMt3wW1NpIACutc/k4RSg8GF09gZyVxscPCyO4o3ZPSj0x7DtYC7jujJ47GLmjrPUDeqary7FlMKNGrzSnzQp90nLs/I6e7nDZGnl9KxkRuqzO4hDpEYqjIoW4rKJ2jE2b0sBtsbvdIymBiqrM15LA6b1nTsDpUNryIMp+Oy1tM3Z/fwzLct3WV4Bzv7bBvjVwJdF8ezT1I+mj5KyBnEnVkV+iUxAI
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id mq3-20020a170902fd4300b001d8fc81611asm4625617plb.306.2024.02.04.06.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 06:21:41 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2023; t=1707056500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eRP9nwVzfqXzZs06/31XhntREIV2z9OIdaJ2cgZOe4M=;
	b=L/nerkr4PmPGkN/pcEGf+K/Adn0fgm/QPUJ+LwFeKoe/A+xG+IrwR6Ud/YxEizC1mhfAR1
	9H8+LN0fv+0ObJVoD0Y+RbOnORdwY29ybiPp0+5A3LlNhcH9td+4fCQbnhAKBZoQI7WM0Q
	YfkR0Nf+fKUf0Sp0ZPPJff7ucCw6qF57J3DoXgrj4H8NIO7xI3pq7V+CfjO7/XjVkMTh98
	euKoBUggBK92t7TRB3X/3pkBE6o6hAhNE4uCdvF+ZZ/rlyjYGA87aZteocMg1SYlpb93y6
	aFpl5s4IONSVXSBXsEdieqRVZ6vKek5QUlFwD5fzkBfPJ6KJ5fEc3NfcjqZSaA==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Sun, 04 Feb 2024 11:21:56 -0300
Subject: [PATCH 2/4] powerpc: ps3: make ps3_system_bus_type const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240204-bus_cleanup-powerpc-v1-2-c763f0e142e9@marliere.net>
References: <20240204-bus_cleanup-powerpc-v1-0-c763f0e142e9@marliere.net>
In-Reply-To: <20240204-bus_cleanup-powerpc-v1-0-c763f0e142e9@marliere.net>
To: Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Geoff Levand <geoff@infradead.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=LbQtBWIpeayzEKkseZGs1TpCkdNEpDoo5qvYZttcz4I=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBlv52JxRO4eDxV10GK+WPJFjLd8X15nJiU9EnS+
 7Ak+fD1TmuJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZb+diQAKCRDJC4p8Y4ZY
 piDsD/9IzMJ5fF2wreTnLUccAe/wz9zWMeGU9aR9rwr4ggq79drcDnVgH0WRaD7ogxbFbgmbYtI
 7b86UCiuNteVR5s033t9FoJ48Hh5Ej4odBY+WIfDRJdfN3t9+8ooaWougp9EA7pY4PrsvO4Yi5K
 4CNI0fz8ekmBqe8kvQ40AuM1MmnpS0whSjXPekMDtD3tE3CLtXn0VJkJHqtiJgYPWOf2/UoeCYs
 /N1XtUCPDGwa3v/FZmXHQQqQmS/rkiqgTWtWQBHdMN5uMJANgTtyzhgFjT+NUKBgl10Y9X1GTMW
 xb7CW57/X3Z4x+Z/JYaQDvtd4021khd+5DGZZgV7oM0M2J6C32L75iBJPHrzbInk91klXITrpcL
 AVT1qRhNWsi2efhwekJBruQnBBjXYx2u1c67Hy5FTczv4JRoYLumQWZgMds/od91gztiESG2hYv
 K+Sypl0fTuMIcjEuu8FLUwKX8RU0JemVnLa+ZSvY8kNcT6boveUxSe9KQ3GstpdTGLqCrLfT/8O
 0UERmPvdn/0rjMMVt5+XuKF9XbYUgdLMwSrDGbmylAK5BkvgRfb8fYudU0j3ufvrwxocCTBbGTY
 DjRBAVS7Ftu/t8NG0cnEle1v3YXfhg9WzwUpA2H2FSzK7kkEUv9erzWyDn92WBi39/AU39udbc3
 smk0cBahnUJmeIA==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-Mailman-Approved-At: Mon, 05 Feb 2024 15:49:46 +1100
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Ricardo B. Marliere" <ricardo@marliere.net>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that the driver core can properly handle constant struct bus_type,
move the ps3_system_bus_type variable to be a constant structure as
well, placing it into read-only memory which can not be modified at
runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 arch/powerpc/platforms/ps3/system-bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platforms/ps3/system-bus.c
index d6b5f5ecd515..b4298e98ffe8 100644
--- a/arch/powerpc/platforms/ps3/system-bus.c
+++ b/arch/powerpc/platforms/ps3/system-bus.c
@@ -466,7 +466,7 @@ static struct attribute *ps3_system_bus_dev_attrs[] = {
 };
 ATTRIBUTE_GROUPS(ps3_system_bus_dev);
 
-static struct bus_type ps3_system_bus_type = {
+static const struct bus_type ps3_system_bus_type = {
 	.name = "ps3_system_bus",
 	.match = ps3_system_bus_match,
 	.uevent = ps3_system_bus_uevent,

-- 
2.43.0

