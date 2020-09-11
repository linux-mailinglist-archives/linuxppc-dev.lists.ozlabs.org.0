Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEA6266773
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 19:43:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp35P15hZzDrJC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 03:43:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BfiMJGcd; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp2Pm0GnDzDqsG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 03:12:44 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id w12so10580919qki.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 10:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dLAY9t06d7mexjNgwyb5rIsLVQhZMwHpsMnK5tqPVmk=;
 b=BfiMJGcdgAnrTt5eGRM9nUztGzF4a6BT4+N+zJkLCClklkeit9fG1GM54xSt84kfJ6
 6pzop5jYDVfO6Sx4u7W1JDHVQkdtJ6KcDz5piJb8awlBLsAkufBCwlKDDfVF7eThbfgJ
 YGfx67dLNG2iLyD+9i4gJWCOKSun3XrtgqH3kCoqaAltUxZWXnkk7R8VcRUeuo9/MVZh
 qdxIN7Y9I4UxGNZn/G4E8puaZLTwMqWfvoW1JPF2nRYhKIQ2c9j/WVNl/q0M6iHCpci3
 eVLj7qD8bWpshARKjpebJ5OnG/EZ1385bGJvWsCkVg/lzg/GDa0Qq/c0ywqYdOHqt7EI
 Z1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dLAY9t06d7mexjNgwyb5rIsLVQhZMwHpsMnK5tqPVmk=;
 b=btUr3q4SsNw7VX24D601FWuoZKQtlxI/x9AaVZlgRFZXWqGnTdwCATCGJP6wFiH4rw
 3lXcdXRFl++WHpnzcEEx1MMbA826eYVa+ngzqZdMHWoYnY0UhiX97iI9mPQ5WbF1VdZt
 +IMAhyofrhMDqkA4GxmYYYsVjVkMqTJ6AagPitet2UwMTNXf32zITvbHJruEF5O9+/S4
 byZCnhvN56TL93Xq9Inz+83Mdu8Lpt+OLU7HvZHcKsOQ6mVaCY8Fhx/rMVKtlHhmK2jc
 bxZrFDOXjaqLM4dzdIEygzNEz/s15UNLJnAzN0ZPY4zbiRKIMhtsOS38TqXneE+8hFin
 6zGQ==
X-Gm-Message-State: AOAM530hM2wNPE/G9/J52SEn/yJl/06F/Qq/11U5LoOgpKu2bNl5wlrs
 rfafOMre67EcCjkxWUithEc=
X-Google-Smtp-Source: ABdhPJy1uPsaegDofIoLe2sUngEvh4qYT5P55nuscq8TVZDY84EcLUTNM20C8hpBRbN+0pZoSR+2bA==
X-Received: by 2002:a37:61d8:: with SMTP id v207mr2324596qkb.49.1599844361384; 
 Fri, 11 Sep 2020 10:12:41 -0700 (PDT)
Received: from LeoBras.ibmuc.com (179-125-254-96.dynamic.desktop.com.br.
 [179.125.254.96])
 by smtp.gmail.com with ESMTPSA id l5sm3533330qtc.28.2020.09.11.10.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 10:12:40 -0700 (PDT)
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
Subject: [PATCH v2 12/14] powerpc/pseries/iommu: Find existing DDW with given
 property name
Date: Fri, 11 Sep 2020 14:07:37 -0300
Message-Id: <20200911170738.82818-13-leobras.c@gmail.com>
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

Extract find_existing_ddw_windows() into find_existing_ddw_windows_named()
and calls it with current property name.

This will allow more property names to be checked in
find_existing_ddw_windows(), enabling the creation of new property names,
like the one that will be used for indirect mapping.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index f6a65ecd1db5..9b7c03652e72 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -882,24 +882,21 @@ static struct direct_window *ddw_list_new_entry(struct device_node *pdn,
 	return window;
 }
 
-static int find_existing_ddw_windows(void)
+static void find_existing_ddw_windows_named(const char *name)
 {
 	int len;
 	struct device_node *pdn;
 	struct direct_window *window;
-	const struct dynamic_dma_window_prop *direct64;
-
-	if (!firmware_has_feature(FW_FEATURE_LPAR))
-		return 0;
+	const struct dynamic_dma_window_prop *dma64;
 
-	for_each_node_with_property(pdn, DIRECT64_PROPNAME) {
-		direct64 = of_get_property(pdn, DIRECT64_PROPNAME, &len);
-		if (!direct64 || len < sizeof(*direct64)) {
-			remove_ddw(pdn, true, DIRECT64_PROPNAME);
+	for_each_node_with_property(pdn, name) {
+		dma64 = of_get_property(pdn, name, &len);
+		if (!dma64 || len < sizeof(*dma64)) {
+			remove_ddw(pdn, true, name);
 			continue;
 		}
 
-		window = ddw_list_new_entry(pdn, direct64);
+		window = ddw_list_new_entry(pdn, dma64);
 		if (!window)
 			break;
 
@@ -907,6 +904,14 @@ static int find_existing_ddw_windows(void)
 		list_add(&window->list, &direct_window_list);
 		spin_unlock(&direct_window_list_lock);
 	}
+}
+
+static int find_existing_ddw_windows(void)
+{
+	if (!firmware_has_feature(FW_FEATURE_LPAR))
+		return 0;
+
+	find_existing_ddw_windows_named(DIRECT64_PROPNAME);
 
 	return 0;
 }
-- 
2.25.4

