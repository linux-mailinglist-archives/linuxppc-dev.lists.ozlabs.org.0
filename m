Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 260F29428A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 10:04:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KS+PdhBi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYl3x0VYBz3dSZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 18:04:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KS+PdhBi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::34; helo=mail-oa1-x34.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYkxC3qtZz3cnc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 17:58:23 +1000 (AEST)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-260f94067bcso3715516fac.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 00:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722412695; x=1723017495; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sjNoON398ZsIx0bmEQJty2zbqjlCUYWeF9pzoiIutU=;
        b=KS+PdhBi2Kra1Hv0eSi8mn9096NY34PPznqE7ZjmBqazBPEz7BdWbPHjKM+UYPWiBo
         0LoTARQRF4/+ErvgMyyNIwLgItkQNy22fRIlpcTCBctdf1Nv7YQdT28Baxb4VTC/e5uk
         fCrTRWz3T36U12/F+Kf+rsxfA0QDyeNROZuKfRUzXlRncP0bzGsC0h3/Yle24eWP5605
         Kmn4agRbIzVsO4DmKkg68Sc3GO9CUJrU8NsfoWoJYOiR6HaJfu3fLHtPAkbh6mDCnzBX
         9ubeTJhPp/zVxnjKPKtOj3+zw36b6SzesoMl5ADbW6x9N3VAqU5sRW6hdZfIKFHS1LuJ
         jtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722412695; x=1723017495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sjNoON398ZsIx0bmEQJty2zbqjlCUYWeF9pzoiIutU=;
        b=WlISPER8/IW7IIBtbAviPjslnKeJBlGXCkAd5HWevd7DJgTZQOGGRxqIkyH0l9NAc7
         5WuBKL8PpIYM45GtHT8RrlkSRzN96fP6pbE80SkKWkSmJyOCd77Lb9of1o6DD73AGCy6
         Hrr5BG++DgXyQJuO49UYl5DWRitavu5Wc/1+ZBY+QjQ2yByen5Q5y1XkPb4rpFnkZ2JQ
         0Jm1dTTmXWR2NBEbNYY27J7/4lsgzXhQFmC6X4CyavoV174v/WYu7sCmDOJ3gg1jhLZC
         DvGB4zZMephLQCyFmVyue8fXykaKCjjUGzVtJrg9JgUhc2A67xAYcyqXJZ0dHIqABDSa
         I6GQ==
X-Gm-Message-State: AOJu0YzAA+fW9HDEQTlwIwGuUuEjf9i2T18ckFiYdWsLuNiTFQXR7+y+
	E+dEXF2COSdKJI2JXaFUdB673M3iU7diMQf4mPy5R/2J/JLNCn+ToCJD7A==
X-Google-Smtp-Source: AGHT+IGW4hGBbauSzQ7W8AKrqOHSQ/x7Lo+FNQaq84PeyRJgK4W33/QqxduNJ9zsws/o/hDmiPXKkw==
X-Received: by 2002:a05:6870:1605:b0:261:10b2:7bc1 with SMTP id 586e51a60fabf-267d4f21b01mr17781102fac.31.1722412694597;
        Wed, 31 Jul 2024 00:58:14 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.83.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead6e16fbsm9788372b3a.19.2024.07.31.00.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:58:14 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC v1 10/10] book3s64/hash: Disable kfence if not early init
Date: Wed, 31 Jul 2024 13:26:14 +0530
Message-ID: <fd77730375a0ab6ae0a89f934385750b239d3113.1722408881.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722408881.git.ritesh.list@gmail.com>
References: <cover.1722408881.git.ritesh.list@gmail.com>
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
Cc: Donet Tom <donettom@linux.vnet.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, "Ritesh Harjani \(IBM\)" <ritesh.list@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Pavithra Prakash <pavrampu@linux.vnet.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Enable kfence on book3s64 hash only when early init is enabled.
This is because, kfence could cause the kernel linear map to be mapped
at PAGE_SIZE level instead of 16M (which I guess we don't want).

Also currently there is no way to -
1. Make multiple page size entries for the SLB used for kernel linear
   map.
2. No easy way of getting the hash slot details after the page table
   mapping for kernel linear setup. So even if kfence allocate the
   pool in late init, we won't be able to get the hash slot details in
   kfence linear map.

Thus this patch disables kfence on hash if kfence early init is not
enabled.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index c66b9921fc7d..759dbcbf1483 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -410,6 +410,8 @@ static phys_addr_t kfence_pool;

 static inline void hash_kfence_alloc_pool(void)
 {
+	if (!kfence_early_init)
+		goto err;

 	// allocate linear map for kfence within RMA region
 	linear_map_kf_hash_count = KFENCE_POOL_SIZE >> PAGE_SHIFT;
@@ -1074,7 +1076,8 @@ static void __init htab_init_page_sizes(void)
 	bool aligned = true;
 	init_hpte_page_sizes();

-	if (!debug_pagealloc_enabled_or_kfence()) {
+	if (!debug_pagealloc_enabled() &&
+	    !(IS_ENABLED(CONFIG_KFENCE) && kfence_early_init)) {
 		/*
 		 * Pick a size for the linear mapping. Currently, we only
 		 * support 16M, 1M and 4K which is the default
--
2.45.2

