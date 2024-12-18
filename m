Return-Path: <linuxppc-dev+bounces-4310-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAD39F6429
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:57:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrFG6vyyz30gd;
	Wed, 18 Dec 2024 21:55:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734519346;
	cv=none; b=Uaz2Hj4FewmWoANIyVrdDnO5Frb9jpLdCV/IzN9bKRb9V76hd7v6jSKmqCm2vwb7ZfVXGsQYHLPWz0Jo0jeeEZgezMo1XM+bDOGooBWsdcKe685G4+69jLF6O+IOJq9U0cem/x7tqFA5HGhtxtzJVTnkQJ99rW/BP/fQjsXSV/dhmLw16pBjufiRK6tiwjXZdJYIHu1883lyDYxJNsvnja1soqs1Q0s4lb48TDXb0ZaLqOE4O9TLKboegwtWdNr/zGTjP0LZqC24x19mT49RI957QV8gbg3+jQkYHKcXs3DdKwrjSPqnqHtf4NCTfsZI2XrB7rlaDZDPC46jqMPptA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734519346; c=relaxed/relaxed;
	bh=AAzcLs7XpQQ2b8/CR5d+7E/PSKUJMEMppMvsSLqgUuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OjIOlR3i3YS8gkQZbzQTI6g/lMR6eSvC1zIyWS7ARs/284cnIhgd4yWk9PvwogmQSX0g6Ms/wLYpmhfiiDMLny621km7g3IeaYwwA3268d10h9DX3PZAG6htLPQTsOzDKB9hE0+F8tyySsY85bRUOKehXjnZyBW9XiPQn1tzMb9XrGAxcRclH8wvnnjEng82pWUXkOTLi8GyIeG/vDNqSh8nxPiedmakt+fKQgvotsOAUJR0USlliKEfZfdRkeMErSQ6/ObBGcAMTzj1OqHzJwcP4qohERfp4EQ0vHpcj0mutHJfg8jxZveOrXrsVqx2D6R3kACpxliQvoC7AhXt+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=sK9XDmXC; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=sK9XDmXC;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrFC0xH9z30WW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:55:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734519335;
	bh=AAzcLs7XpQQ2b8/CR5d+7E/PSKUJMEMppMvsSLqgUuU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sK9XDmXCKgkueE1yOFb3xjoH4eEyheXjiQ5hbaefg/M3LGIp0t1pHmaFlzE2AXIJj
	 OByeHyFs4iDwtyq2LDRy1+u6TgzXCha042fXT6apqBrSGXU+s4FCtRky4etuTlQahf
	 ck9zqc/pLcYXVsgcl1Pek1dRFuCADFyxVG/fwl8ZQrbQa1MbkdFgh4cytsDcj7EvA1
	 Ltlvkm2gMZLDZTY1TPZs3qF4bN3eMVGZbPsfIGhaQ+LiJB2ONWmg9I4S7OYlqZ6NfA
	 SVbXywpWVZegOJamS0qCu5P9XdZuNRQ32iWRAcsjE/J16NNOm+/2B3IPvg/gBFU1pj
	 TR1TWe0PXXQQg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCrF35W4rz4xfS;
	Wed, 18 Dec 2024 21:55:35 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <arnd@arndb.de>,
	<jk@ozlabs.org>,
	<segher@kernel.crashing.org>
Subject: [PATCH v2 20/25] docs: Remove reference to removed CBE_CPUFREQ_SPU_GOVERNOR
Date: Wed, 18 Dec 2024 21:55:08 +1100
Message-ID: <20241218105523.416573-20-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218105523.416573-1-mpe@ellerman.id.au>
References: <20241218105523.416573-1-mpe@ellerman.id.au>
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
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove a reference to CBE_CPUFREQ_SPU_GOVERNOR which has been removed.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v2: Unchanged.

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
2.47.1


