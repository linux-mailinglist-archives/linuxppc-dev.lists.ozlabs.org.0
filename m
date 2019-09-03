Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6CFA767B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 23:48:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NLD44NmvzDqpM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 07:48:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="I71crMcs"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NL7v5KRxzDqVT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 07:44:27 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id bd8so2210148plb.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 14:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pyrn+TuqDwSTTQ+EHQ8Cby3wlz6YBVisGZIc3udip+Q=;
 b=I71crMcsQBm+d9YfMSapo2x0qldgqXhBDcZA0uuzFr0ZGvXWSfAG8k064oVYr0BSlW
 kw5tOQE3d7IxnmPyAA34s2JVMb2dI09dlsC+xScLwQvlNZmewiMujGJhm/MJhtHn7Bu/
 rz2/YaI0KNF1k5dXJmexd7Kuq589dy1SR6PF0oKXyb5MGEGKDTrL0j/wY9D1WwHOQb/L
 qpdcFrC7923DV15FGWpHFuYDu9QmXfvvgjtG1X8iRAodDIhnbLnM4ebyAD7PIpEH4xga
 GTcVG7o6ptYqzu0Zrof2xxIEMmP0l8KKU26ZmX1ci8W0dDlaFTk2ShknU9mCR9k8zb/m
 IgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pyrn+TuqDwSTTQ+EHQ8Cby3wlz6YBVisGZIc3udip+Q=;
 b=JZVyTQVLB+CkbIsW7qYjzrf4IpUu4cWLCMDVGNhWvdKN1ZSi8jD6GHOggNtYUSWK3i
 15gLKJA/x+7LWaynI5Hrr46Mj0juk9H/XwVbsfJCICXFeg8/14TeB39R4oQ4U3TGxyIw
 7NusA9/4Njns3MwBT78SDuwc54p3IXjdBE4XQLfysx7UXPklHVtd5uDeFO5MPdqOE4WW
 yVAS2qqfhwIta1J8sSRM1SfNNlVKeS1kbDTEt24JvbePCq2TPZBJUnua19N/HnBgKGXJ
 xz0Aodws5c7GyfmDS8C6r9Xi6k0sSXcyxjyWzJDGDbaWch5JKg32ytAHaNY+HVzA/KAP
 6kHg==
X-Gm-Message-State: APjAAAXSnLINjFM3odLM5PqG0zAksdPiOmBLxCCFFFX2kl0jtyQZL71m
 3IbTjflJQvoz1Hss61/6yHCOwidsZ7Q=
X-Google-Smtp-Source: APXvYqx9t8Evz57Bc4A3OcxvNBfLAa6EHMeMXlyLgcQAsGfIYCFbUow1WSnqAOeuUXz9Dyypv5hWOQ==
X-Received: by 2002:a17:902:c9:: with SMTP id
 a67mr30831830pla.178.1567547062268; 
 Tue, 03 Sep 2019 14:44:22 -0700 (PDT)
Received: from santosiv.in.ibm.com.com ([49.207.60.65])
 by smtp.gmail.com with ESMTPSA id t6sm487970pjy.18.2019.09.03.14.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 14:44:21 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/2] powerpc/memcpy: Fix stack corruption for smaller sizes
Date: Wed,  4 Sep 2019 03:13:58 +0530
Message-Id: <20190903214359.23887-1-santosh@fossix.org>
X-Mailer: git-send-email 2.21.0
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For sizes lesser than 128 bytes, the code branches out early without saving
the stack frame, which when restored later drops frame of the caller.

Tested-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
---
 arch/powerpc/lib/memcpy_mcsafe_64.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/memcpy_mcsafe_64.S b/arch/powerpc/lib/memcpy_mcsafe_64.S
index 949976dc115d..cb882d9a6d8a 100644
--- a/arch/powerpc/lib/memcpy_mcsafe_64.S
+++ b/arch/powerpc/lib/memcpy_mcsafe_64.S
@@ -84,7 +84,6 @@ err1;	stw	r0,0(r3)
 
 3:	sub	r5,r5,r6
 	cmpldi	r5,128
-	blt	5f
 
 	mflr	r0
 	stdu	r1,-STACKFRAMESIZE(r1)
@@ -99,6 +98,7 @@ err1;	stw	r0,0(r3)
 	std	r22,STK_REG(R22)(r1)
 	std	r0,STACKFRAMESIZE+16(r1)
 
+	blt	5f
 	srdi	r6,r5,7
 	mtctr	r6
 
-- 
2.21.0

