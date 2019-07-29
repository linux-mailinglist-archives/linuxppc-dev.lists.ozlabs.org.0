Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DD978E67
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 16:52:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y2hg5GX4zDqHS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 00:52:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QTnZx52+"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y1rb3LsYzDq96
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 00:13:51 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id s1so22035602pgr.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 07:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sh5Gm7v6ODvnGz6CWlfDlGkjyNVSSQtjajoVB/Z6WAM=;
 b=QTnZx52+laYQhmZE687YXZah9ooXIFDhUJIFoLh0dc4QaVnUA7aNzZIP23nXiGJba0
 PvCumCe8HtrHY49nPqX2S+9aFQrvRsDm2i+3hKu8wVvO2ntDMQ3js/ek7b3bRiq5G4AY
 PS/BA1FR5C2ftq9KVPupuGnOpxhT/qWW6j4tpru0rVrYwTPAcKHfX+AAydhzK6HhgI5A
 7MviLRZW6P8Q6E2EPnDCU7n5D4FxuUMZBpPYtM43TMTD972zjdE9ETY393SwFXQzJu4K
 spdwvJ1oiDcTCUZRmh4rPEWMM3mRHoD+LX7vUub2VPUOoIYv7DvyVZ16qbRFXDfL59Jz
 4cqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sh5Gm7v6ODvnGz6CWlfDlGkjyNVSSQtjajoVB/Z6WAM=;
 b=RQLN5/3S/hY3EFB8PP4cKarXevb9WUglYokv5BUMH7J1n8DAhPuHaOS0P4YVqoivk/
 umzrzoNyPAAOTnUjE0Rm1mTOxodBWDh8SATWAV4yoJrMB8f/C+NDitQivavdzTR+MF4V
 SjYjEd+SmCxPDDOhTrniNZO9ATVyb/EC00ceBiK34QX+8YbyjVPr60syglmjkeBqpv/y
 8/XTitgz+0M6NOfy/gt5XL4QsfhgLbfql2Wz8u0Uy0qpJRFmrs/8P5igzwSDMgPt77RT
 0USA6hkP7qkqGNFAATcciM78H9BfBe7qwAKoTgiymcq0YSG7gkzTMHDyMVOqueK9hFpS
 75+w==
X-Gm-Message-State: APjAAAX+VWENLw7L6nNHfNmcQisPAY4uHkPIECXP3WMN/nVNgxVBNN6l
 U7NVKU2JB4oDH5D8JQ+g92xmegzC2N4=
X-Google-Smtp-Source: APXvYqyFpbGxkZcsODAfNrncXy1XkgrWInCNaBmnnxLoxg05T9lVD6Qj031EBA9ryglGYTo7mnexEQ==
X-Received: by 2002:a17:90a:24ac:: with SMTP id
 i41mr111036002pje.124.1564409628802; 
 Mon, 29 Jul 2019 07:13:48 -0700 (PDT)
Received: from bobo.local0.net (61-68-184-39.tpgi.com.au. [61.68.184.39])
 by smtp.gmail.com with ESMTPSA id u7sm53960083pfm.96.2019.07.29.07.13.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 07:13:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/18] powerpc/64s/exception: INT_HANDLER support HDAR/HDSISR
 and use it in HDSI
Date: Tue, 30 Jul 2019 00:12:38 +1000
Message-Id: <20190729141247.26762-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729141247.26762-1-npiggin@gmail.com>
References: <20190729141247.26762-1-npiggin@gmail.com>
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
index 1c07b5fc6692..e5122ace5f05 100644
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

