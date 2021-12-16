Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D29477FF0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 23:14:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFRHF72sJz3cYY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 09:14:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bmdTDDz1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::731;
 helo=mail-qk1-x731.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bmdTDDz1; dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFQzp2nhRz3cPF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 09:01:10 +1100 (AEDT)
Received: by mail-qk1-x731.google.com with SMTP id 193so315528qkh.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 14:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4zFYmKS48E59GjuSX+VbB4jaKc3MMByoUQ53zxoDAWE=;
 b=bmdTDDz1EaY8szYl1bTG6mUCLIr5H3+elqN/nHWMl9qLQ+RNm3gPZC6EaTAn592Uws
 qE8DRyjQpu1O+DzKmhNSU9JKjb2J9zNPriF9o3C4KJnuecRDVYLqavDhoUyzFik4YZco
 Q0iQ2pWXH7j9pPI9W/vcS9zRC+eDZiIvAfOI0DJXszhQDq1UcEeei6alzg2QcwGLxFUL
 NZsQU9WwLkWSCmxgtmcYLdCw6W0XXsEtO8c+EXBPv96KD+9qmfuAVBqRK10O62baQNQ1
 h3lPiA5uqaBXxWviHYcc92/oUkd+ps+r324LQgRH+tVfUjl1VB9wmn1pyWIfOKW4eQHx
 B84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4zFYmKS48E59GjuSX+VbB4jaKc3MMByoUQ53zxoDAWE=;
 b=MmYlefuEjbAHpPqrKDlxrbA49Xm//zOO585bA8rDZS/5GVcY1YP4Xyl4pKA8t8c1jp
 iEYGcR6SVXtLANk65v54m/iAms6ufoCSG63DTAuDU37rF7eCl58f9bcxuNO9HyD/DYDO
 QNF980vdNZrJDP3Ttv/p2ri3V4ay0iOjlMRA+mm1EMY24JLrzTUf0fXLCNqnMY51QQt8
 UnBSXkTGReoAmlnFrTg9+a3zQwu+CWVf0gZ10jR1BybHbTFtzwqllXcVanOdIo9osZ3I
 MT0LlkS8ToFr5Z9eFFYs/Rju0FNJzVHX3PEIwWKtsv16n08GyGYc/oYBcGhDK/z5pUXX
 rBIg==
X-Gm-Message-State: AOAM5310+nCykDW4pVK4/hmDQuAe5WF6qRf8jo0r9m1Cye+l5jCLDuQb
 Z5VxJ3zMj1DlUbyszBuULHwUA3WtctQ=
X-Google-Smtp-Source: ABdhPJyZCMA/kcSxEIP1wHXN726LgCCP3DFOSGCPxRqcftaUvrWHRFtEYm8WLCFaGu3yNx1O+quINA==
X-Received: by 2002:a05:620a:20d6:: with SMTP id
 f22mr71119qka.342.1639692067931; 
 Thu, 16 Dec 2021 14:01:07 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:dce6:135:603d:e519])
 by smtp.gmail.com with ESMTPSA id y21sm5478483qtw.10.2021.12.16.14.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:01:07 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 20/20] cuda/pmu: Make find_via_cuda/pmu init functions
Date: Thu, 16 Dec 2021 17:00:35 -0500
Message-Id: <20211216220035.605465-21-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216220035.605465-1-nick.child@ibm.com>
References: <20211216220035.605465-1-nick.child@ibm.com>
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make `find_via_cuda` and `find_via_pmu` initialization functions.
Previously, their definitions in `drivers/macintosh/via-cuda.h` include
the `__init` attribute but their alternative definitions in
`arch/powerpc/powermac/sectup./c` and prototypes in `include/linux/
cuda.h` and `include/linux/pmu.h` do not use the `__init` macro. Since,
only initialization functions call `find_via_cuda` and `find_via_pmu`
it is safe to label these functions with `__init`.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/platforms/powermac/setup.c | 4 ++--
 include/linux/cuda.h                    | 2 +-
 include/linux/pmu.h                     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index f7661b81db18..974d4b49867b 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -166,7 +166,7 @@ static void pmac_show_cpuinfo(struct seq_file *m)
 }
 
 #ifndef CONFIG_ADB_CUDA
-int find_via_cuda(void)
+int __init find_via_cuda(void)
 {
 	struct device_node *dn = of_find_node_by_name(NULL, "via-cuda");
 
@@ -180,7 +180,7 @@ int find_via_cuda(void)
 #endif
 
 #ifndef CONFIG_ADB_PMU
-int find_via_pmu(void)
+int __init find_via_pmu(void)
 {
 	struct device_node *dn = of_find_node_by_name(NULL, "via-pmu");
 
diff --git a/include/linux/cuda.h b/include/linux/cuda.h
index 45bfe9d61271..daf3e6f98444 100644
--- a/include/linux/cuda.h
+++ b/include/linux/cuda.h
@@ -12,7 +12,7 @@
 #include <uapi/linux/cuda.h>
 
 
-extern int find_via_cuda(void);
+extern int __init find_via_cuda(void);
 extern int cuda_request(struct adb_request *req,
 			void (*done)(struct adb_request *), int nbytes, ...);
 extern void cuda_poll(void);
diff --git a/include/linux/pmu.h b/include/linux/pmu.h
index 52453a24a24f..c677442d007c 100644
--- a/include/linux/pmu.h
+++ b/include/linux/pmu.h
@@ -13,7 +13,7 @@
 #include <uapi/linux/pmu.h>
 
 
-extern int find_via_pmu(void);
+extern int __init find_via_pmu(void);
 
 extern int pmu_request(struct adb_request *req,
 		void (*done)(struct adb_request *), int nbytes, ...);
-- 
2.25.1

