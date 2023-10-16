Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E577CA878
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 14:49:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q4MChWYC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8H431YR9z3vtG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 23:49:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q4MChWYC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8Gyp4Wvnz3c9c
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 23:44:34 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6b77ab73c6fso1686542b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 05:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697460272; x=1698065072; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlLNqSZupppKfiY8WdnaqnqKZN1zYh1Is8CUScrbS0g=;
        b=Q4MChWYCABFcPVj61rzCp6tjBVNZK2ZZfMrxzNB7FMqU5j41QxYX4qXAO0Gok1gws8
         btJHhz1quMNEsSZpLZur6O5ObEO8DtQ86cYXvhZpqeahxyCAlGr0lCxcQBD1fDBS/c7h
         By38sMwqwa2ov2ApaHcZcKnjy09a42qOOAxV2gSVTsN+KgH15EaMhV5CSsPJsfGQ6dVR
         PPeq0AdP14qDSn+BHeY2jVwW6nctez1CVo4SdRgwW7Z6iJIVA1wCPRDlyTUXRqCbqUQM
         lhmg/hJUam8IDEx3w4pReeeFtyl9tNWjzm2Iq+ZblG9ESGUXqMtLfzWDI6rFVPxPNSSI
         hV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697460272; x=1698065072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OlLNqSZupppKfiY8WdnaqnqKZN1zYh1Is8CUScrbS0g=;
        b=HdLpvgeXdybWkI38USswg45IwX75JCf2B31dTwpdMIiHn42YGjYeFyPpl3AsembDaB
         gLwX6iBPPUtjwRhSHYSBOn1+9C2o8xv25n7nZGJZV7MsyyvnI14DCFpBsJP9A/yJ9py6
         Sv2vHTmsiZSzla9qDhmIzh82hkUjZoxyIYJ3nJfEvoBrfj7+Jw/Ims9nJt4S2Y4dHsQw
         jPCxXAuxQPZbUqj3cblDLHr1jktB2ytMez+526VsrYTlXub0karprbhHc4FJna2bjvVy
         ri5DXFp4cigQaQEhWga6bZsnNkDU1X7uFdy370nPHiTEn9u3KYV6LXC1Ms7EzvQ4XTOA
         ks2w==
X-Gm-Message-State: AOJu0YyOUsLTrFnMDp5CzfZSrhj5fCYtgNBebr2XXU1+ZQQHeRL4yCZp
	EcO3Pksti9vt1hSk21gp2mQNyHXY/WY=
X-Google-Smtp-Source: AGHT+IERBnj5zsGzEZkix0sE/TWaVH5BYZGfi99cuFbjPA0IPmXJiY7PI/oLhNh4fJyvmug79oAKZw==
X-Received: by 2002:a05:6a00:1399:b0:68e:351b:15b9 with SMTP id t25-20020a056a00139900b0068e351b15b9mr9497802pfg.4.1697460271799;
        Mon, 16 Oct 2023 05:44:31 -0700 (PDT)
Received: from wheely.local0.net (193-116-200-79.tpgi.com.au. [193.116.200.79])
        by smtp.gmail.com with ESMTPSA id t123-20020a625f81000000b0068c10187dc3sm6298850pfb.168.2023.10.16.05.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 05:44:31 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/6] powerpc/qspinlock: Rename yield_propagate_owner tunable
Date: Mon, 16 Oct 2023 22:43:05 +1000
Message-ID: <20231016124305.139923-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016124305.139923-1-npiggin@gmail.com>
References: <20231016124305.139923-1-npiggin@gmail.com>
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
Cc: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, "Nysal Jan K . A" <nysal@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rename yield_propagate_owner to yield_sleepy_owner, which better
describes what it does (what, not how).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/lib/qspinlock.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
index c68c2bd7b853..5de4dd549f6e 100644
--- a/arch/powerpc/lib/qspinlock.c
+++ b/arch/powerpc/lib/qspinlock.c
@@ -44,7 +44,7 @@ static bool pv_sleepy_lock_sticky __read_mostly = false;
 static u64 pv_sleepy_lock_interval_ns __read_mostly = 0;
 static int pv_sleepy_lock_factor __read_mostly = 256;
 static bool pv_yield_prev __read_mostly = true;
-static bool pv_yield_propagate_owner __read_mostly = true;
+static bool pv_yield_sleepy_owner __read_mostly = true;
 static bool pv_prod_head __read_mostly = false;
 
 static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
@@ -357,7 +357,7 @@ static __always_inline void propagate_sleepy(struct qnode *node, u32 val, bool p
 
 	if (!paravirt)
 		return;
-	if (!pv_yield_propagate_owner)
+	if (!pv_yield_sleepy_owner)
 		return;
 
 	next = READ_ONCE(node->next);
@@ -381,7 +381,7 @@ static __always_inline bool yield_to_prev(struct qspinlock *lock, struct qnode *
 	if (!paravirt)
 		goto relax;
 
-	if (!pv_yield_propagate_owner)
+	if (!pv_yield_sleepy_owner)
 		goto yield_prev;
 
 	/*
@@ -934,21 +934,21 @@ static int pv_yield_prev_get(void *data, u64 *val)
 
 DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_prev, pv_yield_prev_get, pv_yield_prev_set, "%llu\n");
 
-static int pv_yield_propagate_owner_set(void *data, u64 val)
+static int pv_yield_sleepy_owner_set(void *data, u64 val)
 {
-	pv_yield_propagate_owner = !!val;
+	pv_yield_sleepy_owner = !!val;
 
 	return 0;
 }
 
-static int pv_yield_propagate_owner_get(void *data, u64 *val)
+static int pv_yield_sleepy_owner_get(void *data, u64 *val)
 {
-	*val = pv_yield_propagate_owner;
+	*val = pv_yield_sleepy_owner;
 
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_propagate_owner, pv_yield_propagate_owner_get, pv_yield_propagate_owner_set, "%llu\n");
+DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_sleepy_owner, pv_yield_sleepy_owner_get, pv_yield_sleepy_owner_set, "%llu\n");
 
 static int pv_prod_head_set(void *data, u64 val)
 {
@@ -980,7 +980,7 @@ static __init int spinlock_debugfs_init(void)
 		debugfs_create_file("qspl_pv_sleepy_lock_interval_ns", 0600, arch_debugfs_dir, NULL, &fops_pv_sleepy_lock_interval_ns);
 		debugfs_create_file("qspl_pv_sleepy_lock_factor", 0600, arch_debugfs_dir, NULL, &fops_pv_sleepy_lock_factor);
 		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
-		debugfs_create_file("qspl_pv_yield_propagate_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_propagate_owner);
+		debugfs_create_file("qspl_pv_yield_sleepy_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_sleepy_owner);
 		debugfs_create_file("qspl_pv_prod_head", 0600, arch_debugfs_dir, NULL, &fops_pv_prod_head);
 	}
 
-- 
2.42.0

