Return-Path: <linuxppc-dev+bounces-12813-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6A7BD79FA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 08:49:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cm4ZK2V0zz2yrZ;
	Tue, 14 Oct 2025 17:49:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760424553;
	cv=none; b=SlmncC5y/pOoo4G3iQqQrHq5EBA4LEAZXh0jHbj6U8UVzv4r4GnE6MZTXl7b+8Le9W+wX5WAN/9hkGYIGp0O2q4qreEIH6mcpWyb/pVO/IHWLSuYaqBIseQoto0yIK/gvggQrau+qlA3ulE7NqdQFhKDuEbdChXI1B5X/bpy/pg9ylqHIqK0im4rE2K5Ap11UIuGiqPALgQKU6Jei2LkhtKdgXiXZfsYHg+22P06ESQtl4/S906PajrH5Z/pIIIoN4UXdcIrT+Mu0Mpg4VHBBX+RtRjISvpo5EVs0Xt6k1fBSn2D2dFHpERhlXan6cSdgtPRfoZVg7iB7TiXD2FUjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760424553; c=relaxed/relaxed;
	bh=vpEp5M7NzfQSiFH2jKL570Ai1wZvStN2XYEWzJ3d1nM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AsjUoQuvAZjSpDgj1HDNOhwXXZAsjnzRBDzVcQTO99Hnbfhv8Jp8x9Lxa+yDj5xiCX6A4MDYbayFumYaF1Ihn2XcsqfiWPZlGu+Ad2/fDIO4Fyo0U4YJnCHLfrOIlldPQ+hS30yfMBgTewZoXjJEko+T/eVwGdIAt+l8Wzfukj44Foks1sz6K8RMPmxWPoIviTp1oD24NXjSWgjGqyaNL/+lcG8tNrDyUTsayBgApeeSJyJAOkEhKUzBQlSRw/V9rxjScH7Y+DdtqYSHkK2AHBBuL3EqGf/sfjS/xLlbdkR5PHfB1zpcuFvYhMEz1V9h35k8iicHxMivXOtlPoyaLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=AbS1ivXK; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=J46V6TKs; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=AbS1ivXK;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=J46V6TKs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cm4ZH1Fj8z3020
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 17:49:11 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760424547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vpEp5M7NzfQSiFH2jKL570Ai1wZvStN2XYEWzJ3d1nM=;
	b=AbS1ivXKSxxKvhGecPLcRSNUEWEuw9fn6U9T3JexzRDy4JP8ptlcSanCYF7zLa7B67+Fvx
	vWnzFZpxNxM35GWpLIGZRc6nT8e15qKJ03J0cCqPobHZ10bRDU/JD56SGgEXedarEiedw0
	UmgAgk0wbFazDmiJ/4I1Psqpi57GDcTb2aDqLWjaCwXFbhwedWiRm8Dv/sUI0ZAnVA0DJy
	DKzMrqyjpZb62iR/9tN73/HrfsZyr3QuaxXpuQG1x9YgTtIOXEuBtSM+husw4mfA1Xxamw
	XrpoFznq3OcrLyOV/jN2QbdxFGXTjcVXOHEVMFjepXBXGWwPZ/TOQ/hdp0hORw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760424547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vpEp5M7NzfQSiFH2jKL570Ai1wZvStN2XYEWzJ3d1nM=;
	b=J46V6TKs5EP3v7C7yqoHXUbYqQbF+JHtlmqZ3FKeLekr9GW27Um+kEL7iiE8relpRw5k4T
	qT89+dQndZVSw0Aw==
Date: Tue, 14 Oct 2025 08:48:47 +0200
Subject: [PATCH v4 01/35] selftests: vDSO: vdso_test_correctness: Handle
 different tv_usec types
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-vdso-sparc64-generic-2-v4-1-e0607bf49dea@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
In-Reply-To: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, 
 Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760424546; l=1636;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=xwlcFnQEXqQ5ZW5NFBVaIG/RI+shPsghmy7vrrzmGh4=;
 b=qHfqnjpjjXV61eOxYf7edKHo0slWvZ5SYsA/BifGNprPJAD8Khq30C50W+CTRD32kGW8dw5tZ
 hV7nr3UKiEeCeSt/ajtTzQxWm4toVPCt96lvMzDcV9Vp8mhorWE8oeH
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On SPARC the field tv_usec of 'struct timespec' is not a 'long int', but
only a regular int. In this case the format string is incorrect and will
trigger compiler warnings.

Avoid the warnings by casting to 'long long', similar to how it is done for
the tv_sec and what the other similar selftests are doing.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 tools/testing/selftests/vDSO/vdso_test_correctness.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_correctness.c b/tools/testing/selftests/vDSO/vdso_test_correctness.c
index da651cf53c6ca4242085de109c7fc57bd807297c..5229fcaae8194d51b2cdffdbae59f00cfaeb96dc 100644
--- a/tools/testing/selftests/vDSO/vdso_test_correctness.c
+++ b/tools/testing/selftests/vDSO/vdso_test_correctness.c
@@ -412,10 +412,10 @@ static void test_gettimeofday(void)
 		return;
 	}
 
-	printf("\t%llu.%06ld %llu.%06ld %llu.%06ld\n",
-	       (unsigned long long)start.tv_sec, start.tv_usec,
-	       (unsigned long long)vdso.tv_sec, vdso.tv_usec,
-	       (unsigned long long)end.tv_sec, end.tv_usec);
+	printf("\t%llu.%06lld %llu.%06lld %llu.%06lld\n",
+	       (unsigned long long)start.tv_sec, (long long)start.tv_usec,
+	       (unsigned long long)vdso.tv_sec, (long long)vdso.tv_usec,
+	       (unsigned long long)end.tv_sec, (long long)end.tv_usec);
 
 	if (!tv_leq(&start, &vdso) || !tv_leq(&vdso, &end)) {
 		printf("[FAIL]\tTimes are out of sequence\n");

-- 
2.51.0


