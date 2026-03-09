Return-Path: <linuxppc-dev+bounces-17929-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BpcDWAOr2njNAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17929-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:16:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D11523E737
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:15:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fV4tk66v7z3cNV;
	Tue, 10 Mar 2026 05:15:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773080126;
	cv=none; b=TmIsNyx6HTXE3cKV08gGBvDG3ar+Lb8shvU+wry4cjKGbb/J9QRI5SRe8XVGKpphx2FnTKTPjNx9cxGdSfEdu8CiH7d/2thpZD/Vkc/GL2PjON8HJsonD/8SimFP9SnZzlDFl+P6+eVN3+RvE2gZAl/tLZrRT0UAWE+sy3WWkKwgs5uxOvmjyOPPe9bPAf7lhDabJ2ov/kY7fyQBs30ShVBzOS8wk8MNWzSIdMi6raFr7eI5X5138/0Ol9JSKC1cPMs3SYQqcKGrkxoUv25gNbRBkgiCLvCk+j9U8rekEtvrwvwP/DYRxdB16P3MBJfysfpxJR/db22r9scy+5IqkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773080126; c=relaxed/relaxed;
	bh=ZY5tszYWZ1/SKLDRSzX6t9Cm8wXbfLPKnMGZL9N5Ns8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NJ5nAAmmzCi6gRzE7F4pWk1yqm/e3sdj58hJzydC0Br1fJaQ2w4n7GkIaFoW4Z/in7QJI1wbebsfkBqvZSnU9MTYlh5T0ASxQZjXb2nNMU1BQHWeqvkECm2C1wKlwWT96VV833GidQzVMC5+qMBWFLUpMImGqKpgVbTD3sW8Ihsm0lLyPjQnufTcr6C3As/ycLMF6hXcBb1aTEFbOuaWX/KzklxE/P48Z8tYwUIy7gyVek/D4u92jBxlj9za92EAeT2IP0meG7lw2qCZQthN8lQyxtIQkCkOk+tjfIetHTiPpp+yd/vxeRK3+K1awut6pjc/ZBo0xpjavSpzdfrwmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QIzy5AwS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QIzy5AwS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fV4tj6bW2z3cBW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 05:15:25 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8297310ce0aso3334881b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 11:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773080123; x=1773684923; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZY5tszYWZ1/SKLDRSzX6t9Cm8wXbfLPKnMGZL9N5Ns8=;
        b=QIzy5AwS2OXGJdG+rznp5LqdIwn3qw/Nscfv+xGCZQHggHj0pyWCx8LyYgtmtoSlXh
         mA0dH5n2V5yRPzBJvCJ1FzxgngSbvUa+YQyexQCPBOUMo3L7eJTXAoJmCXUx7NGfx5A1
         FcsGjKMYrCk2oxGzEKZVN6YCCwwX4gGLW/HOmT6e5T8PBySoeeCqbgXqcq0kNdbxfbpl
         Ghm3tnHLwJDK49zF5WG1eZlit+8ocpq6uDbcKYboGOd0SertXpKqfEYYmU2BF9SjpNBk
         kLNKwNk8I4g/ol/VtW5SGkbnaw+xuQ20+tLWwLUP9e+/NcXTrqbYjP7rK0LWkB5N5UW6
         bOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773080123; x=1773684923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZY5tszYWZ1/SKLDRSzX6t9Cm8wXbfLPKnMGZL9N5Ns8=;
        b=fjm3DHucTvBCX+2pzm0+xqdl/56nW3Ktl7AFDarOq6Oxu4Y72Etegf1h/qbEMpkMtT
         4mjhvnp0rQdlAbon1ZsdwJv/QtI8kVkic1SZAA9yMA1SKuqMK00qCq1yZD36GJlqgAWe
         5AtwDnKbwAg5j8jXYLuTDZWY81Jz+BlK/+XatDlz+Z5EzxpRH6Yqsjeu+0K3iy8Rje6d
         ID74z0ncEbhyswf7wqVKRwz56+buQ0166qPl/huAnMT8m4bxz5fS6N+/oed8JQkvEScp
         n+yAcoWC9XkRqB8NRQ4AH1e84xeLmAmbiHqpaI4ZviaiCkR0VUDKStCqIE/ADGmQxYke
         me+g==
