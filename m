Return-Path: <linuxppc-dev+bounces-13568-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AE2C20D71
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 16:11:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy6yH1qV1z2yjw;
	Fri, 31 Oct 2025 02:11:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761837079;
	cv=none; b=SRTZcK281tRHfGuuvJ6F5K5T3J1xQ3UNkoW9vAMljnhdYFQLaeF3h4RSnMf8XoIj30pTEVy7NEjMV7JFm4FcVwGKGZQL/h4poBhijKRSmkeO2eY+grvO0CCftL3Ws0aa5a41zHpYjY1ROh3fPy6Zm9l9B8MyLkSf0auxXCc4to6AgPddD1xUc/sbkv6ivflwx8hLx08GUSJ8QIAD1J8X87lpdakwNCFQtnCL+4RW7R9MNjqBanXM95RCUbXssxUtNWYL9I4JCVx7wYz8JPzjalZMnvu1Y3UeCea5OGynan4400lRzBU29pHlPVuJU5piPGXn9hN9e8GToofFcBIDUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761837079; c=relaxed/relaxed;
	bh=vhBRftSrNtDpB9m0SoTTwtcWSN6u49zEAs37m1LLadc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lAFDmQWWXWtZI4Mrncc1zh00rr1coutb00C4OYXkyn/w2Loy+B2I7byhN04VIkSTuur/NIv+UStclc+JHXB2/wAHqHiR99yaEOI8P0cit8FarC4ZYttTQQjQatEmZ6tCz1YVAP08Qcg0fS8gP2qFROYvFCsC3U4lws09fTurB7xr2hlvtQecG8LNF79XIp/HFbRrh+rQDt2yq5OAgb3C1O5o8C/vpZY62JTY/QUQdn6P7BA8DCy7KDxogsSJSSxd3NrHeyiveyNRN6ohosSTO41DLyn0o52Xx48LNIcznwb7BpeipN9UCUdw9gseMYeyBOCgOvPrQB3yA16L9mhcHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V3GcErzO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=linmq006@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V3GcErzO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=linmq006@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cy6yG0JW8z2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 02:11:16 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-290dc630a07so8673725ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 08:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761837075; x=1762441875; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vhBRftSrNtDpB9m0SoTTwtcWSN6u49zEAs37m1LLadc=;
        b=V3GcErzOtMtAIx6l4kgWWVJt82Ss2h9tr5YBh0qs3EjuZtgW980jOfQ5xaSecTT4HM
         8Sejk1tCn4QR4z777cKpucLol5nQC5+4oUT7G6GTZLIpBpEjJqXCyQOZFOt7/zNkvn4H
         8LZhhYkizDXLdd7tBh/YicpEw2/QcytTDqQiR3KE+zQjV0kFuIume19ygiCzJZ52tRPy
         ZFhxtBobQu8ThJFuJH+jW5MKIg+cwoZxQbsFHVVNkKjCEoGUWcR5GzUeUYSNtZdQ1J75
         2/W9AIWl2XQoWxsnBWW4WsqzyLXn0xIuvCxu8sE4gakRrqzMnqJEUnYCGZND3jN9YoaZ
         5B5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761837075; x=1762441875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vhBRftSrNtDpB9m0SoTTwtcWSN6u49zEAs37m1LLadc=;
        b=Wisr+eJQuQTdPMMwsLv9Y8kSQ4YrRzV5/6AejCiTfLOGWi5o/vH81Et46gmtEYU/14
         uUMUJ80mMn1cqp3OTDl94llBaOW4z3V/c59tVMr3AwzKMtCrzTWUgOWTjRh7rOEnzzTb
         U+EAasYT7JQjtxUJYu/nN11pYjVIfbgwCML/wRZLWFROKVeAp4IZy+Lqmbg/zd3/dG0J
         OoFLC0tsCVTd3O4RGDCH5A/9HnL/v9htcsw8vVYM3ON0tHBeLzl9OA1wf5PRl9WQg7yg
         8KkjH9lJqLByK3PS4BPd9VGvyIZxbR4TP+cKCs1YpoH0U0vIJ4/uMCFEsnEcHhE1rieG
         U5Zw==
