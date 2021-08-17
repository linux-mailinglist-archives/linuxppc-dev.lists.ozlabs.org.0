Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD753EE6D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 08:46:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GphQW1wR1z3dKx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 16:46:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PBCP9KJc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::830;
 helo=mail-qt1-x830.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PBCP9KJc; dkim-atps=neutral
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GphHY75T3z309w
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 16:40:41 +1000 (AEST)
Received: by mail-qt1-x830.google.com with SMTP id l3so16304850qtk.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 23:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mLA7Zwi0SdMcNmft7yIFY9w3dhHjKJPMdMtlCDnEiwM=;
 b=PBCP9KJcms41RLP2tQkcatWTwHaP9hLCv6kYtOwG4y44m6+5TqA8VUiANkGUqCpagA
 iAdSkxysz6oIGSmbb5nfIRzby+VXX5Qf1E+CuoM/6Z3l1X2WLdHznUtfdRvBdY9id9Ha
 P2ApKg9e396YeLnT1ckYvyK1w86oROkhtsTp9lybNsJRqUqXM8fTsgsBNy5O0G3jZj9x
 2ZHBdbf8sKz06jfD65r+k7423Oiast0VPr5uVy17LLxc5jxcdp4M1klZ3AoA4o+SniQa
 dmFHQOM1+9LFFIGmpWJQWsE0S8blOZoSHgsyOhi3QnYSdKbngsz+IholLUU6CuOhPZj9
 oLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mLA7Zwi0SdMcNmft7yIFY9w3dhHjKJPMdMtlCDnEiwM=;
 b=CSjCf6FZxG8Q7nJOK9uSIlC2LnDItEzNiC//a8KZ3RHx+222gXQukKyxvMv2hYrrG/
 rLK8J2PIgYtyvw1Z3IEh1MCZyOT6kSJ0XvBUGYOoJbg9PGqtkmr/hMd4gzPfRuwCEJnP
 4yPED/TDWwqkqxTNG8iz3rgE4CXFtTRe5tDDzpOY9wQi6IPu0JlOtuvrCInSX+V5hj8B
 g+h+ODdrPp6cK0YIqnMCszbuxSPuu1+qCcLI4Hqkctw/xP7n5i5f0HiGj1BsBXmgH/9B
 e5yk9C81o832mJG2cKoSV1Q/aM5XIJS/RWpszypruMuRGv908mUP67GfK2OjxLUk1wU0
 GNRA==
X-Gm-Message-State: AOAM530TGI6a7P3vzJYRCzm8PFE7q2ifn1UDwf6lujRwCsR1ZwpuLivP
 fklV621/7iCm51SO3C5HiGk=
X-Google-Smtp-Source: ABdhPJz/uLTzhk1Vx1uNkU15dBx1GEr8Qjeijw1KJlMdTvRN/bfbcdHlu22MaCh85G6HLdpmuH8whw==
X-Received: by 2002:ac8:4f14:: with SMTP id b20mr1696524qte.236.1629182439455; 
 Mon, 16 Aug 2021 23:40:39 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:30b2:5c9e:50:88f3:269a])
 by smtp.gmail.com with ESMTPSA id c11sm526938qth.29.2021.08.16.23.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 23:40:39 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Nicolin Chen <nicoleotsuka@gmail.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH v6 09/11] powerpc/pseries/iommu: Find existing DDW with given
 property name
Date: Tue, 17 Aug 2021 03:39:27 -0300
Message-Id: <20210817063929.38701-10-leobras.c@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817063929.38701-1-leobras.c@gmail.com>
References: <20210817063929.38701-1-leobras.c@gmail.com>
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
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 901f290999d0..e11c00b2dc1e 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -910,24 +910,21 @@ static struct direct_window *ddw_list_new_entry(struct device_node *pdn,
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
 
@@ -935,6 +932,14 @@ static int find_existing_ddw_windows(void)
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
2.32.0

