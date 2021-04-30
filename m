Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B172236FEB6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:36:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWygQ4YCJz3d95
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 02:36:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TN6LtF3T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TN6LtF3T; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWyZv2DP2z30Q8
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 02:32:38 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id f12so52038805qtf.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 09:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OiXGBYh6AS1+vJXONKdcYd62wJfq7GaysjOR/jycH2Q=;
 b=TN6LtF3Th4ycVIHgYe+3cJJ5SMJSRQY1Hbw219ZaRTEgz9f9UAqQooUSDndK23sBZ4
 E75o/7cqX14DfdeVWzPjC+mzXZGpkvDHKqYMYInaewBhIMUhqTYwO55b3Pv5sGy8P3Qr
 jrK3WvBBfisDFFS9OFxB4MPNWCs6XWzTC4Ct0iHH3PC6B5H0dH2PmsQwRgOrenRoYhCb
 zY8wI6HwIc2Ua7ukZSfzStkcavFAsbESeyIxbYbGcNkcLBUtZlc7dSyYfh1CW9H5ygSM
 zAj2V0IsPn6QMev111eJcs4/n1RcJq6WwR7hcBBByyL525byI2p5EaAMIFoM1G2+Xr+V
 v+ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OiXGBYh6AS1+vJXONKdcYd62wJfq7GaysjOR/jycH2Q=;
 b=V0wpBl+LD5z0s60RmnoE/oSw7V5/SnJVyZwa++uVUjtW3EtQop/4rV8z+VcztQr16I
 VhFKnza82GuJM58n8i73MPGFI0fuPHBQjXoMQ5AHZmQHtO6edC8nJJ1ST1NsaSX+cB32
 hrMGxB6E53nPsRmhbPwQAmP+GHU1IwBcy4RS+/nzmrlDoPJjluxp+fpyWb8F141IVJJA
 Xee3wYSD55tcpWTki78SR55nMM+lw5o5nPW6Cp52GvUsxfWmiWJLt1XdHiE2HlzIlH51
 38e1BQ9Xtfd4HUJp3shJCH/ITjWENVYbsX9gGXFm/hI7l/UtA17VK4Rj4UtkV6XtiU2i
 kcuA==
X-Gm-Message-State: AOAM532r10cgCUlDT0mqhCNe1HPxRv8sY7voVV9p0Hc6jN5ZPEHB6/f4
 +42gIpMaK3+wYyqger47dVs=
X-Google-Smtp-Source: ABdhPJzpMLibl6PMQhMsgv1f/vDJB0UrlvMRFvCJ7wpvliS1xYrO2p1k59nH7YaLFUjnf8ZtnUSqDQ==
X-Received: by 2002:ac8:584f:: with SMTP id h15mr5310682qth.97.1619800357053; 
 Fri, 30 Apr 2021 09:32:37 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 ([2804:14c:482:7b04::1001])
 by smtp.gmail.com with ESMTPSA id p1sm2624334qtu.89.2021.04.30.09.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 09:32:36 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [PATCH v4 09/11] powerpc/pseries/iommu: Find existing DDW with given
 property name
Date: Fri, 30 Apr 2021 13:31:44 -0300
Message-Id: <20210430163145.146984-10-leobras.c@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210430163145.146984-1-leobras.c@gmail.com>
References: <20210430163145.146984-1-leobras.c@gmail.com>
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

At the moment pseries stores information about created directly mapped
DDW window in DIRECT64_PROPNAME.

With the objective of implementing indirect DMA mapping with DDW, it's
necessary to have another propriety name to make sure kexec'ing into older
kernels does not break, as it would if we reuse DIRECT64_PROPNAME.

In order to have this, find_existing_ddw_windows() needs to be able to
look for different property names.

Extract find_existing_ddw_windows() into find_existing_ddw_windows_named()
and calls it with current property name.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index f8922fcf34b6..de54ddd9decd 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -888,24 +888,21 @@ static struct direct_window *ddw_list_new_entry(struct device_node *pdn,
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
 
@@ -913,6 +910,14 @@ static int find_existing_ddw_windows(void)
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
2.30.2

