Return-Path: <linuxppc-dev+bounces-13768-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C732C33142
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 22:31:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1M861Rydz2yD5;
	Wed,  5 Nov 2025 08:31:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762255727;
	cv=none; b=hiEuqcLce4X75QOvLRLNOhY/EQm4NQQDdk4yAmYyeerJnMAl2dBhFDDoqS/gTsB8+w9WjawaqdKsF2o4HLVHZndH1lV+ITX0fmV229NtH+ZKUxJm1PwAy571V6L5IDP83FVpnVupti/9O++NAlEg5KVUwSCMzV16HM9QMSbynkdJWLA7uVrULclbSCzEbetqAujEqvmdFm+v4/BuQZpGzNrn60g1Q+oAHVfJ1U8Zu4QXgiBP84Lgq3xs920ZDwFWBoubkIdANsvs19vFhInkyDs0fBL1LyXzy1zLgzGPaluTaZyBJihaS2P0MCmHo7jO8/Vr10qkWcccCFRHP2rW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762255727; c=relaxed/relaxed;
	bh=CxdVni7d9zY7Eb56aBlMj/F4HouDx96+uAbwzp09kRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hoRFa90KQOE+esZazwY/t9Bd/A+Lkib8wUeyf+zeKJqNBhg0aFMsHam1SJFy4MYSOooLB2rPxqK2mGPYmp52c8rr1ZcbNOvaT1RQBB/QqaWcdf1hg8dquAQ9aJX1NEQD+AfJpPWRdLugJROStF6EKx3qa2QrRUQ6tLaaqWPhF0u3ikYDiPgk/1sE0AlUCuDQfcGtmo9tx92NkfoNY/kKTUEWWAiBMrtX3PQDAqH0XfwXs0ZRBNuyssEA3lqQFahe3yN2WePl8bNUoyGIHGlYc7Coa/nHfGJltUm8rm82LC0MN2vAaWj41RBi3U8UactBGDtYoUSLOjdbTJMMMo2M+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ftAe2SXY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=allyheev@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ftAe2SXY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=allyheev@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d15nB5GZVz304H
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 22:28:46 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-29555b384acso31116585ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Nov 2025 03:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762255724; x=1762860524; darn=lists.ozlabs.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CxdVni7d9zY7Eb56aBlMj/F4HouDx96+uAbwzp09kRU=;
        b=ftAe2SXYQCv1AkapdnnoPqxebZkh3EVJr4WhH+Imu4zmcDgrDhFZz1xKrriYgpb4FK
         +1DBs88bPyt5dFreRyak03pJg/w+ukZB8SemOfF6BceY9/DbvZQQ9GH8sfrRRpQsEenh
         ASkcLVI3dWUS6EjsRMcUWlHLapVpmyAhz0FzvZM+khX0Mjqmz9fuiFX1sPyQq5IjMprV
         ZSnKCR9+PRiThNTAqIrj8k93qyiaW3zfwPOEikdLDhzXqVYaE4mDdeiVGim/HfcHSvh8
         8O2x7hAfRwg8IuI6CEdK1c02cR8DXv2Yc32WZeUyhGz/fygoo4mpKAawN4SNQ+tgYhFV
         1PTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762255724; x=1762860524;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxdVni7d9zY7Eb56aBlMj/F4HouDx96+uAbwzp09kRU=;
        b=MzXKlUxv7IOikfF5GmguiVWV1d+JIdnTYAiaug6u6z/z+IWOZGBZJYncwE5/7zfEeH
         GRY8NJQqQ1smXdA8YgEu7oPnpam6P84Gm4W/zY7qx0k1BzEdyrJwp3D9bTkit8p1Dj7k
         Z62oxbIjmXl8zbbJxdxbpuzdEttsA2q/K4jd74+UwPgghsM6/2xPRKQLaOOlgLiub9tJ
         7q5GL7wNz1/4IPX6cKa8IRng0AiQaLEg7tXJqAOEItFgyionFWFTVt0rffpkj2O37j/c
         +BSaZbsRLxozzvfD5vQzruqBYvUIgCXAVReNfP7KTErG4ZM+5MqR7ZagrShKPToBa6TD
         OreA==
X-Gm-Message-State: AOJu0YxDxbPD5UhYErS1JReRsytjJo2HE9WUPpWBWKMh6k4+VrrEGgIZ
	ZyAZ6zUy8upt1AfIzss56hd3SFTYm1y4faY7TOilfoucZh7tL8S4jN2w
