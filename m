Return-Path: <linuxppc-dev+bounces-938-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBA696AA16
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 23:28:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyzHm0xJHz2yQG;
	Wed,  4 Sep 2024 07:28:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725381591;
	cv=none; b=dhAU8ndd1OMTbsn2+uGyEQAEiE9bJKLDk2RqEiWqiI6GNDV2jdSxvzqU/9uLcBwoUJ8E3o0tcYgd+a7tohitxcM86xhGCO3YUEinkmib5hFFde3mhxhjFC/iinXtuDY3wJxEb+V9E7mjeWszRaQbA/k1m6gnEBPqLrf1VHWbJtUQ9bcsC9W9ilNvbZxCIo2epjcRTlOodoE/DlL4EYw74Kcu3VfsLb5Vs1eWQNSxsoNcocO8TzXlQnmvN5BInLX1dYeb2Jp+mYHS9txtqUhTpeSnMNiYfo0pzuND24QqsXQgmMYduDcuOiTscsAE8mvR7zWtzFziYgdW8XR2uhubwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725381591; c=relaxed/relaxed;
	bh=3BZJkoNgFN6URY+7lN/rD+PAMiteNcprRb2IpocXJAk=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version; b=RUqgHru3uvdwhZ9O9ynGDDO/meuOSybq/BmvpfHXRMxQYVDMH8tYNneGTCSLReVCUY9C5A12/p4zpRGIvK29k3VmoSLeZaRf9LaXzvoQUDnTGYXLhQfryTMutnrR9lfpPH9ZljRuABHUpxUeHESzrllFmouoFc/oVB8Ma6p4MqCiutns5+E5K2knG7LH2EdvIBAQ2f/pmfeRWpKpOIaaZgDIpEqahVcdahmPICBBUttv5+4jGLsIsamLforFSc2KeSJqkbF0QXvyFp3nEZzJx6XErIi1WljmPSOsuv5exUODGBuENZ2xz7KJB1qqnUJtyrurvN3IXTB9tNrWVDMzZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fnHXhWjW; dkim-atps=neutral; spf=pass (client-ip=95.215.58.187; helo=out-187.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fnHXhWjW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.187; helo=out-187.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 510 seconds by postgrey-1.37 at boromir; Wed, 04 Sep 2024 02:39:50 AEST
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyrvB5Xf9z2xHl
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 02:39:50 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725381063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3BZJkoNgFN6URY+7lN/rD+PAMiteNcprRb2IpocXJAk=;
	b=fnHXhWjWeEn3rcGrQ/Z+7smSSzd/z9fh1Rnug/H9guDSc4s33GknopNiQVzNKy5PuQFyIs
	lUoEGLn1k6hs+3yDmWrR2nEIJHY1TctbeZQLU/9yK8DdjZ8Q7W4H6vDdr228KqSUmG7Lmz
	ed4VefAucFdC2jsCKGcgx0TDyicuR/4=
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
Subject: [kvm-unit-tests PATCH 3/3] riscv: gitlab-ci: Add clang build tests
Date: Tue,  3 Sep 2024 18:30:50 +0200
Message-ID: <20240903163046.869262-8-andrew.jones@linux.dev>
In-Reply-To: <20240903163046.869262-5-andrew.jones@linux.dev>
References: <20240903163046.869262-5-andrew.jones@linux.dev>
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

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 .gitlab-ci.yml | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 67a9a15733f1..033ed65aec26 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -176,6 +176,34 @@ build-riscv64-efi:
       | tee results.txt
  - grep -q PASS results.txt && ! grep -q FAIL results.txt
 
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
 build-s390x:
  extends: .outoftree_template
  script:
-- 
2.46.0


