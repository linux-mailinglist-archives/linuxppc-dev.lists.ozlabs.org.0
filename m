Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E23630F254
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 12:36:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWc2J2mwJzDwsl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 22:36:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32a;
 helo=mail-wm1-x32a.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pwnuFV93; dkim-atps=neutral
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWbSS1ZjzzDwhM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 22:10:31 +1100 (AEDT)
Received: by mail-wm1-x32a.google.com with SMTP id a16so5715486wmm.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 03:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3IEsVjEj58gpnbEtzruF6QIgBE7zuGLR+EproOK/53M=;
 b=pwnuFV934+1NBMnFc5tehmnUsznGHtEqWZhqeblMxHAXEAiQO6GdBjD9HxbnteJQcr
 685CCA/s/RxaZFiIYu0DrIFt0EcTLzuxK77dJBvb+mRTMK3sUOvkv9but9M6CN43Z2J1
 I7oJqVe5vMwwwgDcI5hJhNzeX6RutJNg35WaQCJ9FcrtDIAUFz3JXOjcPProru5uu5UK
 0zOkNV8vIv+vwRwAD//KlfbPZStVsvZTPQNg5fIw5RhfnWevY5A4EH/gLo7FTAROjK+4
 9ff74FS33cbCNPcvFgudhYPqg/Pq5qkF0Xg1xI2vN8P+tsvv96rzaDvzdNQsrA/CTTqj
 CwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3IEsVjEj58gpnbEtzruF6QIgBE7zuGLR+EproOK/53M=;
 b=X6Af7bF4W+9EV0AWBN2jm3tkgx3RDKQ62tbYkEiIox6eI0OgjG+FW3aOFIWKPd7Cmp
 Ap7dXd4/qU7ofOy1tGQzgNmH3JyVTalHZLhZpv4yvrPpwBhl3WFLs2u+OThAuxLyzrNa
 fae6w4g4VxxV83txFXlrWmwP2R22pbj3JjB4KQ59xB69WBPOngEtV8Y4ylfTdvy9ny+i
 0NPfHD4qo75X1LO2bvDzXBHIJNz/res/ieaGvv/44N7PAWca0uHweIEIwt7XqD1Jn93+
 /XjDfO6KkT9PeSmOz88waz/Hp7/BPfdX9Kyojpfhg3sCibsDqjBDbjKZuGtlpptMZi1k
 BxUw==
X-Gm-Message-State: AOAM530dfJGjc0Hi+N4SCL8TiMxQbNhPg7W9C+ilvOGXlNcYcqtcjlGX
 +7/RkETsM82LlhL+9p8w0QLg1w==
X-Google-Smtp-Source: ABdhPJwzTr8uy4M0IvB8VO2hwiH8qyYaC4erJaP/nR/itMDq7tvkpIn8Do6atM7jT0LKBKilP1cAUQ==
X-Received: by 2002:a1c:f70f:: with SMTP id v15mr6821758wmh.38.1612437024780; 
 Thu, 04 Feb 2021 03:10:24 -0800 (PST)
Received: from dell.default ([91.110.221.188])
 by smtp.gmail.com with ESMTPSA id y18sm7696218wrt.19.2021.02.04.03.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 03:10:24 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 18/20] crypto: nx: nx_debugfs: Header comments should not be
 kernel-doc
Date: Thu,  4 Feb 2021 11:09:58 +0000
Message-Id: <20210204111000.2800436-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204111000.2800436-1-lee.jones@linaro.org>
References: <20210204111000.2800436-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Kent Yoder <yoder1@us.ibm.com>,
 Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, linux-crypto@vger.kernel.org,
 =?UTF-8?q?Breno=20Leit=C3=A3o?= <leitao@debian.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following W=1 kernel build warning(s):

 drivers/crypto/nx/nx_debugfs.c:34: warning: Function parameter or member 'drv' not described in 'nx_debugfs_init'
 drivers/crypto/nx/nx_debugfs.c:34: warning: expecting prototype for Nest Accelerators driver(). Prototype was for nx_debugfs_init() instead

Cc: "Breno Leitão" <leitao@debian.org>
Cc: Nayna Jain <nayna@linux.ibm.com>
Cc: Paulo Flabiano Smorigo <pfsmorigo@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Kent Yoder <yoder1@us.ibm.com>
Cc: linux-crypto@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/crypto/nx/nx_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/nx/nx_debugfs.c b/drivers/crypto/nx/nx_debugfs.c
index 1975bcbee9974..ee7cd88bb10a7 100644
--- a/drivers/crypto/nx/nx_debugfs.c
+++ b/drivers/crypto/nx/nx_debugfs.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * debugfs routines supporting the Power 7+ Nest Accelerators driver
  *
  * Copyright (C) 2011-2012 International Business Machines Inc.
-- 
2.25.1

