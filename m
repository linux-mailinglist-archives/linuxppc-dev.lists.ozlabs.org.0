Return-Path: <linuxppc-dev+bounces-6273-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C14A38957
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 17:37:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxSxQ6Dskz30Tx;
	Tue, 18 Feb 2025 03:37:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739810250;
	cv=none; b=Y/AYexCoP9r8frU1nBMEwXrir8sZNQsQNwSKqHig8+zudaFiUljSCTdBlEOa8k6tEEqLq0xoxVro5pttiBNuS7w4Y8htdRBz6x9j0z95gUe2x0FMMejNXo/BOfAPKmAUMsUbkboitv5818EEf70VwRdMznSh89NhK/SzWepaOKHL/NbLT3WdyXGczFTmX3weKmyKMNW+MgKIcC4V7XU9wKdcQdzw+xr2+KEU9xgOf8hda5rfBxj9TGEAEnn+VjHMCQoeIW7fyIY64N84Ns2agZWsmKrP7yGCcY3uUkUjyfuDHNlnSOvePuByXB9HoGarqmqrgt8bpgoub7x9lGSoHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739810250; c=relaxed/relaxed;
	bh=hZ36QZVLWFwcj8T2KkUEKH5QEwqEfUJk7NDzYKKZiQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BFW3JRE8rwwilgh5O/CtR9E9sMPoiciTVuIe8Je6UtrN/utbXMPlKxV9Fe0hzd7WugS2WEfcpNEEMudrrgD38JyCmlZrHwrONaZNmMJ+ZOvqk6f/X72pOYA/yVfFyDHFpNxOCs94xKpgLg8XXWvUks3sQK/l5TZC2uCFzyKMMsuR4d4U8zBLCAmQYzVtKj9QC3Fcv+JravQgpVCR2VDW9Xg8w/3GOl+7u+5J0nsVmdjhZjvUX7FmdmJDKlaFNVP8NgHTdFu6tGk0OgqSb9hp8RFviMk427h+GevJ9Y/4K7FgXvZe729TkXlHOe3nS6Q6kLtYLioFZsZqsNybYP4Epg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mVH0jVJ5; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mVH0jVJ5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxSxQ0PhQz30Q3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 03:37:30 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43967004304so21627465e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 08:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810247; x=1740415047; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZ36QZVLWFwcj8T2KkUEKH5QEwqEfUJk7NDzYKKZiQU=;
        b=mVH0jVJ5cnPLoKql2biih7qYyJxvwGDfAmNpZttKyADZAliN2gUFO53rAQsZHC00Y5
         Drfuhz3GqEHvyeudoklLk7U0fjFel6i2wXYdcT1b1j+y+rw+Rn/RlzWzpR/YAsU64qNu
         nh3NWZ69R+uk0Cy9YLMfSe4jNijaKELL4vlUJFTj0daLq1OQptPkgW/8/HMuzUk2OWUm
         GodJ8RKy2b2//leNAodpj3Dqx4p4bW3dxFDrLqQumINQa0TbtjTCsH5JplBrPRLELJ+9
         6a2zTKxx4oNAXMRJ7z2reRouSvSfSB7dmaabjBa/GjO4EusTA+C1qd6S2ImAU5C4SU4j
         lrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810247; x=1740415047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZ36QZVLWFwcj8T2KkUEKH5QEwqEfUJk7NDzYKKZiQU=;
        b=YL2d9zQfPqueBdQwrKv45HH01upV4Zcl11rU4LTO1J7SXn0oiHce91FsCgHJmnnATw
         uMZme38jAZbgZ/bU8Mdz7tRAGmwhYfBfnkB24G2bD8BKentKk2d/7b9+s6+kBNmeQIk9
         zPHjduGeq3cH7EfoHHMUod16d79S5eJsyl3tYETYWMDESMivbH97azCZDt7eSodU6Tos
         c+mfHdPDXo3tBaaB4AmMPoKTkpQfBmDXOHftJLeECNzHqqllriPV45HVig0Bfi8t9uu7
         bQQnYEOI38uUMTREQ3MZP4GfUssyuNmr4degw/onASLY5Kv1G21PbBvIa34I5QeSHcg5
         4rig==
X-Forwarded-Encrypted: i=1; AJvYcCVHr6vGHENyBXQtmVdTNW9WmtSNJbd4lsI6fisZ2w4ErQ6zkrqEQ6FNMTq5zB4lvHAKRlYMCVLMSCntL0Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzLBn1jUnH6FvnKp9kRHVfUpg2IKRaMsgRsSV1G2v97arR5usVi
	bcY45npNmaVnlQg9k3okMV7avNxYKLQm9oCz6pDMJsBGcXWcXJfG
