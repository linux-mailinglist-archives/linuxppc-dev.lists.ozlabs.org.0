Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6F86E2447
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:31:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pycm30tnLz3ffx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:31:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=l9kvIjiP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyccn05s6z3f8N
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:24:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=l9kvIjiP;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pyccm65Chz4xHV;
	Fri, 14 Apr 2023 23:24:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478696;
	bh=gZLey9V7ulAqxg0pfvsJfiJQNAUaf0OZ9FZ5yIE/rN0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=l9kvIjiPAZcDZWCHpDe1AjT/BaECjl/WTGnDJNptzZywN2GoLfti7ACgeQxn929zO
	 nhCWE5HMOF4FOFxPhZ5AavXewpHa2QxUDjR6nbsppkDquwec0mJ4lLlOWqygDbQUdb
	 i9nBfZV2MuX9R8rvkdSG0o28yubTEyc0Gc16p8k+/vR+gsEexkarb0+7bQcFmF/NPh
	 waJluLWW0thLzAqMu6Ug9/66SDErABtfC67XjioAeqsBLv/esgYZ/5XM2mUgUMbfsQ
	 gSo1TiIo6oWx0KrnxtQUjx+btoEs5rdKvfC+bOdCtEuLZP3ATrQsEzwyOEhwgJX0NA
	 wR0IIRsfuSoxQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 08/32] powerpc/configs/64s: Enable PREEMPT_VOLUNTARY
Date: Fri, 14 Apr 2023 23:23:51 +1000
Message-Id: <20230414132415.821564-8-mpe@ellerman.id.au>
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

Traditionally on powerpc servers PREEMPT_NONE was used, but these days
multiple distros are building with PREEMPT_VOLUNTARY - Ubuntu, Fedora &
CentOS all enable it.

So update the upstream config to reflect that, and get test coverage
before code hits the distros.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index f185adc128db..b332b05a668f 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -5,6 +5,7 @@ CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_BPF_SYSCALL=y
 CONFIG_BPF_JIT=y
+CONFIG_PREEMPT_VOLUNTARY=y
 CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
 CONFIG_TASKSTATS=y
 CONFIG_TASK_DELAY_ACCT=y
-- 
2.39.2

