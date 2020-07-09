Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 830652198EE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 08:58:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2RpY63q8zDqyb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 16:58:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SIK7xtQ1; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2Rmr5FBszDqHH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 16:56:58 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id f139so672812wmf.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jul 2020 23:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Wcz1X2aMI4wLAwmC/YcHtbFjsUgNxZUhx2oTPKovSdI=;
 b=SIK7xtQ1ZwjCMbOJj8SaWAbOcjJjQxj/PLiDND12LcX+IT6pg5CKd5VSce06Esth1C
 tjZAcMGJP7lgp0MW+RSgIN6cfTi3ndq8AxGnl6OkEUImbPGMbxPD79cQ7Nms8/XBRI8m
 DiBujo29jQgV1djDLijkwqi4n2NCN8N/cx39JyMxcCyjekM3316o7vX7647QSVQQXITh
 gQoElcghul+GRYV26uHkUU8Q8zAwKOgiyWE348Rc6E3/9E6aJAJWKPW1X6v96eOklZnA
 hEpQvye4SxWYDUo1OCfnMJ8Q0Gk1C5gO6qc9BFnbGsMSaZlmVBguT14spVCZq3355Ycb
 st3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Wcz1X2aMI4wLAwmC/YcHtbFjsUgNxZUhx2oTPKovSdI=;
 b=A/OYdGQ0/OYClnUPd+X/WexH0aD+Eiu8NZb8kNpub+8BaUBQSiP4MXdQ0UdzHoEZNL
 6wIQ8FTt7b9KMUXSYJicAejS0oc0mYr6+NYqPuBH6C3XJj7zZL9cE7HxBV4GE3ZowrtF
 nMS9K7a0m6t3SRERlrRd0fbYdI6t2SXv1qwEzZXw07hoJObsGCTIMyHGgL6PIwzhsCNx
 4+X6+MZ0g/UoeAgr27LH6637Hq0yBnELtlgee6iKDjtfA+FZ5bfjWPS+icyGM+d0AA5n
 uOZrlD5UvC8j0/fv0rLM0Mtq4dqhsjw2WJGSHWd2reZwknQDWvmVAjlJQrgkAj+ZGi4X
 f6gw==
X-Gm-Message-State: AOAM532VZyLV070Ma60Sk5aHTfPJQU6rOnyrDxZfqlZj+xY/ITBv9IB0
 Iw84k9VpHDKrlH/otcHC5Y7KzQ==
X-Google-Smtp-Source: ABdhPJwGYuNnqxYo1af0qUZYMa4Nco75fT1qnFm7LZCMHjtPUU5qRn6vAxb8puXXlwwJ03KgDY726w==
X-Received: by 2002:a1c:96c5:: with SMTP id y188mr13135281wmd.71.1594277813587; 
 Wed, 08 Jul 2020 23:56:53 -0700 (PDT)
Received: from dell ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id f17sm3732156wme.14.2020.07.08.23.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 23:56:53 -0700 (PDT)
Date: Thu, 9 Jul 2020 07:56:51 +0100
From: Lee Jones <lee.jones@linaro.org>
To: arnd@arndb.de, gregkh@linuxfoundation.org
Subject: [PATCH v2 3/3] misc: cxl: flash: Remove unused variable 'drc_index'
Message-ID: <20200709065651.GY3500@dell>
References: <20200708125711.3443569-1-lee.jones@linaro.org>
 <20200708125711.3443569-4-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200708125711.3443569-4-lee.jones@linaro.org>
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Keeping the pointer increment though.

Fixes the following W=1 kernel build warning:

 drivers/misc/cxl/flash.c: In function ‘update_devicetree’:
 drivers/misc/cxl/flash.c:178:16: warning: variable ‘drc_index’ set but not used [-Wunused-but-set-variable]
 178 | __be32 *data, drc_index, phandle;
 | ^~~~~~~~~

Cc: Frederic Barrat <fbarrat@linux.ibm.com>
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
Changelog:

v1 => v2:
 - Fix "flash.c:216:6: error: value computed is not used [-Werror=unused-value]"
   - ... as reported by Intel's Kernel Test Robot

drivers/misc/cxl/flash.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/cxl/flash.c b/drivers/misc/cxl/flash.c
index cb9cca35a2263..5b93ff51d82a5 100644
--- a/drivers/misc/cxl/flash.c
+++ b/drivers/misc/cxl/flash.c
@@ -175,7 +175,7 @@ static int update_devicetree(struct cxl *adapter, s32 scope)
 	struct update_nodes_workarea *unwa;
 	u32 action, node_count;
 	int token, rc, i;
-	__be32 *data, drc_index, phandle;
+	__be32 *data, phandle;
 	char *buf;
 
 	token = rtas_token("ibm,update-nodes");
@@ -213,7 +213,7 @@ static int update_devicetree(struct cxl *adapter, s32 scope)
 					break;
 				case OPCODE_ADD:
 					/* nothing to do, just move pointer */
-					drc_index = *data++;
+					data++;
 					break;
 				}
 			}
-- 
2.25.1
