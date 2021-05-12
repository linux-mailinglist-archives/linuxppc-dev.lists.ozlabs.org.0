Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F38B37D43C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 22:30:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgRHC2T4qz3c7y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 06:29:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mKGdzd/F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mKGdzd/F; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgRFQ4DWCz2yZ2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 06:28:26 +1000 (AEST)
Received: by mail-qk1-x72d.google.com with SMTP id f18so1700926qko.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 13:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HTXk1a7oJSPPEp2eJBPzk556VZYQl+73aNOZUMvWRVI=;
 b=mKGdzd/FraRwYy0PSYA48UgY1qDWuV7zGw6Tk3BcAhKGS/rNJS43eV9cLMWE21Ma5k
 JRkqW2lcC5fjxl1ebkejaQnSLdxjw7B0I4wNDWGPKCpQAG5ePK9s7xAVIXSrQGvYLfcD
 WGjWTzEITawbejiYbotF6q8JR+0mGLbLCIANPdHqilNZgkzpxIE0HfgrWLxKXrJbiTLp
 esrTUinuM4uK3Q168AHGgMnM+nCdKJDXG5Rac2qwOQRDP+88F/NgjZEcEFeLqx3Fzikb
 nEHTzwHzsy0aB6nvMPiPAenhQ7GB1AVqyxyf+933CLo+mgoyj9/ACh0pcNkNHGqBWMgK
 g4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HTXk1a7oJSPPEp2eJBPzk556VZYQl+73aNOZUMvWRVI=;
 b=mVPgxc9pKD1QicV3saGkEPxtvZV9fUnI6oSxxku8Eywn8KUbIKG14w0q33rXPJfO92
 +hIYC7FcapRFVedGchMpE885V3u1LF1L/v951qJQItn5jDshhBynT1dRiiSfYaXsRsrz
 4nctEI5Rbv9GKUx9A8Ie8VX9qVC7Ibo5lmIe38ogokkXjuGvKPvmeZfu6vdWMabXWRzi
 j3I10Am9GDNh2ZnkbRubrmW1D60bKkh+uexyYVVRpvSfAmza2rC13LXwWVvrl7FrA+gi
 6EOoGBz2ZrTazqSOAVyeDj8YnkYxWoLhsPWN/LyVDJwj6kJLUdL4R5HJpn5lerEPZj+W
 O48Q==
X-Gm-Message-State: AOAM5311E7MGf0xJxX2Jvc/ThQzTHIm4Q563HsUGHZy3Bzkc2xsAZ4e4
 PGKR4z4LRW/ovIaGXsOC9z6fDrSP6CP6Bg==
X-Google-Smtp-Source: ABdhPJz58dAD3woZDtFQZmBtX98ba37mTSqccfkHsz2PCzZrJQN99bThyQr5BMdkI6Rx3yRJvKreEA==
X-Received: by 2002:a05:620a:3c8:: with SMTP id
 r8mr34622746qkm.204.1620851303595; 
 Wed, 12 May 2021 13:28:23 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:fb9a:a1c9:c5a3:1e98:bc69])
 by smtp.gmail.com with ESMTPSA id j29sm778317qtv.6.2021.05.12.13.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 13:28:23 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/4] powerpc/pseries: break early in
 dlpar_memory_remove_by_count() loops
Date: Wed, 12 May 2021 17:28:08 -0300
Message-Id: <20210512202809.95363-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210512202809.95363-1-danielhb413@gmail.com>
References: <20210512202809.95363-1-danielhb413@gmail.com>
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After marking the LMBs as reserved depending on dlpar_remove_lmb() rc,
we evaluate whether we need to add the LMBs back or if we can release
the LMB DRCs. In both cases, a for_each_drmem_lmb() loop without a break
condition is used. This means that we're going to cycle through all LMBs
of the partition even after we're done with what we were going to do.

This patch adds break conditions in both loops to avoid this. The
'lmbs_removed' variable was renamed to 'lmbs_reserved', and it's now
being decremented each time a lmb reservation is removed, indicating
that the operation we're doing (adding back LMBs or releasing DRCs) is
completed.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 arch/powerpc/platforms/pseries/hotplug-memory.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index c21d9278c1ce..3c7ce5361ce3 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -402,7 +402,7 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
 static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
 {
 	struct drmem_lmb *lmb;
-	int lmbs_removed = 0;
+	int lmbs_reserved = 0;
 	int lmbs_available = 0;
 	int rc;
 
@@ -436,12 +436,12 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
 		 */
 		drmem_mark_lmb_reserved(lmb);
 
-		lmbs_removed++;
-		if (lmbs_removed == lmbs_to_remove)
+		lmbs_reserved++;
+		if (lmbs_reserved == lmbs_to_remove)
 			break;
 	}
 
-	if (lmbs_removed != lmbs_to_remove) {
+	if (lmbs_reserved != lmbs_to_remove) {
 		pr_err("Memory hot-remove failed, adding LMB's back\n");
 
 		for_each_drmem_lmb(lmb) {
@@ -454,6 +454,10 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
 				       lmb->drc_index);
 
 			drmem_remove_lmb_reservation(lmb);
+
+			lmbs_reserved--;
+			if (lmbs_reserved == 0)
+				break;
 		}
 
 		rc = -EINVAL;
@@ -467,6 +471,10 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_remove)
 				lmb->base_addr);
 
 			drmem_remove_lmb_reservation(lmb);
+
+			lmbs_reserved--;
+			if (lmbs_reserved == 0)
+				break;
 		}
 		rc = 0;
 	}
-- 
2.31.1

