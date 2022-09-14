Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E5C5B8C48
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 17:52:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSPx14dt9z3cjD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 01:52:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Wo0C5o7g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Wo0C5o7g;
	dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSPqx2zNlz3c3L
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 01:48:12 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id g4so14725522pgc.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 08:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BNtk20fZIdaS4uhCdZPu4YrbRzA6YvnBaxycWKCCMAw=;
        b=Wo0C5o7gy0BsxE7RDGZzaxX1otFCwFBJXjkS7LqTlJJXr1gwv7bJA+yiIw2fc/Lx8x
         0qjIgjTGqH7Me50DfIKh4i83G38gAbn9ug3X5rO3Lbe3S+tOuGsiUD+iNQivoTYq/HXC
         441LwTl25YkHtS8MvnpRTQIxnwfYKXsjJ+SxhdL+iwdqhn8Lex2MEtI0TQkaOjuo1j1P
         jkN86fZhUxl1ysGRaELz6FTfyAYYMBWo3OR8r9k+snWIsFV4NnT5xt45mjN4FylaoDsp
         eY/fMC5qz1CrwCCGPZ9FjEEPLY0C/8ptJ/4ZngDZRuo71Ck2/A0frc4AnGTfo5+6jWt9
         sB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BNtk20fZIdaS4uhCdZPu4YrbRzA6YvnBaxycWKCCMAw=;
        b=kFzhKp7kCBMLHVsgXtTtVEhamDbHQPX/fuPqbTV3OcHeVo2s5uIn1BrqanbBiSspJ6
         MOemiPJ5RxzgfBGI6RiVVSrvMX6jzcrtgu2Q4lzoPb9T6mZ4Gz5UvuZH9ckAgkfKhRu/
         hOPXHooY7lAPxlWzsuOEFYDw7aYGVmD7JEggDFwaj48JjSmZ2jyI/0H/hqEDKeFJX6M7
         /S703zF43PUfop3hgMzzKLWFwTOf4gYLBjfv3cx1WbEY6utIEMd8yMBVxn0jHf3C13+H
         oAYkIEpanfObl0Ki32x8CdwmThuNbYyb+GVYCKonKr1KPqiq5ZvBTh6KNASdQ1G8mHkc
         KTeg==
X-Gm-Message-State: ACgBeo30Vd9nAlKH9nx92yMIGpFyHA8Mko4DJhdMPKyeijXfFL7yFPMC
	xI9SQ2yqfrRo4KOLLeKS1w89ivKYscM=
X-Google-Smtp-Source: AA6agR4Pgv84sqiKUh1DGKLxu9/h8WKZZqfyw709DrHLHS41WaYleRDrrDDiOABbnYwVQHISUSnbFg==
X-Received: by 2002:a63:4d43:0:b0:438:cd6f:f8dd with SMTP id n3-20020a634d43000000b00438cd6ff8ddmr17668126pgl.259.1663170490446;
        Wed, 14 Sep 2022 08:48:10 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id i7-20020a17090332c700b00177e263303dsm9919892plr.183.2022.09.14.08.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 08:48:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 7/7] powerpc/64/build: merge .got and .toc input sections
Date: Thu, 15 Sep 2022 01:47:46 +1000
Message-Id: <20220914154746.1122482-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220914154746.1122482-1-npiggin@gmail.com>
References: <20220914154746.1122482-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Follow the binutils ld internal linker script and merge .got and .toc
input sections in the .got output section.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/vmlinux.lds.S | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 404944263db8..f7271bf78150 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -169,13 +169,12 @@ SECTIONS
 	}
 
 	.got : AT(ADDR(.got) - LOAD_OFFSET) ALIGN(256) {
-		*(.got)
+		*(.got .toc)
 #ifndef CONFIG_RELOCATABLE
 		__prom_init_toc_start = .;
 		arch/powerpc/kernel/prom_init.o*(.toc)
 		__prom_init_toc_end = .;
 #endif
-		*(.toc)
 	}
 
 	SOFT_MASK_TABLE(8)
-- 
2.37.2

