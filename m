Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA70707E8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 19:52:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sq2K5x5LzDqKb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2019 03:52:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="a9ECEaiM"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45spwB5NmpzDqTb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 03:47:22 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id i18so18009739pgl.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 10:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RdTkCJ5KzrkeQeowvhtZBnAx7bbV0bkpZBOFs+hjaQM=;
 b=a9ECEaiMetQKkYmevNL1AsxaqG6CNsnOvloAC74ynvKlsdvFXjK0FoZVc8eBg74/TU
 MyeFtm7EQMsO8oMsDAUdVtvwaRPiilYE//dX2tEukuWtPGHtItrflnkUptAQ8NR9A0iG
 uuQzS/yUF6TOxmpAD+uZv60HoCTAMq8NZaME+8HF6o6MaK3S/xk9WEt2yA+Cap7nJVs7
 ZWiABZlZ2woQX9MNFy7OGLMV/q+aNj9wdLadTtN/xo/6MyxoY0b3bXRYydvxbFro+TTS
 IwZkobKCo+hv0eoJsXFwRO7TGzlW9Aa16Z3B+KLqSuBpu//Qfp6PWha70/mUw9LKgUx0
 CHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RdTkCJ5KzrkeQeowvhtZBnAx7bbV0bkpZBOFs+hjaQM=;
 b=dpS89547vNXDt9oeUFOSxFWnc2eSzYG5oSf+55M4dVQHPM71BcnaYiqS2iiGawDejg
 YGCNd1b/40g9SdoF6t6iK1AfZr/Ft3yZa6hO/RPhukjKibiKzAnfPASD561c1qRKWpGc
 TwdWmEaJXE532u6zZ+ckKHP5EY1pYE8YiSGwTEL7Kp0kW3vBfkxyNr9iQlivC6cBp7ce
 aI1IoczBhlTFKDNY2K2OM/ord9ecrP0kKHao4WJnx3lxGeKUXq51iR1NNn3tK+Vib40g
 N+r8BoL0NhySMCRSSSDm6/wkSSQt2iQmu6rTPK/DIFHqnaEZpfTcWz1UID/mtfhZ1xIa
 /MFA==
X-Gm-Message-State: APjAAAVEbaaiJ5FnxokikuBUaMoWjpFuhezsjRY0/wEUNVOYiQcJQA8V
 HGwg7LkYwbMPFEqhucXEkmMeSP98
X-Google-Smtp-Source: APXvYqy9b/PEqLAfzYCXpFQIQU7L4CmRChEPKJavhyyG9LQdni2B706r8xiv024Vx+e9WovDhUJECQ==
X-Received: by 2002:a65:500a:: with SMTP id f10mr41765738pgo.105.1563817640158; 
 Mon, 22 Jul 2019 10:47:20 -0700 (PDT)
Received: from bobo.local0.net (193-116-123-212.tpgi.com.au. [193.116.123.212])
 by smtp.gmail.com with ESMTPSA id z24sm69170057pfr.51.2019.07.22.10.47.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 10:47:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 2/4] powerpc/64s/radix: Fix memory hot-unplug page table
 split
Date: Tue, 23 Jul 2019 03:46:58 +1000
Message-Id: <20190722174700.11483-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722174700.11483-1-npiggin@gmail.com>
References: <20190722174700.11483-1-npiggin@gmail.com>
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
Cc: Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

create_physical_mapping expects physical addresses, but splitting
these mapping on hot unplug is supplying virtual (effective)
addresses.

[I'm not sure how to test this one]

Cc: Balbir Singh <bsingharora@gmail.com>
Fixes: 4dd5f8a99e791 ("powerpc/mm/radix: Split linear mapping on hot-unplug")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index c5cc16ab1954..2204d8eeb784 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -737,8 +737,8 @@ static int __meminit stop_machine_change_mapping(void *data)
 
 	spin_unlock(&init_mm.page_table_lock);
 	pte_clear(&init_mm, params->aligned_start, params->pte);
-	create_physical_mapping(params->aligned_start, params->start, -1);
-	create_physical_mapping(params->end, params->aligned_end, -1);
+	create_physical_mapping(__pa(params->aligned_start), __pa(params->start), -1);
+	create_physical_mapping(__pa(params->end), __pa(params->aligned_end), -1);
 	spin_lock(&init_mm.page_table_lock);
 	return 0;
 }
-- 
2.20.1

