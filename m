Return-Path: <linuxppc-dev+bounces-13311-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C3DC0C5C3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 09:43:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cw6VZ1Cqdz3bf8;
	Mon, 27 Oct 2025 19:43:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761554630;
	cv=none; b=gmkAKMy8AhtvZM1VNMFK66kInqLm0GxNo0NobYKMeLIhEUHWJ/Z9MKjWGL8OJJdyDn97A0EogdGpkasLFbSE64YYtQtkLqruGEm0Sz/kwCan6MZk0m9xUQOMM5s0UaH26MPwNF+iLmZZbypNE21aMG6IOjOZ0cuByvpHCMTyFFuw7vCnqIbaKUclYRNjrpdj3KOw3Y1FkLhMmdOOdO3tILrgF8QvYJSc2RbXvUhcfVAdkxH7YQOWaBIyHDNWYlN5fHcLYhzs/twlpVMqspyzfVmcZKPwOhptuVkd45DjPjNkP7ZPi4+Hj8omNJYMNyBZRazVqBETru+wonk4Vqmxxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761554630; c=relaxed/relaxed;
	bh=O22qaF58WF4tGgLoC6Og2ju8TL8XuvxgR3eoZKY2RJA=;
	h=Message-ID:From:To:Subject:cc:Date; b=IHctcv8M8tnM/cc/3DWmVarThLynjanEqlIJnsBJDygqRQPTnw4psUKOWpk2NekCjUxQEbX+FceyJRgeCfGgPhSzMs1bB0W1f3tnSNUV17S009UezRfkf+7TM1SM9bVe4HhDMXG8ijZU64b6nL1gk+r/OQsvXmiybNcFarrwkwnENRx1WEpflM8QZVV7fgfm4PwLXceIlc2O6Dke45HtV2Pwr/aTq9gaM3u5jqLFC/yx3EYyCEcXSlIOwQQ4JBF0lHTpci9IGTD3GQ8iXNTCAZcAntyO2yeGn81JJIBFnegS0Mgld6rJuuWKizRTVdmsg1A+BBdi8qv1bGd2hMMXYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=iGpxBn9D; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=dGRlxXc7; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=iGpxBn9D;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=dGRlxXc7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cw6VX5QyFz2yrl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 19:43:48 +1100 (AEDT)
Message-ID: <20251027083700.573016505@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761554622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=O22qaF58WF4tGgLoC6Og2ju8TL8XuvxgR3eoZKY2RJA=;
	b=iGpxBn9D31bepoX3FHP5IxFfDs5MNFXXJwqX00s5HifGOgVtnQBNtWlVQO67EBAqw5ZFNe
	jRyhkjcwumS8f4M4armAfDMf932m5kwZLGz6oowakDMrVHJzvvvwd/9RAPtBfWlGzRmEse
	gHNEi72Bj3wWNLUru0yqQR3WMCgyxQGzZOpZ2j0tRwHdogz/sx2wcjKo4NQKBCDIH+c7Dv
	M6bQlHP37PdBS0lJ7hmjRWkogKwMpxS9DNSPeAtvFcyeKirRANDrLqkiZGQwvhNKRe5C7H
	xZdPWOc+g630w3DfFMU/UvoidKO3Wl22xCGwvhnz3O9xIynKtbYCK7vgdMHxyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761554622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=O22qaF58WF4tGgLoC6Og2ju8TL8XuvxgR3eoZKY2RJA=;
	b=dGRlxXc7DXj9/3iHmX+iKPKx+vPqnQiXifrAOlfFvv9S86+GVFnxrCPovoOdbKKfgVviBe
	Sc3dSh9pQ+LjAIDg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V5 00/12] uaccess: Provide and use scopes for user access
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
 David Laight <david.laight.linux@gmail.com>,
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
Date: Mon, 27 Oct 2025 09:43:40 +0100 (CET)
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

This is a follow up on the V4 feedback:

   https://lore.kernel.org/20251022102427.400699796@linutronix.de

Changes vs. V4:

  - Rename get/put_user_masked() to get/put_user_inline()

  - Remove the futex helpers. Keep the inline get/put for now as it needs
    more testing whether they are really valuable.

  - Picked up tags

The series is based on v6.18-rc1 and also available from git:

    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git uaccess/scoped

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
      uaccess: Provide scoped user access regions
      uaccess: Provide put/get_user_inline()
      coccinelle: misc: Add scoped_masked_$MODE_access() checker script
      futex: Convert to get/put_user_inline()
      x86/futex: Convert to scoped user access
      select: Convert to scoped user access

 arch/arm/include/asm/uaccess.h               |   26 ++
 arch/powerpc/include/asm/uaccess.h           |    8 
 arch/riscv/include/asm/uaccess.h             |    8 
 arch/s390/include/asm/uaccess.h              |    4 
 arch/x86/include/asm/futex.h                 |   75 ++----
 arch/x86/include/asm/uaccess.h               |   12 -
 fs/select.c                                  |   12 -
 include/linux/uaccess.h                      |  314 ++++++++++++++++++++++++++-
 kernel/futex/core.c                          |    4 
 kernel/futex/futex.h                         |   58 ----
 scripts/coccinelle/misc/scoped_uaccess.cocci |  108 +++++++++
 11 files changed, 501 insertions(+), 128 deletions(-)


