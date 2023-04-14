Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAAE6E247A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:41:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pyd0C6mfQz3gCH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:41:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SEGFwdVv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyccw0lL8z3fTk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:25:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SEGFwdVv;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pyccr6xtyz4xMv;
	Fri, 14 Apr 2023 23:25:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478701;
	bh=pcqAP5qhxYzlqSL63actqx176zpxVrGyoPsoWnqUs3Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SEGFwdVv5R13mp3pIVKb5Ro9XpOYqoGUFXu6aitLvjiDb6KRqJUk4HHhUdnYVVNLm
	 v2rn/OdvKBEQpoisS3HnhrkLyq0c8xBX/Z3eAvi/yAAQ1sDhw9DITcEUhfphtCt2lK
	 bRG49IJxfslhTsZ5z+VMENv10nQhnEfhOzwZkDzXmJjCSNnELt0stIXKU+UN6wd6JX
	 AiGLzJwYkjmAIcgdS1YFvHYXmJn2Ptfe7jVOgDuHlzkhuIqyUiyvrH6trkYgZboHb+
	 Yj6bWBdpczPRcMFeLk4EJ8B36YiFOGcoYJqgrMlmRDzW3lEel8nk+Fky4rEDXTpC1C
	 EF2Rw0yqFhDeA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 16/32] powerpc/configs/64s: Enable YAMA, LANDLOCK & BPF LSMs
Date: Fri, 14 Apr 2023 23:23:59 +1000
Message-Id: <20230414132415.821564-16-mpe@ellerman.id.au>
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

Multiple distros enable these.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 0aafe64cd1d7..8673277f9b20 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -6,6 +6,7 @@ CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_BPF_SYSCALL=y
 CONFIG_BPF_JIT=y
+CONFIG_BPF_LSM=y
 CONFIG_PREEMPT_VOLUNTARY=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
@@ -357,8 +358,10 @@ CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
 CONFIG_SECURITY=y
+CONFIG_SECURITY_YAMA=y
 CONFIG_SECURITY_LOCKDOWN_LSM=y
 CONFIG_SECURITY_LOCKDOWN_LSM_EARLY=y
+CONFIG_SECURITY_LANDLOCK=y
 CONFIG_INTEGRITY_SIGNATURE=y
 CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
 CONFIG_INTEGRITY_PLATFORM_KEYRING=y
-- 
2.39.2

