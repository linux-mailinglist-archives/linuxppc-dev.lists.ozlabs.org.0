Return-Path: <linuxppc-dev+bounces-14202-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FF8C616B9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Nov 2025 15:26:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d8Y865KLBz2xqs;
	Mon, 17 Nov 2025 01:25:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763303158;
	cv=none; b=StK4tjMxCF44mmU7+ysNa2K4IINQ9MiShn4G3EASZ7CkPmp6E3DA2d4o1OQ3chABUKhXFfDsfjww0bLFvg43KQbecrs0Pcbf4xntOqq5tCEZC7kOX/Hyl8cEh6PWSpSMP7BEhkDg1wkAoHDzadHHZFqBplj+JExPTHQF047L0vFeERDp7HFoy02NLwamSrbOgrIFje00w5KvzpXABFoUdXMJ4O3KmnNvJ+Golg1Wz68nLez7Z1sgtRgV145UkfBN8Z3x/GOSuw0Tpmpif/mJxYOMqo039pbxkp2tFuizxnZKJXHLgbevit4+oo1nHIEhLwiUR54HIvwVEdRT7miumg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763303158; c=relaxed/relaxed;
	bh=tUgNXd3WaS1ZX53qlrUJ1wb/vOmJJkr1sOtoI8YSqyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JHvMOttzeOiaOxk1l6OTJwJX5UACPXmYBvFTlmlhl/L7xuVjNul5T+dee/3puvMNtNiDJPcihLqWn04FpOj+/1/6JIRzgFVme3tRlYfC08OjxH2mZeKu4pbrMI2sp7f8yFSx/QS9Iz9Twfjx/LWdASAt1UdGvHfkMNShMuM0AdLTkIv93Sw+6HdtZMzQoeT+FAs1/nA0PLvUEJ/Ojj2dLI09T5BQohGFY9K4GiHgJEmKoY6GfIOU8EnbIdtaBdjXWdWCVI9TmL0fjEdua2jsBsDqnNP9LEXR2KvcGmZXAi9Fc1tQVVRR1dZm9IVMr8zEd99bPWbYz2J48gy2xHREaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lp9b8Swo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=allyheev@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lp9b8Swo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=allyheev@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d8Y845vKlz2xqL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Nov 2025 01:25:55 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so3923296b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Nov 2025 06:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763303152; x=1763907952; darn=lists.ozlabs.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tUgNXd3WaS1ZX53qlrUJ1wb/vOmJJkr1sOtoI8YSqyA=;
        b=Lp9b8SwoB5ysM8vc2TSe0tE/+bEIPOhKoXFU8QE4/QNJhEhqcsV+OAaI1jpRwmNJ1K
         KjAHnYjyDuM0NC1Pkryq1Cfi1XMnKuBvfYMtMLekclAs/iX0zqBNz0c+8XK+txC3eGsx
         jEcocCtl4S0FNbMojIthSLN2ctEGDsmS4HdVOGKuoatcIRPE+QosPy+BFCcuF4x+bgu4
         kAjf3K0o+XRzB2NXiIxaeqkBPIVAeRIwhTb0gt/CL0Dud9Lib7FpV7czqlkdlrDCtWOr
         DJThZYFIijeloGhs5+MyT72ykPzF3wqJBxGa+E9zHRMbN1NDTfEcdfj+sxuPuFsk3A5c
         fS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763303152; x=1763907952;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUgNXd3WaS1ZX53qlrUJ1wb/vOmJJkr1sOtoI8YSqyA=;
        b=MaXl5TzvdcFc5hs36qRO1ajJUrwYb5sX9nmQDOUyxKRDoD4msQ3v8s7CphQaVQ5SQe
         Mct8fKGVKQGVBuoRUP3Bywu33kJMiTN5C18aa4ShwYf2k1fRte7U/gsNOu1jiONwdUyM
         TPOwCSDlA73cIQ/zU+YBt+d1/0VoyLVtKaUVFPeWTgRG+Zbp4UlrJCgO/zVTNUwMOTZk
         p0YYICUyMLUSWzr190Ju6DjeV2TCR7dWHdmRUZQTG0v/lHLGArlEWjeirD1E5/08Upmo
         82jCJbA7HxkzMtvJu9xeXESci8zqURfsUPscmEVuqNnTcMSXrzSjpnfDF614CAfqHpIC
         370g==
X-Gm-Message-State: AOJu0YybLCslD7c7pnn0TnmixuF9W67mdRb4CAL8zwtOBu3ELNEVZSHd
	oO0m1KXL4OKBnUnj7WguZVGDKD9U7SfwGdVCtgi6J3XO3eBDh0BEAVx3
