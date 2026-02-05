Return-Path: <linuxppc-dev+bounces-16625-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DIDC8/bhGkV6AMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16625-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 19:05:03 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E90F64C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 19:05:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6Q9Q2fwcz2yFb;
	Fri, 06 Feb 2026 05:04:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::533"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770314698;
	cv=none; b=kdGA+50GWwipkgLpnntBo7AV7e3Bfs8SugCWj152c/HjJnC16Mf19L4/XPilIzaKAnu4Xn7UivzHYtlLWhX9R/tPTmzLlsOBtpJofUme3wcySoFXsrNAHaxLLyFVagbw2gArtJAfMUUCJIgkouYpyq2YAWo6MnwtLPG3IF2+fP1PjQsDi2PVuhv4PArwM4w0ght6ZIyNYMal0V22YxUlpjpGu2r5OaD8YL8MEqEYX8+LgF0r6X8FykcTGw8OrsTkHZ+G887JJm3RrO0pR8N+04JxurOZjQ5KRKHB+v8ebQoWty7HDLK7dSipcbAXOAr62fk3MyX8dx0PPDtfnyKbXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770314698; c=relaxed/relaxed;
	bh=s4uYAbV7Sxvgyz5kvjGT8mGHdFWc9k2NP+2RxVBw+YA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RuKe8PCXwEEt0vD2ZI1aREMgC+5NLmUvfzECvvW/1CA5cNWnLDEwYYn/aHwDZsxQRV9rMGLSJCd0qVPHqzzxEgx2FnVGPXvSA3eVH4Aj3OaIM53Hq6dLzrczG6uZO77uem5lrAkeDdG20fNE2/UcuWUy4j2nypIM7AkAxVektQqBAtCLeurTKZhz5MgBFeGwynveXe0Z7eWVm1yqpUSQPbsVYAZgMmtL1/m/g8xS5jbgxU1JI9f1jiSfu/xgoqtrmU+J19J76Ms5iGFiLuwT4VTzHMwtzewXoQFnYZQzDk1vT4BdyOsb37xY6fs4u6mI+yScEaKYoTAPmxS1F9TiUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TFRDcY2k; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TFRDcY2k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6Q9N6vXqz2xQC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Feb 2026 05:04:55 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c636487ccaeso416283a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 10:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770314694; x=1770919494; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4uYAbV7Sxvgyz5kvjGT8mGHdFWc9k2NP+2RxVBw+YA=;
        b=TFRDcY2kMHmYOpWfKsGOnBEGL1Sb8TQILuZmPQf6OKM8vrpQgg+iHIpcTBL1nY3QXF
         f2CoPkg0y0UBcws1WLKUzmhNe4TedPmZD1udhMvRXUjfJfQP2DS5wJjhckDL6qRLeidb
         vBcsUljCkcwBty/MJhRSdoiS/UAmKGR5CuOaKL/vLcezg+GI7yApwtu9/CW7LPLM/5RU
         RUftMyA6SbDfailF3zxbkAqkZBCGgt9tnmbrZjf1Z2r/FPpfxwyTBNnQXVOIJxpnQb+h
         QjnTF3FyjPzQ7ugbicDybOZEWXvOHrMOtnLNbfMSH8cYfpUYQjRUS1MpFZFDK5jfxB+i
         r21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770314694; x=1770919494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s4uYAbV7Sxvgyz5kvjGT8mGHdFWc9k2NP+2RxVBw+YA=;
        b=lxdAMUxcV2wNp5BZSpZIMkPvoTcP1UozmAvLO3mBHoL5yXYXb6obNIH2F2Rm4KHZKc
         5MdxlUwShFR1qHUfZbG1bo+JoM+xJN6CC71gQnCv8gtT/R/ow2iLbS6DR0e839I2+vW8
         BkqzENSs6VauuifzAaMlhgI0nOSaKtTLhEv+NO1GOK8e9zmpclJi7Ug6J7uW3Fj9UCSO
         vl3RK4J4SrkBnS8YvUi4CkFmi8+DACaNRkFkArK433yrl7EfpsOy5yCQXJenLUPBCAjy
         cyoIBj82kJkf9wv0iDerfujiPjM6GBz7hwJMScb9rKDfq4hhV4JJh7iLI8BK9csHvcO1
         atOg==
