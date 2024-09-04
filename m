Return-Path: <linuxppc-dev+bounces-975-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C84696B924
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 12:50:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzK5z6q2cz2yVZ;
	Wed,  4 Sep 2024 20:50:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::ad"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725447047;
	cv=none; b=OTAmzZZhZWYScLK4CZGRGzWq6xnVfZsIS6Vgjx/y1qvlaHLuJkZh4+v5n3Nv9VAX/tSouWMypi81HjPsNtzLFOLs24vD0dzRkUp341GST8Qv+5RcDKI3anUZ3nTacB2DiCJ2j16ILFo6/ZhzxsyqS1QA/I/gdDSZE7xxdPqZnpdaiQHi8GPhwO1E4YILwOrFQHHV0xwXjKrlmk4nFZWQ+hftx6EcZtbR8M5Cga9k/7eLFUZkKpdAQ7I7T8snvQ3805MjzLggUDLxTp6wwR/5Rd1HasPYHGiVQIo5L+k3/PiixEL3XuQ51q5Tmn8aYcquguK65iJfavD4X8hKxPMtDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725447047; c=relaxed/relaxed;
	bh=P8NNLQYH8P4X4ClL5Bx8RReyaTo01W2Due3h6Q3oXYc=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version; b=D1NOeWi4iV+D0CrM60KnHVSHTTlbav7dnZrPAJPFi6GRI26tkc5gWnsu60EZ63I42m0kjUU4Lx3g1xAo0Vcj/LNVheXofggbzKtISaJgvIDYxcY22+lBfvcgGtqefv0YYr24STTVX/DbjBKHyp17RkCRrmdk7MOpKtzFNd+0NLCtZZ9NuXhH57DQZn695DhUiYqZVelI/PyeE6dean0JVW2J5RRC7T6qhDkMaDWbz6aAkhxGPqGedqDEwG6niaAdw4SiN1/tZe6xVR+FTAWT6AeAHjEHL0xWZpMnBDLbvBvDNGCkrkS82A0Lx3VRSPY24PbT2OMrUyIvDLN3baaqkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fZ0sTCwl; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::ad; helo=out-173.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fZ0sTCwl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::ad; helo=out-173.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [IPv6:2001:41d0:203:375::ad])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzK5z0N17z2yVV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 20:50:45 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725447026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P8NNLQYH8P4X4ClL5Bx8RReyaTo01W2Due3h6Q3oXYc=;
	b=fZ0sTCwlLwmNS4Qx14Caj3m7+Wf9GvHpK45FyYLnYSoeN3sTNUc9ZNhvJFFXKjE2qIit3w
	xrRRlddFhToMEzSHA9L71dLm3+ol7hxzwVSZI5woh4aBt6SMFmmXNpDbpi/I3M9lEtpG9g
	qWnZMd/+09bOVCE2Sd/kwb0IjKBB0FY=
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
Subject: [kvm-unit-tests PATCH v2 1/4] riscv: Drop mstrict-align
Date: Wed,  4 Sep 2024 12:50:22 +0200
Message-ID: <20240904105020.1179006-7-andrew.jones@linux.dev>
In-Reply-To: <20240904105020.1179006-6-andrew.jones@linux.dev>
References: <20240904105020.1179006-6-andrew.jones@linux.dev>
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

Reviewed-by: Thomas Huth <thuth@redhat.com>
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


