Return-Path: <linuxppc-dev+bounces-1244-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F06C6974E44
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 11:15:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3Zf162wKz2ykf;
	Wed, 11 Sep 2024 19:14:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.178
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726046089;
	cv=none; b=YmU7VZ4GHDW/L1/YnQdWbb0KlxyJMfH+WRqlam82zSVrvqIYFq1esStsnJHzU8v6YsNOr4YPCjkXMLGiMBlFruVj/QTKYGznchozK6CQtaEcSNW7/oTUi0Nn4CtDhL58LW89sxcvkNiaivTRNtx6WJKgi8XFuoPZXHiBBH8HF/UpA5fAZvWJJCH6wy2swa3hcR/c5idBOj0pS3++NAR3daWzYmGKYxo/OvwStT9uGNgK6dG29jSApZdH5a3HoN7wk0I9Ybscx4VLJlg06pMXvtbEP6+VGKhUrLSDOn80I7YWcd93CujkUNCkCREDeTwWn+sZETQLaNUnuflXHV3PGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726046089; c=relaxed/relaxed;
	bh=MtkZ2ndqa6RRIHxpRtEfZPe4ynCm7zVypuZ3bs/mIVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WYSWeQuRAg3eB0c3kJedmsYGsotR3/fK6z/KTqCdPfGRtRT0xVmW14Ow13Kj7c+lDRD5fRoJY/LvWCQzl6/OXqY0UcMnZ3Iws2DENop4WAVsFA6PFVssaDbC5qQtCK1L0WBrxNh/suCt5OX9CemhJXe3FD0AFgFCTs2C9j8DuxHQ8Z1aA/nbHA/jMsBOwdiq5NAh9asbm/Q2RGt28waMhgeAv0QEeNX0zQcsZ0ddED8VYVO8V697T3LMVXBhjCNsPaJk2u5ZBh3NRqb267nw4BUgC1okfY6c0zwKSfeqqys37t7bTaE5gfblQqUT7+xnWSImilfdZYL4MPGmGht46w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kvJKJTyz; dkim-atps=neutral; spf=pass (client-ip=95.215.58.178; helo=out-178.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kvJKJTyz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.178; helo=out-178.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3Zf144Ybz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 19:14:49 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1726046071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MtkZ2ndqa6RRIHxpRtEfZPe4ynCm7zVypuZ3bs/mIVA=;
	b=kvJKJTyzy6/oa6wrDUhUrfV6A9jOvecWoWd0cPy5Q/L7HBUALkRDu7Y55grHtuQnoCclCJ
	QNbmDnB+s+iinrVd0DEJ5iBSfY/mZOVza7kFm7RZGobq2AV4wJnAzdF8QlX43/DrOB6g4K
	kKDmoefNcZGmug1DHpbtXxxEjb0EQxw=
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
Subject: [kvm-unit-tests PATCH v3 5/5] README: Add cross and clang recipes
Date: Wed, 11 Sep 2024 11:14:12 +0200
Message-ID: <20240911091406.134240-12-andrew.jones@linux.dev>
In-Reply-To: <20240911091406.134240-7-andrew.jones@linux.dev>
References: <20240911091406.134240-7-andrew.jones@linux.dev>
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

Add configure command line examples for cross-compiling, for
compiling with clang, and for cross-compiling with clang.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 README.md | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/README.md b/README.md
index 2d6f7db5605c..be07dc28a094 100644
--- a/README.md
+++ b/README.md
@@ -17,6 +17,28 @@ in this directory.  Test images are created in ./ARCH/\*.flat
 
 NOTE: GCC cross-compiler is required for [build on macOS](README.macOS.md).
 
+## Cross-compiling
+
+A cross compiler may be configured by specifying a cross prefix. For example,
+for arm64
+
+    ./configure --arch=arm64 --cross-prefix=aarch64-linux-gnu-
+    make
+
+## clang
+
+clang may be used as an alternative to gcc.
+
+    ./configure --cc=clang
+    make
+
+clang may also be used with cross binutils when cross-compiling. For example,
+for riscv64
+
+    ./configure --arch=riscv64 --cc=clang --cflags='--target=riscv64' \
+                --cross-prefix=riscv64-linux-gnu-
+    make
+
 ## Standalone tests
 
 The tests can be built as standalone.  To create and use standalone tests do:
-- 
2.46.0


