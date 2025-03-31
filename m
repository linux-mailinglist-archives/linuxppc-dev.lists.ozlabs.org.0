Return-Path: <linuxppc-dev+bounces-7396-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C54A7649B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Mar 2025 12:57:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZR7Pm03bWz2yd7;
	Mon, 31 Mar 2025 21:57:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743418651;
	cv=none; b=XsBeeOgZ0W1yBfnHoY0F9n3oFtYRCKFDLlkWAgTY5AMWwA5C7M862sgeAQc/i5hdYkijN8lfrqPoKK4ukG9ZQ7pHTfcH+eDhLsAd5Udmmeb8kmj2hgxiN3/KLgBtwGDarbY4WNdlbHBVXawyEvNwlT8jt9bA96HN7LTGgzpKzhu/SsfSXeJykrDh+EozHal7EUbYJDkuOU9hhNe5Ljey5TxIyPy8VumE6q61ynQbVoEwWI94z/xR9wrVLKI5DS6zqMlUNlfAGXkR5oZG7QwzQVsfS2wpXIzaha4UQ4M0PuqIsu47tOZA1aFpG04ZC+TVF7Xs6UK2nv6v71GEuTE5HA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743418651; c=relaxed/relaxed;
	bh=akuXqyCZOSdlrQSLt/Khb4sbew/avXeSTkqZbTZoVGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZZGvZGUbJhf0ehm9E68Uy65eAIpyXrVZuZWUtR3BuplTN07UnUyRCA37nT3adtRBp5zWlSgii7EQKhDguw1bNx7ytFsXPNkVCr7t9GtfO4rOo3s51WgXJ6W/aab1Sb48JGGv/ju6ktemzd/Z+3kx40hQjfa3gT7wxIq0Q0AQWSJ/GfAtzqhZL+l5y6Hgc9aTg2zMPcFaJZZdw9ByReusBAn1AGWiwpqLH1Ft8znwGVIWEWlqFf4+qONtIHyEKqN9O+Uz/y5yYirwjiPxGyjQujRwPt7lmt5DmpruCxKyoawp9WBCympl21aea7yNXL36gjbE+tSTrGek5fbhiewsIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YF2RlIl6; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jCEmoNfH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YF2RlIl6; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jCEmoNfH; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YF2RlIl6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jCEmoNfH;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YF2RlIl6;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jCEmoNfH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZR7Pk0G33z2yGN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Mar 2025 21:57:29 +1100 (AEDT)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	by smtp-out2.suse.de (Postfix) with ESMTP id 8F78D1F38D;
	Mon, 31 Mar 2025 10:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743418646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=akuXqyCZOSdlrQSLt/Khb4sbew/avXeSTkqZbTZoVGA=;
	b=YF2RlIl6UxN8gjtKv0fke8bouCvvzRT47LyJmr4ULr/9KeRuP9MYy/Zsjz2D7FzQQ0N9Ym
	9N3yo1NLUQKL3ggQB8T4Mw+2GTh5BNCtI/o42NQCbs/3sMi1UXLBstsuqCa6hvDkNa5Un4
	B34+bCrrCeqc4z5SMf6hQb/B66alz84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743418646;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=akuXqyCZOSdlrQSLt/Khb4sbew/avXeSTkqZbTZoVGA=;
	b=jCEmoNfHFOR5dPqJlRHSH7G3ktjTYy1SPRHbig7fqJuMu1xf/bPM+2YX9xT+M53/SOpXGj
	6LUkv7dq+/o9aCDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743418646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=akuXqyCZOSdlrQSLt/Khb4sbew/avXeSTkqZbTZoVGA=;
	b=YF2RlIl6UxN8gjtKv0fke8bouCvvzRT47LyJmr4ULr/9KeRuP9MYy/Zsjz2D7FzQQ0N9Ym
	9N3yo1NLUQKL3ggQB8T4Mw+2GTh5BNCtI/o42NQCbs/3sMi1UXLBstsuqCa6hvDkNa5Un4
	B34+bCrrCeqc4z5SMf6hQb/B66alz84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743418646;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=akuXqyCZOSdlrQSLt/Khb4sbew/avXeSTkqZbTZoVGA=;
	b=jCEmoNfHFOR5dPqJlRHSH7G3ktjTYy1SPRHbig7fqJuMu1xf/bPM+2YX9xT+M53/SOpXGj
	6LUkv7dq+/o9aCDw==
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Cc: Michal Suchanek <msuchanek@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Nysal Jan K.A." <nysal@linux.ibm.com>
Subject: [PATCH v3] powerpc/boot: Fix build with gcc 15
Date: Mon, 31 Mar 2025 12:57:19 +0200
Message-ID: <20250331105722.19709-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <875xjsjj6b.fsf@mpe.ellerman.id.au>
References: <875xjsjj6b.fsf@mpe.ellerman.id.au>
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
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,kernel.org,google.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Similar to x86 the ppc boot code does not build with GCC 15.

Copy the fix from
commit ee2ab467bddf ("x86/boot: Use '-std=gnu11' to fix build with GCC 15")

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
v2: Move the fix outside of ifdef to apply to all subarchitectures
v3: Change BOOTCFLAGS rather than BOOTTARGETFLAGS
---
 arch/powerpc/boot/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 184d0680e661..a7ab087d412c 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -70,6 +70,7 @@ BOOTCPPFLAGS	:= -nostdinc $(LINUXINCLUDE)
 BOOTCPPFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
 
 BOOTCFLAGS	:= $(BOOTTARGETFLAGS) \
+		   -std=gnu11 \
 		   -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -O2 \
 		   -msoft-float -mno-altivec -mno-vsx \
-- 
2.47.1


