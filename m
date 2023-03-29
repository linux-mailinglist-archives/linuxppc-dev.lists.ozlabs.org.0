Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7C36CD160
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 07:00:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmZB20cGZz3f99
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 16:00:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=a+A3vmtN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=a+A3vmtN;
	dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmZ9C3ssrz2xKS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 15:59:43 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so5338005wmq.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 21:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680065980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2nyBWkEl893cb8p3Xcv9ddibZeqm3dx5h/n4mJzM0I=;
        b=a+A3vmtN33rV7G2K+kBT5+09RNfw/x9RSy+q2X3PBbr29xgkn5AQt12Fbediy1rrcC
         iHU5gwK6JXKuap5Q1K7ZWEHCpYah/bxgqzwBr1yWkZ7mh7r58y1ARcbbZcV8tzEpyFZf
         VDgXJr/tDJG2F0g9ahkj0NkZFJvy+ATuc/EtdJZvDtU/skKpBzTkNMEHgFcM7dZ0S8Er
         0eHpqVt7Wim1e1rCAGgxA04h6ZrRWhIYTlP6NK+v9auLZyoJkLfTpVcTWrSdLfMq4V8r
         hjcdeqmxZeOMiEHhoNumsB/hafrv2w9DmhB2P7mDfgctEKEXOeNUvMmKfuAJRA7CSlDX
         2FeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680065980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2nyBWkEl893cb8p3Xcv9ddibZeqm3dx5h/n4mJzM0I=;
        b=pD1KxzxD5s6KZiMcCkPTMGZm6CjdZGV7T9X6YmmWQGG+Fg10nZlQqDa0AbHQkpBTnf
         KtkqkZjmAsumB5fy2alNlAssmk9Cp/9LPWp578hn5oAVw6NR0j/yZ4bHS9uWb5vxkiB0
         NURB2iqBLyfZpxvWiWkpd9BvwLWY10y3L3zf7RVMs0lse5esJE1XxjjkDlQB003vYF3D
         oshBmlRIf1ShSWBFfWNOQlK9gZvKaB6wHRRI/Ks038YMdEc1Ty8N8OCg70YjXwcopR3l
         bZcfW6U9PlNWukAuQ1N12nDh5oKyDbFE3RMDVeEHrxNnUlTS5BgFmSZVU5IotgrVfij7
         iamA==
X-Gm-Message-State: AO0yUKWSC9LFfOPiGh4+QtFugE8wZTi0faTC12PK6Ytph3N5hMWL0rpE
	a3F2lCw7jQINL22Et4qwvdAvGw==
X-Google-Smtp-Source: AK7set/hrrFzd6yhsYIengKEXesiDvT2OHC1fUfzzUtI8h99/a73zFv/Utk9ctYdbI75FCHmhSsncw==
X-Received: by 2002:a05:600c:209:b0:3ee:282d:1016 with SMTP id 9-20020a05600c020900b003ee282d1016mr13218010wmi.25.1680065980323;
        Tue, 28 Mar 2023 21:59:40 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id q18-20020a7bce92000000b003ef71d541cbsm842566wmj.1.2023.03.28.21.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 21:59:39 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v9 6/6] riscv: Use --emit-relocs in order to move .rela.dyn in init
Date: Wed, 29 Mar 2023 06:53:29 +0200
Message-Id: <20230329045329.64565-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230329045329.64565-1-alexghiti@rivosinc.com>
References: <20230329045329.64565-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To circumvent an issue where placing the relocations inside the init
sections produces empty relocations, use --emit-relocs. But to avoid
carrying those relocations in vmlinux, use an intermediate
vmlinux.relocs file which is a copy of vmlinux *before* stripping its
relocations.

Suggested-by: Björn Töpel <bjorn@kernel.org>
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Makefile          |  2 +-
 arch/riscv/Makefile.postlink | 13 +++++++++++++
 arch/riscv/boot/Makefile     |  7 +++++++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 860b09e409c7..7dc6904a6836 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -8,7 +8,7 @@
 
 OBJCOPYFLAGS    := -O binary
 ifeq ($(CONFIG_RELOCATABLE),y)
-	LDFLAGS_vmlinux += -shared -Bsymbolic -z notext -z norelro
+	LDFLAGS_vmlinux += -shared -Bsymbolic -z notext -z norelro --emit-relocs
 	KBUILD_CFLAGS += -fPIE
 endif
 ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
index d5de8d520d3e..a46fc578b30b 100644
--- a/arch/riscv/Makefile.postlink
+++ b/arch/riscv/Makefile.postlink
@@ -15,12 +15,25 @@ quiet_cmd_relocs_check = CHKREL  $@
 cmd_relocs_check = 							\
 	$(CONFIG_SHELL) $(srctree)/arch/riscv/tools/relocs_check.sh "$(OBJDUMP)" "$(NM)" "$@"
 
+ifdef CONFIG_RELOCATABLE
+quiet_cmd_cp_vmlinux_relocs = CPREL   vmlinux.relocs
+cmd_cp_vmlinux_relocs = cp vmlinux vmlinux.relocs
+
+quiet_cmd_relocs_strip = STRIPREL $@
+cmd_relocs_strip = $(OBJCOPY)   --remove-section='.rel.*'       \
+                                --remove-section='.rel__*'      \
+                                --remove-section='.rela.*'      \
+                                --remove-section='.rela__*' $@
+endif
+
 # `@true` prevents complaint when there is nothing to be done
 
 vmlinux: FORCE
 	@true
 ifdef CONFIG_RELOCATABLE
 	$(call if_changed,relocs_check)
+	$(call if_changed,cp_vmlinux_relocs)
+	$(call if_changed,relocs_strip)
 endif
 
 %.ko: FORCE
diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index c72de7232abb..22b13947bd13 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -33,7 +33,14 @@ $(obj)/xipImage: vmlinux FORCE
 
 endif
 
+ifdef CONFIG_RELOCATABLE
+vmlinux.relocs: vmlinux
+	@ (! [ -f vmlinux.relocs ] && echo "vmlinux.relocs can't be found, please remove vmlinux and try again") || true
+
+$(obj)/Image: vmlinux.relocs FORCE
+else
 $(obj)/Image: vmlinux FORCE
+endif
 	$(call if_changed,objcopy)
 
 $(obj)/Image.gz: $(obj)/Image FORCE
-- 
2.37.2

