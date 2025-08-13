Return-Path: <linuxppc-dev+bounces-10932-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBACB24793
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 12:41:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c24gN0sKQz30T8;
	Wed, 13 Aug 2025 20:41:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::ae"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755081712;
	cv=none; b=T+rKVbFnH4Bakdj/ixfDLIcXTJdCPgxK/98JlW0/Czf2mQHHreQDThlHzA7neo3SXJyJf4QpSs/tUIaZ5HiNHg2DZ8PuFn6Va1QfsB9e75cx7atCAqj/pZP/JwO3tLMduL1Q2c5Nilg/OOvE6WWwHz/5jhMqYrbJECySl6qEQNEle22+1N1oHzgBOi/LLPLcwzGnE/Y7YqbZIFmcqXatfUca26cEUN2GRiwatN2OXu+knP9eT6CcUnLGcAjCZjwzDVMSZDnsz842tKv+ofQCLLsG79I2h3qhCo+zYjSseROFelFKhlDo1mzkzzrDqxRGal9B8CS9AccjHb953aTj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755081712; c=relaxed/relaxed;
	bh=yRug7LQyvFONu46jBMGRmPeIFE9+yuqhOdPPzW6dSeU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oa2uBgzKfNkQ6av8vC0cbxCNntqwCb596fDvNXNOtlqhpPuVD4t43n3hkWUqR3OOJG3WAJM0cRFqOzW9W+MJADsEufNf+bz+cUHXB1GBtzBe6dULAgDFMWEEbxcL0fuqArryXrw1j3djQzL42SUB0SmPHqwnqsfDyKKNodfMFJGtvk2RWkG0+j35ngDE01Z5yFMR1m1HpB4hAK/Uc1/f+JdCDw3laOTIPo4Fmc77VUdZ7DXmIku0e1tutFmHXESUDc3TRuVrZfEnC7ofSzVj0ueC9+9WTerqr82rrb2UbS2Lb2rRpDTEjcFqRT90dyzyB7UzncX2+Ty1kWKkJGnvYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=M7ij0xoP; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::ae; helo=out-174.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=M7ij0xoP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::ae; helo=out-174.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 550 seconds by postgrey-1.37 at boromir; Wed, 13 Aug 2025 20:41:49 AEST
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [IPv6:2001:41d0:203:375::ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c24gK3d9jz2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 20:41:49 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755081138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yRug7LQyvFONu46jBMGRmPeIFE9+yuqhOdPPzW6dSeU=;
	b=M7ij0xoPfeD2CH1dQLA/0tV34M+LYKhKQFovdoB6gCYrIzbVZxdkMWBds9fseU3RgqQ6d/
	vcTf3us3Ri+Jqeh6OoTjfaXWQgQSlOU+nNVEZU1l3/sHwIUuHjDiVoMYcRW4fcg6KRqYoB
	CXvjEr+YP97xor1iZ3smZ8jn8bzzXWA=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-hardening@vger.kernel.org,
	Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] powerpc/rtas: Replace one-element array with flexible array member
Date: Wed, 13 Aug 2025 12:30:59 +0200
Message-ID: <20250813103101.163698-2-thorsten.blum@linux.dev>
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
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Replace the deprecated one-element array with a modern flexible array
member in the struct rtas_error_log and add the __counted_by_be()
compiler attribute to improve access bounds-checking via
CONFIG_UBSAN_BOUNDS and CONFIG_FORTIFY_SOURCE.

Link: https://github.com/KSPP/linux/issues/79
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/include/asm/rtas-types.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas-types.h b/arch/powerpc/include/asm/rtas-types.h
index 9d5b16803cbb..5d40d187b965 100644
--- a/arch/powerpc/include/asm/rtas-types.h
+++ b/arch/powerpc/include/asm/rtas-types.h
@@ -42,8 +42,9 @@ struct rtas_error_log {
 	 */
 	u8		byte3;			/* General event or error*/
 	__be32		extended_log_length;	/* length in bytes */
-	unsigned char	buffer[1];		/* Start of extended log */
-						/* Variable length.      */
+
+	/* Start of extended log, variable length */
+	unsigned char	buffer[] __counted_by_be(extended_log_length);
 };
 
 /* RTAS general extended event log, Version 6. The extended log starts
-- 
2.50.1


