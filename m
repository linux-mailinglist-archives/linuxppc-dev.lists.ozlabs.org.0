Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C867A5ADF5E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 08:06:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMFJ42BKDz3dpF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 16:06:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HG1TyKZn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HG1TyKZn;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMFFY475dz3bbj
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 16:04:01 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id p18so10291112plr.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Sep 2022 23:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=XJhviWUa1iDtZtz2IY3LCKwSVMIPPlufgF6evb/LdAI=;
        b=HG1TyKZnxwqp+pOQHjhWP50vL/WsqSB1monycwX+le6395HC9sRdrLDDau07m4Uv/s
         zEJLRZjBMCeI0C0Sg5CtMDtTJI0nvZwAw4s/mPc6+aS27Coh/16ft2e+LxCtZajKrre3
         xsS9ffJ89cPEpgIdY9dl7NThDvVeOhqYqzK5Rcov75DfHWjVmKjr8ATu8B8d2D38PLXJ
         2tTV4zz2MkKAQek45yd1OTA4dzbOjhFSEDQUfg4kyO4vlxCSC/YN9vaBXuCxQRpaHawO
         1MWhYCLX7TcLffE09IYGdCylEkBMA6YqhHkvntZrak9RiZUHrqqNp3aslmf+P8reWyh1
         aILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XJhviWUa1iDtZtz2IY3LCKwSVMIPPlufgF6evb/LdAI=;
        b=Tk5OORLwNyfdr4SctYt2z9XR74m/s8wBuWQhhfD9Q7g5Ft6J7lRZeAMVpBaegVZ/Hb
         8IOvx6w6Ey6QRE17AOgdOBYKe9M9t/7aZLT+9X6fzXdDPKaKwOmcDdu8cU3+pSsRtwey
         n8ENSaH8a5BcRCRZjEX1JRc334qpd9ZZPdAjnvgSgreRZjbwOXDzGFoNutIPprLPybtY
         BJR9vLI86ptar/p7wlXPHJIE6pcqlKnLmS36akVzc1G0thE01YwYa/ExAem9H6gbs+gb
         WKb+xrum1ILJ+hKeRA7PZRnPcloAxHpPpwsRKTDoEm95ZNSVxRbIv4H339JIsMU8zYLv
         P/Tg==
X-Gm-Message-State: ACgBeo2//PU4Jc6h1Idn/TRBR+AKpPSyFMJ8GHGptvPQtIwkWPihYyvw
	574AakuSfgr/RYt6EaDI9O+nqyhEJIw=
X-Google-Smtp-Source: AA6agR5/kQXdjRVhPxjYYw6jZQPvl3N/UOQFReeOXg7blFQU2G/VdWUm/Z7ob0Srud+Mb5768GeKMA==
X-Received: by 2002:a17:902:ab8d:b0:172:9382:4d1e with SMTP id f13-20020a170902ab8d00b0017293824d1emr52518603plr.133.1662444238901;
        Mon, 05 Sep 2022 23:03:58 -0700 (PDT)
Received: from bobo.ibm.com ([124.170.18.239])
        by smtp.gmail.com with ESMTPSA id u126-20020a626084000000b005383988ec0fsm8934864pfb.162.2022.09.05.23.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 23:03:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/3] powerpc/64s/interrupt: masked handler debug check for previous hard disable
Date: Tue,  6 Sep 2022 16:03:37 +1000
Message-Id: <20220906060337.3302557-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906060337.3302557-1-npiggin@gmail.com>
References: <20220906060337.3302557-1-npiggin@gmail.com>
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
Cc: Sachin Sant <sachinp@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Prior changes eliminated cases of masked PACA_IRQ_MUST_HARD_MASK
interrupts that re-fire due to MSR[EE] being enabled while they are
pending. Add a debug check in the masked interrupt handler to catch
if this occurs.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 3d0dc133a9ae..dafa275f18bc 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2794,6 +2794,16 @@ masked_Hinterrupt:
 masked_interrupt:
 	.endif
 	stw	r9,PACA_EXGEN+EX_CCR(r13)
+#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
+	/*
+	 * Ensure there was no previous MUST_HARD_MASK interrupt or
+	 * HARD_DIS setting.
+	 */
+	lbz	r9,PACAIRQHAPPENED(r13)
+	andi.	r9,r9,(PACA_IRQ_MUST_HARD_MASK|PACA_IRQ_HARD_DIS)
+0:	tdnei	r9,0
+	EMIT_BUG_ENTRY 0b,__FILE__,__LINE__,0
+#endif
 	lbz	r9,PACAIRQHAPPENED(r13)
 	or	r9,r9,r10
 	stb	r9,PACAIRQHAPPENED(r13)
-- 
2.37.2

