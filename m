Return-Path: <linuxppc-dev+bounces-7178-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BA8A67559
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 14:40:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHCfC3KbLz2yrc;
	Wed, 19 Mar 2025 00:40:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742305251;
	cv=none; b=N/EFhymLeMISwh74VOnz7ChPc07qfYEHuY8qMPFmqssQuKDwC1bcv44P1pQG/pvF5TaS83d2/QM9s2dmUQyq4nwIC+OJfBqz3tuIo3DpkEVEU7YtoG0jyAiIYBANKa8RYjgj1Rt3cJD4mWYnX9ikgU+02cHUWJmmdHeonbpnxKwSsuzGE2U+kWR3cBvB9DCYlNjIA+J4oElG09Lylkcao7PB21QGR6WEIJ81O5pL36LVUWbzWIUjTFdnEn3wrWPy9mNLz5WHCYR4NBnwn/mooBt6PUAxAlKY6WYLZv9eW70qVIBHJ6au7Lz8VHtOvCGeTjCXm4CGyi679DcTblKJRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742305251; c=relaxed/relaxed;
	bh=aZj3KuC03PFBqju3wnCkyQiTc2XQbkQIR4Z+AXZ4ih8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dQU+sXyKdtGXu57ovlzFBZVNw5r2O/t5jfNyyvLtGcFmzEgu3jS8b6GtvGCDY2kohTqQ89Sf//Y2GtF3BpVONTqa8EWdJ0j4K9VbYYvgcMdVmHwLbo4PIKwo84+/V9i0YQo9RnbVwAAEjq8/nvAtrzKfrt1BU3n8ZwOje0kUok/2EfFaZvfIe+Fj2r4oyHdkjB6XB5vOxL1kqQzLfqN0mq6gkCztjuLvsawWiBp3/LSzfrpjcvEAK92yHbVbi1g3F63yrFvBHxE32k4xI9944b9zzv+hZddnr0ry+epgrMTiHmvcu6gzdSyCLLQDCulgjc1VXT+5yNicsY+sFXkHNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LQ1rQn1p; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=linmq006@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LQ1rQn1p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=linmq006@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHCfB06W0z2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 00:40:48 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-224100e9a5cso107404685ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 06:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742305247; x=1742910047; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aZj3KuC03PFBqju3wnCkyQiTc2XQbkQIR4Z+AXZ4ih8=;
        b=LQ1rQn1pgwerMLRVBXZF/tQnv4HkiAeb8xzXwB8wNGWyNQCDarplR2AJdFctZExc1d
         bsjucY1RNE9GtzFvgSbgNh6zpbPNvZlcwr6VRdWMsNPn7uL7XBawX5dn2Do5RMpuz9aB
         luQKhjtJ/mvzJ5jiR3zj9zcWtCeL80UDaXbnRaIOZRuuqIsKUGq8gb5Rleju/3KG2Ub9
         KzBSt6IW4GpohrVyVF0Wv2WDb83RSQvy/5FF8Rcq6SaZP8Mke0/X6nCqO48NOHx+ccFf
         +rkJP5MYKTDz35ZM3ST8hRmQNfE+LNthk9p12zBmjiPGkdWyFhgi3k8wnggad2kFsBqQ
         EtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742305247; x=1742910047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZj3KuC03PFBqju3wnCkyQiTc2XQbkQIR4Z+AXZ4ih8=;
        b=Dv/jQyp/VSi8Mp0bHLaLaiPRjTvWB6ajOx2/Z0tBEaXOW2419pWKtoAgDVbu9c/Y0I
         /okJyC/PQZPcLklLd0taz/atqHrbkwBLqjRciIKZQH4UgQZAo0fk/Qssr4lS1NlnlIJa
         wLTs8Rle55zghU1JEYYnwasX87sAvmRDcihCg3OsIGYRql0CshriHEtrSbS59Zyp+h+k
         idDQMZ4JSydgHfKcRl3JwXHyyIQ/Fi/PKepjMBwrfWStG+gTEX6Uqhbm3zXYv3ueBN19
         nVbsUF0e4T2AjKlzxMnTPzxMPTY6IoO3ondvZvJwSSQT82AoAHbMCpXgtAcotA7UNHB6
         SrRg==
X-Forwarded-Encrypted: i=1; AJvYcCXV/KhWhChmuP9uq95AuJb2ylY1GYmRXbhRwTmPqIQc5+qR4WwfTH82hc9FaLzHQA7O6Dzt88NqN083uH4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzBoR8+hRLzxdnfKE2+iuMKqbJAUeAoteY4AniTx4OZAIdi+bWP
	MmOHZ2XlSOUHrYZTioW+1djyL+G3dJyU+mnIZaI56G+FzLHR1Nkz
X-Gm-Gg: ASbGncveB8nPd9m7v+nTIS1cGvcVmtbGuuK1YvQL87p9jcRbE3ETv3GHSI2sb8R0B/8
	+muMGUK0CVnJnDw/EUyM4ZkYtV9ea7+JOZC++a0peMIayhvVoPN2in4ed3557wuKRGCbVHNKaUm
	5iKeoaIaVPm54hiFaCW0w9D/S1gh6m49usUX4ct4z5ssvH/TpNo+MtqFvBjO7LsnoYiCFb/TyzB
	TErO5Ct2eZcKvbseNpK36drMmsvRhS0N05Bbce04QC1yLHaXXVWsfJf9nZpD2dF628y74VnroSh
	3ZaFjEYEYmgR+zUTDEzE7SxRzb7QCcAje+icxixBTAUOJb0MlaBkf5UFf0ObM3MDCnNz
X-Google-Smtp-Source: AGHT+IG4tDji1GK1wb+fgDYp11lB2kyT2SCHhxUNKyzbUpBipTdms3Arj0QRQHVNT00u8FD3uJMu1A==
X-Received: by 2002:a05:6a21:6da6:b0:1ee:ce5b:853d with SMTP id adf61e73a8af0-1f5c1336549mr21452548637.39.1742305246821;
        Tue, 18 Mar 2025 06:40:46 -0700 (PDT)
Received: from localhost.localdomain ([183.242.254.176])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-af56ea7cac1sm9029751a12.48.2025.03.18.06.40.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 18 Mar 2025 06:40:46 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Paul Mackerras <paulus@ozlabs.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] cpufreq: pmac64: Add missing pmf_put_function() calls
Date: Tue, 18 Mar 2025 21:40:38 +0800
Message-Id: <20250318134038.16759-1-linmq006@gmail.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fix reference count leak when pmf_find_function() fails for one function,
Add missing pmf_put_function() calls.

Fixes: 9a699aefa87c ("[PATCH] 4/5 powerpc: Add cpufreq support for all desktop G5")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/cpufreq/pmac64-cpufreq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/cpufreq/pmac64-cpufreq.c b/drivers/cpufreq/pmac64-cpufreq.c
index 74ff6c47df29..9a5a4fca27f0 100644
--- a/drivers/cpufreq/pmac64-cpufreq.c
+++ b/drivers/cpufreq/pmac64-cpufreq.c
@@ -412,6 +412,8 @@ static int __init g5_neo2_cpufreq_init(struct device_node *cpunode)
 		of_node_put(root);
 		if (pfunc_set_vdnap0 == NULL ||
 		    pfunc_vdnap0_complete == NULL) {
+			pmf_put_function(pfunc_set_vdnap0);
+			pmf_put_function(pfunc_vdnap0_complete);
 			pr_err("Can't find required platform function\n");
 			goto bail_noprops;
 		}
-- 
2.39.5 (Apple Git-154)


