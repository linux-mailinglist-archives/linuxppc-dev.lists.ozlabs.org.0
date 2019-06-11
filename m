Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7483D082
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 17:13:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NYRn3zCVzDqTh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 01:13:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JQnEv66Z"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXZK5JwgzDqVL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:34:17 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id p1so5218633plo.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0oxxKBcx9pLzb0BhCqbsr4TSKdCDiAN9x5jD+aAfkok=;
 b=JQnEv66ZgQtp9v6XzRT3dgK08LU/dwg6BLWuZFRqZBPGq6CwqgKeAANR1Y3Na0qRSL
 dX7L/vD0iwPm+gjf7L+sKObU7baPgGzCA5iDSgpjSOMhWa1CX1lRej4Qas5SFoPtYmVQ
 Vr/5zCvR8tnduTfoXJHZQqb3sZv84uhoMQU6FVZAQAQAQVnJaS2mXJ9vs75/ft2HlEA7
 TRUcif8L46r/85VFSVyYRZ9MUHsnZ5qCvdslb6fQ0oKslalZLePXzJoZiz8wLsVJcdcb
 nOmxPZOzcnEBBXFDs6rb5nRLcgRoZ32APMkhlttzyUx0aEdruvkWV3F6sqUE6r2DcMn8
 l9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0oxxKBcx9pLzb0BhCqbsr4TSKdCDiAN9x5jD+aAfkok=;
 b=MOvfgQ1AvYgKuVpbsxsmU027fxR1CZ/Qd1zF41g2xW/xn/HwQpi7Go/pmpqlImiYca
 wLCkNtU4U7u4R5p1vL81GwyglDKB5FAAEyfSZVFxOcTRDohLhEp38KhcpOuqtiZLlnzm
 kYUfDlzgXyQDiCJImYGNqFHPQU834pKq7Xhu9duSE4EGwwWt0W9QYEUMgLCy4F3+WH+s
 rNzeWMt9Bt7gmaoIoPc1EblBd9/h5O46msLnFF2n+91hwTwrRt8UOZ2xMDKKQHQ0wu6m
 TV0hu58L3QGSBsob0RyJM2kXgT3nuw8kVi+bTAK3YwWsCNR9jne3Qb694sx9SHVsAXp0
 MQew==
X-Gm-Message-State: APjAAAXWZlDhukI47cV761guKHTVNnjfO8Jr/fXWB6XpNIsVNm5aXC8s
 gIMiq/DUqrONYB7tN/ztYg9DTQ9u
X-Google-Smtp-Source: APXvYqwoyvRLjONEnBkyI7ajo4+aY/VUfrJNUBvTCivIHtwsY4Lwd3ZuAk6wsp0uvzKn8b2mo+Px7A==
X-Received: by 2002:a17:902:7087:: with SMTP id
 z7mr11935437plk.184.1560263654102; 
 Tue, 11 Jun 2019 07:34:14 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.34.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:34:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 14/28] powerpc/64s/exception: improve 0x500 handler code
Date: Wed, 12 Jun 2019 00:30:26 +1000
Message-Id: <20190611143040.7834-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611143040.7834-1-npiggin@gmail.com>
References: <20190611143040.7834-1-npiggin@gmail.com>
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

After the previous cleanup, it becomes possible to consolidate some
common code outside the runtime alternate patching. Also remove
unused labels.

This results in some code change, but unchanged runtime instruction
sequence.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index b8dba3fffeeb..c95dfc618a52 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -746,32 +746,24 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 
 
 EXC_REAL_BEGIN(hardware_interrupt, 0x500, 0x100)
-	.globl hardware_interrupt_hv
-hardware_interrupt_hv:
+	SET_SCRATCH0(r13)	/* save r13 */
+	EXCEPTION_PROLOG_0 PACA_EXGEN
 	BEGIN_FTR_SECTION
-		SET_SCRATCH0(r13)	/* save r13 */
-		EXCEPTION_PROLOG_0 PACA_EXGEN
 		EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
 		EXCEPTION_PROLOG_2_REAL hardware_interrupt_common, EXC_HV, 1
 	FTR_SECTION_ELSE
-		SET_SCRATCH0(r13)	/* save r13 */
-		EXCEPTION_PROLOG_0 PACA_EXGEN
 		EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
 		EXCEPTION_PROLOG_2_REAL hardware_interrupt_common, EXC_STD, 1
 	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 EXC_REAL_END(hardware_interrupt, 0x500, 0x100)
 
 EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
-	.globl hardware_interrupt_relon_hv
-hardware_interrupt_relon_hv:
+	SET_SCRATCH0(r13)	/* save r13 */
+	EXCEPTION_PROLOG_0 PACA_EXGEN
 	BEGIN_FTR_SECTION
-		SET_SCRATCH0(r13)	/* save r13 */
-		EXCEPTION_PROLOG_0 PACA_EXGEN
 		EXCEPTION_PROLOG_1 EXC_HV, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
 		EXCEPTION_PROLOG_2_VIRT hardware_interrupt_common, EXC_HV
 	FTR_SECTION_ELSE
-		SET_SCRATCH0(r13)	/* save r13 */
-		EXCEPTION_PROLOG_0 PACA_EXGEN
 		EXCEPTION_PROLOG_1 EXC_STD, PACA_EXGEN, 1, 0x500, IRQS_DISABLED
 		EXCEPTION_PROLOG_2_VIRT hardware_interrupt_common, EXC_STD
 	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE)
-- 
2.20.1

