Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B19353ABE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:24:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCbz2Kr7z3dc7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:23:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=e8CUUZP4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=e8CUUZP4; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCX00hJkz304T
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:20:32 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id b17so3513965pgh.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z2fLHBAlH6bMHiwD8ZSE8QbPd3NRupfIKb21fqNXnZg=;
 b=e8CUUZP4iaV+gW+BtowJx1AyJ3m/Ri0uxOf/sCp9zB7xk7RBRD6Uza50KgP3YgvzB1
 mpUvJj9rSjaxtYn1V1J4eEbJbEKHHDaK02sGf8IiJbGHEVsevUs+siSc1gPbvf8uehVV
 PcnvbSfIr2qAze0h4EZKr++J9GDyd21pREMud5dnakft0jBNwi1159pp56AUovUwKJiX
 3tetKg4XAqeWRWb6a6obmaLAzvxtstMzFDDa2deF9dtdT9lIYCKawxmjZkyvABD1XBar
 CXwKuvM7aBUBpIjTOQ6UkHUpyyAxU4B2HwZUB6QL0Eod+oicIS5ea9ElrtlvlVPFblZ4
 lqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z2fLHBAlH6bMHiwD8ZSE8QbPd3NRupfIKb21fqNXnZg=;
 b=NHlIXc1COkeO0bw1w4RxvhDO5CMHSXd7kI2i/qW9Tly0vEDx4bLHjI5CQwf5rhlbMK
 WPiYGmn3Of4HPjn7ZNhV712g1sc79NzkiaLv1OFyF22yDSbAO4NiLNU0/EsG17+9zNg3
 SOCMBnD6T4cJWnmCdUGuu9BjK59wHDKbnv1xjcjJLNIvT0du95z+clJJ3+p5MuW1MPRI
 InUkPYdAdQDzCz9mfXDO4AkwecCTJoEIJQm6J46r2svhveqJN+qdp7gatrSNGu7gtqPK
 ilDQQfbTC8zt0TGafw+1gZCcrzj6s5OJu73h4UGCL+98o92QrTQ2g8qY24uoOHtQsWgE
 Ix4Q==
X-Gm-Message-State: AOAM533NZNXtP8It8+1bVWfCnMRrORGXcSyrV7wHZ6uQr+fB9g23Ew+Z
 9AkGhFr7kqKgzfzplMS5zug=
X-Google-Smtp-Source: ABdhPJxv/d+H/pav+GLr07qdpRh1R0m5IeEnIE0Oey9cIjcnLA8r9QXq7CzegkEoEWf0qP+uaGdaqA==
X-Received: by 2002:a63:43c2:: with SMTP id q185mr20716518pga.41.1617585630041; 
 Sun, 04 Apr 2021 18:20:30 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:20:29 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 08/48] powerpc/64s: Remove KVM handler support from CBE_RAS
 interrupts
Date: Mon,  5 Apr 2021 11:19:08 +1000
Message-Id: <20210405011948.675354-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210405011948.675354-1-npiggin@gmail.com>
References: <20210405011948.675354-1-npiggin@gmail.com>
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

