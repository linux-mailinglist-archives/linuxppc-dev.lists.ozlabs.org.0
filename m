Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F06D1B2D90
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 03:35:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WBlt5PydzF41t
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2019 11:35:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bOmnnh9X"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WBbT28HQzF5qr
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 11:28:37 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id y72so20243741pfb.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 18:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tRiNN7gqy0hPTbCK6rBHCBkmPdjsetgBNlVuGG+aFlA=;
 b=bOmnnh9XnS9EBrvblwBiWMqlRZbDgSIlSVH0oKTcmgsMfb6aCd8Bxh/bok3T0R/zZY
 ohedeHVpsvLV9rdNxT54LUnbzDtfcoZaMqJ+nViwYTr72EmqgOOWzXK0J0x78XWXj0Gu
 FtrkWc+ITqEmyL5s5OYvkW/f9ji3wdxdCcGRRa0BvKtthBBNQ67x7v/mve2uk9DGCGzX
 aAA1OyzwF0gseiQRkTB10ZW10X+no0zNLlvTrUzVaOz31qTnuVgasIZj+3eFlspOsgEA
 j0gewky+763Ydte25qltswJTqrzdB+Tf5ElmDp3K8UD8s++J6IofUTpSa9Rt7qtYYmD+
 HD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tRiNN7gqy0hPTbCK6rBHCBkmPdjsetgBNlVuGG+aFlA=;
 b=uZDpkQ5cZ4bEkw5VPiQAgimcYpV9STumH3RQ9ja+17TT9h6rEyeb4jTDvu/ya010b7
 QxFrUqtxDvjzoqfPwqCCt6flDadNrMVoUxhVFrMikQsECKYZjjNtrrqbTekX3kFs4Jng
 uiXSzO572PcZX+aNuh+CRT8PRyXh1ibV4Xs99AIJivAgTAkaq3o7rYRQzbg2L+7MlqyB
 Mn4XFqL0ZHJOTrPe3m9OwfQEfdq0Mi4GJE9sdzlo9YHQFv7M882W0XmWHTSrU0NHXGyO
 WnEqb8Li+6kDcel+GyNdFFWuNg2Lnb7LNJMV4zf+O2q41Skd7Brf5iv8L3Atj45Ke0XJ
 +M6g==
X-Gm-Message-State: APjAAAXKAErqJbSKL0lHh+VAvhBo0Iw7XIAW5D1djrLPo2SxK83uJqIX
 EYsH03+zP6rh9mNIITGj2peCgpzA
X-Google-Smtp-Source: APXvYqxOL6ZV8JptcdPxun9BYdttyr8QLXJWQsIsjjnMv67GkdMIPElL6zR3bpJrN+/OuDQK87cJJA==
X-Received: by 2002:a63:31d8:: with SMTP id
 x207mr24767184pgx.428.1568510914469; 
 Sat, 14 Sep 2019 18:28:34 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id bt1sm6267043pjb.17.2019.09.14.18.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 18:28:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 03/27] powerpc/64s/exception: Add GEN_KVM macro that uses
 INT_DEFINE parameters
Date: Sun, 15 Sep 2019 11:27:49 +1000
Message-Id: <20190915012813.29317-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190915012813.29317-1-npiggin@gmail.com>
References: <20190915012813.29317-1-npiggin@gmail.com>
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No generated code change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 591ae2a73e18..0e39e98ef719 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -204,6 +204,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 #define ISET_RI		.L_ISET_RI_\name\()
 #define IEARLY		.L_IEARLY_\name\()
 #define IMASK		.L_IMASK_\name\()
+#define IKVM_SKIP	.L_IKVM_SKIP_\name\()
 #define IKVM_REAL	.L_IKVM_REAL_\name\()
 #define IKVM_VIRT	.L_IKVM_VIRT_\name\()
 #define ISTACK		.L_ISTACK_\name\()
@@ -243,6 +244,9 @@ do_define_int n
 	.ifndef IMASK
 		IMASK=0
 	.endif
+	.ifndef IKVM_SKIP
+		IKVM_SKIP=0
+	.endif
 	.ifndef IKVM_REAL
 		IKVM_REAL=0
 	.endif
@@ -265,6 +269,10 @@ do_define_int n
 	KVM_HANDLER \vec, \hsrr, \area, \skip
 .endm
 
+.macro GEN_KVM name
+	KVM_HANDLER IVEC, IHSRR, IAREA, IKVM_SKIP
+.endm
+
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 /*
@@ -1226,6 +1234,7 @@ INT_DEFINE_BEGIN(data_access)
 	IVEC=0x300
 	IDAR=1
 	IDSISR=1
+	IKVM_SKIP=1
 	IKVM_REAL=1
 INT_DEFINE_END(data_access)
 
@@ -1235,7 +1244,8 @@ EXC_REAL_END(data_access, 0x300, 0x80)
 EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
 	GEN_INT_ENTRY data_access, virt=1
 EXC_VIRT_END(data_access, 0x4300, 0x80)
-INT_KVM_HANDLER data_access, 0x300, EXC_STD, PACA_EXGEN, 1
+TRAMP_KVM_BEGIN(data_access_kvm)
+	GEN_KVM data_access
 EXC_COMMON_BEGIN(data_access_common)
 	GEN_COMMON data_access
 	ld	r4,_DAR(r1)
-- 
2.23.0

