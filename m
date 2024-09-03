Return-Path: <linuxppc-dev+bounces-937-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D80596AA14
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 23:27:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyzHT32wPz2yPM;
	Wed,  4 Sep 2024 07:27:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.189
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725381082;
	cv=none; b=eBUB78nSH5RI8qSHkYs5HZIrrfqSBti8e/gRp7cCQOuiTk3bT/w+JNmEgdgOP97CScITLLWY3uJoFnGQIybAg2CwreqR8QST2ieErRGKSOdgQDk/2cLW92jV8HuEBFGFiEVc4csAZiiOSgtehxjJirykpbSAcLwVPejhXU3jUiJXX/ZwgSczB3jzffAD61lGn7fzTunOpZMR5d2FpAZdxXS+5fr50cVCN8xsxStx/PhZI0KFH+p6fx6SKXuppv5tIjTAsx2R6uXsX0XPFoGCF2sR9r5vTRyvj3s0pIvr3epO0bR+Jlf/hpbGKVX1gvX7f7DUO/KypvzEFW5dyR+umg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725381082; c=relaxed/relaxed;
	bh=3UxheV3LaB96UvBMKdu1CVVmJDUPIpuIrbtZKkMPtcQ=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version; b=IVRUBIfzTUIh619nf3d81HoWSc1KIlgEKpv82Zvpj2XvvEowvLBAfdaM3KQ+O0gQ0HRoXqsi0ppdQdBdHZ+2qpDE4qAMaA3z3oFh1aC9Xcg+4+wAN5CrKJBupicY7u/aY5b6G1epcHtYl7FRfFtbq13YFWoC5Y7aK9STD4aadK5EXOgHMEvoM4wFGXq9Y6C0oVggWfO7Z2rMDax/hep67dmC6VO8tPAAWATFPzH1g9O63VooAYaYwb9s0GP0uqcU9PaA2pwQiI99PKIAwmxrsqR8NEJUmtScnABbC+fzbmzU/9qR08iDUnbE94yp1Ckg33eQs1WLBRKvvrQqqM/tGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=t/f9dess; dkim-atps=neutral; spf=pass (client-ip=91.218.175.189; helo=out-189.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=t/f9dess;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.189; helo=out-189.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyrjN4r88z2yL5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 02:31:20 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725381056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3UxheV3LaB96UvBMKdu1CVVmJDUPIpuIrbtZKkMPtcQ=;
	b=t/f9dessP1gbOkieG//YAQXRph3gSAkFIlqtbV8X+u4B2ZB8CqL6HKtaQ+2yg5v5b5qHAB
	Kvg6v4fCSYhDvH7/nPjBz1jJ402Uf6c6zAuQ4LJGCGLSZ6gxoVX9xKhmsDG1KHgaxk8h7z
	DbGiBbDKjeGY9q7gQ/Bf3UfmzsNm+CQ=
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
Subject: [kvm-unit-tests PATCH 1/3] riscv: Drop mstrict-align
Date: Tue,  3 Sep 2024 18:30:48 +0200
Message-ID: <20240903163046.869262-6-andrew.jones@linux.dev>
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

The spec says unaligned accesses are supported, so this isn't required
and clang doesn't support it. A platform might have slow unaligned
accesses, but kvm-unit-tests isn't about speed anyway.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/riscv/Makefile b/riscv/Makefile
index 179a373dbacf..2ee7c5bb5ad8 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -76,7 +76,7 @@ LDFLAGS += -melf32lriscv
 endif
 CFLAGS += -DCONFIG_RELOC
 CFLAGS += -mcmodel=medany
-CFLAGS += -mstrict-align
+#CFLAGS += -mstrict-align
 CFLAGS += -std=gnu99
 CFLAGS += -ffreestanding
 CFLAGS += -O2
-- 
2.46.0


