Return-Path: <linuxppc-dev+bounces-3205-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF4D9C8B8D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 14:12:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq0sb58XYz30Ns;
	Fri, 15 Nov 2024 00:11:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731589891;
	cv=none; b=baX/2T1QB/cQbUEh/Y8jj3sKSwvgkN8a31OaumrNpwsMv1vTIEdnt+GKAx9zLx4qSum/BS4Ol53pKvpfpQvQISwmwrx5BNF1sJdGEr/cXT59Acgb7ylbIc4wiFP5V/wwz6Q9TGk5n53onYs7dVplnvZVBzw03/CPRct9faeN6TnrMLOSpe2m403hhri4kzCfdF+2MknycUnKKkJocsAIatLqeOBK0lO0Akwh7pNpxkzweUwwZuOF7U2C8pqFLdcEaunwsnkJ49qxBmd9wTtZGosLOGZ3qnoeLBdCA3uOSat/djdvkbiONlg1vlzAzg8hKIZvzrXAQuFz94nj7LBLPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731589891; c=relaxed/relaxed;
	bh=mwVw1xeiq67pN0xhpzegghoLXiH3gNG3QWpIzQUKwmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KVy9CqCPGWTYxOBStOX0bvFQLEGSYAunM/tuTQ7aPdA7BPWZnhSOBoAoAcwA9TDD1qUro13AeZdwVgCIPY6BpnSlAGIzOSpNZB+Of6yasHz9y/N2euGxvl/B9Maoq0/CUxJ1VM9kyivcrQ2tCyZj4GvHdUOE1mSU/RL6yjX6ad6qClLbUXLa9vkgx5GyttJbIHj42F2/OkAUirnvmIK5n78zugKkfojAq4y8gH/tF8HD4F4y9xkTWvH75GlKc+km4nUYmAh3+mnEAsdE/UyFysh7GDDSPV/iJEcyfMeudNr7grpW253st2tAf0oc52pLICp0ib60nppNAZvtAavKmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fnPvZd2J; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fnPvZd2J;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq0sZ1mjpz30HP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 00:11:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731589883;
	bh=mwVw1xeiq67pN0xhpzegghoLXiH3gNG3QWpIzQUKwmY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fnPvZd2JPXpFBN2uNtf6Iqq1QJhroaf4gtXi2ToUVCbS/oW4gf7RjPakToO/8Wmfy
	 So+GrPZXL8U8lGiLdbUv09Qy/JruojkunnoC3Vt+FeXkQY90MYkaLzYwa8vV972BcO
	 5nVybBOKQ6T50w/BuwW0kim7Jrdj/Izhj64r17WuvkcDUryh6ik9OfRcKqqjTRBEDq
	 MFoPtWMhqYfLaJ95y/ssTQwcQlGqhUZlDdD7IHedmSBAiQjl/eDulQp+1p4wDUDrtO
	 Wa85JBpxf9cjFHgWuuZT814BL9pAV+VA9FuRkIqpUiGv7maBN76VGHBkulZgXzGbko
	 yNoJt0jmAA89Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xq0sR193Cz4x8C;
	Fri, 15 Nov 2024 00:11:23 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>,
	<geert@linux-m68k.org>,
	<arnd@arndb.de>
Subject: [RFC PATCH 04/10] powerpc/powermac: Remove machine_is(chrp) test
Date: Fri, 15 Nov 2024 00:11:07 +1100
Message-ID: <20241114131114.602234-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114131114.602234-1-mpe@ellerman.id.au>
References: <20241114131114.602234-1-mpe@ellerman.id.au>
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

Now that the chrp machine has been removed this test can never be
true, remove it.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/powermac/nvram.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/nvram.c b/arch/powerpc/platforms/powermac/nvram.c
index fe2e0249cbc2..23af93dcb212 100644
--- a/arch/powerpc/platforms/powermac/nvram.c
+++ b/arch/powerpc/platforms/powermac/nvram.c
@@ -589,13 +589,7 @@ int __init pmac_nvram_init(void)
 	}
 
 #ifdef CONFIG_PPC32
-	if (machine_is(chrp) && nvram_naddrs == 1) {
-		nvram_data = ioremap(r1.start, s1);
-		nvram_mult = 1;
-		ppc_md.nvram_read_val	= direct_nvram_read_byte;
-		ppc_md.nvram_write_val	= direct_nvram_write_byte;
-		ppc_md.nvram_size	= ppc32_nvram_size;
-	} else if (nvram_naddrs == 1) {
+	if (nvram_naddrs == 1) {
 		nvram_data = ioremap(r1.start, s1);
 		nvram_mult = (s1 + NVRAM_SIZE - 1) / NVRAM_SIZE;
 		ppc_md.nvram_read_val	= direct_nvram_read_byte;
-- 
2.47.0


