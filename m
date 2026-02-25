Return-Path: <linuxppc-dev+bounces-17179-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qI5xIGvXnmkTXgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17179-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 12:05:15 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C935B196366
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 12:05:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLWvk0lFcz3f5L;
	Wed, 25 Feb 2026 22:05:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772017506;
	cv=none; b=F2ySYshebajYAqsFMG+g230yaDBYps+SwMLSswtDjHzHxy07IK0Ubg8HjBVB/9uBsRTzBeKvM3nFXQdG4TF2L3VgrTFA+WOWhQM/fVbKMd4sD/3MCJjaX4kwyEZnxCmRbgLOiuwJgloLeWWKXFXqwKt+rEROQg9vli91PmgzSs65EM8Fi16xveb15ujLw9IH6z7/gC4sEIWz1luqZKj+MRES8lhvbchBjugB0pgd0cQJCtWbYOMH63CdWn9yMaAwXFFPDvcxKC6NDG4CuulZ+7On8WbLeD6vV0fj3CT+Z5RVpxGSm0dBbU8e01lPbfvTOLwYChMgLyLsDAofg1drMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772017506; c=relaxed/relaxed;
	bh=h3hNSWrs4Z8eGQlDuu6Oyc+V7lXYEg9lf6KbC142PjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l49ivuqFoy8bzDkOtwVBYwHKmmHhIlhpw/E3WxAV0m+gGp9Mm63JsxpSpLgQgcYzLguCu3lUYqMulz1NFj1aQomxe1EjKYaoTx+iwTjEzr1Pp8frp9DO9Itign7NTKG2GYWDJSrUYpdDwjIVB4uGesADJAJDmDz+zMXFBLGaro8yE9+Ogo9T46DSFC5pYumeDygFuloBq4xur3HNBMJgbkOkzwNzyC3shJasgp1iszQjjyRPd3Na1bEQjrS4pi9YSYMZWQSqBezmoxNiAo+szWL0aoRB7iYXinouxF+vgHmqkOmfKKjLBeZjc1I7WVzJKWdELnH9DjzlhH34IzrpGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aEfbwHNn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aEfbwHNn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLWvj2qRDz3f4j
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 22:05:05 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2aaf5d53eaaso44679695ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 03:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772017503; x=1772622303; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3hNSWrs4Z8eGQlDuu6Oyc+V7lXYEg9lf6KbC142PjA=;
        b=aEfbwHNn8gu/IDH5HA8BRg6JK8rKfKfp+xaL6cNMeqBf16dbd39DFxkdgFNqSgpoTS
         Bc8RykM1ymXY1ql9MNDjKQgiawsw5DC5cS4lf3H2fLM09r/8p8OGkvpZauV6eSuCb2Av
         9jMbsyPv1dEM9Z+BjAYG0jfbbZEfWx7pnIpm67y6f+KYIwhwh6UPbgQiHRbybfRxGwd5
         c/jRiIx+WAFBJRAG7kPLXfw8r3WPxsCT5B2896gQ3n6OkvtR7BwNn6TgUr5FgAVgeECy
         2YMyP6vcQK5/WNGER1VbGboT8XFinF8JsH9EtINk1DywJ3Z6H0vQciH96zen4+O8EBjg
         6QCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772017503; x=1772622303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h3hNSWrs4Z8eGQlDuu6Oyc+V7lXYEg9lf6KbC142PjA=;
        b=M5SNj4BzWp07fYJoYBnpUwcSAIM3pZdwbZXN2v6LX8MHgOdxiOJ02FLuCLn08t1i2O
         LdzJR1MIxU3VJlnYXKP6O2Zfp6XFYm1fq9ea4ps2KgaAWB9+vnN5ElKlp0R3S6UU4O5b
         B9LURo8wKaBxeWmdbMiONxV88nOAlUcFuTh1rb2K/lG4RseLWlbHGvNhy87Hm9D9TwYQ
         pP6fYU8S62h9GfQTvjRp7fxfMWZmJZ+zR9iQndbiT4s6otif3+yzaLMOsRzs0gcwXi5s
         dzQwEsCC0swHam5tBNpxWXHSCm4R+0VeAIHVbW5ats6OiMxgCJ9saRWGQWNb4uGch8Nr
         TR3w==
X-Gm-Message-State: AOJu0Yw7Ycig2oT2NIGmUFiaTGa6wqdAVPLX0rP96lhqWP2kxtnQ1W8I
	R0SnbRT2Nkh0HPL/OaiX+xi4zIldDsy+xfzOdOc0INxCaots4mcHTpAB8o3XKQ==
X-Gm-Gg: ATEYQzwnbwLcRzpn1G9uRpX2NxNFmbQL21X4e0Zl2udpILA/FFJ+VsaD3gNuqoaOBW0
	CvYE6WsT6XoYFmp5E+YhQwGf5KaY2zmSdgaH2K7Jya/+exKeHVtQ3+kqkmER7yIthpCBWRDOdz3
	8PGFs8Gg3FYYDoMlUJICBIGff4CSfq19JNU51mZkw4urLHgjJvpdCsoHH9BhFWlg9ZYoPFXJ6oG
	mISEUR3bIRm2wnF8dgN02jM6e8ZrHt9JvcPtL2wkAhehgVH6lpC6Bn6G+i/D1w9gKzv2zPwsI0q
	glgDotrFrqNTqpPAZJxZy+2OLYMk0O1YOGUwttRd8CET9tZpg2Ksj5qYWqcMzMI0mucRBX3mOuN
	kkRtKMurjHpBNl6NPSGgvovdvY9m+hN5KVvd5GdU1iZ0vkiYydD8TbAAzd6GIodvjbMShDVQJBK
	Vc+r9gua6cOecEIttRXUpxsRF4Pl7czGzQiihQxJN+FA==
X-Received: by 2002:a17:902:c94a:b0:2a9:649:6f5 with SMTP id d9443c01a7336-2add11aeeadmr23737835ad.12.1772017502631;
        Wed, 25 Feb 2026 03:05:02 -0800 (PST)
Received: from dw-tp.ibmuc.com ([203.81.242.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503f9f5sm138365975ad.77.2026.02.25.03.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:05:02 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC v1 04/10] powerpc/64s/tlbflush-radix: Remove unused radix__flush_tlb_pwc()
Date: Wed, 25 Feb 2026 16:34:25 +0530
Message-ID: <efb8f299f33659fe07697a038138eb5760c78707.1772013273.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772013273.git.ritesh.list@gmail.com>
References: <cover.1772013273.git.ritesh.list@gmail.com>
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
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kvack.org,google.com,linux-foundation.org,linux.ibm.com,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17179-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: C935B196366
X-Rspamd-Action: no action

Commit 52162ec784fa
("powerpc/mm/book3s64/radix: Use freed_tables instead of need_flush_all")
removed radix__flush_tlb_pwc() definition, but missed to remove the extern
declaration. This patch removes it.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/tlbflush-radix.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
index a38542259fab..de9b96660582 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
@@ -92,7 +92,6 @@ extern void radix__flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmad
 #define radix__flush_tlb_page(vma,addr)	radix__local_flush_tlb_page(vma,addr)
 #define radix__flush_tlb_page_psize(mm,addr,p) radix__local_flush_tlb_page_psize(mm,addr,p)
 #endif
-extern void radix__flush_tlb_pwc(struct mmu_gather *tlb, unsigned long addr);
 extern void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr);
 extern void radix__flush_tlb_all(void);
 
-- 
2.53.0


