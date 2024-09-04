Return-Path: <linuxppc-dev+bounces-976-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2217996B925
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 12:50:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzK5z6yKtz2yVd;
	Wed,  4 Sep 2024 20:50:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.183
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725447047;
	cv=none; b=jM0PtnyD/0PxWoES4qTf8mV+IgB1DvJysxjJ5MxYo942MBWXm1qP8SwRpKABkJ9l8YT0Ei3fi1qHQ4ZtpK9sdYq75p0rnOSJOgHyaJdZPgQgOIzqhVN+fg8oXl/9RvlFOEjTB8I/cXC6ZBR+olE2grBPEEUs3ZnplSfVRBNvMaZWQxgmvZybftsL3LDkrKBd4IHlP2awdyeIOHszDqWakahn+sjvGJBtIvUdco+w2wDKlblJ4N46+E5CzZdxoDqYNPeADf9CUM8AQDgMi9e/ARwpg91SD/BSL1S7PazDk+Mu45ABI2JpKXpS5COGZahdCzLMKIYYOFUDNIKUlpEy7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725447047; c=relaxed/relaxed;
	bh=mriS1H0sJTSVPaDrzCARMiATA5eWDief//MW7qUXAF0=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=L61jm2OdCJ5v6cxawTGgDzCjjigzniKWJWRuoilNM9Zobwi1s2LD6IlojUQ5j1FKv4GyYa3+g5+smJExsyYtSmTFClBBRJfAy0P5mgHcgSkVvogbyhIloC2KeqFTEc/ve/FqnrceKHJArGOU6MxZPrefBJ5gBjKx8inBAf7zaIKZg1XWn6J0GeylpzZYiPKE99rO/umwOZ8TVUQlKtrUpGcE1w0Fz6Xx9aTBn6v9jpia6eHCEFMVVCwlrZqNH2czTYorr3cdOFsSL8VsjAfPmwaBX7OyMa/i2NR6kRcU/26CSQUMz0/oAHULPEks6Vv516yMZc6fOpOJGaVPtUGoEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EFbICRFV; dkim-atps=neutral; spf=pass (client-ip=95.215.58.183; helo=out-183.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EFbICRFV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.183; helo=out-183.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzK5y15Dwz2yRC
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 20:50:44 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725447024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mriS1H0sJTSVPaDrzCARMiATA5eWDief//MW7qUXAF0=;
	b=EFbICRFVSqlYITPSXqcNWPA0WOazR4AJIycYCljwu7mNHiJFebjXOtL5fzFKuZYVoKO9Cd
	pOcp3gcZ48wUuLBSpa1aOPsCbNaq75WpYmjB7vvlrqTDN/cGmY7FPpiWjkpJ26p+8tfK7G
	tE8sDUQ3EV8W3bQqkYlCr4uyaDo6fps=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org
Cc: pbonzini@redhat.com,
	thuth@redhat.com,
	lvivier@redhat.com,
	frankja@linux.ibm.com,
	imbrenda@linux.ibm.com,
	nrb@linux.ibm.com,
	atishp@rivosinc.com,
	cade.richard@berkeley.edu,
	jamestiotio@gmail.com
Subject: [kvm-unit-tests PATCH v2 0/4] Support cross compiling with clang
Date: Wed,  4 Sep 2024 12:50:21 +0200
Message-ID: <20240904105020.1179006-6-andrew.jones@linux.dev>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Modify configure to allow --cc=clang and a cross-prefix to be specified
together (as well as --cflags). This allows compiling with clang, but
using cross binutils for everything else, including the linker. So far
tested on riscv 32- and 64-bit and aarch64 (with some hacks to the code
to get it to compile - which is why there's no gitlab-ci patch for aarch64
in this series). I suspect it should work for other architectures too.

v2:
 - fix building with clang and --config-efi by suppressing a warning
 - added riscv clang efi build to CI
 - picked up Thomas's tags

Andrew Jones (4):
  riscv: Drop mstrict-align
  Makefile: Prepare for clang EFI builds
  configure: Support cross compiling with clang
  riscv: gitlab-ci: Add clang build tests

 .gitlab-ci.yml | 43 +++++++++++++++++++++++++++++++++++++++++++
 Makefile       |  2 ++
 configure      | 11 ++++++++---
 riscv/Makefile |  2 +-
 4 files changed, 54 insertions(+), 4 deletions(-)

-- 
2.46.0


