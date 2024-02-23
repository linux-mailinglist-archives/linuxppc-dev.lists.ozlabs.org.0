Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 064BE8614CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 15:54:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R4Yn9mTo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ThChQ6hJ9z3vZF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 01:54:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R4Yn9mTo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=colin.i.king@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ThCgh5GgWz3cFf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Feb 2024 01:53:36 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4129833e069so565975e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 06:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708700011; x=1709304811; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s/a+7Lbr7oxAEnMW9lRS2BPIWRChV9WXDE8CQg9Hrfk=;
        b=R4Yn9mToPcJXTZ9NikG1FyFoH4WbMqMm4XFxaEdEfjTaDAsG8SKug5cFOrp/HB//D8
         zHqCJtQFkoFTmPcimHKIi6eqR4x02qgfQOM9vRBqwat5W/8NionZ1g+dC2tHWg+lHBXB
         B0e3un9GkaUMmn7XxcZTqE+PnpSb90zZG04B7D3q03/mObcDm6mbVVDq3v+AWDQlpnbU
         qJd7scRWF6WPbY4dZphnkvMPSC9LMHUXvO5yuEHIvKKHDotwnI8Ww12IFa4pQsIfgVzR
         MF6KgCxNCLFgUmplkTXyE1HuS1+/LHI1fT1OUQ3RKWOeFVlAYowMihp+9Fm9lGsR1df5
         Xd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708700011; x=1709304811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/a+7Lbr7oxAEnMW9lRS2BPIWRChV9WXDE8CQg9Hrfk=;
        b=oNPTs4ANIOvIHPSRT/GNBN74aUNXGlHiXaOKkvCQBs41LJGc4sH9wuL09PRHOcmQoq
         24OL080z52swWIBZSaj/4CfY5MD6kBjHidDQbtT3K5eYXIdzgwhr2r8+RY0jpZs/K4XU
         a5zhgwwjf777atdoH7TNC2apvv9j3QYfOiA9Cvq/bs/HJ16teJie+fMWQy/0/LntZ5Xu
         OWwiHi3LDdpVkDvW8yOqnXkarkMcvHQDixXOpYQ3+qEyAbpUSrdZu+64rb6iGr6baB9U
         MxIVr/SX3ncdx/58YpB/DUgPIqkzxkh+YKKf6rYDYFTGpAM21lRq5qAmNDEjkIbDvuaW
         dNIw==
X-Forwarded-Encrypted: i=1; AJvYcCXUFtrlDxCgLEBs4oiOg9ThpZYYx3dh2Sc5PYVA+5CJXdqTwBs/EO/tOS3q97DrjWsTFKNkXFNc9/UFScL6TRosAOdpzv9UZpoBcwQbJg==
X-Gm-Message-State: AOJu0YylMd2uHzMhGIPrZ6EJMKDssqyiFAIZvxVTIlHc9+Y/EUXm/EUM
	4oJ2ysMMhrYE8XVTHL9nKcMi/u0vgxNFX7AQSfLH1Wbe5bTPdcMQ
X-Google-Smtp-Source: AGHT+IF35jagaTTZ5yDNpFhVTYaG+pRkNtNOoRROuGdHT169YIqL9YMhI6h0l9YJGvPC1RWOYJUXyw==
X-Received: by 2002:a05:600c:1389:b0:412:952d:3c6a with SMTP id u9-20020a05600c138900b00412952d3c6amr44821wmf.13.1708700009287;
        Fri, 23 Feb 2024 06:53:29 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id t6-20020a05600c450600b0040fdf5e6d40sm2686953wmo.20.2024.02.23.06.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 06:53:28 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Roy Pledge <Roy.Pledge@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH][next] soc: fsl: dpio: remove redundant assignment to pointer p
Date: Fri, 23 Feb 2024 14:53:27 +0000
Message-Id: <20240223145327.3909835-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are two places where pointer p is being assigned a value that
is never read, the pointer is re-assingned later. The assignments
are redundant and can be removed.

Cleans up two clang scan build warnings:
drivers/soc/fsl/dpio/qbman-portal.c:662:3: warning: Value stored to 'p'
is never read [deadcode.DeadStores]
drivers/soc/fsl/dpio/qbman-portal.c:820:3: warning: Value stored to 'p'
is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/soc/fsl/dpio/qbman-portal.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/qbman-portal.c
index 0a3fb6c115f4..03cc374f11d7 100644
--- a/drivers/soc/fsl/dpio/qbman-portal.c
+++ b/drivers/soc/fsl/dpio/qbman-portal.c
@@ -659,7 +659,6 @@ int qbman_swp_enqueue_multiple_direct(struct qbman_swp *s,
 
 	if (!s->eqcr.available) {
 		eqcr_ci = s->eqcr.ci;
-		p = s->addr_cena + QBMAN_CENA_SWP_EQCR_CI;
 		s->eqcr.ci = qbman_read_register(s, QBMAN_CINH_SWP_EQCR_CI);
 		s->eqcr.ci &= full_mask;
 
@@ -817,7 +816,6 @@ int qbman_swp_enqueue_multiple_desc_direct(struct qbman_swp *s,
 	full_mask = s->eqcr.pi_ci_mask;
 	if (!s->eqcr.available) {
 		eqcr_ci = s->eqcr.ci;
-		p = s->addr_cena + QBMAN_CENA_SWP_EQCR_CI;
 		s->eqcr.ci = qbman_read_register(s, QBMAN_CINH_SWP_EQCR_CI);
 		s->eqcr.available = qm_cyc_diff(s->eqcr.pi_ring_size,
 					eqcr_ci, s->eqcr.ci);
-- 
2.39.2

