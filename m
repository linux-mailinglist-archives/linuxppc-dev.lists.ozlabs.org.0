Return-Path: <linuxppc-dev+bounces-10477-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ED3B168DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Jul 2025 00:08:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsmYz0h5Nz2xHp;
	Thu, 31 Jul 2025 08:08:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753907287;
	cv=none; b=gV25mkEbU0iJYU2T+jZQ/izgEqCwL69IGB6om/ZI71PA2j735CPLWyto1M7UEO6tuQ05TDHY4UoUdWAUBpb6NH7SOXcYmRp3NmkVjrlw6EbgVnjtfi0eHnCEpP5sHh9hwewtUWP9tc5lR0qPtxZkxjsYX7FbvjgEn8SF2Z5me2CTf5EIuCtyIbCJe4b+g3QqeksPKAl8YKyc5S2IJFAKiBh+k6jgJqTMZ8lAms99JCDd3zrN+GGFutqfnaHf2iGHSfNzgCeGNVjJLnH/udhQkqUsK+F9CF5bAbvu/mpb4Emz8Qh/SqCafpIBRNjE7IDWza5DaqzZyG9k1V5rRueFKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753907287; c=relaxed/relaxed;
	bh=ZgDycgduAUnq/4+6cJh6R3cHxik209mhVrzWhFm9578=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F3jOX3HpryHPN73yD6kLmx9D8q2JLu+pnTk3xA66Loskhug6D1zg87Hz7y6waaKwtCt65cdJhcgtVSB55QILJ4t6ToJC0MrW/s8q4KJ2YP1VmrHfiUaeKg25HojtPyxGm23vrSMo8nYD3HThqxqjY7uxGBkVwZW96uz4kuV7mN57I7C8fCOHARGvAy5jbuiLBLndidWdiHSTvQ3HqYQBSIGbeBlF60U4FzEP/b32yUH8Ehcu9ANEdGlRykBTBuhaJimnK55yFtmt2R/iR5zu+UHl2urn+hw7BrLeBdhtm7DIA/pDO96HPd2mZtSpydTtL4CDuxLmkjU+WYuIvKSpBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bPXUrVS7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=kriish.sharma2006@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bPXUrVS7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=kriish.sharma2006@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bskLF2WV6z30RK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 06:28:04 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-74b52bf417cso168224b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 13:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753907282; x=1754512082; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgDycgduAUnq/4+6cJh6R3cHxik209mhVrzWhFm9578=;
        b=bPXUrVS7yapcUbMrfJg3KnbiWs8CFHbDxjswg8sYpaN0Kbw2U6w8SHtb+PZ3GUh1u9
         sVb5OhLrwRN5SUnyhEIbrpArlpCUj/7AGL+t6gqiPW6ZnEUOKagld0HIYQwsnF2YvMwT
         q9rn4oyOKnXcct9jATCcPQ6X4vTQHz2Nyir5E0VngS5CqEFYEKUKw+s4xHsIlDCuFmjC
         XUG25C5a/kUTKiXxOwpfMo6C3Wv5kJIGPrgJa4OYju1IrM4zfLO0rV2MGAtTzClnS0gs
         yzTkRL1dbn/oWdK6Yzwo08pjc0o4+7sjuntKMpTEXUvHIG7yaqerS0EHjrb38crvXpmR
         4qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753907282; x=1754512082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgDycgduAUnq/4+6cJh6R3cHxik209mhVrzWhFm9578=;
        b=KSrZwSViM5I9N6OyrtkHTcgp3UfV6SNfAf8eBu3CQV5JM3A528nqd18lMDmDoYtS+b
         fP7sYVBlEzjfThgk1HvHwnn8hwPTq2iiZfb4ykA/H26sPA+EVfAuNV3SCn9E2u8pMJCa
         ZanBFkToMZ/t92MvxR/F/fj6iU6owqt1B8NnWzyJ/CuNktv1ykUdK94i2sClGTc7Kw96
         AoUomk+IuNjMQE4+YNB3sG7y50n1wLuERTQrG7DrrtexvFYmgon2yBnY/nFunFvZ/Eoz
         Ppdk1pued+Jjgn1+uQ/CfFaYVXrBjlrWA1hBnFB1MvQCep/dor7bWUC/B+JspxDyqLsq
         2Atw==
X-Gm-Message-State: AOJu0YyUl4f7mYoRCDoT+r+o2Nxupa1X4G9MsKNCGPFNOZ4gXuMhDiRX
	xejR0nPU3ihxsfL61904AAn8dp3QLsuA6CaqDnEs9hRLNcBh15Yp2K5A
X-Gm-Gg: ASbGnctYzcUZlkf1gkuAghZprkoOds9VgjvpVLtz8KlCYFNOj+Z+NT4tTWtUwuT7gmA
	3Ku9Cc6vfC/xLHpuhqlq/m+5Rdg8nnxpI0bonBuVzgumYxhH6cNYvhKQm/ZlQSBzcBm2lVYzbV4
	3DGmOLhGupmrpRxnIrfzrg0e7q73EGZb5m7bTBs6FO+qaJFWDtDGDOdhhrvPo3mG1gxGSL9ZXON
	UHIXvPcb3vCHImLD8uJ/YHtYfGKnwyQAIRsZiCk2n8q/Q5woH+S5Y+OSXldlDYRuQSQ0vF9JESE
	yUIbK1XL41mdDCF0PDTKlRcehTzAkVMC7+Xaii/KUa8TC3dptGq2XhgI65q7v1GisLQK/V9aGc9
	FxT+rOI2sZFc7GV1tKegL1kGcn3fdA+XORmt2/gm+
X-Google-Smtp-Source: AGHT+IGLjgh/EtllwpcMQugZfIpJCA620ysg4LhMRyO7EP5nKjIvcOaz4ACdWsWsKJ6bRdSt2resVw==
X-Received: by 2002:a05:6a00:a06:b0:730:9946:5973 with SMTP id d2e1a72fcca58-76ab0924273mr7083720b3a.5.1753907281917;
        Wed, 30 Jul 2025 13:28:01 -0700 (PDT)
Received: from crl-3.node2.local ([125.63.65.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bc5d321c5sm812199b3a.113.2025.07.30.13.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 13:28:01 -0700 (PDT)
From: Kriish Sharma <kriish.sharma2006@gmail.com>
To: skhan@linuxfoundation.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	christophe.leroy@csgroup.eu,
	npiggin@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	Kriish Sharma <kriish.sharma2006@gmail.com>
Subject: [PATCH] docs/powerpc: add htm.rst to toctree to fix warning
Date: Wed, 30 Jul 2025 20:27:52 +0000
Message-Id: <20250730202752.8508-1-kriish.sharma2006@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The htm.rst file was not included in any toctree, leading to a Sphinx
warning when building documentation.

Include it in Documentation/arch/powerpc/index.rst to fix the warning.

Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
---
 Documentation/arch/powerpc/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
index 0560cbae5fa1..ae0280383315 100644
--- a/Documentation/arch/powerpc/index.rst
+++ b/Documentation/arch/powerpc/index.rst
@@ -36,7 +36,7 @@ powerpc
     vas-api
     vcpudispatch_stats
     vmemmap_dedup
-
+    htm
     features
 
 .. only::  subproject and html
-- 
2.34.1


