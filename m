Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C2B6C028A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Mar 2023 16:00:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PfgzC0jCxz3f7Q
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 02:00:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.47; helo=mail-io1-f47.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pfgyd3C7rz30QD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 02:00:07 +1100 (AEDT)
Received: by mail-io1-f47.google.com with SMTP id h2so1193886iow.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Mar 2023 08:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679238004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DWTyC8q9bW9WXhCIYgpFi1ioer+rKbia0nk+iCnDLaE=;
        b=QGe9g1jraL8o72QdQQzSDwFhEXc8m75msQ7QKr1C2ZupOKqlJmlgQw8qOg+JP4tajn
         jnyYhb5/zZXobTfoQDi/P3Hd+gYJ54AHl9z4zTrh+DL4pf0FzVVbY1VK0FUQuzaIkfrX
         SLjUBUK19w750XO/Fath9iJyl1PAUFE1Pxl3eZKezYJ2LNMdoSfguk43QLxWH5+rzbTg
         P2zCsxzut2VD0aD9qXi7/I4WVO3SSrzzcuZgkLYBQuEerxJySTa9w7O/GBCLCxKQrw56
         kCTtiYHhHpLoHTo94usNTv1YmUrESoneMgEE7dJ1NBrrEIDXNlKymsbQiJIaz2pFDErB
         Y0Ww==
X-Gm-Message-State: AO0yUKUKT5OqW8g7hLdUhoAgN6vLmuWSMd+ft6CYsa2kbsZiIEIyskb5
	tqsvj51WiSX8L/hLMtfqhw==
X-Google-Smtp-Source: AK7set+Y1iJKzRGZc9BSQKQB0EEZD5p/DugJm0DBFRNc1/Aez3ovfGKN1LTYRbcO/uIRcg+nZwHtCA==
X-Received: by 2002:a05:6602:2d48:b0:74c:aa8f:1f4c with SMTP id d8-20020a0566022d4800b0074caa8f1f4cmr2975100iow.8.1679238004161;
        Sun, 19 Mar 2023 08:00:04 -0700 (PDT)
Received: from robh_at_kernel.org ([2605:ef80:80c4:7b93:58f2:478b:84fd:941e])
        by smtp.gmail.com with ESMTPSA id w71-20020a025d4a000000b003a2a167e7d9sm2428367jaa.96.2023.03.19.08.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 08:00:03 -0700 (PDT)
Received: (nullmailer pid 66044 invoked by uid 1000);
	Sun, 19 Mar 2023 15:00:01 -0000
From: Rob Herring <robh@kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc: powermac: Use of_get_cpu_hwid() to read CPU node 'reg'
Date: Sun, 19 Mar 2023 09:59:31 -0500
Message-Id: <20230319145931.65499-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace open coded reading of CPU nodes' "reg" properties with
of_get_cpu_hwid() dedicated for this purpose.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/powerpc/platforms/powermac/feature.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/platforms/powermac/feature.c
index 0382d20b5619..dd508c2fcb5a 100644
--- a/arch/powerpc/platforms/powermac/feature.c
+++ b/arch/powerpc/platforms/powermac/feature.c
@@ -1053,11 +1053,11 @@ core99_reset_cpu(struct device_node *node, long param, long value)
 		return -ENODEV;
 
 	for_each_of_cpu_node(np) {
-		const u32 *num = of_get_property(np, "reg", NULL);
 		const u32 *rst = of_get_property(np, "soft-reset", NULL);
-		if (num == NULL || rst == NULL)
+		if (!rst)
 			continue;
-		if (param == *num) {
+		if (param == of_get_cpu_hwid(np, 0)) {
+			of_node_put(np);
 			reset_io = *rst;
 			break;
 		}
@@ -1499,11 +1499,11 @@ static long g5_reset_cpu(struct device_node *node, long param, long value)
 		return -ENODEV;
 
 	for_each_of_cpu_node(np) {
-		const u32 *num = of_get_property(np, "reg", NULL);
 		const u32 *rst = of_get_property(np, "soft-reset", NULL);
-		if (num == NULL || rst == NULL)
+		if (!rst)
 			continue;
-		if (param == *num) {
+		if (param == of_get_cpu_hwid(np, 0)) {
+			of_node_put(np);
 			reset_io = *rst;
 			break;
 		}
-- 
2.39.2

