Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B80665EDD80
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 15:09:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mcxfn3ZG3z3cBF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 23:09:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KkAk/uq/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McxfD22Jtz3046
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 23:09:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KkAk/uq/;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mcxf61vRfz4xGH;
	Wed, 28 Sep 2022 23:09:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664370558;
	bh=rCIdN5jbbNRJssrSK6hLLQjWA6aqr88eAEG+eYdpixk=;
	h=From:To:Subject:Date:From;
	b=KkAk/uq/YJBULgQ3ZIZvJ26Y4tLQTo2xbto3CX5KtOjW1JvoAZvYuDf77EOLkqB5N
	 7vjrjMUUGnf54WvToLQPyYOI0TBAEjEGfSYY6qAaoC8bcxuo1EDsh1i84C5LNcAR8x
	 RTYzI00Y1vdSFqJfszJ7sktYWc6hIhW/G2zrYwyEECiYf3LwE4mUBmJWY034oW3tHa
	 lMJiPsTkwx82P47QUpfwPybCVFiwItyp02s292Ep6GXzgVL/n/fu3QI5qHZQ3PB4N3
	 r3b1nx4yHKvrlPXN5lmbt/mrABPc13iKOhtBg0ohAhOSr7t1bz6gbvOVhBZueDX+c2
	 Y1lW0cLwQ5zlA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64s: Remove old STAB comment
Date: Wed, 28 Sep 2022 23:09:12 +1000
Message-Id: <20220928130912.1732466-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This used to be about the 0x4300 handler, but that was moved in commit
da2bc4644c75 ("powerpc/64s: Add new exception vector macros").

Note that "STAB" here refers to "Segment Table" not the debug format.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/exceptions-64s.S | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 3d0dc133a9ae..8088134ccb2a 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -3044,12 +3044,6 @@ MASKED_INTERRUPT hsrr=1
 	 * to HV=1 from HV=0 is delivered via real mode handlers.
 	 */
 
-	/*
-	 * This uses the standard macro, since the original 0x300 vector
-	 * only has extra guff for STAB-based processors -- which never
-	 * come here.
-	 */
-
 USE_FIXED_SECTION(virt_trampolines)
 	/*
 	 * All code below __end_soft_masked is treated as soft-masked. If
-- 
2.37.3

