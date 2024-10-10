Return-Path: <linuxppc-dev+bounces-1973-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD6B998C0E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 17:45:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPYwq2wGLz3bjL;
	Fri, 11 Oct 2024 02:44:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728575099;
	cv=none; b=g5mQD9fL538K814rQHq1gaTD3VOjTtwMFJK/t513bFdjDEQyvmi3sKu8qm4y+GDrFPvbMO1RoiKRSJ36kuTdG7jxn6AFJKjNLWT9Xjo4EpB1AQddsBqkBEpOjSsL1/7ZN6baGalmD4eUmWPvV3rF96yaQ5pGrAhuJC6m2XpHq5BzetugUciQ9bkIen9YQjlVDnHR72CQ73SxGzRRy/agFwcKLQwO42lOMF63cwKrOnXkNBegpnZC/15E2MsHrZupYnkyB/7yNNLXvkvFJcxhuMDKDs8EKA70+vzX4H2yUSgVojIMntxbPr6DvGTfszlvdHi4+6f+Stl48FwgQBfhZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728575099; c=relaxed/relaxed;
	bh=WB2N5QQfjQyKK/IUZ575K6iS8NC3eDxd0F8948RG5sI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J39ioKeYExmRUUEy6ZhYKY6OLufAaElbKBt6cMH+OySE5R/1xo83PC/zisgqbnOJVyR7wBccXgR0mQ9uZMXO7I5IeJIevC/ReEON2JLtV9kURk02MJ1sVzc6bfdFmE4UNt8QbJNf+qJDiBgisF02+ggOsfVmJg+vkzj+y1SnwOBQsGWmuKCmYq2c1hzuPignsENzIx2+EYYHPcXQ9CaJP5ZY4zpGcD69iMs8hxB1N0gIGp29PIyNjUXdAXkveN1XHJsNExN+tto2O5OHQ0EQKYfArnO451OtCGfvjqpGslvnZVZlbafsIKIdvuoDxYXYkfh6MzTmsv719kvX8e/qBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ps5/mk3m; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=emr3NoHm; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ps5/mk3m;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=emr3NoHm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPYwp09Rhz2yXm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 02:44:57 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728575092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WB2N5QQfjQyKK/IUZ575K6iS8NC3eDxd0F8948RG5sI=;
	b=ps5/mk3mLsDUcipYhz2wooMeo7xb/Bn2oBPHVLBrTQ3HFkqDcYJw7haKo5JLGLxvxpa0Ut
	iVzD3jy/0zexbSOPVOypbrhox3PKsimdvyEuOqVawg0v8ms+IgZEUUSIkzUOYLP6cWrJhV
	ogjefToGPLbVkuZ/zwTjy4REwnantdhl3WvBJbGxAbb+aWMlxri+pW5bG7xV+TgIoFlZJU
	u4Jgp0XP7/cOTC3s2qC1LSczikNFB8FXdDPVckdjW25HunnkiMwr/osgbleBYRyHT7LUND
	f89GQ/KI9KFltOPdCFC4scwzYUBNIQJopih6hTVRKhrpODcOlXJsnP8rMFX8jQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728575092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WB2N5QQfjQyKK/IUZ575K6iS8NC3eDxd0F8948RG5sI=;
	b=emr3NoHm0dHHfPU9ByEiH4Mdm2TEYYw/8+O2ANg9R48cypLGQulPkR9BJ0bgx2rqUqf5G4
	7XJZRDGckZp7jGDg==
Subject: [PATCH 0/9] vdso: Remove timekeeper argument and includes
Date: Thu, 10 Oct 2024 17:44:43 +0200
Message-Id: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
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
X-B4-Tracking: v=1; b=H4sIAGz2B2cC/x2NwQqDMBAFf0X27EISSqv9FREJyasuSJSsDS3iv
 zf0OIeZOUmRBUrP5qSMIipbqmDbhsLi0wyWWJmccTdrrOESdeMZqWqBfQ7L9N6jPzAV/Wrw68r
 mbjv0HRz6B9XOnvGSz/8xjNf1A5OTjDxzAAAA
X-Change-ID: 20241010-vdso-generic-arch_update_vsyscall-0618e98e2e97
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728575090; l=2075;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=vEHRAngD9MuOuPCRiDNA82VJK+gEUM8qSBaRt6uEvJ8=;
 b=szGvUeLPyxK9BXdP3C2DAht9jfEjDDdicb9QA7bfacls7AZdd5//5wdmNBRY3OWPdXAQ8Ggs1
 vq/W4RoWU/nAhk3XVNwRQTRkMgu+o4WOS9VefNnOTg/jkrdU3MIarWk
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The timekeper argument __arm64_update_vsyscall() is never used and
for historical reasons many VDSO headers and implementations include
timekeeper headers.

With the move to the generic VDSO clock storage mode these are unused.
Including arbitrary headers from VDSO code can lead to build problems.

Remove all of them.

These patches are intended to be merged via the tip tree,
so following patches can be based on a unified base.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (9):
      vdso: Remove timekeeper argument of __arch_update_vsyscall()
      arm: vdso: Remove timekeeper includes
      arm64: vdso: Remove timekeeper include
      powerpc/vdso: Remove timekeeper includes
      riscv: vdso: Remove timekeeper include
      s390/vdso: Remove timekeeper includes
      x86/vdso: Remove timekeeper include
      LoongArch: vdso: Remove timekeeper includes
      MIPS: vdso: Remove timekeeper includes

 arch/arm/include/asm/vdso/vsyscall.h       | 4 ----
 arch/arm/kernel/vdso.c                     | 1 -
 arch/arm64/include/asm/vdso/vsyscall.h     | 3 +--
 arch/arm64/kernel/vdso.c                   | 1 -
 arch/loongarch/include/asm/vdso/vsyscall.h | 4 ----
 arch/loongarch/kernel/vdso.c               | 1 -
 arch/mips/include/asm/vdso/vsyscall.h      | 1 -
 arch/mips/kernel/vdso.c                    | 1 -
 arch/powerpc/include/asm/vdso/vsyscall.h   | 4 ----
 arch/powerpc/kernel/time.c                 | 1 -
 arch/riscv/include/asm/vdso/vsyscall.h     | 4 ----
 arch/s390/include/asm/vdso/vsyscall.h      | 5 -----
 arch/s390/kernel/time.c                    | 1 -
 arch/x86/include/asm/vdso/vsyscall.h       | 1 -
 include/asm-generic/vdso/vsyscall.h        | 3 +--
 kernel/time/vsyscall.c                     | 2 +-
 16 files changed, 3 insertions(+), 34 deletions(-)
---
base-commit: 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
change-id: 20241010-vdso-generic-arch_update_vsyscall-0618e98e2e97

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


