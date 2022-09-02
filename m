Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 172405AAAAA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 10:54:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJsDD0d82z3c6t
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 18:54:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Fyeb5HKe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Fyeb5HKe;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJsBz2ffPz2yMk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 18:53:30 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id z187so1226950pfb.12
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Sep 2022 01:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=yQ5q39OTBMi5TQEbz2z1PxqFvL6ZGx9KNvxZc2/zNwc=;
        b=Fyeb5HKeCLWeAClrcV+fo0uATPj1e0Wi0Q5rNhqT6hIzCwIlUuVDHT1BtFeUkay49e
         Agz2JAUj201/Yr+o4YzjXrmZPUD4R7H17zqQgkWyWa8yJKXE/mHdV3i+4IvhNBL4G/dk
         kwMdrfyry9vaCiIyuDylQ3LDhg52pESELkDMI6xPLzu15Xq2QJ/c57ETSx5kkPCLm51p
         BaBN9XgL2RSrhJGFHDgCJN91Kbg32UguYWhZG4GjAspzpUcjEA0wiwhRrzUlV9sa2mzR
         bl5WjQofmPiWce/OL+U5WEmCFLnZ9Pme5XQVPrf1v37BbZ4yurRC2IbbSq6inBdXOApq
         gw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=yQ5q39OTBMi5TQEbz2z1PxqFvL6ZGx9KNvxZc2/zNwc=;
        b=yoCUYtbUg7KF5mun6lcaDbrxetUO/irt3rNnhEbuqgU7TouVkivzt+BQSIdqiJ/MlF
         jM0E0/EONhaFil7TT4OQfozGSBjyup+BpUXiKNJoARXogenIw2SN8maOyBmmCre7tIR8
         8zxdIxcMonMSau0Xr4ZLRItVGOjMR4qakoWH9q/vBFbHcGEmcgVyiNeRtaiHLZCihxGc
         x7GSUneqBh5xjOVKxN/8Y6BOuK+gF8QIM6Aos5jwD7SQq7faoa6qTjEcvChOzUZobJpB
         WGCNkPu5WcQHVlZpqIbb1EU7f/+22Leiw+zp1PRGZG6G5dX/Toz/H6/HFvgmPpg/TYeZ
         ptCA==
X-Gm-Message-State: ACgBeo10V1Q2Jg+1qBuOsNZgulBh7qE9UluuH/IBSwYk9ObnjHHhYZe0
	q8+qF7zvIHv0YSuwUtVajFubuvG5mm0=
X-Google-Smtp-Source: AA6agR7L4gGP75L+pBF6RNjr+J2gwj8XvjEDkcv9ciQK1U6UDR2BIPgXDenwWZIq2hn7mdRNlyCekA==
X-Received: by 2002:a05:6a00:1a14:b0:52d:5fee:d46b with SMTP id g20-20020a056a001a1400b0052d5feed46bmr35375453pfv.82.1662108808845;
        Fri, 02 Sep 2022 01:53:28 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.239])
        by smtp.gmail.com with ESMTPSA id y4-20020a17090322c400b001750b31faabsm1039130plg.262.2022.09.02.01.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 01:53:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/4] powerpc/pseries: Add wait interval counter definitions to struct lppaca
Date: Fri,  2 Sep 2022 18:53:13 +1000
Message-Id: <20220902085316.2071519-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902085316.2071519-1-npiggin@gmail.com>
References: <20220902085316.2071519-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The hypervisor exposes accumulated partition scheduling interval times
in the VPA (lppaca). These can be used to implement a simple stolen time
in the guest without complex and costly dtl scanning.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/lppaca.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm/lppaca.h
index c390ec377bae..34d44cb17c87 100644
--- a/arch/powerpc/include/asm/lppaca.h
+++ b/arch/powerpc/include/asm/lppaca.h
@@ -104,14 +104,18 @@ struct lppaca {
 	volatile __be32 dispersion_count; /* dispatch changed physical cpu */
 	volatile __be64 cmo_faults;	/* CMO page fault count */
 	volatile __be64 cmo_fault_time;	/* CMO page fault time */
-	u8	reserved10[104];
+	u8	reserved10[64];		/* [S]PURR expropriated/donated */
+	volatile __be64 enqueue_dispatch_tb; /* Total TB enqueue->dispatch */
+	volatile __be64 ready_enqueue_tb; /* Total TB ready->enqueue */
+	volatile __be64 wait_ready_tb;	/* Total TB wait->ready */
+	u8	reserved11[16];
 
 	/* cacheline 4-5 */
 
 	__be32	page_ins;		/* CMO Hint - # page ins by OS */
-	u8	reserved11[148];
+	u8	reserved12[148];
 	volatile __be64 dtl_idx;	/* Dispatch Trace Log head index */
-	u8	reserved12[96];
+	u8	reserved13[96];
 } ____cacheline_aligned;
 
 #define lppaca_of(cpu)	(*paca_ptrs[cpu]->lppaca_ptr)
-- 
2.37.2

