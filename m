Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 388F93515DC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:07:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB64D1KhXz3dlH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:07:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=OE5ChnAo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OE5ChnAo; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB6043PGBz3bpS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:04:04 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id v10so1677198pfn.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z2fLHBAlH6bMHiwD8ZSE8QbPd3NRupfIKb21fqNXnZg=;
 b=OE5ChnAoOVVJ2ov7mowsCNwKR9BskeD7oSKGrMX1lwNya0CAOBUzt7EbGzbH590EP3
 qhtR+REJGQbwoY+cOWdyv6bLLZ/BxOXMX4MxgH8TVd0Dw//fBRiMMTLzAiG99xET6QgV
 xPJTfeiOTqx/ecsiiSKwE8G+gKaps9ElWimURHsZs/2uWZSB1i5HeAzBdlN6MkhTmHKH
 0xFPHxsvo12FYDrex/KhH0O9uv3guhc6pIxO8jxspKGhKNHJHrsaOidML/BFDY90M5i3
 PwyvMJ8LSBAvrn/MYK48E/rrnxxpUZvO015giVJWoSft/UQ7I3qSxiE02EWfZlee9PkD
 qPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z2fLHBAlH6bMHiwD8ZSE8QbPd3NRupfIKb21fqNXnZg=;
 b=jVMM7hGGQPs355NqeGo9ROll02Xu1zUJdvkMO2UZHn+SLBbW97TpmprYc/IAow/6fj
 Fwkxh6vdt/UJTRix0H4Ay/POyV7eWj8xSvswyq+7+B9mhNWqSm9AOVD3bzCz8jurGSWy
 Q9FpjdShF5Bm2KcrHm7HJeYeZdyCQTtl29jcPVGKZIt+j99krvqjVLiKUyhk7YLKKdUc
 A4EH4LWu2B5k/oan/GMKhSHgLEGCOlWO1L46/pVKUDdCPcl3NXh5oNKj2E6OavZ5aitr
 D6bNkQ1ThYdlXoL8CHZdEgV4QRJkgO4MgORLNg5oRY86MY0lxNkypSzzvr5USI/Lk4OF
 wGLA==
X-Gm-Message-State: AOAM532WJw/k4I68VoiHSYBE7SyMZied1UbveNevXkfs6IV8/iyqjTgj
 BoeIPNHcuotpUksnhQ/+hXo=
X-Google-Smtp-Source: ABdhPJzxz+vr9AekQuDBEXARJJpGopwD6xZpfUbbYoAp6aU5449vGg1be08WoKVdmpMWbPmnVzjRiw==
X-Received: by 2002:a62:6883:0:b029:220:4426:449c with SMTP id
 d125-20020a6268830000b02902204426449cmr7826099pfc.14.1617289442265; 
 Thu, 01 Apr 2021 08:04:02 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:04:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 08/48] powerpc/64s: Remove KVM handler support from CBE_RAS
 interrupts
Date: Fri,  2 Apr 2021 01:02:45 +1000
Message-Id: <20210401150325.442125-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210401150325.442125-1-npiggin@gmail.com>
References: <20210401150325.442125-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cell does not support KVM.

Acked-by: Paul Mackerras <paulus@ozlabs.org>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 8082b690e874..a0515cb829c2 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2530,8 +2530,6 @@ EXC_VIRT_NONE(0x5100, 0x100)
 INT_DEFINE_BEGIN(cbe_system_error)
 	IVEC=0x1200
 	IHSRR=1
-	IKVM_SKIP=1
-	IKVM_REAL=1
 INT_DEFINE_END(cbe_system_error)
 
 EXC_REAL_BEGIN(cbe_system_error, 0x1200, 0x100)
@@ -2701,8 +2699,6 @@ EXC_COMMON_BEGIN(denorm_exception_common)
 INT_DEFINE_BEGIN(cbe_maintenance)
 	IVEC=0x1600
 	IHSRR=1
-	IKVM_SKIP=1
-	IKVM_REAL=1
 INT_DEFINE_END(cbe_maintenance)
 
 EXC_REAL_BEGIN(cbe_maintenance, 0x1600, 0x100)
@@ -2754,8 +2750,6 @@ EXC_COMMON_BEGIN(altivec_assist_common)
 INT_DEFINE_BEGIN(cbe_thermal)
 	IVEC=0x1800
 	IHSRR=1
-	IKVM_SKIP=1
-	IKVM_REAL=1
 INT_DEFINE_END(cbe_thermal)
 
 EXC_REAL_BEGIN(cbe_thermal, 0x1800, 0x100)
-- 
2.23.0

