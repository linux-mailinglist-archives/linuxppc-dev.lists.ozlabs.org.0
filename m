Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8988533549
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 04:25:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7FK95Jfbz3btK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 12:25:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=V4qeBelQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=V4qeBelQ; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7FHv48JFz300K
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 12:24:11 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id a17so1325341plb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 19:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YSYv2upIcOvZVDliAqo05IwqVpmA0XEgofqYHMEuV/c=;
 b=V4qeBelQFOh2eD6LinejjOwHEpYWm6yumNX3hPZiYjPM3y69D3g2DPw805oEfp8Uhj
 Yx5LKOYZOTlccRGCkx2DwlB2ZqWvjAl/kIQSrKJPGAltk/0gebmsIW/J/jVUq11sq6Fs
 i8uYVLbXz11cwu0OiONWUtRpRLLDuAZTvEz0ZsCiQhGvXHcY8uETkn3PeDwr+pEUSO3f
 xUN1uMGNdOcUMAayL8b4JCdrVd29Wr3egoQnxlVZ2vQ2UHuXPhi0wE9J5vjPLQrOwd9o
 652sDMB7xr0soehQ023N+eec+WuQuEanGz8K8A+7SfUsWBhsZCW8CwRFvTlY/uUPeJWE
 B27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YSYv2upIcOvZVDliAqo05IwqVpmA0XEgofqYHMEuV/c=;
 b=K3L2j6uaBzLJGtmEQDynwCi6RfeK0EQ3QU+rIGZdSJFtSFXM8PSUlgh5+hBEa0VPSv
 dXwAv/bvf8JWBIOMsbrznVfEjCtHwqql0heH2/OobHIt0L4wDfrGJXpM+H5ProGJe9L2
 +EOM9T6vItNZvH18C6swrbo7bMKIouX6pa3hgI0r83sPvwFA6Xrod5DVKymckYdg+7JP
 sKgjvov9V/tKcgju0OxjlX/xZdb2ZzAk3G2ejBsP8OLpmz90Fl6QRRx5JBQOA4BCtRmp
 AArL1RZe54+eEvmwBPBPf5Zs3oJgHBcX9NicKpZCBRIHKTztervx8TsN1XxpabkpjOE+
 PMyA==
X-Gm-Message-State: AOAM530858ZL7c3kDIe1wLAkOLXYm8oUIu/qYB2bdhekKvFqPbPMTnF2
 /HO9irBAwAx+o2nQv1yMnRXBZEdzSr8=
X-Google-Smtp-Source: ABdhPJxcge3HCynCJcv2bTvIiGDvvjwAs6ZDJHTVGRBzbMEOCwz9XHu9qKPMqZDxuSkp5gsO6CpzUw==
X-Received: by 2002:a17:90b:3902:b0:1e0:50ef:3ff3 with SMTP id
 ob2-20020a17090b390200b001e050ef3ff3mr7656883pjb.137.1653445448994; 
 Tue, 24 May 2022 19:24:08 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.209.250.103])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a1709028a9300b00161a9df4de8sm7884617plo.145.2022.05.24.19.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 19:24:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc/64s: POWER10 nest MMU does not require flush
 escalation workaround
Date: Wed, 25 May 2022 12:23:56 +1000
Message-Id: <20220525022358.780745-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220525022358.780745-1-npiggin@gmail.com>
References: <20220525022358.780745-1-npiggin@gmail.com>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Haren Myneni <haren@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Per (non-public) Nest MMU Workbook, POWER10 and POWER9P NMMU does not
cache PTEs in PWC, so does not require PWC flush to invalidate these
translations.

Skip the workaround on POWER10 and later.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 7724af19ed7e..7e233829b453 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -755,10 +755,18 @@ EXPORT_SYMBOL(radix__local_flush_tlb_page);
 static bool mm_needs_flush_escalation(struct mm_struct *mm)
 {
 	/*
-	 * P9 nest MMU has issues with the page walk cache
-	 * caching PTEs and not flushing them properly when
-	 * RIC = 0 for a PID/LPID invalidate
+	 * The P9 nest MMU has issues with the page walk cache caching PTEs
+	 * and not flushing them when RIC = 0 for a PID/LPID invalidate.
+	 *
+	 * This may have been fixed in shipping firmware (by disabling PWC
+	 * or preventing it from caching PTEs), but until that is confirmed,
+	 * this workaround is required - escalate all RIC=0 IS=1/2/3 flushes
+	 * to RIC=2.
+	 *
+	 * POWER10 (and P9P) does not have this problem.
 	 */
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		return false;
 	if (atomic_read(&mm->context.copros) > 0)
 		return true;
 	return false;
-- 
2.35.1

