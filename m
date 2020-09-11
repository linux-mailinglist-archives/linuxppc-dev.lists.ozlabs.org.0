Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EFD2665F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 19:18:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp2Xf0twzzDqsK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 03:18:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UpH81kZ+; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp2Nz3FvzzDqrj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 03:12:03 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id f142so10537587qke.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 10:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RSyvL6te6IHF59WgBVBklEnTMVbSzvGBln8Tm9smObo=;
 b=UpH81kZ+3LNRfosTdjybGAJ1gujZMNKmtThVl6ii1cUEFovG3ItG+DpFNwcVelCESp
 YTX5E4ehbq7ChHKx5jnXa6ZyBrVvs3T9uC3BFmMxuTmGjgPa7jK4O3JMGL+aLzHo8N2T
 td/KMq2sbqEzjN1CTNim4f0BR2ZIckMGE+WyGXeAyLm7J+XWYoLzR7uoaivLC71aJvsj
 pW27M1namVuDt5uUgmRNtOlvvKo7bGcuOAA3mi7ZIXpYpAw6xJ+8wwqVGhKQz9kY4Kev
 UdeENv+MCiSI7aKqNEvrBaLWSHOOu1Gsp91SozVGrsfeOaKzz9EQTywD9X/H/jb7MF2m
 KNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RSyvL6te6IHF59WgBVBklEnTMVbSzvGBln8Tm9smObo=;
 b=qh8ytRblsQcx5b9Te+8Jxqn8MZP+tLyPkUfCIGEvTBC9OALX1FtrJsXGwXzBc5um7G
 QzIOxA/PEMM3sAtX52xYBOFoX4s4q75zhxhLFwYDnh0SX31A9B9HdTQJpOb2sMxuGT/6
 Av1XiFprSyQMF7QQ0v0SiVS+y+Vvcbxjn2H4V0E0PQuw62Gk7ivn4yw2CpOhIsVgFQjX
 c2310Wp95fooatkrNCimAt7EMn4hk0jmGuaSw9GLT/D7/M7nvUckzfi5J98eq2cOPRNx
 jxqKulOFdmLMVHoZtj4kHz/FhMlKkohab0g8HP3wkRGN5q0qfPxpoKYdmkXvIpLJUmxM
 fAVA==
X-Gm-Message-State: AOAM5305WmeQMYlpCoy8oG+Pwtg707wEz0EbwC2jSQm0WwNATP0Siyxs
 VN/aV1mGgkbdpQrF1z65EMY=
X-Google-Smtp-Source: ABdhPJy30Qtb8FQClCnG8+MayL/5oIjHOj9+9L5XgDjl5SOPZiMQL/1/Onn6Lt2tskgLjh8pZfO62g==
X-Received: by 2002:a05:620a:103c:: with SMTP id
 a28mr2423751qkk.376.1599844321514; 
 Fri, 11 Sep 2020 10:12:01 -0700 (PDT)
Received: from LeoBras.ibmuc.com (179-125-254-96.dynamic.desktop.com.br.
 [179.125.254.96])
 by smtp.gmail.com with ESMTPSA id l5sm3533330qtc.28.2020.09.11.10.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 10:12:00 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Subject: [PATCH v2 02/14] powerpc/pseries/iommu: Makes sure IOMMU_PAGE_SIZE <=
 PAGE_SIZE
Date: Fri, 11 Sep 2020 14:07:27 -0300
Message-Id: <20200911170738.82818-3-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200911170738.82818-1-leobras.c@gmail.com>
References: <20200911170738.82818-1-leobras.c@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 

Having System pagesize < IOMMU pagesize may cause a page owned by another
process/VM to be written by a buggy driver / device.

As it's intended to use DDW for indirect mapping, it's possible to get
a configuration where (PAGE_SIZE = 4k) < (IOMMU_PAGE_SIZE() = 64k).

To avoid this, make sure create_ddw() can only use pagesize <= PAGE_SIZE.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 9db3927607a4..4eff3a6a441e 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1206,17 +1206,20 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 			goto out_failed;
 		}
 	}
-	if (query.page_size & 4) {
-		page_shift = 24; /* 16MB */
-	} else if (query.page_size & 2) {
+
+	/* Choose the biggest pagesize available <= PAGE_SHIFT */
+	if ((query.page_size & 4)) {
+		page_shift = 24; /* 16MB - Hugepages */
+	} else if ((query.page_size & 2) && PAGE_SHIFT >= 16) {
 		page_shift = 16; /* 64kB */
-	} else if (query.page_size & 1) {
+	} else if ((query.page_size & 1) && PAGE_SHIFT >= 12) {
 		page_shift = 12; /* 4kB */
 	} else {
 		dev_dbg(&dev->dev, "no supported direct page size in mask %x",
 			  query.page_size);
 		goto out_failed;
 	}
+
 	/* verify the window * number of ptes will map the partition */
 	/* check largest block * page size > max memory hotplug addr */
 	max_addr = ddw_memory_hotplug_max();
-- 
2.25.4

