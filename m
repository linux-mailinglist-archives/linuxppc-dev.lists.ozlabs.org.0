Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CDF6E2452
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:33:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pycpq0vcvz3fwL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:33:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=k5rrjRYc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyccp3wF5z3fQg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:24:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=k5rrjRYc;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pyccp2mgLz4xKX;
	Fri, 14 Apr 2023 23:24:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478698;
	bh=p2GUADRHnEQKxSCIPS4wT/1G1YCOTsiRyoWy5kPhI4Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=k5rrjRYcWSyXKkITYGffU2xd2kzF2CzpT4akfI115O8XV/Eeau6TaWV1efA6XRGSB
	 B4Fx386btVbys3ghC+XxNUiI0wS7xkoikpqti8CN03LdRx++2THBi+G/r0MYQhuFMQ
	 WqX4xk1SpBurYA7pAwf53+f/b/Gb5FQQKdzjA/Ch5nUQ9zQd/hiIRXepMo/KoqJxrX
	 ia4qd1lGQzr5ajs/gnRgyntsgYi55yIkI8BvXDqSf2jrrQI3vCXzYjTnwNVzr4hsN3
	 FIY6+77e9DbSUu4WeDdnzWDeWoE0CJLlr23zVI8T0/tY9Y1iYk+di3O5l2efh64+o2
	 +MiB5msQ3q44g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 11/32] powerpc/configs/64s: Enable NO_HZ_FULL
Date: Fri, 14 Apr 2023 23:23:54 +1000
Message-Id: <20230414132415.821564-11-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414132415.821564-1-mpe@ellerman.id.au>
References: <20230414132415.821564-1-mpe@ellerman.id.au>
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

At least Fedora & SUSE enable it.

VIRT_CPU_ACCOUNTING_GEN is selected so no longer needs to be in the
defconfig.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index ecad254eee6c..7e265cbbeaef 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -1,13 +1,12 @@
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-# CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
 CONFIG_AUDIT=y
+CONFIG_NO_HZ_FULL=y
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_BPF_SYSCALL=y
 CONFIG_BPF_JIT=y
 CONFIG_PREEMPT_VOLUNTARY=y
-CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_TASKSTATS=y
-- 
2.39.2

