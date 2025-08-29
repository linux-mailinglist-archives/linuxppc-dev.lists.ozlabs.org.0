Return-Path: <linuxppc-dev+bounces-11466-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A95CEB3B37F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 08:34:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCpQw3B8Kz2xK4;
	Fri, 29 Aug 2025 16:34:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756449288;
	cv=none; b=E90c2hnJ9NXkmgngPd/QGMVdlWwjNOcAQ/HHuCz/5qolCN0sVvXP/8f6Q/KeczKwcjH8u5zsPwIRUJSKRoBTEwrEFuERkWoh0gdAYmKW+cg/tKi43gQbJq1gDqhjTDauXT/jug1tw8s/FAj55wSCohHmxxpIPNk2broDs1/Ys0TdbWNLvWYJqewwF1Xjgi1mE060IAVxMBUjimz5nqU+dYi6kBkPhqtbtd3NGPTP31FNkOZfEEx4OcGBL5J3J6ULI7bLc06aCLNjw7E8RBNjscelUSlFeakh8oZuZP/H9ToxdIzjm2VEA8lqThIGTgFY81I8w4BWe0l9GPcYTOoCMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756449288; c=relaxed/relaxed;
	bh=5Uk9A/FG7B42gb2VzW8SPYRISI1iCRcnu9NRgkgqh+M=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=B372pYAHa31pGkNiQLDQLzJiEiKYrR3DJrfBp9mTmKpdWGHERcg1idGsayLJ40rOmKHgk3Sf4raysRJVkexOW3pT99OuWsoQKs4iroDe5jfxa/sZsCUtAFiRD4IVQfa25EzMUJK85XErkDCDLrTR/Ls5SUvgsh3dK0no9lJtk36EJdAxEu0kH95fEyNb5v5aNrLUldYouKe29hGRir9uxFS2PEVkGdOHR00/N6M4b4sG0ubhEpReLX18Za7lSg877+437hw97iXemuB2mUzgZElSWqKcicNadf17ZRU+AlGZLPbLvuxorODh4JA0XtJQWBXkfwi97TlaQ0PEKnB0ng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C4hNAA0W; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=linmq006@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C4hNAA0W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=linmq006@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCpQv0yj3z2xWQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 16:34:46 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-248ff5cabe0so5524685ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 23:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756449284; x=1757054084; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Uk9A/FG7B42gb2VzW8SPYRISI1iCRcnu9NRgkgqh+M=;
        b=C4hNAA0WrbwrfknbUJ6sqC0fLjaLrN2my0uKx4pGfKZ/pF1reFh5vr1gA14CY+WDej
         KL0QQV8QqKYMMTryToQQyhphczIq6rNzGsf3OHsxLooYFsNzZKdlBGbBaGklqs9576e7
         cdXvuxcQoW0fuWW/ZXMIJM2A5+3+glRkSEKqifZHblBN/8JN3JFvx2rIXqKYMlsK6wpN
         eAeMKjAyz+rbrw8rTf1Oyfzhsb1Z7RoptUhaOIlmZMRELVNzyX7pn3n68DeqfEBGXGXW
         yD7LPdxgEkik1ZPdlnNkT5jH+DT1QDu2ty7F4GXpfULg7tjluFZNbhvL4MZBCD6g4Br+
         kiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756449284; x=1757054084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Uk9A/FG7B42gb2VzW8SPYRISI1iCRcnu9NRgkgqh+M=;
        b=UDOiapgFJaJ4yGvox+rpsRxFxQPGxkoHDe/28rkPmbYshFjOWMJUHzs5jQTZKoNRNa
         DSWNHckFL1yWqWffAbA2ShZbaqTLeCCoW9BRkGRN4fkClSU0YHJLSWmJvWjlbw3Y9lc4
         RYvGT+2mM0E+Sl+hk6ZnOS7QFtzTaRyWI++q9JxfxajNLuQOghH4s4KlLf5SF4NOlUmc
         dD3aV+RO5oq3Ket3GJLVZxgvAy1Si6K1euOS0tAUmRLXhe3rVPSdDI9fb6lARTIe6w/H
         0Wo74Is88Qg/Il7OL2dg9Ua72Dj72bu6LufWiMjDYft0ypRUSusuZavEGVJEiP4FSJjp
         bRaw==
