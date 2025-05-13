Return-Path: <linuxppc-dev+bounces-8543-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78378AB5B75
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 May 2025 19:41:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxkKQ0BTcz2yhG;
	Wed, 14 May 2025 03:40:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.180
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747158057;
	cv=none; b=SLFmOjL1z7qiLsMi2f45aYDL+kFuNVJWWCCtnHDAghu2vih9SniG3iUeyHFDjqGN1ghIgjKreAWcv+wY6FfP2ipRC0rhzOFJRPlNBfXkmeBTLRwJSaxqhpGXPVIT4LaLhxWeb8WZVcJmnOzgI766/drIg84maqilMo3m7RGQkrN2UjhUItLL2cUoHOc7d/yMSY8HFCqhhT3qmf73hEKekIiBYZCGGuj3b1J8t4Jyto9NTKdrCaBTfT+sazGyUMsopPfNSxftUzJsQ0y4cCXpPwCuqOqUsHTzQjqQ0fj+s3XLqjySHcZExRe7bkIrk3sRTZrUDMlqnp1utwAZN2JOeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747158057; c=relaxed/relaxed;
	bh=irfEXLRw0ePs++TyHy3Fjxp4dBF0FDMvktUtW0vNle4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lClKSBtf8khY8Ufb9NyIQJXfCYdIZpjUuafjp0205IYycbz38KKACmV93IXMBFfsqPbqLtQseCGsjMxEvsnvLhTs/u6MmmcR0vqNZd4oND1UQId4y2ADNPkCEF08xdwKcNZ1ecP3xLFJd0xYVIWUdtwefMTVkoZPBO9NDth5reEyt1TAfNCDqFvj0MPgVf8SGX6QbdHkjvVagAcNPGlPhLCxK6o4rrE/O15Ct3fz8WLU6NnRIjaEL1BkyDM/DMGWvGa+kUgME5vDtT6CWTmKGH7S+sltxYkeuJvhs3vWxnvuAWle7TGDT8vpcBH7a10q1/v/dWyvxAIDmyuP7qJK4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Er91PvWy; dkim-atps=neutral; spf=pass (client-ip=91.218.175.180; helo=out-180.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Er91PvWy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.180; helo=out-180.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxkKL3y0yz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 03:40:53 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747158032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=irfEXLRw0ePs++TyHy3Fjxp4dBF0FDMvktUtW0vNle4=;
	b=Er91PvWyG3UWI/YZeVJk6w7xuxXsoKWTWlIMFXqE2iiM/bQsCjGydokq5f3OoaXsb01m3w
	1vWQwbH6IU976N3JmZG6bLSGFDTHO4Rzu7Cr8gko/3wwXcT16IqZw2jr670kSiK4W08LDI
	XVgzUvwv/pKaDl/TQr6Vw9PHQbfQGdo=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] powerpc/rtas: Replace one-element array with flexible array member
Date: Tue, 13 May 2025 19:40:01 +0200
Message-ID: <20250513174003.335857-2-thorsten.blum@linux.dev>
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
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Replace the deprecated one-element array with a modern flexible array
member in the struct rtas_error_log and add the __counted_by_be()
compiler attribute to improve access bounds-checking via
CONFIG_UBSAN_BOUNDS and CONFIG_FORTIFY_SOURCE.

No functional changes intended.

Link: https://github.com/KSPP/linux/issues/79
Link: https://github.com/KSPP/linux/issues/83
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
2.49.0


