Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8923A40E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 13:11:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1dSR69xxz3c0N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 21:11:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=G2hfc67+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=G2hfc67+; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1dS12Drzz3bnb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 21:10:40 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id p13so4202469pfw.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 04:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YCt1fL2h5upm20UbFR5Z7OcTRzxQQ6EfgR9dAtbdiJU=;
 b=G2hfc67+SaoHVk5XzD/yFzHJDG2uugi9J3HZxwwG1c8ncoLIuvMwQpc80rAJVLvc5c
 bajGA86WciAt++d30WjR84b6wabNuhdAdZI8Qw4Ddpkrz48aCBbsM7y64rq9x5NFTIh3
 ds1azBRL3eeqSHB2z3uYyWBRDo9OHP8Bffhi84lKAZv1BdFiBWi7n8WRy1hB3BG0850p
 u93jPbod2IzNKsaBbpsNrO/CEiWbsKjmt2fRpl5HloFZ3gTthF4zQnX4J7tS+viBsAEZ
 khpQfEDXu09l5O4gNAwwh2A6hbWPI5UsYdog66YE8Eq37nULAEp2xLJeQCJ3cyqZH2hK
 bDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YCt1fL2h5upm20UbFR5Z7OcTRzxQQ6EfgR9dAtbdiJU=;
 b=mFxfZ0GSIaazEyPTMKO6h2zIcrWERd/X5VK+dRd0qKLuWDnH3LFyB1WhPHwv8l4fEa
 wIdNHg0JeFaqxeC3ZyVb+q2bPSO+GG29xYRn1eZ2xy1VW/3IfWOeetKBvYJPihpkOXLk
 TJA5NlN7osmUYscsEKhKau8yzzxS5mN/jfF7smjqTy2FHc0LFzntXFVWqo6OPPPe30uS
 6h5QmKlCDF04ernFnWStxmWvHpVFKJaWL0dAuXqWu5A+Ehj8h/Y0r+mJ0YWgpm9CTj0n
 TxZ9Y6KMxwPTBRkm8qMKVqP0RBqoRqTlrVr2wmeB9XLnr6sGD/gL0KakJ5/+Wbolr73+
 cI3g==
X-Gm-Message-State: AOAM531NsUOcLPC0WbEo9t8OQcEDcd3wsJhl6iNstjZRO9pktuday+uD
 Jp489Z8qVBJcrKBkyTTrN+0dOgw8IFs=
X-Google-Smtp-Source: ABdhPJyOQwPM3ppw2p6C/IgYnFpG18UzClS+9oR61EQkZJ1hQIikHYLNpGul27zL2U3SkbXgvozPNw==
X-Received: by 2002:a63:5d5c:: with SMTP id o28mr3118967pgm.22.1623409835388; 
 Fri, 11 Jun 2021 04:10:35 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id n14sm4724811pfa.138.2021.06.11.04.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 04:10:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/build: vdso linker warning for orphan sections
Date: Fri, 11 Jun 2021 21:10:29 +1000
Message-Id: <20210611111029.1058789-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add --orphan-handling=warn for vdsos, and adjust vdso linker scripts to
deal with orphan sections.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/vdso32/Makefile     | 2 +-
 arch/powerpc/kernel/vdso32/vdso32.lds.S | 3 ++-
 arch/powerpc/kernel/vdso64/Makefile     | 2 +-
 arch/powerpc/kernel/vdso64/vdso64.lds.S | 3 ++-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
index 7d9a6fee0e3d..403033013848 100644
--- a/arch/powerpc/kernel/vdso32/Makefile
+++ b/arch/powerpc/kernel/vdso32/Makefile
@@ -66,7 +66,7 @@ include/generated/vdso32-offsets.h: $(obj)/vdso32.so.dbg FORCE
 
 # actual build commands
 quiet_cmd_vdso32ld_and_check = VDSO32L $@
-      cmd_vdso32ld_and_check = $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) ; $(cmd_vdso_check)
+      cmd_vdso32ld_and_check = $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) $(if $(CONFIG_LD_ORPHAN_WARN), -Wl$(comma)--orphan-handling=warn) ; $(cmd_vdso_check)
 quiet_cmd_vdso32as = VDSO32A $@
       cmd_vdso32as = $(VDSOCC) $(a_flags) $(CC32FLAGS) -c -o $@ $<
 quiet_cmd_vdso32cc = VDSO32C $@
diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S b/arch/powerpc/kernel/vdso32/vdso32.lds.S
index 58e0099f70f4..b42e8759e67a 100644
--- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
@@ -85,9 +85,10 @@ SECTIONS
 
 	/DISCARD/	: {
 		*(.note.GNU-stack)
+		*(.branch_lt)
 		*(.data .data.* .gnu.linkonce.d.* .sdata*)
 		*(.bss .sbss .dynbss .dynsbss)
-		*(.got1)
+		*(.got1 .glink .iplt .rela*)
 	}
 }
 
diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
index d783c07e558f..980dfd631a08 100644
--- a/arch/powerpc/kernel/vdso64/Makefile
+++ b/arch/powerpc/kernel/vdso64/Makefile
@@ -59,4 +59,4 @@ include/generated/vdso64-offsets.h: $(obj)/vdso64.so.dbg FORCE
 
 # actual build commands
 quiet_cmd_vdso64ld_and_check = VDSO64L $@
-      cmd_vdso64ld_and_check = $(CC) $(c_flags) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^); $(cmd_vdso_check)
+      cmd_vdso64ld_and_check = $(CC) $(c_flags) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) $(if $(CONFIG_LD_ORPHAN_WARN), -Wl$(comma)--orphan-handling=warn) ; $(cmd_vdso_check)
diff --git a/arch/powerpc/kernel/vdso64/vdso64.lds.S b/arch/powerpc/kernel/vdso64/vdso64.lds.S
index 0288cad428b0..3750b3b15b51 100644
--- a/arch/powerpc/kernel/vdso64/vdso64.lds.S
+++ b/arch/powerpc/kernel/vdso64/vdso64.lds.S
@@ -33,7 +33,7 @@ SECTIONS
 	. = ALIGN(16);
 	.text		: {
 		*(.text .stub .text.* .gnu.linkonce.t.* __ftr_alt_*)
-		*(.sfpr .glink)
+		*(.sfpr)
 	}						:text
 	PROVIDE(__etext = .);
 	PROVIDE(_etext = .);
@@ -87,6 +87,7 @@ SECTIONS
 		*(.data .data.* .gnu.linkonce.d.* .sdata*)
 		*(.bss .sbss .dynbss .dynsbss)
 		*(.opd)
+		*(.glink .iplt .plt .rela*)
 	}
 }
 
-- 
2.23.0