X-Forwarded-Encrypted: i=1; AJvYcCVoCnzPBcx0iwuctFR8d3+qnLp7Nyd4eJ0LrJNLPcwixTWxQX++K2YOKxplOPymqiKYFoOccQiCozVm/tU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwQ52+ObxDYEnKHaIiNwWxDiTe6nyg8sfEDVifsrXFrd2vD3s9+
	cg/Kz1vghUvcpYJwjC7GWGdymKv9L6aNgxS1BD88/7OPwjfi3r2rj6rZ
X-Gm-Gg: AZuq6aJxigUJ+SOOccEIgCFzGkiGz6MlM0wxkYtzR8HoZh0sfAEoVZgUK2aaJb0JqiT
	goAlwKQtsCDqjPv+m862MoyIoesaXxNhT2k11z11A4RQkmSCzO4/Iv6NifzRJt3GOb0SNN1Azi2
	v4p8NADLTamQokMpYiOEjGpHC5ZzCySJXHdE+WNG4bbFIKT64j++ljDBxkWyNW8a7LaNETu6yXF
	Oyqio2pXLxclCOG8Fy0ouMTNC89j91gXOqVWWbznmsltMCrrupeD0xR+CflEpsmfQqW7rWZ3u21
	OCeyLvXwa9KdmqtlYYWC4kmSnUVKLXT3MvyJvylIMSP68JSsYqqN6MyT3hNTCVEIX7zmOgnAQ3k
	WAAk9RCzXL5USsk1Kr64avuyQG2YFFAb/r94Zjb/NMvexDCsy7kKOlbvsw9uXE51tAPOiUUu6WK
	y2URm9Ek19DAfUpkgtWvBM+yf6hda9xAEg7gIKCqJJzaLgofxZqhCJ7SsPqT4L1w==
X-Received: by 2002:a17:90b:1cc4:b0:340:bde5:c9e3 with SMTP id 98e67ed59e1d1-354871b1efdmr6858029a91.23.1770314693772;
        Thu, 05 Feb 2026 10:04:53 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.167.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb5436c5sm99812a12.15.2026.02.05.10.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 10:04:53 -0800 (PST)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: linkmauve@linkmauve.fr,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	corbet@lwn.net,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V3 1/3] powerpc/jump_label: adjust inline asm to be consistent
Date: Thu,  5 Feb 2026 23:34:27 +0530
Message-ID: <20260205180429.3280657-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205180429.3280657-1-mkchauras@gmail.com>
References: <20260205180429.3280657-1-mkchauras@gmail.com>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:mkchauras@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16625-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 37E90F64C8
X-Rspamd-Action: no action

Added support for a new macro ARCH_STATIC_BRANCH_ASM in powerpc
to avoid duplication of inline asm between C and Rust. This is
inline with commit aecaf181651c '("jump_label: adjust inline asm to be consistent")'

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include/asm/jump_label.h
index d4eaba459a0e..a6b211502bfe 100644
--- a/arch/powerpc/include/asm/jump_label.h
+++ b/arch/powerpc/include/asm/jump_label.h
@@ -15,14 +15,20 @@
 #define JUMP_ENTRY_TYPE		stringify_in_c(FTR_ENTRY_LONG)
 #define JUMP_LABEL_NOP_SIZE	4
 
+#define JUMP_TABLE_ENTRY(key, label)			\
+	".pushsection __jump_table,  \"aw\"	\n\t"	\
+	".long 1b - ., " label " - .		\n\t"	\
+	JUMP_ENTRY_TYPE key " - .		\n\t"	\
+	".popsection 				\n\t"
+
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	"1:	nop				\n\t"	\
+	JUMP_TABLE_ENTRY(key,label)
+
 static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
 {
-	asm goto("1:\n\t"
-		 "nop # arch_static_branch\n\t"
-		 ".pushsection __jump_table,  \"aw\"\n\t"
-		 ".long 1b - ., %l[l_yes] - .\n\t"
-		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
-		 ".popsection \n\t"
+	asm goto(
+		 ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
 		 : :  "i" (&((char *)key)[branch]) : : l_yes);
 
 	return false;
@@ -34,10 +40,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key, bool
 {
 	asm goto("1:\n\t"
 		 "b %l[l_yes] # arch_static_branch_jump\n\t"
-		 ".pushsection __jump_table,  \"aw\"\n\t"
-		 ".long 1b - ., %l[l_yes] - .\n\t"
-		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
-		 ".popsection \n\t"
+		 JUMP_TABLE_ENTRY("%c0", "%l[l_yes]")
 		 : :  "i" (&((char *)key)[branch]) : : l_yes);
 
 	return false;
-- 
2.52.0