X-Gm-Gg: ASbGncsaEmcvkahzskDXjn+wrztbqNNe1Jk4LeUqPRUhtR9DN6LgCTOX/q1JLh8X+Ll
	58gcyE3JayrlwTQasnbvB6855/KX1LrrObsAQseadGNgFI5OewMNEFGnL2oois3ZQf5I0kc/CVA
	ZE1Iuis6Nj716EvRDCxOrnyzR2kuuqXUVym4ZE4qVX7p9DnL2xpiGEuw8nN/7CeGogiFI/0jd1P
	W8qSI2Cf9bNAt2TtInRCTipuI9gK6oYKfrMFeEHYsSUWyip43bjg0i6ook7yIDO4ni9jMIoujJC
	a8tZ315/f0p7x13Cq/w5xh/pHpuYDKaJ9tPGRVlWY4qWCwwmhW4zPIP3XwKonrJE+GwKNRNmR2G
	efhql5jiqOQSsypwGKG9DuUVgFDUg7vW2aik/VxE5j2eB2rGozJk6FCiPABP7pnd1whh5xJaSIB
	2gYuiyFZO2VtbgXurkVTo=
X-Google-Smtp-Source: AGHT+IGY5ayl7KbSv9wQLmeiIVuYvNbLWrQzA1wPRGTb9zHhR5PNgGo6VMzNJZgxWiIx01WZ6pvuig==
X-Received: by 2002:a05:6a20:4327:b0:35d:5d40:6d84 with SMTP id adf61e73a8af0-35d5d40748fmr6518187637.5.1763303151880;
        Sun, 16 Nov 2025 06:25:51 -0800 (PST)
Received: from aheev.home ([106.215.173.137])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc365da0191sm9689168a12.0.2025.11.16.06.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 06:25:51 -0800 (PST)
From: Ally Heev <allyheev@gmail.com>
Date: Sun, 16 Nov 2025 19:55:44 +0530
Subject: [PATCH v2] powerpc: 82xx: fix uninitialized pointers with free
 attribute
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
Message-Id: <20251116-aheev-uninitialized-free-attr-km82xx-v2-1-4307e2b5300d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOfeGWkC/5XNQQ6CMBCF4auQrh3TFkRx5T0Mi9IOMBFa09YGJ
 dzdyg1c/m/xvpUF9ISBXYuVeUwUyNkc8lAwPSo7IJDJzSSXJyF4BWpETPCyZCmSmuiDBnqPCCp
 GD4/5IpcFONeV7s66NHXD8tXTY0/Lztzb3COF6Px7V5P4rX8CSYCAhpcd1k0vtaluw6xoOmo3s
 3bbti+6rZLy2AAAAA==
X-Change-ID: 20251104-aheev-uninitialized-free-attr-km82xx-00c4cb7c3d69
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Dan Carpenter <dan.carpenter@linaro.org>, Ally Heev <allyheev@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1635; i=allyheev@gmail.com;
 h=from:subject:message-id; bh=svasl/wUQN/RjV7OV9NFW7xHupHnh3s+RY74FYkdgjQ=;
 b=owGbwMvMwCU2zXbRFfvr1TKMp9WSGDIl773+JeK3k5VdYdfi38k/sh19Xb78y27LffNotar45
 /0eQScyO0pZGMS4GGTFFFkYRaX89DZJTYg7nPQNZg4rE8gQBi5OAZjI6pMM/1Nm8TwzevK9m+PZ
 LW3fx5++7nuarHl0xvmtz6c7hS7IZTdiZFhSseQQc7rYkj21tY/ebnr9eJ083wKH+I32kbpeAZH
 1b3gA
X-Developer-Key: i=allyheev@gmail.com; a=openpgp;
 fpr=01151A4E2EB21A905EC362F6963DA2D43FD77B1C
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Uninitialized pointers with `__free` attribute can cause undefined
behavior as the memory allocated to the pointer is freed automatically
when the pointer goes out of scope.

powerpc/km82xx doesn't have any bugs related to this as of now, but,
it is better to initialize and assign pointers with `__free` attribute
in one statement to ensure proper scope-based cleanup

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aPiG_F5EBQUjZqsl@stanley.mountain/
Signed-off-by: Ally Heev <allyheev@gmail.com>
---
Changes in v2:
- updated commit description
- Link to v1: https://lore.kernel.org/r/20251104-aheev-uninitialized-free-attr-km82xx-v1-1-903be69f2cd4@gmail.com
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


