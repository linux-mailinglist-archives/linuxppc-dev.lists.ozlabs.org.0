Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7301D44B9B2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 01:39:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpmG41vWDz3cQN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 11:39:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=H0+ytpgR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=H0+ytpgR; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpmCH73DMz2xXB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 11:37:31 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id
 o6-20020a17090a0a0600b001a64b9a11aeso112895pjo.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Nov 2021 16:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0mYhAY0X+H1yQpitBOKt0IPpPGrvNZzkiJpGGsRAQsk=;
 b=H0+ytpgRkhdzgY34vEJPzhMYosn3W4l3BpoB9M5CkJ/7U0Lu2QU8LSta86Dhw59wdO
 Yj4MhNhOlaX1MHAcbZN3T+O20Jhj3RDWcdYY9+2k5+x4paBPNdSYqReWiuxJ/5ZDqL0L
 FdmenZXsuXyrc9VXikau07HpUwzV1RN2oKasdQPPcM9VPwS33K2n2sev3qK3cNbPAq3L
 Dmz82QUIs9vvJzjblMuBe8CaRkfNgHuiTpcaUGcIwzodhA1k8rc1vTNv503cRKpeDvgM
 nNUKKqp4WUN4sbFc+YXfGhjJ1908uv85xcbcKvONxJZYmApEAVQuyI66Wq2qK3htuXmu
 r/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0mYhAY0X+H1yQpitBOKt0IPpPGrvNZzkiJpGGsRAQsk=;
 b=B6PYGq3OsVqWxBKBrJh+/1OiC3eryQ1DZsDfJuK8z4jnKs7bJVCAJey3Rpym/5hpfC
 UP+Pf8B1yT8l4fynnHuvsMqLrLIe3usLz60xtbtGu7m5OuULK/2Cum2bF6IoZPmp72Jk
 MwOTuXURUQ/PtDY5eFNrllAcXfXV0VgEUCaKmF3YTKyaI9mnkBJ415tCiToEnIZgn1cx
 ADrm7dOkmnrmFEJcXonKBiX7H+mrAH1i2rTPCgBT037dVT/gTK9MwfzGaIFi1SPHwvNo
 xr6mELfElIOqftSjgDG/pc59Z6pde3yGaNKLFnKf7EkeeOKtbmqWU614sXAUilAqN4+9
 rtPw==
X-Gm-Message-State: AOAM530BXVPVkTcbpL84cGkFAezWqe5hCDtXrAo2cns7VFPRJyv5YVD/
 07t3uS1S69BrHJlVHGifqxi9KBQRUDmd9A==
X-Google-Smtp-Source: ABdhPJzy7rV89Q0I093JhJGjKlV9G/Zgjd34HLUED7ecKBnFM/Z2Pz6HNt7hSn7R7h7MRV+SZcuXiA==
X-Received: by 2002:a17:90a:c257:: with SMTP id
 d23mr12330431pjx.42.1636504649426; 
 Tue, 09 Nov 2021 16:37:29 -0800 (PST)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id t21sm15854074pgo.12.2021.11.09.16.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 16:37:29 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 3/5] powerpc: Rework and improve STRICT_KERNEL_RWX patching
Date: Wed, 10 Nov 2021 11:37:15 +1100
Message-Id: <20211110003717.1150965-4-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110003717.1150965-1-jniethe5@gmail.com>
References: <20211110003717.1150965-1-jniethe5@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Christopher M. Riedl" <cmr@bluescreens.de>

Rework code-patching with STRICT_KERNEL_RWX to prepare for a later patch
which uses a temporary mm for patching under the Book3s64 Radix MMU.
Make improvements by adding a WARN_ON when the patchsite doesn't match
after patching and return the error from __patch_instruction() properly.

Signed-off-by: Christopher M. Riedl <cmr@bluescreens.de>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v7: still pass addr to map_patch_area()
---
 arch/powerpc/lib/code-patching.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 29a30c3068ff..d586bf9c7581 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -75,6 +75,7 @@ static inline void stop_using_temp_mm(struct temp_mm_state prev_state)
 }
 
 static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
+static DEFINE_PER_CPU(unsigned long, cpu_patching_addr);
 
 static int text_area_cpu_up(unsigned int cpu)
 {
@@ -87,6 +88,7 @@ static int text_area_cpu_up(unsigned int cpu)
 		return -1;
 	}
 	this_cpu_write(text_poke_area, area);
+	this_cpu_write(cpu_patching_addr, (unsigned long)area->addr);
 
 	return 0;
 }
@@ -172,11 +174,10 @@ static inline int unmap_patch_area(unsigned long addr)
 
 static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
 {
-	int err;
+	int err, rc = 0;
 	u32 *patch_addr = NULL;
 	unsigned long flags;
 	unsigned long text_poke_addr;
-	unsigned long kaddr = (unsigned long)addr;
 
 	/*
 	 * During early early boot patch_instruction is called
@@ -188,15 +189,13 @@ static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
 
 	local_irq_save(flags);
 
-	text_poke_addr = (unsigned long)__this_cpu_read(text_poke_area)->addr;
-	if (map_patch_area(addr, text_poke_addr)) {
-		err = -1;
+	text_poke_addr = __this_cpu_read(cpu_patching_addr);
+	err = map_patch_area(addr, text_poke_addr);
+	if (err)
 		goto out;
-	}
-
-	patch_addr = (u32 *)(text_poke_addr + (kaddr & ~PAGE_MASK));
 
-	__patch_instruction(addr, instr, patch_addr);
+	patch_addr = (u32 *)(text_poke_addr | offset_in_page(addr));
+	rc = __patch_instruction(addr, instr, patch_addr);
 
 	err = unmap_patch_area(text_poke_addr);
 	if (err)
@@ -204,8 +203,9 @@ static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
 
 out:
 	local_irq_restore(flags);
+	WARN_ON(!ppc_inst_equal(ppc_inst_read(addr), instr));
 
-	return err;
+	return rc ? rc : err;
 }
 #else /* !CONFIG_STRICT_KERNEL_RWX */
 
-- 
2.25.1

