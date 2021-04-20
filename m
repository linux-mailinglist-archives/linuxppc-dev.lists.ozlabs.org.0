Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8CF365144
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 06:22:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPVs52cz9z30C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 14:22:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fjAwTCB7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=fjAwTCB7; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPVrj0Cgnz2xZJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 14:22:12 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FPVrg5rL7z9vDw; Tue, 20 Apr 2021 14:22:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618892531;
 bh=eG0KUi7A8nxMvygE5u3+9pIkoyrku1X/q6Oa56NEKsc=;
 h=From:To:Subject:Date:From;
 b=fjAwTCB7JaSaAqLgNDNyZ/yCBjzYPD+RsinjIPg8Vop9mZ7fP3hhCvxXzu7dRmAln
 sMvd+H/P4V8BZS4m6fwwikBUA31WAeXEJ8Cv4QYtN0re94fTI0rgrR3OCnhebhQ8a/
 3VtlaDNZLRJkyqxZhgCqVfmIDo5yLPhyAV8tISYmqUi36ZmkWrnOwXLAZLQDUra6hr
 ZzlptX/Sjgrdnm0LE9dpm1Uo8R6U55EgulkPR1p8qh+o9Fp6TGG0dX4Zvtdm0nFwyc
 VaqXL8oDywjYd7YKhD6yydQZTCefAAWoXjTEXFYUnQLNIPdEBOZ0/0a7mqBYEpyZBS
 xDQHiVd0LkDzg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Add FA_DUMP to defconfig
Date: Tue, 20 Apr 2021 14:22:09 +1000
Message-Id: <20210420042209.1641634-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

FA_DUMP (Firmware Assisted Dump) is a powerpc only feature that should
be enabled in our defconfig to get some build / test coverage.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 4f05a6652478..72b235ef6f3b 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -50,6 +50,7 @@ CONFIG_PPC_TRANSACTIONAL_MEM=y
 CONFIG_KEXEC=y
 CONFIG_KEXEC_FILE=y
 CONFIG_CRASH_DUMP=y
+CONFIG_FA_DUMP=y
 CONFIG_IRQ_ALL_CPUS=y
 CONFIG_PPC_64K_PAGES=y
 CONFIG_SCHED_SMT=y
-- 
2.25.1

