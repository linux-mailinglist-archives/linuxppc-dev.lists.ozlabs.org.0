Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6435632493C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 04:10:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmHq52f88z3d43
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:10:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=K8QH/n+r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=K8QH/n+r; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmHpf04wgz30Nh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 14:10:16 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id e6so2857433pgk.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 19:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jW4bSllS0v0KvBNc1JEF+RaFasevpCMEEDVEGoyuGSM=;
 b=K8QH/n+rE4n1t2hoz2TB1hNcUo8ZCf7tnsxbtwSFMQE/TnrvG2PAbt5ktRZTkAPLGU
 pzYJFauCRoyanHrlnu2oVfd0xxwu5dgMUgqukduwHmi4epw5D+etRYIfUWGISW5b9f0+
 T2ONPw2m1/GZs+fhHqhpqO9d6GCU6D4sp/z8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jW4bSllS0v0KvBNc1JEF+RaFasevpCMEEDVEGoyuGSM=;
 b=o/Hbk6AWnb7iP9pnd1tPFKerGq6+QOQJgxlYZdDgrns88JW5IKBjEFpF/sXeb33WKS
 DDLeDEq0RS0GYirQ+emBjeK8ti9jnFvllUGgIO10Td0T4BXQ2FN8t+srUEZBSqz7bn03
 Jx0uwEgVwKOEunP91fAFF2LrU7oXdDy0sybKfeyMsjPqaloq04rJKs5dds7djOHpQVUC
 pSidfbEClyrCFeV0MAAVyRQsgY2r76X19pDmHiDgWnzzaZRHtRGsJncxToAcv7kQJQso
 wKf92YYDdBpYGi7su/Yd8AO61c6bJJl5viorIlaQEY7FOJVHcE1VdFWzMX2x2VjTKkIB
 Dd1A==
X-Gm-Message-State: AOAM532V4iPwb1ALe3bf4ymkvkGwRjYXc4kyE9HTlKLi7Ym3CrR3sG9R
 kpg2jLnXal33KO2LTRL+6XTCPQ==
X-Google-Smtp-Source: ABdhPJwWfKaU7cQmZsZMxXkmHBxlnJnV6ZOsfBa5MFom7R2wHQTv2BbeaBu9YwLAGb2FeoDmMBkwkA==
X-Received: by 2002:a65:5c44:: with SMTP id v4mr1000481pgr.362.1614222611936; 
 Wed, 24 Feb 2021 19:10:11 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-6e65-7e50-8dac-f7ef.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:6e65:7e50:8dac:f7ef])
 by smtp.gmail.com with ESMTPSA id z10sm3982721pjn.11.2021.02.24.19.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 19:10:11 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: llvmlinux@lists.linuxfoundation.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 0/8] WIP support for the LLVM integrated assembler
Date: Thu, 25 Feb 2021 14:09:58 +1100
Message-Id: <20210225031006.1204774-1-dja@axtens.net>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To support Clang's CFI we need LTO. For LTO, we need to be able to compile
with the LLVM integrated assembler.

Currently, we can't.

This series gets us a bit closer, but I'm still stuck and I'm hoping
someone can point me in the right direction.

Patch 1 is a fix that can be merged at any time.

The rest of this series is pretty rough, but with it, building like this:

make CC=clang-11 LD=ld.lld-11 AR=llvm-ar-11 NM=llvm-nm-11 STRIP=llvm-strip-11 \
     OBJCOPY=llvm-objcopy-11 OBJDUMP=llvm-objdump-11 READELF=llvm-readelf-11 \
     HOSTCC=clang-11 HOSTCXX=clang++-11 HOSTAR=llvm-ar-11 HOSTLD=ld.lld-11 \
     LLVM_IAS=1  vmlinux

on a pseries_le_defconfig without Werror works except for head-64.S,
which still fails as described in the final patch. Help would be
appreciated because it's deep magic all around.

Apart from the very very dodgy change to drop the tlbiel feature
section, none of the de-gas-ing changed the compiled binary for me
under gcc-10.2.0-13ubuntu1.

Daniel Axtens (8):
  powerpc/64s/exception: Clean up a missed SRR specifier
  powerpc: check for support for -Wa,-m{power4,any}
  powerpc/head-64: do less gas-specific stuff with sections
  powerpc/ppc_asm: use plain numbers for registers
  poweprc/lib/quad: Provide macros for lq/stq
  powerpc/mm/book3s64/hash: drop pre 2.06 tlbiel for clang
  powerpc/purgatory: drop .machine specifier
  powerpc/64/asm: don't reassign labels

 arch/powerpc/Makefile                  |  4 +-
 arch/powerpc/include/asm/head-64.h     | 20 ++++----
 arch/powerpc/include/asm/ppc-opcode.h  |  4 ++
 arch/powerpc/include/asm/ppc_asm.h     | 64 +++++++++++++-------------
 arch/powerpc/kernel/exceptions-64s.S   | 33 ++++++-------
 arch/powerpc/kernel/head_64.S          | 16 +++----
 arch/powerpc/lib/quad.S                |  4 +-
 arch/powerpc/mm/book3s64/hash_native.c | 10 ++++
 arch/powerpc/purgatory/trampoline_64.S |  2 +-
 9 files changed, 86 insertions(+), 71 deletions(-)

-- 
2.27.0

