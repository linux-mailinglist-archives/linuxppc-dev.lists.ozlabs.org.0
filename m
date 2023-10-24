Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF297D4ECA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 13:28:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pSfiarvd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SF8vC24WFz3cTN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 22:28:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pSfiarvd;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SF8tL2PTtz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 22:27:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698146850;
	bh=0rawQQDsSy5ZDyzyLXWe5qhkYDUtYtrPO+EcrEoTcco=;
	h=From:To:Subject:Date:From;
	b=pSfiarvdJ/RgOHEzHMO/vYJ580dIMQKg/zNRsbarrROsJkHGJyR6fxeEXqiZsrw/L
	 mwiYqYr4OSlxzvv+OchF3WTaco6QbdyjUzSgLJZGYxA23pr9+ZrfU10KKLHepThIcV
	 uVMNvGFmLy/4POTQa7xN//bxFvgIe3qW0hfYGHYuxZ7VzjuTwz0jCmnumMhMzQubvC
	 zuclh45bqmZNutM+fjl7ykcI5VJ8GISXzyaU4MC7zmKbcqjK47CA5/isNhQQ2LKIjp
	 hivSXq6Qju8rT6j9SRbiiSMvemO53gzEc7dRjDvJDLXZvDCg91MYqZT+Zp1UNymaEO
	 UAWtdthvqL/YA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SF8tB4yVYz4x3D;
	Tue, 24 Oct 2023 22:27:30 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/configs/64s: Enable CONFIG_MEM_SOFT_DIRTY
Date: Tue, 24 Oct 2023 22:27:25 +1100
Message-ID: <20231024112726.1819795-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
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

Enable CONFIG_MEM_SOFT_DIRTY to get some test coverage. Distros enable
it, and it has been broken previously. See commit 66b2ca086210
("powerpc/64s/radix: Fix soft dirty tracking").

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 6e7b9e8fd225..544a65fda77b 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -92,6 +92,7 @@ CONFIG_MEMORY_HOTPLUG=y
 CONFIG_MEMORY_HOTREMOVE=y
 CONFIG_KSM=y
 CONFIG_TRANSPARENT_HUGEPAGE=y
+CONFIG_MEM_SOFT_DIRTY=y
 CONFIG_ZONE_DEVICE=y
 CONFIG_NET=y
 CONFIG_PACKET=y
-- 
2.41.0

