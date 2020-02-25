Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FD516EE52
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 19:49:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Rnz96KFnzDqM4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:49:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jnlB1tRr; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmSF3Sg1zDqMy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:41:01 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id a6so84932plm.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2kmYpifXS0eR5UZfBggC8KGou6uGUMJytskld+eyaak=;
 b=jnlB1tRr5ZnEhICnRPwiMh4klJYQP+WNaEPSXbzt0R99A/sjgYDW/NvphzasA1olEf
 hXwMdoprfLK01H42y4T5aid+54K6MLvjw2gC4wGT93u1/HaegVZ38yLGi3vlFcEBc1Nb
 9TohPFe0wd0/dRf1dMXNPlWgePMN/FkxMzFkMT87hutrupEUTemyYQIiBibuYZ4iaSx+
 Ovjs+tF7WJ1m4il2BeGP4+ih75x0SkFnWousRo72lH8qdKX12KS6SGhEk9M5QgQ7q+zt
 B/pHBk+MFdIvaXjkZeL7HJc+N09ckLEjT+EGrRNEaXvIT22lojwAdEccgj4ILzHh5fLn
 JRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2kmYpifXS0eR5UZfBggC8KGou6uGUMJytskld+eyaak=;
 b=JjopeSZE/GjVWE3vxVFO2JzVrnqTK7Gd0W6zXoc3OL2LL2OOAIMtnbrBskCx/sfWv8
 TxsWPE15iObVOaNXq7A7WqzMOXMM5C9uUnTJ3ljqbLACgOXVOgXQ5M1RmfyPpp75wPBQ
 JxI+2CboAyOga7EMld70m7ZPo2x2IJoVznj7dp+M//ok5g6ct9Wi+ScenQ5tYCp64rvL
 eEN2NWn7fwPVS+ju1cRvHCdbqKDBugRBHRcfjwcXykaCR3Re956iWrNFCHdnTLlorw6r
 XFHxNm/EaJ10z8kwoD+uJJzY7wXEoPtzpnhcWK4nBq8xSVuF1BcnifUszwNqVdZFBUtw
 f+vg==
X-Gm-Message-State: APjAAAWVBgFilrKZZLJKT+uv048fIhbddPV7wDFKyJP0QApWNhKB9j0x
 or40OpUdasPNq/pj67wPulZojJQ2
X-Google-Smtp-Source: APXvYqwNsbD72MLAdMuo3Xmo3rXvFdQrulxcD7tGIoXes0B4YrrrWWg2XbNviQE+chHmKdZpE5ezrQ==
X-Received: by 2002:a17:902:223:: with SMTP id
 32mr56957384plc.167.1582652458414; 
 Tue, 25 Feb 2020 09:40:58 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:40:58 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 26/32] powerpc/64: system call zero volatile registers when
 returning
Date: Wed, 26 Feb 2020 03:35:35 +1000
Message-Id: <20200225173541.1549955-27-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225173541.1549955-1-npiggin@gmail.com>
References: <20200225173541.1549955-1-npiggin@gmail.com>
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
Cc: Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kernel addresses and potentially other sensitive data could be leaked
in volatile registers after a syscall.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_64.S | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 7404290fa132..0e2c56573a41 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -135,6 +135,18 @@ END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
 	cmpdi	r3,0
 	bne	.Lsyscall_restore_regs
+	li	r0,0
+	li	r4,0
+	li	r5,0
+	li	r6,0
+	li	r7,0
+	li	r8,0
+	li	r9,0
+	li	r10,0
+	li	r11,0
+	li	r12,0
+	mtctr	r0
+	mtspr	SPRN_XER,r0
 .Lsyscall_restore_regs_cont:
 
 BEGIN_FTR_SECTION
-- 
2.23.0

