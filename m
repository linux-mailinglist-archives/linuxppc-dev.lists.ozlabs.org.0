Return-Path: <linuxppc-dev+bounces-13153-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCBEBFBEC7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 14:49:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cs89y4JpLz30hN;
	Wed, 22 Oct 2025 23:49:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761137350;
	cv=none; b=lQf5SqreO1VTNYh+KUf6lMN7raFbYa8RAq7dZb8bLmPJfCz6PHqfPY09V1foR1DtoHoYKSF82SWqa7xPzLBCmcZs9tYP0133+cRdU7UohWop+WgSEXRvvPYXaJobhoLO1C8XznVpdROevPiOdCp7BIqrGR5ybzrpS+JHrEtFafZSZxgqBOyEVic9Fh9RiUpiDmFwSirLyNCBdo30RqgYE/V+wx3amvidElUAa2mKhkuMHDeW0FL9lX+2P5Ap79V5WGfgXyGmXy5IOJGYb5vADuj7qXs40jbBq4GHmxaMOz0ur1mGiwxdALxwVY7cBg2LGgqq3NjVIRSQbGv5tmkb/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761137350; c=relaxed/relaxed;
	bh=GLXMwWXFIbD7cZKiqLR8SWn7Xt+iSqcrcxps9Q+G9kY=;
	h=Message-ID:From:To:Subject:cc:Date; b=JFGb5YA5hh1AD2WvR1Q/OUCSNu2XIojxFQ20SxWeMwcgEmEV1VKKRgd28SnjA7bvQMQoYlCnKg9z5meykrOi3Lw6dttf+PXUpelnRGxU49k9c6BKxY+Bqolknu2ssF800duCeyTRFRnhuEEhOubWZqR0xPLjyZMLHOcbQGvwG66ipvDQlgTWJHXEF9ByX96eLWVtwoOrBrb1rllFmouGrLM+ic1aP3y12f0aAx+64WQN10uh7NV0w0UQN+xZot4X7RzDqG7Z45o1ZhNKXuW9w9K/+tJqB2lF9K0RQuoywnPFuxYcOCM4G3QqYqbabpLaPBxz+Wk32bhyJVcRZ0A6Rg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EtfaCoDm; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ss9zZT1n; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EtfaCoDm;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ss9zZT1n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cs89x39dfz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 23:49:09 +1100 (AEDT)
Message-ID: <20251022102427.400699796@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761137342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=GLXMwWXFIbD7cZKiqLR8SWn7Xt+iSqcrcxps9Q+G9kY=;
	b=EtfaCoDmFor8sSyXEn7oHgxdwynsxqOq3FyCVUuhPIgRs9x5vdmO92747Cz8TOKGl4pO+h
	ZKBXS45G2J7mtFB7bIbQVW+HUcOV3Y864eGZCPy97TDME/wSAWlPnheYnWGw8sDNUcEaqJ
	18ozfWu+ohRqajooCKIUx6N5b6VdCCo0mx4CHbj65zTzjsxNaXDmXnMkdMlfRmJWxg+7TX
	2HmOV/4/UrxLFOcsdgGb0UUsX1EeRuVxhh5jfU948EwHm7mOOaa17GMdraDdgMT+nOu2Dm
	Nh9yba2+vXILBG3SJv5GUZIWaa5XNotuqPRL+KLJqsLbbK0pDKlJWBfK0candw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761137342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=GLXMwWXFIbD7cZKiqLR8SWn7Xt+iSqcrcxps9Q+G9kY=;
	b=ss9zZT1nrdUlW60YnW7MoEIuOhi/H1ZFLAptXi6Q2OQGKph9Q1UEzducE2vpLJL3u2pCgV
	douIrhd397x/hWDg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V4 00/12] uaccess: Provide and use scopes for user access
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
Date: Wed, 22 Oct 2025 14:49:02 +0200 (CEST)
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

This is a follow up on the V3 feedback:

   https://lore.kernel.org/20251017085938.150569636@linutronix.de

Changes vs. V3:

  - Remove the superflouous if (1) in the scope macro - Andrew

  - Use asm_inline in the x86 conversion - Andrew

  - Rename to scoped_user_*_access(), remove underscores, use a void
    intermediate pointer and add a comment vs. access range - David

  - Use read scope in select - PeterZ

  - Fix comments, shorten local variables and remove pointless brackets -
    Mathieu

  - Simplify the coccinelle script, which needs still more polishing -
    Julia

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
      uaccess: Provide scoped user access regions
      uaccess: Provide put/get_user_scoped()
      coccinelle: misc: Add scoped_$MODE_access() checker script
      futex: Convert to scoped user access
      x86/futex: Convert to scoped user access
      select: Convert to scoped user access
---
 arch/arm/include/asm/uaccess.h               |   26 ++
 arch/powerpc/include/asm/uaccess.h           |    8 
 arch/riscv/include/asm/uaccess.h             |    8 
 arch/s390/include/asm/uaccess.h              |    4 
 arch/x86/include/asm/futex.h                 |   75 ++----
 arch/x86/include/asm/uaccess.h               |   12 -
 fs/select.c                                  |   12 -
 include/linux/uaccess.h                      |  308 ++++++++++++++++++++++++++-
 kernel/futex/futex.h                         |   37 ---
 scripts/coccinelle/misc/scoped_uaccess.cocci |  108 +++++++++
 10 files changed, 492 insertions(+), 106 deletions(-)



