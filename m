Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2135FE5CD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 01:10:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpQGQ66Jmz3dxr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 10:10:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=p4tNyvtM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=p4tNyvtM;
	dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpQCZ5cRRz3c9W
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 10:07:37 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id w74so3408804oie.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 16:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtQmre+cG5bwQB+i6fEwFyUVFUWN5aRHujYsFjGgWxk=;
        b=p4tNyvtM6QL+dhVmfvXojEcYsOFyZROJPhEi4vi7k6k189FffG3E4bXJ1h4poEdbvL
         EpV3aBzopdtA0yVE6z17kQ5czTrMnDjcGKuWbVTfn+NpxM7r8rDO/7rmGl3o8qy761Pl
         E47XlngzYehQlYXNGjDa4+M1WZZdMC1BK2oyhAmg9wSsiVCgU1dMW10hkSWcwEhFsL/m
         TUM0qhIFdu1hFtph6E+LbeNOrmACXf95FCBv5fsJooO22888JBBC5pA+TUv0UTqNOtHk
         rri471Usvs5dRTjYKT69KrGpV6iReiHckiJpJfyZegtSPpTlmA4SBsq3s/EPXdNTDYCT
         saBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtQmre+cG5bwQB+i6fEwFyUVFUWN5aRHujYsFjGgWxk=;
        b=uF47ZCnaHgu2YCYzpyyg4sezCy6SiYmCXT4mSHQ3efXF+Elfhui2YND0wchyBwy8FA
         JBwzRTpauIVJ6+lR0hCilssvVMRAecTr2zHsE/mjQpAxbh3EHL6z6jPZbWiB52X4E+5m
         qH2+CRh9iYZC41d39FzZi/2dCkC/E0BVkdxsasXkm9A71VRaOKUP80x0tIgYfM3tcOav
         2Kx9Mwbo3sUM+v4AHT5MnTMGmgaH8ojxbPz54MhmhxhfSw8zZLQcSKjIiKwDrai2g2P1
         INUB+QnKNpEu/rMlvT370TeLHfDufQOA+4ShJh7Uef6lbo/JaloIBmjSUYJG2zbdrnq4
         BUww==
X-Gm-Message-State: ACrzQf0APdn9mHX7cdLs7RdEpYAojBLLgngL/A9QIUwTTV2wBbPsP5T6
	QrVBT/IQ7FJpJFvYSFWNUsYukO02kys=
X-Google-Smtp-Source: AMsMyM5wF3+wUN1lVRYxBFdcoE0XHV0/xUaguJbc0um1a2uMkTHvi3LvLDZtfvQVn16oKARk9bh44A==
X-Received: by 2002:a17:90b:254a:b0:200:53f:891d with SMTP id nw10-20020a17090b254a00b00200053f891dmr2349827pjb.168.1665702444074;
        Thu, 13 Oct 2022 16:07:24 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-62-130.tpgi.com.au. [61.68.62.130])
        by smtp.gmail.com with ESMTPSA id i18-20020a170902cf1200b001837b19ebb8sm332896plg.244.2022.10.13.16.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 16:07:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc/64s: make linear_map_hash_lock a raw spinlock
Date: Fri, 14 Oct 2022 09:07:10 +1000
Message-Id: <20221013230710.1987253-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221013230710.1987253-1-npiggin@gmail.com>
References: <20221013230710.1987253-1-npiggin@gmail.com>
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
Cc: Guenter Roeck <linux@roeck-us.net>, Nicholas Piggin <npiggin@gmail.com>, Nicholas Miehlbradt <nicholas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This lock is taken while the raw kfence_freelist_lock is held, so it
must also be a raw spinlock, as reported by lockdep when raw lock
nesting checking is enabled.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index df008edf7be0..6df4c6d38b66 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1981,7 +1981,7 @@ long hpte_insert_repeating(unsigned long hash, unsigned long vpn,
 }
 
 #if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
-static DEFINE_SPINLOCK(linear_map_hash_lock);
+static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);
 
 static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
 {
@@ -2005,10 +2005,10 @@ static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
 				    mmu_linear_psize, mmu_kernel_ssize);
 
 	BUG_ON (ret < 0);
-	spin_lock(&linear_map_hash_lock);
+	raw_spin_lock(&linear_map_hash_lock);
 	BUG_ON(linear_map_hash_slots[lmi] & 0x80);
 	linear_map_hash_slots[lmi] = ret | 0x80;
-	spin_unlock(&linear_map_hash_lock);
+	raw_spin_unlock(&linear_map_hash_lock);
 }
 
 static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
@@ -2018,14 +2018,14 @@ static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
 	unsigned long vpn = hpt_vpn(vaddr, vsid, mmu_kernel_ssize);
 
 	hash = hpt_hash(vpn, PAGE_SHIFT, mmu_kernel_ssize);
-	spin_lock(&linear_map_hash_lock);
+	raw_spin_lock(&linear_map_hash_lock);
 	if (!(linear_map_hash_slots[lmi] & 0x80)) {
-		spin_unlock(&linear_map_hash_lock);
+		raw_spin_unlock(&linear_map_hash_lock);
 		return;
 	}
 	hidx = linear_map_hash_slots[lmi] & 0x7f;
 	linear_map_hash_slots[lmi] = 0;
-	spin_unlock(&linear_map_hash_lock);
+	raw_spin_unlock(&linear_map_hash_lock);
 	if (hidx & _PTEIDX_SECONDARY)
 		hash = ~hash;
 	slot = (hash & htab_hash_mask) * HPTES_PER_GROUP;
-- 
2.37.2