X-Forwarded-Encrypted: i=1; AJvYcCW7e2DK6pcPqp3fmYqCtA2QcBLtrHiCvLwT+5MOgmrK5NwA7Bcqarsyv6kFTswdk0r3AJXIIeucdQWVIp4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxfBa7OXepprIClV1p7/o8Al58naJ0HcThY8uQFUrYkjWxcIf0u
	1EN1QZjzC1/shK/Ub41PCzYsxAtHPR5qL1tAXI09/feVBPSmdqfRFiVd
X-Gm-Gg: ASbGncuq9OZ2XaMuMbEZ3uStDEor5rsHLcicl3/9Iqex8tj2LIy8l1/8vZjPYKSnft8
	p/pW5kbdbut6JEeSHrMGBHvTajW1J8XVm8V7IJC4q/wjjn6kqxqS/Uzs14W/Pj9+rf51s7Ebngv
	0tQDbUTKhhXJAfKayyNbJ2xhOXtlZXtIZStqOzAZEbSAcuuvNGgXPSmyS5gm+zWPTEH1ygHt4Qg
	5R5/UqPCCyXdBXAMt6qTAHA7/tGTYyhw+f4dJNwUKcO1Jg5YDRG561CRdilBAFw8gOER/eo9IPg
	hQMJ4u50P1A6wEin/esC80MMI6g+av3SmR6he3vTGL+it8mF5ga/OLd50K2z/p/8W+V30A3dx7s
	Fz4Tsx/lwGsPXMiHP0bD9EwcFt4dnTwNAh5z83mBI8wMMgfn3LBU13Eu/xeOZ3J+i3DYiZMLGwK
	bxd24zJnSSggtv4Cl1OTBP9W0uHmUX8Ou0
X-Google-Smtp-Source: AGHT+IEmDJsPUeNmdNto41ham/oBAJP1/xDXePFvCThGXIL5Hte3EwYty2Wqj2o+ytJ+3UW61AGbwA==
X-Received: by 2002:a17:903:234d:b0:290:c388:e6dd with SMTP id d9443c01a7336-2951a34ca43mr1215835ad.7.1761837062978;
        Thu, 30 Oct 2025 08:11:02 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-294eeb94d63sm32840245ad.5.2025.10.30.08.11.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 30 Oct 2025 08:11:02 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Scott Wood <scottwood@freescale.com>,
	Kumar Gala <galak@kernel.crashing.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] powerpc/fsl_uli1575: fix device_node reference leak in uli_init()
Date: Thu, 30 Oct 2025 23:10:40 +0800
Message-Id: <20251030151043.63402-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

The of_get_parent() function increments the reference count of the
returned parent node, and of_node_put() is required to
release the reference when it is no longer needed.

The uli_init() function has a device_node reference leak.
The issue occurs in two scenarios:
1. When the function finds a matching device, it breaks out of the loop,
   the reference held by 'node' is not released.
2. When the loop terminates normally (of_get_parent returns NULL),
   the final parent node reference is not released.

Fix this by adding of_node_put(node).

Fixes: 91a6f347921e ("powerpc/mpc85xx_ds: convert to unified PCI init")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 arch/powerpc/platforms/fsl_uli1575.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/fsl_uli1575.c b/arch/powerpc/platforms/fsl_uli1575.c
index b8d37a9932f1..36624c88d5f3 100644
--- a/arch/powerpc/platforms/fsl_uli1575.c
+++ b/arch/powerpc/platforms/fsl_uli1575.c
@@ -376,4 +376,5 @@ void __init uli_init(void)
 			break;
 		}
 	}
+	of_node_put(node);
 }
-- 
2.39.5 (Apple Git-154)


