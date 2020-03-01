Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C384174EA5
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Mar 2020 18:06:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VqRw62gbzDr4C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 04:06:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=nishadkamdar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hFGvJNcz; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48VqQ20rsbzDqxb
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 04:04:41 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id s1so4336471pfh.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Mar 2020 09:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=RkkxF9rbxL5TO4VtQqDvZ6QeVGq/gOE8OHFbri98OUA=;
 b=hFGvJNczcHauEnaBu3G3gkJ/h5Fb30779r6ALQuRTI0ju2iSspmmlDrPvD5ADvutAt
 9vkwl/kUI7X0BhC2r6BNGlpRVNloRvM/6drDS5MiA02Nh5r2gK7LOOHYkjelM/XWHkfs
 vszxOTv2SwCAmxWrV2aDJcgd7SKV6K/p74fg7X/TtDbK9SB3QDJtwFQPwA2G7VyNf/Uu
 /NWcYGMSfzOisR1cJvwzfVK9rhBvCm2doO1SsSsxIcgUJP+Ws7JKPElfg7c0K3Woaapj
 fPaLpj/gnS/QfYGJPXaR4LOoOC8B6OBKyT2WfK/B3dWdgYdmsBAWrIknnnibbz3cSvNu
 ubwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=RkkxF9rbxL5TO4VtQqDvZ6QeVGq/gOE8OHFbri98OUA=;
 b=fbgqySIjfigLcw79Xn60JRUgzrrMQ2eQj2hlLkpyq9yb12k6288XdhYljPM0BF4Cd2
 fq6v7GVujVrms7A6u9WjIEbzWw/1ZISLkH24wZywNN2Etx8gc3qtpzMAE5XBRQ6mjYWG
 cTrR1vN8ItldGERL27oCOPJJb20QTvPZ+17RwSLsFM7Pks+LbRFSYbSaZIkQPfrr7w9g
 sGJ6ig3lXIlRvKBaddVcWdqP7CMQC7cSkT+29Acdgqt5RR2SYEuCjxpdSfAmJDmWfMrr
 iHFyaQwcynpUNGvFLKwprwp7TXf99O47Z5LO9VRS9FmO/wo+bRMSUQrfRz2CdP1H6m3X
 yRfA==
X-Gm-Message-State: APjAAAXSvU11YA51pFdsBhKPt3JGj7oEGPFjbxsJFAb1vuslGFguCdys
 Y+7ug8YzL1NfBf3Qo7lDQ70=
X-Google-Smtp-Source: APXvYqxQNZPrKDJN42DK5dYLBtrf4X2yMiJdhbaQA9IGdgoo/pchvXju7W0AhhEzM3tNLn9c/LDhAA==
X-Received: by 2002:a65:6846:: with SMTP id q6mr14674941pgt.352.1583082278724; 
 Sun, 01 Mar 2020 09:04:38 -0800 (PST)
Received: from nishad ([106.51.232.103])
 by smtp.gmail.com with ESMTPSA id o12sm542942pjs.6.2020.03.01.09.04.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 01 Mar 2020 09:04:38 -0800 (PST)
Date: Sun, 1 Mar 2020 22:34:25 +0530
From: Nishad Kamdar <nishadkamdar@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, linuxppc-dev@lists.ozlabs.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Joe Perches <joe@perches.com>
Subject: [PATCH] tty: hvc: Use the correct style for SPDX License Identifier
Message-ID: <20200301170419.GA7125@nishad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch corrects the SPDX License Identifier style in
header file related to the HVC driver.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used).

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/tty/hvc/hvc_console.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/hvc/hvc_console.h b/drivers/tty/hvc/hvc_console.h
index e9319954c832..18d005814e4b 100644
--- a/drivers/tty/hvc/hvc_console.h
+++ b/drivers/tty/hvc/hvc_console.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * hvc_console.h
  * Copyright (C) 2005 IBM Corporation
-- 
2.17.1

