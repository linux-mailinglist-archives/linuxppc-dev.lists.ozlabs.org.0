Return-Path: <linuxppc-dev+bounces-1245-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C34A974E47
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 11:15:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3Zf26fJ0z2yng;
	Wed, 11 Sep 2024 19:14:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::b1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726046090;
	cv=none; b=iQhG1zg5NZ4SoFc5Fkmqq+kwF9Ddb4pSyejupuSpBq2z1oorL7wVNa8Mzk+NCppvND4aekXyMIncmn3yBByYeDt4FFopFbJJGtyytJUAU1OU1Xx94N2mKmBReXlRpnI14z3HPeVYdURdFx6xZNKfTFHFrfN7iXRVflQKdkKLNkPkE57gcUCUSiJd2JkhRPpfmFuVqSszTQnJYiKQyfeM2htbrSk4n4rk541j7otQER9ARzkNDOWeRpwCvaOOZjIU+BVcoJT0QN8tfKORE4VZCXjBaFyAubaq/qawdERwZnEhzZm+YW4ci2N0UeniqxYTPdneF21g9XqvWWeIJjQnjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726046090; c=relaxed/relaxed;
	bh=yRGT6lb3tzG+UP86H6atAuwQ+MUVOTAVqFZGkFQMd2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eslwrgdyL6HWBWuxDw5ucQkGy98WFoRzpJt7p3xMFkgJOuELb6aJxHYUcvfPAVifs5DSpUImuE1G+pL0KLO14AW52xudoEYKs496Z5gK8waxBGW/BAWHhh8Ksxk+mo2H8iHygQthgZ+cW8rkZr1VEnkwubx/hu6Y14dH0Sqh7mnKhebXx+eqECSzEzhbyHOPduoGgdaAX2dO1aKJ5ppvAWtxeedtjFDB3dWZiD/vVH+5BQbNup00ySs/bw8D3gfaSx2aVerGNBghGfffoPPs1nX+rS7xc/Dux+6eWoixmknvx9Tz6p+yZpJYu7WgP+CJYupONtPmWYL2l5fd23VQig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mMpImR09; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::b1; helo=out-177.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mMpImR09;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b1; helo=out-177.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [IPv6:2001:41d0:203:375::b1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3Zf24fYYz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 19:14:50 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1726046069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yRGT6lb3tzG+UP86H6atAuwQ+MUVOTAVqFZGkFQMd2U=;
	b=mMpImR09w2r4shh9WrAx7m6mzN4lsFSyiZjLV4VCcHc4YJQ3JGZES5FqeopE8XVo/XzL94
	B0ie+xtkURN/V3Qe0QgAvUK5x95hN7RkW0sqJ5pvVVVAMbu3ngNkZ1XwAhb6PgXF+ai30Q
	bb9QlyQCHByzWJSZAJCjb4zAzxEIK4Q=
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
	jamestiotio@gmail.com,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [kvm-unit-tests PATCH v3 4/5] riscv: gitlab-ci: Add clang build tests
Date: Wed, 11 Sep 2024 11:14:11 +0200
Message-ID: <20240911091406.134240-11-andrew.jones@linux.dev>
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

Test building 32 and 64-bit with clang. Throw a test of in- and out-
of-tree building in too by swapping which is done to which (32-bit
vs. 64-bit) with respect to the gcc build tests.

Acked-by: Thomas Huth <thuth@redhat.com>
Acked-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 .gitlab-ci.yml | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 67a9a15733f1..b7ad99870e5a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -176,6 +176,49 @@ build-riscv64-efi:
       | tee results.txt
  - grep -q PASS results.txt && ! grep -q FAIL results.txt
 
+build-riscv32-clang:
+ extends: .intree_template
+ script:
+ - dnf install -y qemu-system-riscv gcc-riscv64-linux-gnu clang
+ - ./configure --arch=riscv32 --cc=clang --cflags='--target=riscv32' --cross-prefix=riscv64-linux-gnu-
+ - make -j2
+ - printf "FOO=foo\nBAR=bar\nBAZ=baz\nMVENDORID=0\nMARCHID=0\nMIMPID=0\n" >test-env
+ - ACCEL=tcg KVM_UNIT_TESTS_ENV=test-env ./run_tests.sh
+      selftest
+      sbi
+      | tee results.txt
+ - grep -q PASS results.txt && ! grep -q FAIL results.txt
+
+build-riscv64-clang:
+ extends: .outoftree_template
+ script:
+ - dnf install -y qemu-system-riscv gcc-riscv64-linux-gnu clang
+ - mkdir build
+ - cd build
+ - ../configure --arch=riscv64 --cc=clang --cflags='--target=riscv64' --cross-prefix=riscv64-linux-gnu-
+ - make -j2
+ - printf "FOO=foo\nBAR=bar\nBAZ=baz\nMVENDORID=0\nMARCHID=0\nMIMPID=0\n" >test-env
+ - ACCEL=tcg KVM_UNIT_TESTS_ENV=test-env ./run_tests.sh
+      selftest
+      sbi
+      | tee results.txt
+ - grep -q PASS results.txt && ! grep -q FAIL results.txt
+
+build-riscv64-clang-efi:
+ extends: .intree_template
+ script:
+ - dnf install -y edk2-riscv64 qemu-system-riscv gcc-riscv64-linux-gnu clang
+ - cp /usr/share/edk2/riscv/RISCV_VIRT_CODE.fd .
+ - truncate -s 32M RISCV_VIRT_CODE.fd
+ - ./configure --arch=riscv64 --cc=clang --cflags='--target=riscv64' --cross-prefix=riscv64-linux-gnu- --enable-efi
+ - make -j2
+ - printf "FOO=foo\nBAR=bar\nBAZ=baz\nMVENDORID=0\nMARCHID=0\nMIMPID=0\n" >test-env
+ - ACCEL=tcg KVM_UNIT_TESTS_ENV=test-env ./run_tests.sh
+      selftest
+      sbi
+      | tee results.txt
+ - grep -q PASS results.txt && ! grep -q FAIL results.txt
+
 build-s390x:
  extends: .outoftree_template
  script:
-- 
2.46.0


