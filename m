Return-Path: <linuxppc-dev+bounces-12830-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E0BBD7B02
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 08:51:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cm4ZY19lhz3dL7;
	Tue, 14 Oct 2025 17:49:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760424565;
	cv=none; b=oubLfjOY06SVQhdkO+OXtCEpcMnRG5ko4nKUy1di408FuzmzmmOBbAuKVKGE/tK2pI6XVBFV+JPOCT1jd54j30FResqla7wWEDLRDrxUXhydA6aqrs/ChgI2Wuj8ee2XomrW6iG0pewoGBjIr8D7znsRABWQqOieA6AvVCaO3oXheoFkD1zgjUrOfqaj+qHgu/KMRyt7LuHa91XnwxuIq8V2FJHih2gHMWtluqbp3i+MfSX3k12KO27IWHwlQ1e6LjXgtY+Ge33DrIEPVYvyUgBzmEhh5mZeYqxos3W66mhEEyAHHT82FSytw4UT6A/Mjm4M+TmIJlDew+c+eEP6mw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760424565; c=relaxed/relaxed;
	bh=w1SV+PqSrKcBXRE0Ygl0UiayHdt8moxs7tJ8I+04D+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l/4uCzTsECzlqCPevbPlocSsNcwo35ouI141i4k5yq5ob8ivQ96pyICFmqrofIVvlRD1hG0DepATKkAcmcl438GqT7IIPoSMIimDtCHj74bD39FfB2pvX0Y5eZOd+KXVxpQrc+kClgE6dbkDoKYVv8K0jR9tFcrcrekvRjM5qhJag+vUHNg/LhmNwDEsGTXjK2lG9SXfdixH9tZx5PkRJnciT1z7LLU+M3qutn0QJEamgvDOgdPXBzNV2RD4IP7aeFEoqh2ernFSs1pqbcM8lEjGy4kdRPLRL6/tMBrdA0b4iv7uPzutzOSpuEoAHIfgYJ57p37WMZw2CRME3/j8ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uDAoLfX8; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wlr8n5ER; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uDAoLfX8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wlr8n5ER;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cm4ZX3L5mz3dJs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 17:49:24 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760424560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w1SV+PqSrKcBXRE0Ygl0UiayHdt8moxs7tJ8I+04D+8=;
	b=uDAoLfX8AtGhb4GyeuHpCZsVBYzTevLi3s14w+JiVRIFBeNH8rf5s4aRSdmqd89nnJyGAS
	GLtLCM+Sqc/qs2WCB9zEokKed9dWAxkFjsxd86ivEYAw2si5zyhy+UCeBiyun+2mn/iQU6
	cAhkBnQODnkPpHIs2ifrttmTI5h7Q4TCflUC+fVHY+dbwQAxnIPQEWeOaTyvIyoky5BttD
	YddnRCDdoKCCbK4xbmaglwprBzaBcJmhZZjAONsipaNzpIpnfu3zsQxYU0UzD3fKbeOG6m
	dVePDxSVmjOZLuRDOq5UuYZBMYYMf+USXyygtbsjaqJIjGwS1AD9LHrDsSLPhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760424560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w1SV+PqSrKcBXRE0Ygl0UiayHdt8moxs7tJ8I+04D+8=;
	b=wlr8n5ERW6AuYQ0UbwdvQD1Nyr3s1PRF/7RMoniaM2FEJz/O2U5s043qXxPrjPV24LR4Vv
	0s9xEHb6VzJ42xCg==
Date: Tue, 14 Oct 2025 08:49:07 +0200
Subject: [PATCH v4 21/35] vdso/datastore: Reduce scope of some variables in
 vvar_fault()
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-vdso-sparc64-generic-2-v4-21-e0607bf49dea@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
In-Reply-To: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, 
 Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760424546; l=1296;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=yVlwKjEkg/2DD/Mb0uz8N0TzPw8B5Wtv5ed+5obQYGU=;
 b=nPMx6LkBwUPLxW/ehTx360cYtgZ3BRrjAS3ty1sT7/2rFUtWvXowMtC4TaG8H/QTBNaCBrL0o
 vif2XhHwllnBcyrzH9hRtHoVonuw5k/VUyBIVfroNGH6G1sKY75W8p1
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

These variables are only used inside a single branch.

Move their declarations there.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 lib/vdso/datastore.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/vdso/datastore.c b/lib/vdso/datastore.c
index a565c30c71a04ff4116c14f43f4450210eba99c5..2cca4e84e5b5e7686d6a2b42b41af4f399cc5261 100644
--- a/lib/vdso/datastore.c
+++ b/lib/vdso/datastore.c
@@ -41,8 +41,7 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 			     struct vm_area_struct *vma, struct vm_fault *vmf)
 {
 	struct page *timens_page = find_timens_vvar_page(vma);
-	unsigned long addr, pfn;
-	vm_fault_t err;
+	unsigned long pfn;
 
 	switch (vmf->pgoff) {
 	case VDSO_TIME_PAGE_OFFSET:
@@ -54,6 +53,9 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 			 * Fault in VVAR page too, since it will be accessed
 			 * to get clock data anyway.
 			 */
+			unsigned long addr;
+			vm_fault_t err;
+
 			addr = vmf->address + VDSO_TIMENS_PAGE_OFFSET * PAGE_SIZE;
 			err = vmf_insert_pfn(vma, addr, pfn);
 			if (unlikely(err & VM_FAULT_ERROR))

-- 
2.51.0