X-Gm-Message-State: AOJu0YxtZRheIPqhB/LKLk5K1L3FMDaq3lKnxD+bcTE0Q/xIBzjiUFW4
	PhN2ZVhs8ONWx1EB8UsVsZKfbCLKZFCDJdf6EiEY1pyDvibVfa8duM35NWwTYkki
X-Gm-Gg: ATEYQzy2jmhScX54OPu3ItkcKUJ0286upHe8WWBtgKF4BXsaII1UlCeaURGkgZQKcDF
	PZoPk+8dlVhRA6NbIN7kYsIJB19d4Bjbo4A1YzgVz2OLCy33FQUc/SI81xRaIwIltm6GCPlmDEY
	HJBzZfC3wOEhNvWvkV2FLJs50aQgYYxUooHbfh9tE2Z9agCmeKbzo8oe2EWZJge5+RBts5PjxEp
	nf+RpPEnmtCEYYkGAdq8PUjVJ/EgzuJAOghA3dE5P0BLQUEqwrFhC7PFoM81Uv/jAwbDI5v7Pyz
	PojZMhUACQF9XqMRAucy+YYKZ+6AncDW+forwlFX4O1XyzcUSxVexlxNSgPovN9fb8upSTsKsvT
	zU4HvFFGMsUDG3XfZwAmkLKoWyCUb+U1ipl3a14jQD+eOO+WMd1xOfV0A11e6DJ9fg7mqmKr11p
	rgSO59ZbhF8yATdRlTfgSEbC2W9X5P3oex/hssppWrWxoc3JuBJBYyBCMkIFhlbyMA
X-Received: by 2002:a05:6a00:ae0c:b0:81f:61d2:84a9 with SMTP id d2e1a72fcca58-829a2f6e093mr8525803b3a.35.1773080123471;
        Mon, 09 Mar 2026 11:15:23 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f29:53c8:742c:4036:d7c6:9024])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46765a6sm10775477b3a.29.2026.03.09.11.15.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Mar 2026 11:15:22 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sayali Patil <sayalip@linux.ibm.com>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>,
	Donet Tom <donettom@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 09/10] powerpc/64s: Make use of H_RPTI_TYPE_ALL macro
Date: Mon,  9 Mar 2026 23:44:32 +0530
Message-ID: <d1d32404d5f0d3e93cd0faad2298b7bfed31288f.1773078178.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1773078178.git.ritesh.list@gmail.com>
References: <cover.1773078178.git.ritesh.list@gmail.com>
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
X-Rspamd-Queue-Id: 8D11523E737
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17929-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

Instead of opencoding, let's use the pre-defined macro (H_RPTI_TYPE_ALL)
at the following places.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 6ce94eaefc1b..7de5760164a9 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -885,8 +885,7 @@ static void __flush_all_mm(struct mm_struct *mm, bool fullmm)
 	} else if (type == FLUSH_TYPE_GLOBAL) {
 		if (!mmu_has_feature(MMU_FTR_GTSE)) {
 			unsigned long tgt = H_RPTI_TARGET_CMMU;
-			unsigned long type = H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC |
-					     H_RPTI_TYPE_PRT;
+			unsigned long type = H_RPTI_TYPE_ALL;
 
 			if (atomic_read(&mm->context.copros) > 0)
 				tgt |= H_RPTI_TARGET_NMMU;
@@ -982,8 +981,7 @@ void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
 	if (!mmu_has_feature(MMU_FTR_GTSE)) {
 		unsigned long tgt = H_RPTI_TARGET_CMMU | H_RPTI_TARGET_NMMU;
-		unsigned long type = H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC |
-				     H_RPTI_TYPE_PRT;
+		unsigned long type = H_RPTI_TYPE_ALL;
 
 		pseries_rpt_invalidate(0, tgt, type, H_RPTI_PAGE_ALL,
 				       start, end);
@@ -1337,8 +1335,7 @@ void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr)
 			unsigned long tgt, type, pg_sizes;
 
 			tgt = H_RPTI_TARGET_CMMU;
-			type = H_RPTI_TYPE_TLB | H_RPTI_TYPE_PWC |
-			       H_RPTI_TYPE_PRT;
+			type = H_RPTI_TYPE_ALL;
 			pg_sizes = psize_to_rpti_pgsize(mmu_virtual_psize);
 
 			if (atomic_read(&mm->context.copros) > 0)
-- 
2.50.1 (Apple Git-155)


