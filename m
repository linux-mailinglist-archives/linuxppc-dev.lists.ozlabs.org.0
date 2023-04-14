Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E74BE6E2450
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:32:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pycnt5yJPz3fbf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:32:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Xg8AthYz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyccp0FR4z3fFr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:24:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Xg8AthYz;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pyccn6F4yz4xKV;
	Fri, 14 Apr 2023 23:24:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478697;
	bh=IQ0QD49+RwlNoKa8C084SdeCWYiLr1IdrJSyRkspJJE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Xg8AthYzvW6tHHdIktFSaJm1M+P2ei9sZjrpztY0jhQBxTFMcIUSWkwOk+qzsXKyj
	 9A7lDIAWIOXf/Ze/BHsMZmO20qgTodrx4iYHc++GP4/UZB3Yr1Cupun1DB1586wTGM
	 8swd6obNb4S0//3VMGPQiR7XA/ONRYavylgOvUjCaLSSUzpAc2obz+OkeYjrmyhowq
	 ljuCy6/2q9vuYaLRMIzcUOX8pJxJ8o05CtLZFQjYuvrgiH15H1N6FQtjUecS2qy085
	 JWNhHy495/yi3W43+KD7U32gLcLa5YhhW+qCDSlc/vVJcZ+6rQwp/tKq60ckpN8ApN
	 QYn33cjdolEsQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 10/32] powerpc/configs/64s: Enable common accounting options
Date: Fri, 14 Apr 2023 23:23:53 +1000
Message-Id: <20230414132415.821564-10-mpe@ellerman.id.au>
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

These options are enabled by most distros.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 0e3b420aaa6e..ecad254eee6c 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -8,8 +8,13 @@ CONFIG_BPF_SYSCALL=y
 CONFIG_BPF_JIT=y
 CONFIG_PREEMPT_VOLUNTARY=y
 CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_TASKSTATS=y
 CONFIG_TASK_DELAY_ACCT=y
+CONFIG_TASK_XACCT=y
+CONFIG_TASK_IO_ACCOUNTING=y
+CONFIG_PSI=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=18
-- 
2.39.2

