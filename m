Return-Path: <linuxppc-dev+bounces-1241-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 271E3974E3D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 11:14:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3Zds0nYkz2yDx;
	Wed, 11 Sep 2024 19:14:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.171
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726046081;
	cv=none; b=kSHWuNIU/PYtnb39B9lNamRoPcjj7qj49tWQ2UF/DgWike/eB61+j6fgQ1MaQ/o8brPyeBB2W1qg3o7rXudHQ8lQyctc2VuP662hCnWuRT5uQNnBMjKP36dpQSsQLNU43EfU7lvMA6rL+iAMs6ezNQOkQ3Hj8D/KQYId5Fd/iFRwe20qr595Yj4VAWBSvd+z07xxYGFsI3VDPpRfH2rULrXaaqrqKnVnKHeZFTVjrvysgNJwA83HVsPlCSHkDfKy5Vm5jXpuyua60cQX2HYKPS8tYr3+95BZG2bt2Zk9NNh4/u6YjXRTagnxhmSJuhZ2aNnkiJfbOilIpQNdAwwBXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726046081; c=relaxed/relaxed;
	bh=PG2DAax+JlcWtQamyINUSDmt+za3swHNY4VA8lUVONc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QFupFRVEmKXVli0XovKdkOfdFdXWEtjiMPI2zGexGE6b6qFc3kA2AVqQHppmDfTZ10eAyk+CbLc2zxg8ubprwWL0MA5WSDCzYnUE+delYDrpfITXtgSnHMLHZFdPH3/hHs/kcQd04jdmWwCvBR6L+Y8WjoryKmjSyzc10YB3zj87Fr8d1EPRrd39kMO+EgVmIBREmUcYcGwqebbVf7bOv3ZgkypeXH3i7XafAlmYjZJ9vpS8x++lgVKqo2iA9VuEDn8fyO/Q5yWE7g/x/QMjDx4/VKWAH908XqpGEqgu1y+ImdXcN+snjYS/OUlnmdZmLHIdZfTiujttJ4lPQlqG4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ukkq+j7D; dkim-atps=neutral; spf=pass (client-ip=91.218.175.171; helo=out-171.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ukkq+j7D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.171; helo=out-171.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3Zdq1xxyz2xSl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 19:14:38 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1726046058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PG2DAax+JlcWtQamyINUSDmt+za3swHNY4VA8lUVONc=;
	b=ukkq+j7DSgzu99+s4/Sj7crBGzDfShHZKTFs2u72WegAsbbYuORO7jgNfgze3vogvP3D6k
	3vpzTR+AZ1TXwx5pqiziUb+WHgS55/sAqA3h9+fYA90AAidxkqm/fOe0VJ64UegmgY/FWJ
	+I4h4bD34o4s0knIOFV/gn/cq7bPnfs=
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
Subject: [kvm-unit-tests PATCH v3 1/5] riscv: Drop mstrict-align
Date: Wed, 11 Sep 2024 11:14:08 +0200
Message-ID: <20240911091406.134240-8-andrew.jones@linux.dev>
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

The spec says unaligned accesses are supported, so this isn't required
and clang doesn't support it. A platform might have slow unaligned
accesses, but kvm-unit-tests isn't about speed anyway.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/riscv/Makefile b/riscv/Makefile
index 179a373dbacf..22fd273acac3 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -76,7 +76,9 @@ LDFLAGS += -melf32lriscv
 endif
 CFLAGS += -DCONFIG_RELOC
 CFLAGS += -mcmodel=medany
-CFLAGS += -mstrict-align
+# Unaligned accesses are allowed, but may be emulated by M-mode.
+# Enable -mstrict-align if that's troublesome (only supported by gcc).
+#CFLAGS += -mstrict-align
 CFLAGS += -std=gnu99
 CFLAGS += -ffreestanding
 CFLAGS += -O2
-- 
2.46.0


