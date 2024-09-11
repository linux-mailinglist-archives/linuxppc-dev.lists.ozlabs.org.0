Return-Path: <linuxppc-dev+bounces-1240-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B060974E3C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 11:14:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3Zds0WdXz2yDl;
	Wed, 11 Sep 2024 19:14:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::b7"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726046081;
	cv=none; b=EUSQneNH3OQVp/4ofc7VYrdICxenRSnOrjYjaptiPbeZRW0UUYHxsv/527/Gh5ZRsk2tj+QtAd4FcXxLfO96OKZm433S93FA8hax1QDcyt/deD75m2NVW2zZiSR9HY7iAqMhfirdCI4ct0US4D64T0PgnYkBdPDqNpq2wEH1QimtkQ1VRQskyIx+kQqegThbEft7ka/MIoYZoC7+HFlo4SWn+TZaAI4jE7Dbr0rBFfHjnXKpDt0XbAM5opbAb1UfiIzFnQWj+IQ1vbSj9+HDkQG1/rWxW56poXz/l2hiugpbs4GE4U00FZ7HrQNEEZO9fXKXfbZkWwzLq6jrTjI9kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726046081; c=relaxed/relaxed;
	bh=fyMdMsKCQOu5UpiuFGR47iMoCTLzsA/eJycU3Mv3Vbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XdlgScdyg4Pz2+9xklRPnfcegUaYa7uBQxBtIhb2Jd3WSN6pZAdUAV3sUGGZiw8FHEJEhVHft/dWhPf6dkSz7dLy+u8s7YAtN4zbumnha0VQPJJtkDHI1NT/JBJs3Qhz36+xegdaNqkqvpKlyXOtLpvS+/jHCS3GHhXhZGuqUWDph28gSkWbUlqK3ugjS+PYuJla2SlBjb7t7uYg5FRpUDXc7lJ8g2UE+3i3rbpscr+XbhI2jKRL8CWw09/zsJ8ec0NdgbUxEffQIYY4W9cCGn9eWMTFB7AJ5fVFHaBdkHwMa3L2qWg+p/nUoDAa/Y1eC7AURm52LKukAE2pYs4C2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oKszq2B1; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::b7; helo=out-183.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oKszq2B1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b7; helo=out-183.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [IPv6:2001:41d0:203:375::b7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3Zdq2dQMz2y8n
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 19:14:36 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1726046053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fyMdMsKCQOu5UpiuFGR47iMoCTLzsA/eJycU3Mv3Vbs=;
	b=oKszq2B1bo4frYhI+HQHEPnCnV3/e3p6ugg//2xh2MI4JsYftikgOuS1vQ+4oMt2JMkY9i
	VZQsA3cFF+ltiew9QSW8n05L1CiXrG5Wc4PEjk90wixvGnHNjYBMMwZmuVDiCTEREz0xec
	8qdsrA6rXSby9QN0vXw59rOVHlVWzcU=
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
Subject: [kvm-unit-tests PATCH v3 0/5] Support cross compiling with clang
Date: Wed, 11 Sep 2024 11:14:07 +0200
Message-ID: <20240911091406.134240-7-andrew.jones@linux.dev>
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

v3:
 - Add README patch for cross-compiling, clang, and cross-clang [Nick]
 - Add comment to the commenting-out of mstrict-align [Nick]
 - Add the reason to ignore warnings vs. fix code to commit message of
   patch2
 - Picked up Nick's tags
v2:
 - fix building with clang and --config-efi by suppressing a warning
 - added riscv clang efi build to CI
 - picked up Thomas's tags

Andrew Jones (5):
  riscv: Drop mstrict-align
  Makefile: Prepare for clang EFI builds
  configure: Support cross compiling with clang
  riscv: gitlab-ci: Add clang build tests
  README: Add cross and clang recipes

 .gitlab-ci.yml | 43 +++++++++++++++++++++++++++++++++++++++++++
 Makefile       |  2 ++
 README.md      | 22 ++++++++++++++++++++++
 configure      | 11 ++++++++---
 riscv/Makefile |  4 +++-
 5 files changed, 78 insertions(+), 4 deletions(-)

-- 
2.46.0


