Return-Path: <linuxppc-dev+bounces-935-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD4496AA0C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 23:26:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyzFS3SLbz2yP8;
	Wed,  4 Sep 2024 07:26:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725374762;
	cv=none; b=PsajC/FOp6ZMDZj5qLEiCyvcZGt0J0Z9zQtDdTx4ovEG2sLaH7Oh3+XkjxneU3Ho1C77ANlQg+WwZWx5/K61flUaxoOnkpwnGYO6TO9ZKL3sLZnvCFQOmrTZwUmr0ROoW22UskQ26VjOYBpL1VgJ51InghJfkoGgDb/0UTUhiY7EHnNQ5VWZAaiRS563D9Z1CN2XSgPFhcddOWVFFQMCOd7oLC2jmgraGwQyil/EJjfJVx5ZOdaixS4YKMrq9nj7MFmkk1d0wTnjRC6pz+uPRYPaY8AhUm3cE2XRCPTYwzktLzc0q6fXUJpQpeVkRnm64fHmHXoh4Ntvsenj3c1QTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725374762; c=relaxed/relaxed;
	bh=acROeX4wqHQCBibnKLGyiTpwL0vS0RTu/8rh/TC4rLI=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version; b=CmTu4QrP/P+Yssrf7LyEvE50C3L0ILgkQm7VpdVB9mK+kuX04CdUtZctA9PHnFoN/3Z71BNnX5k8gLxWra9g/5JIFPqRO8HuAC8qLxUzt9TVB3VBmrAJXDJ2CtniE12V5w7Om4Byo2RNWTGp91qokHOsI8tgymztdEvC1oL2qGjB2/Ns1YATXx0CYtKF4ip/YL45g/kchUEHXLpXp5FXRpzfMPIRMGQ1zkO5NWe8ePqWYTzEC4LBwUXyZq8CbBL9T6p9pacOpjY7VNVCOK+ZN7r6pkCMLEHLQ1gIAm1l59rzH/fdcMRTrqXaH3Xy1jXyQSDgAOOt0fJICsbU7lmuCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vHoflyVp; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::b2; helo=out-178.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vHoflyVp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b2; helo=out-178.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WypMt0bC1z2y8V
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 00:46:01 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725374396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=acROeX4wqHQCBibnKLGyiTpwL0vS0RTu/8rh/TC4rLI=;
	b=vHoflyVpKDBL64vOUcRFDZgtoMnMqr7rwaRFtKEoQMfwFLEhKq5tk7LEfCwXEynItLVdq6
	tjakOD0DyfhDsmpS74rXU2Hp/uMw/gF1zkwEDUs0P8OCRQYTNbjiXiwxKSFkzxTUgxYXk3
	vK98MhaeymL1QkoxovGVAv1Na1ChSP8=
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
Subject: [kvm-unit-tests PATCH 2/2] riscv: Make NR_CPUS configurable
Date: Tue,  3 Sep 2024 16:39:49 +0200
Message-ID: <20240903143946.834864-6-andrew.jones@linux.dev>
In-Reply-To: <20240903143946.834864-4-andrew.jones@linux.dev>
References: <20240903143946.834864-4-andrew.jones@linux.dev>
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

Unit tests would like to go nuts with the number of harts in order
to help shake out issues with hart number assumptions. Rather than
set a huge number that will only be used when a platform supports
a huge number or when QEMU is told to exceed the recommended
number of vcpus, make the number configurable. However, we do bump
the default from 16 to 2*xlen since we would like to always force
kvm-unit-tests to use cpumasks with more than one word in order to
ensure that code stays maintained.

To override the default for NR_CPUS to, e.g. 256, testers should use
--add-config. For example,

  $ cat <<EOF > 256.config
  #undef CONFIG_NR_CPUS
  #define CONFIG_NR_CPUS 256
  EOF
  $ ./configure --arch=riscv64 --cross-prefix=riscv64-linux-gnu- --add-config=256.config

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 configure             | 3 ++-
 lib/riscv/asm/setup.h | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 7a1317d0650d..5ed0c28fcaea 100755
--- a/configure
+++ b/configure
@@ -508,7 +508,8 @@ EOF
 elif [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
 cat <<EOF >> lib/config.h
 
-#define CONFIG_UART_EARLY_BASE 0x10000000
+#define CONFIG_NR_CPUS			(__riscv_xlen * 2)
+#define CONFIG_UART_EARLY_BASE		0x10000000
 
 EOF
 fi
diff --git a/lib/riscv/asm/setup.h b/lib/riscv/asm/setup.h
index a13159bfe395..43b63c56d96f 100644
--- a/lib/riscv/asm/setup.h
+++ b/lib/riscv/asm/setup.h
@@ -2,9 +2,10 @@
 #ifndef _ASMRISCV_SETUP_H_
 #define _ASMRISCV_SETUP_H_
 #include <libcflat.h>
+#include <config.h>
 #include <asm/processor.h>
 
-#define NR_CPUS 16
+#define NR_CPUS CONFIG_NR_CPUS
 extern struct thread_info cpus[NR_CPUS];
 extern int nr_cpus;
 extern uint64_t timebase_frequency;
-- 
2.46.0


