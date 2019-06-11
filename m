Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCBD3D011
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 17:01:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NY9b0yRgzDqYn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 01:01:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oMks/Gcx"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXZ53qcfzDqb0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:34:03 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id i189so7549868pfg.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uevBjd1YMuteaZJQOFIg1O7zZGAeKPo/HStu4/xdcck=;
 b=oMks/GcxZqFtEX2FJbUGg3EFeyfOxgSNftlpIik6CWPqQYsLo1wETt2oodWpq6y6mc
 jWTDzQW2z02uc55yt5QvJ+TRyOyWzku6G7OgtpkbpVKLs9/k9am6FnteLEFhPVlfNq+D
 k4lIBeDtkN6rB7cv/MREg+7QpIb5p1ywqYbTdWOJtO8VJmsxrMRU3cS6vxV3m1txIvkd
 OL9068uVQ5lbwVihISdsETbLBZrwMU7hWyXRryES2n31UE1iM92mFE8CQhYv8CBkokg2
 ceIs6KhE+cbyf60EO/VoeQovhLMPzZ8ZtE2wgyjKkPM9zGsI8oxN0NzzxdJJ001z0DI3
 lLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uevBjd1YMuteaZJQOFIg1O7zZGAeKPo/HStu4/xdcck=;
 b=uf3xCDZ213KLN10gCh5GAH1nii1S8bhCKHdzhfR49xf9ZVUyXJlfBBNtt/hNldf8i4
 EFzTL5WVeuiuR2hWWK+3Y8M1FuR8MLkz3Tgi9VKsRKNG7Py0u88WTyPupgh7iz5wfUY1
 +tJFDmhKubmoe88xCU8VqVkO6DCBucT1nPEbAjqeE/eG66/Yu1KRQYUPO8fWnlFHWIjc
 tWBVIlm+jIaXguOh9ZYpbQM0XQ+w5qXd/2pr15oV4Tl610Rs0KWFYn8YxaPBcb46+ngs
 JqsdWHJc7ScXK/NlKWKTku31UGDeXHQlJ8flRmYvUXBTWWtir9PKVzYd2FEwab5SdQD8
 4i/w==
X-Gm-Message-State: APjAAAV7WBicP4f1FJW2faTXyy2QSGObHJKoyN7mLVXIlN0pTs1gaWXy
 L6LqjXQdmcLcVkzeao6fSFpXLiqj
X-Google-Smtp-Source: APXvYqwSOjdNv2Iwz38jVx7LClDO8sI3TzX/52zGw0x+6FLme+CrOkBTPeURqbzUo7bpDu935YBmLw==
X-Received: by 2002:a63:79c8:: with SMTP id u191mr1976961pgc.366.1560263639177; 
 Tue, 11 Jun 2019 07:33:59 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.33.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:33:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 08/28] powerpc/64s/exception: merge KVM handler and skip
 variants
Date: Wed, 12 Jun 2019 00:30:20 +1000
Message-Id: <20190611143040.7834-9-npiggin@gmail.com>
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

Conditionally expand the skip case if it is specified.

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 28 +++++++++---------------
 arch/powerpc/include/asm/head-64.h       |  8 +++----
 arch/powerpc/kernel/exceptions-64s.S     |  2 +-
 3 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 74ddcb37156c..737c37d1df4b 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -431,26 +431,17 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	.endif
 .endm
 
-.macro KVM_HANDLER area, hsrr, n
+.macro KVM_HANDLER area, hsrr, n, skip
+	.if \skip
+	cmpwi	r10,KVM_GUEST_MODE_SKIP
+	beq	89f
+	.else
 	BEGIN_FTR_SECTION_NESTED(947)
 	ld	r10,\area+EX_CFAR(r13)
 	std	r10,HSTATE_CFAR(r13)
 	END_FTR_SECTION_NESTED(CPU_FTR_CFAR,CPU_FTR_CFAR,947)
