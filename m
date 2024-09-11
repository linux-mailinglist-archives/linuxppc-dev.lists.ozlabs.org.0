Return-Path: <linuxppc-dev+bounces-1242-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA82974E40
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 11:14:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3Zds4b7Qz2xSl;
	Wed, 11 Sep 2024 19:14:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.178
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726046081;
	cv=none; b=BvElyd5ZLIs7BMdprZNhm9kFhWBqyUn3CJ6JwccDHcwDFLq/I9BHQJlrc5ELQWh1BBZXNXPLi4oWZfo4gtvVEi+XP7IaSnFoI1zAAUQwFhpsFWGU0o+JGEzZTynzRF0QHNNFFqOpVGsGOdRF2OU2HImxP15941YoGTo6RUNVuxPG9ALjinIvWI9PR7mDvrz2MyFM0dazfJAHoWKbFhBQO78W+a3uSb3opmfp6uFr0atqguOw+GTA39WD6wyoCEHSRS7dJxYmOLqRx7g+UH3nwF0NX50YOSRo36HUilsFtKKv29UCNvRHiQcZ0WtkdTjRHmEyc+HolIPRFRSUOw6nJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726046081; c=relaxed/relaxed;
	bh=MjH3y5GFZG4iHF0CwOafpGZ1X8c3+7VTVQzIHYqdBQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cko9L8juNgh5UymoMFasfQj9Z5nhryaz5kBw2xM2gv3ecquSZAi70pPjAOJNZ7Ihf58v1I27BZs2HC+Cpo1fIgC8ZKkZv9AtS29pFaPgSBuDd7f/8iZi2MAU3vHDWB98myA64n/d6vjmCiU/VcxQAt7tZP0PtJXg52ubpcuc64DlY80JWErFXtHpZX7SNKnsErZUfXq5k3qCz+GQxRA9E1yS3wdiQaEH3yCDrCh/g44GZJ/MTABDzFpLgSjQR0Fs3FjBLXXnQ47LDL75OcE5gjQCdnejzeKKY4xmaxyqmBMmmVHfTKv8NuTPqmkS3hbuK4jQ7QHK7B+Llq1Eio7BzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Euz6oyDc; dkim-atps=neutral; spf=pass (client-ip=95.215.58.178; helo=out-178.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Euz6oyDc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.178; helo=out-178.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3Zds2SNgz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 19:14:40 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1726046062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MjH3y5GFZG4iHF0CwOafpGZ1X8c3+7VTVQzIHYqdBQI=;
	b=Euz6oyDcYjtOpteyceqjb20WH4aWa8y1bSxbcm2wTTp8P+Bg8DY4V2Uu36HzRSnssfq8xJ
	Fqk4vTcyLs8THPrsw8ErJkMKfRzbgxfN2qAvc3U9npGnGrsXuGEbz5vrCRyFnHrOEocuYk
	S9sibAFjqJUI65I0k8/wmhqsIDpM0ks=
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
Subject: [kvm-unit-tests PATCH v3 2/5] Makefile: Prepare for clang EFI builds
Date: Wed, 11 Sep 2024 11:14:09 +0200
Message-ID: <20240911091406.134240-9-andrew.jones@linux.dev>
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

clang complains about GNU extensions such as variable sized types not
being at the end of structs unless -Wno-gnu is used. We may
eventually want -Wno-gnu, but for now let's just handle the warnings
as they come. Add -Wno-gnu-variable-sized-type-not-at-end to avoid
the warning issued for the initrd_dev_path struct. (Eliminating the
warning is preferred to reworking the struct, because the
implementation is imported verbatim from Linux.)

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 3d51cb726120..7471f7285b78 100644
--- a/Makefile
+++ b/Makefile
@@ -50,6 +50,8 @@ EFI_CFLAGS += -fshort-wchar
 # EFI applications use PIC as they are loaded to dynamic addresses, not a fixed
 # starting address
 EFI_CFLAGS += -fPIC
+# Avoid error with the initrd_dev_path struct
+EFI_CFLAGS += -Wno-gnu-variable-sized-type-not-at-end
 # Create shared library
 EFI_LDFLAGS := -Bsymbolic -shared -nostdlib
 endif
-- 
2.46.0


