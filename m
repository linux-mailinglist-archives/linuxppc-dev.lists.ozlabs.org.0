Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEDE247B44
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 01:51:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVrR30KBwzDqNK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 09:51:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=o4ZgIE5h; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVrCP4vGLzDqVx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 09:41:05 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id n129so16669125qkd.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 16:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4pvezruqLZGZxlep+/8CtLytSlMuAJbS5PO1pRjRZ2A=;
 b=o4ZgIE5hUZtt9C/X/WWI8vcoQiLbf5ZScgCCr+PJA64zZzgxYbha59fEpFp2wXPcO6
 v3cF/GAHaFnlwEhfdTMVtKe0UFpeantVLiSl9TwakZiJL88an5HoKvRHZ3mw38/D8o/4
 ADvG7N9hDTso4qWFlL8iMs2kb8f309m6tcv9w+p6E8TsRLbXQ1vqrKOPipf4RF1pqNWr
 qGjONDNhVOYPosm6u7V/CoIA6iGmXvJyRcEduDmNy1C4iwMBN/zZJwWVnfX9YR/4hvWh
 voBUwB2UWFb/TjgGf3nG85mOV+dbCR5b891zGXnykvOarEdkFPZq8rOhGOtA3QNaXeel
 6Tyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4pvezruqLZGZxlep+/8CtLytSlMuAJbS5PO1pRjRZ2A=;
 b=t+NgYgSYbq5RL0ZIyiTeJEbQ9BLozABzgZJt1zN2+aogFu9aph3iIDWRhUIk/02jDh
 ad2Fvw0RtYBQzbkXGROygwWWpObhdAgpSZOAIyHRGHVXtURoPpyZ9yAxcTp6pU81ufio
 DT8aGIZvUwu48AIr8zAbGi47JdehXZJvkXM/6ywi3EJT4LghjH5Aj2EgQr0rQVi2O4U+
 OGPOGiFWusX8gqvXbINZcqaxseWvpexL+J0T+eXohEqNi7nE/bIfaQ5XU6Wz5qTVyEPD
 CXgKiweXzOvhwSQrAGb+jhR29NJfK7JFLBgz0+Ne1b698XMRaJcsUf8+rrvQEtLi9Xx1
 GkIg==
X-Gm-Message-State: AOAM5338AsSrxBMDgGcqgOLm0OXZM0+1W84tIe8r7nZgRuio+rI7N4tN
 yr+UT316ZCfOPP3RE75k57Q=
X-Google-Smtp-Source: ABdhPJxehOMVbJQckk7e/Qh1mMulQWUFFQwhe2K4ElGutd/V7ytUlUfzbgALu/PGyL6iroFhCddtUQ==
X-Received: by 2002:a37:614:: with SMTP id 20mr14659203qkg.456.1597707663297; 
 Mon, 17 Aug 2020 16:41:03 -0700 (PDT)
Received: from LeoBras.ibmuc.com ([177.35.193.93])
 by smtp.gmail.com with ESMTPSA id w58sm22342868qth.95.2020.08.17.16.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 16:41:02 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Subject: [PATCH v1 03/10] powerpc/kernel/iommu: Use largepool as a last resort
 when !largealloc
Date: Mon, 17 Aug 2020 20:40:26 -0300
Message-Id: <20200817234033.442511-4-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200817234033.442511-1-leobras.c@gmail.com>
References: <20200817234033.442511-1-leobras.c@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As of today, doing iommu_range_alloc() only for !largealloc (npages <= 15)
will only be able to use 3/4 of the available pages, given pages on
largepool  not being available for !largealloc.

This could mean some drivers not being able to fully use all the available
pages for the DMA window.

Add pages on largepool as a last resort for !largealloc, making all pages
of the DMA window available.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/kernel/iommu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index d7086087830f..7f603d4e62d4 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -261,6 +261,15 @@ static unsigned long iommu_range_alloc(struct device *dev,
 			pass++;
 			goto again;
 
+		} else if (pass == tbl->nr_pools + 1) {
+			/* Last resort: try largepool */
+			spin_unlock(&pool->lock);
+			pool = &tbl->large_pool;
+			spin_lock(&pool->lock);
+			pool->hint = pool->start;
+			pass++;
+			goto again;
+
 		} else {
 			/* Give up */
 			spin_unlock_irqrestore(&(pool->lock), flags);
-- 
2.25.4