X-Forwarded-Encrypted: i=1; AJvYcCXTJq5ItaEaolcezR6c/c6OLXlBM8w9bGVZluPklUtBR4zrM6jhllGzzJo9yxhfEs3Om9g4PBUod2Yfls4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxwxmMPUkvNLCIPJEZNwsTQLAusds1ely3e3iA/Uqu1pDmDolkL
	mcpxzAD8eb7/X3AhqjE8lVldZYPtl3D022YuEU1Hb89w6tIwxZPskE98eLcMyzVbBvwAdV6+
X-Gm-Gg: ASbGncuABvrfSiMgtGhzRRT3xs/zOc23oLyALs9DGxxKyATtQczCjLKepKFjh36mPm+
	IwQW10Ze6s//X01iwd8JWuPpd7USjve9KKsdAJI4ubNgNBoSZIlpGdOGLn6RJiX/LHb+vpNbGMC
	opxUrbuiHZLfxIjl0ifnG5wndpG65khSExPamGWGNOsQUQ6f0/bkIv+Y4iJBJCMbGeL0maWoobv
	JmUN8UXlk3Y66/REVYCqw6QX2t8tkZqcSE5I/wEWz7LZSBgIhFJv9TAZHHiBu98/ru2Vzvx9kaF
	5M13BluT5lgegV4nXw0pQROaaw+u7iLNrV/7xQP2PCpfWoW3+CZtHX4cn8xJqa8UAlklmvidkCv
	Wuc+qGeg9s34M5LxcVylSoFADb5JBR2guZGHkqjmjFC7ViMAqeStrhJo0clqNj5UEEhIpfxH7D0
	f2iT9N+Vsy2RT86WswVwoyikfI04AYCSHrR8tPVASTC7m/Zg==
X-Google-Smtp-Source: AGHT+IEi4c1OOUaryaWljuCN1SqnkkZwaSknWakF2y1Fc4MSZv9q8cyL3Fs0HmaehVnQcEVjzHb6GQ==
X-Received: by 2002:a17:903:388e:b0:23f:e51b:2189 with SMTP id d9443c01a7336-2462ee4579cmr353046335ad.17.1756449284029;
        Thu, 28 Aug 2025 23:34:44 -0700 (PDT)
Received: from vickymqlin-1vvu545oca.codev-2.svc.cluster.local ([14.116.239.36])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24906589986sm14035695ad.111.2025.08.28.23.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 23:34:43 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Miaoqian Lin <linmq006@gmail.com>,
	Jeff Garzik <jeff@garzik.org>,
	Olof Johansson <olof@lixom.net>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/pasemi: Fix PCI device reference leak on error path
Date: Fri, 29 Aug 2025 14:34:29 +0800
Message-Id: <20250829063431.1968903-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.35.1
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

Fix iob_pdev reference leak in pasemi_dma_init() when dma_pdev
allocation fails. Ensure pci_dev_put(iob_pdev) is called on
both success and error paths.

Fixes: 8ee9d8577935 ("pasemi: DMA engine management library")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 arch/powerpc/platforms/pasemi/dma_lib.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pasemi/dma_lib.c b/arch/powerpc/platforms/pasemi/dma_lib.c
index 1be1f18f6f09..0ba05c39c276 100644
--- a/arch/powerpc/platforms/pasemi/dma_lib.c
+++ b/arch/powerpc/platforms/pasemi/dma_lib.c
@@ -530,7 +530,7 @@ int pasemi_dma_init(void)
 		BUG();
 		pr_warn("Can't find DMA controller\n");
 		err = -ENODEV;
-		goto out;
+		goto out_put_iob;
 	}
 	dma_regs = map_onedev(dma_pdev, 0);
 	base_hw_irq = virq_to_hw(dma_pdev->irq);
@@ -617,5 +617,9 @@ int pasemi_dma_init(void)
 out:
 	spin_unlock(&init_lock);
 	return err;
+
+out_put_iob:
+	pci_dev_put(iob_pdev);
+	goto out;
 }
 EXPORT_SYMBOL(pasemi_dma_init);
-- 
2.35.1


