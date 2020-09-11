Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D429266651
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 19:25:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp2hn6DzZzDrT2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 03:25:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JSbHpYZ6; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp2PJ1mdkzDqsm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 03:12:20 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id r8so8380200qtp.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 10:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rrJIy3s8Dj5W6grm748dMP5BaFvp2VfY9RbjJCN5JNQ=;
 b=JSbHpYZ6aGFfB5qtgsbE6b9tuSxaqx5pZmP1mylTGdA4zHa3va4n+5swdUM7Ane4MZ
 fQMsH+WiV55N7PekpvpobN0kvQeK6EUOapQeXC3JY3nBrl4IrblMbTq/0tAYjslxLzlF
 b4sdFcf80+w090sjcmwX6bCl0MPJmrD7roYusBFrp30BgTWTu8tf33djtbg3c4dPXO0r
 WITYZAKI+CPzpfOiCm5aKCwIlxSxv9+pakH93fuFLkDp0GKO7YWVtVaPBxKSKG5j+Y6S
 AnIw26groEqw65Uc4G009UpzgaVCD+JbHOFnmq+ZJbSmft32CjlitiSDLYcI3PWIbTj5
 OalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rrJIy3s8Dj5W6grm748dMP5BaFvp2VfY9RbjJCN5JNQ=;
 b=YpDdYJy+7GYh/IghhAh76DGYwCseYmnVtOlysQS/RIsepmU9vN5Bn5LG921GCH+Myj
 K2Lr9BR3G5uRpI2U/WLmSFnNfjg8FS3xdyxp+N0XQZU9kPD5RyNVQrOWNvrW9IZW+/Nw
 InGxE0NBWhvkrlD+IQrs/IsjG3SvGhyODVyniNLaBxbvoBZ/azKU+KL/cer5XBdC06MT
 HvMT+b4uy6IBv5JPC+li7nnZdRHxx41e9nWzbSw533WjUCKMbCZfN0HKAu7tKUhgfxjs
 AvK8ZJdCgXeJzgsCSg/7kw6cBt1bhGkSMMW980TBx5VTw8iv6tLWE3wiH/7krDMPzUFU
 e1kw==
X-Gm-Message-State: AOAM5329Ww0Lx8ZtlGbUruxjf0Hty1yB41q4bM7QNevXNhQ1AL8di7r5
 grgxFh45Ler1tv9QQMkjwdE=
X-Google-Smtp-Source: ABdhPJx1wm88CzJeDsnRYzK7YOz18O1d4mV9f9aMpNiINJVrK8dwVceGRN5n4FB/qjymrLCmXHD5lw==
X-Received: by 2002:aed:310e:: with SMTP id 14mr2950608qtg.122.1599844337342; 
 Fri, 11 Sep 2020 10:12:17 -0700 (PDT)
Received: from LeoBras.ibmuc.com (179-125-254-96.dynamic.desktop.com.br.
 [179.125.254.96])
 by smtp.gmail.com with ESMTPSA id l5sm3533330qtc.28.2020.09.11.10.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 10:12:16 -0700 (PDT)
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
Subject: [PATCH v2 06/14] powerpc/pseries/iommu: Add
 iommu_pseries_alloc_table() helper
Date: Fri, 11 Sep 2020 14:07:31 -0300
Message-Id: <20200911170738.82818-7-leobras.c@gmail.com>
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

Creates a helper to allow allocating a new iommu_table without the need
to reallocate the iommu_group.

This will be helpful for replacing the iommu_table for the new DMA window,
after we remove the old one with iommu_tce_table_put().

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/platforms/pseries/iommu.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 4eff3a6a441e..49008d2e217d 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -53,28 +53,31 @@ enum {
 	DDW_EXT_QUERY_OUT_SIZE = 2
 };
 
-static struct iommu_table_group *iommu_pseries_alloc_group(int node)
+static struct iommu_table *iommu_pseries_alloc_table(int node)
 {
-	struct iommu_table_group *table_group;
 	struct iommu_table *tbl;
 
-	table_group = kzalloc_node(sizeof(struct iommu_table_group), GFP_KERNEL,
-			   node);
-	if (!table_group)
-		return NULL;
-
 	tbl = kzalloc_node(sizeof(struct iommu_table), GFP_KERNEL, node);
 	if (!tbl)
-		goto free_group;
+		return NULL;
 
 	INIT_LIST_HEAD_RCU(&tbl->it_group_list);
 	kref_init(&tbl->it_kref);
+	return tbl;
+}
 
-	table_group->tables[0] = tbl;
+static struct iommu_table_group *iommu_pseries_alloc_group(int node)
+{
+	struct iommu_table_group *table_group;
+
+	table_group = kzalloc_node(sizeof(*table_group), GFP_KERNEL, node);
+	if (!table_group)
+		return NULL;
 
-	return table_group;
+	table_group->tables[0] = iommu_pseries_alloc_table(node);
+	if (table_group->tables[0])
+		return table_group;
 
-free_group:
 	kfree(table_group);
 	return NULL;
 }
-- 
2.25.4

