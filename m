Return-Path: <linuxppc-dev+bounces-1152-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3714E9707A1
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Sep 2024 14:54:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X1qfp5fDxz2xcq;
	Sun,  8 Sep 2024 22:54:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725800066;
	cv=none; b=NO/uUOeEShGJrRHCLOuyCZ7aRc3R+OfWgQ4EMqtCklHrl+Kxt7/ZCBJgsMQZeuWATEmn+r+A05BiIEWi5snEFznZeBXdVLCvDb3IlLUftcJg8UlcL0o0K7ON16iOh+jncgbL1Cy4CG8IRU4/yYfWGlFzYI7+vNX/O4nAnFoI5RgcjZP15tkOtYQypC0Rpu2xV+IFjyZIdoPV56ipCJYz8SgStPbbGBaDf2IwMIHBhc/KMrZFV7oPKLU6hzOzmpzL67f4RScQLUvxPBqjmOePD1b3k21QBitzOhAFma/Wn4Y7b5bwhGIlBbmFvGm0qFUazVB8iLbWukAIMhBtp2AuoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725800066; c=relaxed/relaxed;
	bh=2Y17ZhbdsjhGcFFj8HCQ+c+9k2vo4fvZSNtSSDbpcMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OWktz+vWDdgZxe6UNUUs8pMyIb8iSsj/apVhDQ5ZDQGlcbObzGK0e4wvopOEwVhmEUbyCr6KblWtMS+Nh/ivl543awLJPtf+1d8udS+NSEoax1vVB9S5jGC+Ks5PQPJ3OoI+af84yqWScKDecWkbvkqZidrf97x2R0DBZjJgoe9cy9NA/aOpY9leCxRwlgTW3IbBNvJw7LSlmURLLgzp0xKOkf3C1LdIpjZi5x+phSuztNd5XkkEnE7zZXLs5N+0OD4cH6LHyT/K4wzdxmMOihgBt1OmML1M60bci3Yuegv1sUqJ0t45srccbmtcM4VVWQLQsTt5P6gxv6hyP5XXMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X1qfp3C1dz2xbd
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Sep 2024 22:54:25 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X1qfk3Qvtz9sRs;
	Sun,  8 Sep 2024 14:54:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id No8n7tfpJuzs; Sun,  8 Sep 2024 14:54:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X1qZJ2Zg4z9sXn;
	Sun,  8 Sep 2024 14:50:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7CC738CC39;
	Sat,  7 Sep 2024 17:40:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id jjF9I3I5fwXQ; Sat,  7 Sep 2024 17:40:49 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.96])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0F3958CC37;
	Sat,  7 Sep 2024 17:40:49 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH] powerpc: Add __must_check to set_memory_...()
Date: Sat,  7 Sep 2024 17:40:41 +0200
Message-ID: <775dae48064a661554802ed24ed5bdffe1784724.1725723351.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725723641; l=3067; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=N+qkoDcLCz0nBG8DXDVrSGBMG8nY+5HdmPu0vjkLdMo=; b=3s5nC2tzY102OKRqd/YuS/bwTF8HWMEO8Mj9qHeyPXuxbjT4yXeXh7zMXGVzceYkE1BXdl4r1 L0CuuCR0jbgD7jnIN/2Wum5dnj2wWPMsmuuCyE9qaKUWWPev0kqItK3
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

After the following powerpc commits, all calls to set_memory_...()
functions check returned value.
- Commit 8f17bd2f4196 ("powerpc: Handle error in mark_rodata_ro() and
mark_initmem_nx()")
- Commit f7f18e30b468 ("powerpc/kprobes: Handle error returned by
set_memory_rox()")
- Commit 009cf11d4aab ("powerpc: Don't ignore errors from
set_memory_{n}p() in __kernel_map_pages()")
- Commit 9cbacb834b4a ("powerpc: Don't ignore errors from
set_memory_{n}p() in __kernel_map_pages()")
- Commit 78cb0945f714 ("powerpc: Handle error in mark_rodata_ro() and
mark_initmem_nx()")

All calls in core parts of the kernel also always check returned value,
can be looked at with following query:

  $ git grep -w -e set_memory_ro -e set_memory_rw -e set_memory_x -e set_memory_nx -e set_memory_rox `find . -maxdepth 1 -type d | grep -v arch | grep /`

It is now possible to flag those functions with __must_check to make
sure no new unchecked call it added.

Link: https://github.com/KSPP/linux/issues/7
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/set_memory.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/include/asm/set_memory.h
index 9a025b776a4b..9c8d5747755d 100644
--- a/arch/powerpc/include/asm/set_memory.h
+++ b/arch/powerpc/include/asm/set_memory.h
@@ -12,37 +12,37 @@
 
 int change_memory_attr(unsigned long addr, int numpages, long action);
 
-static inline int set_memory_ro(unsigned long addr, int numpages)
+static inline int __must_check set_memory_ro(unsigned long addr, int numpages)
 {
 	return change_memory_attr(addr, numpages, SET_MEMORY_RO);
 }
 
-static inline int set_memory_rw(unsigned long addr, int numpages)
+static inline int __must_check set_memory_rw(unsigned long addr, int numpages)
 {
 	return change_memory_attr(addr, numpages, SET_MEMORY_RW);
 }
 
-static inline int set_memory_nx(unsigned long addr, int numpages)
+static inline int __must_check set_memory_nx(unsigned long addr, int numpages)
 {
 	return change_memory_attr(addr, numpages, SET_MEMORY_NX);
 }
 
-static inline int set_memory_x(unsigned long addr, int numpages)
+static inline int __must_check set_memory_x(unsigned long addr, int numpages)
 {
 	return change_memory_attr(addr, numpages, SET_MEMORY_X);
 }
 
-static inline int set_memory_np(unsigned long addr, int numpages)
+static inline int __must_check set_memory_np(unsigned long addr, int numpages)
 {
 	return change_memory_attr(addr, numpages, SET_MEMORY_NP);
 }
 
-static inline int set_memory_p(unsigned long addr, int numpages)
+static inline int __must_check set_memory_p(unsigned long addr, int numpages)
 {
 	return change_memory_attr(addr, numpages, SET_MEMORY_P);
 }
 
-static inline int set_memory_rox(unsigned long addr, int numpages)
+static inline int __must_check set_memory_rox(unsigned long addr, int numpages)
 {
 	return change_memory_attr(addr, numpages, SET_MEMORY_ROX);
 }
-- 
2.44.0


