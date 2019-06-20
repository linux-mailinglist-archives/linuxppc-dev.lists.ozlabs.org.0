Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2C74C6D1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 07:34:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tr9l4hKwzDqRc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 15:34:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HEWu8TCg"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TqlC1Rs4zDqtv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:15:19 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id v9so902357pgr.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TnKr7BDBmRsQRMGBTBUWFjslhckVJUguzYPCN/7SQhU=;
 b=HEWu8TCgFkEQMXkrW/ivrXIFxY2aMhnaQRMLJXflI50Gm6TUh6iWgwMSg/V43xsynq
 ZrxVO5fF3Y41DKUAkQdSqfXt9Ex67GukHME2PkjK9fmslFMv2BGvrLUQ1/pIswRATT8N
 SUFaSjgU7fH7uFo2MJ+nzz92S7f5XJFiZpb3TrGnhymoXNQe2V0x3lHWxXyI+ruFnwyJ
 8ATJ5xMcUb22jJtQZcTEcVFsY1KzlV9o1RgVED/5jKq6rL+n9SxTOvKx5NUg/KGVQikK
 0vJOsZHiD99TNAm20AqAMP4197bahilXNkr2RGwyZt+ddoaC5gIJPhEKr9C2mJRk/HJi
 IkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TnKr7BDBmRsQRMGBTBUWFjslhckVJUguzYPCN/7SQhU=;
 b=CnVqADetwX7SXM/lEjeSDyhWqiG1XFAGO/RIPuGIBhrCE0oDFBO0iBEU2iWo5Bhnwd
 69rZ0z4TtJwFsJE+919EPtn6vvORPx6VkAW8be3SX3vb3IexSsKiz9Sq+PJWzGGEPRSs
 XbW68D/1wR2pUIMJCw7/QsanD1EsdzLAJ+L1NWkf/9S0S5PfBSpznYciAnzXNkVdU3cd
 2/JoQUH6u06jPhE0LeV+KYa3Jp9n9blXFO7MLOY0dI0F3fqqR9O+mvdbAWX/mi+69RTq
 eZBrgTcgaws91n/igzREV/dpfjp3bxmyCzJkNJ4CcDX/TYKxtKgGFY9UOFpJ6XISc5r/
 MEqw==
X-Gm-Message-State: APjAAAVLHhNw2OoS69RhKXa9YAIvq969fx1oeJHYnyMRuOw4HcVYDRvw
 8g3YfT1sajO/heHJ2Kc+UkJ/jDDP
X-Google-Smtp-Source: APXvYqzrKLCmPtnoVdeNYcDeZBcrK2AFomGk2sSrM/P86Zjr1sr0IYc1tgUCuWwgkVpepXuW5a1iwA==
X-Received: by 2002:a17:90a:b903:: with SMTP id
 p3mr1069941pjr.79.1561007717312; 
 Wed, 19 Jun 2019 22:15:17 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.15.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:15:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 09/52] powerpc/64s/exception: KVM handler can set the HSRR
 trap bit
Date: Thu, 20 Jun 2019 15:14:16 +1000
Message-Id: <20190620051459.29573-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620051459.29573-1-npiggin@gmail.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
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

