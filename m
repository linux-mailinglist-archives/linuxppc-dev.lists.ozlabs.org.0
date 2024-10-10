Return-Path: <linuxppc-dev+bounces-1976-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 962C9998C13
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 17:45:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPYwt5pb9z3bl5;
	Fri, 11 Oct 2024 02:45:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728575102;
	cv=none; b=PVpo4ngn9p8vvQyrDz09mOwnv+haY90p8+bCjMIpF9bwJ2cw9BzYKuzTNLk44Q/LMCnL3SsBbDmirhRK+10iUUI0wQp4tm+IEVnpwtD/p05OuIhdSS3rD+C+HqdpFP2gKqnv45uLEtCmUINeizTFCVx8VKbuYfhw2cLVMcFNRiqNCWyV8DsIGxlIyBYN4tv/6NVjqzy9J3zqoTJhuxdeWNJJgsNnVN94CHrDuJgYaH0kO59Qo1LvvQDbWGTJA66e3beFl8lH2t/lhlYd7nJdWw4FQVngDpKr53A2orLtUEDg7m//Pje+rGTqyqn88TjMmkORQjJr+EOFsbtFm5o1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728575102; c=relaxed/relaxed;
	bh=8CaseVhBtdpQtjTcTpmIfibKjxpzap/T9WUWXl9xwak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TYiXNy3jj6oDrXgn7JYCuP1xu0vSZRc832U972DOmBdk12P7os9DwpRpzhCPB5aHaVBxqBQHdKlcd8O5XWzy2yVl3iaTGyK/zkyIsvsLTYwVuy10MHImkQXKq6S/3w0j67JAHkIq7YtWuXAG/4jxXfiTudQdPYkU7ZJaF0/8XMBLrT1yTe8VWyX7v5pOlsFQ20Vm+9CQGRXPoCEUvzWM3JUxyy/KjKz0OC4uti5DJ55Vr2KF43mo9GxmEG2XpxjRH5lYFphJ7l3uT6MpIyApm1+KaBUUg+y/F8gEmqAw0OvLZC7OQvvghGUzkje8sXhjoZGK2h2NoD/zETLTDRb4bA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pMtaSsQ8; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aF5YLex6; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pMtaSsQ8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aF5YLex6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPYws57shz3bkg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 02:45:01 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728575096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8CaseVhBtdpQtjTcTpmIfibKjxpzap/T9WUWXl9xwak=;
	b=pMtaSsQ8UrCsbp0jWIphuw/8nDX6xrSAMhkuRxGYx7ednp2ZohFYZNLSwmRC6nGSe96v2R
	myIxY30VOOL+YKTv4KEKjTFAQTFXZxKDzvwO0vdUUx1QOQbBpCECJmfsfCyqDvsc5ltoSf
	sxlDi8TJSOv1F5Xd+LjfoHO7JYjK2etzhLqqeqj4MV6ncu885QuT2gk989A8np/TdqjLeJ
	sAi5Fuo7FllnsTpDwTgpwZDaBvRpi59Lio6+uH2rkZaGgKPjDroa4CVten3bk1oOk52Hzw
	23NiNwtZgS+25/KXZ/e4rP7stFRyMr/IejAb2q1gfs4+vnoDCdiO/hPnPzLaFg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728575096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8CaseVhBtdpQtjTcTpmIfibKjxpzap/T9WUWXl9xwak=;
	b=aF5YLex66+lKNdsdoeGgHL1V07NVdOH+rxgXzLe0/EuBdxw2xWHmfdy3blPVHY68rEImru
	Q6CrxNOILwfKytBg==
Date: Thu, 10 Oct 2024 17:44:49 +0200
Subject: [PATCH 6/9] s390/vdso: Remove timekeeper includes
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-arch_update_vsyscall-v1-6-7fe5a3ea4382@linutronix.de>
References: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
In-Reply-To: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-s390@vger.kernel.org, loongarch@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728575090; l=1648;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Yn7KlHbEU0MJ+dl8y9vpCiJdVRBNRAPzXohBNMI7g0A=;
 b=U2qMs1WEZtI+3Gz7n0ZlWNu0+kuRgmXI0J5su635wqTf1yCSL0UPUdTMPKc+UQDEA1H6FwQAV
 QZnsg/j8477BGlLQZ+LPIOF96Iz9MwCJvbWAUGHv/zuGibQhhFvb0Mo
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Since the generic VDSO clock mode storage is used, this header file is
unused and can be removed.

This avoids including a non-VDSO header while building the VDSO,
which can lead to compilation errors.

Also drop the comment which is out of date and in the wrong place.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/s390/include/asm/vdso/vsyscall.h | 5 -----
 arch/s390/kernel/time.c               | 1 -
 2 files changed, 6 deletions(-)

diff --git a/arch/s390/include/asm/vdso/vsyscall.h b/arch/s390/include/asm/vdso/vsyscall.h
index 3c5d5e47814e16dcfc20f9901481127246e8f348..3eb576ecd3bd998daf9372a52befa8b76d52f2bf 100644
--- a/arch/s390/include/asm/vdso/vsyscall.h
+++ b/arch/s390/include/asm/vdso/vsyscall.h
@@ -7,7 +7,6 @@
 #ifndef __ASSEMBLY__
 
 #include <linux/hrtimer.h>
-#include <linux/timekeeper_internal.h>
 #include <vdso/datapage.h>
 #include <asm/vdso.h>
 
@@ -17,10 +16,6 @@ enum vvar_pages {
 	VVAR_NR_PAGES
 };
 
-/*
- * Update the vDSO data page to keep in sync with kernel timekeeping.
- */
-
 static __always_inline struct vdso_data *__s390_get_k_vdso_data(void)
 {
 	return vdso_data;
diff --git a/arch/s390/kernel/time.c b/arch/s390/kernel/time.c
index b713effe057967623f64da8297314fcc42ff1af2..4fae6c701784746519bab0b295429082529e4501 100644
--- a/arch/s390/kernel/time.c
+++ b/arch/s390/kernel/time.c
@@ -36,7 +36,6 @@
 #include <linux/profile.h>
 #include <linux/timex.h>
 #include <linux/notifier.h>
-#include <linux/timekeeper_internal.h>
 #include <linux/clockchips.h>
 #include <linux/gfp.h>
 #include <linux/kprobes.h>

-- 
2.47.0


