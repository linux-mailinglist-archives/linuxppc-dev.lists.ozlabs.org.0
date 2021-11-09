Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AC444A70A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 07:50:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpJX00Wctz3c65
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 17:50:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZyGv0ZUs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZyGv0ZUs; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpJVc5pXwz2xT9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Nov 2021 17:49:12 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id j9so17624770pgh.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Nov 2021 22:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwjEIe+Gf+3o4osJ3dwN1EdaSbCxIxMUqGFygnWZHao=;
 b=ZyGv0ZUs7JCn0coRxa9D1W7wSNSj9xxpv51lWh5I+wnZE8NG6ejs8HU2yLLq/JcwHB
 61vpuoO4PH62pWTncqejDM5BNkTdHlZYMuhr0Y8SYvb4Bvf6oMp/nf45h/W4wgKAdh+/
 JdB20lCvBnnj8aqo1mZswjJYqEv3ElSZQ2oDGXBmX3EYTbDzYAY8D+/9VwVoffULmnw+
 eCwdx0SB/OrwWe12IBxAi+4g/kTiSe5xZWZnnd45n3DqkPPPY0QgKsXapDbN907p0GEs
 iYodvS87hoJ1B+wiHzWwSPqbgfubDXlHnIExN2A0+tr/u4v6IMBk1mOpcS3bh6ALrVuW
 A5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwjEIe+Gf+3o4osJ3dwN1EdaSbCxIxMUqGFygnWZHao=;
 b=m4/VBUu/Tdx2ksbm+TgSKbdtGPEnCWo5nvUGbYS2psKFLMDCZ2ufhJPimJJWBchhf+
 76NaXRqQU9O5Y3+b4WkojQXwDJtVdgmHIXdVIFKEW8IAKLRpAaUtMPPFL/DOHniE5K/N
 NskobF9nP1MWmsj3uqyIT07L1TAZjJyKYrADwWzf/qcCvAv8mmJnlp7SR6Dhwm4l8yyy
 6uqu0Ax91dk0SOvP81I0gmULPi+B/D6HWIM9qSEpqeopGJldcUKEBtDZ0HakJGWOO4tH
 mwkjPLAn6pn1LyWfaqVa5olhiInAdpR/i3/IGyNf4uVISFj1keiYkOqQka5cCvePMDoZ
 9V2A==
X-Gm-Message-State: AOAM531VVOlc3pIUfcNPowQqgEYukKwUjtPfir6bI9R2hd4GIsenz7/q
 943mmZ1pY1kWXic8fiRKOHWJK2Pnt1o=
X-Google-Smtp-Source: ABdhPJwYCb36RCWzH2f/og+09XlDLaCuoHcwqLFazUj1vsF3xa9ydWkNJ6ImNTa+Y8FX4tPwZRcdaQ==
X-Received: by 2002:a63:6b03:: with SMTP id g3mr4174676pgc.123.1636440550533; 
 Mon, 08 Nov 2021 22:49:10 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id
 17sm18227188pfp.14.2021.11.08.22.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 22:49:10 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc/pseries: Fix numa FORM2 parsing fallback code
Date: Tue,  9 Nov 2021 16:49:00 +1000
Message-Id: <20211109064900.2041386-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211109064900.2041386-1-npiggin@gmail.com>
References: <20211109064900.2041386-1-npiggin@gmail.com>
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

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Fixes: 1c6b5a7e7405 ("powerpc/pseries: Add support for FORM2 associativity")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---

This just rebases on the rename, and sets form2_distances pointer to
NULL rather than using a separate good variable.

Thanks,
Nick

 arch/powerpc/mm/numa.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 53e990140916..59d3cfcd7887 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -407,30 +407,26 @@ static void initialize_form2_numa_distance_lookup_table(void)
 
 	if (form2_distances_length != max_numa_index * max_numa_index) {
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
+		form2_distances = NULL; // don't use it
 	}
-
 	distance_index = 0;
 	for (i = 0;  i < max_numa_index; i++) {
 		for (j = 0; j < max_numa_index; j++) {
 			int nodeA = numa_id_index_table[i];
 			int nodeB = numa_id_index_table[j];
-
-			numa_distance_table[nodeA][nodeB] = form2_distances[distance_index++];
-			pr_debug("dist[%d][%d]=%d ", nodeA, nodeB, numa_distance_table[nodeA][nodeB]);
+			int dist;
+
+			if (form2_distances)
+				dist = form2_distances[distance_index++];
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

