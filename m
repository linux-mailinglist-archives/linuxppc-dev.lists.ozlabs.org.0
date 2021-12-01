Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 737B4465055
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 15:46:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J423P2VzDz3dqm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 01:46:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ATpxL/9S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ATpxL/9S; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J41yP6Wycz3c6N
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 01:42:21 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id x131so24623329pfc.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Dec 2021 06:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r+n/orxsGE5Dy6sCMbDmnBv6aqkBCkukdq9o2NqgSIg=;
 b=ATpxL/9SGBxcT9ojowrmnYk93K6L8IwehM18+5jMeGHl2aXq7uUYHXaJJzsDGRBD9p
 wmsCySE+l8q5jNjcVSTINw0GxvGKR2RFlRhCzJoQeRAZ6ZnztNHcXT5FpNnLpsu5GZgw
 Pt1OfV5s1LrvZERAvTPqFeCgdkAk7xgs+1ew7Ez2Tv/7zeBpzD2J/YZ+rXeZwbdbnWn7
 sNolc4UnOT4PX1ibqh7gvswws7wxfo8uaCO+jdZsnYTupbqSZK3VzVoZJ7rp1oH1Wnk8
 oxLgiEGt3/ZCIUl3D9nRyqyqz3iGy3a7NqBJjoVk+n7dk+nE2ZchOE8uy1qRvuSHMP2V
 39Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r+n/orxsGE5Dy6sCMbDmnBv6aqkBCkukdq9o2NqgSIg=;
 b=4nh0o0uebxFHOeIfMgofoHEqFJnCAlgW8gXLifcq2fZGtjxDisG45X+BLKFJ3RB53x
 hxE1nln0PlGj05Skwhqkk69XRd5K3vZ5GjEER2rOz8+k10QGaLyxA9ZWfw9WbyUCX9/7
 0VMKM5/X/td7R8UabMDz+ccTutlk4NJRAj5AsBxTNPxnn5G65K1Uxuke5WGWeKIshbng
 FTEB3sr6P9otbyUn0wk+qBlQUBuqZ+dWxa2EmeMaYwWyYsVVHgBsswCgd2vduUu5yRxl
 6plDdtXMZn3NdEH0XYoB/YxnKIxDqSHJ9WK7ggKRsaPe4cFD3Dn4tLYJ4JuU29ikE7tx
 g6Rg==
X-Gm-Message-State: AOAM530BalAvts5Q6POtma6UZGqh2Z5hgQwXFQUX/xUBPcjsC3WwvfZD
 ecZHiuVntpr1b9M15gSEcNY8eW9EUtc=
X-Google-Smtp-Source: ABdhPJz6CFmjEnzPPfO+QKyAulNnV9tO2xN/SWnJZg2XfdNGZ5RSzaexd7Z+A6M3AfoOYh25/mt5UQ==
X-Received: by 2002:a65:6799:: with SMTP id e25mr4956574pgr.293.1638369739946; 
 Wed, 01 Dec 2021 06:42:19 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id e13sm29230pgb.8.2021.12.01.06.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 06:42:19 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 06/18] powerpc/pseries: lparcfg don't include slb_size line
 in radix mode
Date: Thu,  2 Dec 2021 00:41:41 +1000
Message-Id: <20211201144153.2456614-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211201144153.2456614-1-npiggin@gmail.com>
References: <20211201144153.2456614-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This avoids a change in behaviour in the later patch making hash
support configurable. This is possibly a user interface change, so
the alternative would be a hard-coded slb_size=0 here.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/lparcfg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index f71eac74ea92..3354c00914fa 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -532,7 +532,8 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
 		   lppaca_shared_proc(get_lppaca()));
 
 #ifdef CONFIG_PPC_BOOK3S_64
-	seq_printf(m, "slb_size=%d\n", mmu_slb_size);
+	if (!radix_enabled())
+		seq_printf(m, "slb_size=%d\n", mmu_slb_size);
 #endif
 	parse_em_data(m);
 	maxmem_data(m);
-- 
2.23.0

