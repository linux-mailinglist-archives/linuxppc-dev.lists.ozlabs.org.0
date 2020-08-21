Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0D324E03C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 21:01:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BY9pP6dv4zDrJ1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Aug 2020 05:01:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=anastas.io (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.a=rsa-sha256
 header.s=mail header.b=ZPKc7qKm; dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BY9hk4JxvzDrHm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Aug 2020 04:56:06 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id A96BC7ECDC;
 Fri, 21 Aug 2020 13:56:03 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1598036163; bh=j+w6XtGkxtFNQ0GLezhFKHopmQXUH7iSQXejY1lxhqo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZPKc7qKmIab4n5DkYf67IX1fqNEB5/LtK5z3TQK74/ArBjWCEHAdX8rlMjbVCpfU6
 d0C+EZ6p1wN4vxhkm4zJbx/lCoWL9ZS8jJwEbax7IDK0lSYeFdomsXByO8PBhxvm70
 nTtG2e0jL5Lg/kQ3HEy8+K29thAviL62lTgYHLnAxcpNjvVGzmAPUW6+UTj70xFoem
 gwV44j6D8yf+BYduG7wQGz8+T7Z/KS6BCKRLoZMH6eTGYcgnY4W2SYr//JBYYDHBH2
 hQ8o2SFVYDHP6Eki7od9wrNE4O1xMxSD6wXWso6rKrFbGSU5eofJXWRTJkLISZltzD
 Tq9HPVOT/0Ukg==
From: Shawn Anastasio <shawn@anastas.io>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/3] powerpc/64s: Disallow PROT_SAO in LPARs by default
Date: Fri, 21 Aug 2020 13:55:57 -0500
Message-Id: <20200821185558.35561-3-shawn@anastas.io>
In-Reply-To: <20200821185558.35561-1-shawn@anastas.io>
References: <20200821185558.35561-1-shawn@anastas.io>
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since migration of guests using SAO to ISA 3.1 hosts may cause issues,
disable PROT_SAO in LPARs by default and introduce a new Kconfig option
PPC_PROT_SAO_LPAR to allow users to enable it if desired.

Signed-off-by: Shawn Anastasio <shawn@anastas.io>
---
 arch/powerpc/Kconfig            | 12 ++++++++++++
 arch/powerpc/include/asm/mman.h |  9 +++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1f48bbfb3ce9..65bed1fdeaad 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -860,6 +860,18 @@ config PPC_SUBPAGE_PROT
 
 	  If unsure, say N here.
 
+config PPC_PROT_SAO_LPAR
+	bool "Support PROT_SAO mappings in LPARs"
+	depends on PPC_BOOK3S_64
+	help
+	  This option adds support for PROT_SAO mappings from userspace
+	  inside LPARs on supported CPUs.
+
+	  This may cause issues when performing guest migration from
+	  a CPU that supports SAO to one that does not.
+
+	  If unsure, say N here.
+
 config PPC_COPRO_BASE
 	bool
 
diff --git a/arch/powerpc/include/asm/mman.h b/arch/powerpc/include/asm/mman.h
index 4ba303ea27f5..7cb6d18f5cd6 100644
--- a/arch/powerpc/include/asm/mman.h
+++ b/arch/powerpc/include/asm/mman.h
@@ -40,8 +40,13 @@ static inline bool arch_validate_prot(unsigned long prot, unsigned long addr)
 {
 	if (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_SAO))
 		return false;
-	if ((prot & PROT_SAO) && !cpu_has_feature(CPU_FTR_SAO))
-		return false;
+	if (prot & PROT_SAO) {
+		if (!cpu_has_feature(CPU_FTR_SAO))
+			return false;
+		if (firmware_has_feature(FW_FEATURE_LPAR) &&
+		    !IS_ENABLED(CONFIG_PPC_PROT_SAO_LPAR))
+			return false;
+	}
 	return true;
 }
 #define arch_validate_prot arch_validate_prot
-- 
2.28.0

