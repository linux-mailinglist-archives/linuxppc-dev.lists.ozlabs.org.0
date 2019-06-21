Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A49CC4DFE7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 06:57:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VRJf0rwMzDqW7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 14:57:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="F3+75knu"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VRGd1gD5zDqM3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 14:56:09 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id i189so2914436pfg.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 21:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h+d/dQulSsirIOKPqYl4FAJMvNn/8ZD+HSg3OI8Zr9U=;
 b=F3+75knuxyecJAf5zLJzqUI4T3pwsFpTx+vR3R1BYpduiiac5NCmcQszDJHr3thXM+
 M8CwwZCIU8Zm3mvz2eihgkgc6uYJaHc5WC5QvStFbKJAkzsN49IvdOu55v3iZYeMtyvq
 +7Nc4nXLenbqAswg+1XybOVZD/TclyWN5ReHLF7WIAAoXdEajE6dYYpWRUO5aH3uIdF1
 AcEAZUa3/0NDkWvitar/wWX0tJ2/Mi+SufGS7nUNzuBz1vNRoZMNe90uMZ7AazLwlCwk
 Y6OZL1Hs3aJv7N2L0ZyuKSO0pIz2/yoF92s8heClYPLhiB/7c5a7ltWPQKyh+OMmlMbf
 82Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h+d/dQulSsirIOKPqYl4FAJMvNn/8ZD+HSg3OI8Zr9U=;
 b=Q/4gWT2x/keH8gZUvhNjWg0liq0B5fUHjV0LsMMfJImAf0so7iU0KvTd3sZXc29wQ+
 Tror3g3czti8JuERtRgzIlNeYJnYQnKxmncIRDxegBd1dgP//ly5aVAnrZKp9+LdxU6Q
 Sl3PvLxW7jLtXK8iqy5KIg/nJLLI/ld5CqhPJxh6hW9ERoMO04AuJEkjPMdzNbv+UXUo
 2dKygUErWGJaKRWtm/bKp2Cx4xpW4U7P8ndc/nh/wvxStBxnXYKNsYzceE+FTPslzP61
 fBh9Qgr7YonJcNPnkNKnYYQH6upP4Z8m44Om2v0FJclXhRKQ1pistWzLmnaiRkSLLZ2V
 16AA==
X-Gm-Message-State: APjAAAVS1r1hU6xCGNTQIaxUS9JUw0m7zAOapRrK19UeasjFqL2KMGwc
 ii0QIJiqgB2Uoz/5B5tO4ab65dA5197tlA==
X-Google-Smtp-Source: APXvYqzm9GNaXw1oh9QA19P9oVGvyGnvLHap+JeO+GvcSWX++JwQxcgPH0am7F6Kthav3l/noi5Fog==
X-Received: by 2002:a63:6986:: with SMTP id e128mr478310pgc.220.1561092966706; 
 Thu, 20 Jun 2019 21:56:06 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.77])
 by smtp.gmail.com with ESMTPSA id q131sm1392069pfq.157.2019.06.20.21.56.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 21:56:06 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 01/13] powerpc/mce: Make machine_check_ue_event() static
Date: Fri, 21 Jun 2019 10:25:43 +0530
Message-Id: <4186db0183919bbd1ef7263833953dd91a526abe.1561020760.git.santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1561020760.git.santosh@fossix.org>
References: <cover.1561020760.git.santosh@fossix.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Reza Arbab <arbab@linux.ibm.com>

The function doesn't get used outside this file, so make it static.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 arch/powerpc/kernel/mce.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index b18df633eae9..e78c4f18ea0a 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -33,7 +33,7 @@ static DEFINE_PER_CPU(struct machine_check_event[MAX_MC_EVT],
 					mce_ue_event_queue);
 
 static void machine_check_process_queued_event(struct irq_work *work);
-void machine_check_ue_event(struct machine_check_event *evt);
+static void machine_check_ue_event(struct machine_check_event *evt);
 static void machine_process_ue_event(struct work_struct *work);
 
 static struct irq_work mce_event_process_work = {
@@ -203,7 +203,7 @@ void release_mce_event(void)
 /*
  * Queue up the MCE event which then can be handled later.
  */
-void machine_check_ue_event(struct machine_check_event *evt)
+static void machine_check_ue_event(struct machine_check_event *evt)
 {
 	int index;
 
-- 
2.20.1

