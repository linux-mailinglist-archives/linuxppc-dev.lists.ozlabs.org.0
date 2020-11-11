Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F48C2AEF87
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 12:24:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWMng03bbzDqGM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 22:24:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eGYwfQVY; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWMQT0x4nzDqb0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 22:07:45 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id gi3so566771pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 03:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i9QuJLEjIPLpDeuvL6cggUWm+kIo+T8XFZuMVw3L5OE=;
 b=eGYwfQVYMWlAeg1rJiTF6BgSFNuFxWfjnStIkSCh3ghGiJ5LRQ4+acK9lN8qdE+YHi
 KRGeNNjgbVzznUCqy9/CLybZMT9+o5cOykz8iBxcZSJ6bDFNbL/81S8/WhKwejAjt1uR
 57hjA36rzhWWwof23dU+U+Id5oDepo2753RBTq9PF2+mwbKcPhNLuTrIibXVJcqXOorH
 5uNA1Iili2Rxg+H5NxyIIB6cu7EfXSSCnGIe9fminLaYZ7SL+GXp2SIQ+FJG4m+yCIBy
 y2HtxDSDPDayXiDd7W3Yxr8MHZAybkTVZD9PMIXbCm8svJDZSoh2j7TL9K33XfemsfOy
 NJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i9QuJLEjIPLpDeuvL6cggUWm+kIo+T8XFZuMVw3L5OE=;
 b=skKl7INxXswAv1Yl4r1497CfEbKNfxT0RfKk7HJRsjoLi3kD/YV6l8qxWmP+SQ75R9
 RMwIXbY3tInAjN0duGzlM99g7zZa62Gfwso/IDcq5o2JmrFFjha/2Ldu74fXlW5m2+Vl
 lz55tKRw5ETVsiOwTKV6U0dM9/RDCj4nzd2c7ut7YXrOaBIXx+IJGo9HftSJdnZFpHmJ
 akUozlcbiDlMIykP0YECNG5HGa74nI0245dkPT5U7n9H8jfFqTJFUuZp0vLsmBh5FxhO
 YocmBh55tFAULe9/f73pGq30Czqk6EWi0MTrnU3CIRlk+aoEXd0rkkKvhl4tEnJXUHKD
 +TpQ==
X-Gm-Message-State: AOAM53159KZ1wZbdoRcv/PIOFNMg4tAVz/jFQOI2qLIkVaX3Ulhmzjza
 HUXmKcYZd8+mscVhhiooNmpn4i1KeXU=
X-Google-Smtp-Source: ABdhPJwaXv990DxU17tDbiasD9ZoY0rRxQ452QK0z4AJVdpOnJ0xgah0UQo8IYOY/9879g2TvzstLQ==
X-Received: by 2002:a17:902:fe81:b029:d6:8677:6741 with SMTP id
 x1-20020a170902fe81b02900d686776741mr20695174plm.79.1605092861472; 
 Wed, 11 Nov 2020 03:07:41 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id 9sm2154943pfp.102.2020.11.11.03.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 03:07:41 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/64s/iommu: don't use atomic_ function on
 atomic64_t type
Date: Wed, 11 Nov 2020 21:07:22 +1000
Message-Id: <20201111110723.3148665-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201111110723.3148665-1-npiggin@gmail.com>
References: <20201111110723.3148665-1-npiggin@gmail.com>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-arch@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/iommu_api.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3s64/iommu_api.c
index 563faa10bb66..685d7bb3d26f 100644
--- a/arch/powerpc/mm/book3s64/iommu_api.c
+++ b/arch/powerpc/mm/book3s64/iommu_api.c
@@ -263,7 +263,7 @@ long mm_iommu_put(struct mm_struct *mm, struct mm_iommu_table_group_mem_t *mem)
 		goto unlock_exit;
 
 	/* Are there still mappings? */
-	if (atomic_cmpxchg(&mem->mapped, 1, 0) != 1) {
+	if (atomic64_cmpxchg(&mem->mapped, 1, 0) != 1) {
 		++mem->used;
 		ret = -EBUSY;
 		goto unlock_exit;
-- 
2.23.0

