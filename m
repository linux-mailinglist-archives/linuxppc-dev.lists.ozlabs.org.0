Return-Path: <linuxppc-dev+bounces-16767-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMIIN8nzimn2OwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16767-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 10:00:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEBB118763
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 10:00:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9Fs84qkZz3bfG;
	Tue, 10 Feb 2026 20:00:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770714044;
	cv=none; b=Tdk5FtD1X0P0koUOMVCSnpXyQlQMDZOXX7JtcNIyw54sNw9npWW02hOMuSXb0r+DNM87BMaPmKD8+0qomWQGelU1xbOaCepvQarpm/bMI0a06PIsXgYEKNCPLooXvGkWHgy+arBC9i8cmC/cioRb8GP7GuxTEnmsiUX84/H4RYbUZwOut7skaclaTF5PCm/QMAknIK1/N24zX8PzTVEIjN/HgjUR9QOxFzVNyHohKHViwkIDJFOPctJwBcTDtDDWV8Yg/tGH1Z5wB5BXLjeCHNPr5FLwSWvWRsEXeKqwQrEAnENzpxPIStebIU7lEReqIovZLrD1TRS+hybItuy1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770714044; c=relaxed/relaxed;
	bh=GWQDA/EkiuOrnzzQZpTgk67yZSDsyGvnGU0WBzxGHSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TbckEsi5OasasmGMfIICMIcoh17vEYz//2CnMhSLqcrrh7KpgPtOBJU4aPAgN1yX0A393LN/gv6Rnxtbfsd7BnhKgLpptHZt5HXRZWzQRfTTzbZTgY1W1Ah+8MZx77vMn6IvTl2OVgsmLLlVibD6Zcx6tD5EAN4y2nCo2v3oXZH3PVSfDdPyapcwips3IH5U1yt2r7Ph4qXPIOjc7oB/SLQIwR0DsPvzFIOtTQb3e7Otpdi3pTWHVpsT6IsNsmIMqJN4hzRD31JPTol/lz7Bj68zvUdEpskl15FvtqKyllywTJeFg20XiLzULjZf+NrZMKRAw/J0K6fHlijbkjt4Xw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PjrymzuQ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PjrymzuQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9Fs76PDgz3bf4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 20:00:43 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a9296b3926so3676135ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 01:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770714042; x=1771318842; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWQDA/EkiuOrnzzQZpTgk67yZSDsyGvnGU0WBzxGHSc=;
        b=PjrymzuQCycA90C78Bof/QfcT3aOPKsNhmSmUWNWYh2YYziQJmj2bC68or0W2xfP9Q
         8XL23yGLacbm6LkLWZ4ZNFuodoYGLx6PzzEiMhkkpbJLU9NyFZK/i4ySPGsAy7j2GzRl
         kAYDG/QZZbHSr8LAIgi+OlmDIV6KgyLVo9RO6f4v2C8SHBcGkLZcDaaLga3v950nRlIz
         qYl5oGT9s7+egUMNQUnnTyp7/ew9Xqno0v3gZOwusiaiDD35EECAgen2gNb5EuXcGSf9
         MaWRm3xvR5EeBcUBNXt/MSiRiuRWdhahiC9m9uOaGxgAw76BHhEQ6w5ATuJwsCGLET7y
         Grhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770714042; x=1771318842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GWQDA/EkiuOrnzzQZpTgk67yZSDsyGvnGU0WBzxGHSc=;
        b=Q8yXOmJthUyv/qHBqOnHXP1AuktHLI6TAiTCF8FGT9wK793utas6vlCezZc1ed7+dh
         tBWRW2eUTe03T/MfQEz4/6Czqq6Mujfw4YbTlvMAObYzSgPcN/rpsB2+anUzIsHMUVcM
         zUByUsm9dO7uHlAFMslQJiSj6JZd4i5ekhoeV9SNXS2fI/sq+QYvYp2g04xB8ZVPTi3s
         CDpEwPsCoUMBUAYiSHVPswgXXGOfy43fwYZdElPhwd+Q9Qxg5iWdtHRYjujt4aeeAXkR
         hcVI+N/hKHsAob5HUprAU/iZENY4wIGY6IRqlKCf1C+P3I2G1a8lfzLYZpeTI97eMxGY
         Ldlw==
X-Forwarded-Encrypted: i=1; AJvYcCV/ibdPhL+jTnvlU/X+mFULtW0gHj2F8qZ7HopoTCo/f415D+9dQkZX9H9LczHUcM27NaSVfPdzxGiMV6c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywhpf4UaDQfrWpJxqxvUOYPzyoZ/31bJlo8r6WHhio3gv/7869J
	X3UvoEI6lxFAHHjREKStia0WNvJF0C/0BIv08XKV87cxDh+M6jDz8w56
X-Gm-Gg: AZuq6aKOQMUi/FVD7bYj9ky2++m0f5LXL0iTYkvDjbcnpl2cX8xXRpBHQfuLJeCya1l
	bEfAnFq4kUjGvbX+rU/FSUuLJ40W+x8Z20IubBgjSnQ7EAU1hTseqmwP4MwIpRBnVLi2goLfcdt
	1PgIdixIur7VPhQGlFTg2eJC55G9RLE2zD/ZmVGDyW2IbIWOUSvBpwuVU5d3mt0YxVeehG8qeDI
	DZA4V5qha+CmdpS5mzQCS0Ch7d/T+3JCIo90Q7Mfhr6vJYNXXTC+Fa/mEDmPLpipf3oaIfPcYFS
	5F4h7XERpJwqvMQidPsGXoC4b8SLEFgr7+XJOWXBrgSnPuFUYIBPJuWJSUZRqg9vdDFc64J4ayx
	YfAJjr9aPv5EZEhRMbmPJanPC7wjLvXYkf2Qq6qMX3fJa6qrJNQFR50Sm0/qOYkFE1gdMALE3YM
	ybuF5Cag1sfp1Q5INYPgWXU8v112RVV7yZGEhbLMdzS0aPvcTygSjucpXJ8ZTlOKKqN/qVEwQ=
X-Received: by 2002:a17:902:ea0f:b0:2a9:450b:104 with SMTP id d9443c01a7336-2a951969dedmr128874815ad.55.1770714041597;
        Tue, 10 Feb 2026 01:00:41 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c7a342sm129536605ad.26.2026.02.10.01.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:00:41 -0800 (PST)
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
Subject: [PATCH V6 1/3] powerpc/jump_label: adjust inline asm to be consistent
Date: Tue, 10 Feb 2026 14:30:20 +0530
Message-ID: <20260210090023.2587534-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210090023.2587534-1-mkchauras@gmail.com>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:mkchauras@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16767-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[chleroy.kernel.org:query timed out,maddy.linux.ibm.com:query timed out,aliceryhl.google.com:query timed out];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 4FEBB118763
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