X-Gm-Gg: ASbGncuIiBFpOy3DrV23eevAlSs9s/JxWtMWjMg9jxMuK9WG1VD6nJk/Tws7ON3Jm74
	Y3CnwKuucG/G/zsPq54jz4A8Y6JuPhb88uHf27jBAame2jMEnyT0ouQEW1m/Vy6nBlrq7mZN8xu
	eQNbj+gK6arDP0FmycpJGeYYJHCff/k4W8JOrew+t8RC/dUFSB+UeC/tPU73BPKR2KOiwiPqozO
	IZL9uzomKFiDD/EMH9ZwNtjauigk0Y10XlLU/5chUaoBepYI/fEZgoTAnrzZzgAWDycFva3axBV
	27LZiCGG9+pPESIz2V3pVCQ2CkIvLQrdGZidJ8YHIFo/AmKATAUaVczpmQXXpx4XdNVvrcDxGcV
	r6JNg6ts=
X-Google-Smtp-Source: AGHT+IEy54knXhOWSdtV9GyJZiVARzLmEOfX1F7j3ZG37VozHahpHs0vmYGUgUyc0AkFNGY48X3mRg==
X-Received: by 2002:a05:600c:3585:b0:439:5b36:b4e3 with SMTP id 5b1f17b1804b1-4396e6e19abmr89349955e9.12.1739810247218;
        Mon, 17 Feb 2025 08:37:27 -0800 (PST)
Received: from localhost (p200300e41f22a600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-439618a9ab0sm125047905e9.35.2025.02.17.08.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:25 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] bus: mvebu-mbus: Embed syscore_ops in mbus context
Date: Mon, 17 Feb 2025 17:37:09 +0100
Message-ID: <20250217163713.211949-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217163713.211949-1-thierry.reding@gmail.com>
References: <20250217163713.211949-1-thierry.reding@gmail.com>
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
X-Spam-Status: No, score=2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled
	version=4.0.0
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Thierry Reding <treding@nvidia.com>

This enables the syscore callbacks to obtain the mbus context without
relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/bus/mvebu-mbus.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index 92daa45cc844..1f22bff0773c 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -130,6 +130,7 @@ struct mvebu_mbus_win_data {
 };
 
 struct mvebu_mbus_state {
+	struct syscore_ops syscore;
 	void __iomem *mbuswins_base;
 	void __iomem *sdramwins_base;
 	void __iomem *mbusbridge_base;
@@ -148,6 +149,12 @@ struct mvebu_mbus_state {
 	struct mvebu_mbus_win_data wins[MBUS_WINS_MAX];
 };
 
+static inline struct mvebu_mbus_state *
+syscore_to_mbus(struct syscore_ops *ops)
+{
+	return container_of(ops, struct mvebu_mbus_state, syscore);
+}
+
 static struct mvebu_mbus_state mbus_state;
 
 /*
@@ -1008,7 +1015,7 @@ fs_initcall(mvebu_mbus_debugfs_init);
 
 static int mvebu_mbus_suspend(struct syscore_ops *ops)
 {
-	struct mvebu_mbus_state *s = &mbus_state;
+	struct mvebu_mbus_state *s = syscore_to_mbus(ops);
 	int win;
 
 	if (!s->mbusbridge_base)
@@ -1042,7 +1049,7 @@ static int mvebu_mbus_suspend(struct syscore_ops *ops)
 
 static void mvebu_mbus_resume(struct syscore_ops *ops)
 {
-	struct mvebu_mbus_state *s = &mbus_state;
+	struct mvebu_mbus_state *s = syscore_to_mbus(ops);
 	int win;
 
 	writel(s->mbus_bridge_ctrl,
@@ -1069,11 +1076,6 @@ static void mvebu_mbus_resume(struct syscore_ops *ops)
 	}
 }
 
-static struct syscore_ops mvebu_mbus_syscore_ops = {
-	.suspend	= mvebu_mbus_suspend,
-	.resume		= mvebu_mbus_resume,
-};
-
 static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
 					 phys_addr_t mbuswins_phys_base,
 					 size_t mbuswins_size,
@@ -1118,7 +1120,9 @@ static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
 		writel(UNIT_SYNC_BARRIER_ALL,
 		       mbus->mbuswins_base + UNIT_SYNC_BARRIER_OFF);
 
-	register_syscore_ops(&mvebu_mbus_syscore_ops);
+	mbus->syscore.suspend = mvebu_mbus_suspend;
+	mbus->syscore.resume = mvebu_mbus_resume;
+	register_syscore_ops(&mbus->syscore);
 
 	return 0;
 }
-- 
2.48.1


