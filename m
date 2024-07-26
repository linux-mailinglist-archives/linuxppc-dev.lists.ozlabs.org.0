Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E82993D30B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 14:34:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DaysyD4/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVnHl3bpJz3dK5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 22:34:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DaysyD4/;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVnH128Qqz3cLl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 22:33:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1721997213;
	bh=0CQYTuAbtXWJMzojrrhLbDCjVXotwua4dV/X1XlkldI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DaysyD4/eDD2tnYTIcv/S+7wzGsYAp+/wUltbSpNoP75xznUqHrB8ed3+ze5jVDAl
	 eDSm02p7BKKw5rsV8HzKzM69QoFXBsRrVK9qdKci7yG2357rElxGWuveVvw45WcgGN
	 t1EpydXTuR/TMR6KSpK4XReI5Ex8Eyap4aL8iFfPloDvzkOvMpwW3vND4W6WMeTYhw
	 QntK1GWNI+W7g0BVzCafwHL/jYDrTc5HqPhZIDCox6Aiu1INQjrZsh8qXfzzx2WZrs
	 IZi2I0KwhegeAr0gBMZjSS1YdxlI3Nz3Dx5fRWNN3mP43I0OPq2NLl9gIGMYIF5aFt
	 CgyNKgorJhqFQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WVnH10hkrz4wbv;
	Fri, 26 Jul 2024 22:33:33 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/2] MAINTAINERS: Mark powerpc spufs as orphaned
Date: Fri, 26 Jul 2024 22:33:22 +1000
Message-ID: <20240726123322.1165562-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726123322.1165562-1-mpe@ellerman.id.au>
References: <20240726123322.1165562-1-mpe@ellerman.id.au>
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
Cc: geoff@infradead.org, jk@ozlabs.org, arnd@arndb.de, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jeremy is no longer actively maintaining spufs, mark it as orphan.

Also drop the dead developerworks link.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Acked-by: Jeremy Kerr <jk@ozlabs.org>
---
 CREDITS     | 3 +++
 MAINTAINERS | 4 +---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/CREDITS b/CREDITS
index 65165dc80f04..d439f5a1bc00 100644
--- a/CREDITS
+++ b/CREDITS
@@ -1872,6 +1872,9 @@ S: K osmidomkum 723
 S: 160 00 Praha 6
 S: Czech Republic
 
+N: Jeremy Kerr
+D: Maintainer of SPU File System
+
 N: Michael Kerrisk
 E: mtk.manpages@gmail.com
 W: https://man7.org/
diff --git a/MAINTAINERS b/MAINTAINERS
index ffcac216b57d..87a6fc8ccdba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21466,10 +21466,8 @@ F:	include/linux/spmi.h
 F:	include/trace/events/spmi.h
 
 SPU FILE SYSTEM
-M:	Jeremy Kerr <jk@ozlabs.org>
 L:	linuxppc-dev@lists.ozlabs.org
-S:	Supported
-W:	http://www.ibm.com/developerworks/power/cell/
+S:	Orphan
 F:	Documentation/filesystems/spufs/spufs.rst
 F:	arch/powerpc/platforms/cell/spufs/
 
-- 
2.45.2

