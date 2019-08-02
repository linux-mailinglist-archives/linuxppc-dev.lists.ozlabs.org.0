Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEDE7F644
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 13:57:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460QdR6JbnzDr5L
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:57:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MJbHYtWS"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PMs3QJZzDqXX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:00:41 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id c2so33486697plz.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eTwlR9hor/fgsxYh9yA7mzaRcbzeKiOdEKUnAksMzYQ=;
 b=MJbHYtWSPVrpr99GKHSfcgzBHUvJO0juct/D9abasY4w0QI9q8/RHp4njeA7IAirv2
 YGp/SAqKqpv8VmVKZ34i7XWBp93soaXbAUhCUlmJtd3UDsd24/MC9Wq6OShFKKwesT9a
 Exrwh+ywz1QNVcTs8uA2BERIKm0VGWq+zhjkm5WUimdncW+ddu7sRrYyzo04dJJ3zUTR
 /+IFmr1FZZ4gmMH0RsYM7TVZ0BweWZMuzlfGe9guONspIsiAxQ4np6hr1Qjj3NQ/lWL3
 nr9mVLDk9SGfWWIUx1oufxXHpHj8rvhTrQxftCFrhTt/DyGJi/wJj7AImYhWn3h4UKmi
 xDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eTwlR9hor/fgsxYh9yA7mzaRcbzeKiOdEKUnAksMzYQ=;
 b=huHApc6AlPzkznkJk9BHJSlMYVxk6JTX3nqNrKUKf3A5B8GbujnY3//f2kGXz8VPEY
 0dpvmg3uYs+1GEgCaHrc1FP/lqj2YBQ++29Jpqrxlcj2WLVXP1bKVj+EtLVb0FAICk0s
 bZR5y3H2fxDVIQSDgmtWsw7zjh8FhHiEmDhCnavNxcGZEOO144YVYEjQx86boNg+9Ptx
 qdU02eRVwIidODzdEja+qLoOOqJXMGrvBuxWrsZFZYpb4v7RJi3wtzbxk5TDn3Xx3drX
 nbGp5rQ9vNeIvMjAtoC6nu6cuIZABJKVGu1yoh6GwThdCx7MBd/2GceLRQRa1wXVWxYx
 TJKQ==
X-Gm-Message-State: APjAAAUQwCrIpvU9V4/VoXMIiunpvMMl1Jd3GIJynQSoNxDbcmoftiVS
 t21mH/nbpibOa1ywdWdlTUGhrIPAt+8=
X-Google-Smtp-Source: APXvYqzulC4/CfwBYmC+iQtiF6lJ2PLVt3Ypg/2z7dcXiEB6aTVMrcmABS47EYHCcDf+oY7bs95J2w==
X-Received: by 2002:a17:902:aa5:: with SMTP id
 34mr135370715plp.166.1564743639565; 
 Fri, 02 Aug 2019 04:00:39 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.00.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:00:39 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 25/44] powerpc/64s/exception: INT_HANDLER support
 HDAR/HDSISR and use it in HDSI
Date: Fri,  2 Aug 2019 20:56:50 +1000
Message-Id: <20190802105709.27696-26-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 45e9f8bd551d..c7fb9366ac5a 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -620,11 +620,19 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 	GET_SCRATCH0(r10)
 	std	r10,\area\()+EX_R13(r13)
 	.if \dar
+	.if \hsrr
+	mfspr	r10,SPRN_HDAR
+	.else
 	mfspr	r10,SPRN_DAR
+	.endif
 	std	r10,\area\()+EX_DAR(r13)
 	.endif
 	.if \dsisr
+	.if \hsrr
+	mfspr	r10,SPRN_HDSISR
+	.else
 	mfspr	r10,SPRN_DSISR
+	.endif
 	stw	r10,\area\()+EX_DSISR(r13)
 	.endif
 
@@ -1564,17 +1572,13 @@ EXC_COMMON(single_step_common, 0xd00, single_step_exception)
 
 
 EXC_REAL_BEGIN(h_data_storage, 0xe00, 0x20)
-	INT_HANDLER h_data_storage, 0xe00, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER h_data_storage, 0xe00, 1, 0, 0, EXC_HV, PACA_EXGEN, 1, 1, 1, 0, 1
 EXC_REAL_END(h_data_storage, 0xe00, 0x20)
 EXC_VIRT_BEGIN(h_data_storage, 0x4e00, 0x20)
-	INT_HANDLER h_data_storage, 0xe00, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 0, 0, 0, 1
+	INT_HANDLER h_data_storage, 0xe00, 1, 0, 1, EXC_HV, PACA_EXGEN, 1, 1, 1, 0, 1
 EXC_VIRT_END(h_data_storage, 0x4e00, 0x20)
 TRAMP_KVM_HV_SKIP(PACA_EXGEN, 0xe00)
 EXC_COMMON_BEGIN(h_data_storage_common)
-	mfspr   r10,SPRN_HDAR
-	std     r10,PACA_EXGEN+EX_DAR(r13)
-	mfspr   r10,SPRN_HDSISR
-	stw     r10,PACA_EXGEN+EX_DSISR(r13)
 	EXCEPTION_COMMON(PACA_EXGEN, 0xe00)
 	bl      save_nvgprs
 	RECONCILE_IRQ_STATE(r10, r11)
-- 
2.22.0

