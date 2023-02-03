Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B6A6890BA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 08:24:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7Rx2287fz3fCc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 18:24:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h7nAnXYf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h7nAnXYf;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7RqJ2lRMz3f6X
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 18:19:24 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id d2so524576pjd.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Feb 2023 23:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x14kRrZZe2kdSbgJ1PJqUMQQfgWflSMZWL5LFkwvByE=;
        b=h7nAnXYffJkXAeKtJ4+Pb47ZmdkwzoIxpzRgCBuRqFSEuDy+TP7MF7IO/iVxeE9h3P
         aG7Esd2gb18pAjYT42bsVp7oBg2AItWYJWILKrT1Rv1wljyPlzKVe3HEajToWCRcZVtL
         zy4qIqHGZ3aoBW3DgCSA/Vp7o+H66URuFiIddPmq0wydnig1tvUkwDog28Na9VCQmXCY
         VaSnJ2jOszZ6JD6S3Lt/kqQ/A4667tSOoYJbLAZ3Dg/8Mt+fnJ7poqcB8fdgDCdZgr9h
         DFZ/UDXahTH+Bf05/C7Y+Y3gm5kj6MbI54iJLvql0E7GMYErZm9nVGNUKj5tyaG4S5jq
         3YEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x14kRrZZe2kdSbgJ1PJqUMQQfgWflSMZWL5LFkwvByE=;
        b=Yrx8gSXsNS+BUqfvP02afTfJqDgMvK7UuAlAafU/A70uX7t30Pf5Z7ZdW7tgtjguEr
         1aULPY81kDk7rljKEgIG4fHBR9poKZJpTeWvnpxaK7U+3+mp5d6nYGzOA5lUGvQEwJLn
         /SdioA5fOfnnVNcTWZbplTH91sgcU5nJYoo5vYWBt57qE7WSqbi0OVDVPgRa2jZ1Z3ix
         2D/MKctMjhoJ0BJjgI7NT7WNIu7pq1DwJTn0FQPKe4ySYAMJpQgxvN4avmZLGSE1FczS
         loQ3CiKygq4V5O8yS0ymzP+9AKO58HkoG859LcHtirDf9m1Txo6mXAKb+WdmEB5ibdcK
         nbTA==
X-Gm-Message-State: AO0yUKVJVkZeuV7t3IprWqOENVg+zYIdy3LdEyivKN8Vfu5e67liBieQ
	S3o+Zt+tb4NhEIt+0tOTFmU=
X-Google-Smtp-Source: AK7set/pN1qkE5vW6sEUJPLmtT3NU/AerHL7q01jFwtmVHRhEkUBx1PKvOIigiSi96c+JcvQpUaLgA==
X-Received: by 2002:a17:90a:11:b0:22c:8dfe:d6a6 with SMTP id 17-20020a17090a001100b0022c8dfed6a6mr9294792pja.4.1675408762194;
        Thu, 02 Feb 2023 23:19:22 -0800 (PST)
Received: from bobo.ibm.com (193-116-117-77.tpgi.com.au. [193.116.117.77])
        by smtp.gmail.com with ESMTPSA id f20-20020a637554000000b004df4ba1ebfesm877558pgn.66.2023.02.02.23.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 23:19:21 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v7 5/5] powerpc/64s: enable MMU_LAZY_TLB_SHOOTDOWN
Date: Fri,  3 Feb 2023 17:18:37 +1000
Message-Id: <20230203071837.1136453-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230203071837.1136453-1-npiggin@gmail.com>
References: <20230203071837.1136453-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Rik van Riel <riel@redhat.com>, Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, Dave Hansen <dave.hansen@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Nadav Amit <nadav.amit@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On a 16-socket 192-core POWER8 system, the context_switch1_threads
benchmark from will-it-scale (see earlier changelog), upstream can
achieve a rate of about 1 million context switches per second, due to
contention on the mm refcount.

64s meets the prerequisites for CONFIG_MMU_LAZY_TLB_SHOOTDOWN, so enable
the option. This increases the above benchmark to 118 million context
switches per second.

This generates 314 additional IPI interrupts on a 144 CPU system doing
a kernel compile, which is in the noise in terms of kernel cycles.

Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b8c4ac56bddc..600ace5a7f1a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -265,6 +265,7 @@ config PPC
 	select MMU_GATHER_PAGE_SIZE
 	select MMU_GATHER_RCU_TABLE_FREE
 	select MMU_GATHER_MERGE_VMAS
+	select MMU_LAZY_TLB_SHOOTDOWN		if PPC_BOOK3S_64
 	select MODULES_USE_ELF_RELA
 	select NEED_DMA_MAP_STATE		if PPC64 || NOT_COHERENT_CACHE
 	select NEED_PER_CPU_EMBED_FIRST_CHUNK	if PPC64
-- 
2.37.2