X-Gm-Gg: ASbGncsVi8k2d+r55ClgSy7Wycrmx0WoGLH/Xa1KkBNllI5953aIGZfmlhio0gasujV
	aJuesrwdgTD/RY6+NZTFZbEPG+22iabmvyGsYk9KFiDnWWqMw57Je5ryp5zbAGsEIK00F75LrBN
	URL7BTx7vU2b7j42nYYpdGIwKEbVg0ynR+XbJSpomjRR2SzMY3K5N/4f6en8B+B2bzhxL+pMd6L
	wxhSu86l+9Fg7RY9qiyxBPGoUk2hBk41gpHW+e7MdpNVwIVZFlORPebITBlSdOzt+gp3JlNUIt/
	3PJoJRDeKqflO/QLvY74VmA2+BgxhIUPZC3SvFXA9ZvQA/iZrau4yHAUer4V2IBdhAvrHm6DhYi
	WlUsPqtYhSdTgXTqDY91jEtNgkFEQ1RrpjOlA9RfsysRBj1DZeh67y4IHg65iAKWZgH9K64EGBN
	a/
X-Google-Smtp-Source: AGHT+IGuay4E3cOeIh7l443N7j7NEY6XyHAZjQH0TJBkBS2+aHXGG30+zXi+TgbVqPSIBrRWuFP+2Q==
X-Received: by 2002:a17:902:ecd0:b0:295:9b39:4533 with SMTP id d9443c01a7336-2959b396096mr101951295ad.30.1762255723916;
        Tue, 04 Nov 2025 03:28:43 -0800 (PST)
Received: from aheev.home ([2401:4900:88f5:503e:a1c1:64ad:7a99:42ba])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a73c91sm23386055ad.100.2025.11.04.03.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 03:28:43 -0800 (PST)
From: Ally Heev <allyheev@gmail.com>
Date: Tue, 04 Nov 2025 16:58:36 +0530
Subject: [PATCH] powerpc: 82xx: fix uninitialized pointers with free attr
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-aheev-uninitialized-free-attr-km82xx-v1-1-903be69f2cd4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGPjCWkC/x3Nyw7CIBBG4VdpZu0kgPX6KsYFwl87UbEZsCE2f
 XeJy29zzkIZKsh07hZSzJLlnRrspqMw+nQHS2wmZ9zOWtOzH4GZP0mSFPFP+SLyoAD7UpQfr6O
 rlY0JfbgdwjbuT9RSk2KQ+t9cruv6A4Cmc6F2AAAA
X-Change-ID: 20251104-aheev-uninitialized-free-attr-km82xx-00c4cb7c3d69
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Dan Carpenter <dan.carpenter@linaro.org>, Ally Heev <allyheev@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1538; i=allyheev@gmail.com;
 h=from:subject:message-id; bh=zVzW848wcpzFwJAgPK/KarPXxlh9qHAQdW2+l80NgnY=;
 b=owGbwMvMwCU2zXbRFfvr1TKMp9WSGDI5H6dPmL776+tMe7e3QZ0318e/f3BxT1aTy5UIJemqh
 ycVdn3U7ihlYRDjYpAVU2RhFJXy09skNSHucNI3mDmsTCBDGLg4BWAi3IaMDK/fBt7uiFoRctHp
 gKHpwlnTvh6+MP+lUP/07c8D+9Mi5pUw/K80q9nr8unJ/96fl2tzkssvnrvyRmx28bt706pV2VK
 23mUGAA==
X-Developer-Key: i=allyheev@gmail.com; a=openpgp;
 fpr=01151A4E2EB21A905EC362F6963DA2D43FD77B1C
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Uninitialized pointers with `__free` attribute can cause undefined
behaviour as the memory allocated to the pointer is freed automatically
when the pointer goes out of scope

powerpc/km82xx doesn't have any bugs related to this as of now, but,
it is better to initialize and assign pointers with `__free` attribute
in one statement to ensure proper scope-based cleanup

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aPiG_F5EBQUjZqsl@stanley.mountain/
Signed-off-by: Ally Heev <allyheev@gmail.com>
---
Testing:
Successfully compiled the kernel with `allmodconfig`
---
 arch/powerpc/platforms/82xx/km82xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/82xx/km82xx.c b/arch/powerpc/platforms/82xx/km82xx.c
index 99f0f0f4187672614f4f8ad46ab7906f7ad8078b..4ad223525e893c0de15540db2b2c4d239d6d841e 100644
--- a/arch/powerpc/platforms/82xx/km82xx.c
+++ b/arch/powerpc/platforms/82xx/km82xx.c
@@ -27,8 +27,8 @@
 
 static void __init km82xx_pic_init(void)
 {
-	struct device_node *np __free(device_node);
-	np = of_find_compatible_node(NULL, NULL, "fsl,pq2-pic");
+	struct device_node *np __free(device_node) = of_find_compatible_node(NULL,
+		NULL, "fsl,pq2-pic");
 
 	if (!np) {
 		pr_err("PIC init: can not find cpm-pic node\n");

---
base-commit: c9cfc122f03711a5124b4aafab3211cf4d35a2ac
change-id: 20251104-aheev-uninitialized-free-attr-km82xx-00c4cb7c3d69

Best regards,
-- 
Ally Heev <allyheev@gmail.com>


