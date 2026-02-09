Return-Path: <linuxppc-dev+bounces-16734-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGpbLhu9iWmkBQUAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16734-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 11:55:23 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 281BB10E654
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 11:55:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8hRn52slz2yrl;
	Mon, 09 Feb 2026 21:55:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770634517;
	cv=none; b=VE6P3CtNU8LwDEwFeeEx7oiDmfLRBQPgoledXeEv1FV2Y1BUE/2zAli2H+qUKj/8nUzDa1YTF91HD3DbjdcfMGcR10LamzlHFhm4Rgb43pfg1ya/cLxYvQUKpD+KMA2hILdGx2YJbBHO9nvP1DnIPrPSIo2lAmV7wuSQMHOLVgWYoOjWrigSG7O+dZPdKol8TUtGT53MC4JgV55TJ8I7BYqlZeZWHUq9IkIVVXKnw4qn/SUYWPKw/c7tBp8fBfTDUZiE7R/pjQJOiVFt9b3TPS63CykDtALO2yPK7o4jrPPE7ntHdA8kusP1DDhzWKzwlfqC8NQrNw0gqMG8FkpvGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770634517; c=relaxed/relaxed;
	bh=GWQDA/EkiuOrnzzQZpTgk67yZSDsyGvnGU0WBzxGHSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S2mX1np8WgiH6Dxl7wue2mANz3kcy5QPWdODuJRNCzuIMxBs8SvQRrkNKt9fmIBqqhqsfFM8BvcJVBDwsvJb13iKovpHIPSKbTXJSf+eLSTN9qKRqdRpC+HDm9cyYevWPmjPXm23akm1gzh34hYkBG+lFegFiKcw5lqivmdTGGfpwQ3DsRpsKpd9ueMJ3ln3jVgtDh/4C3Rd+t90FseZFYNBgv5exfuHulb5XBnnoCJwlfqmQx7bYNa7VjxexmQ27A5oCEiGAs2IONgGMREyF36d8h7xq3byj3BvL5XcUWnZ7kenPxmNrj0VceV2TWGcNwJfUr2O303Nbhk7qE6BYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bOxkdRFR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bOxkdRFR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8hRm5tgfz2yFm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 21:55:16 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-82318b640beso2190597b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 02:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770634514; x=1771239314; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWQDA/EkiuOrnzzQZpTgk67yZSDsyGvnGU0WBzxGHSc=;
        b=bOxkdRFR/KFx5hexvPONb+ZA0u1vq9Hu/QJ/Z6eRo/Usiu4OLWM/L6MofGO9+fqIsW
         YCvoqtRwtBwbDomMb7yQp4WjUGpp9otKdEmla4rlepLxbIZCnNNpmfrN4CGAmoAtE6jD
         GoBgl5fp9jOOW6t9DqAzxVkowy7xbizj+ZPx3b8Ob+5EGnKbmWffUUG538uckzffYgIa
         5TMlYcSZHMhMBvft1Gh5uPSQFIpK5Z/E/pPdwM4/XMrMD3ZvGbwcQH+CPLOrxYm4jHYe
         0xrXENavHtoWHYLcD9b236Wj0uXdqGJRYXckThTDDtWoUD8nlpwyEPQ/ZsFMgI10NqYZ
         4AfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770634514; x=1771239314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GWQDA/EkiuOrnzzQZpTgk67yZSDsyGvnGU0WBzxGHSc=;
        b=etQlGIC9wfev6vt4kW9nQpr36aN4w84JhYTh/q908i8NL7ZGhU6IRh3I808iACUzVG
         W9I34T0ZDh029zg6SpWNBk0LzPBtNFwhuoD4usRLsRczD6pg8B389h88ovVM2QHZTcgf
         9NCoDYYjdaB61eDiVbMY2PFd++QPoxK9hJx7a8cgIiGlMBMrZRHxmp1jBZJzcPY4zC+d
         MmN+uM2szVxd6VR5TAXhZOdMTlQQaIup3RCYBwfUxemlF7z/LJsjMZ9zF1KdQAZk2Rd3
         xmKJjiexcR9rTmonWEDmKSL3HZHOUZfTiNCtwhocXg22uu0ldSNvdrKGAhO6xp8SlwgK
         HW9w==
X-Forwarded-Encrypted: i=1; AJvYcCXig8NDVMRo2lbemv54wvrXV2sSCi4oxRIwe9xC5+UNwiX62mVqaXgrICbRaP9wzF5jIX2yk/6R/9LeuSM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyj3SkzpNG9JtnOvA0zqgI2yXkuyGRJXl/fyLIaPINNx2RdiDiX
	KvDmGYY8Lic8M7Bng3lfzDGURhNqICORVH0DYdZjklaVJikvrt6wDLsl
X-Gm-Gg: AZuq6aL6gny03i1DMvuRdnwlsbbxvltKE+9IPktYacpVkco1I2UWN+GBQb3brYI/iud
	/UApS9UdGs7Sd+1AoNMxahTrPPuo768wRzQEW+Fjyz7Z2nn0jRYMKSi2wxVZwMI/hgCFiWZji+A
	oKELK6TjArheq8Dribl7vBvNh6vlpDcW+u6RNdvR/wNbVNqQx//HSi0zSnJ3Er86xWSpdmLjot6
	0qz0gQYl3dCZTO3/ompTVMKrZ/JAv4q3yLtjNYoVTgFIaxAQzrGr/mVnn9r8il+ospv4ZDDaFRB
	wezLjG1Okb6QbJmGLn+hHRrv1/KOXVzaMNS7lBRlfJ3lRqvxax+Xc7JL0JT7Kf9o/YqKB5dVhhu
	h1nbOeRD8x35o7JYimCb9jPTlnT0DOit2N6P0VJ4TIHiRokyCFKokdXDjjAyp6po3W4drawLH86
	C4vJUs5voFB8i2aVI4bEbpOKsu6Ep/RYiYrs6YXVtvQ7YPtYAi/lQ2MKfBWcU=
X-Received: by 2002:a05:6a00:2d9d:b0:81e:5d52:53b8 with SMTP id d2e1a72fcca58-8244172c5ddmr9473132b3a.50.1770634514410;
        Mon, 09 Feb 2026 02:55:14 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418b31c2sm10635974b3a.50.2026.02.09.02.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 02:55:14 -0800 (PST)
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
Subject: [PATCH V4 1/3] powerpc/jump_label: adjust inline asm to be consistent
Date: Mon,  9 Feb 2026 16:24:54 +0530
Message-ID: <20260209105456.1551677-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209105456.1551677-1-mkchauras@gmail.com>
References: <20260209105456.1551677-1-mkchauras@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:mkchauras@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16734-lists,linuxppc-dev=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 281BB10E654
X-Rspamd-Action: no action

Added support for a new macro ARCH_STATIC_BRANCH_ASM in powerpc
to avoid duplication of inline asm between C and Rust. This is
inline with commit aecaf181651c '("jump_label: adjust inline asm to be consistent")'

Co-developed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
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
2.53.0


