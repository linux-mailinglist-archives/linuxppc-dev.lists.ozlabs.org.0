Return-Path: <linuxppc-dev+bounces-2386-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8656C9A44AE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 19:31:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVWvM2Ddfz3brN;
	Sat, 19 Oct 2024 04:30:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729272655;
	cv=none; b=fYL66J9R0QAxN769dVPGcz7rrMgtmFDzMbnGLR14Q8M/HgX1DpIivcECyyudPaotQD3q7tkDWXT+goFnCpGXY9btmbY6/AkOVdQbq7xztJDPlHlK/8gWJqvwYv7PVX1H/vuP30FLTvnZSpnKn88RGMIUdVx75UEX1BJH0n0K3E2HXY1nskFNyMShQRtx5tD/0HGH2BMMtUP2C7qygQAQb8mFbQkusaBBDMcpbFZTeNmitaiDNrwk3d/ihWsesISP5nfN474MAL24fxHUbXb9csLaf7PBOBz+1KANlxVIrw3X0M1QATw4DtwDWVvhh73JhByrnJvcep4JLJF9JiejEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729272655; c=relaxed/relaxed;
	bh=/yT2xkfY2cuEcnEiccNoddLAZz1lOngFGOhNqKs9rtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XsYNoSAM1Nw5RMYogeIvwyVBHSk018SUKDnAR/8ER9ImuwDFSZknsj6Nxs1P8nzywFX5T1krtepi+gsBvxkVxbUMTXPDeFuvf7AqRPR6Jz3G3E5xVCFjV+SDD8ohJ3CKmuKIVxCWeHU/IYPqV4chbb7xvELK7d8GAajiUK/uoqUn4CW+6dq5SO75kCESWGC8UWujlQp/3Ia0JzJg1fRUJ3L55IMF9zSvYD66cPY4vIRrEKG7lCV6RiTBfknC0snb80Dq13rdLBjnqqSFcsHHrAowccP9OcGsMZM49+3gZAuLjum6jJ3thr5T2PIfzzjgnTmY9j1AlLLZ1Ut1OrwKiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZOBkYRU6; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZOBkYRU6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVWvL2ZVDz3bqW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 04:30:54 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7db908c9c83so1573218a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 10:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729272651; x=1729877451; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yT2xkfY2cuEcnEiccNoddLAZz1lOngFGOhNqKs9rtU=;
        b=ZOBkYRU6/GZFnPemg6BvIhyliBb6Gnele2Q5Ov/O5zgtgoBrRp7vX/ToIElr/ayZ1X
         vPxw4KTzIRUzQVV7o8gy+Rvhn2TRHmTvPluONEOHqp0+s3DEA14gYPQxe96xdQLi8gX+
         q98vVTdk9q+mWjP/S27rQxyYg+C+3TIpmhTBuUoVKaG6Ty0E0Sae0AcIk75zroUtdC7R
         fKVAYyZjAq/PxwHP0CqJ3oYTsKZTQab2tlOZqTY+KOnoiGX6taOKCi49+pr6BiZv6pb0
         NrCJMFsxeHIKYeoeozvr1OnNqD/YIw/fR2YkUJgtdjs+r8V53prKWZlByf/Cd3bE1U49
         NfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729272651; x=1729877451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yT2xkfY2cuEcnEiccNoddLAZz1lOngFGOhNqKs9rtU=;
        b=CYOR6+95u7Gbkj4sp0osCd9beNWB3KicEJUkZEYTnq7pSb8yonOKtcD1HzIXAEE5iN
         AzUyCWaX9EZdNrg++pImyKXxTRjuAAo7OMEcwZALvWfBFQwJW+ptqHV+Vdus0wnGjP7P
         0VkfU6+2paFysPXbMQrZ7BMH/L9pbFyL+Co3I3Cb6boxdLIbkWJmZwL7wyZquIJb1wMz
         XRC/a2XsolMcwx8w+TiSQtLfqKtblN+E7IetmxuBKJSJGyMczZSLLl3kkgc/gvIhIavo
         Y6mxNUImJV42XmLKtKtHxvn/L9G7C7IHAQmEV9fRt9lGlpsiIJmt5JlZaP3/izUcDptH
         h+gg==
X-Gm-Message-State: AOJu0Yxh+8Y5hVhGMSg7ja8QpixGYH/k+mAQrlPG+T7uyZoOv3l1w1TK
	13IwZB8cg8TLHnPvonjt1KADk4jVYprcwek3cP4ai+K5EX4yXkgme4NGqJhG
X-Google-Smtp-Source: AGHT+IHW0pQgponGx/gVpoZ4bowEpREiydwVrhTTv3Smj0fSfHzFmSnPLW4FIXTVD3Eg6sTX/fZl5A==
X-Received: by 2002:a05:6a21:3a96:b0:1d8:fcf2:9ce2 with SMTP id adf61e73a8af0-1d92c57db72mr3781064637.44.1729272651290;
        Fri, 18 Oct 2024 10:30:51 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea3311f51sm1725242b3a.36.2024.10.18.10.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 10:30:50 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Marco Elver <elver@google.com>,
	Alexander Potapenko <glider@google.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v3 06/12] book3s64/hash: Refactor hash__kernel_map_pages() function
Date: Fri, 18 Oct 2024 22:59:47 +0530
Message-ID: <0cb8ddcccdcf61ea06ab4d92aacd770c16cc0f2c.1729271995.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1729271995.git.ritesh.list@gmail.com>
References: <cover.1729271995.git.ritesh.list@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This refactors hash__kernel_map_pages() function to call
hash_debug_pagealloc_map_pages(). This will come useful when we will add
kfence support.

No functionality changes in this patch.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 0b63acf62d1d..ab50bb33a390 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -349,7 +349,8 @@ static inline void hash_debug_pagealloc_add_slot(phys_addr_t paddr, int slot)
 		linear_map_hash_slots[paddr >> PAGE_SHIFT] = slot | 0x80;
 }
 
-int hash__kernel_map_pages(struct page *page, int numpages, int enable)
+static int hash_debug_pagealloc_map_pages(struct page *page, int numpages,
+					  int enable)
 {
 	unsigned long flags, vaddr, lmi;
 	int i;
@@ -368,6 +369,12 @@ int hash__kernel_map_pages(struct page *page, int numpages, int enable)
 	local_irq_restore(flags);
 	return 0;
 }
+
+int hash__kernel_map_pages(struct page *page, int numpages, int enable)
+{
+	return hash_debug_pagealloc_map_pages(page, numpages, enable);
+}
+
 #else /* CONFIG_DEBUG_PAGEALLOC */
 int hash__kernel_map_pages(struct page *page, int numpages,
 					 int enable)
-- 
2.46.0


