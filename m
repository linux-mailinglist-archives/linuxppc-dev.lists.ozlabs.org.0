Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BA9446424
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 14:29:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hm1Zs42gKz3bnC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 00:29:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JZhklTR2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JZhklTR2; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hm1Z81fmKz2yb3
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Nov 2021 00:29:17 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id np3so3073091pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Nov 2021 06:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tkzd+bIqTU/2ckKL+WwS9XY/phC337MT6nzd1eNVJkE=;
 b=JZhklTR21HQDd9UkS8zFXgrv8FTi4Wm9xpqn/3mGqoX3z0Sf1EgOyYatqi4vZBaoLs
 10Oy7QZ1zSlOFQw539uOz87fb3uTnHrQA9KARRX3C9BjV+sbH7KVRnicjRanIR4CJL22
 0pziPEDmMTGULpP1+7p6D9FgrF66vBgvxkv6GT9odO0bA6fJeFgNWhktf0RV2NyfG6rK
 fFD2+xO880J6XjfTUbrpg02MfCdr/y9+toJxr92m6Wg8Yf8QSrZg6/5SqxbLlwqdVWoO
 iXeeDuci83D1Sc0UFyVzrT+HemTND1U39RCZdh1BA5xBp0i7iPy/sc35SJw5yjPjONJ3
 LucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tkzd+bIqTU/2ckKL+WwS9XY/phC337MT6nzd1eNVJkE=;
 b=KqPgbjoPoCKs8FxK37RbfoH+I8DOOKOfJclNevdT4ZgzktnWSUI7PS/NZJba6r8e2C
 KeamuVhv3/NlyicAtaastuYN//9D26f3TjeYCp6Qj3HI4Rn+83ilUCV+XwGtTI1lJcYP
 OX2BX1iKiuOgNtSdlCkXfy7f0tRRwd9IC2l9lS7gBvozwqV3d7azkMuQSg11y/RD2OCz
 g3OdTZbOLBRLeHbaJCax7hxDzYDZhMsjRPeiC/Bg6spROfd3xN8cekUK5nAXE6y3k0pn
 w7od3g1h6h2N/dJJyv2XI8gfbz+JywNPL61R7qHDWDdUuy0nr6/dpXbAll5PEFwdoBZU
 jREQ==
X-Gm-Message-State: AOAM533XOPL2h2j83V9NpcW/Hs/CwldWYQwT/mBp4Ev5zFiK9Zskl+I+
 yjqNv0aM0+YB4wcimi1UozWNilWk4zM=
X-Google-Smtp-Source: ABdhPJzgThvy7ocqHcgD/b/BFf0sl2ytvkvlg5lb1WEB/ASM0hOWKybrRS73zTRlnZw+e0ENPeqgbA==
X-Received: by 2002:a17:903:234b:b0:141:bdfa:e9be with SMTP id
 c11-20020a170903234b00b00141bdfae9bemr41553487plh.36.1636118955534; 
 Fri, 05 Nov 2021 06:29:15 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id
 v1sm7898456pfu.208.2021.11.05.06.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 06:29:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries: Fix numa FORM2 parsing fallback code
Date: Fri,  5 Nov 2021 23:29:09 +1000
Message-Id: <20211105132909.1582449-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In case the FORM2 distance table from firmware is not the expected size,
there is fallback code that just populates the lookup table as local vs
remote.

However it then continues on to use the distance table. Fix.

Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Fixes: 1c6b5a7e7405 ("powerpc/pseries: Add support for FORM2 associativity")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/numa.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 6f14c8fb6359..0789cde7f658 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -380,6 +380,7 @@ static void initialize_form2_numa_distance_lookup_table(void)
 	const __be32 *numa_lookup_index;
 	int numa_dist_table_length;
 	int max_numa_index, distance_index;
+	bool good = true;
 
 	if (firmware_has_feature(FW_FEATURE_OPAL))
 		root = of_find_node_by_path("/ibm,opal");
@@ -407,30 +408,26 @@ static void initialize_form2_numa_distance_lookup_table(void)
 
 	if (numa_dist_table_length != max_numa_index * max_numa_index) {
 		WARN(1, "Wrong NUMA distance information\n");
-		/* consider everybody else just remote. */
-		for (i = 0;  i < max_numa_index; i++) {
-			for (j = 0; j < max_numa_index; j++) {
-				int nodeA = numa_id_index_table[i];
-				int nodeB = numa_id_index_table[j];
-
-				if (nodeA == nodeB)
-					numa_distance_table[nodeA][nodeB] = LOCAL_DISTANCE;
-				else
-					numa_distance_table[nodeA][nodeB] = REMOTE_DISTANCE;
-			}
-		}
+		good = false;
 	}
-
 	distance_index = 0;
 	for (i = 0;  i < max_numa_index; i++) {
 		for (j = 0; j < max_numa_index; j++) {
 			int nodeA = numa_id_index_table[i];
 			int nodeB = numa_id_index_table[j];
-
-			numa_distance_table[nodeA][nodeB] = numa_dist_table[distance_index++];
-			pr_debug("dist[%d][%d]=%d ", nodeA, nodeB, numa_distance_table[nodeA][nodeB]);
+			int dist;
+
+			if (good)
+				dist = numa_dist_table[distance_index++];
+			else if (nodeA == nodeB)
+				dist = LOCAL_DISTANCE;
+			else
+				dist = REMOTE_DISTANCE;
+			numa_distance_table[nodeA][nodeB] = dist;
+			pr_debug("dist[%d][%d]=%d ", nodeA, nodeB, dist);
 		}
 	}
+
 	of_node_put(root);
 }
 
-- 
2.23.0

