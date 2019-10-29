Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 762FCE92F6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 23:20:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472mHX1TbNzF3Y8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 09:20:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="FVaO6aO8";
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472kyg432rzF35w
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 08:20:43 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id r1so10497730pgj.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 14:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=k/Yn81zcF5guunRscdaPnRGMjDCCToSR8PmADiJbxp0=;
 b=FVaO6aO8ILysBPp4TcG6DRYTfhP64yNYK1NJln6frp9324XMFNpgsYZUbnEC1/BcNI
 d3y6HNjxwiZHSQPSgHJiVtceb3/6J9fduGv+Jcn399jZBSVy0f+CKF1R0ijDo77jPqTY
 64QP9FbsaOR6pmLh7yAYTYiylPerHQmxnysFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=k/Yn81zcF5guunRscdaPnRGMjDCCToSR8PmADiJbxp0=;
 b=FlLZ85dofY4BFV/2Kr11qNVrmDPsudZ3XNwRlIXWeJliuTJwk+LaqEPz0e7lTWiVdj
 mnzllPXUTXpmLMJwwn4WYhPN7soZLvCuIhJ7xBCSZLxaLN9BqX7tBNJQ9wuPYYhqlRC6
 gptnOem0JPp3HRaARw/HRfGgPj4M//E4kUAgQsXmeP99xoVlNNnzi3GH4BVMEbwOgsSd
 LU+p+wT8MLqIZ16Vpkb05l3Lkay3CpNuReJ7QBm9NY0PoqJt77TA+DMnhq/sIYR+4GpH
 vnR0Dc325gfGPpKJ4DoYgFdw0ae83qeI5ZYueu9krjTq1LxGjiLB336PQbwhYAmwBTgC
 0u9w==
X-Gm-Message-State: APjAAAVmFcUllZeVgce7PulKcP+m0dED/lz2Q2JMVkthc2XAT1TyECy+
 Zjm4BEL+f6No5z/ekM3lUxR0Yg==
X-Google-Smtp-Source: APXvYqzYc8Z7WdSN2lpbbY2148bXAcfqC0AwUdd9uxHNVkdGRvM/YKRGPHtsurX4YfIZG5rxXrNrPA==
X-Received: by 2002:a65:4247:: with SMTP id d7mr29666739pgq.107.1572384041015; 
 Tue, 29 Oct 2019 14:20:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id u10sm29783pjy.28.2019.10.29.14.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 14:20:38 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Borislav Petkov <bp@alien8.de>
Subject: [PATCH v3 23/29] parisc: Move EXCEPTION_TABLE to RO_DATA segment
Date: Tue, 29 Oct 2019 14:13:45 -0700
Message-Id: <20191029211351.13243-24-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029211351.13243-1-keescook@chromium.org>
References: <20191029211351.13243-1-keescook@chromium.org>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, linux-ia64@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Andy Lutomirski <luto@kernel.org>,
 linux-alpha@vger.kernel.org, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-c6x-dev@linux-c6x.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since the EXCEPTION_TABLE is read-only, collapse it into RO_DATA.

Signed-off-by: Kees Cook <keescook@chromium.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 arch/parisc/kernel/vmlinux.lds.S | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
index 12b3d7d5e9e4..53e29d88f99c 100644
--- a/arch/parisc/kernel/vmlinux.lds.S
+++ b/arch/parisc/kernel/vmlinux.lds.S
@@ -19,6 +19,7 @@
 				*(.data..vm0.pte)
 
 #define CC_USING_PATCHABLE_FUNCTION_ENTRY
+#define RO_EXCEPTION_TABLE_ALIGN	8
 
 #include <asm-generic/vmlinux.lds.h>
 
@@ -129,9 +130,6 @@ SECTIONS
 
 	RO_DATA(8)
 
-	/* RO because of BUILDTIME_EXTABLE_SORT */
-	EXCEPTION_TABLE(8)
-
 	/* unwind info */
 	.PARISC.unwind : {
 		__start___unwind = .;
-- 
2.17.1

