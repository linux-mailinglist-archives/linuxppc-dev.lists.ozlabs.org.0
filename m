Return-Path: <linuxppc-dev+bounces-580-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BF8960319
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 09:32:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtK4T1BWFz2xYl;
	Tue, 27 Aug 2024 17:32:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724743929;
	cv=none; b=GVAQN+9WY8RiYqFw0/5NvF+u9kn+4fbcJwWQGGai2iH1Zo+o7IXzedHR3FVzHwqhA2QhDC+JEAs4ciyM2W5FCfsmP7mb6uFVJvFpiryS5QBj7urfLlPT2jajKzZAna5U+qGqq31x+HeRVfLHd9Y3KyxyZ2G4s3bBFo+CCCIGvZdrhqNQEN7ryV5shTBPUZXk1HDIyka8ZAyR0jBCqzup/orD5NCeGGSLwQpK1MiPPU8/2zNwKBulqIqFZNjQClz37vk13wKqNtk7naa58YRnsQcARL5LkVBcZ9IHgiI7pTLFoVERZxdHioC78PSM2NzehOC7wSHMpqQEjLescHdqWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724743929; c=relaxed/relaxed;
	bh=MeIR5KdYJPIluwzc9ZbYvZrXLI0L00OKtXv/UTKaEa4=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding; b=mIzmluFjmYq1iR5iUKU+XJEFi0QLoXP8YcjfLxGE/PZM6mzkK6LXc/X3IuoJre1DdpkJEwZzkiH11h2oQmxUBMCCA+lmlCe07nbwqdAOtd9GJcpqr4oG4oPWueqALji9o0fUwG1HyQpm+zFIhFLJzOgndp3IXcBDyOE9VVW8YfP1rjT0SRfJ52t8wACwcAX/0nP1gWp569G2EMvo3l/xwcGhH3bP5DE87WMzfjXCzX/xPLjvHaC6WQpGA6ElA85hI7PZ02gk048TgsjxaW+qNHdxw+DiU9jq8m1/ds3S1tKo0+QwZEkInASVMskxZPabYkFUCUa+WSvIf3PWsAU9vQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtK4S5rRMz2xTq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 17:32:08 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WtK4N4xQ2z9sPd;
	Tue, 27 Aug 2024 09:32:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mjwE0QcQuI4l; Tue, 27 Aug 2024 09:32:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WtK4N469Zz9rvV;
	Tue, 27 Aug 2024 09:32:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 708458B77B;
	Tue, 27 Aug 2024 09:32:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 6FfdSprD4Gq4; Tue, 27 Aug 2024 09:32:04 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (PO19727.IDSI0.si.c-s.fr [192.168.233.149])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BCBAA8B763;
	Tue, 27 Aug 2024 09:32:03 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Theodore Ts'o" <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 0/4] Fixups for random vDSO
Date: Tue, 27 Aug 2024 09:31:46 +0200
Message-ID: <cover.1724743492.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724743907; l=1053; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=DlsazXpgUZ+Rtf+gb3LjakzOdGFeaxRc9UblP4KWKkc=; b=sdhBscEZA9sEt9ACfOkHid5Wfi17/wl5Iazag5dtcitKymflhseYNsbZYejQ9fMxtytfSgFyH pX/OHgL9JrkDr4wlbpnFZqxdwB157PBRrLw0bDx7LlggB506rgXG0pm
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

This small series is an extract of fixups for generic part of random vDSO in
preparation of implementing vDSO getrandom for powerpc.

See last version of full series at:
https://patchwork.ozlabs.org/project/linuxppc-dev/cover/cover.1724309198.git.christophe.leroy@csgroup.eu/

This series is based on top of:
https://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git master

Christophe Leroy (4):
  asm-generic/unaligned.h: Extract common header for vDSO
  random: vDSO: Don't use PAGE_SIZE and PAGE_MASK
  random: vDSO: Clean header inclusion in getrandom
  random: vDSO: don't use 64 bits atomics on 32 bits architectures

 arch/x86/include/asm/pvclock.h  |  1 +
 drivers/char/random.c           |  9 ++++++++-
 include/asm-generic/unaligned.h | 11 +----------
 include/vdso/helpers.h          |  1 +
 include/vdso/unaligned.h        | 15 +++++++++++++++
 lib/vdso/getrandom.c            | 16 ++++++++--------
 6 files changed, 34 insertions(+), 19 deletions(-)
 create mode 100644 include/vdso/unaligned.h

-- 
2.44.0


