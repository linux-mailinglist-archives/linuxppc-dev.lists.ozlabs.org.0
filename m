Return-Path: <linuxppc-dev+bounces-13526-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5EBC1C1A8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 17:34:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxXr222B1z3cZb;
	Thu, 30 Oct 2025 03:33:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761755634;
	cv=none; b=gR5GWv1hM7op4KZD/61T4yT/CnLVgwSrGDQ4hd9IzSNVI+FE9pgFgP9/YvmGm/+Yi3wZ/9jso8uUd+U181xuF1RjbV7tQtSlKVq4b4gZpPrmxEhy+OFc2hzCszS65gEvWmbZMXycuc/ro5/F7cEq6Kp4Kgk9wbkWdCU8y3z1pFO2OmCe7u/uijT9+HqLws5gCteFRZRqI6CzFGM68hDaw9Jenz35KGLcyVtvC4hP9QRJ96sN+2y1In1797nio4xs+ddZM97G0vLOwLT4wvyudg4Sc0JAQ8DjqBIzlvYbapbpP2j97g8S4AD7s8Y0bQEs38yCqCwIOnUhOkl4iTVTLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761755634; c=relaxed/relaxed;
	bh=8XbRLU+7LExsM1Q2W4kgKdkH4Wh0K6zsU36k2L5dwa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P28wVW5bYEbZp57gtyY0I4JKnEzBPV/A+L6yr+yQNR16Q9vmZzANK3bnMv+az7/Wa4pYrOx3qRK6J3FJubYmBqC+y3Pgf4JxdI9iUl9wKJpvBc13zfqPLWVmdVLthtwVtwTHxnJy06mLBZFYF4t3bAu4R7jsMfB9HqRiD/LCklFDO/XXV5/H4XZu+av24CnbyCeyrQmUgUVkk9xLlfA39b4QQdB+eLAnorcykdJsVyoN5nB/gdR596FoGToW7rhf2kjVQilsjpHialmnLk9mPeGafNR5bm+bQ+nlYTvwgUYui3NjbN4aK5cp9oyiaimmiBZ+3FsLevVKa+dSRvQGNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G94Bi78b; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G94Bi78b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxXr129fRz2yrm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 03:33:52 +1100 (AEDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso15654766b.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 09:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755630; x=1762360430; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XbRLU+7LExsM1Q2W4kgKdkH4Wh0K6zsU36k2L5dwa0=;
        b=G94Bi78bFN81Jez5MRXRrivDca4e39UW4DaXVVSNGJe5uO96eqr9D6Y3vET3JOVt62
         fKmnwBbi2L1J8325JRkF97vdHRbEDAobZIEp/+IQB1xhvwekDlzbywzTA4SKlCYHy13A
         1E0NBstKqtCCLgFsYh3l8Chl50+yBOxtbCvkvzI7ayfS1tAKE6t3/LROW1DME292Umzo
         Y5GFBeMFJLZOfm5Le+8hvP2nKyfEENw+++HxEMl3rCYIFMrH6pnSGRjtuatrbwXY6XiY
         v+nhW23E7LHuRc3psQ49gWgkKNtvp/nX8fVX8p6AUvRyXYRVXOOWpgoOmKI2gdPzdJJ0
         kA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755630; x=1762360430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8XbRLU+7LExsM1Q2W4kgKdkH4Wh0K6zsU36k2L5dwa0=;
        b=f//2nmdeRysnCjqvzp8zuHH3j28a1aHE+aHmZpL38aB5o2xKgmxdNVp+XOzN9ZVC76
         xZOMA/GP4fyH3hQ7L8nMx4wf1KuxvZBnXD8EREhNilCYgEcNflzldI33CyvmOyUtob2Q
         m3qZgnbrGHk07m33pSWXLgk/aRZOy/Njhe9jSzlcRxeqVMiOIciylRvdgHftTNxgJzGY
         6deZDHF7OMiejxpG11h9NBjIQkfKVQjt8wS/zEtmSQmy39TUeVwNXdWATwlvnGAap/Kx
         Uw/o2Yy0VGj3fXWJyFZbS46vuRPj/PyCj082nNL0UjLO8DYTQpcvnxZX9f2ooCBz21hO
         yevQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2RJwTpyZvd4A42WTp77uL2znhGL2I993BQpKUn7yQ1IrBedSTa/1iNq8IqNKAikb32o6egVxTLPgRrb4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwbQCrMrNXHXp5uKC6CCigfT/dF8DQLJuWOPTLhBfnVhYLmWQbO
	QnDPO5I8H0590v/MwDFwm8dD8q7xFCEZFLpjhELM1P/y7109ojDdVrCK
X-Gm-Gg: ASbGncu0Lc8Wtw68q/oVjDUFZoisYwr2ZnN/mfI7s1gJnIxKp1y7rjlMxXzSdcccZeZ
	BRFrs2TrtkFk+QYQPCXxgYFkHmUxzB714MtYWdnDQpD1a1h0vktIXYXxqX5tR/Snx8pmMlciAwu
	WVq70l/vFw2HUxFKQEVmFA1mnPh14slwHXoKl7vHM51bGZIubpmzxxTpuySsrFqVOR3XBXTTZZC
	ThfxAV+Y7d1S9LZz6cWlvMQa0ETBSli6BUPjFs5hyGOGZUwj1ecI7m9+U+kooEq2OpCfB54/Jan
	JkrvkFoh5y9Aj1LtcvscWS+Sllq68vnWH/2eeiePeEgQ9DxPxGbX0fDdnaXBxgIFN1sMgshp4AN
	Av6hBuH8OBxbcfYpC40UW84crVAeoXSE40ZqfdfDUAVBcNVtLXGanS9e8+KdnSoWsABTLxoIQ/k
	Zgg03YMk/ENXLceE839c49RFn/rT5VPy4tXoVZ8cQokygdCLxCMuE3dMqbb2N15xO12eNX
X-Google-Smtp-Source: AGHT+IFQlpirQWvqETIaDsilJH4sjQW05iHSTqO+BVFy04krtNR3muOIO8OYFK3MmzGZwCCaLhUORw==
X-Received: by 2002:a17:907:1c8c:b0:b3e:580a:1842 with SMTP id a640c23a62f3a-b703d557003mr393915166b.48.1761755629552;
        Wed, 29 Oct 2025 09:33:49 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6dad195456sm939661066b.72.2025.10.29.09.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:48 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
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
Subject: [PATCH v3 3/7] bus: mvebu-mbus: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:32 +0100
Message-ID: <20251029163336.2785270-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029163336.2785270-1-thierry.reding@gmail.com>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Thierry Reding <treding@nvidia.com>

Pass the driver-specific data via the syscore struct and use it in the
syscore ops.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- adjust for API changes and update commit message

 drivers/bus/mvebu-mbus.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index dd94145c9b22..d33c8e42e91c 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -130,6 +130,7 @@ struct mvebu_mbus_win_data {
 };
 
 struct mvebu_mbus_state {
+	struct syscore syscore;
 	void __iomem *mbuswins_base;
 	void __iomem *sdramwins_base;
 	void __iomem *mbusbridge_base;
@@ -1008,7 +1009,7 @@ fs_initcall(mvebu_mbus_debugfs_init);
 
 static int mvebu_mbus_suspend(void *data)
 {
-	struct mvebu_mbus_state *s = &mbus_state;
+	struct mvebu_mbus_state *s = data;
 	int win;
 
 	if (!s->mbusbridge_base)
@@ -1042,7 +1043,7 @@ static int mvebu_mbus_suspend(void *data)
 
 static void mvebu_mbus_resume(void *data)
 {
-	struct mvebu_mbus_state *s = &mbus_state;
+	struct mvebu_mbus_state *s = data;
 	int win;
 
 	writel(s->mbus_bridge_ctrl,
@@ -1074,10 +1075,6 @@ static const struct syscore_ops mvebu_mbus_syscore_ops = {
 	.resume = mvebu_mbus_resume,
 };
 
-static struct syscore mvebu_mbus_syscore = {
-	.ops = &mvebu_mbus_syscore_ops,
-};
-
 static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
 					 phys_addr_t mbuswins_phys_base,
 					 size_t mbuswins_size,
@@ -1122,7 +1119,9 @@ static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
 		writel(UNIT_SYNC_BARRIER_ALL,
 		       mbus->mbuswins_base + UNIT_SYNC_BARRIER_OFF);
 
-	register_syscore(&mvebu_mbus_syscore);
+	mbus->syscore.ops = &mvebu_mbus_syscore_ops;
+	mbus->syscore.data = mbus;
+	register_syscore(&mbus->syscore);
 
 	return 0;
 }
-- 
2.51.0


