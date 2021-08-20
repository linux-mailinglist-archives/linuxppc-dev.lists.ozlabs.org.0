Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 833213F2A27
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 12:35:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrdLw3SFjz3cSd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 20:35:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mOrUjni5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mOrUjni5; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrdLG54M2z3bTV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 20:34:45 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id o2so8715175pgr.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 03:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FvFA8OvjYF0NHx6jFUT6i973XvFUrP0HUeve6gGw7oc=;
 b=mOrUjni5EReHow2Hc2sk7PgilAAmGZtC+oPHIepS80kAaJGbZeTh06VB7yvwj0VxHn
 iJO7eIKVr/EwCwVLliRvYqAjKel47Yx2dDrFmZjwd4G4xXICmFZCiIueojk7mXcBP4sx
 5ADS/Bt4Nk1mnkZqeCjjLCPJwH7m/PehbFDhKgLCYnzASSqhAsR/gZn1X3355nhnwLt/
 lvzm94s0yPO0WI7Boord4l2+PddebZwjNqHRg7jYg1R9xSNCyvuNMZFWQCSnwqSbioRT
 1ofAntuMuceTNoSL9xpG1n+ENturtQvOvuzFSijQ2rkVjNRqDo1gEwuim+ZjXQo1uZBB
 Ttqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FvFA8OvjYF0NHx6jFUT6i973XvFUrP0HUeve6gGw7oc=;
 b=Z7x41b9Y4LwzOfXEh3hSWmU+4/xt36x/Cgp4flZNjMGJyMe4WOMkM+fz9LgI0Ag03b
 G+onhfM9siewZNrUJmTRRH7rTdXeJnYf+2y2HWt2iGO1Oe96ufYd83o7EOw2C+tKAMqD
 Pru7B9ercOvRRBXJ2x6ga0BHoXCvlLq4BeTCyq70X8RGwh/C/UsS0sqMAKoFxgBnZMm9
 sd+DN4XkReDV2BmBOsDpyg6zguGs7N2Ia52F5gu1Rq1INEM/RNuiTMDgcZLR+mJmShpz
 pRAKLWZ2N72zopFfNFsGqprQVhvJKi+xJI/0Ewvu/zK/UPisszp8op6OoRAQddA1C9Jf
 XtIQ==
X-Gm-Message-State: AOAM533IkWf0y2UqNkyoHltLPtt+sALGvHiDQGJnAQF24CsjC+qeGd7w
 LPTbz127D0RQrmImOgBIUoddW2sg684=
X-Google-Smtp-Source: ABdhPJwA2nxqm0NnNARkbJXvkXF6FJzn0oD5i2P4HBy7D48DXd7Wxkc2IOgatRrBtV7Ar3EU51LVIw==
X-Received: by 2002:a63:f654:: with SMTP id u20mr17795184pgj.130.1629455680852; 
 Fri, 20 Aug 2021 03:34:40 -0700 (PDT)
Received: from bobo.ibm.com (193-116-119-33.tpgi.com.au. [193.116.119.33])
 by smtp.gmail.com with ESMTPSA id j185sm6466056pfb.86.2021.08.20.03.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 03:34:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1] powerpc/64s: Fix scv implicit soft-mask table for
 relocated kernels
Date: Fri, 20 Aug 2021 20:34:31 +1000
Message-Id: <20210820103431.1701240-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The implict soft-mask table addresses get relocated if they use a
relative symbol like a label. This is right for code that runs relocated
but not for unrelocated. The scv interrupt vectors run unrelocated, so
absolute addresses are required for their soft-mask table entry.

This fixes crashing with relocated kernels, usually an asynchronous
interrupt hitting in the scv handler, then hitting the trap that checks
whether r1 is in userspace.

Cc: Hari Bathini <hbathini@linux.ibm.com>
Fixes: 325678fd0522 ("powerpc/64s: add a table of implicit soft-masked addresses")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 4aec59a77d4c..37859e62a8dc 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -812,7 +812,6 @@ __start_interrupts:
  * syscall register convention is in Documentation/powerpc/syscall64-abi.rst
  */
 EXC_VIRT_BEGIN(system_call_vectored, 0x3000, 0x1000)
-1:
 	/* SCV 0 */
 	mr	r9,r13
 	GET_PACA(r13)
@@ -842,10 +841,12 @@ EXC_VIRT_BEGIN(system_call_vectored, 0x3000, 0x1000)
 	b	system_call_vectored_sigill
 #endif
 	.endr
-2:
 EXC_VIRT_END(system_call_vectored, 0x3000, 0x1000)
 
-SOFT_MASK_TABLE(1b, 2b) // Treat scv vectors as soft-masked, see comment above.
+// Treat scv vectors as soft-masked, see comment above.
+// Use absolute values rather than labels here, so they don't get relocated,
+// because this code runs unrelocated.
+SOFT_MASK_TABLE(0xc000000000003000, 0xc000000000004000)
 
 #ifdef CONFIG_RELOCATABLE
 TRAMP_VIRT_BEGIN(system_call_vectored_tramp)
-- 
2.23.0