-	BEGIN_FTR_SECTION_NESTED(948)
-	ld	r10,\area+EX_PPR(r13)
-	std	r10,HSTATE_PPR(r13)
-	END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,948)
-	ld	r10,\area+EX_R10(r13)
-	std	r12,HSTATE_SCRATCH0(r13)
-	sldi	r12,r9,32
-	ori	r12,r12,(\n)
-	/* This reloads r9 before branching to kvmppc_interrupt */
-	__BRANCH_TO_KVM_EXIT(\area, kvmppc_interrupt)
-.endm
+	.endif
 
-.macro KVM_HANDLER_SKIP area, hsrr, n
-	cmpwi	r10,KVM_GUEST_MODE_SKIP
-	beq	89f
 	BEGIN_FTR_SECTION_NESTED(948)
 	ld	r10,\area+EX_PPR(r13)
 	std	r10,HSTATE_PPR(r13)
@@ -461,6 +452,8 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	ori	r12,r12,(\n)
 	/* This reloads r9 before branching to kvmppc_interrupt */
 	__BRANCH_TO_KVM_EXIT(\area, kvmppc_interrupt)
+
+	.if \skip
 89:	mtocrf	0x80,r9
 	ld	r9,\area+EX_R9(r13)
 	ld	r10,\area+EX_R10(r13)
@@ -469,14 +462,13 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 	.else
 	b	kvmppc_skip_interrupt
 	.endif
+	.endif
 .endm
 
 #else
 .macro KVMTEST hsrr, n
 .endm
-.macro KVM_HANDLER area, hsrr, n
-.endm
-.macro KVM_HANDLER_SKIP area, hsrr, n
+.macro KVM_HANDLER area, hsrr, n, skip
 .endm
 #endif
 
diff --git a/arch/powerpc/include/asm/head-64.h b/arch/powerpc/include/asm/head-64.h
index 4767d6c7b8fa..518d9758b41e 100644
--- a/arch/powerpc/include/asm/head-64.h
+++ b/arch/powerpc/include/asm/head-64.h
@@ -387,22 +387,22 @@ end_##sname:
 
 #define TRAMP_KVM(area, n)						\
 	TRAMP_KVM_BEGIN(do_kvm_##n);					\
-	KVM_HANDLER area, EXC_STD, n
+	KVM_HANDLER area, EXC_STD, n, 0
 
 #define TRAMP_KVM_SKIP(area, n)						\
 	TRAMP_KVM_BEGIN(do_kvm_##n);					\
-	KVM_HANDLER_SKIP area, EXC_STD, n
+	KVM_HANDLER area, EXC_STD, n, 1
 
 /*
  * HV variant exceptions get the 0x2 bit added to their trap number.
  */
 #define TRAMP_KVM_HV(area, n)						\
 	TRAMP_KVM_BEGIN(do_kvm_H##n);					\
-	KVM_HANDLER area, EXC_HV, n + 0x2
+	KVM_HANDLER area, EXC_HV, n + 0x2, 0
 
 #define TRAMP_KVM_HV_SKIP(area, n)					\
 	TRAMP_KVM_BEGIN(do_kvm_H##n);					\
-	KVM_HANDLER_SKIP area, EXC_HV, n + 0x2
+	KVM_HANDLER area, EXC_HV, n + 0x2, 1
 
 #define EXC_COMMON(name, realvec, hdlr)					\
 	EXC_COMMON_BEGIN(name);						\
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 91350b3dedde..8680cd7da550 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1063,7 +1063,7 @@ TRAMP_KVM_BEGIN(do_kvm_0xc00)
 	SET_SCRATCH0(r10)
 	std	r9,PACA_EXGEN+EX_R9(r13)
 	mfcr	r9
-	KVM_HANDLER PACA_EXGEN, EXC_STD, 0xc00
+	KVM_HANDLER PACA_EXGEN, EXC_STD, 0xc00, 0
 #endif
 
 
-- 
2.20.1

