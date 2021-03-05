Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2486132EDE5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:09:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsWNy1Nd3z3dQg
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 02:09:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=g6iPpnT3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=g6iPpnT3; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsWL502lSz3dL6
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 02:07:08 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id x29so1561502pgk.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 07:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PQ5MsB/7FGz/hp4mvby/IngotkcaBU3resUOZZYOYwQ=;
 b=g6iPpnT3ZliKnw0w6cz92mKIrL8aw6JwK+q2GVt7lxPOwftQzvxewShVGuN0iCzLXn
 0uxNoLUQegMaGJi+FGYPD5NGylufFt3+jHZawy1ohPPxLxkB7namy49vy9Eg4asZekJz
 MK8OJ8GmkBbcGxdJWTYt/PNXWhY9sFaln8DVDLxU3/9LEiNEM2Ry6JHKIO/ZAQGR5R1y
 RgrKMWiumzb62COXn3iL8UoPt92wloaNte3OtlWq7BCV3uVToGz0KWq0d9AT0oBHQXKu
 O2Ng50RpRjTQzB7gqnWc+144QTXyxPshz0+ZeOu7TofbPx+vtTNU1Uf7OKzEgZNdbxOT
 LILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PQ5MsB/7FGz/hp4mvby/IngotkcaBU3resUOZZYOYwQ=;
 b=pbvtY3hJvXZhaOa6FPaIzl4fcQb6d6w7bxjUJ9kaIYF8vJJ3fIjOeBwwHyMJ6Xskug
 XVwT1exTbpHcf2Uu5XzJ16kEIf0mVDFsJmvXp8tOFqLRe87n47XVfpD3WxDwCdTNFZFG
 FLGCq1aD4JFJugg2t3KWK5RIPjUgC5HOs8jSqiAhSbUK/1CeVd81eUKaRZQjkxMPViI4
 p+wgv1L5Mxk+jx978TShRsF9YKYGenQZF3TTmpvg7D2uOeVJr1Z5juQEaf+VE7ZfJoQE
 RW8Q5JBw4GhVB+vi9nimzpur+52CKFDDAWWRnBvtk+QUJYGn4t3WA2LzQMZzMiq/BQmn
 wkYQ==
X-Gm-Message-State: AOAM533+3W+UOUhDFzQ6aY3Gc87w+ovzEQsmojCIcL3DpL98V8TS6Hkv
 xKdx3ZHs/+iKPlXleMGgYP0=
X-Google-Smtp-Source: ABdhPJwkpXMOZq43eVLRLidmAU5jRNlIb4XlQX89k2Sz3a5jSgGBvsZSRCkjgdu4PHsKYlBAk6Pbig==
X-Received: by 2002:aa7:84cb:0:b029:1ed:9b6f:1b6f with SMTP id
 x11-20020aa784cb0000b02901ed9b6f1b6fmr9377212pfn.57.1614956826862; 
 Fri, 05 Mar 2021 07:07:06 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m5sm1348982pfd.96.2021.03.05.07.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:07:06 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 06/41] powerpc/64s: Remove KVM handler support from CBE_RAS
 interrupts
Date: Sat,  6 Mar 2021 01:06:03 +1000
Message-Id: <20210305150638.2675513-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210305150638.2675513-1-npiggin@gmail.com>
References: <20210305150638.2675513-1-npiggin@gmail.com>
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

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 60d3051a8bc8..a027600beeb1 100644
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

