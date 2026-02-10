Return-Path: <linuxppc-dev+bounces-16759-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IODVEE7Eimm9NgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16759-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 06:38:22 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD44117225
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 06:38:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f99MZ6f2Nz30BR;
	Tue, 10 Feb 2026 16:38:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770701898;
	cv=none; b=KxRHw3tmJWnu5UG3DN648LoZvgxysGhyJumU4t4SWW26VpYgc3tCIaRT0m1cyA7/9FBMovYoSCsD3E0C1ILMvYnGlfDK2ACGJ7C26bDxvLREj2Dy3NIql57naPyqETuBX9U2w3NrrZI5cGm9ouo9Adu/pRIlPxOZRNgKX3TRIjF0ry+sN49rKnlst7hdnOx2d9Ug3anIxm69EI50VQAomECHSpF3YSzn4KWfxmOjkGXAWcON/J9fUrPrdPYsJvPaVZ8Cyf/Zwnr+qpnTaUDjAi3k32gmn+N8gNlGLZE4OGMyOhCGC7ErAQmSvEcDs6fuOkFKrXBDcRY/N33pNo1nhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770701898; c=relaxed/relaxed;
	bh=GWQDA/EkiuOrnzzQZpTgk67yZSDsyGvnGU0WBzxGHSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fna559TN4A23sbtOoY4m+c2O883/wThjzG0PgzbDCwxUtk/OLiHGnBWMxhIbG2NXeTT396CWGQ8+3DVJ7c24GxHqFtHivjJZakFc9GDhiLK1G44loGwHs/7BFAbhQoIekikl2aWEHfC4autM/5cjdmLD25n77oJljj+yqTM9sAPcF8WtGSqeba2r1hDkLD6ymw/znvoN7GqQUW0u4AiLPTNrJdbakvAHMYqLYwi4hHh7RMLQXbbUzy7OOv45Eudxm1pGbvrTxAOC59++CDU5VT0iDBgIevEODCryc5tdbjELaTTmLaiMgvYauJCcKAgFVf0K28YmAvjdG0r3DcRMUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=br0mb9hE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=br0mb9hE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f99MY6WXQz309N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 16:38:16 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8230c839409so398728b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 21:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770701895; x=1771306695; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWQDA/EkiuOrnzzQZpTgk67yZSDsyGvnGU0WBzxGHSc=;
        b=br0mb9hEv2fgrbZ0OtM/bf1Fy/5wRnn+Dsn5sXIC1uv2v80z49NSWuGs00O7EwhAZo
         K8fTgRPrDL9xr2Yp+YuNPeNqtlsOpIMvaBb+E4gi1g6MQYq2eItFO9FnJtXeHeO5VwNU
         fpdhZa3ToM2+AcmxqJVEgXil1oRL1MzSRSTkIdIMGwYmbW+nH2dTuxVyn4QWC/BGt6UR
         sznsHwpToJiwbyRYJhhPbn+OxHKpSIS7eMlNyrAYzu92oObRVm6FnoRZjeMJCWqQswje
         zDyti6zV1JD8ZTkRQTHz1RQCodIL1/qTUa9caiSFRcXzb19MRwPoXv+4Z0FzJjqxjO5p
         zJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770701895; x=1771306695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GWQDA/EkiuOrnzzQZpTgk67yZSDsyGvnGU0WBzxGHSc=;
        b=DOg9CSQc2KLcg+VL7tiNTD3v5aoCgJ2RD0ry1yz6P3A3kXYF9bmcRrfGrbV6Fxiv3V
         7gCLcDP/xTAlmA2Gl21TcpbhnsyEk4TdS+57QSaAw2F/YnepDlIAa8F8nNCcei0ypnuH
         y9bogaZP1PSz5ooleDsZslC1WgO/VC6gHFrRhSH7EHoG9jKVClY3+QvR6l72JkcKOXDO
         U/pQUnyDBb7M+x9c4NHSW2+64/1AkJOa7oubyPHk0M5YMS8H7x2P5DjBD7sTG6FNiKgT
         Imd6zALuukAE1qoR61d0dcciXq2bMhile1H13hvtK7tAOnJjhTg8vhc879+15AeyS3Hg
         XyEg==
X-Forwarded-Encrypted: i=1; AJvYcCX9pGu3IH3ZHafWwPcEFQK4jNtmiB25597cwA+6MKBuWcP+Wvx9JEpxXSZJUh9rfXX7bBS8Rl5iQ7pkOv4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzlm4mEqCe0liDKQQC0IAs85nJ5lgaLLVcOMtKvlsH7ZsfYploD
	BbZhVHWkh06l9MV37mTGeWZCgtY4Pwa2ktpslc+tXtyiydZl8mbNmn5r
X-Gm-Gg: AZuq6aLpTY5HmuwqHSM9YmTEhcWWBtnffyOpa9+I4QYbvozPhE8WGhn1WuuNqcUOXqO
	pTtksl2jRMGJC6eldBCyKh4jKgfEsY95kdEbtQTBX3DTq+FIJxXXeJHpYi3H4VVsVhR556nPug1
	ReBc93VJNlxKO7No2zFSUPLnSsp4IEDu6uvXg8p1rH1Yu5sq5yrKbE+VKlKhSgCWpR3CJCLUIN9
	OTay0jjW+1+7UBpUkyYKDEL0f9sS0/osaFvzkIb7CbQDzSFapGyjYIkqA71UaEpVx9kZO0ikUQa
	3hAhPxUv+TLr9hopO7OYzF5czupWrqM3SRCs9eL+mMpACSrRBjePC6jlpdVjEpcKtgkPwjKmJPx
	u4Y9ayZU7LhleC5CmvXRT3lxNuogyWf6/g9oGEgg/soOz60J1PmzLa8W6+Y07tSzwdDb2h9Jvb1
	8s8hpLCyx+SffzpydkY7/TzwRrsLxdwBQ0ibpn/vXmZc1QGlttHoIs/EUeCC5wnJdYe2AcgMA=
X-Received: by 2002:a05:6a00:414e:b0:81e:8e66:38d9 with SMTP id d2e1a72fcca58-82441632ce9mr12934398b3a.17.1770701894709;
        Mon, 09 Feb 2026 21:38:14 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8245b62d773sm7529056b3a.36.2026.02.09.21.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:38:14 -0800 (PST)
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
Subject: [PATCH V5 1/3] powerpc/jump_label: adjust inline asm to be consistent
Date: Tue, 10 Feb 2026 11:07:54 +0530
Message-ID: <20260210053756.2088302-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210053756.2088302-1-mkchauras@gmail.com>
References: <20260210053756.2088302-1-mkchauras@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:peterz@infradead.org,m:jpoimboe@kernel.org,m:jbaron@akamai.com,m:rostedt@goodmis.org,m:ardb@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:mkchauras@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linkmauve.fr,kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linux.ibm.com,ellerman.id.au,infradead.org,akamai.com,goodmis.org,vger.kernel.org,lists.ozlabs.org];
	FORGED_SENDER(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-16759-lists,linuxppc-dev=lfdr.de];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkchauras@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 5BD44117225
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


