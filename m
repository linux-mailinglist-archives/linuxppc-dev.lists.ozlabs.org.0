Return-Path: <linuxppc-dev+bounces-15231-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52599CF1E9A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 06:18:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dl2Yn6GFnz3byZ;
	Mon, 05 Jan 2026 16:15:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767590125;
	cv=none; b=Qf1FR8eXZUJjs8XvnKE7Ii7uFpRNQkNdcLhqBm9xEBOl0PN3Nu0sthJjaFsRGALDPFeDvyWXoxAmw3MDgwmbqyzDVlRIKGmcu5+0u2H79ekh4m7Tra+OgmYbI5Jz1Y9CJTh1SD459cTMw7Jw/Zdbf/2sNtZAmDhfdb1HAE14PtbEosuLMEZKIIISQQLNIaOtlFKY9Zlo+D7k/Gi2rwuGNws+64axkxYrpQ2cGUl9rOW5PsB8LKJwfKKekhaUEx/EltWr7P8uQNGVqxzJI/L+780JqTTVKIQbPr2UAevO/d03SvkeeORRZiv9g142Dd6D/t8rJTUYtKioqmXmpCPY+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767590125; c=relaxed/relaxed;
	bh=Rs63NXdEtXjD7Eh9znxLAs1Nvqmix+dbkfv7hV4k1XY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NhkzbbvZifFmTLJnHk+4khc2TkFBL8J9lLDdSvzRPSAE+h2vLSMwEV6Rj6GfsPLy1yjgiWjSSmi4CX9KZMJgGC8DkmcQM2BSv0P0hjay7rB2w3JmQdL5CW41rt5MWBgU7SZPHzyx6WYWs+pHFPSV4YchHOMh0rXUwJ6NtkdT+KLEXxcpFkV5Zjr4L4x6shxCC5asAoE4UiIzfMRQGmi1AyNbJCxgPau1md48CDiB6FuYXJ39F/HkGrKNX/IUtZqyh2dzsz7hHRP8r+Y4JvEM5eVYRVqxeEZNnoVolNMa2U1N+r540cPbNI4zbf7oaKKRMaegkrQSIQ+g79llnzRBng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bPdsZ+s0; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bPdsZ+s0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dl2Yn0S9Hz30LS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 16:15:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B9656013B;
	Mon,  5 Jan 2026 05:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70058C19424;
	Mon,  5 Jan 2026 05:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590092;
	bh=geRxBzAl7TSK/fpIj/XhC82GQN0xlq7+PsYx1FYDX+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bPdsZ+s0sKbOH+q/HMC9eucNVcRcMkg4SpEX+JFQUtRNw0vpcM4NbiZQo7VwMIFYb
	 QoFHYPT3uO4dy4nwQokeG2xosTkHn3S6Pk9QENxE2PaAMH5xMsXBFTn6j8vvgHcksb
	 cq4JxtSumUfF6KDVcwFwPr1fOnVTEEmgCBvBW5VXMMbJNZNIEFjt/DXqYWSIaLJDVe
	 2gdc64O4GtBdDXQev62Mr/HheY8hU1HTC0C0Tzf+PLGhwqJ56g9vqz32+xMdDug2YU
	 eWB7MzcFhYsp38MUZUwGbZU9rTkXEMwVGICNdAQC4K9MoI3joH7JpXGAfAaCr65aiY
	 wVCoGj70WNX1Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 04/36] crypto: arm/aes - Switch to aes_enc_tab[] and aes_dec_tab[]
Date: Sun,  4 Jan 2026 21:12:37 -0800
Message-ID: <20260105051311.1607207-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Instead of crypto_ft_tab and crypto_it_tab from aes_generic.c, use
aes_enc_tab and aes_dec_tab from lib/crypto/aes.c.  These contain the
same data in the first 1024 bytes (which is the part that this code
uses), so the result is the same.  This will allow aes_generic.c to
eventually be removed.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm/crypto/aes-cipher-core.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/crypto/aes-cipher-core.S b/arch/arm/crypto/aes-cipher-core.S
index 1da3f41359aa..87567d6822ba 100644
--- a/arch/arm/crypto/aes-cipher-core.S
+++ b/arch/arm/crypto/aes-cipher-core.S
@@ -190,12 +190,12 @@
 	.align		3
 	.ltorg
 	.endm
 
 ENTRY(__aes_arm_encrypt)
-	do_crypt	fround, crypto_ft_tab,, 2
+	do_crypt	fround, aes_enc_tab,, 2
 ENDPROC(__aes_arm_encrypt)
 
 	.align		5
 ENTRY(__aes_arm_decrypt)
-	do_crypt	iround, crypto_it_tab, crypto_aes_inv_sbox, 0
+	do_crypt	iround, aes_dec_tab, crypto_aes_inv_sbox, 0
 ENDPROC(__aes_arm_decrypt)
-- 
2.52.0


