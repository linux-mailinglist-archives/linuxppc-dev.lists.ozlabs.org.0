Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F384F5F0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 15:42:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WGvH0DQVzDqbC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 23:42:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="J1+uvRS3"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WGKS4kwSzDqZw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 23:16:28 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id 196so4686496pgc.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 06:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TnKr7BDBmRsQRMGBTBUWFjslhckVJUguzYPCN/7SQhU=;
 b=J1+uvRS3wgPtbnCiaqIlDL+0wI82Rxm+PMEaTgUQLbT4o76tkmmIhkw7jTReq5Rs16
 me45ZETCDhee+YznvrUzb3ws1w2XleReb5BtKu40NTU8onKRNer35auBUcBfbdnmiR87
 9tD1Cy7WYEgD6vOimoxOJiOUR3O7SIAn71qJXENr19gTprwSQeV5H1waKJa29x6LfPle
 cHv9/hZ6FSo+ADvgMFKEDj40dUpfwBWhdlIhr/svip2x5PujJnDAZOeVUNdlp4zQCbid
 3YROywBsE3PFnH3Uh6L3PHitcNyDGbhCCiUqiE9PPAWQYJISX5qbPlTAs/vw0v4/puh/
 IR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TnKr7BDBmRsQRMGBTBUWFjslhckVJUguzYPCN/7SQhU=;
 b=GvtaICs/JmFiWcmgMiyxU8XeNiv+D1ZaRlPbFqSnf9u746JRxzpr7fQmLZPmS898Rt
 5Dt+2YHNR4EuLOmlINqFSIC+t2+0B34VoW0AzDGExcmY2wXV8oHt9FWRoXzqCjWC3h3z
 8VKBHkKZGKlPpyNBwXxE+mDaQwCzC9f3u89wW8v29Vf7XkodCaRnHyi0FfVNsV5fiyhT
 vbqVHDCfQlXMrwGulhXEMo3ZxInRajME0sDkJaxEcqyF+P6Gt4XjUeePRydgrIrgrDxb
 8Gu0rbvXeuFrINax+H9DIcrzZfeD6Vkb5FfHuDF733UithNAdU1h2KmNRAjqmpQRZxL/
 FmYw==
X-Gm-Message-State: APjAAAVG5Y1yr1MvlEH/wNhOQM4m+OAb6H/478IL7haq3N6AIzKCIqjd
 vHRDAQ5vlVOHdF6jdB+eN6mg/Lf/ICE=
X-Google-Smtp-Source: APXvYqzAR9xmJ6GJGFnifS6xRVLiYB59YTerSVYLrK1HfVbLBYEgCnoQ+9Ocuxl2iFchSy/j0DVjtg==
X-Received: by 2002:a17:90a:a397:: with SMTP id
 x23mr13364276pjp.118.1561209386058; 
 Sat, 22 Jun 2019 06:16:26 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.144.136.2])
 by smtp.gmail.com with ESMTPSA id n1sm5192471pgv.15.2019.06.22.06.16.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 06:16:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 08/25] powerpc/64s/exception: KVM handler can set the HSRR
 trap bit
Date: Sat, 22 Jun 2019 23:15:18 +1000
Message-Id: <20190622131535.20996-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190622131535.20996-1-npiggin@gmail.com>
References: <20190622131535.20996-1-npiggin@gmail.com>
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

Move the KVM trap HSRR bit into the KVM handler, which can be
conditionally applied when hsrr parameter is set.

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 5 +++++
 arch/powerpc/include/asm/head-64.h       | 7 ++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 737c37d1df4b..1d8fc085e845 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -449,7 +449,12 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	ld	r10,\area+EX_R10(r13)
 	std	r12,HSTATE_SCRATCH0(r13)
 	sldi	r12,r9,32
+	/* HSRR variants have the 0x2 bit added to their trap number */
+	.if \hsrr
+	ori	r12,r12,(\n + 0x2)
+	.else
 	ori	r12,r12,(\n)
+	.endif
 	/* This reloads r9 before branching to kvmppc_interrupt */
 	__BRANCH_TO_KVM_EXIT(\area, kvmppc_interrupt)
 
diff --git a/arch/powerpc/include/asm/head-64.h b/arch/powerpc/include/asm/head-64.h
index 518d9758b41e..bdd67a26e959 100644
--- a/arch/powerpc/include/asm/head-64.h
+++ b/arch/powerpc/include/asm/head-64.h
@@ -393,16 +393,13 @@ end_##sname:
 	TRAMP_KVM_BEGIN(do_kvm_##n);					\
 	KVM_HANDLER area, EXC_STD, n, 1
 
-/*
- * HV variant exceptions get the 0x2 bit added to their trap number.
- */
 #define TRAMP_KVM_HV(area, n)						\
 	TRAMP_KVM_BEGIN(do_kvm_H##n);					\
-	KVM_HANDLER area, EXC_HV, n + 0x2, 0
+	KVM_HANDLER area, EXC_HV, n, 0
 
 #define TRAMP_KVM_HV_SKIP(area, n)					\
 	TRAMP_KVM_BEGIN(do_kvm_H##n);					\
-	KVM_HANDLER area, EXC_HV, n + 0x2, 1
+	KVM_HANDLER area, EXC_HV, n, 1
 
 #define EXC_COMMON(name, realvec, hdlr)					\
 	EXC_COMMON_BEGIN(name);						\
-- 
2.20.1

