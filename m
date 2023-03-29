Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F036CD150
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 06:56:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmZ5K6frJz3fWx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 15:56:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=E3Z4Yqho;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=E3Z4Yqho;
	dkim-atps=neutral
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmZ4X0Z5zz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 15:55:39 +1100 (AEDT)
Received: by mail-wm1-x32a.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so5334978wmq.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 21:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680065736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwZQgZuukK5ZcMfwhQ8cOp9XaPAwPgUAMS4WLeQguqk=;
        b=E3Z4Yqhoin1W8r2t+Jyhb4Jqxbb/dLpgY31WgMC/8f4M9Agb0OzJlakAr0drlghh2B
         ZtOOx+SrUI2+Y2A2rSR9cMwIRUMF5pNcTOP1QTN3TGiqltjw5qd92s7SeTRGf1Falocp
         QTJ5ejL81s/SAgZfBKC69BFU2tmVRBauch20G2Y5j6xUaUdlA0SGZopmV6daT6VRNgRI
         IJS+IFtjoBb0K1xT2ifMxLBr8JTiqs+T8R/Rth3HfyOLzpfjohMpDGfFJaDQgExXIBL/
         5H7bEEdsD0Sy58CqDhf7boCxDSJekNe+SKevoFuOkns50ZDd6e9wroN5P47Q03l4x0Sl
         VTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680065736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwZQgZuukK5ZcMfwhQ8cOp9XaPAwPgUAMS4WLeQguqk=;
        b=LDOepbLswHZ/lTvV6nywliIlHb/G7u+VgB45rErZpUb0cDKY7z7K9CDaHSypl9Njb9
         6yKOfyJCzzSXxkTPIOCA7VlttMk5nG+zouvHj3zz0JjTNHhZStof+h0in5FhNp7Mt2vO
         N9crmIKIXlyv2JWlzr4uJS/m5FYZKOCbpbNgU41sHfqjqzBdnmSA2TKDYVcdkZScYBR9
         XSm81b0VcEfOoa4/cyrHPpImak/afawL4+gaRD4RECBRXOzHBJ+Y8LDmfCKXvCB2N/ly
         H96tKDNtix9Xhzzfp0HQU0M0U2mbz8rm7WB4jtdSRW4Y1NeOQalFxNrhwPdFQSTq2IR2
         X9/A==
X-Gm-Message-State: AO0yUKUmOVTqpm3OcZVpm5BSXtu3GmkZqdR/CczV+qspJw2DYkhdOcaA
	JXP+womPulmtDmM5jiR5oxushQ==
X-Google-Smtp-Source: AK7set+5IRHyYxxuib+WjeFew51ry16Zrb5/PPkIgLCKxGSq+H5MoxgqvQV7tTLU4AjobT2NNsYQgQ==
X-Received: by 2002:a7b:cbd2:0:b0:3ee:3e07:5d26 with SMTP id n18-20020a7bcbd2000000b003ee3e075d26mr13763028wmi.24.1680065735865;
        Tue, 28 Mar 2023 21:55:35 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id c1-20020a05600c0a4100b003ee5fa61f45sm840822wmq.3.2023.03.28.21.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 21:55:35 -0700 (PDT)
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
Subject: [PATCH v9 2/6] riscv: Move .rela.dyn outside of init to avoid empty relocations
Date: Wed, 29 Mar 2023 06:53:25 +0200
Message-Id: <20230329045329.64565-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230329045329.64565-1-alexghiti@rivosinc.com>
References: <20230329045329.64565-1-alexghiti@rivosinc.com>
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a preparatory patch for relocatable kernels: .rela.dyn should be
in .init but doing so actually produces empty relocations, so this should
be a temporary commit until we find a solution.

This issue was reported here [1].

[1] https://lore.kernel.org/all/4a6fc7a3-9697-a49b-0941-97f32194b0d7@ghiti.fr/.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/vmlinux.lds.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 1c38294580c0..e05e6df44225 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -96,10 +96,6 @@ SECTIONS
 		*(.rel.dyn*)
 	}
 
-	.rela.dyn : {
-		*(.rela*)
-	}
-
 	__init_data_end = .;
 
 	. = ALIGN(8);
@@ -126,6 +122,10 @@ SECTIONS
 		*(.sdata*)
 	}
 
+	.rela.dyn : {
+		*(.rela*)
+	}
+
 #ifdef CONFIG_EFI
 	.pecoff_edata_padding : { BYTE(0); . = ALIGN(PECOFF_FILE_ALIGNMENT); }
 	__pecoff_data_raw_size = ABSOLUTE(. - __pecoff_text_end);
-- 
2.37.2

