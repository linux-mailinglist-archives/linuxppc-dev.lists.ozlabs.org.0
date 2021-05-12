Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC17437D439
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 22:29:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgRGH5xVFz3bx8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 06:29:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=G285b8MK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=G285b8MK; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgRFP1bMSz2yZ2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 06:28:23 +1000 (AEST)
Received: by mail-qk1-x733.google.com with SMTP id q10so19398864qkc.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 13:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MnLw8z3Y2kRv0K/DZe65NliwkeKzvJ4qLDaYSw1HREM=;
 b=G285b8MKp4ceo7EgDZt/QITPWr0VudPM5J86sAMYczovNwwVqtRisN7q55zyf3U8kj
 GFrnIFbFOIsDPUCfJNLHUr0G5H8lUGRA5mwZ9I2FRjVBZbGypKE+j8vNzmCrkL2FfIK0
 mRXIpG8Lv3JkBvd4vdXcf1tO4PcJX9UTq9pDqFqd7eyvHzws7zNC0ZVueLvcbltnQVlB
 VpIPL0HzeDI+Send5WVxOcbweZwWAcm1douhvz2elzfbSoncSy5PnFqhfIuKVvTlULXy
 YX3uLbPgEAyfX7XdW57Jz3CEAsw00+w46cc8VrKsOUG4lXLIvEIQRdUN1DAixMO2TGXE
 ANew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MnLw8z3Y2kRv0K/DZe65NliwkeKzvJ4qLDaYSw1HREM=;
 b=i/3RQRJ/72a4SkdkGZ/zIgeGWLbQkQNx2lZT6wYtQGrE/Px7TQrVHEo/9wkRHxTEgy
 CGKSjf3dINDeNNVtZp7suUmESKUhiQvS9+bmV0tIuvuKA5F64ygZVb1P8pfcx6ND9f5e
 6cLE68Fp6hAkvz8tFyCyRar4T6jErBid62Zlu17QcLC+fRJgZwNsxT4PocQeLz9IJk/6
 rWx+bad/lg1q1gyUXv+GG0Un0g7Ys8aZc7+nMgH5UV+a057ZhRoR40rOoEu7H9MzRRJk
 ScWuKfZtenq4oV2gwTXUZP3qH/ly3c5q6HYIAmyZQmHcLApQZaWcltP5RSm5q/scJNZr
 RJXw==
X-Gm-Message-State: AOAM533a3bJxUIUquYYe4vTkpDJ+bkceNf1jKWXeJMjunLVTgLEXeBo3
 dlCSZ4p8ekslfAF6wkIWgnclqKA7JsslUw==
X-Google-Smtp-Source: ABdhPJxK5eN4GtjpL1kpPBpCOvcnW4DJ/WxD4CSqq8dH8dJhQ0HWmMZuRe2Zwaq0jmN9scN+C+CrZQ==
X-Received: by 2002:a37:e40f:: with SMTP id y15mr36402089qkf.314.1620851300114; 
 Wed, 12 May 2021 13:28:20 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:fb9a:a1c9:c5a3:1e98:bc69])
 by smtp.gmail.com with ESMTPSA id j29sm778317qtv.6.2021.05.12.13.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 13:28:19 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/4] powerpc/pseries: Set UNISOLATE on
 dlpar_memory_remove_by_ic() error
Date: Wed, 12 May 2021 17:28:06 -0300
Message-Id: <20210512202809.95363-2-danielhb413@gmail.com>
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

As previously done in dlpar_cpu_remove() for CPUs, this patch changes
dlpar_memory_remove_by_ic() to unisolate the LMB DRC when the LMB is
failed to be removed. The hypervisor, seeing a LMB DRC that was supposed
to be removed being unisolated instead, can do error recovery on its
side.

This change is done in dlpar_memory_remove_by_ic() only because, as of
today, only QEMU is using this code path for error recovery (via the
PSERIES_HP_ELOG_ID_DRC_IC event). phyp treats it as a no-op.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 arch/powerpc/platforms/pseries/hotplug-memory.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 8377f1f7c78e..bb98574a84a2 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -551,6 +551,13 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 			if (!drmem_lmb_reserved(lmb))
 				continue;
 
+			/*
+			 * Setting the isolation state of an UNISOLATED/CONFIGURED
+			 * device to UNISOLATE is a no-op, but the hypervisor can
+			 * use it as a hint that the LMB removal failed.
+			 */
+			dlpar_unisolate_drc(lmb->drc_index);
+
 			rc = dlpar_add_lmb(lmb);
 			if (rc)
 				pr_err("Failed to add LMB, drc index %x\n",
-- 
2.31.1

