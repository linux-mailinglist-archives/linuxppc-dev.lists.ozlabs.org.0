Return-Path: <linuxppc-dev+bounces-16604-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHySIOGzg2k0tAMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16604-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 22:02:25 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAEBECA19
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 22:02:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5t8W0STWz309S;
	Thu, 05 Feb 2026 08:02:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770238938;
	cv=none; b=MAB680SIm+CYS3AuS3MVwfQsBu1Ocfw/pKSDl5vf1QcQP8IQJ8M4kP2pL9B4qb61qFWMcf080hvTb9CYOTdcxKRJt0124iQ80Mh75vuou5o/YUg6JS+yX0z1ESCpmnzRXB/H1nRGVbHWYl9KChg9sx0pL6f2c1tmp/I+hFK/gWifrbxiCCVUMeaY45pjOgT1UC1NwUckPC4UgAsnUbWWbj1LC7RjMqc9w8ZKtSXrZEGQvJ+qzqbM9m194Rhgq8dLXKkKHf6xbup/ds3RwHXQNV8PE4RVofyEBHGjM40nUId11Wlu5iKZAXKk9cLOECTZSL+srRGv0bDHZPsOGgTkgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770238938; c=relaxed/relaxed;
	bh=NoWX04fiEAreCl3Yk7mZ6oJ0U44zUIihxFXMVIwTyVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gY9JZVj0sLelb63dlyx0QT5MguKYOoGNGj9CqPEWoJeZfMaeZU99szPsBg30pwJc2XpeBWYjgDaYE7rtBryBW27xBQnTmEqIdIg4cOHQoxQy8rpOoKYuOd8rw0pcMFVH/ek/mgbztSxXoZFv+lGNtCZXvCZcrewjNIallbXBg5SZQbYzEp+W7c/EpB389kyZpidw0j7ahhgLWIzyyhvj2Kv1i/mYr/PJIM3gKlPVzHBK4vm3+JQGv7oOYL+jMFQmu2eMY4pRp0fULNw1NKL1iZkHOtDs+ZnYyoGApZI1i76Eck1Ma0RUyWW8+2C9xHzlApAzFeUAoXuwhkK/0LVxDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AKTgFcfU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AKTgFcfU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=mkchauras@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5t8V2WMdz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 08:02:18 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-82418b0178cso153772b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 13:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770238936; x=1770843736; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoWX04fiEAreCl3Yk7mZ6oJ0U44zUIihxFXMVIwTyVY=;
        b=AKTgFcfUDWWd7HJiwdkx7HQpytpP7iGMZwy4AFFWy+cxBOMLE+ki85OEHmpvnsbcLB
         HUuH7BgjURm/KDe0GXFh/hdCacy00b91ZtWMX7a5MlusUK70aJygNxNnlm83HJO4IcGa
         mZO7loVyLBPBds7IcI19MSfKdViVvSmAcM1Ur065/w55nxC5lMaGUbEU4OzONckMTmxn
         yhFJ1nhNmuyE4ATuSaHbYikPH5bgP437wa/Eqb2Cfb9qNpR3XFlmFf395XIKqPhtldpP
         xXFUNsl8EPD3yIn48JGRLZjwkiXNK4cF5RMrt+sXA18ir9Q5Dm8fKGGuhPSEuSubij+v
         2ChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770238936; x=1770843736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NoWX04fiEAreCl3Yk7mZ6oJ0U44zUIihxFXMVIwTyVY=;
        b=TZlsrdqE7Pxenauexmz+5NfxcsvuQ+BdhW/SEJjeHD+O8rZmkPqZM9eXDIuHqt5QAB
         1xIn2oWf1l31RyCuKTS081w3ttquWN3Zd+XmmTFOVlbXHSnHov34vt4vTIoyo5sDCqci
         abhoZTkqJBZYfZrj3UeqZKtt0M2fiPdoygYsPE8cFonnKkcNZniYl/c5gOrgNPAxTPkM
         rVcAdAPVz2zDK3r40yembGQlmAMcB9yMUj6YEGaZSRbG/iWgULYkTdQAYipsp3zRtBah
         CL5NwVJ/gNApJ3bGtEyeC6m7n84KzWkdkfAt/PfXxmH7FlCvz//3fATCdYtNH2i4iEyJ
         CxyA==
X-Forwarded-Encrypted: i=1; AJvYcCW97GDbi21PWQk7ALDdKkS93zhpliW/dmUgnDW5LZZ4j5yHIVGmMWaE3Fr2dtUOThDpDM3XD/TmiMWXruo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwHelzSwKdjxoKXJoYA/B84hdwnhXAMGEJmqmhll62nEQ/nTqyD
	oVSpPaZahQ3WmX8nZsgtGUus5g0G7KbaL7DnWnZfj34d4YXUOPgPuQgX
X-Gm-Gg: AZuq6aI6n23dEBhIX5Y4khp5CMMUv3fFpM4fgR0wHyNIBblmsZwL1rPeNrvAEBP2rAZ
	CTzkNTUqani1AyIKoCpIrp1a5/fWX4jBgSpFP3cDtmY32C8geZrHfJyFnQ+5hPZBYBmphIjmYCl
	CSMpjGaetC7iyIQ9BfJNozrEH7H5wCeWqGlpExT5793S9OcglKapdqg539v/1lUI06wo55KEKsa
	JJC8Mdhj2yxsoJyM6qao9C5sQavERK39hVZJ+cq/AiCmcg4sfTNs7uoAT2XRjmsWS8aKVtVLnGb
	qaGFdN9hxl48i3tAb4p3A8bv+osknhYMQXXE9WMMiMRKCCL/kovB4S7Rwp5cai4imPe6pUu2wKW
	TddnLpBDph8P86Z2yX7vJP3WPIXcbYsxlhdXCwgTkHHiuovdfTGUbz1LiIb2lfsCjxdhh9pVnJ+
	4vb9F7CwA7GvfX787cPJNqjO59+M7nT2Ei1xlZLftZ3Jg33+XErSTV8Ej/GIrrnEyF
X-Received: by 2002:a05:6a00:3c84:b0:7e8:4587:e8ca with SMTP id d2e1a72fcca58-8241c77d543mr4135495b3a.61.1770238936205;
        Wed, 04 Feb 2026 13:02:16 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d1bd466sm3277977b3a.20.2026.02.04.13.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 13:02:15 -0800 (PST)
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
Subject: [PATCH V2 1/3] powerpc/jump_label: adjust inline asm to be consistent
Date: Thu,  5 Feb 2026 02:31:23 +0530
Message-ID: <20260204210125.613350-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204210125.613350-1-mkchauras@gmail.com>
References: <20260204210125.613350-1-mkchauras@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
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
	TAGGED_FROM(0.00)[bounces-16604-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: ACAEBECA19
X-Rspamd-Action: no action

Added support for a new macro ARCH_STATIC_BRANCH_ASM in powerpc
to avoid duplication of inline asm between C and Rust. This is
inline with commit aecaf181651c '("jump_label: adjust inline asm to be consistent")'

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
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


