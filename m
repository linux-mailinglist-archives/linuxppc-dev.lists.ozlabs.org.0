Return-Path: <linuxppc-dev+bounces-3193-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4F29C8B27
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 13:53:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq0QY2T6Jz30Np;
	Thu, 14 Nov 2024 23:51:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731588693;
	cv=none; b=b76wc8+QFfjshMXj8aGeEoGRjzAnQDnQGQRBmw9EOMcNfdWeZ87a85GWA7voNBfk/lT1d1UcdYDl+S+NHRZohRu8p+/gl0XoCACqRLq8kuK2TDQK3BoZM3SrmlGk8ozkDLks0R1NVMtsQZ1Qr+exG3VhIYHYLOxHXlxWR6z6P8wq1Flt/+NJJHUNlYZ/husL4OlF204Hu8fm4dMYaswP0zStSmz043cI9h0ef/GiPJxN7+GLqqh29hZlf7LXAVLFwp474NZ+CaxFv15P+xa4GNzXMaccHecUjFrdfwF5iaOzi4S576ktoUfzQgKRyFQsq2RCzqIb0wAkRh9h6HnRjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731588693; c=relaxed/relaxed;
	bh=wa8kkMFSI7eeE5/UlhqUXcjhe3HJUAryRv831YI9duo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y3DGEUBK+e5wowgyikwD5RF4PyGspqT8PYWK+pZ8PikImIuwG3Rf2sxFv6SDATFpaRwjhcd5XpYUye0nD42kLc4R6zpNMZZtD2tZ5k45uqrQkJ2VqZm4w6QIQ+Jhap/ejJ5nPQDVKlnGrgtqoQ1y1PRps5y/EKcGuJrJwtG9ueYm9/x6O9NtzwK1tt7daXxfJpG5gqCocqSAtpn+QDxwvBnzlRn2EdRuvHtdpP1ZXANrY+eeoOfWY3UuFG69CaY7HuGCsN4zoSCzGEsvRtSFLKzxuvkjoflONrUifU9vwCW0tuc2ryXy/cr9kdYoDDcux0t+I7qg+B+8W9jJ6hXSYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MweNg4/K; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MweNg4/K;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq0QT1FrTz3089
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 23:51:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731588686;
	bh=wa8kkMFSI7eeE5/UlhqUXcjhe3HJUAryRv831YI9duo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MweNg4/K+DSyryUNs/7J2WK0Vt0Q1Zhaw3vU1r6ja9Yuca4yZ9TK4JXNj5Jfx8+Eq
	 LawQYA9By0CQTPIEgU2UCgJkA2JdIpvxgoEaumCzfHNQEHoA9vzC6/ybJqV5+IT+7l
	 aL3vF2qM6F0IELyhLnaXOlWo0ykPrBCEwRgU70q1/S4k3rJHPvquJ/e7vf7h55hbat
	 apHY/0dstRW3JrvwZOF3TKCgV3CWBLU4N4BtvduGWoH84u+/2CoKqF5fDG+LICGmSo
	 7jNPF/wLJG9IvzpxpgJhGDXXgHKYa8DjYbJMbinZnDdJSd4YzqBrCJhaWJnw7pyaaO
	 UjRGz71eRYQ3w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xq0QQ0NY2z4xcY;
	Thu, 14 Nov 2024 23:51:26 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>,
	<jk@ozlabs.org>,
	<arnd@arndb.de>,
	<geoff@infradead.org>
Subject: [RFC PATCH 19/20] docs: Remove reference to removed CBE_CPUFREQ_SPU_GOVERNOR
Date: Thu, 14 Nov 2024 23:51:08 +1100
Message-ID: <20241114125111.599093-19-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114125111.599093-1-mpe@ellerman.id.au>
References: <20241114125111.599093-1-mpe@ellerman.id.au>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove a reference to CBE_CPUFREQ_SPU_GOVERNOR which has been removed.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 Documentation/admin-guide/kernel-per-CPU-kthreads.rst | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-per-CPU-kthreads.rst b/Documentation/admin-guide/kernel-per-CPU-kthreads.rst
index ea7fa2a8bbf0..ee9a6c94f383 100644
--- a/Documentation/admin-guide/kernel-per-CPU-kthreads.rst
+++ b/Documentation/admin-guide/kernel-per-CPU-kthreads.rst
@@ -278,12 +278,7 @@ To reduce its OS jitter, do any of the following:
 		due to the rtas_event_scan() function.
 		WARNING:  Please check your CPU specifications to
 		make sure that this is safe on your particular system.
-	e.	If running on Cell Processor, build your kernel with
-		CBE_CPUFREQ_SPU_GOVERNOR=n to avoid OS jitter from
-		spu_gov_work().
-		WARNING:  Please check your CPU specifications to
-		make sure that this is safe on your particular system.
-	f.	If running on PowerMAC, build your kernel with
+	e.	If running on PowerMAC, build your kernel with
 		CONFIG_PMAC_RACKMETER=n to disable the CPU-meter,
 		avoiding OS jitter from rackmeter_do_timer().
 
-- 
2.47.0


