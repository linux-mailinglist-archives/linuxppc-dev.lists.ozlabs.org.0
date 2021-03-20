Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97467342F81
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 21:26:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2sj845WBz2yy9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Mar 2021 07:26:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=B3AQK37g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=yashsri421@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=B3AQK37g; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2shk3Frxz2xZ1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Mar 2021 07:25:42 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so8398042pjh.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Mar 2021 13:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=vgEHWfJxSnMvNGltZK35bv4lE0nxYTmBjGCCpSZ2qwE=;
 b=B3AQK37gdKNg75CyXMf9iaXlGL9RQhcnBKwEe3Lieo2WwIYNmzGlinRadiAHCpxnc0
 sct6SsVizPmtD0Wz13XUBxHWj29/ihjOzNHPe4vJiFdv+PuZ9wfPxtoMwhHdVCGWAzVp
 ZSQfzus9F+FSLPgr9VCMTCJxxfOWtfmHHWSFicAV61A9v13xWEGqkYXMhlxOGF3l+jcj
 0dtIy+0LVKzVOzD7uBiQQvtz1hK6bEW3K2sBNtsa1cyQIrv2cAQDFgzdEnIFWfc67xoC
 p6PVv4It8kFPdjLMT2sk7c6yxlqJfZCBf5iH0iyF12uz8TEv82fw0JvSqY7bUq6bDFCP
 2sHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vgEHWfJxSnMvNGltZK35bv4lE0nxYTmBjGCCpSZ2qwE=;
 b=ltH2cNlhbHobSSC6FULou+9goj9JRjiaFO8B1y2NlQOgdVp9N10YJFTEnIVwfO/gEc
 OFeguHvkGkASz1TZ3vY2y7N+GRG3p46aKiBfFyjgETg7BerDuoSydtmustnYon5RqR0F
 EP9oAW7PgtejoeJ+DB+IeV5FsMPAi+2mEmBJBQdSVd5o+HzfoZKua7dmpuVqLjMMclij
 +HHv84lFN7CxUGjrivcarX6Rkn2Nk3gWV2ujj5XflB3b7thTvHMgMI38jVu2CXMMexXH
 QRoCQmnzaOqSyzviUMcWVxq5D1XmhsNxAkeOEvN5gs4CYw3CmBne4qZJFMlf/aGCKDgy
 NFYw==
X-Gm-Message-State: AOAM531/fz8VU0erVIhI/ZYrKQL/CANmpiHlOYKZ/MujfRT6vPhvbaAB
 1Y9rsNk911wo/fd87V97npk=
X-Google-Smtp-Source: ABdhPJxXOY21EFvd4PI13TZ0reKzvM6BOPt4J0kTB4D7tg4zVYP2zKz48Khz54lVG1zBdJH1yR0q5w==
X-Received: by 2002:a17:90a:b63:: with SMTP id
 90mr5085668pjq.124.1616271938959; 
 Sat, 20 Mar 2021 13:25:38 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:1ce8:18d9:6e3d:8c29])
 by smtp.googlemail.com with ESMTPSA id t1sm9252938pfc.173.2021.03.20.13.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 13:25:38 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: leitao@debian.org
Subject: [PATCH] crypto: vmx: fix incorrect kernel-doc comment syntax in files
Date: Sun, 21 Mar 2021 01:55:25 +0530
Message-Id: <20210320202525.12562-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: rdunlap@infradead.org, herbert@gondor.apana.org.au, corbet@lwn.net,
 nayna@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com, pfsmorigo@gmail.com,
 linux-crypto@vger.kernel.org, lukas.bulwahn@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net,
 paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
There are certain files in drivers/crypto/vmx, which follow this syntax,
but the content inside does not comply with kernel-doc.
Such lines were probably not meant for kernel-doc parsing, but are parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warnings from kernel-doc.

E.g., presence of kernel-doc like comment in the header line for
drivers/crypto/vmx/vmx.c causes this warning by kernel-doc:

"warning: expecting prototype for Routines supporting VMX instructions on the Power 8(). Prototype was for p8_init() instead"

Similarly for other files too.

Provide a simple fix by replacing such occurrences with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210319

 drivers/crypto/vmx/aes.c     | 2 +-
 drivers/crypto/vmx/aes_cbc.c | 2 +-
 drivers/crypto/vmx/aes_ctr.c | 2 +-
 drivers/crypto/vmx/aes_xts.c | 2 +-
 drivers/crypto/vmx/ghash.c   | 2 +-
 drivers/crypto/vmx/vmx.c     | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/vmx/aes.c b/drivers/crypto/vmx/aes.c
index d05c02baebcf..ec06189fbf99 100644
--- a/drivers/crypto/vmx/aes.c
+++ b/drivers/crypto/vmx/aes.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * AES routines supporting VMX instructions on the Power 8
  *
  * Copyright (C) 2015 International Business Machines Inc.
diff --git a/drivers/crypto/vmx/aes_cbc.c b/drivers/crypto/vmx/aes_cbc.c
index d88084447f1c..ed0debc7acb5 100644
--- a/drivers/crypto/vmx/aes_cbc.c
+++ b/drivers/crypto/vmx/aes_cbc.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * AES CBC routines supporting VMX instructions on the Power 8
  *
  * Copyright (C) 2015 International Business Machines Inc.
diff --git a/drivers/crypto/vmx/aes_ctr.c b/drivers/crypto/vmx/aes_ctr.c
index 79ba062ee1c1..9a3da8cd62f3 100644
--- a/drivers/crypto/vmx/aes_ctr.c
+++ b/drivers/crypto/vmx/aes_ctr.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * AES CTR routines supporting VMX instructions on the Power 8
  *
  * Copyright (C) 2015 International Business Machines Inc.
diff --git a/drivers/crypto/vmx/aes_xts.c b/drivers/crypto/vmx/aes_xts.c
index 9fee1b1532a4..dabbccb41550 100644
--- a/drivers/crypto/vmx/aes_xts.c
+++ b/drivers/crypto/vmx/aes_xts.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * AES XTS routines supporting VMX In-core instructions on Power 8
  *
  * Copyright (C) 2015 International Business Machines Inc.
diff --git a/drivers/crypto/vmx/ghash.c b/drivers/crypto/vmx/ghash.c
index 14807ac2e3b9..5bc5710a6de0 100644
--- a/drivers/crypto/vmx/ghash.c
+++ b/drivers/crypto/vmx/ghash.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * GHASH routines supporting VMX instructions on the Power 8
  *
  * Copyright (C) 2015, 2019 International Business Machines Inc.
diff --git a/drivers/crypto/vmx/vmx.c b/drivers/crypto/vmx/vmx.c
index a40d08e75fc0..7eb713cc87c8 100644
--- a/drivers/crypto/vmx/vmx.c
+++ b/drivers/crypto/vmx/vmx.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * Routines supporting VMX instructions on the Power 8
  *
  * Copyright (C) 2015 International Business Machines Inc.
-- 
2.17.1

