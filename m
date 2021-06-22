Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B943B060C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 15:43:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8SK56Jcsz3btG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 23:43:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=E6TZRe1c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=E6TZRe1c; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8SHl4qc4z300T
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 23:42:11 +1000 (AEST)
Received: by mail-qk1-x72e.google.com with SMTP id bl4so3628389qkb.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 06:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O/xPCHLexHplOss3tYuch9cg8PhqAWvilR52TXMA9Pc=;
 b=E6TZRe1ctY9C4Xk/af7g5Rs9fypN/SNoEANFmxDNoi893K8PPIZ9fXYQXkcG5lxdfR
 5i6hdQqFZdbHUcAPNY96P6gPXl6rqru76bzHmWacwQOTXaw7ZC6pVjYADldqW9hO+P6y
 4rn+37X9HphWwi6d4jiY7DIeaOYfTdTuY7TFGEypa5bcP+EBJOz32dyi1WBToT2uVpYj
 kGDao3p/nBf65Vu+EQ0rQMDwojvaKI2r87etUaJDNGKBm+hY1MVQL3QuWfR6/z1n8q4T
 +7guQzAFmfLvEzmoZAy2WQykKxMXnTBP8/0sNV5+dw+2xpjma0kshDDk9XQuODIjTkFK
 2Ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O/xPCHLexHplOss3tYuch9cg8PhqAWvilR52TXMA9Pc=;
 b=KsvgjKz8lMi+vSaNGxT/KTry83PvfBG0qgxdxYtFBjos+NT/pqeH0CYofUcrzKd0J9
 KWmEiztny+IgZz5pBTXDCv9D+sRY1oJvDpnvIkm8PWdztLtZRWhSJXvYrzCaTwo2P1of
 1RVwIshre+MQJLDSy99uddociJfbOaZrSdDT+b+RCgpPRrV6mOTmudpEsq3Owx47WEx0
 /qAX//UsWf/IIkcVrrC7v+cn4rI6x7KlX0Jqx2Jy311Fqb5CHZzWj233N6U4h4OprTRC
 905Ueo0ndR1WJGSIpngbp7zQk2BDiM3qp968RZZUKiIvRMyDb3eRnWGoIh0xz8etnKDW
 Dc1A==
X-Gm-Message-State: AOAM530sgoZ4DEmxwXNAIXG6k+dt3sCmqqzB+VN1s4kc0hUutp4X79en
 VBxVj19UkeEQAwfCXVRZhON573mO3Rk=
X-Google-Smtp-Source: ABdhPJxenOfjmEYcKZCej1kKUbC2k7Xz/wED+d2S8dRusHkmKPC5NdzJxJc32FnTuRSW5h0B3t7mEw==
X-Received: by 2002:a37:6712:: with SMTP id b18mr4341086qkc.491.1624369327837; 
 Tue, 22 Jun 2021 06:42:07 -0700 (PDT)
Received: from localhost.localdomain ([191.19.29.157])
 by smtp.gmail.com with ESMTPSA id r19sm1644491qtw.59.2021.06.22.06.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 06:42:07 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/pseries: break early in
 dlpar_memory_add_by_count() loops
Date: Tue, 22 Jun 2021 10:39:22 -0300
Message-Id: <20210622133923.295373-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622133923.295373-1-danielhb413@gmail.com>
References: <20210622133923.295373-1-danielhb413@gmail.com>
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After a successful dlpar_add_lmb() call the LMB is marked as reserved.
Later on, depending whether we added enough LMBs or not, we rely on
the marked LMBs to see which ones might need to be removed, and we
remove the reservation of all of them.

These are done in for_each_drmem_lmb() loops without any break
condition. This means that we're going to check all LMBs of the partition
even after going through all the reserved ones.

This patch adds break conditions in both loops to avoid this. The
'lmbs_added' variable was renamed to 'lmbs_reserved', and it's now
being decremented each time a lmb reservation is removed, indicating
if there are still marked LMBs to be processed.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 arch/powerpc/platforms/pseries/hotplug-memory.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 28a7fd90232f..c0a03e1537cb 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -673,7 +673,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
 {
 	struct drmem_lmb *lmb;
 	int lmbs_available = 0;
-	int lmbs_added = 0;
+	int lmbs_reserved = 0;
 	int rc;
 
 	pr_info("Attempting to hot-add %d LMB(s)\n", lmbs_to_add);
@@ -714,13 +714,12 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
 		 * requested LMBs cannot be added.
 		 */
 		drmem_mark_lmb_reserved(lmb);
-
-		lmbs_added++;
-		if (lmbs_added == lmbs_to_add)
+		lmbs_reserved++;
+		if (lmbs_reserved == lmbs_to_add)
 			break;
 	}
 
-	if (lmbs_added != lmbs_to_add) {
+	if (lmbs_reserved != lmbs_to_add) {
 		pr_err("Memory hot-add failed, removing any added LMBs\n");
 
 		for_each_drmem_lmb(lmb) {
@@ -735,6 +734,10 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
 				dlpar_release_drc(lmb->drc_index);
 
 			drmem_remove_lmb_reservation(lmb);
+			lmbs_reserved--;
+
+			if (lmbs_reserved == 0)
+				break;
 		}
 		rc = -EINVAL;
 	} else {
@@ -745,6 +748,10 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
 			pr_debug("Memory at %llx (drc index %x) was hot-added\n",
 				 lmb->base_addr, lmb->drc_index);
 			drmem_remove_lmb_reservation(lmb);
+			lmbs_reserved--;
+
+			if (lmbs_reserved == 0)
+				break;
 		}
 		rc = 0;
 	}
-- 
2.31.1

