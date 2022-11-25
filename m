Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D115A638B22
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 14:26:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJbGz6GcBz3f5N
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 00:26:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rZs6Opav;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJbG16FNVz3dvq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 00:25:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rZs6Opav;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NJbFz68xmz4x1D;
	Sat, 26 Nov 2022 00:25:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1669382727;
	bh=zh+0gIKb4BZkMxWnPlVhvp/oirtCMJTF3W0+S/PWmwc=;
	h=From:To:Subject:Date:From;
	b=rZs6Opavc//Fb2cHx1V12nIGXB7XedaGEYqS64P69p05dUgonWDFvu8C7FMRBASNc
	 pYoQp9Z2glR75O2C/8eFEyWiM6L1QLiJpWZyVikWmZS3xZmYRj6iZMzDnjmvAqttre
	 4vCd3Oe9atJNV76k+Lr3z6+2x8Sa9+6XrK6s50+4JIq0WCqmcgOys5D242lUtI7Vm+
	 /iDFjpDFwYaN7ylLA2x4uTtLHwudZ+bsknfuRJ2oYHw42JTOihIQM/AvQ3oHxv94/5
	 wy9M78tVNhynQGXqcMFJdM/Z4Ih4nA9FpBtoXZGFX8qzC5QUide/H51h+MmHmt6YHA
	 aId6/s7RKn7sQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64s: Add missing declaration for machine_check_early_boot()
Date: Sat, 26 Nov 2022 00:25:21 +1100
Message-Id: <20221125132521.2167039-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.38.1
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

There's no declaration for machine_check_early_boot(), which leads to a
build failure with W=1. Add one.

Fixes: 2f5182cffa43 ("powerpc/64s: early boot machine check handler")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/interrupt.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 4745bb9998bd..6d8492b6e2b8 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -602,6 +602,7 @@ ____##func(struct pt_regs *regs)
 /* kernel/traps.c */
 DECLARE_INTERRUPT_HANDLER_NMI(system_reset_exception);
 #ifdef CONFIG_PPC_BOOK3S_64
+DECLARE_INTERRUPT_HANDLER_RAW(machine_check_early_boot);
 DECLARE_INTERRUPT_HANDLER_ASYNC(machine_check_exception_async);
 #endif
 DECLARE_INTERRUPT_HANDLER_NMI(machine_check_exception);
-- 
2.38.1

