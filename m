Return-Path: <linuxppc-dev+bounces-12986-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66842BE7F53
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 12:09:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp0sb4GRKz3cYP;
	Fri, 17 Oct 2025 21:09:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760695747;
	cv=none; b=GsvAqjFMBG3yvb9L8hooZlfGgj1LLtTTHmBfO7GWuLqH2bZ4jWkv4JH63bUC+acrFSp7qcCHbiocsfQpqaYRm3ILxwtScJKwEAXtahsOJzd5pSAsoVoqJteVXyRu8LpE7CFbIBRLTk/ygibo0Ekbc6Ds9GhhJeevswosjKJkdLwKB87sJRuExwIzRI0srWbBvr1dqNkXCTgVn6aLSJNnRVTc5zI3Z9jPrPb6tR4ncO7wdY0aQ1t/XMPvzhGimXpQjQqVUjraAWSEl+jfa8dGTvT8y9267wMJVXcwsuxdk6XvwTTJDYcakB45kF7iUBxG/CqnjS4Celawt0MISJ/pfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760695747; c=relaxed/relaxed;
	bh=sQjHTAU2ANvy0R8z2gg1idxWUOVjpB50pHnvfHruLTk=;
	h=Message-ID:From:To:Subject:cc:Date; b=G6U2IH5ZNgkdXuQ5X3x5INYyDET3bW8O1C0j+0rQ2nvujDldJnDfHnawNv923zwETXdg+6v8Gn1NtbMaztEy+YYGY2GsiHjRbKifkf4MfnnoK26+bFLompMu0fqnQuCzYqnDSyuKHQn0oDkAKoLrbvhswsTnKNNTtD1ki6ikJ3IvGEuQEhfcRX5bXvXEyFo5FftVqRrDQOyJZtjeBvW2Em1mF19ePhm9bAGaakbvfQoCkg5ei9UjWRA9E1XppNI/N7uQBgb/HH4I6LtJL6+AwuwnF5Jbqt+9I7QGjs9bKcs38hPGLOacu9wyBc32rK9GtAc7Xd/P+qWnw40llSj4Ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Eko32jph; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jvhhlE5Z; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Eko32jph;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jvhhlE5Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp0sY5l5mz3cZ0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 21:09:05 +1100 (AEDT)
Message-ID: <20251017085938.150569636@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760695735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=sQjHTAU2ANvy0R8z2gg1idxWUOVjpB50pHnvfHruLTk=;
	b=Eko32jphl7W3Xb+zGpZ6phPdMdJwxHmnxeLrIJj9qdJitAWXAuSbzoODtPZR1exPSq4jMr
	Xn7ZTH6KgwcOGALTdCL47R8+MFa4jiWK8UogHGnp9QeK4hbWrSPeVPSRc3y9z6FMLcfPGe
	KbL4vt6K04JVr8neOXAHUbizdH9XNtossRpzFH+fjRoWAjYd4ZAa2/eiSueqkaHZBNR5/Y
	WgMiXtDNsPUyxQGr8DumDuVWYTMwSZ2IlWZkWq/cFKVncN/jALJBcLTV8IeVbKMcArrHJ2
	eizyzm/gJ8rGmf9GDpZ/1JOEQhlypSXGiWokxNij3wWrwzykELy0t6VKFNZubQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760695735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=sQjHTAU2ANvy0R8z2gg1idxWUOVjpB50pHnvfHruLTk=;
	b=jvhhlE5ZDsXkGj4CvFqtuuX6HrygY+mr5PHtByDjb6j+LIqTh5z4fS9wp9QqAIwAio4UlZ
	gHuITp9EO2Np+kAA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 00/12] uaccess: Provide and use scopes for user masked
 access
cc: kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Date: Fri, 17 Oct 2025 12:08:54 +0200 (CEST)
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

This is a follow up on the V2 feedback:

   https://lore.kernel.org/20250916163004.674341701@linutronix.de

The main concern over the V2 implementation was the requirement to have
the code within the macro itself.

The main reason for that was the issue with ASM GOTO within a auto cleanup
scope. Clang refuses to build when the ASM GOTO label is outside of the
scope and GCC silently miscompiles the code and misses the cleanup.

After some back and forth discussion Linus suggested to put the local label
workaround into the user access functions themself.

The second reason for having this construct was to make the potential
modification of the pointer (when the architecture supports masking) scope
local, as that preserves the original pointer for the failure path.

Andrew thankfully pointed me to nested for() loops and after some head
scratching I managed to get all of it hidden in that construct.

So now the scoped access looks like this:

	scoped_masked_user_read_access(ptr, efault) {
	        // @ptr is aliased. An eventual mask modification is scope local
		unsafe_get_user(val, ptr, efault);
		...
	}
	return 0;
efault:
        // @ptr is unmodified
	do_stuff(ptr);
	return -EFAULT;


Changes vs. V2:

    - Fix the unsigned long long pointer issue in ARM get_user() -
      Christophe, Russell

    - Provide a generic workaround for the ASM GOTO issue and convert the
      affected architecture code over - Linus

    - Reimplement the scoped cleanup magic with nested for() loops - Andrew

    - Provide variants with size provided by the caller - Mathieu

    - Add get/put_user_masked() helpers for single read/write access

    - Fixup the usage in futex, x86. select

    - A clumsy attempt to implement a coccinelle checker which catches
      access mismatches, e.g. unsafe_put_user() inside a
      scoped_masked_user_read_access() region. That needs more thought and
      more coccinelle foo and is just there for discussion.

The series is based on v6.18-rc1 and also available from git:

    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git uaccess/masked

Thanks,

	tglx
---
Thomas Gleixner (12):
      ARM: uaccess: Implement missing __get_user_asm_dword()
      uaccess: Provide ASM GOTO safe wrappers for unsafe_*_user()
      x86/uaccess: Use unsafe wrappers for ASM GOTO
      powerpc/uaccess: Use unsafe wrappers for ASM GOTO
      riscv/uaccess: Use unsafe wrappers for ASM GOTO
      s390/uaccess: Use unsafe wrappers for ASM GOTO
      uaccess: Provide scoped masked user access regions
      uaccess: Provide put/get_user_masked()
      coccinelle: misc: Add scoped_masked_$MODE_access() checker script
      futex: Convert to scoped masked user access
      x86/futex: Convert to scoped masked user access
      select: Convert to scoped masked user access

---
 arch/arm/include/asm/uaccess.h               |   26 ++
 arch/powerpc/include/asm/uaccess.h           |    8 
 arch/riscv/include/asm/uaccess.h             |    8 
 arch/s390/include/asm/uaccess.h              |    4 
 arch/x86/include/asm/futex.h                 |   75 ++----
 arch/x86/include/asm/uaccess.h               |   12 -
 fs/select.c                                  |   12 -
 include/linux/uaccess.h                      |  313 ++++++++++++++++++++++++++-
 kernel/futex/futex.h                         |   37 ---
 scripts/coccinelle/misc/scoped_uaccess.cocci |  108 +++++++++
 10 files changed, 497 insertions(+), 106 deletions(-)

