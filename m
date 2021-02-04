Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA6E30F1F5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 12:23:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWbl85tGMzDws0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 22:23:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32d;
 helo=mail-wm1-x32d.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=t5B27kse; dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWbST424RzDwhW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 22:10:33 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id t142so586741wmt.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 03:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qhRaK7PEb1+VQbMXp2izacC8TWHkvWpyOp/JFxz8PSk=;
 b=t5B27kseFaSQ07V34VI0+HtMHwzq/iu5wofl4aAA12lmp4bvmT9K7iM/vMiDXIvfmp
 5gVTdvI880u0uezN8PA5uIEwySqb7up76wrmGmKbG1myjs2VLsWE41EmwhWLr4HqTC1N
 dSWu8oC3jxsrIUtMphZ3UnYweS/gT1cGYPQro/LAqTh8PfiMVie9VOuiCMMw/FCWcRVp
 KYrsbsjbMBWMfB4KzcX4FNY+xNmfKOi2vhUA9bUpdllUDvj/CfDlineW9XKQ3Y3VG35l
 XWS4BgTzWKinSO0ZTFANwZbF6Ha33pKPf9YaE8v6ow6eiLsU6AlkdjcQfU9JeHTSEMv0
 eGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qhRaK7PEb1+VQbMXp2izacC8TWHkvWpyOp/JFxz8PSk=;
 b=lNR2EO26mtUTJv2nmQubvOKkUzEDy1+PWyuar/wAk2ahkz5OCCGH4JS6q6X4F3vgE3
 OcIOCvoiPZlzH5v0mrqI/OLQj+fLdDNFt7awlcsmRprjNjoPuV9pnoP1WlNQ/e8KHsMP
 +OXs0wlX6K29ZzgJ1wuEDnjTAGg5XOOzsWUq0T2dgRNvnPXa4F1uiLPjF3IOv2IVVVeO
 IWMpJkuIlUBnjWk4ePWNYs9XS6WwfbZ311w2q1wybjMD8HuYuHUeyVgy+xovaBJuuAjg
 lLARXvUcev2mKtYtTyuRqj0xrAqfHcF2+o9pJjabKI9hZvDDAvyHiiumTs91iRMesIvF
 9ihw==
X-Gm-Message-State: AOAM532bzferfY+bABkPTepiLvVNQBi3cFJo2KPa8YATz/cqTJYuYcJO
 JZ7HjPhSfVl9FUfBa1fJ+W+KNw==
X-Google-Smtp-Source: ABdhPJy3ovJmVWJwfdQ/ifr6A3rN/+QEp57dStSFcBGixXRzwdnUgrj5/e3P+zqOCrmcKmI+TdyFRA==
X-Received: by 2002:a1c:6688:: with SMTP id a130mr6944242wmc.1.1612437025976; 
 Thu, 04 Feb 2021 03:10:25 -0800 (PST)
Received: from dell.default ([91.110.221.188])
 by smtp.gmail.com with ESMTPSA id y18sm7696218wrt.19.2021.02.04.03.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 03:10:25 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 19/20] crypto: nx: Demote header comment and add description
 for 'nbytes'
Date: Thu,  4 Feb 2021 11:09:59 +0000
Message-Id: <20210204111000.2800436-20-lee.jones@linaro.org>
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

 drivers/crypto/nx/nx.c:31: warning: Incorrect use of kernel-doc format:  * nx_hcall_sync - make an H_COP_OP hcall for the passed in op structure
 drivers/crypto/nx/nx.c:43: warning: Function parameter or member 'nx_ctx' not described in 'nx_hcall_sync'
 drivers/crypto/nx/nx.c:43: warning: Function parameter or member 'op' not described in 'nx_hcall_sync'
 drivers/crypto/nx/nx.c:43: warning: Function parameter or member 'may_sleep' not described in 'nx_hcall_sync'
 drivers/crypto/nx/nx.c:43: warning: expecting prototype for Nest Accelerators driver(). Prototype was for nx_hcall_sync() instead
 drivers/crypto/nx/nx.c:209: warning: Function parameter or member 'nbytes' not described in 'trim_sg_list'

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
 drivers/crypto/nx/nx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/nx/nx.c b/drivers/crypto/nx/nx.c
index 0d2dc5be7f192..010be6793c9fc 100644
--- a/drivers/crypto/nx/nx.c
+++ b/drivers/crypto/nx/nx.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * Routines supporting the Power 7+ Nest Accelerators driver
  *
  * Copyright (C) 2011-2012 International Business Machines Inc.
@@ -200,7 +200,8 @@ struct nx_sg *nx_walk_and_build(struct nx_sg       *nx_dst,
  * @sg: sg list head
  * @end: sg lisg end
  * @delta:  is the amount we need to crop in order to bound the list.
- *
+ * @nbytes: length of data in the scatterlists or data length - whichever
+ *          is greater.
  */
 static long int trim_sg_list(struct nx_sg *sg,
 			     struct nx_sg *end,
-- 
2.25.1

